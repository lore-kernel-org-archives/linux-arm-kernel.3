Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4D6D0CD5BAB
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 21 May 2026 20:35:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=Ha3CEWzGsDzhlIj6RzljDCLyBSbtKnXornG55Ag08pw=; b=bV319cJMmXehFXMm+q1g54gcHw
	F+3Qc0daaf7hiIdHzFGQCjYc59KDW6Kt4kO+FGFTwkdJ7/5nLPiQTxN5vvrk2erlrA1y1i2gVBwCU
	r8WbL73Ab5huFc9JwWD7ANrQaxI8A/4dDdNq3IvxrIADkFeqD3qUUP9uPYmbKWKhPfGvm8KEzEmlY
	j1myk136HazeAQab9RB1NyKdx+fqpL1xmnGaBNqIjSZEZVHDvUEr3wVPGj2mOGxlqkDgHtkVvEVmq
	eKOgZl4GXsgUD3NLvL47RvbdRutOV7HeSx+h96djNg37uji0W0tq0hmLyTWcU2/uZjJz+x6bHCCbg
	9WzrSPlA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wQA6Z-000000091xd-0bhE;
	Thu, 21 May 2026 20:34:55 +0000
Received: from mail-southcentralusazon11012002.outbound.protection.outlook.com ([40.93.195.2] helo=SN4PR2101CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wQA6X-000000091wp-0xiL
	for linux-arm-kernel@lists.infradead.org;
	Thu, 21 May 2026 20:34:54 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=OMcm681LTt9o0LZjxRk01I69Uq3ZMP2i028PWOWXDGm7pNziKADIUP30M92bd5NvEGo2DFtS9m4cM9aV3LCjteVBCbVRsgSvVipaQVlFavEtm7pocZnOoSAjHLrLcS7qBgmkLJ2bJMyEXrNXcdg4M0x/AVRG0sQfsOBxqDJDKAkbAQ3IIP2JOLopUtTGfdSsFNjvBlaPhswtg50Eb3Z9ku1++BGJyihdQoKHZMGlqyZkbCmzSPylxxN1duez/OQEOwDJixEVzYAsTSqdJ9rZBbETb+izMQZsf5RQlKvPVNU6+LRL2Vy+rsCzWi8V1zd2Y4xH+DcCA4mXCiLwO7cj9g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Ha3CEWzGsDzhlIj6RzljDCLyBSbtKnXornG55Ag08pw=;
 b=au0h5o8wDfMTzi7QuhZaVl/yXI9zv3nmjS5MfxJjivwFoX5asvDxVpDeJmeL9A3LDhY6kIV/tLy729Jb78eSGyDU9CdEJL+Wk36b/W3ik6rkyeHhoFcTuD9zXmgpL4DkC0khbViAKODqCnmeSFMjFMWoEkASeopscB3I8PqSLGrSzD9Dr/goMqNcd1f9dzoPi5ja/z33xoZUdr5PL2mdRBAjjRqVhIWsAj9LJj23jpYEnzJZbkybp3rmXY5jQPvcSLaXDrow3iA0O4Kpgz5XKnxCfCvSuNEEEesoCNHGh4B9mB9ObgNGVLkTdi4sNEmoglgp42PI7Awsxyp6qxkhEQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.118.233) smtp.rcpttodomain=huawei.com smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Ha3CEWzGsDzhlIj6RzljDCLyBSbtKnXornG55Ag08pw=;
 b=Yt1FCB+zmFEwwoD+pO1jmLLT5CkMsHGY26IOLHiqLsq2SMQKZIGDBQynuuNN9tUKfUz+U19E40ibciVBt2HIhmsbb6ITX1tAtAzMj2nuwpokFMq2+GY08fYnP9MjLzj4y4XpkbDmgyByafBwXNixuQ9qSVLL9oCIa9XQHZCVvUG7wrB9qtj2et1g3drfWh5jNiGpz7N2wYZngkUg4QGD0kB+1jyO+tWDWPKMnN4fvEwaDlCSJy3e1ezcoW3L3zq204vGXKCYwyDxCtFlvPxiEHLvjAwxLq1Tn8bShYs7PE2X+tVKNv0DMGhihDJK8UY8J0OInbmQdHM1Q3SkfWdr3w==
Received: from BYAPR21CA0014.namprd21.prod.outlook.com (2603:10b6:a03:114::24)
 by CY3PR12MB9605.namprd12.prod.outlook.com (2603:10b6:930:103::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.48.16; Thu, 21 May
 2026 20:34:45 +0000
Received: from CO1PEPF00012E60.namprd05.prod.outlook.com
 (2603:10b6:a03:114:cafe::18) by BYAPR21CA0014.outlook.office365.com
 (2603:10b6:a03:114::24) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.71.7 via Frontend Transport; Thu, 21
 May 2026 20:34:45 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.118.233)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.118.233 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.118.233; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.118.233) by
 CO1PEPF00012E60.mail.protection.outlook.com (10.167.249.69) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.71.7 via Frontend Transport; Thu, 21 May 2026 20:34:44 +0000
