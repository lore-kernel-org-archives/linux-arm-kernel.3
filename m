Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 48327C83F1A
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 23 Jul 2025 18:08:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:CC:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=QoujWxgHwiTQaGaaJLZ+B18hOTaPRaC4LK5Ejbdp9UE=; b=oP8uPE5IiXypk5nr/B9JWveYvr
	ONl9ehFjbILzxvX48QkB9ySmZPNRFbCGkvMi9N9JLjApUlw1td3gJ+25J6rwvUsqONY4rvPqGTlim
	mrynO9CpjSWLzUHSAgs8jTqgVAFlBXd/QnNRJlFUSawdqsDtPRqmzZgvGmkAC7WryPFJiGpMunCWY
	jg+VnFmi7UCi9NKge6hTQzd2udYUHJD/argtKEwIOkWCBjz8pioN0I7QSx7OP8xWFFPxWgOPEe/85
	7/TLnuk5j0Q/Pj6rkx3PO66Be5EvW8t/4VSaLDjh/WxdtqOkrsSQ8jSz4ofQR0ge8pWLnNJ59+Wtq
	Zbs9Kb+w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uedtC-00000005iXq-3YXQ;
	Wed, 23 Jul 2025 18:08:26 +0000
Received: from mail-bn8nam11on20600.outbound.protection.outlook.com ([2a01:111:f403:2414::600] helo=NAM11-BN8-obe.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uedql-00000005iL0-45s0
	for linux-arm-kernel@lists.infradead.org;
	Wed, 23 Jul 2025 18:05:57 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=F3RPAEoKs9Mx53ajDe46En/S2OBIWKhfpyJkUmWV4GyQSd/WERXS6xzJV0bf6yeGGOeNhMe5IsPqEm0xAHfpDOhJOqLlWrBFE9yrFaGyYes3DcRQoZuh7ORRbGCnwkkw5JjieC8nTMq6yaYlNZGgFY9c5D/UNDWX5lqqhfGxoJSL1TGxQdwwj4ZJpOVOqwykwzzkdsyTvHycDopHIkFM4pQBL/g42cS2R79HR5A2ODUEsr4mZfwV6o3pfBTA+3jrV+l5ssOJQK5dAZOxh/H4NdvK5u624hq13Bmx9H7Quk6Ubescm4ctUwl3zmrf0qkUKdItZvnFeAtK1xvUA6qaTg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=QoujWxgHwiTQaGaaJLZ+B18hOTaPRaC4LK5Ejbdp9UE=;
 b=lp9HSMquP3mtX3CeRJcztSqz2CCZ6I4Xxcye0jO+63FbNGCJXYhamaPN6Ez4BIva+T6KOeLAIXl0FZ8Sqijn+4nDLpkJTwxfthjG3JURCqyoRTOMYhrjliwMSC6qNfOP7sqnA/oCeOfNYos+6QBYSFyRsDrCa7M9RkB+SHTrkKnDC4ViO/CNdC5hroaIuk64l0kOEDk8cWuO1J1GcuG2k57LC/UqxMbkS85Oku3tJ2HcN8RrHuaeHBQ7+q9enVDv/tzMpJfXvBs+tDVxvZoJLrAr8AXreCZSre74mMtmWlCbCLrPkDcv4u3iBSjQTuxLSYGCG9HsVikedQYOQ3fe7A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.161) smtp.rcpttodomain=google.com smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=QoujWxgHwiTQaGaaJLZ+B18hOTaPRaC4LK5Ejbdp9UE=;
 b=Y7Sy+2NRPAo7LAY60CY8XkmuEnOnT12V9TLDH5hSCSVBxKCjxY/gc0RzUIyltGAPnxvn8SZN1GRqHJV5AbSY9Ya8tnRCwJSzGv52p+zi8EUQkJMCEv/fBcn3SaBs5OmTOuDWOypwPl94z0eWTNrvptQbI/IYu4S4axQ4cf14JX6dt04GDjmWM9GT8gAh7p8kq5I+NklTcEmJB8W+erlGtqwdUgdTOVIGrfJLFIHbuJGQKaDBZv5M5rADj+3/SMFE2iKdjisMomKsM9dJZNCF/FgpyDb2Jzm2DdD1t8BYReSxgjPkvzXJSd/a8DQpRKUeVOvanzzkxh0n47nTMxVCyg==
