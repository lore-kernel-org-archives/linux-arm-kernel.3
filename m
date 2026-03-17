Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0CEBAF3380D
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 17 Mar 2026 08:00:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=fPK7YnK8Dk3gJj4xWQuEWjMnOEJlNIxbkurB+9Nf91Y=; b=gpYP0vMO+w8Nr4WvHSHroCZ3ba
	Gvlkg1k65hgEV2TLbuEaHZxcSkeOMg3ZEUdVYC7E2Mp0Ud2pLrWhhbJYxz+YcYXcqPwq1ZYyln7ji
	YfT7JwLl/R6+M7lZiEBDeDJJVme9F3pNIerG7iMvgAR0vWnCkJdV6pXEIH3qQjoYfpwNC5FXau0OP
	wxBQw4A01iztFGtcfNHHNMGTn4foZZjLa39kgWBLxKcbiHjZQoZ/Nt7mgTFKWVN+4Dc8m3+x34hb+
	dmmBwSsf+GITQFf24hfm+AWAZVEPHOe5r9mT7cJAQkb2j6UzkoSjBkl7s0K6KfGnWuyGTrCGhV/C0
	0m0CZGAA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w2PLf-00000005g8P-1AC3;
	Tue, 17 Mar 2026 08:00:19 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w2PLS-00000005fzK-1CyX
	for linux-arm-kernel@bombadil.infradead.org;
	Tue, 17 Mar 2026 08:00:06 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Type:Content-Transfer-Encoding
	:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=fPK7YnK8Dk3gJj4xWQuEWjMnOEJlNIxbkurB+9Nf91Y=; b=i7WUS1rj6y2ogRTG7IfFm6RPZB
	UoC1inWTHXZPhxkIgafTQQAvI1TeOT924KCB4v3pxEiAWmwu3tMExQS6A8AvMCIk45MZAsMxOI70P
	4Rungi9a3GZnxcU0ObOX5GQwDKkupNu2HU+8XBFsNMjsX5JiIuVCPAKdfHtnqy5SV7MhRkfsueI2Y
	PdKtzUavGx2ns/5pOqcFmi/ttO9p5afecoVbSPKzddBEgLmLP10NNX3eU7ZmzbmJ7cjFHDId8DL68
	5ijjcA7/rOqv4VFgNzPKGyFZoidMplVHLW+fBALYQ/AF2p9VlK48er2lGBnSkyzNr9gBmfF3thtEk
	kgAn2FAg==;
Received: from mail-northcentralusazlp170120005.outbound.protection.outlook.com ([2a01:111:f403:c105::5] helo=CH5PR02CU005.outbound.protection.outlook.com)
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w2PLO-00000008LJV-35I2
	for linux-arm-kernel@lists.infradead.org;
	Tue, 17 Mar 2026 08:00:04 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=XQqUaLJQvDPEdUbCx5psk3Gsd1FKc53ngLe1e+G7YKfgP0+YaFmdtGGTb2x0jNre9m6pn++kc6jEIZ++Ft0DJI4kXCFm/0dwWyP7/6i62uzab++YX01orBIPYIXsL4FnHvFLXL6eHvZqbUxtxQwT23ye70SBHBBvknPj7SbAaCKvKPMT+HMSP+wFvKakQKlzIQY21W+15K3YhsdwBzo30FcR2c7sg6Cvx2c4luFqWG/hQ/doMdp0EAjyN3KeslqQi6grE/ATswruaheG99sOJEEBwn4pizAgLYuejv/65m+A+Nma+YvBqHN91ynIcEPsusS+cZzN1+vXB6ggp+ffHQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=fPK7YnK8Dk3gJj4xWQuEWjMnOEJlNIxbkurB+9Nf91Y=;
 b=nso0gBQ3qdEdJYq9dJWMU/8wGXjlzANKZIL7jRYBK/GxId5ks4TICzm0+gMMNGt8xQi7dXGsvlnV6336EvA28WY/xX0oIMXJ9wqnLTx1eazQ3t+nPTOnAJ2lLUoFYQZdfBAbtvKMrQpA05m/up1Xq65PNcl8AFo6VpnJdO3EaM5pga5/m8/3wRs6rqibM2RtUQA7ZaI6geIuwX0euGJTeC67QgXaVt+0Pqg2HTvSJG2GpEXy6x29LgUAMHMzQ3LhRuX1ZfI5UIyeIArpMzXLNC2rFmsFQnhe/CMdKTp7G4ZzYCNhaLT0ThCMRNCNciVTOLv1KPS2l9xlzGE1hjSDfQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.161) smtp.rcpttodomain=kernel.org smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fPK7YnK8Dk3gJj4xWQuEWjMnOEJlNIxbkurB+9Nf91Y=;
 b=j6ZXSjGQgdh9Fd3W5NaD35rQrGM5XMzDrp1rZdwE86eEKkKR/r5iwT9+oEClViYVCC9bCxSfhbdmZJ2/3ZCIUtAGZmPgqvkBRC9HarGCf75sGirKHdKUIdALnbtuaDqRaAGPGluyLWXLoV6h2CqSNmZJXqMvAbhz2LdwhNNeIIVudZ871uUYPtYpLw8VQh+VeIKXBWItKJ48FaX0epiJlUBDWzPv1SBchtdtIxO1Ai9c+MAhUsnEFvjvCOx6VERTTr1QuUcstOLVQJPSvaafeK0CuwrqBhhnI7iD0xZB4H3tCuhZwkDFutLF0sj39Xb1tZDdCnPJf6WeHXykd1nzQg==
