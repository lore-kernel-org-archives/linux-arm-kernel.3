Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7E595C7EE30
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 26 Jun 2025 20:10:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=swctkMnu7meFA58Tvh8OwfnNkgKz93zfiocbfO7V7ag=; b=MrUw04d+myswtsOUkiL2JKOyox
	ku+38J5y7GqjMLVKR3aj8SrEH6LMXMU2If/SdV+XCY1yGe8Ugut5opmgbgl4aGi8f3NqnJtKR6F7y
	7C5WlxiS40VUSsSPrRmArYAkLhD9NjLbwXMrkgPwFw2kMyhFXzyZ6yfc5CfPxgDbdLVEQlVZvVVef
	VyN8dxx93UmDZGGXaANWziUksoGTS92DH42vyIfYp1vrglxdW+hfmzfWzPrTy5+Tx3285r4nF0r0X
	cswK4uFKQ8xGKENKXdmAWjcawtONbFmgrYqT9jC/RVecATEdyJn81gZvL+q2uKBI1I+iufsp6RfLO
	J2xamYMQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uUsvC-0000000ChuL-1EmU;
	Thu, 26 Jun 2025 20:10:10 +0000
Received: from mail-bn7nam10on2062f.outbound.protection.outlook.com ([2a01:111:f403:2009::62f] helo=NAM10-BN7-obe.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uUsNy-0000000CaOT-3CdC
	for linux-arm-kernel@lists.infradead.org;
	Thu, 26 Jun 2025 19:35:51 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=gyG6XKz1e0Z0FK3560bgB43oD1ou+aCty3txnQiymU0ihxAKdbOUkN7q1sWrF/pPRlgtKHxD/v7MtpQApt3MkzkWDpdr88QFxNuRZFnrWy9X/suzbXpH+aKTagNUBE39Uoq9wfO+v4UhHIp7XaCwRUA3W2hIdjKAGbVfm7ynAPHY+iFOpbu3+LFpFc6Hp+bERaQBEJqBpN8X6eu4OTCR1oTnxCw1J60IetjbwZS6VKbdnbg6K4soVHalxTSxjxIXGNim1UMnqTf32tpqVJiqROzw64M4nD6GiMxTbAHL4aCDcC1ypOp/9As3AF8W3BWOnZ3fN6Ft4TS68t5oYmUJpA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=swctkMnu7meFA58Tvh8OwfnNkgKz93zfiocbfO7V7ag=;
 b=tlOq8zNKup+BOMCssrjbRjPC8s8O6KVbc9YpPhEbnEQBgsQP8Cb8rTftECn07TqurvGqb1u77OJ3CyG8grZQNHeMU+8ATURYLHHqR/vZ5Q9/UH7r2GaQPk+iGP5iw/uisTvT5uvodxfGcdSbZZz/0P5Bup+6M/m5VkL7FNPIw1E7BJzJT5LfPWNXnmamyfGROcUAi/lxzrfevSrgXYxz//JZ4r5go9Ts7cgbqTbpd3QD/ZRLR+G5Sqrwx9oOD+WyAKdWKET0336RVaWX0QwrgyeiJRJVCipnVdJBFqo/2HjaHz5hvKKWqE1sXQonLsaFVk2F7CFWf3CquEj9emVJ8A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.118.233) smtp.rcpttodomain=amd.com smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=swctkMnu7meFA58Tvh8OwfnNkgKz93zfiocbfO7V7ag=;
 b=pkccsAqoSo2dGscdpDLPC32T8p/Uc28ELG7nPRnatzNePUyAYjc2EpQKE4uk1PYy2/g80ciRrWlCOrPm+Mqc/mACVsmrQLxC0TYsCSU7noeTc16JT5HeOye4qEchT4rVeHiIPgY0jm/nF7R1wvnEj9f42Tqt8lhPjnS4zndEkYeU78GRsZuce/zT+R2DRMbOGJOS8LEivUaqj7FJ0vJ8j+ktC4V/soz7qWZaf6l+dTARRnGybZu4SDKSJj6odq9AS5QkzI17sVsC1a2m4WxFvp+HJOOnbaXlKbQCcK/ILqMj5S9XIz9xSHCgzWQFZn8yjF56Yqus0fNCsJgNPPYe3Q==
Received: from BN0PR02CA0040.namprd02.prod.outlook.com (2603:10b6:408:e5::15)
 by BY5PR12MB4321.namprd12.prod.outlook.com (2603:10b6:a03:204::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8857.29; Thu, 26 Jun
 2025 19:35:41 +0000
Received: from MN1PEPF0000ECDB.namprd02.prod.outlook.com
 (2603:10b6:408:e5:cafe::7e) by BN0PR02CA0040.outlook.office365.com
 (2603:10b6:408:e5::15) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8880.23 via Frontend Transport; Thu,
 26 Jun 2025 19:35:40 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.118.233)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.118.233 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.118.233; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.118.233) by
 MN1PEPF0000ECDB.mail.protection.outlook.com (10.167.242.139) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8880.14 via Frontend Transport; Thu, 26 Jun 2025 19:35:40 +0000
