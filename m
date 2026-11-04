Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 16017606A326
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  4 Nov 2026 16:10:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=FLmzvgEt;
	dkim=pass (2048-bit key, unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=rfjnJQ3y
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=mvSUPbzCTjJJThI2f3r9MxLiZ1SBhclZHyCEEOagJ2E=; b=FLmzvgEt6u3zL6an/Ph4aVWgh+
	RS8pVfbRbHp7WJuuV0b6t94ZF8ykZDyDucqY3cYQ+2mOc9Pgmqz2pCj3LJC1hzs/rLcmkOY4oPHGy
	SW1diNLBr+4iAHOCETj4E/4faq8t0nrn4kE0MAEjMTJJ3NHkl/tmY/bYIV3xRUDgv39apPGW/CKtF
	Y5K3lOMX+GaNqIDMROA27jHxJyXH8BMI79GM3r8jOhf5HQaaPcJ3dlwdq2S7aSN+c9SD3PRtIQG9c
	JRq6bji2LB/WzO9wzYtPhFjYtVOuJMOxyx5gdEU2kFl+gnNdQfhUtxRaqDJ0g3dC15Dj4hMN8Rs4N
	8jn6L1uw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOdZO-00000005u46-30ci;
	Wed, 04 Nov 2026 16:10:38 +0000
Received: from mail-southcentralusazlp170110003.outbound.protection.outlook.com ([2a01:111:f403:c10d::3] helo=SN4PR0501CU005.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOdZL-00000005u3S-1T2E
	for linux-arm-kernel@lists.infradead.org;
	Wed, 04 Nov 2026 16:10:38 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=vywjAeCwIqbslusU1Bryv3mJ1fhAq7QCgPWN8layqsTlP6KzVJ5rjfiD7JJaZSDDPAafkK/+b422WLXA/PuAujJ9Z9+b31fj7MWrzOjVerwc3chP3C1aYLBrsOgVlgEFbj3Uyt4ZOeacdc2LLRf8otgWQ72YGQ1cclUwjSTFzlesnMDspsrbrBGYfI2f9ypOgJpeH2VJNfUF28ZNSdyq31vS/cHFtQbbhh4+cWmSkUuMrK7XWRIlhCcPLuwyfgsanLaJJakZciP19s215ZCXXqI6SBcS3dtDOCEjuhek7YG332nDNQonNH2PrHRHPQgbaKpV2+OqnF3HkWH+HOP7ug==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=mvSUPbzCTjJJThI2f3r9MxLiZ1SBhclZHyCEEOagJ2E=;
 b=dnfCITW172JCXJ4E1wW/HDQ11CXGSeM3Rrf9y5hnqnjuoGhjw7wN4ReAy2eZT5hDwn7xkweWSIj1E1H/92+0hTd+7pGZHtIENUxYomchfZooHzG55VtMp8NZktb70LwQHMGr/4MRTmnP8JbRcHK4dcZqDZRVnRr3OAS9huHRF4RgJh6ePc4BXt6OcoqHaISAKeJSAtMhUyyXBga7adZTYE3OBXRfxGaX5jCTFF8vCWVC/9tOG6cRQjstp88sAbjY9x2GuG7aWG5884lfS56zcrUtQ9O1vsJh9WAxCorl6JeoTyBgq3blZ0ByLJizVnfECW0uxHlFlJ85QjeSzqgMxQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.161) smtp.rcpttodomain=kernel.org smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mvSUPbzCTjJJThI2f3r9MxLiZ1SBhclZHyCEEOagJ2E=;
 b=rfjnJQ3yNXLDqZ91R3sV4O6RqSdsVMUytih2ohFHVsEl4x/PQt0jIVx2PcZ95KF///9U4uYTydoEj2y7RuUkBG1kxElICcChXRpFZPv4jHjEwoeicM5hdopDoWZ9fr2FS/4lR6scHeotb8lZ/xhep4A0ieBPpjYSdRTcgMvA+Kd4Yyh7gcUHMZVwHDeNwFpfcuaMSLKHTkxmSFXE1xCI8KGrUUrJfrbGoBPUnTtlmKpmr9GBHMGxTdx8isaPNAxZt6Ue4QzwjQ0xHMcV3Vi/0nxIkR+9/qZILSpwtZauUWgmwIl9MDJf/jFgrxH06W405dWCA1ffE0k1JYHxVmmLyA==
Received: from PH0PR07CA0108.namprd07.prod.outlook.com (2603:10b6:510:4::23)
 by BL1PR12MB5825.namprd12.prod.outlook.com (2603:10b6:208:394::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.592.8; Wed, 4 Nov 2026
 16:08:29 +0000
Received: from CY4PEPF000392D7.namprd03.prod.outlook.com
 (2603:10b6:510:4:cafe::83) by PH0PR07CA0108.outlook.office365.com
 (2603:10b6:510:4::23) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.592.10 via Frontend Transport; Wed, 4
 Nov 2026 16:08:26 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 216.228.117.161) smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.161 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.161; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.161) by
 CY4PEPF000392D7.mail.protection.outlook.com (10.167.247.117) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.592.5 via Frontend Transport; Wed, 4 Nov 2026 16:08:26 +0000
