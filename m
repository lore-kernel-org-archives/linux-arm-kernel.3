Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 42976CCFA18
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 11 Nov 2025 05:13:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=CeTnDrRewlGXBBExoSBfPbm0fdnb+MekRuq+PT+y15o=; b=d9T4OtWpItN+Gf+D58/8svlxYn
	/RVj05Y4CiuXdEBi/9jtyZBmFhHE8vGfXCAeEvM8VP70oKkDPYG+LVUynE1+stMR731w873q88WzK
	f1BIo7+qgCsdzey1s7xnXVEgFL+BV/MX9ekJr1UoFI84S0Kg20mDxrC4DJCQq/sVi+EW0Hu8MyVLg
	m7IfwQr1TtA8DFG8ChrYt990x9g8BKtoQfIqtxGCL4p0OWEwJUtHtIO577E9aY4Q/2h3INDJmnf8Q
	f/h6P49J1983chsYagknCF8t0gXaA/DJfkpaSLiqjbkFsBzSFzzDlF97B1JphLHWsF5nGUQ6ufPNn
	svtOrB4w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vIghI-00000006Xy1-0i1M;
	Tue, 11 Nov 2025 05:13:40 +0000
Received: from mail-westus2azon11012014.outbound.protection.outlook.com ([52.101.48.14] helo=MW6PR02CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vIghD-00000006XuR-20rA
	for linux-arm-kernel@lists.infradead.org;
	Tue, 11 Nov 2025 05:13:38 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=cBNVrH2sHOAMD6Cx/GNccpZ63LEjDZmkPK/bdKd+NA4hcdaejzmwJ9Vq/6OLeIr96dcf2XUfWZftIcNhOQJJe8PumlqjJEo85Qtxu0Lx4jjuHbek1dKPgigyf6JD2XVsQdSmggg9ctlWv+vvIaC4QI5VVf7pN5yTqBWfusP4H2WRj1cO2hX5ROIbpE41i6SwN9pa2OBfIJrkrOddM8ZcNFDD23SiO1C3NYdCEJlNEXxR50/NhxsQYIaQI54J/2XMBTBOutz5zkSKRl7ZpjhKYpIv41nMGQzR3Gw2gFP58Qs5fdSNU+WYAxE7Ifiee8vsSuUubZmX7snsJOCGI+OuAw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=CeTnDrRewlGXBBExoSBfPbm0fdnb+MekRuq+PT+y15o=;
 b=vnEPQ2tLjjuVAvr9IYM5FIN8F3AtlpGIsPUYT8XRrhvCs8H+K71GbgKMbDZ+dkx1YWLxcsS3tPvDap+bqj/JHqiPKvl/bvH+iGeNQrtmVl5WI1JgO0j33CSYqdgK7prSgvUnL5n6UsJB9LSGGI/LNgN2MY7FHFzJnTW0bIIgVdennS4OaK0kma6MeP1RARpbSCfwtex9eTjKoKBeKg/V4WHkVlYL4XtUCMInQIdHsSSzLZYQeWLy5XcazQYZoG2VVCWvYT2r7xUTPXBPsdUC2eiXl1B/c3p7+LsJCvxIxKJdnFgTq/6Ts++ubUL9R6UK1VXcEIo9bVn/T8xXm3BVaw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.160) smtp.rcpttodomain=8bytes.org smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=CeTnDrRewlGXBBExoSBfPbm0fdnb+MekRuq+PT+y15o=;
 b=M20OvABmxk42EZXhDvi+p/uXErURYYTY0bLUS4swQrECybDv9YenH3v9WD1LJVItQQyX55hBYBvWcaeJ+Xxx8PpNTgIpaKaBE/CUBrWdkizr5iWKW7VXg3rYj/e1w+cMr5bOBOf1yZUKEVjq52nwarlUirDPk881Uw+pa79fE+6dppqT8bml/NMuqmorQYuk0lXpWw5umF65TbafMbvOHHzflPVA23nU5NhOAjhr37Nog2dWMG2RAk36WOC4eD0JNlMs9UmcemW8eaU689Va95HQzuctS/rQRSGMWJfSUmQUbTzqE3yjDCdcy5uFIGFIeiALAwsfGYWKUcxUoSoh3A==
Received: from DM6PR01CA0016.prod.exchangelabs.com (2603:10b6:5:296::21) by
 DS7PR12MB5744.namprd12.prod.outlook.com (2603:10b6:8:73::18) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9298.13; Tue, 11 Nov 2025 05:13:28 +0000