Received: from SJ0PR03CA0198.namprd03.prod.outlook.com (2603:10b6:a03:2ef::23)
 by SJ1PR12MB6364.namprd12.prod.outlook.com (2603:10b6:a03:452::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9723.17; Tue, 17 Mar
 2026 07:59:53 +0000
Received: from SJ1PEPF00001CE9.namprd03.prod.outlook.com
 (2603:10b6:a03:2ef:cafe::98) by SJ0PR03CA0198.outlook.office365.com
 (2603:10b6:a03:2ef::23) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9700.24 via Frontend Transport; Tue,
 17 Mar 2026 07:59:53 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.161)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.161 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.161; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.161) by
 SJ1PEPF00001CE9.mail.protection.outlook.com (10.167.242.25) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9700.17 via Frontend Transport; Tue, 17 Mar 2026 07:59:53 +0000
Received: from rnnvmail205.nvidia.com (10.129.68.10) by mail.nvidia.com
 (10.129.200.67) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Tue, 17 Mar
 2026 00:59:41 -0700
Received: from rnnvmail202.nvidia.com (10.129.68.7) by rnnvmail205.nvidia.com
 (10.129.68.10) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Tue, 17 Mar
 2026 00:59:40 -0700
Received: from Asurada-Nvidia.nvidia.com (10.127.8.9) by mail.nvidia.com
 (10.129.68.7) with Microsoft SMTP Server id 15.2.2562.20 via Frontend
 Transport; Tue, 17 Mar 2026 00:59:39 -0700
From: Nicolin Chen <nicolinc@nvidia.com>
To: <will@kernel.org>
CC: <jpb@kernel.org>, <robin.murphy@arm.com>, <joro@8bytes.org>,
	<jgg@nvidia.com>, <balbirs@nvidia.com>, <catalin.marinas@arm.com>,
	<praan@google.com>, <miko.lenczewski@arm.com>, <smostafa@google.com>,
	<xueshuai@linux.alibaba.com>, <baolu.lu@linux.intel.com>,
	<kevin.tian@intel.com>, <mshavit@google.com>,
	<linux-arm-kernel@lists.infradead.org>, <iommu@lists.linux.dev>,
	<linux-kernel@vger.kernel.org>, <peterz@infradead.org>
