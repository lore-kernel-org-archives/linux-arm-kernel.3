Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 72034CD484E
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 11 May 2026 21:09:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=eNzCvmyPoJHv7GjfeNnSCdb6x1DDoviVPDF8/asFCi4=; b=Xef3eCw/fwQ035N1KGoEth562E
	eQow/OpxTQ9JRCEZ1hvL/H/52btbzHCLkCGNef+L20U+xYebjq/WAdFsxqhaDDgh63AO89nBnXdZ6
	uJufXhWtjwJCMS2eaD1LY4F/WwoXxSbBkbvQ7pLypb2HT1pf2QwUp4tmMFS71fmnJC9TBPC3wT1Ye
	WjnmA1M3JBndAkI3JsGF3nWfrNBgqTcrzoEZtDye5W8A8Gjz88TxY4xNnbXk3Q2Bl09IIKXO4xIXZ
	tmMMfvlhdbHmEVOykjo6RkKY7xFN7bK/lUrGUYY1A+TkIr3nICRPjbFCRZ/p70f6msfzArER7vQh1
	er4eb9GA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wMXrz-0000000EmES-2mAO;
	Mon, 11 May 2026 21:08:55 +0000
Received: from pdx-out-002.esa.us-west-2.outbound.mail-perimeter.amazon.com ([44.246.1.125])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wMXru-0000000EmDS-46WC
	for linux-arm-kernel@lists.infradead.org;
	Mon, 11 May 2026 21:08:54 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=amazon.com; i=@amazon.com; q=dns/txt; s=amazoncorp2;
  t=1778533730; x=1810069730;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=eNzCvmyPoJHv7GjfeNnSCdb6x1DDoviVPDF8/asFCi4=;
  b=WhhoimBBcZSSkiKod6ctbkf7SFx368Ts8bIpdILOKhwT+0RhvUtGf4SI
   MnhZo2e8HO9vJ4dBZqECLgI0EQgB+XprKJj77VLZGBfeHDh4ceWin/zzj
   994zMNVZv2neVMMIhDMgJm15E6CRAJPIdxPCgKb6LW0mWtvuW9WknACJ5
   kORgvCvYMmn32A79ZgUhzKixXFDgmWvZw/WCG5LXdtISZd2JZqxseZ+qc
   MlS7BcHP6FdWXYwR3ZIfj7fC46Tq3aZ9g6DsIhv3qqj50amyP+Mpna6Ul
   H/lOS4hUZ0/dY2h8zHA3IVCpYjguEzaZmRuMBrFWE+VXdCh4AMwwZAeZA
   A==;
X-CSE-ConnectionGUID: w5o6Vl3FS+mX35RUhfE9Bg==
X-CSE-MsgGUID: 0Lt6xtzUS0q3P1iXi/JjmA==
X-IronPort-AV: E=Sophos;i="6.23,229,1770595200"; 
   d="scan'208";a="19392228"
Received: from ip-10-5-6-203.us-west-2.compute.internal (HELO smtpout.naws.us-west-2.prod.farcaster.email.amazon.dev) ([10.5.6.203])
  by internal-pdx-out-002.esa.us-west-2.outbound.mail-perimeter.amazon.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 May 2026 21:08:45 +0000
Received: from EX19MTAUWB002.ant.amazon.com [205.251.233.111:1579]
 by smtpin.naws.us-west-2.prod.farcaster.email.amazon.dev [10.0.8.77:2525] with esmtp (Farcaster)
 id 33f22dde-e65e-459e-9e71-62964a26cef7; Mon, 11 May 2026 21:08:44 +0000 (UTC)
X-Farcaster-Flow-ID: 33f22dde-e65e-459e-9e71-62964a26cef7
Received: from EX19D001UWA001.ant.amazon.com (10.13.138.214) by
 EX19MTAUWB002.ant.amazon.com (10.250.64.231) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA) id 15.2.2562.37;
 Mon, 11 May 2026 21:08:43 +0000
Received: from dev-dsk-sauravsc-1a-8777b848.eu-west-1.amazon.com
 (172.19.118.34) by EX19D001UWA001.ant.amazon.com (10.13.138.214) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA) id 15.2.2562.37; Mon, 11 May 2026
 21:08:41 +0000
From: Saurav Sachidanand <sauravsc@amazon.com>
To: Arnaldo Carvalho de Melo <acme@kernel.org>
CC: Will Deacon <will@kernel.org>, Besar Wicaksono <bwicaksono@nvidia.com>,
	Ian Rogers <irogers@google.com>, Namhyung Kim <namhyung@kernel.org>, Leo Yan
	<leo.yan@linux.dev>, <linux-perf-users@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
	<aghayev@amazon.com>, <juew@amazon.com>, Saurav Sachidanand
	<sauravsc@amazon.com>
