Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 03008FF886F
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 28 Apr 2026 07:21:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=FIUPQnj9Sm31hxCjwi2GzFaWFVwRkKGchfSFKojE+/g=; b=0nY+wmvH+GjjrWOB2Sa4/mmPPr
	dYezSXWC7p47qtdMmBPUr4TGCG5WAwX9bClVfKJfgZmSUP53ppcBiY2KU3RKcCv9qxfnX/GDJagjR
	ClOeONclTV51eEdB51j3xrr0iyIoxPgpvHF5q12YMcDrMYJtYRvgX2iWtOTRW0b9mspAQ3Zj+sX4k
	yrr1/9Vl77EtSKT7ouDFwt2L77IQk3JpdoR8du5wvgtODW9l/rUCUZk4S/1uxR1CMBMr84/joCU9B
	QQzJ5JJkLj35xo6N9XqPS5BrXNE2LTtYdIIQxs9Fbz2do9jHib3nwsuzhQmNoC3E9QpSYPCmIpdtw
	AjzkdJng==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wHckk-00000000i2O-3ofM;
	Tue, 28 Apr 2026 07:21:06 +0000
Received: from mail-dy1-x1349.google.com ([2607:f8b0:4864:20::1349])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wHcjx-00000000h8G-13Xg
	for linux-arm-kernel@lists.infradead.org;
	Tue, 28 Apr 2026 07:20:20 +0000
Received: by mail-dy1-x1349.google.com with SMTP id 5a478bee46e88-2d889997495so29603694eec.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 28 Apr 2026 00:20:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1777360814; x=1777965614; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=FIUPQnj9Sm31hxCjwi2GzFaWFVwRkKGchfSFKojE+/g=;
        b=IzyuSfeREby9WatSEH9ExEH2S8vVpILQSawYir4wH+vftidFhFzgWNlqrQDdK3kG6D
         sVz+OMoYb81GtkbYDSptAvakVD3mG8fmXZn4YOF3TcyS1jcETn31573jVQ4txET4Wbj+
         7kx2KbZ3e+w65uAxueW/0zRijVqQclXD1WsZWDvOiSNg/34U4URAjFNEyDl8ZPKJRaoN
         nCPMXOegmv310FeSVG/VcVhM8x2OvS1JoyA2YJxY+L8UZUJUBHLNwhnJiX40zjg33J/D
         wgCYqEdCoJ22KNnswcGMY7VHE8ibY4ZI8FvtbZ7E+m0VIGT7npzrfjwQ0UYbzUGewjDi
         BsZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777360814; x=1777965614;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=FIUPQnj9Sm31hxCjwi2GzFaWFVwRkKGchfSFKojE+/g=;
        b=SpH0S99UpNTpqIpDjiIKqJirMR55UgCA9QWre+pVpGugbnqvPYZ7i6L5weHSIum71H
         1NxvrBAWALCdLue9bZ4c6AYsS5DaiVI8+FB5XtdZPcjTXqOQFYHrbD995Bh24nn5frii
         meyktfv7wqe899ORpVvDNsFZCGzuVaSKmUkYl//k+Vqlbh/LDuyKUftE8lC4Isofo8EC
         EXN+DkjaP3Lox6osVGQMgHHZt+KFX3Z2gdX1FfKe1YdwBgBdg8LYOnQa0L4NE5CcJhFC
         HP3039kpSPaNhDOqd7w4kzpGUrFyoh9N0pvEo6qhxwio7XVnlUDHRwb5IqI6uffghlUv
         vXcg==
X-Forwarded-Encrypted: i=1; AFNElJ+ynGuzXSCChlXz0QzGKIsep2jalmDL9AxzXWrY7T2cOVJIC/ikpGIrPQt6zxVak+N3ug78jrF3Oh2D+SpPlsgx@lists.infradead.org
X-Gm-Message-State: AOJu0Yy9zyl5S4tEcrhtM/aPM2ws1Py6OQu7btdDegril7PvtFPjjNyw
	PGHdmwVZaMr1Sk2GlcOk+c2FC3lvUJw0bCriD9qqmlxJddAVUCLHR5eomiLvb6jO8yvDnwtYNIU
	S0wtutOtcUA==
X-Received: from dycoy3.prod.google.com ([2002:a05:7301:fc03:b0:2e0:fe68:96c7])
 (user=irogers job=prod-delivery.src-stubby-dispatcher) by 2002:a05:7300:3b06:b0:2e1:f72:3f18
 with SMTP id 5a478bee46e88-2ed09fe6f94mr1039140eec.1.1777360814160; Tue, 28
 Apr 2026 00:20:14 -0700 (PDT)
Date: Tue, 28 Apr 2026 00:18:33 -0700
In-Reply-To: <20260428071903.1886173-1-irogers@google.com>
Mime-Version: 1.0
References: <20260425224951.174663-1-irogers@google.com> <20260428071903.1886173-1-irogers@google.com>
X-Mailer: git-send-email 2.54.0.545.g6539524ca2-goog
Message-ID: <20260428071903.1886173-29-irogers@google.com>
Subject: [PATCH v8 28/58] perf syscall-counts-by-pid: Port syscall-counts-by-pid
 to use python module
From: Ian Rogers <irogers@google.com>
To: acme@kernel.org, namhyung@kernel.org
Cc: adrian.hunter@intel.com, alice.mei.rogers@gmail.com, 
	dapeng1.mi@linux.intel.com, james.clark@linaro.org, leo.yan@linux.dev, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	linux-perf-users@vger.kernel.org, mingo@redhat.com, peterz@infradead.org, 
	tmricht@linux.ibm.com, Ian Rogers <irogers@google.com>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260428_002017_397353_FC44D7C6 
X-CRM114-Status: GOOD (  18.89  )
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
index 000000000000..ff962334a143
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
+            proc = session.find_thread(pid)
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
2.54.0.545.g6539524ca2-goog


