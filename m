Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8B686FF8870
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 28 Apr 2026 07:21:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=uUuqjywSMoBiuUZB5eMXpVGDru/SJ2JbsKc572+eD7Q=; b=IvvXt1Uf36eiXp2ioECHccP7cy
	5QbrS96QYYbtMKczMZ5cVwfpJoA8bSPi+w5k4fxq7X5qgOvTCjkV814A0rZ6KK9VkoIZZ/kEAQnub
	qCIp/Z/Sh47a07okoiG6kXHA7kuQHVktm5coCKIFoH+R2BGvZjKnd/i7QI9fnJ62jTa/8Uk5SvKf1
	SUYofJCaK39Zhq0Vam6C9INeYmcW1kE5dT1RmZhDnp5qerWVAM5p0Jili5I5ubzkvx2uKls38H0ru
	vCaIaNjndy9GG/fje1jmvRL1Vmo9NkA3dCReL3Rx58U27eg/LdnyOY8EhzYD4EhO9BpmjqmGuM85f
	pWGIWJ6w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wHckj-00000000i0L-2Koj;
	Tue, 28 Apr 2026 07:21:05 +0000
Received: from mail-dl1-x124a.google.com ([2607:f8b0:4864:20::124a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wHcjw-00000000h6c-1XxF
	for linux-arm-kernel@lists.infradead.org;
	Tue, 28 Apr 2026 07:20:17 +0000
Received: by mail-dl1-x124a.google.com with SMTP id a92af1059eb24-12dc1c0b7ccso3710150c88.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 28 Apr 2026 00:20:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1777360813; x=1777965613; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=uUuqjywSMoBiuUZB5eMXpVGDru/SJ2JbsKc572+eD7Q=;
        b=fBepIbNpb6kbbEt3efldh+M9+ON7QwAnBQCOA3+WEm7KUrsm3rujzzuZsg0nAgxKbi
         0KKd0Fa3CW9haticxYl9Bxr0ZEoCK8pBzzIWlyZJTYfytHfcg8gHSNEoP/S+9+XwpJV0
         NCpGCSrWJOo7bWP9YyDN7qr45WDVP+tZVu5QfX4HMP6z4bDfv2QlVWJTVqjsvzQ2WtkL
         2ghwmxuX38DYTLcnrjHzgOxknJ9jmS6FTM51OjtglBIp3v3oDmMFcXhFqsCkhDbSJleX
         urx5PyS217IfivSA16ZD9LwZABu8L9OeeavwliIlwWI50wvwfgzy0VSbipyDG2x/8HiV
         mhwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777360813; x=1777965613;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=uUuqjywSMoBiuUZB5eMXpVGDru/SJ2JbsKc572+eD7Q=;
        b=QojWg8/dDho1vsRCv4WLGkWzvq69vYfDQqRrl8WImYNPVCRp5w/yIoWx4fpqM7gMAN
         zCxiQhY+ctCOuyv4cWgZAjQU31m1XfXU4zIdSpMpmmdi2w7nsFsDOrjAGlKmnjGiYSkx
         jDRLkQl8NkWvn3mhJC4aODwvojMLBZ97B0eRE/VqoZJoFm6+QPwsA+e8uXw8BhdKBHWo
         jFXq792B8PNq9Yv3j5yRBIGr15XXd3P6XiXX8WoVthjoH+Z1PtOGVrl9agIVO21V+WER
         kp5Szyxd+KlEqBQWGn32sb7W/H5a/mvmaIMAtl763A7OdqMK2KkR1G4o7baxk27+oa/R
         P0nw==
X-Forwarded-Encrypted: i=1; AFNElJ/4rggsxvA91q2rVi01nZKnIL2CNK0ejwHlpC7xSyv6vw2wmE+QtCfr+CB0iINrctgBCXSaqWXcXzu0/KQ7jwEO@lists.infradead.org
X-Gm-Message-State: AOJu0YxJxo4HEjUYtEmuny+MftaymiQbH78NrH07W9jWS18W1APbr0gR
	hCt8J/xR0fWVgQaAKJgjhSCpv6Fu7l5qHZnme8Xd/xKqprUnRaZyzW++aeESOVe5Md/0Y2CTo44
	ZsQ6gF7tbVA==
X-Received: from dlbpv4.prod.google.com ([2002:a05:7023:904:b0:12d:b3cc:a807])
 (user=irogers job=prod-delivery.src-stubby-dispatcher) by 2002:a05:7022:4584:b0:12c:9037:5126
 with SMTP id a92af1059eb24-12ddda69489mr736767c88.9.1777360812328; Tue, 28
 Apr 2026 00:20:12 -0700 (PDT)
Date: Tue, 28 Apr 2026 00:18:32 -0700
In-Reply-To: <20260428071903.1886173-1-irogers@google.com>
Mime-Version: 1.0
References: <20260425224951.174663-1-irogers@google.com> <20260428071903.1886173-1-irogers@google.com>
X-Mailer: git-send-email 2.54.0.545.g6539524ca2-goog
Message-ID: <20260428071903.1886173-28-irogers@google.com>
Subject: [PATCH v8 27/58] perf syscall-counts: Port syscall-counts to use
 python module
From: Ian Rogers <irogers@google.com>
To: acme@kernel.org, namhyung@kernel.org
Cc: adrian.hunter@intel.com, alice.mei.rogers@gmail.com, 
	dapeng1.mi@linux.intel.com, james.clark@linaro.org, leo.yan@linux.dev, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	linux-perf-users@vger.kernel.org, mingo@redhat.com, peterz@infradead.org, 
	tmricht@linux.ibm.com, Ian Rogers <irogers@google.com>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260428_002016_580604_51BFE105 
X-CRM114-Status: GOOD (  18.27  )
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


