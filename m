Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7A89CF433C9
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 15 Apr 2026 21:18:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=zba5Ja6G2u1LYyOtDoFUFJHKbQ4JzVqDk2JwIHqtSqg=; b=zNcHTcDcRHg39vOSfXRsQI2I3x
	+N0Pf21mrbYenPz0vICCc/PwbTZ10lUlKHW8GSqVq4Jc/NLFYrAstbt2Uq8ajJm4/lIOKA2ZjSoEw
	IQUJk1JYvGUCGnNFMW6m8kvPIRCGUlT3vivjegxAai8DN//mrVk3iUd5WiGkBYLSOzsX6Y5+DeFB7
	Zk68wwOt2supcqMEFSWcExcdJ6XdotCfZ7ibJWZN/ieUn9XKRaq5fjf+O5tyo4zRLHub5K9/DGwyg
	XSCW++PYGvar8FTIlJSvLbGsnAx+4F7kjqeiwgJcvsHAdeekyhlZZnmEwzaPDYdAnP0nWlG8TqEtO
	PB3fCrpA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wD7d6-00000001cec-0kzl;
	Wed, 15 Apr 2026 21:18:36 +0000
Received: from mail-centralusazon11010012.outbound.protection.outlook.com ([52.101.61.12] helo=DM1PR04CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wD7cs-00000001cbc-14xY
	for linux-arm-kernel@lists.infradead.org;
	Wed, 15 Apr 2026 21:18:24 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=w1JTPdnRNPUJ9DauRNtwz/tGng3z9DJ0uwt/chxqBxiYbc6TTeAAiLxUgFNVi36b0qQF8XUp8HrBc+XJhMdgP2NyT/Isvvh+ghntD6ROo3ScVSerbLTv7jo0Z21AmM0i0SV7qEEWFogSeFf/sEKFmVfr3gLJLAGCcyVmfX+mI2QyRLJHfpBCUG6TMm68jVlEkhSbj/kXCi9eFfdxQafArRiZC8of6nIVfeUiofIzJD/SKdy+qVax4Hdz4d31XiVF5RE00kz5lGaQ1EA5l/qtaRtnOJgH6+qqaipDAM9112kzO8+EuzrnGuP2TT9Gouy0KYSVF24oG35tfq7YtIob3g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zba5Ja6G2u1LYyOtDoFUFJHKbQ4JzVqDk2JwIHqtSqg=;
 b=h1ZL1viFBoifyiLYPImeDrlHEynYkxAjCbGKuOTjXtmqGyIW7qh0SHV4CTSIRWgojEJyswHVg2FqSo+AmMKz211e+y17B+Tk/xJ5hifRh9pJhA3+pTixEW91XUoA/Hl2w7Nley5/OdRWMfX6I/BP9d8APmH3lI3garKvf7WE3g3CAidVFvWDCx6ux1H5tQdHZ3Klfo4SyLZvCS51zX9udnwAz786CnTltXySHyG2o0h01G6FAV/OM/PGA1XJhDgQaO85up+qtjnJyNKya3QCe7Cu20sBXPhjgudUkoz9NbQqXPlh//h25GnO0dfO04BmaBbdK9QluKfKfe7j3VL7Pw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.160) smtp.rcpttodomain=kernel.org smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zba5Ja6G2u1LYyOtDoFUFJHKbQ4JzVqDk2JwIHqtSqg=;
 b=UeBBHq9RL8jq+CW1O18+W0iL4aqTXN+pm917/KtK+Pau9N21yUzGoXTgMKciwRpJcgvBwk+/VHahNB29IHBWb/6Ue+hAhAzBv2OPuQAnm7UyR9BkDZc0DXGmy7J1gFCpSuzLcK0xvjXr1OCz9GJ19OgpYmdbi+MfTKyzqecb6gLgE4xysnn41Il0/3KcA6DsfBHw8Tn7pUuONjTOO8aiSfnv+YLAizI8mClw4NRR8db1XyuKG+qkFLVQNf0wbCXyjENxkDanZq0GPhGUIS4YKOHGcHB0l1TJvY3B9u2RRJJVbbkIzny+O8PgpjwlMTFKxWQNDtUZnWhxBEqZpgkFtg==
Received: from BLAPR03CA0032.namprd03.prod.outlook.com (2603:10b6:208:32d::7)
 by CH3PR12MB9732.namprd12.prod.outlook.com (2603:10b6:610:253::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9818.20; Wed, 15 Apr
 2026 21:18:14 +0000
Received: from BN3PEPF0000B071.namprd04.prod.outlook.com
 (2603:10b6:208:32d:cafe::c1) by BLAPR03CA0032.outlook.office365.com
 (2603:10b6:208:32d::7) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9769.48 via Frontend Transport; Wed,
 15 Apr 2026 21:18:14 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.160)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.160 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.160; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.160) by
 BN3PEPF0000B071.mail.protection.outlook.com (10.167.243.116) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9769.17 via Frontend Transport; Wed, 15 Apr 2026 21:18:14 +0000
