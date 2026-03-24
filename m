Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D2F3DF532C6
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 24 Mar 2026 01:30:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=YXmMuiiDNs7sNsXl7HNn5H6da2gw+LjcvMRCAuWERjc=; b=wakH72is9f5pxSN7km2QZtlRuO
	SHMy2NK8gQglg4EzZHEojrsBqFuC8U32aZ+1d4mssXeUVe2S/nC1Hv1M4TPnbj6CAKwtNu2mnTjQO
	AAunqoDambgf3H+yxKU2gRaVIR+lR3GRZiH5OHe1YmUK5F/52HrngFOXOalTs/lg6/doqwtQilW7a
	/bZIzovK5A73Qduo+2eqZ7xeN0+RHzd8DQqOtVEczjmwESEITqFfwQFRs/Vk95/+bZbZom8ICG2jM
	guqGLfXcusJcN7HREcBEfMAro/rVxImhsC7ntvCiN5WmxzhxPpNWhExOLhIrQ3F/0wrJzVA+51/l8
	ccIsZQBg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w4qb7-00000000IwE-1fUP;
	Tue, 24 Mar 2026 01:30:21 +0000
Received: from mail-southcentralusazlp170110003.outbound.protection.outlook.com ([2a01:111:f403:c10d::3] helo=SN4PR0501CU005.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w4qb5-00000000Ivr-0Ojr
	for linux-arm-kernel@lists.infradead.org;
	Tue, 24 Mar 2026 01:30:20 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=sdUgqlUZWzOVQf0/2k57FZdn2726bAgrk7MXTNB7kTuVs3UvYYcYq/wwFP59v+KXGZZ6bGEb2y55fJL1NQ4XtLknvkeXUsRq6cib3Mon11/DMZnvxSCmHMaOjX3c3MvnXAkjhAB431APgZrzX1jzZsLoJbALlBOJHvLPGSwOL0GoyghNe3/s0nTlBn144s1p15aFAq51jb8h+D6hXrkhWIk75b6+Lf/BvLTx0+KPnlalatrkE2hKQpCI0bZtLI/nkicMcY5GE65/KV7LyELpLogYq+4DJHKuD9b+F976EhvxIODtWgZdyyu/Wnho4wDiuH/EDi4jEjDS6MZY5yNPng==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=YXmMuiiDNs7sNsXl7HNn5H6da2gw+LjcvMRCAuWERjc=;
 b=YZaTzgN7aOzuvo/9zxpm/ixkZ4IGZ7KnZghM2P9eKTqoY8NjsfN5yct0ilsJ0AtXFGb7wOI0owy5cdIJ6/6XboxhQGZsev5PpJXs0dRtzyNNI/YdzWVbApPj/yjUt9wKM41xql2p/LdB+5+tFIbRmmsxQhz4opO9fGT92x5c6ZK8SDQTpnNrfG6zB+BTb61JGyj+TopX4n9ZrzG+y5sbRL1yYE6kOKulop/kQmqvSVz4g9PxzsixNKWf5DcgJLkoqRpYtBKMTjJlT1kkoihKgCTAa9CHtmu9hnturGwM5B4rMsIAEM0o9pier4XHKDuk7u8ZlPEX4VHGAE+b5I6c2Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.118.233) smtp.rcpttodomain=kernel.org smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=YXmMuiiDNs7sNsXl7HNn5H6da2gw+LjcvMRCAuWERjc=;
 b=G31/TmGomYKKNurxnfL+bk2pfZgcRbp59V8Op1sMCw3MLgPwUfmkpYuk6lgvXks/b3OERGTdAODFsWt9D27w6X4uOnqO/D5yqcrfvokhyZ2Tv0QQcGhvnki55W9BOtBImPnSp95g7E2wSo+ECbA0yItWe41F8l5WrPFKfKPqgQF1HTVlW4C7E7aGTkqDMFKk92vnRY6TYwCMfUZliRODwD7G9oKPZHiwTX6WmdDbYFcolzOEfEzstoy46z+/PAGeSGcrUhw1I+BB57jWoQ9FDLtF7aAIpf0xSP3WJZ4x/V//X5hsZZ3/fbxLIdQ4LJfx+A1hGqomjz6AxgNBfi/5Ng==
Received: from BN9PR03CA0581.namprd03.prod.outlook.com (2603:10b6:408:10d::16)
 by CH1PR12MB9695.namprd12.prod.outlook.com (2603:10b6:610:2af::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9745.20; Tue, 24 Mar
 2026 01:30:07 +0000
Received: from BN3PEPF0000B076.namprd04.prod.outlook.com
 (2603:10b6:408:10d:cafe::2b) by BN9PR03CA0581.outlook.office365.com
 (2603:10b6:408:10d::16) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9723.31 via Frontend Transport; Tue,
 24 Mar 2026 01:30:03 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.118.233)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.118.233 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.118.233; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.118.233) by
 BN3PEPF0000B076.mail.protection.outlook.com (10.167.243.121) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9723.19 via Frontend Transport; Tue, 24 Mar 2026 01:30:07 +0000
