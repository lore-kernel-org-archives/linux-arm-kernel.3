Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4B32DC7EE30
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 26 Jun 2025 20:01:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=MgDX6RAVC56sJrpOlF8yskYvukds4vG8HVmrQHhqCMs=; b=fS9i532OeltYeWqZ3jyPdKV6uF
	THnKH995B4s4N0ox3qCxoWSXruNahBFUwatKRcghMAdDufwizb9TgoEWrBg+J794wCDHOdVoQwGi/
	6l3eRReP5t0tJKTU9fav7xphlCT+525kz2B9B1r9UjlU4NzjdzH53gcBpeqD/BAbCx6U/ZeOyfV6p
	Y7SXHWyNhmNeiOECgS2b5H7rTP28HNOwp30/R1ENCQEo5BzjPiSWupwmcP3rIjjuvGkuSA8mCO0sR
	qoEQt26c/OwFHwAbvd66kYFFPkPduhxskTz5Q3DKDHIQooDn6ple8J0EyEHSw/pstQFvTpeT/E5XC
	fn9toafQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uUsmF-0000000CftK-19KV;
	Thu, 26 Jun 2025 20:00:55 +0000
Received: from mail-bn7nam10on2060e.outbound.protection.outlook.com ([2a01:111:f403:2009::60e] helo=NAM10-BN7-obe.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uUsNs-0000000CaKl-3naA
	for linux-arm-kernel@lists.infradead.org;
	Thu, 26 Jun 2025 19:35:46 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=nQ8u8WQn9h8es/mEOTae17Yj511rvr4RP8sMeLt+W7Nvu2eKPglpJbRlTx/3xcY68UJ6oS7wq075/Ej76nMwB6cn9YycXFaQWtCzJg4xS2B+L7AV41PPgXqlP1iw9l0n83RdPKoE2eSgXxyoI4C92p0Pkq8CGTpeNka6f6CBHHEafBKnR6tDDBFBJXuH/OdOqWPLnclF37jV3ACYetRg0Y477/9z1EPEYkx0mFIgGk3njogf4gWo3VVa8a44IfQGwYYs+wXwlo50HBu+7bLnI9B5l54xkc3tkcUqyqmjCuJLTe6A/OrNE7qxY67G+yvnzsMCg0eKxwbQVvEeAddPXw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=MgDX6RAVC56sJrpOlF8yskYvukds4vG8HVmrQHhqCMs=;
 b=IIGu6VLPULs57YwvElrNAcjZhTKMdDfaBof6oLOu6BQ8x93eD9m2RpmRlt9Frke4vdowxnfHOO5Kd11nFRblcqR9uQdwJhLJGTCYbxdLUXoTiCegA5NrmrB8OXReRpuwj/wvUEtKuTBltIgkE5WpuUC//Kv5mbaWYXdoD/owNYSAVBL6z1kMeAZIYOl6GgGJ7FoIvs1Y0rSsS6+eZT/y+VT+nsKQY6d6/xvXnSsfVgfNWUwKEw++QmTJdN5NmzKlZG/cRKjgCnXof22QQN1s6UKrOBJjDACKGvbjtVGCbo0Z2fHXJCsobr8e3Llkn9vXoIu8NWNYUGWxXrrochEPlA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.118.233) smtp.rcpttodomain=amd.com smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=MgDX6RAVC56sJrpOlF8yskYvukds4vG8HVmrQHhqCMs=;
 b=prtFulZdaR9uiBeiIipmCC9Q7w3TIFe/oovDUHHwZe1Yf176EemosNwu1JLeQH0/M8sfua7UiFWCUxE0OkMVBJpxqtSKZLuboHwOhR/nD2nwep7/TXvc5EAczSPtWvQGJMUmhb7DfXEOgufLzat8xbDCJXmBEdgbSZqKf6Z20BUEhJDOjh8jOSx79kF1ZOso59uSn/gSIkC1XbtcWkcdOODtyuXQ1K7LMAihHCY/7FP+b/1Q89YlAYmznH1r3F0z0R0xMrgd5QrFmzkXW9eaHCXeAFDp7G2ulfEdm55E1lYevHddgrF/HAYTsS3LikFp0rycKAm0g7w+VNAoHltITA==
Received: from LV3P220CA0029.NAMP220.PROD.OUTLOOK.COM (2603:10b6:408:234::8)
 by MW3PR12MB4475.namprd12.prod.outlook.com (2603:10b6:303:55::24) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8857.32; Thu, 26 Jun
 2025 19:35:37 +0000
Received: from MN1PEPF0000ECD8.namprd02.prod.outlook.com
 (2603:10b6:408:234:cafe::70) by LV3P220CA0029.outlook.office365.com
 (2603:10b6:408:234::8) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8880.21 via Frontend Transport; Thu,
 26 Jun 2025 19:35:37 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.118.233)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.118.233 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.118.233; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.118.233) by
 MN1PEPF0000ECD8.mail.protection.outlook.com (10.167.242.137) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8880.14 via Frontend Transport; Thu, 26 Jun 2025 19:35:37 +0000
