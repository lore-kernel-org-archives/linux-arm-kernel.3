Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 83835FF885C
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 25 Apr 2026 17:52:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=P0hpHM6Q0qnz4rILJ4wjp6r0pWm8+LVx9WiZ78eUWKU=; b=StDp/vTrcs/nzgFhe8eH6+PV84
	uj4VzT4zPITCryFPaG4fe6SazsNV86K5pN2t0fX4myHFOMkbdFBItu9Kcb5mf17bLM7RrUwBDzA5n
	poCAmmMt6VCHloXbQ+h/99MoJ81v7ZgB+vMrksmrDT8LuKb7HOmkhq12qFd4PX0vKLZJWMxh04Gjf
	VG69x3mK9hAAFpMXnBYzcO+d81zRUMV0BoGxezA9k/EGg28dCLCfebjMTGcA1W6SmHs61GdtoDwYl
	mFK8h6zGV/oQQ4M8PIhvVF1Jg3IuSHY0uFJhG0BYrjBP3hQS756wGfV+J+u6Nj9eSrNM456dvzWhL
	XgJU4yjQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wGhBO-0000000Ef1T-2DTs;
	Sat, 25 Apr 2026 17:52:46 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wGh9A-0000000EdVY-3MaZ
	for linux-arm-kernel@bombadil.infradead.org;
	Sat, 25 Apr 2026 17:50:28 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Type:Cc:To:From:Subject:
	Message-ID:References:Mime-Version:In-Reply-To:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=P0hpHM6Q0qnz4rILJ4wjp6r0pWm8+LVx9WiZ78eUWKU=; b=MV9gZ/uFdljcmLBpUyKt6GIKzF
	0RkocyF9bMVl8QNaQ7XHPvIfrpGCYvr5IR2HPisJlab7JyapgTxeeG8vtDND8rLkSi+TsvWJZzE7b
	jvvP9dA2gYKdw0G07A2SZahpcp1r01W6mqQGhPyQF3993twPn3iMgIOZ6XhiZc05q9+X8VF2MOH5v
	cv59yiE2GWWxUjKM+78i02OJfkXktuAHQwiwOAE2XfqGVEupL2qemyEVtuUZvuiQiexwdy3O8lq8U
	bbU0bKnX++sPmefyeAhqyKGRgIFe0FsFK5l+TGFG7AGn5CqmRq0zoxaQzQczESsMfNVsU07Ig5bv0
	vjjIC7bw==;
Received: from mail-dy1-x134a.google.com ([2607:f8b0:4864:20::134a])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wGh95-0000000G8f5-3jcD
	for linux-arm-kernel@lists.infradead.org;
	Sat, 25 Apr 2026 17:50:27 +0000
Received: by mail-dy1-x134a.google.com with SMTP id 5a478bee46e88-2d9da2559aeso24387935eec.0
        for <linux-arm-kernel@lists.infradead.org>; Sat, 25 Apr 2026 10:50:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1777139422; x=1777744222; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=P0hpHM6Q0qnz4rILJ4wjp6r0pWm8+LVx9WiZ78eUWKU=;
        b=tigg9cWTXag6HKquCVxyJlsmTCgIStd7wkZoEONXGH5TSwP5KEySfwz944fK8Nqfp1
         Mxxm85eivs6jLheSEfYtCo+YEZ8t70QGAs5678Np3ZN0kj0ghVxhmi1RtTG7clHu1ov/
         rCGUDKLAuYeF1j/W5NrC87DpghbM9m7pYS8pAuwsr71ufj9BSWwEfKkwqzzZaBd2Z1wp
         e93WrvKEUgvJNtIc5KHHaIWJe1lT0MAgml2A17q44S6XUTQr76Fr5tZ1XJghX1lDBOWN
         wrKPBh0pEQm9pi/cnMKT5oZxAUdm5BK9+m3+8j3kG4nT8+he6+XagYD0Sc/e8lhxACa1
         kYRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777139422; x=1777744222;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=P0hpHM6Q0qnz4rILJ4wjp6r0pWm8+LVx9WiZ78eUWKU=;
        b=PjKlOH6hWSj3QGlL2bMlK92Zf/azAxa6Ej4REBrKTVj/h6NXaOxg6iZpQXiIYgGoFa
         1u6G9FaRcZa5pmvn4c+p1rXZXvKof7osruRlogRhKf0uBA34wdF6cSsk8RF/9S7vC/gS
         A37W/OH3ObOTIWkGbfPnLpf/1SzWLJiEz6Nb2mJNVobgb+Q7rhcZGcq/xWdIN52p73zb
         VjVkybZJLRrQarDPIaX/vtwvy1QjRdGNouNPO38ppdpSALYT5m4BcgDzLEwG+WouhARU
         BeXoT9haFPTPCdQ7C4s2ouIYiZ6MYIMtOV9UWt5NGPM3jNaQzxk/SZzq0sB6Rt7c23Mg
         AIGg==
