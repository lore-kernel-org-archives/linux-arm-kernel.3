Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EA8AEC369A4
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  8 Apr 2025 17:10:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-Type:
	Content-Transfer-Encoding:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=CtFfGEmratQDUmMvIACkbCBBSwxquvWKV/4GFmZ/KpY=; b=U6w70jIM3RVLnWEvrklokgWpFc
	VEvapOlkOOAPwWwT+kl4ukZR1SlJB3DSP9PFN4NGTvTV06MQJ/8+4G7ooxljjbut2qNa6WXmFZfi2
	mnNp3+c9TeV8eWyl6ty2a3kPDZdpURb1kIZVuKubWeUL7IL4kv00zQQLv89cWHgc0aaIscXfyd1Rs
	VlDNl5lKjLDb8WOi9B5wOzT/Pg/KnAhJxC+wce5lxnH+LakOF5k9lpmQDPjnphaj8AOrd3P/xN428
	VEI9Vp6gZs8nt6+KJMWRThZBXCo5pbheVSbvlFxLZTEPPmx7+o3/zx5l+IF9boTvgjOSGZqk7TPWz
	KNHABH9g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u2CTA-00000004ve0-3orx;
	Tue, 08 Apr 2025 17:10:40 +0000
Received: from mail-dm6nam10on20628.outbound.protection.outlook.com ([2a01:111:f403:2413::628] helo=NAM10-DM6-obe.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u2CDV-00000004sDL-3lif;
	Tue, 08 Apr 2025 16:54:31 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=N0L37fvseQydKBffuRq5Xt1Anb1gF03LqdGMYqEURPn6+FR5U6A1iZtcTBg3BXoL0m0AJb1VCkn2cTNmtG0A7GH0vItFB59fVU/MvXpbYxg6RCwVHbxKiJI2gFtVcPUxGeq6fLxX+g0TRPoRtwxVwsH3ZoT/B4Qc3ke5LFXDPIlcTJi25jlk9S/RSuBEciik0UFg96GtwjISQTMiD88ow3ZXSedgiNy0MdBdQOQP7Ty3ZAWSgBYHWTZ1ye2lySw+3N5YQGJEYclSpcUOyn6IvYhvdl80mgwak/NABZK+8TL2exHhL34GFuvbwHltiaceF+W9/YE5sSgKNgGpAZmGsg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=CtFfGEmratQDUmMvIACkbCBBSwxquvWKV/4GFmZ/KpY=;
 b=C3IRNDAu8TZ97mHhXLiUaERkvcYSo+XOC4zLYqMo02+aLBUS+CHy4DILwj4lsyIrcdMbauU2x8BwGRHCPCYQpnB29orZ/q1grbWnIpbjD3kcxXNkUdN5sxvvv0+glk2Bsss9cWOW+kmT+X1KxNfKMG1PaNj1o/DZqk04ZV253q0z0THj22o0Gx7qjP2A9/QLQlitbT0GDihIXfeWhQNz8ex+PV229s3R1GXRRuV7B9FODSkOl/YbEL6BRPOxL7Q6tA5YGMQEqfJd2RMAx451MGR+oIA8IfFsCRFkFoEwNP3Ae1sX+hsTaD8dmegHe6wLRSY731+Z9q2510hLcS0Srg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=CtFfGEmratQDUmMvIACkbCBBSwxquvWKV/4GFmZ/KpY=;
 b=TB5hS3gIh4E6T2TfRVTpl7G57kdCNt7ziWvanJLjU6xxzzZPiDdhkwQsqQB0L14XD8cR4cxg9yEcDiEea3C83FZ8eCUfmNi3XEtfHXkxZknLo0LitFCYPtYPYq3Q3087JOwCXjoXXk0vg4L8zy5SteAmWuHGptBFYeYh0/6liitptfvfYs9Sv4TTN+s+kAYfKDbmFnPQnql7xZ/BuncE7DbnZGhoFfH+rp+f2PEII2OjdJuUZeo3Auj8oYBdcSyk3hyg/dcueQSzeFq0dCt0tYNu9CoK3kFzUPGfBL/zotYlLeBeamSkTM0mnaBHehIQ/YUlen1AvOxnVgMi7FGeUg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CH3PR12MB8659.namprd12.prod.outlook.com (2603:10b6:610:17c::13)
 by BL1PR12MB5971.namprd12.prod.outlook.com (2603:10b6:208:39a::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8606.34; Tue, 8 Apr
 2025 16:54:19 +0000
Received: from CH3PR12MB8659.namprd12.prod.outlook.com
 ([fe80::6eb6:7d37:7b4b:1732]) by CH3PR12MB8659.namprd12.prod.outlook.com
 ([fe80::6eb6:7d37:7b4b:1732%4]) with mapi id 15.20.8606.028; Tue, 8 Apr 2025
 16:54:19 +0000
From: Jason Gunthorpe <jgg@nvidia.com>
To: Alexandre Ghiti <alex@ghiti.fr>,
	Alim Akhtar <alim.akhtar@samsung.com>,
	Alyssa Rosenzweig <alyssa@rosenzweig.io>,
	Albert Ou <aou@eecs.berkeley.edu>,
	asahi@lists.linux.dev,
	David Woodhouse <dwmw2@infradead.org>,
	Heiko Stuebner <heiko@sntech.de>,
	iommu@lists.linux.dev,
	Janne Grunau <j@jannau.net>,
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
	Neal Gompa <neal@gompa.dev>,
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
Cc: Alejandro Jimenez <alejandro.j.jimenez@oracle.com>,
	Bagas Sanjaya <bagasdotme@gmail.com>,
	Lu Baolu <baolu.lu@linux.intel.com>,
	Joerg Roedel <jroedel@suse.de>,
	Nicolin Chen <nicolinc@nvidia.com>,
	Pasha Tatashin <pasha.tatashin@soleen.com>,
	patches@lists.linux.dev,
	David Rientjes <rientjes@google.com>,
	Mostafa Saleh <smostafa@google.com>,
	Matthew Wilcox <willy@infradead.org>
Subject: [PATCH v4 12/23] iommu/pages: Remove iommu_put_pages_list_old and the _Generic
Date: Tue,  8 Apr 2025 13:54:00 -0300
Message-ID: <12-v4-c8663abbb606+3f7-iommu_pages_jgg@nvidia.com>
In-Reply-To: <0-v4-c8663abbb606+3f7-iommu_pages_jgg@nvidia.com>
References: 
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BN9PR03CA0055.namprd03.prod.outlook.com
 (2603:10b6:408:fb::30) To CH3PR12MB8659.namprd12.prod.outlook.com
 (2603:10b6:610:17c::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH3PR12MB8659:EE_|BL1PR12MB5971:EE_
X-MS-Office365-Filtering-Correlation-Id: 69d17eab-43be-46d1-bee7-08dd76bdfec2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|7416014|376014|366016|921020;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?8IO42LQqtQvV4FjvgAIybImg9zxaTkzgs/7GVViw9f7DAf7zpZjNz1DT/c6z?=
 =?us-ascii?Q?jh1hzHniR56uLVg6fTTu0oPT6RphxVsoQhTPhkwaBJLvJT2ayEtWZ0vucwMU?=
 =?us-ascii?Q?gTMhP/332kokKramQYdrE00cCybolggVeXNRFngCgw2Bi8Ex7+Y5l3Zqjave?=
 =?us-ascii?Q?fgF4x9olen9AHNP5TdfGrVJ4MynaJtpcmomLyxWjFrJdUDzoVYXKhdCG2Cqa?=
 =?us-ascii?Q?B6ZdnmiRInzjWrA8f0kd69hFpqDXQbK0r/TXpWGgtZEMhg9F46S2XqCmWV0z?=
 =?us-ascii?Q?0xYd0UTOWskBaDPJ2/YMuwP1q/WNRMQLuoH9GhJ5zK+xxKJyENM4mqCZhvrd?=
 =?us-ascii?Q?zYszakoGedb09SHZN0DsZROO/pxncoIlz/fHOIfKAEbqGaLqM80nsuYAq0I9?=
 =?us-ascii?Q?wxPQKroWh+m8fHwqZlV/9+QQ8/v6vhUDa/oC6qk4qnaZx6hBH4XFBVm03RXe?=
 =?us-ascii?Q?OBanONg40Rj4YPp+2LIB9++iqC2qFcoojkgpoCVF5lANiKldAvJaye6+vnIA?=
 =?us-ascii?Q?2zTafFJoeTy/8yoh6jnL57gVdgRWjjK6cDEXgLgRNfbMBXnBl9AJ6htR+lmY?=
 =?us-ascii?Q?o11k8dzYjyAzvAtKBIDb4ycYbW6eG+f+5wQtzxaCyo6LgGJbx4sKLnCKTUDE?=
 =?us-ascii?Q?Qplb7hRJUMqz57rlEUPtxz18rxZSKQfVlMxXcUc3cv3RRv/CW7Lflfo8pH5l?=
 =?us-ascii?Q?pxOMZPCFIAqxDkl28+q0y/XvFqAtmRg92DYldN+46xcMsIhf/iGoFtstR8XF?=
 =?us-ascii?Q?cOYqrNbkxkLdEPexfmYBf9BGwI8wIDkiLdAKKzmfR87e3/Of4ZFYyoodlqLC?=
 =?us-ascii?Q?joa1w/OI424jwyL+5sSDiJacD9a169jPtDoTPGhm2ic5Mr3kO9X42lPNSWRW?=
 =?us-ascii?Q?57bRv4IGg2LYaN42NZkw9i/bPye+pbiw6AfxtkfP71w3EezZk5zr+rKIeJbZ?=
 =?us-ascii?Q?hw9LwNq1X+GfqTeoDgwFjo1PsiX5Yvs7ZgeqKvD4vheGcM6p0URMwGWuZ3+3?=
 =?us-ascii?Q?JWc000jMNLJVbgG1IP0F2tf3dZkAHM4tMrNangC8wmucycJLQcNNwZ90hn46?=
 =?us-ascii?Q?MEltZSnLDkP3vSfn6ECJmEYnLsFoIzj6Hd+1HFDrAL/rcXHIwTm/Y3y+JXzz?=
 =?us-ascii?Q?R/FZeKqCOfKsrQL2iodPkUD6PjeIa4so0LfGjSaCi5ao3COjzkwWr1fa2G8j?=
 =?us-ascii?Q?5TPXCzxYvEoJeLsouBZq+6i4s46RdMptUSTOCmB60m2FW5AaMwY+6vr8Ycez?=
 =?us-ascii?Q?n7jTI4TU+DZEknAu2AB3zQOsq/Ve/oul0NVxjCz7kyv2fokufQxpZa0BDPya?=
 =?us-ascii?Q?1a1XV593TS4zlU9S/o87L3BqGow3AFQjq9o0khCEJaIdIheQ6u93Cfq9T7+v?=
 =?us-ascii?Q?Q/8hHv5iGXAkbT0qI2+BF+IfMHU9h2023F8bgrnFWxXpSJQhlsnuKXQVdWzN?=
 =?us-ascii?Q?HM9Pgd+Z1fPjmAOLOoN52JF9Suf1gv2KCrAIrpaKx1ZHv6yD9TWv6A=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH3PR12MB8659.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(7416014)(376014)(366016)(921020);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?1TAjXzc1d1cy10gpsPlaHxnxCzxrnyFKqg/uFG0tBrGY+tb0QFCNrSnDqkDM?=
 =?us-ascii?Q?c125m1xIBxPDa3ZBdxFpjMR8tZJHAf1E+6U4HCyHZslcuiMgLPuPbQOcLrjg?=
 =?us-ascii?Q?2wpHrJG1FsWkNLuC/YOpYic9jc0PEUQIR1M7ITrG7AlDsTRiGaNHTxZ5uhts?=
 =?us-ascii?Q?qemWVprBRIhEMlTut5+t+i60l9XvYQYCY77jgFLD40h33jr6lKP5qf0LoH8e?=
 =?us-ascii?Q?0zwFWo9HdyxEZym+OyJrPGXdtt5K7E/fdHhAe1qEmO46zjPkHLp5qPxgNHVB?=
 =?us-ascii?Q?zGorXhBa+Qi52ayqHe5YrZmRBkZpBx6LSs89nJHIel5rcRuNQLAaSkSTaEL0?=
 =?us-ascii?Q?R8UvNL56AKhqw6bDEn57B0pvvGD+TLxx+VqKzAWv3Q8/usKZ4ywinc+8UQFI?=
 =?us-ascii?Q?QV/fAlAtqnnAIOu1+DUA1nva0eQVDWPZs1OLSCxF0bkBdORS3bRouvFKow5z?=
 =?us-ascii?Q?liD/6T6s0J6n4RAWTCDXtTEg/DG8qNhApw6P88ar1MZrvmiULISc5CbltaK9?=
 =?us-ascii?Q?azqOv4O8jM+znIwT06bCtxj1GM0VSlEs5x+2MgCmUO4Bjxu9XTp77s7lIlxl?=
 =?us-ascii?Q?DJT6RddTIaq6jvByY/p10ktCit4W39Yp4Z6CfqnzBphU7EBNBiJIKiisjrG7?=
 =?us-ascii?Q?kGZIHSLZC49QNXD7VPNsHc+HYX5DVX74S39Ybb7b25hWReOuK1MULTMmRET6?=
 =?us-ascii?Q?PWIhP+iCzHkYVHHeYEH3e9+zC44LssFDyxXvVIv/pZaEMSUAi47fea7hsngg?=
 =?us-ascii?Q?euC/n2LAANVZqgTMKd8HjGk7pGPpDq3SMPEmXF3YujcnSIr3Dwq3zXmpQPbV?=
 =?us-ascii?Q?HuCBLTiPzjn38nf0A2hjyZqJNFWIato8RvsxKrHkdxd0PirP6HgJmw9+Z9j6?=
 =?us-ascii?Q?o9FGrZ25Rjta5iFmrPmTusgfGIAX8FHKK9BwvQwZcRax+7rMupShMVxHPNAq?=
 =?us-ascii?Q?vGXrfQ3v7wCESUFB8MkJa1p5KD7egjt0gnUAfJ8LBeB8AS5WYR7HUSp6P7ra?=
 =?us-ascii?Q?/kkUNoxwYiMlN+KVEN2OW4fqrbPhSNtPG49gOstoyZtoiTOPLi9cL5Bdf2l4?=
 =?us-ascii?Q?9j2u4Y7N5DP7Xvay3PKysqu3TH7AyQzxQUjIkgJ9oC0DrHzrAPC7uY6FGkzx?=
 =?us-ascii?Q?BfBP/8ZGAN6vgwvt4MGwekosNoDm5zQUvjrqdMVe9SzpbgLvgGsmLCBLFRUD?=
 =?us-ascii?Q?puP9U3T4G6+dMyIaHlejI4/kq2WcyND7z0YEVri3zGbqbSywzq7TLqU9sKTG?=
 =?us-ascii?Q?eRZ1yxNiufzyX7iVyCxQUXLseQxk7qxkhX5G22cZMgKgEE/L5tk3kToXQcpk?=
 =?us-ascii?Q?3wqx/0G7OVX67Lcjif5WEDiHEfOoSx/FRjykM4i4kaAU43k9T8vkZ7lngT04?=
 =?us-ascii?Q?kALkIktZYlo+yhTDLwl9PVGRRLZWSw2OF8MHOO6LEyRd2ZZsGeZO1liE7z9F?=
 =?us-ascii?Q?zUs0Hh410uNcmWBzebDPTEnUiBIqf0YjgMoCfxGdH0IRQXkf1/NnR6mrTjYg?=
 =?us-ascii?Q?jTjAFLdrLVfe1G8yLNOtLHrZ3QmiWtCmLzUX0qPa/0PnMEgOYxSmcKOYbuHq?=
 =?us-ascii?Q?MRYPUeNrVR+NeOXW/8dvcEMc4eW+nEh3sMFgsf9B?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 69d17eab-43be-46d1-bee7-08dd76bdfec2
X-MS-Exchange-CrossTenant-AuthSource: CH3PR12MB8659.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Apr 2025 16:54:15.4730
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: c6JMU0WJ53nA2xCebvBjtISF/fHhNTHHNZCtbzMinQoCPqGQvK6RY8r3k8j9trvH
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL1PR12MB5971
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250408_095429_974979_4E8FE643 
X-CRM114-Status: UNSURE (   9.30  )
X-CRM114-Notice: Please train this message.
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

Nothing uses the old list_head path now, remove it.

Reviewed-by: Lu Baolu <baolu.lu@linux.intel.com>
Tested-by: Nicolin Chen <nicolinc@nvidia.com>
Tested-by: Alejandro Jimenez <alejandro.j.jimenez@oracle.com>
Signed-off-by: Jason Gunthorpe <jgg@nvidia.com>
---
 drivers/iommu/iommu-pages.c | 15 +++------------
 drivers/iommu/iommu-pages.h |  8 +-------
 2 files changed, 4 insertions(+), 19 deletions(-)

diff --git a/drivers/iommu/iommu-pages.c b/drivers/iommu/iommu-pages.c
index af8694b46417fa..6eacb6a34586a6 100644
--- a/drivers/iommu/iommu-pages.c
+++ b/drivers/iommu/iommu-pages.c
@@ -67,25 +67,16 @@ void iommu_free_pages(void *virt)
 EXPORT_SYMBOL_GPL(iommu_free_pages);
 
 /**
- * iommu_put_pages_list_new - free a list of pages.
+ * iommu_put_pages_list - free a list of pages.
  * @list: The list of pages to be freed
  *
  * Frees a list of pages allocated by iommu_alloc_pages_node().
  */
-void iommu_put_pages_list_new(struct iommu_pages_list *list)
+void iommu_put_pages_list(struct iommu_pages_list *list)
 {
 	struct page *p, *tmp;
 
 	list_for_each_entry_safe(p, tmp, &list->pages, lru)
 		__iommu_free_page(p);
 }
-EXPORT_SYMBOL_GPL(iommu_put_pages_list_new);
-
-void iommu_put_pages_list_old(struct list_head *head)
-{
-	struct page *p, *tmp;
-
-	list_for_each_entry_safe(p, tmp, head, lru)
-		__iommu_free_page(p);
-}
-EXPORT_SYMBOL_GPL(iommu_put_pages_list_old);
+EXPORT_SYMBOL_GPL(iommu_put_pages_list);
diff --git a/drivers/iommu/iommu-pages.h b/drivers/iommu/iommu-pages.h
index 0acc26af7202df..8dc0202bf108e4 100644
--- a/drivers/iommu/iommu-pages.h
+++ b/drivers/iommu/iommu-pages.h
@@ -11,13 +11,7 @@
 
 void *iommu_alloc_pages_node(int nid, gfp_t gfp, unsigned int order);
 void iommu_free_pages(void *virt);
-void iommu_put_pages_list_new(struct iommu_pages_list *list);
-void iommu_put_pages_list_old(struct list_head *head);
-
-#define iommu_put_pages_list(head)                                   \
-	_Generic(head,                                               \
-		struct iommu_pages_list *: iommu_put_pages_list_new, \
-		struct list_head *: iommu_put_pages_list_old)(head)
+void iommu_put_pages_list(struct iommu_pages_list *list);
 
 /**
  * iommu_pages_list_add - add the page to a iommu_pages_list
-- 
2.43.0


