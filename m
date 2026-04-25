Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6E366FF885C
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 25 Apr 2026 22:52:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ERRU3KdUiox4uEsWs/CeTXwwWIrylXGw9vYnzrPC1Tw=; b=g1W0NVcISiQ+34J3PuE7+4I9SP
	dznA6x6XO7uOAV0z+K/YOlZ5zMzuCQ2lCQJrng1Fhh+kVD8rQjE5pfBvyej6wsNsKeXsaioC4X2B3
	VORuJiw0yBHAs4rrJ+Bmoe7TcQDe1uLwKPm1VpI13yvgdpbTRvdIDjpCOQbvzOK0QAxdCmGHlIEkO
	3/RD6Q3aS9S1UHibWjMC8XFabKW7paAWpkOIXKJPU0UcwXnZ6uj1OCojnjCri8U9o5yrMna8ihqAC
	xNmf6+ptw7O78xgPa/VIhjytdNxZRWrYp7ruxgE/bAy0JXIe5h9g0xnIltuJH+Yam0YlIKaYug25J
	u3xKt4fQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wGlr7-0000000EzpD-3xwj;
	Sat, 25 Apr 2026 22:52:09 +0000
Received: from mail-dl1-x124a.google.com ([2607:f8b0:4864:20::124a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wGlqN-0000000Eyvr-0SMm
	for linux-arm-kernel@lists.infradead.org;
	Sat, 25 Apr 2026 22:51:38 +0000
Received: by mail-dl1-x124a.google.com with SMTP id a92af1059eb24-12db218e265so14789630c88.0
        for <linux-arm-kernel@lists.infradead.org>; Sat, 25 Apr 2026 15:51:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1777157482; x=1777762282; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=ERRU3KdUiox4uEsWs/CeTXwwWIrylXGw9vYnzrPC1Tw=;
        b=k4jMTzEBQNTy1nadimh5JBrlvxYFcSIF8b7y6kXyNtVvBflnTH9HUQLoESsZGbUfAw
         Qm7OqicNaXsiFoftvcf7VpPxZ7Bkh5WJx3d6HoqkbPO/ESqFKYvDsr+G0pePkqEQ3x6v
         WlbmxvpEa3/na+KbKfsYt8EPrhe4qY0zSU/LTuklwE3LwTNq1n7lQ3yYWrAJXRh4WV6U
         2AJYkJdBzERapT/CIueIFcQoflyBTxKaRxXWFDx/t9ZhEPNKA/g0UduiUY4RA7ij7uxO
         1YJs0/o7VESGTmD7heEosSb9lfJYRBcdWTgqeZEtOyIierrqGZLCoZB1eIEQwB+CuSs+
         sY0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777157482; x=1777762282;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ERRU3KdUiox4uEsWs/CeTXwwWIrylXGw9vYnzrPC1Tw=;
        b=E1PHGetSN1NdK9Ug5xGtKy68DncGAb8BN47mHuusIYsaddrf/gDZ2A7lk7qoqySO1q
         eGbjOqeAL+CA1L0+ADKLW3ezJzwYCLxothVGzGbL1w3N7Rq4Xhh52HFdnWBmpGXBvMnk
         ANJBoVpshXvpWSBZ9OaTDCYGQrXxtv8r7wvOcM97KRGFYfbtvpU0eodkVXiL/0hTGMD4
         S0PDmlev9fBtXlQkKQYyDumpwOQFXklIiEQLoFmrdUyn7ztPthiHJlazKQs4E3R4zZTD
         x1pph1VmL0TcfNUc8Or8sVe5SIk8LX+QNwE5OPV+s/adp4/fz0r9Ta+YNpg5+ZDoBO0W
         RHTQ==
X-Forwarded-Encrypted: i=1; AFNElJ85FnaIp8Aqd+lz65qOLNhSHI27KXWZnNQieIcnB0zkAMWq+4awW9u41uaKVcMNWDljbNPZZ0M6NkY+nesYqWBD@lists.infradead.org
X-Gm-Message-State: AOJu0YzONRv8geAUOrEVzod0HqeLrCN5nReS6eyrtyXm/vigqyiJYofe
	cRKn9iu1huXWL2d1zBlYrOUE2oignmt/sfBVn1szfHzbUX6kHAz7+D6rDw/6Ygvgyh74r5IpOTh
	gBGewmIbuqQ==
X-Received: from dlbsj13.prod.google.com ([2002:a05:7022:f90d:b0:12d:b591:4bad])
 (user=irogers job=prod-delivery.src-stubby-dispatcher) by 2002:a05:7022:60f:b0:127:3915:76b2
 with SMTP id a92af1059eb24-12c73f9ae51mr22028481c88.27.1777157481565; Sat, 25
 Apr 2026 15:51:21 -0700 (PDT)
Date: Sat, 25 Apr 2026 15:49:25 -0700
In-Reply-To: <20260425224951.174663-1-irogers@google.com>
Mime-Version: 1.0
References: <20260425174858.3922152-1-irogers@google.com> <20260425224951.174663-1-irogers@google.com>
X-Mailer: git-send-email 2.54.0.545.g6539524ca2-goog
Message-ID: <20260425224951.174663-34-irogers@google.com>
Subject: [PATCH v7 33/59] perf check-perf-trace: Port check-perf-trace to use
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
X-CRM114-CacheID: sfid-20260425_155123_273831_E0110E28 
X-CRM114-Status: GOOD (  15.69  )
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
index 000000000000..7c1c7632a091
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
+    comm = session.find_thread(sample.sample_pid).comm() if session else "[unknown]"
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


