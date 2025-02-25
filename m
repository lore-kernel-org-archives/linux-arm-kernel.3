Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B0184C021B8
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 25 Feb 2025 19:53:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-Type:
	Content-Transfer-Encoding:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=svzcsAcPURNMvNzUrcJqS1csKa8sqow9qtq28cPI8dA=; b=zw162ukicLs6I4HzpK9BHs8fQ6
	AqF8IFXUbGQRiGbSV3zkXSjnuJoVoqYR3hXnTW0IAyH3opGD6c0DF5577ErZQ5xhzxnuU1UR7uyEb
	4fytPAKy+XeQFrbeYYixnx/u3b1H2SUCnm8E3FOwKGcC+AY3wuENOa4t25Sz3u1QJE9D9Rif+UigQ
	HASoEq9ByZufvNBlINtoUeHmOsj8kL7ZjLzjXLnuduq4XR7UhkhJVgrqgLB9IlwgZe3TVmFN7x5TN
	9kYAWvl5R2n/b8FvLPFv3JuQSwdVRC+Hfy8pIvc0E93KA3SEsgeEmCMLDmV7eM1jMvE2NgR2QedIs
	EJpbTrFA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tn0zu-00000001FnW-2fcs;
	Tue, 25 Feb 2025 19:53:42 +0000