Received: from rnnvmail204.nvidia.com (10.129.68.6) by mail.nvidia.com
 (10.129.200.66) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Wed, 15 Apr
 2026 14:17:52 -0700
Received: from rnnvmail205.nvidia.com (10.129.68.10) by rnnvmail204.nvidia.com
 (10.129.68.6) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Wed, 15 Apr
 2026 14:17:52 -0700
Received: from Asurada-Nvidia.nvidia.com (10.127.8.10) by mail.nvidia.com
 (10.129.68.10) with Microsoft SMTP Server id 15.2.2562.20 via Frontend
 Transport; Wed, 15 Apr 2026 14:17:51 -0700
From: Nicolin Chen <nicolinc@nvidia.com>
To: <will@kernel.org>, <robin.murphy@arm.com>, <jgg@nvidia.com>,
	<kevin.tian@intel.com>
CC: <joro@8bytes.org>, <praan@google.com>, <baolu.lu@linux.intel.com>,
	<miko.lenczewski@arm.com>, <smostafa@google.com>,
	<linux-arm-kernel@lists.infradead.org>, <iommu@lists.linux.dev>,
	<linux-kernel@vger.kernel.org>, <stable@vger.kernel.org>, <jamien@nvidia.com>
Subject: [PATCH rc v2 1/5] iommu/arm-smmu-v3: Add arm_smmu_adopt_strtab() for kdump
Date: Wed, 15 Apr 2026 14:17:36 -0700
Message-ID: <af5fb880e771bc31ba42644ae5570e1fa208217a.1776286352.git.nicolinc@nvidia.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1776286352.git.nicolinc@nvidia.com>
References: <cover.1776286352.git.nicolinc@nvidia.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-NV-OnPremToCloud: ExternallySecured
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN3PEPF0000B071:EE_|CH3PR12MB9732:EE_
X-MS-Office365-Filtering-Correlation-Id: 7d8806e0-4209-41a4-7ec3-08de9b34814f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|7416014|376014|36860700016|82310400026|22082099003|56012099003|18002099003;
X-Microsoft-Antispam-Message-Info: 4ovkEB5+n36Vb8L2SdvqM1dUk2Rl+9QSaHIRJQV6RFJlCT4IxPuCR43E+FZ9YwruskQ9b67AgDMJsUM6ROU/IUiLdbbkTahYsxPfWcz/rx/nVShFTTvtfyspw2KhHKdIZiL6yBZM2/f4GmCcs9ZxR79VVCp0Eqg+ELxwFMAUKQK2WutxHxXZ0+GufkGtaPJl4MLl3heZ5lpnxQQT4BeBdw7tAJIv2XLGVVpnrjnW+RiuQeI6zNBd/jqSFHSgeP6XFZNJvXfC/TUal2F/Ec6TrRs8dd5IjWUEWf/DJvn/28lqQYFGHwzCnPJec18c/C+z3CrLUq2jw2W2cL30ouWCWaEpT8x0Wxh4mkkvJJRDHemCTgAlrJGJKb+yAcYxZOg0jWqEAHpPcijma5DRduAHZAMY5kBBQBCzabI5eh7klYuwl4fzpWNcpcGiNk4doH6K6iRCFhmft4sYdEXPAqBdhiHSbkRcD96BsLWMgPQjolb98Dt17uwW6hUxjb+xnvIJhlLdrruRaiOgECn0e8fatoQuYHRukEH3WZ6dYKD+XPEegvEhMiQV2GKJo7cx2Wc3MKiyJwpPaJ4mMDTQ/L/WNk3KSY3NUtLoAX/jmZLTa0H1sbntkGPQAChV2hq5t+k+bLXxdAKf7pWDTHOXzOqdQP5Xqs1ar/UNNaiNp40BDPrC6agD1dCfjXA5uvc85pF4DfFalXI1ioWi0C2m0IvBEKZH1MTXy04pNDHWSF363+VrCX8PgAxLYxgA82AHaDj4H3LSfOd9GClPC2OQnurGDg==
X-Forefront-Antispam-Report: CIP:216.228.117.160;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge1.nvidia.com;CAT:NONE;SFS:(13230040)(1800799024)(7416014)(376014)(36860700016)(82310400026)(22082099003)(56012099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: JaPSTkmCY5Sj2WmHfV1SjMtJCbLl69lhxqtPZvNX2Wpuri8Evut4UJFi/4121Zvhqz/8yLivIelbH9zPdvBdNa0g+0UOH6pJnEYM4ZNjzkbZx2fqn+VJ8qe8FQTVojiqFiZ5Xx97nwUvcJ9TeY6buTyA7aLlhEIxxVzYu56gdS6okpGndecx2r77b6wk2zq1XasnuiX4vbBoxMv1graQrWutNzI14HD47MNOSncY9PpmKwQo7NoZ2bezNwAQIUxCjosyPmyOUP9Qv1UgDScHgmPH3FHeKy8PM4YbZuf0aXBKpdwTFTGQdrb++cCJdCNtEtoYbjes8UBPpl2aZijG2F2rQoBE4VgSBpMum15KyS6npOrwPY4+fZ8HnSFmxmjhc/y74zcSR4bUmcvdPB408mt2mOKo2OeT4gCKVFLTCoW+doh92edSom5EK/ijDCEa
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Apr 2026 21:18:14.1435
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 7d8806e0-4209-41a4-7ec3-08de9b34814f
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.160];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: BN3PEPF0000B071.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR12MB9732
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260415_141823_040837_FC949DED 
X-CRM114-Status: GOOD (  23.12  )
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

