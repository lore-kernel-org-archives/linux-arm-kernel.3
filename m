Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0F949C7EE30
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 26 Jun 2025 20:33:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=qGQv4nX3+fVhV2cw+RUxw8zCOhYFEiT5kmRO1XEu5Xk=; b=d9QCaVXdj0O1aoCuGWYN1aRMMR
	w1iH671p72xlsj4a8SsnAvg6NMoo7ftESA+gxfW7slrFvQBBE2lcuzFlfKELDcN1UMmJrn+GeTXbu
	nGBtSb5qbxttZnvHG3CkoNXzrpgZicjNW6N+xGo4209zMCHDVtpT6MdFh0Xei8Q90+d7jC9MZ33C8
	8bL6YdJiZLRykt1CIr7KGW5uPXQ2eoap6t+sfRGgHOzvbsBviauCdmLUqfBl2Wggn4fBvhW+IV+mS
	vN6ywO8VUBUq58Vk+6A233NdZjMeRW3coAumBr+SMEWoENhcZt1uJBboabG6Cgua03UxC4t9EjEAn
	swzkgpNg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uUtHW-0000000CkNX-45Lk;
	Thu, 26 Jun 2025 20:33:14 +0000
Received: from mail-dm6nam12on20609.outbound.protection.outlook.com ([2a01:111:f403:2417::609] helo=NAM12-DM6-obe.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uUsOF-0000000CaZG-0j95
	for linux-arm-kernel@lists.infradead.org;
	Thu, 26 Jun 2025 19:36:09 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=F/pCZOAsN1gOsNQ4SPgk3DRSxS7g37W4JhttW3rBDwv19qMLZs6WUOJruDI/DG/YlmrFakqCMLX4YFYOSfLuFga6CoDXGYObiprFJUxpOTI3kGcPG+YW/pvW3EjZvOSiCs2w9PgiS04nbC9NFfCJRvYL4+gaiFsitjks6OUkvWXwZzBEoipzdjakTttTuMZjaji6pJUUSqCOKX6wV1frfh+CEuuhI8MVQXEIs4ivLSYpREwgKIGT9bBwBQHuMaNH+ANL/mlPwgiNA9BgoinaiEEEahITmXG+3qsqcaD0W+Is+VaD7rWCq6FDYewr1rL9ow6em/ZITz5TdjsO3h9P7w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qGQv4nX3+fVhV2cw+RUxw8zCOhYFEiT5kmRO1XEu5Xk=;
 b=Ndm1zx6DkyoN8YBItpB0AzkPGQElRwGm7o79FpEfpoMyFzt/D/IMgkyBFveaQ0kwVz6RV6yNxI4Q81SDj2VqQu+jv/Y6W9/hbiLVm5KQK3nbcPNgaLVmCOL3p0Ii1Iko2WuJ/XsrPVAafWShq01SrKlLpa08QRCT55H0CQ4+qP57FlbW5YlEC1LRrwW1ctsgI07moCVm0GTKLBfbPHmcBI4c8CbguyEkGkMCv0vzBqeJw0+R94GGiV3hUH3x1xZo2sHkOVNpjdniTK/ggl+Pi4gKr0lv/kuZUTZAMjPMdGgLOZpkUHqyfDS5vp5DwxiCYKAiFuZnDgqw8WBGjfvhAw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.118.232) smtp.rcpttodomain=amd.com smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qGQv4nX3+fVhV2cw+RUxw8zCOhYFEiT5kmRO1XEu5Xk=;
 b=GRl/RXRfAhmhTLJ6qgcPACpx6lQaMI3rv3nOwwwxrHV+ExkDiQ2hjxeSruJ0oK86asP/q1201h9vI7jPS5/AyaDzVPFRYtp2g8Y/ERtObrJFuhU8R/kyWHcP6yRXAmFHGyWmvIgq+1Op+YtzQ7gZkRnW4jRJ6ztLmStPB8T9E/PgOnRAbGHqX+UvDDPcxDDgcIpsbGUzmZnbp+HmgpYh4QnwbYvIpPIKnYy8sJknNIkgPo+s/wkzBj6ruWik8kBZmUNuCm4gtw8uPCx6/qYe6L32cLLelIaC8pnGI8hHOHQkKfBKYrquYckXdUNKuMbAq7Z3pxLcvpmBwFn4o6tXqg==
