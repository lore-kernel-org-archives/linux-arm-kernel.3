Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 176CDC3ABBE
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  9 May 2025 03:17:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=UnwT+JGKorDXJSzlburW0oB/5SMlM+2g5CIL12JFevk=; b=ToU/W0tTpUi9/Uh3lhdGyhSoeb
	h/STZJMm2wojCyQpLrclkBzJdR7bzanX5jJh4B0wIbXgYDUM9FxLleuxu4vLKUtMW/nALzJrUraq/
	wxmPCRld8VvEmYM0zknGd/MxacQ1EaJd6725e9Mf+JbHmI8j+QXtQjrEk7wDFU45lGSY5nsAY7ovK
	9JdmpiOmNJ8QpS2J9Hpke8a+FYzU43x22WfluX9+/aUy5cT26vX+ohb8dcr/AzgGg9Kdnvc2qzaNy
	C5TLkwzNQTy1Z9iGW57IE1pyq9ks7HvCwTnv7WYZ40sM9955VX6CPUClE2uaTgkMS4sZH4ilhdC/E
	UiLllGYQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uDEF5-00000002LRq-2NZB;
	Fri, 09 May 2025 03:17:43 +0000
Received: from mail-dm3nam02on2060f.outbound.protection.outlook.com ([2a01:111:f403:2405::60f] helo=NAM02-DM3-obe.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uDE1H-00000002IaZ-47Xl
	for linux-arm-kernel@lists.infradead.org;
	Fri, 09 May 2025 03:03:29 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=hvlhEtyvUcvYW9s/wEgomxqMgNIKP148tOZv0p9HMjeNfrcIqBSUkYyoIpcOJyCljwvPMEPdl2SzOa4Gd6tgFmY5qawg54ROckdAdLdbjqrXLwJ6JguZ0UO92T4rpUTE+wWBIZwdtLI4aSTUBtu00i9RX4IZh6lpiSvSodl9Ia2WMODfjvNswHbqBOO2D7RNMSFhpUdFFOfmiepP6zTxiSTh6xEskqAtgepB8LsPtV6UAlJzO/h6P20ne7TYy986uMNUGpBzhdoIYT5dufMTXcuVJf1DAbkzp6gwEMJizIUE+61gXmTiL8z6YKspsqOIfLvuCugS/kdHNPXEMrMuQw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=UnwT+JGKorDXJSzlburW0oB/5SMlM+2g5CIL12JFevk=;
 b=iwaTnyQi2RWdXpsaDYSPe+RcyHceTLZw/DHE+9bWD1TNSlVoZlnCN0xF3aNvUiu+xF50b62q27qH7+znf4tvVQ87nouS3dGBjj5nkN2NvDtWBnfI3PafXz5i9/ARn1c6MstPWqxSkTcpWBWhuAi9V2rGvxF6MFmAQ4iF04psw5MtyRZVfkWZ1Dty810CXm1cqaMswGgJQ0lsRsM4g+dnQWSBUvVsQvk/BnbiqPS+HTKYUNxcARLtn5UvlA6L7CPAp7VWGkUtY0r79oAlQau0CDtZ0VatZyW7d8u7mRfOcl+1UBF2dyw73rU80TIXTj+4BKIY0awqJSzVLvtPTX5hBQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.118.233) smtp.rcpttodomain=lists.linux.dev smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=UnwT+JGKorDXJSzlburW0oB/5SMlM+2g5CIL12JFevk=;
 b=ZJ8BE+XTtMjIek2D6o9YIHWBSkApGmcPjHsJ7II70glGJBHBY2l1gcXU1DAv7/5Asq7Zzd5YaBMocYOoejcAZ2hy1koIa2n+C5JWqqeFl8g3xo9HNro7PRIkFyeYQs5W0htSvYs0g2ocpkbDYHrH5evPElZa8is6ZFJGCImjnqM9DTJVpzWZ2EOd+Zf8MdrVnVjQipMNsboCrxKs6Nu+nbHZaheZ9ebPfoESkMzl06a+3/MaE4lNcDUj55D8tGaSR64PF0HwjEqlWhk85srFZxdAEaC2Rmn1c5YpZvzwrPG/kakyWPIaUW4Uo87PTcrGldEB23rYOSxFSrRYWAr4Ww==
