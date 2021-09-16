import 'package:flutter/material.dart';
import 'package:flutter_provider_v2/application_color.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: ChangeNotifierProvider<ApplicationColor>(
          create: (BuildContext context) => ApplicationColor(),
          child: Scaffold(
            appBar: AppBar(
              backgroundColor: Colors.white,
              title: Consumer<ApplicationColor>(
                builder: (context, state, _) => Text(
                  "Provider State Management",
                  style: TextStyle(color: state.color),
                ),
              ),
            ),
            body: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Consumer<ApplicationColor>(
                    builder: (context, state, _) => AnimatedContainer(
                      margin: const EdgeInsets.all(5),
                      duration: const Duration(milliseconds: 500),
                      width: 150,
                      height: 150,
                      color: state.color,
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                          margin: const EdgeInsets.all(5),
                          child: const Text("AB")),
                      Consumer<ApplicationColor>(
                          builder: (context, state, _) => Switch(
                              value: state.isLightBlue,
                              onChanged: (newValue) {
                                state.isLightBlue = newValue;
                              })),
                      Container(
                          margin: const EdgeInsets.all(5),
                          child: const Text("LB")),
                    ],
                  )
                ],
              ),
            ),
          ),
        ));
  }
}
