Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CB1BBFF8860
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 25 Apr 2026 17:50:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=uUuqjywSMoBiuUZB5eMXpVGDru/SJ2JbsKc572+eD7Q=; b=ZMjROWiUFjFiMVgcEtoU25ROVr
	YgSKGDZNNT3/AL6KRCmDa7GrUCnGFqJgwZ+HCGhKCi2ERsliVWfGPmmZ7G8rKFNZVinSayPhbAAGd
	JaHZkLS+K1XS3NMDzv8bBABDRjBGiFH5T3lD6fiZaFFg4PLkbOCsfCi7saFfnWRevUfrB/wK5wH+k
	1O1GBIx9wVXJm5eZZA62Nbb/rrTHAlmrr6xSQY6hNFBPFtLsD/ONXVJtkRjPhL3rVg1euWZxklPVT
	bJq+HimwBU+6IE4RoOHWeQqB4+pjgR20oOoBDvHYr+XQjYVDX8Ser9vgOv0W8DAD2FCGBiPj8T+tT
	wmnfB3Lg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wGh9D-0000000EdZt-3CTW;
	Sat, 25 Apr 2026 17:50:31 +0000
Received: from mail-dy1-x1349.google.com ([2607:f8b0:4864:20::1349])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wGh8e-0000000Ectt-0fal
	for linux-arm-kernel@lists.infradead.org;
	Sat, 25 Apr 2026 17:50:08 +0000
Received: by mail-dy1-x1349.google.com with SMTP id 5a478bee46e88-2ddd8ef5343so8702104eec.1
        for <linux-arm-kernel@lists.infradead.org>; Sat, 25 Apr 2026 10:49:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1777139395; x=1777744195; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=uUuqjywSMoBiuUZB5eMXpVGDru/SJ2JbsKc572+eD7Q=;
        b=r2DViiaXM6/2EeG0Mpuos5QVmKQKRRuZCg+5nqVQJZi7wTpu59xomZBHpG71yB5Yoz
         fOZCeCrs9hLA7275GgMuc8mP5Q3mzTdD1J8sMgIcLCnOEpEYVRrM55hlkuOfJpO4RdGC
         RMDep4LW67nbT0ioun6OCRiqkVPA15QKKHwXhL4K7rgLQmcCKW7h12rZmrxIKiq21xqh
         3fDaR7vRrtVQJt5/L4ouUk9j2VCxegcOOnb0pP/vO39ZdnGxcTTSGC3pog5pBXRIkgr+
         yMuv+xjXbyMG8ATXpAWqSRUrtnmAR3JLYUNl8bTgVYiabq6iXYTqKn192BEFquL3Akso
         XY2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777139395; x=1777744195;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=uUuqjywSMoBiuUZB5eMXpVGDru/SJ2JbsKc572+eD7Q=;
        b=dE/rpn2KI02IydULBPEy6AK0dL8uuaIi4z3Nxwdq7WfpgxRBEIT47leyXp1g128j5S
         6pMFWG1eo7SiQTLP5dlYiUFsE9LfOqjG9uYPaTvo0MMeQY9tJS1ugO+pYZwsO3CdjAxs
         uw1YZ07eclXxXw6f3OKKjGkzcYN/hf3giAuHDyhrVk2CadC0X3J008tG6B5l+AzQkZ1E
         lbUym31uQWRcMYOLIKIQ7dmnD4E/XUOHbx8yz3d8krduQpBofRod04AV4s15ueQBLGM5
         VB7rdbIIUJQCg+sSHFQydb8kH6UXxPw+D6U3Huzl6P+nwevQ2+jLxlvm065LS5N0k7xt
         gP3A==
X-Forwarded-Encrypted: i=1; AFNElJ84hGONu1YGvHIYEzNx2/vPJn0nj4R2SreoeJ1BMkHx6RCY7XmtupT7QLwBrQe9EqgHUJwcbD9PZ/jgYpWMFKc3@lists.infradead.org
X-Gm-Message-State: AOJu0YwL90SmEO8XG4Q8Q8UnWM45QQEBYzOeQYl2UT6C65BM7VU6YSxA
	y1VIYeWNePf06u9bhzLMrSyGctXYgU+e2VAqm3dZBlFv2ZOi46L2/SDyzk0gqMevirz3kfGRtQT
	CGOz1pd9Drw==
X-Received: from dyfv9.prod.google.com ([2002:a05:7300:8249:b0:2df:7541:1895])
 (user=irogers job=prod-delivery.src-stubby-dispatcher) by 2002:a05:7300:3252:b0:2c4:ec89:bc7
 with SMTP id 5a478bee46e88-2e464dacc71mr20505214eec.10.1777139394510; Sat, 25
 Apr 2026 10:49:54 -0700 (PDT)
Date: Sat, 25 Apr 2026 10:48:25 -0700
In-Reply-To: <20260425174858.3922152-1-irogers@google.com>
Mime-Version: 1.0
References: <20260424164721.2229025-1-irogers@google.com> <20260425174858.3922152-1-irogers@google.com>
X-Mailer: git-send-email 2.54.0.545.g6539524ca2-goog
Message-ID: <20260425174858.3922152-28-irogers@google.com>
Subject: [PATCH v6 27/59] perf syscall-counts: Port syscall-counts to use
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
X-CRM114-CacheID: sfid-20260425_104956_271585_C3D6B157 
X-CRM114-Status: GOOD (  17.43  )
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