Received: from DS3PEPF0000C37A.namprd04.prod.outlook.com
 (2603:10b6:5:296:cafe::21) by DM6PR01CA0016.outlook.office365.com
 (2603:10b6:5:296::21) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9298.16 via Frontend Transport; Tue,
 11 Nov 2025 05:13:28 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.160)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.160 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.160; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.160) by
 DS3PEPF0000C37A.mail.protection.outlook.com (10.167.23.4) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9320.13 via Frontend Transport; Tue, 11 Nov 2025 05:13:28 +0000
Received: from rnnvmail201.nvidia.com (10.129.68.8) by mail.nvidia.com
 (10.129.200.66) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Mon, 10 Nov
 2025 21:13:18 -0800
Received: from rnnvmail204.nvidia.com (10.129.68.6) by rnnvmail201.nvidia.com
 (10.129.68.8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Mon, 10 Nov
 2025 21:13:18 -0800
Received: from Asurada-Nvidia.nvidia.com (10.127.8.11) by mail.nvidia.com
 (10.129.68.6) with Microsoft SMTP Server id 15.2.2562.20 via Frontend
 Transport; Mon, 10 Nov 2025 21:13:16 -0800
From: Nicolin Chen <nicolinc@nvidia.com>
To: <joro@8bytes.org>, <afael@kernel.org>, <bhelgaas@google.com>,
	<alex@shazbot.org>, <jgg@nvidia.com>, <kevin.tian@intel.com>
CC: <will@kernel.org>, <robin.murphy@arm.com>, <lenb@kernel.org>,
	<baolu.lu@linux.intel.com>, <linux-arm-kernel@lists.infradead.org>,
	<iommu@lists.linux.dev>, <linux-kernel@vger.kernel.org>,
	<linux-acpi@vger.kernel.org>, <linux-pci@vger.kernel.org>,
	<kvm@vger.kernel.org>, <patches@lists.linux.dev>, <pjaroszynski@nvidia.com>,
	<vsethi@nvidia.com>, <helgaas@kernel.org>, <etzhao1900@gmail.com>
Subject: [PATCH v5 3/5] iommu: Add iommu_driver_get_domain_for_dev() helper
Date: Mon, 10 Nov 2025 21:12:53 -0800
Message-ID: <0303739735f3f49bcebc244804e9eeb82b1c41dc.1762835355.git.nicolinc@nvidia.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1762835355.git.nicolinc@nvidia.com>
References: <cover.1762835355.git.nicolinc@nvidia.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-NV-OnPremToCloud: ExternallySecured
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS3PEPF0000C37A:EE_|DS7PR12MB5744:EE_
X-MS-Office365-Filtering-Correlation-Id: 87e8d29e-3df7-43a9-757c-08de20e10c9f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|7416014|82310400026|36860700013|1800799024;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?FotMdHZeDkXht+OmWkhBQprgOoBTWD9UYDgMBXTp6QYOr+E+l/BTHZ0rqU3b?=
 =?us-ascii?Q?TAKluIsskF0RKYVUR75WaxQ1X12C7RpuANLUAUkaCMKGX13K9kc48Y52FJEp?=
 =?us-ascii?Q?n2rVv8ZkwYA0hR9ggapGKpgZnWaKM8PZP4A78UiIa9o/q4oHeY0ZFBzDPavv?=
 =?us-ascii?Q?Ng7Qb+kSNpHl+xx++4yuFfqxyd+W4/bFvpgiDjp1n98dzDqgUYWFcnqpGGxA?=
 =?us-ascii?Q?do4FEsUu7FeOVprepuMuNaJeVAOJHolkM1biFDe9bH1I2o/IOKDf2vkz3ysM?=
 =?us-ascii?Q?U1mC3g2G+RfrwR9A2XgT/V5Whx356EizxBgv/Bnm7AonoGaSD0mS4bSVSu5P?=
 =?us-ascii?Q?Bs18r+bFAs5BFOqTjP94eY/M+x+F7rt9puqpzCRdxJSDStYrJMVDDe1C695d?=
 =?us-ascii?Q?B9fL/8b+EDJgLFiSTABLPSS06q7SJSQEIHexJH0yPIwwqsbcZm5YnyKiNIpr?=
 =?us-ascii?Q?bRVeysLvh5fqnBvCIr1mY15fJISRUTlcFQkGGLWFstMFzdRUn0+csAkvCShZ?=
 =?us-ascii?Q?hmmL+eU6Ra1znitWTJBxWuYXqsr5TxIoBVIY5b5asuce2/cMB2o6VBUcOE3X?=
 =?us-ascii?Q?UBWORUb+Sg8TFk1e1b6+3N4WoOrXGSXLhpMqaKi5Bw5mlQaf07yTCE7j4GD2?=
 =?us-ascii?Q?XOvqe+oFqFihYMySrmWW89umMpLtMIayJ1yCQprdZbWMvT34ni9YafK+uVKK?=
 =?us-ascii?Q?bta26wQ+JcrGgFee7qbIXcVMmKCpI3fgFOWf7sdiLNDJpE6jgx+iqPc+FQUE?=
 =?us-ascii?Q?aEeSTWPklw05nz9mg91LgdvyuCNaZOymjYd310mmnpA2cJz7YgHRbWLKO7fz?=
 =?us-ascii?Q?xak4Xmc3kiyGyUrmB+G1rMIUnEJxDuoBH0BgZygP7bT65LbsvrFtjA8BhUmR?=
 =?us-ascii?Q?/TDEtSGDJh+M3jlVZznOhTMytwhBgZQR80hr8tbcurUNrXzDj7diY0H2d9SV?=
 =?us-ascii?Q?7b3jjFJeOe0a+ZKOSG62TEbCm+t1tsQvlfWrjRg+X17d/DfT5peJ3hNEWnxX?=
 =?us-ascii?Q?Vj2QxIcYgQQjOk4mpvnCKvQmx4/PdGl8xNvXs+phBQhwq2fx/Ym9iExdlb5I?=
 =?us-ascii?Q?v2i/ldos+TFsZcKvDuIPdObD+zly4DK5GQ4u3ofcmnsC6OsP13JvS64GPjT1?=
 =?us-ascii?Q?YttosLOPmb9AY4LKwLg4rE64PKhi9wNkIka+Q/uGhFuNqOhH5R1ZRefIm+fs?=
 =?us-ascii?Q?4qE4x891qBgkN3QMNz+hQmwvTTgna2ARzaWzkXGCQj3xwX0Ntmb51/T7yZlC?=
 =?us-ascii?Q?3Qvwxzai0D0r39BJqcuNWD93cr/qeXVSg47Uh/50femz90fEjAwqAcWRh7Gr?=
 =?us-ascii?Q?zvLuecJHEqPE+nXy5+Z6D1jV3VxpHt+Zucyb0MBsg0qkV2y3DqupIfN9pOwo?=
 =?us-ascii?Q?jVJUAGNg8eF8MDd/auYRh3KYn9X6obh6sgdjItdARNn2SeocNUVDye0TJAsO?=
 =?us-ascii?Q?P5vSW20esDesvT61FSy6z02n161h9fEg3i/8trbiJm9Q2aSn4EsCJWC4TOfk?=
 =?us-ascii?Q?r3seC5xm/o2iPFeP9dQMuiRM/utkeBAOzplBvnk432M/GDBMreLOMMteFqD+?=
 =?us-ascii?Q?XIKu68F8sEtUqDOzNSk=3D?=
X-Forefront-Antispam-Report: CIP:216.228.117.160;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge1.nvidia.com;CAT:NONE;SFS:(13230040)(376014)(7416014)(82310400026)(36860700013)(1800799024);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Nov 2025 05:13:28.3185
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 87e8d29e-3df7-43a9-757c-08de20e10c9f
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.160];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: DS3PEPF0000C37A.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR12MB5744
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251110_211335_570037_E4DC6F9A 
X-CRM114-Status: GOOD (  20.45  )
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

