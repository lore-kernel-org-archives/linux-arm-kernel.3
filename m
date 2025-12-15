Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B8F96D5B871
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 15 Dec 2025 21:43:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=riWsnW6hB0/zA+AA1KOBCMc0XajvpmaI1abm81ImIow=; b=wTrnXt68kODuW92NKwVkUHgQVX
	dvArftqPXz8rvSCln2FsiUYb1CI9mBzIWyDgTK2vyPkOEGPYQGQfuYVJrKqtmmNXFPYGWCodt9g3R
	9GSWDI3Cm5j89764IWXMIzFyyRrRsxamP2Ola3vHa0igkzcx8l6kch8a61mQG5j3MoHauvm9jj2LG
	UYEQo8bE9BUgJWKZUKTx1DEckFL56LfrNtam2RPJxVjnzq+nmrGBFftfPoppodxMsBnpkX+PrJQv3
	rv5Xt7j4OfeuB74Luxv/UL7c+K2ZqbduHrcHZbIb0k3iaDFIKcOF0OK7Wh3fEBIFnifStHwniRo3g
	z21hw7UQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vVGLJ-00000004Jie-1yZl;
	Mon, 15 Dec 2025 21:42:57 +0000
Received: from mail-westusazon11012012.outbound.protection.outlook.com ([52.101.43.12] helo=SJ2PR03CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vVGLG-00000004JhE-3ilj
	for linux-arm-kernel@lists.infradead.org;
	Mon, 15 Dec 2025 21:42:56 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=kqmVWg+cScZwqI5aaA+6UIo6TW9lkHlyWr+WMTLfzZMK19sbKnLEfgUJgwgsNtnQ2IvBV05wwUwCUUwkkX2lbkdpo6zB5BqmAGk/Y+jMN1c1d1dKr22TzFUCcyyDiGvyuGy4ObblkGrIWUlY2v1TObJWwE8lu97QI/sMpuCfMeJCMycu5IZnQONgsyxptvWIFqcTfG95sgOw5+mj2t42vMUuzLyJmpmHm/ysC6QQZ2/Jg7rvZpEaue3CRcwDTbp9uXH7SyHgDOaWzOEUrwd7MzTdqp7h6X5PZckQYCqqC73pxoLTlHadWZlMe2ZNcetkvqfTRm3tEXvsQRYhmIsRvQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=riWsnW6hB0/zA+AA1KOBCMc0XajvpmaI1abm81ImIow=;
 b=NooUwdPuLWvNQJbkds8i+cTcQ8oXpIZAFLLnOZXfo+8hFFLdVPOSl3WBhKp6PFduik51WWIxJjh3p+7OFdUiz5ZrEjI8XIYtlg7gx20fCHARZuB/NL9Ec9RSbevkA0uL8oaJCu0fddqInBTXWYE5DksY3z2RYt/4TILong7Ak9qkV4GFDvsVOveeQIrDpL1St9hgBBnUGbo3NeKXBuV/HkjTEXD4ZUIxRQ6pV2rZRUZloKRjJTWK14bUAGU9vTF8bFCnd8vBLJsAqwAE7lAmAYOHI3vqRGTwflrg50rPbunoY5zDbaEssSqvxsOed83WjuKV8pTs9zQn7tpHzIyaEA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.118.232) smtp.rcpttodomain=8bytes.org smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=riWsnW6hB0/zA+AA1KOBCMc0XajvpmaI1abm81ImIow=;
 b=fsHdj8ofd1Hn3P3+S9tgNmTYA/bm7EnWWfQOz5GiZkrhnSHpP55ZWrn/A8vYnycMVeaLtkGMBdFsxbf6rj0e/V5csxwHmyq3gQzJjra82tqV3SLNXhNQnkou7WWrmZG8NwNzepEN+fYmFcynbjDvda5Eb5aXBgU/1/Tvipdh+bMCV4WsZlB8o5jbdfH3bZuH3naka7180gIcHEcRA1yBE6EwSOdwfG5zhrXI/vXPCsdJZaMVC5fv8SBhy4f+pobw+REb35UUvTqnJbZiiIqTJxVHEjFaB+2immuKFyzVOuT0b4Ex7j21wd7ICnTb7+Uwp1dfpQNjvhU5jzJjhkd4JA==
Received: from CH0PR03CA0295.namprd03.prod.outlook.com (2603:10b6:610:e6::30)
 by DS0PR12MB9321.namprd12.prod.outlook.com (2603:10b6:8:1b8::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9412.13; Mon, 15 Dec
 2025 21:42:48 +0000
Received: from CH1PEPF0000AD7B.namprd04.prod.outlook.com
 (2603:10b6:610:e6:cafe::a8) by CH0PR03CA0295.outlook.office365.com
 (2603:10b6:610:e6::30) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9412.13 via Frontend Transport; Mon,
 15 Dec 2025 21:42:46 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.118.232)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.118.232 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.118.232; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.118.232) by
 CH1PEPF0000AD7B.mail.protection.outlook.com (10.167.244.58) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9434.6 via Frontend Transport; Mon, 15 Dec 2025 21:42:45 +0000
