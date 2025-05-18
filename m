Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3CF01C3ABD8
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 18 May 2025 03:45:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ZvEh6Lc+j8gmh2qUaGAI7oEkwXQCTLpjuw1DJxYLP2k=; b=dd5lEBUHJqg+XacpQfMla+CMxE
	gtay+qj2Qvj7dX/iYkIFLtelBtQZvIYif2qO7csIs163xphGGlTk8q49vGPJc6aRqhQSx/fk2HAB1
	cwu6jZXl8yiDK/KvLzWTKrk5bwtd7H6lZ0nPskdmntGAC53H/UkUdtRDPJPMx8MEsETJVqYhtXdAN
	y56x8iBMlmJB3pvA7Mp+Q52XZtOrhzhRmJNQ4n13e/kyS9Sn6LWEeCvO0jY8usVc7ycYKOg3+W6Qi
	GcaJ5QhzWxY0TncSsZ3IcKpxJrvCPB3iAKhedrF3YD2YVOBpsp4cKBmT1hb1UMCNQy9WhWFZ8l814
	zhG+TWlw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uGUxK-00000006fDK-1IM3;
	Sun, 18 May 2025 03:44:54 +0000
Received: from mail-bn8nam04on2061a.outbound.protection.outlook.com ([2a01:111:f403:2408::61a] helo=NAM04-BN8-obe.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uGUbh-00000006bUm-0pXk
	for linux-arm-kernel@lists.infradead.org;
	Sun, 18 May 2025 03:22:34 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=JsI44ayAXqtHk8ksqoJeZ73mTgroSvUuF757f3Ko3LaIxTtVZZZ7t9kSVOOYlF+MfqHK+ZnJCLKfmGBXZygMZnqOGvrpUDe6HbLdbvZ1v3n7xwXwExsXCzyan8bA4QZTxO5R4itvMHGrr/Z9UO83HG79IE9GuBjNTQdMDzQmAve95jm9FGLOSWp3S6771igzA2khQqKbp31T89w16kBdYPlh2PEEEdf7PrusRmt2fb14lfU0Tf9A0X2MhREeBLmCgeua60lZBjAEMkh2SkXrymKKM96h69W42cE4CS5KN+fazZknSs5NQNWFOLPDrSY9H/eWTwwGkgalEaSs0b2SeQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ZvEh6Lc+j8gmh2qUaGAI7oEkwXQCTLpjuw1DJxYLP2k=;
 b=l0+9lT9DPOSTOGwXPL0vhv7kGWeSwdNm99eJGVx+47UBr45fv0rJRfOJFYuBEvJQlMWGLu2ZfO6QuTMoO3D73dIhszzpEdBGxfXUQVZ7gxD4aFyYyiIqDrT5Kszxt4HACIyPNzqfTJb0eetGnN02O67Kmaaw2QcuYz+AKF6k8hq+jNwz4SjCRWr/lZjyAzHXxkj5ZfyPE0jzAG7hESRelpfRHvfd9jRW66yVJibhHlurj4qRnEY6CC2G5gAo8d704hf2zke60WVDl6bjFUv2vetMxAO59lCPVXXWuWQZKt9mHEDd80TPL53t3/x8La2lB1K7KbC1sWgEtzAH2lS4gg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.160) smtp.rcpttodomain=amd.com smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ZvEh6Lc+j8gmh2qUaGAI7oEkwXQCTLpjuw1DJxYLP2k=;
 b=ujexCyjECFkaQPHr0uAvBFV0+61Zv5Zn2oad5MvtOWEmJ3elshyn6KZdzgZ/Ddh4HrrnlzyL/Nv8hQRGct3LJMjBgRW2f4miKUVAYq7uVLQdvS+UAw6WB5X4A+oeZAdsbTVyX5utOGZqSqax6NFC4UJiN2lYUeg40ipbQ8cyB6k/bh8zfMzizDC+kO9NwnEdUk3yjbwwrp8Vy+Prx2d04qccG6+RPWuslFkEIi6gP4d1uEyl/iW5X/ISyGgFtHvdqReh42lFrZIYNXq/ohSFqFpn/b/daubkQX+Yu2ESTCRbBznBI8nqnYZ2UOg90HJ23knQB82bocjAb3grNuA+Yw==
