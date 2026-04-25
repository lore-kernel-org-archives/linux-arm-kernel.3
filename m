Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B9218FF885A
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 25 Apr 2026 22:44:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=tFkKJpx387LQyGkxFesF27g3u3l0azo1BknyR7NysHU=; b=Kn5mUG+m857pZaVLyxz/NufvCw
	DbIZ65alOaB7SdFRpsDCnW9m7qaC+gvcAdMNDm95JPaJh/uGcKoBHZr2PTHKVMirKxioXGO9Kf7Nd
	sWsQnBjsrmc8/WsZOIERU3JJCCXnRcx3BgoicRuBF0PGvCESMIhsm2F/jExvaMfCa9ej4Wh3r5f/2
	dmYo7KBTzHYzHfPG7ACjwgGrf2xkbOQ+WjFifOcs7cLFBcGgJFSqvaC6oQlqip8bq5d74wcRhv+kE
	q1OoMO04c79gXs3Iz+SO3frSIXMMxhn6zbL9pCAcInNPkvKoMFECa+mM2x753ALAzcv/UDSmgQtoM
	1Aq1rLdQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wGljT-0000000EvKm-13Dg;
	Sat, 25 Apr 2026 22:44:15 +0000
Received: from mail-dl1-f74.google.com ([74.125.82.74])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wGliF-0000000Eu8Q-04H4
	for linux-arm-kernel@lists.infradead.org;
	Sat, 25 Apr 2026 22:43:13 +0000
Received: by mail-dl1-f74.google.com with SMTP id a92af1059eb24-126e8ee6227so9127217c88.0
        for <linux-arm-kernel@lists.infradead.org>; Sat, 25 Apr 2026 15:42:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1777156977; x=1777761777; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=tFkKJpx387LQyGkxFesF27g3u3l0azo1BknyR7NysHU=;
        b=tOlU5fRHeu/h4M1qOL72/j5WFRz4bYAMX1yHtqLWtvK6GDPKCkii3QikBU7UM7f7Lm
         hLBYlT7ZY6NlYyw8bf1sTMuHueUESVRx6FXuSNhPqC0JoR9GT50FyG82OhUY9IyKIK3b
         6+p4X/AsBuoPFPsZTYHXUEaeW5fP+wUslut5ZvjcZ0WOwBd7ZN97tx5JaCzhLiX9kjEZ
         n+GzF8MOVU/n6fubbmjAA/0uqBLVFKkTYyxKA9l84khoJlelb9wA5O30KN5PvIl5NxxL
         albGvE41NLreQ2PP5DezMGmgJFkBN2dwah6zGOzsw+yJkXfHl0vqSqSOO+2ytOnm/Rzv
         1AXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777156977; x=1777761777;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=tFkKJpx387LQyGkxFesF27g3u3l0azo1BknyR7NysHU=;
        b=DZIaGod4RvTNePrbbTenQKUJ/ZyFsyUTcUDK8Hjommvbqr4DPcJGPWP0bHkOSJDJyo
         cvhNedStbOGGBbNpqe5CSMi7GPbwXys2/RJkxLi7sVayejZcB3PziNbLJVeid2ftteHa
         UiTYhk399WHATa7eGsLZ/3VIHlzB8yyVniBamhytU5fpQV6uxp/GFaXfeP0KRVyFz61A
         o2aByM2PFrD8NZUEHCBp/58YwgcSVCltlc/JEI+9Da9awFx4JUa2cWId/JjzVo5xYj4C
         s0ZjWOPKlMVxocKQV9xnNVuDbafWP2ac6KTa6OG0qaYLNrRBa3Xu4Re1dtoyW8/B9LcH
         R+2g==
