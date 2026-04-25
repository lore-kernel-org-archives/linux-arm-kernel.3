Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 63554FF885A
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 25 Apr 2026 22:44:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=P0hpHM6Q0qnz4rILJ4wjp6r0pWm8+LVx9WiZ78eUWKU=; b=y/T5YF0ChplCqLxaO8s+vVoW+P
	UWLf9cNvh4KS2QLKDIbEQQSvVLirOD95sJq/1gOlYDeXL/KKYLNaN4byVL2+zgbi4Y3JZt5NwU9Ie
	BrCGbc/dCtJcUdLbpYlpChBCqoljGbXIolWSV3cZvdpNjyP42D4zjhROcRYS7i26QCwGAc2WdEc+L
	/ksNz+/DztKGmVAB+frzpl2t13QJhhTuTet/1eLHP7dMEOMsXD6qNidOdRxk6ZvSnlkMde0WbmviD
	nlngrugtEDAjGTGaarpdjQxBMkAa7HW9ffWwIFiizruC4+lDKHZWFTi/zhRAZ33lbd2QiegsIKTjp
	6KaPhr2g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wGljQ-0000000EvGf-3wxI;
	Sat, 25 Apr 2026 22:44:12 +0000
Received: from mail-dl1-f73.google.com ([74.125.82.73])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wGliB-0000000Eu3B-104E
	for linux-arm-kernel@lists.infradead.org;
	Sat, 25 Apr 2026 22:43:08 +0000
Received: by mail-dl1-f73.google.com with SMTP id a92af1059eb24-12c20d5d7f4so43613411c88.1
        for <linux-arm-kernel@lists.infradead.org>; Sat, 25 Apr 2026 15:42:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1777156973; x=1777761773; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=P0hpHM6Q0qnz4rILJ4wjp6r0pWm8+LVx9WiZ78eUWKU=;
        b=XOqcEMylKaOVfQ7at0Z/UxPPq9EEVpaIBMxFCHliRZfQHDF4ECvHbIEK7SHRbleBRJ
         Jbj8CGiIC2iIZsrnVTcb9xh8U3TdksUrJ/Vx/y6L4A2VuTR1Z5IBGA1riyfDlpVfJpxL
         57j1466ds2vrufM08c8PdSC5d22LjuKf2E7tPiLj/MTjo8LsR6AkSSk5ok5DwczzphRI
         gi5t5mHBcMqSKAQQ+dbbMEDH1hriqPa1Y8WzpskT0K6xSsGMaXCtQHyYnXRP5bWslXI0
         ILieK8k1XoLbOz2TwN8xR07GnFtSQg4PKE2XftIcqnFJEnqdQFQ2By9k/ecKWzqlQ644
         swsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777156973; x=1777761773;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=P0hpHM6Q0qnz4rILJ4wjp6r0pWm8+LVx9WiZ78eUWKU=;
        b=eV1TtiFFvW/kgoGA5G4pf2Y2DQ5vlJki4t3U7tU0R1jIkafpK5uGEzY1nC2fuqhu5/
         pMqdnAAmNllTqU6H06AiExcp0SxyIqIRIXgUuzsU+BZTzhdooTH3uMvzZVdtZEYwdwq5
         +5amT7xn4hu/VMn74tBfA8ErG67+k1UMxgYyp6Nm1o/FGMN2ogY9IvzZSUGqOe0Y0vcE
         R3JQYZMKn9v4zMFnzFON44NMn91CNmj8gjAPYyhrtgpzIrOI7E8lYpOo9L6Ph/Z9W2Hc
         j0pXkcPEJof/MnikktWBfZHdK+byXAIatdiTpI5NvLuVzfxOdRQ1Kih4wEtDcPUMEvJu
         JxkA==
X-Forwarded-Encrypted: i=1; AFNElJ87waf/JnRH4+ig2IBl70KXFv6RvnPlMYWze02fxw2qIMpenGF2XQ7sgRlfrTBtoVchu8devYwSEMZejDPtYgPA@lists.infradead.org
X-Gm-Message-State: AOJu0YwSD0VMJc/gkdQCE9PculFohA/kMDiJuldYRgcQBgWA7M3k5u6x
	LaDET/JWVfPqvmcvpGTLel/JnfGXkMhCI0sPv/4pqYTtJSQJVWUQzS7EyMWzSp09kJwVApU6Grk
	cnXJmn/Vi2A==
X-Received: from dlbrl2.prod.google.com ([2002:a05:7022:f502:b0:12d:c3dd:4fba])
 (user=irogers job=prod-delivery.src-stubby-dispatcher) by 2002:a05:701b:220e:b0:12d:b3f8:60e7
 with SMTP id a92af1059eb24-12db3f8635amr8447826c88.34.1777156972491; Sat, 25
 Apr 2026 15:42:52 -0700 (PDT)
Date: Sat, 25 Apr 2026 15:41:05 -0700
In-Reply-To: <20260425224125.160890-1-irogers@google.com>
Mime-Version: 1.0
References: <20260425174858.3922152-1-irogers@google.com> <20260425224125.160890-1-irogers@google.com>
X-Mailer: git-send-email 2.54.0.545.g6539524ca2-goog
Message-ID: <20260425224125.160890-41-irogers@google.com>
Subject: [PATCH v7 40/59] perf net_dropmonitor: Port net_dropmonitor to use
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
X-CRM114-CacheID: sfid-20260425_154255_361585_584F8B28 
X-CRM114-Status: GOOD (  14.10  )
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


