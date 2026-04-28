Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E4958FF885A
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 28 Apr 2026 07:23:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=qbPEhnMlYjLIyQYaNXILQynFaRfheBD/Hl8QlXDxSqM=; b=aH/88wlSG2WbmdvGxuQHOaAgJR
	Pe1Smj1gmTyhhdi9fCt+6r2J7rSWuskdojyLSs9iJ9JlC0gAsP9nhip6A4bISedAtuxEXPUpYKVFd
	HIpNiSviqoNwPmTpZoU/5im7eFOcTX0NHDncNYsEfQVINxL3wD6EBXR+VfOwvMMY1JLKfzVR9PQOB
	JdjVJckgZxUhUeBIF8jnVPQT3swVnUeiYRn2JNpA8YlvN6899T6aNTwQtUov3jcn8RR+rKj4Fj3E7
	4n5PEbsB1CwUZzzupimHOu6kZtmyVnZ9fhKZrkpRn7IMCWliIDIFhkvDiY1UDik+AHSaTfNlOxnGb
	Tw5Ph5EA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wHcms-00000000kEe-04Rk;
	Tue, 28 Apr 2026 07:23:18 +0000
Received: from mail-dy1-x134a.google.com ([2607:f8b0:4864:20::134a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wHckc-00000000hrU-1a4j
	for linux-arm-kernel@lists.infradead.org;
	Tue, 28 Apr 2026 07:21:17 +0000
Received: by mail-dy1-x134a.google.com with SMTP id 5a478bee46e88-2eaed3d96d7so3084753eec.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 28 Apr 2026 00:20:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1777360857; x=1777965657; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=qbPEhnMlYjLIyQYaNXILQynFaRfheBD/Hl8QlXDxSqM=;
        b=tOUOAQaEfYApGqWcRK48diS2qTX+idz3XOUIYBOR5DZwVRXC36pSYiMx4S2VE5mL1V
         HUAa2n2idcHelG4HNYX2A5LjbWhupuw5JLWANxX+9kW8Wn2PWBjftmBxhx2r1+e6EGks
         Lh5FKSCgm2H3vQVNwyMvcrNcTSVLCAtMMte8cXDdDWIuG7qD1YizVnX92VO9O1F1c4Ge
         WVHKvzD73tR35NNB7TAdnBT5qu4rCM32Zo0abvv6w3wk5rcWvUM9oAVKsyiMZSla9C2o
         MKhcq1WwzNLiHvJBdVf9ov/3MYwvvWTuufGz8NxGDgDLI88nSF85X1YiDCtAkYh6O8AF
         TmJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777360857; x=1777965657;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=qbPEhnMlYjLIyQYaNXILQynFaRfheBD/Hl8QlXDxSqM=;
        b=czRXVSa7Q2UL6+xzYVA/DwvnvThdTxd9TlLIRHhghVtP8WjbpfJDOUqj91EXZb1qaH
         eoZAJyHA9dZTynmJ6WxsYCarlGOLVY9Oxkbiyp9ilj/ST2yrwbxoDQjtzPlrtKXmKZXZ
         IXH9Y7Gk2Y4nQ5rAL9UgZTFT4O1pyXe5gWPr0d+eJeFI/4WgVqjPgCiFvJyzED1FEpXP
         7yXOpUcDdSjcIIpjyJp3YiFxKLz/ydCWFwouebGL8LqftgskMOORSZLVWHLRk8Vh+vBw
         pQdAs3EFdU7LGsFCBQaPTwLUBRwynumxXXr+wSA+hTgsLgD8EceAk0BlA8UliTB4+q3f
         YM+w==
X-Forwarded-Encrypted: i=1; AFNElJ+RFNt0yeYCg2e4OntO+9/tMUEokO+issHMQ+fGHnz+53duuGlqTAMs9fSVHU/oBbC2auQ9bMeHr4Kggf01Nvdb@lists.infradead.org
X-Gm-Message-State: AOJu0YzcmMYKP5OOt/rOZQIOgy5ycMKsDUaB1a/AvWqSI0+TOt8vvJgs
	PPftEkrRR+eQXfZ10WJy80I9tkm0nDpOabSYW/udg53NZw9m+Q9sykMWC4nVBGSwNWbGyUGsgUa
	LL5gj6BXCqw==
X-Received: from dlbto2.prod.google.com ([2002:a05:7022:3b02:b0:12d:c585:f600])
 (user=irogers job=prod-delivery.src-stubby-dispatcher) by 2002:a05:7022:6ba1:b0:12d:de3f:f3dc
 with SMTP id a92af1059eb24-12dde3ff91emr366117c88.38.1777360856946; Tue, 28
 Apr 2026 00:20:56 -0700 (PDT)
Date: Tue, 28 Apr 2026 00:18:54 -0700
In-Reply-To: <20260428071903.1886173-1-irogers@google.com>
Mime-Version: 1.0
References: <20260425224951.174663-1-irogers@google.com> <20260428071903.1886173-1-irogers@google.com>
X-Mailer: git-send-email 2.54.0.545.g6539524ca2-goog
Message-ID: <20260428071903.1886173-50-irogers@google.com>
Subject: [PATCH v8 49/58] perf rw-by-pid: Port rw-by-pid to use python module
From: Ian Rogers <irogers@google.com>
To: acme@kernel.org, namhyung@kernel.org
Cc: adrian.hunter@intel.com, alice.mei.rogers@gmail.com, 
	dapeng1.mi@linux.intel.com, james.clark@linaro.org, leo.yan@linux.dev, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	linux-perf-users@vger.kernel.org, mingo@redhat.com, peterz@infradead.org, 
	tmricht@linux.ibm.com, Ian Rogers <irogers@google.com>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260428_002058_464943_C83CB930 
X-CRM114-Status: GOOD (  17.09  )
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