Received: from drhqmail201.nvidia.com (10.126.190.180) by mail.nvidia.com
 (10.127.129.6) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Mon, 23 Mar
 2026 18:29:57 -0700
Received: from drhqmail201.nvidia.com (10.126.190.180) by
 drhqmail201.nvidia.com (10.126.190.180) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.20; Mon, 23 Mar 2026 18:29:57 -0700
Received: from build-bwicaksono-noble-20251018.internal (10.127.8.11) by
 mail.nvidia.com (10.126.190.180) with Microsoft SMTP Server id 15.2.2562.20
 via Frontend Transport; Mon, 23 Mar 2026 18:29:56 -0700
From: Besar Wicaksono <bwicaksono@nvidia.com>
To: <will@kernel.org>, <suzuki.poulose@arm.com>, <robin.murphy@arm.com>,
	<ilkka@os.amperecomputing.com>, <jonathan.cameron@huawei.com>
CC: <linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
	<linux-tegra@vger.kernel.org>, <mark.rutland@arm.com>, <treding@nvidia.com>,
	<jonathanh@nvidia.com>, <vsethi@nvidia.com>, <rwiley@nvidia.com>,
	<sdonthineni@nvidia.com>, <skelley@nvidia.com>, <mochs@nvidia.com>,
	<nirmoyd@nvidia.com>, <bhelgaas@google.com>, <wangyushan12@huawei.com>,
	<shiju.jose@huawei.com>, <linux-pci@vger.kernel.org>, Besar Wicaksono
	<bwicaksono@nvidia.com>
Subject: [PATCH v3 0/8] perf: add NVIDIA Tegra410 Uncore PMU support
Date: Tue, 24 Mar 2026 01:29:44 +0000
Message-ID: <20260324012952.1923296-1-bwicaksono@nvidia.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-NV-OnPremToCloud: ExternallySecured
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN3PEPF0000B076:EE_|CH1PR12MB9695:EE_
X-MS-Office365-Filtering-Correlation-Id: 0efa4fde-2d9b-4456-d608-08de8944e204
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|82310400026|376014|36860700016|7416014|1800799024|13003099007|56012099003|18002099003;
X-Microsoft-Antispam-Message-Info: ss4dnLi5RVbTBm86/a9dVWB4A3Wf1cnBKQG0qWECapvjgtuOfvgsKeRLPQjYwWSyod3q56PNYiz/lUya8rB7A7ee1Xc6CSXy5T2VuAYMThEpx2lfNwtDLIoC9QxcZ6A2afhHQa3u/EE9ESrv3agbVbz3UagJfTi11rkCSDn7EieYdrCCsMHR7YqX/KlaCCk/kTyHeD6gwKOiZ+ddxC5JZ8HTHNQqisUqLCXW6UcUGhb1qIUwSIH5XtN/JJGXmy37z3MV7bzgBn6xaJ0QJbQ3HJgS1bs6f32j9b6Lchr9BrlYiO4hfbsLaCVIK3hfA+w7w4YCun9nz0cz9t2hqwRGV4nLA+frYRLG2vL2mVnLEhfam/C1u4o2k/RdNixMufJzbgDxwgGfEV4hSCEgUIp2htqVOfnQEPHphNwuhIScwzrQ62JOg6NIBDH0F8dtMPw5sGzE86XQQKnerrIt7gZ6C2HaTyf3nP3PnhCGnPioPhJdMjcdjm2jDJlswmh86VPqlOf8J0qgPBe00mu24KU5zaW46qx56YtDBZDKKAPe0UzX2vhtqNi7xlPvPw6exGUSKAXUarPmgQYCIkPAn5MtKpXdrxqo1G44ejqQkSAPPmMdmXFXUQEr7gflMiXdhv27MJlNBearksqHl3RioZJ8i1c8PTTJhwkLZqsE0LpIXtyNFwhdeAISC9NSFFPBVhn0B7Uu9tmiLvjCiibyWy1LdWkFsakNuuHSiy1F5PJrYJS1B3Dm87klxCgSbhpFIkzsIOhgQRRWmUhud8hHXDOdSg==
X-Forefront-Antispam-Report: CIP:216.228.118.233;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc7edge2.nvidia.com;CAT:NONE;SFS:(13230040)(82310400026)(376014)(36860700016)(7416014)(1800799024)(13003099007)(56012099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: +GFo499wKIFdV0Z4Q4iSwV98+BBAGyOo91rzAkh8ZhxT9lvoBZzJyjitwmoPBBZ3/MVZ6BG1BA0YbDJZqJrA2xq118asSyPv4AAL6w4iEjK3gMAN3SL2EoN8z+O3KXaCERthxo4nFsiqd8xPqeIZdwmuJyDcpZ9NtLaDeUp+0t+SU6p2CNZtOfbr5wTFwXECKSLJUdLr6ILZHDHOs3Br9yiv0DJnA++KzhoO7yfuEtrrGTtvshTX7j3VQIj1xAbNCerFxKPzvvnwd5c3do+vJhOCDvu7d3mpFwMXxwPeq2iEbXmRNwKrlLV8pCY6BJxCm8+oGdtdYtZUYcnzciRMDiG+tG6+RPKw7aLt/7pWGiZSbMjnOIDBOnfiV4+xck4y0lwt68iHETRtRITwwv1lWJiJds0Dn0lL3DbIxdWwJmPeLIeh1O4p4tFZJbjRxub0
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Mar 2026 01:30:07.4191
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 0efa4fde-2d9b-4456-d608-08de8944e204
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.118.233];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: BN3PEPF0000B076.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH1PR12MB9695
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260323_183019_136799_1ADA5092 
X-CRM114-Status: UNSURE (   9.18  )
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

