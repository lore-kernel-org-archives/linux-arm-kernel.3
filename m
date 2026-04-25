Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DE9EBFF885C
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 25 Apr 2026 22:45:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Z8uDU0iX99Tgv3o+fYqZ9yp1w2za7K0HbBrM8LxB5IA=; b=OICao6sdhTNtU0CXsTIWVfMnQE
	UKI5SoFxjVNbjsW53qf86heD/zXo6OssO+giJ/y6yRp0ROKmtbZ6prVu53uWd2SJFL58i+NmmIgUm
	rH8HwEjC49HFkxPXhLr3N4wC2bzI70acX0JwAZLq/zXo4WZh9JbV06rD5RjkkvrS10JK/5XQqeZdW
	i2Jf1220olTK0EzhGfpdty53Fon2QEZyvnpfinsc5cg4XMdiqc31KI5z+iOkKYMIUt5NzWaIJt8xM
	w4NpuqzkC37kXk1GGH4b+6ddfXfL1NrPWPBpnunwM/fR5A/bjBCE8MD4e0olskMOeJE8ozTTD/HjY
	I10sIjhw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wGlkf-0000000EwOr-3AXb;
	Sat, 25 Apr 2026 22:45:30 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wGlkZ-0000000EwKh-00wB
	for linux-arm-kernel@bombadil.infradead.org;
	Sat, 25 Apr 2026 22:45:23 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Type:Cc:To:From:Subject:
	Message-ID:References:Mime-Version:In-Reply-To:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=Z8uDU0iX99Tgv3o+fYqZ9yp1w2za7K0HbBrM8LxB5IA=; b=Ld1mvFz658g2ZKGujP/nAKC0GT
	E4gT/zc41ww8NbV9fN8HHyWqEFQBS9HbN3YisCeP6WynaZ5g1yaAf6rMKXdcdKQyqVMc5lhjiJSAf
	F8OgNDE2r+J1c9HxOGlSrqvvIwJmh1HKuZ1bqhustzBzgkcxE+4U8E9eDCcjgXT5h0RKFMl799Oi1
	DjMKkmrbA4v8SAFVb5CcYQn1jHfo5Ht+1wYAauPOzVqDlHqzFKGGMfbc4g4T8KKRBY8dYuS9XvqA5
	3nxGowEYIMDl2BWbfgryBZykt+h6aAsAEaoJk/3mZdnZuK8qEsLTz3636nQ+S4D3hRzbGvtxRwtt3
	V+SMFblA==;
Received: from mail-dy1-x1349.google.com ([2607:f8b0:4864:20::1349])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wGlkV-0000000GLZP-3pp8
	for linux-arm-kernel@lists.infradead.org;
	Sat, 25 Apr 2026 22:45:21 +0000
Received: by mail-dy1-x1349.google.com with SMTP id 5a478bee46e88-2d93379001eso20013668eec.1
        for <linux-arm-kernel@lists.infradead.org>; Sat, 25 Apr 2026 15:45:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1777157118; x=1777761918; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=Z8uDU0iX99Tgv3o+fYqZ9yp1w2za7K0HbBrM8LxB5IA=;
        b=GaL9U/2mk3h4keSftpicYST5oK0C7AhgH0SH0QqvcDBfRvxrmoOh9qyYx3zhCoYC9A
         29qXwvWAg3gdH1drwJEgFuVC7N1x1r1VMhoXGKDaMDjrMYLWJDTlADSpat4pUQBgxeFk
         0F4nQ4LOgcioi2VutYgS2q2tPCdX3Hp3DB/WPeFlCNBWR6b6LhIEgU7aA5zDDA6DAfEz
         WnpHdZD9Q+hBefKGexnSXk7IMnQdSSq/P8+/xmUNKEQHIomHepcOVzCH6lugO88bkNc5
         8wCDdUv+gbOH3Y56j0yPwa8OBKWKR0keVgq2E8HLgzlaGAzdAZYEvveV50r8gRwfc63Z
         zgjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777157118; x=1777761918;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Z8uDU0iX99Tgv3o+fYqZ9yp1w2za7K0HbBrM8LxB5IA=;
        b=pH9yNMTHHH7EQCrWYSDoimbpGMIGVFUNzetKn+k3/JP2CiX5ZVdk9uR6Prm22sHT2u
         hOmm1EKlJ+mIOzvS4e2YtyX2iXVxdK/9ek3itg573YucewVdG2BedG4gkYORefDfTYt6
         q4zJU/lsJoMa5OHLnF0PbZMNFUxQ+2awwdJgSS5NYVeozR62peGQfsxv5NnqcpCjGl/E
         kd4nrZohA1U5UBX/dYXoVrggpCkzr5OJRMBGZlyFRDwT/lcURTf9oZtNV7eV9HqaiFes
         OlqjG5t0bPw+HMXXEF+UkUu7+4dMnq+avJdfLzdXTObNPPxt/zQ2xn1irgCN6PsuwpH6
         8pzw==
X-Forwarded-Encrypted: i=1; AFNElJ8uB9GT70DbT/xbznrFKIrSqZXKWTyrpOk0XSGkQL6rTneSsxLWjMTyOTcQt/eLL6myHXpsWsFVUjOqOaG173AP@lists.infradead.org
X-Gm-Message-State: AOJu0YxCFjzV3ipIPd8EywkvBES2sYohG3PAbQhETNuVuuZIjiq581A5
	772yOMU1zlcEKQWwba3T+r0yxDDvm6W8XY9aeEbbQXIAyWF7P9NaADp/HLEsB7NGPZmYM1OZoLp
	XtigVjWbrmQ==
X-Received: from dybss20.prod.google.com ([2002:a05:7301:7214:b0:2e5:ce71:32c4])
 (user=irogers job=prod-delivery.src-stubby-dispatcher) by 2002:a05:7300:2327:b0:2d8:97d6:6ac8
 with SMTP id 5a478bee46e88-2e478c1ff0cmr23453474eec.21.1777157117979; Sat, 25
 Apr 2026 15:45:17 -0700 (PDT)
Date: Sat, 25 Apr 2026 15:44:52 -0700
In-Reply-To: <20260425224503.170337-1-irogers@google.com>
Mime-Version: 1.0
References: <20260425174858.3922152-1-irogers@google.com> <20260425224503.170337-1-irogers@google.com>
X-Mailer: git-send-email 2.54.0.545.g6539524ca2-goog
Message-ID: <20260425224503.170337-6-irogers@google.com>
Subject: [PATCH v7 48/59] perf rw-by-file: Port rw-by-file to use python module
From: Ian Rogers <irogers@google.com>
To: acme@kernel.org, adrian.hunter@intel.com, james.clark@linaro.org, 
	leo.yan@linux.dev, namhyung@kernel.org, tmricht@linux.ibm.com
Cc: alice.mei.rogers@gmail.com, dapeng1.mi@linux.intel.com, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	linux-perf-users@vger.kernel.org, mingo@redhat.com, peterz@infradead.org, 
	Ian Rogers <irogers@google.com>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260425_234520_252393_3B01889F 
X-CRM114-Status: GOOD (  14.91  )
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


