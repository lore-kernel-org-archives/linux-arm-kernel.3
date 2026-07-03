Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DA3FEC43458
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  3 Jul 2026 05:32:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=XDmi1qOMqU+TFJl+nhjVsxCcb6m8FjYYGcjO/oHi4AI=; b=yqMoRqTiyC16E+vuoTD+ZJ36yI
	EBlDvqbxwbLU6vrXfZhOOBuRO2IV7Q+EoJNpRb9ANvZZsOONM0+sA08jtuuKIZ7zZSXWR3zFB6bD4
	gpD+pfMYkmlivuLLBN/WOi/+AZpY2XyVN8Sfn+YMiLLXs1lsRsS3Nocw5+dR50J2YMKBU2xH8b0DJ
	Xb7Fxl/tc0LVBB5HK4YrLFbQs5pKfNtSTZIlhPoa+e7tBNI7qlfT4MiXel3FiW4oRUOw6bXUNinkW
	YYKRgcUmrXyVlFHyMmuvu9ZHss0BuJPsvWTlJCCqSaRUt09CZsLuUS/DHQRE9pcVnG2BBXxTeqOlh
	4K69omZw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wfWVk-000000064sx-1Nnc;
	Fri, 03 Jul 2026 05:32:24 +0000
Received: from mail-southcentralusazlp170110003.outbound.protection.outlook.com ([2a01:111:f403:c10d::3] helo=SN4PR0501CU005.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wfWVZ-000000064fV-44lO
	for linux-arm-kernel@lists.infradead.org;
	Fri, 03 Jul 2026 05:32:15 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=jQ54LE2mafPxsCGnwXC4JRDI7RloU9aCo5U0hzWOwOuMkpaz9gurah3JvQ+UcyLblnYsB2E0sgfEdyEFj5ngxNbJ160EtJPRiZShvJuBaS/1DrzJ7//1WrP6ePI7cYMZpySEaZocZBYC+KhhHSjoNpgNXT/Es1WW6qKVmEpkClcJjt1DpoxIA7/qJ4bNJkk3oAQsu9ZxkhXY9Xs6eRO/dft1EWcEJIehKuJdIIgZkeGOiEqgYM8gqckH9KEr+Hs5r3bHdrR0FN+Wbggr3yZVdrz2tqFHfL0Spy1/vvaQMeHB0BXDb1zZW6QKNAk0JckccJ0NnLfg/Kbgiv9QQaRTsQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=XDmi1qOMqU+TFJl+nhjVsxCcb6m8FjYYGcjO/oHi4AI=;
 b=nSl1c5W4TxcVlbY4MHorLg5NNjFMDa5FVqtOby37FmliqnVEfqiKTRj6JpHJ877XrR/OSrw30MMSQTkLR7bg7vWF3t5w6vybuIJUYifL8q+xDk49ieHHx3CgXu3WO/AasG2GUX9mb5E9M6obc6UiUho5un7a5FO8ISHQTKO2NavQX0bE4mLF5ltKseSmar5tPEookUcGGerTvNTAtbbIpahwOQ3cfdqr600R4eCTZD8vY0ldzkAnGwq8bftuxPqIPAQke3xd1RGiLApVICUIfh8wpH8EBl68gTrOgoOou3xu2q+QEHdflp0elf0CzXbbzIs2oUN+iY586etAwUBi/g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.160) smtp.rcpttodomain=kernel.org smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XDmi1qOMqU+TFJl+nhjVsxCcb6m8FjYYGcjO/oHi4AI=;
 b=kJRlAt0oJ2zz1S0rchMmz/mmauMMmSb2mV4QXlnIDxLc04GzebL8ISNvXrVA/XXDesPunLVh2r4D6EnhHUxD9V9SQLaTGpvCqSSRGrAh5Cg1jQq7A/2Hw5daSzQ5+UG45OVC0BcqJ02VbASZV58YV5NhnIslaFy2SLTjeDcLAPIL7tWLQ7HkfeyQYOqwRv/pPK/B6cU5BV3dxyEqoLHzd5xULA8QmxoCFxZUISCHDrPxhkq3oHRiY8yhiNdAyQFrXyq8oBriWSX7+4N9k2BOLCNyhbWro9KuZZvLZl/DEHwoW08sohX8r9KSYuGQ+SeYUgyH8kKjfV5eOcvO+St8ug==