Received: from drhqmail202.nvidia.com (10.126.190.181) by mail.nvidia.com
 (10.127.129.6) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.4; Thu, 26 Jun
 2025 12:35:21 -0700
Received: from drhqmail201.nvidia.com (10.126.190.180) by
 drhqmail202.nvidia.com (10.126.190.181) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14; Thu, 26 Jun 2025 12:35:21 -0700
Received: from Asurada-Nvidia.nvidia.com (10.127.8.13) by mail.nvidia.com
 (10.126.190.180) with Microsoft SMTP Server id 15.2.1544.14 via Frontend
 Transport; Thu, 26 Jun 2025 12:35:20 -0700
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
Subject: [PATCH v7 11/28] iommufd/viommu: Add driver-defined vDEVICE support
Date: Thu, 26 Jun 2025 12:34:42 -0700
Message-ID: <58fc53c259fa00e203ce8aa613c14cf8e0a14f00.1750966133.git.nicolinc@nvidia.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1750966133.git.nicolinc@nvidia.com>
References: <cover.1750966133.git.nicolinc@nvidia.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-NV-OnPremToCloud: AnonymousSubmission
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN1PEPF0000ECD8:EE_|MW3PR12MB4475:EE_
X-MS-Office365-Filtering-Correlation-Id: 33630453-4bfb-470a-df8c-08ddb4e8a085
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|82310400026|7416014|36860700013;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?UG4INLzpXdyzUtMVar/7ozOlimdVW+oukBvj4CmV7OjPrSiEWFSZTN8Mv+G5?=
 =?us-ascii?Q?hSlyi22S+kAo7rwp3P0ppEKLzfngxO/osj36chJWns5hN9uHGDy8LzOe8NMU?=
 =?us-ascii?Q?prg6STBdkFcOCYCr4NsTbfQwp/OdEhC08XGCyA3SZoTYnfzB7tww0a+vzPrA?=
 =?us-ascii?Q?jVr4RL14eSU8u7SLZ9hnQMdlZaQnP1pYLJXcXLVQRTjjyEMvlCox/QZN0e3i?=
 =?us-ascii?Q?qAm7GcwMvtdiy89oATU0EANEcb1pe8TlnU77MH6V2hkmAzEICBh87WaoW3F2?=
 =?us-ascii?Q?q81HNc0ISgUmrCeNqdcX2kGbNQSX0Jwmb5NkjWXSbAmwRys6iMP1OYQa4ztg?=
 =?us-ascii?Q?5Yug6DNGeOkuShgT3tjj7CPbAf3nS/uY58De7TnBFNmT9R0o3nNZ9N7Lw4Mj?=
 =?us-ascii?Q?GYXN86+SQpdDY7icJcKo3GJO/JrDgvSj1j6MGTGuGVTUvXm3qWvSYIM46pSg?=
 =?us-ascii?Q?NkMWBoVqgPp5mxdTbsGajuyxhncejaYSaIFYgSKSJCTIL/wPt/ybsKeuNvVc?=
 =?us-ascii?Q?lKosB8eVK4gY9OcmGZKRoIuJd1oWiI7B7sxZM8n3lbBwLYTbIk/2ApYNcoYy?=
 =?us-ascii?Q?9QOVZrtuO5+ql4VqoymyuuUhtK8V2r+MPxDP30sx0xSHI96ZB/cWZhPggrjG?=
 =?us-ascii?Q?E6nWO8hGDiZQNkfgtP2YEMTjjJFSjmtr/r2dsmVpXZnLAKkphDv4Zz5vXmcK?=
 =?us-ascii?Q?EPJtzDxBkbGi1XPnKRgs4aeQ0/oLhKfWl8jlh5uh8IdhWaxFWvxCSxBdwSF4?=
 =?us-ascii?Q?YLSVhFP2Dy99rpX0BhCBPdtofmVpmbFoLQnJPyXPxvUJJMNPXgx9TsWrY346?=
 =?us-ascii?Q?4i6/sk1N6aDyAEZjElfCGRmE8QtypgAOmO++8kxeRP92KRLASA78RRgThPGB?=
 =?us-ascii?Q?0aBXX+6yzopVemaLTHQuuNJRYmTtq8kbC5oOco+DRjebqeVLlDG9xuNgciJI?=
 =?us-ascii?Q?4uOZE/QG6o7txIErhzsLGF2mu3s9nvhUZMmnyqmGU7J4SFrDA6bsm3qe/Q/+?=
 =?us-ascii?Q?LhPSIJ5oLnD/JxtiS5LlwQgGgbScXukRwTNMva1QHY+nU87cEPhPLtwnSmt2?=
 =?us-ascii?Q?pOkGZ8tYbcj3cIeul9YwejOZBUGcYgJp/4LvXhfgsP06kyEZv2MqPaskJ38h?=
 =?us-ascii?Q?mMSnIMf9MejnJEsGJYX9Hwj3PzX9T95JWz/60P13dZm3BQlNf3zfcbEHYcdg?=
 =?us-ascii?Q?dH3mWqALCnbqrloilmqGN8/4oIfsr2RR85H825TvtlPb65JUDK9t3nzKZG0b?=
 =?us-ascii?Q?aEC6XXKfy5bmmArpml0Fmy6qTp592niSW1RQFKt6l06VxgGR1JocCJOZV8NR?=
 =?us-ascii?Q?YxHTWCkMWBQ+EgJY0J9R0D3Yn7/Z0tpVBT90/fQNSUAV9SXM2d5RFU10QmG9?=
 =?us-ascii?Q?DpeUGnX0bUBQDuolMod7j/zTuDz8ql5gLdZ9PcaXJB8um/UIolbMFHPsEhLS?=
 =?us-ascii?Q?Iyb4usKdbsKRbSlQ1xreiCMEgSQPJn1hUhK0/oNZuzIHfgzqsQG9oOYPT+DP?=
 =?us-ascii?Q?yUpjLy+MkWpIVloZODbAHM91WCSSgeYuuoFE?=
