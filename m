Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D18F3C02193
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  4 Feb 2025 18:42:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-Type:
	Content-Transfer-Encoding:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=uVb6rlC8N7grmDGMSimD04zGlLbI2qAuyviSL06q5k4=; b=euT6ASH+qb14HU2qwYTIGf9yx7
	ANXXoPfmBnzSe9P1abVrxVBXBVlDcp2fE/CU1wcnhORDJG6jZp23Sh2hC6au0Y7OS/iWIBuwhbem3
	Dr76jyldfHe/PeU8U3VN60X7322Xd9eaUXzWbQ79bErJuh9PDAjqHm28FqAzeeX4OZ48rkKu1GTOp
	7cr5Q+IqvOMyoWPQ82fqqP8c7No8Xs8X1Cl+6VNls/cfokGo+OCQ0fayy8qcZPsa5bkFL11ClpDam
	aoxuhhLHlb7/MtwA4ThPuvPBXIttyaAtghEyhQqa/SJ2p9hwGdNiZkc0fxgfkirpFlPwQ5PF5B/AB
	faRdNs5A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tfNs0-00000001G51-2otQ;
	Tue, 04 Feb 2025 18:42:00 +0000
Received: from mail-bn1nam02on20610.outbound.protection.outlook.com ([2a01:111:f403:2407::610] helo=NAM02-BN1-obe.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tfNlS-00000001ELM-1hX3;
	Tue, 04 Feb 2025 18:35:15 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Xa8fCpKE97GPPKpzFGqwCufsN2Bez6VoN+ZB11ZGLbrcAXPacqpXXfZA65D58vI6Q/7KTbIenE5sVV3N+lSQ+z3BYEwNRy5+rfd6R/PwQaONcgeMzYHqlgng/tY0+ig/GvqMk+WBoPQi876n2qQl7aUJ6GfAIyBlyTBntj0O7SDwhmgOcbi+b4FvIDIaLBX/uylcCLSSk1f7NTdwBJ3Fhrm75XQ1VxI14YiSAP8XHgismn+fB/G5L0lUzOf+TdmjlGkTinc88ROoayi8ascz2Te58JL9vSqFWlPuqfrzm08FVf2TEZTH/u9pU/T8W0KvZF9NKtVFHXsizKK7tqd3vw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=uVb6rlC8N7grmDGMSimD04zGlLbI2qAuyviSL06q5k4=;
 b=bmcDWoyIx4p/99Bzr4qrgsUlOFWSyqU8fH0pEfqZdDmzObffKjS85wMnZlEj2cAZ3l88zKbuwYMoZXlktyh9n/it3cbp2lxO93e2GLX9At5Tso3QhzFBU8iu0INW0CJTI2ypIVnl8nPordW8QjZ7gnJhzis7/fYrsJHzasPYxR+oUBvrLxGg9TW95YxU3z6T2ImNteG0M3iBw7mhH69QPCK7VdXPzR+zPI4inn/atD7Mj265FRntb+8PH28oaHiXg2VHycNoANAwEcU4mNIej/6+zAj+PGrYi+15pzziTbdhd+e2KLCpSYKaWluR/Xw74CMMTMIel4GBrQWdwoCOBw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=uVb6rlC8N7grmDGMSimD04zGlLbI2qAuyviSL06q5k4=;
 b=aLEeHWuIklVY+sjFHyWlzA3X/tyvwVll02n9BOYVPQteiOt0TQJbivjt2yN6VXWUT4rZNFexUvCo6kMFTVP4zh24Ec2SNBF+wky5ydjAJVFf2q6HsdSX1I6YZLPiep/sf/YOGvF4b4P7+dva3dq4gC+3a+SFta2qWhXR1Kuwb4d0PoxGqlGyzwrlYk9ICHgNn4iW+Mb6bDtsHH3VlmQbSLdr/+jxZX5GVFw4deZErReVfoc3h67orjTsBVu0v927E401pEbPpzGPLi23+/5dEQZ7y0/YddjBLY8t2WgH4xgj/urhHAtd0DhEP+f8mCilhii8B4457Y1RI2SjaBAmow==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CH3PR12MB8659.namprd12.prod.outlook.com (2603:10b6:610:17c::13)
 by CY5PR12MB6573.namprd12.prod.outlook.com (2603:10b6:930:43::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8398.24; Tue, 4 Feb
 2025 18:35:04 +0000
Received: from CH3PR12MB8659.namprd12.prod.outlook.com
 ([fe80::6eb6:7d37:7b4b:1732]) by CH3PR12MB8659.namprd12.prod.outlook.com
 ([fe80::6eb6:7d37:7b4b:1732%6]) with mapi id 15.20.8398.025; Tue, 4 Feb 2025
 18:35:04 +0000
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
Subject: [PATCH 15/19] iommu/pages: Allow sub page sizes to be passed into the allocator
Date: Tue,  4 Feb 2025 14:34:56 -0400
Message-ID: <15-v1-416f64558c7c+2a5-iommu_pages_jgg@nvidia.com>
In-Reply-To: <0-v1-416f64558c7c+2a5-iommu_pages_jgg@nvidia.com>
References: 
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: MN2PR14CA0024.namprd14.prod.outlook.com
 (2603:10b6:208:23e::29) To CH3PR12MB8659.namprd12.prod.outlook.com
 (2603:10b6:610:17c::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH3PR12MB8659:EE_|CY5PR12MB6573:EE_
X-MS-Office365-Filtering-Correlation-Id: b7bd385c-d52f-4e7c-a74c-08dd454aa33c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|7416014|376014|1800799024|366016|921020;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?JeF0S2dR/9g53lPXT6IpfqVqyRDa62a3lJS0dIoeORBBwA9SEPRD355Aw4Rh?=
 =?us-ascii?Q?4hTTo4B0WOS98f6xWfDfpTaD9rta5MGIpeTXeRW5LZlqtibiMjWYzXJQbv/5?=
 =?us-ascii?Q?f7wfgKyxrJ5nw39JdYD7pgnsHUpaFI/z07pTUPNsPYQ7TBQLZ+i6s9RgKJRE?=
 =?us-ascii?Q?IK56XeKIO/DcqlHMPMNNMu1/CedMCi5GMBeza/a15Cf7tfMjwdMWIW7Eou/D?=
 =?us-ascii?Q?6ya5EX9c+p2smH/CU685A+nV66BACMFtUwBC9F1GIp6bPEUO66jzbOeligMh?=
 =?us-ascii?Q?R1p0EbRNi45Sxi1O2SMTBNAsQfCK65Fu8YoajSA5/EpkuiLxcWq99jt80Voq?=
 =?us-ascii?Q?GstmQDt2wpNUyOYOzV9KniIHNvXLQf5DHcTIx23YqqfgUcKwSjhgpGUW/yMK?=
 =?us-ascii?Q?ZvJgfbEWnjl/aRQMxpvTb1hmdsrXGLiIkvpDYwwytRky+zHXhCRnLniKVUNF?=
 =?us-ascii?Q?Y9/TXafxvyop5aV8iZWpDT0Y60MzUkPvhoUop1pWiTxWz3FwyhMt1JiXneY8?=
 =?us-ascii?Q?7hznn80JwILAdI0ARnd4RDanWquAguvHLJRnXaBEdRdO82PbMJ2bjPBZEaCo?=
 =?us-ascii?Q?7wCjAD9kCXGeOSxisKtLnkX8KhMb/65bWf1bfCSj0d8PqWGuP0Co7Amz/61U?=
 =?us-ascii?Q?gVDwfS9wPf0eLtbuqX4rXK5EQXXpiCo+Rf1ID5mde7y0qzn0w/cyeCCEpdFb?=
 =?us-ascii?Q?rw5icvPw7sbu83jgV6ksAmcYZ9VMDAuKMj6lNbkvnVVEpsl5yQiYd5BP5gk8?=
 =?us-ascii?Q?pR7BkkTYwflAH5DqxGu4vE7d4cS61DlY0caIhelKLiQms317Ia9FURhR2rva?=
 =?us-ascii?Q?8jhv16LYcTDfKqa50vQkYRVlnw1ONWIfPLtB/CSHwhktEgXBrBqzTDx96F+V?=
 =?us-ascii?Q?jibxCWL1rPuL2HO57YcfXUVPBOz7Ch7y5K+C6kEG8jhpfOQSJ3Vsnzir0xpT?=
 =?us-ascii?Q?CzqS9Ar5rpBbAJNPDiSdOSU+laFv78XfBRcjChUfQ+OTtd4klDgyxpjoVG9j?=
 =?us-ascii?Q?/rEsWopVsoUbGAW1W8RhFK+ykGVLEatZh1ueqGgQhtsOLtXPtbVIdkD+7hD2?=
 =?us-ascii?Q?KPEZD4h+jpsCsVZbrP+wACrE4Jw56H8URU19I73tcnUd5mCOD5TNLNyHXoOg?=
 =?us-ascii?Q?T5ZMX+b8vK8pptyqOoxhotqKd2moxVJh/rv9O+B6U0ID2q58t7qEel5viJ9A?=
 =?us-ascii?Q?5WWqKfRL+IHaMdTw77Ve4p+q/b+zsTU+9FFVO07m/mu+aC8ltsHYWApUTJUD?=
 =?us-ascii?Q?2B0SCVvBoBnApgQ6Z8luMKeYea7E+JopAmKeikVUsj+KO5xx5uNuKNmOfGjC?=
 =?us-ascii?Q?aIxmex6qRnT8KuAnJe4hPs9pag6dv+2gQZnF0Wsh6JQod5EsNmCGN1ktctaQ?=
 =?us-ascii?Q?aG8vrYt9fMaF/am2d+KMEu7y+60hx6BKHlAcnevRnxhOXy8cTnviPpxQHXDL?=
 =?us-ascii?Q?24M1t2L+dNs=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH3PR12MB8659.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(1800799024)(366016)(921020);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?LfbXCUMtdaeyZaS/1VW2rVfld5a25jU5gXUwzt6ME6R1FHry1Fk+g+7PJ3py?=
 =?us-ascii?Q?iNUaLuAWHPgrniupsJfrCF0ybh4uCYgIjKeqMfU7aod/eV7DGCY3hbdZgllr?=
 =?us-ascii?Q?+B6boIbzIN6X7wp9M46e0+e/zNjE9W/UOL0D+XLrDGoazxDMOp4uTslZiFMc?=
 =?us-ascii?Q?+ct298AzEckdQ6Y++vDEOsNdF2qZTJEGdreDmRBvN6I5l925pawL5h8PXto4?=
 =?us-ascii?Q?xW9LN06ouzDSlslYEz+fcgjrZNLG4gKPZ+992LZU+c9H404434+OCihF26eu?=
 =?us-ascii?Q?WikGSd2CM86o/ndoYCSjXHKU/J2poR/IVLkq+Va1CBh3LCCI5ir3QtHPjkVk?=
 =?us-ascii?Q?C4tLarPxXD9u4sNi8+tUFlc+lMH0QKfHHhvXcvzpENlBcqUhhSlfBnb2plXT?=
 =?us-ascii?Q?zHmCtaZ5kZy5TLPH6DP/pWmC2RMTRfC9elpLAv/QaCOu76D3Ct0ytFZF1Oir?=
 =?us-ascii?Q?gieNRPV7jpPK+ObdFld+5o+if3PP9TWBN4H04gZvcYL+7yuUEv8SOj7MJb+t?=
 =?us-ascii?Q?XdgJizfcz1pDZ6G0a98O7dRK7jwDYU8Svmn0KGRPOQUqAZIQAmlkolW/Ez5P?=
 =?us-ascii?Q?vW+Asr0dVQvbV6HVooSndCmXHG3caPa7v4Xaho4TZGKnTQ8TuriY6Gv5RYO8?=
 =?us-ascii?Q?qiB1aV8jNCs7G/taSTessegK00xhfdFpDdFhfpBB6UEMcXWI9Xley6fGJUsD?=
 =?us-ascii?Q?13xTxC9Gts8bbkCMu0FmxeExpMc5ujJiGHjEer99UBBS1+vJLVwyWWeaVGfu?=
 =?us-ascii?Q?urdZK78QreWymKEBmFXT5wjAUyQ5D+kA7G5Mf6Rlr5cG6liXIfBM2W5DlrxC?=
 =?us-ascii?Q?Y0AvMOJ+npEecYXcDnZgVW749cM+lNwOnYJ96dH/pSYFunxZt89+KJfnLXEa?=
 =?us-ascii?Q?DxKrZmzNXi2QbdK1JrjhuUT55J7lXqWrqbOFvbxSq2mARv7Tg5gjkfdrjaZf?=
 =?us-ascii?Q?4B4wdTakgOht6wuEdLZTD4c4XDA2JRXfVYqCxZkfUj2E4+8Hn4udOq97c+oL?=
 =?us-ascii?Q?kwKnMJFVWHRbXBHV2n2GyvZXp+X4Vy50MI0beM/Ak92FEKrXY3Cnjz6usJ2G?=
 =?us-ascii?Q?wp9T5198QQWOUJhGyr40FvZ4uLg47lAZ3lpoD0tNE0lo0lbwMVqpYGJlioI/?=
 =?us-ascii?Q?BCOIcBvxiChofEaFBCQABpyb8LeqwsmZkxlZmoYw5F+eeZl+J+HOom0ed4yv?=
 =?us-ascii?Q?5ptklnPV8mKFDGRg9/6BxeAlIZYhT4q1j7Lz9EtL86655Dx4tvKRfM1vPqNS?=
 =?us-ascii?Q?bfl+kXfoAKvn3zLF4fZo9/O/fqH9MDOURXFA17PgAy5RrM6W+y6+SxV/dvE5?=
 =?us-ascii?Q?blfsBTiD7VZv3Y2ykbyl7Wc8CHjyNgvCxx6kVhPS0vO7Ks7U1oJyAiCgNPX8?=
 =?us-ascii?Q?LEE7+LdkOuIgKnM/1iDGOOEI0Y5WtR6KxFrrx7spRUvq1BIorCKBWrQ7Lu6q?=
 =?us-ascii?Q?AtE2WySvPtbIErI5tTj3q/ScpzERr7VCDzlYqWtK7e1PW/c5VpZbye8WwmVt?=
 =?us-ascii?Q?SFW45SRUSIBw2tPLfikHYIjxwKvILDtsCCaDu72h2y+FF0ceiLDrEOsxeTMm?=
 =?us-ascii?Q?SCkeYwHjG8l5KpcZkgY=3D?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b7bd385c-d52f-4e7c-a74c-08dd454aa33c
X-MS-Exchange-CrossTenant-AuthSource: CH3PR12MB8659.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Feb 2025 18:35:02.7758
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: cbBzjoxUVwpwZoRE1WtL0kfa7Vu8jgldKemGDHrsJ+gq5gSo9EFTAHjQnwMWxbGc
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY5PR12MB6573
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250204_103514_543330_E8CB6F6A 
X-CRM114-Status: GOOD (  18.86  )
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

Generally drivers have a specific idea what their HW structure size should
be. In a lot of cases this is related to PAGE_SIZE, but not always. ARM64,
for example, allows a 4K IO page table size on a 64K CPU page table
system.

Currently we don't have any good support for sub page allocations, but
make the API accommodate this by accepting a sub page size from the caller
and rounding up internally.

This is done by moving away from order as the size input and using
lg2sz. The only difference is that lg2sz is directly ilog2(size) and does
not have the PAGE_SHIFT bias. lg2sz 0 is 1 byte.

Signed-off-by: Jason Gunthorpe <jgg@nvidia.com>
---
 drivers/iommu/iommu-pages.c | 27 ++++++++++++------
 drivers/iommu/iommu-pages.h | 57 ++++++++++++++++++++++++++++++++++---
 2 files changed, 72 insertions(+), 12 deletions(-)

diff --git a/drivers/iommu/iommu-pages.c b/drivers/iommu/iommu-pages.c
index 47ee9ad4a40d4d..b174dd93f3c226 100644
--- a/drivers/iommu/iommu-pages.c
+++ b/drivers/iommu/iommu-pages.c
@@ -23,24 +23,34 @@ IOPTDESC_MATCH(memcg_data, memcg_data);
 static_assert(sizeof(struct ioptdesc) <= sizeof(struct page));
 
 /**
- * iommu_alloc_pages_node - Allocate a zeroed page of a given order from
- *                          specific NUMA node
+ * iommu_alloc_pages_node_lg2 - Allocate a zeroed page of a given size from
+ *                              specific NUMA node
  * @nid: memory NUMA node id
  * @gfp: buddy allocator flags
- * @order: page order
+ * @lg2sz: Memory size to allocate = 1 << lg2sz
  *
- * Returns the virtual address of the allocated page. The page must be
- * freed either by calling iommu_free_page() or via iommu_put_pages_list().
+ * Returns the virtual address of the allocated page. The page must be freed
+ * either by calling iommu_free_page() or via iommu_put_pages_list(). The
+ * returned allocation is 1 << lg2sz big, and is physically aligned to its size.
  */
-void *iommu_alloc_pages_node(int nid, gfp_t gfp, unsigned int order)
+void *iommu_alloc_pages_node_lg2(int nid, gfp_t gfp, unsigned int lg2sz)
 {
-	const unsigned long pgcnt = 1UL << order;
+	unsigned long pgcnt;
 	struct folio *folio;
+	unsigned int order;
 
 	/* This uses page_address() on the memory. */
 	if (WARN_ON(gfp & __GFP_HIGHMEM))
 		return NULL;
 
+	/*
+	 * Currently sub page allocations result in a full page being returned.
+	 */
+	if (lg2sz <= PAGE_SHIFT)
+		order = 0;
+	else
+		order = lg2sz - PAGE_SHIFT;
+
 	/*
 	 * __folio_alloc_node() does not handle NUMA_NO_NODE like
 	 * alloc_pages_node() did.
@@ -61,12 +71,13 @@ void *iommu_alloc_pages_node(int nid, gfp_t gfp, unsigned int order)
 	 * This is necessary for the proper accounting as IOMMU state can be
 	 * rather large, i.e. multiple gigabytes in size.
 	 */
+	pgcnt = 1UL << order;
 	mod_node_page_state(folio_pgdat(folio), NR_IOMMU_PAGES, pgcnt);
 	lruvec_stat_mod_folio(folio, NR_SECONDARY_PAGETABLE, pgcnt);
 
 	return folio_address(folio);
 }
-EXPORT_SYMBOL_GPL(iommu_alloc_pages_node);
+EXPORT_SYMBOL_GPL(iommu_alloc_pages_node_lg2);
 
 static void __iommu_free_page(struct ioptdesc *iopt)
 {
diff --git a/drivers/iommu/iommu-pages.h b/drivers/iommu/iommu-pages.h
index f36103f591e91b..84140dedb8cc4a 100644
--- a/drivers/iommu/iommu-pages.h
+++ b/drivers/iommu/iommu-pages.h
@@ -46,7 +46,7 @@ static inline struct ioptdesc *virt_to_ioptdesc(void *virt)
 	return folio_ioptdesc(virt_to_folio(virt));
 }
 
-void *iommu_alloc_pages_node(int nid, gfp_t gfp, unsigned int order);
+void *iommu_alloc_pages_node_lg2(int nid, gfp_t gfp, unsigned int lg2sz);
 void iommu_free_page(void *virt);
 void iommu_put_pages_list(struct iommu_pages_list *list);
 
@@ -84,16 +84,63 @@ static inline bool iommu_pages_list_empty(struct iommu_pages_list *list)
 	return list_empty(&list->pages);
 }
 
+/**
+ * iommu_alloc_pages_node - Allocate a zeroed page of a given order from
+ *                          specific NUMA node
+ * @nid: memory NUMA node id
+ * @gfp: buddy allocator flags
+ * @order: page order
+ *
+ * Returns the virtual address of the allocated page.
+ * Prefer to use iommu_alloc_pages_node_lg2()
+ */
+static inline void *iommu_alloc_pages_node(int nid, gfp_t gfp,
+					   unsigned int order)
+{
+	return iommu_alloc_pages_node_lg2(nid, gfp, order + PAGE_SHIFT);
+}
+
+/**
+ * iommu_alloc_pages_lg2 - Allocate a zeroed page of a given order from
+ *                          specific NUMA node
+ * @nid: memory NUMA node id
+ * @gfp: buddy allocator flags
+ * @lg2sz: Memory size to allocate = 1 << lg2sz
+ *
+ * Returns the virtual address of the allocated page.
+ */
+static inline void *iommu_alloc_pages_lg2(gfp_t gfp, unsigned int lg2sz)
+{
+	return iommu_alloc_pages_node_lg2(numa_node_id(), gfp, lg2sz);
+}
+
 /**
  * iommu_alloc_pages - allocate a zeroed page of a given order
  * @gfp: buddy allocator flags
  * @order: page order
  *
  * returns the virtual address of the allocated page
+ * Prefer to use iommu_alloc_pages_lg2()
  */
 static inline void *iommu_alloc_pages(gfp_t gfp, int order)
 {
-	return iommu_alloc_pages_node(numa_node_id(), gfp, order);
+	return iommu_alloc_pages_node_lg2(numa_node_id(), gfp,
+					  order + PAGE_SHIFT);
+}
+
+/**
+ * iommu_alloc_pages_sz - Allocate a zeroed page of a given size from
+ *                          specific NUMA node
+ * @nid: memory NUMA node id
+ * @gfp: buddy allocator flags
+ * @size: Memory size to allocate, this is rounded up to a power of 2
+ *
+ * Returns the virtual address of the allocated page.
+ */
+static inline void *iommu_alloc_pages_sz(gfp_t gfp, unsigned int size)
+{
+	return iommu_alloc_pages_node_lg2(numa_node_id(), gfp,
+					  order_base_2(size));
 }
 
 /**
@@ -102,10 +149,11 @@ static inline void *iommu_alloc_pages(gfp_t gfp, int order)
  * @gfp: buddy allocator flags
  *
  * returns the virtual address of the allocated page
+ * Prefer to use iommu_alloc_pages_node_lg2()
  */
 static inline void *iommu_alloc_page_node(int nid, gfp_t gfp)
 {
-	return iommu_alloc_pages_node(nid, gfp, 0);
+	return iommu_alloc_pages_node_lg2(nid, gfp, PAGE_SHIFT);
 }
 
 /**
@@ -113,10 +161,11 @@ static inline void *iommu_alloc_page_node(int nid, gfp_t gfp)
  * @gfp: buddy allocator flags
  *
  * returns the virtual address of the allocated page
+ * Prefer to use iommu_alloc_pages_lg2()
  */
 static inline void *iommu_alloc_page(gfp_t gfp)
 {
-	return iommu_alloc_pages_node(numa_node_id(), gfp, 0);
+	return iommu_alloc_pages_node_lg2(numa_node_id(), gfp, PAGE_SHIFT);
 }
 
 #endif	/* __IOMMU_PAGES_H */
-- 
2.43.0