When transitioning to a kdump kernel, the primary kernel might have crashed
while endpoint devices were actively bus-mastering DMA. Currently, the SMMU
driver aggressively resets the hardware during probe by clearing CR0_SMMUEN
and setting the Global Bypass Attribute (GBPA) to ABORT.

In a kdump scenario, this aggressive reset is highly destructive:
a) If GBPA is set to ABORT, in-flight DMA will be aborted, generating fatal
   PCIe AER or SErrors that may panic the kdump kernel
b) If GBPA is set to BYPASS, in-flight DMA targeting some IOVAs will bypass
   the SMMU and corrupt the physical memory at those 1:1 mapped IOVAs.

To safely absorb in-flight DMA, the kdump kernel must leave SMMUEN=1 intact
and avoid modifying STRTAB_BASE. This allows HW to continue translating in-
flight DMA using the crashed kernel's page tables until the endpoint device
drivers probe and quiesce their respective hardware.

However, the ARM SMMUv3 architecture specification states that updating the
SMMU_STRTAB_BASE register while SMMUEN == 1 is UNPREDICTABLE or ignored.

This leaves a kdump kernel no choice but to adopt the stream table from the
crashed kernel.

Introduce ARM_SMMU_OPT_KDUMP and arm_smmu_adopt_strtab() that does memremap
on all the stream tables extracted from STRTAB_BASE and STRTAB_BASE_CFG.

The option will be set in arm_smmu_device_hw_probe().

Fixes: b63b3439b856 ("iommu/arm-smmu-v3: Abort all transactions if SMMU is enabled in kdump kernel")
Cc: stable@vger.kernel.org # v6.12+
Suggested-by: Jason Gunthorpe <jgg@nvidia.com>
Signed-off-by: Nicolin Chen <nicolinc@nvidia.com>
---
 drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.h |   1 +
 drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c | 106 +++++++++++++++++++-
 2 files changed, 106 insertions(+), 1 deletion(-)

diff --git a/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.h b/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.h
index ef42df4753ec4..74950d98ba09f 100644
--- a/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.h
+++ b/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.h
@@ -861,6 +861,7 @@ struct arm_smmu_device {
 #define ARM_SMMU_OPT_MSIPOLL		(1 << 2)
 #define ARM_SMMU_OPT_CMDQ_FORCE_SYNC	(1 << 3)
 #define ARM_SMMU_OPT_TEGRA241_CMDQV	(1 << 4)
+#define ARM_SMMU_OPT_KDUMP		(1 << 5)
 	u32				options;
 
 	struct arm_smmu_cmdq		cmdq;
diff --git a/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c b/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c
index f6901c5437edc..9a45f17200a21 100644
--- a/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c
+++ b/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c
@@ -4553,11 +4553,115 @@ static int arm_smmu_init_strtab_linear(struct arm_smmu_device *smmu)
 	return 0;
 }
 
