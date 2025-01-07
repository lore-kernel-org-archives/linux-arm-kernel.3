Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5CFF7E77199
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  7 Jan 2025 17:39:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ERSMdPLo8m0QzzQ6QnVP2SGUYvy/03JE9NWR4O6wxj0=; b=C/MS+nR4eCLafi9RDg1sNFRU50
	cGzEFpzjz4N/10MRruMC68tkzGfYtIZs5CcuIVhOfBDg6vRBqinDXoQFUr6KbB9V65icU56caiid1
	YaOqAw9FMZlkhnsI33cm5MkSDga3g4qkR8W/3ENwbfIIn/ETNoszdTkjh+sJr6CAJbWJlxErZbbSj
	o8aAR4b1wkP106dDU0P+t2gRV34ZMAzMgjSAIeReFSPOmwbAdWaVRgJDrACXx+sn8XQ/93fHVzr6y
	CaYwzPmBfNLdiQJqu3NQrJKQSHIshH1tqR/T2L3rDtbaxHaObZbGq98miAU39Ov55lA2rhek8n+Sm
	cFXqZT1g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tVDXS-00000005t4S-0IYz;
	Tue, 07 Jan 2025 17:38:46 +0000
Received: from mail-bn7nam10on2061b.outbound.protection.outlook.com ([2a01:111:f403:2009::61b] helo=NAM10-BN7-obe.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tVD6j-00000005mHR-0k1R
	for linux-arm-kernel@lists.infradead.org;
	Tue, 07 Jan 2025 17:11:19 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=CqHtt7cZgnGAc9fHSZb2K/3ksyj6htH/VphnY2mM1a2+Vk89cywghCEoGfVPGbClZj+2Ynu32BvfCLl/hQl4hP36mthqrJexMwfY2Z2S+oIqjCm3eaKu+Lg2KGj8BESLrZMqnqr0iHpzC57BQczsU8aqtenC507yITMk45UWovjUGVRnoChCGaANrw+xVK4V3qYCiV1KEVjbwOUGuzvt2hKPWjATB0oGO0Bwki7Iu8uwTGcqJE2aJp9NWjAmkO4evTvPiDsrxH6r2rlFy/51wm6if5H5405Ic3YoJqHcgvahJ85Vye0xNbqCKxAoAeksgB0cLj1ZxXXBgB4G6lPA3A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ERSMdPLo8m0QzzQ6QnVP2SGUYvy/03JE9NWR4O6wxj0=;
 b=HPCjawIwz9XnWXRKS1pP9fcciZK9LNlzL0u/l9d7IrPss6Amr6B9Jumrtyz8VKzS+cviCMLrqmMjSnSa4uvF5bigzR0Ul7pXeVL5QEByDUhG/w8qoLj+xECPM0nqehzmR7yKnNMuFtnGIpUjEnxZEtfuSPK8KQwszf8D4u6asi7KT85OSGF8+nuZgD9eXVC8/z9kW/PqO8G0WCgA6GkpwYhsZCWdj+scuoIMpRzunCmJ070FeseY7YoAjxFh05ayV/jWzY+GiaURqFuv9P49V2FAv9LhH7YjJ8rN/fg3Y7L2YhyQ9ZAr+PqSu1GFso1Z5Xjvfe1OPdadztwJyfqUoQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.161) smtp.rcpttodomain=redhat.com smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ERSMdPLo8m0QzzQ6QnVP2SGUYvy/03JE9NWR4O6wxj0=;
 b=Sm42v2VVY4ulR57dBTSo+Mp8WA0GkvD2FHxhx3q+8WuzbPF0xJbKKYYfrk8Dk9X/nQTd0fv7Yw8mQzGEXNQFUIMrhzF8L8Mk+9g4tzCGYeq1MF0CWocXnn02E2HEhMRKJ1sHgH+5q7bauPz1yLATNNpKuLXpXEqJ1pzm6rGm00UQAz6yoszV4dwiJ8XrXTAXWXr5R2gJxJjZm7DKcdhtzZV2FC8BbapUg+2f1yIqClj5lZb7VuCjJTi8oJKNwKb6ygCh+8LJKo73k6S5qF3Spk82eiwnlyMslb8yNmX+T21jHdAAtK1iLPlnTbkyDgcuNQFZH4hQtE0KlcHwOlropA==