There is a need to stage a resetting PCI device to temporally the blocked
domain and then attach back to its previously attached domain after reset.

This can be simply done by keeping the "previously attached domain" in the
iommu_group->domain pointer while adding an iommu_group->resetting_domain,
which gives troubles to IOMMU drivers using the iommu_get_domain_for_dev()
for a device's physical domain in order to program IOMMU hardware.

And in such for-driver use cases, the iommu_group->mutex must be held, so
it doesn't fit in external callers that don't hold the iommu_group->mutex.

Introduce a new iommu_driver_get_domain_for_dev() helper, exclusively for
driver use cases that hold the iommu_group->mutex, to separate from those
external use cases.

Add a lockdep_assert_not_held to the existing iommu_get_domain_for_dev()
and highlight that in a kdoc.

Reviewed-by: Kevin Tian <kevin.tian@intel.com>
Signed-off-by: Nicolin Chen <nicolinc@nvidia.com>
---
 include/linux/iommu.h                       |  1 +
 drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c |  5 ++--
 drivers/iommu/iommu.c                       | 28 +++++++++++++++++++++
 3 files changed, 32 insertions(+), 2 deletions(-)

diff --git a/include/linux/iommu.h b/include/linux/iommu.h
index 801b2bd9e8d49..a42a2d1d7a0b7 100644
--- a/include/linux/iommu.h
+++ b/include/linux/iommu.h
@@ -910,6 +910,7 @@ extern int iommu_attach_device(struct iommu_domain *domain,
 extern void iommu_detach_device(struct iommu_domain *domain,
 				struct device *dev);
 extern struct iommu_domain *iommu_get_domain_for_dev(struct device *dev);
+struct iommu_domain *iommu_driver_get_domain_for_dev(struct device *dev);
 extern struct iommu_domain *iommu_get_dma_domain(struct device *dev);
 extern int iommu_map(struct iommu_domain *domain, unsigned long iova,
 		     phys_addr_t paddr, size_t size, int prot, gfp_t gfp);
diff --git a/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c b/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c
index a33fbd12a0dd9..412d1a9b31275 100644
--- a/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c
+++ b/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c
@@ -3125,7 +3125,8 @@ int arm_smmu_set_pasid(struct arm_smmu_master *master,
 		       struct arm_smmu_domain *smmu_domain, ioasid_t pasid,
 		       struct arm_smmu_cd *cd, struct iommu_domain *old)
 {
-	struct iommu_domain *sid_domain = iommu_get_domain_for_dev(master->dev);
+	struct iommu_domain *sid_domain =
+		iommu_driver_get_domain_for_dev(master->dev);
 	struct arm_smmu_attach_state state = {
 		.master = master,
 		.ssid = pasid,
@@ -3191,7 +3192,7 @@ static int arm_smmu_blocking_set_dev_pasid(struct iommu_domain *new_domain,
 	 */
 	if (!arm_smmu_ssids_in_use(&master->cd_table)) {
 		struct iommu_domain *sid_domain =
-			iommu_get_domain_for_dev(master->dev);
+			iommu_driver_get_domain_for_dev(master->dev);
 
 		if (sid_domain->type == IOMMU_DOMAIN_IDENTITY ||
 		    sid_domain->type == IOMMU_DOMAIN_BLOCKED)
diff --git a/drivers/iommu/iommu.c b/drivers/iommu/iommu.c
index 1e322f87b1710..1f4d6ca0937bc 100644
--- a/drivers/iommu/iommu.c
+++ b/drivers/iommu/iommu.c
@@ -2217,6 +2217,15 @@ void iommu_detach_device(struct iommu_domain *domain, struct device *dev)
 }
 EXPORT_SYMBOL_GPL(iommu_detach_device);
 
+/**
+ * iommu_get_domain_for_dev() - Return the DMA API domain pointer
+ * @dev - Device to query
+ *
+ * This function can be called within a driver bound to dev. The returned
+ * pointer is valid for the lifetime of the bound driver.
+ *
+ * It should not be called by drivers with driver_managed_dma = true.
+ */
 struct iommu_domain *iommu_get_domain_for_dev(struct device *dev)
 {
 	/* Caller must be a probed driver on dev */
@@ -2225,10 +2234,29 @@ struct iommu_domain *iommu_get_domain_for_dev(struct device *dev)
 	if (!group)
 		return NULL;
 
+	lockdep_assert_not_held(&group->mutex);
+
 	return group->domain;
 }
 EXPORT_SYMBOL_GPL(iommu_get_domain_for_dev);
 
+/**
+ * iommu_driver_get_domain_for_dev() - Return the driver-level domain pointer
+ * @dev - Device to query
+ *
+ * This function can be called by an iommu driver that wants to get the physical
+ * domain within an iommu callback function where group->mutex is held.
+ */
+struct iommu_domain *iommu_driver_get_domain_for_dev(struct device *dev)
+{
+	struct iommu_group *group = dev->iommu_group;
+
+	lockdep_assert_held(&group->mutex);
+
+	return group->domain;
+}
+EXPORT_SYMBOL_GPL(iommu_driver_get_domain_for_dev);
+
 /*
  * For IOMMU_DOMAIN_DMA implementations which already provide their own
  * guarantees that the group and its default domain are valid and correct.
-- 
2.43.0


