Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3C724FF8862
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 25 Apr 2026 17:52:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=d1ZQn0wiqS3ZLhKCfNDpGe4fGnfL2Ccr7WxKmLqZsJ4=; b=qYHv6au6H2j7rRIqbVGpL0Zfow
	VRLi7ffickXI/1zHbQYYjFS5qErTHiwU2j6aQZ++LfQjFBVbMG0ZOXFgfcGB97VlzIWsQnQ/xzc9t
	1ev5kgxZBoMkSoE1DShe/frpGHVLDIxT5Y2NotQ6VR5pLrs/aByCzmeieMvWCPg8l+44qgpLbQbHI
	jGZl2trI8djcf5EOz83zWtK6pgomlRQdFmiUI0rZ+pJm/Hw8fcImOm29ywF7jF7zU5Pfoj6TfMcev
	8qFB8vstNGKAqci+a9qylteDMlTGOQZckS9S+/PVCEWxTq9f9/Zk9aNR4L4QzlAeFEB56u3DsG6Jg
	O9rRPYIw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wGhBP-0000000Ef3R-38kt;
	Sat, 25 Apr 2026 17:52:47 +0000
Received: from mail-dl1-x124a.google.com ([2607:f8b0:4864:20::124a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wGh92-0000000EdLV-14dJ
	for linux-arm-kernel@lists.infradead.org;
	Sat, 25 Apr 2026 17:50:40 +0000
Received: by mail-dl1-x124a.google.com with SMTP id a92af1059eb24-12c8ccc7593so10316513c88.1
        for <linux-arm-kernel@lists.infradead.org>; Sat, 25 Apr 2026 10:50:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1777139419; x=1777744219; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=d1ZQn0wiqS3ZLhKCfNDpGe4fGnfL2Ccr7WxKmLqZsJ4=;
        b=Q3hiWZzJBm84j6h6S+zFvWSXOesvhwpISM0ESHCHqo/m5kdCDir/byV111M/KLHXeI
         M07flHVzu5kLn6y4lt52nSx3SgxG8/bGXq0iQTT5OxPWRu/N15h6ne61tUigs4myAmIw
         i96EZ/bFCpkULCKJPA1w78QhukbBZKoFJXo0bcGSf8+MZ0HlmxQP8iau/P6MPl6M/+ic
         35FyLfymcB58CzsVImEOntGOiNQp9hhIpGPOslCN97yUymCTo/NQmyII5Q8o0NdFeMEK
         w4TEgUDP7CZhptEBgJtcOjzyY/iKvTRQfFUW9pJnWwho54wA8TZNKrpekzZFpMicIkC8
         u4WQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777139419; x=1777744219;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=d1ZQn0wiqS3ZLhKCfNDpGe4fGnfL2Ccr7WxKmLqZsJ4=;
        b=FVmi3jORPvxf3O7uAMn/H+KZ+vkrtt/+oYSfiCktuR/Xn0CUk5SYA/FHARFrlEnNLL
         nsljoHJ+8EnJuWh27NOq3yuwigRnesFl3j8XGrgizPWtPO+BNw/JqnBeyX5Llo8tZSm3
         77dTaf2EwrHsPDY0aFFJtBBwGJ6vIgaPVxA8UXZ4WEC6oY34fxuh3Jj09bsMuuGBZJXF
         0SmcuotSgkC1w3jP1x6JP+GkgJfZ6tToLCvi/xldM16NrN9nOAqdUzLI/5JYWl2+slYn
         w4zXXygqCX/QreAKQ2VpkETvCqgRJMrnla8d36rhHwen8BBNh/CoXBNFuezDMzq+1j2B
         goLQ==
X-Forwarded-Encrypted: i=1; AFNElJ9baaMR0hMTIXY4FJJmpMzlvE8bVL5GFBbrhaZ/96vmmjuaKKkwzk3PgmTTCQm5heezYjst+S6H2A3bvTo98e3o@lists.infradead.org
X-Gm-Message-State: AOJu0Yz5x2Kan+vVNzCkC5TrD78c3i3XBjeA0OsB7jmvVCVRpxU3P7PG
	ID/adv6GROSsRYIPzJ8VMm98kaGEUBxKA6bA/g4Hl85c3ZFt+Fb32mlvwrJykmppEh6YdihT6mv
	pzhMMtC9cvA==
X-Received: from dlea13-n1.prod.google.com ([2002:a05:701b:420d:10b0:12d:bf5c:266])
 (user=irogers job=prod-delivery.src-stubby-dispatcher) by 2002:a05:7022:f99:b0:128:d219:e169
 with SMTP id a92af1059eb24-12c73f712acmr19351213c88.10.1777139417071; Sat, 25
 Apr 2026 10:50:17 -0700 (PDT)
Date: Sat, 25 Apr 2026 10:48:36 -0700
In-Reply-To: <20260425174858.3922152-1-irogers@google.com>
Mime-Version: 1.0
References: <20260424164721.2229025-1-irogers@google.com> <20260425174858.3922152-1-irogers@google.com>
X-Mailer: git-send-email 2.54.0.545.g6539524ca2-goog
Message-ID: <20260425174858.3922152-39-irogers@google.com>
Subject: [PATCH v6 38/59] perf failed-syscalls-by-pid: Port
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
X-CRM114-CacheID: sfid-20260425_105020_552753_35517D18 
X-CRM114-Status: GOOD (  14.76  )
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
index 000000000000..f57b13c5d34f
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
+            comm = self.session.find_thread(pid).comm()
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