Rewrite tools/perf/scripts/python/syscall-counts.py to use the python
module and various style changes. By avoiding the overheads in the
`perf script` execution the performance improves by more than 4x as
shown in the following (with PYTHON_PATH and PERF_EXEC_PATH set as
necessary):

```
$ perf record -e raw_syscalls:sys_enter -a sleep 1
...
$ time perf script tools/perf/scripts/python/syscall-counts.py perf
Install the python-audit package to get syscall names.
For example:
  # apt-get install python3-audit (Ubuntu)
  # yum install python3-audit (Fedora)
  etc.

Press control+C to stop and show the summary
Warning:
1 out of order events recorded.

syscall events for perf:

event                                          count
 --------------------------------------  ------------
1                                             538989
16                                                32
203                                               17
3                                                  2
257                                                1
204                                                1
15                                                 1
7                                                  1
0                                                  1

real    0m3.887s
user    0m3.578s
sys     0m0.308s
$ time python3 tools/perf/python/syscall-counts.py perf
Warning:
1 out of order events recorded.

syscall events for perf:

event                                         count
 -------------------------------------- ------------
write                                        538989
ioctl                                            32
sched_setaffinity                                17
close                                             2
openat                                            1
sched_getaffinity                                 1
rt_sigreturn                                      1
poll                                              1
read                                              1

real    0m0.953s
user    0m0.905s
sys     0m0.048s
```

Assisted-by: Gemini:gemini-3.1-pro-preview
Signed-off-by: Ian Rogers <irogers@google.com>
---
v2:

1. Fallback for Unknown Syscalls: If perf.syscall_name() returns None
   for an unmapped ID, the script now falls back to using the numeric
   ID string. This prevents a TypeError when applying string alignment
   formatting.

2. Fallback for Syscall Number Attribute: The script now checks for
   __syscall_nr first, and if not present (as on some older kernels),
   falls back to checking for nr .

3. Robust Process Resolution: Added a try-except block around
   session.process(sample.pid).comm() . If the process lookup fails
   (returning NULL/None), it falls back to "unknown" instead of
   letting a TypeError crash the script.

4. Support for Custom Input Files: Added a -i / --input command-line
   argument to allow processing arbitrarily named trace files,
   removing the hardcoded "perf.data" restriction.
---
 tools/perf/python/syscall-counts.py | 72 +++++++++++++++++++++++++++++
 1 file changed, 72 insertions(+)
 create mode 100755 tools/perf/python/syscall-counts.py

diff --git a/tools/perf/python/syscall-counts.py b/tools/perf/python/syscall-counts.py
new file mode 100755
index 000000000000..ef2bd8c7b24c
--- /dev/null
+++ b/tools/perf/python/syscall-counts.py
@@ -0,0 +1,72 @@
+#!/usr/bin/env python3
+# SPDX-License-Identifier: GPL-2.0
+"""
+Displays system-wide system call totals, broken down by syscall.
+
+If a [comm] arg is specified, only syscalls called by [comm] are displayed.
+"""
+
+import argparse
+from collections import defaultdict
+from typing import DefaultDict
+import perf
+
+syscalls: DefaultDict[int, int] = defaultdict(int)
+for_comm = None
+session = None
+
+
+def print_syscall_totals():
+    """Print aggregated statistics."""
+    if for_comm is not None:
+        print(f"\nsyscall events for {for_comm}:\n")
+    else:
+        print("\nsyscall events:\n")
+
+    print(f"{'event':<40} {'count':>10}")
+    print("---------------------------------------- -----------")
+
+    for sc_id, val in sorted(syscalls.items(),
+                             key=lambda kv: (kv[1], kv[0]), reverse=True):
+        name = perf.syscall_name(sc_id) or str(sc_id)
+        print(f"{name:<40} {val:>10}")
+
+
+def process_event(sample):
+    """Process a single sample event."""
+    event_name = str(sample.evsel)
+    if event_name == "evsel(raw_syscalls:sys_enter)":
+        sc_id = getattr(sample, "id", -1)
+    elif event_name.startswith("evsel(syscalls:sys_enter_"):
+        sc_id = getattr(sample, "__syscall_nr", None)
+        if sc_id is None:
+            sc_id = getattr(sample, "nr", -1)
+    else:
+        return
+
+    if sc_id == -1:
+        return
+
+    comm = "unknown"
+    try:
+        if session:
+            proc = session.find_thread(sample.sample_pid)
+            if proc:
+                comm = proc.comm()
+    except (TypeError, AttributeError):
+        pass
+
+    if for_comm and comm != for_comm:
+        return
+    syscalls[sc_id] += 1
+
+
+if __name__ == "__main__":
+    ap = argparse.ArgumentParser()
+    ap.add_argument("comm", nargs="?", help="Only report syscalls for comm")
+    ap.add_argument("-i", "--input", default="perf.data", help="Input file name")
+    args = ap.parse_args()
+    for_comm = args.comm
+    session = perf.session(perf.data(args.input), sample=process_event)
+    session.process_events()
+    print_syscall_totals()
-- 
2.54.0.545.g6539524ca2-goog