Received: from DS7PR03CA0291.namprd03.prod.outlook.com (2603:10b6:5:3ad::26)
 by PH8PR12MB7159.namprd12.prod.outlook.com (2603:10b6:510:229::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8722.28; Sun, 18 May
 2025 03:22:26 +0000
Received: from DS1PEPF0001708F.namprd03.prod.outlook.com
 (2603:10b6:5:3ad:cafe::2d) by DS7PR03CA0291.outlook.office365.com
 (2603:10b6:5:3ad::26) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8746.25 via Frontend Transport; Sun,
 18 May 2025 03:22:26 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.160)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.160 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.160; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.160) by
 DS1PEPF0001708F.mail.protection.outlook.com (10.167.17.139) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8746.27 via Frontend Transport; Sun, 18 May 2025 03:22:26 +0000
Received: from rnnvmail202.nvidia.com (10.129.68.7) by mail.nvidia.com
 (10.129.200.66) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.4; Sat, 17 May
 2025 20:22:16 -0700
Received: from rnnvmail204.nvidia.com (10.129.68.6) by rnnvmail202.nvidia.com
 (10.129.68.7) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.14; Sat, 17 May
 2025 20:22:15 -0700
Received: from Asurada-Nvidia.nvidia.com (10.127.8.11) by mail.nvidia.com
 (10.129.68.6) with Microsoft SMTP Server id 15.2.1544.14 via Frontend
 Transport; Sat, 17 May 2025 20:22:13 -0700
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
Subject: [PATCH v5 11/29] iommufd/driver: Let iommufd_viommu_alloc helper save ictx to viommu->ictx
Date: Sat, 17 May 2025 20:21:28 -0700
Message-ID: <c19f83dba1708cea09911853d3a3040dc95d828d.1747537752.git.nicolinc@nvidia.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1747537752.git.nicolinc@nvidia.com>
References: <cover.1747537752.git.nicolinc@nvidia.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-NV-OnPremToCloud: AnonymousSubmission
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS1PEPF0001708F:EE_|PH8PR12MB7159:EE_
X-MS-Office365-Filtering-Correlation-Id: 8d6d7555-e76c-41fe-d1c7-08dd95bb369e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|7416014|376014|36860700013|1800799024|82310400026;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?RnPfHHxfPSe4wu9CxcNo7O75ybBAP24DsfAxBVwA4QBdXPRsmizTV5IyMokI?=
 =?us-ascii?Q?SI9mjgDrs1HxKKKGevKSZ2wx7N+YMpTHt7H1rjDOWHABvhJoi584ayq/sTmu?=
 =?us-ascii?Q?mec7yfbZ06JlCFCaLIyb0XZw92IjmKmvrMsA9hsnRaANK+J/p5Oe+e1Wjmt+?=
 =?us-ascii?Q?Fk/Carmrig7Zgc02AMBdxX60QbWCqq4Ylr+kmqJoCuMxJZgu0fbHoroVdafu?=
 =?us-ascii?Q?bP9npnYew+PpadbP/42NUFdE9fyV++3dJbMDZmLCA9e+r8nX0cIuCnrIroN0?=
 =?us-ascii?Q?GU1gpFH/G9YaPPdRX5RjGVdzC1GfKuGcDwZzETavC95rhXRSq41TIBH4VgWV?=
 =?us-ascii?Q?Yi7ghrlGpXZg7kGTU1HJH/IBc0QVaYommumhWUyGDW/loInTq028x1sJyMMF?=
 =?us-ascii?Q?dfwqOS1zy7NKxSb2dWY+1fPJhstu8cVNOuiBKgvXXsr3EAwnue2wxxodRozN?=
 =?us-ascii?Q?hkWWLbB4UKDyATca505kyO3vKQ9gXat8lt2iyejW1z9u4S4jA9eg7HPPJ7rg?=
 =?us-ascii?Q?kv95ROwhfcmECcUrVS7cAamvVcmXLdksJAdXo5GqrBjVkfNEM7iCeBVJBumg?=
 =?us-ascii?Q?9ATDocynT6MXyNLVDvEHTuA2xkNGwnwr6M+5xNwH/6S7wxJFNRU4nEeaC3f8?=
 =?us-ascii?Q?bZcSp1JJ4MnG+AGYB2lVu27dRfufQcBgFcYtktOBDM3hFOnX9VA9qzMTynYq?=
 =?us-ascii?Q?+FY80YdAtMvJqZ8Wr5dJQ8TMXvYhxih1bssSNBtfTglhKbMS2A2QI6ElIoCl?=
 =?us-ascii?Q?iiRQMW4iF1SaVR4GI12RkjpcUApqZ5YfVUcmfaYiINvfaWB8BV6UDq14VSCA?=
 =?us-ascii?Q?51Qqj2Vbr/VNZU5q1QuyU74QU4xT4BvJPZmMcvcAKQ2FvXw+ukmL/9rzRIHj?=
 =?us-ascii?Q?QWGyVeIfM5z+D+SBmHWiJ3bec6btMQdjnXluPcMKcANtpfbPzo9XU+/tKHUQ?=
 =?us-ascii?Q?R0wzqMSaGPNMbGmT8pZ4C4gvdqEVIXAP5MnBkbuACJfIbc5eLcIznATEufSy?=
 =?us-ascii?Q?JazVBP2hyIYB+QeGMtMpGRjt5PLvZ46NEcaLBohfMbCYROQX66O+YIOVF7Bl?=
 =?us-ascii?Q?y+nWFmUNkf0I01vocAZfLVQRgO6ZPf9MIFbZDz5ZOEn7nYJLxfAw6tMpNx/m?=
 =?us-ascii?Q?/hApwKtWDW3P6QbOv/TZ3LTp+l9TItx0VtQyuoBVWhECwL7QQ41KpN86pLL6?=
 =?us-ascii?Q?cxlWjIKb5xh0EJRtRswVxQuWORcr0QjwLyVF76HfWnGUQhIj3xYxWlqTuoNR?=
 =?us-ascii?Q?QDg0ELG/luRloK/Z6jjzz+nkP9BDIBc7UE/CLDISusJ+fs/uir7351hHPzVB?=
 =?us-ascii?Q?q7+kGTqnXlaQd4xPGa4t9Xx6GQ8OFhYB/YSCY4LNjEuo597QXxvvhJG1NqZM?=
 =?us-ascii?Q?B8GLhQ3KxKNaj8q3fKDqdxagrDkIZXRSjCAu+uZRVJPdKBv2ECIOd2e6E/nk?=
 =?us-ascii?Q?pSRO9WmHxvsIZsPVfadZsCNPJh0QrT0A8qc/r6nIrkOpRTyOBj87jNwKrLbt?=
 =?us-ascii?Q?NWcMygrlgx2CriDJYhOdVLHzPJXaR/nJobZc?=