Received: from rnnvmail204.nvidia.com (10.129.68.6) by mail.nvidia.com
 (10.129.200.67) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.56; Wed, 4 Nov
 2026 08:08:00 -0800
Received: from rnnvmail204.nvidia.com (10.129.68.6) by rnnvmail204.nvidia.com
 (10.129.68.6) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.56; Wed, 4 Nov
 2026 08:08:00 -0800
Received: from build-bwicaksono-noble-20260804.internal (10.127.8.11) by
 mail.nvidia.com (10.129.68.6) with Microsoft SMTP Server id 15.2.2562.56 via
 Frontend Transport; Wed, 4 Nov 2026 08:07:58 -0800
From: Besar Wicaksono <bwicaksono@nvidia.com>
To: <acme@kernel.org>, <namhyung@kernel.org>, <irogers@google.com>,
	<ctshao@google.com>
CC: <linux-tegra@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-perf-users@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<vsethi@nvidia.com>, <rwiley@nvidia.com>, <skelley@nvidia.com>,
	<mochs@nvidia.com>, <rajjoshi@nvidia.com>, <treding@nvidia.com>,
	<jonathanh@nvidia.com>, <john.garry@linux.dev>, <will@kernel.org>,
	<james.clark@linaro.org>, <mike.leach@arm.com>, <leo.yan@linux.dev>,
	<mark.rutland@arm.com>, <alexander.shishkin@linux.intel.com>,
	<jolsa@kernel.org>, <adrian.hunter@intel.com>, Besar Wicaksono
	<bwicaksono@nvidia.com>
