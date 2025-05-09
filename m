Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 04215C3ABC5
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  9 May 2025 03:09:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=TlasdfWJ/9il5nZNhLzt2GPwzhvFApe77XlGoI+Ybm4=; b=LDYCwor2KZdDAax6ma21NJrn9g
	86SP1MWVulvg4E0Cyn81zpXKMKcNrGnAzJCggdyakd9moNc6AT81UsM1JKXEx7kql7IIp81Cu/Noo
	JA9isVUfRjz9+NNeUsJin/Xn6+L2Bcw0B+AENKhHTGDfHm/Nr38BiwAobQJLYudW+XfXmUbXEWFZp
	Fd5uiiORqMHOBhWM0pj4iDwMCOAoTRTHleuRCTcb9CvRIP24xH57e8iuTQbkOVdT6MkUKDmqHKGuT
	mD8HcwxMB4KMfsqVq0oXtS8sMep4plTwpyPORHUr6l2eypwKYUl0Vezev0yhz5rvv99gP1toMLehz
	NJhjS36g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uDE7B-00000002KNe-2iKQ;
	Fri, 09 May 2025 03:09:33 +0000
Received: from mail-bn8nam12on2061a.outbound.protection.outlook.com ([2a01:111:f403:2418::61a] helo=NAM12-BN8-obe.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uDE1E-00000002IY3-2Ep9
	for linux-arm-kernel@lists.infradead.org;
	Fri, 09 May 2025 03:03:26 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=C+wYg6TUuuow1c+Epk+uet1JqOaHTRwY/s+JYbnxhmr9VO1YGzHOg7+SUvgrJPMAb6lhkkBkwp0no1f3FFwTd0kQ4Db8ZkFijlJVMwl80EEsAnTLnQ6NxiY2zjJGJ+D4Dsb4KZvRhXmdt+ezkyBNi8ADuydm56OfZxWcR8zeP76dcwISZyiHqbmUwFYkKC+yKYJHjWe/iYg8HLb8NBv7YjlfoCmCFRJh05SjpFbP+AXV2iFj5BkH31oZ7NmRQdnwbznaGdNe3l7Lg6l+KB/OAYk6e4z9igC9pdCnFZ+02QVBBrWTEu7mMhng3FYe4QFx8tmvhFtih18iJZoI0TiaIA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=TlasdfWJ/9il5nZNhLzt2GPwzhvFApe77XlGoI+Ybm4=;
 b=GPbP0J/IKjj1N7RebYrlsbIkDTyV7GSthUUHDHjt4fH7STOn1/J8h6X6vUlblS/DwzEgZbrNcV5Y0KMubfhNTUgxUnZBcuUJh8H4Puzd7gMoTjASRPqyIsycXcfWRZEgAQ7CmktbUfznMsoOjIPVqpZxcU2KCHBJxXnw7EPyrqRdU/SWIYGwA3iQF9YAkz8mwekPEsjBpgXaEFwv76+tRXtSsOxuudZr85lBDudvwiTC3bST2O3gODwLjZtpkoz50AnAdwh63hF2rAXyRzdPTyUwRlqyOtw1GeFKsUmG/UYPfsHnoATficjF255s4ICAgwNz1WGSLUMQDbZ8s6WxoQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.118.233) smtp.rcpttodomain=lists.linux.dev smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=TlasdfWJ/9il5nZNhLzt2GPwzhvFApe77XlGoI+Ybm4=;
 b=JwF5sezirfy0Fw3LRIhj9913CvkGNAhX/MhOudiwzxFotIz41rzFgRQZsanLYZRYrQaj0ydMAVoIwtyAnU1Pb+D9PRW4T2yxkM+xhSvx79kKowthxVb4Tyv7FnVqprcs8kcbKFY157iCFGgPVBBSMQpuZ0fERmqVOK9LPzTwsoazO6BArnR8Sv3jLfSScpjB6j5ghuExKN0JiZbWIP+svqfGvCwfNVKe3EAVlrzFHearTmo6prvwWK50APhWQ+D2LSz95Y1S2or5qZ9hmoZhypQMZa3vNZEu00vitKpf+8G+kVhZjbH3A9+MyAmIP1EhOz6JWjYqPpQRm1g1fc2F+Q==
