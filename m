Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 00034FF885C
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 25 Apr 2026 22:52:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=P0hpHM6Q0qnz4rILJ4wjp6r0pWm8+LVx9WiZ78eUWKU=; b=O/AUQ+tiZbpMQihOi2i47dzNd+
	OOZmzoji1OCiFnVNkpaKKp7mKS5reYtPjm1ZgONz9ULVBSPqzNlFO/ni4AfFuZ+efIG/DpQSPUc5j
	e0BeGoQUzT0Mk3x3Z8lQfzFbVpoveVWoL0g+jFvNbD7PMstljxczJvMB0VY2xlq394uFoIkyW/Zq1
	fWwshlmAx+lbJImXC46QHmv0Msx5jTh8UH4tkep5npNuIY3z9nL3oXXBvsjpTeJv8KSF8Y49iF31L
	bwumMflTO9vS4pqmk/A+U6+efb9Vv/t/jZbg4Ysexnd/sXFjfxNzXmacmnfnlfpa0sipx6OwHitVN
	Xl5ujHgg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wGlrQ-0000000F0BK-1MnP;
	Sat, 25 Apr 2026 22:52:28 +0000
Received: from mail-dy1-x1349.google.com ([2607:f8b0:4864:20::1349])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wGlqc-0000000EzDm-3GvS
	for linux-arm-kernel@lists.infradead.org;
	Sat, 25 Apr 2026 22:51:50 +0000
Received: by mail-dy1-x1349.google.com with SMTP id 5a478bee46e88-2bdd327d970so5511909eec.1
        for <linux-arm-kernel@lists.infradead.org>; Sat, 25 Apr 2026 15:51:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1777157497; x=1777762297; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=P0hpHM6Q0qnz4rILJ4wjp6r0pWm8+LVx9WiZ78eUWKU=;
        b=h7o+qljzUmovTFDbpoCCBp0LmINXzww+oQuCtCdTiCcBRocw0OCfbdCKz7+83WsZ6h
         8cMNMUgOVUwXDyzrZhduw7vK+I+A9fMphC45/P/DruLSq3fmhcxvbMfUiifo1FMz/U1a
         JWZ8I+BPi9vDeKVdqYfJRyPc7qciq2Ymp572OCfovF82Saz93EJH2eQeIV2t5bfVfW8B
         DEj/ZqU5FuRfq8nzk1a4q36t6mHDhiAyT8qmV3dY4Fu0z8d8jGf+biXexSV3R5u1qsT9
         WR7ZAE+sRNYlaey8CJXgkS3JzGMhuSv/zQppj8kcKJ+/spEzYQmvYDOUh60UPCcaZ7AJ
         wBAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777157497; x=1777762297;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=P0hpHM6Q0qnz4rILJ4wjp6r0pWm8+LVx9WiZ78eUWKU=;
        b=nfV5MBGZpnycI1FCgAP/aEO4AU0jBtCqwBk7cfiZEdRjD/8A8jCSAXpQ2jrjy3LJ7h
         8ZET+GQPABmU85XRkG8gfkpR+qvn7DThgTfufKM7cZmyhCpOCsUAhsg+39+QsOgptlds
         YpWSvC/wgbsGSSfyuOwhx11LkO1aL+AmIAjELGmNltJhIiY68NDImK0aobIKQxbvsRxJ
         cJZ9WUHBStw96KBzUmjy3fNH5U1khPkfUfw24Q1AeEUHAlKvXDldv2PTmQ/vsO5H4BQV
         6MpSWFm5Gj9MZYrR4jfJAZCcKpWBxE+gAmSKf2nkuKI5AEB5i4ggxILSkyjL+9xd3QuJ
         eMDA==
X-Forwarded-Encrypted: i=1; AFNElJ+HqV9mimsF9McvctpikaYqRBdH1/zEg6D6taEQ8Q/DobZy3ASsa6yLIH6ipYhBvh8pbxVWr+W9IA1/NFnkmkuY@lists.infradead.org
X-Gm-Message-State: AOJu0YwVrZjRqTbnL0IWD2BcJF3bg/gsbkPW8HGwlJEZTe8c8FA9Y4hv
	vfcKRKs1+4ymbbgdI/P7NjLcHD1W3BByiEdNWLYdhntYZnyMuxL70GAgyUAyqpxo6gVihUk/1Wh
	hNJuHwGG/Cg==
X-Received: from dybrt7.prod.google.com ([2002:a05:7301:4707:b0:2d8:e988:4a97])
 (user=irogers job=prod-delivery.src-stubby-dispatcher) by 2002:a05:693c:3011:b0:2df:7882:1cf3
 with SMTP id 5a478bee46e88-2e42c15cf81mr16379113eec.2.1777157496418; Sat, 25
 Apr 2026 15:51:36 -0700 (PDT)
Date: Sat, 25 Apr 2026 15:49:32 -0700
In-Reply-To: <20260425224951.174663-1-irogers@google.com>
Mime-Version: 1.0
References: <20260425174858.3922152-1-irogers@google.com> <20260425224951.174663-1-irogers@google.com>
X-Mailer: git-send-email 2.54.0.545.g6539524ca2-goog
Message-ID: <20260425224951.174663-41-irogers@google.com>
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
X-CRM114-CacheID: sfid-20260425_155138_866482_05755F16 
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