Received: from PH2PEPF00003859.namprd17.prod.outlook.com (2603:10b6:518:1::7b)
 by IA1PR12MB6330.namprd12.prod.outlook.com (2603:10b6:208:3e4::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8722.23; Fri, 9 May
 2025 03:03:18 +0000
Received: from SN1PEPF000397B2.namprd05.prod.outlook.com
 (2a01:111:f403:f90f::3) by PH2PEPF00003859.outlook.office365.com
 (2603:1036:903:48::3) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8699.30 via Frontend Transport; Fri,
 9 May 2025 03:03:18 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.118.233)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.118.233 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.118.233; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.118.233) by
 SN1PEPF000397B2.mail.protection.outlook.com (10.167.248.56) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8722.18 via Frontend Transport; Fri, 9 May 2025 03:03:18 +0000
Received: from drhqmail203.nvidia.com (10.126.190.182) by mail.nvidia.com
 (10.127.129.6) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.4; Thu, 8 May 2025
 20:03:12 -0700
Received: from drhqmail203.nvidia.com (10.126.190.182) by
 drhqmail203.nvidia.com (10.126.190.182) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14; Thu, 8 May 2025 20:03:11 -0700
Received: from Asurada-Nvidia.nvidia.com (10.127.8.14) by mail.nvidia.com
 (10.126.190.182) with Microsoft SMTP Server id 15.2.1544.14 via Frontend
 Transport; Thu, 8 May 2025 20:03:09 -0700
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
Subject: [PATCH v4 06/23] iommufd/driver: Add iommufd_struct_destroy to revert iommufd_viommu_alloc
Date: Thu, 8 May 2025 20:02:27 -0700
Message-ID: <fd387a4e4efda1905e270d28986e4563dfee52d5.1746757630.git.nicolinc@nvidia.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1746757630.git.nicolinc@nvidia.com>
References: <cover.1746757630.git.nicolinc@nvidia.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-NV-OnPremToCloud: AnonymousSubmission
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN1PEPF000397B2:EE_|IA1PR12MB6330:EE_
X-MS-Office365-Filtering-Correlation-Id: 4b41103f-d2b5-41e6-9990-08dd8ea60c9a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|7416014|376014|1800799024|82310400026|36860700013;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?f24G195WUDEJsSKmZBluvpclbhxwWYZU0PdAR2bU/r5lx9S94BzNA1C4bxNi?=
 =?us-ascii?Q?oemCl71eJElg104tUQ+kjjEZJUyV7SBz/AQHwFR+HMGpxtFVNoLtRU6QBE8s?=
 =?us-ascii?Q?ZSK2xIT45+TCXRZEJFFkbL9G7mtmklWyGXSSMnsCuea2fvdRTdeMczYXApDf?=
 =?us-ascii?Q?BCMjBZPOwbOB5/pJNyEWooxhVlOkxg0/z2rVI95GuGUfNnGRcdVXd9ZTKK7J?=
 =?us-ascii?Q?eO25Cx/VpSwwmUldLXDao1cZjT741b6fJLBpFmJAdpjoVLEIAsGFBcq2Lm48?=
 =?us-ascii?Q?4BYSJSaD3HF1zdkdYgz0FTub3FBfk+3VmHA8k7xe/vnYqcoz6iaYuX552F28?=
 =?us-ascii?Q?AY+2f12zrmUO1oED5o8zUDDIXF1XBvG/8lg7YZal7JfkCp5fCokDAB4fqbVY?=
 =?us-ascii?Q?B3os9FGi54BKuqIeK1D//NTUMtyVlhuD0rMjZSUcTGaCtEvU1MzE2xxNV3Sc?=
 =?us-ascii?Q?S6OF7Mbo8tyDSk0TqGMfNZzi18QiecXcDyikMzvE4Ckojt2KsACwu4UQB6tN?=
 =?us-ascii?Q?D8quUX7oNW4YQi3M56AZzk3GAD3df7hv1mCt0XDnMo3Iqni6JH+UJVpZ1k7Z?=
 =?us-ascii?Q?/2T/BC5jiu8uZvHItcZiEirs0JTqzcVlq5fcDK5dNRvSxctVLnB//mmBccQq?=
 =?us-ascii?Q?pPRR+Z9UR8Oseh3AO4/MMkQj5II+Hp+THTOJYOe5DLQfYoiO2yrsNiZQUQ/C?=
 =?us-ascii?Q?tiaq1xy4ZGu8e4UwF2erbHvbZU+CVuElqDHpHmZb+MlliQ0g/gAvh01Hor8P?=
 =?us-ascii?Q?BPsuG911m1xCuITbnXE6FhNNMdnI5AcWRiVqPehp5MwCIx5aThn0n4rV4hq2?=
 =?us-ascii?Q?yd4tQUiqODlSKzHWyFAI0LIoTm+WQwQL7ys19ncGAoP8DEegQjj78dqqCRiu?=
 =?us-ascii?Q?OdlSYOtd/yC+9pNDQBrzDU3Q5IIpnZPWlqyY+YAWy1QtBRKjPXznvSUHpz+D?=
 =?us-ascii?Q?xSyfU6f7ytyl3R9HfXban9RwXzOg2N2Pnfq+tcDBWvQn6T0f3InvXQvb1NHU?=
 =?us-ascii?Q?RQaEmWpAomoEHXWsCV2UEIbURGN1GJfnqhVCUW8NMT5fshItiGCd3qNwpwU/?=
 =?us-ascii?Q?kf2tsbQ+muRyW4zTtXNIwqSK8IPCWYSXa7gw1QHT79q+jBW/ViiEBaH/xhTt?=
 =?us-ascii?Q?WRZ5zJM28e9fRwaW7esRDzghhhYDkpLWbF2OHkL7LWo+SIUNKunKD7b+vrex?=
 =?us-ascii?Q?AiSbjXrlqx5wSYpcfjjGryWV/DjzY7Zn7AfXcXgqyTe7+3lwPSd2s3w3VQuL?=
 =?us-ascii?Q?5BgE/j46kTDC2+EMWjwrw6OjA8ygPWWrOaV0hJ+0KpY+yHSr4b0r7QsYV8bn?=
 =?us-ascii?Q?ch0VMiEOeXLLL/XAMUtQxaktrcHzLo3Ea15ns0oXVDj65ug8Qa6+4+v/4vNd?=
 =?us-ascii?Q?fwQHuP4Ht/XIzwPWJekqMsIUy1EQQyUnQQH/NNuAidawxilisGHDrCvLXXSC?=
 =?us-ascii?Q?AYFsNvoCRacG00W6XpClObhGDcFIfYZSDvY2+RQWwdajUOEfkC/Dfcuu28aX?=
 =?us-ascii?Q?XHtsGlCXFiU/bjWSIe98iFYhMBob4agT0sbX?=
