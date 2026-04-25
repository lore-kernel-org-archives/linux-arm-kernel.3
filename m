Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DA60CFF885C
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 25 Apr 2026 22:44:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=NR1gzF3F6kI5f0yQJQV926hkNwQ4+t7RNPW4Qp/LJSM=; b=CsFrJ5NaZXC9eFVdSNsy3ffps5
	u/2LO2qwMhN1Lh4COvaAox/33uc4SBYSL2zXC5c64fD36lp0y8MFO+jg32ehmvrHaXCzefxkg9uKe
	+J/1iBIcVavEAhZvNrfAin8bCQHydMYX67E8nTN9PCETHwHk9VaPryFKigXuiY0zG3HHAu2vTqsY/
	87j1eGMSo+TOPOgviTJxIMv+fVp6wkOxToSrTLRHkSfZOggWKfXlYFz63ZVAt/cwIbye8aE3063ZZ
	XJkaKaDhPhJFWKWRAj9dIJxPcMYIAvOk1sTCG6eqPFM5qhumStL/u46Y0lgKPZO/QNpVF5KaQDduI
	LW4XC0Ow==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wGljO-0000000EvCy-1NYW;
	Sat, 25 Apr 2026 22:44:10 +0000
Received: from mail-dy1-x134a.google.com ([2607:f8b0:4864:20::134a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wGlhs-0000000Ethv-0MNs
	for linux-arm-kernel@lists.infradead.org;
	Sat, 25 Apr 2026 22:42:51 +0000
Received: by mail-dy1-x134a.google.com with SMTP id 5a478bee46e88-2bdd327d970so5510241eec.1
        for <linux-arm-kernel@lists.infradead.org>; Sat, 25 Apr 2026 15:42:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1777156955; x=1777761755; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=NR1gzF3F6kI5f0yQJQV926hkNwQ4+t7RNPW4Qp/LJSM=;
        b=XZDkwSzwG94H8BiYGpiLVuzex4Ngi0TLYZY6720ucS/Puk/UkzfzvRYIXBi16z2hjF
         SkF5Ha3BWGl3HSM6nxZKh4QPkMBdPMUrq7xgxXLykhpYeeNt/UtI38LNnovlLShijQ5x
         Ogg32l6NzHlm5W04nj3ruJ1pe8WdSq4NywAsufbGV+pRGCt0uFSEi64tlCLh3OCGBBxA
         sAF4zeQm4cOleGHwYVJHjR+BsPisYk3ekYCz63E8Gdf0Z2PE+/V0cdTHm0qvyOir4Mp9
         JY2bFhTKMxd2TVwgBiSGQCwPIxtUQAMyzl0KofkyYUMFHRIc/UYl4JCdKiDv7N3iIiHo
         Y6Kg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777156955; x=1777761755;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=NR1gzF3F6kI5f0yQJQV926hkNwQ4+t7RNPW4Qp/LJSM=;
        b=JTafyVOvgpJJBA2PQ6ZvpGd1v36V3wub/LR5FffziFsgbo3sWSBkzSyf6pPqWdndxR
         9pgUyP4R18C0EvbR8trx/yAJceD1OAiE+tXOFD/eLZ+Y12hjJeZMZV8unwwoTKxLn/OJ
         AY8RNsEj91RTb1F57sX9Z+jzAMyWnUgwf1R//6hV+6d79rOYZ8ltAffNVWGS5Octuc/e
         I0uzapYiOzLWajJPJhjtKoRD7WCoSyKJsDsH4tWtb0vzoLT37C4iH4/yXKzAzg2VO3zH
         HYDEdFLvI9Di03u06y+OpIE1O9l//oZCu+c3xV0NT+ukiLVlG9gaPb/bv1cyQ2Ims7MY
         QshQ==
X-Forwarded-Encrypted: i=1; AFNElJ+DO8TUwWOOpBMBRIkUh5utZ2+hZHfbwD5AJlGVQmMWWWNMpjYv9qD/3SudS9jHvQWzOToNGQQ4ehVv/sUiBdV5@lists.infradead.org
X-Gm-Message-State: AOJu0YxoF1RRj+atNL/HATR4ER3SbK3K3iEcDW7GlQ01QXtxTlnn+ZfI
	TEBYbJ0Ea089iAZs49JMl7NrJ8h7TOxrNnQHQCj6nCJz7Ip3/i1kb5VRf5vAcCrN3BFIv3KoDRw
	92tpWZ/2qKw==
X-Received: from dlah23.prod.google.com ([2002:a05:701b:2617:b0:12b:f569:153f])
 (user=irogers job=prod-delivery.src-stubby-dispatcher) by 2002:a05:7022:e29:b0:12d:c4b7:5625
 with SMTP id a92af1059eb24-12dc4b756cfmr3694407c88.9.1777156954313; Sat, 25
 Apr 2026 15:42:34 -0700 (PDT)
Date: Sat, 25 Apr 2026 15:40:56 -0700
In-Reply-To: <20260425224125.160890-1-irogers@google.com>
Mime-Version: 1.0
References: <20260425174858.3922152-1-irogers@google.com> <20260425224125.160890-1-irogers@google.com>
X-Mailer: git-send-email 2.54.0.545.g6539524ca2-goog
Message-ID: <20260425224125.160890-32-irogers@google.com>
Subject: [PATCH v7 31/59] perf gecko: Port gecko to use python module
From: Ian Rogers <irogers@google.com>
To: acme@kernel.org, adrian.hunter@intel.com, james.clark@linaro.org, 
	leo.yan@linux.dev, namhyung@kernel.org, tmricht@linux.ibm.com
Cc: alice.mei.rogers@gmail.com, dapeng1.mi@linux.intel.com, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	linux-perf-users@vger.kernel.org, mingo@redhat.com, peterz@infradead.org, 
	Ian Rogers <irogers@google.com>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260425_154236_277576_168D2908 
X-CRM114-Status: GOOD (  20.27  )
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

Add a port of the gecko script that uses the perf python module
directly. This approach is significantly faster than using perf script
callbacks as it avoids creating intermediate dictionaries for all
event fields.

Assisted-by: Gemini:gemini-3.1-pro-preview
Signed-off-by: Ian Rogers <irogers@google.com>
---
v2:

1. Improved Portability: Replaced the non-portable uname -op call with
   platform.system() and platform.machine() , preventing potential
   crashes on non-Linux platforms like macOS or BSD.

2. Robust Fallbacks: Fixed getattr calls for symbol and dso to
   explicitly handle None values, preventing literal "None (in None)"
   strings in the output when resolution fails.

3. Network Security: Bound the HTTP server to 127.0.0.1 (localhost)
   instead of 0.0.0.0 (all interfaces), ensuring the current directory
   is not exposed to the local network.

4. Avoided Port Conflicts: Switched from hardcoded port 8000 to port
   0, allowing the operating system to automatically select an
   available free port.

5. Fixed Race Condition: Moved HTTPServer creation to the main thread,
   ensuring the server is bound and listening before the browser is
   launched to fetch the file.

6. Browser Spec Compliance: Used 127.0.0.1 instead of localhost in the
   generated URL to ensure modern browsers treat the connection as a
   secure origin, avoiding mixed content blocks.

v6:
- Fixed CWD exposure and symlink attack risks by using a secure
  temporary directory for the HTTP server.
---
 tools/perf/python/gecko.py | 385 +++++++++++++++++++++++++++++++++++++
 1 file changed, 385 insertions(+)
 create mode 100755 tools/perf/python/gecko.py

diff --git a/tools/perf/python/gecko.py b/tools/perf/python/gecko.py
new file mode 100755
index 000000000000..1f152e1eca52
--- /dev/null
+++ b/tools/perf/python/gecko.py
@@ -0,0 +1,385 @@
+#!/usr/bin/env python3
+# SPDX-License-Identifier: GPL-2.0
+"""
+gecko.py - Convert perf record output to Firefox's gecko profile format
+"""
+
+import argparse
+import functools
+import json
+import os
+import platform
+import sys
+import tempfile
+import threading
+import urllib.parse
+import webbrowser
+from dataclasses import dataclass, field
+from http.server import HTTPServer, SimpleHTTPRequestHandler
+from typing import Dict, List, NamedTuple, Optional, Tuple
+
+import perf
+
+
+# https://github.com/firefox-devtools/profiler/blob/53970305b51b9b472e26d7457fee1d66cd4e2737/src/types/gecko-profile.js#L156
+class Frame(NamedTuple):
+    """A single stack frame in the gecko profile format."""
+    string_id: int
+    relevantForJS: bool
+    innerWindowID: int
+    implementation: None
+    optimizations: None
+    line: None
+    column: None
+    category: int
+    subcategory: Optional[int]
+
+
+# https://github.com/firefox-devtools/profiler/blob/53970305b51b9b472e26d7457fee1d66cd4e2737/src/types/gecko-profile.js#L216
+class Stack(NamedTuple):
+    """A single stack in the gecko profile format."""
+    prefix_id: Optional[int]
+    frame_id: int
+
+
+# https://github.com/firefox-devtools/profiler/blob/53970305b51b9b472e26d7457fee1d66cd4e2737/src/types/gecko-profile.js#L90
+class Sample(NamedTuple):
+    """A single sample in the gecko profile format."""
+    stack_id: Optional[int]
+    time_ms: float
+    responsiveness: int
+
+
+@dataclass
+class Tables:
+    """Interned tables for the gecko profile format."""
+    frame_table: List[Frame] = field(default_factory=list)
+    string_table: List[str] = field(default_factory=list)
+    string_map: Dict[str, int] = field(default_factory=dict)
+    stack_table: List[Stack] = field(default_factory=list)
+    stack_map: Dict[Tuple[Optional[int], int], int] = field(default_factory=dict)
+    frame_map: Dict[str, int] = field(default_factory=dict)
+
+
+@dataclass
+class Thread:
+    """A builder for a profile of the thread."""
+    comm: str
+    pid: int
+    tid: int
+    user_category: int
+    kernel_category: int
+    samples: List[Sample] = field(default_factory=list)
+    tables: Tables = field(default_factory=Tables)
+
+    def _intern_stack(self, frame_id: int, prefix_id: Optional[int]) -> int:
+        """Gets a matching stack, or saves the new stack. Returns a Stack ID."""
+        key = (prefix_id, frame_id)
+        stack_id = self.tables.stack_map.get(key)
+        if stack_id is None:
+            stack_id = len(self.tables.stack_table)
+            self.tables.stack_table.append(Stack(prefix_id=prefix_id, frame_id=frame_id))
+            self.tables.stack_map[key] = stack_id
+        return stack_id
+
+    def _intern_string(self, string: str) -> int:
+        """Gets a matching string, or saves the new string. Returns a String ID."""
+        string_id = self.tables.string_map.get(string)
+        if string_id is not None:
+            return string_id
+        string_id = len(self.tables.string_table)
+        self.tables.string_table.append(string)
+        self.tables.string_map[string] = string_id
+        return string_id
+
+    def _intern_frame(self, frame_str: str) -> int:
+        """Gets a matching stack frame, or saves the new frame. Returns a Frame ID."""
+        frame_id = self.tables.frame_map.get(frame_str)
+        if frame_id is not None:
+            return frame_id
+        frame_id = len(self.tables.frame_table)
+        self.tables.frame_map[frame_str] = frame_id
+        string_id = self._intern_string(frame_str)
+
+        category = self.user_category
+        if (frame_str.find('kallsyms') != -1 or
+                frame_str.find('/vmlinux') != -1 or
+                frame_str.endswith('.ko)')):
+            category = self.kernel_category
+
+        self.tables.frame_table.append(Frame(
+            string_id=string_id,
+            relevantForJS=False,
+            innerWindowID=0,
+            implementation=None,
+            optimizations=None,
+            line=None,
+            column=None,
+            category=category,
+            subcategory=None,
+        ))
+        return frame_id
+
+    def add_sample(self, comm: str, stack: List[str], time_ms: float) -> None:
+        """Add a timestamped stack trace sample to the thread builder."""
+        if self.comm != comm:
+            self.comm = comm
+
+        prefix_stack_id: Optional[int] = None
+        for frame in stack:
+            frame_id = self._intern_frame(frame)
+            prefix_stack_id = self._intern_stack(frame_id, prefix_stack_id)
+
+        if prefix_stack_id is not None:
+            self.samples.append(Sample(stack_id=prefix_stack_id,
+                                       time_ms=time_ms,
+                                       responsiveness=0))
+
+    def to_json_dict(self) -> Dict:
+        """Converts current Thread to GeckoThread JSON format."""
+        return {
+            "tid": self.tid,
+            "pid": self.pid,
+            "name": self.comm,
+            "markers": {
+                "schema": {
+                    "name": 0,
+                    "startTime": 1,
+                    "endTime": 2,
+                    "phase": 3,
+                    "category": 4,
+                    "data": 5,
+                },
+                "data": [],
+            },
+            "samples": {
+                "schema": {
+                    "stack": 0,
+                    "time": 1,
+                    "responsiveness": 2,
+                },
+                "data": self.samples
+            },
+            "frameTable": {
+                "schema": {
+                    "location": 0,
+                    "relevantForJS": 1,
+                    "innerWindowID": 2,
+                    "implementation": 3,
+                    "optimizations": 4,
+                    "line": 5,
+                    "column": 6,
+                    "category": 7,
+                    "subcategory": 8,
+                },
+                "data": self.tables.frame_table,
+            },
+            "stackTable": {
+                "schema": {
+                    "prefix": 0,
+                    "frame": 1,
+                },
+                "data": self.tables.stack_table,
+            },
+            "stringTable": self.tables.string_table,
+            "registerTime": 0,
+            "unregisterTime": None,
+            "processType": "default",
+        }
+
+
+class CORSRequestHandler(SimpleHTTPRequestHandler):
+    """Enable CORS for requests from profiler.firefox.com."""
+    def end_headers(self):
+        self.send_header('Access-Control-Allow-Origin', 'https://profiler.firefox.com')
+        super().end_headers()
+
+
+@dataclass
+class CategoryData:
+    """Category configuration for the gecko profile."""
+    user_index: int = 0
+    kernel_index: int = 1
+    categories: List[Dict] = field(default_factory=list)
+
+
+class GeckoCLI:
+    """Command-line interface for converting perf data to Gecko format."""
+    def __init__(self, args):
+        self.args = args
+        self.tid_to_thread: Dict[int, Thread] = {}
+        self.start_time_ms: Optional[float] = None
+        self.session = None
+        self.product = f"{platform.system()} {platform.machine()}"
+        self.cat_data = CategoryData(
+            categories=[
+                {
+                    "name": 'User',
+                    "color": args.user_color,
+                    "subcategories": ['Other']
+                },
+                {
+                    "name": 'Kernel',
+                    "color": args.kernel_color,
+                    "subcategories": ['Other']
+                },
+            ]
+        )
+
+    def process_event(self, sample) -> None:
+        """Process a single perf sample event."""
+        if self.args.event_name and self.args.event_name not in str(sample.evsel):
+            return
+
+        # sample_time is in nanoseconds. Gecko wants milliseconds.
+        time_ms = sample.sample_time / 1000000.0
+        pid = sample.sample_pid
+        tid = sample.sample_tid
+
+        if self.start_time_ms is None:
+            self.start_time_ms = time_ms
+
+        try:
+            thread_info = self.session.find_thread(tid)
+            comm = thread_info.comm()
+        except Exception:
+            comm = "[unknown]"
+
+        stack = []
+        callchain = sample.callchain
+        if callchain:
+            for entry in callchain:
+                symbol = entry.symbol or "[unknown]"
+                dso = entry.dso or "[unknown]"
+                stack.append(f"{symbol} (in {dso})")
+            # Reverse because Gecko wants root first.
+            stack.reverse()
+        else:
+            # Fallback if no callchain is present
+            try:
+                # If the perf module exposes symbol/dso directly on sample
+                # when callchain is missing, we use them.
+                symbol = getattr(sample, 'symbol', '[unknown]') or '[unknown]'
+                dso = getattr(sample, 'dso', '[unknown]') or '[unknown]'
+                stack.append(f"{symbol} (in {dso})")
+            except AttributeError:
+                stack.append("[unknown] (in [unknown])")
+
+        thread = self.tid_to_thread.get(tid)
+        if thread is None:
+            thread = Thread(comm=comm, pid=pid, tid=tid,
+                            user_category=self.cat_data.user_index,
+                            kernel_category=self.cat_data.kernel_index)
+            self.tid_to_thread[tid] = thread
+        thread.add_sample(comm=comm, stack=stack, time_ms=time_ms)
+
+    def run(self) -> None:
+        """Run the conversion process."""
+        input_file = self.args.input or "perf.data"
+        if not os.path.exists(input_file):
+            print(f"Error: {input_file} not found.", file=sys.stderr)
+            sys.exit(1)
+
+        try:
+            self.session = perf.session(perf.data(input_file), sample=self.process_event)
+        except Exception as e:
+            print(f"Error opening session: {e}", file=sys.stderr)
+            sys.exit(1)
+
+        self.session.process_events()
+
+        threads = [t.to_json_dict() for t in self.tid_to_thread.values()]
+
+        gecko_profile = {
+            "meta": {
+                "interval": 1,
+                "processType": 0,
+                "product": self.product,
+                "stackwalk": 1,
+                "debug": 0,
+                "gcpoison": 0,
+                "asyncstack": 1,
+                "startTime": self.start_time_ms,
+                "shutdownTime": None,
+                "version": 24,
+                "presymbolicated": True,
+                "categories": self.cat_data.categories,
+                "markerSchema": [],
+            },
+            "libs": [],
+            "threads": threads,
+            "processes": [],
+            "pausedRanges": [],
+        }
+
+        output_file = self.args.save_only
+        if output_file is None:
+            self._write_and_launch(gecko_profile)
+        else:
+            print(f'[ perf gecko: Captured and wrote into {output_file} ]')
+            with open(output_file, 'w', encoding='utf-8') as f:
+                json.dump(gecko_profile, f, indent=2)
+
+    def _write_and_launch(self, profile: Dict) -> None:
+        """Write the profile to a file and launch the Firefox profiler."""
+        print("Starting Firefox Profiler on your default browser...")
+        
+        with tempfile.TemporaryDirectory() as tmp_dir_name:
+            filename = os.path.join(tmp_dir_name, 'gecko_profile.json')
+            
+            with open(filename, 'w', encoding='utf-8') as f:
+                json.dump(profile, f, indent=2)
+                
+            handler = functools.partial(CORSRequestHandler, directory=tmp_dir_name)
+            try:
+                httpd = HTTPServer(('127.0.0.1', 0), handler)
+            except OSError as e:
+                print(f"Error starting HTTP server: {e}", file=sys.stderr)
+                sys.exit(1)
+                
+            port = httpd.server_port
+            
+            def start_server():
+                httpd.serve_forever()
+                
+            thread = threading.Thread(target=start_server, daemon=True)
+            thread.start()
+            
+            # Open the browser
+            safe_string = urllib.parse.quote_plus(f'http://127.0.0.1:{port}/gecko_profile.json')
+            url = f'https://profiler.firefox.com/from-url/{safe_string}'
+            webbrowser.open(url)
+            
+            print(f'[ perf gecko: Captured and wrote into {filename} ]')
+            print("Press Ctrl+C to stop the local server.")
+            try:
+                # Keep the main thread alive so the daemon thread can serve requests
+                stop_event = threading.Event()
+                while True:
+                    stop_event.wait(1)
+            except KeyboardInterrupt:
+                print("\nStopping server...")
+                httpd.shutdown()
+
+
+if __name__ == "__main__":
+    parser = argparse.ArgumentParser(
+        description="Convert perf.data to Firefox's Gecko Profile format"
+    )
+    parser.add_argument('--user-color', default='yellow',
+                        help='Color for the User category',
+                        choices=['yellow', 'blue', 'purple', 'green', 'orange', 'red',
+                                 'grey', 'magenta'])
+    parser.add_argument('--kernel-color', default='orange',
+                        help='Color for the Kernel category',
+                        choices=['yellow', 'blue', 'purple', 'green', 'orange', 'red',
+                                 'grey', 'magenta'])
+    parser.add_argument('--save-only',
+                        help='Save the output to a file instead of opening Firefox\'s profiler')
+    parser.add_argument("-i", "--input", help="input perf.data file")
+    parser.add_argument("-e", "--event", default="", dest="event_name", type=str,
+                        help="specify the event to generate gecko profile for")
+
+    cli_args = parser.parse_args()
+    cli = GeckoCLI(cli_args)
+    cli.run()
-- 
2.54.0.545.g6539524ca2-goog


