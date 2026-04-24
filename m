Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6B321FED3F0
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 24 Apr 2026 16:51:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=0Cc1jZjiNz6qIzGkr9ZYmlIDRLWz0J6P2q+qfe2/eFk=; b=iuGDsVN3DNWffCI1eu3v90K4qG
	FWH77kbgbVfnN0anBK1X1YQ++0W5tuRkZOZV+WGnNRA39DSItT34AcoMC2e6SACbk4vRe/wnGCWzx
	8aWTmoBDmAZ26DXlAeBecbtG4h0Be9h0H9PidEvbmUW8q+zveGMCqQWMnoZ7dHgMV5nLdNLZK/Xwp
	zSXy3XNhCprt4LY6Vd7oE2osorqWyJpLhlqLhqMdqOHIhmlgNvu2YQpjvqe7cMcoorcThc+aJQiNJ
	XOVfmS8UGWaKd8lQlm+RDY+phfsx5ORolzQUEvqMgcCK22oLhB0MhUsJOB6rjSBr8WbQ19WP2vvO8
	YICt4EcA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wGJjw-0000000DWGq-2uqZ;
	Fri, 24 Apr 2026 16:50:52 +0000
Received: from mail-dl1-x124a.google.com ([2607:f8b0:4864:20::124a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wGJia-0000000DUmd-3fe9
	for linux-arm-kernel@lists.infradead.org;
	Fri, 24 Apr 2026 16:49:42 +0000
Received: by mail-dl1-x124a.google.com with SMTP id a92af1059eb24-12c87ba0890so25327459c88.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 24 Apr 2026 09:49:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1777049366; x=1777654166; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=0Cc1jZjiNz6qIzGkr9ZYmlIDRLWz0J6P2q+qfe2/eFk=;
        b=JiOfyCqlm80guWXcTgaeBZLBIljnXh+oun/anY6NVQO3F1lCzvHDD9Te3UlBLqSJ4u
         smupf8bzAhA5t1HUH27L/hF9k6/itpJ7KtuSzsVDj4ejbXt7tpK6B8E+wkHr0+p0vqxg
         w0n+ODHuMGxJtVeyU7czRyWzTBuX2xWDLY0+9vsCxGbr95XiUdtODtWA5AqsftNxwlXd
         +1XB0+6/YjcP0V6VGGUrV+nPSfWAK9gO4V836rvmDUvJHVGWe22kIOz7X1pi46Li3R4v
         N1dFK5SM3lhorEeZV7LaFbu68UIUpqkKLwdZQ0LGQ2kGuhSL7NoSPvwgykW2dH6I2IRA
         ljVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777049366; x=1777654166;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=0Cc1jZjiNz6qIzGkr9ZYmlIDRLWz0J6P2q+qfe2/eFk=;
        b=rcpXwXP7c+MEBLabP9Zi9Lyok6oMJdH2IvNM7Dx6f2IUlO1PyUrmxMyYA9sEmiEJ64
         Um88V6C73fs9c/YDi8oREknNyyvXzAMJLGB5wiI02kagV4PZ+mi/oicz/1BVWOP7JnaW
         ICg+CQaKF4lyRNvb/UMe+wjJIehbiu2aTCAcEBTAOE5TKz218m4uBX3VjBDiTdaFsPLg
         C6DZVHbw2wYN4P+iWjKuMKR9DwCgev9C/4+ReZLol01m6d6G1Gn/gxGEmCnz31eIVtrD
         k7p9D8wYGCa5y5Q1z2Dn2TU0wWhwifQZvMwsDSZs/F41X9eoce3ZFE1omJeFavyLWW87
         Vz5Q==
X-Forwarded-Encrypted: i=1; AFNElJ817JqA6KgEkzF1tKeYrgyg14N6RG6Q/J1EnIBAUBqi8AUyZZiyNaKiKueoWdZ9mW6yzs+BPrKFb+95Mm+tSfFE@lists.infradead.org
X-Gm-Message-State: AOJu0YxXL9p+wHdVJJuBVeoVXIxnSA4S1oIPB291+ty9nhyvd1lW+C9z
	4GSWBbTQftExqpovfvxuJzEsjibs1UU0ADv21TguPa9wWLPZWoztPaLaj5sePC8R7xK7wIuemhZ
	Fy0vvMURUTQ==
X-Received: from dlbpu10.prod.google.com ([2002:a05:7022:e88a:b0:12b:fba9:5eb0])
 (user=irogers job=prod-delivery.src-stubby-dispatcher) by 2002:a05:7022:4199:b0:12c:8b9:71db
 with SMTP id a92af1059eb24-12c73f97587mr18037107c88.21.1777049366351; Fri, 24
 Apr 2026 09:49:26 -0700 (PDT)
Date: Fri, 24 Apr 2026 09:47:10 -0700
In-Reply-To: <20260424164721.2229025-1-irogers@google.com>
Mime-Version: 1.0
References: <20260423163406.1779809-1-irogers@google.com> <20260424164721.2229025-1-irogers@google.com>
X-Mailer: git-send-email 2.54.0.545.g6539524ca2-goog
Message-ID: <20260424164721.2229025-49-irogers@google.com>
Subject: [PATCH v5 48/58] perf rw-by-file: Port rw-by-file to use python module
From: Ian Rogers <irogers@google.com>
To: acme@kernel.org, adrian.hunter@intel.com, james.clark@linaro.org, 
	leo.yan@linux.dev, namhyung@kernel.org, tmricht@linux.ibm.com
Cc: alice.mei.rogers@gmail.com, dapeng1.mi@linux.intel.com, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	linux-perf-users@vger.kernel.org, mingo@redhat.com, peterz@infradead.org, 
	Ian Rogers <irogers@google.com>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260424_094929_145048_017352E0 
X-CRM114-Status: GOOD (  14.95  )
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

Port the legacy Perl script rw-by-file.pl to a python script using the
perf module in tools/perf/python.

The new script uses a class-based architecture and leverages the
perf.session API for event processing.

It tracks read and write activity by file descriptor for a given
program name, aggregating bytes requested/written and total counts.

Complications:
- Had to split long lines in __init__ to satisfy pylint.
- pylint warns about the module name not being snake_case, but it is
  kept for consistency with the original script name.

Assisted-by: Gemini:gemini-3.1-pro-preview
Signed-off-by: Ian Rogers <irogers@google.com>
---
v2:

 - Fixed Substring Matching: Replaced if "sys_enter_read" in
   event_name: with an exact match against syscalls:sys_enter_read and
   raw_syscalls:sys_enter_read using sample.evsel.name . This prevents
   variants like readv or readlink from incorrectly triggering the
   read logic. Similar fixes were applied for write events.

 - Fixed Silent Error Dropping: Instead of silently returning when
   expected fields are missing (causing AttributeError ), the script
   now increments the self.unhandled counter for that event. This
   ensures that missing data or unexpected event variants are reported
   to the user instead of quietly skewing the results.
---
 tools/perf/python/rw-by-file.py | 103 ++++++++++++++++++++++++++++++++
 1 file changed, 103 insertions(+)
 create mode 100755 tools/perf/python/rw-by-file.py

diff --git a/tools/perf/python/rw-by-file.py b/tools/perf/python/rw-by-file.py
new file mode 100755
index 000000000000..f71e0b21f64e
--- /dev/null
+++ b/tools/perf/python/rw-by-file.py
@@ -0,0 +1,103 @@
+#!/usr/bin/env python3
+# SPDX-License-Identifier: GPL-2.0-only
+"""Display r/w activity for files read/written to for a given program."""
+
+import argparse
+from collections import defaultdict
+import sys
+from typing import Optional, Dict
+import perf
+
+class RwByFile:
+    """Tracks and displays read/write activity by file descriptor."""
+    def __init__(self, comm: str) -> None:
+        self.for_comm = comm
+        self.reads: Dict[int, Dict[str, int]] = defaultdict(
+            lambda: {"bytes_requested": 0, "total_reads": 0}
+        )
+        self.writes: Dict[int, Dict[str, int]] = defaultdict(
+            lambda: {"bytes_written": 0, "total_writes": 0}
+        )
+        self.unhandled: Dict[str, int] = defaultdict(int)
+        self.session: Optional[perf.session] = None
+
+    def process_event(self, sample: perf.sample_event) -> None:
+        """Process events."""
+        event_name = sample.evsel.name  # type: ignore
+
+        pid = sample.sample_pid
+        assert self.session is not None
+        try:
+            comm = self.session.process(pid).comm()
+        except Exception: # pylint: disable=broad-except
+            comm = "unknown"
+
+        if comm != self.for_comm:
+            return
+
+        if event_name in ("syscalls:sys_enter_read", "raw_syscalls:sys_enter_read"):
+            try:
+                fd = sample.fd
+                count = sample.count
+                self.reads[fd]["bytes_requested"] += count
+                self.reads[fd]["total_reads"] += 1
+            except AttributeError:
+                self.unhandled[event_name] += 1
+        elif event_name in ("syscalls:sys_enter_write", "raw_syscalls:sys_enter_write"):
+            try:
+                fd = sample.fd
+                count = sample.count
+                self.writes[fd]["bytes_written"] += count
+                self.writes[fd]["total_writes"] += 1
+            except AttributeError:
+                self.unhandled[event_name] += 1
+        else:
+            self.unhandled[event_name] += 1
+
+    def print_totals(self) -> None:
+        """Print summary tables."""
+        print(f"file read counts for {self.for_comm}:\n")
+        print(f"{'fd':>6s}  {'# reads':>10s}  {'bytes_requested':>15s}")
+        print(f"{'-'*6}  {'-'*10}  {'-'*15}")
+
+        for fd, data in sorted(self.reads.items(),
+                               key=lambda kv: kv[1]["bytes_requested"], reverse=True):
+            print(f"{fd:6d}  {data['total_reads']:10d}  {data['bytes_requested']:15d}")
+
+        print(f"\nfile write counts for {self.for_comm}:\n")
+        print(f"{'fd':>6s}  {'# writes':>10s}  {'bytes_written':>15s}")
+        print(f"{'-'*6}  {'-'*10}  {'-'*15}")
+
+        for fd, data in sorted(self.writes.items(),
+                               key=lambda kv: kv[1]["bytes_written"], reverse=True):
+            print(f"{fd:6d}  {data['total_writes']:10d}  {data['bytes_written']:15d}")
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
+    parser = argparse.ArgumentParser(description="Trace r/w activity by file")
+    parser.add_argument("comm", help="Filter by command name")
+    parser.add_argument("-i", "--input", default="perf.data", help="Input file")
+    args = parser.parse_args()
+
+    analyzer = RwByFile(args.comm)
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


