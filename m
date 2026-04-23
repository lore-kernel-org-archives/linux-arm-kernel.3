Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4BB37FDEE46
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 23 Apr 2026 19:44:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=dcIdOgL+7uarIK1UbnVrTv+/pxGdH2WlwKMAxRVHpls=; b=0SuSEpSwlwy3p1XSn+uA/rI1/5
	iT3HxneDNXIkqx22uHtNxtFMN8DNVes9uW6w5ValOuI5KA4tnf3IFT25GCO7zXwIhEGWVHLS2II0q
	Vzwvy9iR06ofdCxxvYwOqbEFd4ceyWlrkPGDB1LypDlO9NGSDtJTWasc1L0D9A9jM6G+hd0p3RDWg
	FZ6sqDoT9gJbyxcuGWg5uKHIIvgzCTwRhJB7xk8OFokwwpx80v+WMLEfv3J56a2xr+2Pf5GGxQZ+h
	nSgP2wsqh3rA8E1m08hbWpx3aMUc1gVrJcJloXy5tU8K6fixQAH6I6UqwjHqtG7sV2DuPHKPFnDdR
	j4ER42JA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wFzyZ-0000000CFcs-2E0Y;
	Thu, 23 Apr 2026 19:44:39 +0000
Received: from mail-dl1-x124a.google.com ([2607:f8b0:4864:20::124a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wFzyV-0000000CFb7-1sBA
	for linux-arm-kernel@lists.infradead.org;
	Thu, 23 Apr 2026 19:44:36 +0000
Received: by mail-dl1-x124a.google.com with SMTP id a92af1059eb24-12db37213daso9328138c88.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 23 Apr 2026 12:44:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1776973474; x=1777578274; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=dcIdOgL+7uarIK1UbnVrTv+/pxGdH2WlwKMAxRVHpls=;
        b=Wxn0Tl5gpXm7UFseKqqKmAbvhAZhyNQjqPyTkFj3dZH1B0SKOFG1PfCYz+IkihdHGt
         bLWcXu21lVLQG5J5YxidDDBuxOxaRrme+zdrMJueU7rUF0+5tsUCGbH7uguSzb7ddte/
         vGSFCYINU6OHVHLet9j4gewBlJUDZrKBc94ewnWaNQB8UfAR7uX6V1tCVVMY3JDTOHkb
         2g+fCknGsU3jmdzTbP4Kv0XPJflgBwkoDFpZniwDkg6GMhFabod2eeHUAVLvKW1q+6jw
         rPww6nN1PPSMsXFjdUqwc89h6zn1SKSipAKwXBtjXgblnX72XSrXGIBa1I9cQ7PqH5Qc
         29SA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776973474; x=1777578274;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=dcIdOgL+7uarIK1UbnVrTv+/pxGdH2WlwKMAxRVHpls=;
        b=GsHBIZ6QW36YFqLHsoxfp4mGO7RkR8801tY/ZYtLKApXEcP6BDZoafloUQDWh+0fDQ
         PPb5vFIn+mNs8VRfIcK2jK42l+Kthb6sWFe0PaftYdAc2hDBITw3Y2ixhdMvuiBH9fxr
         k42IuulOfT/wt7BQiblRrbzOMqZmO70GuW4pPF5w9A0sZL+yaH55Wsa9OjxstLMRhtIg
         CbfrqVqPGWKDIr5tR817CDeYk9iXr911a1zmHzj2k7OiTNeaXqwtQ/mc2D17wq2u06mi
         wCAwb8VZ1sjRlEXhL12IJT6hg5fu5+pfYlzSBM3mXKv1VWGXtIor2D/RdtKhkxQVv7Ld
         ATsw==
X-Forwarded-Encrypted: i=1; AFNElJ+XXyDYVjxqtm2ztryfGsgygOZ989OObOwSEcW302j96iVIhiapmUo5ocYd48jgAXqvmVzDg/r2rBs3uzYT85zt@lists.infradead.org
X-Gm-Message-State: AOJu0YyS9xZjwSICEOgVClINfhAZDoSH3MbecS8htde3Q4QZO9In1Pmk
	cGDQMKVr9qlB8GEx9hIcfLCXcJoJHgZN8fZNYznIvs3vP+vW6/R3H4ojJuKNwe0EAMsY8/ikejz
	5HHNbTcHNrQ==
X-Received: from dly15-n1.prod.google.com ([2002:a05:701b:204f:10b0:12a:83c5:a16f])
 (user=irogers job=prod-delivery.src-stubby-dispatcher) by 2002:a05:7022:69a:b0:128:d967:466c
 with SMTP id a92af1059eb24-12c73f9f65fmr15041977c88.24.1776973473698; Thu, 23
 Apr 2026 12:44:33 -0700 (PDT)
Date: Thu, 23 Apr 2026 12:43:58 -0700
In-Reply-To: <20260423194428.1846255-1-irogers@google.com>
Mime-Version: 1.0
References: <20260423161006.1762700-1-irogers@google.com> <20260423194428.1846255-1-irogers@google.com>
X-Mailer: git-send-email 2.54.0.545.g6539524ca2-goog
Message-ID: <20260423194428.1846255-2-irogers@google.com>
Subject: [PATCH v4 29/58] perf futex-contention: Port futex-contention to use
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
X-CRM114-CacheID: sfid-20260423_124435_503017_A65651F6 
X-CRM114-Status: GOOD (  16.20  )
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
index 000000000000..7c5c3d0ca60a
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
+                    process = session.process(tid)
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
2.54.0.rc2.533.g4f5dca5207-goog