X-Forwarded-Encrypted: i=1; AFNElJ9I3Vcfb8h2YAjBKCRhsXKKBW5+O651z80dHNvmd8GPv96hvO7NwmR/+Essv72JdqQ+hZz2mv3UjhtVTUspt0nX@lists.infradead.org
X-Gm-Message-State: AOJu0YzLM9r0kIVpPqOVKYzhC5JLPV6huFx/rOYKIN4H/94Xtf308myo
	x714zH8oXur85zh50AXJIi0mIVe7eiZXqKG2e4vDYrwqC1TM0oZ/08S1WbEeGLgmSqkyY4mXo7c
	s9BEl0nUa8A==
X-Received: from dlbvv17.prod.google.com ([2002:a05:7022:5f11:b0:12a:c3c1:4ace])
 (user=irogers job=prod-delivery.src-stubby-dispatcher) by 2002:a05:7022:6627:b0:128:ca83:5aa1
 with SMTP id a92af1059eb24-12c73f9217dmr20015505c88.16.1777156976612; Sat, 25
 Apr 2026 15:42:56 -0700 (PDT)
Date: Sat, 25 Apr 2026 15:41:07 -0700
In-Reply-To: <20260425224125.160890-1-irogers@google.com>
Mime-Version: 1.0
References: <20260425174858.3922152-1-irogers@google.com> <20260425224125.160890-1-irogers@google.com>
X-Mailer: git-send-email 2.54.0.545.g6539524ca2-goog
Message-ID: <20260425224125.160890-43-irogers@google.com>
Subject: [PATCH v7 42/59] perf powerpc-hcalls: Port powerpc-hcalls to use
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
X-CRM114-CacheID: sfid-20260425_154259_439329_9EF676F2 
X-CRM114-Status: GOOD (  16.00  )
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
- Refactored the script to use a class structure (HCallAnalyzer) to
  encapsulate state.
- Used perf.session for event processing.
- Tracked hcall entry and exit to calculate duration and aggregate
  statistics.
- Moved the large hcall_table to a module-level constant HCALL_TABLE.
- Cleaned up Python 2 compatibility artifacts.

Assisted-by: Gemini:gemini-3.1-pro-preview
Signed-off-by: Ian Rogers <irogers@google.com>
---
 tools/perf/python/powerpc-hcalls.py | 211 ++++++++++++++++++++++++++++
 1 file changed, 211 insertions(+)
 create mode 100755 tools/perf/python/powerpc-hcalls.py

