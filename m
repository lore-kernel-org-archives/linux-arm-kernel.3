Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2D299C7EE30
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 26 Jun 2025 20:37:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=tM5a/VpJnPOQ1SwAAILFReHvHS4NIKun00hNORa/tMM=; b=rW4tZsIZT4P+i0DsFTjoJvajCR
	IqPPHA5d9vqtOIkUQT4lWcMMVoVg5+7G/so+bPt/wPnZceNklV/gtm3YGzQSzcmXSLqSNaFE565Em
	KMqFTwP1o/NY23z1Xgl7dK1M7NlmRNJH+alYNDTL7CjhLqPX+eEb1BLWVZ9xUt5moG/AWrQjFiWKt
	rwXiEY+ehzTZ4Jy1rEtDWB5eWmiPIE4YhZjLfkhf8It9TL2IImk7Uswb/VoZ9i7gwBbIWAMSr/2QR
	IUl67ejfy7d0pe3LYd7UxGUrk2u9sU2Ga0tfC52fRRLZxUeDDRmOTwjk7CUyBaVvcIOtcKBOvvwJP
	GmNl0SbA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uUtLz-0000000Ckqa-1ZC0;
	Thu, 26 Jun 2025 20:37:51 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uUsOK-0000000Caco-2F56
	for linux-arm-kernel@bombadil.infradead.org;
	Thu, 26 Jun 2025 19:36:12 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Type:Content-Transfer-Encoding
	:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=tM5a/VpJnPOQ1SwAAILFReHvHS4NIKun00hNORa/tMM=; b=Ej+SfP8s1/c6snDWh+OFbqwrHr
	inbtz7KuQflvxTrP1OWgL/MDz/y9BJFpWXcTfmq0JVmp6ks42azRAsROhlrpEcKLnQO8B4VIXATYU
	n0J8vW2j1WtNn6ItDK7nmAteyOwgS6s8nesVFbhHUDHKRKJF0PqsJR5TKduwZ6jW5ZiPrDeInwD9N
	4l99LBcxGSbfAgU512VoFkk54X7gqvHKUB6KbFmqpg8DTj+jn6P4+2RlO6ekA7OFanw1+urK3v+in
	cmtY9l96Fp8a71aML4002jri5ZydfCPQlenqhbpA6CU8otMV7p6lq9mGF8gJ3fKjWWDsP/7BwaI9y
	xT7WngMw==;
Received: from mail-co1nam11on2062c.outbound.protection.outlook.com ([2a01:111:f403:2416::62c] helo=NAM11-CO1-obe.outbound.protection.outlook.com)
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uUsOF-00000006Cuy-0UjU
	for linux-arm-kernel@lists.infradead.org;
	Thu, 26 Jun 2025 19:36:10 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=q8wUnXOkru3g34ONiLo0SJuV/xr/c74HRF3KHTikYuvOv91uRWCHljZ1PizzT3NcdX7CNXqhsxGdYZ/uLvoTYZMyf5DJ0p8ADQe6HtUbRKxPzB6qzsPZea4ZEdfaxHFOMq/Zx6PW3tA/aYzXtNPMMqM06VaDkb4UocqUaz5VmMT5J7X/GD28NF6fv6OS4Qpx5FfyWoG3L2SYU49gQu9qaeNTNgc5duHDuJW7I+ersWG5bNPMbp8P2mjnhKjwiYb1kNBFN3RPrJIrJsiHJi4DR1ny6iHggWDKZEQ4eD2yTnEnAFNCu4ASEgh9Tm//BDk/v9sW9vqFbqPbESTs+stqxQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=tM5a/VpJnPOQ1SwAAILFReHvHS4NIKun00hNORa/tMM=;
 b=CoPUwt6LvOZ+P+Bj/LJedxoROkGjovXY0Tu7cs7f5avVyJkfnhZAoO51Bkg8V8na2ROBEjb7Ess9W0g7cmm8Y3YvbDZLooJAhCMUrIVmqnkFK9+FSwrjo0ccT7Gzr/qjePf+ltjySJQ6loPkbwtLE+wtM9sEuHdHNsQ+pHNHyMjPw0Pq70Vs2rer/Y97yfJB23EvtEKOsn+twL4iIYMrU2C30GSwLML6/T+qjrvlfXVXdrvSfMvgLWZlpMuQvglHpkjBTS7d31ZyEfUu1XQJpa1FiGNYGa//f1kaxev4wyWmIFhMLlmKVXsn9vmepDwGCiS4C8sVZNP/mxfjvj2pzQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.118.233) smtp.rcpttodomain=amd.com smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tM5a/VpJnPOQ1SwAAILFReHvHS4NIKun00hNORa/tMM=;
 b=ExZWxPgqR1J14KpuVTXrT22AVlK8uoi/xpIX47FzTV0NT1eO7CzPXke3NH75196WH6yOwH+H0tWCtiFneinSNaD3QhYeJ9jLuxmbzVdTjLOGNLHdiLHKGMZHV0q5NpPqv9pYQju/ccGSJc4+7DOeV4smlx97qzqqpUGr7s+0Nl8PTkH+cgExSzWiTkXheneY/sisu2Qd1K4fscT+1yIZx0Z8R0+gJV1j6jD/l4rWSGqjHujqXhbbD84InZelWXP9qSLF/+ggmaVEzMNM/3aErXRUzn2NN0e7KJwYieZHCeJTjNY0DXxRGimUFiZS27LHBNWkX54qwN8ABzFDKIF14A==
