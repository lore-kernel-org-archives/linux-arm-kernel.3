Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6C3E5CA0ED1
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 11 Aug 2025 22:04:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=L9gmiu9GdCmNl1PKB8vQ7X/jijLW7P06yyJPrAUqBug=; b=PXFOG+1vu8kK1WuKsXNeUz7vKw
	XvNA/uPZJagTM4o4K4tYBUFdO6jOuMycppif1kZ9kNGcS7OsHmyTb+vv9N7h+fEQShcdWkl9PY83s
	EwXvTDLiohZFFnQDj+/GixUN2kO9CyCWVcjRCOqptAD/q1AP4G5e+Mbdc9MEf2jenKg+ClzKBsJVC
	saAZBJmhi+Brj3Xqt45/qWW4tvz3QMSnpTTyFwN/6hEUEMcns8+ggJQk97P846edcqS8clHUC13A8
	rKSOyfXPZQGtnMRIckHtSPjKGQxA5fCl5ZGgtDMN1uin3/29MleXUKIHpgIlI7RMxoBz6sj3Co9/e
	Im4ZMj2g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ulace-00000009Cd9-0Y4w;
	Mon, 11 Aug 2025 22:04:04 +0000
Received: from mail-bn8nam11on20605.outbound.protection.outlook.com ([2a01:111:f403:2414::605] helo=NAM11-BN8-obe.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ulX6O-00000008l9H-2rJH
	for linux-arm-kernel@lists.infradead.org;
	Mon, 11 Aug 2025 18:18:34 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ed5bOvcJwxytCZLIU01DnsDxko6QvwkL4EIknq2zLZ1EcMY4d47KjGMadzQul3WL3o/lMSDmKHkmL8jNGErGqUyR+FiAwCJjs9YCb4U1Fimj0Jl0uWUhxgownTtCk7TLnvxuG1nMkmMdFM43jC2yM9CyRab9cAmvUmibaL7X5FQNIskKG26rDVIAHaUCN58+ULYhBNFstwq6m1Cn1MOn8yTIr61hYzLNG/qsxEy9lHBl4XMe2bvsC6GvfvHSmzCL0nm0TyTeDFYUOfGxMSyscn35Kzaof+C/KsdJOS2JJXSAMdbrbeBF5Z1tC7EUo/Sh81mK1jPEuBEgV0W5FUszsQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=L9gmiu9GdCmNl1PKB8vQ7X/jijLW7P06yyJPrAUqBug=;
 b=EBtZG1jr6GMRB3T1slZelWD0BnOGxYudEgmC0qjqiaoGwKA6zvAVsw3UrThS8NqkaPMBxSLCrRymrsodSjxdIWy9HvrAWLCZwFDxSr5YCFzyIHCdiobc+wmvnHDYtDfhrhhqJA4zPs1PzLSNB4WD7cHHJAFDPUkAOauJMvILomD1nJnn2lgTrESwIQHfETQeQP59fk0Plqxl+ENzMb50WiYLVk8eFrdJFbehxqTFDouc2mDUdPMCE5W252snVjpwtJhJyLwQbUgET3B6tstfH7hOkjJYY95rnUCbS/8euLODipw6vrCZ7lIhn7HcUfOyqkY/XoofKb85Ptlxibq3Tg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.118.232) smtp.rcpttodomain=arm.com smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=L9gmiu9GdCmNl1PKB8vQ7X/jijLW7P06yyJPrAUqBug=;
 b=q+79YMxYrOLSuUTbTI0VKHdGWEbJH9Rv8526EeUeFTe2V7sbVVSwdHp2RObEFM6eMZgrD14cF3EujOoFrakhkUzQLSCsfJyohvNR/er9z7AQJN7JYuT/6URMlCebcMgHQ3bHxuy4XyQut4FmfXTzeb2NFM8Qbc43kXu4y2UfrMeZ8+KfSc2bER0ZETmaHVjSSjMCweYg4XqCPVWQ6A3TwJP+8YdHhKIdj/T3Fj3urx0SbmbiyE8EbMzhViNYII85sBvGJwXFsnP8JssHrKhk7hPBmP2N9A9b4r4inqUa7jpYjrx9HCkDHiNQAXC+ZNK7MVhz4nbL6B9lugx/2Pu5MA==
