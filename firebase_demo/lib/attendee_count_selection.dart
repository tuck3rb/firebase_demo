// import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

// import 'app_state.dart';
// import 'src/widgets.dart';

class AttendeeCountSelection extends StatefulWidget {
  const AttendeeCountSelection(
      {super.key, required this.count, required this.onSelection});

  // final Attending state;

  final int count;
  final void Function(int count) onSelection;

  @override
  State<AttendeeCountSelection> createState() => _AttendeeCountSelectionState();
}

class _AttendeeCountSelectionState extends State<AttendeeCountSelection> {
  late TextEditingController _controller;

  @override
  void initState() {
    super.initState();
    _controller = TextEditingController(text: widget.count.toString());
  }

  @override
  void didUpdateWidget(AttendeeCountSelection oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (widget.count != int.tryParse(_controller.text)) {
      _controller.text = widget.count.toString();
    }
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _updateCount() {
    final count = int.tryParse(_controller.text) ?? 0;
    widget.onSelection(count);
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        children: [
          Expanded(
            child: TextField(
              controller: _controller,
              keyboardType: TextInputType.number,
              inputFormatters: [FilteringTextInputFormatter.digitsOnly],
              decoration: const InputDecoration(
                labelText: 'Number of attendees',
                border: OutlineInputBorder(),
              ),
              onChanged: (value) {
                // final count = int.tryParse(value) ?? 0;
                // widget.onSelection(count);
              },
            ),
          ),
          const SizedBox(width: 8),
          ElevatedButton(
            onPressed: _updateCount,
            child: const Text('Update'),
          ),
        ],
      ),
    );
  }
}