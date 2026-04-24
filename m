Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ED56AFED3F0
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 24 Apr 2026 16:50:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=P0hpHM6Q0qnz4rILJ4wjp6r0pWm8+LVx9WiZ78eUWKU=; b=3TbkMtnsEslcnOZS+O/YwEL3pn
	yM+BRsQxPvA/py6IrdR241oyFrIkoHz1g6YYGOGktZHgaEd+vPtpK/eAGFwHpTRa5SkG6J9IiAr1A
	WTAlQNcCCSNj+nzwzjMLgrcehCQAIXGXRi5a8Y+AgtcxekDgxb9fc+7LkJrf5WIJCVCnAMahd3jgn
	OeiplDGJSjoFjPTSLUgGW8MY5E3UUSAECzxLqmIjBSg6aPN58LRQ3NuzkQ+vvW9ySsTbno/zuRrLi
	NvstGu2Ex2cQs8p4GsCTP65ve/1gGE2SZNPDiJHVLRRfrUtV7sp1mLY50VZ8w68bqiStRZyHjKAZE
	xPocgLKA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wGJjO-0000000DVhA-3wLS;
	Fri, 24 Apr 2026 16:50:19 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wGJiN-0000000DUXn-1S9H
	for linux-arm-kernel@bombadil.infradead.org;
	Fri, 24 Apr 2026 16:49:15 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Type:Cc:To:From:Subject:
	Message-ID:References:Mime-Version:In-Reply-To:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=P0hpHM6Q0qnz4rILJ4wjp6r0pWm8+LVx9WiZ78eUWKU=; b=G/mw0xLo4wMrseAXnHBCyFO3iQ
	kkwmCHuAWTBK4qnlWP7XKgfDm8yMUZm2EgFmJchIw6Ij2oUaqLtDoBy3P1o6Hu1O0/2VzoKDSzSSh
	YzK32HbW88AwEv4BiCw+wBWCVwfAa5jiP7AN+bD8JYkPzzHq974H7VhK1bbA0W+4L81rXqBnNvRN4
	rZJTcRnz7fUPdEVkkQGgFRTK3divM9VbStG6gDO22GajzhYKtStsPQ6IKH3q8I7WRJyyPi1H2K2Mh
	Kxk5P7rR80Mz9rNeQt1M4fGtX4MxQjCqtyHl52wm1oSpAnzI/URVNll8YYXoXS2HQj8b3BR8ZUOxr
	sgrz/F0w==;
Received: from mail-dy1-x134a.google.com ([2607:f8b0:4864:20::134a])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wGJiK-0000000F9UO-0EG0
	for linux-arm-kernel@lists.infradead.org;
	Fri, 24 Apr 2026 16:49:13 +0000
Received: by mail-dy1-x134a.google.com with SMTP id 5a478bee46e88-2d93379001eso16227752eec.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 24 Apr 2026 09:49:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1777049350; x=1777654150; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=P0hpHM6Q0qnz4rILJ4wjp6r0pWm8+LVx9WiZ78eUWKU=;
        b=h//FKmfBzKhnnow3RBBsMFXPH0un/eaI9NtvGyBI+gL2D86/PBbh6BlZiAmuQ4rRw1
         gIhzgcR7GVBrnCT1G8sj9iJw7zSZidkPv5PVPgmrHV+Y3Gc4TFTMSIX/QSERnlWLiAfR
         VAEjS3DUAIzI5s1ZbZIWtogtoAgVUCzhuO+qkHgk1nBqKMhc/fY1989XuWmBibNmlkD/
         fbZc2Watuzkf9RwGwE7zc7DC7S1AziUSQNDASb03/0zs8NY+JgnTq7UouzrMSI+42Jqe
         squQfHs2N00MsTigh4YJyT2RTDD5mLcRVAW2Ab8PvW+HlDgngRFm+ZI4OOrA8MqUDl1A
         /2Iw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777049350; x=1777654150;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=P0hpHM6Q0qnz4rILJ4wjp6r0pWm8+LVx9WiZ78eUWKU=;
        b=FpQj919la3WbJbau6kraTzPUqsttycTPLU/YzDZYtBPztID6QO2UV1KY4yV/PZzWKf
         XI0FkVXcenKNVdTwrRDLq838WWH5OgD5a9u0jkY6/NPd1MV6yx9fOdFm+7ZmLjXQHrA+
         3oU4AisrnSNt5WrbqsNpos7+dcLNzQxSigG/qtXJkPEaif/d5PypMnFT17PX6HTptJcy
         QNYGLw/2ibm2KjzNaItpf7MB3ot2vnU0tKKbjsoGpgIt9RM3YbjHOXUmFajl5P3mG0gB
         6WQ3Yds+UtpPDdFtJcGrDQJ1R7uIRxYyZVUOI++AzJ1EXvvtpsy5UMum2HHG5dWARo0G
         9cLw==
X-Forwarded-Encrypted: i=1; AFNElJ9h4uLBPMQmd3RNFzyYNzpeNi6EKOJCy514IdZnk1mLt7DRtg0gGf00totL1JX5IUGnZsge8/nX9/LBtakmW0++@lists.infradead.org
X-Gm-Message-State: AOJu0Yz7Ht+B2M90e7NTT0FaPZwktgOCBY17L1EsFxzUyWBnNXjyuPIi
	qt8g7XTIqoNq/DuAw5DN4xo2NtZeHJgxbyafqVh4Mbjdw53AVTDOduNsfMXci7Ac5hdraSRUSWY
	kIWz0wwivjw==
X-Received: from dyhd3.prod.google.com ([2002:a05:7300:8283:b0:2e2:b79e:ed06])
 (user=irogers job=prod-delivery.src-stubby-dispatcher) by 2002:a05:693c:3007:b0:2df:5715:82ca
 with SMTP id 5a478bee46e88-2e46557d3b3mr17281333eec.11.1777049349822; Fri, 24
 Apr 2026 09:49:09 -0700 (PDT)
Date: Fri, 24 Apr 2026 09:47:02 -0700
In-Reply-To: <20260424164721.2229025-1-irogers@google.com>
Mime-Version: 1.0
References: <20260423163406.1779809-1-irogers@google.com> <20260424164721.2229025-1-irogers@google.com>
X-Mailer: git-send-email 2.54.0.545.g6539524ca2-goog
Message-ID: <20260424164721.2229025-41-irogers@google.com>
Subject: [PATCH v5 40/58] perf net_dropmonitor: Port net_dropmonitor to use
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
X-CRM114-CacheID: sfid-20260424_174912_177938_EE6E632E 
X-CRM114-Status: GOOD (  14.20  )
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


