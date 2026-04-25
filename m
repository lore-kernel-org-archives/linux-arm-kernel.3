Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8C268FF885A
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 25 Apr 2026 22:53:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=qbPEhnMlYjLIyQYaNXILQynFaRfheBD/Hl8QlXDxSqM=; b=r8IX/oCiLtz0KBYAESTvrZu4PU
	9BNb0iAvDp8e4yTzXPdB2IOLE5QBoDn0j+YUTo28j0ypVims7OUHWbEJI61M9Q1sgjJ7eQVouN1L4
	o4Vkuj1HAPTiUga6QGQqa9mzglWghdg+EKI3itMc7LP8ZrkEb/Xx3QDHxCBjzJKCI/O7kV6Crtxsa
	njwMwBrjSv4MJcb/eWza/2/rHqiqWFesUJisfszhN241cTSs57N6zhOORy2HBj5ErAgExwTMxLR/A
	xGMLWhxoeew7ftPKQfV4ToBTV4tn3fNMA5dxfHYNkp5xvGd8vh8lAJMk30MAozItZHWJ7g7RmUEqL
	YxWn1mKA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wGls6-0000000F0vQ-03Ma;
	Sat, 25 Apr 2026 22:53:10 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wGlr0-0000000Ezh9-2Q62
	for linux-arm-kernel@bombadil.infradead.org;
	Sat, 25 Apr 2026 22:52:02 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Type:Cc:To:From:Subject:
	Message-ID:References:Mime-Version:In-Reply-To:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=qbPEhnMlYjLIyQYaNXILQynFaRfheBD/Hl8QlXDxSqM=; b=B117n1AiD3DJFTHdCYR7r7NoV/
	WokdDmdOI9GdI73a/yjXKmWKpKktbICP68LR3a3xfMxzJMJmzOjPdkgen9qu3W2y0C87JcY4WRvzp
	4r+0AJyhl9ujXv9y2LyUJMycSWxBur5qE1vLhbEUChSrrhbeWJ5HaBAqr4fQxrBb1SZ93TvaM3wEW
	vvrKXapaik4TjgNu44knEotpZR5FlgK3jn0enhT+wlOOJOZQeCnS8xMywxemriYMthdnLmhUBtTMX
	jfLOhwIR0/n+kHJ6fsSyV52n2S9rneoegTIrZhlqxOBpjOAuAUhm1CDvGYvFNzl4X0D5+dVa9vkI4
	CkOpocYg==;
Received: from mail-dy1-x134a.google.com ([2607:f8b0:4864:20::134a])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wGlqw-0000000GMwo-0MIM
	for linux-arm-kernel@lists.infradead.org;
	Sat, 25 Apr 2026 22:52:00 +0000
Received: by mail-dy1-x134a.google.com with SMTP id 5a478bee46e88-2cc75e79b97so24550684eec.1
        for <linux-arm-kernel@lists.infradead.org>; Sat, 25 Apr 2026 15:51:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1777157516; x=1777762316; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=qbPEhnMlYjLIyQYaNXILQynFaRfheBD/Hl8QlXDxSqM=;
        b=AKIxKmYgCHSJ/JpNwFCTIvcbn4NU/VOeFUCvgpzDv0GTrkq0GZnWJ7xUD1pCaIL3Dr
         1Fl9qxjkpVFrbTULHq3XTx9Q+uQKi21qmfBifJe8+2gTvkGZH5kMI3WfuvfO59K/sKmg
         sohldmkHo4riw0QV7e121NGq9Se+ttuhqSch8CeUqc4FPkYWxTA8kG1kewLTcsPblPSl
         gHR6H/ufIHSxc7L7zd9fQgxhGw7wGNylwoN61KPfQ55+wHbshxN3xu2ksLXItTjnkjfE
         px8Kg1WTVn3rFZjjPSAlamiauZY75KsaP7boelK0ndJC3TS7TS/d2f1/yz4XroINoqi3
         0VhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777157516; x=1777762316;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=qbPEhnMlYjLIyQYaNXILQynFaRfheBD/Hl8QlXDxSqM=;
        b=n7lz2IiandWHIKp/9HJrY0FgUuDah656QFZtrn0E+9NKEw6Fc8AnmC4bugUlw+tHM5
         7rXnF9BrruDcOB1cyFZ9lIoFVns0Uy3ELRJ54o6R+B4qbeQtUUKgRt1F2TCX6eb7WLFQ
         fQP7f0vD31lgTY1oP6OYIfk2/HkvHeoZxRibF3FPzAXGbd3rc+ZiqoL5Z2NzjMoh4Wyi
         54dwW8YwOkqxVq7zQFg+97G4nRuZV4lvurju4PT4T97LaBOUNNAJ5NE1/4fsHvsdXPyf
         H62luMfIz28XdKURVahrvg731MLHP6P0NkLY2UiMfB/wFFkW2TgkwU8+Ol5wBt8Vp/oO
         skIA==