Received: from MN0PR02CA0020.namprd02.prod.outlook.com (2603:10b6:208:530::31)
 by CYYPR12MB8871.namprd12.prod.outlook.com (2603:10b6:930:c2::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8335.10; Tue, 7 Jan
 2025 17:11:02 +0000
Received: from BN3PEPF0000B069.namprd21.prod.outlook.com
 (2603:10b6:208:530:cafe::f) by MN0PR02CA0020.outlook.office365.com
 (2603:10b6:208:530::31) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8314.18 via Frontend Transport; Tue,
 7 Jan 2025 17:11:02 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.161)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.161 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.161; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.161) by
 BN3PEPF0000B069.mail.protection.outlook.com (10.167.243.68) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8356.0 via Frontend Transport; Tue, 7 Jan 2025 17:11:02 +0000
Received: from rnnvmail202.nvidia.com (10.129.68.7) by mail.nvidia.com
 (10.129.200.67) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.4; Tue, 7 Jan 2025
 09:10:45 -0800
Received: from rnnvmail202.nvidia.com (10.129.68.7) by rnnvmail202.nvidia.com
 (10.129.68.7) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.4; Tue, 7 Jan 2025
 09:10:45 -0800
Received: from Asurada-Nvidia.nvidia.com (10.127.8.9) by mail.nvidia.com
 (10.129.68.7) with Microsoft SMTP Server id 15.2.1544.4 via Frontend
 Transport; Tue, 7 Jan 2025 09:10:42 -0800
From: Nicolin Chen <nicolinc@nvidia.com>
To: <jgg@nvidia.com>, <kevin.tian@intel.com>, <corbet@lwn.net>,
	<will@kernel.org>
CC: <joro@8bytes.org>, <suravee.suthikulpanit@amd.com>,
	<robin.murphy@arm.com>, <dwmw2@infradead.org>, <baolu.lu@linux.intel.com>,
	<shuah@kernel.org>, <linux-kernel@vger.kernel.org>, <iommu@lists.linux.dev>,
	<linux-arm-kernel@lists.infradead.org>, <linux-kselftest@vger.kernel.org>,
	<linux-doc@vger.kernel.org>, <eric.auger@redhat.com>,
	<jean-philippe@linaro.org>, <mdf@kernel.org>, <mshavit@google.com>,
	<shameerali.kolothum.thodi@huawei.com>, <smostafa@google.com>,
	<ddutile@redhat.com>, <yi.l.liu@intel.com>, <patches@lists.linux.dev>