Received: from BYAPR07CA0030.namprd07.prod.outlook.com (2603:10b6:a02:bc::43)
 by LV8PR12MB9263.namprd12.prod.outlook.com (2603:10b6:408:1e6::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8964.21; Wed, 23 Jul
 2025 18:05:49 +0000
Received: from CO1PEPF000075F2.namprd03.prod.outlook.com
 (2603:10b6:a02:bc:cafe::76) by BYAPR07CA0030.outlook.office365.com
 (2603:10b6:a02:bc::43) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8964.21 via Frontend Transport; Wed,
 23 Jul 2025 18:05:48 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.161)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.161 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.161; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.161) by
 CO1PEPF000075F2.mail.protection.outlook.com (10.167.249.41) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8964.20 via Frontend Transport; Wed, 23 Jul 2025 18:05:48 +0000
Received: from rnnvmail205.nvidia.com (10.129.68.10) by mail.nvidia.com
 (10.129.200.67) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.4; Wed, 23 Jul
 2025 11:05:28 -0700
Received: from rnnvmail202.nvidia.com (10.129.68.7) by rnnvmail205.nvidia.com
 (10.129.68.10) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.14; Wed, 23 Jul
 2025 11:05:27 -0700
Received: from Asurada-Nvidia (10.127.8.13) by mail.nvidia.com (10.129.68.7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.14 via Frontend
 Transport; Wed, 23 Jul 2025 11:05:27 -0700
Date: Wed, 23 Jul 2025 11:05:26 -0700
From: Nicolin Chen <nicolinc@nvidia.com>
To: Pranjal Shrivastava <praan@google.com>
CC: <jgg@nvidia.com>, <will@kernel.org>, <joro@8bytes.org>,
	<robin.murphy@arm.com>, <linux-arm-kernel@lists.infradead.org>,
	<iommu@lists.linux.dev>, <linux-kernel@vger.kernel.org>,
	<linux-tegra@vger.kernel.org>
Subject: Re: [PATCH v3 2/2] iommu/arm-smmu-v3: Replace vsmmu_size/type with
 get_viommu_size
Message-ID: <aIEkZoTOSlQ0nMKd@Asurada-Nvidia>
References: <20250721200444.1740461-1-nicolinc@nvidia.com>
 <20250721200444.1740461-3-nicolinc@nvidia.com>
 <aIDlsUvF2Xbdelvx@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <aIDlsUvF2Xbdelvx@google.com>
X-NV-OnPremToCloud: AnonymousSubmission
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PEPF000075F2:EE_|LV8PR12MB9263:EE_
X-MS-Office365-Filtering-Correlation-Id: aa1fb73d-a8d6-4592-bb3e-08ddca138d8a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|82310400026|1800799024|36860700013|376014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?4Crk56w/cjTpY5MYue3xKYyPH2yHZaL6Jt/jmq5Dp4qSjL2YSwPTVnvJArv8?=
 =?us-ascii?Q?jh9Jk/74WSEoePNMadhWY00U6gW2eOtLAyXTWyjjjAJXE71f/yHChTONwmJK?=
 =?us-ascii?Q?/ShkWRYph0fgz0rPHOZ5R5mmZ5KGfiSqDhvKiqmiQUB9xQMBA9Q5/x7urges?=
 =?us-ascii?Q?QUxnQ9uDUHFnVnoc1jCXVntOwsOCUGS5cIN0dA0uW5EESqtfRMWSHSmbRtpF?=
 =?us-ascii?Q?HCsJrXweWCzxEuc5n+Hd/llTCwwz5X+efj7EGGfExRZr84aqaX3CCdWbiWX2?=
 =?us-ascii?Q?78+B0OmL5SQ9YUdAsC74EyCns+evyE1Z0uG+xwazoc/LYifMG7nmAuU3WUwM?=
 =?us-ascii?Q?ksv9MsNiTUgY6yZfdbkN0dusXjxFJkFQYi7ubtHu5PXmOjdBKTHCfGObr7b7?=
 =?us-ascii?Q?Bl9FlWq+DnpYRZnl1WJTrGL/Y94KfqZfTWy24OJneunbkyTLztjz7inM6sR7?=
 =?us-ascii?Q?yjNNErwiL9nuUZEObksOIbALBytoj9yJsDAal0ZoD+ARluauO7kLb6HGU2TH?=
 =?us-ascii?Q?TROADObuE9zbMOsOV7HH/IFB9FQ1f8V44TCW5rjTtVCM62DghZQHqbhe1OPN?=
 =?us-ascii?Q?Z4c/NTHDGOmZq8pksXZYs2F97Abb/QZseMyqHILAOrvIuYGWuxqyjKUgj6U7?=
 =?us-ascii?Q?wJ0rYpSfkBxr6vdI6WWnOvxDb8FP+yem5MW+SCR7w3/hj34ZqNMhCroHIf6d?=
 =?us-ascii?Q?qY1pXUd8xExygqBBWGBPrwninYqrUA4hI23uzlIuY1ivh/JJhQRBXw495h0U?=
 =?us-ascii?Q?w55Jm49smYTxgG1v0/zAxrJWoc4h37sgecOQjASAXnZItKjHRqU7XaWMa9HH?=
 =?us-ascii?Q?KxwEiboK4Y0wqn9wh2gvVQ8XnK4m5lEQsRm3IRi40HZTyoSTp/P8l3g78OFh?=
 =?us-ascii?Q?bLfMo3uMx0akKESJKukhlSInd2MOd+cypf7hfT5HgoBToXdpC+LBMiILnfbC?=
 =?us-ascii?Q?NJ6K4ZyD9D4imZIhITSoaD4NTiZ6zOZXWju+GyxURNMqRErh/c3GZJw9zoyd?=
 =?us-ascii?Q?8dpoCxUvbnI3uOszk2XeJRebsmaMpEQa6xKh/YSkdM32Nlk7YFJa1AerguIa?=
 =?us-ascii?Q?RrYlrtJDxEcXDFVfQCn5dDEsxn5HypkR99JLnU1bhAgpIZwxxTs9ZDrZ5Hcp?=
 =?us-ascii?Q?035XdjperptQIAAkyFkMB8gsWh/OpMDqx2+5waezbfVkY5GXd6COcqW5kUbJ?=
 =?us-ascii?Q?SAkt/JJSFNMkfB/y/U/J9K+49tF7udORLYWiVZ3g9mFduYCpfWsrtgj5IEjW?=
 =?us-ascii?Q?mV4sHZNYc5VxJmWdSWUko/eqHhRtmxbu6BLfQsVjpZBQWgoPD1Dn/3CCdxE4?=
 =?us-ascii?Q?R1V9yL+DMrgicXpGJ6mXRvBdgFV1ETwuB673lpzyYBPYK65m37diARZbv0xs?=
 =?us-ascii?Q?vuKkaKF370p9hnW3Zbac4yYRWVC7hE1U7Wi769xz5W4N+BA+ha/FczH3ddKo?=
 =?us-ascii?Q?ED8FCn/j5KRAHCXQ3fphBmVge5KJCIdvQg68FZuAvbBj3/8MqtZd9kaOS2Xl?=
 =?us-ascii?Q?M6ESOCxAV0s57XeJJJuFwqEPPXDVU0uKuHTll2w+oDfJeZhG65M+zeUYvQ?=
 =?us-ascii?Q?=3D=3D?=
X-Forefront-Antispam-Report: CIP:216.228.117.161;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge2.nvidia.com;CAT:NONE;SFS:(13230040)(82310400026)(1800799024)(36860700013)(376014);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Jul 2025 18:05:48.3272
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: aa1fb73d-a8d6-4592-bb3e-08ddca138d8a
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.161];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: CO1PEPF000075F2.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV8PR12MB9263
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250723_110556_032767_48DAFF4A 
X-CRM114-Status: GOOD (  18.81  )
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