Received: from MN2PR01CA0042.prod.exchangelabs.com (2603:10b6:208:23f::11) by
 DM4PR12MB6399.namprd12.prod.outlook.com (2603:10b6:8:b7::15) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8835.28; Thu, 26 Jun 2025 19:35:58 +0000
Received: from MN1PEPF0000ECD7.namprd02.prod.outlook.com
 (2603:10b6:208:23f:cafe::d8) by MN2PR01CA0042.outlook.office365.com
 (2603:10b6:208:23f::11) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8880.17 via Frontend Transport; Thu,
 26 Jun 2025 19:35:42 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.118.233)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.118.233 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.118.233; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.118.233) by
 MN1PEPF0000ECD7.mail.protection.outlook.com (10.167.242.136) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8880.14 via Frontend Transport; Thu, 26 Jun 2025 19:35:58 +0000
Received: from drhqmail201.nvidia.com (10.126.190.180) by mail.nvidia.com
 (10.127.129.6) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.4; Thu, 26 Jun
 2025 12:35:41 -0700
Received: from drhqmail201.nvidia.com (10.126.190.180) by
 drhqmail201.nvidia.com (10.126.190.180) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14; Thu, 26 Jun 2025 12:35:41 -0700
Received: from Asurada-Nvidia.nvidia.com (10.127.8.13) by mail.nvidia.com
 (10.126.190.180) with Microsoft SMTP Server id 15.2.1544.14 via Frontend
 Transport; Thu, 26 Jun 2025 12:35:40 -0700
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
Subject: [PATCH v7 24/28] iommu/tegra241-cmdqv: Use request_threaded_irq
Date: Thu, 26 Jun 2025 12:34:55 -0700
Message-ID: <4ed4bda81a656eee60635f7d706761ee33a07f2a.1750966133.git.nicolinc@nvidia.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1750966133.git.nicolinc@nvidia.com>
References: <cover.1750966133.git.nicolinc@nvidia.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-NV-OnPremToCloud: AnonymousSubmission
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN1PEPF0000ECD7:EE_|DM4PR12MB6399:EE_
X-MS-Office365-Filtering-Correlation-Id: ef6290a3-0224-4e47-db27-08ddb4e8ad2c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|7416014|1800799024|82310400026|36860700013|376014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?h5AK52igxpYxgFIHKWPyxvSQFcqMIU0P7JOZjs6cls513ei8PEw5wC01S9Jk?=
 =?us-ascii?Q?SOmcnHhkcuu5Q2W5r+b7Pnpb/gxwH83NJrDF/5cp7LAdGUwSCj2FibTsXfs4?=
 =?us-ascii?Q?4dMyK6JGpB+p9ooclehBN2xBWiUvxqbEzJFPUJeg4l7NJ2MPJzWnRcBDCp5b?=
 =?us-ascii?Q?aWVcC0q5xAGUAQRWnHZcI1mzgz1t9qjASldSfsmF6+LTibbndQtI9LB3F6yY?=
 =?us-ascii?Q?2RAzMTi+BEdSUSvzKznnIZMz8v3WT3l8k/+207Zw6cIZwhqSUnxCYDZqeiyW?=
 =?us-ascii?Q?nvhavcaGfLcDjYNjgnouEwgC/1Ls1ONAQ3X00VrlmQHhoR8aHVHw6NelAwOo?=
 =?us-ascii?Q?I04iPMKcfFZaXwVUlr6nWE19IQ666InJQOThPOapmAdaUbnMcAmkK1ODGbkP?=
 =?us-ascii?Q?/7Fg/U8wV1gpu64LlmI48ZllNpqXYQjAjPd+sJ+WfmZwGHM4cR2KfMAD2546?=
 =?us-ascii?Q?/1TellzJtdkz0y1T8BqbEmPKD2yJ2jtLmqf9E0GVdkJe/PoxkdLAXvGH42/4?=
 =?us-ascii?Q?O701aVT4Mnx/LsilYxbzmVs6iE+NV7fne9PiTDS0gqGVkisewREk7GyRrz2I?=
 =?us-ascii?Q?GbAyIezuYjpKsjNXEn5z9rNdKGYRFgmH1fsliqujJh+74YJEl12UKnGsihef?=
 =?us-ascii?Q?HMLiydB2R1JJiy2+bjPNuvItLPIX22ZxKES/RPbOMdE8VjNee5Eku4G4DYkk?=
 =?us-ascii?Q?GYGxL/o+S2k+bH9F/xwWJ07sPEcuUoysLbSg4Do0+A4q9Y16STssF0AUDShd?=
 =?us-ascii?Q?twqF+Nj/mopr2vwdYJzdiVCSCX0yIKV46WGE8hqh9Ml1q2b+auwVyCJ/mHQ6?=
 =?us-ascii?Q?GQcXwJLOTSP8xVe+IvLaBEJbwSDPxx/GIx04/gg9gRgapyuB+VqzIhXAP0NU?=
 =?us-ascii?Q?Tt7xaB25clHrTDy68BhcLUHTVlBU0J+yxB8c+s6M5WaqWnzKSYbzB8umYHeF?=
 =?us-ascii?Q?sB9cvpF1tmUz2I9nCm9lkcNJ2HUmU+qgjcsPu3cOrZO1FqmLmX1/cLgOu4vL?=
 =?us-ascii?Q?SOrwLELAcp6WkF8sfiJLMrodmmwB6Z1mpwcnuUMVCnbNK+dIfOWpP3Lk7lS6?=
 =?us-ascii?Q?7zCyD2Y0XS9K9kiQiKYpUpV19+404YEHXIpMQNBQCyadYcEr2BtnZL3K5b84?=
 =?us-ascii?Q?SUUBqnT23asi3nxTZTj0+rxjUR4Cd/3l8pJrsMVtjqY77q27dHtSGgYzQE1r?=
 =?us-ascii?Q?nkH2D9KYw7yFXDnqyF85zaGmSls2H2wEf7OPdMY/ggYJzaWp0THYOWS5h0fN?=
 =?us-ascii?Q?1vW6P6CA5fYUk4k9QiHWmrTAa3lahCZFixd5F5syFQjxorHmYwt2PL8Xm5Rd?=
 =?us-ascii?Q?UjEYl6YnUoET+wdosruDtfQ2qdUi3AILozr9Ql1MiqeCi4Bs0GekkTvJGgE8?=
 =?us-ascii?Q?gHwcxiPmvoFNJyg/lhUdnMgyiDVqHDhJ7ubKrxPpowOhRzjPfi9QotrWHzqC?=
 =?us-ascii?Q?hJZAzDtymHuh5kyM7X63cvv3hYrAEdd7MuPKGdnCkTSDwdov5zRNJs79IXOp?=
 =?us-ascii?Q?ddVoWGnVFhfmYH1b722S9IBnK0y68j3CNBSm?=