X-Forefront-Antispam-Report: CIP:216.228.117.160;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge1.nvidia.com;CAT:NONE;SFS:(13230040)(7416014)(376014)(36860700013)(1800799024)(82310400026);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 May 2025 03:22:26.2770
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 8d6d7555-e76c-41fe-d1c7-08dd95bb369e
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.160];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: DS1PEPF0001708F.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR12MB7159
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250517_202233_232600_7E8CEF1E 
X-CRM114-Status: GOOD (  13.90  )
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

When an IOMMU driver calls iommufd_viommu_alloc(), it must pass in an ictx
pointer as the underlying _iommufd_object_alloc() helper function requires
that to allocate a new object. However, neither the iommufd_viommu_alloc()
nor its underlying _iommufd_object_alloc() saves the ictx in the allocated
viommu object, although viommu could hold an ictx pointer.

When the IOMMU driver wants to use another iommufd function passing in the
allocated viommu, it could have avoided passing in the ictx pointer again,
if viommu->ictx is valid.

Save ictx to viommu->ictx in the iommufd_viommu_alloc(), in order to ease
a new vIOMMU-based helper that would then get the ictx from viommu->ictx.

Reviewed-by: Jason Gunthorpe <jgg@nvidia.com>
Reviewed-by: Kevin Tian <kevin.tian@intel.com>
Signed-off-by: Nicolin Chen <nicolinc@nvidia.com>
---
 drivers/iommu/iommufd/iommufd_private.h |  8 --------
 include/linux/iommufd.h                 | 12 +++++++++++-
 drivers/iommu/iommufd/viommu.c          |  7 ++++++-
 3 files changed, 17 insertions(+), 10 deletions(-)

