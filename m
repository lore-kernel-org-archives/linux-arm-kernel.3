Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 664A4606A31A
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 19 Oct 2026 17:00:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=AZZfAcNz;
	dkim=pass (2048-bit key, unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=IB7tFqA5
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=BxOFuWfHCobRcTLmWpyLhiNcwOEdVTys81sfY1IHbQM=; b=AZZfAcNzGwve7q5L+UhCrxXdCI
	rsMWJO1pE1b/TtA9jJqiKOUViFTlnuJ51iP/DcVfd/kXivX/LGP4KSe6TVH07NyRBNbMzWJDbs+wK
	+TH+OwTf2IaZ5irWUatEJn8ZWdWiyyJGx2VUNocXIZdHsLEYbFjaDzcBEVwB/PL1sSHU27PgqHQeS
	iAtB+B2efQbKSQdtGgEQSw4wGuU2wOtDfshwgddKmCXQBNZ/hjDItWwjcQEjQEJl2t3ahk8JhNMY4
	MwgE9OnrKmmkMACy3sMKp7BJjxU+NDcQ9Ku3vgqiP31eHGysB6AiKynR0C5L+N86Ot/dCAl18hOXC
	tloG/kMw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xIqU1-000000080ix-0VT8;
	Mon, 19 Oct 2026 16:45:09 +0000
Received: from mail-northcentralusazlp170100001.outbound.protection.outlook.com ([2a01:111:f403:c105::1] helo=CH1PR05CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xIqTw-000000080fX-0K5m
	for linux-arm-kernel@lists.infradead.org;
	Mon, 19 Oct 2026 16:45:05 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Ws9TaIK0Oic9rnYhqukM+W8a8PgDSt0DwuXXeqsuCOmS8m8euo3/icVxb4o1A1CHx/DozHmVZmT3OQQ0LZZOXqWBK5ypo+wUrodbSReA9S3fV72UEwtIY7tb3pcHFFsPnu6IFuZQvWbzN+rYnK++seK0C/C4mnhMbzGSSCmKGlaU7yV73+l8Z6Ui21bx0fi81FQeGAcWIufpZUupbxb0VWWCM+0gXCF/XfklxGyla9cN4cBUYxZseAfsvtF90hOHdDxd7A55jTGk8tXZhzQa96OcMi6LfamHUr6TM21IiFq84wgKIXCkeMn/nCIlD/f+l/KVA0WZjpOGlLGHQJivrw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=BxOFuWfHCobRcTLmWpyLhiNcwOEdVTys81sfY1IHbQM=;
 b=eUWN3z6uU6WhE+wL9lZHNZjNtHGXJoJ6zS3YNSLfjgs7ZUvRQc9xUT19nlc9Gr54QbRR2la7GGfBGohWahz90VrvwmC0lZO0v8xYBBzDtZSPEqOxruCwT+c9xTMOa2UoMVxMc4iulwdVxIfUQ+pYhDjuYDhbLmC2eBIEJU7aeQVnEieyTEPRUAA2uKaIE1itm1R1w5X7xeYCDrrWfo9rlp/2OQN4QaEW8yXJf3Na1odW7GSKv33gQn5k8L6xHXXlie5f2tSQ7h+rced1fVjAG+AONK+RdSyfY3EmPO/c7R12DC8zM8N0U5fXW4u8x1z3rZgoM6BnXWdcvjy2TWtmyg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.161) smtp.rcpttodomain=kernel.org smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=BxOFuWfHCobRcTLmWpyLhiNcwOEdVTys81sfY1IHbQM=;
 b=IB7tFqA5bmYNmrXOUA/ePe38avfdWMFSBYK+om8qwFv6avMM1e0MnbmbXqLlU01pC9hBAY8D/E8r0odj7D1/KSHILlzOp7S0SFY3GxdRxq02ogJbXJIKp5DU2kx95L4Fr4Srq31CLqBm5bINu9l+oaqEnRSiuwfq1Fi8nnoRDF/m9fmNE5iyqELeXCWY7WIYU/TSlaBfbpGTIm3M1m5G5t8aTom6n54gE1/p6++M3vhkl/5ojzSpp3ZS5+n04S3Jnm4XKdeXzU9fOW6X3Y+Er/F87emkgNlLWSq3yJMqiDRjXJH5s2uHa1Bc7kMI/HKbBJuVnO19cRTLvfEK5j4m+w==
Received: from SJ0PR05CA0085.namprd05.prod.outlook.com (2603:10b6:a03:332::30)
 by LV5PR12MB9753.namprd12.prod.outlook.com (2603:10b6:408:2b6::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.522.19; Mon, 19 Oct
 2026 16:44:56 +0000
Received: from PH3PEPF00059619.namprd05.prod.outlook.com
 (2603:10b6:a03:332:cafe::3f) by SJ0PR05CA0085.outlook.office365.com
 (2603:10b6:a03:332::30) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.546.14 via Frontend Transport; Mon,
 19 Oct 2026 16:44:56 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 216.228.117.161) smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.161 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.161; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.161) by
 PH3PEPF00059619.mail.protection.outlook.com (10.167.243.23) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.522.6 via Frontend Transport; Mon, 19 Oct 2026 16:44:56 +0000
