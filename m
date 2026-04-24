Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0F9B6FED3F0
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 24 Apr 2026 16:49:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=cgYnl3XjZw1LM3PPexpVL2rKOKFvUzBtuSscfGN+JSE=; b=lWs5PeoxOd6DArO8z1g+/QtLQX
	y1MsZ1zmfUZ7EdCJKaAbn1cgs2q/Le66zbggPvXQxKxVyhuRv0K3KNpQJ2fLJ964bIalnYXTc9ZqQ
	Ecms+XmMl5K1dsnvSF/XY0L/1eNh9nLKhAKUhhpFU1NbD9rthTfj1PRcBts9WsmxVwp7Xf46tl4WD
	Sl+9MmCrZQ2dlwkgT2huUc3X4HIbXvC2ZzFsF3JhLJA0rHg54ZwFaCXfdtuv4+IJrEA8Jwse537Z1
	QEnWjCMuKlBp3KwCpkYmbQcU+Fqn76JY3xbgs1pEAxGuFSGV7ulya60sab0u1a0+7H0Yy2gVn7iA4
	TGlXA17Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wGJiX-0000000DUk5-1YuQ;
	Fri, 24 Apr 2026 16:49:25 +0000
Received: from mail-dy1-x1349.google.com ([2607:f8b0:4864:20::1349])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wGJi4-0000000DUDo-2hoS
	for linux-arm-kernel@lists.infradead.org;
	Fri, 24 Apr 2026 16:49:03 +0000
Received: by mail-dy1-x1349.google.com with SMTP id 5a478bee46e88-2de07c12745so19751020eec.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 24 Apr 2026 09:48:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1777049335; x=1777654135; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=cgYnl3XjZw1LM3PPexpVL2rKOKFvUzBtuSscfGN+JSE=;
        b=EJZR7iAIWuWRksD1EAUH6TQtwuASdbMbssTcEJjlQPkjmQc5lsQGDimTyOo5W+Plre
         mqTU0ctK2qg1mgZ4zsMazoBd3zIeLiVONTTDQ7/BwOEKvb0fhSQlbiYMR4rusBqxSrny
         tBRe4vhkpK0tQUrQDkuPSrO3aGbDUafMGiPhWJvX8cGrBTyt73jExGG4TLouT2YDIl1A
         VGmzTTnSZ9gaIcaBtq5+mdR6EUe0hYGn42W/fBBibYYOpn1j9DE+puRykll0kjufm6Du
         6NVCyhkkRj95EYms+BnDnJsp8SSvs4Q451OkAKEMcloj9prNH6rHsCyqnoHLt4+d+qVK
         zBKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777049335; x=1777654135;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=cgYnl3XjZw1LM3PPexpVL2rKOKFvUzBtuSscfGN+JSE=;
        b=Dq/OnAbI59MSlXsxfBCUipLI0OmC3nRRPTU06GfVzVs1yk+vlRajWL3qGekpQ0ZyT0
         /V56Hvesufw4T5M+xgeJjcPyrUeO+GO/F/PoniHvLfDgYzko8m0QwxN8LhwzUDfz18yd
         xDXnqyNw620RjOhFbTn1Q9qZMKZbiWYBdtGsuv6WBdO5KJBOEK12mMLgfNXzs8Q/i9Xo
         VbjUPhxGi9u0/lqdAElgcI9LGq2q8Hk5Fwwnk3N72l4CN6ogntSCMTmF76ffKddr0DIr
         eHPJKsUpKNhEH+uky43dat639d0vGZO+hYmsLSbY7iFfZLAu/Kt3/zO8K9JzPvA9gt/e
         cJ8w==
X-Forwarded-Encrypted: i=1; AFNElJ8AtIrhvQV1IPw0gMIySxEo/dRD6PXeZ3PKLm23AtUZWRBZb5TtlUf+1ckV3GaGuofBZvos48AYQlQgpJmmE70e@lists.infradead.org
X-Gm-Message-State: AOJu0YySP6Aqx1Jc1R3Va1EnrUpWIQFgOVXI5tZYBqQCfpoTyQe5v1uM
	2vYhj0RdYrzMZw7vpQS9nrulPEwGR8RqN4sezHdKtFWUpS6nuotjwxNPb9Aq2h1HD/EXWOPN20g
	rPX4ETUk1tA==
X-Received: from dybmx9.prod.google.com ([2002:a05:7300:d409:b0:2d7:d4ce:8994])
 (user=irogers job=prod-delivery.src-stubby-dispatcher) by 2002:a05:7300:6da7:b0:2c7:8e1c:956a
 with SMTP id 5a478bee46e88-2e479d076b0mr18620129eec.19.1777049334876; Fri, 24
 Apr 2026 09:48:54 -0700 (PDT)
Date: Fri, 24 Apr 2026 09:46:55 -0700
In-Reply-To: <20260424164721.2229025-1-irogers@google.com>
Mime-Version: 1.0
References: <20260423163406.1779809-1-irogers@google.com> <20260424164721.2229025-1-irogers@google.com>
X-Mailer: git-send-email 2.54.0.545.g6539524ca2-goog
Message-ID: <20260424164721.2229025-34-irogers@google.com>
Subject: [PATCH v5 33/58] perf check-perf-trace: Port check-perf-trace to use
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
X-CRM114-CacheID: sfid-20260424_094856_784133_F0F840EA 
X-CRM114-Status: GOOD (  15.75  )
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

Add a port of the check-perf-trace script that uses the perf python
module directly. This approach is significantly faster than using perf
script callbacks as it avoids creating intermediate dictionaries for
all event fields.

