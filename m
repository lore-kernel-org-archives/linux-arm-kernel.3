Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 74ABEFF8860
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 25 Apr 2026 17:53:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Z8uDU0iX99Tgv3o+fYqZ9yp1w2za7K0HbBrM8LxB5IA=; b=obfUkn9otBFPIpRri+xILuivJ3
	7Kn/SXdH0fBdB8poQT5oTHuIrruod/BDByxOKvUmJQzOPthmk6o+KY3kMBtKcH+p2ZcSfIgx1MRzw
	afZd0KT/rGsoO3s40adhGjzq7TWW2qhAGBtv9rhEBFlM7xMWkQBR9UfaR52ZLYcImzoPP4pu8hr23
	0iofQPXAZgkjeyCUZ7jWPTE7fII6pkOWdDYN3xIrGEC2Ab9mxAJRx59uC7a93EMNv1q2e4CSmF25i
	yB0ylxzW7aYvf2b4zvnvPpXltQJdg9VVLRXcM7qQq07NBmuekAKJty9+edcH/i0Ysapj8s3Zh7jrn
	oJhleg1Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wGhBZ-0000000EfKm-2AOD;
	Sat, 25 Apr 2026 17:52:57 +0000
Received: from mail-dy1-x134a.google.com ([2607:f8b0:4864:20::134a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wGh9L-0000000Edhi-3pYG
	for linux-arm-kernel@lists.infradead.org;
	Sat, 25 Apr 2026 17:50:52 +0000
Received: by mail-dy1-x134a.google.com with SMTP id 5a478bee46e88-2bdd327d970so5447406eec.1
        for <linux-arm-kernel@lists.infradead.org>; Sat, 25 Apr 2026 10:50:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1777139437; x=1777744237; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=Z8uDU0iX99Tgv3o+fYqZ9yp1w2za7K0HbBrM8LxB5IA=;
        b=a540zkTMCV254KduaGeU5ZfBT3Xwy5KkWk7BXy0xbS2zZQzMgN2GT6LJ/ghI6qNdhk
         +1ApQN6+qqrYZlhlPquWoAnGMuqjcqVyvCOroZ68DUx590hXVNF6cKx0XF1rOrW9bs2U
         +AmHZFfGXV3DzFIEtNoqMLv9/kZrVc16CSTeRSwFvSnV+CubiPkmSPrwZ6NJGUjIAsl8
         aIrglVJR8KJ7GlvkwFmVo5Sf5MyQUZA7Prrt59hTs4642GBcM/m/N2Blc/bq++AApNH6
         YFMt2SRldY1T426ZEZs1gOYPZCza4lQSEPWnNj3NoqJdag9qRfs4OMHwf2t1sDgDgvrX
         GbXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777139437; x=1777744237;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Z8uDU0iX99Tgv3o+fYqZ9yp1w2za7K0HbBrM8LxB5IA=;
        b=ceXD7A1eFjycdgrf4LGJqJSPUqh+LO0Jnbttn3sncH7crlaF9Wxegk5RLydYHamraL
         5rtLeC3Puid2dxmuYQIaS97/OX8aE/JL/OMIbhw9jw4fJLdl9IhUenKL9oQ73r+FaaBG
         DmyhWnzzGTk+K278+tXMx7cIRIxvXFpI++JUaGqttVX968kmivzH7JRvfH50x0x3tZSr
         A1IeCJ8EQUFpg/AA1GURH8wmu43fdgkZE19r2mPc8Kt0jd0JOU9825IEKqk9ZZHA/XTw
         LGYrB00QK0LZiQtVB6Ywd9YzOWGTVdbOxMrZ5Jh8WwKUgn6hzGTIKg9rNxDZHBqRRO0I
         T8DA==
X-Forwarded-Encrypted: i=1; AFNElJ9yHK5ttE2BUsgME+6gUtoAtz9+U6MeGuHjzV8j6SM1f1LyPF32MaThaY4o/mmBRKVfSimpTXLCkgvUBDEgFE48@lists.infradead.org
X-Gm-Message-State: AOJu0YweFEwgBx1ryjRZ1XzlmEYcy3lHMPUk3EBCvmOwIKULHIOoND0w
	GBHhtD3fJ3NhXK8MHmXa0OJ9V0xo4QmBqY4uJoRRwWvtPHG7UE1UOdMK1esKvT9Rli//x+3i6Wi
	3iPzJ/LQcww==
X-Received: from dybrp14.prod.google.com ([2002:a05:7301:460e:b0:2ca:9b08:e7c9])
 (user=irogers job=prod-delivery.src-stubby-dispatcher) by 2002:a05:7300:7493:b0:2de:e194:5fb1
 with SMTP id 5a478bee46e88-2e42ce4214bmr16715192eec.7.1777139437220; Sat, 25
 Apr 2026 10:50:37 -0700 (PDT)
Date: Sat, 25 Apr 2026 10:48:46 -0700
In-Reply-To: <20260425174858.3922152-1-irogers@google.com>
Mime-Version: 1.0
References: <20260424164721.2229025-1-irogers@google.com> <20260425174858.3922152-1-irogers@google.com>
X-Mailer: git-send-email 2.54.0.545.g6539524ca2-goog
Message-ID: <20260425174858.3922152-49-irogers@google.com>
Subject: [PATCH v6 48/59] perf rw-by-file: Port rw-by-file to use python module
From: Ian Rogers <irogers@google.com>
To: acme@kernel.org, adrian.hunter@intel.com, james.clark@linaro.org, 
	leo.yan@linux.dev, namhyung@kernel.org, tmricht@linux.ibm.com
Cc: alice.mei.rogers@gmail.com, dapeng1.mi@linux.intel.com, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	linux-perf-users@vger.kernel.org, mingo@redhat.com, peterz@infradead.org, 
	Ian Rogers <irogers@google.com>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260425_105040_170189_AD012B95 
X-CRM114-Status: GOOD (  15.07  )
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

v6:
- Fixed `AttributeError` by using `str(sample.evsel)` to get event name.
---
 tools/perf/python/rw-by-file.py | 103 ++++++++++++++++++++++++++++++++
 1 file changed, 103 insertions(+)
 create mode 100755 tools/perf/python/rw-by-file.py

diff --git a/tools/perf/python/rw-by-file.py b/tools/perf/python/rw-by-file.py
new file mode 100755
index 000000000000..2103ac0412bb
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
+        event_name = str(sample.evsel)[6:-1]
+
+        pid = sample.sample_pid
+        assert self.session is not None
+        try:
+            comm = self.session.find_thread(pid).comm()
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


