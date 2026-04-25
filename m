Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 449DCFF8863
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 25 Apr 2026 22:51:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=GkS04/94NBW5ShfL0EcvB/IZEgEtB93nGkm6zSZzY+Q=; b=NYP1DfDfxeOOzGQKFqv7/j30EZ
	sDGcyqlv7qpI9/P16LRX0y0RM6NVnFatb/dO9Qqp2GDtU+zh4E9owHb07cavYIbNlo0iuVHWa3OCK
	siCfz9ZT/0T4T7hP4+oKr9/PHtcIEWD7fqs5G1KKu1U3eU4eSUno8d6jXY8gfK7ovdZN/pfjF3ZMF
	OmCzDAQIpDQbSgkVQFOEWAgARDJ9lVBtMd8KEQqXvkVRzLghf2eQbtkMzZlLMGqONKDb1ALNMJNIK
	DjaLB52T5MBceib/KosrKz+bnJ7lheTJMbfQ7uBzdzcJAvY2p3eksmGFOKsMG/vbEKPvKkopgOV7i
	SU1YKJwA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wGlqZ-0000000EzC2-3u1j;
	Sat, 25 Apr 2026 22:51:35 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wGlqJ-0000000Eyrt-01Yk
	for linux-arm-kernel@bombadil.infradead.org;
	Sat, 25 Apr 2026 22:51:19 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Type:Cc:To:From:Subject:
	Message-ID:References:Mime-Version:In-Reply-To:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=GkS04/94NBW5ShfL0EcvB/IZEgEtB93nGkm6zSZzY+Q=; b=Uvm9SYCFsFr+ZZKC8QQeq12d5o
	TRhEKWCGahwrqwyviGeU88Go3t745VWu8m/rznErbIth1i5DZQWgYuL8aHdKal9mtdHJuqdKnk/lM
	58u5TLM3t06Tnj4Hee4dl3TdX/lj/YlE7uhIqjTwr8TRcq7sVjgT/Od4ydeMVRYdANE8uonVO93Dr
	S086dVmvV8J2xW11JUJDGbu09PhFNIglpUBvn0F5WJiDwagF+o9AtSH5jDr9u5Q2m2nKZ4k7zwRNe
	bvLmka7C43tAyNyVBWLTOFNR/dj6LZnKBSlYab/d7oLWdx0YQbY+NASEUgTCiq+VV8u3Z4xtnRFkE
	4StZpqmQ==;
Received: from mail-dy1-x134a.google.com ([2607:f8b0:4864:20::134a])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wGlqF-0000000GMd3-1IzM
	for linux-arm-kernel@lists.infradead.org;
	Sat, 25 Apr 2026 22:51:17 +0000
Received: by mail-dy1-x134a.google.com with SMTP id 5a478bee46e88-2d889997495so23992359eec.0
        for <linux-arm-kernel@lists.infradead.org>; Sat, 25 Apr 2026 15:51:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1777157473; x=1777762273; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=GkS04/94NBW5ShfL0EcvB/IZEgEtB93nGkm6zSZzY+Q=;
        b=Jf9RvkJq3Tzs+j3tcjLGgwGrjs3x2dQsNM29h5LKnLhwR2MZMzxFcjwiWD7BprcApN
         PnVIKV0pWQE6qG+0MSbfAI6H74hcAtGZLdlKpJW31XjjA2yK4TbLrnkPTJ3K8JNbPHZZ
         srHDLnUEOqIO8K7L8CQ5gBVNbN4NIzFPUs3oPFhJUfJJ2XGrLYkNcdwSOG12iTRfhMl9
         fPbVm2jHBbQgZjwg49LOYnain+NI5ZjzOZg/4AlbeNbk+GsgDmHCwlDJFWxUGcFMNhvB
         dNhyUBc2zJMNwDIwe43wirCog4bz9ulj/eW3fAib496MmIhyEKzNRx8kxn34sp/SzJSz
         JdIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777157473; x=1777762273;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=GkS04/94NBW5ShfL0EcvB/IZEgEtB93nGkm6zSZzY+Q=;
        b=aUk0bFYljU0j5NF57o95FwT08RpBRdkRk3+hCEvcayzgUDNDkr9Q9MUt3k9oBWDC/F
         ++biNXXMnBQ2dEeMWUrjdNWaqNIRXVEYq6VQxH6g07uvedWK19Vg73uaHYnacTmANNws
         qLZUBpGXBEgoysh0z8aZIFNr2+hPqiTZGaZNFZyS1napSSUjRylpgE+s2wBn51TP/sI+
         7H7UT6VCBwYYVsTVQltuIV2vqf3R4yAKqZF0hhKe1MRANdGeEcTewvUV+ZhgKT9sIjDj
         caHjqCr0JnwDLSfv6tUoncwgFSPX5tDCoEblVkXIVt5WHfbZ/ch0QY7UVcqYcqiLgkH9
         DV5Q==
