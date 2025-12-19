Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5CFD6D7879F
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 19 Dec 2025 17:14:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:
	Content-Type:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=znGKi8UiQTrTPxaFFsFeATFkfQNzQdNWlQ/LC3IsWcY=; b=sdWiD+Cyrt8UW6McPEyTQeKyoy
	7WnrTNIhvjCbFij9aA7iHJPMwN6MlVOdaeknY6K1gt+ce4OFQAJOBOfymkqTsYIhHm3vAwxwFVog1
	b+3dDNY86E6LTd1NgxQO2xvy+m55SOltBe1w16ZDTAN6sTjsJUcKAQ0XS3VJn5B973KuUVi80xRVA
	RZll/zN4TeWjrP5t+V2I9SRkRTFRHjZEHKEm7gatgcPKc8SGej4ITnF4cUMl4y2R7w0Eo5WOrvedm
	3E5jshgLAhDBh27tb6pybhTXXNtZEM1cVBSDT5eXj5wYjNYOFcVsKek3wxmYvITAK6kmRYisxCMxE
	zGRedeow==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vWe3b-0000000AhE0-0IXw;
	Fri, 19 Dec 2025 17:14:23 +0000
Received: from mail-southcentralusazon11013048.outbound.protection.outlook.com ([40.93.196.48] helo=SA9PR02CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vWe3Z-0000000AhDB-03w9
	for linux-arm-kernel@lists.infradead.org;
	Fri, 19 Dec 2025 17:14:22 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=TsgIpoF48YfBuhN5y/nkMmGH4j190GXSJrVXnyPaWNCJhZj+o27Cif7tjkafmKmvIlhf2mSQY5Yjksv83N7SK4fINPPno9Ly+Y8vlB5yfo9Cl7OdAs+8KDUjlyrsQ6RUQsa4Vwef70Fh4aHjO35vAXBB9YSlqaA9KYkgGON0BIchOZMXMQBbxR6fh9G7XMkpyAsxLnzaiyHc0uqmYsBlvP1Tpw0hNlST6DuGibwp8y0zHuUMv9hYjUoF4tfl5ZnkF7OcVcvfePZPTeThOCqhZNfbykGfLijE7a/NRBP4P7oOek1DAh/73etBb3KFI1T/gzw6bjEjJv7r+iJh2NKk6A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=znGKi8UiQTrTPxaFFsFeATFkfQNzQdNWlQ/LC3IsWcY=;
 b=G++ALLuKY5cHvWn1pQlySEfHuBFI4LK6tREJ9I9gJ/5tZqtkwVVs6Kqs9Mq0AmGv65sBDsEcMH0LLR9Y6wwAPsQZPNMwOReZTtkLFQ2VOCjiKwJqk/dQlxSnwg5txc3JuGqBDhT79royLlpXv/9ID2DIaaezqDeF8jLjYiNgRNTyEzNgaLNs7+JtX6N8wdIwGWh3g9jANgEJ0sk/NwitdbID7ruPNR+lZvykqSZzEGkPTlIQWpIKtaO+5j+XnCVjIc1gHp60KrB0qcBiFkG1pMrnAeLcDEY2qNv+O2lnpv+Rn+zeKWe3S4P+mBdZSoNZFKBP95TpD8aiG38F/gG0Sw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=znGKi8UiQTrTPxaFFsFeATFkfQNzQdNWlQ/LC3IsWcY=;
 b=qa/7jITGNVUcAopwCAec1hfL8O/n2R4Fa0IIdkvDPzYK/IU4gZwgfA85ep19IqXcxCt1/Ia6BrP53mGRKgMBNlOgcH0cHnnk0O2aUBOXPePprDDIW2l/qEG1H+F52H+sC9FtFyXUBau3ry6csF70NyKPiQPcXn1pf1DK165kPcDIWyc0wRTAaN37jAo43aMVuPafhuKb0UOJeUw5TUHcZXPq8v166DOdhPe4dXchtxfLHDtQQloa43eBDaFnUoVobJsoesDKDzQ62B6bf5mSRsS54YYKUysaddu3K/gUcl26ND4GdOR5IANYuKPvly2AuNdUPIZM9E85peuyhTH7Mw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from LV8PR12MB9620.namprd12.prod.outlook.com (2603:10b6:408:2a1::19)
 by CH3PR12MB9100.namprd12.prod.outlook.com (2603:10b6:610:1a8::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9434.9; Fri, 19 Dec
 2025 17:14:13 +0000
Received: from LV8PR12MB9620.namprd12.prod.outlook.com
 ([fe80::1b59:c8a2:4c00:8a2c]) by LV8PR12MB9620.namprd12.prod.outlook.com
 ([fe80::1b59:c8a2:4c00:8a2c%3]) with mapi id 15.20.9434.009; Fri, 19 Dec 2025
 17:14:13 +0000
Date: Fri, 19 Dec 2025 13:14:12 -0400
From: Jason Gunthorpe <jgg@nvidia.com>
To: Arnd Bergmann <arnd@kernel.org>
Cc: linux-mm@kvack.org, Arnd Bergmann <arnd@arndb.de>,
	Andrew Morton <akpm@linux-foundation.org>,
	Andreas Larsson <andreas@gaisler.com>,
	Christophe Leroy <chleroy@kernel.org>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	Linus Walleij <linus.walleij@linaro.org>,
	Matthew Wilcox <willy@infradead.org>,
	Richard Weinberger <richard@nod.at>,
	Russell King <linux@armlinux.org.uk>,
	linux-arm-kernel@lists.infradead.org, linux-fsdevel@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org, x86@kernel.org
Subject: Re: [PATCH 3/4] ARM: remove support for highmem on VIVT
Message-ID: <20251219171412.GG254720@nvidia.com>
References: <20251219161559.556737-1-arnd@kernel.org>
 <20251219161559.556737-4-arnd@kernel.org>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251219161559.556737-4-arnd@kernel.org>
X-ClientProxiedBy: BL6PEPF00016411.NAMP222.PROD.OUTLOOK.COM
 (2603:10b6:22e:400:0:1004:0:9) To LV8PR12MB9620.namprd12.prod.outlook.com
 (2603:10b6:408:2a1::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LV8PR12MB9620:EE_|CH3PR12MB9100:EE_
X-MS-Office365-Filtering-Correlation-Id: 34b79c46-7393-4908-da0f-08de3f22086f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|7416014|376014|1800799024;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?BXh3zxwJSi7ttDCYk5sm07ocDPelSJ3qyHREtk4ZKRZFPY08aWkrK+3k12Nl?=
 =?us-ascii?Q?c4hCbYW7xbZqci+2LAGrMPpbPmWGO9KBeXY0Oo0w1S0nsimYLLXI5pCNE91u?=
 =?us-ascii?Q?pvtdAASrhLsws40Cj5BMobqC05mdy70L5o/vKPmVRZWCZgJkGsL14yJoYy40?=
 =?us-ascii?Q?ayzscvxAQfYbechFuUZc3UgbVSs4L/IoSVd7xJGFAubxGZ1ROF4Xu6eeA3cc?=
 =?us-ascii?Q?z8stWlWUwYPE4jmcY+ZjprlDniKK52XW23yTsINKPvLT+IzYobuI0+W/ilNR?=
 =?us-ascii?Q?Fh3V1frabGlG1A40x854ICSaY3VJ+Rs5zzDO8374bSd8m0EdNtN6UzLl49Zn?=
 =?us-ascii?Q?HPwWBTAnxxpVn1pYNlIbY4F3dyXLkCbMk3Yx1rx7BQbmBKCAN0oMXeIyI1tt?=
 =?us-ascii?Q?3KqBOHl98YIKMs7gt80YYMk13QSalgfT5OHfkF6mdxH5NI4MAHaEnKeaxSra?=
 =?us-ascii?Q?2IY2e+C7JNVi+HZPt+dT4wCd4xaa7lY6jGxm6e7tlHpMRa9EO28tt7mOZOwF?=
 =?us-ascii?Q?ucIEvtXNc4w5CfbQlteWPEwp/4GkwnCdj5vt+nXkLkysB2oquACe6IBVIrVx?=
 =?us-ascii?Q?0Z8ySYxttInTRwJm4iL1I0VyGXBY2QDwIJqF8Bg4fIdXqe6kLpGzw8zZHrjx?=
 =?us-ascii?Q?xVtGk9ytBieH2nVx8MuUes0z/UXXLJGJK5Fq5CL6+I0mLkAI60YqoqEVWJWL?=
 =?us-ascii?Q?WvxrYGK4ICdllxmIqwbA0GdkF98ngBnr9dgDsGqmFQKanbCAR0YvNBddxXm+?=
 =?us-ascii?Q?KI1IrfcTgrsl190r3NMRmdDqpMF7ObAYoun37v5e3L7zCAx8GXHiFzi2AwOm?=
 =?us-ascii?Q?7mdNyWZKnsxRF0d5Cnx/Jdfz95gyESB+eGwB+NZzjGM/otfOBfS3ZhhKQ5Os?=
 =?us-ascii?Q?qWHKNHbBShJDQqeu3CBIRXfPx/M5qe5VB0XhrJSIG0NQnfJpyqRX45ffuvMn?=
 =?us-ascii?Q?1cPF/88ra9t/QMejPINaOWZU/ndvjRUzk9R53ayaWccISdaAIE6QTLegL/Tp?=
 =?us-ascii?Q?b5R5MPHHT4epNmAvkv2Du2EaZ5TiAtKZk9OVSJoymFXfv6qEY9c/MNxzAgM4?=
 =?us-ascii?Q?m/f7yD8jeSNmrxajg71WvW+itYjSOSq8ctyfZ5bieXzg4d+c1CePpYra0+Cv?=
 =?us-ascii?Q?5s31nZgIyzUY2v9VH9ToZC6E6Tl5SjP8fkrlT/j9ALoaSxbPPxVT4cpph1Xa?=
 =?us-ascii?Q?YkT353+Cws0ogsT83rpaNHjxXtNxec/bG4DqJCIvTNPIqiehgrnakB4FIjkk?=
 =?us-ascii?Q?qenrMidYunsfmY0I2uh3yixKt0Zz5sk9j1JQJEkH9jTvj8o0MyXIpAxKVMSh?=
 =?us-ascii?Q?5EgzQ+jE/3mWt/VDe1kqMN4DW6uPJcHD2t0pJQVd7wc1Er/VWJ+D17NMni1L?=
 =?us-ascii?Q?ByHSn8wb80KLCH+s+50LH050cYP3PyAoEvGF7OyP8u9tyyjeD8xFK86tSce0?=
 =?us-ascii?Q?0IpRPRclZs1aLbF7dHJ029QDMB96pMbp?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LV8PR12MB9620.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(7416014)(376014)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?sKqTKJlrQus/vPBD6TqqBlXbTl6slhaJ1BL2f5NaJrx8EvLTDV5iJwXjt/QD?=
 =?us-ascii?Q?nVpe6xOB1TeiKnN4+qPPZAeQNM7FDK3y0ut9+sjFteQ95P11SC1DPogZ2Qnv?=
 =?us-ascii?Q?SGSTuxhLXn+DVU3GencQAeuTFTE1aUNmCUirveiaR0227p+WreRK9Gz6lLdC?=
 =?us-ascii?Q?e7v3pL5NPXBuMsceT6bz9DKuVqinRziO2wJI50HUbiEu5g5D5I+ysqkuG3Bj?=
 =?us-ascii?Q?wGcLqOnxiZqs4/RgDrIJlcz9ovF9uUUeb4jGih052ciqzbUIAQqHVyXqVi3d?=
 =?us-ascii?Q?eNClkXYqh10kvN25IK6CCJuXGsQjubFAgk5bz5jFY1VE8iTwERNA19D/jYZX?=
 =?us-ascii?Q?/5BQeHB8lwPTUiPCuB5O2mhzyN8tkqLNVZjuOMh5fwQZCvb3hAu1303Z4W8T?=
 =?us-ascii?Q?9tRz4xFQTH7WA3NEqXlzLHzls1ETrxjkD1ukUg9VQhoxm7UHuNaUufPty4o+?=
 =?us-ascii?Q?6dVjoeW+FDd/TtKJqdKlfrmS1tvKaaHrUX1EtlwPlEyvWsT4WpIlB5t4UncP?=
 =?us-ascii?Q?hSRwZu+gck00B8gC/a4pUk7y6+QyACvN5aHckquWxYVp2WMEK7FIQytcp78j?=
 =?us-ascii?Q?nrgo0fi+OgjCESiOYBmeGoUq8z1syTo5S0GYLsbKnSrRBNLqAh1B7RJSH11U?=
 =?us-ascii?Q?IPZ25TgRHaus92VBqhyEnzMqYFuRIx1SJpZcbLXkcimAo3kqMkg9UZhC4EWB?=
 =?us-ascii?Q?NXDUOK1qxmzSwM/EgzmjOSpZdRzyFRjzMuQ5ikFURJk3Je6sZq7PfAIqDB6Q?=
 =?us-ascii?Q?sZYdkJ8cAjTAxUF1PLEkrbBKRvJfZAVOTdZxl41XVVllGuYKhC6ziRGXa/Qm?=
 =?us-ascii?Q?oCp6aO/c1Xd2Zk271hjKUMSVrrDHsUNgYC7vA/y3hL7C0t3W4CRSZYP0SzHx?=
 =?us-ascii?Q?GruXBOs1Q4qjKaw1cbBrOB4bLusWcHvPt7LW88iYSDnOA3zLOLOGkB/HBYsU?=
 =?us-ascii?Q?iS6Q5SscfwGodOzRsbAtDwa26oZJASt7poyzu47F7WnVcL7FTjqGiZw5+a3H?=
 =?us-ascii?Q?FPfmVwyBiZmVQfh2/d3aXywJe+jFxNbfIv8Yq9psAHjZzqOMg3KMaORnHBBq?=
 =?us-ascii?Q?7sRuG30ZPGez0YlTc3+LbesN7bcUj2gc4wNKaTMUvv0hdpNA4xHjeixZXlUl?=
 =?us-ascii?Q?IkJwFkjFBVL6fIac0A7Sz9cf3Seaq6uJUaY/v/jQKGCiWoLWfqYwBQwqsFji?=
 =?us-ascii?Q?F3xRHAAJ0x/VEVg23FWMwbVk7nPm3ULdhFol5H/0Ow9J65LZmb/z+fVA+3aT?=
 =?us-ascii?Q?TvtqCa3nIOUBfLQZVt7X8+LdvAxhjiH+Q5cvQ1ZaSIRc+YshkatajZwlphAj?=
 =?us-ascii?Q?Rkzt/kBH1AqZDhuWKC26p7UzjYryydgNkVvmb6mp60tgSl/+iy0AvdhKZbup?=
 =?us-ascii?Q?kP0UO5RZL4SP3Rapj/xaT+zSjbk6UPciCKY6Xj4nQPmjYLgue2UBXkaqZv0W?=
 =?us-ascii?Q?8JyIGAhTyB1ZUqegAbWz5BTlVc866mHyDFxlVAKQXeYVOB7TzIqY0xtF+0y6?=
 =?us-ascii?Q?taLp31TAzoYnr01F0eLwYXj2pzYhenczfjWXfkz8gHEwEDQTts+S1s8ObDZy?=
 =?us-ascii?Q?UkE4DvAJ4JK/eWDlYa31BRginuoVk7yL65fGLNmERjRousPVjNM+T2nKXDNy?=
 =?us-ascii?Q?h3ciunw7Sp5qnkbTItNS6YgBjwo/I8O0ByyUrbBnurlETD798yFbkuitxq6k?=
 =?us-ascii?Q?La/40raj6dfZN6rW1UXOq9tMWxZ8MWwQv36EWfmLHrh3fXDK?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 34b79c46-7393-4908-da0f-08de3f22086f
X-MS-Exchange-CrossTenant-AuthSource: LV8PR12MB9620.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Dec 2025 17:14:13.7328
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ev8Ou01oH8lj5dV3BwI+AEgC1imFHHgHEVaoI4KiZ4IFgrVmGFvzUffSO45MsdLz
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR12MB9100
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251219_091421_054952_545211C9 
X-CRM114-Status: GOOD (  19.84  )
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

On Fri, Dec 19, 2025 at 05:15:58PM +0100, Arnd Bergmann wrote:
> From: Arnd Bergmann <arnd@arndb.de>
> 
> As Jason Gunthorpe noticed, supporting VIVT caches adds some complications
> to highmem that can be avoided these days:
> 
> While all ARMv4 and ARMv5 CPUs use virtually indexed caches, they no
> longer really need highmem because we have practically discontinued
> support for large-memory configurations already.  The only machines I
> could find anywhere for memory on ARMv5 are:
> 
>  - The Intel IOP platform was used on relatively large memory
>    configurations but we dropped kernel support in 2019 and 2022,
>    respectively.
> 
>  - The Marvell mv78xx0 platform was the initial user of Arm highmem,
>    with the DB-78x00-BP supporting 2GB of memory. While the platform
>    is still around, the only remaining board file is for
>    Buffalo WLX (Terastation Duo), which has only 512MB.
> 
>  - The Kirkwood platform supports 2GB, and there are actually boards
>    with that configuration that can still work. However, there are
>    no known users of the OpenBlocks A7, and the Freebox V6 is already
>    using CONFIG_VMSPLIT_2G to avoid enabling highmem.
> 
> Remove the Arm specific portions here, making CONFIG_HIGHMEM conditional
> on modern caches.
> 
> Suggested-by: Jason Gunthorpe <jgg@nvidia.com>
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>
> ---
>  arch/arm/Kconfig                    |  1 +
>  arch/arm/configs/gemini_defconfig   |  1 -
>  arch/arm/configs/multi_v5_defconfig |  1 -
>  arch/arm/configs/mvebu_v5_defconfig |  1 -
>  arch/arm/include/asm/highmem.h      | 56 ++---------------------------
>  arch/arm/mm/cache-feroceon-l2.c     | 31 ++--------------
>  arch/arm/mm/cache-xsc3l2.c          | 47 +++---------------------
>  arch/arm/mm/dma-mapping.c           | 12 ++-----
>  arch/arm/mm/flush.c                 | 19 +++-------
>  9 files changed, 16 insertions(+), 153 deletions(-)

This looks great, but do you think there should be a boot time crash
if a VIVT and HIGHMEM are enabled, just incase?

Jason

