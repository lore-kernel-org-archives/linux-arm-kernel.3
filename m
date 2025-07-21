Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 56AA8C83F1A
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 21 Jul 2025 19:20:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Y8Ks1OFB7c/GtKmM/7R4tdQpdpKEvZgiF3taCNnCXN4=; b=1MGDIFHFey9OIgA9FxKehFN0SP
	z3gCUCPpwLGuHwCgdhWFqyjz+xv4W36P+NnIqZRvri8SyVwurYpMTpl5vfzVMU3BgbQbofqU3eAkp
	7jKflg/EVS4HlS1KoLgiNNQel/eFWJMWlHmDiyMAuUxPe6ThCx2crSKfk/9Gk282wURWD4XsrdyOG
	qsiY1JanVJh2g0Wrt0muICQfXlqECYyouATYPCIhaaymVk1qN00XARpWkIQeDJIxNzSe14pAqQCKp
	0XoKw/ji2FB+hDZdk9PrmPQpoFhBXOJ4M0ZvS5KL0Y93bxVRpbuQYFEWQ6R2h8BXOLDKHKRL9fazU
	LmntisSw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1udw3s-00000000Vkc-0nTY;
	Mon, 21 Jul 2025 19:20:32 +0000
Received: from mail-co1nam11on20609.outbound.protection.outlook.com ([2a01:111:f403:2416::609] helo=NAM11-CO1-obe.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1udvwb-00000000V9b-1bso
	for linux-arm-kernel@lists.infradead.org;
	Mon, 21 Jul 2025 19:13:02 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=JuGwQKzrl+b/Pfywc8IH33dYob48M5rI0cBoWbGPDdzwLvh09Uzy6czNPXMpli6gjxLLZYp0G/78Zy1yZnKHVDZ+rL8lqH0/1uxb3Cr4J9iUAOKiWa/YHgFLuSLseJhiKE3a0z1RwWmzxxpRSapVRfal98pxH8BN4dp/XyBTDd1LZW+y6bySnGGz8UmDYLasBFFUTHZshe9dJz1Gsj3dRybtUCdqESs0XIc9UkaL1Ob7X0hWKeJhHw2MWdEbGmgLrYhWmlSvGri7EtfEKfUSXFT930gbkuXtpHBO6hp7M6+eHy5QGxh70ftkZRHn2SDNH3oJ81r6aTXxpAwAn2mkbg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Y8Ks1OFB7c/GtKmM/7R4tdQpdpKEvZgiF3taCNnCXN4=;
 b=cDAdv4zoba/DOKfgNQbOhtRG6JjpojSNV4dTJdk6u9UH2TUqneSaEdCNw7FAJ9yocCCLVGGC0wyhwM9UJPZYYEPnZo01DXUZbjaH4qQ4lIT2e54YXVY/vvLfHDuMtqPKFuipuQD/N02c9H9gzWqzAZKvZaoD+CalWhpKHvIK3dshnUCgsDD7zFdCfvVKxCM4TzjInm12dpO5qoHRsT62fH/BXO26T4B6XVIHdpO7hHk7hi/PYmPkucavCMq2BCJcSKhAEW4HcCtRMV7A0wJ3kPB4hJoOMQFZqgFkARESiBFjugaS5XOeXTYKWloNUyibYF5BpkeMwVwBTjYfECFvBQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.118.232) smtp.rcpttodomain=kernel.org smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Y8Ks1OFB7c/GtKmM/7R4tdQpdpKEvZgiF3taCNnCXN4=;
 b=DwZ1jbBVxu+r1c41zKCrV243E7pbXFIPYqNvnpfhwkfh2GlRSbjmXNQGML/RVS9oAjqTR1vaWKrkYRWUoatkbXo1AWzFMBZzUWQ96pQtBFJyovZ8L9SkmX0a5jHvgDspV+6nhaaoIeJfxeatG0dpXjCzQEHwLZ5tlY50qzmmJBauS6mAEbmf6GGM6/LGBTiNh9yn/MdAZzJNVKohw883Gvn3od6UdRR7y/1/kLJEn1ep63eZKa5mGcI3aAIEL8Yg/HYajmn2W8fbD+O0wpXs6+dQExLbhWyXNJvhP5w75D6EOUCHARwuXRS/BgoE2S9B/kukiUqSYux0Wo13J7Q1RA==