X-Forwarded-Encrypted: i=1; AFNElJ9etXOQic2Ujaq5AJWl0b/eWesTvDn1JUGoIp/PpNeTdcUksoP/7gbH+pLVI85aDx94Lhd5pdwno1utNXFmSokN@lists.infradead.org
X-Gm-Message-State: AOJu0YyZF6PnMPfh/9+M78COouxXb/XRdG/Mu63q8Gs53mHnCND7uxCJ
	I/E5j0t9Ai1GpzV+rBUAdU9S9c+BoYTlcGxMkDwaOSlrOJuysUcmrL/Z4MCGHx9UQEFQN65XfyX
	0ZuBN2eu78g==
X-Received: from dlbtz15.prod.google.com ([2002:a05:7022:eacf:b0:12c:4b32:3177])
 (user=irogers job=prod-delivery.src-stubby-dispatcher) by 2002:a05:7022:f40b:b0:12d:ce36:892a
 with SMTP id a92af1059eb24-12dce3691famr1839408c88.9.1777157473158; Sat, 25
 Apr 2026 15:51:13 -0700 (PDT)
Date: Sat, 25 Apr 2026 15:49:21 -0700
In-Reply-To: <20260425224951.174663-1-irogers@google.com>
Mime-Version: 1.0
References: <20260425174858.3922152-1-irogers@google.com> <20260425224951.174663-1-irogers@google.com>
X-Mailer: git-send-email 2.54.0.545.g6539524ca2-goog
Message-ID: <20260425224951.174663-30-irogers@google.com>
Subject: [PATCH v7 29/59] perf futex-contention: Port futex-contention to use
 python module
From: Ian Rogers <irogers@google.com>
To: acme@kernel.org, adrian.hunter@intel.com, james.clark@linaro.org, 
	leo.yan@linux.dev, namhyung@kernel.org, tmricht@linux.ibm.com
Cc: alice.mei.rogers@gmail.com, dapeng1.mi@linux.intel.com, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	linux-perf-users@vger.kernel.org, mingo@redhat.com, peterz@infradead.org, 
	Ian Rogers <irogers@google.com>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260425_235115_440197_56DE965E 
X-CRM114-Status: GOOD (  16.10  )
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

Rewrite tools/perf/scripts/python/futex-contention.py to use the
python module and various style changes. By avoiding the overheads in
the `perf script` execution the performance improves by more than 3.2x
as shown in the following (with PYTHON_PATH and PERF_EXEC_PATH set as
necessary):

```
$ perf record -e syscalls:sys_*_futex -a sleep 1
...
$ time perf script tools/perf/scripts/python/futex-contention.py
Install the python-audit package to get syscall names.
For example:
  # apt-get install python3-audit (Ubuntu)
  # yum install python3-audit (Fedora)
  etc.

Press control+C to stop and show the summary
aaa/4[2435653] lock 7f76b380c878 contended 1 times, 1099 avg ns [max: 1099 ns, min 1099 ns]
...
real    0m1.007s
user    0m0.935s
sys     0m0.072s
$ time python3 tools/perf/python/futex-contention.py
...
real    0m0.314s
user    0m0.259s
sys     0m0.056s
```

Assisted-by: Gemini:gemini-3.1-pro-preview
Signed-off-by: Ian Rogers <irogers@google.com>
---
v2:

1. Fixed Module Import Failure: Corrected the type annotations from
   [int, int] to Tuple[int, int] .  The previous code would raise a
   TypeError at module import time because lists cannot be used as
   types in dictionary annotations.

2. Prevented Out-Of-Memory Crashes: Replaced the approach of storing
   every single duration in a list with a LockStats class that
   maintains running aggregates (count, total time, min, max). This
   ensures O(1) memory usage per lock/thread pair rather than
   unbounded memory growth.

