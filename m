Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 82DF3CF2564
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 19 Nov 2025 00:53:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Svzub6DeZ2jA3O3RdEx2V+Smcw0K4U3C6DATv57Flio=; b=v7uVu9+vfaGu1Yv2tMg85VY6it
	EZ6KQEh0jbUdHNybviWsEKjsOWXkDp99D94FSXgBnBV+71fbM/uwfXI5PmqtV966rTbMP/bO2Cav3
	7kNlYJ+LcRzy7+AC6TI5pFhXKcMOemtG9vOeEQKrSQ9cDxM5ljcW0qJj5mV6jMIt5LUhVuoI1YBQ4
	CvTs47eyyibrBqRhDGv76f3FqK0RhywAuigzTEafiiVAy50rvSyRdQUIslnRbDt/V3RqKNh2T8X9N
	R7nuMpyOeA3DkZ8He4oj6kC5qAlX5JPE0JW6gHx4H7KOHrIa8TQXtwAWTfRR8U7PpHM3UE9th3L9R
	2DoAG/rg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vLWRW-00000001JgS-08KS;
	Wed, 19 Nov 2025 00:53:06 +0000
Received: from mail-westcentralusazlp170100005.outbound.protection.outlook.com ([2a01:111:f403:c112::5] helo=CY7PR03CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vLWRQ-00000001JdP-0CQW
	for linux-arm-kernel@lists.infradead.org;
	Wed, 19 Nov 2025 00:53:01 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=DaJsxiWiSpl9BC5ksStoOl09mqsYNV5W4tv6cw9wQOvB3OgCE9UzbAn4aMJLsKyJDJWvu/d1KxywvGVnngzTSjXdrdz81lv4LzXA0CN58fjxq1eHi+O/kcfdzJqcOIv8oJONfIThqd6JUl/gxdpGXY7Cdk/jtGm8NpHh0iSXsRaz5nRnxbz1iAhhMxDS3sbF9ikKSr2gMRNOutNsnFH51/3W5IWcMGDoRzL2E26hGuaOMNdcvlsiqmwT/IkNhgTwxrjFJjj5fVh+qxLmJngIIEbgH8STWQbZ+zbbaibJ8Oho0VSBr/I3R99EJDYmQBxux4owTzHK+B8jWkohbLwsWQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Svzub6DeZ2jA3O3RdEx2V+Smcw0K4U3C6DATv57Flio=;
 b=deNxynnsh4t95Kl6Lqrx2ErU7be/QlH1nDx+shKgv+gq/x7LHdGlB745BWQ6HMsmyi1woDLMPl7BYTYFPJ0a/O0AFxX8nbFLKSUk1cDRd4jIZFNbcQ1ZBOKN2YGmf4LHCYU8XljQmsqjtGVvKIRjvM5aNrMTNKO+39cAQgH62ZSjEPsE0/bso/USFfoyAQq74l4MZU46HYK60nBkNl7wI2M6X5vZy1tDaUx/Y9WT5XhySVx0Xr9I21671nXOZTyWy61dcYOGH9YfxC8L2XsZ9H+WrGF8wf8amwUSpmSda0BjPARts0MQMvTWmtTZXXhhdKnzv1xPCbK7al8FDN7hiQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.160) smtp.rcpttodomain=arm.com smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Svzub6DeZ2jA3O3RdEx2V+Smcw0K4U3C6DATv57Flio=;
 b=syb/ozyQ3RtGiBn3PgXPELQom7UjIPAKpABokHG7GGh6exAjeQqjbG3fiO9B8cn27/1oETZQ1bA04SGO3ixrUQVUMFYIvr6GMGo4Hf+JF0qsNUuwDA+MpXWXB7WIFbF5uvjyVujtB6dZ6GarZkgD84fxGJrXX88A1jtf/Rirxzxge4F1SnSVYAzslEmD86rmRJulywro0HCiBuGXrYCSArmOicXygP3EGBVQI0SWGCqEywTjJu2hkv9Dsh+d8T8XnGjeOoDZ0xLhdIA+rZzE2+4gRZEyZdrrLAtAZiA5loKqQSw6nrdIQFtz+5TJp1FuHauqvTtX5rsix7TUJkJGFg==