Received: from BN0PR04CA0197.namprd04.prod.outlook.com (2603:10b6:408:e9::22)
 by SJ2PR12MB8036.namprd12.prod.outlook.com (2603:10b6:a03:4c1::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8922.39; Mon, 21 Jul
 2025 19:12:53 +0000
Received: from BL6PEPF0001AB55.namprd02.prod.outlook.com
 (2603:10b6:408:e9:cafe::eb) by BN0PR04CA0197.outlook.office365.com
 (2603:10b6:408:e9::22) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8943.23 via Frontend Transport; Mon,
 21 Jul 2025 19:12:53 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.118.232)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.118.232 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.118.232; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.118.232) by
 BL6PEPF0001AB55.mail.protection.outlook.com (10.167.241.7) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8964.20 via Frontend Transport; Mon, 21 Jul 2025 19:12:53 +0000
Received: from drhqmail203.nvidia.com (10.126.190.182) by mail.nvidia.com
 (10.127.129.5) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.4; Mon, 21 Jul
 2025 12:12:44 -0700
Received: from drhqmail201.nvidia.com (10.126.190.180) by
 drhqmail203.nvidia.com (10.126.190.182) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14; Mon, 21 Jul 2025 12:12:44 -0700
Received: from Asurada-Nvidia.nvidia.com (10.127.8.13) by mail.nvidia.com
 (10.126.190.180) with Microsoft SMTP Server id 15.2.1544.14 via Frontend
 Transport; Mon, 21 Jul 2025 12:12:43 -0700
From: Nicolin Chen <nicolinc@nvidia.com>
To: <jgg@nvidia.com>, <will@kernel.org>
CC: <joro@8bytes.org>, <robin.murphy@arm.com>,
	<linux-arm-kernel@lists.infradead.org>, <iommu@lists.linux.dev>,
	<linux-kernel@vger.kernel.org>, <linux-tegra@vger.kernel.org>
