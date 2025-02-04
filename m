Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AE341C02193
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  4 Feb 2025 20:01:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-Type:
	Content-Transfer-Encoding:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=QSfIxE+CWUnZzUB3h/0xYwl9gZ4k3HOUGEF29ldENIg=; b=uT9iG05X+uboXyTtFTxJxPZxWc
	a0PBC9buLTBlMF4+GNXPbkT8WDacM+cZbYBz3nH3yz2wN05fq1gHGzLmaGNRxH1mV1GPazzGC752c
	Gi0wWOou/yPq4aAyDPs7qYw0Nz8VWZjX34aPJMQd4TQK5/wmY0uZDKaOG0NaSbHr9gfALQ/NMw4l3
	sDovpOrOnv9OquKDR/m0dUcQamhrR1vt+XK4THqdTRaS53DYbVzvAXliBWaA21zYdHj7IG3C1DEqn
	7SZehkb6sehpIMAU8917IDyF7wcAqSPEabq2BbdXircW6Sc84VidWfSXz/02A/0IO4aCS4yHjKjgU
	OxJawO3Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tfP6Z-00000001Sau-1TZp;
	Tue, 04 Feb 2025 20:01:07 +0000
Received: from mail-bn1nam02on2060c.outbound.protection.outlook.com ([2a01:111:f403:2407::60c] helo=NAM02-BN1-obe.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tfNlU-00000001EIa-44Fj;
	Tue, 04 Feb 2025 18:35:18 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=netoKj2yih8hJCKKdaCySavB9RxvNNOT1qb0KCEgg/bYc6XCHXD9EvKZsLJRI8DwxIXKhSigXwNcPmxoWn8Sfi+B8XRKz4HlBDhiRX6vfVkdTre6CUKnFmZy5G34eL95votlVm/QGz08VcAfkdxy3qrv4VD9aZ6SxPC4bS1TY7ycHzL6jvpqoBfG7mHFBYpXNMoL8R/2xV6WyV02WF0bhelkaARX2Qf/Tywpql00t5grK7qyxB/WfttoSUBgfl4UHk1FvLM5uXlYyiF3AE5JaGBp8wFx4yMUid0ROVJD9ospmiIZ+yhMnvIuLRAItWn3mIbMLdu6e5XCNGfgucOyuw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=QSfIxE+CWUnZzUB3h/0xYwl9gZ4k3HOUGEF29ldENIg=;
 b=cSP/euvs/whrABlTrrB8n6vLAVjf06xsYXvsX3El8ikEQNOF9DqyeUW8CCW+3hzGWvWIORKGUJRZp6n4ly4HRmO48XiWrWwMtJ+DSUhp/VCIvvqYpU2cOEffNT/wHOcPms3bUyPj9U0eolhfqmoaYdmkm2HRNpIkKrghRxU3qIs3c6WejXORvLzWPKik2CP/ujtS7NTSr/vEuWYYGWWdKBA8p25RYRD8+EEz4g5VxN6SkcMs6qc1uy/5ag7ooSxbfIyzJ+nDyL0K54P3T7Utkzou9/WZ63fJPVxBAzzTMwBWPepfmlO02tsNrpLVQvhnhX7dqKA0c1ohnWQIXFf12A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=QSfIxE+CWUnZzUB3h/0xYwl9gZ4k3HOUGEF29ldENIg=;
 b=nvbBG0UNqXVVR2NCbuKjmsKZ7aCLdL4Iyfm7OILvMDD16832KRs4T2ESsWXpnnPZf+RgJo8W6mlKC/VO3yfw4MDPG6bYXoiad2GB/Fn8aRuliEzLuN+11qGiQ6rimeUTyUcQGqUcjZy6Y3nA1nOExQ4usaAc3AJ4ARKd14gJnL/rVLU8wazNMnK3PRIThokTHm/fWjDHYfE6N9cNXgqiUvOAWKxElHrunrtwhHYSvfwlazSSXf5CpAEd2aZHcMm6VXy0ilAQ6KdBiivYDolir0m71WE5OuuaqxQiCor1++4w2FO4yUsS6UzW+V201HLX2TWvjWbaxkPzSpgZlGZe3g==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CH3PR12MB8659.namprd12.prod.outlook.com (2603:10b6:610:17c::13)
 by CY5PR12MB6573.namprd12.prod.outlook.com (2603:10b6:930:43::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8398.24; Tue, 4 Feb
 2025 18:35:06 +0000
Received: from CH3PR12MB8659.namprd12.prod.outlook.com
 ([fe80::6eb6:7d37:7b4b:1732]) by CH3PR12MB8659.namprd12.prod.outlook.com
 ([fe80::6eb6:7d37:7b4b:1732%6]) with mapi id 15.20.8398.025; Tue, 4 Feb 2025
 18:35:06 +0000
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
Subject: [PATCH 13/19] iommu/pages: Move from struct page to struct ioptdesc and folio
Date: Tue,  4 Feb 2025 14:34:54 -0400
Message-ID: <13-v1-416f64558c7c+2a5-iommu_pages_jgg@nvidia.com>
In-Reply-To: <0-v1-416f64558c7c+2a5-iommu_pages_jgg@nvidia.com>
References: 
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BL1PR13CA0387.namprd13.prod.outlook.com
 (2603:10b6:208:2c0::32) To CH3PR12MB8659.namprd12.prod.outlook.com
 (2603:10b6:610:17c::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH3PR12MB8659:EE_|CY5PR12MB6573:EE_
X-MS-Office365-Filtering-Correlation-Id: d162c4c2-b97e-4450-5e30-08dd454aa37f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|7416014|376014|1800799024|366016|921020;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?fRmpC4TzpO6FxYvTAZwMc53BV2N+QW1Eb2zTf4tpZKJJbCQvaQyEmHLKDikQ?=
 =?us-ascii?Q?LAm+jhPgBTqdMuqVKrT/oAecwwb04+hN+4X4h6T21pEL36IkYQ1wYHglXgC9?=
 =?us-ascii?Q?ZHrNof1ZyYuo5Vvzz36cS7G8WHa189xPmIT8dOWlZc8WU0XqD13tXW5ftfX9?=
 =?us-ascii?Q?ETHzsPd9GGI+p7nzapOjCcsoprMGYn4FRW0l3bXJyGfsejcQJuvwH/Cu+7KX?=
 =?us-ascii?Q?5Gu1pnYgwpt0oX1KD0uQU/tXMwOWDWiUnY5Po6J9Tl32zrIiSllOdVN1rTH1?=
 =?us-ascii?Q?0FDGUreliocQ0vpiqQxX1/5O8DN4nL/pokU6gi8IU3LIbR1x4rqqO8DYNasg?=
 =?us-ascii?Q?r/ZZv5OkzWiSIbHLCQ90qR41MCWFh46JsZh83zDMHb1WeQEA7Lc/HxhCip7B?=
 =?us-ascii?Q?PLQDVzb+3+V3UcpsGIBmBTfkh57iaXpoAC37sJ77Pz6CYdZWF/cJFve7CcvI?=
 =?us-ascii?Q?xlPuh6q6JImLjBNsTnvrWgef5cVBrNo1dcYPa6ZIQFdKLlxOsGec10xFhIDn?=
 =?us-ascii?Q?nubtSWsWl7AcJd98DDNCufwudj591oaFrmVdi3F1aVBHSPQ6OGpOP87qkYv6?=
 =?us-ascii?Q?cxDKdDInXINZ9zEyVaEivk/nJu3OPAWUm2AtL+wbS3ffxnximxmJVq9xJxQP?=
 =?us-ascii?Q?fOb3UThBNaxmzDm5MK0zND0hl7B5yIp7k9mSkjUBGgeZrLuO6nX1b6vpgLfz?=
 =?us-ascii?Q?gfgJYjRkYwbD8yVijDurphwLhy/OURQSsUwHft8O/Mph1K1/IxSBHnXeHY+a?=
 =?us-ascii?Q?MCC0FtsPi3r61tfwFo8epv4Wi2FgrSMkeLnx81ZkzX6WWnSmo/8mG0hdB6LW?=
 =?us-ascii?Q?GaQSYkzWsbdXPf6GAkjatQMNq7vVaGNBYokO0to50l+JdOa8pY2UF50qLDi7?=
 =?us-ascii?Q?2CC5eDpNRAE+BbP6MemLWIeATvhRJGb6sYAx54S8MOAJA8gC7WoairxMd6tv?=
 =?us-ascii?Q?PQM1CSi1HR2e/16kcNWclvQYrxAHRHsRUyryNfa5DsHpAFiArhqaTjpbIVWC?=
 =?us-ascii?Q?DVmWRxO4l14uapSjsio8z1rR4rdSYzcFT+KXcySdump8GL+pNwsIObYnGxG4?=
 =?us-ascii?Q?NIdPNM8YU9Gl48xrEe7NeZFeCKqYi+NrGz5gTawrggwoQggAcvpreZ9FwykA?=
 =?us-ascii?Q?F3P+T4vwDdu10TZuauh3DFfUAOlqBiEz0D0zlvcsLr4lIajkkBjY4d/M/GDj?=
 =?us-ascii?Q?gsBqqvkNP8VLVCzdBm6L+36egIeDIEygcdKfVFahQ857a5q3WS7Osz7bpyTb?=
 =?us-ascii?Q?uFCGXxGSTT/tqrz0blEWZW3nNnyBefTAroafx5JWAg4okkTMs4Fp3ExDsBEi?=
 =?us-ascii?Q?U53ppnXG9ydsAj+JtRmKBpqplPrNUpBOCwWBI6v8jAKHabTrYRqq8ow1HJZ/?=
 =?us-ascii?Q?JXPjYz8fMzwcacdti3fuJ9zkbBm/kP+R7plQug+0JcqRYefB+5j66EULbeNQ?=
 =?us-ascii?Q?Rhu0lxntKSg=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH3PR12MB8659.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(1800799024)(366016)(921020);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?vPwJnLEr462EN3QwKguIfKgJCt3MVh8RAB0fy5PnehOJw0zdP0saDyNWyS52?=
 =?us-ascii?Q?3CIlbVNWXbOA52HBxhS3JupxYYqtxNUufXRnmVAgudTHPBam86Ib5wpUhxvZ?=
 =?us-ascii?Q?EnkNljGoyZfP4dlt+oHss54BrlGYNY2K57bvSVG9MreQxjEjW1rRExbvU8Hk?=
 =?us-ascii?Q?kOnwsr0WZr7Yi0SCnUY+WJXrXYd1vX7JO3YEVM++EsddIyaFpUrP7dglX+gh?=
 =?us-ascii?Q?Gdi6pDoZ0gk9qZ3v/TfUj0N9ovXKFsyV1DiKlEelCbasmpdBIp44DlLp/r0F?=
 =?us-ascii?Q?w1ikcovWJifCliJca4tnpxZiF/O0Hd05AjgE56aKpHCimnv1DTyibvMrHBvI?=
 =?us-ascii?Q?WRKJQWtvknHV3MBi7jPLjufxSVrbNOu2tXqn+Zlcem9L7SuSN4NFOh/nhu7D?=
 =?us-ascii?Q?THubxggkiaQnZggoJOKJ2d/3TBUaplCRJXPcJJtnYn1R9NDYAJhPoUoYPrzu?=
 =?us-ascii?Q?hUMUyIq8n20Rmsp7Xuwcrushrj5Cex+mhqJFKIjfKX/UfnP60Oh0/W+jSIqp?=
 =?us-ascii?Q?AHXEViMqzKANzDj2LF1CpjO4GyIh5aTyYizm76OyOltzGeMEU4GDmdGNrdbO?=
 =?us-ascii?Q?b285jymm+baSsYfSRj84JmRQdQPVEgGE3mP3GutoedGO7ZMLdHVvIsTxy2y8?=
 =?us-ascii?Q?rK7j228NdjRHcUvO//gHQfx2FGsR3WCpJNwuFY5WJhaUfMUlOFgbDKsy90xO?=
 =?us-ascii?Q?/vgkgRzDw98P7bZxXklS1uLQh73cBWypPp6Qzw0kRq3Zb3l8JsVmTmwhXunr?=
 =?us-ascii?Q?3hFp5mHs6uRyp2H6y+lBkMsonDiiKFDtxF/IkkXF8jEyWJue0wq3cSIxlQq3?=
 =?us-ascii?Q?urO6nWOsKO9GRjT3oldFd3ya7/8N92nDTHTEYXPGtElVhhzPX83itdlRndbl?=
 =?us-ascii?Q?l5S9jrEYbZC5GQ9y9BoOhCES2waQtQP1oZpXVuiMsdWh55tDKKDk264bafAY?=
 =?us-ascii?Q?tLA1aKJ9IceC7jCg9WeIgZPA1l62Lwf2zW8TxDlJFQNwnukI1+lGa0UyTJWO?=
 =?us-ascii?Q?Cvk2EfSRNiKxmBISOKJB5lCvMq3EooQM2U3dYgB+4uQeqtBdUHgGnUJk4B8B?=
 =?us-ascii?Q?eFrJJUX8rKHUqdQA+vI2SrUgsgCGpTYWz3jLwTHS3rVfacxdtuYd/ThG8fWG?=
 =?us-ascii?Q?0QppTWcSLgb7ePGmAzcUUGuP9rCtmXD74LW5L9qFZw/gMFqALmXpt4TgTEnV?=
 =?us-ascii?Q?IoBX5IsThkqOUoQAW8e6qq0LuHz388zd3NTX9J2T2MQyToMjuVy5rLVo39Kj?=
 =?us-ascii?Q?RBPIZFfwE8/N+yspJn7SfkK2a+K5TvfzIkOKM1AD2HEmKK2tPnlo38NgbY82?=
 =?us-ascii?Q?neKgAfbZu1g0Aa51pkgtRla3BP4BRumj/V3THjcrhULAVMWqdzq1u4nMY5Dm?=
 =?us-ascii?Q?H3obk1zRgSIHnVlofZFl6QqbqFzC6hlCrK2RyfaRNdsq9e+0aXv2aO+xN8W+?=
 =?us-ascii?Q?93JEQzuinOuUxHy7C8e4/9pdNpyFTT0v7st0cWLot2MI6NJ2WqqCk13KhN8b?=
 =?us-ascii?Q?Df9kxN0OAro1tcqYrxPPvu2bcqf1rS2+4WUBl9jbslH0zfH/em869p5tR6WD?=
 =?us-ascii?Q?EsUkYDE39NsdO7I8Si0=3D?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d162c4c2-b97e-4450-5e30-08dd454aa37f
X-MS-Exchange-CrossTenant-AuthSource: CH3PR12MB8659.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Feb 2025 18:35:03.2129
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: BAGtyxfl6exjdaBrDPfBQEnFbo9s15nHOuGn4MkJlzlxPvLn3sXVFLFtTxqqYfN1
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY5PR12MB6573
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250204_103517_096613_945CF209 
X-CRM114-Status: GOOD (  17.56  )
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

This brings the iommu page table allocator into the modern world of having
its own private page descriptor and not re-using fields from struct page
for its own purpose. It follows the basic pattern of struct ptdesc which
did this transformation for the CPU page table allocator.

Currently iommu-pages is pretty basic so this isn't a huge benefit,
however I see a coming need for features that CPU allocator has, like sub
PAGE_SIZE allocations, and RCU freeing. This provides the base
infrastructure to implement those cleanly.

Signed-off-by: Jason Gunthorpe <jgg@nvidia.com>
---
 drivers/iommu/iommu-pages.c | 54 ++++++++++++++++++++++++++-----------
 drivers/iommu/iommu-pages.h | 39 ++++++++++++++++++++++++++-
 2 files changed, 76 insertions(+), 17 deletions(-)

diff --git a/drivers/iommu/iommu-pages.c b/drivers/iommu/iommu-pages.c
index af86c487ba100b..f7def716997af4 100644
--- a/drivers/iommu/iommu-pages.c
+++ b/drivers/iommu/iommu-pages.c
@@ -7,6 +7,21 @@
 #include <linux/gfp.h>
 #include <linux/mm.h>
 
+#define IOPTDESC_MATCH(pg_elm, elm)                    \
+	static_assert(offsetof(struct page, pg_elm) == \
+		      offsetof(struct ioptdesc, elm))
+IOPTDESC_MATCH(flags, __page_flags);
+IOPTDESC_MATCH(lru, iopt_freelist_elm); /* Ensure bit 0 is clear */
+IOPTDESC_MATCH(mapping, __page_mapping);
+IOPTDESC_MATCH(private, _private);
+IOPTDESC_MATCH(page_type, __page_type);
+IOPTDESC_MATCH(_refcount, __page_refcount);
+#ifdef CONFIG_MEMCG
+IOPTDESC_MATCH(memcg_data, memcg_data);
+#endif
+#undef IOPTDESC_MATCH
+static_assert(sizeof(struct ioptdesc) <= sizeof(struct page));
+
 /**
  * iommu_alloc_pages_node - Allocate a zeroed page of a given order from
  *                          specific NUMA node
@@ -20,10 +35,17 @@
 void *iommu_alloc_pages_node(int nid, gfp_t gfp, unsigned int order)
 {
 	const unsigned long pgcnt = 1UL << order;
-	struct page *page;
+	struct folio *folio;
 
-	page = alloc_pages_node(nid, gfp | __GFP_ZERO | __GFP_COMP, order);
-	if (unlikely(!page))
+	/*
+	 * __folio_alloc_node() does not handle NUMA_NO_NODE like
+	 * alloc_pages_node() did.
+	 */
+	if (nid == NUMA_NO_NODE)
+		nid = numa_mem_id();
+
+	folio = __folio_alloc_node(gfp | __GFP_ZERO, order, nid);
+	if (unlikely(!folio))
 		return NULL;
 
 	/*
@@ -35,21 +57,21 @@ void *iommu_alloc_pages_node(int nid, gfp_t gfp, unsigned int order)
 	 * This is necessary for the proper accounting as IOMMU state can be
 	 * rather large, i.e. multiple gigabytes in size.
 	 */
-	mod_node_page_state(page_pgdat(page), NR_IOMMU_PAGES, pgcnt);
-	mod_lruvec_page_state(page, NR_SECONDARY_PAGETABLE, pgcnt);
+	mod_node_page_state(folio_pgdat(folio), NR_IOMMU_PAGES, pgcnt);
+	lruvec_stat_mod_folio(folio, NR_SECONDARY_PAGETABLE, pgcnt);
 
-	return page_address(page);
+	return folio_address(folio);
 }
 EXPORT_SYMBOL_GPL(iommu_alloc_pages_node);
 
-static void __iommu_free_page(struct page *page)
+static void __iommu_free_page(struct ioptdesc *iopt)
 {
-	unsigned int order = folio_order(page_folio(page));
-	const unsigned long pgcnt = 1UL << order;
+	struct folio *folio = ioptdesc_folio(iopt);
+	const unsigned long pgcnt = 1UL << folio_order(folio);
 
-	mod_node_page_state(page_pgdat(page), NR_IOMMU_PAGES, -pgcnt);
-	mod_lruvec_page_state(page, NR_SECONDARY_PAGETABLE, -pgcnt);
-	put_page(page);
+	mod_node_page_state(folio_pgdat(folio), NR_IOMMU_PAGES, -pgcnt);
+	lruvec_stat_mod_folio(folio, NR_SECONDARY_PAGETABLE, -pgcnt);
+	folio_put(folio);
 }
 
 /**
@@ -62,7 +84,7 @@ void iommu_free_page(void *virt)
 {
 	if (!virt)
 		return;
-	__iommu_free_page(virt_to_page(virt));
+	__iommu_free_page(virt_to_ioptdesc(virt));
 }
 EXPORT_SYMBOL_GPL(iommu_free_page);
 
@@ -74,9 +96,9 @@ EXPORT_SYMBOL_GPL(iommu_free_page);
  */
 void iommu_put_pages_list(struct iommu_pages_list *list)
 {
-	struct page *p, *tmp;
+	struct ioptdesc *iopt, *tmp;
 
-	list_for_each_entry_safe(p, tmp, &list->pages, lru)
-		__iommu_free_page(p);
+	list_for_each_entry_safe(iopt, tmp, &list->pages, iopt_freelist_elm)
+		__iommu_free_page(iopt);
 }
 EXPORT_SYMBOL_GPL(iommu_put_pages_list);
diff --git a/drivers/iommu/iommu-pages.h b/drivers/iommu/iommu-pages.h
index d35d9f99f320dc..f36103f591e91b 100644
--- a/drivers/iommu/iommu-pages.h
+++ b/drivers/iommu/iommu-pages.h
@@ -9,6 +9,43 @@
 
 #include <linux/iommu.h>
 
+/**
+ * struct ioptdesc - Memory descriptor for IOMMU page tables
+ * @iopt_freelist_elm: List element for a struct iommu_pages_list
+ *
+ * This struct overlays struct page for now. Do not modify without a good
+ * understanding of the issues.
+ */
+struct ioptdesc {
+	unsigned long __page_flags;
+
+	struct list_head iopt_freelist_elm;
+	unsigned long __page_mapping;
+	pgoff_t __index;
+	void *_private;
+
+	unsigned int __page_type;
+	atomic_t __page_refcount;
+#ifdef CONFIG_MEMCG
+	unsigned long memcg_data;
+#endif
+};
+
+static inline struct ioptdesc *folio_ioptdesc(struct folio *folio)
+{
+	return (struct ioptdesc *)folio;
+}
+
+static inline struct folio *ioptdesc_folio(struct ioptdesc *iopt)
+{
+	return (struct folio *)iopt;
+}
+
+static inline struct ioptdesc *virt_to_ioptdesc(void *virt)
+{
+	return folio_ioptdesc(virt_to_folio(virt));
+}
+
 void *iommu_alloc_pages_node(int nid, gfp_t gfp, unsigned int order);
 void iommu_free_page(void *virt);
 void iommu_put_pages_list(struct iommu_pages_list *list);
@@ -21,7 +58,7 @@ void iommu_put_pages_list(struct iommu_pages_list *list);
 static inline void iommu_pages_list_add(struct iommu_pages_list *list,
 					void *virt)
 {
-	list_add_tail(&virt_to_page(virt)->lru, &list->pages);
+	list_add_tail(&virt_to_ioptdesc(virt)->iopt_freelist_elm, &list->pages);
 }
 
 /**
-- 
2.43.0