Received: from SA9PR13CA0042.namprd13.prod.outlook.com (2603:10b6:806:22::17)
 by SN7PR12MB8770.namprd12.prod.outlook.com (2603:10b6:806:34b::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9009.21; Mon, 11 Aug
 2025 18:18:26 +0000
Received: from SN1PEPF000397B4.namprd05.prod.outlook.com
 (2603:10b6:806:22:cafe::33) by SA9PR13CA0042.outlook.office365.com
 (2603:10b6:806:22::17) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9031.12 via Frontend Transport; Mon,
 11 Aug 2025 18:18:26 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.118.232)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.118.232 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.118.232; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.118.232) by
 SN1PEPF000397B4.mail.protection.outlook.com (10.167.248.58) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9031.11 via Frontend Transport; Mon, 11 Aug 2025 18:18:25 +0000
Received: from drhqmail202.nvidia.com (10.126.190.181) by mail.nvidia.com
 (10.127.129.5) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.14; Mon, 11 Aug
 2025 11:18:08 -0700
Received: from drhqmail202.nvidia.com (10.126.190.181) by
 drhqmail202.nvidia.com (10.126.190.181) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14; Mon, 11 Aug 2025 11:18:08 -0700
Received: from SDONTHINENI-DESKTOP.nvidia.com (10.127.8.12) by mail.nvidia.com
 (10.126.190.181) with Microsoft SMTP Server id 15.2.1544.14 via Frontend
 Transport; Mon, 11 Aug 2025 11:18:07 -0700
From: Shanker Donthineni <sdonthineni@nvidia.com>
To: Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>,
	Marek Szyprowski <m.szyprowski@samsung.com>, Suzuki K Poulose
	<suzuki.poulose@arm.com>, Steven Price <steven.price@arm.com>,
	<linux-arm-kernel@lists.infradead.org>
CC: Robin Murphy <robin.murphy@arm.com>, Gavin Shan <gshan@redhat.com>, "Mike
 Rapoport" <rppt@kernel.org>, Shanker Donthineni <sdonthineni@nvidia.com>,
	Vikram Sethi <vsethi@nvidia.com>, Jason Sequeira <jsequeira@nvidia.com>, "Dev
 Jain" <dev.jain@arm.com>, David Rientjes <rientjes@google.com>,
	<linux-kernel@vger.kernel.org>, <iommu@lists.linux.dev>,
	<stable@vger.kernel.org>
Subject: [PATCH v2] dma/pool: Ensure DMA_DIRECT_REMAP allocations are decrypted
Date: Mon, 11 Aug 2025 13:17:59 -0500
Message-ID: <20250811181759.998805-1-sdonthineni@nvidia.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-NVConfidentiality: public
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-NV-OnPremToCloud: ExternallySecured
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN1PEPF000397B4:EE_|SN7PR12MB8770:EE_
X-MS-Office365-Filtering-Correlation-Id: cff6cffb-0de7-49aa-401f-08ddd90376d7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|82310400026|36860700013|376014|7416014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?Dd3JUamCYBzQY4wzZuwgeXBuACQW04eqO3n67omVXud4YpUFYh/yB5qTNb9Y?=
 =?us-ascii?Q?7K8H7l7M/f73x0dG023HTA8PzFTYpFCbdcwPlW6jwBypAu25yiwZp/9qhOaS?=
 =?us-ascii?Q?h/rveAid/S0vC6yjpn9nznq5oSRFoEyOgwtq2P35qpfpGrJfM058/kniQ3Sj?=
 =?us-ascii?Q?bohJ2qSo7mRN6/VHT2w6KqE2zkGFKRCMRDL66kjRCkqZX3hxZ/k16rqkKFU5?=
 =?us-ascii?Q?0WHlap8/JV7wy1IkncVN7gOwNjbOJiMUJotVLly4fDCDbBGZQihUOcNzUzQk?=
 =?us-ascii?Q?LsyBfb081fywzoZf3UPCyk1KC2MbcFsvHL9OEJzdSKQCuJucPHf0nDcgM2xm?=
 =?us-ascii?Q?iGQF6FzXap2DVcvAGzo51y5nxHJE7tVRIDkDpMJ/IzAddiEaxUThdSlXTddp?=
 =?us-ascii?Q?QpDTVbtNdyvxYOPtnOcHftU0+JbQa4pMhSKnfsnL8Uvp0VIpXdLCPQmb++tn?=
 =?us-ascii?Q?OUgDFGKn0pa37YwVs6l0qWCbjNpH7Mdu5FhFNFGaqXgR0ABAHpmElxuUngx2?=
 =?us-ascii?Q?kqcrubNBd+rPAcVC+57f9MadkORskmmeSIgfEGgcCKkAamcLio8Vp7czYTVe?=
 =?us-ascii?Q?fjNMQ7iXE7QT0Z8/NiiQVC843OpZ2l1EFkp6g45VPehPKy6wyEb+9pUDCawl?=
 =?us-ascii?Q?/AlxDKBNFHI6sO7SyrqYMiqB4uU+OcanI1wcqIshmRWpvffFDE7jt+HyXRSa?=
 =?us-ascii?Q?hByYrlWpl6zLSEUm1o0ECgTP8yeaeegwdXKP/7a3H4oOS6LqS04BU9NO/i45?=
 =?us-ascii?Q?QRgkJZiMU3Gjz9VhSBpLak95+/GFgCK6nTFLpAgmBf03DfDLWtZl/8wLGq85?=
 =?us-ascii?Q?C8bSmmYHa02IJY0aSyFT1Nx8/lPLKx/uER5WQ3QsgHSQF82z0pA1mttu/2gx?=
 =?us-ascii?Q?wnXOKC8gGAISDDMaAemdpe8wK2vj+7spNAlprNDQ+B6fZRiIXe3S+JKaCqRU?=
 =?us-ascii?Q?G+WW+0QPKT8hi84JZo0x/AvBJzDX2Iiuh2biyBXEqkKfP9zD+BsFgX4v1kQF?=
 =?us-ascii?Q?MDdn3hMFP8B/iVDIduimxcaxtV0/Nmg7ztNGhcoZzV4NEpN1074CjvU8D8vG?=
 =?us-ascii?Q?wNUdWzHNK5E+a+h8QjXENdWKYeQOBxYi/KlLscFqdOSQzI8QVgdMF7l0XqBq?=
 =?us-ascii?Q?N/Qa/23n7sUCTz7IGes7wyfiGh1R7YNeGQlWgEKj8AebP+Gp+Pmmx0n8c6wj?=
 =?us-ascii?Q?rU0p18GdG/wopt+2+avPwKM7cwn2mbKsOaME6xos3/w8wfvKuSdEl0uTc0Ev?=
 =?us-ascii?Q?Sdpbjd6DyB1AEgWTxA5/4VsctGwWO9vmsAmk/XhFY38I+gQ1U+F5L8PkXnEy?=
 =?us-ascii?Q?LIzAnpnIp+xA6D/KJtm/YYPrQm7B5VUES9X1lIaRMyzDhP24e57GPKJ6+BVG?=
 =?us-ascii?Q?BlROS2JDuTAsfVHWeb2nG2J2twtkSgPnWdgyFM+zQpcu28sauWW63xPW266Q?=
 =?us-ascii?Q?xHyBenXGeiUvXOPj6irRLswNtLhjJTSJrjQHhukxCXAtgB6ESR5NuNKtTBxR?=
 =?us-ascii?Q?ToT9gvVJoP2K6xIc/0gpPROCWal/FF193s8e?=
