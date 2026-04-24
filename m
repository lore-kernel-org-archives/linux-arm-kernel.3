Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 807EBFED3F1
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 24 Apr 2026 16:50:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=k73fGGVkXWNX8HDud6GwbWbiqkfMF7AuYUe+cubGpoI=; b=aZ0Ksgm36FS7NNZsDxWNbIQBF2
	EFy/vAqsEfdycouc8EE/6P9dhFKGsK4J6YgwHXJBD4uVLHR3QJY7CA75sAVFMq3Q8IFzZntvT8XOf
	05JSZjfuxPYmO8h5eZAmAIoE9zULkzSVvz9swfO+SGUAXf7TrupfSXp5O8rwdj4Thdo+L5SgySV+I
	CoytTPC30b9nxQbCj6kRvsPxhP1ecqA7CC9YouJ5wmdJ11a2C6DY7CUjjbWZZslKbYOP1F1dKXlLz
	VLbBUm2TWdpKZ3IiG34SDt/OHhgpDRc5lxiuoGZJsx9Qa/gk4WPE6LqZeWMZGnjWol0zcqeBxSbL7
	DfiydNqw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wGJjV-0000000DVoG-3Eqc;
	Fri, 24 Apr 2026 16:50:25 +0000
Received: from mail-dl1-x1249.google.com ([2607:f8b0:4864:20::1249])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wGJiE-0000000DUPt-2rzG
	for linux-arm-kernel@lists.infradead.org;
	Fri, 24 Apr 2026 16:49:21 +0000
Received: by mail-dl1-x1249.google.com with SMTP id a92af1059eb24-12c8de02a4dso9866906c88.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 24 Apr 2026 09:49:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1777049345; x=1777654145; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=k73fGGVkXWNX8HDud6GwbWbiqkfMF7AuYUe+cubGpoI=;
        b=aoYlOyN1Qb07ovavsxzx1gUZytcE5zXkr8aFXazFlSdePi9smeLouSNMTH5VlPDjR4
         5iDMpRU39q08Wuq7224XGG9sY/+mim0Fs4X2mPA+Oe1ADUgtzZVX1TTaZDDrZ2w80uuK
         t3kIU6hoBfVoOE8hA7gCoG5dDi+9fUomaGvzlyOAMKTOSOT6UTtSVHNJtUIh/3B2cLOt
         1TEhrRYrWtz6DCj9Ak/O2f/DQr4m9rQZyZZrUto9lwq8GZcU+g0w4v95VCxcMLtrHUZi
         rWXCHjRU9xq8HVMlJZoyFJHRofYTOX+wM+nNSid8bbW2mDB7wqbH5GfLnxwiHPOxNMRg
         oaMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777049345; x=1777654145;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=k73fGGVkXWNX8HDud6GwbWbiqkfMF7AuYUe+cubGpoI=;
        b=i069qeO6OmvlYVv39Q6JhdZBIvZakjn/kXRdDDj+85WJEL35/pa6EkGWQBAeSVCvSG
         PE/woSzyDgB9Oj9OQkKa83RFAjuDqCnjS6PLZn03pfKKZYPI7g20Rl/9LyLmnHkG0HrB
         b835xMS8NhjCkc4LWXKtbO2WYME2aHWBdld0mEDkN611J0Mes4zhAM8dyb+Q38cTjHpM
         KTQttEmCqlnsaeLXYEenvQVM9uOiXykgdKbtNzXpgViHr4Lp6olo4GVJkucV8Rn152n4
         VOhcd/2GcP9PZ+3qrzXLGVXtqFStLzQc5EUBsLHI9oCVfoSUGKT31F5RiKdy5BEIGTF+
         ITHw==
X-Forwarded-Encrypted: i=1; AFNElJ8ZSB49Psf91QLgCw4cW3fSFaKNDzmGOZAP1Btl8jc30PbSXAv4oVNTb7w/AogZqpgNu5DlQMcegDMDMXiwsyvZ@lists.infradead.org
X-Gm-Message-State: AOJu0YwWkZQadXscxGB14ghoRGBsb43+qbZfEaiohSXbIx5blHR//oEp
	yL+LQKffngImFUCo1R8Y1dlIltt2JSByjFZyZmaPkedxtyg28jFD+tlAWPSHsOCeHJaleKd2HSF
	LpZ6ESZyuqg==
X-Received: from dlbvg2.prod.google.com ([2002:a05:7022:7f02:b0:12a:9ef0:93ed])
 (user=irogers job=prod-delivery.src-stubby-dispatcher) by 2002:a05:7022:ff45:b0:128:d2a5:709c
 with SMTP id a92af1059eb24-12c73fb3381mr19393812c88.33.1777049345271; Fri, 24
 Apr 2026 09:49:05 -0700 (PDT)
Date: Fri, 24 Apr 2026 09:47:00 -0700
In-Reply-To: <20260424164721.2229025-1-irogers@google.com>
Mime-Version: 1.0
References: <20260423163406.1779809-1-irogers@google.com> <20260424164721.2229025-1-irogers@google.com>
X-Mailer: git-send-email 2.54.0.545.g6539524ca2-goog
Message-ID: <20260424164721.2229025-39-irogers@google.com>
Subject: [PATCH v5 38/58] perf failed-syscalls-by-pid: Port
 failed-syscalls-by-pid to use python module
From: Ian Rogers <irogers@google.com>
To: acme@kernel.org, adrian.hunter@intel.com, james.clark@linaro.org, 
	leo.yan@linux.dev, namhyung@kernel.org, tmricht@linux.ibm.com
Cc: alice.mei.rogers@gmail.com, dapeng1.mi@linux.intel.com, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	linux-perf-users@vger.kernel.org, mingo@redhat.com, peterz@infradead.org, 
	Ian Rogers <irogers@google.com>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260424_094907_325126_4CA21E4E 