Subject: [PATCH v13 7/8] iommu/arm-smmu-v3: Add arm_smmu_invs based arm_smmu_domain_inv_range()
Date: Tue, 17 Mar 2026 00:59:22 -0700
Message-ID: <5237e8f95e23accefe8ee6f11c8b4f18949e9c5a.1773733797.git.nicolinc@nvidia.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1773733797.git.nicolinc@nvidia.com>
References: <cover.1773733797.git.nicolinc@nvidia.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-NV-OnPremToCloud: ExternallySecured
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ1PEPF00001CE9:EE_|SJ1PR12MB6364:EE_
X-MS-Office365-Filtering-Correlation-Id: 1bd1e845-d803-4808-2bc2-08de83fb2c6f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|82310400026|1800799024|376014|7416014|36860700016|3613699012|22082099003|18002099003|56012099003;
X-Microsoft-Antispam-Message-Info: nrczczEqs6dwPUJpGhE1diFczSw7wnFzMZ6i96/DcU7fzqbvE5aGROfuN44aSypQq9Gvu1fu7aJ0g5E50JntkWD5TMXLL/Oa50wBMmro9KK7HNaOphF9pKeYXsrPfaBPq8Cla/PcZ5CklG6mLcF2/oewstWOBitHuw9Yu01PFU1q9MFECYFSmslOm1b+3u4QtLWrFNyr7PoPyTo724/qCJGa6wHPejVumY9eZmAhqufIcziszijKGTvoKdwRZhUXbKcJhR/Dc+dRANsvWXt8wLzurIsUOY1/8P71ONXBn2YbUNPkxaJozKze8NsE6wn4zTggO9UtbH+W0Qy0sLus72NFthnfce5JciRZYQWcRM0XBP9BhjXV+WDE7QZ5usckMZFRQZ6JkniWZqbXnb+EmdAeS9BWRqyth9y+qU+gdyYwYO2Uj3lSfCgfLcJUMROXGICA8Xw1LCmYTkV55urZZ/uxQ9KsxAP7UILlPgI1fgPP6p5YNrx5h8EzLmbSd8imQhJ7YhyPhUs/otkZtmkcZEGk2wCjRWyomC2StVetmvFIXjRiH7IyjjlA3V03pkYI45sug74NMeTAsxSZITyHqAkHwtGMGW3bsMFS+l7PB0m9NiURprl6sabBqK6Z0gu5tFDRN+HDilwtpdEO/xOXfFKfvc229jJdzlNwb4lHTSRoc3A5lqgOmIDdAmxuOHMMfOBSHDrWjV6kCgAm6PKs3Sq4PO0SAq4zKZyLnzMKR2uWQiR/YGXefP+yEDyEvDfn/BdqFYFSz39hnuJsQMZpDTtOroLHQI9wuyemTyoE9/1NV34Nr7Q+Flh29XmWBHsxgzPuGLqJHbuczISLVgupPA==
X-Forefront-Antispam-Report: CIP:216.228.117.161;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge2.nvidia.com;CAT:NONE;SFS:(13230040)(82310400026)(1800799024)(376014)(7416014)(36860700016)(3613699012)(22082099003)(18002099003)(56012099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: yrxSC7dh0yFfxTgEx2jia7YBOkbufYazB3OHd0Y7iKOfkznwNOSrUWIy76WUkm6stjFPt4Z2uQQkYzXqtWeByqJlPbsQ2lf/Aii72/UX2jPqijkbEhMAQ6GuOBoo4gXz5xVMehStH53m1zH3l+GCjpkdZTXOPRKM/3sKJHKUc1Fx4OggEhcSXCk18ZneBLBWJvRyXZBlsaZTkVrkGp7CBd4XWBiQvrSyxlrGH9PuulhDkj8LM/hhtGbFKRHiiOx4bCZ5CeMpdyd4QKiAzlBt0uyd+TYeao8elZdiKpzXUMdyJgNooMSmm2221V1LA7Xladm6g/KLaBSGMxL0ZiHHEIo9CPPSjvXpemqLeJXSOaUgIBgmkKPflqnMW9C/c4H6oXzNnNVmiwUj7UAPspP+VDpHUkO/x6DYJ4uCnPa2A3oVZNB6QkCOghK+sSTbfhQB
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Mar 2026 07:59:53.8293
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 1bd1e845-d803-4808-2bc2-08de83fb2c6f
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.161];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: SJ1PEPF00001CE9.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ1PR12MB6364
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260317_080003_058144_E68B53F5 
X-CRM114-Status: GOOD (  21.38  )
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

Each smmu_domain now has an arm_smmu_invs that specifies the invalidation
steps to perform after any change the IOPTEs. This includes supports for
basic ASID/VMID, the special case for nesting, and ATC invalidations.

Introduce a new arm_smmu_domain_inv helper iterating smmu_domain->invs to
convert the invalidation array to commands. Any invalidation request with
no size specified means an entire flush over a range based one.

Take advantage of the sorted array to compatible batch operations together
to the same SMMU. For instance, ATC invaliations for multiple SIDs can be
pushed as a batch.

ATC invalidations must be completed before the driver disables ATS. Or the
device is permitted to ignore any racing invalidation that would cause an
SMMU timeout. The sequencing is done with a rwlock where holding the write
side of the rwlock means that there are no outstanding ATC invalidations.
If ATS is not used the rwlock is ignored, similar to the existing code.

