Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C035BCD98F2
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 22 Jun 2026 20:52:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:CC:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=P77wt6FdAz9SgVTfL6FTmZm9Ot3WjHVJ7/IbTsCFRSc=; b=DK0sCOGC8OCIMTbGi9i5DPsGB4
	TQZulRi1CY1RDFlnX6p0fmX8xhnKrDDDO2nUinbj3uIXTfZgnS4CNhBNwKnvO+IUm9LpMbpoc2gLo
	w59lXXPRL5v1ST0V+u5QzqTGK2Db24IvddBN4Jv5YrWk+bCmdWZrAOkB91BAmEVJsGnjuwd71VpOL
	JuAALENDJy/Ikm8ct45opTYCJugg1HInbwRnP2hJ3IdvONcShmQqycxoIQ42cuHZ1qkRauFv1AgTH
	hMBGBPgPsZljOCfW1s/EkrxiLTiDYLyhdP5CJ4KIMNk9uz57heJIr6jUAa9Qm3/GHKgxWCB+JFTqA
	vbO4n10g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wblcy-00000005NZa-18Rh;
	Mon, 22 Jun 2026 20:52:20 +0000
Received: from mail-eastusazon11011050.outbound.protection.outlook.com ([52.101.52.50] helo=BL2PR02CU003.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wblcr-00000005NYm-3bgy
	for linux-arm-kernel@lists.infradead.org;
	Mon, 22 Jun 2026 20:52:19 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=LNt0hnsnvybauxg4w/AfyMmnxLtl+6+j0yVrFQOWNnxrj9uXBb6aAgHd83HxyIUtEciEmXHT1OQNP1ZDQ23rGr8qq1VIFFCqERP8t+xsB8dVEkUUbOZUw6QbvLSab3bE8ZdA++LOwpgPqBBKuK8MClfEBARtHKHniUpO+KzEva8lkKqmchdBwNm+PZ1J16Nf3etSEgw9a5raH6KwaWeo29A5/Vg0+cumEmEX45vo75ti5uEGEGpOhHzVnQudLo0AiuQSG2nbIDM8kzOipQU0r9T7UldF6dX6UWPKhTKIJvNaQow0IVQOoeSnAgx7HQRqkkI4FaA8Gq/euwSLhIwOhQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=P77wt6FdAz9SgVTfL6FTmZm9Ot3WjHVJ7/IbTsCFRSc=;
 b=UWmnvEoZzN/WRqS7ryoIucwwtsBDjsJsV1l2o0jLc7NEnDTzy43btrHM6qJHgu5RjcmaP5LQFz9z+XrZIhrIvtSfqy7f804nvSh0QOYTMmeixZUWnPE27ddT5KloYhVRr6wO1wZA18Lu+qzMyCrqeCUp7IM0kAUt51KU+DmTpO8C3z6Nu/+m1x/rAXy+ETAqWoUaS8cjozy/oPSx5BZDUr6qwmhhF2l87iSvLNaCdmuyJlA2Pfb7ygtdRQP7DYaU1txw6QNbd+0ITALWrdGmcddahSlunNvBZeYKrZlYf2EZ3i8G4A4Q6njR9NDITi3YipjcxbW9rg1iGWLiE9MG0g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.161) smtp.rcpttodomain=debian.org smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=P77wt6FdAz9SgVTfL6FTmZm9Ot3WjHVJ7/IbTsCFRSc=;
 b=W+siVevaJR5ATqKasWCfJBw8cZ18TWPQraBW++G4KKwV95/hO3PGmzVHYW4uq2nIa8cSbpjKmbg9mHOp/wrzH+Iv1PH/hoMtWd8gqE4dHPWMmBKZoAKwniVg+AWPJKU/UuoAZ68srLfKzmYNbFcLrHzuiV//4FzcNJMU98nCRiRV6jEhgcaU0fOECsbpcpW9gzSFNUnhGqT1bZz4MPB/L9Dca7Vzh4O3CVmyorptFahFsxbBJySvXyCfvr2seKMSsrdMnYk0RbuvLyHCQD87nBLK1/qaCWajqdhK24ajzMKAd+eVZEfmAMooHLDEjdfcRKYbaZKRgu6R/lBtBK8uzQ==
