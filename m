Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BD9CFCD4F3C
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 19 May 2026 18:11:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:CC:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=XgRBkCmrVFIcU+m1ZUQvi0yOiHueQY9rHeengMjGAzc=; b=cnQTuolviz+jak/vRLE+Tqzcof
	ScsF+qW1xOJv+K+q/ED0B/PNOJgOoFua00VSIJWHU7xFsUweC5WYQrVokTr3NBpmBKMUuGW5Ped5I
	0B7mnevde0akiiW/WEjaA9RJzFXerMmJ4o2z8wDG1dVyabhWjBNKSWJnx5GpKhJS5YUAsJO+ifnyv
	mI7hmOsC2EcxeSECGcazLPS54AZXPSyDo2vGKAHR3Xg3PRCewtTy1BH4LG5zHI7GKqPtvnLquCqJk
	x8f8lr0LvGecSxBJbgSJWfeQxki2xPXgRVW4C7qlWnYYWAofZWWCQ/7k6RgbNUqpM+2k1bHpQoli+
	ET+EZeHg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wPOus-00000002TH7-04pm;
	Tue, 19 May 2026 18:11:42 +0000
Received: from mail-eastusazon11011000.outbound.protection.outlook.com ([52.101.52.0] helo=BL2PR02CU003.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wPOup-00000002TGV-2UiQ
	for linux-arm-kernel@lists.infradead.org;
	Tue, 19 May 2026 18:11:40 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=DgOGL+PKpaot+U9C4ENovXlUzOBCGalYKyUhnjHlzhFiXJ4gvrugykZQOMsoB2qRWRN2U2DLuDULdos9lATD+FhLiXXznPpbApEIJyWpqGgp+zwchSHw+RS6y2gTF9tCk9SA28vxR5xsb/zJ3jQme86H1y/HODAmagJKNejhuAW7xKcLtGbjCqPnSemkHE+mrJYSlhdsnaq2rXrJb5AgcQ/KlSl+LmuOOiDBaxJ7tRATTnVnnp69oem5zD2nZmzo0KkoHfNGyCaOi+SnWnR/n21QLSRcSxews/dli1x/LsFC5aPkmJo6lwYvg7/hJ4M9i5svmwcC/jlBq+QXYy7Wyg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=XgRBkCmrVFIcU+m1ZUQvi0yOiHueQY9rHeengMjGAzc=;
 b=KcXV/IJJ9lhyj1Ruq3o47jdIOVUjjl/8CZLa0NUBwkOvBGq3QOHSQAsZbqPE5A6HC3MHamwMqbGgMi8rzZcC1Y/g/r7OXdRyWxk4vHjgA2DLhl0NWbOK4QGiwF6bGH4J+8U9vpHOlwsvXrADr7jp4T8sZSgUmOay8DP6jtDxd/YoSKmTRIXMgSmhMC3/1R08Bky+D2cK9DqSQaHyi+7O2KSCtgI/pxpqouB7L+Kgl4aesbwU9ykWLhd4OfvAX9C2ZNRbddcghCB2R3QANnixx8zztnv3BymTlSB4BiCFXPPc7md0ETBAFhPTLxuKJhkAzfpJV/1LghwitdADNEU2hA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.118.232) smtp.rcpttodomain=kernel.org smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XgRBkCmrVFIcU+m1ZUQvi0yOiHueQY9rHeengMjGAzc=;
 b=teydhau/Uibmzk/z8q6BrUvBaD5xyTSg8pAek0X3fUHeKVoBL+aLWAhLpjigiZ1O96Te6bSgm0pIe0swdhOrpCIE4GIe4YCEI4AEO7IyvFYInl6QvEVE3bTHwJnauIlPay8Fw1/MBJQO7i3Xy22JnSA58D47gYSpgwgoDcZweKm7q4OmBi6RFJIj2/oRViJT0rZTZkecYyec5vtW0LOyMdRZclcBPKKZGbIjzUtlCZr4IrBAt08Y4SbVpwui2ToxafsJpE/z6EEEs4OoujS7F3DbjvdS/1TYSuX7PDRQ9XoQlUaq8GNKA0P8MY13ikQO+A/OzzXtAIj8jh9nGUg1Fw==
