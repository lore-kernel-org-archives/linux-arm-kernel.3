Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1FF52C5CFCF
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 13 Aug 2026 17:02:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=U0OEGouVi6BybDuoLEpQOjDGHQksohogcfv1bHu5pB4=; b=KQW1dAN6/plHdym0rrcsa0CQa7
	ntdaljyOHiMk634JRD+otYQSbAkkDf3o6KORGbm02Ny//A4LtC6DZ64cnvt7pZpVAnk/KenyPhQhc
	e4tpWVs64aQ8cpjqr2FLgRgttMHmq8S7piBoj/jOzQqmMV+ORCHT7BS6cSz2XbpECAv8AINMOVh8r
	IJBto39gmqbrmh1tRkegCCvfJq4BN1Mk4pfBoSDbQzvkBkZzFgfIRlxO7jqDZYMv3T5B7jnSCZYWL
	KepkG5ujF854DKgjEzkDSK0ureWk33J/TRPYRX6+jgXM1GHwhOvlTFi/0USNevN/9MGneLgDXQEVO
	T1kY1rQQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wuYpE-00000001DWI-22IK;
	Thu, 13 Aug 2026 17:02:40 +0000
Received: from mail-westcentralusazon11010060.outbound.protection.outlook.com ([40.93.198.60] helo=CY7PR03CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wuYpB-00000001DVF-2tqu
	for linux-arm-kernel@lists.infradead.org;
	Thu, 13 Aug 2026 17:02:38 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=QwDTwmkibHoKcp20cY3Hp8KIwEoeVpLJCCWpdF9QmFT+GCH2o+easNsXL3GgVCOhOOw3/R6abZ5uT8xgJI8OxBA6hvfq4jtTxVBa+CUDN3HBrd1UJiWyU55NW5ehXMBP8ofY1JvRpsXdrsQMYrLHuOuRG9mFHAZWw7IlLwlK/wazTuwzPv+ZP7QCzfs/7B33GbMhB4iGIyYeQifLMehZ261xuW8DVbhDK1YKCYf+Yz5CgQXhVw26oBewLpwGMka7wBUSxdvwVIw/cWMgHOh00pxP3heFLlZgL0h+9oSTGz/D5fIVjr8dBADbGr7ZDx7ItsLYp5xYRf1IlSSVpdovhw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=U0OEGouVi6BybDuoLEpQOjDGHQksohogcfv1bHu5pB4=;
 b=dbWy1Pb2bsxdcKd4l/X25YoQxoK3Ln2J4AanCq9+QQWTZj3RSPLGXSBC7Jjmiu1yiXFHPgmXnoIKmdTqp1hEHgWhlS3YRQX4E1dJGs/c50putVFTL0RkEepknmRVn/msucXTT5mAtaqJDvRVykewnPUW3sWEkoToJZW81igItGU3wYRVrtL28t48nA4AdABbm6oZmhus4BREgyvRDtqGXMubY3HOUk17yYS4gQi139kJ1U/mziSPyeCv1LQFHEZMaFOebwXa2F8yiXszEEqrggBAar4LvipY/Y29EXDnhuSxrdAo5bHVdzE0uNVXxPha9Vf9MUv6fN7Gun0QvC4DkA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.118.232) smtp.rcpttodomain=oracle.com smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=U0OEGouVi6BybDuoLEpQOjDGHQksohogcfv1bHu5pB4=;
 b=sNWLpp2wk7lozshzcLlk7aXxzDgSvoS6se26voD/I87asXqcfR2xBKcsuQfOoBPvAG7+h8mJ1b/IN1mh+fKtoeAhph+SzhI+nNl1NsAdilBeVZolWQkXmIsZjJmwGI2vgghpkqWMR4dvtYjcRKahx5XFPU3RaCtb6N/oKVDgt+8clhm0JO/FLBTbnZofN/zQAg6pTEOS1kcqr0wsimdDbYxI0CML4jhLvUg6fT7Qz++uqd+LzsCwyFPWOUhhaBQs2dw1BWTs49INKaLmmPOMBAZ8G3TPwUYVR2JtrPkp+sSFVIM/bei1wEySVHfxh5FeNMnF8/WzxMuBgSqM6C/rWw==