Received: from rnnvmail202.nvidia.com (10.129.68.7) by mail.nvidia.com
 (10.129.200.67) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.56; Mon, 19 Oct
 2026 09:44:31 -0700
Received: from rnnvmail202.nvidia.com (10.129.68.7) by rnnvmail202.nvidia.com
 (10.129.68.7) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.49; Mon, 19 Oct
 2026 09:44:31 -0700
Received: from build-bwicaksono-noble-20260804.internal (10.127.8.11) by
 mail.nvidia.com (10.129.68.7) with Microsoft SMTP Server id 15.2.2562.49 via
 Frontend Transport; Mon, 19 Oct 2026 09:44:30 -0700
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
Subject: [PATCH 4/6] perf jevents: Add support for NVIDIA Tegra410 PCIE-TGT PMU aliasing
Date: Mon, 19 Oct 2026 16:42:39 +0000
Message-ID: <20261019164241.403644-5-bwicaksono@nvidia.com>
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
X-MS-TrafficTypeDiagnostic: PH3PEPF00059619:EE_|LV5PR12MB9753:EE_
X-MS-Office365-Filtering-Correlation-Id: 881e53af-18f1-4857-65ca-08df2e004eb4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|7416014|36860700016|23010399003|82310400026|1800799024|261009223027099003|10067099003|56012099006|6133799003|22082099003|18002099003|11063799006;
X-Microsoft-Antispam-Message-Info: 8FL0nc+UBcuRcjjKsc8kR1wSzWA/30bpM+YZMNXlYdwHEMEQsKMVlgpcOzKpefKMvKQ+aXHu06zmfQpMTl0E88eNe6Irqq8JNCqcknFS57Q9n40YSZZMQ6et0fKTfSlKMC+SdzVAQc2WZ1RjbEAitw7UOmiaCWI7vOWJBz3qfRyL8azXTrwWZUajJ9KZHw2OTtCJPNEzMswAG7qibpMo+1vcOkAo/lTqAfCTYi75dBCVp8LZKWBM++sJdY1lfsEGwYsNFLU3yg5EZpI0JCJO3KvXS88QPFSImQrksF7MIs7Oe9JH0tqyJpBx3h/Mz+4/TrXJ6jDxRfuhl+rVjft3t8cknvAs1IZALRdOA8ibsGctAcaqj5csyxvR5Um9gNFvDJqwdhRtkg2JGo8aiLmShlh1NLsB+vveBGOSfkbGs5kFd9nJwJ5ni4YWiqnb0s7u6UaFkcvlGQFvQ7XZtl1t8bWqu8NKVWDlYWdLhEZGzsdaJ+DuJjCz8LdNEqJCpRV5Fni5e0uEtvF6q3XkLEQ0RUaBkFCq17Vqzy8sdhI1KfagPC9Yvsp/v+/i6QxvFyNtB9pRGetO4asktX+NXU81ESabphdTCQiJfwawmMmHO7dyeqkng7qY1Fcg+73HMrVKRsqG4nYZchALRhcGoDAntxpO/1m+WO3FOS5EA31kGTa4l9wxpKvz+UukwvRd8aRZaBfoRbr2iWrYMoQrGRqBTw==
X-Forefront-Antispam-Report: CIP:216.228.117.161;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge2.nvidia.com;CAT:NONE;SFS:(13230040)(376014)(7416014)(36860700016)(23010399003)(82310400026)(1800799024)(261009223027099003)(10067099003)(56012099006)(6133799003)(22082099003)(18002099003)(11063799006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 1Eb19mIAAuaL9niNneL+9iGgvMTkDMvCzeXDa0ZE7yk2IReZfPV7T7b/lZnEjUJi93kbpyCLkNi74PLEdgIDnmnoYsvsjuY0gAkMJeJA3cCMKWauRCIJyzyf/GHfxEd8m/sCWl5+FMm7+gyb6yYdPS3rQWpJ3Vo3HNgisPSj387Gyu9aQrT+HKkU68lj7+ggVpa92V70MONLlCp/trj+nB9JJDV23bY3iRjDfj65Vo96it8eTSJFyUrzYt2NBl5JKac9MIFWZZXP+8PUIjJDjvN0NP6wyccp8xSySuhLqYGucG7dX+nR2HNwnYgtOxZrNngHbw2yw9gKGcgPD+Yx4lBg/70kQx0BS2y1xZt3qJIkrREmaIna5WuYhdd5WHP8Z8usUHP4UWre0y4CJ694HEuCEanOTTx9QmUH7l1bv9nF96W9zpryd85VxG8ctZyN
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Oct 2026 16:44:56.4408
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 881e53af-18f1-4857-65ca-08df2e004eb4
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.161];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: PH3PEPF00059619.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV5PR12MB9753
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261019_094504_222817_63D3AB94 
X-CRM114-Status: GOOD (  12.53  )
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
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Add alias support for NVIDIA Tegra410 PCIE-TGT PMU events and metrics.