X-Forefront-Antispam-Report: CIP:216.228.118.233;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc7edge2.nvidia.com;CAT:NONE;SFS:(13230040)(7416014)(1800799024)(82310400026)(36860700013)(376014);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Jun 2025 19:35:58.5458
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: ef6290a3-0224-4e47-db27-08ddb4e8ad2c
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.118.233];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: MN1PEPF0000ECD7.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB6399
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250626_203607_353040_A4658AC5 
X-CRM114-Status: GOOD (  10.47  )
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

A vEVENT can be reported only from a threaded IRQ context. Change to using
request_threaded_irq to support that.

Acked-by: Pranjal Shrivastava <praan@google.com>
Reviewed-by: Jason Gunthorpe <jgg@nvidia.com>
Reviewed-by: Kevin Tian <kevin.tian@intel.com>
Signed-off-by: Nicolin Chen <nicolinc@nvidia.com>
---
 drivers/iommu/arm/arm-smmu-v3/tegra241-cmdqv.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/drivers/iommu/arm/arm-smmu-v3/tegra241-cmdqv.c b/drivers/iommu/arm/arm-smmu-v3/tegra241-cmdqv.c
index dd7d030d2e89..ba029f7d24ce 100644
--- a/drivers/iommu/arm/arm-smmu-v3/tegra241-cmdqv.c
+++ b/drivers/iommu/arm/arm-smmu-v3/tegra241-cmdqv.c
@@ -824,8 +824,9 @@ __tegra241_cmdqv_probe(struct arm_smmu_device *smmu, struct resource *res,
 	cmdqv->dev = smmu->impl_dev;
 
 	if (cmdqv->irq > 0) {
-		ret = request_irq(irq, tegra241_cmdqv_isr, 0, "tegra241-cmdqv",
-				  cmdqv);
+		ret = request_threaded_irq(irq, NULL, tegra241_cmdqv_isr,
+					   IRQF_ONESHOT, "tegra241-cmdqv",
+					   cmdqv);
 		if (ret) {
 			dev_err(cmdqv->dev, "failed to request irq (%d): %d\n",
 				cmdqv->irq, ret);
-- 
2.43.0