Received: from PH7PR02CA0007.namprd02.prod.outlook.com (2603:10b6:510:33d::13)
 by SJ2PR12MB8883.namprd12.prod.outlook.com (2603:10b6:a03:538::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8699.19; Fri, 9 May
 2025 03:03:11 +0000
Received: from SN1PEPF000397B0.namprd05.prod.outlook.com
 (2603:10b6:510:33d:cafe::f4) by PH7PR02CA0007.outlook.office365.com
 (2603:10b6:510:33d::13) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8722.23 via Frontend Transport; Fri,
 9 May 2025 03:03:11 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.118.233)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.118.233 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.118.233; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.118.233) by
 SN1PEPF000397B0.mail.protection.outlook.com (10.167.248.54) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8722.18 via Frontend Transport; Fri, 9 May 2025 03:03:11 +0000
Received: from drhqmail202.nvidia.com (10.126.190.181) by mail.nvidia.com
 (10.127.129.6) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.4; Thu, 8 May 2025
 20:03:02 -0700
Received: from drhqmail203.nvidia.com (10.126.190.182) by
 drhqmail202.nvidia.com (10.126.190.181) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14; Thu, 8 May 2025 20:03:02 -0700
Received: from Asurada-Nvidia.nvidia.com (10.127.8.14) by mail.nvidia.com
 (10.126.190.182) with Microsoft SMTP Server id 15.2.1544.14 via Frontend
 Transport; Thu, 8 May 2025 20:03:00 -0700
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
	<mochs@nvidia.com>, <alok.a.tiwari@oracle.com>, <vasant.hegde@amd.com>
