Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D4C39FF885C
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 25 Apr 2026 22:43:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=GkS04/94NBW5ShfL0EcvB/IZEgEtB93nGkm6zSZzY+Q=; b=zhNrbBaO6voN0qy1EH7dayZ/b6
	MRFBTCHhjL44mdKSjf60yGDBOmeaS5IwSHnUBIiSUDB+HSqd15yOGXmkAfp66tGMpHmvUMyUU7Dxy
	/Pdv9+EeXl/RM+QQWfrMxEUQUfC9lafFajIrTg4wLK0nkvTz4QWZLmOtLp5PoJa1wmI0/txacZhlb
	iRDORjnhKSe5bQc30+2QF66CC0Cha1ng0pHCHFU0OUpnPodolwKJ1kx7Kbe+ZnDmArFz2B/HbZ/Rf
	o4veKlNiOdSIo9vC+fw4ggcd5/10u2ml7i+SXJ0Yg/qB9PBhN5vTh4iWeTt/TBAIu3VpyZOMpO6L7
	wZTZLzVg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wGliS-0000000EuOi-1jLJ;
	Sat, 25 Apr 2026 22:43:12 +0000
Received: from mail-dy1-x134a.google.com ([2607:f8b0:4864:20::134a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wGlhn-0000000EtcQ-3Ycn
	for linux-arm-kernel@lists.infradead.org;
	Sat, 25 Apr 2026 22:42:35 +0000
Received: by mail-dy1-x134a.google.com with SMTP id 5a478bee46e88-2bdf75bc88fso11622238eec.0
        for <linux-arm-kernel@lists.infradead.org>; Sat, 25 Apr 2026 15:42:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1777156950; x=1777761750; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=GkS04/94NBW5ShfL0EcvB/IZEgEtB93nGkm6zSZzY+Q=;
        b=m+uIrkBBXaxjm7anPrhr4ZbL2TB5cq1xHzUz8APcwHwhT2kHJ4AmMBctB64s/slBgj
         V8dj7yzb2jTTF5CcM+vgwRDE6vhrHDR/12g6et4IMNKYeu51L6KucW+5qbXWF74OoR+T
         ASzYVYW9JwvXHQT37QfFbT4j2ZKwSbmhrCO/st5E17vVj2PD4wniMpGe+96DMtsiuB2a
         EkJL64B7b/C109NhL8N4vzzj1qC7+ZQI1AOhIX9Omd5yP5bri7+Kd1bW24CZaLL7auhP
         7nfwQelT0XZZ/j5OvQQRI8iFNH8V3+L5V3B1sITnGoqWrQEVDS/LRqF62KCpJ5u3dicU
         l6FQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777156950; x=1777761750;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=GkS04/94NBW5ShfL0EcvB/IZEgEtB93nGkm6zSZzY+Q=;
        b=AJJvJM6zkLQh6QpDESxJQ7RR3joPvDmqOY9kYW3fgxfc2bEMNkC2pvZGfUKNRsDX/l
         iPR9sPpbRMM6tK4wrlFZ4fC8IbBUWrYCEYJm4zrxyUPT/jfstIy3GZAU0GyP6ZdeY31B
         SmzQVc5eNYxPr6I5aLomglCDghTtFWtWhbOe4HIlraUgC2DzdSMCCGQjwINUifHdeFz0
         hySRq9XvXnnwP1i97b5vN/PobjA2MpAauOFTTxzmtBFCG+fA0maMPvBdHSMqYuzKmgzS
         1HLd3xWHxHgtTINPF7CK7ReOTvhZ2UPk8kAjxPKLOsN7AOdmDprMaMDLJclN5RsshHzz
         ukVA==
X-Forwarded-Encrypted: i=1; AFNElJ/RHRDEFUliaia5j4F7MzAk8TARJgMm0J1z3sdAmSO1zEA6Wvbi7zdd2xPiN42m4n15gyW8KAQGNQnB6430II3M@lists.infradead.org
X-Gm-Message-State: AOJu0YyUZSZy04vuh0sm2yzKAzTqp7xxW98ln87l+GVlPYD561dM5Scn
	aZRrjaxCBPO340kts7YRiRBxlWx4WNSeGLFV0vuZ7y4v2wHJggtj8Gs4EvNH1S7xjTYk3K0/QT5
	KsLxtEn5woA==
X-Received: from dybzy3.prod.google.com ([2002:a05:7301:e103:b0:2df:af:8fde])
 (user=irogers job=prod-delivery.src-stubby-dispatcher) by 2002:a05:7301:1c81:b0:2e6:ffa8:ef85
 with SMTP id 5a478bee46e88-2e6ffa8f745mr11894330eec.0.1777156950187; Sat, 25
 Apr 2026 15:42:30 -0700 (PDT)
Date: Sat, 25 Apr 2026 15:40:54 -0700
In-Reply-To: <20260425224125.160890-1-irogers@google.com>
Mime-Version: 1.0
References: <20260425174858.3922152-1-irogers@google.com> <20260425224125.160890-1-irogers@google.com>
X-Mailer: git-send-email 2.54.0.545.g6539524ca2-goog
Message-ID: <20260425224125.160890-30-irogers@google.com>
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
X-CRM114-CacheID: sfid-20260425_154231_933900_BCF5108D 
X-CRM114-Status: GOOD (  16.15  )
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