Received: from MN2PR07CA0008.namprd07.prod.outlook.com (2603:10b6:208:1a0::18)
 by IA0PPF8CAB220A1.namprd12.prod.outlook.com (2603:10b6:20f:fc04::bd9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9320.22; Wed, 19 Nov
 2025 00:52:50 +0000
Received: from BL02EPF0001A102.namprd05.prod.outlook.com
 (2603:10b6:208:1a0:cafe::fc) by MN2PR07CA0008.outlook.office365.com
 (2603:10b6:208:1a0::18) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9343.10 via Frontend Transport; Wed,
 19 Nov 2025 00:52:50 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.160)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.160 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.160; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.160) by
 BL02EPF0001A102.mail.protection.outlook.com (10.167.241.134) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9343.9 via Frontend Transport; Wed, 19 Nov 2025 00:52:49 +0000
Received: from rnnvmail203.nvidia.com (10.129.68.9) by mail.nvidia.com
 (10.129.200.66) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Tue, 18 Nov
 2025 16:52:29 -0800
Received: from rnnvmail205.nvidia.com (10.129.68.10) by rnnvmail203.nvidia.com
 (10.129.68.9) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Tue, 18 Nov
 2025 16:52:29 -0800
Received: from Asurada-Nvidia.nvidia.com (10.127.8.11) by mail.nvidia.com
 (10.129.68.10) with Microsoft SMTP Server id 15.2.2562.20 via Frontend
 Transport; Tue, 18 Nov 2025 16:52:27 -0800
From: Nicolin Chen <nicolinc@nvidia.com>
To: <robin.murphy@arm.com>, <joro@8bytes.org>, <afael@kernel.org>,
	<bhelgaas@google.com>, <alex@shazbot.org>, <jgg@nvidia.com>,
	<kevin.tian@intel.com>
CC: <will@kernel.org>, <lenb@kernel.org>, <baolu.lu@linux.intel.com>,
	<linux-arm-kernel@lists.infradead.org>, <iommu@lists.linux.dev>,
	<linux-kernel@vger.kernel.org>, <linux-acpi@vger.kernel.org>,
	<linux-pci@vger.kernel.org>, <kvm@vger.kernel.org>,
	<patches@lists.linux.dev>, <pjaroszynski@nvidia.com>, <vsethi@nvidia.com>,
	<helgaas@kernel.org>, <etzhao1900@gmail.com>