X-Forwarded-Encrypted: i=1; AFNElJ8552J5CylxXxy1HT/ryLGrSMneT+pXE7nvj+Tqc2QGlx/Tr+CXJnxvIi8sVn4EP2tqGxzYnYFbMyJlze0Yy2rP@lists.infradead.org
X-Gm-Message-State: AOJu0YzCG1b+VhpJewPfZb7nJIsukA3IWvgl1UX3KNRJoTEOd0bxXNr5
	PsGm7op0xui3KJrafHrGNSXD4Dsrnx0HLPzND0IjpoeIJmK1ocA8fmqiX+bmG1WaYkJs/sqo7Kj
	0NnB9dHylkw==
X-Received: from dycol2.prod.google.com ([2002:a05:7301:db82:b0:2dd:8e19:2d13])
 (user=irogers job=prod-delivery.src-stubby-dispatcher) by 2002:a05:693c:2b04:b0:2df:919f:ce59
 with SMTP id 5a478bee46e88-2e47901614bmr20625177eec.19.1777157515734; Sat, 25
 Apr 2026 15:51:55 -0700 (PDT)
Date: Sat, 25 Apr 2026 15:49:41 -0700
In-Reply-To: <20260425224951.174663-1-irogers@google.com>
Mime-Version: 1.0
References: <20260425174858.3922152-1-irogers@google.com> <20260425224951.174663-1-irogers@google.com>
X-Mailer: git-send-email 2.54.0.545.g6539524ca2-goog
Message-ID: <20260425224951.174663-50-irogers@google.com>
Subject: [PATCH v7 49/59] perf rw-by-pid: Port rw-by-pid to use python module
From: Ian Rogers <irogers@google.com>
To: acme@kernel.org, adrian.hunter@intel.com, james.clark@linaro.org, 
	leo.yan@linux.dev, namhyung@kernel.org, tmricht@linux.ibm.com
Cc: alice.mei.rogers@gmail.com, dapeng1.mi@linux.intel.com, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	linux-perf-users@vger.kernel.org, mingo@redhat.com, peterz@infradead.org, 
	Ian Rogers <irogers@google.com>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260425_235158_383885_337D58C3 
X-CRM114-Status: GOOD (  16.09  )
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

Port the legacy Perl script rw-by-pid.pl to a python script using the
perf module in tools/perf/python.

The new script uses a class-based architecture and leverages the
perf.session API for event processing.

It tracks read and write activity by PID for all processes,
aggregating bytes requested, bytes read, total reads, and errors.

Complications:
- Refactored process_event to extract helper methods
  (_handle_sys_enter_read, etc.) to reduce the number of branches and
  satisfy pylint.
- Split long lines to comply with line length limits.
- pylint warns about the module name not being snake_case, but it is
  kept for consistency with the original script name.

Assisted-by: Gemini:gemini-3.1-pro-preview
Signed-off-by: Ian Rogers <irogers@google.com>
---
v2:

 - Fixed Substring Matching: Replaced loose substring checks like if
   "sys_enter_read" in event_name: with exact matches against
   syscalls:sys_enter_read and raw_syscalls:sys_enter_read using
   sample.evsel.name . This prevents unrelated syscalls with similar
   names (like readahead ) from being incorrectly aggregated. Similar
   fixes were applied for exit events and write events.

 - Inlined Handlers and Tracked Errors: Inlined the _handle_sys_*
   helper methods into process_event() to make error handling
   easier. Now, if a sample lacks expected fields (raising
   AttributeError ), it is added to the self.unhandled tracker instead
   of being silently dropped, providing better visibility to the user.

 - Code Cleanup: Fixed trailing whitespace and added a pylint disable
   comment for too-many-branches caused by the inlining.

v6:
- Fixed `AttributeError` by using `str(sample.evsel)` to get event name.
---
 tools/perf/python/rw-by-pid.py | 158 +++++++++++++++++++++++++++++++++
 1 file changed, 158 insertions(+)
 create mode 100755 tools/perf/python/rw-by-pid.py