Received: from BLAPR03CA0176.namprd03.prod.outlook.com (2603:10b6:208:32f::26)
 by LV2PR12MB5991.namprd12.prod.outlook.com (2603:10b6:408:14f::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.25.23; Tue, 19 May
 2026 18:11:31 +0000
Received: from MN1PEPF0000F0E4.namprd04.prod.outlook.com
 (2603:10b6:208:32f:cafe::65) by BLAPR03CA0176.outlook.office365.com
 (2603:10b6:208:32f::26) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.48.14 via Frontend Transport; Tue, 19
 May 2026 18:11:29 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.118.232)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.118.232 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.118.232; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.118.232) by
 MN1PEPF0000F0E4.mail.protection.outlook.com (10.167.242.42) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.48.11 via Frontend Transport; Tue, 19 May 2026 18:11:27 +0000
Received: from drhqmail202.nvidia.com (10.126.190.181) by mail.nvidia.com
 (10.127.129.5) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Tue, 19 May
 2026 11:11:11 -0700
Received: from drhqmail203.nvidia.com (10.126.190.182) by
 drhqmail202.nvidia.com (10.126.190.181) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.20; Tue, 19 May 2026 11:11:11 -0700
Received: from Asurada-Nvidia (10.127.8.9) by mail.nvidia.com (10.126.190.182)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Tue, 19 May 2026 11:11:10 -0700
Date: Tue, 19 May 2026 11:11:09 -0700
From: Nicolin Chen <nicolinc@nvidia.com>
To: Jason Gunthorpe <jgg@nvidia.com>
CC: <will@kernel.org>, <robin.murphy@arm.com>, <kevin.tian@intel.com>,
	<joro@8bytes.org>, <praan@google.com>, <kees@kernel.org>,
	<baolu.lu@linux.intel.com>, <miko.lenczewski@arm.com>, <smostafa@google.com>,
	<linux-arm-kernel@lists.infradead.org>, <iommu@lists.linux.dev>,
	<linux-kernel@vger.kernel.org>, <stable@vger.kernel.org>, <jamien@nvidia.com>
Subject: Re: [PATCH v5 1/6] iommu/arm-smmu-v3: Add
 arm_smmu_kdump_adopt_strtab() for kdump
Message-ID: <agynvTrzP3FGtQEi@Asurada-Nvidia>
References: <cover.1778416609.git.nicolinc@nvidia.com>
 <0582326eeadd4ae2b16fd4914e9bd46da5a251d3.1778416609.git.nicolinc@nvidia.com>
 <20260519171003.GD3602937@nvidia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20260519171003.GD3602937@nvidia.com>
X-NV-OnPremToCloud: ExternallySecured
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN1PEPF0000F0E4:EE_|LV2PR12MB5991:EE_
X-MS-Office365-Filtering-Correlation-Id: fac5f49c-0624-4548-51ba-08deb5d20bcd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|36860700016|7416014|376014|82310400026|1800799024|56012099003|22082099003|18002099003|11063799006|4143699003;
X-Microsoft-Antispam-Message-Info: /ZXA4OS3Uy2k50DrO4VwNyabwROzYeQ6OKmkj6fqef1h3/aPs/az2GPwyPAxMfwPvLoCRIK/8vgrrZQ+lIyZ74eqJQ3aGbkKwRxx4Pj8bXPTk6kYiq7r5wFzzTtSEOu//3tMsV/viSY6ZrW2QfRHScwFhBuJ1HqNy1zH2wGx7jAIy1UYxyKdm4ssck2/P3ODqR+pwN96lT4BwBA09oSd7E/MkbPV70qHrAiexyWZeeqIOlAIEU7jN+1QyPjQhN06vwtYO0PdT32OxWUTF4AoxgMGWyl7bvzzt+wty40+9H7BtRLdVH1UzNqOpRE9QQpDW6fobrdaVKK2pSKtGXmpAchXKznOu9O5lXRSjhDQGROnQZPiG124e43Z/xNErEay+zSFKHyNoNN7But2ObIAs71kZYzAz6tV6YTnBkTqNWpepXO/8LFRRw5ObYTrJTPE+3F5IvrSA6N+E3HbQaRhCgBye8+xBtxOFELIxF2iV7o6zV9xQHqU756ofjFF932JmmcIGjuMLK3e4lEIGSUA2c+mJOHdV/wgpYY3c2eCImGiqc+aWm6ZVvarF6j3cVy/TxUjifShT+pCEoIVFXWNv3IRIl7iGUGWJxhgpctS+WyL0j7yEY9wwilpccGCFjb22kql61F05R9IwmwX9KgNaW9Ym740QQBlgC1VtoU0oANLe1zoFaSH+6QhVCIFLz2iTHt6HSLCFkkHU7qApVbczme8pjuJpQ4sCalaGMxaK58=
X-Forefront-Antispam-Report: CIP:216.228.118.232;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc7edge1.nvidia.com;CAT:NONE;SFS:(13230040)(36860700016)(7416014)(376014)(82310400026)(1800799024)(56012099003)(22082099003)(18002099003)(11063799006)(4143699003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: wry8nhhLmVoy/p9IFMMi7asHaX1ZgZNVhAC5VpB5ZjPWbQbFCFe5yX+cVp1WWEe0hHuqS9v9UCB1Ab5zp4QuD0QyDvywg/CThbghOp8D2gJwN5OYWtmSEDvV2/soAkrUqswoQatXuivXPsNTHKy7fEYVFVzhCSqdm2QGcCCvXoeazfcRqsftqsXFe2ZH7m7JLqDzlbXrw/aJFRKdZfBzWUDMeRoz8XB+Gzck7OLYotj6RjwpMStZE4k9D98TV+kYTxZ33IgCysy6Px6uxjRVVRlNoI/v1/nAGJytLBzxZscsLLntn8+IDxc7qjZnsbTZ8+7XJGXTRYqZAene620rjQLd5ZFWn+Mq0SXiTQkzx9mDqUPcLIZi1xNFP+aspRn76lYlXP/ElHUGvwiGfIC4AbmS5Sgt4K1e0pUMsJBHnOb67zJkEqkpAmHbHQsGenQj
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 May 2026 18:11:27.6898
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: fac5f49c-0624-4548-51ba-08deb5d20bcd
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.118.232];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: MN1PEPF0000F0E4.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV2PR12MB5991
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260519_111139_646136_6EB466D1 
X-CRM114-Status: GOOD (  23.40  )
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

