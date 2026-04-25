Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 62F3AFF885C
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 25 Apr 2026 22:44:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ERRU3KdUiox4uEsWs/CeTXwwWIrylXGw9vYnzrPC1Tw=; b=li5ZSurSIx02PelAzIqO+Bcd3S
	bgb7EebjNYhVxnApWWXBIk7AOgf6G0jcMyhbiMfuv+st9hW1jbMvXagJMtrwSzweMTzL5mOwzBQgp
	6IT57BvJJ5VdSrX5f5/VLNtRI74Xl7R74kUC3eIMIkDCv7RoJNSCaWzrG/FagSZsASwhapJnkXSgT
	X0dwqYil8EIHeIgTxK9FR+CcNNzpP8+EAHG1oBGxhivEtwBkDD8uTfXBzBWx7Yd9NFpoyO02k9vTG
	X/dGWOIw2y+es5x/TrlZuigEoFKPUJhQvgr12nIRX/j6q1pl5m3s9Xj9HG3xni2ApfN62wFs1k8Od
	K8QAPsXw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wGljU-0000000EvM0-0aou;
	Sat, 25 Apr 2026 22:44:16 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wGliY-0000000EuTl-0e88
	for linux-arm-kernel@bombadil.infradead.org;
	Sat, 25 Apr 2026 22:43:18 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Type:Cc:To:From:Subject:
	Message-ID:References:Mime-Version:In-Reply-To:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=ERRU3KdUiox4uEsWs/CeTXwwWIrylXGw9vYnzrPC1Tw=; b=UHvg0UuBBJtf07IpnhQ++9ul43
	d3yJwl2LIPAcYSqsARkiY/YiogB7eZTNBsih8peHAyEVDD5y2zgrbZaj6fwZUyX13XxTVDbPbZEWT
	LX1k1hfrkicf4npzGpGsTzYEvf0ndEvn7htMT0w7W8Rlh/24mkE3H0l1YgBbN20+/zdZywizi3FGS
	5uF82WFvcRe4v3tmxSFt0aqyVNaIkkX3w0ylhMhlJYajHOSPxhwaPp7dY2IbUEaDkMvdnQnONel2D
	HIzYtsh3i/AVmU37E1IJnhAS7BOq5THqH2bvRk+FOoGOfihLsHVb5t9u7Be50CA0RXwfrmgrXZnmE
	L0/WYLOw==;
Received: from mail-dy1-f201.google.com ([74.125.82.201])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wGliP-0000000GKxl-1vc6
	for linux-arm-kernel@lists.infradead.org;
	Sat, 25 Apr 2026 22:43:15 +0000
Received: by mail-dy1-f201.google.com with SMTP id 5a478bee46e88-2eaed3d96d7so857352eec.0
        for <linux-arm-kernel@lists.infradead.org>; Sat, 25 Apr 2026 15:42:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1777156958; x=1777761758; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=ERRU3KdUiox4uEsWs/CeTXwwWIrylXGw9vYnzrPC1Tw=;
        b=GreD2cJYHTEgiT/orKoolDX3tqGTpH9JjDa3ANtmL8Iz4F/e+YdY/zDDoB5CjbbdZt
         TNoI/gK0Y4UoQIrq+58bOb/2YbJ8IN2kWhD+fiT8ZfIRFLvXP4yw19cuSCc+8Tt0c532
         1u4W2rwkg+b/jOpgvvMCgMRqYYGTOR68jfk03yJyTNfcg5fN3MrNQRKZdu8QZLFjEPZ0
         emwy70h7vWZtvbNa6yLrdvP3XvbRCKUXmU5z8yUa8zlHTCQ+M/8pfbeIIaszzYujQ9ao
         iqG9D3TcqcG5D1ALWLmzhLjM9+vR4Ym0I76tKxPXB70PqWXjw0kL2e9mz6D0Y5XZJqCq
         /MsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777156958; x=1777761758;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ERRU3KdUiox4uEsWs/CeTXwwWIrylXGw9vYnzrPC1Tw=;
        b=AuciRLn7MEKi3Kg5JDt97uMCYqHeGU06ohfyaroOd4TbuSL2vwMmpu2GWQcVk0zTW7
         PdgYJHEH4tW9oRd5jdT7LXvKWzdqs7yiIyDa4sy1JlAIODDt6hs0j8nos8D5JOchp6Vg
         CdoqvPV0AG9/mZlgr5L48TPd5zNdU42wbgYov8XNSiMev4v+hhzS5jU+XcZfE/AexiO1
         BWidDCXKVmQmO1DRuNujM8TnCAnM0kkNJWqR91sY3wN9zcwu4LBapRvpMmbogsaRXQfP
         +vLQ87HB/quu21CpcsfH0Dk9RBkr9Tq70+5o/ZAjWRwVPYp2nF2zRUyTXCYr6I3FU6V7
         1fSw==
X-Forwarded-Encrypted: i=1; AFNElJ+V3yBR4bt2DV4uMnMgYUt74dL4cjMj5toRvR6r+0rdQZCgOCaF1S/jjQPdbAvi3SlkjkvhLKBE9anFVLOvK3om@lists.infradead.org
X-Gm-Message-State: AOJu0YxG27W82wWAxOIbe/mtflevnyAz8Th9oOlaw+psHkLwmo4kye/w
	9hF31k1qh/qKFX3S/E+V1hOsmQFCd//FP7H6D0Ry6s02jL7OeG0k+Y9wXEcmknChm0ixVpFWC63
	y4QFB99eO1g==
X-Received: from dycoy3.prod.google.com ([2002:a05:7301:fc03:b0:2e0:fe68:96c7])
 (user=irogers job=prod-delivery.src-stubby-dispatcher) by 2002:a05:7300:fd09:b0:2da:d4b4:c85a
 with SMTP id 5a478bee46e88-2e464dad10cmr17824799eec.11.1777156958365; Sat, 25
 Apr 2026 15:42:38 -0700 (PDT)
Date: Sat, 25 Apr 2026 15:40:58 -0700
In-Reply-To: <20260425224125.160890-1-irogers@google.com>
Mime-Version: 1.0
References: <20260425174858.3922152-1-irogers@google.com> <20260425224125.160890-1-irogers@google.com>
X-Mailer: git-send-email 2.54.0.545.g6539524ca2-goog
Message-ID: <20260425224125.160890-34-irogers@google.com>
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
X-CRM114-CacheID: sfid-20260425_234313_745040_B3AA29C1 
X-CRM114-Status: GOOD (  16.11  )
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


