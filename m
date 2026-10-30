Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CE512606A31E
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 30 Oct 2026 17:51:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=JM3O8g6d;
	dkim=pass (2048-bit key, unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=FyB/nnwI
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=6PGgnpyMYrj/7HapEYVPI0E19gQGE0Xgd4pRqLiKqbo=; b=JM3O8g6d1bf1eGJEAA7GmvEII1
	GE4G+qlzaZ/L/WZCmWCNLX+JsIru5uEgmGNbKizwCo/UMVvv8m17tWvnbXwyoBH5Unr7wEg2ryyIa
	dsO6bQJsBfeJQBiLvRVgAtfeu3I1+l2jZArTvgrSolGZ2l2q9zOlIFK3f4YMDFF6wWbE+lNQ+NqjW
	Ma7qxQE667UhgRw/9WHFWJ8x7QKAojzTrzXLeutZVN6C5NMKCgv2f5g6dMa6Ygm84nUz9YZ2843Ab
	wYpYbM3yuvWji2z5TkisBtmL0tzTs6KPWo2D1b/WEV3H0M8aPXx2o7qI8WWv/LrbTgFJ0qlsgq4Pd
	13BZyIYQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xMqlA-0000000CJGd-2L4B;
	Fri, 30 Oct 2026 17:51:24 +0000
Received: from mail-southcentralusazlp170110003.outbound.protection.outlook.com ([2a01:111:f403:c10d::3] helo=SN4PR0501CU005.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xMql0-0000000CJ9i-2koW
	for linux-arm-kernel@lists.infradead.org;
	Fri, 30 Oct 2026 17:51:17 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=P+g9HYdtS+GFtyFEit32tVC+ORHv9BZ/gxu2OCP0ZDqGeqyXqNXPtPy+X21D2KMr4weMdOWoCa4+0m21/QqKFZdQp+odJQoHxrJBFcayak96iv8VHaNRoi/7u2xjTrGH8V/RAm0a+hZ+1mLyCEGcoaQ2q2wdrzdP5PwmO8QaIUTUEdqL/UQ/1NAVYE5hK2OWsHeiwADGSDv8gZYX7xzXBrTscw//pGrtHxBiV6lIpCxLxUGoC5hQaUWcUeGmzaUo0S3OchVpuw1F8nFqYHsyMuOWl54ogKHRlaYgIIBAyy3q2BFAqqX4w7qJPylUHJgziT85fPxdJff2ttFIB01iWg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6PGgnpyMYrj/7HapEYVPI0E19gQGE0Xgd4pRqLiKqbo=;
 b=x8oKQiDnDnE6s6MBM2lbVSNxPoK98ihmxvxT/LGiSJ91SQLXtbwYe8fLW/R953I/spMWcn+Twgvyl1xLT3EyYuGBb13IJBz6xMpy3YoDra/XMcK0axV9zh1djGSASPwBjdn2ocQRi8LiqCbHvaOgRSPWCEtCe0fBO/M4O51FU7UCWJUCYwoVNocpj/yUw0tphFz79ACRrKjnAm0UWO0RwQZRIfrE/h9ClREVPxrZB5DBMkdTRTObUgeTvhTuPxtbK3u4yNEsMNQgjkcnGQrkcuWlDXX7wXm3OkGhoAM0Ta6themShbICvycitWwiaOQodiESWzbJ2zdR06zjzP+ajQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.118.233) smtp.rcpttodomain=kernel.org smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6PGgnpyMYrj/7HapEYVPI0E19gQGE0Xgd4pRqLiKqbo=;
 b=FyB/nnwIk3rvuad/ZAwyb5/MenF7KFvlerPMTNIWTOAfUHoSGHnngXO+CRoK7PsjMx+lJSajbqwZ9Z/uNSsTYaE8zjjtI06rCXtAYbVx0zaQOG+GZNitVhlIRfJPGbq8yTx12euKWID8rIsVXlPgx5S/Jw8MsaTVZ1tbkWCHwibSeOIgfhPhJrm2mmJq6hrlW0VNKgxJyccur8qPnBdSmlpovPNLXnU0Pg70b55t65MYyaGaDyIrKD+kLB/ze7x+8tzU0ixujDGqk9hg9fsQP81BD/GH1CiSq18n+BeFUJk78DjbYGn+TWePUjxo84CnoWLTHEW413N5JQfJ+l44Vw==
Received: from PH1PEPF00013311.namprd07.prod.outlook.com (2603:10b6:518:1::c)
 by DS7PR12MB8348.namprd12.prod.outlook.com (2603:10b6:8:e5::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.569.9; Fri, 30 Oct
 2026 17:51:03 +0000
Received: from MW3PEPF00001658.namprd21.prod.outlook.com
 (2a01:111:f403:c91d::3) by PH1PEPF00013311.outlook.office365.com
 (2603:1036:903:47::9) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.569.10 via Frontend Transport; Fri,
 30 Oct 2026 17:51:02 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 216.228.118.233) smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.118.233 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.118.233; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.118.233) by
 MW3PEPF00001658.mail.protection.outlook.com (10.167.249.202) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.569.0 via Frontend Transport; Fri, 30 Oct 2026 17:51:02 +0000