diff --git a/tools/perf/python/powerpc-hcalls.py b/tools/perf/python/powerpc-hcalls.py
new file mode 100755
index 000000000000..c4fa539174c9
--- /dev/null
+++ b/tools/perf/python/powerpc-hcalls.py
@@ -0,0 +1,211 @@
+#!/usr/bin/env python3
+# SPDX-License-Identifier: GPL-2.0+
+"""
+Hypervisor call statistics
+
+Copyright (C) 2018 Ravi Bangoria, IBM Corporation
+Ported from tools/perf/scripts/python/powerpc-hcalls.py
+"""
+
+import argparse
+from collections import defaultdict
+import perf
+
+# Hypervisor call table
+HCALL_TABLE = {
+    4: 'H_REMOVE',
+    8: 'H_ENTER',
+    12: 'H_READ',
+    16: 'H_CLEAR_MOD',
+    20: 'H_CLEAR_REF',
+    24: 'H_PROTECT',
+    28: 'H_GET_TCE',
+    32: 'H_PUT_TCE',
+    36: 'H_SET_SPRG0',
+    40: 'H_SET_DABR',
+    44: 'H_PAGE_INIT',
+    48: 'H_SET_ASR',
+    52: 'H_ASR_ON',
+    56: 'H_ASR_OFF',
+    60: 'H_LOGICAL_CI_LOAD',
+    64: 'H_LOGICAL_CI_STORE',
+    68: 'H_LOGICAL_CACHE_LOAD',
+    72: 'H_LOGICAL_CACHE_STORE',
+    76: 'H_LOGICAL_ICBI',
+    80: 'H_LOGICAL_DCBF',
+    84: 'H_GET_TERM_CHAR',
+    88: 'H_PUT_TERM_CHAR',
+    92: 'H_REAL_TO_LOGICAL',
+    96: 'H_HYPERVISOR_DATA',
+    100: 'H_EOI',
+    104: 'H_CPPR',
+    108: 'H_IPI',
+    112: 'H_IPOLL',
+    116: 'H_XIRR',
+    120: 'H_MIGRATE_DMA',
+    124: 'H_PERFMON',
+    220: 'H_REGISTER_VPA',
+    224: 'H_CEDE',
+    228: 'H_CONFER',
+    232: 'H_PROD',
+    236: 'H_GET_PPP',
+    240: 'H_SET_PPP',
+    244: 'H_PURR',
+    248: 'H_PIC',
+    252: 'H_REG_CRQ',
+    256: 'H_FREE_CRQ',
+    260: 'H_VIO_SIGNAL',
+    264: 'H_SEND_CRQ',
+    272: 'H_COPY_RDMA',
+    276: 'H_REGISTER_LOGICAL_LAN',
+    280: 'H_FREE_LOGICAL_LAN',
+    284: 'H_ADD_LOGICAL_LAN_BUFFER',
+    288: 'H_SEND_LOGICAL_LAN',
+    292: 'H_BULK_REMOVE',
+    304: 'H_MULTICAST_CTRL',
+    308: 'H_SET_XDABR',
+    312: 'H_STUFF_TCE',
+    316: 'H_PUT_TCE_INDIRECT',
+    332: 'H_CHANGE_LOGICAL_LAN_MAC',
+    336: 'H_VTERM_PARTNER_INFO',
+    340: 'H_REGISTER_VTERM',
+    344: 'H_FREE_VTERM',
+    348: 'H_RESET_EVENTS',
+    352: 'H_ALLOC_RESOURCE',
+    356: 'H_FREE_RESOURCE',
+    360: 'H_MODIFY_QP',
+    364: 'H_QUERY_QP',
+    368: 'H_REREGISTER_PMR',
+    372: 'H_REGISTER_SMR',
+    376: 'H_QUERY_MR',
+    380: 'H_QUERY_MW',
+    384: 'H_QUERY_HCA',
+    388: 'H_QUERY_PORT',
+    392: 'H_MODIFY_PORT',
+    396: 'H_DEFINE_AQP1',
+    400: 'H_GET_TRACE_BUFFER',
+    404: 'H_DEFINE_AQP0',
+    408: 'H_RESIZE_MR',
+    412: 'H_ATTACH_MCQP',
+    416: 'H_DETACH_MCQP',
+    420: 'H_CREATE_RPT',
+    424: 'H_REMOVE_RPT',
+    428: 'H_REGISTER_RPAGES',
+    432: 'H_DISABLE_AND_GETC',
+    436: 'H_ERROR_DATA',
+    440: 'H_GET_HCA_INFO',
+    444: 'H_GET_PERF_COUNT',
+    448: 'H_MANAGE_TRACE',
+    468: 'H_FREE_LOGICAL_LAN_BUFFER',
+    472: 'H_POLL_PENDING',
+    484: 'H_QUERY_INT_STATE',
+    580: 'H_ILLAN_ATTRIBUTES',
+    592: 'H_MODIFY_HEA_QP',
+    596: 'H_QUERY_HEA_QP',
+    600: 'H_QUERY_HEA',
+    604: 'H_QUERY_HEA_PORT',
+    608: 'H_MODIFY_HEA_PORT',
+    612: 'H_REG_BCMC',
+    616: 'H_DEREG_BCMC',
+    620: 'H_REGISTER_HEA_RPAGES',
+    624: 'H_DISABLE_AND_GET_HEA',
+    628: 'H_GET_HEA_INFO',
+    632: 'H_ALLOC_HEA_RESOURCE',
+    644: 'H_ADD_CONN',
+    648: 'H_DEL_CONN',
+    664: 'H_JOIN',
+    676: 'H_VASI_STATE',
+    688: 'H_ENABLE_CRQ',
+    696: 'H_GET_EM_PARMS',
+    720: 'H_SET_MPP',
+    724: 'H_GET_MPP',
+    748: 'H_HOME_NODE_ASSOCIATIVITY',
+    756: 'H_BEST_ENERGY',
+    764: 'H_XIRR_X',
+    768: 'H_RANDOM',
+    772: 'H_COP',
+    788: 'H_GET_MPP_X',
+    796: 'H_SET_MODE',
+    61440: 'H_RTAS',
+}
+
+
+class HCallAnalyzer:
+    """Analyzes hypervisor calls and aggregates statistics."""
+
+    def __init__(self):
+        # output: {opcode: {'min': min, 'max': max, 'time': time, 'cnt': cnt}}
+        self.output = defaultdict(lambda: {'time': 0, 'cnt': 0, 'min': float('inf'), 'max': 0})
+        # d_enter: {pid: (opcode, nsec)}
+        self.d_enter: dict[int, tuple[int, int]] = {}
+        self.print_ptrn = '%-28s%10s%10s%10s%10s'
+
+    def hcall_table_lookup(self, opcode: int) -> str:
+        """Lookup hcall name by opcode."""
+        return HCALL_TABLE.get(opcode, str(opcode))
+
+    def process_event(self, sample: perf.sample_event) -> None:
+        """Process a single sample event."""
+        name = str(sample.evsel)
+        pid = sample.sample_pid
+        time = sample.time
+        opcode = getattr(sample, "opcode", -1)
+
+        if opcode == -1:
+            return
+
+        if name == "evsel(powerpc:hcall_entry)":
+            self.d_enter[pid] = (opcode, time)
+        elif name == "evsel(powerpc:hcall_exit)":
+            if pid in self.d_enter:
+                opcode_entry, time_entry = self.d_enter[pid]
+                if opcode_entry == opcode:
+                    diff = time - time_entry
+                    del self.d_enter[pid]
+
+                    stats = self.output[opcode]
+                    stats['time'] += diff
+                    stats['cnt'] += 1
+                    if diff < stats['min']:
+                        stats['min'] = diff
+                    if diff > stats['max']:
+                        stats['max'] = diff
+
+    def print_summary(self) -> None:
+        """Print aggregated statistics."""
+        print(self.print_ptrn % ('hcall', 'count', 'min(ns)', 'max(ns)', 'avg(ns)'))
+        print('-' * 68)
+        for opcode in sorted(self.output.keys()):
+            h_name = self.hcall_table_lookup(opcode)
+            stats = self.output[opcode]
+            time = stats['time']
+            cnt = stats['cnt']
+            min_t = stats['min']
+            max_t = stats['max']
+
+            # Avoid float representation for large integers if possible,
+            # or use formatted strings. Legacy used time//cnt.
+            avg_t = time // cnt if cnt > 0 else 0
+
+            # If min was not updated, it remains inf, but cnt should be > 0 if in output
+            if min_t == float('inf'):
+                min_t = 0
+
+            print(self.print_ptrn % (h_name, cnt, int(min_t), int(max_t), avg_t))
+
+
+if __name__ == "__main__":
+    ap = argparse.ArgumentParser(description="Hypervisor call statistics")
+    ap.add_argument("-i", "--input", default="perf.data", help="Input file name")
+    args = ap.parse_args()
+
+    analyzer = HCallAnalyzer()
+
+    try:
+        session = perf.session(perf.data(args.input), sample=analyzer.process_event)
+        session.process_events()
+        analyzer.print_summary()
+    except KeyboardInterrupt:
+        analyzer.print_summary()
+    except Exception as e:
+        print(f"Error processing events: {e}")
-- 
2.54.0.545.g6539524ca2-goog