Assisted-by: Gemini:gemini-3.1-pro-preview
Signed-off-by: Ian Rogers <irogers@google.com>
---
v2:
1. String Match Accuracy: Replaced the substring check for `irq:softirq_entry`
   events with a robust exact string match.

v3:
1. Safe Thread Resolution: Swapped out sample.sample_pid with
   sample.sample_tid and safeguarded the session process lookup with
   a try-except block.

v4:
1. Git Fixup Cleanup: Squashed the lingering fixup commit from the previous
   session into its proper patch.
---
 tools/perf/python/check-perf-trace.py | 113 ++++++++++++++++++++++++++
 1 file changed, 113 insertions(+)
 create mode 100755 tools/perf/python/check-perf-trace.py

diff --git a/tools/perf/python/check-perf-trace.py b/tools/perf/python/check-perf-trace.py
new file mode 100755
index 000000000000..4c05540bdc05
--- /dev/null
+++ b/tools/perf/python/check-perf-trace.py
@@ -0,0 +1,113 @@
+#!/usr/bin/env python3
+# SPDX-License-Identifier: GPL-2.0
+"""
+Basic test of Python scripting support for perf.
+Ported from tools/perf/scripts/python/check-perf-trace.py
+"""
+
+import argparse
+import collections
+import perf
+
+unhandled: collections.defaultdict[str, int] = collections.defaultdict(int)
+session = None
+
+softirq_vecs = {
+    0: "HI_SOFTIRQ",
+    1: "TIMER_SOFTIRQ",
+    2: "NET_TX_SOFTIRQ",
+    3: "NET_RX_SOFTIRQ",
+    4: "BLOCK_SOFTIRQ",
+    5: "IRQ_POLL_SOFTIRQ",
+    6: "TASKLET_SOFTIRQ",
+    7: "SCHED_SOFTIRQ",
+    8: "HRTIMER_SOFTIRQ",
+    9: "RCU_SOFTIRQ",
+}
+
+def trace_begin() -> None:
+    """Called at the start of trace processing."""
+    print("trace_begin")
+
+def trace_end() -> None:
+    """Called at the end of trace processing."""
+    print_unhandled()
+
+def symbol_str(event_name: str, field_name: str, value: int) -> str:
+    """Resolves symbol values to strings."""
+    if event_name == "irq__softirq_entry" and field_name == "vec":
+        return softirq_vecs.get(value, str(value))
+    return str(value)
+
+def flag_str(event_name: str, field_name: str, value: int) -> str:
+    """Resolves flag values to strings."""
+    if event_name == "kmem__kmalloc" and field_name == "gfp_flags":
+        return f"0x{value:x}"
+    return str(value)
+
+def print_header(event_name: str, sample: perf.sample_event) -> None:
+    """Prints common header for events."""
+    secs = sample.sample_time // 1000000000
+    nsecs = sample.sample_time % 1000000000
+    comm = session.process(sample.sample_pid).comm() if session else "[unknown]"
+    print(f"{event_name:<20} {sample.sample_cpu:5} {secs:05}.{nsecs:09} "
+          f"{sample.sample_pid:8} {comm:<20} ", end=' ')
+
+def print_uncommon(sample: perf.sample_event) -> None:
+    """Prints uncommon fields for tracepoints."""
+    # Fallback to 0 if field not found (e.g. on older kernels or if not tracepoint)
+    pc = getattr(sample, "common_preempt_count", 0)
+    flags = getattr(sample, "common_flags", 0)
+    lock_depth = getattr(sample, "common_lock_depth", 0)
+
+    print(f"common_preempt_count={pc}, common_flags={flags}, "
+          f"common_lock_depth={lock_depth}, ")
+
+def irq__softirq_entry(sample: perf.sample_event) -> None:
+    """Handles irq:softirq_entry events."""
+    print_header("irq__softirq_entry", sample)
+    print_uncommon(sample)
+    print(f"vec={symbol_str('irq__softirq_entry', 'vec', sample.vec)}")
+
+def kmem__kmalloc(sample: perf.sample_event) -> None:
+    """Handles kmem:kmalloc events."""
+    print_header("kmem__kmalloc", sample)
+    print_uncommon(sample)
+
+    print(f"call_site={sample.call_site:d}, ptr={sample.ptr:d}, "
+          f"bytes_req={sample.bytes_req:d}, bytes_alloc={sample.bytes_alloc:d}, "
+          f"gfp_flags={flag_str('kmem__kmalloc', 'gfp_flags', sample.gfp_flags)}")
+
+def trace_unhandled(event_name: str) -> None:
+    """Tracks unhandled events."""
+    unhandled[event_name] += 1
+
+def print_unhandled() -> None:
+    """Prints summary of unhandled events."""
+    if not unhandled:
+        return
+    print("\nunhandled events:\n")
+    print(f"{'event':<40} {'count':>10}")
+    print("---------------------------------------- -----------")
+    for event_name, count in unhandled.items():
+        print(f"{event_name:<40} {count:10}")
+
+def process_event(sample: perf.sample_event) -> None:
+    """Callback for processing events."""
+    event_name = str(sample.evsel)
+    if event_name == "evsel(irq:softirq_entry)":
+        irq__softirq_entry(sample)
+    elif "evsel(kmem:kmalloc)" in event_name:
+        kmem__kmalloc(sample)
+    else:
+        trace_unhandled(event_name)
+
+if __name__ == "__main__":
+    ap = argparse.ArgumentParser()
+    ap.add_argument("-i", "--input", default="perf.data", help="Input file name")
+    args = ap.parse_args()
+
+    trace_begin()
+    session = perf.session(perf.data(args.input), sample=process_event)
+    session.process_events()
+    trace_end()
-- 
2.54.0.545.g6539524ca2-goog


