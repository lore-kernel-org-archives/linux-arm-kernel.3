Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 80F1ECFD360
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 24 Nov 2025 23:31:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:CC:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=szfoICBODjxByFRjXnGvBsh1wNIAD2mtqn3vuiIrZ0s=; b=Bj5+2m0XYh9WW61kQlf31ZT4wp
	lrJHR4coXlnDVsZO76pNwHR6p+5zncSPkAA2WIlk5ybbu6oPHUip/bjccjpJOz3Xa9nrv1KA92aYQ
	njqqD8198btM5a1L6ZXoHK5RuSxuGKlZ9TeUa1MA37AYpx2IBe8XEe9/KedrShZmjSSR5T+e/ZCT+
	y/1nqQuiS7KWjOkVGOEgWmaNZrA30gx7rrubCFRzsVPudW9ALMSpNtLA77gXdcp+roM0MlAHmX+z7
	v1FNzRiwxvyDS1hMSUje+moOc1mfBnQLy8uwuQrc/tCXMEmk81h8FrfLWFJMRCK4NK7g04PZ5FQNc
	SX76L/8w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vNg2B-0000000CSQo-2D1W;
	Mon, 24 Nov 2025 23:31:51 +0000
Received: from mail-westus2azon11010010.outbound.protection.outlook.com ([52.101.46.10] helo=CO1PR03CU002.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vNg28-0000000CSQQ-32bO
	for linux-arm-kernel@lists.infradead.org;
	Mon, 24 Nov 2025 23:31:49 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=VDm9fICrfUjF5BhWto/Ud63JeKW3irBuk7LWyi6s8mIZjecuSZFpEDwC8UyuFqiToRlLd9lbTDGdpV+CaQWMJggZFwnQ/fjoah6in9itNAQrP5cwDyofds6fcEGXWksjEdbDkK7zHivZ2+oKDRqo/gg9srW/i3+yui2H0nQrGYPzvOn7sjxfkZzuLGT7t063J4jkK8pbNPXf0+m2iAoccrNtTJuYRx5ms89jGdPH2G7m0DmCp9ZxXlSbNitqQUbag2y72q52izdqBl1M+aQkw7e3fJeGSayted+9sbTPu7lJbWjLU3tuGDkFmZZWpOOPXZ4N/QP0ivs/ADd455DmjA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=szfoICBODjxByFRjXnGvBsh1wNIAD2mtqn3vuiIrZ0s=;
 b=LhCIPPe2mIT4QUl1CMHI29cT3t6u06Xmb8huYtiONtmBFMoWwEMqQCd0zWg/Oj4B6nDetVNRcJdI0DUzBbV6yvL3mea4R++K8a2eeHxpKK6Cl87qlCuHw4sqijSD3O5QcjGV1qIYdDtuvyaMX0M63D9Rt7ijZmw09Qsi0W0Z5h5cGX5MDkm9fVglPQ6eDORH5se3pZTqdTjJ52Z59hXYwW/3yyZYg41g0zajWLq6Au9NNsu8DR/HMu0RfQaC4M2JJ+RDuevLOw5JTzx7it0sw8wgwtT79JYne81coA6uGrNPRFqBHAp9nvfVUnINzPLmUgEZ3U397fvotKMH6MAxhQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.160) smtp.rcpttodomain=kernel.org smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=szfoICBODjxByFRjXnGvBsh1wNIAD2mtqn3vuiIrZ0s=;
 b=PUSxskSAcFOMt2C745m2Fere0rYRjdS5SECNWlVVJkseiUs4qDLzwfxgwmHtol3WI/iZBecfb9z5wXtKx7yQrmptP/FSPT1RUPZYYdK/cuZ+DM8JH7eWqr3Bk19DzRTCxEL5ykygmAEA8D5rRZvSDXNjVXP14y7/szvM6cHhcEO3xFgK8LGlltjEj5P3K+Qr1dIgb6DdvKL7iACzKr5mmvcbta0FJU4swxtDb+oArxyl1HBDJRE6JAv7Uu5Nwwc1Tebes48Gez7+Xy70LJ2t6kI5Yfd2zAY4lNmSCkE5ayNHusig7u5hYFfBRd6kDmSOhyDicxQJR9bRks1NXIS8Iw==
Received: from SJ0PR03CA0026.namprd03.prod.outlook.com (2603:10b6:a03:33a::31)
 by PH7PR12MB6537.namprd12.prod.outlook.com (2603:10b6:510:1f2::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9343.17; Mon, 24 Nov
 2025 23:31:34 +0000
Received: from SJ5PEPF000001E9.namprd05.prod.outlook.com
 (2603:10b6:a03:33a:cafe::5c) by SJ0PR03CA0026.outlook.office365.com
 (2603:10b6:a03:33a::31) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9343.17 via Frontend Transport; Mon,
 24 Nov 2025 23:31:22 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.160)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.160 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.160; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.160) by
 SJ5PEPF000001E9.mail.protection.outlook.com (10.167.242.197) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9366.7 via Frontend Transport; Mon, 24 Nov 2025 23:31:32 +0000
