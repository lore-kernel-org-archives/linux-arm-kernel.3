Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 41F8AC021BB
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 25 Feb 2025 19:45:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-Type:
	Content-Transfer-Encoding:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=vsYC4xmtFbTMgVAVkI+4GBFJbjQC3eH03ytOi0i9h3g=; b=yGqZQEhJCh7z707n5S87Jb9BAX
	498i4iaPWSexqVzw0HaArvMZx80KcwUA9e4zGVUmWYTCuss2IeWgNXzIWgU+7GGAql5KZBM0DNYZl
	wX3q+PMz45sqluvsUCB4DAmdIUeoihzg8cgMXJ4tUlUuWTd1DBgjvXR72SEgEZ7zuWtsEWceI/F54
	kYGejXk38Ie0f/mGJwIZheYOqqO130zRYrhQaELdOS/TW4afg8/W7+0B6zKTxOhvGxNLpFCnfbfdV
	3bdsdao4x4jwPPTrx0qyt4YzHKeOttoRjjFpssC9NV5ndAuP/gPIG3lDqczcvAEtehxXgj6BknO5k
	soeDSeMw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tn0rc-00000001D97-3ASR;
	Tue, 25 Feb 2025 19:45:08 +0000
Received: from mail-bn8nam12on2060c.outbound.protection.outlook.com ([2a01:111:f403:2418::60c] helo=NAM12-BN8-obe.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tn0mX-00000001Bvm-0Xjw;
	Tue, 25 Feb 2025 19:39:54 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=FMTobMavh6Q4bUWLRp3uPILOlgxcRjq5sJGBoM6FC1wTBKwK0ZssMnFN6p/IzekASaQtwm+UJB8+8x0B+S3Yjlh7AXLligxya5l1BaSEZO4ECkonWl4FuUKZHSLZmAyaKY8Y5GfT3AXh1kF9XxxTHJXIciqqZtq92liIBGTFOgLlahYChFuYLFo30KnDxh716NKU6Cj145df8SI1EJj/vyTeoB5ni4o0GSHDT76M58LN9jIZza3yy2t3/yhiEGmPHHh5bYMEV9ngzsk+fV2ejH+SvrCz8kbRy1EtjL+87DnV/S19MMWwt7280birbaMknldNn47PYcy9q+XQoCCAtw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vsYC4xmtFbTMgVAVkI+4GBFJbjQC3eH03ytOi0i9h3g=;
 b=Y2rSspFBxI0oj0B9PDIZ98EYzVe9C+ZaUXX1pTk4K9333YPzz4EKL1gjqjk0HXlUdrDTndCLSTc0aG5S3Bz6+MtMArMGKSwLu1LzDWVmu2L12R4p335SHuzDVDUERNSpfAo42QSsVjoCzsBOpPFLp37kHKpzJnDm7toJiL8Ln4iS0opN4+K7J9StOaelxLwJ4o5BZTJHwteJdqMJ4tp63ZY5s9JZU42kaX7zg65Y/EKSMzXfSanADyHzsMDm4tu4Um973PuFTItXL+kMcVwAskcmLnkd7dVt5KhiQztlqQAreOcP5rDRgxZUYHgXDAYaNu0JallsH93vrsLoCmxILw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vsYC4xmtFbTMgVAVkI+4GBFJbjQC3eH03ytOi0i9h3g=;
 b=kuw12lWSLBPFCiSLKhtjvNKlquAOhTfG7mDtua37CeYF4v5juMLuWoPDUwDJzfAlyAjZMnbKnTxBHjq8id7GffQKnD2nBjAQVllrV9K//mOMwSxCVPCQaSex392lgX0jmDDQBoXckB6/TIacdUz0Fa4zSe9DYnPYPRNhSywOuZoajOHIHt7BnTLbYm4XOUqH1pB+tyvTLYMivx9cvvP0x2Az3bZ7lwPFnneWUNBTKorIPWnjLSoHp7Y1P6O3XKzI1e157G7m97Bj1Xc0R2HKaeJ5D/xatfg2OB/9/cZhozOOsWzWj8nWZymcpiZ9xcXirGIwzuMc+13KADQ4/36xTg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CH3PR12MB8659.namprd12.prod.outlook.com (2603:10b6:610:17c::13)
 by SA1PR12MB5616.namprd12.prod.outlook.com (2603:10b6:806:22a::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8466.18; Tue, 25 Feb
 2025 19:39:43 +0000
Received: from CH3PR12MB8659.namprd12.prod.outlook.com
 ([fe80::6eb6:7d37:7b4b:1732]) by CH3PR12MB8659.namprd12.prod.outlook.com
 ([fe80::6eb6:7d37:7b4b:1732%4]) with mapi id 15.20.8466.016; Tue, 25 Feb 2025
 19:39:43 +0000
From: Jason Gunthorpe <jgg@nvidia.com>
To: Alim Akhtar <alim.akhtar@samsung.com>,
	Alyssa Rosenzweig <alyssa@rosenzweig.io>,
	Albert Ou <aou@eecs.berkeley.edu>,
	asahi@lists.linux.dev,
	Lu Baolu <baolu.lu@linux.intel.com>,
	David Woodhouse <dwmw2@infradead.org>,
	Heiko Stuebner <heiko@sntech.de>,
	iommu@lists.linux.dev,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Jonathan Hunter <jonathanh@nvidia.com>,
	Joerg Roedel <joro@8bytes.org>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-riscv@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org,
	linux-sunxi@lists.linux.dev,
	linux-tegra@vger.kernel.org,
	Marek Szyprowski <m.szyprowski@samsung.com>,
	Hector Martin <marcan@marcan.st>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Robin Murphy <robin.murphy@arm.com>,
	Samuel Holland <samuel@sholland.org>,
	Suravee Suthikulpanit <suravee.suthikulpanit@amd.com>,
	Sven Peter <sven@svenpeter.dev>,
	Thierry Reding <thierry.reding@gmail.com>,
	Tomasz Jeznach <tjeznach@rivosinc.com>,
	Krishna Reddy <vdumpa@nvidia.com>,
	Chen-Yu Tsai <wens@csie.org>,
	Will Deacon <will@kernel.org>
Cc: Bagas Sanjaya <bagasdotme@gmail.com>,
	Joerg Roedel <jroedel@suse.de>,
	Pasha Tatashin <pasha.tatashin@soleen.com>,
	patches@lists.linux.dev,
	David Rientjes <rientjes@google.com>,
	Matthew Wilcox <willy@infradead.org>
Subject: [PATCH v3 09/23] iommu/pages: Formalize the freelist API
Date: Tue, 25 Feb 2025 15:39:26 -0400
Message-ID: <9-v3-e797f4dc6918+93057-iommu_pages_jgg@nvidia.com>
In-Reply-To: <0-v3-e797f4dc6918+93057-iommu_pages_jgg@nvidia.com>
References: 
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: YQZPR01CA0134.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:c01:87::11) To CH3PR12MB8659.namprd12.prod.outlook.com
 (2603:10b6:610:17c::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH3PR12MB8659:EE_|SA1PR12MB5616:EE_
X-MS-Office365-Filtering-Correlation-Id: b16815b9-45af-434f-636c-08dd55d42650
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|7416014|376014|366016|1800799024|921020;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?mGk8dtyXYi7x2H6ke9wG6jXGfwXvDPsWG5fRPTN3Sl8H95eDQ4eayV+Dl4ob?=
 =?us-ascii?Q?I0WakHutqrAd2zf5zjnydDn1IBBBCat90XozItXq2cq1b4JWe+u9ql7O9H/1?=
 =?us-ascii?Q?AP/BE/uiK+g3OosotjfEPclCasC8HFtZ+WDkkNerbw7mf+Jq4PIg45SqVbLx?=
 =?us-ascii?Q?hIgoJkHPdt15OG0qYXr02JN5HhMSye6UaNP8qvR6wgOAEtIWcgGbUYVTrCos?=
 =?us-ascii?Q?0qMo5sgKoWVPGwO+VDnqki0Buc2tf1G/E1x0lqIPSs6GRI9kB5xIB7azJ4GE?=
 =?us-ascii?Q?RSLG07jz0Yy0j+6wpIKFfdOrxyYD4/RSgpVyRiUo2Xy3W3SGRlTc2NN00eM1?=
 =?us-ascii?Q?hT32I1PPPMhz0JymZiuW6rx5BOc2E1B4S/6CKuXKnolzUhe2JnqyTjNErCh4?=
 =?us-ascii?Q?x9kNHWwOgoTN+AYy2VTzNKKco2PlNlmjxEfiDv8JurqU2h/0EmwRm3cf4xdJ?=
 =?us-ascii?Q?Yku5uXFEtndOw5KyHZQvoHDCTwLUiCswsTYVvwax/XmSP6pTmumbV0WihjSt?=
 =?us-ascii?Q?G7KFbl7wZhg4lta1mRZDnD+t2Nofc1e5OcLJYrsBiiTiP9EcWF7NeFXaDSW5?=
 =?us-ascii?Q?4rhD912VD+4Suw2jfo3nKPhrhQvDjLnEfhqzjdmwtC8K1grxIQbZlfdNIW46?=
 =?us-ascii?Q?w+iNQ3aJz2PS1kvqUKeuZnqpkCdxfdNzbDShL4l/KIiLWcGHa70BZJQ59w34?=
 =?us-ascii?Q?sRJ1jnkmhC8jQShPUaqa8P6KcXRfadFIKRyOjj11B+Lt495XldcYAq+CFYJf?=
 =?us-ascii?Q?iTytLTjMiVIlBBZUVVT1KXVFy2IcJurl0hTJQVIIGqjcEIgvzgxOEXBWJkKT?=
 =?us-ascii?Q?h+ob7MM+pXWyviGo7QaYfXUBZHwUjZZSd7/+mdp9wB5hBmG0bwkcx2Rgxk1n?=
 =?us-ascii?Q?iy6hD/EnZ4Pwx0y8zxNVOaSNWs/5/vj0EapW+e4qJzIE2K1Jn/xZMEjUxKPp?=
 =?us-ascii?Q?UI+KuRZYa0FuFTt7ccZtYJuY6iKM9O1WOImzeG+I5wP5taPmiW6pwlj0odJ/?=
 =?us-ascii?Q?qi9Lv5U7XVhvW7vkerSMfxI+eqg1hRlNHztUshVIbepy5HZOxME4UQ+7Lqli?=
 =?us-ascii?Q?sfzcrHuXQPREOdGP/cLn3wvXqazM61lkzV+DHu9PRqDT7db5nxi+r0vyA3QC?=
 =?us-ascii?Q?k/EcONfj/JTZhK/3ByqrZ2PhGKPShtF2vgVQZ47dyHMbgkMPzwYrKP7ppECO?=
 =?us-ascii?Q?z/kBiQiXYnvhfu/D83dTPKISWtHU0V7iLcfLfXnJqCHggDjqbH68QFTIxGo/?=
 =?us-ascii?Q?81+4F8Qj16ky6uFX6WJG3YpNv+VxlEqx2FhtMhKzrSjLnwvT1QAT0cwBlIph?=
 =?us-ascii?Q?i7xEuNsBUul+XvnXYuelYFpPLL+tkPpRyoz1zHgHmMaM/oYg2uklgYs9Q7WL?=
 =?us-ascii?Q?BuZuD6rb+qUa3W7UI490A9SUZ3KZAIrIsVtoesuhsDnLnazV84jyh3xBEjKa?=
 =?us-ascii?Q?I0OFG/A+xoQ=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH3PR12MB8659.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(366016)(1800799024)(921020);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?IfGGwo2x+Y7SOcSm1BjjkQoHdhmfgbeg59i4A3GbiXVJL/UNo1b6d2o8sWia?=
 =?us-ascii?Q?GDYFKu/8VvJlKHjr7+d7JZs2hXy1D71HoS9KMNQVwWX8pseh0huacP43CC+7?=
 =?us-ascii?Q?Eg3ugSmnGIUgD8G1wr96lBrbeZoHO3zQL1NK/2pOocMFQxU7mBzzMhs5Y+Cv?=
 =?us-ascii?Q?QPGogO0J88CfEwm9Vnq45WI/fiw6mfx4uxEtonINIlK5nusRY8DHjXvSwCMG?=
 =?us-ascii?Q?NWtLkf3wB3otSm5sDICA7WwmQsPdJWfpC6DrWY6IOkp5vbMk2a/6yezsjQR0?=
 =?us-ascii?Q?ZsCy+bPcutTl6G3nihi1zX/rcutPyklS/FLkR/sCsjgOogWfttNntOjOqLli?=
 =?us-ascii?Q?muDk5vduCmfUpB/9pSm/bJ86zz1ClpmcncIb6+RY5pqwhZ/XzQlp7WtDcbms?=
 =?us-ascii?Q?Lyqm6vaZe3Qon3iGQUErU3UpP5czo/ja28I3S2NGNosAmiYw4BWsbPN7iflE?=
 =?us-ascii?Q?oFSmtCGCM3Ckj5y3npz9eKJKd3aCZjKc4X0JbUb6eYzyQ/H6dGnoFi76CSq3?=
 =?us-ascii?Q?bf7QhQ33WrbICpExfd5aTKGDAO3UhYZKWjMB+HiSSXo6TRBDZ3+T0gZbqUqS?=
 =?us-ascii?Q?BydzZ/E4xiujpinXNPjsv4yG6DRo18N/RsCuqwhEYWgC3egqh560rY+hnjx2?=
 =?us-ascii?Q?/4+yF6Rk2nWho+fPhXkWCT4RDdD+YXMOObiKRb3BfmCzUq/ogRttKeWZErBX?=
 =?us-ascii?Q?pvKt0PkMkPC05fenMk/AAHEx9n7Q/p1FtVKL0RjKU9fW8zeoQ/nmvgokVEPs?=
 =?us-ascii?Q?Fdo19atr1N37PDi4c3YAI6qazml3mnbDHdLxYmXi/jL6zL6TqqCqW4ecWedy?=
 =?us-ascii?Q?Mp6I4zZ9XAGuXDDVQ/J6Yv4ubOOgrm6GEq13/gkXFgDJoxoD3efUXh0Hz0G5?=
 =?us-ascii?Q?eisogMAmPYg10CfvSzKdGinePmrFMMga0TpvNmjNKkchoZ3TG5xPsEnU0n7r?=
 =?us-ascii?Q?qABwa1YpDma4Z7eJpE29fcVMPuzAgV1BKfavOfwzEjT7x8RiuMc/sA5I1/6z?=
 =?us-ascii?Q?vA1x9AyiG6Q8KdIfioaJmStb1lu7xeQuKq6cXFGM1mSag6xep4riXbCoU1/3?=
 =?us-ascii?Q?4yK2hYLtfxxqVYvUApAncj2OLqlV2JiKJUN8cnMArbATlOUJVCQWIHejVS/l?=
 =?us-ascii?Q?Ulr2SzIbx6nimd4s1q7hw+MN3mFK57lBbVl5petIdM+pb35ssalqEwCBgSJd?=
 =?us-ascii?Q?oqVEGaMBlCi1WkJquusZfbjraZn1IS9bmamIg8a527ceXx/1K+IFbfA0mjU2?=
 =?us-ascii?Q?bWrA+pGoZbi46GWxRW6lA65WGdCGL3TpDiQB5nf0tFhlgw7UfF29P3Hanqol?=
 =?us-ascii?Q?v43NjcgYrRIdtjIkHN/q9uAXKpgHHqlsxX55myadCTE2Nib7oqcBdtfwIjKM?=
 =?us-ascii?Q?J5VWAcMoptXFcTqnaoWJLahzQqJ8aLkA13Fv7c+X43eJinrSSZidVettSTsH?=
 =?us-ascii?Q?Gr8CF+62PQSMTd6/JpeGsW6n+v7KIo1tB25qV1/lZPdKJy2gb/Ye6SMMW0Yd?=
 =?us-ascii?Q?mbMCtDvJliue46M4Ef0BV3J9FodIQhbityw6A2UqWLrBuQIkpohtfoHIpYj4?=
 =?us-ascii?Q?13Ha8rbEKcYUxRKzxRn+iotrkjC1iHJrFe6Ql9XW?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b16815b9-45af-434f-636c-08dd55d42650
X-MS-Exchange-CrossTenant-AuthSource: CH3PR12MB8659.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Feb 2025 19:39:42.3392
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: KmJ7CkzLggUsfr4DCLCnzZzm60v/LDmlAy02i5Z7lMDLTiXkWjkrecmYexCkgqLK
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR12MB5616
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250225_113953_202006_FD83178C 
X-CRM114-Status: GOOD (  19.97  )
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

We want to get rid of struct page references outside the internal
allocator implementation. The free list has the driver open code something
like:

   list_add_tail(&virt_to_page(ptr)->lru, freelist);

Move the above into a small inline and make the freelist into a wrapper
type 'struct iommu_pages_list' so that the compiler can help check all the
conversion.

This struct has also proven helpful in some future ideas to convert to a
singly linked list to get an extra pointer in the struct page, and to
signal that the pages should be freed with RCU.

Use a temporary _Generic so we don't need to rename the free function as
the patches progress.

Signed-off-by: Jason Gunthorpe <jgg@nvidia.com>
---
 drivers/iommu/iommu-pages.c | 23 ++++++++++++-------
 drivers/iommu/iommu-pages.h | 45 ++++++++++++++++++++++++++++++++++---
 include/linux/iommu.h       | 12 ++++++++++
 3 files changed, 69 insertions(+), 11 deletions(-)

diff --git a/drivers/iommu/iommu-pages.c b/drivers/iommu/iommu-pages.c
index 31ff83ffaf0106..af8694b46417fa 100644
--- a/drivers/iommu/iommu-pages.c
+++ b/drivers/iommu/iommu-pages.c
@@ -67,18 +67,25 @@ void iommu_free_pages(void *virt)
 EXPORT_SYMBOL_GPL(iommu_free_pages);
 
 /**
- * iommu_put_pages_list - free a list of pages.
- * @head: the head of the lru list to be freed.
+ * iommu_put_pages_list_new - free a list of pages.
+ * @list: The list of pages to be freed
  *
  * Frees a list of pages allocated by iommu_alloc_pages_node().
  */
-void iommu_put_pages_list(struct list_head *head)
+void iommu_put_pages_list_new(struct iommu_pages_list *list)
 {
-	while (!list_empty(head)) {
-		struct page *p = list_entry(head->prev, struct page, lru);
+	struct page *p, *tmp;
 
-		list_del(&p->lru);
+	list_for_each_entry_safe(p, tmp, &list->pages, lru)
 		__iommu_free_page(p);
-	}
 }
-EXPORT_SYMBOL_GPL(iommu_put_pages_list);
+EXPORT_SYMBOL_GPL(iommu_put_pages_list_new);
+
+void iommu_put_pages_list_old(struct list_head *head)
+{
+	struct page *p, *tmp;
+
+	list_for_each_entry_safe(p, tmp, head, lru)
+		__iommu_free_page(p);
+}
+EXPORT_SYMBOL_GPL(iommu_put_pages_list_old);
diff --git a/drivers/iommu/iommu-pages.h b/drivers/iommu/iommu-pages.h
index e3c35aa14ad716..0acc26af7202df 100644
--- a/drivers/iommu/iommu-pages.h
+++ b/drivers/iommu/iommu-pages.h
@@ -7,12 +7,51 @@
 #ifndef __IOMMU_PAGES_H
 #define __IOMMU_PAGES_H
 
-#include <linux/types.h>
-#include <linux/topology.h>
+#include <linux/iommu.h>
 
 void *iommu_alloc_pages_node(int nid, gfp_t gfp, unsigned int order);
 void iommu_free_pages(void *virt);
-void iommu_put_pages_list(struct list_head *head);
+void iommu_put_pages_list_new(struct iommu_pages_list *list);
+void iommu_put_pages_list_old(struct list_head *head);
+
+#define iommu_put_pages_list(head)                                   \
+	_Generic(head,                                               \
+		struct iommu_pages_list *: iommu_put_pages_list_new, \
+		struct list_head *: iommu_put_pages_list_old)(head)
+
+/**
+ * iommu_pages_list_add - add the page to a iommu_pages_list
+ * @list: List to add the page to
+ * @virt: Address returned from iommu_alloc_pages_node()
+ */
+static inline void iommu_pages_list_add(struct iommu_pages_list *list,
+					void *virt)
+{
+	list_add_tail(&virt_to_page(virt)->lru, &list->pages);
+}
+
+/**
+ * iommu_pages_list_splice - Put all the pages in list from into list to
+ * @from: Source list of pages
+ * @to: Destination list of pages
+ *
+ * from must be re-initialized after calling this function if it is to be
+ * used again.
+ */
+static inline void iommu_pages_list_splice(struct iommu_pages_list *from,
+					   struct iommu_pages_list *to)
+{
+	list_splice(&from->pages, &to->pages);
+}
+
+/**
+ * iommu_pages_list_empty - True if the list is empty
+ * @list: List to check
+ */
+static inline bool iommu_pages_list_empty(struct iommu_pages_list *list)
+{
+	return list_empty(&list->pages);
+}
 
 /**
  * iommu_alloc_pages - allocate a zeroed page of a given order
diff --git a/include/linux/iommu.h b/include/linux/iommu.h
index 38c65e92ecd091..e414951c0af83f 100644
--- a/include/linux/iommu.h
+++ b/include/linux/iommu.h
@@ -326,6 +326,18 @@ typedef unsigned int ioasid_t;
 /* Read but do not clear any dirty bits */
 #define IOMMU_DIRTY_NO_CLEAR (1 << 0)
 
+/*
+ * Pages allocated through iommu_alloc_pages_node() can be placed on this list
+ * using iommu_pages_list_add(). Note: ONLY pages from iommu_alloc_pages_node()
+ * can be used this way!
+ */
+struct iommu_pages_list {
+	struct list_head pages;
+};
+
+#define IOMMU_PAGES_LIST_INIT(name) \
+	((struct iommu_pages_list){ .pages = LIST_HEAD_INIT(name.pages) })
+
 #ifdef CONFIG_IOMMU_API
 
 /**
-- 
2.43.0