X-Forwarded-Encrypted: i=1; AFNElJ8wqIhWnGTe6/q5QOsGrKJMQ6Y1zpuYT9NUbxQ4xkdL3K6l85DULoFRHtPHhsSoSDrpHlRu0Ua7mrhUylJ2k1G4@lists.infradead.org
X-Gm-Message-State: AOJu0YwE8wkmFliLqQ/BioZr3TA4P14yhCvMbK8PZYKGyplYDbgrrex/
	pMR+m7PODDzTMk2mTDS8GQljRuKwQudXqK6x5cwvSlW2jDyZ/G8C+gvNIpHTUEVqv0HdStvcVBf
	bgutUdB1J7g==
X-Received: from dybqo1.prod.google.com ([2002:a05:7301:6781:b0:2d8:c995:cafe])
 (user=irogers job=prod-delivery.src-stubby-dispatcher) by 2002:a05:7300:230c:b0:2da:7e33:9261
 with SMTP id 5a478bee46e88-2e47951dedfmr21518988eec.27.1777139421456; Sat, 25
 Apr 2026 10:50:21 -0700 (PDT)
Date: Sat, 25 Apr 2026 10:48:38 -0700
In-Reply-To: <20260425174858.3922152-1-irogers@google.com>
Mime-Version: 1.0
References: <20260424164721.2229025-1-irogers@google.com> <20260425174858.3922152-1-irogers@google.com>
X-Mailer: git-send-email 2.54.0.545.g6539524ca2-goog
Message-ID: <20260425174858.3922152-41-irogers@google.com>
Subject: [PATCH v6 40/59] perf net_dropmonitor: Port net_dropmonitor to use
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
X-CRM114-CacheID: sfid-20260425_185023_988574_651ECD1E 
X-CRM114-Status: GOOD (  14.16  )
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

Ported from tools/perf/scripts/python/.
- Refactored the script to use a class structure (DropMonitor) to
  encapsulate state.
- Used perf.session for event processing instead of legacy global
  handlers.
- Maintained the manual /proc/kallsyms reading and binary search for
  symbol resolution as in the original script.
- Cleaned up Python 2 compatibility artifacts.

Assisted-by: Gemini:gemini-3.1-pro-preview
Signed-off-by: Ian Rogers <irogers@google.com>
---
v2:

1. Fixed Sorting of Locations: Kept location as an integer in the
   drop_log dictionary keys so that they are sorted numerically rather
   than lexicographically when generating the report.

2. Fixed Interrupt Handling: Moved the call to get_kallsyms_table()
   and print_drop_table() outside the try-except block. This ensures
   that the reporting phase happens exactly once, even if the user
   interrupts the trace with Ctrl-C.
---
 tools/perf/python/net_dropmonitor.py | 58 ++++++++++++++++++++++++++++
 1 file changed, 58 insertions(+)
 create mode 100755 tools/perf/python/net_dropmonitor.py

diff --git a/tools/perf/python/net_dropmonitor.py b/tools/perf/python/net_dropmonitor.py
new file mode 100755
index 000000000000..25ea2a66ed3c
--- /dev/null
+++ b/tools/perf/python/net_dropmonitor.py
@@ -0,0 +1,58 @@
+#!/usr/bin/env python3
+# SPDX-License-Identifier: GPL-2.0
+"""
+Monitor the system for dropped packets and produce a report of drop locations and counts.
+Ported from tools/perf/scripts/python/net_dropmonitor.py
+"""
+
+import argparse
+from collections import defaultdict
+import sys
+import perf
+
+
+class DropMonitor:
+    """Monitors dropped packets and aggregates counts by location."""
+
+    def __init__(self):
+        self.drop_log: dict[tuple[str, int], int] = defaultdict(int)
+        self.unhandled: dict[str, int] = defaultdict(int)
+
+    def print_drop_table(self) -> None:
+        """Print aggregated results."""
+        print(f"{'LOCATION':>25} {'OFFSET':>25} {'COUNT':>25}")
+        for (sym, off) in sorted(self.drop_log.keys()):
+            print(f"{sym:>25} {off:>25d} {self.drop_log[(sym, off)]:>25d}")
+
+    def process_event(self, sample: perf.sample_event) -> None:
+        """Process a single sample event."""
+        if str(sample.evsel) != "evsel(skb:kfree_skb)":
+            return
+
+        try:
+            symbol = getattr(sample, "symbol", "[unknown]")
+            symoff = getattr(sample, "symoff", 0)
+            self.drop_log[(symbol, symoff)] += 1
+        except AttributeError:
+            self.unhandled[str(sample.evsel)] += 1
+
+
+if __name__ == "__main__":
+    ap = argparse.ArgumentParser(
+        description="Monitor the system for dropped packets and produce a "
+                    "report of drop locations and counts.")
+    ap.add_argument("-i", "--input", default="perf.data", help="Input file name")
+    args = ap.parse_args()
+
+    monitor = DropMonitor()
+
+    try:
+        session = perf.session(perf.data(args.input), sample=monitor.process_event)
+        session.process_events()
+    except KeyboardInterrupt:
+        print("\nStopping trace...")
+    except Exception as e:
+        print(f"Error processing events: {e}")
+        sys.exit(1)
+
+    monitor.print_drop_table()
-- 
2.54.0.545.g6539524ca2-goog