On Tue, May 19, 2026 at 02:10:03PM -0300, Jason Gunthorpe wrote:
> On Sun, May 10, 2026 at 02:23:00PM -0700, Nicolin Chen wrote:
> 
> > +#include <linux/dma-direct.h>
> 
> Nope, never do this, it is an internal header.

Hmm, I have included it for a wrong reason, yet it does mention
"IOMMU drivers".

/*
 * Internals of the DMA direct mapping implementation.  Only for use by the
 * DMA mapping code and IOMMU drivers.
 */

> > +/*
> > + * Adopting the crashed kernel's stream table has risks: the physical addresses
> > + * read from ARM_SMMU_STRTAB_BASE / L1 descriptors may be corrupted. Reject any
> > + * range that overlaps the kdump kernel's critical regions.
> > + */
> > +static bool arm_smmu_kdump_phys_is_corrupted(phys_addr_t base, size_t size)
[..]
> Something like this should not be in the smmu driver, this is some
> core kdump code. I'd drop it, I don't see other drivers doing this?

OK.

> > +static int arm_smmu_kdump_adopt_l2_strtab(struct arm_smmu_device *smmu, u32 sid,
> > +					  u32 l1_idx, u64 l2_dma, u32 span,
> > +					  struct arm_smmu_strtab_l2 **l2table)
> > +{
> > +	phys_addr_t base = dma_to_phys(smmu->dev, l2_dma);
> 
> The thing stored in the L2PTR is a *phys*, the HW doesn't support any
> kind of translation. When using dma_alloc_coherent we never get a phys
> so it uses the dma_addr_t and assumes it is == phys.
> 
> But on this flow this is *phys* and should remain phys. Never touch
> dma_addr_t.

Fixing that and other places too.
 
> > +static void arm_smmu_kdump_adopt_cleanup(struct arm_smmu_device *smmu, u32 fmt)
> > +{
> > +	struct arm_smmu_strtab_cfg *cfg = &smmu->strtab_cfg;
> > +
> > +	if (fmt == STRTAB_BASE_CFG_FMT_2LVL) {
> > +		if (cfg->l2.l2ptrs)
> > +			devm_kfree(smmu->dev, cfg->l2.l2ptrs);
> > +		if (!IS_ERR_OR_NULL(cfg->l2.l1tab))
> > +			devm_memunmap(smmu->dev, cfg->l2.l1tab);
> > +	} else if (fmt == STRTAB_BASE_CFG_FMT_LINEAR) {
> > +		if (!IS_ERR_OR_NULL(cfg->linear.table))
> > +			devm_memunmap(smmu->dev, cfg->linear.table);
> > +	}
> > +}
> 
> If we have a cleanup function why is it using devm? Call the cleanup
> function during remove too?

Dropping "devm_"s.

Thanks
Nicolin

