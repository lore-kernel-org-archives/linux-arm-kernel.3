Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2AD83FED3F2
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 24 Apr 2026 16:51:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=sdsIaZxORPBtHlF7NDydqw84ClDmIcXPteqzDGLLDeY=; b=tc0pQVyrr+54LzWnsalMGnPNXo
	aKI7E3FGzjkpT/A9oquzsz44JaUD03i1RmDT60wdqu+p7QFDdfDsAPdyC5BtSsNuTMg29sgxXTCZM
	g7czAcz3SEnuwkqu2ahrT0yuz6CQd8uCuyeeJ5jRoObCgY/a3gx5w0SWy9OHe6P40ibG2IjRY/ifz
	vf5nmFa9x3Fq26+P4ESlviEOn2eMVpf1do2P98cXdxt02TSFzouiJMe88C7XR+0oI34vKQ/3GnAjJ
	oyJ+2ZWGTCFMwGsWVux3EBtN/J5Y47wrBVJGyKP1VLW6R/q+cSzpKkMt7tNa7UZDLYDNkh4LiqgdP
	XrYG5kNw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wGJk0-0000000DWL4-0RA3;
	Fri, 24 Apr 2026 16:50:56 +0000
Received: from mail-dy1-x134a.google.com ([2607:f8b0:4864:20::134a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wGJid-0000000DUpO-1ylc
	for linux-arm-kernel@lists.infradead.org;
	Fri, 24 Apr 2026 16:49:42 +0000
Received: by mail-dy1-x134a.google.com with SMTP id 5a478bee46e88-2d9da2559aeso21252635eec.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 24 Apr 2026 09:49:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1777049369; x=1777654169; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=sdsIaZxORPBtHlF7NDydqw84ClDmIcXPteqzDGLLDeY=;
        b=KCrdU2lmcwQ1Rs5DWkEvUhHwMvpGxlTZSIPRYX4XkeVtNEkA0NobAumPHwARAQzfdo
         +VtkLCd5VpoRSXtZaZyE0JL/CzzkvkBs1pOdLHfj9tWQSGm9QBv5FrnmUv+R5dNwH8Cn
         FTgm9bty2mmX3nSJ5BwTPE7YvZvCDtf5Om5oSQ7ZKiGTUjEXo2CwJ8ZSv7JI65ab6BSO
         FIkUBUBT/78PYhZcbO56WeRmREQLzq1WzBgPHPftUqAN5bqDQF53fFngYeCIWOjIiaHH
         Kd/uFqixIg/Fc4H+W0bO5g6gTewDQkhLPExJ9ArMTvJfgupZQuhhNDEXL8kqP8i9zlx9
         Mzog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777049369; x=1777654169;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=sdsIaZxORPBtHlF7NDydqw84ClDmIcXPteqzDGLLDeY=;
        b=i3Jodzoymg/yOksBnGxltzGHgat4ESBxtTSdOPB/TFX60epQzZVDXC9/TA1bl/KlVo
         0FGQAI+eqEvNewJOpNjSpLg3nNPo7/Bc0ptU9AzY315FGFRYSQ4f2K01tSGOMyDSuQ5n
         BZv5eqjuvrKbiuh1KTPL6ZW3RCTHK0DmmUOL0J6I3LiBzkmTUBUyvaazkxNpdml0FOnn
         L0mAUVQszt/UOuvridaZn6kzPv6WWi8/w5HRhdXjU0i61MpnbsxE4uOFgbCgmhxejc+v
         ZqOF38BPZLk1fhFggp5tYhsaw+jE1/wteNcx7sIU2ICQMje3nq54L3377zU4m2oF0roz
         5Jqw==
X-Forwarded-Encrypted: i=1; AFNElJ+nQ6MXhOCCj76ZJvYlLWwzmHptieGd8QV7WwcDPGgWiD9PLdS7XptXDxIXj3fLiMH5aDIKrUzcGRg7APkw3OiS@lists.infradead.org
X-Gm-Message-State: AOJu0Yy9AU3LUHGycptMbJn8L1bmrsNo7MiEnKdX542BtcAwXAtqXrpo
	PNc6p5YxJWMrNJXOuvAEmi8dECoFkG7ywGEDv7xVZZQSONghNLtR3YFh/XZSGYs38Aes2t00+rO
	iUwO0cKwdSA==
X-Received: from dycao4.prod.google.com ([2002:a05:7301:7d04:b0:2da:3d44:ddce])
 (user=irogers job=prod-delivery.src-stubby-dispatcher) by 2002:a05:7301:9f12:b0:2e1:e3e6:2910
 with SMTP id 5a478bee46e88-2e46577039dmr20625261eec.9.1777049368506; Fri, 24
 Apr 2026 09:49:28 -0700 (PDT)
Date: Fri, 24 Apr 2026 09:47:11 -0700
In-Reply-To: <20260424164721.2229025-1-irogers@google.com>
Mime-Version: 1.0
References: <20260423163406.1779809-1-irogers@google.com> <20260424164721.2229025-1-irogers@google.com>
X-Mailer: git-send-email 2.54.0.545.g6539524ca2-goog
Message-ID: <20260424164721.2229025-50-irogers@google.com>
Subject: [PATCH v5 49/58] perf rw-by-pid: Port rw-by-pid to use python module
From: Ian Rogers <irogers@google.com>
To: acme@kernel.org, adrian.hunter@intel.com, james.clark@linaro.org, 
	leo.yan@linux.dev, namhyung@kernel.org, tmricht@linux.ibm.com
Cc: alice.mei.rogers@gmail.com, dapeng1.mi@linux.intel.com, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	linux-perf-users@vger.kernel.org, mingo@redhat.com, peterz@infradead.org, 
	Ian Rogers <irogers@google.com>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260424_094931_725212_B394D2F6 
X-CRM114-Status: GOOD (  16.16  )
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
---
 tools/perf/python/rw-by-pid.py | 158 +++++++++++++++++++++++++++++++++
 1 file changed, 158 insertions(+)
 create mode 100755 tools/perf/python/rw-by-pid.py

diff --git a/tools/perf/python/rw-by-pid.py b/tools/perf/python/rw-by-pid.py
new file mode 100755
index 000000000000..53e16b373111
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
+        event_name = sample.evsel.name  # type: ignore
+        pid = sample.sample_pid
+
+        assert self.session is not None
+        try:
+            comm = self.session.process(pid).comm()
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