X-Forefront-Antispam-Report: CIP:216.228.118.233;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc7edge2.nvidia.com;CAT:NONE;SFS:(13230040)(1800799024)(376014)(82310400026)(7416014)(36860700013);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Jun 2025 19:35:37.3177
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 33630453-4bfb-470a-df8c-08ddb4e8a085
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.118.233];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: MN1PEPF0000ECD8.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW3PR12MB4475
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250626_123545_008453_81F028AF 
X-CRM114-Status: GOOD (  23.99  )
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

NVIDIA VCMDQ driver will have a driver-defined vDEVICE structure and do
some HW configurations with that.

To allow IOMMU drivers to define their own vDEVICE structures, move the
struct iommufd_vdevice to the public header and provide a pair of viommu
ops, similar to get_viommu_size and viommu_init.

Doing this, however, creates a new window between the vDEVICE allocation
and its driver-level initialization, during which an abort could happen
but it can't invoke a driver destroy function from the struct viommu_ops
since the driver structure isn't initialized yet. vIOMMU object doesn't
have this problem, since its destroy op is set via the viommu_ops by the
driver viommu_init function. Thus, vDEVICE should do something similar:
add a destroy function pointer inside the struct iommufd_vdevice instead
of the struct iommufd_viommu_ops.

Note that there is unlikely a use case for a type dependent vDEVICE, so
a static vdevice_size is probably enough for the near term instead of a
get_vdevice_size function op.