Received: from rnnvmail203.nvidia.com (10.129.68.9) by mail.nvidia.com
 (10.129.200.66) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Mon, 24 Nov
 2025 15:31:18 -0800
Received: from rnnvmail202.nvidia.com (10.129.68.7) by rnnvmail203.nvidia.com
 (10.129.68.9) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Mon, 24 Nov
 2025 15:31:17 -0800
Received: from Asurada-Nvidia (10.127.8.13) by mail.nvidia.com (10.129.68.7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Mon, 24 Nov 2025 15:31:16 -0800
Date: Mon, 24 Nov 2025 15:31:15 -0800
From: Nicolin Chen <nicolinc@nvidia.com>
To: Jason Gunthorpe <jgg@nvidia.com>
CC: Will Deacon <will@kernel.org>, <jean-philippe@linaro.org>,
	<robin.murphy@arm.com>, <joro@8bytes.org>, <balbirs@nvidia.com>,
	<miko.lenczewski@arm.com>, <peterz@infradead.org>, <kevin.tian@intel.com>,
	<praan@google.com>, <linux-arm-kernel@lists.infradead.org>,
	<iommu@lists.linux.dev>, <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v5 4/7] iommu/arm-smmu-v3: Pre-allocate a per-master
 invalidation array
Message-ID: <aSTqw4Doipb+0AfP@Asurada-Nvidia>
References: <cover.1762588839.git.nicolinc@nvidia.com>
 <b6e1b5d0ac0157fc06b5cd20c5cd72caec892c47.1762588839.git.nicolinc@nvidia.com>
 <aSTRX5RJJhfNU6l3@willie-the-truck>
 <aSTfrp9D7i03XhyU@Asurada-Nvidia>
 <20251124230845.GN153257@nvidia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20251124230845.GN153257@nvidia.com>
X-NV-OnPremToCloud: ExternallySecured
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ5PEPF000001E9:EE_|PH7PR12MB6537:EE_
X-MS-Office365-Filtering-Correlation-Id: 2c4140a1-0e4e-463a-abae-08de2bb19a47
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|82310400026|376014|7416014|1800799024|36860700013;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?NcupdWouvS0BTT8ms1PbzxebPowmQPc1w0sMSiKbQssM8urru9JL7C9AlKRe?=
 =?us-ascii?Q?CUT5FYxa4AyRfvwecTBSbC4OkByU7hPcntBZvbgFm1XnQLLAOdGIYf6aRm4M?=
 =?us-ascii?Q?c6VH1JFaFVITKpcOTUusHv8Y04tFJM9/hH+jNWYGvjcgr7SIHWJ/fE8+NtOG?=
 =?us-ascii?Q?rksYKxLrJ6w3xaJRWCNniATsXsNXtjliknHd5kw5ZsHbojuOxjijGYj5uJxa?=
 =?us-ascii?Q?cGcRBwzVLCNsrnqIa87Zi3LO2kDifGbmBHBYUcbAuzWoaGrRGT1N8HRuHDUT?=
 =?us-ascii?Q?JvgA87aVFqoJ8v76mJPn05cczRy92g3WCpcxts4w5zdqH4DT1vrduheN/rla?=
 =?us-ascii?Q?d7AJilRzn29XasHS/wZLKJwoyhPa+PTYo75QTH9AFhbr2jqqcF5xVpfQxRH7?=
 =?us-ascii?Q?4gYA78ZxwF0C1zLYfmr0+v2XTfr9JOANwqp6DptqgD8a/Oxg2abdbUum3TdM?=
 =?us-ascii?Q?wtU4/ZmpmHmnNERoW0spWbtgxWBYib7lfLjQeiFaa+SagIKXOscC8tBJ/VGa?=
 =?us-ascii?Q?6EBpXrSpHqcETdalhNxpEL+lmtBIY14insEF6gjD0XKmUqYyvzrkU+txaiGy?=
 =?us-ascii?Q?udbEHIEBDOjqRDARnzvacX95AevaNs+dfYRVHsjgVmzmdjuFuKRmfJjJprlw?=
 =?us-ascii?Q?Zd8IOwrJp718WGdVmMzNQKPPiBv9JcIiovaMlk9IFLKH2A1CLtahWL4rSqCy?=
 =?us-ascii?Q?jegKvg89jaFuQDeLo2MxKGOYkByN2aFecFvFmdPV/+WIGp+jMMLelUZ3BNdw?=
 =?us-ascii?Q?sSF/q/XWvt73t6IeosZGmk8vuZXRHrdG9doa1eFGOZB6oO1XZeJop1nEu5t3?=
 =?us-ascii?Q?Zjh8jnjvkdyc6xSNKp/X1hht+QM7TyA2WNV8SPdN2CJ7P187U8X/cAiRFLZr?=
 =?us-ascii?Q?WPu4w6lQ9yGVbLPdCP6vZ7A7UwA5VJ8IlKPDZms1Pil1Moy27h9aLdIVF2WD?=
 =?us-ascii?Q?K2leAiimPE6iTjCFPwJ1fpzJ65ESds35MK/eRpbG5TYHk3ldHBVX7bhzISsf?=
 =?us-ascii?Q?vfR9j/8V2Pu1fKLpQCAY+GnyuB1uC8LlLJHuuRkwlY0M/lgMsU1tJMBEcITt?=
 =?us-ascii?Q?fJ4E0hSletXh1HDP/hyrVzNLlAq1Yx/dMJ561PGeG8atUEatup0N214ZgbeF?=
 =?us-ascii?Q?npDfX9vU7c4asWF451oB7atNyIEkXI7j/rjXkhpMZ45jqALloVZWo/9iPjGj?=
 =?us-ascii?Q?kvbaDGGjwpQ/HUNoxwdnAlt7x1RgZzlGACyBIfio3pEz/ZDUVnEeLTVDBA09?=
 =?us-ascii?Q?SDS9fduZIR+jlIwmwptK9NHDEs+BwmAXCcML0XgN+CXfsP0rxIrwCu3PUyIH?=
 =?us-ascii?Q?AcQxb6ELUxbYb+GZLSV8+wDtLfUz1RfREff5t2lvSotvILaYfjBBXooYC8zG?=
 =?us-ascii?Q?NsG3kUGLbfxGtwSKD98ITXxZbeNzytuNT4rrkQl4WwhcAv7IF5pJ5Znt6CRs?=
 =?us-ascii?Q?dw0wgXiH4DQdaOIdtXgqSpCLQuNCvaGtTp2ryN9YpiU9fefkaHDHVmDm/zuT?=
 =?us-ascii?Q?Vq28AbwykqCHMWrtEz1mxW7KwVASuQARCj3hBprvy4DNAMaDjTHluH/uIfBy?=
 =?us-ascii?Q?szxIo2xenhwAylkYn9E=3D?=
