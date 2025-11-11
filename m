Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D8661CCFA18
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 11 Nov 2025 05:13:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Api3QGiN1vZzzSxnCPcJpwGKKtv9U8wUa3/s+H4ug1I=; b=LZL7UkTXoTAtOf1v7xx3F4IC14
	aUkDya1K+GR9IrdCo/hL9rkr1gvf3GI92OUlo2RzC8rYHn66wh9menVFYw2lEilmHQNRZIyj74+Ic
	wiaEAu7gl2UuiLBw4zbb1Bhpbj5qj9iGfjVnHUFeqp29wvAiXloU7iPgeO83SEt+FM47WGmmfZuiL
	sJIXq0Fb76DSemQQ+eamMvl1VW0T1KHOy6fu0oIpltJvGG2ISCt1wH2McVPT5SF9zdulzYK1R6bmk
	H2iiTaEUWLpanXCAz1gXxV6Bt+eFYFr7po44qIao7JUANahqe+xERzzriMF/fQyW8LkyWME3ocvW/
	qYz4VTlw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vIghD-00000006Xuh-0YKF;
	Tue, 11 Nov 2025 05:13:35 +0000
Received: from mail-westus3azon11012034.outbound.protection.outlook.com ([40.107.209.34] helo=PH8PR06CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vIghA-00000006XtS-1b8u
	for linux-arm-kernel@lists.infradead.org;
	Tue, 11 Nov 2025 05:13:33 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=sfcOKtQW5mi4OKEaFzo8anSlvzNL/+tXBnZx2r5XemDNoVITBMuHRtCUhcvAuByOkSLmLEOSTL95bMzyI+uiwGagQKAEPGJokXrT614q/m3629JxMF7xNl4qmH5U9AK+mBwZguohK05kpdqi4dIRPNv8IoSPx9DusqjQYXyiAkUjgmuxiwDT9tYAHK5svn5IrzTHovQn8glOgm7eCbmSV/QN1VnF7j16lAzqkD73fVt3eZ+cpMBPKgYKIl6k5zX+nD4g4i0p6vuOyPxTFwIxiocEmTU5nQe23RFnNwBhwkbkcZoXWPetEuKbgln0oATPNeqax25IQMMgDsXNxYbozQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Api3QGiN1vZzzSxnCPcJpwGKKtv9U8wUa3/s+H4ug1I=;
 b=sebBY1Fc+Km9XCUKkCqbx7odEUy94sh9Qk3pHUMY7sdm4WjmxMkxId9t3U+nmRj19QVFPiKcE/tTt/H6DhZNOMfN+DpqPPI+D4d5mNqHYklvF2fbxoCJJg8px4VkygKSU62AojeDULp7tVhv4iFRFuIJpT4aUy2zGLYr+8VVaqwiuML2g1zWhTHlZIiAs2w86wLoRxJbE1cei3EBMZoAGNdBhP3pXNw3W96Qbs3q6f+pimSa4mlYti0/KZQlul5VRAcJD51pWrzKrDfEBNtDu1Resnd3di7/kwHihcMsuCPRyQiZva6ZZoBgwe/NoczStkqMmCtcxNoCWVzk4VfMfQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.160) smtp.rcpttodomain=8bytes.org smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Api3QGiN1vZzzSxnCPcJpwGKKtv9U8wUa3/s+H4ug1I=;
 b=Aqaw8UXj4MR8SBX3p/NzkEwWiAoE63zcqe95hL8pHnQCPEFGnSTLvNxOv8VFy4YFTnKHXi2TpWJ9m3Org3wN2nxd6Ylio1bXlr/2jYctrzasc3j8vskxdWJaJsv4XLHfxWl/Xmx+cPISnBKl4ICbGkT8uX55XP1i7FYAA70J/sFt1Alq424gp/Sd3ZyNl6UE5F+aahbO4mAcB4bf9EBgt9FvD0D9R0LE7T7oM5bRGDhPauluaoRA5p/84/qxGPFT7DotAipIshyvj5TFDLW0Usqx5HpTP14v2aKV8Qls3tDvpUe9oupgPPwvMIV9cBWWGDD2uebcEPJUhlQKii9fjg==