X-CRM114-Status: GOOD (  14.61  )
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

Ported from tools/perf/scripts/python/failed-syscalls-by-pid.py to use
the perf Python module API.

Key changes:
- Used perf.syscall_name() to resolve syscall names instead of legacy
  Util library.
- Used standard collections.defaultdict for nested statistics
  aggregation.
- Used errno.errorcode for resolving error strings.
- Supported optional filtering by COMM or PID via command line
  arguments.

Assisted-by: Gemini:gemini-3.1-pro-preview
Signed-off-by: Ian Rogers <irogers@google.com>
---
v2: Fixed Syscall Name Fallback: Handled the case where
    perf.syscall_name() returns None , falling back to the string
    representation of the syscall ID to avoid TypeError during string
    formatting.
---
 tools/perf/python/failed-syscalls-by-pid.py | 119 ++++++++++++++++++++
 1 file changed, 119 insertions(+)
 create mode 100755 tools/perf/python/failed-syscalls-by-pid.py

diff --git a/tools/perf/python/failed-syscalls-by-pid.py b/tools/perf/python/failed-syscalls-by-pid.py
new file mode 100755
index 000000000000..1a8c9bb7e90c
--- /dev/null
+++ b/tools/perf/python/failed-syscalls-by-pid.py
@@ -0,0 +1,119 @@
+#!/usr/bin/env python3
+# SPDX-License-Identifier: GPL-2.0
+"""
+Displays system-wide failed system call totals, broken down by pid.
+If a [comm] or [pid] arg is specified, only syscalls called by it are displayed.
+
+Ported from tools/perf/scripts/python/failed-syscalls-by-pid.py
+"""
+
+import argparse
+from collections import defaultdict
+import errno
+from typing import Optional
+import perf
+
+
+def strerror(nr: int) -> str:
+    """Return error string for a given errno."""
+    try:
+        return errno.errorcode[abs(nr)]
+    except KeyError:
+        return f"Unknown {nr} errno"
+
+
+class SyscallAnalyzer:
+    """Analyzes failed syscalls and aggregates counts."""
+
+    def __init__(self, for_comm: Optional[str] = None, for_pid: Optional[int] = None):
+        self.for_comm = for_comm
+        self.for_pid = for_pid
+        self.session: Optional[perf.session] = None
+        self.syscalls: dict[tuple[str, int, int, int], int] = defaultdict(int)
+        self.unhandled: dict[str, int] = defaultdict(int)
+
+    def process_event(self, sample: perf.sample_event) -> None:
+        """Process a single sample event."""
+        event_name = str(sample.evsel)
+        if "sys_exit" not in event_name:
+            return
+
+        pid = sample.sample_pid
+        if hasattr(self, 'session') and self.session:
+            comm = self.session.process(pid).comm()
+        else:
+            comm = "Unknown"
+
+        if self.for_comm and comm != self.for_comm:
+            return
+        if self.for_pid and pid != self.for_pid:
+            return
+
+        ret = getattr(sample, "ret", 0)
+        if ret < 0:
+            syscall_id = getattr(sample, "id", -1)
+            if syscall_id == -1:
+                syscall_id = getattr(sample, "sys_id", -1)
+
+            if syscall_id != -1:
+                self.syscalls[(comm, pid, syscall_id, ret)] += 1
+            else:
+                self.unhandled[event_name] += 1
+
+    def print_summary(self) -> None:
+        """Print aggregated statistics."""
+        if self.for_comm is not None:
+            print(f"\nsyscall errors for {self.for_comm}:\n")
+        elif self.for_pid is not None:
+            print(f"\nsyscall errors for PID {self.for_pid}:\n")
+        else:
+            print("\nsyscall errors:\n")
+
+        print(f"{'comm [pid]':<30}  {'count':>10}")
+        print(f"{'-' * 30:<30}  {'-' * 10:>10}")
+
+        sorted_keys = sorted(self.syscalls.keys(), key=lambda k: (k[0], k[1], k[2]))
+        current_comm_pid = None
+        for comm, pid, syscall_id, ret in sorted_keys:
+            if current_comm_pid != (comm, pid):
+                print(f"\n{comm} [{pid}]")
+                current_comm_pid = (comm, pid)
+            try:
+                name = perf.syscall_name(syscall_id) or str(syscall_id)
+            except AttributeError:
+                name = str(syscall_id)
+            print(f"  syscall: {name:<16}")
+            err_str = strerror(ret)
+            count = self.syscalls[(comm, pid, syscall_id, ret)]
+            print(f"    err = {err_str:<20}  {count:10d}")
+
+
+if __name__ == "__main__":
+    ap = argparse.ArgumentParser(
+        description="Displays system-wide failed system call totals, broken down by pid.")
+    ap.add_argument("-i", "--input", default="perf.data",
+                    help="Input file name")
+    ap.add_argument("filter", nargs="?", help="COMM or PID to filter by")
+    args = ap.parse_args()
+
+    F_COMM = None
+    F_PID = None
+
+    if args.filter:
+        try:
+            F_PID = int(args.filter)
+        except ValueError:
+            F_COMM = args.filter
+
+    analyzer = SyscallAnalyzer(F_COMM, F_PID)
+
+    try:
+        print("Press control+C to stop and show the summary")
+        session = perf.session(perf.data(args.input), sample=analyzer.process_event)
+        analyzer.session = session
+        session.process_events()
+        analyzer.print_summary()
+    except KeyboardInterrupt:
+        analyzer.print_summary()
+    except Exception as e:
+        print(f"Error processing events: {e}")
-- 
2.54.0.545.g6539524ca2-goog