Received: from BYAPR03CA0004.namprd03.prod.outlook.com (2603:10b6:a02:a8::17)
 by BL1PR12MB5729.namprd12.prod.outlook.com (2603:10b6:208:384::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8857.25; Thu, 26 Jun
 2025 19:35:58 +0000
Received: from SJ5PEPF00000206.namprd05.prod.outlook.com
 (2603:10b6:a02:a8:cafe::80) by BYAPR03CA0004.outlook.office365.com
 (2603:10b6:a02:a8::17) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8880.21 via Frontend Transport; Thu,
 26 Jun 2025 19:35:58 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.118.232)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.118.232 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.118.232; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.118.232) by
 SJ5PEPF00000206.mail.protection.outlook.com (10.167.244.39) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8880.14 via Frontend Transport; Thu, 26 Jun 2025 19:35:58 +0000
Received: from drhqmail201.nvidia.com (10.126.190.180) by mail.nvidia.com
 (10.127.129.5) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.4; Thu, 26 Jun
 2025 12:35:38 -0700
Received: from drhqmail201.nvidia.com (10.126.190.180) by
 drhqmail201.nvidia.com (10.126.190.180) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14; Thu, 26 Jun 2025 12:35:38 -0700
Received: from Asurada-Nvidia.nvidia.com (10.127.8.13) by mail.nvidia.com
 (10.126.190.180) with Microsoft SMTP Server id 15.2.1544.14 via Frontend
 Transport; Thu, 26 Jun 2025 12:35:37 -0700
From: Nicolin Chen <nicolinc@nvidia.com>
To: <jgg@nvidia.com>, <kevin.tian@intel.com>, <corbet@lwn.net>,
	<will@kernel.org>
CC: <bagasdotme@gmail.com>, <robin.murphy@arm.com>, <joro@8bytes.org>,
	<thierry.reding@gmail.com>, <vdumpa@nvidia.com>, <jonathanh@nvidia.com>,
	<shuah@kernel.org>, <jsnitsel@redhat.com>, <nathan@kernel.org>,
	<peterz@infradead.org>, <yi.l.liu@intel.com>, <mshavit@google.com>,
	<praan@google.com>, <zhangzekun11@huawei.com>, <iommu@lists.linux.dev>,
	<linux-doc@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-tegra@vger.kernel.org>,
	<linux-kselftest@vger.kernel.org>, <patches@lists.linux.dev>,
	<mochs@nvidia.com>, <alok.a.tiwari@oracle.com>, <vasant.hegde@amd.com>,
	<dwmw2@infradead.org>, <baolu.lu@linux.intel.com>