Received: from PH8PR21CA0015.namprd21.prod.outlook.com (2603:10b6:510:2ce::12)
 by SN7PR12MB7883.namprd12.prod.outlook.com (2603:10b6:806:32b::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.315.15; Thu, 13 Aug
 2026 17:02:25 +0000
Received: from SJ1PEPF00001CE5.namprd03.prod.outlook.com
 (2603:10b6:510:2ce:cafe::84) by PH8PR21CA0015.outlook.office365.com
 (2603:10b6:510:2ce::12) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.339.5 via Frontend Transport; Thu, 13
 Aug 2026 17:02:25 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.118.232)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.118.232 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.118.232; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.118.232) by
 SJ1PEPF00001CE5.mail.protection.outlook.com (10.167.242.21) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.339.3 via Frontend Transport; Thu, 13 Aug 2026 17:02:25 +0000
Received: from drhqmail202.nvidia.com (10.126.190.181) by mail.nvidia.com
 (10.127.129.5) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.46; Thu, 13 Aug
 2026 10:02:06 -0700
Received: from drhqmail202.nvidia.com (10.126.190.181) by
 drhqmail202.nvidia.com (10.126.190.181) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Thu, 13 Aug 2026 10:02:05 -0700
Received: from build-bwicaksono-noble-20260804.internal (10.127.8.11) by
 mail.nvidia.com (10.126.190.181) with Microsoft SMTP Server id 15.2.2562.46
 via Frontend Transport; Thu, 13 Aug 2026 10:02:04 -0700
From: Besar Wicaksono <bwicaksono@nvidia.com>
To: <john.g.garry@oracle.com>, <will@kernel.org>, <james.clark@linaro.org>,
	<mike.leach@linaro.org>, <leo.yan@linux.dev>, <mark.rutland@arm.com>,
	<alexander.shishkin@linux.intel.com>, <jolsa@kernel.org>,
	<irogers@google.com>, <adrian.hunter@intel.com>, <peterz@infradead.org>,
	<mingo@redhat.com>, <acme@kernel.org>, <namhyung@kernel.org>
CC: <linux-tegra@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-perf-users@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<tmakin@nvidia.com>, <vsethi@nvidia.com>, <rwiley@nvidia.com>,
	<skelley@nvidia.com>, <rajjoshi@nvidia.com>, <treding@nvidia.com>,
	<jonathanh@nvidia.com>, <mochs@nvidia.com>, <sauravsc@amazon.com>, "Besar
 Wicaksono" <bwicaksono@nvidia.com>