Reviewed-by: Jason Gunthorpe <jgg@nvidia.com>
Reviewed-by: Kevin Tian <kevin.tian@intel.com>
Reviewed-by: Pranjal Shrivastava <praan@google.com>
Reviewed-by: Lu Baolu <baolu.lu@linux.intel.com>
Signed-off-by: Nicolin Chen <nicolinc@nvidia.com>
---
 drivers/iommu/iommufd/iommufd_private.h | 12 ----------
 include/linux/iommufd.h                 | 31 +++++++++++++++++++++++++
 drivers/iommu/iommufd/viommu.c          | 26 ++++++++++++++++++++-
 3 files changed, 56 insertions(+), 13 deletions(-)

diff --git a/drivers/iommu/iommufd/iommufd_private.h b/drivers/iommu/iommufd/iommufd_private.h
index b849099e804b..4db8c6890f4c 100644
--- a/drivers/iommu/iommufd/iommufd_private.h
+++ b/drivers/iommu/iommufd/iommufd_private.h
@@ -653,18 +653,6 @@ void iommufd_viommu_destroy(struct iommufd_object *obj);
 int iommufd_vdevice_alloc_ioctl(struct iommufd_ucmd *ucmd);
 void iommufd_vdevice_destroy(struct iommufd_object *obj);
 
-struct iommufd_vdevice {
-	struct iommufd_object obj;
-	struct iommufd_viommu *viommu;
-	struct device *dev;
-
-	/*
-	 * Virtual device ID per vIOMMU, e.g. vSID of ARM SMMUv3, vDeviceID of
-	 * AMD IOMMU, and vRID of a nested Intel VT-d to a Context Table
-	 */
-	u64 virt_id;
-};
-
 #ifdef CONFIG_IOMMUFD_TEST
 int iommufd_test(struct iommufd_ucmd *ucmd);
 void iommufd_selftest_destroy(struct iommufd_object *obj);
diff --git a/include/linux/iommufd.h b/include/linux/iommufd.h
index 2d1bf2f97ee3..3709b264af28 100644
--- a/include/linux/iommufd.h
+++ b/include/linux/iommufd.h
@@ -104,6 +104,21 @@ struct iommufd_viommu {
 	enum iommu_viommu_type type;
 };
 
+struct iommufd_vdevice {
+	struct iommufd_object obj;
+	struct iommufd_viommu *viommu;
+	struct device *dev;
+
+	/*
+	 * Virtual device ID per vIOMMU, e.g. vSID of ARM SMMUv3, vDeviceID of
+	 * AMD IOMMU, and vRID of a nested Intel VT-d to a Context Table
+	 */
+	u64 virt_id;
+
+	/* Clean up all driver-specific parts of an iommufd_vdevice */
+	void (*destroy)(struct iommufd_vdevice *vdev);
+};
+
 /**
  * struct iommufd_viommu_ops - vIOMMU specific operations
  * @destroy: Clean up all driver-specific parts of an iommufd_viommu. The memory
@@ -120,6 +135,14 @@ struct iommufd_viommu {
  *                    array->entry_num to report the number of handled requests.
  *                    The data structure of the array entry must be defined in
  *                    include/uapi/linux/iommufd.h
+ * @vdevice_size: Size of the driver-defined vDEVICE structure per this vIOMMU
+ * @vdevice_init: Initialize the driver-level structure of a vDEVICE object, or
+ *                related HW procedure. @vdev is already initialized by iommufd
+ *                core: vdev->dev and vdev->viommu pointers; vdev->id carries a
+ *                per-vIOMMU virtual ID (refer to struct iommu_vdevice_alloc in
+ *                include/uapi/linux/iommufd.h)
+ *                If driver has a deinit function to revert what vdevice_init op
+ *                does, it should set it to the @vdev->destroy function pointer
  */
 struct iommufd_viommu_ops {
 	void (*destroy)(struct iommufd_viommu *viommu);
@@ -128,6 +151,8 @@ struct iommufd_viommu_ops {
 		const struct iommu_user_data *user_data);
 	int (*cache_invalidate)(struct iommufd_viommu *viommu,
 				struct iommu_user_data_array *array);
+	const size_t vdevice_size;
+	int (*vdevice_init)(struct iommufd_vdevice *vdev);
 };
 
 #if IS_ENABLED(CONFIG_IOMMUFD)
