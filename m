Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 90EE0CA0EFA
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 21 Aug 2025 17:06:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:
	Content-Type:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=w//tBuBuBMCMKVx7sYdRthPalOb73sIM+qaZhXwJ9X4=; b=nH8GFFBPjfywRMB8O8npU8QSD+
	kAnJbEXATqHJPVTb+uHMwwZaqbudTHDMT5g8H9AC4OjAgSfNJ5k+4mn5GfQgzZXV7qJnbENjYhGqH
	5JXPaq06WymEcE76XeKg8AMgQoHbJilH9ZSolx6j7o9725t9yKde6Zm/uUYc0Nj0T1564W+uFkG3j
	88NvYMceJBAHgIcP2B6/rlRijnQxoL25ODMLarm6QExeeTe64L4lX1/ZXqWtib2cHCya9JKlmNVdQ
	KsMfMKxc6vfSe/WGV1ai7SBWncuufs0JIvF95zTk7shqQM7BFEihowkvW6pvNc58zEg8mLigTLXZh
	1U/KYoxw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1up8kR-000000001jG-09ad;
	Thu, 21 Aug 2025 17:06:47 +0000
Received: from mail-co1nam11on20626.outbound.protection.outlook.com ([2a01:111:f403:2416::626] helo=NAM11-CO1-obe.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1up56S-0000000H0Yp-1eEm;
	Thu, 21 Aug 2025 13:13:17 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=IC9vz//5arzPCsHObm1c4+EpCPo6xBUNbec6VKxH1iK9gAReuNZskcKH5wQ4+givmWodwTzOfSTkNA4L8AQX6QWga5RbWTSEq1yZO9cmxp8Z6DnwX1LQKTp0t8BYiFLmUyR0rQsdqijoDiotBKIMvVOiesqMZ+knq3c3pCyXkewXfrUL8N0u/Kmhn39u+BCuVRwA87CIE0HCZNCQy4sd7zhicKJVay9DyTHgx9qvRV7gNx7VgAPgr/nxm6gKnLCVmOk/fl+X/Q/dTC9z1IJUjKTWafbpKt1XCXuN76wm40vy5un1kL5F7DN0KDuFg0Vv6Px6XrnHbGx30NX46+tdCQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=w//tBuBuBMCMKVx7sYdRthPalOb73sIM+qaZhXwJ9X4=;
 b=qS9x05cZ0d6Nyoxtcg8GPGxgr8rXjEVQoeksukz1HK06VNY08bMsDbG1DAPxNPvFqbj5aoMWfqGGBy6QxuZmnJ7jN2PoaPvkq+Cl0VFkeqfUS2wgpsUeboEg4wEOf3fBDf7SQ3NALLJ5w++2TS3KiTDZok0XsiPdm0lbOl9m4uVZ/HocVl4jSNOth31P15NqmQECvz5TJatQkWGHnXCiw1FXekJim30kJaBYLMpLj+MLrmreHLskoLh1le13M+9GGeTfhGLnBdXTZaHDtolycyv5mjP/a0nlWzmcZYYpcmI6Q9X/UKgQyVt7ZIJyvHMmxVubTZQUUWpdqvWBaSTxKw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=w//tBuBuBMCMKVx7sYdRthPalOb73sIM+qaZhXwJ9X4=;
 b=cEVMB0/ZPv9Pz7vxh6fP4f9t9TMLUZX0JtI7Zfi7tUweK96W5LCSLUSCpGYBqxduF+0hPE8vT5wEQWuDMff0qG/ZrwGhRCEGawJoH/ND5nr6eBeVjNsTvdEruXkbaKEBxDhigJbzoMrucOBzQs8fCiHLvLbivlziMUDz2pcOooT1siji0PwF/uc1OIfc0kVU1WAfJhK20yMRIAg9IX66lDiXPqCPBpKjXNVjHyG/oMLK+zBD8YggHq25X/HJcGSuyrS/DxhIve2eid30VxFw3hLA0+7xU1umZhq3iNVvYsuOYvbzSMfiSmYliGbp053BA3sVocWojsbFDUFltcLNRw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CH3PR12MB8659.namprd12.prod.outlook.com (2603:10b6:610:17c::13)
 by SN7PR12MB6909.namprd12.prod.outlook.com (2603:10b6:806:263::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9052.15; Thu, 21 Aug
 2025 13:13:06 +0000
Received: from CH3PR12MB8659.namprd12.prod.outlook.com
 ([fe80::6eb6:7d37:7b4b:1732]) by CH3PR12MB8659.namprd12.prod.outlook.com
 ([fe80::6eb6:7d37:7b4b:1732%4]) with mapi id 15.20.9031.024; Thu, 21 Aug 2025
 13:13:06 +0000
Date: Thu, 21 Aug 2025 10:13:04 -0300
From: Jason Gunthorpe <jgg@nvidia.com>
To: Nicolin Chen <nicolinc@nvidia.com>
Cc: robin.murphy@arm.com, joro@8bytes.org, bhelgaas@google.com,
	will@kernel.org, robin.clark@oss.qualcomm.com, yong.wu@mediatek.com,
	matthias.bgg@gmail.com, angelogioacchino.delregno@collabora.com,
	thierry.reding@gmail.com, vdumpa@nvidia.com, jonathanh@nvidia.com,
	rafael@kernel.org, lenb@kernel.org, kevin.tian@intel.com,
	yi.l.liu@intel.com, baolu.lu@linux.intel.com,
	linux-arm-kernel@lists.infradead.org, iommu@lists.linux.dev,
	linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
	linux-mediatek@lists.infradead.org, linux-tegra@vger.kernel.org,
	linux-acpi@vger.kernel.org, linux-pci@vger.kernel.org,
	patches@lists.linux.dev, pjaroszynski@nvidia.com, vsethi@nvidia.com,
	helgaas@kernel.org, etzhao1900@gmail.com
Subject: Re: [PATCH v3 3/5] iommu: Add iommu_get_domain_for_dev_locked()
 helper
Message-ID: <20250821131304.GM802098@nvidia.com>
References: <cover.1754952762.git.nicolinc@nvidia.com>
 <a69557026b7e2353bae67104bbe6a88f0682305e.1754952762.git.nicolinc@nvidia.com>
 <20250818143949.GO802098@nvidia.com>
 <aKNhIr08fK+xIYcg@Asurada-Nvidia>
 <20250818234241.GF802098@nvidia.com>
 <aKQG9/skig6F8LdQ@Asurada-Nvidia>
 <20250819125249.GG802098@nvidia.com>
 <aKSyzI9Xz3J0nhfk@Asurada-Nvidia>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aKSyzI9Xz3J0nhfk@Asurada-Nvidia>
X-ClientProxiedBy: BY3PR10CA0002.namprd10.prod.outlook.com
 (2603:10b6:a03:255::7) To CH3PR12MB8659.namprd12.prod.outlook.com
 (2603:10b6:610:17c::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH3PR12MB8659:EE_|SN7PR12MB6909:EE_
X-MS-Office365-Filtering-Correlation-Id: 9dbee5a1-056a-4113-b413-08dde0b477c4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|7416014|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?vDc7Hyu3zg8sCEShRYTUSvcJvY9vYQR/etl2h9y6PR80GAT4isDu2/zaOCEL?=
 =?us-ascii?Q?Xwqfof0YmDNtXVEL3N6GHpaUvKRzEgB7Mr8PQJ7QX+Q++T0Riuh6wGmkq2yc?=
 =?us-ascii?Q?QsuJtps4b2p/N2gHH+Ak9OdMy9MCudGnF0jUvVOx2Wskdra9H/QGdUgDFpgB?=
 =?us-ascii?Q?3BVVG/AQTpB3Xu3YCrHWypzuSDtvdtUbLO7SqDvskFjI0cZA5DviO6UA8qJk?=
 =?us-ascii?Q?ORGQyHcofbzK43OVHNGMbS5vn3PrPiVAwuLIe+D1KfpUx7E/otZXQ7TQjEi7?=
 =?us-ascii?Q?+NDlpdUVp9b4XxI2ol4Jp8WHa1Fx1hcykhdbd6egLci3+V50jCfljCW11Z5N?=
 =?us-ascii?Q?/oibfsPDbT0fJttFOgpvZOX6WF818uCFR52T1Zf5CxXAtCCPi0tFqBS0QA5E?=
 =?us-ascii?Q?w6WffzkWB+Tf2xridtLMAzMpxXyQaxP/+uS4msZJy2ztqZHxrPz034ZkJLrG?=
 =?us-ascii?Q?YvpM9jwYNrJvSfUe2LSASb0KBwRFYyHJqCU97tJOpkxIONAC8QxX0KHU2tAG?=
 =?us-ascii?Q?V6aW09x1F86Kov4AH7Hl0q25x6csTqRa+PXrZdeQoYpOH3Ps5ou+M5hZf94J?=
 =?us-ascii?Q?4irrzItN6led3WAzciOBvzVUFOL3U0dN9NEvciQdIvenc1gt7+8We1OU8S2M?=
 =?us-ascii?Q?6dKKAhKYyyMpRbS+iAb1qwgVO+NOPA7faZyuCVQFFhh+OtmA1tgBXG1ZP41U?=
 =?us-ascii?Q?uy1Y5+g+iXQZjKEqL2nitsO6P1eETfTj3pBlhesfS+sY3xpWDLzJoyPyZHzI?=
 =?us-ascii?Q?239yoR4H/6wvSHLuhbF63HjYO9gG0LSNg9lsnD/ZUV3X+GKxv7U6RuJDFa+n?=
 =?us-ascii?Q?LDTRvBkv9Vx3XbwSz4VVRfkYhC281uc6wBidsV/gQvimL/Cm87kPns5bn8rg?=
 =?us-ascii?Q?V2jQnxg6a/yLDUgvl0mr5rfgarVsWJThlFYVWPgszzxF/1EGLL41JIYT26BG?=
 =?us-ascii?Q?cwwFnybXAll6zV5MjkqYzYnKn8YmtWp/ch1zaB8oBru/hFZzAk+eVMY54JUE?=
 =?us-ascii?Q?mmsM2nWpBdENOIJdddeqpxTXF5UE1HzD3p10T0VtTAP/1eXDnCyXC8XyyFs6?=
 =?us-ascii?Q?mB2yvaqdaFa6XMzmfLr95w4+gkAIwrP2RLOej2HnjwYylUNPFNcyutbPhzFe?=
 =?us-ascii?Q?Y2LV2Lgr6Qeo8j7fPel0BTGYfzJVyEG03Cr4QRoQ1Eg2mUfYMfNr6GhISezg?=
 =?us-ascii?Q?3OhaauZ5qKZcmV832TYiAYZ0pzdQ16LiIj1OKlXPFaedDGikHl0LwWXjwawJ?=
 =?us-ascii?Q?Ne3uo4OFa/bFjRsMhN3s+0hRYl9QWEqjILKsFqyglqD+ZJtqsMpYCoqpS+HJ?=
 =?us-ascii?Q?FBty36ZWnIAmHEpaMJU+6et4Pny1rO8a1FDxz3Doyfn2wkuONYlVJaW5rR9X?=
 =?us-ascii?Q?Vu0f7Omb4FKOa/cA+c4m0i0msP5Yp4Yz3dO4Yhp7Kz+/Nd+qIg=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH3PR12MB8659.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(366016)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?3TjkOf0gcfnHHwhvhLkw1Y08ywjXrH++GPdW8Pvb73Kr/EbYfoI0EDEFn5lk?=
 =?us-ascii?Q?9OFjl8i0os7czVuF4NbZcryKZNdEhn2H09AV28Sg+t/35i3oHflszK94vg1T?=
 =?us-ascii?Q?LPxE37NMwstiqP0W5W3gEwBfobdUy25dqa4fRgegEqpBxDaP7WfA7m74tfVX?=
 =?us-ascii?Q?djYM8rTS87+fsGWxoDfqfNXm1Sy0l4OQE+F/Kmz/f+/rwFn3Gz1OZ0lEfI8+?=
 =?us-ascii?Q?1a6it2/FLRFLju7leCZxtGN/0iT2TbLEmBLR/eLE9QQp61swDrWmVR1RsYEm?=
 =?us-ascii?Q?ILYwvYe6sR1ZbFrL512rPCzSTu5u+bFIpnUPd8WgdAcSMaeQPmBwwgI9/irq?=
 =?us-ascii?Q?h1Nj2bfiBNVfQJG8mDA0IO9eOEBtiIkzzmDp728FPLUOhXISYCJLl3QpT+6x?=
 =?us-ascii?Q?HPHwBlzDHg0GVTXcMy0V4VO05gYjK56hgNGxtItE03LB3AOcNk2PLy7TEkFk?=
 =?us-ascii?Q?mJWh1OwO/x4IwxPW0MYoB05DP+VaQVmxXek8KDp1FoK5ShBhgGcopM50uajk?=
 =?us-ascii?Q?gk+LADxTGK9GZmQ+Rc3kRj4KfPamqfy5baIi92LBlpi0GrUz0cqqKVClrBCC?=
 =?us-ascii?Q?eUzfcwemUHcMHEeBTHr2eR3qcqtRd4aZjfqLLOxhDtFV2wwvcy2UaPU+MSMw?=
 =?us-ascii?Q?0jvuEQauC8eLJpupDChCMwKGsLAS2LbZDcg936iwNqx25VDtK6qZdb5lON23?=
 =?us-ascii?Q?XBU/zjfSt5xwea2aRBepzJDwhwOXghLvzg8Kgzx0WpqKjD5nkZF2ALDV/b47?=
 =?us-ascii?Q?YwOfmLusNYcot0nKYGqN+Ud7hndRTOxyPlU7HhEjvUGH9E6Dapv/DVzG/piC?=
 =?us-ascii?Q?Yljw/TJN9B/xMNshvwyp8Lr2YiPs0OA2ArYiM7VmlbZhstD+33HK3UVEcU+C?=
 =?us-ascii?Q?FxnbUhhHoyWLQfuVZ3LS/uqwB33MeU2adsqQ5RJPoZybwwqrPGzQ8f0dQr+f?=
 =?us-ascii?Q?zUC10XuPDrImITVpLFU4No0ewYgN2R/96n8okDi23HvQH0q5vNnMsl8njqTu?=
 =?us-ascii?Q?Xjc9tpdWGK2qvVVlJPdJhmWBnGvPbbAFs7XHAwTQH6VnYgqW8NVRKIhqOdPE?=
 =?us-ascii?Q?NZBx27Kgwt2Z9uJc42Icc3CIfhyIjpf87QRekRocbAfvlRGnglDSh+R/ES8+?=
 =?us-ascii?Q?HdYN0DW0/Aonw7/09tTUFYb21eIAC4BLs3Pz0Cz7yhe6jJkG/WgRvguGZpXN?=
 =?us-ascii?Q?6vRqQl3NZ9rt25xS1QGoRf21PmIlo9A/LZowojbtUsLDNZFlvXEfvaFKGC6X?=
 =?us-ascii?Q?WjW6SuHCNGNVRbWWAdRBhY4aAShKTTeiE789R/bAmZOnzWX6CTzm8BjOTkVc?=
 =?us-ascii?Q?p7uTjaekyvZXeX5WMvd9OIrLZPzpT1EciWug9gnpFirAu+rix4C7YgzTddMr?=
 =?us-ascii?Q?ynbvWrdKjpVfBAFwsVltyc/VZsFnC12KO+JNojMwQNedT+oqtFdjIx0cUUi1?=
 =?us-ascii?Q?VlBoapng0frxqghRAn3J9zIriCBtyCDHA6fbO3Nzf68KxAzufpT/mowqEWXl?=
 =?us-ascii?Q?G7rk4juOekU5B4q46rBgtoYgEswWI0vKtJm9W9enMDTOtYoOThKP9mi4y4CG?=
 =?us-ascii?Q?x8Nnom2w2MCl5i+EYPXMPbSZUpAqXvDLPudtCOPy?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9dbee5a1-056a-4113-b413-08dde0b477c4
X-MS-Exchange-CrossTenant-AuthSource: CH3PR12MB8659.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Aug 2025 13:13:06.6618
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: IJP0x9JTp9cRXKcGoskLIhZSQaPC13wTzxbDxRgUdeBzsOIIMR4kZoKRF4qK8VqA
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR12MB6909
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250821_061316_434259_4EE7C592 
X-CRM114-Status: GOOD (  14.40  )
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

On Tue, Aug 19, 2025 at 10:22:20AM -0700, Nicolin Chen wrote:

> Yet, I also see some other cases that cannot be helped with the
> type function. Just listing a few:

Probably several query functions are needed that can be lock safe
 
> 1) domain matching (and type)
> drivers/gpu/drm/tegra/drm.c:965:        if (domain && domain->type != IOMMU_DOMAIN_IDENTITY &&
> drivers/gpu/drm/tegra/drm.c:966:            domain != tegra->domain)
> drivers/gpu/drm/tegra/drm.c-967-                return 0;

is attached
 
> 2) page size
> drivers/gpu/drm/arm/malidp_planes.c:307:	mmu_dom = iommu_get_domain_for_dev(mp->base.dev->dev);
> drivers/gpu/drm/arm/malidp_planes.c-308-	if (mmu_dom)
> drivers/gpu/drm/arm/malidp_planes.c-309-		return mmu_dom->pgsize_bitmap;

return page size bitmap
 
> 3) iommu_iova_to_phys
> drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c:2597:	dom = iommu_get_domain_for_dev(adev->dev);
> drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c-2598-
> drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c-2599-	while (size) {
> drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c-2600-		phys_addr_t addr = *pos & PAGE_MASK;
> drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c-2601-		loff_t off = *pos & ~PAGE_MASK;
> drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c-2602-		size_t bytes = PAGE_SIZE - off;
> drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c-2603-		unsigned long pfn;
> drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c-2604-		struct page *p;
> drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c-2605-		void *ptr;
> drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c-2606-
> drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c-2607-		bytes = min(bytes, size);
> drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c-2608-
> drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c:2609:		addr = dom ? iommu_iova_to_phys(dom, addr) : addr;

safe iova to phys directly from a struct device
 
> 4) map/unmap
> drivers/net/ipa/ipa_mem.c:465:  domain = iommu_get_domain_for_dev(dev);
> drivers/net/ipa/ipa_mem.c-466-  if (!domain) {
> drivers/net/ipa/ipa_mem.c-467-          dev_err(dev, "no IOMMU domain found for IMEM\n");
> drivers/net/ipa/ipa_mem.c-468-          return -EINVAL;
> drivers/net/ipa/ipa_mem.c-469-  }
> drivers/net/ipa/ipa_mem.c-470-
> drivers/net/ipa/ipa_mem.c-471-  /* Align the address down and the size up to page boundaries */
> drivers/net/ipa/ipa_mem.c-472-  phys = addr & PAGE_MASK;
> drivers/net/ipa/ipa_mem.c-473-  size = PAGE_ALIGN(size + addr - phys);
> drivers/net/ipa/ipa_mem.c-474-  iova = phys;    /* We just want a direct mapping */
> drivers/net/ipa/ipa_mem.c-475-
> drivers/net/ipa/ipa_mem.c-476-  ret = iommu_map(domain, iova, phys, size, IOMMU_READ | IOMMU_WRITE,
> ...
> drivers/net/ipa/ipa_mem.c:495:  domain = iommu_get_domain_for_dev(dev);
> drivers/net/ipa/ipa_mem.c-496-  if (domain) {
> drivers/net/ipa/ipa_mem.c-497-          size_t size;
> drivers/net/ipa/ipa_mem.c-498-
> drivers/net/ipa/ipa_mem.c-499-          size = iommu_unmap(domain, ipa->imem_iova, ipa->imem_size);

Broken! Illegal to call iommu_map on a DMA API domain.

This is exactly the sort of abuse I would like to see made imposible :(

If it really needs something like this then it needs a proper dma api
interface to do it and properly reserve the iova from the allocator.

Jason