Subject: [PATCH 1/2] perf vendor events arm64: fix swapped MetricGroup for Tegra410 L1 prefetcher metrics
Date: Thu, 13 Aug 2026 17:01:54 +0000
Message-ID: <20260813170155.1156593-2-bwicaksono@nvidia.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260813170155.1156593-1-bwicaksono@nvidia.com>
References: <20260813170155.1156593-1-bwicaksono@nvidia.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-NV-OnPremToCloud: ExternallySecured
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ1PEPF00001CE5:EE_|SN7PR12MB7883:EE_
X-MS-Office365-Filtering-Correlation-Id: 7fc53cd9-a6b8-4c11-b36f-08def95ca64f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|23010399003|82310400026|36860700016|376014|7416014|10067099003|56012099006|6133799003|3023799007|11063799006|18002099003|22082099003|921020;
X-Microsoft-Antispam-Message-Info: +Qs5KPxn/PjG7Ct7qmLp3NRvGr7qxWCf/PB89wENdJFzKFSN3JzRtaBULObN729GHWV3IMBzZ/2Sr6ogEsXsY2bvQTQyurEU0dUce4MbYnPOB5lEDUxrhq3vSBTY7Tczt6h1u7laHuReMkZ1s4BizbveFNUbRFujUGPWQyD9Xjhzl2rJNDBSgpq4oKwmIXMmURAbwYXviqDGUWOe/zQF1fAUyklkPKD6oXfBXxwRvom9uE1ur63OJuF1UzZzviTpguv479ODcKTYM2KbuE0mfZ5iIRprbdMJ0sCBH+bfHwzrk2rLacyabUQ0ErEaPT4rCmQ1qdYNwi9QCKoBb4OugewwZqIKt5bywUqj7VRsQrg4hxVq+54Nxs0FdMBA/CU1cfqX1wlhl6NoyZBttbtsraZ+salzS5bn6m6a6HV+lUFiDzijezXKGCiRAnvG9Tci9qNXB7lQeKXaoZXARUVfrplUankzO4mgTfIiODkxLLzsJQQ/HMfaQPfRgfMpSnIpF+iqayCEX2xoQsJ16UqpEpUzO0L9oPGhmyFAmoAtXpSLtdooZzDr9HVh1/YuOP6c6aaIx9P5H88RleKbejzsh43v5WfiYKx/8WvJpRWC8XFdsXEW/ni8Igm39Nf7M09H5ezkRKJ70ShycyDgZcUjjBHblvaV7uAQik4w0lG83PVxg+xilakXpDn7DL/772vdlXmvRMD8iMB6cOy+ZVNX+QYBanxNS5lr2dKMhItSWMiDVEWSRWunN8kS+e/cGgA6
X-Forefront-Antispam-Report: CIP:216.228.118.232;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc7edge1.nvidia.com;CAT:NONE;SFS:(13230040)(1800799024)(23010399003)(82310400026)(36860700016)(376014)(7416014)(10067099003)(56012099006)(6133799003)(3023799007)(11063799006)(18002099003)(22082099003)(921020);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: i2mmuEsBsx8fL4G/9Ltd+kphc7H8eBRLcZQ06+QzQZjhYC1ntqDjr+rDWlBtCFB9eE4DoXK0+uzcqU+iBgdSfZuU94m5Lo8gwS7WRV+mEvlVMYmvNPTP01tU5ls83xYnoUinFhIjtOzQu2KORPTdtJGl8hZEa6Qq4ljKafTVbwWz5nbiQ4H3zSeiMoNUfR8lp1STuDI+kLp/eLPWwtSvbwtEuIj0/hfdfmfyNlTK0NQip9hE3bpAMr+se8IlvxxC8peJ1hELarKYnJY2c3Sbv68vNv6+IYh3Gdb8muP9gxSACHivLBQAvTHYmcj/R7O3jV08q7z84iz5lmp3dvWJwg9U7euKwesabvRyqcwMgTtxyAUxsfagrO+JnunVICPYx0LdiQh9K8KGtt12CbBodPNj7vY+ZzodJY1eZ4QVGi09doSnzfKKBdCWcyy+5cxq
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Aug 2026 17:02:25.5463
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 7fc53cd9-a6b8-4c11-b36f-08def95ca64f
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.118.232];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: SJ1PEPF00001CE5.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR12MB7883
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260813_100237_778743_24837C50 
X-CRM114-Status: UNSURE (   9.02  )
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

From: Saurav Sachidanand <sauravsc@amazon.com>

The L1D prefetcher metrics (l1d_cache_rw_miss_ratio, l1d_demand_accesses,
etc.) were incorrectly assigned to MetricGroup "L1I_Prefetcher_Effectiveness"
and vice versa. This causes 'perf stat --metric-group L1D_Prefetcher_Effectiveness'
to display L1I metrics, which is misleading.

Swap the MetricGroup assignments so L1D metrics are in the L1D group and
L1I metrics are in the L1I group.

Fixes: 86ff690f45cc ("perf vendor events arm64: Add Tegra410 Olympus PMU events")
Signed-off-by: Saurav Sachidanand <sauravsc@amazon.com>
Reviewed-by: Besar Wicaksono <bwicaksono@nvidia.com>
---
 .../arch/arm64/nvidia/t410/metrics.json       | 28 +++++++++----------
 1 file changed, 14 insertions(+), 14 deletions(-)

diff --git a/tools/perf/pmu-events/arch/arm64/nvidia/t410/metrics.json b/tools/perf/pmu-events/arch/arm64/nvidia/t410/metrics.json
index b825ede03f54..59474ccb7417 100644
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
2.43.0