@@ -224,4 +249,10 @@ static inline int iommufd_viommu_report_event(struct iommufd_viommu *viommu,
 	 BUILD_BUG_ON_ZERO(offsetof(drv_struct, member)) +                     \
 	 BUILD_BUG_ON_ZERO(!__same_type(struct iommufd_viommu,                 \
 					((drv_struct *)NULL)->member)))
+
+#define VDEVICE_STRUCT_SIZE(drv_struct, member)                                \
+	(sizeof(drv_struct) +                                                  \
+	 BUILD_BUG_ON_ZERO(offsetof(drv_struct, member)) +                     \
+	 BUILD_BUG_ON_ZERO(!__same_type(struct iommufd_vdevice,                \
+					((drv_struct *)NULL)->member)))
 #endif
diff --git a/drivers/iommu/iommufd/viommu.c b/drivers/iommu/iommufd/viommu.c
index c0365849f849..081ee6697a11 100644
--- a/drivers/iommu/iommufd/viommu.c
+++ b/drivers/iommu/iommufd/viommu.c
@@ -116,6 +116,8 @@ void iommufd_vdevice_destroy(struct iommufd_object *obj)
 		container_of(obj, struct iommufd_vdevice, obj);
 	struct iommufd_viommu *viommu = vdev->viommu;
 
+	if (vdev->destroy)
+		vdev->destroy(vdev);
 	/* xa_cmpxchg is okay to fail if alloc failed xa_cmpxchg previously */
 	xa_cmpxchg(&viommu->vdevs, vdev->virt_id, vdev, NULL, GFP_KERNEL);
 	refcount_dec(&viommu->obj.users);
@@ -126,6 +128,7 @@ int iommufd_vdevice_alloc_ioctl(struct iommufd_ucmd *ucmd)
 {
 	struct iommu_vdevice_alloc *cmd = ucmd->cmd;
 	struct iommufd_vdevice *vdev, *curr;
+	size_t vdev_size = sizeof(*vdev);
 	struct iommufd_viommu *viommu;
 	struct iommufd_device *idev;
 	u64 virt_id = cmd->virt_id;
@@ -150,7 +153,22 @@ int iommufd_vdevice_alloc_ioctl(struct iommufd_ucmd *ucmd)
 		goto out_put_idev;
 	}
 
-	vdev = iommufd_object_alloc_ucmd(ucmd, vdev, IOMMUFD_OBJ_VDEVICE);
+	if (viommu->ops && viommu->ops->vdevice_size) {
+		/*
+		 * It is a driver bug for:
+		 * - ops->vdevice_size smaller than the core structure size
+		 * - not implementing a pairing ops->vdevice_init op
+		 */
+		if (WARN_ON_ONCE(viommu->ops->vdevice_size < vdev_size ||
+				 !viommu->ops->vdevice_init)) {
+			rc = -EOPNOTSUPP;
+			goto out_put_idev;
+		}
+		vdev_size = viommu->ops->vdevice_size;
+	}
+
+	vdev = (struct iommufd_vdevice *)_iommufd_object_alloc_ucmd(
+		ucmd, vdev_size, IOMMUFD_OBJ_VDEVICE);
 	if (IS_ERR(vdev)) {
 		rc = PTR_ERR(vdev);
 		goto out_put_idev;
@@ -168,6 +186,12 @@ int iommufd_vdevice_alloc_ioctl(struct iommufd_ucmd *ucmd)
 		goto out_put_idev;
 	}
 
+	if (viommu->ops && viommu->ops->vdevice_init) {
+		rc = viommu->ops->vdevice_init(vdev);
+		if (rc)
+			goto out_put_idev;
+	}
+
 	cmd->out_vdevice_id = vdev->obj.id;
 	rc = iommufd_ucmd_respond(ucmd, sizeof(*cmd));
 
-- 
2.43.0