Subject: [PATCH 1/3] perf vendor events arm64: fix swapped MetricGroup for Tegra410 L1 prefetcher metrics
Date: Mon, 11 May 2026 21:08:32 +0000
Message-ID: <20260511210832.91408-1-sauravsc@amazon.com>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [172.19.118.34]
X-ClientProxiedBy: EX19D036UWB004.ant.amazon.com (10.13.139.170) To
 EX19D001UWA001.ant.amazon.com (10.13.138.214)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260511_140851_070341_7F508F8D 
X-CRM114-Status: UNSURE (   9.68  )
X-CRM114-Notice: Please train this message.
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

The L1D prefetcher metrics (l1d_cache_rw_miss_ratio, l1d_demand_accesses,
etc.) were incorrectly assigned to MetricGroup "L1I_Prefetcher_Effectiveness"
and vice versa. This causes 'perf stat --metric-group L1D_Prefetcher_Effectiveness'
to display L1I metrics, which is misleading.

Swap the MetricGroup assignments so L1D metrics are in the L1D group and
L1I metrics are in the L1I group.

Fixes: 86ff690f45cc ("perf vendor events arm64: Add Tegra410 Olympus PMU events")
Signed-off-by: Saurav Sachidanand <sauravsc@amazon.com>
---
 .../arch/arm64/nvidia/t410/metrics.json       | 28 +++++++++----------
 1 file changed, 14 insertions(+), 14 deletions(-)

diff --git a/tools/perf/pmu-events/arch/arm64/nvidia/t410/metrics.json b/tools/perf/pmu-events/arch/arm64/nvidia/t410/metrics.json
index b825ede03f544..59474ccb7417f 100644
--- a/tools/perf/pmu-events/arch/arm64/nvidia/t410/metrics.json
+++ b/tools/perf/pmu-events/arch/arm64/nvidia/t410/metrics.json
@@ -346,42 +346,42 @@
         "MetricExpr": "l1d_demand_misses / l1d_demand_accesses",
         "BriefDescription": "This metric measures the ratio of L1 D-cache Read accesses missed to the total number of L1 D-cache accesses. This gives an indication of the effectiveness of the L1 D-cache for demand Load or Store traffic.",
         "ScaleUnit": "1per cache access",
