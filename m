Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9D383606A31D
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 19 Oct 2026 16:45:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=LVfyPrCA;
	dkim=pass (2048-bit key, unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=mnHB/XVJ
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=tVM4wMZNTfPe+Zrk/eElS4oqlGIM+YRnT34ojS6gxQw=; b=LVfyPrCAZ1K35Z+YqzLd61YxbS
	KC/B8gYS6eQMMygs4PsCbK7jFeWlmT7w7s4pcMvsjARddKDK2cWdt9mCYS/pIFPnpxKr4lS3Xy/bC
	BOiuM74MGySx/6sVPg9wD6pHurqncWkUpeFVt3U46ShA3ugJhE6923oJR3CkTZIrQsA3ypo5oE9ea
	+ZNpfp/OQiWeZ2AHDbaiOPPaWQwKVtSIPgxw7JfeEFTSAJUwEKq9XBIjA/76fU0fL5IE2pxy53a9e
	pmgiV7iaqPfpUjhIl00vahoLvsuW9iHsm0lM9UsjfufasJyGBfWLpQY90nnotY2qDrWCIvDUEk6h0
	ArMNDoKw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xIqUB-000000080oq-0eMT;
	Mon, 19 Oct 2026 16:45:19 +0000
Received: from mail-northcentralusazon11012013.outbound.protection.outlook.com ([40.107.200.13] helo=CH5PR02CU005.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xIqU0-000000080iE-0yXg
	for linux-arm-kernel@lists.infradead.org;
	Mon, 19 Oct 2026 16:45:09 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Sx8cCYfH4zSaaPhs0cc1LFBZWBgVbJLm5x5+9ogIloEylv7rOCfVzwQ3MPEqjcuuMUaK4DRziJgiZCvq6J/xSlIDlfYQ711b7BfCJYilm8fu/pEZk6KOXgezZ9/VogmCA/s3Prd116y7dgcvaGrVTzeLo9JKlCoGsgB9tJ+T/txxgiEgDtM7KXQIGyNr8hdYDv2rF8ZK2N00TUD5LwLpjodv3Pfe2xZyzocq4FMMiuM0GsjYhvhhRpdQ+sltNju+UtZiZ07IIxL8lzhn8ptz7K+0GQcoKXosC6HunXfeYK9Zb6y0nVHjJfmd/9nZvpmD9Ij8ci98PHr3Rrrj3wi+uQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=tVM4wMZNTfPe+Zrk/eElS4oqlGIM+YRnT34ojS6gxQw=;
 b=Zsi9i5NG4OjXL/xXfA6iq9TjobRIjgIaP5FNpFdJQ5qp11ByArN80F3d11T41Zcnj7OdEFYjyJh6x+ANAXhrgc2MHmTNhirsLEKwZTFg+ATLa+4m53TUJ+hdWz7Dh0zZfGoWEkPdhqhkAGDd/j1rqh4ruP6UhFGQMaQ2aNhPT1YTxKIqLChJUcWRzOI998hhc+lC3tJtxseUjOOyUs+Ybywse3OCDKdPq7zfqYkZuv+4q/me/UMX0csb3YNFjI5Rg4CMJ/g+NmvzTbo55RKrskH0ZXBiWHWzpwhRhUNmklPMO4ClRltWhA6ifUpe0FcfPNs7PMmG6fJR/h45+PraLA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.160) smtp.rcpttodomain=kernel.org smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tVM4wMZNTfPe+Zrk/eElS4oqlGIM+YRnT34ojS6gxQw=;
 b=mnHB/XVJ/7asl2Csl6VxulbELmnguMc599neQ0EOLljzW9YHphap0jVAJbg9x5cS+EcZkIUgfrmnS978V3ePR50+7wH2bsqnABzCqTlCeanf4iRGnRWDrYl46CskB747rBm2jsLxSLannzXKUbsmS+L3w9E4C9LvnQRWshb1GPFIbXqhYZBDF6JLXZyuaS5/oKDttGUY6DMjFoRIq0r87lRk2maWnaiduU6eaBd29oxUIUd/KbkjU4/hw9djOto7BKKvm69spY9JiVPelIdGoY+8uov/ROOO0wI0og05ObHAxbI3+NeLel5QKqW+T/U7wd+sQC58gTWfp7Sm4fG7dg==
Received: from BL1PR13CA0359.namprd13.prod.outlook.com (2603:10b6:208:2c6::34)
 by CH3PR12MB9730.namprd12.prod.outlook.com (2603:10b6:610:253::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.522.17; Mon, 19 Oct
 2026 16:45:00 +0000
Received: from BN2PEPF00004FBF.namprd04.prod.outlook.com
 (2603:10b6:208:2c6:cafe::c) by BL1PR13CA0359.outlook.office365.com
 (2603:10b6:208:2c6::34) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.428.7 via Frontend Transport; Mon, 19
 Oct 2026 16:44:59 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 216.228.117.160) smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.160 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.160; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.160) by
 BN2PEPF00004FBF.mail.protection.outlook.com (10.167.243.185) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.522.6 via Frontend Transport; Mon, 19 Oct 2026 16:44:59 +0000