Received: from drhqmail202.nvidia.com (10.126.190.181) by mail.nvidia.com
 (10.127.129.6) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.4; Thu, 26 Jun
 2025 12:35:26 -0700
Received: from drhqmail201.nvidia.com (10.126.190.180) by
 drhqmail202.nvidia.com (10.126.190.181) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14; Thu, 26 Jun 2025 12:35:26 -0700
Received: from Asurada-Nvidia.nvidia.com (10.127.8.13) by mail.nvidia.com
 (10.126.190.180) with Microsoft SMTP Server id 15.2.1544.14 via Frontend
 Transport; Thu, 26 Jun 2025 12:35:24 -0700
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
Subject: [PATCH v7 14/28] iommufd/driver: Add iommufd_hw_queue_depend/undepend() helpers
Date: Thu, 26 Jun 2025 12:34:45 -0700
Message-ID: <69bdc5e483a0d736703960ae85bd7712a2f6c099.1750966133.git.nicolinc@nvidia.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1750966133.git.nicolinc@nvidia.com>
References: <cover.1750966133.git.nicolinc@nvidia.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-NV-OnPremToCloud: AnonymousSubmission
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN1PEPF0000ECDB:EE_|BY5PR12MB4321:EE_
X-MS-Office365-Filtering-Correlation-Id: a5b5858b-f498-4be9-473f-08ddb4e8a285
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|7416014|376014|36860700013|82310400026;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?k2/UGUbvTAznr5017BdKJ/t6NzNe93lWoB9At1aYneYiicWYa0iyG/70EMLj?=
 =?us-ascii?Q?qFOk6TjjVlEOZ4QEewoVk+JI1zdSNASPBS+isIi7XsxSvDqYxKwFELqJEHnb?=
 =?us-ascii?Q?/pqE9jj3o0jrF1K/+j22ehy38s60t1HW31q718MQO348lKMa5/V9aUIIdGTO?=
 =?us-ascii?Q?zOwDGboy0jiiIXJ+okFjt7yMNn9txLUGLa3pr58p/FOvP8dLrSrlVhmdnXIn?=
 =?us-ascii?Q?dKZBQnK5IcBTWX0Uqps/Uki1aMGw2lMI5wLvmezbO2kZH7IGKkT5+Vgq7V7T?=
 =?us-ascii?Q?YUgjD6eyQt5Zy3m3jZmMQEZXLaAJtCGIk3yYKLkRggdkDtZ6obaWUKce63xT?=
 =?us-ascii?Q?gWNjsjMkJfcia81GecieobvtLKysCc4Wrpz3vUllVwZy67HbcUbHeFeNhGD1?=
 =?us-ascii?Q?9SobMsCbrwrwQysEvizo4/EOGgYa/qmrzuyNRlKf94R1bINKIlhpmUerTjPO?=
 =?us-ascii?Q?ks1GMyq86cDppYtg5wHFjV7EUM8SESzGLvsOTV5PtWczFydy5msqI6Wu5n58?=
 =?us-ascii?Q?UI/eMeueQtdM/G0gNWWHM0Jm+OUEvS4lLcKRvWw112e6JgwtCLzzWrK4A97d?=
 =?us-ascii?Q?GzgBxF4wqkOjtbIayfJ11q5geo53jjOfHzlmFFProhBeXjIsNdDh+e5T6v2i?=
 =?us-ascii?Q?mrT9j7KvTqsgMaOis9Nft+tE6UrBOiSs1211w3mlyiJaN/32u23332GlHk6D?=
 =?us-ascii?Q?nvQ/EaRWXm7hB4ZkfuQScGOBsTzAnbz1htwAej5tfG2tqB2U8sepLXZ5VRzI?=
 =?us-ascii?Q?s6jSpYIKXCqZBWxAUcbnSmYOl0Ct0adtwC4ugPrSxDMrkbjC8hO6azAWOXg/?=
 =?us-ascii?Q?leVOkwiZes+SdSG+ANraKGaWj6wnK8hYSJFRVCBcWtHhD8JaqDtkH7UMkv7R?=
 =?us-ascii?Q?a7W5/TFGCSFUTzrplir6db5cScdg9LMh4oeRvVl2E3tTUCGUUOvsA+IKHjRW?=
 =?us-ascii?Q?HQqJDzphnJAfviRyVz58WVVOajTYx8acNKR7VSE58ayDdby77MtVDSP8pd+s?=
 =?us-ascii?Q?qfIdHeSneh2FVW9VVjGdWaLnM6LxeqC2TzxetVytD51VGcWN1d2mige4CHbA?=
 =?us-ascii?Q?FxqraoQBtaoCH5WsRM4rvMErYcmwXoENlZ1xs/qxx5EGw4iYE+dpGtnTCJEg?=
 =?us-ascii?Q?UOkjm1PR5NmhK7zfipt1ydaiGUp1W5MPAnL5N2bKSJ6/42W1pHiGF+1Jd/i2?=
 =?us-ascii?Q?GRL+Ec23x5YPkvESros3r5G+t1EGjFyT1ALWndwSm7UF75zG5F55pl97HD3b?=
 =?us-ascii?Q?Wi3JsMWKSIdW5mV00YRfyZNpGCsOECsNC9YbGNvYPiv3cPUgJev3aGypKgfg?=
 =?us-ascii?Q?XMKA11QGOOZx2x4UzlZQ55NG+DKvdj5ho/GJBSXVsefzzoVFJZhfEsCs4uqw?=
 =?us-ascii?Q?O50hzd3MlTnnVAe9UkuBM4lp0QkbCKHPNjJXqTGQb7ei8s/ByinFHcOcuYKk?=
 =?us-ascii?Q?F1qZ4h0VkZPO26KieosF0cemXMBoMgu7n0ibW87Ewys4kqEEsuopKCcTMcW9?=
 =?us-ascii?Q?VKEq5+0e+t60JMq7+ZvjyN26TlJAyBrAdwoj?=
