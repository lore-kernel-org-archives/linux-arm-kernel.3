Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CE008FF8863
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 25 Apr 2026 22:45:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=4vO51mkUv8czx4QMNQNbvlHwQFmUDbpKAVfeUaPjKEk=; b=2G/vNEa6xtS+fdolMeA+N6sSA8
	Wd416oZTXm5U9B+NWTG7pAZBupl8RudYAjSpgJsCIuJKTf34kLrnfG+VK3noRQQ4DbD28fTunXD1i
	gTOsVdlln48SBDa4U9eczevTojehpOoW8fcQjFYhutlbIlyDxnvuldOmTsJExRqpRjTjshb5tsGCO
	uE308dQo2Nwrp5FilL2bJJGeGdwJqYYnYx8bx83sylqx7SsHg10+x/F8nFWfTqKl4gs19MhdRPT7I
	U7nAbkE1KfXNAXE3jPDY7rb39RdkwDme/vEP0H9vmHsV5FAVN0OgVgEOjMtYJYQmrZHq2lM9k+QFb
	S7wjWOuw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wGlkm-0000000EwTf-2HQy;
	Sat, 25 Apr 2026 22:45:36 +0000
Received: from mail-pj1-x104a.google.com ([2607:f8b0:4864:20::104a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wGlkd-0000000EwLt-0lCX
	for linux-arm-kernel@lists.infradead.org;
	Sat, 25 Apr 2026 22:45:28 +0000
Received: by mail-pj1-x104a.google.com with SMTP id 98e67ed59e1d1-358e95e81aeso11431326a91.0
        for <linux-arm-kernel@lists.infradead.org>; Sat, 25 Apr 2026 15:45:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1777157124; x=1777761924; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=4vO51mkUv8czx4QMNQNbvlHwQFmUDbpKAVfeUaPjKEk=;
        b=EmcHOYt86I0FBBZV4rhNAr0/6wocEYp+iopYyuYvzAfFwDWWa/R7ePUIZEWTtMW/aJ
         R71nHBFIteLpjsr0WtsyEQeH8a3YB32e56yCDTM16c13eS5KEeP2EhZMSdjwQOyJipeN
         lpIz/SOjMyAKSsZFifN4KfsxdW+CMTAPrTZ3xQSGAWxb1p0E+zPK9Tz3O/PV+oygGjgY
         +680PoJ6aI6FJWMK8UZMaX7tMlFlE1Z6cdQ+X/WKfkhSyRdOOk/cnI0O4jDZJt5MYc0/
         cYDNa51z44Coj6o1x+7SUM1csAkDM1JjeuYVxHatY/0XYIesIwMrYmjm8mvoROL2xMbf
         Grew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777157124; x=1777761924;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=4vO51mkUv8czx4QMNQNbvlHwQFmUDbpKAVfeUaPjKEk=;
        b=snFeQ6w8hvKniYknulXBHElQAcGgniAvzG48fb9E3cQkWfj6QH0XJOOcr+jxe1luZD
         Bg9JHOMIv1G/kD8OmNQYFI9fusREISncLjn2VidslpBjg2cfLa/pUXHuqsUDR506RaAM
         iECjmQG/vwhqVAFVjxVjhuV1YXpbBxoetk+ZF0tvfZHeNkcKGEPJfl6G/qefSUOEHyZ3
         I1sjNBnRngmiCBHImWHkp3G1eu7JgKM0FZCE89ujmtqTJuWUR1BtW3oJZdpwNCH63gDC
         GMD3QpxHauyYs5kkRlHCxUdKUPfgyKdSJex7yI4hHlWqKXXusitpmRjhPZ1hcH2X4oiZ
         rgAg==
X-Forwarded-Encrypted: i=1; AFNElJ/gFbTeln2vMfkY0MkiG8xVqMWUmP/Bi/bXG6mvShw1/bbN7ZqbCyyVwfXFA6h8jqi8qaH2Ayt7dS51Hf2QPgKJ@lists.infradead.org
X-Gm-Message-State: AOJu0YzavUVztZZ4sS7hNC3m22DgDNNBlJUsod9C0wdEd4E5UBsD1slH
	n8Ezz5xX25DdHtoqzngXvMgmflvYlmz3CNI8egaw3z8l4Dq09+5xPtXTSpcGoh3DTzs0s5n6lzk
	uEICBDLHE6Q==
X-Received: from pgem18.prod.google.com ([2002:a63:9412:0:b0:c79:85be:4c5c])
 (user=irogers job=prod-delivery.src-stubby-dispatcher) by 2002:a17:90a:dfd0:b0:35f:c729:de9b
 with SMTP id 98e67ed59e1d1-3614048ad9dmr39241184a91.20.1777157123571; Sat, 25
 Apr 2026 15:45:23 -0700 (PDT)
Date: Sat, 25 Apr 2026 15:44:55 -0700
In-Reply-To: <20260425224503.170337-1-irogers@google.com>
Mime-Version: 1.0
References: <20260425174858.3922152-1-irogers@google.com> <20260425224503.170337-1-irogers@google.com>
X-Mailer: git-send-email 2.54.0.545.g6539524ca2-goog
Message-ID: <20260425224503.170337-9-irogers@google.com>
Subject: [PATCH v7 51/59] perf wakeup-latency: Port wakeup-latency to use
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
X-CRM114-CacheID: sfid-20260425_154527_288883_FC979FFE 
X-CRM114-Status: GOOD (  15.92  )
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

Port the legacy Perl script wakeup-latency.pl to a python script using
the perf module in tools/perf/python.

The new script uses a class-based architecture and leverages the
perf.session API for event processing.

It measures wakeup latency by tracking timestamps of
sched:sched_wakeup and sched:sched_switch events.

Complications:
- Used min() and max() built-in functions instead of if blocks to
  satisfy pylint recommendations.
- pylint warns about the module name not being snake_case, but it is
  kept for consistency with the original script name.

Assisted-by: Gemini:gemini-3.1-pro-preview
Signed-off-by: Ian Rogers <irogers@google.com>
---
v2:

 - Fixed Wakeup Latency Logic: Modified the script to track wakeup
   timestamps per task (using sample.pid as the key) instead of per
   CPU.  This ensures that context switches are correctly paired with
   the specific task that was woken up, even if multiple tasks are
   woken up on the same CPU or if a task is migrated to a different
   CPU before running.

 - Prevented Memory Growth: Added del self.last_wakeup[next_pid] after
   successful latency calculation to prevent the dictionary from
   growing unbounded over time.

 - Added Error Tracking: Added try-except blocks around tracepoint
   field access in process_event() and tracked missing fields in self.
   unhandled instead of ignoring them.
---
 tools/perf/python/wakeup-latency.py | 88 +++++++++++++++++++++++++++++
 1 file changed, 88 insertions(+)
 create mode 100755 tools/perf/python/wakeup-latency.py

diff --git a/tools/perf/python/wakeup-latency.py b/tools/perf/python/wakeup-latency.py
new file mode 100755
index 000000000000..1b0db115abcf
--- /dev/null
+++ b/tools/perf/python/wakeup-latency.py
@@ -0,0 +1,88 @@
+#!/usr/bin/env python3
+# SPDX-License-Identifier: GPL-2.0-only
+"""Display avg/min/max wakeup latency."""
+
+import argparse
+from collections import defaultdict
+import sys
+from typing import Optional, Dict
+import perf
+
+class WakeupLatency:
+    """Tracks and displays wakeup latency statistics."""
+    def __init__(self) -> None:
+        self.last_wakeup: Dict[int, int] = defaultdict(int)
+        self.max_wakeup_latency = 0
+        self.min_wakeup_latency = 1000000000
+        self.total_wakeup_latency = 0
+        self.total_wakeups = 0
+        self.unhandled: Dict[str, int] = defaultdict(int)
+        self.session: Optional[perf.session] = None
+
+    def process_event(self, sample: perf.sample_event) -> None:
+        """Process events."""
+        event_name = str(sample.evsel)
+        sample_time = sample.sample_time
+
+        if "sched:sched_wakeup" in event_name:
+            try:
+                pid = sample.pid
+                self.last_wakeup[pid] = sample_time
+            except AttributeError:
+                self.unhandled[event_name] += 1
+        elif "sched:sched_switch" in event_name:
+            try:
+                next_pid = sample.next_pid
+                wakeup_ts = self.last_wakeup.get(next_pid, 0)
+                if wakeup_ts:
+                    latency = sample_time - wakeup_ts
+                    self.max_wakeup_latency = max(self.max_wakeup_latency, latency)
+                    self.min_wakeup_latency = min(self.min_wakeup_latency, latency)
+                    self.total_wakeup_latency += latency
+                    self.total_wakeups += 1
+                    del self.last_wakeup[next_pid]
+            except AttributeError:
+                self.unhandled[event_name] += 1
+        else:
+            self.unhandled[event_name] += 1
+
+    def print_totals(self) -> None:
+        """Print summary statistics."""
+        print("wakeup_latency stats:\n")
+        print(f"total_wakeups: {self.total_wakeups}")
+        if self.total_wakeups:
+            avg = self.total_wakeup_latency // self.total_wakeups
+            print(f"avg_wakeup_latency (ns): {avg}")
+        else:
+            print("avg_wakeup_latency (ns): N/A")
+        print(f"min_wakeup_latency (ns): {self.min_wakeup_latency}")
+        print(f"max_wakeup_latency (ns): {self.max_wakeup_latency}")
+
+        if self.unhandled:
+            print("\nunhandled events:\n")
+            print(f"{'event':<40s}  {'count':>10s}")
+            print(f"{'-'*40}  {'-'*10}")
+            for event_name, count in self.unhandled.items():
+                print(f"{event_name:<40s}  {count:10d}")
+
+    def run(self, input_file: str) -> None:
+        """Run the session."""
+        self.session = perf.session(perf.data(input_file), sample=self.process_event)
+        self.session.process_events()
+        self.print_totals()
+
+def main() -> None:
+    """Main function."""
+    parser = argparse.ArgumentParser(description="Trace wakeup latency")
+    parser.add_argument("-i", "--input", default="perf.data", help="Input file")
+    args = parser.parse_args()
+
+    analyzer = WakeupLatency()
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