Received: from DS7PR03CA0002.namprd03.prod.outlook.com (2603:10b6:5:3b8::7) by
 DM4PR12MB5867.namprd12.prod.outlook.com (2603:10b6:8:66::18) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9298.16; Tue, 11 Nov 2025 05:13:25 +0000
Received: from DS3PEPF0000C381.namprd04.prod.outlook.com
 (2603:10b6:5:3b8:cafe::b2) by DS7PR03CA0002.outlook.office365.com
 (2603:10b6:5:3b8::7) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9298.16 via Frontend Transport; Tue,
 11 Nov 2025 05:13:09 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.160)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.160 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.160; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.160) by
 DS3PEPF0000C381.mail.protection.outlook.com (10.167.23.11) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9320.13 via Frontend Transport; Tue, 11 Nov 2025 05:13:25 +0000
Received: from rnnvmail201.nvidia.com (10.129.68.8) by mail.nvidia.com
 (10.129.200.66) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Mon, 10 Nov
 2025 21:13:16 -0800
Received: from rnnvmail204.nvidia.com (10.129.68.6) by rnnvmail201.nvidia.com
 (10.129.68.8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Mon, 10 Nov
 2025 21:13:16 -0800
Received: from Asurada-Nvidia.nvidia.com (10.127.8.11) by mail.nvidia.com
 (10.129.68.6) with Microsoft SMTP Server id 15.2.2562.20 via Frontend
 Transport; Mon, 10 Nov 2025 21:13:14 -0800
From: Nicolin Chen <nicolinc@nvidia.com>
To: <joro@8bytes.org>, <afael@kernel.org>, <bhelgaas@google.com>,
	<alex@shazbot.org>, <jgg@nvidia.com>, <kevin.tian@intel.com>
CC: <will@kernel.org>, <robin.murphy@arm.com>, <lenb@kernel.org>,
	<baolu.lu@linux.intel.com>, <linux-arm-kernel@lists.infradead.org>,
	<iommu@lists.linux.dev>, <linux-kernel@vger.kernel.org>,
	<linux-acpi@vger.kernel.org>, <linux-pci@vger.kernel.org>,
	<kvm@vger.kernel.org>, <patches@lists.linux.dev>, <pjaroszynski@nvidia.com>,
	<vsethi@nvidia.com>, <helgaas@kernel.org>, <etzhao1900@gmail.com>
Subject: [PATCH v5 2/5] iommu: Tiny domain for iommu_setup_dma_ops()
Date: Mon, 10 Nov 2025 21:12:52 -0800
Message-ID: <431cccb8279eb84376c641981f57e9ceece8febf.1762835355.git.nicolinc@nvidia.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1762835355.git.nicolinc@nvidia.com>
References: <cover.1762835355.git.nicolinc@nvidia.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-NV-OnPremToCloud: ExternallySecured
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS3PEPF0000C381:EE_|DM4PR12MB5867:EE_
X-MS-Office365-Filtering-Correlation-Id: 38564999-91bb-4563-4cba-08de20e10aac
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|82310400026|1800799024|7416014|376014|36860700013;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?zG8gvNsIyFrZrLPDUyJYLoqlzrF36NEGaemyqP3aKq77RJQZ2qF21kFRE1tm?=
 =?us-ascii?Q?Dx2TV7P1BJJ3mMk2Vk1i81KK/gmgZjnr0OATmVcUESJ0pM8X3o46tBn+f40o?=
 =?us-ascii?Q?e6ujWxiL7tCXu2OMMJ7E+0jeEm5eqUJ48jz7bfT63qvKUZu1jeMKao+/ht0D?=
 =?us-ascii?Q?F0Oew00FhUXkYQ+FA3ZcK6p7SYo3mYAhGtOggrhYLCUkJI6sOHAPT7Rjx3jE?=
 =?us-ascii?Q?8JqCFu29KyN911bLRYo6fdlK9yLZevKBSbRx9NAFAVb2Dpur+exzFMd2qrR7?=
 =?us-ascii?Q?JsVKqgJvaGH2LUJMyxbPTXsRZ2G/GbUbnwaW0K4WjlEEDUp0hyAZSZgjKVPz?=
 =?us-ascii?Q?pjPHs0B8T/spTRnI2wlhcbOZAMr7Et0g1aQ1a6pxXAwkEkKEXOByAL4fVIJ2?=
 =?us-ascii?Q?6ymWt+fFpusITnexhDmcd8B2HqqsGllKhPfF38AjkKt8IhIcJtEmomgtDFYL?=
 =?us-ascii?Q?VnMNjFzQt0zQ+t+Uw94jqGBLTZHNOnrZJWJmCQ5yQrQPRx6tJMTKfzBOyOUw?=
 =?us-ascii?Q?3IJwOXXhAELVEJIBRTgHL4WYNRsmIA7lhdbIeFmWJa+QCX7vqvsMmJ77NBdl?=
 =?us-ascii?Q?CuZS9o0Y/jRioqnLFwPLgs07UCVH5g9+v1HnvsHvPlL4pScRXe5v6UtqFd1r?=
 =?us-ascii?Q?OPEAn5oP7OzIKYkh6r1ed4DymXUpuVih0tbPrFc1UjPoPu+zNQ2uPokl94Pf?=
 =?us-ascii?Q?QN824oebwP7cJEt7Y9SYNMYarQEs3Gyz8/0/6Vk0X1Vv4sPFzYQ0hkaOayW3?=
 =?us-ascii?Q?VPjJoonHGn/GtjkHoS2DZLTT8S83T2IeKchldDoYDDnhfZwPuQiGK76gUv0W?=
 =?us-ascii?Q?HCZSyeO8kC8PoPQ7Kp+IaQi07qR29aS1YPKQnC5LO72pvT+mSdLe8GkvRB+d?=
 =?us-ascii?Q?OyccoorP/zV6lO4L5if7Ud3cQ7oToQRLV79OPNlQLGaPBDIfgY08Do9RUowV?=
 =?us-ascii?Q?w5TLinsaXKN74bal50j4GFrQIAJIZA3ahluY9XkUx0UQeHhC1ijOmdAriphu?=
 =?us-ascii?Q?1YskXs0As03reFyoIRK822kts+Rc7Rva0SrubohPygChRwZwNk8Aa9vGlPGI?=
 =?us-ascii?Q?nhLbNsZCodidRZkfXhMOYYyDB7nPcphTQIvIllpVmZu84vkufX3WhnjMYU7o?=
 =?us-ascii?Q?fiPYDxFc0SpaGY6Q2NSLee1qoyZsY+gWGqXUihZ4D1Ll0BGRjZRsm0K0TH5p?=
 =?us-ascii?Q?tIVSFTPL7EhYNpZCfHKzz11NjdXtUBVQGerhHlR+LE6ECv5hdQFWp9O1BK5g?=
 =?us-ascii?Q?QFYL2uEgLNdaF/aAVptUOoACjV+zHGNLRNCoIvVXeOtAfym5o8kJzUmCo0M8?=
 =?us-ascii?Q?xRrJe+Orvb6tQuu3XSlMze8WoxCGMP41hxIBZ9kqRW3lCj/oeln216PUhO/x?=
 =?us-ascii?Q?iEQd4aoV0TBGwTvQ1s+ohV5STxHU+RUfbjNnHSAyxRuhuPj/ptE8QmctT32H?=
 =?us-ascii?Q?3rGF2u1dJCsHXI0xzAZ4I6wcf8ahAPJvBEAgklJiLolrVZClWgBcl7DfI464?=
 =?us-ascii?Q?GJSxhAqtM8c0rvvPYBGs9BM4vT4lx48jgIbwtYvNXEa4f/yEeGH7FI06HywG?=
 =?us-ascii?Q?v0CrCSnM65X0tQpN6R8=3D?=
X-Forefront-Antispam-Report: CIP:216.228.117.160;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge1.nvidia.com;CAT:NONE;SFS:(13230040)(82310400026)(1800799024)(7416014)(376014)(36860700013);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Nov 2025 05:13:25.0859
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 38564999-91bb-4563-4cba-08de20e10aac
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.160];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: DS3PEPF0000C381.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB5867
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251110_211332_419919_3C0947AF 
X-CRM114-Status: GOOD (  12.46  )
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