X-Forefront-Antispam-Report: CIP:216.228.118.232;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc7edge1.nvidia.com;CAT:NONE;SFS:(13230040)(1800799024)(82310400026)(36860700013)(376014)(7416014);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Aug 2025 18:18:25.6936
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: cff6cffb-0de7-49aa-401f-08ddd90376d7
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.118.232];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: SN1PEPF000397B4.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR12MB8770
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250811_111832_721882_963264AA 
X-CRM114-Status: GOOD (  10.76  )
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

When CONFIG_DMA_DIRECT_REMAP is enabled, atomic pool pages are
remapped via dma_common_contiguous_remap() using the supplied
pgprot. Currently, the mapping uses
pgprot_dmacoherent(PAGE_KERNEL), which leaves the memory encrypted
on systems with memory encryption enabled (e.g., ARM CCA Realms).

This can cause the DMA layer to fail or crash when accessing the
memory, as the underlying physical pages are not configured as
expected.

Fix this by requesting a decrypted mapping in the vmap() call:
pgprot_decrypted(pgprot_dmacoherent(PAGE_KERNEL))

This ensures that atomic pool memory is consistently mapped
unencrypted.

Cc: stable@vger.kernel.org
Signed-off-by: Shanker Donthineni <sdonthineni@nvidia.com>
---
 kernel/dma/pool.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/kernel/dma/pool.c b/kernel/dma/pool.c
index 7b04f7575796b..ee45dee33d491 100644
--- a/kernel/dma/pool.c
+++ b/kernel/dma/pool.c
@@ -102,8 +102,8 @@ static int atomic_pool_expand(struct gen_pool *pool, size_t pool_size,
 
 #ifdef CONFIG_DMA_DIRECT_REMAP
 	addr = dma_common_contiguous_remap(page, pool_size,
-					   pgprot_dmacoherent(PAGE_KERNEL),
-					   __builtin_return_address(0));
+			pgprot_decrypted(pgprot_dmacoherent(PAGE_KERNEL)),
+			__builtin_return_address(0));
 	if (!addr)
 		goto free_page;
 #else
-- 
2.25.1