Signed-off-by: Besar Wicaksono <bwicaksono@nvidia.com>
---
 .../nvidia/t410/sys/uncore-pcie_tgt.json      | 93 +++++++++++++++++++
 1 file changed, 93 insertions(+)
 create mode 100644 tools/perf/pmu-events/arch/arm64/nvidia/t410/sys/uncore-pcie_tgt.json

diff --git a/tools/perf/pmu-events/arch/arm64/nvidia/t410/sys/uncore-pcie_tgt.json b/tools/perf/pmu-events/arch/arm64/nvidia/t410/sys/uncore-pcie_tgt.json
new file mode 100644
index 000000000000..74786fc3d578
--- /dev/null
+++ b/tools/perf/pmu-events/arch/arm64/nvidia/t410/sys/uncore-pcie_tgt.json
@@ -0,0 +1,93 @@
+[
+    {
+        "EventCode": "0x4",
+        "EventName": "PCIE_TGT_CYCLES",
+        "BriefDescription": "Counts cycles at the PCIe interface to the Tegra SoC data fabric.",
+        "PublicDescription": "Counts cycles at the PCIe interface to the Tegra SoC data fabric.",
+        "Compat": "1070036b",
+        "Unit": "nvidia_pcie_tgt_pmu_,rc_"
+    },
+    {
+        "EventCode": "0x2",
+        "EventName": "PCIE_TGT_RD_REQ",
+        "BriefDescription": "Counts read requests from any source to PCIe BAR or CXL HDM ranges under this PCIe root complex.",
+        "PublicDescription": "Counts read requests from any source to PCIe BAR or CXL HDM ranges under this PCIe root complex, where the target responds with data. Request size can be from 1 to 256 bytes. Filters: dst_rp_mask selects PCIe BAR traffic to root ports (bit n = root port n). dst_addr_en with dst_addr_base and dst_addr_mask selects PCIe BAR or CXL HDM addresses that equal the base in the mask's set bits. If both dst_rp_mask and the address filter are set, a request matching either is counted. With no filter, PCIe BAR traffic to all root ports is counted.",
+        "Compat": "1070036b",
+        "Unit": "nvidia_pcie_tgt_pmu_,rc_"
+    },
+    {
+        "EventCode": "0x3",
+        "EventName": "PCIE_TGT_WR_REQ",
+        "BriefDescription": "Counts write requests from any source to PCIe BAR or CXL HDM ranges under this PCIe root complex.",
+        "PublicDescription": "Counts write requests from any source to PCIe BAR or CXL HDM ranges under this PCIe root complex, where the source sends data. Request size can be from 1 to 256 bytes. Filters: dst_rp_mask selects PCIe BAR traffic to root ports (bit n = root port n). dst_addr_en with dst_addr_base and dst_addr_mask selects PCIe BAR or CXL HDM addresses that equal the base in the mask's set bits. If both dst_rp_mask and the address filter are set, a request matching either is counted. With no filter, PCIe BAR traffic to all root ports is counted.",
+        "Compat": "1070036b",
+        "Unit": "nvidia_pcie_tgt_pmu_,rc_"
+    },
+    {
+        "EventCode": "0x0",
+        "EventName": "PCIE_TGT_RD_BYTES",
+        "BriefDescription": "Counts bytes transferred by the read requests counted by PCIE_TGT_RD_REQ.",
+        "PublicDescription": "Counts bytes transferred by the read requests counted by PCIE_TGT_RD_REQ. Destination filters work as described for PCIE_TGT_RD_REQ.",
+        "Compat": "1070036b",
+        "Unit": "nvidia_pcie_tgt_pmu_,rc_"
+    },
+    {
+        "EventCode": "0x1",
+        "EventName": "PCIE_TGT_WR_BYTES",
+        "BriefDescription": "Counts bytes transferred by the write requests counted by PCIE_TGT_WR_REQ.",
+        "PublicDescription": "Counts bytes transferred by the write requests counted by PCIE_TGT_WR_REQ. Destination filters work as described for PCIE_TGT_WR_REQ.",
+        "Compat": "1070036b",
+        "Unit": "nvidia_pcie_tgt_pmu_,rc_"
+    },
+    {
+        "MetricName": "pcie_tgt_freq",
+        "MetricGroup": "PCIE_TGT_Frequency",
+        "MetricConstraint": "NO_GROUP_EVENTS",
+        "MetricExpr": "(PCIE_TGT_CYCLES / aggr_nr(PCIE_TGT_CYCLES)) / 1e9 / duration_time",
+        "ScaleUnit": "1GHz",
+        "BriefDescription": "Frequency of the cycles at the PCIe interface to the Tegra SoC data fabric.",
+        "PublicDescription": "Average frequency of the cycles at the PCIe interface to the Tegra SoC data fabric over the measurement interval.",
+        "Compat": "1070036b",
+        "Unit": "nvidia_pcie_tgt_pmu_,rc_"
+    },
+    {
+        "MetricName": "pcie_tgt_avg_rd_bandwidth_to_all_dst",
+        "MetricGroup": "PCIE_TGT_Bandwidth;PCIE_TGT_BW_PCIE_BAR_CXL_HDM",
+        "MetricExpr": "PCIE_TGT_RD_BYTES@dst_addr_en=1,dst_addr_base=0,dst_addr_mask=0@ / 1e6 / duration_time",
+        "ScaleUnit": "1MB/s",
+        "BriefDescription": "Average read bandwidth to all PCIe BAR and CXL HDM ranges under this PCIe root complex.",
+        "PublicDescription": "Average read bandwidth of requests from any source to all PCIe BAR and CXL HDM ranges under this PCIe root complex.",
+        "Compat": "1070036b",
+        "Unit": "nvidia_pcie_tgt_pmu_,rc_"
+    },
+    {
+        "MetricName": "pcie_tgt_avg_wr_bandwidth_to_all_dst",
+        "MetricGroup": "PCIE_TGT_Bandwidth;PCIE_TGT_BW_PCIE_BAR_CXL_HDM",
+        "MetricExpr": "PCIE_TGT_WR_BYTES@dst_addr_en=1,dst_addr_base=0,dst_addr_mask=0@ / 1e6 / duration_time",
+        "ScaleUnit": "1MB/s",
+        "BriefDescription": "Average write bandwidth to all PCIe BAR and CXL HDM ranges under this PCIe root complex.",
+        "PublicDescription": "Average write bandwidth of requests from any source to all PCIe BAR and CXL HDM ranges under this PCIe root complex.",
+        "Compat": "1070036b",
+        "Unit": "nvidia_pcie_tgt_pmu_,rc_"
+    },
+    {
+        "MetricName": "pcie_tgt_avg_rd_bandwidth_to_pcie_bar",
+        "MetricGroup": "PCIE_TGT_Bandwidth;PCIE_TGT_BW_PCIE_BAR",
+        "MetricExpr": "PCIE_TGT_RD_BYTES / 1e6 / duration_time",
+        "ScaleUnit": "1MB/s",
+        "BriefDescription": "Average read bandwidth of PCIe BAR traffic to all root ports under this PCIe root complex.",
+        "PublicDescription": "Average read bandwidth of PCIe BAR traffic from any source to all root ports under this PCIe root complex.",
+        "Compat": "1070036b",
+        "Unit": "nvidia_pcie_tgt_pmu_,rc_"
+    },
+    {
+        "MetricName": "pcie_tgt_avg_wr_bandwidth_to_pcie_bar",
+        "MetricGroup": "PCIE_TGT_Bandwidth;PCIE_TGT_BW_PCIE_BAR",
+        "MetricExpr": "PCIE_TGT_WR_BYTES / 1e6 / duration_time",
+        "ScaleUnit": "1MB/s",
+        "BriefDescription": "Average write bandwidth of PCIe BAR traffic to all root ports under this PCIe root complex.",
+        "PublicDescription": "Average write bandwidth of PCIe BAR traffic from any source to all root ports under this PCIe root complex.",
+        "Compat": "1070036b",
+        "Unit": "nvidia_pcie_tgt_pmu_,rc_"
+    }
+]
-- 
2.43.0