Subject: [PATCH v6 3/5] iommu: Add iommu_driver_get_domain_for_dev() helper
Date: Tue, 18 Nov 2025 16:52:09 -0800
Message-ID: <9d6255cd948df17770dd9a3d95a721d0e3ea7466.1763512374.git.nicolinc@nvidia.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1763512374.git.nicolinc@nvidia.com>
References: <cover.1763512374.git.nicolinc@nvidia.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-NV-OnPremToCloud: ExternallySecured
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL02EPF0001A102:EE_|IA0PPF8CAB220A1:EE_
X-MS-Office365-Filtering-Correlation-Id: 6d0f52ae-739b-4649-d8e1-08de2705f697
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|7416014|376014|1800799024|36860700013|82310400026;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?+h/xWhNj1oQvMhUqxZcq5aD4PCr468KC/p8DkPpzisNZIUpllbLclFO2QM+I?=
 =?us-ascii?Q?UNXGNtwWIGbrjCnn1ZhtBD50YErSHkOtQfR7IC52+KjAWS7OHYsdb9E7gcoL?=
 =?us-ascii?Q?Xwkf0IF/qB7MCLsdBrm83K3Nvzpo4wKOvpFIVqe8hIxS0dYVioURqdTZCiIu?=
 =?us-ascii?Q?FyZGdazfwSzJ2Yc9+33ApWH1uwCktV/JSe4SDlxbCZE6Dj5B4BKE9Z1d5/X4?=
 =?us-ascii?Q?WV3x0FItcuVjXTs5V1yxj7nBVuxxReXfEhLxhxxEx/iWKQeNfDFIM34um3kZ?=
 =?us-ascii?Q?ptEwyRnjifvXQEE1urGEq675MFg14qikLVBsf5jaokLqaeXIE3kZiICruukA?=
 =?us-ascii?Q?WQbn7pzv8Torb/INw3cMCiwK5k5HZINwdCr5Fqg65WWVHRQWAUFxwN0MmSMQ?=
 =?us-ascii?Q?sd29ZIpa3M6Ejtoz9x013HlNicOxfeCe6ap+Op0C2L+75TtsNS+bGqGYdeFY?=
 =?us-ascii?Q?IISy1Oo+Lc3ZrJKEIITuRd/b2VXWRrqHmClANi14YtBlhO1psaG85fyxGCDb?=
 =?us-ascii?Q?8rzSl81iTRuOQTS2SJOAEnf7Apu4CsFWtmJFu5xITmdCGwJw82O1vo3ofWm3?=
 =?us-ascii?Q?1+NUN7ufSRfRftiCfn09DgGgfZ91xXjkrKDzFaxiC4Fk+PjLqeJ1i8we4700?=
 =?us-ascii?Q?l+pOLx1W9UAnln1hSKKumC870O45Vsl5h2ITx0EGJYftSr9vlsUc/2dw7A0E?=
 =?us-ascii?Q?D3JjZKAhOXz5B6sH9TzWl0coinSUMA2MKnBcnwhZW52ADbQmxUnH0tWEcxhu?=
 =?us-ascii?Q?0NGwDkUALyfpCgnNbp9RKda5Pi3ToWb6RSbRhVYAkDcpq4CsPLYTPL9J6fou?=
 =?us-ascii?Q?JiPvRFsHMCPl1giPiFlhLMd067kRoDXhpcABTQHX2PDZeOzNZGX7D4Il/zKc?=
 =?us-ascii?Q?O3aGEQ/t8Kth1jerH++lsfod6bwmkJwdBysudyaa7OX7rR8D6NsL80VQsi0y?=
 =?us-ascii?Q?GNfg1w0NvY9NbWrhiY9S+bLjkUO42KWPiyiuMSxdcuuEbXvV2Wz8G+hoM2UG?=
 =?us-ascii?Q?Hz7NtpNSush491RXArx6iHxe1pRUKmUq7lkP04eBzFAawMcMrcPYCWHXruM4?=
 =?us-ascii?Q?7lAKv3gjs4ykATySpceJPFA3fJCEh80k39NIYu6sIpVpZbU0div3D3IB0jpP?=
 =?us-ascii?Q?X2m2j4itDj2Srmj73zlzaJkrfVFEsbe8oP29mKP0kZiTUIvvDU9zACqbE1f8?=
 =?us-ascii?Q?0O2A8G6P8opiCDHzgVs7a8Us0NdkgmFowqoUhutg0ZqENxo00c5si2DGT2G0?=
 =?us-ascii?Q?+kiDArFyWAUsCj6Df6kQ7MtdAxw1PGHEjGiC+ifqK/ZWSbUOD6CqksNhTZvf?=
 =?us-ascii?Q?iyRXwcSMSsfXDJHERlFLG+WX6uvT1hdSPkSzQOhzsXPwfq86mJzJ0CuGzYiz?=
 =?us-ascii?Q?K8I24EX0zLNFtxirS3E89b9h818rzHQETYo3+RsUaN+bPwrDiY34Ca/1ADsn?=
 =?us-ascii?Q?5VbzmslotDRJGZruvckSsvAkLoUixM/4FXjmpvK9B5XCAPFX+tkuNUIP9Yeb?=
 =?us-ascii?Q?+OC+UZ7mcCEAfEtLCcPx8OWUjgmYzc4ybfo3d9HfV7qOWAaIpu/unkqI8TKH?=
 =?us-ascii?Q?+cOeKV3+egSC4BYMLXU=3D?=
X-Forefront-Antispam-Report: CIP:216.228.117.160;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge1.nvidia.com;CAT:NONE;SFS:(13230040)(7416014)(376014)(1800799024)(36860700013)(82310400026);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Nov 2025 00:52:49.6608
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 6d0f52ae-739b-4649-d8e1-08de2705f697
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.160];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: BL02EPF0001A102.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PPF8CAB220A1
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251118_165300_101559_6241A0DC 
X-CRM114-Status: GOOD (  21.80  )
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

There is a need to stage a resetting PCI device to temporarily the blocked
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
Reviewed-by: Lu Baolu <baolu.lu@linux.intel.com>
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
index 1e322f87b1710..672597100e9a0 100644
--- a/drivers/iommu/iommu.c
+++ b/drivers/iommu/iommu.c
@@ -2217,6 +2217,15 @@ void iommu_detach_device(struct iommu_domain *domain, struct device *dev)
 }
 EXPORT_SYMBOL_GPL(iommu_detach_device);
 
+/**
+ * iommu_get_domain_for_dev() - Return the DMA API domain pointer
+ * @dev: Device to query
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
+ * @dev: Device to query
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