Received: from drhqmail203.nvidia.com (10.126.190.182) by mail.nvidia.com
 (10.127.129.6) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.56; Fri, 30 Oct
 2026 10:50:37 -0700
Received: from drhqmail202.nvidia.com (10.126.190.181) by
 drhqmail203.nvidia.com (10.126.190.182) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56; Fri, 30 Oct 2026 10:50:37 -0700
Received: from build-bwicaksono-noble-20260804.internal (10.127.8.11) by
 mail.nvidia.com (10.126.190.181) with Microsoft SMTP Server id 15.2.2562.56
 via Frontend Transport; Fri, 30 Oct 2026 10:50:36 -0700
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
Subject: [PATCH v2 5/9] perf jevents: Add support for NVIDIA Tegra410 C2C PMU aliasing
Date: Fri, 30 Oct 2026 17:48:12 +0000
Message-ID: <20261030174816.1544471-6-bwicaksono@nvidia.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261030174816.1544471-1-bwicaksono@nvidia.com>
References: <20261030174816.1544471-1-bwicaksono@nvidia.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-NV-OnPremToCloud: ExternallySecured
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MW3PEPF00001658:EE_|DS7PR12MB8348:EE_
X-MS-Office365-Filtering-Correlation-Id: b819bb8c-81fd-46ac-8cf2-08df36ae5d4f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|23010399003|376014|7416014|1800799024|36860700016|82310400026|11063799006|56012099006|261009221227099003|261009223027099003|261026140227099003|261021121427099003|10067099003|261028144727099003|261022105027099003|261022075727099003|18002099003|22082099003|6133799003;
X-Microsoft-Antispam-Message-Info: 8W6acg74lKVL9+GFt3J7piqMgCargB6kuHApXj8esV3VtfJ4hic2EFaZalnxDXuFoEwGaFG5hGc7DTLBVN4xyDaM4MDgEzMoGDkMrEZSLX2bDhWrRXTvrgLMjJfbNzrtDJbuyqhf80BJ1iA2BMRz2ADSHNEojv6lCBSnOIvK1ZfdUdupmv0nzIm6qSrkljey/wiZWnZs5LXc1SlZOUiNHX/QlmIu8lI9oejp0fVzN4nsfi9qXNeqWQhU0httuVnb65KosG17aKRy0eVCiA2Ry3Nu99Gk9ZJX3TjAAJKu/rCICw1KUETfdgedzQ/P2F6uCRR3fUsyAJnNH5kVSEzLeype9spwK2g+5bLBmc94LByKHaIcf96JRCM2sM/ws6dyrHH8lkT/rLw30lg4+FJuVK4HLY6cPndcXiJvGQrDKfjF9kCZ6Pfa8gVRdXC7JrMB+deej4JQvaW1fon1yYDM78BOH/8N+oBc3tx2qr2kV97SDNwTvuasGaMJlVHHG1AUIYgXrKBYApoN5f9aLRt6CI1NWuTKnKqAdlNVSXwO98b+nmHQXLgW8/m1rDSyHpdlgPcQ3Pio+UAbvdzQxcNjteT01HG2IjoYrm1MA1g9PMJULYcP9UwjGBoAmcOxL0U3Yt9Ba+R3n27KuHPWT7A2LvBqBIMdnOCP8ASJ2xdwHyAhGjsWvgikoAkJNThctl6zQzAxXBHGaWZXHW9ysDfrBA==
X-Forefront-Antispam-Report: CIP:216.228.118.233;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc7edge2.nvidia.com;CAT:NONE;SFS:(13230040)(23010399003)(376014)(7416014)(1800799024)(36860700016)(82310400026)(11063799006)(56012099006)(261009221227099003)(261009223027099003)(261026140227099003)(261021121427099003)(10067099003)(261028144727099003)(261022105027099003)(261022075727099003)(18002099003)(22082099003)(6133799003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: Mi6p5s8MogmrJzPVKirRaMEJp/7i4vgf0hOZaqmNSgfIUOqOPaFdwWOZ6IY4+8RZ+cnlNpH4q06wJ0/nmopqRLju0jX6KCxRJ8lQNez9YGrNuFv2BIIbQMX0XmqPhcHUYEDGLMqa8pEh7knxXrrqvvAla9FrfjG2LhxidYuOc6H4jg6EIjGkYSls9dTDawLVETpI/jE3mWPeCZM2DAEdP2lqY8qaVZFdHJmP+conCHm00vTx0ZaNwDhv+AGyNv2FI3KXf2a6lLRdRvvMrl3prv5aNgo9dC9wLsqeAYK719XTxPtvTmKbOqlcGp5+q8xfiRWwMCUFiM7YwgTb9D2aW9xOsEprpCGHNWdW12K47nf2sPxn3JewqglPGHtSiPbQHPQyZLPUWZznoG+kxElKbhmOE2TXqT/BdDbACb5uNQG47RXbdoyfzWQbQwG/Rwr5
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Oct 2026 17:51:02.6653
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: b819bb8c-81fd-46ac-8cf2-08df36ae5d4f
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.118.233];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: MW3PEPF00001658.namprd21.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR12MB8348
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261030_105114_779007_C0C2930A 
X-CRM114-Status: GOOD (  13.95  )
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