Subject: [PATCH v7 22/28] iommu/arm-smmu-v3-iommufd: Add vsmmu_size/type and vsmmu_init impl ops
Date: Thu, 26 Jun 2025 12:34:53 -0700
Message-ID: <d7cb46694a628cde0482a3feaac1106d37ccbeba.1750966133.git.nicolinc@nvidia.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1750966133.git.nicolinc@nvidia.com>
References: <cover.1750966133.git.nicolinc@nvidia.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-NV-OnPremToCloud: AnonymousSubmission
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ5PEPF00000206:EE_|BL1PR12MB5729:EE_
X-MS-Office365-Filtering-Correlation-Id: 25d25698-861c-4230-e90b-08ddb4e8accb
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|7416014|36860700013|1800799024|82310400026;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?/CVUVz204v5L88Xj0m9JgAaf0XSGP+1u/bzNky0L4/Sk+a6EVw0/NXQtGAJX?=
 =?us-ascii?Q?bVNnlGqsDYRTxv7FCXEEYvzX/467aInucpYHsntqZQ17F/4IZFf0LDQai3z5?=
 =?us-ascii?Q?4xtT7WBk7H2Y6XBk5coIGv2iF2LOXQuzP2vZ7RxQbA6+ICtazd/goBVGTcIB?=
 =?us-ascii?Q?YqfL5kS0FTp+3HWMvzo2ktDMb0b8ZWt7XqtZqVnhX0CJH+pJT5spUKyYVtYk?=
 =?us-ascii?Q?91+4kFqXtEteqWBWNv4sjz6gD/rls8oDOgMf4oYujFIDAhWCi/VwEq60MEvA?=
 =?us-ascii?Q?AmkkXcfItzHLZzdT1d1lrP7jAXh43B/uMfbHwiBCIXKS/0mOEVc2bt/01gMY?=
 =?us-ascii?Q?90tG7HQ5xmI6ifKGBPDP1N/TtPeDRRpFD4QYfDAQ6N95hVPKQE1bfu7YxuT+?=
 =?us-ascii?Q?NOTLESYD4vRSJcfQ3+x6eituSZfXELrXWzOMu7BwvWZpUq7iRV6DweGX/gBi?=
 =?us-ascii?Q?dKCwaTgqpUwkS70ELSraPGOCr0WiyEhaJNZM3arlUgaz95rhsj01ixtbwEwY?=
 =?us-ascii?Q?bT8Dehb/wOlIFhu22gx8pcCQasFVwZitXoj/dO3JkKQE3nOaYUb015t19nh4?=
 =?us-ascii?Q?HChG5+s4CPCHHlGODPBa+R/p0rt3zPBgZts7qvbHrYz7l1aOeMYHa1k2on6b?=
 =?us-ascii?Q?1sZ9/RjqymhvTq88y5CIskUHE74i2YCkEx1YCUk5x3RkZfYNZhHeyjKqtJJ7?=
 =?us-ascii?Q?uyQIYOUuMp4tUGtXRK0hG+w/UUjiI4OE/WFGK/troz4jcLkXMLxVksyxaGtB?=
 =?us-ascii?Q?BGwf/7OkhLzg1pGIrE6H6S857BE0+wKg/oEpohE8kjdl1gonkc7OMMKgmmUw?=
 =?us-ascii?Q?X2XtWRjiNaH0xrvKIT33JURHn/zDDVmp8v02I5vjotPxzCbt94ny1Kz9ldvp?=
 =?us-ascii?Q?LtskMx1AF89VbMGIsllqwB5E/JB5m4XcDH9r0mt2Wl7NVH6NlYvuL1Rixq73?=
 =?us-ascii?Q?Gi/9Et2O/hm6LoMcv2uxwZVYlBOFn6AXxWUoChg7OtwFSwE81Qm5sqoVsF5f?=
 =?us-ascii?Q?PySLk3XisxhPw3MuiW5gsUG6XREW/Bk08oN1bBQkzOkx3Trd2N0tq0qeqY3B?=
 =?us-ascii?Q?Waq66hsFrba9AA/pt5TM9H4t9NsMkNA5R/aR3kKRyazl8imf83k/PigW8IwP?=
 =?us-ascii?Q?2P930pVqkJIaUa5sRqsUuI/uH/PpaVZZiSSpHnZ0FdAQmvoFnAWIrdWU1t/X?=
 =?us-ascii?Q?YhRDJi784BN0D2UmncGxIjtl+N4KpSjxgyG5TDBZTfSyyPa8oOvsU8MhGx12?=
 =?us-ascii?Q?eNgFfZljuW7/hKTAfVtSuyPIZdA4Mpuu5sAOlw4PZHuht+PmH71JhBgEjGOB?=
 =?us-ascii?Q?NOHULr4fwHkFmKcICuwycazfaU5CeK9qjorZGXjajjt2LjyLaDid9pHqYX7f?=
 =?us-ascii?Q?r7LR9aMIuQJZf0Bh28fVkVLDrXorPFfGs+4kVZSpERVohoEzuP0fl6oXWttz?=
 =?us-ascii?Q?+7sI8/ClvGTWSM4EiM+2tGb8S5PVXSIPAE16IjGONTQ9Jpks3BXJ3KX0eQxl?=
 =?us-ascii?Q?Xku+dtCF2bfkKJjm0uZZLbkv+TjhBhFU3iCR?=
