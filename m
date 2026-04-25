Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 79C0AFF8864
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 25 Apr 2026 17:53:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=zeOgWX73kSMhcsGvtzXC4JAdu5ODROL7Kq4CP+Wwcu4=; b=CpzIF5uKuwuKduJfVCVkddPE/A
	81W8PviF+wkHrNsUPOSLTlK0M70isg5dyFf77kNVS7ftV65mi0p0nYTaHtCdzSintHL9TAo4gIu85
	7pyKpkZ/qA98gzmW3pmCrkD0sys0Z3dgU3YyibmmJRM9vcqs5Dv3bDJjdsJqkTjLl723BezbTZeIs
	2RTHoN85k+2FS81Qh6KRsosgy9KKJfF4hEjWp/v/iVXrG2P8DM/NFIQzvqbUeUZTsScJG3xHuSb9Q
	kuVKSsWQbbuD/uhkYieVLw5olBZWbefZRMPBXu5jjYgya7bUgtzTc6WfBVZSdUVcqoiCQV878aYgF
	I/0gm+Vw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wGhBW-0000000EfEJ-2C8S;
	Sat, 25 Apr 2026 17:52:54 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wGh9T-0000000EdsJ-1eXf
	for linux-arm-kernel@bombadil.infradead.org;
	Sat, 25 Apr 2026 17:50:48 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Type:Cc:To:From:Subject:
	Message-ID:References:Mime-Version:In-Reply-To:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=zeOgWX73kSMhcsGvtzXC4JAdu5ODROL7Kq4CP+Wwcu4=; b=rXlNrFK5P6vNWmFHyE5R/BEZBE
	FQH488ljdk1+BFV0+DhkWwLOBMQ8EPWU3Jtak9yqlF2a9rSuOLYXwuAe76xMRy8rgIrZPtTFBhBDl
	H19h0teOmhbBfEO/pXn+doSomNDd8ocva51BiHRghImzsGjOZj8tgPHEV5SDTHyV2958N3ob6yR4E
	K6i92udpMLl4zE9HDNdROEnjgvoGW9XB5/KemIKFIXxyXE2vP6UddsLbUE4NroCsgM1YiZPziyRPJ
	80TuqE9Ro73Ana6NT12CkPSo7qx5vW3MA8eVKCurJTXp1FoUMgRxkF3D/2Pw0CnuSfSCZlZDUj9c5
	HcModtbA==;
Received: from mail-dl1-x124a.google.com ([2607:f8b0:4864:20::124a])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wGh9P-0000000G8pb-46gH
	for linux-arm-kernel@lists.infradead.org;
	Sat, 25 Apr 2026 17:50:45 +0000
Received: by mail-dl1-x124a.google.com with SMTP id a92af1059eb24-12c726f4055so9076997c88.1
        for <linux-arm-kernel@lists.infradead.org>; Sat, 25 Apr 2026 10:50:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1777139442; x=1777744242; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=zeOgWX73kSMhcsGvtzXC4JAdu5ODROL7Kq4CP+Wwcu4=;
        b=YvwUaY0UkzPLPmIgvpgO5HusEDh+Sa11C5TbNGMJcjMeFU4I4vu1IDdWEB6bgzQhEb
         DyDEsemC2uO1mXDEQMIP6t8wSUEFJ8ME+epvy1UNszgA4pP4vL6l3eVBKYQzvaloJijq
         SGUc3gAOFnTS3K3W5e+dSxIkDdcCwGqgwk1U3Nzkl31NfQAb4A3P8fHNfJlu2PnjbHEw
         RuWuDleRoC35q0X0IER7GiiCwzt/aKuH6KkjJHlC2qQzMBmhPCxNElfHitGVAL7yGie9
         aRY7ja7q0eQatHdL4GxY6Ptul1lBsQ0IJae/KmLmSva2+7Sj+bkHDSJZDvJTD+KIESvU
         eQeg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777139442; x=1777744242;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=zeOgWX73kSMhcsGvtzXC4JAdu5ODROL7Kq4CP+Wwcu4=;
        b=WnxNaBGhnySWYIjXLin/Puf+3wwj5uDYy5cMNBmi02ilOzoa4jGtWwQ7/yOP4ymdRo
         a6YRnX+HgoxsbdynB29963hsNy4drP5oq7lJ1gpyWU7VvhRyAdp9tXBq6shds/gJkdVH
         2/Ahug5cgFNE6WMqRhlPbTI9kUJIdvXg7CQp9R5E6rnpJjcCJ16SMxSblNkcyIGBYNBB
         Q7GcGNEgMIa1OLL5aBH9z2W84leNBBDy7SxejLFXR2Iwt4zDUPlx+TIKeFvGRUhjG2bd
         MFqgb5RoICCvMj9Juo/nlmxoy1GglVQsRsWf5I1hThXMwWf4IQryd0NbrVt7FXsXsGf5
         HZZA==
X-Forwarded-Encrypted: i=1; AFNElJ+vISFjA9T3NhdxT/yzXPOUIAfSysBmZvKlRU3Q14EicDHxsSXQMUqqA5IKG1Ivc7xctk/OKkYDg3W53TljAUco@lists.infradead.org
X-Gm-Message-State: AOJu0YyNoCNGl4bibk3+PRrZ/Sc781/aCirEfHOjvTI0NfpjBuxozStd
	ryOuuU1V8neuQ/r1RZ4XELNm2ImZCF6ZM5T5hs8J/Ps3WIbKh34t6NkuaQwm1LfYmxU2jrHD1CE
	i30/7EH/Qrg==
X-Received: from dlbvv17.prod.google.com ([2002:a05:7022:5f11:b0:12a:c3c1:4ace])
 (user=irogers job=prod-delivery.src-stubby-dispatcher) by 2002:a05:7022:6884:b0:12a:6c4b:9cf0
 with SMTP id a92af1059eb24-12c73f643fcmr18964832c88.3.1777139441297; Sat, 25
 Apr 2026 10:50:41 -0700 (PDT)
Date: Sat, 25 Apr 2026 10:48:48 -0700
In-Reply-To: <20260425174858.3922152-1-irogers@google.com>
Mime-Version: 1.0
References: <20260424164721.2229025-1-irogers@google.com> <20260425174858.3922152-1-irogers@google.com>
X-Mailer: git-send-email 2.54.0.545.g6539524ca2-goog
Message-ID: <20260425174858.3922152-51-irogers@google.com>
Subject: [PATCH v6 50/59] perf rwtop: Port rwtop to use python module
From: Ian Rogers <irogers@google.com>
To: acme@kernel.org, adrian.hunter@intel.com, james.clark@linaro.org, 
	leo.yan@linux.dev, namhyung@kernel.org, tmricht@linux.ibm.com
Cc: alice.mei.rogers@gmail.com, dapeng1.mi@linux.intel.com, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	linux-perf-users@vger.kernel.org, mingo@redhat.com, peterz@infradead.org, 
	Ian Rogers <irogers@google.com>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260425_185044_164502_EAEDD744 
X-CRM114-Status: GOOD (  20.85  )
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