-        "MetricGroup": "L1I_Prefetcher_Effectiveness"
+        "MetricGroup": "L1D_Prefetcher_Effectiveness"
     },
     {
         "MetricName": "l1d_demand_accesses",
         "MetricExpr": "L1D_CACHE_RW",
         "BriefDescription": "This metric measures the count of L1 D-cache accesses incurred on Load or Store by the instruction stream of the program.",
         "ScaleUnit": "1count",
-        "MetricGroup": "L1I_Prefetcher_Effectiveness"
+        "MetricGroup": "L1D_Prefetcher_Effectiveness"
     },
     {
         "MetricName": "l1d_demand_misses",
         "MetricExpr": "L1D_CACHE_REFILL_RW",
         "BriefDescription": "This metric measures the count of L1 D-cache misses incurred on a Load or Store by the instruction stream of the program.",
         "ScaleUnit": "1count",
-        "MetricGroup": "L1I_Prefetcher_Effectiveness"
+        "MetricGroup": "L1D_Prefetcher_Effectiveness"
     },
     {
         "MetricName": "l1d_prf_accuracy",
         "MetricExpr": "100 * (l1d_useful_prf / l1d_refilled_prf)",
         "BriefDescription": "This metric measures the fraction of prefetched memory addresses that are used by the instruction stream.",
         "ScaleUnit": "1percent of prefetch",
-        "MetricGroup": "L1I_Prefetcher_Effectiveness"
+        "MetricGroup": "L1D_Prefetcher_Effectiveness"
     },
     {
         "MetricName": "l1d_prf_coverage",
         "MetricExpr": "100 * (l1d_useful_prf / (l1d_demand_misses + l1d_refilled_prf))",
         "BriefDescription": "This metric measures the baseline demand cache misses which the prefetcher brings into the cache.",
         "ScaleUnit": "1percent of cache access",
-        "MetricGroup": "L1I_Prefetcher_Effectiveness"
+        "MetricGroup": "L1D_Prefetcher_Effectiveness"
     },
     {
         "MetricName": "l1d_refilled_prf",
         "MetricExpr": "L1D_CACHE_REFILL_HWPRF + L1D_CACHE_REFILL_PRFM + L1D_LFB_HIT_RW_FHWPRF + L1D_LFB_HIT_RW_FPRFM",
         "BriefDescription": "This metric measures the count of cache lines refilled by L1 data prefetcher (hardware prefetches or software preload) into L1 D-cache.",
         "ScaleUnit": "1count",
-        "MetricGroup": "L1I_Prefetcher_Effectiveness"
+        "MetricGroup": "L1D_Prefetcher_Effectiveness"
     },
     {
         "MetricName": "l1d_tlb_miss_ratio",
@@ -402,7 +402,7 @@
         "MetricExpr": "L1D_CACHE_HIT_RW_FPRF + L1D_LFB_HIT_RW_FHWPRF + L1D_LFB_HIT_RW_FPRFM",
         "BriefDescription": "This metric measures the count of cache lines refilled by L1 data prefetcher (hardware prefetches or software preload) into L1 D-cache which are further used by Load or Store from the instruction stream of the program.",
         "ScaleUnit": "1count",
-        "MetricGroup": "L1I_Prefetcher_Effectiveness"
+        "MetricGroup": "L1D_Prefetcher_Effectiveness"
     },
     {
         "MetricName": "l1i_cache_miss_ratio",
@@ -423,42 +423,42 @@
         "MetricExpr": "l1i_demand_misses / l1i_demand_accesses",
         "BriefDescription": "This metric measures the ratio of L1 I-cache Read accesses missed to the total number of L1 I-cache accesses. This gives an indication of the effectiveness of the L1 I-cache for demand instruction fetch traffic. Note that cache accesses in this cache are demand instruction fetch.",
         "ScaleUnit": "1per cache access",
-        "MetricGroup": "L1D_Prefetcher_Effectiveness"
+        "MetricGroup": "L1I_Prefetcher_Effectiveness"
     },
     {
         "MetricName": "l1i_demand_accesses",
         "MetricExpr": "L1I_CACHE_RD",
         "BriefDescription": "This metric measures the count of L1 I-cache accesses caused by an instruction fetch by the instruction stream of the program.",
         "ScaleUnit": "1count",
-        "MetricGroup": "L1D_Prefetcher_Effectiveness"
+        "MetricGroup": "L1I_Prefetcher_Effectiveness"
     },
     {
         "MetricName": "l1i_demand_misses",
         "MetricExpr": "L1I_CACHE_REFILL_RD",
         "BriefDescription": "This metric measures the count of L1 I-cache misses caused by an instruction fetch by the instruction stream of the program.",
         "ScaleUnit": "1count",
-        "MetricGroup": "L1D_Prefetcher_Effectiveness"
+        "MetricGroup": "L1I_Prefetcher_Effectiveness"
     },
     {
         "MetricName": "l1i_prf_accuracy",
         "MetricExpr": "100 * (l1i_useful_prf / l1i_refilled_prf)",
         "BriefDescription": "This metric measures the fraction of prefetched memory addresses that are used by the instruction stream.",
         "ScaleUnit": "1percent of prefetch",
-        "MetricGroup": "L1D_Prefetcher_Effectiveness"
+        "MetricGroup": "L1I_Prefetcher_Effectiveness"
     },
     {
         "MetricName": "l1i_prf_coverage",
         "MetricExpr": "100 * (l1i_useful_prf / (l1i_demand_misses + l1i_refilled_prf))",
         "BriefDescription": "This metric measures the baseline demand cache misses which the prefetcher brings into the cache.",
         "ScaleUnit": "1percent of cache access",
-        "MetricGroup": "L1D_Prefetcher_Effectiveness"
+        "MetricGroup": "L1I_Prefetcher_Effectiveness"
     },
     {
         "MetricName": "l1i_refilled_prf",
         "MetricExpr": "L1I_CACHE_REFILL_HWPRF + L1I_CACHE_REFILL_PRFM",
         "BriefDescription": "This metric measures the count of cache lines refilled by L1 instruction prefetcher (hardware prefetches or software preload) into L1 I-cache.",
         "ScaleUnit": "1count",
-        "MetricGroup": "L1D_Prefetcher_Effectiveness"
+        "MetricGroup": "L1I_Prefetcher_Effectiveness"
     },
     {
         "MetricName": "l1i_tlb_miss_ratio",
@@ -479,7 +479,7 @@
         "MetricExpr": "L1I_CACHE_HIT_RD_FPRF",
         "BriefDescription": "This metric measures the count of cache lines refilled by L1 instruction prefetcher (hardware prefetches or software preload) into L1 I-cache which are further used by instruction stream of the program.",
         "ScaleUnit": "1count",
-        "MetricGroup": "L1D_Prefetcher_Effectiveness"
+        "MetricGroup": "L1I_Prefetcher_Effectiveness"
     },
     {
         "MetricName": "l2_cache_miss_ratio",
-- 
2.47.3