This function can only be called on the default_domain. Trivally pass it
in. In all three existing cases, the default domain was just attached to
the device.

This avoids iommu_setup_dma_ops() calling iommu_get_domain_for_dev() the
that will be used by external callers.

Suggested-by: Jason Gunthorpe <jgg@nvidia.com>
Signed-off-by: Nicolin Chen <nicolinc@nvidia.com>
---
 drivers/iommu/dma-iommu.h | 5 +++--
 drivers/iommu/dma-iommu.c | 4 +---
 drivers/iommu/iommu.c     | 6 +++---
 3 files changed, 7 insertions(+), 8 deletions(-)

diff --git a/drivers/iommu/dma-iommu.h b/drivers/iommu/dma-iommu.h
index eca201c1f9639..040d002525632 100644
--- a/drivers/iommu/dma-iommu.h
+++ b/drivers/iommu/dma-iommu.h
@@ -9,7 +9,7 @@
 
 #ifdef CONFIG_IOMMU_DMA
 
-void iommu_setup_dma_ops(struct device *dev);
+void iommu_setup_dma_ops(struct device *dev, struct iommu_domain *domain);
 
 int iommu_get_dma_cookie(struct iommu_domain *domain);
 void iommu_put_dma_cookie(struct iommu_domain *domain);