Received: from drhqmail202.nvidia.com (10.126.190.181) by mail.nvidia.com
 (10.127.129.5) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Mon, 15 Dec
 2025 13:42:29 -0800
Received: from drhqmail203.nvidia.com (10.126.190.182) by
 drhqmail202.nvidia.com (10.126.190.181) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.20; Mon, 15 Dec 2025 13:42:29 -0800
Received: from Asurada-Nvidia.nvidia.com (10.127.8.12) by mail.nvidia.com
 (10.126.190.182) with Microsoft SMTP Server id 15.2.2562.20 via Frontend
 Transport; Mon, 15 Dec 2025 13:42:28 -0800
From: Nicolin Chen <nicolinc@nvidia.com>
To: <joro@8bytes.org>
CC: <will@kernel.org>, <robin.murphy@arm.com>, <afael@kernel.org>,
	<lenb@kernel.org>, <bhelgaas@google.com>, <alex@shazbot.org>,
	<jgg@nvidia.com>, <kevin.tian@intel.com>, <baolu.lu@linux.intel.com>,
	<linux-arm-kernel@lists.infradead.org>, <iommu@lists.linux.dev>,
	<linux-kernel@vger.kernel.org>, <linux-acpi@vger.kernel.org>,
	<linux-pci@vger.kernel.org>, <kvm@vger.kernel.org>,
	<patches@lists.linux.dev>, <pjaroszynski@nvidia.com>, <vsethi@nvidia.com>,
	<helgaas@kernel.org>, <etzhao1900@gmail.com>
Subject: [PATCH v8 1/5] iommu: Lock group->mutex in iommu_deferred_attach()
Date: Mon, 15 Dec 2025 13:42:16 -0800
Message-ID: <cb38f91526596f4efd0cd1cffa50b4c1b334f7a4.1765834788.git.nicolinc@nvidia.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1765834788.git.nicolinc@nvidia.com>
References: <cover.1765834788.git.nicolinc@nvidia.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-NV-OnPremToCloud: ExternallySecured
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH1PEPF0000AD7B:EE_|DS0PR12MB9321:EE_
X-MS-Office365-Filtering-Correlation-Id: 09fd4fad-a020-45ad-1ed2-08de3c22e295
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|82310400026|7416014|376014|36860700013;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?XqOQfS3J/VzuTm4BkZOOfdIBBk4UN20Q03DJqOXprvOq17xo4NShSKkKmM36?=
 =?us-ascii?Q?CK5Tm8u7o0hA9DRWb02tLuaZY8Q8AYAgZGMddWiU3uCQfffUHe62hORdim5N?=
 =?us-ascii?Q?SIMg9jv48Ykvg8C48QigZmnoDKOn0mppawvRINoSiqnyLycYeY+DRThWFjkO?=
 =?us-ascii?Q?0AiyOk5QUjEJXbRPBGkUZqguFmGTG+e9GmcXObo4FwC67inKYL1oWTQHnhk4?=
 =?us-ascii?Q?LIJY/+4Z1eDdtbTVaPnomyLC9gW9DLgeO9GoxAEY4+MyLbj+rnQ3GIFpOfCF?=
 =?us-ascii?Q?XJNHQko+OMvMj3J7/5V22/of8A3LcUxqpjhxOD5vAi02rEOn4/0VtVmDCxnL?=
 =?us-ascii?Q?WZ+T3w4UAB6ckW8bj/fBj45B/ConFdZjfnZD8ufG6iGdUDSA8+1Ya+hXQjIW?=
 =?us-ascii?Q?eZLjQJ+I4Xk5Bru7IMMnmTPqEW9zFtk4FjL+jhgNpEndMdmTVO+2SyVJacmI?=
 =?us-ascii?Q?o1lAasVLeBWrs8T/xbFuWLu95RRvHB+qSMcv5ZEiya682EtypnMhM4s5GKYB?=
 =?us-ascii?Q?a7nhj/cmrjFQEJ1ZMIr2t3ceuRZDL4e5R7PgUmGH70qMoDf8iI9OgFC4dTnU?=
 =?us-ascii?Q?D+osmG746x1nQh+pgLyvKsB922j6N2n26MZUG71aTZ/jf/NJ/ac3R+oDkbie?=
 =?us-ascii?Q?JHkmD9WS8ojaZ7DNCFFA1qX5yx8Hf86f1xnky9soJGEKRowVygZrC0XxH+j4?=
 =?us-ascii?Q?CMfIhNWmn9ah2rNFRrW0QyMItnpgVGMq21+Nnb+yo0AcKjdUFnEcnZjq3i/K?=
 =?us-ascii?Q?hQeNPASEYWUmo+pAmbd2UNWYA2rrsGenA4Y5mvqNEIfElxgTH58C3mM17v/T?=
 =?us-ascii?Q?KJDPkwajzN9/mSJdAn6I9SfTYFenO3X2zVLUFO95n+9avTJBsR5hvMF5Ikhm?=
 =?us-ascii?Q?bbSuDUG4a1cKeSZsLW/wSbsUTrV7xWklma1+joRCG4+5j4BBCZ8qeMF9ci/G?=
 =?us-ascii?Q?DjQUwb1rTBXuiobW75nLPSWXDRByeeb3YKzWYTnejmEtgjZCZGuUaaWws7FH?=
 =?us-ascii?Q?L6chPnptDxyfLmNRmJulzpps2UemgTb0pjbMdI+S598NZp2M2V3EduMqeu60?=
 =?us-ascii?Q?OvNKgsritwU7zh7s+W2LjPvoXIMk4n6Zzv4zQyiEYqfLMvYM6OQ97cZVnS2x?=
 =?us-ascii?Q?DHQSqbQv8lwwR0ymkBCpyzSRPE/M2MmgXeC10Mtze6m69TntGrAHLkID3+8D?=
 =?us-ascii?Q?+nVnIKx9bwd+W89FiICbW9SoqOHwoCTtVQF1EIc+6fLi8D2GLE0JUb5T4UTe?=
 =?us-ascii?Q?3st4vC7uxUdsV7YlLrCMIVvUQFaJdi8ph2PbOx9EsdOh5XAd4zdFTIALnmPF?=
 =?us-ascii?Q?eoz/OphZ//IibOQ6HOhGoJ2IoJ/DDjvw81iIdBkIbPWuFfn2XgRgN4RAoP6S?=
 =?us-ascii?Q?AL2qfzHZi/EYFLpn95EQBooiNEtp3SZfNiV6RaFaANOCXiu7xVVWslMTEz4x?=
 =?us-ascii?Q?+hyyI+Zw5ux68kMwWZskulY11aCg7TYGYBbVbMPcoDzFDdNI0gmUyCwp+SYq?=
 =?us-ascii?Q?kGtgIlJ3l2L29ss8QYORVQdlhec9vQbei5sAZ2imwfJdhm/3sHybMtmz6Rxb?=
 =?us-ascii?Q?a54HzYH/mhM5JxRFO9Q=3D?=
