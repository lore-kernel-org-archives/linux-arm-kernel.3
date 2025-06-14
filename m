Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9354FC71141
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 14 Jun 2025 08:04:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=tM5a/VpJnPOQ1SwAAILFReHvHS4NIKun00hNORa/tMM=; b=RIJIjE+5Wrwu3e1Mqm1fVxKyaT
	BDh2MdvOmboJxoqbEdKMEOn+SW9jASIGQ6tD/bAZVWIC4B3fNIo3mXoG0cgNcVs3xi7pjobipG2tL
	ZozVYLF+hWzBd0ZpeWZkMWvXcukzDqKVNY9OkwOh0dlCxg5/Z9IQSWOZnlcoLOWaYjNE8ldQmh19s
	Iz4biZwB1HDd6EGfQDnnuYqTbbiqavOZgk+gI8YPPz/46WC1zX10So4Xkvk/RBMRfaX7I7w2Wt2tI
	HaKjov2jy3JiLPJbbQv5J8gsRPxA3e2GZDNNTtxfNEaWScHsNlf3k9QM2gEXV6UaNB3SQ362+UfdD
	+flgOayA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uQLs1-00000000xTG-2KgE;
	Sat, 14 Jun 2025 08:04:09 +0000
Received: from mail-mw2nam12on2061b.outbound.protection.outlook.com ([2a01:111:f403:200a::61b] helo=NAM12-MW2-obe.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uQL7M-00000000rZC-3vPF
	for linux-arm-kernel@lists.infradead.org;
	Sat, 14 Jun 2025 07:15:58 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=JWW9jgZv8CR5SMJt6LAg1WEbg3Q1VAQMUpri1mLONUhWsS7HBuJDLLkZbrVL2y4ydxEzJA6uXwmhpct6O/Y7rFqAuncCwg6c0Zz1n7FW0A1v4trT0pDM6pMES3AmfrDTgBVoHJgS8tVcfgUgiQ9DkNZLf2AZgnUydLxlvYYc/5fOYqrv58f1+LsjIuuQGNUVmNQAoBxJZmlMR3l7h/OPrqr1olyuX1ibiZyJGT4GUFXMzLT5X6K71FQDTVkCyuMi5bt6N3tFVA5mAFFoDatkmJmy+Fu4D/TXil6wzQCMyjB+mTfiRg25WirMRzUAx+xVbrBKZHTH/gMQx0VplYggIQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=tM5a/VpJnPOQ1SwAAILFReHvHS4NIKun00hNORa/tMM=;
 b=eb7k1B60jx/r2FIuewMMJV8FGGCpDe8hytnR9zsM8y+s6h2PTwZvTguTZjdKWvcs6L+doWp4OkZNwsL2C+copkROqfcvqPk5XMSQlMKdx2FMnGlRq0qMCeS4KG40pa/yAbVROjVQvv5Lb2kv+IPC1XchJxBdALsYdTbiieaP5rwb7FD0ExaAasU58wrVUN8Jwbev4rccIoaBPLbVoyHBQIAdIbfJ1wNsoKmC83RZBOq0eopn8/EsCSg+paUXv0Vkhw+1zDw0m/+JjdEzaPJ1l01rKxlK9NsPyrm72WvJL0h/j1Nz+8pSCynkRXhoFQNtPoYIC6rgmYklbDYrNAaN4Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.161) smtp.rcpttodomain=amd.com smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tM5a/VpJnPOQ1SwAAILFReHvHS4NIKun00hNORa/tMM=;
 b=kp5RhHPq/5bDQxpEcoTDG5otlrEIWQsR3medoqtxVm0qBZLMZA/w5F24qMlbda87AL4E6U8ywGwuyc7KZcYiDHCH8ye4NKxqNskcJnwJD1u0uuLxILMIDo0sJdSU7IQIw0rRY6mqy9m5ZgUQ4wNmGr5Sh5MoIhIsyalIBtwR5mgMF8+EZFzF0ESC6g3XmopcIwsGhOkkEGRsVN3f8HUsVkQGqZ6UUwxtV/aizLJeoHWi5iugOXYeIgrG0je2+DQWIAyK+zvVV6ObVTfbxSUiTVq3pBYRlUeVCaymagXxe6GV2gPvKI89o4nvBCFAP7QQalHTrbdj/HsNTJqdoGC9hw==