@@ -26,7 +26,8 @@ extern bool iommu_dma_forcedac;
 
 #else /* CONFIG_IOMMU_DMA */
 
-static inline void iommu_setup_dma_ops(struct device *dev)
+static inline void iommu_setup_dma_ops(struct device *dev,
+				       struct iommu_domain *domain)
 {
 }
 
diff --git a/drivers/iommu/dma-iommu.c b/drivers/iommu/dma-iommu.c
index 7944a3af4545e..e8ffb50c66dbf 100644
--- a/drivers/iommu/dma-iommu.c
+++ b/drivers/iommu/dma-iommu.c
@@ -2096,10 +2096,8 @@ void dma_iova_destroy(struct device *dev, struct dma_iova_state *state,
 }
 EXPORT_SYMBOL_GPL(dma_iova_destroy);
 
-void iommu_setup_dma_ops(struct device *dev)
+void iommu_setup_dma_ops(struct device *dev, struct iommu_domain *domain)
 {
-	struct iommu_domain *domain = iommu_get_domain_for_dev(dev);
-
 	if (dev_is_pci(dev))
 		dev->iommu->pci_32bit_workaround = !iommu_dma_forcedac;
 
diff --git a/drivers/iommu/iommu.c b/drivers/iommu/iommu.c
index 170e522b5bda4..1e322f87b1710 100644
--- a/drivers/iommu/iommu.c
+++ b/drivers/iommu/iommu.c
@@ -661,7 +661,7 @@ static int __iommu_probe_device(struct device *dev, struct list_head *group_list
 	}
 
 	if (group->default_domain)
-		iommu_setup_dma_ops(dev);
+		iommu_setup_dma_ops(dev, group->default_domain);
 
 	mutex_unlock(&group->mutex);
 
@@ -1949,7 +1949,7 @@ static int bus_iommu_probe(const struct bus_type *bus)
 			return ret;
 		}
 		for_each_group_device(group, gdev)
-			iommu_setup_dma_ops(gdev->dev);
+			iommu_setup_dma_ops(gdev->dev, group->default_domain);
 		mutex_unlock(&group->mutex);
 
 		/*
@@ -3155,7 +3155,7 @@ static ssize_t iommu_group_store_type(struct iommu_group *group,
 
 	/* Make sure dma_ops is appropriatley set */
 	for_each_group_device(group, gdev)
-		iommu_setup_dma_ops(gdev->dev);
+		iommu_setup_dma_ops(gdev->dev, group->default_domain);
 
 out_unlock:
 	mutex_unlock(&group->mutex);
-- 
2.43.0