X-Forefront-Antispam-Report: CIP:216.228.118.233;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc7edge2.nvidia.com;CAT:NONE;SFS:(13230040)(7416014)(376014)(1800799024)(82310400026)(36860700013);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 May 2025 03:03:18.2143
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 4b41103f-d2b5-41e6-9990-08dd8ea60c9a
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.118.233];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: SN1PEPF000397B2.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR12MB6330
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250508_200328_052450_F0A38DD0 
X-CRM114-Status: GOOD (  16.60  )
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

An IOMMU driver that allocated a vIOMMU may want to revert the allocation,
if it encounters an internal error after the allocation. So, there needs a
destroy helper for drivers to use. For instance:

static my_viommu_alloc()
{
	...
	my_viommu = iommufd_viommu_alloc(viomm, struct my_viommu, core);
	...
	ret = init_my_viommu();
	if (ret) {
		/* Need to destroy the my_viommu->core */
		return ERR_PTR(ret);
	}
	return &my_viommu->core;
}

Move iommufd_object_abort() to the driver.c file and the public header, to
introduce common iommufd_struct_destroy() helper that will abort all kinds
of driver structures, not confined to iommufd_viommu but also the new ones
being added in the future.

Reviewed-by: Jason Gunthorpe <jgg@nvidia.com>
Reviewed-by: Lu Baolu <baolu.lu@linux.intel.com>
Signed-off-by: Nicolin Chen <nicolinc@nvidia.com>
---
 drivers/iommu/iommufd/iommufd_private.h |  1 -
 include/linux/iommufd.h                 | 16 ++++++++++++++++
 drivers/iommu/iommufd/driver.c          | 14 ++++++++++++++
 drivers/iommu/iommufd/main.c            | 13 -------------
 4 files changed, 30 insertions(+), 14 deletions(-)

diff --git a/drivers/iommu/iommufd/iommufd_private.h b/drivers/iommu/iommufd/iommufd_private.h
index 5c69ac05c029..8d96aa514033 100644
--- a/drivers/iommu/iommufd/iommufd_private.h
+++ b/drivers/iommu/iommufd/iommufd_private.h
@@ -180,7 +180,6 @@ static inline void iommufd_put_object(struct iommufd_ctx *ictx,
 		wake_up_interruptible_all(&ictx->destroy_wait);
 }
 
