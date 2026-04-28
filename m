Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C4389FF885A
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 28 Apr 2026 07:23:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Z8uDU0iX99Tgv3o+fYqZ9yp1w2za7K0HbBrM8LxB5IA=; b=ecl4thqLXJMW8T3QX8GrklfEbS
	FTnKph79RWFj0cFglwrs8NkmVVT1Z5bHHizenz4DqcYYpj+Bb5W6KLdBa2XojAr2qX6RGxxBGi6nT
	FKdTpxzfiWDqvYChTM7NXU2y8CNI8tvTF/xlvMLwkvgJ6UiUF6ONj+75rCBYH/QjVHdXRxDDTqRxY
	FoBCiN1T7WEDs3XRWwh11HvriUxbHsx7enS0M726HSwI33x+W/krOQv5Bb4wrflkFbXaO2FxeaVlw
	Zivh88O/wYAblG5/A8g5Xz2fOOfy2sA6rbd1nlzvc9z276hCKjOeQQzmKuFg22cKypmH3xy4OqiiK
	ATwA59Pw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wHcmm-00000000k7u-3ovA;
	Tue, 28 Apr 2026 07:23:12 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wHckg-00000000hvq-2ksS
	for linux-arm-kernel@bombadil.infradead.org;
	Tue, 28 Apr 2026 07:21:02 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Type:Cc:To:From:Subject:
	Message-ID:References:Mime-Version:In-Reply-To:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=Z8uDU0iX99Tgv3o+fYqZ9yp1w2za7K0HbBrM8LxB5IA=; b=Ms3aD4azMjmtenDdmsUP6mgrFS
	3T1OMaMR5/ZZZmJjoyuB4e0jhxtLXqM12df6OxwhqnfKSOIKAnP9/6aarokG5ScsQKktjoKnB2Qb1
	LJS1T/SDdEYUUWdQT89vKR4Rea9GZf9B9KhBX/TGkH8gLWejHOkTuvN2NLc/tyUeV1tEBN+iBxK04
	+qLfECCy0/a9xC3ts+9BcmN+IxJbgiOQPFHYaIjUUOMrc1AdA1nDDF9YD0WRd4OmUc9UuMyenlj9A
	d9bQnhf52L1cY8cuD+R35ElUFxtKPNQryp/EToQttiA+xAt4+CidwnSHJQWEIWyeX8spZ+NVByQSP
	uyMfrsAQ==;
Received: from mail-dl1-x124a.google.com ([2607:f8b0:4864:20::124a])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wHckc-00000002Dog-0dbs
	for linux-arm-kernel@lists.infradead.org;
	Tue, 28 Apr 2026 07:21:01 +0000
Received: by mail-dl1-x124a.google.com with SMTP id a92af1059eb24-126e8ee6227so12482751c88.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 28 Apr 2026 00:20:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1777360855; x=1777965655; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=Z8uDU0iX99Tgv3o+fYqZ9yp1w2za7K0HbBrM8LxB5IA=;
        b=r/aV8O/P6VTEaA7OLPE/Vj+h+bIvofq2rj0bWpOeUjp1bka1Rm1YmjWAQvDayfwrpy
         oHqso8VIs3BzqisKEyFyxTQr1nmDfYcLqCXMc/O4WJLwsdcIWg7Dj7wuGtVPk4EpOlZP
         efu4R3mwqv/BT5lMpAZT6wBJks8hnwNjACtMdleSor8wQTB5w8GKiKcIeNrVefQoYcea
         gbF4rgoqVHZmTEGscRQb/vXWLq4+zGv8hGnUDFOtaXskxfPWLYpa9EtOjwk9kJB9BDZQ
         uTJ08iwlAvP5zAfhkGMJ0sDcK6GujJfmiVTrDX37Lgr9/O8mCo9xp8TqmuoFFcCfOxVL
         tPmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777360855; x=1777965655;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Z8uDU0iX99Tgv3o+fYqZ9yp1w2za7K0HbBrM8LxB5IA=;
        b=Sxyr9zNl03fZJex6yPaJR/tkFkq4LCcyHzE0OyAbHk2gUmCvDoytP7S503f0lDTovi
         CVqwasf3gZ+QbYQICiPuKZ4gasJQvwk3shUik9gmRUdQB342cz6TNzaqbfrs/ekhQyaQ
         oEmpUobsoykvV7FkdFzT3Y2xh+NSokHrYS0tEpRXNk5qyNJ3qwxPe1mH6pEx2nib9ZsB
         4e8agWXpAyZ/ObU6p+wN94iSdBdLuaSS0s683TPvD/qYbTkzdCd8IxgZELW9xV6sm9Nk
         X5qo0VTK0q17m/DiccwMC/exUIwyK1DSQGn92uOnuKGTLFvOX4t3W0HF1iCEwkKSfw8l
         RbOw==
X-Forwarded-Encrypted: i=1; AFNElJ/zit62FUhdoZ1zaJEG+R/ZG84Lb+qSrhybNJuR+KywZcH96K09CRUSaqw4cRIGyoZFsRnieF2djeE2or2m/sgq@lists.infradead.org
X-Gm-Message-State: AOJu0YwBAwyuythDJ13nZRGc94PhRJeok17lMiD6nO3BaHlO+XT4T04l
	nUydG1rcgfqLNFaEKV5+PwvgzsotZhWRSaElbR5pnbKPR9rH56yZrkYHG7gj5t6eGAATG0jxvyF
	gSNgbnXej1w==
X-Received: from dlad28.prod.google.com ([2002:a05:701b:221c:b0:12a:7f44:d2e3])
 (user=irogers job=prod-delivery.src-stubby-dispatcher) by 2002:a05:7022:2385:b0:12c:8b9:71d9
 with SMTP id a92af1059eb24-12ddd9b5758mr797120c88.27.1777360855127; Tue, 28
 Apr 2026 00:20:55 -0700 (PDT)
Date: Tue, 28 Apr 2026 00:18:53 -0700
In-Reply-To: <20260428071903.1886173-1-irogers@google.com>
Mime-Version: 1.0
References: <20260425224951.174663-1-irogers@google.com> <20260428071903.1886173-1-irogers@google.com>
X-Mailer: git-send-email 2.54.0.545.g6539524ca2-goog
Message-ID: <20260428071903.1886173-49-irogers@google.com>
Subject: [PATCH v8 48/58] perf rw-by-file: Port rw-by-file to use python module
From: Ian Rogers <irogers@google.com>
To: acme@kernel.org, namhyung@kernel.org
Cc: adrian.hunter@intel.com, alice.mei.rogers@gmail.com, 
	dapeng1.mi@linux.intel.com, james.clark@linaro.org, leo.yan@linux.dev, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	linux-perf-users@vger.kernel.org, mingo@redhat.com, peterz@infradead.org, 
	tmricht@linux.ibm.com, Ian Rogers <irogers@google.com>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260428_082058_444035_D3BACA2B 
X-CRM114-Status: GOOD (  15.85  )
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