Subject: [PATCH v3 4/7] perf jevents: Add support for NVIDIA Tegra410 CPU Memory Latency PMU aliasing
Date: Wed, 4 Nov 2026 16:07:13 +0000
Message-ID: <20261104160716.2910873-5-bwicaksono@nvidia.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261104160716.2910873-1-bwicaksono@nvidia.com>
References: <20261104160716.2910873-1-bwicaksono@nvidia.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-NV-OnPremToCloud: ExternallySecured
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY4PEPF000392D7:EE_|BL1PR12MB5825:EE_
X-MS-Office365-Filtering-Correlation-Id: 7beb87d1-1c5e-42f1-85e5-08df3a8ddbc7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|7416014|376014|23010399003|36860700016|82310400026|261022105027099003|261021121427099003|11063799006|56012099006|261009223027099003|261026140227099003|261102123227099003|261022075727099003|261028144727099003|10067099003|6133799003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info: RFn75JxqrZYM6pSQgE6u401b4UwtOi6Zwq0t9xw9KayAcegPxgsN4BQZ9tY8GDkHHJTHcOFo7yAYuo8mqjnGbRsgT7QorufdOYLJ9FX998Z35EexeU9tt+S4UfmZAhZwwsT0p/UtpC5klrqiudMaF1jbaq102UiKZHakZY+VwlQ7QsvNDypVuHZs09h38BevM7BWsUR/SDeBMox5MxLZVuElG/oys6BsvGkKcICF0RpbRm0CfUlVmRocQ+BNpbgEsy9BHHyhS6fEgoDsnDkwOMUtcGD2Y8+IZYF+lBTnH1Qi+JplJ35CHox6xtCaPV8/LiWwxo9WiJDxkwFn1uCZ4k1hmYtLp9cnLAP7SFwKEIuy4o5A9R0IXOw60Q99kSwegTTrQQe92ocMsOAn3WJtZMrn/J7L6J7MZnSDOO5gZ15G2tfpsc8caxWKsikACAMgFqjxsLYaiEpweoiMZMY7fqpWrosWvRZI1xLQwiACCEpSvhEfDchnT6xjq+1bxi8cSWHjoVSWSlX5wA+gwPHaz5p1G179bfPEH0AbwwiNWevILz2IEQmuI98PFsp4a0t8YAmdZDgkhgDC6hVVkk5/dD2Na2qgIuB7KxHrDsRHZ5vWWUrwFLjyqn7hsu7wKKdKrK9qTL/7eg2vfV/7zHe6IQ9ChOkmsk36/dAXqaHgIBxVC63dn+CXrPX6FXOcLiD/kL//Lxkq1s+6hFz82NnkwQ==
X-Forefront-Antispam-Report: CIP:216.228.117.161;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge2.nvidia.com;CAT:NONE;SFS:(13230040)(1800799024)(7416014)(376014)(23010399003)(36860700016)(82310400026)(261022105027099003)(261021121427099003)(11063799006)(56012099006)(261009223027099003)(261026140227099003)(261102123227099003)(261022075727099003)(261028144727099003)(10067099003)(6133799003)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: AY5dl0cstUM23NtPNEScZz8cTY4bUnL1jnjGtbqdCT8PwQD5Tal/f2UPqbztKtjhrMal9B6Ppc/pqKUv3rpYVNwEBoLvraKkYtMvHMbQNUVrR/TNogGz3SnfRvFpDorwrHNg8afm5XAGZHoBARh1Uw7bvk2+m8IlPNiD/RPE0wYFGbq2InrBEeIEYGEpfB+DZHq6A6uqkXx6Y+sJBXS+i0seOyb8LO+yXu16B42Z63Kj/v6xzg5j1fs35rLr0Y/MBxCmCJBJoF4TO+81Xehe+J0Sy1Wt1WA4wwrqKLA7fkraaXo4Bp9mQ2r/CnYN+f792wb5YUxjNkP0/U+zreP6/s22AEWuzK7KkA1M8XH+26zto3PlP1DQgSPXmNX6adQXpUGHV3vILK/AZgjhJaVa9w8+8ebvX/LSFo7RKpHo2p8fLXfEQouRDHD5Y2YSXXLL
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Nov 2026 16:08:26.1044
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 7beb87d1-1c5e-42f1-85e5-08df3a8ddbc7
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.161];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: CY4PEPF000392D7.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL1PR12MB5825
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261104_081035_414496_4BA8C5FF 
X-CRM114-Status: GOOD (  14.06  )
X-Spam-Score: -2.1 (--)
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
X-Spam-Status: No, score=-18.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Add alias support for NVIDIA Tegra410 CPU Memory Latency PMU events.

