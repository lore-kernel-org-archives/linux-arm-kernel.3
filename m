Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CECF9FDEE3F
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 23 Apr 2026 19:44:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=jh1fu2b+Mu/f91JhQcIvoSz3dYZEeq4RNZS+9V85IHQ=; b=GCofSWyE9Zh8bivacFmjNXnv0t
	RRpWKDxOy10VSJ4X9sJaOyaktGDNbelKouaO0WVrIXiITQcjd8YyExeFpyZaATKL8+T9wBduBq5uQ
	epAF4c1PDGr6haOcMlW3koUT6ejkLMu3OFbrf6xZcYjx4vnIUaM2jTJPNus9k8tOjPakMleopBY3P
	YpWKTPCKA+TKo2Q4bK1mRr+ffxlNiWhL+wkAwULpQ1hkafTOKLgT6oAtfUwUK4Ym7Gb2A3LC9GwiO
	Fddz8yICe+lhvfhUX1Q7Z5A0IG1ZG6LsPHg/QrG0P+CgQkdSbCZ7ADnkRti/PKQwKCvnh9tw7Bf+N
	aLzikJlg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wFzyW-0000000CFbq-0u25;
	Thu, 23 Apr 2026 19:44:36 +0000
Received: from mail-dl1-x124a.google.com ([2607:f8b0:4864:20::124a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wFzyT-0000000CFaq-1mKE
	for linux-arm-kernel@lists.infradead.org;
	Thu, 23 Apr 2026 19:44:34 +0000
Received: by mail-dl1-x124a.google.com with SMTP id a92af1059eb24-12c8de02a4dso4342633c88.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 23 Apr 2026 12:44:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1776973472; x=1777578272; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=jh1fu2b+Mu/f91JhQcIvoSz3dYZEeq4RNZS+9V85IHQ=;
        b=r6Xc17oquGJ33uf3kuvaeJJgtMzHr0plc3aSQPh/7xbHWdP9QXriQno49U6WiDilJ2
         Mnssr/5653eW1amWycsx+Nq0qzPY+2a6CkwanA+kbrRVozoiu6Yj0djN9DtZwz2IUTFN
         kUiHIwmZmD0VmkeGuRDYneOqyf3kTWmqtOIwzdssMhnr7L42qkcDTAuSZuyp7CYPPmTK
         qMimkLi/TC5Htt7j4cVUQTKysy0rgxQ3YUyGs8Cw7NfCHLMCpetb1RiGpiIfR9GsZHXF
         bWfKjszkG1qZi0VsqQ65Xf3omHpy3zz+qvlM10xxB0fPcd6rasFtyYSIqWfu+aagKzED
         E+og==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776973472; x=1777578272;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=jh1fu2b+Mu/f91JhQcIvoSz3dYZEeq4RNZS+9V85IHQ=;
        b=I2Nu5Y7HISubm03ZJtZbu9BPieUdFka6tC4oW2i3U4i2o86pH33m5RoO3XP9sXaKHR
         jCk+Z+KZW7YxF29RnjgjU2wukDOk8gNKbnXKygILkjpOnTH5/tGqY2j5bafR1YK35+CR
         mJzAm3DwqCUApAOoXe3rsGeX8MlvqfLl0EqGCCiCw9v9/90nriNxN1uxLSuiCDHfkupj
         ohXrZWVWsZfWfs9RLo6XQqOVQqF3vWRHqusUc6XHZFniF5Ckhf63T7e9XwaqbL2An9ix
         PA9WUmTjcT1C7WKWhhAr0vdO4FRHYd1X2cuc1ETLkrbbNPV4ZPjDVUhvTU/v6CQVwEa/
         SH+g==
X-Forwarded-Encrypted: i=1; AFNElJ9zo2Gdw9+PmNbIa1m40+VFaDD98ruSblw2EqArk76ex+WxD5mCC69SH1qfVIV+iNbuQnFHRnqHxiyDptwYeT1R@lists.infradead.org
X-Gm-Message-State: AOJu0Yx5tvICcqsWG0ATMk57z3ExzXPN4f77SsfPjiyt/LgmRq4QzvGx
	vfEAAGW50ZctzdODiNByskQ9XpvIT09KA9w4knX/SRY9IwF/xglNwR0gs0O5s7X3z/C2fHw7pvm
	l9yeLhCN87g==
X-Received: from dlber13.prod.google.com ([2002:a05:7022:264d:b0:12c:1286:e1ba])
 (user=irogers job=prod-delivery.src-stubby-dispatcher) by 2002:a05:7022:f016:b0:12c:44a5:fb54
 with SMTP id a92af1059eb24-12c73f66c7fmr14080662c88.7.1776973471658; Thu, 23
 Apr 2026 12:44:31 -0700 (PDT)
Date: Thu, 23 Apr 2026 12:43:57 -0700
In-Reply-To: <20260423161006.1762700-1-irogers@google.com>
Mime-Version: 1.0
References: <20260423161006.1762700-1-irogers@google.com>
X-Mailer: git-send-email 2.54.0.545.g6539524ca2-goog
Message-ID: <20260423194428.1846255-1-irogers@google.com>
Subject: [PATCH v4 28/58] perf syscall-counts-by-pid: Port syscall-counts-by-pid
 to use python module
From: Ian Rogers <irogers@google.com>
To: acme@kernel.org, adrian.hunter@intel.com, james.clark@linaro.org, 
	leo.yan@linux.dev, namhyung@kernel.org, tmricht@linux.ibm.com
Cc: alice.mei.rogers@gmail.com, dapeng1.mi@linux.intel.com, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	linux-perf-users@vger.kernel.org, mingo@redhat.com, peterz@infradead.org, 
	Ian Rogers <irogers@google.com>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260423_124433_495576_33D6CD3D 
X-CRM114-Status: GOOD (  17.91  )
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

Rewrite tools/perf/scripts/python/syscall-counts-by-pid.py to use the
python module and various style changes. By avoiding the overheads in
the `perf script` execution the performance improves by more than 3.8x
as shown in the following (with PYTHON_PATH and PERF_EXEC_PATH set as
necessary):

```
$ perf record -e raw_syscalls:sys_enter -a sleep 1
...
$ time perf script tools/perf/scripts/python/syscall-counts-by-pid.py perf
Install the python-audit package to get syscall names.
For example:
  # apt-get install python3-audit (Ubuntu)
  # yum install python3-audit (Fedora)
  etc.

Press control+C to stop and show the summary
Warning:
1 out of order events recorded.

syscall events for perf:

comm [pid]/syscalls                            count
 ---------------------------------------  ----------

perf [3886080]
  1                                           538989
  16                                              32
  203                                             17
  3                                                2
  257                                              1
  204                                              1
  15                                               1
  0                                                1

perf [3886082]
  7                                                1

real    0m3.852s
user    0m3.512s
sys     0m0.336s
$ time python3 tools/perf/python/syscall-counts-by-pid.py perf
Warning:
1 out of order events recorded.

syscall events for perf:

comm [pid]/syscalls                           count
 --------------------------------------- -----------

perf [3886080]
  write                                      538989
  ioctl                                          32
  sched_setaffinity                              17
  close                                           2
  openat                                          1
  sched_getaffinity                               1
  rt_sigreturn                                    1
  read                                            1

perf [3886082]
  poll                                            1

real    0m1.011s
user    0m0.963s
sys     0m0.048s
```

Assisted-by: Gemini:gemini-3.1-pro-preview
Signed-off-by: Ian Rogers <irogers@google.com>
---
v2:

1. Removed Unused Variable: Removed id_keys which was assigned but
   never read.

2. Fallback for Unknown Syscalls: If perf.syscall_name() returns None
   for an unmapped ID, it now falls back to the numeric ID string to
   prevent TypeError crashes during string formatting.

3. Fallback for Syscall Number Attribute: It now checks for
   __syscall_nr first, and if missing, falls back to checking for nr .

4. Robust Process Resolution: Added a try-except block around
   session.process(sample.pid).comm() to handle untracked PIDs
   gracefully instead of crashing on a TypeError .

5. Restored PID Filtering: The script now attempts to parse the
   positional argument as an integer to filter by Process ID. If that
   fails, it treats it as a command name (COMM) string to filter by,
   restoring behavior from the original legacy script.

6. Support for Custom Input Files: Added a -i / --input command-line
   argument to support arbitrarily named trace files, removing the
   hardcoded "perf.data" restriction.
---
 tools/perf/python/syscall-counts-by-pid.py | 88 ++++++++++++++++++++++
 1 file changed, 88 insertions(+)
 create mode 100755 tools/perf/python/syscall-counts-by-pid.py

diff --git a/tools/perf/python/syscall-counts-by-pid.py b/tools/perf/python/syscall-counts-by-pid.py
new file mode 100755
index 000000000000..45a98e6e8e01
--- /dev/null
+++ b/tools/perf/python/syscall-counts-by-pid.py
@@ -0,0 +1,88 @@
+#!/usr/bin/env python3
+# SPDX-License-Identifier: GPL-2.0
+"""
+Displays system-wide system call totals, broken down by syscall.
+If a [comm] arg is specified, only syscalls called by [comm] are displayed.
+"""
+
+import argparse
+from collections import defaultdict
+import perf
+
+syscalls: dict[tuple[str, int, int], int] = defaultdict(int)
+for_comm = None
+for_pid = None
+session = None
+
+
+def print_syscall_totals():
+    """Print aggregated statistics."""
+    if for_comm is not None:
+        print(f"\nsyscall events for {for_comm}:\n")
+    elif for_pid is not None:
+        print(f"\nsyscall events for PID {for_pid}:\n")
+    else:
+        print("\nsyscall events:\n")
+
+    print(f"{'comm [pid]/syscalls':<40} {'count':>10}")
+    print("---------------------------------------- -----------")
+
+    sorted_keys = sorted(syscalls.keys(), key=lambda k: (k[0], k[1], k[2]))
+    current_comm_pid = None
+    for comm, pid, sc_id in sorted_keys:
+        if current_comm_pid != (comm, pid):
+            print(f"\n{comm} [{pid}]")
+            current_comm_pid = (comm, pid)
+        name = perf.syscall_name(sc_id) or str(sc_id)
+        print(f"  {name:<38} {syscalls[(comm, pid, sc_id)]:>10}")
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
+    pid = sample.sample_pid
+
+    if for_pid and pid != for_pid:
+        return
+
+    comm = "unknown"
+    try:
+        if session:
+            proc = session.process(pid)
+            if proc:
+                comm = proc.comm()
+    except (TypeError, AttributeError):
+        pass
+
+    if for_comm and comm != for_comm:
+        return
+    syscalls[(comm, pid, sc_id)] += 1
+
+
+if __name__ == "__main__":
+    ap = argparse.ArgumentParser()
+    ap.add_argument("filter", nargs="?", help="COMM or PID to filter by")
+    ap.add_argument("-i", "--input", default="perf.data", help="Input file name")
+    args = ap.parse_args()
+
+    if args.filter:
+        try:
+            for_pid = int(args.filter)
+        except ValueError:
+            for_comm = args.filter
+
+    session = perf.session(perf.data(args.input), sample=process_event)
+    session.process_events()
+    print_syscall_totals()
-- 
2.54.0.rc2.533.g4f5dca5207-goog


