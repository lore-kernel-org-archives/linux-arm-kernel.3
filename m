Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 63F07C021A4
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 14 Feb 2025 17:20:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-Type:
	Content-Transfer-Encoding:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+akwFg18r3NdimMyy2y7q62VGXPwuDsWVi+yie6UZWg=; b=PPZQ1kcGgj8uQ8+sZ8KavVicDj
	/mGmdjId3n2QAzdaZFWLIbJKh1eV0mlOZN+zQ46mGMpdyMWXbF59toRqToVa1/oFfR3HJNiSLOPR1
	MRA1xJe/w3uBlO1/P1dKgY1yrHrP5IQf4ACkCF2r7grylv+GrHQj0q9Gm4ZB8vdegOIo8x+2NAVKU
	uORKxeZV8eXd/A65z7KsdFnSJ/eNSGD8UZ/coCTosYykoL0+wYEcJmF3UcETFg038dRHKY/DIVxIr
	8XtLxZ1W36LK+2kkUFX7Kd/3+LCzIWq5MSs1gPTPF2/6Kg3DSz1kldxO3qaQ5MpIXQOeS6fbfaBmn
	nlodrbmw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tizMC-0000000Fg3o-42On;
	Fri, 14 Feb 2025 17:20:04 +0000
Received: from mail-mw2nam12on20600.outbound.protection.outlook.com ([2a01:111:f403:200a::600] helo=NAM12-MW2-obe.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tizAh-0000000Fcpb-3wP5;
	Fri, 14 Feb 2025 17:08:13 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=uWr0vIl5OD6+NdmpGAZu2VZitx5Lbi79F4/SlKq4sq+wkmU8WAb7YWr/kf0DtPNs5x29i1i4Yi04Ada9P0We9x6Fm9FAz8irCyNg1dbCmVVsuGsSfNlRzVFxC2pcMWZpZae0gg7qbCGPNGVclAMgPa6wTo/gdZ/V/6WIPAjRRbXZLRAGiy8w1JLX0tLl/xnuyCF7szswpyHlqFPt3ifygDKy3R6Yc6fX5ALFTffGrQLneFjv5go7oes0XUKlV0KM8reTIc7p0FY6AQXB7lS/t36UMUx+fDSrbDB5Nhn2ZQmGS7/nqaasJkYM/Gs+E94qJuWUvZ5tD9wZ+9wmU6Rgww==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+akwFg18r3NdimMyy2y7q62VGXPwuDsWVi+yie6UZWg=;
 b=wgcXRPttDKETQ4zmCvRT/vFgsQsjC/X2hGZPkv1MJJw+j8nAo4ALcjykgMZWaYfZz6jv275tLwVrlKHSFujIvH6GcyO9dMFM7pqgi8o0z6vZsT65NU3xjFOAZ4ew/EpHJjaspA2gYpXG3EzGrubKcK9P60mTog4rqrvhLz7qCQplx1J1vy6cpsK8gDALpeMyLsvJEDIUGe12HU5EAhGcz3go+KgZj8y1pd6kOfO/bIqh+S8WPDAatVK4M1CppwYgtruzYTVk58iavxoZ1CJEuvdxrgLGPuNk8XVqwFn8OF2LFws41NxIG+5t4GKRYfr0DyIyRDTqsJHevnbltZ4dzw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+akwFg18r3NdimMyy2y7q62VGXPwuDsWVi+yie6UZWg=;
 b=qwGi9H5KfSNcP9HxQqjyD/KoMjBbKJcAyMdXngt+mZaBicxfQ0uBuvmWxaDcEfJA47zS+/hC+UP6qEbeJH2yPkEme+HJTjCMOurSEvLaC/FDOIT1rU5gMuBq84DJoxvfVrg8lOJGVReaBpEUOFAAeavapKdszja4+/PR5wH2dCEFASdhHqiL6b0mIsw+nikh9YjbrPgUkoJzd30c+5aSswlY5gZTKixU/Fdo4WKFnMiUwOzB3WRO2KX+QTZXBS957Ul1zSNZjteMFC6jssK7qI0FDqyxw6IWFZ1eQgfnW0ytPDfIpwyraIpISue770MR1swzT9kMeJVgE7PW6U/QtA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CH3PR12MB8659.namprd12.prod.outlook.com (2603:10b6:610:17c::13)
 by PH7PR12MB9175.namprd12.prod.outlook.com (2603:10b6:510:2e6::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8445.15; Fri, 14 Feb
 2025 17:08:03 +0000
Received: from CH3PR12MB8659.namprd12.prod.outlook.com
 ([fe80::6eb6:7d37:7b4b:1732]) by CH3PR12MB8659.namprd12.prod.outlook.com
 ([fe80::6eb6:7d37:7b4b:1732%6]) with mapi id 15.20.8445.013; Fri, 14 Feb 2025
 17:08:03 +0000
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
Subject: [PATCH v2 10/23] iommu/riscv: Convert to use struct iommu_pages_list
Date: Fri, 14 Feb 2025 13:07:43 -0400
Message-ID: <10-v2-545d29711869+a76b5-iommu_pages_jgg@nvidia.com>
In-Reply-To: <0-v2-545d29711869+a76b5-iommu_pages_jgg@nvidia.com>
References: 
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: MN2PR01CA0056.prod.exchangelabs.com (2603:10b6:208:23f::25)
 To CH3PR12MB8659.namprd12.prod.outlook.com (2603:10b6:610:17c::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH3PR12MB8659:EE_|PH7PR12MB9175:EE_
X-MS-Office365-Filtering-Correlation-Id: 47ea99bf-21e8-42a7-18c8-08dd4d1a21cf
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024|7416014|921020;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?WSMCV9jm/PCWNpkP332daoSjHWrEfvNZ3OpibHLnWVt1ACjAc968juJjHLdZ?=
 =?us-ascii?Q?SDDwRI2ciU9/paGP/ha+WKaQGreuyK7YiIpUD7eIKj9GbgV/R0I7dHxqcYN7?=
 =?us-ascii?Q?4n5H3BmLJDYO7CXmWCsthzlJHZHUiIAbWd+g7/7Zm5YAA/GdhMAVgAC3fKHO?=
 =?us-ascii?Q?VxIG1j3zbOHNWUPUYyFxWxkBe1MLO3ABRN0KsPdYoGnvsRotb1fFEDRr+2CC?=
 =?us-ascii?Q?RVHkTkYmLZC2d0K0isl5NFFffrg1pr0NYFrO3SWrL2iCrHoDrhlhD8jkIbo0?=
 =?us-ascii?Q?s40fRrmQODtrrdMXqJ/7GPX32Zvb3VmmRRhnvUTGS3AWi/D2d9hUi+mBlPyQ?=
 =?us-ascii?Q?9BHM/jFr0W7be3sA3xbVB72T9QNCKIB6U6PUE8eMYZw4qO96nY28wdx2WEV5?=
 =?us-ascii?Q?Or3ubfWyalPWRl8pkfCsSrid5K9ZuULi4YI63gMn+hiHnE/cBPZ1dVRhB6C4?=
 =?us-ascii?Q?mANUBf/n3PIxaAfp3s0mC8vYEvkvLH2PoSdznU7CXxxz9mn6xbXKk5GgYvqZ?=
 =?us-ascii?Q?0q2TDaK2TgEpeRfbt1ZzaY2YufB9mpeQn+OPHsOTbjVEbER9iey4djXYaOux?=
 =?us-ascii?Q?dfhTpbHJLRmXTSu/x6LJKnNQPmLAQLIJ3pj7bpsfHRxt1UVpdZg3HrxZQQoD?=
 =?us-ascii?Q?b3MhRX780fITiVxFTlOlsSsvq3LdYnA27T5B1JyO7EQzGtjBZwOcCKWMj4AX?=
 =?us-ascii?Q?x4sJIDO6wlcjzikJIKSjEUeXb6N2UjiPTJsL/glUP6xPByJMbFPSlwMSp52Y?=
 =?us-ascii?Q?qIZYpWQPnhuOE+/E4Wa3IbB5aIH1mJMAEO85LJr3cZuwuOnIbYngMJPoTHnU?=
 =?us-ascii?Q?m7fNpiO8nsnEocXZ9xqc4Brc+8BboE6WAoemoTtSZO/QlVpG2jXSdxEcCXH/?=
 =?us-ascii?Q?EmqzeI/PnYEknhRTs6mb+1gUDf8RCCsabCbYy+1zkBFA24DkmYcU0HhVQKX7?=
 =?us-ascii?Q?21d4HvZRNEn1zxIwHY09DE0YvLpJhtYLCjCdHIGUAQhXzelipSvSbM3Jf2gV?=
 =?us-ascii?Q?ZYVNVsA9AlYY2Clo3xM0h+C57qeHkRZLFSI93Ikyx5jY3tSDdPs3J3Sp6KHr?=
 =?us-ascii?Q?HJGawdj837/P0yXEZXEyNXyEO24mgx/xTp9ut1/ApPr/JjJhXLofOuVx5tpx?=
 =?us-ascii?Q?yNvRwGerzb9aasslzDNZoaTD1vQaJBWBVlcYO0KhTfJa2xFqP2AnRl4+rOfn?=
 =?us-ascii?Q?+oB7cX8PAWs9lTvjAluQl9c0x/QNktF2r6JsML3dOwtjTr1lt4W7cRZ3pDK1?=
 =?us-ascii?Q?rdnjnAM2GcUNilIE97drSfb4Cf9+IJkvkngs0t8u3Impufbs47NHAXNaAScC?=
 =?us-ascii?Q?clYjPUvesXjJQjxpH93UKijagkzbjbEcNarTq5HjR2w1YTKrbF4/NINE6JKP?=
 =?us-ascii?Q?7v+n6avJbGKZEVaDSGQQKulefyV8RyocZHzXxAJLkgWNJIGRfpN5+0mhlI6+?=
 =?us-ascii?Q?qOr90q/9v/4=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH3PR12MB8659.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024)(7416014)(921020);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?SnE8FNd8ypPVqchiM0u/6E3n25goLR0xsxC9QofHIx+H7A4QzGWpzZpgpkYd?=
 =?us-ascii?Q?ser2yCgEMXT1DbEirxQvNj7l4KqZDhmKnZH0FysSszQ8ug2XIWT1K14lKHt9?=
 =?us-ascii?Q?lwhrso2qS4A8gAHidgXT1CCo31EMgcij7KKxcQof+Gmrr63DxqwaJNcBuCb3?=
 =?us-ascii?Q?i6BJ1QiieneHaed+9fleuENJYM9NB3otLgadEGLkiOBh1HHTeJ1xpwHQHqu1?=
 =?us-ascii?Q?ePtnFhqkm33XOhIPyxFTeu0P/yJEeHUxJL6+hykM28/upHNGaH2NHVDIHWV2?=
 =?us-ascii?Q?XU8VpTEMLxiYR4cTWleGlnAPv4MmFbidFvYlEp37Kur6PE9YCcCIWiTEK7Jc?=
 =?us-ascii?Q?MUCjBBy0+MLD8BqF+hLjcOow1uBTaDScjUQ/j9jVeNVLND0WkZYszexR0v1w?=
 =?us-ascii?Q?spgsV8rOA2eVYh8pkzoM2lm5TJYJ12rWmGOfU81fMD62VAhCKuL89gZ09iD8?=
 =?us-ascii?Q?o200p6WZ7ZnQbJb9bWST0r5In9FrpxbP6s5sCc6vqbTKRYck//c6AJcuL2xm?=
 =?us-ascii?Q?wTpwha7MwPYQdn8AHT8bQ9RbhncZU8TaAPZOAkxwho5mrCYzmdZ00mYc8Q9+?=
 =?us-ascii?Q?Xl/1b1Z0fI76lR3ZYVS9w4c5J74dbJo0M0KxyDHS3SVnnXjvO2l16EBEDkED?=
 =?us-ascii?Q?gCPcLhqGFmfRKHDWJ6sDpnl89cU11T2FOzJPROfBNPq3mezccMHHLI+dS4PW?=
 =?us-ascii?Q?no5TnluIPSQCBitzELEtVheQxVJ4eRftVigh3+OWpFn8WlLvWGvsn2x6hk29?=
 =?us-ascii?Q?9NF4kWccPAC7G7kiNeNaN5C2ZwK5LLe2LDNYCc+ec+Ga4xe7XLsxn1IYP7Af?=
 =?us-ascii?Q?/ThdPwOwAkCLzQdpqFBnJvt7NoMcEPQ8d7bGgX3wWJYMb4lUxknTSD2P8Nyc?=
 =?us-ascii?Q?VNA/QXrY1/9MbNWl3eYkAPoLsmXnkbx3m02lnw5x/+GY68tWTvD20NeWz8zC?=
 =?us-ascii?Q?B/S8x+mWUnaYHPm+yDNZxMkLaijHPvyAAMwEnwAP+hdrNJ7p7eYaH0whKjt1?=
 =?us-ascii?Q?4jbx+OwS/pSSQFXBJZkQ/Qkp548TNmO+RyDuHCkeoYfT448e6iK98AG/EikF?=
 =?us-ascii?Q?tF8TYhqY3trUafq944txIbHq1NDim+EZGL+PPStpkvtF52wmPQY6vnUtSVFu?=
 =?us-ascii?Q?ZVkvpeJ67rbuxZkiUsN5vWKVzz0nz7VEz8bLR31HegW0++3hjgew9LQpNdF8?=
 =?us-ascii?Q?drPhBNglheF3s2Rn/EiISQ7+GMboS5681WRnCcbO7K/Xu/WLnFejved7OEIc?=
 =?us-ascii?Q?Yq/V/aNVVxS5Ye/4m0XuzH8xMMbP0zAYV4Loi5MjC1Z1Cfwc380NqvARzPZf?=
 =?us-ascii?Q?4ZUu6u7RMoNct+hOqSYJa+K7enZi70SCpiJASwYl5kusUDqXrsfELD1GH529?=
 =?us-ascii?Q?kWXXfOoahZeEgo4v8HvXexMpNEdC7BCLp6aG/Drbqb3L8flZro1juTwTc2Ty?=
 =?us-ascii?Q?HArmQkW2yudIGC6HbE+OqOAvxaEi10aPSqdECwhmj53nHaXGIMEzWN2rR/LI?=
 =?us-ascii?Q?EE6OIM6x6qdLRjnJ6yWuULJr7KayR1OvXvCFQ6kUzp0U9irxposCvxSYMg1q?=
 =?us-ascii?Q?ZQc0gytzcilNk2AqJqY=3D?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 47ea99bf-21e8-42a7-18c8-08dd4d1a21cf
X-MS-Exchange-CrossTenant-AuthSource: CH3PR12MB8659.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Feb 2025 17:07:59.0534
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: EzX4qU11HUiF413uTdXIWqpT5gwrhoQpLb3N7NXPEPL17GyoER8YNf7GITHcwfPH
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB9175
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250214_090811_985610_39D8B7C2 
X-CRM114-Status: GOOD (  12.52  )
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

Change the internal freelist to use struct iommu_pages_list.

riscv uses this page list to free page table levels that are replaced
with leaf ptes.

Reviewed-by: Tomasz Jeznach <tjeznach@rivosinc.com>
Signed-off-by: Jason Gunthorpe <jgg@nvidia.com>
---
 drivers/iommu/riscv/iommu.c | 9 +++++----
 1 file changed, 5 insertions(+), 4 deletions(-)

diff --git a/drivers/iommu/riscv/iommu.c b/drivers/iommu/riscv/iommu.c
index 4fe07343d84e61..2750f2e6e01a2b 100644
--- a/drivers/iommu/riscv/iommu.c
+++ b/drivers/iommu/riscv/iommu.c
@@ -1085,7 +1085,8 @@ static void riscv_iommu_iotlb_sync(struct iommu_domain *iommu_domain,
 #define _io_pte_entry(pn, prot)	((_PAGE_PFN_MASK & ((pn) << _PAGE_PFN_SHIFT)) | (prot))
 
 static void riscv_iommu_pte_free(struct riscv_iommu_domain *domain,
-				 unsigned long pte, struct list_head *freelist)
+				 unsigned long pte,
+				 struct iommu_pages_list *freelist)
 {
 	unsigned long *ptr;
 	int i;
@@ -1103,7 +1104,7 @@ static void riscv_iommu_pte_free(struct riscv_iommu_domain *domain,
 	}
 
 	if (freelist)
-		list_add_tail(&virt_to_page(ptr)->lru, freelist);
+		iommu_pages_list_add(freelist, ptr);
 	else
 		iommu_free_pages(ptr);
 }
@@ -1192,7 +1193,7 @@ static int riscv_iommu_map_pages(struct iommu_domain *iommu_domain,
 	unsigned long *ptr;
 	unsigned long pte, old, pte_prot;
 	int rc = 0;
-	LIST_HEAD(freelist);
+	struct iommu_pages_list freelist = IOMMU_PAGES_LIST_INIT(freelist);
 
 	if (!(prot & IOMMU_WRITE))
 		pte_prot = _PAGE_BASE | _PAGE_READ;
@@ -1223,7 +1224,7 @@ static int riscv_iommu_map_pages(struct iommu_domain *iommu_domain,
 
 	*mapped = size;
 
-	if (!list_empty(&freelist)) {
+	if (!iommu_pages_list_empty(&freelist)) {
 		/*
 		 * In 1.0 spec version, the smallest scope we can use to
 		 * invalidate all levels of page table (i.e. leaf and non-leaf)
-- 
2.43.0