Signed-off-by: Besar Wicaksono <bwicaksono@nvidia.com>
---
 .../arm64/nvidia/t410/uncore-cpu_mem.json     | 43 +++++++++++++++++++
 1 file changed, 43 insertions(+)
 create mode 100644 tools/perf/pmu-events/arch/arm64/nvidia/t410/uncore-cpu_mem.json

diff --git a/tools/perf/pmu-events/arch/arm64/nvidia/t410/uncore-cpu_mem.json b/tools/perf/pmu-events/arch/arm64/nvidia/t410/uncore-cpu_mem.json
new file mode 100644
index 000000000000..bb7907935d6b
--- /dev/null
+++ b/tools/perf/pmu-events/arch/arm64/nvidia/t410/uncore-cpu_mem.json
@@ -0,0 +1,43 @@
+[
+    {
+        "EventCode": "0x0",
+        "EventName": "CMEM_CYCLES",
+        "BriefDescription": "Counts elapsed MSN bridge cycles for the CMEM read-latency counters.",
+        "PublicDescription": "Counts elapsed Memory Switch Node (MSN) bridge cycles for the CMEM read-latency counters. All MSN instances share this clock, so the count is read from the first instance.",
+        "Unit": "nvidia_cmem_latency_pmu_"
+    },
+    {
+        "EventCode": "0x1",
+        "EventName": "CMEM_RD_REQ",
+        "BriefDescription": "Counts local CMEM read requests at the edge of the UCF (post SLC), in 32-byte units, from all requesters.",
+        "PublicDescription": "Counts read requests at the edge of the Unified Coherence Fabric (UCF), after the System Level Cache (SLC), to local CPU DRAM (CMEM), at 32-byte granularity. A read of up to 32 bytes adds one; a 64-byte read adds two. It counts reads from all requesters, local and remote, summed over all Memory Switch Node (MSN) instances and channels. There is no requester or security-state filtering.",
+        "Unit": "nvidia_cmem_latency_pmu_"
+    },
+    {
+        "EventCode": "0x2",
+        "EventName": "CMEM_RD_CUM_OUTS",
+        "BriefDescription": "Accumulates the in-flight read requests counted by CMEM_RD_REQ each MSN bridge cycle.",
+        "PublicDescription": "Accumulates the in-flight read requests counted by CMEM_RD_REQ each Memory Switch Node (MSN) bridge cycle. Pair the two for the average read latency.",
+        "Unit": "nvidia_cmem_latency_pmu_"
+    },
+    {
+        "MetricName": "cmem_freq",
+        "MetricGroup": "CMEM_Frequency;CMEM_Read_Latency",
+        "MetricConstraint": "NO_GROUP_EVENTS",
+        "MetricExpr": "(CMEM_CYCLES / aggr_nr(CMEM_CYCLES)) / 1e9 / duration_time",
+        "ScaleUnit": "1GHz",
+        "BriefDescription": "MSN bridge clock frequency of the CMEM read-latency counters.",
+        "PublicDescription": "Average Memory Switch Node (MSN) bridge clock frequency over the measurement interval. This is the clock of the CMEM read-latency counters.",
+        "Unit": "nvidia_cmem_latency_pmu_"
+    },
+    {
+        "MetricName": "cmem_avg_rd_latency",
+        "MetricGroup": "CMEM_Read_Latency",
+        "MetricConstraint": "NO_GROUP_EVENTS",
+        "MetricExpr": "(CMEM_RD_CUM_OUTS / CMEM_RD_REQ) / cmem_freq",
+        "ScaleUnit": "1ns/request",
+        "BriefDescription": "Average local CMEM read latency from the edge of the UCF (post SLC) to CPU DRAM, for all requesters.",
+        "PublicDescription": "Average latency of the read requests counted by CMEM_RD_REQ, from the edge of the Unified Coherence Fabric (UCF), after the System Level Cache (SLC), to local CPU DRAM (CMEM).",
+        "Unit": "nvidia_cmem_latency_pmu_"
+    }
+]
-- 
2.43.0


