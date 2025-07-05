Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3C406C8303D
	for <linux-arm-kernel@archiver.kernel.org>; Sat,  5 Jul 2025 01:23:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=42QceHfUK+Hql0l7FQCpE/QBMLE6u2ZK593dRrom3Ns=; b=XuiAguTvPMokE1FZcfcMUSAzd9
	uCGwaY/MUVdkysEwYiT2djOHg2v0/E7ctG/KXG51d6ZXHk85OKdu0Cs+298WN5Y/GrZi3m0WQJIBg
	9BpYfhPCQHJtojxWJOD8n97Seuoh1Wb9iB3kX9hRuGpIyI86BIMz2J9OEhEnPQJKjDxbthSFXtLUL
	zwze27IyDVzI2lUulWnNVrLLtuJI8taC5BB6zF7ZAWj6/6EXb7qJgVj8UwW9o+aroEJ35ygHtdlCi
	ZynKA1c4fcVm8LxnDrggHtaHLc8JtOpINC9S0au5OKs04MQb2LwuIDrEJzcqXoMI35ESI7d41djUE
	9yyzIW1Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uXrd8-0000000Fo8D-2ALY;
	Sat, 05 Jul 2025 01:23:50 +0000
Received: from mail-dm6nam11on2061e.outbound.protection.outlook.com ([2a01:111:f403:2415::61e] helo=NAM11-DM6-obe.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uXrTl-0000000FlLZ-44B1
	for linux-arm-kernel@lists.infradead.org;
	Sat, 05 Jul 2025 01:14:11 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=HwsAEV8mJ8i3bUgyzB2ySbMMdJnFidr1HnTM5BokXntkukCi085se6KjofednU4Bn46spNaYX8HyA0ABcQ1klWYHSdfoHKRVvsdbokJZIF/ThZNElLG8hsf4tJkAzdRENc8ZM1NztoKG10L7XtlaUbkROQL3vnpqFr+Y0Qj4OzZCx5eI3+/iyNnl+zJu8y9+bQRXC0C6Gt38vD7SXNm7rdQdiXgLD/tabldP0ws+JH3BB2Wf6w/58saXUxoMkocR4KRsdVZNtYQ7BQMpUndtS6EfGqCJDpxIT4eFkjjNB48Mkgsp9WUo95zv4WfvrGGKsmdLW0o27W4sK1bggQK14g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=42QceHfUK+Hql0l7FQCpE/QBMLE6u2ZK593dRrom3Ns=;
 b=sKQwkCdFya04g08EBZfWPryvdylxgLg1AN0qr2tUyU+g/6C+ExMKVV0IlaWn6qxyaMXkcPqTIH7kshHc5Tk2Lk2iHkz6GoB2Vg+sbdMgwVkCTl+4jg5FxgZI/evjuE5+HaggQaXk+hYN6uU0CeSnYq1RkhlHgVkF6OfG17PMQiSr/SBHRLQBf4Fc/zkR+K0UjZ+LmLxzhhpU29Fx4kwEssDeiuBXTZYbcf4Imfg5NpOI91GogsgpFj36RKDom/eJxeECZ0arHhyt4gjlU+OJ3j/IQpyww+kE48qIYMqvzakYZ8XZeBp0hK9RWDAwKQlXoHhZbGvtDcQkGWoIxmJXvQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.118.232) smtp.rcpttodomain=amd.com smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=42QceHfUK+Hql0l7FQCpE/QBMLE6u2ZK593dRrom3Ns=;
 b=uEKdekz5/ZEQy30TK6T6nkiueMpwlFwd26OGlQZXtttLZZ55zd9k2vj4eOY8dasPwpUdKwrIhssqFidFI9PuA3FU6l2Q9mY/iYx0rpLtH4auBYv9BTLUGjXtgmdC7q/TXMqpoipNwMHToyP949vsVrzQD//fssxWrYZ9MwLHmAEPg+eOxhVHEtw8ZVksMqmqA6joH/LJrh2sx05QT3HzyKYzJ5M+xDVCUrjQxViH/SHU6CxMdKyagBKOPEV05yY0DBpnCrNYeDs8knBiGDC5X3oVtgILzB9wT2JMbSiNlu1d4mBSZ2OVYIa1CtJYyi6tAm0HphWJF4wuDjUtQae9hA==
