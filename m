Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B8D82FF885C
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 25 Apr 2026 22:46:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=zeOgWX73kSMhcsGvtzXC4JAdu5ODROL7Kq4CP+Wwcu4=; b=sMMWHjEAiBTB4TPeyCQNjYrsOS
	8lv8wkMc5WFGr8j/C2Jpr1mCLtcntHHkIIORNSNkzqaB4mSPaNDAaiWxxuk2jEczwR5IL3Z0DAhgx
	jkSuwqyAHPFb5QTIuSiWS+ivC8ScfiCGrzRQwBKZZaOgnbYnaXh6t/0ynGPbDsIFtvTUuamv8h726
	K8wEkhgNVMDM4+KSeXMjlyoAG9oTlrCj/8yZKTRl/nN1tJ4XvykIB2GTrKx2FjwdJxuuIh9+5HEga
	Db0LMUm4YFu8nP2PirPqIQmXoU8nppw9Y/tsp96KLn0zpxCredujuKxpQXHSIfK9HoQUM+2kjZRKU
	XIYVnIwA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wGll6-0000000EwkF-3Y9i;
	Sat, 25 Apr 2026 22:45:56 +0000
Received: from mail-pl1-x64a.google.com ([2607:f8b0:4864:20::64a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wGlkZ-0000000EwKn-1FIL
	for linux-arm-kernel@lists.infradead.org;
	Sat, 25 Apr 2026 22:45:29 +0000
Received: by mail-pl1-x64a.google.com with SMTP id d9443c01a7336-2b79f4b35b7so29792555ad.0
        for <linux-arm-kernel@lists.infradead.org>; Sat, 25 Apr 2026 15:45:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1777157122; x=1777761922; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=zeOgWX73kSMhcsGvtzXC4JAdu5ODROL7Kq4CP+Wwcu4=;
        b=mQkaeI/dwRRsEZh6YfIKG0lnFFjRqeaPjZlo8xztqSK3sQDOJlXfT45YdRUJai5v3x
         RLSTeIzwQ3VeOvFyxu7EZ5DSuOwFesuHDETI4VHPui0ajyvRXB/U22uhH5cUpV+7jDGh
         Q7ZzgtMpujyrCDReNlwklNn6q2H54P6LGGy4m3Mol6RHYf11yaU+JONJjtcbyqWvEQQL
         mwSShZt27IYjwIKMrm3Sxd3IILUIAeqB3m0AcdHCbhNPN4FdrUGXjIcUmA55pAYp5TjQ
         hjFeGWq+KLZJtUHK2D6nfvkJFL8sxj2WXpHyaDqUFjGEHEpHmeGUepNpfUefa/oosHa9
         xtjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777157122; x=1777761922;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=zeOgWX73kSMhcsGvtzXC4JAdu5ODROL7Kq4CP+Wwcu4=;
        b=G3Kxb7pjQgPEB55wjq5N8pxNzbpU4aaFeCVpSF2ez/Q+DgE6BlxEScyy9fpdTDMbUD
         FbmNB7ya6LlV2BNcD/URgALQDpp7+iFxPE5xnsghppxSkX3tTsjtJm37v6zE5tTcZZXm
         HeSq/EkHPBVzLnR6cTGYJyKh1jjt2q3EZnfSsAH1CD7DOgJMBLWX60VMBp5t5ysxLcVq
         I9U5OI9QxdYX0C3cI4Mhs8Jgjf5+TaP2sOj2sEEJ/AVaPtKc2SEbcpAO1lJqZfpOrfhb
         KOK/CrPJiT9Godua4D8U2YuXxcCDdXRafEbSJuKOrdsoFf5CfVEi2e3+lz+gjRBQkD3x
         MGLg==
X-Forwarded-Encrypted: i=1; AFNElJ/HurdJdjzS3PUExYRbE2oHEpI2WXdgawzxNH/1VU8hc6hM4KZckguXkOefySMta5Y+V0Cn6NOsiyR//4xv38Gu@lists.infradead.org
X-Gm-Message-State: AOJu0Ywf2TncAQdyHK6E1qvVO44eWWbOdNL0AnOq5D7Xu3suVx4is7+5
	kDtmV0tC7XUbFi+wMbzjbACNtqpilgW1CUQftSUYIi99VTZluCDRRWTzgi37bGlGkEPXFpZznaK
	7GE4mVZ401w==
X-Received: from plpw14.prod.google.com ([2002:a17:902:9a8e:b0:2b9:53bb:4a09])
 (user=irogers job=prod-delivery.src-stubby-dispatcher) by 2002:a17:903:884:b0:2b2:6cab:313c
 with SMTP id d9443c01a7336-2b5f9f8328amr240076695ad.20.1777157121831; Sat, 25
 Apr 2026 15:45:21 -0700 (PDT)
Date: Sat, 25 Apr 2026 15:44:54 -0700
In-Reply-To: <20260425224503.170337-1-irogers@google.com>
Mime-Version: 1.0
References: <20260425174858.3922152-1-irogers@google.com> <20260425224503.170337-1-irogers@google.com>
X-Mailer: git-send-email 2.54.0.545.g6539524ca2-goog
Message-ID: <20260425224503.170337-8-irogers@google.com>
Subject: [PATCH v7 50/59] perf rwtop: Port rwtop to use python module
From: Ian Rogers <irogers@google.com>
To: acme@kernel.org, adrian.hunter@intel.com, james.clark@linaro.org, 
	leo.yan@linux.dev, namhyung@kernel.org, tmricht@linux.ibm.com
Cc: alice.mei.rogers@gmail.com, dapeng1.mi@linux.intel.com, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	linux-perf-users@vger.kernel.org, mingo@redhat.com, peterz@infradead.org, 
	Ian Rogers <irogers@google.com>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260425_154523_390171_984C7F4D 
X-CRM114-Status: GOOD (  20.79  )
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

Port the legacy Perl script rwtop.pl to a python script using the perf
module in tools/perf/python.

The new script uses a class-based architecture and leverages the
perf.session API for event processing.

It periodically displays system-wide r/w call activity, broken down by
PID, refreshed every interval.

Complications:
- Implemented periodic display based on event timestamps
  (sample.sample_time) instead of relying on SIGALRM, making it robust
  for file-based processing.
- Used ANSI escape codes (\x1b[H\x1b[2J) to clear the terminal.
- Fixed unused imports and indentation issues identified by pylint.
- pylint warns about the module name not being snake_case, but it is
  kept for consistency with the original script name.

Assisted-by: Gemini:gemini-3.1-pro-preview
Signed-off-by: Ian Rogers <irogers@google.com>
---
v2:

 - Added Live Session Support: Updated main() to start a LiveSession
   when the input file does not exist (or is the default "perf.data"
   and doesn't exist). It traces read and write entry/exit
   tracepoints.

 - Fixed Live Mode Comm Resolution: Fixed a bug in process_event()
   where it would attempt to use self.session to resolve the command
   name when running in live mode (where self.session is None ). It
   now falls back to f"PID({pid})" when in live mode or if resolution
   fails.

 - Fixed Substring Matching: Replaced loose substring checks like if
   "sys_enter_read" in event_name: with exact matches against
   "evsel(syscalls:sys_enter_read)" and
   "evsel(raw_syscalls:sys_enter_read)" using str(sample.evsel) . This
   prevents unrelated syscalls with similar names (like readv or
   readahead ) from being incorrectly aggregated. Similar fixes were
   applied for exit events and write events.

 - Inlined Handlers and Tracked Errors: Inlined the _handle_sys_*
   helper methods into process_event() . Now, if a sample lacks
   expected fields, it is added to the self.unhandled tracker instead
   of being silently ignored.

 - Fixed Write Byte Counting: Updated the write exit handler to use
   sample.ret to count actual bytes written on success, and tracked
   requested bytes separately in the enter handler, matching the read
   behavior.

 - Added Error Tables to Output: Added tables to display failed reads
   and writes by PID in print_totals() , which were previously tracked
   but never displayed.

 - Fixed Offline Output (Ghosting): Removed the hardcoded ANSI
   clear-screen escape codes in print_totals() , as they corrupted
   output when processing offline trace files at CPU speed or when
   piping the output.

 - Code Cleanup: Fixed a bug where fd was printed instead of pid in
   the read counts table, and broke long lines to satisfy pylint.
---
 tools/perf/python/rwtop.py | 219 +++++++++++++++++++++++++++++++++++++
 1 file changed, 219 insertions(+)
 create mode 100755 tools/perf/python/rwtop.py

diff --git a/tools/perf/python/rwtop.py b/tools/perf/python/rwtop.py
new file mode 100755
index 000000000000..895ebab9af10
--- /dev/null
+++ b/tools/perf/python/rwtop.py
@@ -0,0 +1,219 @@
+#!/usr/bin/env python3
+# SPDX-License-Identifier: GPL-2.0-only
+"""Periodically displays system-wide r/w call activity, broken down by pid."""
+
+import argparse
+from collections import defaultdict
+import os
+import sys
+from typing import Optional, Dict, Any
+import perf
+from perf_live import LiveSession
+
+class RwTop:
+    """Periodically displays system-wide r/w call activity."""
+    def __init__(self, interval: int = 3, nlines: int = 20) -> None:
+        self.interval_ns = interval * 1000000000
+        self.nlines = nlines
+        self.reads: Dict[int, Dict[str, Any]] = defaultdict(
+            lambda: {
+                "bytes_requested": 0,
+                "bytes_read": 0,
+                "total_reads": 0,
+                "comm": "",
+                "errors": defaultdict(int),
+            }
+        )
+        self.writes: Dict[int, Dict[str, Any]] = defaultdict(
+            lambda: {
+                "bytes_requested": 0,
+                "bytes_written": 0,
+                "total_writes": 0,
+                "comm": "",
+                "errors": defaultdict(int),
+            }
+        )
+        self.unhandled: Dict[str, int] = defaultdict(int)
+        self.session: Optional[perf.session] = None
+        self.last_print_time: int = 0
+
+    def process_event(self, sample: perf.sample_event) -> None:  # pylint: disable=too-many-branches
+        """Process events."""
+        event_name = str(sample.evsel)
+        pid = sample.sample_pid
+        sample_time = sample.sample_time
+
+        if self.last_print_time == 0:
+            self.last_print_time = sample_time
+
+        # Check if interval has passed
+        if sample_time - self.last_print_time >= self.interval_ns:
+            self.print_totals()
+            self.last_print_time = sample_time
+
+        try:
+            comm = f"PID({pid})" if not self.session else self.session.find_thread(pid).comm()
+        except Exception:  # pylint: disable=broad-except
+            comm = f"PID({pid})"
+
+        if event_name in ("evsel(syscalls:sys_enter_read)", "evsel(raw_syscalls:sys_enter_read)"):
+            try:
+                count = sample.count
+                self.reads[pid]["bytes_requested"] += count
+                self.reads[pid]["total_reads"] += 1
+                self.reads[pid]["comm"] = comm
+            except AttributeError:
+                self.unhandled[event_name] += 1
+        elif event_name in ("evsel(syscalls:sys_exit_read)", "evsel(raw_syscalls:sys_exit_read)"):
+            try:
+                ret = sample.ret
+                if ret > 0:
+                    self.reads[pid]["bytes_read"] += ret
+                else:
+                    self.reads[pid]["errors"][ret] += 1
+            except AttributeError:
+                self.unhandled[event_name] += 1
+        elif event_name in ("evsel(syscalls:sys_enter_write)",
+                            "evsel(raw_syscalls:sys_enter_write)"):
+            try:
+                count = sample.count
+                self.writes[pid]["bytes_requested"] += count
+                self.writes[pid]["total_writes"] += 1
+                self.writes[pid]["comm"] = comm
+            except AttributeError:
+                self.unhandled[event_name] += 1
+        elif event_name in ("evsel(syscalls:sys_exit_write)", "evsel(raw_syscalls:sys_exit_write)"):
+            try:
+                ret = sample.ret
+                if ret > 0:
+                    self.writes[pid]["bytes_written"] += ret
+                else:
+                    self.writes[pid]["errors"][ret] += 1
+            except AttributeError:
+                self.unhandled[event_name] += 1
+        else:
+            self.unhandled[event_name] += 1
+
+    def print_totals(self) -> None:
+        """Print summary tables."""
+        print("read counts by pid:\n")
+        print(
+            f"{'pid':>6s}  {'comm':<20s}  {'# reads':>10s}  "
+            f"{'bytes_req':>10s}  {'bytes_read':>10s}"
+        )
+        print(f"{'-'*6}  {'-'*20}  {'-'*10}  {'-'*10}  {'-'*10}")
+
+        count = 0
+        for pid, data in sorted(self.reads.items(),
+                                key=lambda kv: kv[1]["bytes_read"], reverse=True):
+            print(
+                f"{pid:6d}  {data['comm']:<20s}  {data['total_reads']:10d}  "
+                f"{data['bytes_requested']:10d}  {data['bytes_read']:10d}"
+            )
+            count += 1
+            if count >= self.nlines:
+                break
+
+        print("\nfailed reads by pid:\n")
+        print(f"{'pid':>6s}  {'comm':<20s}  {'error #':>6s}  {'# errors':>10s}")
+        print(f"{'-'*6}  {'-'*20}  {'-'*6}  {'-'*10}")
+
+        errcounts = []
+        for pid, data in self.reads.items():
+            for error, cnt in data["errors"].items():
+                errcounts.append((pid, data["comm"], error, cnt))
+
+        sorted_errcounts = sorted(errcounts, key=lambda x: x[3], reverse=True)
+        for pid, comm, error, cnt in sorted_errcounts[:self.nlines]:
+            print(f"{pid:6d}  {comm:<20s}  {error:6d}  {cnt:10d}")
+
+        print("\nwrite counts by pid:\n")
+        print(
+            f"{'pid':>6s}  {'comm':<20s}  {'# writes':>10s}  "
+            f"{'bytes_req':>10s}  {'bytes_written':>13s}"
+        )
+        print(f"{'-'*6}  {'-'*20}  {'-'*10}  {'-'*10}  {'-'*13}")
+
+        count = 0
+        for pid, data in sorted(self.writes.items(),
+                                key=lambda kv: kv[1]["bytes_written"], reverse=True):
+            print(
+                f"{pid:6d}  {data['comm']:<20s}  {data['total_writes']:10d}  "
+                f"{data['bytes_requested']:10d}  {data['bytes_written']:13d}"
+            )
+            count += 1
+            if count >= self.nlines:
+                break
+
+        print("\nfailed writes by pid:\n")
+        print(f"{'pid':>6s}  {'comm':<20s}  {'error #':>6s}  {'# errors':>10s}")
+        print(f"{'-'*6}  {'-'*20}  {'-'*6}  {'-'*10}")
+
+        errcounts = []
+        for pid, data in self.writes.items():
+            for error, cnt in data["errors"].items():
+                errcounts.append((pid, data["comm"], error, cnt))
+
+        sorted_errcounts = sorted(errcounts, key=lambda x: x[3], reverse=True)
+        for pid, comm, error, cnt in sorted_errcounts[:self.nlines]:
+            print(f"{pid:6d}  {comm:<20s}  {error:6d}  {cnt:10d}")
+
+        # Reset counts
+        self.reads.clear()
+        self.writes.clear()
+
+    def run(self, input_file: str) -> None:
+        """Run the session."""
+        self.session = perf.session(perf.data(input_file), sample=self.process_event)
+        self.session.process_events()
+
+        # Print final totals if there are any left
+        if self.reads or self.writes:
+            self.print_totals()
+
+        if self.unhandled:
+            print("\nunhandled events:\n")
+            print(f"{'event':<40s}  {'count':>10s}")
+            print(f"{'-'*40}  {'-'*10}")
+            for event_name, count in self.unhandled.items():
+                print(f"{event_name:<40s}  {count:10d}")
+
+def main() -> None:
+    """Main function."""
+    parser = argparse.ArgumentParser(description="Trace r/w activity by PID")
+    parser.add_argument(
+        "interval", type=int, nargs="?", default=3, help="Refresh interval in seconds"
+    )
+    parser.add_argument("-i", "--input", default="perf.data", help="Input file")
+    args = parser.parse_args()
+
+    analyzer = RwTop(args.interval)
+    try:
+        if not os.path.exists(args.input) and args.input == "perf.data":
+            # Live mode
+            events = (
+                "syscalls:sys_enter_read,syscalls:sys_exit_read,"
+                "syscalls:sys_enter_write,syscalls:sys_exit_write"
+            )
+            try:
+                live_session = LiveSession(events, sample_callback=analyzer.process_event)
+            except OSError:
+                events = (
+                    "raw_syscalls:sys_enter_read,raw_syscalls:sys_exit_read,"
+                    "raw_syscalls:sys_enter_write,raw_syscalls:sys_exit_write"
+                )
+                live_session = LiveSession(events, sample_callback=analyzer.process_event)
+            print("Live mode started. Press Ctrl+C to stop.", file=sys.stderr)
+            live_session.run()
+        else:
+            analyzer.run(args.input)
+    except IOError as e:
+        print(e, file=sys.stderr)
+        sys.exit(1)
+    except KeyboardInterrupt:
+        print("\nStopping live mode...", file=sys.stderr)
+        if analyzer.reads or analyzer.writes:
+            analyzer.print_totals()
+
+if __name__ == "__main__":
+    main()
-- 
2.54.0.545.g6539524ca2-goog