+static int arm_smmu_adopt_strtab_2lvl(struct arm_smmu_device *smmu, u32 cfg_reg,
+				      dma_addr_t dma)
+{
+	u32 log2size = FIELD_GET(STRTAB_BASE_CFG_LOG2SIZE, cfg_reg);
+	u32 split = FIELD_GET(STRTAB_BASE_CFG_SPLIT, cfg_reg);
+	struct arm_smmu_strtab_cfg *cfg = &smmu->strtab_cfg;
+	u32 num_l1_ents;
+	int i;
+
+	if (log2size < split) {
+		dev_err(smmu->dev, "kdump: invalid log2size %u < split %u\n",
+			log2size, split);
+		return -EINVAL;
+	}
+
+	if (split != STRTAB_SPLIT) {
+		dev_err(smmu->dev,
+			"kdump: unsupported STRTAB_SPLIT %u (expected %u)\n",
+			split, STRTAB_SPLIT);
+		return -EINVAL;
+	}
+
+	num_l1_ents = 1 << (log2size - split);
+	cfg->l2.l1_dma = dma;
+	cfg->l2.num_l1_ents = num_l1_ents;
+	cfg->l2.l1tab = devm_memremap(
+		smmu->dev, dma, num_l1_ents * sizeof(struct arm_smmu_strtab_l1),
+		MEMREMAP_WB);
+	if (!cfg->l2.l1tab)
+		return -ENOMEM;
+
+	cfg->l2.l2ptrs = devm_kcalloc(smmu->dev, num_l1_ents,
+				      sizeof(*cfg->l2.l2ptrs), GFP_KERNEL);
+	if (!cfg->l2.l2ptrs)
+		return -ENOMEM;
+
+	for (i = 0; i < num_l1_ents; i++) {
+		u64 l2ptr = le64_to_cpu(cfg->l2.l1tab[i].l2ptr);
+		u32 span = FIELD_GET(STRTAB_L1_DESC_SPAN, l2ptr);
+		dma_addr_t l2_dma = l2ptr & STRTAB_L1_DESC_L2PTR_MASK;
+
+		if (span && l2_dma) {
+			cfg->l2.l2ptrs[i] = devm_memremap(
+				smmu->dev, l2_dma,
+				sizeof(struct arm_smmu_strtab_l2), MEMREMAP_WB);
+			if (!cfg->l2.l2ptrs[i])
+				return -ENOMEM;
+		}
+	}
+
+	return 0;
+}
+
+static int arm_smmu_adopt_strtab_linear(struct arm_smmu_device *smmu,
+					u32 cfg_reg, dma_addr_t dma)
+{
+	u32 log2size = FIELD_GET(STRTAB_BASE_CFG_LOG2SIZE, cfg_reg);
+	struct arm_smmu_strtab_cfg *cfg = &smmu->strtab_cfg;
+
+	cfg->linear.ste_dma = dma;
+	cfg->linear.num_ents = 1 << log2size;
+	cfg->linear.table = devm_memremap(smmu->dev, dma,
+					  cfg->linear.num_ents *
+						  sizeof(struct arm_smmu_ste),
+					  MEMREMAP_WB);
+	if (!cfg->linear.table)
+		return -ENOMEM;
+	return 0;
+}
+
+static int arm_smmu_adopt_strtab(struct arm_smmu_device *smmu)
+{
+	u32 cfg_reg = readl_relaxed(smmu->base + ARM_SMMU_STRTAB_BASE_CFG);
+	u64 base_reg = readq_relaxed(smmu->base + ARM_SMMU_STRTAB_BASE);
+	u32 fmt = FIELD_GET(STRTAB_BASE_CFG_FMT, cfg_reg);
+	dma_addr_t dma = base_reg & STRTAB_BASE_ADDR_MASK;
+	int ret;
+
+	dev_info(smmu->dev, "kdump: adopting crashed kernel's stream table\n");
+
+	if (fmt == STRTAB_BASE_CFG_FMT_2LVL) {
+		/*
+		 * Both kernels run on the same hardware, so it's impossible for
+		 * kdump kernel to see the support for linear stream table only.
+		 */
+		if (WARN_ON(!(smmu->features & ARM_SMMU_FEAT_2_LVL_STRTAB)))
+			return -EINVAL;
+		ret = arm_smmu_adopt_strtab_2lvl(smmu, cfg_reg, dma);
+	} else if (fmt == STRTAB_BASE_CFG_FMT_LINEAR) {
+		/*
+		 * In case that the old kernel for some reason used the linear
+		 * format, enforce the same format to match the adopted table.
+		 */
+		smmu->features &= ~ARM_SMMU_FEAT_2_LVL_STRTAB;
+		ret = arm_smmu_adopt_strtab_linear(smmu, cfg_reg, dma);
+	} else {
+		dev_err(smmu->dev, "kdump: invalid STRTAB format %u\n", fmt);
+		ret = -EINVAL;
+	}
+	return ret;
+}
+
 static int arm_smmu_init_strtab(struct arm_smmu_device *smmu)
 {
 	int ret;
 
-	if (smmu->features & ARM_SMMU_FEAT_2_LVL_STRTAB)
+	if (smmu->options & ARM_SMMU_OPT_KDUMP)
+		ret = arm_smmu_adopt_strtab(smmu);
+	else if (smmu->features & ARM_SMMU_FEAT_2_LVL_STRTAB)
 		ret = arm_smmu_init_strtab_2lvl(smmu);
 	else
 		ret = arm_smmu_init_strtab_linear(smmu);
-- 
2.43.0


