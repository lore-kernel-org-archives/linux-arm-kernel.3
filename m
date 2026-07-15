Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2BF44C44501
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 15 Jul 2026 18:10:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:
	Content-Type:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=iZLI8OzI03mga7bTL40hysMwKBjSM95vGEB2s52axRE=; b=b1Tw0WHG0Fr6x/kepByJhzD9MI
	0NGMSW0ahlyCvbuPmaJyokX/PtVwTYbrZzvqPHvKHDnbFQRWTtuX6vG4akzb+YhOLF+z6oxNrqNNP
	jgcl4JVsFz1n46Bt+lV4U+oqreGf1qe24HMWDwIoJA3SRJNg/C0frDP4raDvyy2C8i772a1lS9zx+
	yJDTAOXtGBWXXKAvqBFm146g/I7eJjgK7vLNTz0+/V8t2DsGstP+1tVDhFfKvPEJrzGzs+xK3EFbL
	yZ/jG1iWRU8d2aWglOvqTsCM7BALeFaDX24dcM+x7kXjF32kbwlzCAHgc4rjJ0fh/W6ClDmS9nFjM
	+pi/InlA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wk43Y-0000000FeBR-3eqA;
	Wed, 15 Jul 2026 18:10:04 +0000
Received: from mail-westcentralusazon11010005.outbound.protection.outlook.com ([40.93.198.5] helo=CY7PR03CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wk43W-0000000FeAu-3Rsa
	for linux-arm-kernel@lists.infradead.org;
	Wed, 15 Jul 2026 18:10:04 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=x7gn01G5oyKZgT8ygXkccw0zGs3Jh5njK4oxdHY8y1gli3n1RLNAvu/3PSUXnMwyTLPgzuvzbDUaUOuxEjFMfkiROe8BB1fAuBOZXpcpPbBFXnJernTVFqpOs3PuzZkn0wNA+LbnCy43v916JnvRBxWO3lBwu6xnTkYOdp4i8/p/W+J57PYoIknkzunsNRTHs43Q21Xv5YJj7BdcbSV3Yknqzal7WYKZMCMNnkxLHov7doBsXOKWf0u2RjwNIuVaSwAzblz+5dJ3v4HYk3FYJK1HGy+gI4VDMvaPL2HDtIa7VbqiFpBJCHBzKOHuxlMml2/1P019f5DJsgQykCjLQA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=iZLI8OzI03mga7bTL40hysMwKBjSM95vGEB2s52axRE=;
 b=JEEwvTLJUhX/DqjIf6l3JkXCMKEnH8MzUNrrfk5wOJjGSd65mUXPmXTXIoScpdhuUsu8gMuh7+NYcfMCcklBCVysAkHmdWX72b2yUMrbIjs2OlM1SL73mqc4/bWN4SpPjwOVUs89DdTDsypvMJMlFMwSybxEwWNG5x3CUhbgATCo5A/AzBXp4HtcMTSvGNedMAKj7NB9f7GKRCOxx16CNN7GW3BoP//lS6RyicrzIoXPdOtESmFXXzlREaxa7V4ZG/RY3fEKTl+QMDAhI8q1GfkoLarFIFJpWMl5V01pb431yvAidYBMbKXnwHJkORSVkL/uYf8NCT6/4G7nUdA4lg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=iZLI8OzI03mga7bTL40hysMwKBjSM95vGEB2s52axRE=;
 b=o+urbQYhxkeyw+Cl3gJOEIjyrzKeKSpytCg/IMKGYC3t5YVqit2LC7h129ONEa6/wByN+eEurfJWSs/gRvj37RdkOn3TW6Ri82ITdp6cUUgJcYGVFSzQymFWbYVxMZXbPBRijYANpxfI3pTUVG45fjcLMo0AEx7B3ztSBNq35GNxVM4WnUerAGNjSaDYpyQwxyJdEOlcTLXYZEmDphsK+X0qjOnll5bVrR2flMD2Ew4D+vSa+XSqbybi+4VgFfPxLcKYHOEBzvdOFu9IdKuAA6OFt7AOk3YjptxiFkwe3TkkpC7n/5K7T9uBuO8WvBPF+ek28gsOGupHLwZ4o7By0Q==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from LV8PR12MB9620.namprd12.prod.outlook.com (2603:10b6:408:2a1::19)
 by CH3PR12MB9099.namprd12.prod.outlook.com (2603:10b6:610:1a5::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.223.12; Wed, 15 Jul
 2026 18:09:50 +0000
Received: from LV8PR12MB9620.namprd12.prod.outlook.com
 ([fe80::299d:f5e0:3550:1528]) by LV8PR12MB9620.namprd12.prod.outlook.com
 ([fe80::299d:f5e0:3550:1528%4]) with mapi id 15.21.0202.014; Wed, 15 Jul 2026
 18:09:50 +0000
Date: Wed, 15 Jul 2026 15:09:49 -0300
From: Jason Gunthorpe <jgg@nvidia.com>
To: Robin Murphy <robin.murphy@arm.com>
Cc: Will Deacon <will@kernel.org>,
	Vijayanand Jitta <vijayanand.jitta@oss.qualcomm.com>,
	"Joerg Roedel (AMD)" <joro@8bytes.org>,
	linux-arm-msm@vger.kernel.org, iommu@lists.linux.dev,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	Prakash Gupta <prakash.gupta@oss.qualcomm.com>
Subject: Re: [PATCH] iommu/io-pgtable-arm: Add support for contiguous hint bit
Message-ID: <20260715180949.GD3775915@nvidia.com>
References: <20260618-iommu_contig_hint-v1-1-4502a59e6388@oss.qualcomm.com>
 <20260703161228.GA1948451@nvidia.com>
 <b7224dff-7e51-49cb-8421-14d090492dfc@oss.qualcomm.com>
 <20260715113913.GA3775915@nvidia.com>
 <ald3CuddY6I7gml1@willie-the-truck>
 <2ce09e84-c57f-4087-9dda-07245fadfc02@arm.com>
 <20260715125039.GA50536@nvidia.com>
 <d20d258d-d970-4ef1-bbb6-cdc83fc20c9d@arm.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <d20d258d-d970-4ef1-bbb6-cdc83fc20c9d@arm.com>
X-ClientProxiedBy: YT4PR01CA0217.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:eb::22) To LV8PR12MB9620.namprd12.prod.outlook.com
 (2603:10b6:408:2a1::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LV8PR12MB9620:EE_|CH3PR12MB9099:EE_
X-MS-Office365-Filtering-Correlation-Id: a7bd2f68-4597-4ced-994c-08dee29c4313
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014|23010399003|22082099003|18002099003|10067099003|4143699003|56012099006|11063799006;
X-Microsoft-Antispam-Message-Info: tN+vhWuNoFPLoZGUOKw29Ba4JIvB+Nr80JFhc1aOxdvVxK2X8fAEQM2s75R2P4ajUnJu45IaAYuglZWpxQVglNU6CW1uoChgmRvr1DPBqvbUuQ4phUwUinu3v/N3s12FRCCSIQYdG4ssyuf6hszcKb51vC2U5r3AtIoKKUoo4TW5Ncy16KY83hK2ZQoH4ksfby503AEINmybCxafn2iIsJA/kdZFy3SxdF/tAIGN9zP1GDtuETps/AC3oTVyRAne0nRFzLjt/riN2KvJQ6rNnuDi1hLC7SDxFxGrNmP7ikPHzKcpe0FX3aRjQiJvEaOIX+tw5QXwRt28ubL8nnBoDk3StqJJN7oJ1XUGDjDFrpHUk4iyJQ5WFriR2ab/G5ALVwepvfgQOeqa/1RGmr2bwvoXDwbMiu5BLAfE5C8IZxv2iJ//73THcIW2Mvlo7xemvh2sxf/eCPykGvHC8OespwZ2wIcizj69q4rdazA0uA46k8nhRBu1JHqBbv5tR9RptiXnR9R+5UBU2W+2MvvrEW87Ofcclp4AUUtH4DFKmLCgFiHCefGJPOWXONS/3m8+yaTLIMf+1XHFCpzC2NJ10XDqdpEYTz/X3/gIzd1JQf/a6MTBvYjQCQJsZ6fFgO5kmgr99DYj/QODwLfRuPeYkgLuknrP4yOQe3F0pjRUlsg=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LV8PR12MB9620.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(23010399003)(22082099003)(18002099003)(10067099003)(4143699003)(56012099006)(11063799006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?EhDCeku3muIPz3oj53RJEsuPEC1WEbhPB+Og4LLMnJ7bTI4z/VktT2ucUJMK?=
 =?us-ascii?Q?ki4f3O7T0STAVcVa8m6cpQ2uFiXQMu7Mtab8ZGqPgD5clr0ep/rSy6e0LJuF?=
 =?us-ascii?Q?Go1FUxfx71ywa3nH1sHYniu9Jm8461tNUZDZZ1gWHzEi5UKECQ4hWcZXvQpQ?=
 =?us-ascii?Q?aEoDqiH+cHPJy0zb13a+LxiEgF1mYj0hM/Sg1MNCjxuHzBTdUq8vq/4aK2D9?=
 =?us-ascii?Q?tZZBtkJ8LWz97jYyqHyF0hL4knJEJv1DH99mjF0ch3Jbx+yYY/imJN89xXf1?=
 =?us-ascii?Q?s3aGP0w5/ZJD/XXWdVVdynx9OwDeOlAWdjY682P4JH09ajpZBOGU/Z4hAW7A?=
 =?us-ascii?Q?UFqiWg8WX7lFB25jcYrxEE/aNrZynenveMTNN64P0Sz7Tm8j5u12wXJXeJoq?=
 =?us-ascii?Q?MK99qVrihptllGem50CexBytmbYnfPk7xB+M7wYMu/vDs6Ehbr1VIZMgfwYH?=
 =?us-ascii?Q?IAApD3b1c1TA8kwCP90o+8srPi0AymJF7ChXFwhdaDUew8tei7Q8sDlDLEAP?=
 =?us-ascii?Q?KYnZOlvNIyTmEbiJR+bqhPHLstpAICRZTAg6dqjEJzxjfV57SMgTsgmFgeU2?=
 =?us-ascii?Q?ocs+K0t12vqQ1XHaA+FCPiWFpaZhVaw0CQtrCf1uQ4HwCwe4WdovSZZAvUo0?=
 =?us-ascii?Q?o7UiBWllWkWZpFLh59v9EeYh0p82g6m39beSWxxRsoVR7a8U7j/3FHMXX6vi?=
 =?us-ascii?Q?fTeojS6H+EQrbGH5z4dJJrIWixQh9vQKPt89bd0FD/ChoC1TnlALSv0IGoib?=
 =?us-ascii?Q?7UPPRSms/iS6xsJhv50chidhH8yrwLmHDeaZpXuIUX6fxj4FcLE/ywQ0lmhU?=
 =?us-ascii?Q?f4oh7g7+R+kalad56X5FSd8wYf8slOZQ1lDomChEOzJVRuOPFeGJbLd1kPJ3?=
 =?us-ascii?Q?hMojOAbSL1SA1BCNH7WyhILVyme/lKnK95QmHoRaa2w3XMjf0FdT/eTRulhT?=
 =?us-ascii?Q?g9PrRMvQQzJfqN0A1nTjdNYTbELkxuWwNp5u+2SOBxHaFG9WIvI0MnyP3Jbd?=
 =?us-ascii?Q?/EKF6cJB1PiHfw/R/7AGj8UZBRVV1n1xkblgwMTTc63szYCeaax6P8kKHodZ?=
 =?us-ascii?Q?i4HpAsPIQVEIDIbTUkmGeIRryHbDfarmtThD/vIgDMymowLyfxH8mJVOdLox?=
 =?us-ascii?Q?NE3KhsqoM+DiFnuqF33xJc93Q0SIlWG+7pows0suQWb7kmU5I7pLNLhDTfVU?=
 =?us-ascii?Q?hVojXPXsymeaBuvHlY1qfDkhAAKj0o4Pn2my1DArBF15V8mHRrkjKTtOvRwt?=
 =?us-ascii?Q?4bpxZYTMSg2uEJE/YeAOgBY01FR5DA+n8MhF+av1ODHSaWRH3pMQNns9vNle?=
 =?us-ascii?Q?nlKtMymsZ5KyK7ljUnEcq6s7F9TOtVfpxzjH0gkkYTxkVPhEHdkKlcTPf0JC?=
 =?us-ascii?Q?7jQgbRPFyH5MM8iIcyhaubH1032L8/30SpY7q2ba0ZbDTMM7Q2tT8NEUYzU4?=
 =?us-ascii?Q?CdESX5PbUm9M9pyNq3l+RafEhWT+HarrV6TcfRda7SG+D31HeCUIKdm3TkA5?=
 =?us-ascii?Q?oTPuGNecUSbSK6JXPyEZ7QVI48ud8c444gnyJGX6iaOLVRGuXSKHthbLImlF?=
 =?us-ascii?Q?52eP7CQeoJgNCMEU3HSY/MthbFipW0pqwkeUwilbpaUjwhs/VJj4xEy3DTyT?=
 =?us-ascii?Q?YPBdJLinZk3/WSMVWgkGLYhGn8gkmyQhYtL2CGgMrQ41j5CrtnGrQ1Gi3h9d?=
 =?us-ascii?Q?Ck5C+klIaGVsUYUJ+z94Zd/dhKSXuNWCKL0p+0A0PmXiHp7A?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a7bd2f68-4597-4ced-994c-08dee29c4313
X-MS-Exchange-CrossTenant-AuthSource: LV8PR12MB9620.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Jul 2026 18:09:50.2798
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: /qE6yILmTARETl4uTz3cm/8XvQ0wCXi5hHNaenUM9gIHQnBTUuBjE6XuPEAFLpiM
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR12MB9099
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260715_111002_872849_3E422D8A 
X-CRM114-Status: GOOD (  27.03  )
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

On Wed, Jul 15, 2026 at 06:45:09PM +0100, Robin Murphy wrote:

> > AFAICR the biggest issue with arm-smmu was it using IO_PGTABLE_ARMV7S
> > as well. I think it would be fine to implement all the unique LPAE
> > features it needs in iommupt, I did most of them already.
> > 
> > I do have an ARMV7S implementation for iommupt, but I did not solve
> > the sub page problem. So while it is functionally working it is not
> > usable since it wastes so much memory. That's a tricky problem to
> > solve since the algorithms depend on the gather->freelist.
> > 
> > I didn't spend any time trying to do anything about this as I was not
> > intending to touch arm-smmu
> 
> Indeed between the irregular table sizes (before you even get to the
> Mediatek shenanigans...), and the awkward GFP_DMA limitations and/or reality
> that many of the systems using it really don't have memory to waste, I'd
> have considered v7s pretty much terminally incompatible with iommu_pages and
> the abstraction that iommupt is trying to be... :/

At least Matthew has talked about having a sub page allocator with
meta data, maybe with the memdesc support someday. Even today we could
have iommu-pages allocate a companion struct pointed to from struct
page that was sized 4x so it could be used for the freelist.

There are some other options for alterantive algorithms that could
work without requiring the free list. I had some thoughts about placing
the free list inside the data itself as a non-present entry.

It is not insolvable, I'm just not sure it is worth doing vs leaving
arm-smmu to keep using iopgtable from ARMv7.

Otherwise to have arm-smmu use iommupt you'd end up with two
iommu_domains specialized to 32 and 64 bit page tables, with their own
ops and a shared invalidation like how the tlbi struct is providing
for smmuv3.

It is not outrageously bad, but it certainly is a chunk of work.

If the goal is arm-smmu support of CONT then maybe there is some merit
in doing iopgtable as a one off feature. But there have been many
attempts so far to add CONT and they all had troubles, I had the
impression is is not so easy..

Jason