Add alias support for NVIDIA Tegra410 C2C PMU events.

Signed-off-by: Besar Wicaksono <bwicaksono@nvidia.com>
---
 .../arm64/nvidia/t410/uncore-nvclink.json     |  67 ++++++++++
 .../arm64/nvidia/t410/uncore-nvdlink.json     |  43 +++++++
 .../arm64/nvidia/t410/uncore-nvlink_c2c.json  | 115 ++++++++++++++++++
 3 files changed, 225 insertions(+)
 create mode 100644 tools/perf/pmu-events/arch/arm64/nvidia/t410/uncore-nvclink.json
 create mode 100644 tools/perf/pmu-events/arch/arm64/nvidia/t410/uncore-nvdlink.json
 create mode 100644 tools/perf/pmu-events/arch/arm64/nvidia/t410/uncore-nvlink_c2c.json

diff --git a/tools/perf/pmu-events/arch/arm64/nvidia/t410/uncore-nvclink.json b/tools/perf/pmu-events/arch/arm64/nvidia/t410/uncore-nvclink.json
new file mode 100644
index 000000000000..1e7f8115ff9c
--- /dev/null
+++ b/tools/perf/pmu-events/arch/arm64/nvidia/t410/uncore-nvclink.json
@@ -0,0 +1,67 @@
+[
+    {
+        "EventCode": "0x0",
+        "EventName": "NVCLINK_CYCLES",
+        "BriefDescription": "Counts NV-CLink interface clock cycles.",
+        "PublicDescription": "Counts NV-CLink interface clock cycles. All NV-CLink instances share this clock, so the count is read from the first instance.",
+        "Unit": "nvidia_nvclink_pmu_"
+    },
+    {
+        "EventCode": "0x1",
+        "EventName": "NVCLINK_IN_RD_CUM_OUTS",
+        "BriefDescription": "Accumulates the outstanding incoming read requests counted by NVCLINK_IN_RD_REQ each NV-CLink interface cycle.",
+        "PublicDescription": "Accumulates the outstanding incoming read requests counted by NVCLINK_IN_RD_REQ each NV-CLink interface cycle. Pair the two for the average read latency.",
+        "Unit": "nvidia_nvclink_pmu_"
+    },
+    {
+        "EventCode": "0x2",
+        "EventName": "NVCLINK_IN_RD_REQ",
+        "BriefDescription": "Counts incoming read requests from the remote Tegra SoC at the NV-CLink interface.",
+        "PublicDescription": "Counts incoming read requests from the remote Tegra SoC at the NV-CLink interface, where local memory or a local device responds with data. Request size can be from 1 to 256 bytes. The count is summed over all NV-CLink instances.",
+        "Unit": "nvidia_nvclink_pmu_"
+    },
+    {
+        "EventCode": "0x5",
+        "EventName": "NVCLINK_OUT_RD_CUM_OUTS",
+        "BriefDescription": "Accumulates the outstanding outgoing read requests counted by NVCLINK_OUT_RD_REQ each NV-CLink interface cycle.",
+        "PublicDescription": "Accumulates the outstanding outgoing read requests counted by NVCLINK_OUT_RD_REQ each NV-CLink interface cycle. Pair the two for the average read latency.",
+        "Unit": "nvidia_nvclink_pmu_"
+    },
+    {
+        "EventCode": "0x6",
+        "EventName": "NVCLINK_OUT_RD_REQ",
+        "BriefDescription": "Counts outgoing read requests from the local Tegra SoC to the remote Tegra SoC at the NV-CLink interface.",
+        "PublicDescription": "Counts outgoing read requests from the local Tegra SoC to the remote Tegra SoC at the NV-CLink interface, where memory on the remote Tegra SoC responds with data. Request size can be from 1 to 256 bytes. The count is summed over all NV-CLink instances.",
+        "Unit": "nvidia_nvclink_pmu_"
+    },
+    {
+        "MetricName": "nvclink_freq",
+        "MetricGroup": "NVCLINK_Frequency;NVCLINK_Latency;NVCLINK_Read_Latency",
+        "MetricConstraint": "NO_GROUP_EVENTS",
+        "MetricExpr": "(NVCLINK_CYCLES / aggr_nr(NVCLINK_CYCLES)) / 1e9 / duration_time",
+        "ScaleUnit": "1GHz",
+        "BriefDescription": "NV-CLink interface clock frequency.",
+        "PublicDescription": "Average NV-CLink interface clock frequency over the measurement interval.",
+        "Unit": "nvidia_nvclink_pmu_"
+    },
+    {
+        "MetricName": "nvclink_in_avg_rd_latency",
+        "MetricGroup": "NVCLINK_Latency;NVCLINK_Read_Latency;NVCLINK_Incoming",
+        "MetricConstraint": "NO_GROUP_EVENTS",
+        "MetricExpr": "(NVCLINK_IN_RD_CUM_OUTS / NVCLINK_IN_RD_REQ) / nvclink_freq",
+        "ScaleUnit": "1ns/request",
+        "BriefDescription": "Average latency of incoming read requests from the remote Tegra SoC at the NV-CLink interface.",
+        "PublicDescription": "Average latency of the incoming read requests counted by NVCLINK_IN_RD_REQ, measured at the NV-CLink interface.",
+        "Unit": "nvidia_nvclink_pmu_"
+    },
+    {
+        "MetricName": "nvclink_out_avg_rd_latency",
+        "MetricGroup": "NVCLINK_Latency;NVCLINK_Read_Latency;NVCLINK_Outgoing",
+        "MetricConstraint": "NO_GROUP_EVENTS",
+        "MetricExpr": "(NVCLINK_OUT_RD_CUM_OUTS / NVCLINK_OUT_RD_REQ) / nvclink_freq",
+        "ScaleUnit": "1ns/request",
+        "BriefDescription": "Average latency of outgoing read requests sent by the local Tegra SoC to the remote Tegra SoC at the NV-CLink interface.",
+        "PublicDescription": "Average latency of the outgoing read requests counted by NVCLINK_OUT_RD_REQ, measured at the NV-CLink interface.",
+        "Unit": "nvidia_nvclink_pmu_"
+    }
+]
diff --git a/tools/perf/pmu-events/arch/arm64/nvidia/t410/uncore-nvdlink.json b/tools/perf/pmu-events/arch/arm64/nvidia/t410/uncore-nvdlink.json
new file mode 100644
index 000000000000..7777add3741d
--- /dev/null
+++ b/tools/perf/pmu-events/arch/arm64/nvidia/t410/uncore-nvdlink.json
@@ -0,0 +1,43 @@
+[
+    {
+        "EventCode": "0x0",
+        "EventName": "NVDLINK_CYCLES",
+        "BriefDescription": "Counts NV-DLink interface clock cycles.",
+        "PublicDescription": "Counts NV-DLink interface clock cycles. All NV-DLink instances share this clock, so the count is read from the first instance.",
+        "Unit": "nvidia_nvdlink_pmu_"
+    },
+    {
+        "EventCode": "0x1",
+        "EventName": "NVDLINK_IN_RD_CUM_OUTS",
+        "BriefDescription": "Accumulates the outstanding read requests counted by NVDLINK_IN_RD_REQ each NV-DLink interface cycle.",
+        "PublicDescription": "Accumulates the outstanding read requests counted by NVDLINK_IN_RD_REQ each NV-DLink interface cycle. Pair the two for the average read latency.",
+        "Unit": "nvidia_nvdlink_pmu_"
+    },
+    {
+        "EventCode": "0x2",
+        "EventName": "NVDLINK_IN_RD_REQ",
+        "BriefDescription": "Counts read requests to local CXL memory at the NV-DLink interface.",
+        "PublicDescription": "Counts read requests to local CXL memory at the NV-DLink interface, from all requesters, local and remote. Request size can be from 1 to 256 bytes. The count is summed over all NV-DLink instances.",
+        "Unit": "nvidia_nvdlink_pmu_"
+    },
+    {
+        "MetricName": "nvdlink_freq",
+        "MetricGroup": "NVDLINK_Frequency;NVDLINK_Latency;NVDLINK_Read_Latency",
+        "MetricConstraint": "NO_GROUP_EVENTS",
+        "MetricExpr": "(NVDLINK_CYCLES / aggr_nr(NVDLINK_CYCLES)) / 1e9 / duration_time",
+        "ScaleUnit": "1GHz",
+        "BriefDescription": "NV-DLink interface clock frequency.",
+        "PublicDescription": "Average NV-DLink interface clock frequency over the measurement interval.",
+        "Unit": "nvidia_nvdlink_pmu_"
+    },
+    {
+        "MetricName": "nvdlink_in_avg_rd_latency",
+        "MetricGroup": "NVDLINK_Latency;NVDLINK_Read_Latency",
+        "MetricConstraint": "NO_GROUP_EVENTS",
+        "MetricExpr": "(NVDLINK_IN_RD_CUM_OUTS / NVDLINK_IN_RD_REQ) / nvdlink_freq",
+        "ScaleUnit": "1ns/request",
+        "BriefDescription": "Average latency of read requests to local CXL memory at the NV-DLink interface.",
+        "PublicDescription": "Average latency of the read requests counted by NVDLINK_IN_RD_REQ, measured at the NV-DLink interface.",
+        "Unit": "nvidia_nvdlink_pmu_"
+    }
+]
diff --git a/tools/perf/pmu-events/arch/arm64/nvidia/t410/uncore-nvlink_c2c.json b/tools/perf/pmu-events/arch/arm64/nvidia/t410/uncore-nvlink_c2c.json
new file mode 100644
index 000000000000..48a64caaba61
--- /dev/null
+++ b/tools/perf/pmu-events/arch/arm64/nvidia/t410/uncore-nvlink_c2c.json
@@ -0,0 +1,115 @@
+[
+    {
+        "EventCode": "0x0",
+        "EventName": "NVLINK_C2C_CYCLES",
+        "BriefDescription": "Counts NVLink-C2C interface clock cycles.",
+        "PublicDescription": "Counts NVLink-C2C interface clock cycles. All NVLink-C2C instances share this clock, so the count is read from the first instance.",
+        "Unit": "nvidia_nvlink_c2c_pmu_"
+    },
+    {
+        "EventCode": "0x1",
+        "EventName": "NVLINK_C2C_IN_RD_CUM_OUTS",
+        "BriefDescription": "Accumulates the outstanding incoming read requests counted by NVLINK_C2C_IN_RD_REQ each NVLink-C2C interface cycle.",
+        "PublicDescription": "Accumulates the outstanding incoming read requests counted by NVLINK_C2C_IN_RD_REQ each NVLink-C2C interface cycle. Pair the two for the average read latency. The gpu_mask filter works as described for NVLINK_C2C_IN_RD_REQ.",
+        "Unit": "nvidia_nvlink_c2c_pmu_"
+    },
+    {
+        "EventCode": "0x2",
+        "EventName": "NVLINK_C2C_IN_RD_REQ",
+        "BriefDescription": "Counts incoming read requests from connected GPUs or a remote Tegra SoC at the NVLink-C2C interface.",
+        "PublicDescription": "Counts incoming read requests sent by connected GPUs or a remote Tegra SoC to the local Tegra SoC at the NVLink-C2C interface, where the local Tegra SoC responds with data. Request size can be from 1 to 256 bytes. The count is summed over all NVLink-C2C instances. Filters: the gpu_mask filter selects GPUs by index, one bit per GPU. This filter is available only when GPUs are connected. An unset gpu_mask counts all GPUs.",
+        "Unit": "nvidia_nvlink_c2c_pmu_"
+    },
+    {
+        "EventCode": "0x3",
+        "EventName": "NVLINK_C2C_IN_WR_CUM_OUTS",
+        "BriefDescription": "Accumulates the outstanding incoming write requests counted by NVLINK_C2C_IN_WR_REQ each NVLink-C2C interface cycle.",
+        "PublicDescription": "Accumulates the outstanding incoming write requests counted by NVLINK_C2C_IN_WR_REQ each NVLink-C2C interface cycle. Available only when GPUs are connected. Pair the two for the average write latency. The gpu_mask filter works as described for NVLINK_C2C_IN_WR_REQ.",
+        "Unit": "nvidia_nvlink_c2c_pmu_"
+    },
+    {
+        "EventCode": "0x4",
+        "EventName": "NVLINK_C2C_IN_WR_REQ",
+        "BriefDescription": "Counts incoming write requests from connected GPUs to the local Tegra SoC at the NVLink-C2C interface.",
+        "PublicDescription": "Counts incoming write requests sent by connected GPUs to the local Tegra SoC at the NVLink-C2C interface, where the GPU sends the data. Request size can be from 1 to 256 bytes. Available only when GPUs are connected. The count is summed over all NVLink-C2C instances. Filters: the gpu_mask filter selects GPUs by index, one bit per GPU. An unset gpu_mask counts all GPUs.",
+        "Unit": "nvidia_nvlink_c2c_pmu_"
+    },
+    {
+        "EventCode": "0x5",
+        "EventName": "NVLINK_C2C_OUT_RD_CUM_OUTS",
+        "BriefDescription": "Accumulates the outstanding outgoing read requests counted by NVLINK_C2C_OUT_RD_REQ each NVLink-C2C interface cycle.",
+        "PublicDescription": "Accumulates the outstanding outgoing read requests counted by NVLINK_C2C_OUT_RD_REQ each NVLink-C2C interface cycle. Pair the two for the average read latency. The gpu_mask filter works as described for NVLINK_C2C_OUT_RD_REQ.",
+        "Unit": "nvidia_nvlink_c2c_pmu_"
+    },
+    {
+        "EventCode": "0x6",
+        "EventName": "NVLINK_C2C_OUT_RD_REQ",
+        "BriefDescription": "Counts outgoing read requests to connected GPUs or a remote Tegra SoC at the NVLink-C2C interface.",
+        "PublicDescription": "Counts outgoing read requests from all requesters to connected GPUs or a remote Tegra SoC at the NVLink-C2C interface, where the GPU or remote Tegra SoC responds with data. Request size can be from 1 to 256 bytes. The count is summed over all NVLink-C2C instances. Filters: the gpu_mask filter selects GPUs by index, one bit per GPU. This filter is available only when GPUs are connected. An unset gpu_mask counts all GPUs.",
+        "Unit": "nvidia_nvlink_c2c_pmu_"
+    },
+    {
+        "EventCode": "0x7",
+        "EventName": "NVLINK_C2C_OUT_WR_CUM_OUTS",
+        "BriefDescription": "Accumulates the outstanding outgoing write requests counted by NVLINK_C2C_OUT_WR_REQ each NVLink-C2C interface cycle.",
+        "PublicDescription": "Accumulates the outstanding outgoing write requests counted by NVLINK_C2C_OUT_WR_REQ each NVLink-C2C interface cycle. Available only when GPUs are connected. Pair the two for the average write latency. The gpu_mask filter works as described for NVLINK_C2C_OUT_WR_REQ.",
+        "Unit": "nvidia_nvlink_c2c_pmu_"
+    },
+    {
+        "EventCode": "0x8",
+        "EventName": "NVLINK_C2C_OUT_WR_REQ",
+        "BriefDescription": "Counts outgoing write requests to connected GPUs at the NVLink-C2C interface.",
+        "PublicDescription": "Counts outgoing write requests from all requesters to connected GPUs at the NVLink-C2C interface, where the requester sends the data. Request size can be from 1 to 256 bytes. Available only when GPUs are connected. The count is summed over all NVLink-C2C instances. Filters: the gpu_mask filter selects GPUs by index, one bit per GPU. An unset gpu_mask counts all GPUs.",
+        "Unit": "nvidia_nvlink_c2c_pmu_"
+    },
+    {
+        "MetricName": "nvlink_c2c_freq",
+        "MetricGroup": "NVLINK_C2C_Frequency;NVLINK_C2C_Latency;NVLINK_C2C_Read_Latency;NVLINK_C2C_Write_Latency",
+        "MetricConstraint": "NO_GROUP_EVENTS",
+        "MetricExpr": "(NVLINK_C2C_CYCLES / aggr_nr(NVLINK_C2C_CYCLES)) / 1e9 / duration_time",
+        "ScaleUnit": "1GHz",
+        "BriefDescription": "NVLink-C2C interface clock frequency.",
+        "PublicDescription": "Average NVLink-C2C interface clock frequency over the measurement interval.",
+        "Unit": "nvidia_nvlink_c2c_pmu_"
+    },
+    {
+        "MetricName": "nvlink_c2c_in_avg_rd_latency",
+        "MetricGroup": "NVLINK_C2C_Latency;NVLINK_C2C_Read_Latency;NVLINK_C2C_Incoming",
+        "MetricConstraint": "NO_GROUP_EVENTS",
+        "MetricExpr": "(NVLINK_C2C_IN_RD_CUM_OUTS / NVLINK_C2C_IN_RD_REQ) / nvlink_c2c_freq",
+        "ScaleUnit": "1ns/request",
+        "BriefDescription": "Average latency of incoming read requests at the NVLink-C2C interface.",
+        "PublicDescription": "Average latency of the incoming read requests counted by NVLINK_C2C_IN_RD_REQ, measured at the NVLink-C2C interface.",
+        "Unit": "nvidia_nvlink_c2c_pmu_"
+    },
+    {
+        "MetricName": "nvlink_c2c_in_avg_wr_latency",
+        "MetricGroup": "NVLINK_C2C_Latency;NVLINK_C2C_Write_Latency;NVLINK_C2C_Incoming",
+        "MetricConstraint": "NO_GROUP_EVENTS",
+        "MetricExpr": "(NVLINK_C2C_IN_WR_CUM_OUTS / NVLINK_C2C_IN_WR_REQ) / nvlink_c2c_freq",
+        "ScaleUnit": "1ns/request",
+        "BriefDescription": "Average latency of incoming write requests from connected GPUs at the NVLink-C2C interface.",
+        "PublicDescription": "Average latency of the incoming write requests counted by NVLINK_C2C_IN_WR_REQ, measured at the NVLink-C2C interface. Available only when GPUs are connected.",
+        "Unit": "nvidia_nvlink_c2c_pmu_"
+    },
+    {
+        "MetricName": "nvlink_c2c_out_avg_rd_latency",
+        "MetricGroup": "NVLINK_C2C_Latency;NVLINK_C2C_Read_Latency;NVLINK_C2C_Outgoing",
+        "MetricConstraint": "NO_GROUP_EVENTS",
+        "MetricExpr": "(NVLINK_C2C_OUT_RD_CUM_OUTS / NVLINK_C2C_OUT_RD_REQ) / nvlink_c2c_freq",
+        "ScaleUnit": "1ns/request",
+        "BriefDescription": "Average latency of outgoing read requests at the NVLink-C2C interface.",
+        "PublicDescription": "Average latency of the outgoing read requests counted by NVLINK_C2C_OUT_RD_REQ, measured at the NVLink-C2C interface.",
+        "Unit": "nvidia_nvlink_c2c_pmu_"
+    },
+    {
+        "MetricName": "nvlink_c2c_out_avg_wr_latency",
+        "MetricGroup": "NVLINK_C2C_Latency;NVLINK_C2C_Write_Latency;NVLINK_C2C_Outgoing",
+        "MetricConstraint": "NO_GROUP_EVENTS",
+        "MetricExpr": "(NVLINK_C2C_OUT_WR_CUM_OUTS / NVLINK_C2C_OUT_WR_REQ) / nvlink_c2c_freq",
+        "ScaleUnit": "1ns/request",
+        "BriefDescription": "Average latency of outgoing write requests to connected GPUs at the NVLink-C2C interface.",
+        "PublicDescription": "Average latency of the outgoing write requests counted by NVLINK_C2C_OUT_WR_REQ, measured at the NVLink-C2C interface. Available only when GPUs are connected.",
+        "Unit": "nvidia_nvlink_c2c_pmu_"
+    }
+]
-- 
2.43.0