Received: from SJ0PR03CA0010.namprd03.prod.outlook.com (2603:10b6:a03:33a::15)
 by PH0PR12MB8030.namprd12.prod.outlook.com (2603:10b6:510:28d::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.181.8; Fri, 3 Jul 2026
 05:32:03 +0000
Received: from BY1PEPF0001AE18.namprd04.prod.outlook.com
 (2603:10b6:a03:33a:cafe::6b) by SJ0PR03CA0010.outlook.office365.com
 (2603:10b6:a03:33a::15) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.181.8 via Frontend Transport; Fri, 3
 Jul 2026 05:32:03 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.160)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.160 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.160; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.160) by
 BY1PEPF0001AE18.mail.protection.outlook.com (10.167.242.100) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.181.6 via Frontend Transport; Fri, 3 Jul 2026 05:32:03 +0000
Received: from rnnvmail203.nvidia.com (10.129.68.9) by mail.nvidia.com
 (10.129.200.66) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Thu, 2 Jul
 2026 22:31:50 -0700
Received: from rnnvmail201.nvidia.com (10.129.68.8) by rnnvmail203.nvidia.com
 (10.129.68.9) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Thu, 2 Jul
 2026 22:31:50 -0700
Received: from Asurada-Nvidia.nvidia.com (10.127.8.11) by mail.nvidia.com
 (10.129.68.8) with Microsoft SMTP Server id 15.2.2562.20 via Frontend
 Transport; Thu, 2 Jul 2026 22:31:49 -0700
From: Nicolin Chen <nicolinc@nvidia.com>
To: Will Deacon <will@kernel.org>
CC: Robin Murphy <robin.murphy@arm.com>, "Joerg Roedel (AMD)"
	<joro@8bytes.org>, Jason Gunthorpe <jgg@nvidia.com>,
	<linux-tegra@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<iommu@lists.linux.dev>, <linux-kernel@vger.kernel.org>