Received: from drhqmail202.nvidia.com (10.126.190.181) by mail.nvidia.com
 (10.127.129.6) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Thu, 21 May
 2026 13:34:27 -0700
Received: from drhqmail203.nvidia.com (10.126.190.182) by
 drhqmail202.nvidia.com (10.126.190.181) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.20; Thu, 21 May 2026 13:34:27 -0700
Received: from Asurada-Nvidia.nvidia.com (10.127.8.9) by mail.nvidia.com
 (10.126.190.182) with Microsoft SMTP Server id 15.2.2562.20 via Frontend
 Transport; Thu, 21 May 2026 13:34:26 -0700
From: Nicolin Chen <nicolinc@nvidia.com>
To: <jgg@nvidia.com>, <will@kernel.org>
CC: <robin.murphy@arm.com>, <joro@8bytes.org>, <bhelgaas@google.com>,
	<praan@google.com>, <baolu.lu@linux.intel.com>, <kevin.tian@intel.com>,
	<miko.lenczewski@arm.com>, <linux-arm-kernel@lists.infradead.org>,
	<iommu@lists.linux.dev>, <linux-kernel@vger.kernel.org>,
	<linux-pci@vger.kernel.org>, <dan.j.williams@intel.com>,
	<jonathan.cameron@huawei.com>, <vsethi@nvidia.com>,
	<linux-cxl@vger.kernel.org>, <nirmoyd@nvidia.com>
Subject: [PATCH v6 0/3] Allow ATS to be always on for certain ATS-capable devices
Date: Thu, 21 May 2026 13:34:19 -0700
Message-ID: <cover.1779392420.git.nicolinc@nvidia.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-NV-OnPremToCloud: ExternallySecured
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PEPF00012E60:EE_|CY3PR12MB9605:EE_
X-MS-Office365-Filtering-Correlation-Id: 19b42882-1211-43a2-1509-08deb77864ad
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|82310400026|36860700016|7416014|376014|1800799024|6133799003|5023799004|11063799006|18002099003|56012099003|13003099007;
X-Microsoft-Antispam-Message-Info: VoJ5hB75cstpT3iuWusmasUv2TYJnPqWfLQoB2RASvXyzbitDeTl+tLY2nZ/AE8MA7YilKets7fUy+0F/y64SU6I/dk+f6Nc5gT26/YZWb0ytQYILphD3dNqsqtos7/7Cj52rw0kNe+zLwHby90DdXDk9oEBTSvYCRzqXb3HOpxLnzGyaAPn3Sw1FS7EUQir8lIK9TawuDVrX2ZknsS31YIGuo/0Rv0y3mPenfDRucGzbPJD8agwmGqlQ7UiYUX1TKqC9gwSDPfkFVUmP3ewB6KZAZ/gr2MomtUmPzpiHd1GuujUtKeYUZq5HrOTUVUGGQcB441dneIoOl+RHP0RkKZy9iMYb82NPGW6WkCjJFY3KyJ+bJizwfKhzXhKu3HxfQCS69IgpmdZGQM1eILnmPm6kXUJMJhg3ME5wThmrJM+s4kTJBIKldX1Zhrwz22e4gJXaAzZ6+8HAzKEo3kAgpMDMaTobLEnPm/aO5BRVVecCjSQH4VBS8VBcg6WiPU1vL4ofj+FLlmdXQIBpERLOQ+akR96Fnd1A7jxwIcWNBBWklRuVPmRBCDTyxFVBc//AvCXGCGkoc/6si5ZbK85L2MiLNa5/tqoAUpJ31G2XxoaBvQNcBK/Ct8CMxQ8Pgg7Gdd/Mwa5eJIB/o5QM8ha7f4VJsmksgbKTe/quXedW4yiCB8RTuqKXudxVmNc0XBFfDqt/243jm+uE4P323BSdJwM2d/PfQGpSeFuAKR+p1U=
X-Forefront-Antispam-Report: CIP:216.228.118.233;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc7edge2.nvidia.com;CAT:NONE;SFS:(13230040)(82310400026)(36860700016)(7416014)(376014)(1800799024)(6133799003)(5023799004)(11063799006)(18002099003)(56012099003)(13003099007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: P8c0XNiQ8gqyNe5xnZFhrbR1H9EGZkhfxN2Z5KuuenMg7r0WZfkmgshfErzoILUknLKw7EA3/nut6jJ2e3WKi64iUCamroxYZy28GgITm/HD/8CO6ZVZe+4w/RaWOync9gOxubBJ8gRh0OE8NyqutDxgIcXZmWxqfvPIz5vOzhcSlVrf0773KYAW3oYCZU5sAxlfMuenNTIuLPWTTmFkCnyvCXeqRAQ7RYNbPVy3n2exriBwNXQxyV0FGG465OqBT4LYcSJmXKtsFEW9JuwkgfhD5W9H/Wz2A71XQHGt9FBVFH55Y3Ld5PsBG1A7sUVR8TpklZu4katht5q7bhKkb/5m/kui7uiXH5wNYSGZtTOQt8hVwGuhgi9rch5TqjEfaLjJxukMPuLkM6+FJ8E5N5BxxLZyxc1LcMu1wtXpnPw6vAG7xuRionw5fZiFBOgk
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 May 2026 20:34:44.5202
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 19b42882-1211-43a2-1509-08deb77864ad
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.118.233];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: CO1PEPF00012E60.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY3PR12MB9605
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260521_133453_283274_80E8BEDE 
X-CRM114-Status: GOOD (  12.64  )
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