Subject: [PATCH v4 02/23] iommu: Pass in a driver-level user data structure to viommu_alloc op
Date: Thu, 8 May 2025 20:02:23 -0700
Message-ID: <488ee62b522dbb0eef8f02aa67386dd50ea2dc37.1746757630.git.nicolinc@nvidia.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1746757630.git.nicolinc@nvidia.com>
References: <cover.1746757630.git.nicolinc@nvidia.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-NV-OnPremToCloud: AnonymousSubmission
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN1PEPF000397B0:EE_|SJ2PR12MB8883:EE_
X-MS-Office365-Filtering-Correlation-Id: 729bf4b1-5318-4486-2336-08dd8ea6087d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|7416014|36860700013|1800799024|82310400026;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?0q2FkkdD/0/zVKTj1X+IBDG0+Si7kXfoi5RP/LERf6y3rrjXN6z/NaMOkdw5?=
 =?us-ascii?Q?OTuMb/Jhx3xwSlEjxP4eumiMjbBEhHqr9UmhOn9Tyo4W65AEeq710Ge1S2su?=
 =?us-ascii?Q?Lvt/1u6BjhraG0L7n8VLBd1ndxixgP/maMGtGlTAd7wffqhljSAfH7EYm19R?=
 =?us-ascii?Q?TQ3aPU0xQfVolnIdtrGhd1jjnNNk77z8a7+KnyzTXw4D0h8sU070XaeMb/KY?=
 =?us-ascii?Q?GIKjjspOigwbkQVZlhTcvOLdBCtoqts14YpqYMjnZQzRyNfBak4h/6607k2v?=
 =?us-ascii?Q?pXGJUXbofSZot41ZAOqlpx76iOVrGf7JQfQn4fM4qhyfEoMSQp8vUyO4FOvN?=
 =?us-ascii?Q?eNj05fWaxIkFNAritFuDA8ogIkAGoCvzxi3ilEjwu3JsVvWEBBp/RfKRoaYh?=
 =?us-ascii?Q?T5Tojt/a0q2OtB4pI43Sy12p++4KZVytMoY+OrN0m7nXy14AtnzgBaJy03wQ?=
 =?us-ascii?Q?JzVmBvEixQFbXDUityr4iDDXLBZMgzvKQdih7JU04IC7bksmIrA0Zu4yyEJ2?=
 =?us-ascii?Q?mLOa5UKkmATRClS1PHiWbJCek3MAzEl+FelyFehOGpp3T3wU1b41Jy8d6kmm?=
 =?us-ascii?Q?2Jwmu97tIssmTFcC2qwT+RyF7EUMgm9EG1N1x4dyS8zOkKRqF56C/r3TLnAy?=
 =?us-ascii?Q?pUqYgp9efRsRZ2xi00DJGTJ2y4TF78YiLmuYw95SKh3+bGOzKNlIU6zT9wG3?=
 =?us-ascii?Q?aHcZKaH6o4pIcCCMRHvJta7q3va6Ks9ln0WMudqbpU5y8L6+gtNhPfGFL3gl?=
 =?us-ascii?Q?IEL4LxDH36QN5ndskLlAB2eDnTvje0OBWsctGzhkMLHLemqgh/Usyjh/hPZ7?=
 =?us-ascii?Q?7RMutqY3LBtGRmgf5Q6+HALvk/8DgdcLdnlj+RmU54vsVKhfji+jI6gi11MC?=
 =?us-ascii?Q?Ecq/nmxvZgcmYngZeZCLr9mV8eLzJTSpVwX8g1r2XJZj+buwACeP84Cb1Zs9?=
 =?us-ascii?Q?11T5bZViOfVpYSSQ/h6szbh0XLjb7HYp/bbwSJsvlOACdnqNy8egadrcRWYs?=
 =?us-ascii?Q?X0ChOffLGBYnaa/qD79CtvXSggoldyTXg3mQfl2V5q/sQZHBkzsGC99H5HAb?=
 =?us-ascii?Q?Fp4o3Suj9nX9YaygDMayDMrg/rrL0T19Va6SBNwzI5wcob0oV18YPawcXfoX?=
 =?us-ascii?Q?pqNjpKiMUZLl3KbM4QYUiMkxEGA+nXOXF5NFBwjmGbvz+eeeNaPrlFaJbkYB?=
 =?us-ascii?Q?y3n3tgybyFAWBn6iKTVCbckM7eqg70q3rA7uXEPMlTd/PItJTyJgKtMg57LB?=
 =?us-ascii?Q?1lRUCdPm8WZC8YD4DA2hPbY+Zi/xas8zGVxumTiXmomRNSPyn70iLW2POS/E?=
 =?us-ascii?Q?23OsIb0HeG+yWYZepLQGyIVP6oZYYXsUlx3Ud4Ak2V71g2esp1oBtFz+RVwI?=
 =?us-ascii?Q?E4dZz68P3WGb36h866STHwCDel6eMx8fTV8PP9hwNJ8U9iM1pRoh9+VtMUlj?=
 =?us-ascii?Q?uKoOj8uoFbgO4ChAKwYANo3ZVS6jMtOa9bFFx128FpRIdTmSjb3WzXCAruHy?=
 =?us-ascii?Q?GzHixe+aZNkt0iO/cai1GCOvRnFK53AOmR12?=
X-Forefront-Antispam-Report: CIP:216.228.118.233;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc7edge2.nvidia.com;CAT:NONE;SFS:(13230040)(376014)(7416014)(36860700013)(1800799024)(82310400026);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 May 2025 03:03:11.3250
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 729bf4b1-5318-4486-2336-08dd8ea6087d
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.118.233];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: SN1PEPF000397B0.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR12MB8883
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250508_200324_575910_D99A6E9F 
X-CRM114-Status: GOOD (  16.06  )
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

The new type of vIOMMU for tegra241-cmdqv allows user space VM to use one
of its virtual command queue HW resources exclusively. This requires user
space to mmap the corresponding MMIO page from kernel space for direct HW
control.

To forward the mmap info (offset and length), iommufd should add a driver
specific data structure to the IOMMUFD_CMD_VIOMMU_ALLOC ioctl, for driver
to output the info during the allocation back to user space.

Similar to the existing ioctls and their IOMMU handlers, add a user_data
to viommu_alloc op to bridge between iommufd and drivers.

Reviewed-by: Jason Gunthorpe <jgg@nvidia.com>
Reviewed-by: Lu Baolu <baolu.lu@linux.intel.com>
Reviewed-by: Pranjal Shrivastava <praan@google.com>
Signed-off-by: Nicolin Chen <nicolinc@nvidia.com>
---
 drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.h         | 3 ++-
 include/linux/iommu.h                               | 3 ++-
 drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3-iommufd.c | 3 ++-
 drivers/iommu/iommufd/selftest.c                    | 8 ++++----
 drivers/iommu/iommufd/viommu.c                      | 2 +-
 5 files changed, 11 insertions(+), 8 deletions(-)