Subject: [PATCH v1 08/11] iommu/tegra241-cmdqv: Require exactly one Stream ID for a vSID
Date: Thu, 2 Jul 2026 22:31:34 -0700
Message-ID: <3177c49c4d9f24b1dc001d54b5ac30e5061feb7c.1783054570.git.nicolinc@nvidia.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1783054570.git.nicolinc@nvidia.com>
References: <cover.1783054570.git.nicolinc@nvidia.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-NV-OnPremToCloud: ExternallySecured
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BY1PEPF0001AE18:EE_|PH0PR12MB8030:EE_
X-MS-Office365-Filtering-Correlation-Id: a64bdc81-869a-49b4-f876-08ded8c469d8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|82310400026|1800799024|376014|23010399003|36860700016|18002099003|22082099003|11063799006|56012099006;
X-Microsoft-Antispam-Message-Info: qC2zMqExHpYcVQ9xJvEmsrkKUa6i3yaKD87l1Ev0mTROsBk0urunYywbf3Nve9vdCcFpjTLXM7DbXGy/ILrIvmA9IfKVuyC8HfDuFp9tESsdcAflE22gwIKEE+aW+s0AzeoBxosxQGA0Vs6HYSkuBxckIYHr6BNSwj67+UXK1w4pdVMJinNyeiSQkJvXLeJjHRbEFRBFJJn6dJ4cMj2nhidSoALUittz/mOemXql7tF/6mAO8IBxppMFZ+NNlCcn78FW3la66nWUa7Y4K6BsJkNeDsf7G6KcFOFSMbYLDwDOaPmuF6Se4N7qCxwN6pWCA2jhf6k8P40fwbb/B7LpaUUzQMTt2zp4QOzr/d2obbnlqlpR5rXZ8rkSEWALvxErH7Ycf4f7xRCkQg+Nxomb6C2TwgL7YPpdj52ocDy9rCxTStPFUj0bvrGJny60mstBHUZwFr4EIYYX8JCaYkEM5Z87kCJSNiirL9Uk4VXQGLnc/SiwqhtWKXHTQfq0a0CV8F8/7aX//v+OFs8vP0t4zAff/m14kRaqciq64cQIww35FQ6e9w/Mu2wXbJaQ6fHX/Eu1QiajUXtn1MbjrD6aC5lr8mswRFyrcT6mPeiGTtJsFA6B2vXQE63iXGkyYLU3i530FMe9FBw61VA0QbV44X/GV8qTVx1yIry7VkNXWAcoTpHhNjZfZygL0ET8eOjKCKi4Xt744+SnEDKHIsMccg==
X-Forefront-Antispam-Report: CIP:216.228.117.160;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge1.nvidia.com;CAT:NONE;SFS:(13230040)(82310400026)(1800799024)(376014)(23010399003)(36860700016)(18002099003)(22082099003)(11063799006)(56012099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: REgfUfiJelojRH2/OxrdPpXGDWwxQ7UM/snVhTP4rZilOIxZB9HLlS10UzdMl230hIlP2nbBtnyDAyM2g2+wWLmDMH8d+2yATxyX2qrvs8g2HXfqw13MulIxfsDL5uDKkyK/Mcb+bjWqoDvGdL/5aZKHYoi7CHIr8sDuwQnsMmalsn3mEM4upJpxuZxThtFDNrgCJg9JDYOi95RZNsfUiKhOOsWl7roIkEIH2fBsM83rbjirLLyb1rThy/4uarqb5ZaRW8G/vathTjfSmr8HvKtEwCJnVBLzqCj6fxRiZjH9RG/D189owO8jugmAgRWLOYTXdWKTe0EvTDJn6PFXpNu7pS0MMqZb8f9VKs1VHEMJERcgk6JA8IjZZwq/MNLDal0fiE8giS7vNmfm6BN9Vdc/SOyRoohEC3JO4wCoqyKEhQMRoXZ13aeZfkUQ4U6C
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Jul 2026 05:32:03.3640
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: a64bdc81-869a-49b4-f876-08ded8c469d8
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.160];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: BY1PEPF0001AE18.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR12MB8030
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260702_223214_030499_B30764B7 
X-CRM114-Status: GOOD (  12.78  )
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

tegra241_vintf_init_vsid() maps a guest vSID to a single physical Stream ID
taken from master->streams[0], and only warns when the device does not have
exactly one stream. A device with several streams gets only its first one
mapped, so a guest vSID invalidation cannot reach the others' ATC and IOTLB
entries; a device with none makes master->streams a ZERO_SIZE_PTR, read out
of bounds.

Reject the mapping with -EINVAL when master->num_streams is not one, rather
than warning and pressing on.

Fixes: 4dc0d12474f9 ("iommu/tegra241-cmdqv: Add user-space use support")
Assisted-by: Claude:claude-opus-4-8
Signed-off-by: Nicolin Chen <nicolinc@nvidia.com>
---
 drivers/iommu/arm/arm-smmu-v3/tegra241-cmdqv.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/iommu/arm/arm-smmu-v3/tegra241-cmdqv.c b/drivers/iommu/arm/arm-smmu-v3/tegra241-cmdqv.c
index 812cc500b4a1e..aa0568e328356 100644
--- a/drivers/iommu/arm/arm-smmu-v3/tegra241-cmdqv.c
+++ b/drivers/iommu/arm/arm-smmu-v3/tegra241-cmdqv.c
@@ -1249,7 +1249,8 @@ static int tegra241_vintf_init_vsid(struct iommufd_vdevice *vdev)
 	if (virt_sid > FIELD_MAX(VINTF_SID_MATCH_VIRT_SID))
 		return -EINVAL;
 
-	WARN_ON_ONCE(master->num_streams != 1);
+	if (master->num_streams != 1)
+		return -EINVAL;
 
 	/* Find an empty pair of SID_REPLACE and SID_MATCH */
 	sidx = ida_alloc_max(&vintf->sids, vintf->cmdqv->num_sids_per_vintf - 1,
-- 
2.43.0