Subject: [PATCH v2 1/2] iommu/arm-smmu-v3: Do not bother impl_ops if IOMMU_VIOMMU_TYPE_ARM_SMMUV3
Date: Mon, 21 Jul 2025 12:12:35 -0700
Message-ID: <20250721191236.1739951-2-nicolinc@nvidia.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250721191236.1739951-1-nicolinc@nvidia.com>
References: <20250721191236.1739951-1-nicolinc@nvidia.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-NV-OnPremToCloud: AnonymousSubmission
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL6PEPF0001AB55:EE_|SJ2PR12MB8036:EE_
X-MS-Office365-Filtering-Correlation-Id: 3dadd817-303a-47d6-c01f-08ddc88a97b4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|36860700013|376014|82310400026|7053199007;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?TJmIG/R6HSAZ4DiGMyz/ncow/zqBhbHnnqYYai2TNcyz8IALHU9utBzYQFQ2?=
 =?us-ascii?Q?ebnISpVw6xYBapMIXickxdf/g8+SGQAThMSoUIe3KslVhAJMjvB1LMKX9Ir4?=
 =?us-ascii?Q?YGqOMbgq6cN+nWJXObAROLrmXShPHtaGS2W5kw7ZO5BGBRe8dPqJ9xULwQnl?=
 =?us-ascii?Q?I8UEm8aLUVa0EADkENrgALFDM+d5ftQ4YQYY3od8N4NcxCZeJ3LzmNwlQkHW?=
 =?us-ascii?Q?PCboxY1BtFul+geDaoiDvbXCRb8Tx5rteuxxbNdJy9LWqR8ZQZ6rEC7ryBe2?=
 =?us-ascii?Q?5JtofpMdh6riE82odu7e8t/wW5BI/1KJ04OM7uOKwKslBe/B+AfQVZNCp322?=
 =?us-ascii?Q?xi5FtpIFzVE0C5TvpjN9Pbe52gQ8AauF6msVlPo+ly8YxC69S7/oht0Q3rpd?=
 =?us-ascii?Q?KkshmBhk5iHmzXzbPIRqR0C2e20tbaGgfibvkv+20AyyNf3o6cz9/VIaSJss?=
 =?us-ascii?Q?G1gA7TwUSF0B/ri2rVN/hQOxK10+6KkkLN/f8zRAZu+vDnaE9+g2826dcodI?=
 =?us-ascii?Q?y7a4poRjZBjZw/LElpAE/B01CVzqf8gq7rtl1SywUYbKKNzJIrdYcx34xAss?=
 =?us-ascii?Q?2NIOyajlMSBm6vSc1Q5ctvo/uV8J12m0V4282NsA+E9WXzrGYpQ1hzoYy7QM?=
 =?us-ascii?Q?lG7MJWZuG1fod87FfsN9jF79vfCtEne95kIejndq7wPLepFY6nDiiQ53YWM7?=
 =?us-ascii?Q?d9OeRWcUXIBgVGCWN+vChGI+eZtr718Ul5rTpbi+JSyNYDSXACjBzkVmcVQs?=
 =?us-ascii?Q?30uA3WoXP0n4hsVQjBlTouvr+3lcp1ITLIEl9DOZ25BrpprkRX1qOZNqdQ/m?=
 =?us-ascii?Q?av2v/ZF9ec0RJylk2BFz8sSd9r1KEqzngSEuZkws+/OFMyFKuGkjmPGVnN14?=
 =?us-ascii?Q?WnH48yDjAHb8PSlwRhBRh/qf+luvVDdh5w1CelEpkF1K+FRHGm413DkIS2ek?=
 =?us-ascii?Q?flLOMSd0bwXkTqery2Dg+/Js+qHe7ggty8nAr5XQ0LS8ZIADRk3mdlolLmFj?=
 =?us-ascii?Q?7OJmlHEhPKTtnqxn7GIwil1mfyfwOkBnPIkheTx8eurKd0Enth9woulEmiFT?=
 =?us-ascii?Q?34cVJDqbtFMUbETLtrSQHnsvLiSEysDTLytCD6ISXWaeX6GMi/4oBRhg7wBo?=
 =?us-ascii?Q?Y8ZLCRVS42EMcgR2czI3TG3n5E0qUmmBNtAZzQjx/fLqQXCV6hHjfhvCibfp?=
 =?us-ascii?Q?PQzzGqhqLTxc4MzWV0BZF/QJD7N0sqcDMsuqK8LaTuPvG3f/HJPraOxsTRP/?=
 =?us-ascii?Q?vExwS42R42uuKpSZhq1Y1EbhxFU9layWc41lBvBtq6VWgqm556z/QnH6f9CQ?=
 =?us-ascii?Q?HzV3NMdRXR48Ome1SVwOe5QUcG/ju7O6lHl9sD4QPqLvRJ2VLOXgOk8NIdUI?=
 =?us-ascii?Q?BoET4CHuPSAsa8w6SeJwZyxdEXFh4JXysmrotDa9fMETloUbymHau06kYqbx?=
 =?us-ascii?Q?r9LgvxaGXCGTya7d1hT3Frq6I1Exg/mc5kXmhBbn0jdWHCBBGZMLGz5Ctl4y?=
 =?us-ascii?Q?xvTzZ4/4+EbVwgGerPa96B53tiwfmxi8P94j?=
X-Forefront-Antispam-Report: CIP:216.228.118.232;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc7edge1.nvidia.com;CAT:NONE;SFS:(13230040)(1800799024)(36860700013)(376014)(82310400026)(7053199007);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Jul 2025 19:12:53.0972
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 3dadd817-303a-47d6-c01f-08ddc88a97b4
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.118.232];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: BL6PEPF0001AB55.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR12MB8036
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250721_121301_434412_FF64DC77 
X-CRM114-Status: GOOD (  15.57  )
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

When viommu type is IOMMU_VIOMMU_TYPE_ARM_SMMUV3, always return or init the
standard struct arm_vsmmu, instead of going through impl_ops that must have
its own viommu type than the standard IOMMU_VIOMMU_TYPE_ARM_SMMUV3.

Given that arm_vsmmu_init() is called after arm_smmu_get_viommu_size(), any
unsupported viommu->type must be a corruption. And it must be a driver bug
that its vsmmu_size and vsmmu_init ops aren't paired. Warn these two cases.

Suggested-by: Will Deacon <will@kernel.org>
Signed-off-by: Nicolin Chen <nicolinc@nvidia.com>
---
 .../arm/arm-smmu-v3/arm-smmu-v3-iommufd.c     | 24 ++++++++++---------
 drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c   | 14 +++++++++++
 2 files changed, 27 insertions(+), 11 deletions(-)