Received: from SJ0PR13CA0029.namprd13.prod.outlook.com (2603:10b6:a03:2c0::34)
 by MN2PR12MB4437.namprd12.prod.outlook.com (2603:10b6:208:26f::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8835.27; Sat, 14 Jun
 2025 07:15:50 +0000
Received: from CO1PEPF000042A8.namprd03.prod.outlook.com
 (2603:10b6:a03:2c0:cafe::fd) by SJ0PR13CA0029.outlook.office365.com
 (2603:10b6:a03:2c0::34) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8835.22 via Frontend Transport; Sat,
 14 Jun 2025 07:15:50 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.161)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.161 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.161; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.161) by
 CO1PEPF000042A8.mail.protection.outlook.com (10.167.243.37) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8835.15 via Frontend Transport; Sat, 14 Jun 2025 07:15:50 +0000
Received: from rnnvmail202.nvidia.com (10.129.68.7) by mail.nvidia.com
 (10.129.200.67) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.4; Sat, 14 Jun
 2025 00:15:39 -0700
Received: from rnnvmail202.nvidia.com (10.129.68.7) by rnnvmail202.nvidia.com
 (10.129.68.7) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.14; Sat, 14 Jun
 2025 00:15:38 -0700
Received: from Asurada-Nvidia.nvidia.com (10.127.8.11) by mail.nvidia.com
 (10.129.68.7) with Microsoft SMTP Server id 15.2.1544.14 via Frontend
 Transport; Sat, 14 Jun 2025 00:15:37 -0700
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
Subject: [PATCH v6 21/25] iommu/tegra241-cmdqv: Use request_threaded_irq
Date: Sat, 14 Jun 2025 00:14:46 -0700
Message-ID: <ef8bedbc09f8dd7103d915b646c4f5352cd00928.1749884998.git.nicolinc@nvidia.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1749884998.git.nicolinc@nvidia.com>
References: <cover.1749884998.git.nicolinc@nvidia.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-NV-OnPremToCloud: AnonymousSubmission
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PEPF000042A8:EE_|MN2PR12MB4437:EE_
X-MS-Office365-Filtering-Correlation-Id: 9aa348c4-5a63-48dd-7d19-08ddab134ac8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|7416014|82310400026|36860700013;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?6YHjDiqLkghOlrLPQrMmy2tIeV9SNU1iDXYLnJpgS0gGpyaDKinq8WQi+MNi?=
 =?us-ascii?Q?NFa93BVlfIGuwzTMkzUnZShCtRoU9arcjTns1oUTeIuSJZ9ckT78c79fz8WW?=
 =?us-ascii?Q?l9KPmIKjabnX4k+DkN01CD0H9SN+M0VLi5yK9xPfXsJd6ET9bai1TGTrBKzw?=
 =?us-ascii?Q?g4coizz4nEVIhmE/UPkY3JNu/vZW85KYvqixum/8mqJCZ5PwRtHNv51yOC/l?=
 =?us-ascii?Q?3tVqj8IQFJPrdUoRP+k/sx3qY4jz5PiV42yUfgNj/UZ6QzwriWSlRf5uveWm?=
 =?us-ascii?Q?fI/CIs382NYdchswytiGN5qaivraSwTzn2UdP8pE0SWlQUSdW99YW7sbyyMW?=
 =?us-ascii?Q?24nQxdj6xhjbgeOlJH3HX7Xi822OXz7WlcNcLz9xuJtyiNjluZWeO/eW3q5o?=
 =?us-ascii?Q?xUYtEFCD4skfanrRa/9ryDJ/y/WV8j9o+s0uNzVRCWOodH2z2JF4JODOnNYF?=
 =?us-ascii?Q?AD3TiXYIw5U31xivzK3/K4kFNjbNdjfW/hcHQeXx3SNP4YtDjivuRKwO7P5Y?=
 =?us-ascii?Q?Aghb9MFGF2LuuQVvH0U6gR2JmWxzLF65gEqHfu69q5EkAbVW3U6KGp5SKV3/?=
 =?us-ascii?Q?efBgtOSrF2J75nF2e0IUzlT/AwrcMdF8txz64QrDN6uF7ihHdCPXUMLZG78l?=
 =?us-ascii?Q?kageL+5/9T/ovssXWZ/p0peZYpd+lWTQtYaBYvl8r9jXFS9n+8vK+MgG4XmP?=
 =?us-ascii?Q?B3Y4RcWvSNpTj4KCIyZ00oUMIsRxtBTZn0C2gwRaFULMDu8TiNPkrRSK3+OO?=
 =?us-ascii?Q?hMFb8zYiuo7WSZYWqizzL2QcFGVK+oYLW+hTn9Ksv/VMiUVQ1Z6aHcrP9Prv?=
 =?us-ascii?Q?uJGoVSDvG2Z32Ik9DKxln4tB0ijrxgS2f8rPhWexdtuDBDs83D08vv9qnr0y?=
 =?us-ascii?Q?1PaIHWfoDwszY/T7YuVdR++bpma7pKob2bv6Rdl7Mj9dLGeuzUVLlaID//Cw?=
 =?us-ascii?Q?VXXNGHDpgmJpS9ad7CVmFUndWhv3SAhTnVvgbrm+Atca/oHiu+l3oFKos5o8?=
 =?us-ascii?Q?8eDzntvVr24yVjjbFF3grSjjyhFSoysnCAa16+F3O5Wop/PAtU38RHf9Z9ED?=
 =?us-ascii?Q?IiqV0DDfNketoCuNIArZPoJtTcJXIa9QA7AtwCCRnsPpOFwvA4tqmoXh8bzv?=
 =?us-ascii?Q?szOeAo6LFE2QkBTN6iD5l4uLAq4LDLYybkS8igvXYvoRvkqdcqGiTdqpg7KV?=
 =?us-ascii?Q?DrJJbeVphIMCvF2S2c9tJmrR0rlABUOOZboNVOPtBexhVxohdkO6/BX4/fVk?=
 =?us-ascii?Q?xf6fSIWAtaglVZc9XCdpj+VvGY/zCZvZdVlfbuzpMrzvIo2XSBrpTHC5a1bg?=
 =?us-ascii?Q?DSJI1EEWAaZHtBZaXd33OgiiLFVLVk3Y+D/YuQyTHmp6CuCpRg9qFbhiEcdy?=
 =?us-ascii?Q?4NbcPaUbMr0HbHDy2p4+MoHdhxOCjUrZh9oiwXGyudzxLwuHyhsqW/9YPjQc?=
 =?us-ascii?Q?xFp/KizDddRnbMwb9Btz1ypr/cB1MTp/IDo4Ub5vY7ZOElrjbz+p9VocfK+z?=
 =?us-ascii?Q?hSYVlxxdI7N/zgMRGDn3MzcR98I1j4MYIHfH?=
X-Forefront-Antispam-Report: CIP:216.228.117.161;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge2.nvidia.com;CAT:NONE;SFS:(13230040)(1800799024)(376014)(7416014)(82310400026)(36860700013);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Jun 2025 07:15:50.2858
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 9aa348c4-5a63-48dd-7d19-08ddab134ac8
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.161];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: CO1PEPF000042A8.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB4437
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250614_001556_977400_F7B77940 
X-CRM114-Status: GOOD (  10.46  )
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