X-Forefront-Antispam-Report: CIP:216.228.118.232;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc7edge1.nvidia.com;CAT:NONE;SFS:(13230040)(376014)(7416014)(36860700013)(1800799024)(82310400026);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Jun 2025 19:35:58.0248
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 25d25698-861c-4230-e90b-08ddb4e8accb
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.118.232];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: SJ5PEPF00000206.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL1PR12MB5729
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250626_123607_223162_2C2BCA8C 
X-CRM114-Status: GOOD (  12.30  )
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

An impl driver might want to allocate its own type of vIOMMU object or the
standard IOMMU_VIOMMU_TYPE_ARM_SMMUV3 by setting up its own SW/HW bits, as
the tegra241-cmdqv driver will add IOMMU_VIOMMU_TYPE_TEGRA241_CMDQV.

Add vsmmu_size/type and vsmmu_init to struct arm_smmu_impl_ops. Prioritize
them in arm_smmu_get_viommu_size() and arm_vsmmu_init().

Reviewed-by: Pranjal Shrivastava <praan@google.com>
Reviewed-by: Kevin Tian <kevin.tian@intel.com>
Reviewed-by: Jason Gunthorpe <jgg@nvidia.com>
Signed-off-by: Nicolin Chen <nicolinc@nvidia.com>
---
 drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.h         | 5 +++++
 drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3-iommufd.c | 8 ++++++++
 2 files changed, 13 insertions(+)

diff --git a/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.h b/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.h
index 7eed5c8c72dd..07589350b2a1 100644
--- a/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.h
+++ b/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.h
@@ -16,6 +16,7 @@
 #include <linux/sizes.h>
 
 struct arm_smmu_device;
+struct arm_vsmmu;
 
 /* MMIO registers */
 #define ARM_SMMU_IDR0			0x0
@@ -720,6 +721,10 @@ struct arm_smmu_impl_ops {
 	int (*init_structures)(struct arm_smmu_device *smmu);
 	struct arm_smmu_cmdq *(*get_secondary_cmdq)(
 		struct arm_smmu_device *smmu, struct arm_smmu_cmdq_ent *ent);
+	const size_t vsmmu_size;
+	const enum iommu_viommu_type vsmmu_type;
+	int (*vsmmu_init)(struct arm_vsmmu *vsmmu,
+			  const struct iommu_user_data *user_data);
 };
 
 /* An SMMUv3 instance */
diff --git a/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3-iommufd.c b/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3-iommufd.c
index eb9fe1f6311a..2ab1c6cf4aac 100644
--- a/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3-iommufd.c
+++ b/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3-iommufd.c
@@ -416,6 +416,10 @@ size_t arm_smmu_get_viommu_size(struct device *dev,
 	    !(smmu->features & ARM_SMMU_FEAT_S2FWB))
 		return 0;
 
+	if (smmu->impl_ops && smmu->impl_ops->vsmmu_size &&
+	    viommu_type == smmu->impl_ops->vsmmu_type)
+		return smmu->impl_ops->vsmmu_size;
+
 	if (viommu_type != IOMMU_VIOMMU_TYPE_ARM_SMMUV3)
 		return 0;
 
@@ -439,6 +443,10 @@ int arm_vsmmu_init(struct iommufd_viommu *viommu,
 	/* FIXME Move VMID allocation from the S2 domain allocation to here */
 	vsmmu->vmid = s2_parent->s2_cfg.vmid;
 
+	if (smmu->impl_ops && smmu->impl_ops->vsmmu_init &&
+	    viommu->type == smmu->impl_ops->vsmmu_type)
+		return smmu->impl_ops->vsmmu_init(vsmmu, user_data);
+
 	viommu->ops = &arm_vsmmu_ops;
 	return 0;
 }
-- 
2.43.0