PCI ATS function is controlled by the IOMMU driver calling pci_enable_ats()
and pci_disable_ats() helpers. Depending on the driver implementation:
 - ATS should be enabled when a translation channel is enabled on a PASID
   (a typical SVA case).
 - ATS should be disabled when the device's RID is IOMMU bypassed and its
   PASIDs are not IOMMU-translated for any SVA use case.

However, certain PCIe devices require non-PASID ATS on the RID, even if the
RID is IOMMU bypassed. E.g. CXL.cache capability requires ATS to access the
physical memory; some pre-CXL NVIDIA GPUs also require the ATS to be always
on even when their RIDs are IOMMU bypassed.

Provide a helper function to detect CXL.cache capability and scan through a
pre-CXL device ID list.

As the initial use case, call the helper in ARM SMMUv3 driver and adapt the
driver accordingly with a per-device ats_always_on flag.

This is on Github:
https://github.com/nicolinc/iommufd/commits/pci_ats_always_on-v6

Changelog
v6
 * Add Acked-by from Bjorn
 * Slightly update commit message (Yi's comments)
 * [pci] Drop the redundant pci_ats_disabled() check
 * [smmu] Fix mismatched detach path against attach path
 * [smmu] Propagate arm_smmu_master_prepare_ats() error code
v5
 https://lore.kernel.org/all/cover.1779304390.git.nicolinc@nvidia.com/
 * Add Reviewed-by from Dave
 * Update comments in pci helpers
 * s/pci_ats_always_on/pci_ats_required
 * s/pci_cxl_ats_always_on/pci_cxl_ats_required
 * s/pci_dev_specific_ats_always_on/pci_dev_specific_ats_required
v4
 https://lore.kernel.org/all/cover.1777269009.git.nicolinc@nvidia.com/
 * Rebase on v7.1-rc1
 * Added Reviewed/Tested/Acked-by lines
 * Update commit messages and inline comments
 * [pci-quirks] Add range-based scan for NVIDIA GPUs
 * [smmu] Add missing arm_smmu_remove_master() in error path
 * [pci-ats] Don't init "cap=0"; check pci_read_config_word error
v3
 https://lore.kernel.org/all/cover.1772833963.git.nicolinc@nvidia.com/
 * Add Reviewed-by from Jonathan
 * Update function kdocs of PCI APIs
 * Simplify boolean return/variable computations
v2
 https://lore.kernel.org/all/cover.1771886695.git.nicolinc@nvidia.com/
 * s/non-CXL/pre-CXL
 * Rebase on v7.0-rc1
 * Update inline comments and commit message
 * Add WARN_ON back at !ptr in arm_smmu_clear_cd()
 * Add NVIDIA CX10 Family NVlink-C2C to the pre-CXL list
 * Do not add boolean parameter to arm_smmu_attach_dev_ste()
v1
 https://lore.kernel.org/all/cover.1768624180.git.nicolinc@nvidia.com/

Nicolin Chen (3):
  PCI: Add pci_ats_required() for CXL.cache capable devices
  PCI: Allow ATS to be always on for pre-CXL devices
  iommu/arm-smmu-v3: Allow ATS to be always on

 drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.h |  1 +
 drivers/pci/pci.h                           |  9 +++
 include/linux/pci-ats.h                     |  3 +
 include/uapi/linux/pci_regs.h               |  1 +
 drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c | 81 ++++++++++++++++++---
 drivers/pci/ats.c                           | 47 ++++++++++++
 drivers/pci/quirks.c                        | 42 +++++++++++
 7 files changed, 175 insertions(+), 9 deletions(-)

-- 
2.43.0