Received: from mail-bn8nam12on20619.outbound.protection.outlook.com ([2a01:111:f403:2418::619] helo=NAM12-BN8-obe.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tn0me-00000001By1-0q6s;
	Tue, 25 Feb 2025 19:40:02 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=gz7VCdjEfnTncVTtzd/eDKw8cWHkNmVykqflAw7+U+D81P67bH16bqWHQNhzlaRx4YyhHIFxEKm/nixQFKY3Jun/J/RcGinq7gbmx/sXXW4DmhIuSgoD1oS7OZV3A+8gZKLunV+yjE0rYuMVhjTQV7qFwH1gDcbmcu9ZFpVmRw1A24O7mDE4pzz5pie+gLiDflX/GyY/MRUEz3Pbu/49WSojsStO6gJAi31Pr02a/bAGegLyCDvglVvUnttizzUISJQ+PGc9VrRkphy0zzsUtxGQddYQfGwl8jZY6Cn8QqWAZpGjitJgQi8WLJhFc2MtWAIdSWbUrm/KXH2tf0pK6A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=svzcsAcPURNMvNzUrcJqS1csKa8sqow9qtq28cPI8dA=;
 b=iemq0XlBf3bmWfxb9l0NZBemiIFWt8U76FAjSDz/7qnKxa5fwdsJ5lFthz+VE/BuupBfbv1kq0CsGPkKZ9ZjpghoaXmP7SUX/wJTqK82Ng0Cu306OmniFfAvMZTdMV72EschL/0xGYCC++YvKDBtfyX7Da3Jz4WZzlYfpbShC7qeyFuTAKBKHaGJLyEUpLxrSJcoG8/3DfL4721G48Bs3twBb/ppUdUJGjfiqhjwN1KVtkNj7px2ejqoID05K8XhPdjGp4Zi53EjpE+2WZDKVZxVryYxhNiSQbC6Z8zomDZmQfC+O2JbTIJ9JjwqyaThUll5KhIxbdrnYuUjMduNLQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=svzcsAcPURNMvNzUrcJqS1csKa8sqow9qtq28cPI8dA=;
 b=N0Hy9fQx/R2wB3ssau92PKBAzXs+hM++k1rvhQ4mv/jwvuqD1wee6V0ZezRZGmInHLz37/M/hIwidhuCJAQD72g1Qvnlb6Bw5cUrR/JqLjf6wReYYwFBrDXQZXpLhYeZloZN16NY3u6MFTBxKbUl1sm7U2zNtfOkZer6oJ5i98U0jByj0U7oEjgIRzRFI9AEKftfQKTQps07emaAii00RBHngpuwl468VJtl6idVQJiB4jq0U4oHCvbDwhHEzoco0g9Hk5XkHgtJDn3rFdYy99huEYRrCPLUbApzbUXlREwC00SvHRCafA2hqNcp09sTcfDY1bee147isrAC846Mwg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CH3PR12MB8659.namprd12.prod.outlook.com (2603:10b6:610:17c::13)
 by SA1PR12MB5616.namprd12.prod.outlook.com (2603:10b6:806:22a::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8466.18; Tue, 25 Feb
 2025 19:39:46 +0000
Received: from CH3PR12MB8659.namprd12.prod.outlook.com
 ([fe80::6eb6:7d37:7b4b:1732]) by CH3PR12MB8659.namprd12.prod.outlook.com
 ([fe80::6eb6:7d37:7b4b:1732%4]) with mapi id 15.20.8466.016; Tue, 25 Feb 2025
 19:39:46 +0000
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
Subject: [PATCH v3 17/23] iommu/amd: Change rlookup, irq_lookup, and alias to use kvalloc()
Date: Tue, 25 Feb 2025 15:39:34 -0400
Message-ID: <17-v3-e797f4dc6918+93057-iommu_pages_jgg@nvidia.com>
In-Reply-To: <0-v3-e797f4dc6918+93057-iommu_pages_jgg@nvidia.com>
References: 
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: YQZPR01CA0089.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:c01:84::9) To CH3PR12MB8659.namprd12.prod.outlook.com
 (2603:10b6:610:17c::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH3PR12MB8659:EE_|SA1PR12MB5616:EE_
X-MS-Office365-Filtering-Correlation-Id: babb6eea-bd27-4318-3384-08dd55d42709
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|7416014|376014|366016|1800799024|921020;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?CiniEHkX5fDRr+Opd4DB35E2ZOCJMNQhFxqsjupcDRDyG+G+9XchgXBM8w1+?=
 =?us-ascii?Q?8iv3FAjJvtO8l2DNjzpIwBp/rwHJ44wm3SolNRwcHra4KMC5ngUy4B1JaH7j?=
 =?us-ascii?Q?/O1eq1IYu30DvTu6ljmFx8xWJ4zkEWMK/YJw44qj5C03/ESuZ5c972ZWnM3w?=
 =?us-ascii?Q?w+LwsTMunsx1/TRAVq3jyBs/4wXCHfpxvQlX4e10oBTFjKxjJfKbxEtPu9IY?=
 =?us-ascii?Q?hZFeVB2IC4JDdKN2H6S8iNM+E92FH+1h5jwl8UItENeHrUOrZ+fAQZYK1NPW?=
 =?us-ascii?Q?7KeqlBNV7oWVi9wMc3hdzWLR2KJVvYY4Xu9eI2YyfO4dhrQcj7psBklyUlm4?=
 =?us-ascii?Q?1djbZ/xnLt2KAr+ciTw5lKLvQK/bRjMku0NB/qcW3eaO4ZvfpHqXHDZrTBQV?=
 =?us-ascii?Q?T3PayOTEXUG3VlOki8REhe12EtqRRKHAf9ECxjMreMwvf88TdMux3UCtwu2Z?=
 =?us-ascii?Q?3d1FHOGytboGga5eDlOkSu3767jrSz7evJkbPnj7HFkwDeZKS2+6/HLMHQwG?=
 =?us-ascii?Q?t+YGNBKnkj+kO3Xk1GLTik/fPiJLRNGLpIArc1A+lVHT2kpbYKvjrf+rk+E6?=
 =?us-ascii?Q?bRlkjntb4XCWoBDfsVUtRXS5KB89yaUgAZPNHAFuJwDWb7DZ8edWJuSRO4IP?=
 =?us-ascii?Q?IqjGIwTp8fEqmugevFv43izguQS+yG6/GN5zZMGP+K4GNqJRvNaRS4G0jJ05?=
 =?us-ascii?Q?qXwsizoyABCw3E81whzuVXNqhRh4t+gN6R73dg6T49u3lbSzWZAhzvb59HBW?=
 =?us-ascii?Q?/nQ/gCp3gPTBlSSkYAKQJOZjHyTyyPvZcvjilRiZtkZmNrQYhW0RRFZ9TCvT?=
 =?us-ascii?Q?yJwZDIcHm09QOQqZaXB/0lBeASEewncgmwIRj0jHamkm6Bei/QvCBc5OIz8N?=
 =?us-ascii?Q?WOujOgBrhJb/+aP4gM5jts4h8Ga44pDFiMaJ20BW5aHPclI++EvUwKAkJkaw?=
 =?us-ascii?Q?UHxo8LQ9zyE6A9D/pf+Iga+7Fh4cEFnmlVm/j86H1HCOG+/K/rwTr7oYH0U+?=
 =?us-ascii?Q?YdGelMIrJLJlRlllQ6nb+FkaI0baFZSAwaHMpMllxLweQOQOHj9a3DR9FY7H?=
 =?us-ascii?Q?pgw6V6hO8Sb/wyCWYBv4XdVbX/vNaA5/yhaFtFPQ/vZo1h2AA43plAjCzXBG?=
 =?us-ascii?Q?a7Cd8e8YPfme1CBm0I9ZfqWGAu76VwQkgr3lXDvfDdpIBlJQaahA4R2yyMy1?=
 =?us-ascii?Q?CqdHWFctRLgtBebDMTzD9XfWiRcImX42x1MS6ziZs6kxXGxwBcA4s5AMy9DR?=
 =?us-ascii?Q?ajEd8lbi8pWJ4IsJGZvrrrMoZTBbrhlm7IyB2ggiwT7GhinSN4+Jc1tErxSf?=
 =?us-ascii?Q?2ltrqR6uo3kkXt7xIxsfrl1NcIWWt3lDk8p+GsIW8WugQXb9nydvMEvmXWMx?=
 =?us-ascii?Q?QlBtCAj/4wJ32DkUqYV3/4SltbSs8sAdHdhCUmyaaHxBJ5uPX5Dt0hylkCIc?=
 =?us-ascii?Q?JaSwYD3InOw=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH3PR12MB8659.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(366016)(1800799024)(921020);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?ZyonG3K6QBYWqCJ3Cy5Lxs113WlMql2UhoPlrB1xFdBKk2ZPQyXGeK5K3s2/?=
 =?us-ascii?Q?6K+h+YEJDprGsiDh/+P68Gt76pvhkG6HWCM7zgTg+69OEPYsLauL6w/jmE+c?=
 =?us-ascii?Q?RGVhGrWELgqhxrh3SjP9VfrOCuPVzsHU5YgPgtYlUDrGBTvJiSagCr9iBSqu?=
 =?us-ascii?Q?b9/QHTmHjHITNdv/SYYkzOQjHBbvreJNfp0bjoBkJE7qixcCnvugkqUp8Eb5?=
 =?us-ascii?Q?2EB/cfIT+Jo8fd74wfoc/BnlpMoXrlM0y0muBnyjqTpMgQvhOk6fDD0Hix9e?=
 =?us-ascii?Q?8gdgOHih792C876GEjSFwc9ZZQCt4qsr4j04ZAOHHRvtcGqapXxS/2BJ9A0Z?=
 =?us-ascii?Q?iBxr8mUkuhUY6rJlIlWDFl+IMLLtlxbQ+SqlZyL2I723HcH1qOWDPqGhTRbi?=
 =?us-ascii?Q?WAr/lOAZZDcrB4J1rGAYNZpAiewaHkt1sKhB8bLSBbzJiSLtSz5IYBfzBbGa?=
 =?us-ascii?Q?oGiqQ/t8wTmg44gCfK9h2tQELurfn5ZYtlr142LHZDa+cu4LE2Zexeaf2YB4?=
 =?us-ascii?Q?paJ/yxaZfmvG8DrqqmlF5IfKnCBEpvzsS5btiLOJkhUPlxF0MQH80mt0r6p3?=
 =?us-ascii?Q?2N3BolydQQ96QYh6K8SaTv/M790cyztyqhAIS6gu1Q6YmzA5mbGCWeEyR8M4?=
 =?us-ascii?Q?ohpqSCnDGqQHvaxA9CU/RVxy3s6HUHsLW6byEYp3p4zRLAjzGGhAhQwdTw3a?=
 =?us-ascii?Q?zpi4b6PwST6sFljdZXnHMfIcJC23LbpcfSoWH0LDL1VrIVw0E94T+lUTnOkp?=
 =?us-ascii?Q?0Ty6y0s23ssyQv4vakzJaJHVrmISREqfTuej1ZMZ2LBHtG94aVdNMZJjsjxO?=
 =?us-ascii?Q?T8ONR4awuMIRCWN0nxum6PPFw6RbOWtjSaHzC0ihtYW9yBgDx7nc/0IKTgnU?=
 =?us-ascii?Q?1Q/5JOKahYy1INYdgAcUSxgl1Obr/5IXUaqC7alBOaFn8GW0VCW2DXmZYQzN?=
 =?us-ascii?Q?17ilob2z8zVohMHuKQ31c0RipzUQ6fkwXHdAzkpgdTlRkuXI/cToilW7Ezn+?=
 =?us-ascii?Q?Oqdc1Lj4uCFwt0WAseFwyOmZWHIrG1acoX3SOfDQ60amVjbrHsOi+jp9U5Li?=
 =?us-ascii?Q?hc/1SVt6S52TeMbU/A7gVn0EEgUkKPwfq/Z5JKd04FyMtMDRBf2N9ReTYu9H?=
 =?us-ascii?Q?iGw+Alv1K2Ul6ilkBpa5Y3MVzamcxl2d62MurrYZA6L0SYRiiSjZ4Ior6yvP?=
 =?us-ascii?Q?RVTitAoJnjbn9W0Xs9NvASRjzX3Msl5wkjsQ/KdEvw35v3s3o0/pdnx/Ri0A?=
 =?us-ascii?Q?YyAWVndp9FuzGvrT9Y/b7GIgDkLhKZGgZ4lu7BvliWrfr92BYg8qlDy/z4Ui?=
 =?us-ascii?Q?vB/uQfdIz11LfKV936SYfEgl7UjiJ+8YL7aZNcwxyKjSUr16aUJHYietpoBg?=
 =?us-ascii?Q?658AtYX7Rr5nGq5YnaOGb3mU2G+dvJ3fEQCBD3/Epw8r6sp0HrqSfBRCm5hr?=
 =?us-ascii?Q?jVaiHppFtUmcN+h9el+nvce5dLpBSFD3qzgINRez94PqucgOPCu6EYfw5Lsc?=
 =?us-ascii?Q?d0hZiVU2D+n88i5Ss1Da+6hr0PokO7EEmNOOcPbmueZyNru7tcQ/v4ZqOsku?=
 =?us-ascii?Q?pLGsII+ihxMj59SGG9bBMaK2GJ8VYPZJ5D1bs7BD?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: babb6eea-bd27-4318-3384-08dd55d42709
X-MS-Exchange-CrossTenant-AuthSource: CH3PR12MB8659.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Feb 2025 19:39:43.5727
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 1v71la2DoIHl930ksEDNugIt6sb+Ho4UYdgPEY35bBugDmuKVj1NvfoTVrvgXfq8
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR12MB5616
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250225_114000_279143_D0232A8F 
X-CRM114-Status: GOOD (  14.37  )
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

This is just CPU memory used by the driver to track things, it doesn't
need to use iommu-pages. All of them are indexed by devid and devid is
bounded by pci_seg->last_bdf or we are already out of bounds on the page
allocation.

Switch them to use some version of kvmalloc_array() and drop the now
unused constants and remove the tbl_size() round up to PAGE_SIZE multiples
logic.

Signed-off-by: Jason Gunthorpe <jgg@nvidia.com>
---
 drivers/iommu/amd/amd_iommu_types.h |  8 --------
 drivers/iommu/amd/init.c            | 26 ++++++++++++--------------
 2 files changed, 12 insertions(+), 22 deletions(-)

diff --git a/drivers/iommu/amd/amd_iommu_types.h b/drivers/iommu/amd/amd_iommu_types.h
index 0bbda60d3cdc7d..9704edf5cc26e0 100644
--- a/drivers/iommu/amd/amd_iommu_types.h
+++ b/drivers/iommu/amd/amd_iommu_types.h
@@ -29,8 +29,6 @@
  * some size calculation constants
  */
 #define DEV_TABLE_ENTRY_SIZE		32
-#define ALIAS_TABLE_ENTRY_SIZE		2
-#define RLOOKUP_TABLE_ENTRY_SIZE	(sizeof(void *))
 
 /* Capability offsets used by the driver */
 #define MMIO_CAP_HDR_OFFSET	0x00
@@ -613,12 +611,6 @@ struct amd_iommu_pci_seg {
 	/* Size of the device table */
 	u32 dev_table_size;
 
-	/* Size of the alias table */
-	u32 alias_table_size;
-
-	/* Size of the rlookup table */
-	u32 rlookup_table_size;
-
 	/*
 	 * device table virtual address
 	 *
diff --git a/drivers/iommu/amd/init.c b/drivers/iommu/amd/init.c
index 73ebcb958ad864..fb3c3d17efc167 100644
--- a/drivers/iommu/amd/init.c
+++ b/drivers/iommu/amd/init.c
@@ -660,8 +660,9 @@ static inline void free_dev_table(struct amd_iommu_pci_seg *pci_seg)
 /* Allocate per PCI segment IOMMU rlookup table. */
 static inline int __init alloc_rlookup_table(struct amd_iommu_pci_seg *pci_seg)
 {
-	pci_seg->rlookup_table = iommu_alloc_pages(GFP_KERNEL,
-						   get_order(pci_seg->rlookup_table_size));
+	pci_seg->rlookup_table = kvcalloc(pci_seg->last_bdf + 1,
+					  sizeof(*pci_seg->rlookup_table),
+					  GFP_KERNEL);
 	if (pci_seg->rlookup_table == NULL)
 		return -ENOMEM;
 
@@ -670,16 +671,15 @@ static inline int __init alloc_rlookup_table(struct amd_iommu_pci_seg *pci_seg)
 
 static inline void free_rlookup_table(struct amd_iommu_pci_seg *pci_seg)
 {
-	iommu_free_pages(pci_seg->rlookup_table);
+	kvfree(pci_seg->rlookup_table);
 	pci_seg->rlookup_table = NULL;
 }
 
 static inline int __init alloc_irq_lookup_table(struct amd_iommu_pci_seg *pci_seg)
 {
-	pci_seg->irq_lookup_table = iommu_alloc_pages(GFP_KERNEL,
-						      get_order(pci_seg->rlookup_table_size));
-	kmemleak_alloc(pci_seg->irq_lookup_table,
-		       pci_seg->rlookup_table_size, 1, GFP_KERNEL);
+	pci_seg->irq_lookup_table = kvcalloc(pci_seg->last_bdf + 1,
+					     sizeof(*pci_seg->irq_lookup_table),
+					     GFP_KERNEL);
 	if (pci_seg->irq_lookup_table == NULL)
 		return -ENOMEM;
 
@@ -688,8 +688,7 @@ static inline int __init alloc_irq_lookup_table(struct amd_iommu_pci_seg *pci_se
 
 static inline void free_irq_lookup_table(struct amd_iommu_pci_seg *pci_seg)
 {
-	kmemleak_free(pci_seg->irq_lookup_table);
-	iommu_free_pages(pci_seg->irq_lookup_table);
+	kvfree(pci_seg->irq_lookup_table);
 	pci_seg->irq_lookup_table = NULL;
 }
 
@@ -697,8 +696,9 @@ static int __init alloc_alias_table(struct amd_iommu_pci_seg *pci_seg)
 {
 	int i;
 
-	pci_seg->alias_table = iommu_alloc_pages(GFP_KERNEL,
-						 get_order(pci_seg->alias_table_size));
+	pci_seg->alias_table = kvmalloc_array(pci_seg->last_bdf + 1,
+					      sizeof(*pci_seg->alias_table),
+					      GFP_KERNEL);
 	if (!pci_seg->alias_table)
 		return -ENOMEM;
 
@@ -713,7 +713,7 @@ static int __init alloc_alias_table(struct amd_iommu_pci_seg *pci_seg)
 
 static void __init free_alias_table(struct amd_iommu_pci_seg *pci_seg)
 {
-	iommu_free_pages(pci_seg->alias_table);
+	kvfree(pci_seg->alias_table);
 	pci_seg->alias_table = NULL;
 }
 
@@ -1604,8 +1604,6 @@ static struct amd_iommu_pci_seg *__init alloc_pci_segment(u16 id,
 	pci_seg->last_bdf = last_bdf;
 	DUMP_printk("PCI segment : 0x%0x, last bdf : 0x%04x\n", id, last_bdf);
 	pci_seg->dev_table_size     = tbl_size(DEV_TABLE_ENTRY_SIZE, last_bdf);
-	pci_seg->alias_table_size   = tbl_size(ALIAS_TABLE_ENTRY_SIZE, last_bdf);
-	pci_seg->rlookup_table_size = tbl_size(RLOOKUP_TABLE_ENTRY_SIZE, last_bdf);
 
 	pci_seg->id = id;
 	init_llist_head(&pci_seg->dev_data_list);
-- 
2.43.0