diff --git a/tools/perf/python/rw-by-pid.py b/tools/perf/python/rw-by-pid.py
new file mode 100755
index 000000000000..b206d2a575cd
--- /dev/null
+++ b/tools/perf/python/rw-by-pid.py
@@ -0,0 +1,158 @@
+#!/usr/bin/env python3
+# SPDX-License-Identifier: GPL-2.0-only
+"""Display r/w activity for all processes."""
+
+import argparse
+from collections import defaultdict
+import sys
+from typing import Optional, Dict, List, Tuple, Any
+import perf
+
+class RwByPid:
+    """Tracks and displays read/write activity by PID."""
+    def __init__(self) -> None:
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
+                "bytes_written": 0,
+                "total_writes": 0,
+                "comm": "",
+                "errors": defaultdict(int),
+            }
+        )
+        self.unhandled: Dict[str, int] = defaultdict(int)
+        self.session: Optional[perf.session] = None
+
+    def process_event(self, sample: perf.sample_event) -> None:  # pylint: disable=too-many-branches
+        """Process events."""
+        event_name = str(sample.evsel)[6:-1]
+        pid = sample.sample_pid
+
+        assert self.session is not None
+        try:
+            comm = self.session.find_thread(pid).comm()
+        except Exception:  # pylint: disable=broad-except
+            comm = "unknown"
+
+        if event_name in ("syscalls:sys_enter_read", "raw_syscalls:sys_enter_read"):
+            try:
+                count = sample.count
+                self.reads[pid]["bytes_requested"] += count
+                self.reads[pid]["total_reads"] += 1
+                self.reads[pid]["comm"] = comm
+            except AttributeError:
+                self.unhandled[event_name] += 1
+        elif event_name in ("syscalls:sys_exit_read", "raw_syscalls:sys_exit_read"):
+            try:
+                ret = sample.ret
+                if ret > 0:
+                    self.reads[pid]["bytes_read"] += ret
+                else:
+                    self.reads[pid]["errors"][ret] += 1
+            except AttributeError:
+                self.unhandled[event_name] += 1
+        elif event_name in ("syscalls:sys_enter_write", "raw_syscalls:sys_enter_write"):
+            try:
+                count = sample.count
+                self.writes[pid]["bytes_written"] += count
+                self.writes[pid]["total_writes"] += 1
+                self.writes[pid]["comm"] = comm
+            except AttributeError:
+                self.unhandled[event_name] += 1
+        elif event_name in ("syscalls:sys_exit_write", "raw_syscalls:sys_exit_write"):
+            try:
+                ret = sample.ret
+                if ret <= 0:
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
+            f"{'bytes_requested':>15s}  {'bytes_read':>10s}"
+        )
+        print(f"{'-'*6}  {'-'*20}  {'-'*10}  {'-'*15}  {'-'*10}")
+
+        for pid, data in sorted(self.reads.items(),
+                                key=lambda kv: kv[1]["bytes_read"], reverse=True):
+            print(
+                f"{pid:6d}  {data['comm']:<20s}  {data['total_reads']:10d}  "
+                f"{data['bytes_requested']:15d}  {data['bytes_read']:10d}"
+            )
+
+        print("\nfailed reads by pid:\n")
+        print(f"{'pid':>6s}  {'comm':<20s}  {'error #':>6s}  {'# errors':>10s}")
+        print(f"{'-'*6}  {'-'*20}  {'-'*6}  {'-'*10}")
+
+        errcounts: List[Tuple[int, str, int, int]] = []
+        for pid, data in self.reads.items():
+            for error, count in data["errors"].items():
+                errcounts.append((pid, data["comm"], error, count))
+
+        for pid, comm, error, count in sorted(errcounts, key=lambda x: x[3], reverse=True):
+            print(f"{pid:6d}  {comm:<20s}  {error:6d}  {count:10d}")
+
+        print("\nwrite counts by pid:\n")
+        print(f"{'pid':>6s}  {'comm':<20s}  {'# writes':>10s}  {'bytes_written':>15s}")
+        print(f"{'-'*6}  {'-'*20}  {'-'*10}  {'-'*15}")
+
+        for pid, data in sorted(self.writes.items(),
+                                key=lambda kv: kv[1]["bytes_written"], reverse=True):
+            print(
+                f"{pid:6d}  {data['comm']:<20s}  "
+                f"{data['total_writes']:10d}  {data['bytes_written']:15d}"
+            )
+
+        print("\nfailed writes by pid:\n")
+        print(f"{'pid':>6s}  {'comm':<20s}  {'error #':>6s}  {'# errors':>10s}")
+        print(f"{'-'*6}  {'-'*20}  {'-'*6}  {'-'*10}")
+
+        errcounts = []
+        for pid, data in self.writes.items():
+            for error, count in data["errors"].items():
+                errcounts.append((pid, data["comm"], error, count))
+
+        for pid, comm, error, count in sorted(errcounts, key=lambda x: x[3], reverse=True):
+            print(f"{pid:6d}  {comm:<20s}  {error:6d}  {count:10d}")
+
+        if self.unhandled:
+            print("\nunhandled events:\n")
+            print(f"{'event':<40s}  {'count':>10s}")
+            print(f"{'-'*40}  {'-'*10}")
+            for event_name, count in self.unhandled.items():
+                print(f"{event_name:<40s}  {count:10d}")
+
+    def run(self, input_file: str) -> None:
+        """Run the session."""
+        self.session = perf.session(perf.data(input_file), sample=self.process_event)
+        self.session.process_events()
+        self.print_totals()
+
+def main() -> None:
+    """Main function."""
+    parser = argparse.ArgumentParser(description="Trace r/w activity by PID")
+    parser.add_argument("-i", "--input", default="perf.data", help="Input file")
+    args = parser.parse_args()
+
+    analyzer = RwByPid()
+    try:
+        analyzer.run(args.input)
+    except IOError as e:
+        print(e, file=sys.stderr)
+        sys.exit(1)
+
+if __name__ == "__main__":
+    main()
-- 
2.54.0.545.g6539524ca2-goog


