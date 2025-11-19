Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E125BCF2561
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 19 Nov 2025 00:53:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=mNY9x1RtcvkkzqkoxtEh/9kLnwrlK2GzglZgK+WuMC0=; b=ADrO4eMp2C+985/ECHfGWCBvWb
	FOZ4YlL8fauQx53JUxoxaoCRGeCs0We5FhMMtRCcuKkcQbWVobLyo+y7/O3ZDE7SoZl/XELCLQt/o
	uy0vTgCDMWpcckxaJLigY7t513qfYl4oCHSYDL3yW3njFgIGsynewvdsrjNckCVyokC1FKe26LzLl
	F8fXo48lnPvkNBHvzGdj5qHMQsUn5+3IJp58BxP/3jDN0JYb2WjDsTX5/k5uQvEynCC4zvZlf1Z5f
	tY4T6ez4Tao/uEp+5MJO7i2Uz3xNriJ3JsHqueBJqjw6ZlnuhyNc+Th/5l5rp5PpGy2BJY6p6v7/V
	+giUUS+Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vLWRL-00000001Jbf-3plA;
	Wed, 19 Nov 2025 00:52:55 +0000
Received: from mail-westus2azlp170100005.outbound.protection.outlook.com ([2a01:111:f403:c005::5] helo=CO1PR03CU002.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vLWRK-00000001Jao-017j
	for linux-arm-kernel@lists.infradead.org;
	Wed, 19 Nov 2025 00:52:55 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=NcNr1QEr0ZKAvAwrzQd5K02o0FuT+lm8UqvFXTtSdMuBA7C38xE+r7Haxed6+0ELGn3vkExIy4vLuGzRt9K5dnIn2D9fFB40OjRR9AsFx3P9+2Z68WY11oKJINa5ddcgbRH2g4RMch1NHmKZTcvxqSAwy6svbybrgwrBOvzUmFxbs+BqkFrKtPvDoaS4Jsgsya2/o0EuyP+9X522Y8uNcr+jVS7PRXRUema5hgbd90PbKh95AizKWyGhdDXaA6iCFALrM/HSt3JefTXLIjms4rAhfZkwVodeC5fr2WartpdNWCi6dVQ+nHLDlUsw33sKJRyI2H3um+FE/HHg/AHk5Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=mNY9x1RtcvkkzqkoxtEh/9kLnwrlK2GzglZgK+WuMC0=;
 b=Rd8/RIVx6rOi+FyR7M8lnt91J56oxWQLlJM36huZOxsF1YMWwCtkruRLx29zKFvTWSub1lHxjtk/N2WwrnzyYNtm7NuCMaeKTgccxC+v45fVYgk5fx+9TPfDWnzT+wsAX+zKckgGKLHLz9Og7JHneZN/wD4ukheJRwGcQrcmQD0cAX+7R9ncvzln5Jo8KOPREWuHaWfxU71KDj6303SQqAOZNt+HNvyBRbgMcw+UsJlL1yKKDNXSdWEsPEV/k3rWWfJtx4ZuE3go12qZa6X6gfThCrBzG53FDer/mOZ/4nP1c7rkivEmRa3tDbpg0yeeI0gfxF6l6WADrmiPmvkZLw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.161) smtp.rcpttodomain=arm.com smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mNY9x1RtcvkkzqkoxtEh/9kLnwrlK2GzglZgK+WuMC0=;
 b=HEVTIho5TIFeKJxLO3rGoOUehtCasKljbwQIS3ZWoDl/RXmTQAioslX+h0JrRTB9FqaNS/2R4OxIeVxfKVy1JsyZzw4PseZ1HdvduwfHTb0yT947C+xsXfHTzce4UrK1kbxONfQCdJqTVUMT8xxGuXABrRj25C1tEelVo5MdXElqUYCKKL6U3gnJJzfv6aTC1eNe84HXs4mPc5yauIln55sUIDcGq0jT0kSDvfyL45H55g14tPiwb6rCVeK3wx59S0t44bZETthXEgKXbymWsZV1bXjumNngiFN8DGQu/l03KRGpfCSTFcSi1fvSE48l9yku8VW2YhcaeAXVHFvuUw==