3. Support for Custom Input Files: Added a -i / --input command-line
   argument to support processing arbitrarily named trace files,
   removing the hardcoded "perf.data" restriction.

4. Robust Process Lookup: Added a check to ensure session is
   initialized before calling session.  process() , preventing
   potential NoneType attribute errors if events are processed during
   initialization.
---
 tools/perf/python/futex-contention.py | 87 +++++++++++++++++++++++++++
 1 file changed, 87 insertions(+)
 create mode 100755 tools/perf/python/futex-contention.py

diff --git a/tools/perf/python/futex-contention.py b/tools/perf/python/futex-contention.py
new file mode 100755
index 000000000000..1fc87ec0e6e5
--- /dev/null
+++ b/tools/perf/python/futex-contention.py
@@ -0,0 +1,87 @@
+#!/usr/bin/env python3
+# SPDX-License-Identifier: GPL-2.0
+"""Measures futex contention."""
+
+import argparse
+from collections import defaultdict
+from typing import Dict, Tuple
+import perf
+
+class LockStats:
+    """Aggregate lock contention information."""
+    def __init__(self) -> None:
+        self.count = 0
+        self.total_time = 0
+        self.min_time = 0
+        self.max_time = 0
+
+    def add(self, duration: int) -> None:
+        """Add a new duration measurement."""
+        self.count += 1
+        self.total_time += duration
+        if self.count == 1:
+            self.min_time = duration
+            self.max_time = duration
+        else:
+            self.min_time = min(self.min_time, duration)
+            self.max_time = max(self.max_time, duration)
+
+    def avg(self) -> float:
+        """Return average duration."""
+        return self.total_time / self.count if self.count > 0 else 0.0
+
+process_names: Dict[int, str] = {}
+start_times: Dict[int, Tuple[int, int]] = {}
+session = None
+durations: Dict[Tuple[int, int], LockStats] = defaultdict(LockStats)
+
+FUTEX_WAIT = 0
+FUTEX_WAKE = 1
+FUTEX_PRIVATE_FLAG = 128
+FUTEX_CLOCK_REALTIME = 256
+FUTEX_CMD_MASK = ~(FUTEX_PRIVATE_FLAG | FUTEX_CLOCK_REALTIME)
+
+
+def process_event(sample: perf.sample_event) -> None:
+    """Process a single sample event."""
+    def handle_start(tid: int, uaddr: int, op: int, start_time: int) -> None:
+        if (op & FUTEX_CMD_MASK) != FUTEX_WAIT:
+            return
+        if tid not in process_names:
+            try:
+                if session:
+                    process = session.find_thread(tid)
+                    if process:
+                        process_names[tid] = process.comm()
+            except (TypeError, AttributeError):
+                return
+        start_times[tid] = (uaddr, start_time)
+
+    def handle_end(tid: int, end_time: int) -> None:
+        if tid not in start_times:
+            return
+        (uaddr, start_time) = start_times[tid]
+        del start_times[tid]
+        durations[(tid, uaddr)].add(end_time - start_time)
+
+    event_name = str(sample.evsel)
+    if event_name == "evsel(syscalls:sys_enter_futex)":
+        uaddr = getattr(sample, "uaddr", 0)
+        op = getattr(sample, "op", 0)
+        handle_start(sample.sample_tid, uaddr, op, sample.sample_time)
+    elif event_name == "evsel(syscalls:sys_exit_futex)":
+        handle_end(sample.sample_tid, sample.sample_time)
+
+
+if __name__ == "__main__":
+    ap = argparse.ArgumentParser(description="Measure futex contention")
+    ap.add_argument("-i", "--input", default="perf.data", help="Input file name")
+    args = ap.parse_args()
+
+    session = perf.session(perf.data(args.input), sample=process_event)
+    session.process_events()
+
+    for ((t, u), stats) in sorted(durations.items()):
+        avg_ns = stats.avg()
+        print(f"{process_names.get(t, 'unknown')}[{t}] lock {u:x} contended {stats.count} times, "
+              f"{avg_ns:.0f} avg ns [max: {stats.max_time} ns, min {stats.min_time} ns]")
-- 
2.54.0.545.g6539524ca2-goog