On Wed, Jul 23, 2025 at 01:37:53PM +0000, Pranjal Shrivastava wrote:
> On Mon, Jul 21, 2025 at 01:04:44PM -0700, Nicolin Chen wrote:
> > @@ -1273,6 +1279,10 @@ tegra241_cmdqv_init_vintf_user(struct arm_vsmmu *vsmmu,
> >  	phys_addr_t page0_base;
> >  	int ret;
> >  
> > +	/* Unsupported type was rejected in tegra241_cmdqv_get_vintf_size() */
> > +	if (WARN_ON(vsmmu->core.type != IOMMU_VIOMMU_TYPE_TEGRA241_CMDQV))
> > +		return -EOPNOTSUPP;
> > +
> 
> Nit: I don't think we'd expect a call to this if the vintf_size returned
> 0? I see that in iommufd_viommu_alloc_ioctl, we already have a check:

It's added in the previous patch where I explained that this is
to detect data corruption. When something like that happens, it
would be often illogical.

> And call ops->viommu_init only when the above isn't met. Thus,
> if we still end up calling ops->viommu_init, shouldn't we BUG_ON() it?
> I'd rather have the core code handle such things (since the driver is
> simply implementing the ops) and BUG_ON() something that's terribly
> wrong..

BUG_ON is discouraged following the coding style:
https://docs.kernel.org/process/coding-style.html#use-warn-rather-than-bug

> I can't see any ops->viommu_init being called elsewhere atm, let me
> know if there's a different path that I missed..

I see it as a precaution that should never get triggered. But in
case that it happens, I don't want it to proceed further wasting
precious HW resource given that this function allocates a VINTF.

Nicolin