-void iommufd_object_abort(struct iommufd_ctx *ictx, struct iommufd_object *obj);
 void iommufd_object_abort_and_destroy(struct iommufd_ctx *ictx,
 				      struct iommufd_object *obj);
 void iommufd_object_finalize(struct iommufd_ctx *ictx,
diff --git a/include/linux/iommufd.h b/include/linux/iommufd.h
index dc6535e848df..f6f333eaaae3 100644
--- a/include/linux/iommufd.h
+++ b/include/linux/iommufd.h
@@ -213,6 +213,7 @@ static inline int iommufd_vfio_compat_set_no_iommu(struct iommufd_ctx *ictx)
 struct iommufd_object *_iommufd_object_alloc(struct iommufd_ctx *ictx,
 					     size_t size,
 					     enum iommufd_object_type type);
+void iommufd_object_abort(struct iommufd_ctx *ictx, struct iommufd_object *obj);
 struct device *iommufd_viommu_find_dev(struct iommufd_viommu *viommu,
 				       unsigned long vdev_id);
 int iommufd_viommu_get_vdev_id(struct iommufd_viommu *viommu,
@@ -228,6 +229,11 @@ _iommufd_object_alloc(struct iommufd_ctx *ictx, size_t size,
 	return ERR_PTR(-EOPNOTSUPP);
 }
 
+static inline void iommufd_object_abort(struct iommufd_ctx *ictx,
+					struct iommufd_object *obj)
+{
+}
+
 static inline struct device *
 iommufd_viommu_find_dev(struct iommufd_viommu *viommu, unsigned long vdev_id)
 {
@@ -285,4 +291,14 @@ static inline int iommufd_viommu_report_event(struct iommufd_viommu *viommu,
 		}                                                              \
 		ret;                                                           \
 	})
+
+/* Helper for IOMMU driver to destroy structures created by allocators above */
+#define iommufd_struct_destroy(drv_struct, member)                             \
+	({                                                                     \
+		static_assert(__same_type(struct iommufd_object,               \
+					  drv_struct->member.obj));            \
+		static_assert(offsetof(typeof(*drv_struct), member.obj) == 0); \
+		iommufd_object_abort(drv_struct->member.ictx,                  \
+				     &drv_struct->member.obj);                 \
+	})
 #endif
diff --git a/drivers/iommu/iommufd/driver.c b/drivers/iommu/iommufd/driver.c
index 922cd1fe7ec2..7980a09761c2 100644
--- a/drivers/iommu/iommufd/driver.c
+++ b/drivers/iommu/iommufd/driver.c
@@ -36,6 +36,20 @@ struct iommufd_object *_iommufd_object_alloc(struct iommufd_ctx *ictx,
 }
 EXPORT_SYMBOL_NS_GPL(_iommufd_object_alloc, "IOMMUFD");
 
+/* Undo _iommufd_object_alloc() if iommufd_object_finalize() was not called */
+void iommufd_object_abort(struct iommufd_ctx *ictx, struct iommufd_object *obj)
+{
+	XA_STATE(xas, &ictx->objects, obj->id);
+	void *old;
+
+	xa_lock(&ictx->objects);
+	old = xas_store(&xas, NULL);
+	xa_unlock(&ictx->objects);
+	WARN_ON(old != XA_ZERO_ENTRY);
+	kfree(obj);
+}
+EXPORT_SYMBOL_NS_GPL(iommufd_object_abort, "IOMMUFD");
+
 /* Caller should xa_lock(&viommu->vdevs) to protect the return value */
 struct device *iommufd_viommu_find_dev(struct iommufd_viommu *viommu,
 				       unsigned long vdev_id)
diff --git a/drivers/iommu/iommufd/main.c b/drivers/iommu/iommufd/main.c
index 3df468f64e7d..2b9ee9b4a424 100644
--- a/drivers/iommu/iommufd/main.c
+++ b/drivers/iommu/iommufd/main.c
@@ -51,19 +51,6 @@ void iommufd_object_finalize(struct iommufd_ctx *ictx,
 	WARN_ON(old != XA_ZERO_ENTRY);
 }
 
-/* Undo _iommufd_object_alloc() if iommufd_object_finalize() was not called */
-void iommufd_object_abort(struct iommufd_ctx *ictx, struct iommufd_object *obj)
-{
-	XA_STATE(xas, &ictx->objects, obj->id);
-	void *old;
-
-	xa_lock(&ictx->objects);
-	old = xas_store(&xas, NULL);
-	xa_unlock(&ictx->objects);
-	WARN_ON(old != XA_ZERO_ENTRY);
-	kfree(obj);
-}
-
 /*
  * Abort an object that has been fully initialized and needs destroy, but has
  * not been finalized.
-- 
2.43.0