Received: from rnnvmail203.nvidia.com (10.129.68.9) by mail.nvidia.com
 (10.129.200.66) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.56; Mon, 19 Oct
 2026 09:44:35 -0700
Received: from rnnvmail202.nvidia.com (10.129.68.7) by rnnvmail203.nvidia.com
 (10.129.68.9) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.49; Mon, 19 Oct
 2026 09:44:34 -0700
Received: from build-bwicaksono-noble-20260804.internal (10.127.8.11) by
 mail.nvidia.com (10.129.68.7) with Microsoft SMTP Server id 15.2.2562.49 via
 Frontend Transport; Mon, 19 Oct 2026 09:44:34 -0700
From: Besar Wicaksono <bwicaksono@nvidia.com>
To: <acme@kernel.org>, <namhyung@kernel.org>, <irogers@google.com>
CC: <linux-tegra@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-perf-users@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<vsethi@nvidia.com>, <rwiley@nvidia.com>, <skelley@nvidia.com>,
	<mochs@nvidia.com>, <rajjoshi@nvidia.com>, <treding@nvidia.com>,
	<jonathanh@nvidia.com>, <john.garry@linux.dev>, <will@kernel.org>,
	<james.clark@linaro.org>, <mike.leach@arm.com>, <leo.yan@linux.dev>,
	<mark.rutland@arm.com>, <alexander.shishkin@linux.intel.com>,
	<jolsa@kernel.org>, <adrian.hunter@intel.com>, <ctshao@google.com>, "Besar
 Wicaksono" <bwicaksono@nvidia.com>
Subject: [PATCH 5/6] perf jevents: Add support for NVIDIA Tegra410 CPU Memory Latency PMU aliasing
Date: Mon, 19 Oct 2026 16:42:40 +0000
Message-ID: <20261019164241.403644-6-bwicaksono@nvidia.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261019164241.403644-1-bwicaksono@nvidia.com>
References: <20261019164241.403644-1-bwicaksono@nvidia.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-NV-OnPremToCloud: ExternallySecured
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN2PEPF00004FBF:EE_|CH3PR12MB9730:EE_
X-MS-Office365-Filtering-Correlation-Id: e5dd9026-78d8-4219-ae96-08df2e005079
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|23010399003|376014|1800799024|36860700016|7416014|82310400026|56012099006|11063799006|261009223027099003|10067099003|18002099003|22082099003|6133799003;
X-Microsoft-Antispam-Message-Info: jTG01L8WOnVFa7vH2b7A61s8tkrLbZxsgm6tLI8NBNbiQkj9ayhuu+j6wbkgKwjPTC0FWsbTybPelS+I1hMeR2EmcFZjbhntcCfqXAKajrJSz4Eh0Ia+VPjri/KaJef/iJrIREw9uhOH2YDABr30fq76eBGF3yMWOeguVBnfowVOMiQUyauu8YiiVupT1cWzJK+7rUMbYjo2FiAc0ZnSH9HdJ1pWo5Ucwa9ewXo1ULQo7rtOkkYMmgWxG5IeowWoWEt/cv5i389pW5WWkqJp8sFaybjqJVmCyVV/KXD4yJ1K/COnA6KfLoi3tuBX/3gGpOJ8JqK3b0uIY1cjK5Dj08CR2nryUicEJQKIuNDDKLy75mvG+rnlQHlhDUFxmicPQUdlaZSLXEkxvwETqVHbIZjbV44R8NZ6YetAq98SaS/4GuvUELnlEf4z1WTfc55om4CJZHzBxwfY6fxZ+MPRWBmF+8jSWvy4oiTLApsRppB81opHL65gJNoK8G1CLFdvZuXN/SwjV3zTNhfD4Pov1eOUyUxQQ1wlZYbhhCRPe/wzOkaKh7RKLhmpg9UoS3JdmPffAjro4k/ofMgWzOhkb+9LbKR9WymRQX3jnIG/nXHXbD+nZQferMSWv0a1iynssmZZj1N85aa5fItxhkggjcEtMobL3Tc2xVJ0+6v6yC26vFLBvtdUPRjxonHv+OzNQE9NNtLjzceO2jK+EcHXHQ==
X-Forefront-Antispam-Report: CIP:216.228.117.160;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge1.nvidia.com;CAT:NONE;SFS:(13230040)(23010399003)(376014)(1800799024)(36860700016)(7416014)(82310400026)(56012099006)(11063799006)(261009223027099003)(10067099003)(18002099003)(22082099003)(6133799003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: hwN5tacnTrjRwAYTztLG7mLSG+Xb+Dp7zkPKOj3Ebs/bH+nAMnSVf6dkXTCnFTpLl/YmGdCgxi2+fRHuSuv9fs/9xzStAZ0RICGqRbbvxxgbLZzv1ysS8tZ9BMJAHAtdlAR+iL5lYzvCypm5zjqpFw4oOX1pPSK7OHuBjqKva/W60fa9eYuwf0g/HGeW8CH9vwofPZcx1grAMXsUac/dqgKQSz6za16DgA3VUp305ebpKKE21UKh+PVL6foUiuU5m0pttlAvfqdtYBPhBbK3+ZHTphfpSx+7lomKjANhRmBAOtN+J1O4i7asV1KY7Tl1/qdVZzOdQOxB5jNdnf1mKbsfhRS8GMHZU62QIrYmdtqkZp3msPMQ/RpnZDa7A6dpG4cpIj6QIHXnV+iDPdLJQHkjp0aFuGdKqWckU2XSGLdU7Oa8TXpgCPcfeEDsqd33
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Oct 2026 16:44:59.3666
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: e5dd9026-78d8-4219-ae96-08df2e005079
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.160];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: BN2PEPF00004FBF.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR12MB9730
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261019_094508_307688_5DE2BB41 
X-CRM114-Status: GOOD (  13.27  )
X-Spam-Score: -2.4 (--)
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
X-Spam-Status: No, score=-19.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,RCVD_IN_DNSWL_BLOCKED,RCVD_IN_ZEN_BLOCKED_OPENDNS,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Add alias support for NVIDIA Tegra410 CPU Memory Latency PMU events.