diff --git a/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3-iommufd.c b/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3-iommufd.c
index d9bea8f1f636..c034d6c5468f 100644
--- a/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3-iommufd.c
+++ b/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3-iommufd.c
@@ -420,14 +420,13 @@ size_t arm_smmu_get_viommu_size(struct device *dev,
 	    !(smmu->features & ARM_SMMU_FEAT_S2FWB))
 		return 0;
 
-	if (smmu->impl_ops && smmu->impl_ops->vsmmu_size &&
-	    viommu_type == smmu->impl_ops->vsmmu_type)
-		return smmu->impl_ops->vsmmu_size;
+	if (viommu_type == IOMMU_VIOMMU_TYPE_ARM_SMMUV3)
+		return VIOMMU_STRUCT_SIZE(struct arm_vsmmu, core);
 
-	if (viommu_type != IOMMU_VIOMMU_TYPE_ARM_SMMUV3)
+	if (!smmu->impl_ops || !smmu->impl_ops->vsmmu_size ||
+	    viommu_type != smmu->impl_ops->vsmmu_type)
 		return 0;
-
-	return VIOMMU_STRUCT_SIZE(struct arm_vsmmu, core);
+	return smmu->impl_ops->vsmmu_size;
 }
 
 int arm_vsmmu_init(struct iommufd_viommu *viommu,
@@ -447,12 +446,15 @@ int arm_vsmmu_init(struct iommufd_viommu *viommu,
 	/* FIXME Move VMID allocation from the S2 domain allocation to here */
 	vsmmu->vmid = s2_parent->s2_cfg.vmid;
 
-	if (smmu->impl_ops && smmu->impl_ops->vsmmu_init &&
-	    viommu->type == smmu->impl_ops->vsmmu_type)
-		return smmu->impl_ops->vsmmu_init(vsmmu, user_data);
+	if (viommu->type == IOMMU_VIOMMU_TYPE_ARM_SMMUV3) {
+		viommu->ops = &arm_vsmmu_ops;
+		return 0;
+	}
 
-	viommu->ops = &arm_vsmmu_ops;
-	return 0;
+	/* Unsupported type was rejected in arm_smmu_get_viommu_size() */
+	if (WARN_ON(viommu->type != smmu->impl_ops->vsmmu_type))
+		return -EOPNOTSUPP;
+	return smmu->impl_ops->vsmmu_init(vsmmu, user_data);
 }
 
 int arm_vmaster_report_event(struct arm_smmu_vmaster *vmaster, u64 *evt)
diff --git a/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c b/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c
index 181d07bc1a9d..dfe7f40fac35 100644
--- a/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c
+++ b/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c
@@ -4703,6 +4703,7 @@ static void arm_smmu_impl_remove(void *data)
 static struct arm_smmu_device *arm_smmu_impl_probe(struct arm_smmu_device *smmu)
 {
 	struct arm_smmu_device *new_smmu = ERR_PTR(-ENODEV);
+	const struct arm_smmu_impl_ops *ops;
 	int ret;
 
 	if (smmu->impl_dev && (smmu->options & ARM_SMMU_OPT_TEGRA241_CMDQV))
@@ -4713,11 +4714,24 @@ static struct arm_smmu_device *arm_smmu_impl_probe(struct arm_smmu_device *smmu)
 	if (IS_ERR(new_smmu))
 		return new_smmu;
 
+	ops = new_smmu->impl_ops;
+	if (ops) {
+		/* vsmmu_size and vsmmu_init ops must be paired */
+		if (WARN_ON(!ops->vsmmu_size ^ !ops->vsmmu_init)) {
+			ret = -EINVAL;
+			goto err_remove;
+		}
+	}
+
 	ret = devm_add_action_or_reset(new_smmu->dev, arm_smmu_impl_remove,
 				       new_smmu);
 	if (ret)
 		return ERR_PTR(ret);
 	return new_smmu;
+
+err_remove:
+	arm_smmu_impl_remove(new_smmu);
+	return ERR_PTR(ret);
 }
 
 static int arm_smmu_device_probe(struct platform_device *pdev)
-- 
2.43.0