This series adds driver support for the following Uncore PMUs in
NVIDIA Tegra410 SoC:
  - Unified Coherence Fabric (UCF)
  - PCIE
  - PCIE-TGT
  - CPU Memory (CMEM) Latency
  - NVLink-C2C
  - NV-CLink
  - NV-DLink

Changes from v2:
  * Addressed comment on arm_cspmu_acpi_dev_get buffer initialization and matching
    CONFIG_* guard.
  * Addressed comment on nvidia_cspmu attribute table and match-entry style,
    validation scoping, and ACPI+ARM64 around instance-id lookup.
  * Addressed comment on PCIe documentation (fabric placement and cycles event).
  * Rework CMEM latency PMU (separate broadcast MMIO, CMEM_LAT_* macro
    names, event_init and formatting).
  * Rework C2C PMU sysfs using static attribute groups and nv_c2c_pmu_data in
    ACPI match data; drop dynamic group allocation, is_visible, and ACPI_PTR.
v2: https://lore.kernel.org/all/20260218145809.1622856-1-bwicaksono@nvidia.com/T/#t

Changes from v1:
  * Add more clarity on the commit message.
  * Fix build error reported by kernel test robot on PATCH 6/8.
    * It was missing ACPI dependency on Kconfig for the CPU Memory
      Latency PMU.
  * Apply code formatting suggestions from Ilkka.
  * Added Reviewed-by from Ilkka.
v1: https://lore.kernel.org/all/20260126181155.2776097-1-bwicaksono@nvidia.com/T/#t

Thanks to Ilkka, Krzysztof, Jon, and Jonathan Cameron for the comments.

Thanks,
Besar

Besar Wicaksono (8):
  perf/arm_cspmu: nvidia: Rename doc to Tegra241
  perf/arm_cspmu: nvidia: Add Tegra410 UCF PMU
  perf/arm_cspmu: Add arm_cspmu_acpi_dev_get
  perf/arm_cspmu: nvidia: Add Tegra410 PCIE PMU
  perf/arm_cspmu: nvidia: Add Tegra410 PCIE-TGT PMU
  perf: add NVIDIA Tegra410 CPU Memory Latency PMU
  perf: add NVIDIA Tegra410 C2C PMU
  arm64: defconfig: Enable NVIDIA TEGRA410 PMU

 Documentation/admin-guide/perf/index.rst      |    3 +-
 ...nvidia-pmu.rst => nvidia-tegra241-pmu.rst} |    8 +-
 .../admin-guide/perf/nvidia-tegra410-pmu.rst  |  522 ++++++++
 arch/arm64/configs/defconfig                  |    2 +
 drivers/perf/Kconfig                          |   14 +
 drivers/perf/Makefile                         |    2 +
 drivers/perf/arm_cspmu/arm_cspmu.c            |   19 +-
 drivers/perf/arm_cspmu/arm_cspmu.h            |   17 +-
 drivers/perf/arm_cspmu/nvidia_cspmu.c         |  618 +++++++++-
 drivers/perf/nvidia_t410_c2c_pmu.c            | 1051 +++++++++++++++++
 drivers/perf/nvidia_t410_cmem_latency_pmu.c   |  736 ++++++++++++
 11 files changed, 2979 insertions(+), 13 deletions(-)
 rename Documentation/admin-guide/perf/{nvidia-pmu.rst => nvidia-tegra241-pmu.rst} (98%)
 create mode 100644 Documentation/admin-guide/perf/nvidia-tegra410-pmu.rst
 create mode 100644 drivers/perf/nvidia_t410_c2c_pmu.c
 create mode 100644 drivers/perf/nvidia_t410_cmem_latency_pmu.c

-- 
2.43.0