Signed-off-by: Besar Wicaksono <bwicaksono@nvidia.com>
---
 .../arm64/nvidia/t410/sys/uncore-cpu_mem.json | 48 +++++++++++++++++++
 1 file changed, 48 insertions(+)
 create mode 100644 tools/perf/pmu-events/arch/arm64/nvidia/t410/sys/uncore-cpu_mem.json

diff --git a/tools/perf/pmu-events/arch/arm64/nvidia/t410/sys/uncore-cpu_mem.json b/tools/perf/pmu-events/arch/arm64/nvidia/t410/sys/uncore-cpu_mem.json
new file mode 100644
index 000000000000..85ebe6fa20e2
--- /dev/null
+++ b/tools/perf/pmu-events/arch/arm64/nvidia/t410/sys/uncore-cpu_mem.json
@@ -0,0 +1,48 @@
+[
+    {
+        "EventCode": "0x0",
+        "EventName": "CMEM_CYCLES",
+        "BriefDescription": "Counts elapsed MSN bridge cycles for the CMEM read-latency counters.",
+        "PublicDescription": "Counts elapsed Memory Switch Node (MSN) bridge cycles for the CMEM read-latency counters. All MSN instances share this clock, so the count is read from the first instance.",
+        "Compat": "NVDA2021",
+        "Unit": "nvidia_cmem_latency_pmu_"
+    },
+    {
+        "EventCode": "0x1",
+        "EventName": "CMEM_RD_REQ",
+        "BriefDescription": "Counts local CMEM read requests at the edge of the UCF (post SLC), in 32-byte units, from all requesters.",
+        "PublicDescription": "Counts read requests at the edge of the Unified Coherence Fabric (UCF), after the System Level Cache (SLC), to local CPU DRAM (CMEM), at 32-byte granularity. A read of up to 32 bytes adds one; a 64-byte read adds two. It counts reads from all requesters, local and remote, summed over all Memory Switch Node (MSN) instances and channels. There is no requester or security-state filtering.",
+        "Compat": "NVDA2021",
+        "Unit": "nvidia_cmem_latency_pmu_"
+    },
+    {
+        "EventCode": "0x2",
+        "EventName": "CMEM_RD_CUM_OUTS",
+        "BriefDescription": "Accumulates the in-flight read requests counted by CMEM_RD_REQ each MSN bridge cycle.",
+        "PublicDescription": "Accumulates the in-flight read requests counted by CMEM_RD_REQ each Memory Switch Node (MSN) bridge cycle. Pair the two for the average read latency.",
+        "Compat": "NVDA2021",
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
+        "Compat": "NVDA2021",
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
+        "Compat": "NVDA2021",
+        "Unit": "nvidia_cmem_latency_pmu_"
+    }
+]
-- 
2.43.0


