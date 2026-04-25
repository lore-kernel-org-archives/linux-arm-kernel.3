Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0BB8EFF885A
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 25 Apr 2026 22:44:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+1e9d0GFF8QSKEFlq8avcbJMHsTR7P2tC3S887pI/aQ=; b=GW3OBu6krCykhXnUv3ovIQORSe
	IZhBaKLeel4EvRdB9qV4Ff9dpMv9b/IRmgEna39xE58Bh2jjxA3K48TxP0OWy0maZvBCaHOerjKSB
	fqhdjJfmXpHYdXuZ5zz7112vGLRqQZkDGsyaq5un14d5XmUNsPZYhfVTCRZHBJ2HbcshFWZao+hx9
	Wj/e8Y9Lq/rKd8rP4uLhwozOIUTdzVjuIGBladVgatwUSvEhr05fW0W5UpRvYKa0zpKIz9hs88mcT
	Qfhfh+/2Ul9At4i34976dfXjn6NlfQ0vvnNAkDd7oUA/0LdGAlQuCNlhepdMhpjPpwsBXryAensfz
	3c0R9STg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wGljO-0000000EvDN-2vTw;
	Sat, 25 Apr 2026 22:44:10 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wGliD-0000000Eu6I-0Drp
	for linux-arm-kernel@bombadil.infradead.org;
	Sat, 25 Apr 2026 22:42:57 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=Content-Type:Cc:To:From:Subject:
	Message-ID:References:Mime-Version:In-Reply-To:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=+1e9d0GFF8QSKEFlq8avcbJMHsTR7P2tC3S887pI/aQ=; b=O8P/CYMNHr/IKb8nrcpshJ2WvZ
	m/vaoVSE9+nC8RXK/V3U5xMllKh+zKdUKxXZJcvbSShdpNbQTvJVC3IRnrta/CbUdwPlmQ15uNKnE
	boke7oe7U8DraCgqeCjeGIVyItqFVEH93AI2nWXHcnKvuMnSbJ1lp0g2qr5uu8KTrOK8ZoWhFxktk
	3qDY71H5KWJFkgnsQ8URkgNRFqOEtM/F5GBNx/T3rzspIho3K8MQ5pz6vyiG3Ib+QF/g0OqA+/pp6
	eWSMCX7U9DRSqIZE0rf6YEDMzm6OyZU8PlaBReLtIssErezIn1RzeQjlKVsWh3+0gTBTicw4Iyt9U
	lfoYHayg==;
Received: from mail-pf1-x449.google.com ([2607:f8b0:4864:20::449])
	by casper.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wGli8-0000000HK7I-2YY1
	for linux-arm-kernel@lists.infradead.org;
	Sat, 25 Apr 2026 22:42:55 +0000
Received: by mail-pf1-x449.google.com with SMTP id d2e1a72fcca58-82f74bcfb86so10885024b3a.0
        for <linux-arm-kernel@lists.infradead.org>; Sat, 25 Apr 2026 15:42:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1777156969; x=1777761769; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=+1e9d0GFF8QSKEFlq8avcbJMHsTR7P2tC3S887pI/aQ=;
        b=wVQICmoLhSs3+Yio0Pls3RMQ0LUEVuxEalvNXvSL+/E2DJaNMgC7dNvqT80N2n2V4A
         qtFjksDsf1k37a6Oqj5OIXA7hD16C6S5jStL6WQq5Ks7KiVD9Wle2tELUazpCyCemTat
         vj2XA5aHgZqtggEqfZ9x9Q4Fa9qdCWH5RIn1YLvCXwaN2UtC1y8VYw4VYQzfSA1XEu9z
         BxY4gAPDrQjfqy/NUvEZNSeK31CJexqglPd8NjlrJpOTLUfGmiWEHSwzHbLtazP1eI8x
         b4wwpeXn9QoPwIWRbPQqZVXFrEmnxQcZNHlzWPIc+L52rlgJtsPh/QCLnFnQmsMgqk+8
         3X8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777156969; x=1777761769;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=+1e9d0GFF8QSKEFlq8avcbJMHsTR7P2tC3S887pI/aQ=;
        b=ie3BeG/9n7aacHGIhjYdoim1LA7E6r9qmboHfyKMRItXYgLyTwsGoJwz80mIMIZL2y
         niy/6TGLDjhShH+cVLImnGQ/8C+Sptaax9KGOD++DErRnGEt4g6P79m3unNDQc6jH8t5
         TSZoQVv3bPlbLFBKl1cn/d+rb0yp8/eGwLvqZTpTlJpWl5ntdTRmTvMINfGmD3idUHPP
         mp2y+3enTmE3TLODx/kO8l4xIvGc7ZQX7aOEFc1Nj9EnTcYc7cGxY7aKwCxBcblf7KZN
         q57lnaxwNBX5MfAnU+tIIaDCRjFVCJ3E+6ih3gbEh+xT2gnKvdo81o/5t5P1AFV73hTJ
         XIQw==
X-Forwarded-Encrypted: i=1; AFNElJ+S/YtRl0NVLqhU9zT66XMogh3BaFXISZXmLYickntxnO1p3VvF3MD9UGm6NhaPPIXykcpWqA54e+mS2OTs38WK@lists.infradead.org
X-Gm-Message-State: AOJu0YwKhLrym4oNCLROpgTP1PDQDb2zA+yX7vfGN9zHEZy+ytwbsdPm
	hRz/mIaHNXkTv4tSzQohog/HUYVY1mjGPB8U0IYmykZ1thQsclxkNw2JZZTZa2xjOTLoW0fD69I
	PLJP4nNybAQ==
X-Received: from pfaq12.prod.google.com ([2002:a05:6a00:a88c:b0:82a:108d:4308])
 (user=irogers job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6a00:90a7:b0:82c:9c90:54cf
 with SMTP id d2e1a72fcca58-82f8c95bec4mr37522938b3a.43.1777156968868; Sat, 25
 Apr 2026 15:42:48 -0700 (PDT)
Date: Sat, 25 Apr 2026 15:41:03 -0700
In-Reply-To: <20260425224125.160890-1-irogers@google.com>
Mime-Version: 1.0
References: <20260425174858.3922152-1-irogers@google.com> <20260425224125.160890-1-irogers@google.com>
X-Mailer: git-send-email 2.54.0.545.g6539524ca2-goog
Message-ID: <20260425224125.160890-39-irogers@google.com>
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
X-CRM114-CacheID: sfid-20260425_234252_684852_33A6C7FD 
X-CRM114-Status: GOOD (  12.18  )
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