Subject: [PATCH v5 07/14] iommufd/viommu: Add iommufd_viommu_get_vdev_id helper
Date: Tue, 7 Jan 2025 09:10:10 -0800
Message-ID: <1dc30375464927950e12a5a52ed0433c3b01b8d6.1736237481.git.nicolinc@nvidia.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1736237481.git.nicolinc@nvidia.com>
References: <cover.1736237481.git.nicolinc@nvidia.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-NV-OnPremToCloud: AnonymousSubmission
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN3PEPF0000B069:EE_|CYYPR12MB8871:EE_
X-MS-Office365-Filtering-Correlation-Id: 0acf61c5-feaf-4123-3337-08dd2f3e43a0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|82310400026|36860700013|376014|7416014|1800799024;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?cUlKZvPFPPuc8M0/JNfV/6ypkHjUrL26W6pYVmBKzX/KE3qU0mqS2Vv8wbQD?=
 =?us-ascii?Q?nkx7p6H1x936Ip5P3VkwMsio5zNCB3aEmbfWI1UO9vC3EQPOLnmmtLuqE7Ag?=
 =?us-ascii?Q?+Ek7NQNKvr+5uLrQveJUM03xw3q43++437nCExdzkHweMWrPRd5HsyuWEq6D?=
 =?us-ascii?Q?erjF1e02tARvjqh1wUBs3XATqbxcSPcWtreP62pflwqSDfmI6WhCa8Rx2PBP?=
 =?us-ascii?Q?8DDcKvG94R/sCJd34jHJJ80Pw/Lcwb1TWzpF86fWrsyurK1D8/6b8f2ItZvw?=
 =?us-ascii?Q?WimcZyZg3BYvCriiTFo+/zdXO+khws4Xr2FlFtqn/2IAi9kMphkGevZyyswt?=
 =?us-ascii?Q?ud6HwaQA/wsaF84XarJglYPkXkmR144dh6TqZ5MZowZLUOzyEr4t4z2YA7u6?=
 =?us-ascii?Q?uerXVZtc9jQE/6JvC2H4b8p5n6ASSfwQOdOjj9WUTFr7Tap73rWDOqWc536V?=
 =?us-ascii?Q?gsQ4ERx2I1DOkyBNtE1x+ubukvmEIhRgluTs3/4lOVuM5CpEatcdcds0tK+/?=
 =?us-ascii?Q?F+a7tcubAwIFXMoaUil8s6GndPXT3SpBl0Izu10z12NiVteK7d2fASZG9g7i?=
 =?us-ascii?Q?pE8MGPLPg9Zuz8mFrS8+Fh484vrMD5MAvwwY+Z78bv8WKJUs+H/vwAWJMtNK?=
 =?us-ascii?Q?R9A+0+q4wH9/J4YiLcXJQIj5JaqQFkPZdv1ORSoGKQZo2csUu2c5HEvlDAC4?=
 =?us-ascii?Q?aCbYGa50aQvXKT21wn3ImZHNlPdUnu+GeH60FwRAa3ZVkYUONC6/B/0t29Nm?=
 =?us-ascii?Q?vhUFfCZ5SaS7xjDhMVldDe20eZIRNeEhK7pdrKhzAT4uVWQt9w/OHdGxnEpM?=
 =?us-ascii?Q?MZn5FMqN+zmSj+N077xx4wLZgHvWe8QI/gCG6O9jNxse1jlKwM5dZyGWEyL0?=
 =?us-ascii?Q?fG3SPyM3liJ14ADmfMWBs3u4aVZ1cQP8OQTya6WaBW9ip+NFTELFoXyTw/R1?=
 =?us-ascii?Q?B6Hy5u9GwZSgvaZeaTGOXvHYTKgz0Dcd2jaj2atKTsRNPjrpdwEPrWqwhfYq?=
 =?us-ascii?Q?+wPPLUYeWbrSNfHOoB/5/izB6LTYzOdT2EVWfFpDDm69lMprxPPQy8arAaq4?=
 =?us-ascii?Q?R/4OU/iHThjq2fL3Oa4a0fd+jYzlfFdOtvFQDMZdZ+WuCUaiNzzMFWucPb2h?=
 =?us-ascii?Q?CDqoRp8LkLlkLbLs4MPQwoCl0JLsqzMFTg0Jrzrew6/uZwK3W8rhZmhvHyd1?=
 =?us-ascii?Q?OgXTNOHZHsD/LGUYHKRONPUMutmUcPpr6zk7fR3VUse7be+uGjYj6OMfwjN7?=
 =?us-ascii?Q?BbdZi1akXxmfu7TjEgoKoLecPypRjW0nDqUqWnFxflv6KeVhj4pL0GU8CPic?=
 =?us-ascii?Q?yUg0qkhwAhYHHPhZRa/pPxA/otJBluBNgdrmMuT3P05QbLgRR/srrqoofme9?=
 =?us-ascii?Q?CvXsnsZKPFDsFHu9pZ+66B6T6hDf7Mmw4Kk69RYCw7tJgeqTD8dFwrrSUgSz?=
 =?us-ascii?Q?x/HnXjiQ1GQoNWP+LKZ5SWf9/OlIpkhpwAYLoZT7NSc6XtWriwHBtMTtIKlb?=
 =?us-ascii?Q?nztdLCj2W1hSJb0=3D?=