X-Forefront-Antispam-Report: CIP:216.228.118.232;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc7edge1.nvidia.com;CAT:NONE;SFS:(13230040)(1800799024)(82310400026)(7416014)(376014)(36860700013);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Dec 2025 21:42:45.9629
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 09fd4fad-a020-45ad-1ed2-08de3c22e295
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.118.232];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: CH1PEPF0000AD7B.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR12MB9321
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251215_134255_061007_06AEFE41 
X-CRM114-Status: GOOD (  13.32  )
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

The iommu_deferred_attach() function invokes __iommu_attach_device(), but
doesn't hold the group->mutex like other __iommu_attach_device() callers.

Though there is no pratical bug being triggered so far, it would be better
to apply the same locking to this __iommu_attach_device(), since the IOMMU
drivers nowaday are more aware of the group->mutex -- some of them use the
iommu_group_mutex_assert() function that could be potentially in the path
of an attach_dev callback function invoked by the __iommu_attach_device().

Worth mentioning that the iommu_deferred_attach() will soon need to check
group->resetting_domain that must be locked also.

Thus, grab the mutex to guard __iommu_attach_device() like other callers.

Reviewed-by: Jason Gunthorpe <jgg@nvidia.com>
Reviewed-by: Kevin Tian <kevin.tian@intel.com>
Reviewed-by: Lu Baolu <baolu.lu@linux.intel.com>
Tested-by: Dheeraj Kumar Srivastava <dheerajkumar.srivastava@amd.com>
Signed-off-by: Nicolin Chen <nicolinc@nvidia.com>
---
 drivers/iommu/iommu.c | 13 ++++++++++---
 1 file changed, 10 insertions(+), 3 deletions(-)

diff --git a/drivers/iommu/iommu.c b/drivers/iommu/iommu.c
index 2ca990dfbb88..170e522b5bda 100644
--- a/drivers/iommu/iommu.c
+++ b/drivers/iommu/iommu.c
@@ -2185,10 +2185,17 @@ EXPORT_SYMBOL_GPL(iommu_attach_device);
 
 int iommu_deferred_attach(struct device *dev, struct iommu_domain *domain)
 {
-	if (dev->iommu && dev->iommu->attach_deferred)
-		return __iommu_attach_device(domain, dev, NULL);
+	/*
+	 * This is called on the dma mapping fast path so avoid locking. This is
+	 * racy, but we have an expectation that the driver will setup its DMAs
+	 * inside probe while being single threaded to avoid racing.
+	 */
+	if (!dev->iommu || !dev->iommu->attach_deferred)
+		return 0;
 
-	return 0;
+	guard(mutex)(&dev->iommu_group->mutex);
+
+	return __iommu_attach_device(domain, dev, NULL);
 }
 
 void iommu_detach_device(struct iommu_domain *domain, struct device *dev)
-- 
2.43.0


