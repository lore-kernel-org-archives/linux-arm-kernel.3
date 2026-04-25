Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 68F30FF885C
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 25 Apr 2026 22:52:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+1e9d0GFF8QSKEFlq8avcbJMHsTR7P2tC3S887pI/aQ=; b=OBtYsx6SOBVxEfhHRsmuY7Oij6
	abJX+QEHGVDy4zlyfnwT+ZnC13hO8WuJ1+TKxU0yYAuuNj1Aq2DL2q7oeLEjyn/P9NegwvaxY6MtB
	e5lEe2XtCs0/UPAmSP4ij4bvLzTUx2oWmknIHZJ+htQBzdpac47gIrwQBRZRqbYHB8kGzNg3Uqt9h
	AZE0VMZsPQLaHcxitihizaAL9iBWQ1EZ3E7pAiMCV8b2VMAxdEnA88dpsBhlYchZ5TI4CfUJ7jIPK
	O6DOTqtdp0MQE85NFTAstvvKhaahkuTPnYhPbqEOqlh+9mOt16fL0l0qso4PidGrIr70+R12OogAq
	9dEzLbNw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wGlrV-0000000F0HZ-23Uw;
	Sat, 25 Apr 2026 22:52:33 +0000
Received: from mail-dy1-f202.google.com ([74.125.82.202])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wGlqY-0000000Ez8y-2cMa
	for linux-arm-kernel@lists.infradead.org;
	Sat, 25 Apr 2026 22:51:48 +0000
Received: by mail-dy1-f202.google.com with SMTP id 5a478bee46e88-2de07c12745so25490294eec.1
        for <linux-arm-kernel@lists.infradead.org>; Sat, 25 Apr 2026 15:51:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1777157492; x=1777762292; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=+1e9d0GFF8QSKEFlq8avcbJMHsTR7P2tC3S887pI/aQ=;
        b=f7uX0hDumKqIjbd88efW5J9VVQlhjZ8olUdhOmvYYE6RjgTEZ7f8z7CNa2j4X2E760
         bw5FeDLphfIF1mDKBMQEswtWk/9UwE1BOOSkKdL6nDNJNXE0iDJVXLe7xXu1gZhPfrD0
         PWZnt0qQnlkWX+rLZu/ldgmcKQys9rVouV6MdUkvdoeuWcnxTEz9rL5LeDcfR9ulyhvy
         Eh/zHfikJ61lX/r0RygWS1Vz/wlqTu5ptG+oTME5xXskffxEAMt5rXGrXoGL2wMBiHIM
         eM4LT303DgqAwGmjqpZiK8gt63WoFImh89f/mKdKrnjPea6e0oa6GdGO9H84XyGq5OnL
         HdpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777157492; x=1777762292;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=+1e9d0GFF8QSKEFlq8avcbJMHsTR7P2tC3S887pI/aQ=;
        b=nd4xgouvDoUy2QkDNAZNRR0CedzX6bF1eOezo6T4Q7NemCeXmLIn8HTxzal1sRxD9k
         yCBmMduuEzhZUPsKW+S9ANz+ZHhZWmhmNvbC8n8k0svNK1aGKWLQzccCS1p6hBpqcre8
         0WH0wOeMuz7YDaTtciTnIyvVrjxVtlz2TqfhM+Z4p/7lTB2LxV9q6GtHmBWYRW7arv7j
         CkvC4iaXEWLFVpo/5WuCFGltWzTvGs1eYEHKxm+LkLnyxn9fMPgc0Yf7KucrnhgfPOsX
         fCOv0wobXAA6dNS6g8zcPPnPByIM88oy6k2nWsTAYxD4UxeB8x0JCFvJ5CLbhm8qvceG
         tuwQ==
X-Forwarded-Encrypted: i=1; AFNElJ91oTrn5rP7qgUNcG9ETr5i1t7GNgE7FW0fyaSDcteQyIFJv48HxY3f6CwhjUMnoIFhhdE5Lu7RT6w7v42WjjcU@lists.infradead.org
X-Gm-Message-State: AOJu0YzjmCMuTo+nuSopNseAjhQQKG6h+iwpZNse0r40hOiherMKmUz0
	WHSqIzaJxeKB7/T0NnLKM0kFBRHmOE+zNKKT1W9Ln65G/T9AnihMxF7/ZJaXG+5DPSF1ewQRles
	HZ7oZedjq+g==
X-Received: from dlbpv4.prod.google.com ([2002:a05:7023:904:b0:12d:b3cc:a807])
 (user=irogers job=prod-delivery.src-stubby-dispatcher) by 2002:a05:7022:ead1:b0:128:c9fa:4c32
 with SMTP id a92af1059eb24-12c73fa7c10mr21126322c88.28.1777157492022; Sat, 25
 Apr 2026 15:51:32 -0700 (PDT)
Date: Sat, 25 Apr 2026 15:49:30 -0700
In-Reply-To: <20260425224951.174663-1-irogers@google.com>
Mime-Version: 1.0
References: <20260425174858.3922152-1-irogers@google.com> <20260425224951.174663-1-irogers@google.com>
X-Mailer: git-send-email 2.54.0.545.g6539524ca2-goog
Message-ID: <20260425224951.174663-39-irogers@google.com>
Subject: [PATCH v7 38/59] perf failed-syscalls-by-pid: Port
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
X-CRM114-CacheID: sfid-20260425_155134_773896_B90C6097 
X-CRM114-Status: GOOD (  14.57  )
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

v7:
- Removed dead code (unused self.unhandled dictionary).
---
 tools/perf/python/failed-syscalls-by-pid.py | 116 ++++++++++++++++++++
 1 file changed, 116 insertions(+)
 create mode 100755 tools/perf/python/failed-syscalls-by-pid.py

diff --git a/tools/perf/python/failed-syscalls-by-pid.py b/tools/perf/python/failed-syscalls-by-pid.py
new file mode 100755
index 000000000000..eecd553cbf8f
--- /dev/null
+++ b/tools/perf/python/failed-syscalls-by-pid.py
@@ -0,0 +1,116 @@
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