diff --git a/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.h b/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.h
index dd1ad56ce863..6b8f0d20dac3 100644
--- a/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.h
+++ b/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.h
@@ -1062,7 +1062,8 @@ void *arm_smmu_hw_info(struct device *dev, u32 *length, u32 *type);
 struct iommufd_viommu *arm_vsmmu_alloc(struct device *dev,
 				       struct iommu_domain *parent,
 				       struct iommufd_ctx *ictx,
-				       unsigned int viommu_type);
+				       unsigned int viommu_type,
+				       const struct iommu_user_data *user_data);
 int arm_smmu_attach_prepare_vmaster(struct arm_smmu_attach_state *state,
 				    struct arm_smmu_nested_domain *nested_domain);
 void arm_smmu_attach_commit_vmaster(struct arm_smmu_attach_state *state);
diff --git a/include/linux/iommu.h b/include/linux/iommu.h
index 3a8d35d41fda..ba7add27e9a0 100644
--- a/include/linux/iommu.h
+++ b/include/linux/iommu.h
@@ -662,7 +662,8 @@ struct iommu_ops {
 
 	struct iommufd_viommu *(*viommu_alloc)(
 		struct device *dev, struct iommu_domain *parent_domain,
-		struct iommufd_ctx *ictx, unsigned int viommu_type);
+		struct iommufd_ctx *ictx, unsigned int viommu_type,
+		const struct iommu_user_data *user_data);
 
 	const struct iommu_domain_ops *default_domain_ops;
 	unsigned long pgsize_bitmap;
diff --git a/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3-iommufd.c b/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3-iommufd.c
index e4fd8d522af8..66855cae775e 100644
--- a/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3-iommufd.c
+++ b/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3-iommufd.c
@@ -385,7 +385,8 @@ static const struct iommufd_viommu_ops arm_vsmmu_ops = {
 struct iommufd_viommu *arm_vsmmu_alloc(struct device *dev,
 				       struct iommu_domain *parent,
 				       struct iommufd_ctx *ictx,
-				       unsigned int viommu_type)
+				       unsigned int viommu_type,
+				       const struct iommu_user_data *user_data)
 {
 	struct arm_smmu_device *smmu =
 		iommu_get_iommu_dev(dev, struct arm_smmu_device, iommu);
diff --git a/drivers/iommu/iommufd/selftest.c b/drivers/iommu/iommufd/selftest.c
index 18d9a216eb30..8b8ba4fb91cd 100644
--- a/drivers/iommu/iommufd/selftest.c
+++ b/drivers/iommu/iommufd/selftest.c
@@ -733,10 +733,10 @@ static struct iommufd_viommu_ops mock_viommu_ops = {
 	.cache_invalidate = mock_viommu_cache_invalidate,
 };
 
-static struct iommufd_viommu *mock_viommu_alloc(struct device *dev,
-						struct iommu_domain *domain,
-						struct iommufd_ctx *ictx,
-						unsigned int viommu_type)
+static struct iommufd_viommu *
+mock_viommu_alloc(struct device *dev, struct iommu_domain *domain,
+		  struct iommufd_ctx *ictx, unsigned int viommu_type,
+		  const struct iommu_user_data *user_data)
 {
 	struct mock_iommu_device *mock_iommu =
 		iommu_get_iommu_dev(dev, struct mock_iommu_device, iommu_dev);
diff --git a/drivers/iommu/iommufd/viommu.c b/drivers/iommu/iommufd/viommu.c
index d4c7c5072e42..fffa57063c60 100644
--- a/drivers/iommu/iommufd/viommu.c
+++ b/drivers/iommu/iommufd/viommu.c
@@ -48,7 +48,7 @@ int iommufd_viommu_alloc_ioctl(struct iommufd_ucmd *ucmd)
 	}
 
 	viommu = ops->viommu_alloc(idev->dev, hwpt_paging->common.domain,
-				   ucmd->ictx, cmd->type);
+				   ucmd->ictx, cmd->type, NULL);
 	if (IS_ERR(viommu)) {
 		rc = PTR_ERR(viommu);
 		goto out_put_hwpt;
-- 
2.43.0


