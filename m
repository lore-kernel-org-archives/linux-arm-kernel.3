Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E4991C8303D
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  4 Jul 2025 17:03:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:
	Content-Type:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=TD3wqz5t6l8cmuXavrzHnmIxlUThqluL4jT85O2FMt4=; b=HjolvKaH3Sf07J4OeR7of5tO5G
	gjiUITbvXCTI9EFLgQd7OUaDqden7gj1uo7rv6Df3Mlgz39o/shgnJFS3RlaZCTL0Xto6zdAsuMoF
	8qcsbAprjSGXUmQ9CdsQHWtHFpRvXTG90F6P/n7qY4dp970NwWUCq56K2x2TqTNTrmEP1gdFpPa4P
	LgYDNKE3Uu5coN0xzOnWx9g8uL+6S2GAyZZasOYuk598Mn5kFUyx86pNoo0Knmdjem6OXt/FA2VPw
	UzkiE9ydFKWj1mUxy2SIKUqxWYdz1+uGfvLzcOhb3zHIjp3y+j6BPKmibt++uCl0VAB8kJBeeQJGN
	FWX2eUIQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uXjoS-0000000F3AQ-0VC5;
	Fri, 04 Jul 2025 17:03:00 +0000
Received: from mail-mw2nam10on2061d.outbound.protection.outlook.com ([2a01:111:f403:2412::61d] helo=NAM10-MW2-obe.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uXja4-0000000F133-1Lm3
	for linux-arm-kernel@lists.infradead.org;
	Fri, 04 Jul 2025 16:48:09 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=qtUX7Nf8zPcYIazB34U7+EX8ub6kC3l4G/l8B7czg6v+kC28pC0C5fK1c73077iKA6dsgyq9BNJwgkA/7LeBhIbRk7KsVdI5vhWsq25t0rgJ3k2Ca4cuFy/4Gp27Bc0s0WofSF/yZV9H29MPxS+zEf+BeObUMpFZ9mLGeC9bswgGCG7F86SgeFfLBIofg3Zy5qtkac6u8trYbgeV2ZLk3VrUONDl92dlIzT1j0nbJ1enQ3N7DJxY/knSx7Af/bZMgmYgZ6vpD5PrdLFx5L/FfQui/fIoTGZnsiarF/Esy2S0CTDlljaQAKjt731FQFOzwa6sSoSuE6GhbMg83x9/Ag==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=TD3wqz5t6l8cmuXavrzHnmIxlUThqluL4jT85O2FMt4=;
 b=Kq+wNQf1+iYnYw+3wlhWnUsqwINv3A6NI3hb3PNT7zujja4/MrsnrX8QquIyYCqNhYMG/YOCrCEDQkTlPU0G9n8C4pIsIKZJS6YDR12BmNMEmVsYNdX0cRXMk+fCm9gyUp8e0xBTnOAoK4Q3fWAMvs9YYUhRAS9GyubK9NzxWhshb2RZuT5NjEqYplIGhtLYNUn5J1m0QKbmj/6OzfBajkcATGqey6Bf0d3n1JdvreKyfPawCedqnDisVIVj+IcP62EobjG5Sw3q8IaRm0MDI6QzVfVU7PTtBZkTR43C2TlFNvRdwWLLvflUhA357heqCBZKdylUtaIiNyYOz67UZw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=TD3wqz5t6l8cmuXavrzHnmIxlUThqluL4jT85O2FMt4=;
 b=SrUiBw5mQaBpZvT6iLx/JqGirJNbD7zDkmr6ocuYrxvKeHQE0pvREEgTc8HLsy81l58yTdQsCgSJLUFBonW5AiVL0tHa3FOfJO+zTUCAjXrhYmDHqIQq/aCiw/F/PbytQSCKYzpYfYWAyQz7xZjAfn75zu8VgwcDaJhpILoYyshMzgOt2xN/xP6ZQbCAdqLC1po1N/yUYoXAf2RlAtWkALF+0dZahHHMs4V+87X+6oH7Ai3ftpXL8H4H0DDIOEVJtSxt1gxwC2ufRR3NZlDa4WfGH5/paYrbl+iaSmvzg+QOnXLiOfGBypehc7oH33QF2s2oGxZC7HWdddRfYOTKAw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CH3PR12MB8659.namprd12.prod.outlook.com (2603:10b6:610:17c::13)
 by LV8PR12MB9229.namprd12.prod.outlook.com (2603:10b6:408:191::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8857.37; Fri, 4 Jul
 2025 16:47:55 +0000
Received: from CH3PR12MB8659.namprd12.prod.outlook.com
 ([fe80::6eb6:7d37:7b4b:1732]) by CH3PR12MB8659.namprd12.prod.outlook.com
 ([fe80::6eb6:7d37:7b4b:1732%7]) with mapi id 15.20.8880.030; Fri, 4 Jul 2025
 16:47:55 +0000
Date: Fri, 4 Jul 2025 13:47:50 -0300
From: Jason Gunthorpe <jgg@nvidia.com>
To: Will Deacon <will@kernel.org>
Cc: David Hildenbrand <david@redhat.com>, Ankit Agrawal <ankita@nvidia.com>,
	"maz@kernel.org" <maz@kernel.org>,
	"oliver.upton@linux.dev" <oliver.upton@linux.dev>,
	"joey.gouly@arm.com" <joey.gouly@arm.com>,
	"suzuki.poulose@arm.com" <suzuki.poulose@arm.com>,
	"yuzenghui@huawei.com" <yuzenghui@huawei.com>,
	"catalin.marinas@arm.com" <catalin.marinas@arm.com>,
	"ryan.roberts@arm.com" <ryan.roberts@arm.com>,
	"shahuang@redhat.com" <shahuang@redhat.com>,
	"lpieralisi@kernel.org" <lpieralisi@kernel.org>,
	"ddutile@redhat.com" <ddutile@redhat.com>,
	"seanjc@google.com" <seanjc@google.com>,
	Aniket Agashe <aniketa@nvidia.com>, Neo Jia <cjia@nvidia.com>,
	Kirti Wankhede <kwankhede@nvidia.com>,
	Krishnakant Jaju <kjaju@nvidia.com>,
	"Tarun Gupta (SW-GPU)" <targupta@nvidia.com>,
	Vikram Sethi <vsethi@nvidia.com>, Andy Currid <acurrid@nvidia.com>,
	Alistair Popple <apopple@nvidia.com>,
	John Hubbard <jhubbard@nvidia.com>, Dan Williams <danw@nvidia.com>,
	Zhi Wang <zhiw@nvidia.com>, Matt Ochs <mochs@nvidia.com>,
	Uday Dhoke <udhoke@nvidia.com>, Dheeraj Nigam <dnigam@nvidia.com>,
	"alex.williamson@redhat.com" <alex.williamson@redhat.com>,
	"sebastianene@google.com" <sebastianene@google.com>,
	"coltonlewis@google.com" <coltonlewis@google.com>,
	"kevin.tian@intel.com" <kevin.tian@intel.com>,
	"yi.l.liu@intel.com" <yi.l.liu@intel.com>,
	"ardb@kernel.org" <ardb@kernel.org>,
	"akpm@linux-foundation.org" <akpm@linux-foundation.org>,
	"gshan@redhat.com" <gshan@redhat.com>,
	"linux-mm@kvack.org" <linux-mm@kvack.org>,
	"tabba@google.com" <tabba@google.com>,
	"qperret@google.com" <qperret@google.com>,
	"kvmarm@lists.linux.dev" <kvmarm@lists.linux.dev>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
	"maobibo@loongson.cn" <maobibo@loongson.cn>,
	"pbonzini@redhat.com" <pbonzini@redhat.com>
Subject: Re: [PATCH v9 3/6] KVM: arm64: Block cacheable PFNMAP mapping
Message-ID: <20250704164750.GO1410929@nvidia.com>
References: <20250621042111.3992-1-ankita@nvidia.com>
 <20250621042111.3992-4-ankita@nvidia.com>
 <aF6hamOI7YVDP1Cp@willie-the-truck>
 <SA1PR12MB7199144BBDA23C9A06DA12F9B046A@SA1PR12MB7199.namprd12.prod.outlook.com>
 <20250630122501.GQ167785@nvidia.com>
 <4b06b163-e1ce-4c20-b878-4593bc86bf53@redhat.com>
 <aGf7gfMjLhrqU5Kv@willie-the-truck>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aGf7gfMjLhrqU5Kv@willie-the-truck>
X-ClientProxiedBy: SN7PR04CA0009.namprd04.prod.outlook.com
 (2603:10b6:806:f2::14) To CH3PR12MB8659.namprd12.prod.outlook.com
 (2603:10b6:610:17c::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH3PR12MB8659:EE_|LV8PR12MB9229:EE_
X-MS-Office365-Filtering-Correlation-Id: 71a96b2a-518f-4a48-886b-08ddbb1a85e3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014|7416014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?/LL579qW12v5c45Wqq4RvvKe99IVlO+U/D2pOam5kpJk/6/i9LQarhNMwHBa?=
 =?us-ascii?Q?ZNuN2+mcRWR2GtM2G1o45lRPYDWxeu/hBbnv16tV7dJNj0HxPxaR//o5YLFS?=
 =?us-ascii?Q?g1N1n8YOu65ipNq3riGSgTXl0mABqlWBApKWDWPjIRq6jju3LyI+eUyjKZ3o?=
 =?us-ascii?Q?jlp6ehhpGimu/PC7iXkiRESiHNQQzUroymiP5wDEcd1DjQVfy4BowlZyT/O2?=
 =?us-ascii?Q?nZWNnXJqqm/Ie+widhDQTcV+5UhBlpziD412SE7qAuZkCMjzmc7prO1iarT+?=
 =?us-ascii?Q?ZvpDoSlW0NvoA6b4gko52Kkr6RvrXFY5rkxnBrXH3smOfg3+AnV6FNLRnEAy?=
 =?us-ascii?Q?oSiyZVZiz20dfPU264OqQ9reA2xTPD0ZeMaByn/Xx3g6B0vbyHyPWCU2RE97?=
 =?us-ascii?Q?n8v6L78wvf87CvKFbsBVRLeRjh0qFAHZoWp4/P92rEAD2GH6O7H/rgEYPe3c?=
 =?us-ascii?Q?LCWa0MVpnnvT16djPBh+QtqDSyAWaYU8ayXFt4EJI+8BsgJyCiQcjXI9Zd3+?=
 =?us-ascii?Q?eS6G7l7GWOWLF3wS3s60pO40f443szMev7aIzrN64VCMMGUxVlpkQYPo1wM7?=
 =?us-ascii?Q?7F6S4xdb/yPQYaz3pzw4yvwutfL/CmY+P6OT/I66KjALIMdy4dxG+WDtwJi2?=
 =?us-ascii?Q?WHjgy25ycm4Ft1jo1eOzoYe6bSA/GjMJyEq+a36l4wzQd5RfTS7mlRTXY+tv?=
 =?us-ascii?Q?hjfL0ydrPO/2dfGV8iLcdoPHTBJFm/TWzxboDaawPNlCesQrl/aUbJOkXAog?=
 =?us-ascii?Q?J6LMObWHSK5gjRqSC+kACfFjTyuEtQrhzXtDUOQePsuAYuhBPimIpbczN+zA?=
 =?us-ascii?Q?wjzGEo6gZD5zOuGmdbz/ajI9APRC9Bmc6Bry2Ukp9o2DL/+RLgdSTHmUktsv?=
 =?us-ascii?Q?pexx679byI3xTiDPIy4iV1dXdeYOsQWsuSDpCziKaurZS2BZGwKkMs4hUd9W?=
 =?us-ascii?Q?UI+5krTNC6397sFjDys1bfJktU4W9KmqMN2snYQKUw/TChdD28IwMKQzJkLw?=
 =?us-ascii?Q?QOEzkHS/kKCdebe0WbMeg+5b/Hr+lbQ2B0vY4bZhd9aGohHRsW0z2TRWX6N4?=
 =?us-ascii?Q?oC47LAYFMvAvsAWSDaeJEmxuNc5oKQP34nRCo6yiKKlsneS5FDquUPGR3WjM?=
 =?us-ascii?Q?0WUF0PDcP7ccyRnKwd3FxzhYsURLLd//bpjWrEDj+r+kGJIQ1Ev8vaBzyWKe?=
 =?us-ascii?Q?AIUo7mNUPTyQksg8kGtnQ/stGX+7KX7tSE3erwwO2is4zKGViKNbo4XDRUsz?=
 =?us-ascii?Q?0Y93TrEt9vhxiBLsBrgeZ8MsD14JBA7NcxBwi15m5w2lBNFLW3DPVNBmJS2d?=
 =?us-ascii?Q?i9FOk0S6mZ0DuTdRvatwqcaCYDfaFMBi9YPwafrIu0f0DiibbghPC5WXYDdu?=
 =?us-ascii?Q?gnAcdUp4cBptzWKMVJ/vaYio0y+EBgB2kHYNjibVAgqFe/akqTcEIN3oRFW1?=
 =?us-ascii?Q?FAbfMFRhgIk=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH3PR12MB8659.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(7416014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?FPPQThIvFUMRfvIkGZNU2SgKaqcvqH0j6FojBSafbfXhbDzdDGJUWZbDBVbO?=
 =?us-ascii?Q?NNbj7CMqyUxeC+4U03T4ZnmxG3wuHa3Qd5ZVXqAoooeXWcT4JxuHYhpY8Hp9?=
 =?us-ascii?Q?8shlGPP6m2oitoHqJmeXsX+23Z5LzJ4qzo9lZD9YyYsnl9xVWuo5cca4ET8U?=
 =?us-ascii?Q?VDyUntFtcQWEW5zclOVjxp/Y7yH8fYqKt5XuoIWsz4zY69qHKtt8OCwA4bKF?=
 =?us-ascii?Q?gp5OotAr6iZKH/SRdZImNw49W0k/wTrYM2h/PsjcWj8eB6XawFRWEzEn03uD?=
 =?us-ascii?Q?4AzdKYujDyoyzSpqkC9+4PaOHemxdMHnoVZ6pvFtX2EGXuW1yNv5bna7+er/?=
 =?us-ascii?Q?PkuBMT4EVvGLeFGNSWAIoxMRAiELxxvmkOvWtkW4/auHxZQvUYosrqrhSsAP?=
 =?us-ascii?Q?TP7a9A4ZiGso2EofWOG58typYgTbE0/2woVpeCFmpTD1W5QsoourAkP47H2N?=
 =?us-ascii?Q?JEwF+4gle9QUmVv90Jr2f5EEvPWQnSa0miWepZ3vYHsvcRkxrCbj3WoOrg6J?=
 =?us-ascii?Q?eUUdItLQpvuNwgkpopoRaXZWaOJRTbm2LFCTrWam+e3uILW7FQIxwadYz7dz?=
 =?us-ascii?Q?l5x7v6T216jl6ROnExNonWjarzeaB4FenWlk8Z7kN+bDuJyL2nwgoHNe5OMp?=
 =?us-ascii?Q?/22G+ylWHalmx78Ji2r376hhztQlDpAix4HhtA4IuFw+Kas6JoGUBQk4kTg2?=
 =?us-ascii?Q?D+EPXWrO63M8Eq181mthtJRG8FGY0VPSU4/kfFO6rXdUAyMilV4cPWY2YZUv?=
 =?us-ascii?Q?fGyiSQMy2v/JdZoxCAPz4QXUDwU7OXHA5rzHtTg/cU/QNxdsOCnOc4C8DlM3?=
 =?us-ascii?Q?5a7K7L1sXo5QJtj3cPPkOS/0BG6DbAapm5KpLtCubWHNMs8miBVSL8cmWUZm?=
 =?us-ascii?Q?7m0iMc+pT+fQXpHqndJab468Nt5PRcW1nOyN07Kz1V8UBq71Ugli9j5+kkdE?=
 =?us-ascii?Q?QApB8tCRViIdqMCq3bW8piOXKYqrFLoPvoQB3G+4WxuIBAjY8q011nqBngpR?=
 =?us-ascii?Q?WFJSjqYW1sr4nIyIGc0z1cHTCnsYMxbW7is1bCRIZ7+mxYuQFqOFAR54ZkGg?=
 =?us-ascii?Q?VSzIJ6YvLkGFTzuyxoiLR6SJbjhTEkwadl6kedTTjSbIi7YJz0LS98nrUQZJ?=
 =?us-ascii?Q?a6VkxgvkS5mx1iuDJwbKE9XJQd5+gWWtHzx4vrXcj5MJYLDo3SMBb6AFWHJj?=
 =?us-ascii?Q?DzpoIyFhFb7vAMlGpRjcwbLLyJKvQchx2B34j9uU9eGmVEs9DU7l1Fn7fQYO?=
 =?us-ascii?Q?RCmoVJ4E2SMrDRaoP4tgW5WDz3m/XbbfuPgjsslqMkVKCQIpZ5D80BgBIpwH?=
 =?us-ascii?Q?zhyyh0Wu3SrtS22DAIN95oIoPCVSTVwP8y/C/KlwXjAVg6BJSsuSzGVY8CFl?=
 =?us-ascii?Q?0my/88/7yKZ+yBuOvVc5ZS7mXpnWWqU9cywi9KbUPVVo6hTHPJ0s1X9DL/JF?=
 =?us-ascii?Q?WBSpiMRkeSzl3lYt+qeOZGeF9o7nflA4ji6L44yMVUXpmXcfovCj1+l4+8zx?=
 =?us-ascii?Q?1Z949lj3jPK0TS13Va9T5Lwm1QGfdAzc1gyV9eDrQXNlRoy31PCPPkWzy7d2?=
 =?us-ascii?Q?95rnF0QZO0rCVBil9Nsx4bD0TF3eo3qm1ML4pSFn?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 71a96b2a-518f-4a48-886b-08ddbb1a85e3
X-MS-Exchange-CrossTenant-AuthSource: CH3PR12MB8659.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Jul 2025 16:47:55.0998
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: a0B9oPeow86rVXv+UUe/pYxDjqKDz9j0NLH+qzWQXCKDqLDe+y6TeCz7cmKa8pJT
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV8PR12MB9229
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250704_094808_365182_11C7A231 
X-CRM114-Status: GOOD (  29.72  )
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

On Fri, Jul 04, 2025 at 05:04:17PM +0100, Will Deacon wrote:
> On Fri, Jul 04, 2025 at 02:21:32PM +0200, David Hildenbrand wrote:
> > On 30.06.25 14:25, Jason Gunthorpe wrote:
> > > On Mon, Jun 30, 2025 at 01:56:43AM +0000, Ankit Agrawal wrote:
> > > > > Sorry for the drive-by comment, but I was looking at this old series from
> > > > > Paolo (look at the cover letter and patch 5):
> > > > > 
> > > > > https://lore.kernel.org/r/20250109133817.314401-1-pbonzini@redhat.com
> > > > > 
> > > > > in which he points out that the arm64 get_vma_page_shift() function
> > > > > incorrectly assumes that a VM_PFNMAP VMA is physically contiguous, which
> > > > > may not be the case if a driver calls remap_pfn_range() to mess around
> > > > > with mappings within the VMA. I think that implies that the optimisation
> > > > > in 2aa53d68cee6 ("KVM: arm64: Try stage2 block mapping for host device
> > > > > MMIO") is unsound.
> > > > 
> > > > Hm yeah, that does seem problematic. Perhaps we need a new
> > > > vma flag that could help the driver communicate to the KVM that the
> > > > mapping is contiguous and it can go ahead with the optimization?
> > > > E.g. something similar to VM_ALLOW_ANY_UNCACHED.
> > > 
> > > I think Paolo has the right direction - remove any attempts by KVM to
> > > expand contiguity, it should only copy the primary's PTEs and rely on
> > > the primary to discover contiguity. No new flags.
> > 
> > 100%
> 
> The part I don't understand, however, is that I can't see an MMU notifier
> anywhere on the successful remap_pfn_range() path. So if a driver is
> using that interface to change the mapping properties of a VM_PFNMAP VMA,
> how do we ensure that the guest doesn't use whatever stale mappings it's
> faulted in previously? Did I just miss something?

Generally mmu notifiers are for invalidation, not used when
establishing new mappings.

It is not legal to use remap_pfn_range() to replace already mapped
PTEs. It can only be used during a fop mmap callback to establish the
first mapping during VMA creation. Thus there can be no present
mapping cached in a secondary and no need to invalidate.

To have dynamic mappings you have to use the fault path and a vmf_XX
function - which only happens if the address is non-present, so again
no invalidation.

Jason