diff --git a/drivers/iommu/iommufd/iommufd_private.h b/drivers/iommu/iommufd/iommufd_private.h
index cef3e0e0bbb2..44286216ac5a 100644
--- a/drivers/iommu/iommufd/iommufd_private.h
+++ b/drivers/iommu/iommufd/iommufd_private.h
@@ -136,14 +136,6 @@ int iopt_pin_pages(struct io_pagetable *iopt, unsigned long iova,
 void iopt_unpin_pages(struct io_pagetable *iopt, unsigned long iova,
 		      unsigned long length, bool is_owner);
 
-struct iommufd_ucmd {
-	struct iommufd_ctx *ictx;
-	void __user *ubuffer;
-	u32 user_size;
-	void *cmd;
-	struct iommufd_object *new_obj;
-};
-
 int iommufd_vfio_ioctl(struct iommufd_ctx *ictx, unsigned int cmd,
 		       unsigned long arg);
 
diff --git a/include/linux/iommufd.h b/include/linux/iommufd.h
index d74c97feb9b5..a07466333c48 100644
--- a/include/linux/iommufd.h
+++ b/include/linux/iommufd.h
@@ -52,6 +52,14 @@ struct iommufd_object {
 	unsigned int id;
 };
 
+struct iommufd_ucmd {
+	struct iommufd_ctx *ictx;
+	void __user *ubuffer;
+	u32 user_size;
+	void *cmd;
+	struct iommufd_object *new_obj;
+};
+
 #define __iommufd_object_alloc_ucmd(ucmd, ptr, type, obj)                      \
 	container_of(_iommufd_object_alloc_ucmd(                               \
 			     ucmd,                                             \
@@ -262,8 +270,10 @@ static inline int iommufd_viommu_report_event(struct iommufd_viommu *viommu,
 									       \
 		ret = (drv_struct *)__iommufd_object_alloc_ucmd(               \
 			ucmd, ret, IOMMUFD_OBJ_VIOMMU, member.obj);            \
-		if (!IS_ERR(ret))                                              \
+		if (!IS_ERR(ret)) {                                            \
 			ret->member.ops = viommu_ops;                          \
+			ret->member.ictx = ucmd->ictx;                         \
+		}                                                              \
 		ret;                                                           \
 	})
 #endif
diff --git a/drivers/iommu/iommufd/viommu.c b/drivers/iommu/iommufd/viommu.c
index 2b30627d1d8e..662f5c1b1935 100644
--- a/drivers/iommu/iommufd/viommu.c
+++ b/drivers/iommu/iommufd/viommu.c
@@ -60,9 +60,14 @@ int iommufd_viommu_alloc_ioctl(struct iommufd_ucmd *ucmd)
 		goto out_put_hwpt;
 	}
 
+	/* The iommufd_viommu_alloc helper saves ucmd->ictx in viommu->ictx */
+	if (WARN_ON_ONCE(viommu->ictx != ucmd->ictx)) {
+		rc = -EINVAL;
+		goto out_put_hwpt;
+	}
+
 	xa_init(&viommu->vdevs);
 	viommu->type = cmd->type;
-	viommu->ictx = ucmd->ictx;
 	viommu->hwpt = hwpt_paging;
 	refcount_inc(&viommu->hwpt->common.obj.users);
 	INIT_LIST_HEAD(&viommu->veventqs);
-- 
2.43.0


