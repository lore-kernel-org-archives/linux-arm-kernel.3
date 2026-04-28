Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B27D7FF8875
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 28 Apr 2026 07:23:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=22aR7BdMkfc4F5hxQy/Qmu6pnO70TcMwJUmCFfE13QY=; b=02+LPQqfFhiGJeTahFm1LlY3La
	yZA9ophViQjEfF40Bw0GstCoU262hwiEf9rYXVG+Lu7SZl2YHllbKqfXTDqe4MeQ9gJuaYrM4D7dT
	0u/g53C7o0/Ws13QxePfCCLsG4Qy6hLTzvEbxElrdnB3IneE3+mdxsU83bPIXl/Erx3u2iZ2pcgw1
	eIdkWVowvkd9RcIkGRJjJNJTNcrBpDVG6FX9KNKDH+h1IK7WVcZQ1/BVZuODreSX7ZsLqsn7Qvz7m
	YgK3ku283+qEbl6x5MQ/YQFh3OfaaR8qVi5ixRxOe91UWxX6xeJufee37pFEswK02HPYLlXjzeccP
	0n38+D1g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wHcmq-00000000kDN-3gOK;
	Tue, 28 Apr 2026 07:23:16 +0000
Received: from mail-dl1-f73.google.com ([74.125.82.73])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wHcka-00000000hnZ-13mF
	for linux-arm-kernel@lists.infradead.org;
	Tue, 28 Apr 2026 07:21:12 +0000
Received: by mail-dl1-f73.google.com with SMTP id a92af1059eb24-12c20d5d7f4so53960826c88.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 28 Apr 2026 00:20:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1777360854; x=1777965654; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=22aR7BdMkfc4F5hxQy/Qmu6pnO70TcMwJUmCFfE13QY=;
        b=l4LdrQQ8gVDC5tPx2k9vlIK5Zum+MjbsWgxx8aF9754RPAENtxuqtdmMRwUD2ifAg+
         wRaIGnJpBVe8AsdA6lLOAAxUPeRg6DoLL6T5B4/tVVwPoWYJrs0EwBi3yuHaPnu5DCLn
         yRq6OcrtnqdmdfTD8UIj2Ye9nbmu67aHDfFXDw4IKVaOwPjSgFR6w0jCPOT2DX5a+Jl8
         5LSzAenhSQUgZWNJj6ETQAgN+znp40R+sCR1otUjpgjYWnUNM19jmaiXlk80pGU611/L
         kFLXE8sxf/4JgrE/Xxi9WYSTqu69gGn9iVOElEWC8qur6SNIliPgjqQQi7p5JEuvD7Yd
         thow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777360854; x=1777965654;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=22aR7BdMkfc4F5hxQy/Qmu6pnO70TcMwJUmCFfE13QY=;
        b=FepH8fNTrCuwPJ4Q/IPGKCEns7Pu196xxZNGNnFPTSNpTOPbd1ZKah4R+GHkbuRE3T
         /NCUBJc4XsOT5sGpe0Qt8XPdB3HnW39oUNqa1A75KUEeU5lzCPMcuPWVKcHxpurtLKbq
         q+fOdmxqHgg9MIgIm/zd+itpIX5tcazeph5kBGUyRhTH5S8+ZgAlx48KPbhQUUedeXug
         ly+5nqTdD2+EBNB+/8EN6revhGnSWA44irS6YJxzS9+16XVdOrENSZrhVZQzD26mYtqU
         mONuK8SW7faJjXjxzxmsDjMgcud/TqWuATNdR2VCBxkRRywOW7pFKQ7q8LFcETpjnjk4
         bmNA==
X-Forwarded-Encrypted: i=1; AFNElJ+jdhAmweh4S5Z+weRgESBi6GXUJ/pwnfxtsAOd0+RKcfw/W1Ps6hJ10/63Mx8XpoG1wgD6YfFnSvvYsTuwzFrE@lists.infradead.org
X-Gm-Message-State: AOJu0YyLcLrqc8kLTFGTPPI/YPjothNHL+bvsHSN6kJfydN2nyMpf3On
	wHLXudFqbC8L9qcNStidiblgcPyQTadh+1O/LTZw+HzsUi9WzuVlmFG3ia63tJ4OVF7jgCU4HRD
	/mmu6srKymg==
X-Received: from dlbvg6.prod.google.com ([2002:a05:7022:7f06:b0:12d:b396:eadf])
 (user=irogers job=prod-delivery.src-stubby-dispatcher) by 2002:a05:7022:4188:b0:11b:1c7e:27d0
 with SMTP id a92af1059eb24-12ddd8b0339mr1040319c88.0.1777360853370; Tue, 28
 Apr 2026 00:20:53 -0700 (PDT)