Received: from BLAPR05CA0012.namprd05.prod.outlook.com (2603:10b6:208:36e::21)
 by BY5PR12MB4195.namprd12.prod.outlook.com (2603:10b6:a03:200::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.139.20; Mon, 22 Jun
 2026 20:51:48 +0000
Received: from BL02EPF0001A105.namprd05.prod.outlook.com
 (2603:10b6:208:36e:cafe::1d) by BLAPR05CA0012.outlook.office365.com
 (2603:10b6:208:36e::21) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.159.12 via Frontend Transport; Mon,
 22 Jun 2026 20:51:48 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.161)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.161 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.161; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.161) by
 BL02EPF0001A105.mail.protection.outlook.com (10.167.241.137) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.159.10 via Frontend Transport; Mon, 22 Jun 2026 20:51:48 +0000
Received: from rnnvmail202.nvidia.com (10.129.68.7) by mail.nvidia.com
 (10.129.200.67) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Mon, 22 Jun
 2026 13:51:29 -0700
Received: from rnnvmail205.nvidia.com (10.129.68.10) by rnnvmail202.nvidia.com
 (10.129.68.7) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Mon, 22 Jun
 2026 13:51:28 -0700
Received: from nvidia.com (10.127.8.9) by mail.nvidia.com (10.129.68.10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Mon, 22 Jun 2026 13:51:26 -0700
Date: Mon, 22 Jun 2026 13:51:24 -0700
From: Nicolin Chen <nicolinc@nvidia.com>
To: Breno Leitao <leitao@debian.org>
CC: Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>, "Joerg
 Roedel (AMD)" <joro@8bytes.org>, <linux-arm-kernel@lists.infradead.org>,
	<iommu@lists.linux.dev>, <linux-kernel@vger.kernel.org>, <rmikey@meta.com>,
	<rneu@meta.com>, <kernel-team@meta.com>
Subject: Re: [PATCH] iommu/arm-smmu-v3: Disable PRI when no priq IRQ is
 available
Message-ID: <ajmgTMrCUGqnBLiI@nvidia.com>
References: <20260622-smmu_pri-v1-1-14ad92b6043f@debian.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20260622-smmu_pri-v1-1-14ad92b6043f@debian.org>
X-NV-OnPremToCloud: ExternallySecured
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL02EPF0001A105:EE_|BY5PR12MB4195:EE_
X-MS-Office365-Filtering-Correlation-Id: a86c933d-63a8-4cfb-ba1e-08ded0a01401
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|23010399003|7416014|36860700016|1800799024|82310400026|18002099003|22082099003|13003099007|11063799006|5023799004|56012099006;
X-Microsoft-Antispam-Message-Info: Gf3jU11BG7BkxWhWUm0PXxsGtSMXcBa8fK5VwwxMjzdiy/mQ+Ng3zJbHwtUXpf770hMVTF3n55Mdfm1RZSxULqkNfKY83zo804HEEYpbdfI9OA3lKbPzzJp6wVUAvMpVjSvh1LF9Vh06tXiXuuMBZyTwoBxIP+PlehbaTjNSVd0TzsQG2oXT6Wqd6iAxLzToBOQqndj7b1tXjUlHPbJUJLjYjruFfo8gBsaSHcrIsTtSmKayCA2uNiAy1UGtBDKsxJIRIzFMDUKg5v4DyjckyQBH9q6JwORZnEA4xU1SHz0IBhZ6gR78RkqsG+boOK6qJ0W6/UXiRHqkjb9zbqFGp1kRF0LgWnT8mZ91SzitsNyZIORIBU142vnOGXB7quWV6OZJ0tg6/NQd0SGbjU9Q3dwYCehOb0ZHVp66EfTTGtttyD0pc+0tIh7FNQvME+67cULEUqGc41lFIaofAERweKA5QnMZz9JPaUpkPnUbYqsogxW3aLpgvYI1LDsuPuGGw5fgJkpBtWn5Dw5Ee6241yzQKcG3mvwi6tGaN/YUioRm7N2Jy0RsTKfFIbBPsJ4X6mpFCA0Mk5dTcVoI1KQNLZMK1gs6hVJh4iK5RqZkA3dSuUh1ZqYS1HfXGTmlbhtyFtcur5RQuIDG+s0LrdimgFqxM4hxS34cZy+/EVQbTJy3edGs8s7a0ZVvaA7sfsCIZwCflfnpai5izexgQCcz2w==
X-Forefront-Antispam-Report: CIP:216.228.117.161;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge2.nvidia.com;CAT:NONE;SFS:(13230040)(376014)(23010399003)(7416014)(36860700016)(1800799024)(82310400026)(18002099003)(22082099003)(13003099007)(11063799006)(5023799004)(56012099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: Aj3W2Uo7pDm6kGHTcRYlSWmWTwFlDjZUl+lvasTlCCjTKq1ssbCyO3P1M1luoe8lGQL3NGB3jFfjQShx4DSjTieQ6F7l2zvycIlt80mrYZCBZeqmGAtjvhrp2mBhoCayoC61jTm5NNWGSXUe7n0dCKEUvBWar6nWivKHzgdD8+l6cucGmRRW1qAczaxVcsih2/b67vAXWyTRykBWHTVb/GWA3O5XxafO11XHLYu2KCzxIEeiOKq2kYAkJz+svtVwWfIMn56yh6/hlHgaFQQU/w9XZgCV1Vc6ggkR+5+k8kZslRWpziBhJsDCfjHKWrFJc5aKAn3ehWpf7e0OtX0Z921S9f3URr9CxrLYQhKjK/vqTPx8ZZKMsLu6Xto7YBiz7vhZLQNjNk75LfG77YskyGpPod7OujIbahbrukvOaXiGTqNF1amofh4MkDQTQDCA
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Jun 2026 20:51:48.0799
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: a86c933d-63a8-4cfb-ba1e-08ded0a01401
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.161];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: BL02EPF0001A105.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR12MB4195
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260622_135213_930651_E09B2ACB 
X-CRM114-Status: GOOD (  17.52  )
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

On Mon, Jun 22, 2026 at 09:17:03AM -0700, Breno Leitao wrote:
> When platform firmware advertises an SMMU as PRI-capable in IDR0.PRI
> but does not assign a GSIV for its priq, arm_smmu_setup_unique_irqs()
> warns and continues. ARM_SMMU_FEAT_PRI remains set, so the driver
> still allocates the PRI queue, programs PRIQ_BASE/PROD/CONS, enables
> IRQ_CTRL_PRIQ_IRQEN, and lets IOMMU_DEV_FEAT_IOPF be advertised to
> upper layers. Page Request messages from devices land in a queue no
> one drains, and SVA binds appear to succeed while silently dropping
> every page fault.
> 
> Clear ARM_SMMU_FEAT_PRI in the missing-IRQ path so every PRI-gated
> site in the driver consistently treats the SMMU as PRI-less, instead of
> the half-baked stated.
> 
> Signed-off-by: Breno Leitao <leitao@debian.org>
> ---
>  drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c b/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c
> index a10affb483a4f..44bafbb38e242 100644
> --- a/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c
> +++ b/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c
> @@ -4659,7 +4659,8 @@ static void arm_smmu_setup_unique_irqs(struct arm_smmu_device *smmu)
>  				dev_warn(smmu->dev,
>  					 "failed to enable priq irq\n");
>  		} else {
> -			dev_warn(smmu->dev, "no priq irq - PRI will be broken\n");
> +			dev_warn(smmu->dev, "no priq irq - disabling PRI\n");
> +			smmu->features &= ~ARM_SMMU_FEAT_PRI;

This is covered by PATCH-7 in my PRI series:
https://lore.kernel.org/linux-iommu/cover.1779944354.git.nicolinc@nvidia.com/

FWIW, changing arm_smmu_setup_unique_irqs() alone isn't complete,
as Sashiko pointed it out:
https://sashiko.dev/#/patchset/20260622-smmu_pri-v1-1-14ad92b6043f%40debian.org

Nicolin