X-Forefront-Antispam-Report: CIP:216.228.118.233;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc7edge2.nvidia.com;CAT:NONE;SFS:(13230040)(1800799024)(7416014)(376014)(36860700013)(82310400026);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Jun 2025 19:35:40.6715
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: a5b5858b-f498-4be9-473f-08ddb4e8a285
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.118.233];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: MN1PEPF0000ECDB.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR12MB4321
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250626_123550_800391_0D64F99C 
X-CRM114-Status: GOOD (  18.20  )
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

NVIDIA Virtual Command Queue is one of the iommufd users exposing vIOMMU
features to user space VMs. Its hardware has a strict rule when mapping
and unmapping multiple global CMDQVs to/from a VM-owned VINTF, requiring
mappings in ascending order and unmappings in descending order.

The tegra241-cmdqv driver can apply the rule for a mapping in the LVCMDQ
allocation handler. However, it can't do the same for an unmapping since
user space could start random destroy calls breaking the rule, while the
destroy op in the driver level can't reject a destroy call as it returns
void.

Add iommufd_hw_queue_depend/undepend for-driver helpers, allowing LVCMDQ
allocator to refcount_inc() a sibling LVCMDQ object and LVCMDQ destroyer
to refcount_dec(), so that iommufd core will help block a random destroy
call that breaks the rule.

This is a bit of compromise, because a driver might end up with abusing
the API that deadlocks the objects. So restrict the API to a dependency
between two driver-allocated objects of the same type, as iommufd would
unlikely build any core-level dependency in this case. And encourage to
use the macro version that currently supports the HW QUEUE objects only.

Reviewed-by: Lu Baolu <baolu.lu@linux.intel.com>
Reviewed-by: Pranjal Shrivastava <praan@google.com>
Reviewed-by: Jason Gunthorpe <jgg@nvidia.com>
Signed-off-by: Nicolin Chen <nicolinc@nvidia.com>
---
 include/linux/iommufd.h        | 44 ++++++++++++++++++++++++++++++++++
 drivers/iommu/iommufd/driver.c | 28 ++++++++++++++++++++++
 2 files changed, 72 insertions(+)

diff --git a/include/linux/iommufd.h b/include/linux/iommufd.h
index c98edfce5081..563bdd30a8bb 100644
--- a/include/linux/iommufd.h
+++ b/include/linux/iommufd.h
@@ -251,6 +251,10 @@ static inline int iommufd_vfio_compat_set_no_iommu(struct iommufd_ctx *ictx)
 #endif /* CONFIG_IOMMUFD */
 
 #if IS_ENABLED(CONFIG_IOMMUFD_DRIVER_CORE)