X-Forefront-Antispam-Report: CIP:216.228.117.161;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge2.nvidia.com;CAT:NONE;SFS:(13230040)(82310400026)(36860700013)(376014)(7416014)(1800799024);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Jan 2025 17:11:02.3497
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 0acf61c5-feaf-4123-3337-08dd2f3e43a0
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.161];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: BN3PEPF0000B069.namprd21.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CYYPR12MB8871
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250107_091109_210548_7D58329B 
X-CRM114-Status: GOOD (  12.47  )
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

This is a reverse search v.s. iommufd_viommu_find_dev, as drivers may want
to convert a struct device pointer (physical) to its virtual device ID for
an event injection to the user space VM.

Again, this avoids exposing more core structures to the drivers, than the
iommufd_viommu alone.

Reviewed-by: Lu Baolu <baolu.lu@linux.intel.com>
Signed-off-by: Nicolin Chen <nicolinc@nvidia.com>
---
 include/linux/iommufd.h        |  8 ++++++++
 drivers/iommu/iommufd/driver.c | 20 ++++++++++++++++++++
 2 files changed, 28 insertions(+)

diff --git a/include/linux/iommufd.h b/include/linux/iommufd.h
index 941f2ed29914..a6dd9f8edcf3 100644
--- a/include/linux/iommufd.h
+++ b/include/linux/iommufd.h
@@ -192,6 +192,8 @@ struct iommufd_object *_iommufd_object_alloc(struct iommufd_ctx *ictx,
 					     enum iommufd_object_type type);
 struct device *iommufd_viommu_find_dev(struct iommufd_viommu *viommu,
 				       unsigned long vdev_id);
+unsigned long iommufd_viommu_get_vdev_id(struct iommufd_viommu *viommu,
+					 struct device *dev);
 #else /* !CONFIG_IOMMUFD_DRIVER_CORE */
 static inline struct iommufd_object *
 _iommufd_object_alloc(struct iommufd_ctx *ictx, size_t size,
@@ -205,6 +207,12 @@ iommufd_viommu_find_dev(struct iommufd_viommu *viommu, unsigned long vdev_id)
 {
 	return NULL;
 }
+
+static inline unsigned long
+iommufd_viommu_get_vdev_id(struct iommufd_viommu *viommu, struct device *dev)
+{
+	return 0;
+}
 #endif /* CONFIG_IOMMUFD_DRIVER_CORE */
 
 /*
diff --git a/drivers/iommu/iommufd/driver.c b/drivers/iommu/iommufd/driver.c
index 2d98b04ff1cb..e5d7397c0a6c 100644
--- a/drivers/iommu/iommufd/driver.c
+++ b/drivers/iommu/iommufd/driver.c
@@ -49,5 +49,25 @@ struct device *iommufd_viommu_find_dev(struct iommufd_viommu *viommu,
 }
 EXPORT_SYMBOL_NS_GPL(iommufd_viommu_find_dev, "IOMMUFD");
 
+/* Return 0 if device is not associated to the vIOMMU */
+unsigned long iommufd_viommu_get_vdev_id(struct iommufd_viommu *viommu,
+					 struct device *dev)
+{
+	struct iommufd_vdevice *vdev;
+	unsigned long vdev_id = 0;
+	unsigned long index;
+
+	xa_lock(&viommu->vdevs);
+	xa_for_each(&viommu->vdevs, index, vdev) {
+		if (vdev && vdev->dev == dev) {
+			vdev_id = (unsigned long)vdev->id;
+			break;
+		}
+	}
+	xa_unlock(&viommu->vdevs);
+	return vdev_id;
+}
+EXPORT_SYMBOL_NS_GPL(iommufd_viommu_get_vdev_id, "IOMMUFD");
+
 MODULE_DESCRIPTION("iommufd code shared with builtin modules");
 MODULE_LICENSE("GPL");
-- 
2.43.0


