Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 24313C02197
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  4 Feb 2025 18:38:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-Type:
	Content-Transfer-Encoding:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=KYH33h7k/qpe+6EAOIHWfkZhWMg4vY1I6a3/YmcazLo=; b=Pc27Lm0BhffagZK6Xx891wEKFH
	MB1Fj/LjomECuEU3QOvz9J3Qf7XslWdLg768KdrGdTXxfSfJJoVQv8o3ZvmtrOwsmpfroqnKrtR7f
	KF4wjGNVgWGfF29fJxaaOeeJKSXsC2LYRY5c0OAALuCushgUFGljj5tE68gew1q1jzNmGWg/psdvW
	qKR2CiOGCDnmfWMl6ByHkT2Hl157F2w2Jw/mDfh87l8xDfe0Ilx1ZgoTrEs2Ta8NfPBkgQu4NbY5w
	16zP1Z8+iS7If6lh3vFJN+IJs7mtkreZyPvPUMVNDhE25vIKnmvO1Z7uUFZXAAZAyOrFQbP17xVxc
	fCw2hSNw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tfNo4-00000001F0I-2HIc;
	Tue, 04 Feb 2025 18:37:56 +0000
Received: from mail-bn1nam02on2060c.outbound.protection.outlook.com ([2a01:111:f403:2407::60c] helo=NAM02-BN1-obe.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tfNlP-00000001EIa-2NxW;
	Tue, 04 Feb 2025 18:35:12 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=A5scEFgb/NRkYdcN0m61Sb0RSvuRGUxLgw8Oq2zKeNbnnIrCcb/a/0Wm496P/FTGM4Ykm19iEh/ETGuilWnELtrBq2bYMlNtINEOI2JOBcXqzp9Hlkyn4fX6+IbtAcvrecfIiGDFTAILTNRjhwkTC7VTKzGCBGVQ073h+7ljygiJz8iMNoRkb2UqTHbXkonk2CD+m/l4t6KwHVC4i508GP8BXNJKI0zzjQ4Tt92SVE11Dup2Q8ElFf725mx8aILqdzVPwRCdAl8YTqTjGqMR/43KjXou0JIl4VKcKRtsrn/tEJXFW3tFaj6aea11kwFk8L8ClUeWoA26kHWAhEEq7g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=KYH33h7k/qpe+6EAOIHWfkZhWMg4vY1I6a3/YmcazLo=;
 b=QDa2GK0Zir977m0FkEyOQNUUQgLMc4nLwwuj9EpDfJfGQ4EWrim4BXxqyfh2ash5g3uDDcU1SUOZ7V/nPoWyaKf8N/fe+wu54zIECfL53fWiyAx9hhF3u3uM15Hd/fwpQWa8zXVDHnQwyf/4Di9BM5ehvXWZmjRshxni9mIdmOO8S2pPTqyVSCyD+qhVJ3kpCeYq0HWZMnSO/P3XjkGq+igPpcqalNT0GmuKl1uloglBkhd2BAWXVggsQ4trsINdZpEMZDY4t7EuZnPqiKDytzj0s8qcRwuXYQqbJMVf+CqX84dykMATS/CtXt+OsTMNvfVebKKRieRbBkPMWxPaxg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KYH33h7k/qpe+6EAOIHWfkZhWMg4vY1I6a3/YmcazLo=;
 b=tzMA5G4jUgqil8cDVWhvRfD79XMcWOh9Y5zb565lIWjGcLmnOW5Iz1d92/ICMX1CuIxAEKtbrQ1zs34NxU0Vbv659sHWX+TGg7GIuViECHeNlKeYXMWidcFnSA9OlV4Agnqiyems9oUIb7rymR0KhOxvN76Kw1glpIlE23Uk4VF2qWYTTw1em2FiLWxR0Rcdx4JwpHMjyT0G8nYknbr8I4fUKXeQuo3qka3UZQLJu0LUzRxy+8+dYNGDfmbvNFt7lAiCPOmpXshSKUedWA+qSagvMm0/3/nM/JQSxdr7u9VhRScxm3eQw1VWKtqNXxJvWmuiF5+y4K8WNvGg8wwKRw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CH3PR12MB8659.namprd12.prod.outlook.com (2603:10b6:610:17c::13)
 by CY5PR12MB6573.namprd12.prod.outlook.com (2603:10b6:930:43::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8398.24; Tue, 4 Feb
 2025 18:35:03 +0000
Received: from CH3PR12MB8659.namprd12.prod.outlook.com
 ([fe80::6eb6:7d37:7b4b:1732]) by CH3PR12MB8659.namprd12.prod.outlook.com
 ([fe80::6eb6:7d37:7b4b:1732%6]) with mapi id 15.20.8398.025; Tue, 4 Feb 2025
 18:35:03 +0000
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
Subject: [PATCH 04/19] iommu/pages: Make iommu_put_pages_list() work with high order allocations
Date: Tue,  4 Feb 2025 14:34:45 -0400
Message-ID: <4-v1-416f64558c7c+2a5-iommu_pages_jgg@nvidia.com>
In-Reply-To: <0-v1-416f64558c7c+2a5-iommu_pages_jgg@nvidia.com>
References: 
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BL0PR1501CA0008.namprd15.prod.outlook.com
 (2603:10b6:207:17::21) To CH3PR12MB8659.namprd12.prod.outlook.com
 (2603:10b6:610:17c::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH3PR12MB8659:EE_|CY5PR12MB6573:EE_
X-MS-Office365-Filtering-Correlation-Id: 24cf2d68-f551-45f9-14cd-08dd454aa2f3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|7416014|376014|1800799024|366016|921020;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?rNkOlK77ffDk7+1dYlaOLyeuPWQh1rpSDVgF04S9ur2a7x2M/12wezLlxu9d?=
 =?us-ascii?Q?yW3L/hPgeDM3BE9bGh5aVZaY4LpWq+fIzzahw2tlAt62aJMyyBw/cLNMCHnN?=
 =?us-ascii?Q?/hF9ySXP1xXDzytjvoveBhxOaFO+aqYo1xnDns7mU0meEMaCOQArokWBBJmC?=
 =?us-ascii?Q?s5ghvGtZTcXEvlJYftMln8ACDmdy+PsSWx8OQK7gD8Pqh3x8Gow/N1XeJc8q?=
 =?us-ascii?Q?bFDB9u8zqvimW8dSgXXeHdCCYxxTCkageXg4vJ1Cwy7sYfNALd5cByiCJIk5?=
 =?us-ascii?Q?toclaw+LdtH4Y8ykO5i7eEUmAyYtIJ4jSN13ndY1UM6d6Pl3bs7mjeYi33FQ?=
 =?us-ascii?Q?A3SDgfv82I/wfth0VLanNMo7/Djl/8c+wn2s11O8Mse53G+VjKORtUTleFZv?=
 =?us-ascii?Q?LsnuNjZCalbPqGKU9t/hdqMZvGc49Nu+a7WHnQyy+wvOY639mckQQeUMT8Vp?=
 =?us-ascii?Q?iNnjz+W8PVl+OVUc5oCj66un3tx3sqTCPVfeWoEOxwXalvdsyBS3lp/SUAVL?=
 =?us-ascii?Q?7hxnDwYwWT5CHlNCpY9kAasgUs/Pufs/wra1xSWha7LGgT+4n3Sj8zK6w3Ie?=
 =?us-ascii?Q?5fjkLGEj6n0nGueZcBMpFP3sE3aHSGPqdwHSbIybhag9UCHQ9/LtHRIe/sRu?=
 =?us-ascii?Q?mi/bFz4twBPD/nq6UsvxmFQICuyyheTeTlLTGHGDBbXMKi8ESuwnwJHZv3GX?=
 =?us-ascii?Q?j0suTBKZwyBtqNet9Ctbw6B2jqfwN6w4HII6meBS4ZtJ1Wbjy95I81yYu9qC?=
 =?us-ascii?Q?cdPxuCWHrhpZc2QsOZ9+zkMu2lwpaCJ6BldHIakYGqu0uzSyLNbMlhB+HCCA?=
 =?us-ascii?Q?F/lEgqDXE0ypgA/4VujChWdW+Zxt2NiLVx9xQlcMozYQatSJxcmAINFtL7ZD?=
 =?us-ascii?Q?DvGq91+NEC0Bb10zw32wNT+1WI8S7QHdSM5c9SCwkChLnC2v6fn9YBKUPh+4?=
 =?us-ascii?Q?i9EIt/S/FGy1XFgmLSD86RZIKxGKPbR42OfmC7zFKs+G44DzHl6K2eWtuRR9?=
 =?us-ascii?Q?WVny71Pk+QY67S+Rbd+8XcPIm7LVXNuaiuwwf/8RYuZs/HGH3Pmuczr6UaXM?=
 =?us-ascii?Q?FrWpgfdTNs966vI9DPlw3pmDeU5i2edfWKcFLOIgdsohBp2kVoLwl4gowHfL?=
 =?us-ascii?Q?iPIs6yHMXwXVI40D4c9zC5oPG6M44mZ1owUyksBow/XviOnrtYOrRbaPYePV?=
 =?us-ascii?Q?wIcKuRRBUAKMn56cD/LTEWEE7j0CznJojV0Y2GHCpIrPmXm8YaEZaeHBV6Fc?=
 =?us-ascii?Q?pm2wo5hDvEZ1ud3WSwfu0PNk30rdAUEQQHBOrsjSW0ntVhFhgN0zRz+xXZND?=
 =?us-ascii?Q?a3u1S2/Kr+rNkrpR0W/IsNmQJAakDS/x1MXKEocmuSHnlaeKqDa4pZPYaYec?=
 =?us-ascii?Q?bTehN8Kju14Nk6SSRh8B0fuu5DybsWMBw3B0DD48+cB3JGTnGnV4XuxKaXop?=
 =?us-ascii?Q?+m0DqGNXriA=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH3PR12MB8659.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(1800799024)(366016)(921020);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?LlvwRJE9tWzvojJonDwGnG+TCUVHWeuLN62BRrNcAUAqiSE+tcnNTdFqruXX?=
 =?us-ascii?Q?nCiuybTh2BA3U7EK3c/r9LtLNeySw2uQrUdM0hGil1b1WYY6+auSHCHydyFV?=
 =?us-ascii?Q?Lxa3QPAujILMbD1TL35jvSpNyXSOIWGvjxpVOtDhr6atbb8eoB9RYWrU8Plk?=
 =?us-ascii?Q?0Kyu2x6aAFj0zVIAOiffaNMonQwNRpMhCxyiGrfI+nV7m8uaaBziOKitl9/g?=
 =?us-ascii?Q?QgvCZZsjf+51XBA6z4LfEUX6NHo6HmnmRhkWqkbwmujxNXeYxZq4M8aDfSsQ?=
 =?us-ascii?Q?P6X8KJN+YMfuAXrriXsyMsXwhobKOtE4aZjxcoJWXygeApVM46kWS/1W5euT?=
 =?us-ascii?Q?e5gtR4l/ufBV4a2dH6NI8BQG9VCU8lfnPxykfu/CKO/1X4ZSK8z5kIoxKmqX?=
 =?us-ascii?Q?QQLmoSSotBMymypflL1N/MEQEuj1y1Ofiq6FB8jrOz9oWa9D26yQPgWHuNhC?=
 =?us-ascii?Q?M6WjDZvncPJjCjC/3giQeX2ixiKie2KIiz25cWLwn8aIheg3y5THELsEK3tr?=
 =?us-ascii?Q?ZlODz/MroxSdPxxVwQecrhfKB+j1RBMUonGzy2/idb1UZTBtkdV5EYEiSM9O?=
 =?us-ascii?Q?RLHw1eNl7O6x9/SnVaajLvAb6Jn9hCc95J7E3kRMHznmHxc7MMiVG5VRlyps?=
 =?us-ascii?Q?/keGn8M2ri8cbLhDjP7ENddMnEzebx0t4NqRmNC97S/me1Sw61ess+LKmA4x?=
 =?us-ascii?Q?oPphFUXd3buFnk5HZj5gFhv6UCal19fz7Kpx0fGDO0o2+bEep0ZsMP5ZdnWn?=
 =?us-ascii?Q?tT7woo7F6nuecMtBHVZ2PMMsvoPvD1wAV6AUw7Ac1XVEY0ecBjH2v2QVxWn0?=
 =?us-ascii?Q?8VHS9OqywTunaRD6iS4ItDBfLfRA2ZeWs5iciH8dIczUxRAQAWae2Q503uio?=
 =?us-ascii?Q?InRLvyChfvGTdeHJHDIGO2i5aqobrBhsbRDOtDBB+KVYUIuwugf52DEjcjUI?=
 =?us-ascii?Q?VvC4oKJtqATvXmDJAO0YitWuSrQJ/xAjtaYCIDE6S7ZFxP9/DNiYKdMAxzxf?=
 =?us-ascii?Q?nKBDnO7FWTkaNcciiZsz+hG/mD0FNzSLrlAwlWOWyCapBUz6UFm5i3pLd5vS?=
 =?us-ascii?Q?2xwU80HRKGGMEhlGc0pDr8VBGNKAOq6wGM4tdw/XDqBd/Xi0VEeOVrlaodvC?=
 =?us-ascii?Q?zCu7EeOp2j7n9uvXQfUozm3w+viRugKMSjDkB0ZyR4P97YYoo+qPzUW+lgXu?=
 =?us-ascii?Q?ejt2I6f7RqCVzr/8ieStBs5bCdAbY6eUpe8JUor1o6UvBs9MPI5A0eSY0962?=
 =?us-ascii?Q?XJfPDdKpO/w1f46/67AwQFvg8WY08HvjxByPprhQ6sa18rzKmh/zOA3PuaIi?=
 =?us-ascii?Q?tnK/WAkhsK8l6gyuC5ESV5ju8u+LCuH9qobAUoyTbzFS54AyqyDREtarLmrJ?=
 =?us-ascii?Q?tLHnL/X/rBCHG2DADr6R4IM9LPFcSOefEgaNl7eaIPOakPAQ4u8bgJmDHk2Q?=
 =?us-ascii?Q?I1et1iUJgG2wSttPf4XfIdfXPk39NQaRLlWCJjvsgQ+yPjSM4MdybVma4JlJ?=
 =?us-ascii?Q?JtyT2WWdT306PEXMsWMz6BPxF3H5hrCcwV92WlEB0wwdfMieeKSkE6642+Xz?=
 =?us-ascii?Q?CNvoajnlQXL4K3SF1tE=3D?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 24cf2d68-f551-45f9-14cd-08dd454aa2f3
X-MS-Exchange-CrossTenant-AuthSource: CH3PR12MB8659.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Feb 2025 18:35:02.2654
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: pPPjb74XMaRRskjjJsQZei5ND+dPRbTiBhNo/nfQXEq/94S/v1gQr5HO/oTW71ZN
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY5PR12MB6573
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250204_103511_615518_6EDA5C38 
X-CRM114-Status: GOOD (  14.65  )
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

alloc_pages_node(, order) needs to be paired with __free_pages(, order) to
free all the allocated pages. For order != 0 the return from
alloc_pages_node() is just a page list, it hasn't been formed into a
folio.

However iommu_put_pages_list() just calls put_page() on the head page of
an allocation, which will end up leaking the tail pages if order != 0.

Fix this by using __GFP_COMP to create a high order folio and then always
use put_page() to free the full high order folio.

__iommu_free_account() can get the order of the allocation via
folio_order(), which corrects the accounting of high order allocations in
iommu_put_pages_list(). This is the same technique slub uses.

As far as I can tell, none of the places using high order allocations are
also using the free list, so this not a current bug.

Fixes: 06c375053cef ("iommu/vt-d: add wrapper functions for page allocations")
Signed-off-by: Jason Gunthorpe <jgg@nvidia.com>
---
 drivers/iommu/iommu-pages.h | 12 +++++++-----
 1 file changed, 7 insertions(+), 5 deletions(-)

diff --git a/drivers/iommu/iommu-pages.h b/drivers/iommu/iommu-pages.h
index 0ca2437989a0e1..26b91940bdc146 100644
--- a/drivers/iommu/iommu-pages.h
+++ b/drivers/iommu/iommu-pages.h
@@ -38,8 +38,9 @@ static inline void __iommu_alloc_account(struct page *page, int order)
  * @page: head struct page of the page.
  * @order: order of the page
  */
-static inline void __iommu_free_account(struct page *page, int order)
+static inline void __iommu_free_account(struct page *page)
 {
+	unsigned int order = folio_order(page_folio(page));
 	const long pgcnt = 1l << order;
 
 	mod_node_page_state(page_pgdat(page), NR_IOMMU_PAGES, -pgcnt);
@@ -57,7 +58,8 @@ static inline void __iommu_free_account(struct page *page, int order)
  */
 static inline void *iommu_alloc_pages_node(int nid, gfp_t gfp, int order)
 {
-	struct page *page = alloc_pages_node(nid, gfp | __GFP_ZERO, order);
+	struct page *page =
+		alloc_pages_node(nid, gfp | __GFP_ZERO | __GFP_COMP, order);
 
 	if (unlikely(!page))
 		return NULL;
@@ -115,8 +117,8 @@ static inline void iommu_free_pages(void *virt, int order)
 		return;
 
 	page = virt_to_page(virt);
-	__iommu_free_account(page, order);
-	__free_pages(page, order);
+	__iommu_free_account(page);
+	put_page(page);
 }
 
 /**
@@ -143,7 +145,7 @@ static inline void iommu_put_pages_list(struct list_head *page)
 		struct page *p = list_entry(page->prev, struct page, lru);
 
 		list_del(&p->lru);
-		__iommu_free_account(p, 0);
+		__iommu_free_account(p);
 		put_page(p);
 	}
 }
-- 
2.43.0