+int _iommufd_object_depend(struct iommufd_object *obj_dependent,
+			   struct iommufd_object *obj_depended);
+void _iommufd_object_undepend(struct iommufd_object *obj_dependent,
+			      struct iommufd_object *obj_depended);
 struct device *iommufd_viommu_find_dev(struct iommufd_viommu *viommu,
 				       unsigned long vdev_id);
 int iommufd_viommu_get_vdev_id(struct iommufd_viommu *viommu,
@@ -259,6 +263,18 @@ int iommufd_viommu_report_event(struct iommufd_viommu *viommu,
 				enum iommu_veventq_type type, void *event_data,
 				size_t data_len);
 #else /* !CONFIG_IOMMUFD_DRIVER_CORE */
+static inline int _iommufd_object_depend(struct iommufd_object *obj_dependent,
+					 struct iommufd_object *obj_depended)
+{
+	return -EOPNOTSUPP;
+}
+
+static inline void
+_iommufd_object_undepend(struct iommufd_object *obj_dependent,
+			 struct iommufd_object *obj_depended)
+{
+}
+
 static inline struct device *
 iommufd_viommu_find_dev(struct iommufd_viommu *viommu, unsigned long vdev_id)
 {
@@ -298,4 +314,32 @@ static inline int iommufd_viommu_report_event(struct iommufd_viommu *viommu,
 	 BUILD_BUG_ON_ZERO(!__same_type(struct iommufd_hw_queue,               \
 					((drv_struct *)NULL)->member)))
 
+/*
+ * Helpers for IOMMU driver to build/destroy a dependency between two sibling
+ * structures created by one of the allocators above
+ */
+#define iommufd_hw_queue_depend(dependent, depended, member)                   \
+	({                                                                     \
+		int ret = -EINVAL;                                             \
+									       \
+		static_assert(__same_type(struct iommufd_hw_queue,             \
+					  dependent->member));                 \
+		static_assert(__same_type(typeof(*dependent), *depended));     \
+		if (!WARN_ON_ONCE(dependent->member.viommu !=                  \
+				  depended->member.viommu))                    \
+			ret = _iommufd_object_depend(&dependent->member.obj,   \
+						     &depended->member.obj);   \
+		ret;                                                           \
+	})
+
+#define iommufd_hw_queue_undepend(dependent, depended, member)                 \
+	({                                                                     \
+		static_assert(__same_type(struct iommufd_hw_queue,             \
+					  dependent->member));                 \
+		static_assert(__same_type(typeof(*dependent), *depended));     \
+		WARN_ON_ONCE(dependent->member.viommu !=                       \
+			     depended->member.viommu);                         \
+		_iommufd_object_undepend(&dependent->member.obj,               \
+					 &depended->member.obj);               \
+	})
 #endif
diff --git a/drivers/iommu/iommufd/driver.c b/drivers/iommu/iommufd/driver.c
index 887719016804..e578ef32d30c 100644
--- a/drivers/iommu/iommufd/driver.c
+++ b/drivers/iommu/iommufd/driver.c
@@ -3,6 +3,34 @@
  */
 #include "iommufd_private.h"
 
+/* Driver should use a per-structure helper in include/linux/iommufd.h */
+int _iommufd_object_depend(struct iommufd_object *obj_dependent,
+			   struct iommufd_object *obj_depended)
+{
+	/* Reject self dependency that dead locks */
+	if (obj_dependent == obj_depended)
+		return -EINVAL;
+	/* Only support dependency between two objects of the same type */
+	if (obj_dependent->type != obj_depended->type)
+		return -EINVAL;
+
+	refcount_inc(&obj_depended->users);
+	return 0;
+}
+EXPORT_SYMBOL_NS_GPL(_iommufd_object_depend, "IOMMUFD");
+
+/* Driver should use a per-structure helper in include/linux/iommufd.h */
+void _iommufd_object_undepend(struct iommufd_object *obj_dependent,
+			      struct iommufd_object *obj_depended)
+{
+	if (WARN_ON_ONCE(obj_dependent == obj_depended ||
+			 obj_dependent->type != obj_depended->type))
+		return;
+
+	refcount_dec(&obj_depended->users);
+}
+EXPORT_SYMBOL_NS_GPL(_iommufd_object_undepend, "IOMMUFD");
+
 /* Caller should xa_lock(&viommu->vdevs) to protect the return value */
 struct device *iommufd_viommu_find_dev(struct iommufd_viommu *viommu,
 				       unsigned long vdev_id)
-- 
2.43.0