Received: from SJ0PR05CA0138.namprd05.prod.outlook.com (2603:10b6:a03:33d::23)
 by LV2PR12MB5941.namprd12.prod.outlook.com (2603:10b6:408:172::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8901.22; Sat, 5 Jul
 2025 01:14:04 +0000
Received: from CO1PEPF000042AE.namprd03.prod.outlook.com
 (2603:10b6:a03:33d:cafe::29) by SJ0PR05CA0138.outlook.office365.com
 (2603:10b6:a03:33d::23) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8922.11 via Frontend Transport; Sat,
 5 Jul 2025 01:14:04 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.118.232)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.118.232 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.118.232; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.118.232) by
 CO1PEPF000042AE.mail.protection.outlook.com (10.167.243.43) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8901.15 via Frontend Transport; Sat, 5 Jul 2025 01:14:03 +0000
Received: from drhqmail203.nvidia.com (10.126.190.182) by mail.nvidia.com
 (10.127.129.5) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.4; Fri, 4 Jul 2025
 18:14:02 -0700
Received: from drhqmail201.nvidia.com (10.126.190.180) by
 drhqmail203.nvidia.com (10.126.190.182) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14; Fri, 4 Jul 2025 18:14:01 -0700
Received: from Asurada-Nvidia.nvidia.com (10.127.8.12) by mail.nvidia.com
 (10.126.190.180) with Microsoft SMTP Server id 15.2.1544.14 via Frontend
 Transport; Fri, 4 Jul 2025 18:14:00 -0700
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
Subject: [PATCH v8 04/29] iommu: Use enum iommu_hw_info_type for type in hw_info op
Date: Fri, 4 Jul 2025 18:13:20 -0700
Message-ID: <64a4c22755d828a80a80d30f6903f4003b62ba5c.1751677708.git.nicolinc@nvidia.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1751677708.git.nicolinc@nvidia.com>
References: <cover.1751677708.git.nicolinc@nvidia.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-NV-OnPremToCloud: AnonymousSubmission
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PEPF000042AE:EE_|LV2PR12MB5941:EE_
X-MS-Office365-Filtering-Correlation-Id: 0a4993ed-e33c-4dbf-064f-08ddbb613b67
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|82310400026|36860700013|376014|7416014|1800799024;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?00RmCA27b+fQSZ0dr6dA1bRZo7/IhaXBGMAr5zdJM2TxUbz0rnMQJwUfalQ4?=
 =?us-ascii?Q?8GzS6+dYNE1uZCjwL0BBRYEnAO2yPcnIZRUpntpP2rEYPVFbw3t8gxHpx/Xd?=
 =?us-ascii?Q?94frdM7tRFbu2b+rRumHxyO+J0WszliiHGNROrX82oZbUHJJpvY5+yA5d9j9?=
 =?us-ascii?Q?tq7LygM8l93BQ9alvlAQ7ufZYtnckHHCWJ52Eeq8QnBmR9gl6zPM548UntZp?=
 =?us-ascii?Q?D55CPHOIThmmYaqqbasl6qPBpueVWy4cI7T0+06toPHsB16H6GfUhpfe4xGA?=
 =?us-ascii?Q?s2cLPqVqSo0KjrcREiVo4pWCIAdd6f1SvST+TLhlriJNkBwoGKz+G69D4Y1A?=
 =?us-ascii?Q?hSMj0rEZpy0OomcG/gcx+BeOAXGt/WEPkRlx9kt4sMrp2sOZJj5HZJPc4QY/?=
 =?us-ascii?Q?qGMq9nMzl/kGht9V+JRxpG+788m/y/CC5H31UMhrDZ9LNpvZ287hPmdlr7XG?=
 =?us-ascii?Q?XuZtWWgsRM2RbLINtmpb3vY/4soZ6A2lUZs2hfKnvPV7W4PMJQx4Oi9iRAsK?=
 =?us-ascii?Q?p3H0CsO7OcRoxxvyBkvR+hnDsN5YvFQvKcSc5jow93PvRA6Z2uvm/tkiuBjg?=
 =?us-ascii?Q?4Qj2uvq30FmGPxYGCzLvl9qOvdiSmYUk9rpFb1nwAw9yyfs8try/iaMEgw7I?=
 =?us-ascii?Q?qPlSrHNMcTz8TlTjVkCI1SVx+c9jzr/etrVhywOpmTXLhop6rI6UeyU4j77p?=
 =?us-ascii?Q?LcL0Vig1h0+Z32xfsrT0XK5QHRnm67rGx2dQ6QmP6UMw/9V3na/5J6FloWLM?=
 =?us-ascii?Q?S/Ib4i7caHFKyhyaTF7gPgHlplTuJSqYbU4o0cFaf1IXdeWkMCFuRzKZkwyR?=
 =?us-ascii?Q?lWJRnj3d+GI/e4Xz3XrwLyGA38IjlXm/H67YDHCcVxioD0E1HduCYLSNkALH?=
 =?us-ascii?Q?3suF7geDEu8Pms3rD1l05+O0iKjGECzKTYCZ5aAkkxqbW+S37Fiax9T5RUES?=
 =?us-ascii?Q?NT8GGSuHxaMw6YwcDgx+enBONX+KJ0Rko/eXPjSnNZ49pEs8yAKpXe0pHxDG?=
 =?us-ascii?Q?VIaeeJc2Q2sJXmIoDCoNP3UPHlwIZIfBdRVosyPbfAv7pTkKUjlrWS2XzXbV?=
 =?us-ascii?Q?U/Xm0siDKPUkve8BJZvLMB/A4ijPEeRvVJjVIfLsyOB0c3JSOwo/Z3Vl4GNH?=
 =?us-ascii?Q?723ODaGDwLgUlFJUoOhhj2sngTfgdCGXz319tMS0rB5asKFiE1sTfeWocHHo?=
 =?us-ascii?Q?Sed23bcrEmoOL6stWjmkj1Tlp13OQxsjvWJKulPjhJRPHC86pabV38eVuyZk?=
 =?us-ascii?Q?YwR46N0UfujFxcAnuxift+cH+IOtHG1OSt7st5r46EdpEv64IjLwnci9ui5M?=
 =?us-ascii?Q?V3EctNoWlLclZX48nSRQeWuZ1pp9w9ynGT7ScY3yXA73eGS3xm6elhgds9om?=
 =?us-ascii?Q?i6G1Zt+fm7sxpgJ2tQoA1MRNf2XITlN/RA0Xz+ktTAP5aUVI78XVbF6mP2Kc?=
 =?us-ascii?Q?nVXcfelpBnBL/MCqciX0BvIZAVy0BwIync/WofCwA4uCjKfc3WKY7rssMGhm?=
 =?us-ascii?Q?WL/9Zsd9qaZkL7HeYn0BPg+/KQpLOfJwEz9+?=