Co-developed-by: Jason Gunthorpe <jgg@nvidia.com>
Signed-off-by: Jason Gunthorpe <jgg@nvidia.com>
Reviewed-by: Jason Gunthorpe <jgg@nvidia.com>
Signed-off-by: Nicolin Chen <nicolinc@nvidia.com>
---
 drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.h |   9 +
 drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c | 225 ++++++++++++++++++--
 2 files changed, 221 insertions(+), 13 deletions(-)

diff --git a/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.h b/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.h
index 83d7e4952dffb..534e9a5ddca31 100644
--- a/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.h
+++ b/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.h
@@ -1087,6 +1087,15 @@ void arm_smmu_tlb_inv_range_asid(unsigned long iova, size_t size, int asid,
 int arm_smmu_atc_inv_domain(struct arm_smmu_domain *smmu_domain,
 			    unsigned long iova, size_t size);
 
+void arm_smmu_domain_inv_range(struct arm_smmu_domain *smmu_domain,
+			       unsigned long iova, size_t size,
+			       unsigned int granule, bool leaf);
+
+static inline void arm_smmu_domain_inv(struct arm_smmu_domain *smmu_domain)
+{
+	arm_smmu_domain_inv_range(smmu_domain, 0, 0, 0, false);
+}
+
 void __arm_smmu_cmdq_skip_err(struct arm_smmu_device *smmu,
 			      struct arm_smmu_cmdq *cmdq);
 int arm_smmu_init_one_queue(struct arm_smmu_device *smmu,
diff --git a/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c b/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c
index 1d0f968138646..19e47c614ba7f 100644
--- a/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c
+++ b/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c
@@ -2595,23 +2595,19 @@ static void arm_smmu_tlb_inv_context(void *cookie)
 	arm_smmu_atc_inv_domain(smmu_domain, 0, 0);
 }
 
-static void __arm_smmu_tlb_inv_range(struct arm_smmu_cmdq_ent *cmd,
-				     unsigned long iova, size_t size,
-				     size_t granule,
-				     struct arm_smmu_domain *smmu_domain)
+static void arm_smmu_cmdq_batch_add_range(struct arm_smmu_device *smmu,
+					  struct arm_smmu_cmdq_batch *cmds,
+					  struct arm_smmu_cmdq_ent *cmd,
+					  unsigned long iova, size_t size,
+					  size_t granule, size_t pgsize)
 {
-	struct arm_smmu_device *smmu = smmu_domain->smmu;
-	unsigned long end = iova + size, num_pages = 0, tg = 0;
+	unsigned long end = iova + size, num_pages = 0, tg = pgsize;
 	size_t inv_range = granule;
-	struct arm_smmu_cmdq_batch cmds;
 
 	if (!size)
 		return;
 
 	if (smmu->features & ARM_SMMU_FEAT_RANGE_INV) {
-		/* Get the leaf page size */
-		tg = __ffs(smmu_domain->domain.pgsize_bitmap);
-
 		num_pages = size >> tg;
 
 		/* Convert page size of 12,14,16 (log2) to 1,2,3 */
@@ -2631,8 +2627,6 @@ static void __arm_smmu_tlb_inv_range(struct arm_smmu_cmdq_ent *cmd,
 			num_pages++;
 	}
 
-	arm_smmu_cmdq_batch_init(smmu, &cmds, cmd);
-
 	while (iova < end) {
 		if (smmu->features & ARM_SMMU_FEAT_RANGE_INV) {
 			/*
@@ -2660,9 +2654,26 @@ static void __arm_smmu_tlb_inv_range(struct arm_smmu_cmdq_ent *cmd,
 		}
 
 		cmd->tlbi.addr = iova;
-		arm_smmu_cmdq_batch_add(smmu, &cmds, cmd);
+		arm_smmu_cmdq_batch_add(smmu, cmds, cmd);
 		iova += inv_range;
 	}
+}
+
+static void __arm_smmu_tlb_inv_range(struct arm_smmu_cmdq_ent *cmd,
+				     unsigned long iova, size_t size,
+				     size_t granule,
+				     struct arm_smmu_domain *smmu_domain)
+{
+	struct arm_smmu_device *smmu = smmu_domain->smmu;
+	struct arm_smmu_cmdq_batch cmds;
+	size_t pgsize;
+
+	/* Get the leaf page size */
+	pgsize = __ffs(smmu_domain->domain.pgsize_bitmap);
+
+	arm_smmu_cmdq_batch_init(smmu, &cmds, cmd);
+	arm_smmu_cmdq_batch_add_range(smmu, &cmds, cmd, iova, size, granule,
+				      pgsize);
 	arm_smmu_cmdq_batch_submit(smmu, &cmds);
 }
 
@@ -2718,6 +2729,194 @@ void arm_smmu_tlb_inv_range_asid(unsigned long iova, size_t size, int asid,
 	__arm_smmu_tlb_inv_range(&cmd, iova, size, granule, smmu_domain);
 }
 
+static bool arm_smmu_inv_size_too_big(struct arm_smmu_device *smmu, size_t size,
+				      size_t granule)
+{
+	size_t max_tlbi_ops;
+
+	/* 0 size means invalidate all */
+	if (!size || size == SIZE_MAX)
+		return true;
+
+	if (smmu->features & ARM_SMMU_FEAT_RANGE_INV)
+		return false;
+
+	/*
+	 * Borrowed from the MAX_TLBI_OPS in arch/arm64/include/asm/tlbflush.h,
+	 * this is used as a threshold to replace "size_opcode" commands with a
+	 * single "nsize_opcode" command, when SMMU doesn't implement the range
+	 * invalidation feature, where there can be too many per-granule TLBIs,
+	 * resulting in a soft lockup.
+	 */
+	max_tlbi_ops = 1 << (ilog2(granule) - 3);
+	return size >= max_tlbi_ops * granule;
+}
+
+/* Used by non INV_TYPE_ATS* invalidations */
+static void arm_smmu_inv_to_cmdq_batch(struct arm_smmu_inv *inv,
+				       struct arm_smmu_cmdq_batch *cmds,
+				       struct arm_smmu_cmdq_ent *cmd,
+				       unsigned long iova, size_t size,
+				       unsigned int granule)
+{
+	if (arm_smmu_inv_size_too_big(inv->smmu, size, granule)) {
+		cmd->opcode = inv->nsize_opcode;
+		arm_smmu_cmdq_batch_add(inv->smmu, cmds, cmd);
+		return;
+	}
+
+	cmd->opcode = inv->size_opcode;
+	arm_smmu_cmdq_batch_add_range(inv->smmu, cmds, cmd, iova, size, granule,
+				      inv->pgsize);
+}
+
+static inline bool arm_smmu_invs_end_batch(struct arm_smmu_inv *cur,
+					   struct arm_smmu_inv *next)
+{
+	/* Changing smmu means changing command queue */
+	if (cur->smmu != next->smmu)
+		return true;
+	/* The batch for S2 TLBI must be done before nested S1 ASIDs */
+	if (cur->type != INV_TYPE_S2_VMID_S1_CLEAR &&
+	    next->type == INV_TYPE_S2_VMID_S1_CLEAR)
+		return true;
+	/* ATS must be after a sync of the S1/S2 invalidations */
+	if (!arm_smmu_inv_is_ats(cur) && arm_smmu_inv_is_ats(next))
+		return true;
+	return false;
+}
+
+static void __arm_smmu_domain_inv_range(struct arm_smmu_invs *invs,
+					unsigned long iova, size_t size,
+					unsigned int granule, bool leaf)
+{
+	struct arm_smmu_cmdq_batch cmds = {};
+	struct arm_smmu_inv *cur;
+	struct arm_smmu_inv *end;
+
+	cur = invs->inv;
+	end = cur + READ_ONCE(invs->num_invs);
+	/* Skip any leading entry marked as a trash */
+	for (; cur != end; cur++)
+		if (READ_ONCE(cur->users))
+			break;
+	while (cur != end) {
+		struct arm_smmu_device *smmu = cur->smmu;
+		struct arm_smmu_cmdq_ent cmd = {
+			/*
+			 * Pick size_opcode to run arm_smmu_get_cmdq(). This can
+			 * be changed to nsize_opcode, which would result in the
+			 * same CMDQ pointer.
+			 */
+			.opcode = cur->size_opcode,
+		};
+		struct arm_smmu_inv *next;
+
+		if (!cmds.num)
+			arm_smmu_cmdq_batch_init(smmu, &cmds, &cmd);
+
+		switch (cur->type) {
+		case INV_TYPE_S1_ASID:
+			cmd.tlbi.asid = cur->id;
+			cmd.tlbi.leaf = leaf;
+			arm_smmu_inv_to_cmdq_batch(cur, &cmds, &cmd, iova, size,
+						   granule);
+			break;
+		case INV_TYPE_S2_VMID:
+			cmd.tlbi.vmid = cur->id;
+			cmd.tlbi.leaf = leaf;
+			arm_smmu_inv_to_cmdq_batch(cur, &cmds, &cmd, iova, size,
+						   granule);
+			break;
+		case INV_TYPE_S2_VMID_S1_CLEAR:
+			/* CMDQ_OP_TLBI_S12_VMALL already flushed S1 entries */
+			if (arm_smmu_inv_size_too_big(cur->smmu, size, granule))
+				continue;
+			cmd.tlbi.vmid = cur->id;
+			arm_smmu_cmdq_batch_add(smmu, &cmds, &cmd);
+			break;
+		case INV_TYPE_ATS:
+			arm_smmu_atc_inv_to_cmd(cur->ssid, iova, size, &cmd);
+			cmd.atc.sid = cur->id;
+			arm_smmu_cmdq_batch_add(smmu, &cmds, &cmd);
+			break;
+		case INV_TYPE_ATS_FULL:
+			arm_smmu_atc_inv_to_cmd(IOMMU_NO_PASID, 0, 0, &cmd);
+			cmd.atc.sid = cur->id;
+			arm_smmu_cmdq_batch_add(smmu, &cmds, &cmd);
+			break;
+		default:
+			WARN_ON_ONCE(1);
+			continue;
+		}
+
+		/* Skip any trash entry in-between */
+		for (next = cur + 1; next != end; next++)
+			if (READ_ONCE(next->users))
+				break;
+
+		if (cmds.num &&
+		    (next == end || arm_smmu_invs_end_batch(cur, next))) {
+			arm_smmu_cmdq_batch_submit(smmu, &cmds);
+			cmds.num = 0;
+		}
+		cur = next;
+	}
+}
+
+void arm_smmu_domain_inv_range(struct arm_smmu_domain *smmu_domain,
+			       unsigned long iova, size_t size,
+			       unsigned int granule, bool leaf)
+{
+	struct arm_smmu_invs *invs;
+
+	/*
+	 * An invalidation request must follow some IOPTE change and then load
+	 * an invalidation array. In the meantime, a domain attachment mutates
+	 * the array and then stores an STE/CD asking SMMU HW to acquire those
+	 * changed IOPTEs.
+	 *
+	 * When running alone, a domain attachment relies on the dma_wmb() in
+	 * arm_smmu_write_entry() used by arm_smmu_install_ste_for_dev().
+	 *
+	 * But in a race, these two can be interdependent, making it a special
+	 * case requiring an additional smp_mb() for the write->read ordering.
+	 * Pairing with the dma_wmb() in arm_smmu_install_ste_for_dev(), this
+	 * makes sure that IOPTE update prior to this point is visable to SMMU
+	 * hardware before we load the updated invalidation array.
+	 *
+	 *  [CPU0]                        | [CPU1]
+	 *  change IOPTE on new domain:   |
+	 *  arm_smmu_domain_inv_range() { | arm_smmu_install_new_domain_invs()
+	 *    smp_mb(); // ensures IOPTE  | arm_smmu_install_ste_for_dev {
+	 *              // seen by SMMU   |   dma_wmb(); // ensures invs update
+	 *    // load the updated invs    |              // before updating STE
+	 *    invs = rcu_dereference();   |   STE = TTB0;
+	 *    ...                         |   ...
+	 *  }                             | }
+	 */
+	smp_mb();
+
+	rcu_read_lock();
+	invs = rcu_dereference(smmu_domain->invs);
+
+	/*
+	 * Avoid locking unless ATS is being used. No ATC invalidation can be
+	 * going on after a domain is detached.
+	 */
+	if (invs->has_ats) {
+		unsigned long flags;
+
+		read_lock_irqsave(&invs->rwlock, flags);
+		__arm_smmu_domain_inv_range(invs, iova, size, granule, leaf);
+		read_unlock_irqrestore(&invs->rwlock, flags);
+	} else {
+		__arm_smmu_domain_inv_range(invs, iova, size, granule, leaf);
+	}
+
+	rcu_read_unlock();
+}
+
 static void arm_smmu_tlb_inv_page_nosync(struct iommu_iotlb_gather *gather,
 					 unsigned long iova, size_t granule,
 					 void *cookie)
-- 
2.43.0


