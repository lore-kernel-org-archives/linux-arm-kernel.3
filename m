Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BA347FF8873
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 28 Apr 2026 07:21:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=P0hpHM6Q0qnz4rILJ4wjp6r0pWm8+LVx9WiZ78eUWKU=; b=CupNQ20POPvNQEGsYplgh5SkSy
	afulE9P84Bmx2Sqgl7kF9mhFsn68e28kmP0b1fqi1r5XgoLrv6bgOVPfEEl6nccY8Sz5AYbsCVabA
	2Z08FU9YQMdGQ4tIDe0JoQuB+DDntoreDxJJEHhMT729oQDyupjRh+VgPgFjL9zC/7TTnrdtNtniy
	Ta4/QWmz/yA+06Q9PHT+or7RZYbGdpMwUZT2mmZ88VaFvFZN9ljhsdGKp8RIXL1tIa0bJAb4dTUld
	axnrwrbdFa/WTp5HLE9PNvyKzPaM/YgOnD1vKY0RQ5GHVTTywLiN98LnpVT8xRxKR1lZnm2GSqGPb
	WCNonEqA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wHclB-00000000iYW-26wr;
	Tue, 28 Apr 2026 07:21:33 +0000
Received: from mail-dy1-x134a.google.com ([2607:f8b0:4864:20::134a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wHckL-00000000hYx-1B7c
	for linux-arm-kernel@lists.infradead.org;
	Tue, 28 Apr 2026 07:20:45 +0000
Received: by mail-dy1-x134a.google.com with SMTP id 5a478bee46e88-2d8c521be48so7390326eec.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 28 Apr 2026 00:20:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1777360840; x=1777965640; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=P0hpHM6Q0qnz4rILJ4wjp6r0pWm8+LVx9WiZ78eUWKU=;
        b=cxtlENdPuC2MjNTue3Z5l9hzdlmDRKcRO468SV4Mw14B+onkmOKaPMPIp6kYoU2syn
         7w+/4pv4ouvLi7l4gZ+GluJcY2TICq3mJgfE3F0IQFMranxFloEneK55uiOSHES3LtuV
         3iubkemioxj5wBwf96oK6zz8Xdewx7oLaCdKKHDfEguAtAHYpasUrnEAGEi5QKHd+mMq
         /5Y4UQAU8A8cSHUMihz4uDOLABe8TYux86U9fIFTLzoH8vTF/HDYvnNbu39xGCSjPY7+
         UPE3iuwnWZOrLjO/oV+YVkwxZRtYre6mFOsHCi45SJ9LChN9L8L/U4hK2z2Em6GOn/j7
         9aEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777360840; x=1777965640;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=P0hpHM6Q0qnz4rILJ4wjp6r0pWm8+LVx9WiZ78eUWKU=;
        b=S/6CgGkm9i1lAGi/5/QSZJYaJdHx/au7AiQK2ydCAiaEq4Fq63hxs5tk/3lfCsinwF
         K2pCUiqK9U6s/FQlt/dzDI1Ja7vW1+lc/lhSN+ghLq85VGQ/+nsoSJ++kmBZCXHo9J7A
         ScLBBKy789+fgX4BOZr5HdhyvqEWmrylaF9bRFunvSlwe93a8IDNvSdzWiJM7BU9rDE2
         zyZ/usEc/BVGH2+yNq9bJrqfBoGHgkIJWonXO9IotxU0uH8MzIYepx69KjXcSRhO/Z50
         Z4nm8DiXTup92sKnQbqWcH2076Ffq2BF+1b3F2LEBl7z8qpXS7MNEnCjXFp2aUBLq67L
         Gb3g==
X-Forwarded-Encrypted: i=1; AFNElJ+dy/Sl8qSn4WkZ2PLnvFK2ldeFJs/HfPGapCZaXfxGFkYCiiGT5KbEFrxsnp2osPoLvMh9QtGsvoOe5zdq/iYr@lists.infradead.org
X-Gm-Message-State: AOJu0YwRIPdtQ3g3vpwAX8UyyzTugx7T2zNW4EFsZniQnQ6XkhYFvazt
	Xx2G7mfBUjq3MZolc2kUFHhCjtAdXjLvwz8QpLv9kJj/ZIpf2jgPY0oKtX9FcetULRcBL4KhcJV
	W8lrKqEY25g==
X-Received: from dlbut2.prod.google.com ([2002:a05:7022:7e02:b0:12c:8ccc:748c])
 (user=irogers job=prod-delivery.src-stubby-dispatcher) by 2002:a05:7022:6181:b0:12d:b2ad:fded
 with SMTP id a92af1059eb24-12ddda6b8bdmr760210c88.10.1777360839734; Tue, 28
 Apr 2026 00:20:39 -0700 (PDT)
Date: Tue, 28 Apr 2026 00:18:45 -0700
In-Reply-To: <20260428071903.1886173-1-irogers@google.com>
Mime-Version: 1.0
References: <20260425224951.174663-1-irogers@google.com> <20260428071903.1886173-1-irogers@google.com>
X-Mailer: git-send-email 2.54.0.545.g6539524ca2-goog
Message-ID: <20260428071903.1886173-41-irogers@google.com>
Subject: [PATCH v8 40/58] perf net_dropmonitor: Port net_dropmonitor to use
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
X-CRM114-CacheID: sfid-20260428_002041_357271_A5918069 
X-CRM114-Status: GOOD (  15.04  )
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