Received: from SA0PR11CA0188.namprd11.prod.outlook.com (2603:10b6:806:1bc::13)
 by LV3PR12MB9266.namprd12.prod.outlook.com (2603:10b6:408:21b::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9343.10; Wed, 19 Nov
 2025 00:52:46 +0000
Received: from SN1PEPF0002636E.namprd02.prod.outlook.com
 (2603:10b6:806:1bc:cafe::d4) by SA0PR11CA0188.outlook.office365.com
 (2603:10b6:806:1bc::13) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9343.10 via Frontend Transport; Wed,
 19 Nov 2025 00:52:46 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.161)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.161 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.161; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.161) by
 SN1PEPF0002636E.mail.protection.outlook.com (10.167.241.139) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9320.13 via Frontend Transport; Wed, 19 Nov 2025 00:52:46 +0000
Received: from rnnvmail202.nvidia.com (10.129.68.7) by mail.nvidia.com
 (10.129.200.67) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Tue, 18 Nov
 2025 16:52:26 -0800
Received: from rnnvmail205.nvidia.com (10.129.68.10) by rnnvmail202.nvidia.com
 (10.129.68.7) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Tue, 18 Nov
 2025 16:52:25 -0800
Received: from Asurada-Nvidia.nvidia.com (10.127.8.11) by mail.nvidia.com
 (10.129.68.10) with Microsoft SMTP Server id 15.2.2562.20 via Frontend
 Transport; Tue, 18 Nov 2025 16:52:24 -0800
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
Subject: [PATCH v6 1/5] iommu: Lock group->mutex in iommu_deferred_attach()
Date: Tue, 18 Nov 2025 16:52:07 -0800
Message-ID: <bad420df60c3ed07a51591ce3ab001d7e4254a2a.1763512374.git.nicolinc@nvidia.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1763512374.git.nicolinc@nvidia.com>
References: <cover.1763512374.git.nicolinc@nvidia.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-NV-OnPremToCloud: ExternallySecured
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN1PEPF0002636E:EE_|LV3PR12MB9266:EE_
X-MS-Office365-Filtering-Correlation-Id: a7f236d8-e029-4ffa-bb6a-08de2705f483
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|82310400026|1800799024|7416014|36860700013|376014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?zANtdOEQOoaoCYcgF/VIBLoMMYm+vCkK5rFq/pWAxF4+kt6twvwobcaI6h3I?=
 =?us-ascii?Q?QqC875t1ofMAorlF7gDQ1wCdBcqkmN9ai2jFWcREGmY8PH2F1thj3xamTSxV?=
 =?us-ascii?Q?HgwPpXjyYnQBrP3svzMjAwl3vHFfNi2cEQUcLid2Su77jwSw9v719yL3R5fB?=
 =?us-ascii?Q?yK/qRkqeAEhr6ToNTWfdi6N6uPm6IubwxYSMtyEL2Ga++KiM0Y5PU7KNpvaj?=
 =?us-ascii?Q?tWGwKuu/jPGL16PXzCL8Kcn1axqm6PJIosZfiSxYhhOrsr5w1Lr4n9zbWGkN?=
 =?us-ascii?Q?ETvGuUufgbzHYSpt5VVgjJZK6wPkdGM7nmRbVxfPGeuZZN604juEahdwzbIv?=
 =?us-ascii?Q?Jl7kI6AyBVSlcu7FNqE/7jQCmKumpleHpG2eBot3NZ2204HxK28sT8BmPQlB?=
 =?us-ascii?Q?zGGlHaeqUc+dILi6BJeOyOHH9S1U5Cq2w1+JW9d9uqxsIafvTaJ9JGQKc9/N?=
 =?us-ascii?Q?gGstc8qgD9/zLwAIn9SM2z/zCpArLOyAhvYVFqvwTI6B1X77zQxJ52qPyuM8?=
 =?us-ascii?Q?ThroZosjl5hsY2eKelrCutiZZsLOcPXdXp5uM0FE+toZtDbqBH6O0orMO8Wr?=
 =?us-ascii?Q?KZWd7RhoyyxkjLsSTAPkaCRKyotq0n7gXqXwsDl4wQORrZCgRXUPNUywdu+2?=
 =?us-ascii?Q?8A2zwf+oNOvJfugtJdTuTpJF/p4ROS2GUF4mE8fIaut4+kSOiqJyo9iwHN/S?=
 =?us-ascii?Q?0tZAMo7zq0Ty5xEDPtWrLoG+q1zVMwvUV9fNrybhaVutdxt4vbRyxLNfydXb?=
 =?us-ascii?Q?u+MFTBcBMG0XGSt/PSMrYJYYMhdeIzNYFECK+Zvwh1WIeg/IxB3xyjcll9qN?=
 =?us-ascii?Q?ivpzQSW5gBk/AWqRYFPyOQ7JEBft1NYXwn5UGByIEjxI7C2mPiBWGyryR63V?=
 =?us-ascii?Q?l3X4pLIEZYdS8/VJ1ZMfSWuBCN6BQdCFotPI+xEtgldMahEBn9uwfQGhvArF?=
 =?us-ascii?Q?R+0BuLpYliWbCHnhIOYUc8nlgOV16EhP5w8GIAHYJWGG4DW12m5pIbjxQjvz?=
 =?us-ascii?Q?CcgPxOEcHLJcOW6IZdmuh2n7Z0CJh4+eFrsrzPdSRXhk+P+XzsvT0o7QzM8L?=
 =?us-ascii?Q?BWhJKQOE42o+CR+s7eDjMUzTtAw6Kl3wZOl/h1Onq8GtsOSAOF7nbKgLOecl?=
 =?us-ascii?Q?Ubeuxu6zDeq2bZvel2rl3jMUj/sbyVm5u8NTRPyOkJTpLYrhSdcVs/1Rmj6u?=
 =?us-ascii?Q?X4SI96/3x3cEVelw6TsU8b9yOicoNTY3Fcjh9/Vp3TE260S17TFodWxyA7gb?=
 =?us-ascii?Q?mY8LNe/xx4AuAQ2uw/TYdbsAqmJ5td762Vk4QuhrYRTmW0ohuVftd9bhgImU?=
 =?us-ascii?Q?qtCaafs8hErI6FAcorJgP5j6WdlhyEbjz8UL2jmpk+e+0u92XupXZ+D0QUPP?=
 =?us-ascii?Q?v1QHYNC4IOg3h/1QUIF9j8ZKPy/29zfJ1C7s0Up1+qq65X+MFRqoD2eTrkZ6?=
 =?us-ascii?Q?MBK3rgYuogvZFax1rqzijUKYZZeoSxJh8NnxELT3cJ0ONfpdRpJXAaYAoazA?=
 =?us-ascii?Q?AKOLTmcXofGpQFvVFAC9JSLh79I4axb18ZwkxfAw6pbBYOS8HeDFCNPAMExJ?=
 =?us-ascii?Q?8IzGEp2nVo7edwnw8Pw=3D?=
X-Forefront-Antispam-Report: CIP:216.228.117.161;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge2.nvidia.com;CAT:NONE;SFS:(13230040)(82310400026)(1800799024)(7416014)(36860700013)(376014);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Nov 2025 00:52:46.2392
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: a7f236d8-e029-4ffa-bb6a-08de2705f483
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.161];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: SN1PEPF0002636E.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV3PR12MB9266
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251118_165254_044511_D7E2DCFE 
X-CRM114-Status: GOOD (  14.82  )
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
Signed-off-by: Nicolin Chen <nicolinc@nvidia.com>
---
 drivers/iommu/iommu.c | 13 ++++++++++---
 1 file changed, 10 insertions(+), 3 deletions(-)

diff --git a/drivers/iommu/iommu.c b/drivers/iommu/iommu.c
index 2ca990dfbb884..170e522b5bda4 100644
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