X-Forefront-Antispam-Report: CIP:216.228.117.160;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge1.nvidia.com;CAT:NONE;SFS:(13230040)(82310400026)(376014)(7416014)(1800799024)(36860700013);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Nov 2025 23:31:32.9464
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 2c4140a1-0e4e-463a-abae-08de2bb19a47
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.160];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: SJ5PEPF000001E9.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB6537
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251124_153148_801521_5677C5D0 
X-CRM114-Status: GOOD (  22.98  )
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

On Mon, Nov 24, 2025 at 07:08:45PM -0400, Jason Gunthorpe wrote:
> On Mon, Nov 24, 2025 at 02:43:58PM -0800, Nicolin Chen wrote:
> > On Mon, Nov 24, 2025 at 09:42:55PM +0000, Will Deacon wrote:
> > > On Sat, Nov 08, 2025 at 12:08:05AM -0800, Nicolin Chen wrote:
> > > > +		/* Put the ids into order for sorted to_merge/to_unref arrays */
> > > > +		sort_nonatomic(fwspec->ids, fwspec->num_ids,
> > > > +			       sizeof(fwspec->ids[0]), arm_smmu_ids_cmp, NULL);
> > > > +		/* ATS case adds num_ids of entries, on top of the base case */
> > > > +		master->build_invs = arm_smmu_invs_alloc(2 + fwspec->num_ids);
> > > 
> > > Although I can't point at a specific issue here, I'm nervous about mutating
> > > the 'fwspec->ids' array from within the driver, The array isn't allocated
> > > or populated directly by the driver and so I don't think we really have any
> > > business sorting it. Could we hack iommu_fwspec_add_ids() to keep the array
> > > ordered instead?
> > 
> > Yea, I think it makes sense to do it in the core, once we have the
> > data structure provided by the core as well.
> 
> I would be more worried about sorting it everywhere for every
> driver. I feel confident SMMUv3 doesn't use it, but something really
> old and embedded focused like tegra or omap, IDK.
> 
> So I wouldn't propose to change iommu_fwspec_add_ids().

Perhaps a different helper iommu_fwspec_add_ids_sorted()? Drivers
can choose to use the sorted version, when they want to implement
the invalidation array. And SMMU can be the first only caller.

> If you want to be conservative then the thing to do is sort the
> master->streams that arm_smmu_insert_master() copies the fwspec
> into. It just has to be sorted prior to feeding it into the rbtree.
> 
> Then consistently use master->streams as the sorted list.

How about kmemdup() an local id array to bridge betwen fwspec->ids
and rbtree?

Thanks
Nicolin