Date: Tue, 28 Apr 2026 00:18:52 -0700
In-Reply-To: <20260428071903.1886173-1-irogers@google.com>
Mime-Version: 1.0
References: <20260425224951.174663-1-irogers@google.com> <20260428071903.1886173-1-irogers@google.com>
X-Mailer: git-send-email 2.54.0.545.g6539524ca2-goog
Message-ID: <20260428071903.1886173-48-irogers@google.com>
Subject: [PATCH v8 47/58] perf failed-syscalls: Port failed-syscalls to use
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
X-CRM114-CacheID: sfid-20260428_002056_388477_5BA44B28 
X-CRM114-Status: GOOD (  15.76  )
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

Port the legacy Perl script failed-syscalls.pl to a python script
using the perf module in tools/perf/python.

The new script uses a class-based architecture and leverages the
perf.session API for event processing, making it a standalone script
that reads perf.data files.

It filters for sys_exit events, checks for failed syscalls (where
return value ret < 0), and aggregates counts per command name.

Complications:
- The script is designed for file-based processing using perf.session.
- pylint warns about the module name not being snake_case, but it is
  kept for consistency with the original script name.

Assisted-by: Gemini:gemini-3.1-pro-preview
Signed-off-by: Ian Rogers <irogers@google.com>
---
 tools/perf/python/failed-syscalls.py | 78 ++++++++++++++++++++++++++++
 1 file changed, 78 insertions(+)
 create mode 100755 tools/perf/python/failed-syscalls.py

diff --git a/tools/perf/python/failed-syscalls.py b/tools/perf/python/failed-syscalls.py
new file mode 100755
index 000000000000..c3b58664eb57
--- /dev/null
+++ b/tools/perf/python/failed-syscalls.py
@@ -0,0 +1,78 @@
+#!/usr/bin/env python3
+# SPDX-License-Identifier: GPL-2.0
+"""Failed system call counts."""
+
+import argparse
+from collections import defaultdict
+import sys
+from typing import Optional
+import perf
+
+class FailedSyscalls:
+    """Tracks and displays failed system call totals."""
+    def __init__(self, comm: Optional[str] = None) -> None:
+        self.failed_syscalls: dict[str, int] = defaultdict(int)
+        self.for_comm = comm
+        self.session: Optional[perf.session] = None
+        self.unhandled: dict[str, int] = defaultdict(int)
+
+    def process_event(self, sample: perf.sample_event) -> None:
+        """Process sys_exit events."""
+        event_name = str(sample.evsel)
+        if not event_name.startswith("evsel(syscalls:sys_exit_") and \
+           not event_name.startswith("evsel(raw_syscalls:sys_exit_"):
+            return
+
+        try:
+            ret = sample.ret
+        except AttributeError:
+            self.unhandled[event_name] += 1
+            return
+
+        if ret >= 0:
+            return
+
+        pid = sample.sample_pid
+        assert self.session is not None
+        try:
+            comm = self.session.find_thread(pid).comm()
+        except Exception: # pylint: disable=broad-except
+            comm = "unknown"
+
+        if self.for_comm and comm != self.for_comm:
+            return
+
+        self.failed_syscalls[comm] += 1
+
+    def print_totals(self) -> None:
+        """Print summary table."""
+        print("\nfailed syscalls by comm:\n")
+        print(f"{'comm':<20s}  {'# errors':>10s}")
+        print(f"{'-'*20}  {'-'*10}")
+
+        for comm, val in sorted(self.failed_syscalls.items(),
+                                key=lambda kv: (kv[1], kv[0]), reverse=True):
+            print(f"{comm:<20s}  {val:10d}")
+
+    def run(self, input_file: str) -> None:
+        """Run the session."""
+        self.session = perf.session(perf.data(input_file), sample=self.process_event)
+        self.session.process_events()
+        self.print_totals()
+
+def main() -> None:
+    """Main function."""
+    parser = argparse.ArgumentParser(description="Trace failed syscalls")
+    parser.add_argument("comm", nargs="?", help="Filter by command name")
+    parser.add_argument("-i", "--input", default="perf.data", help="Input file")
+    args = parser.parse_args()
+
+    analyzer = FailedSyscalls(args.comm)
+    try:
+        analyzer.run(args.input)
+    except IOError as e:
+        print(e, file=sys.stderr)
+        sys.exit(1)
+
+if __name__ == "__main__":
+    main()
-- 
2.54.0.545.g6539524ca2-goog