X-Forefront-Antispam-Report: CIP:216.228.118.232;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc7edge1.nvidia.com;CAT:NONE;SFS:(13230040)(82310400026)(36860700013)(376014)(7416014)(1800799024);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Jul 2025 01:14:03.8396
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 0a4993ed-e33c-4dbf-064f-08ddbb613b67
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.118.232];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: CO1PEPF000042AE.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV2PR12MB5941
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250704_181410_033786_C609E639 
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

Replace u32 to make it clear. No functional changes.

Also simplify the kdoc since the type itself is clear enough.

Reviewed-by: Pranjal Shrivastava <praan@google.com>
Reviewed-by: Kevin Tian <kevin.tian@intel.com>
Signed-off-by: Nicolin Chen <nicolinc@nvidia.com>
---
 include/linux/iommu.h                               | 6 +++---
 drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3-iommufd.c | 3 ++-
 drivers/iommu/intel/iommu.c                         | 3 ++-
 drivers/iommu/iommufd/selftest.c                    | 3 ++-
 4 files changed, 9 insertions(+), 6 deletions(-)

diff --git a/include/linux/iommu.h b/include/linux/iommu.h
index 04548b18df28..b87c2841e6bc 100644
--- a/include/linux/iommu.h
+++ b/include/linux/iommu.h
@@ -563,8 +563,7 @@ iommu_copy_struct_from_full_user_array(void *kdst, size_t kdst_entry_size,
  * @capable: check capability
  * @hw_info: report iommu hardware information. The data buffer returned by this
  *           op is allocated in the iommu driver and freed by the caller after
- *           use. The information type is one of enum iommu_hw_info_type defined
- *           in include/uapi/linux/iommufd.h.
+ *           use.
  * @domain_alloc: Do not use in new drivers
  * @domain_alloc_identity: allocate an IDENTITY domain. Drivers should prefer to
  *                         use identity_domain instead. This should only be used
@@ -623,7 +622,8 @@ iommu_copy_struct_from_full_user_array(void *kdst, size_t kdst_entry_size,
  */
 struct iommu_ops {
 	bool (*capable)(struct device *dev, enum iommu_cap);
-	void *(*hw_info)(struct device *dev, u32 *length, u32 *type);
+	void *(*hw_info)(struct device *dev, u32 *length,
+			 enum iommu_hw_info_type *type);
 
 	/* Domain allocation and freeing by the iommu driver */
 #if IS_ENABLED(CONFIG_FSL_PAMU)
diff --git a/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3-iommufd.c b/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3-iommufd.c
index 9f59c95a254c..69bbe39e28de 100644
--- a/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3-iommufd.c
+++ b/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3-iommufd.c
@@ -7,7 +7,8 @@
 
 #include "arm-smmu-v3.h"
 
-void *arm_smmu_hw_info(struct device *dev, u32 *length, u32 *type)
+void *arm_smmu_hw_info(struct device *dev, u32 *length,
+		       enum iommu_hw_info_type *type)
 {
 	struct arm_smmu_master *master = dev_iommu_priv_get(dev);
 	struct iommu_hw_info_arm_smmuv3 *info;
diff --git a/drivers/iommu/intel/iommu.c b/drivers/iommu/intel/iommu.c
index 7aa3932251b2..850f1a6f548c 100644
--- a/drivers/iommu/intel/iommu.c
+++ b/drivers/iommu/intel/iommu.c
@@ -4091,7 +4091,8 @@ static int intel_iommu_set_dev_pasid(struct iommu_domain *domain,
 	return ret;
 }
 
-static void *intel_iommu_hw_info(struct device *dev, u32 *length, u32 *type)
+static void *intel_iommu_hw_info(struct device *dev, u32 *length,
+				 enum iommu_hw_info_type *type)
 {
 	struct device_domain_info *info = dev_iommu_priv_get(dev);
 	struct intel_iommu *iommu = info->iommu;
diff --git a/drivers/iommu/iommufd/selftest.c b/drivers/iommu/iommufd/selftest.c
index 74ca955a766e..7a9abe3f47d5 100644
--- a/drivers/iommu/iommufd/selftest.c
+++ b/drivers/iommu/iommufd/selftest.c
@@ -287,7 +287,8 @@ static struct iommu_domain mock_blocking_domain = {
 	.ops = &mock_blocking_ops,
 };
 
-static void *mock_domain_hw_info(struct device *dev, u32 *length, u32 *type)
+static void *mock_domain_hw_info(struct device *dev, u32 *length,
+				 enum iommu_hw_info_type *type)
 {
 	struct iommu_test_hw_info *info;
 
-- 
2.43.0


