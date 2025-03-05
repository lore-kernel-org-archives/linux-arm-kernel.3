Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CCEB7C282E5
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  5 Mar 2025 18:25:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:CC:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=36bzFRoYRH0lUnIHrd5p1iO7BgaOPxY9r0v0iQq/ia4=; b=q6VjWVnjyZX0RbIArtpsKYpZDK
	xf9flCBjg/fsw2A/bCkcToffu2Wsg+V2sj2q1S2Ux+pY8H81rBU8xWPu2LOJtOtSZZOKY/QqgkaPY
	Q+b9/ntuHeoA1lPIE+/Q28Hh7Onbpd4CT2aMkYhg53/ynPVvR0ClM5+ZUL8quDzd71z6dotIRnTq3
	gOCHKR/9xx6inWJhX7lF4ffTOnEfP1klRWyd8EPXwAN7IP01XXBPQ36x6bVJ7REs97ZFefYTVQD79
	jbV573unKhHhqOawnKtqfsuox5ROOsuv0TGQzGL1CuF2TTiyG+R2In4uuiozlvYEC3dn89+xCLywB
	HngP8vwg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tptRA-00000008vY7-22K4;
	Wed, 05 Mar 2025 18:25:44 +0000
Received: from mail-mw2nam04on2062f.outbound.protection.outlook.com ([2a01:111:f403:240a::62f] helo=NAM04-MW2-obe.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tptPZ-00000008vNI-0UcM
	for linux-arm-kernel@lists.infradead.org;
	Wed, 05 Mar 2025 18:24:06 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=VKlbAPdITCqOxAf+P/hE4msNk4NjLZoKQE6hPbnVk3O1/uWUCoYSBJ7CLnVGtFxoYXv3JPnf76zSzNOV6wbOECUPoQBUmbdUpXqdEHGL4euXu74+TicTfas1A1U39DjFGpV5L44Db/PbxVwOsI+1KumeMVIZEFfSPqim8LF297PObUYVrap15kXdw6f6lZsn5Q/VASUxNMCJBnR+ZDFaRpMg6VeU2CLCFPaWw/OdMGfzdHw0Q0DuHQmgmmrgXUX2k32EVIBp0lFxrVmB1+KDh6POigu2Nm9FV2QT01Y0zAVU0oL7Fz4V7rnyylXg7+uOZr36NlGhSfmidwKAzwcgTg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=36bzFRoYRH0lUnIHrd5p1iO7BgaOPxY9r0v0iQq/ia4=;
 b=eGuVwIphj0pBYxLRLQCgCJRMHee80rASoVC2wsfl6vUWcIQucqVb0NhjjXF6PGnRWLpI5FMK7iRU6tdeTtmukK1Oh6Gpteuc5BE5p68RoCmA3S2ZUg+Y9OdBuy+puJI3qCECeEHlm9zF6X255Ju9Kb77HzSClchug/ROAcm4sAU5ikAMpiA/yyaOasp9wuW8zw49e3aJChB/0jUGBnkxE5PbKZygXNFttK8PzhgQZBnCfoeggmkSV005ekC5w0vsOoCUj7LZu0aBI1iOr8gSsYP9lz+S8dn/ZXftrCgNXnmGccXAVHF2XYxR88TZFXZJ3gNDWUVchLKYfK50srzn4Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.160) smtp.rcpttodomain=kernel.org smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=36bzFRoYRH0lUnIHrd5p1iO7BgaOPxY9r0v0iQq/ia4=;
 b=SEqMbH2KHs9IgxTVcK7yX8NMpdGVZTVL+H6ASc0qWn7FzgfDGLmuIyWrO3i6GQ6cqyuRY4XqvHIY6fSq7Iic4+6gpcVqte0NQImmWnuS6O1ds3cHkhfJbIea3GPYCoGjhvaTXqvIvtKmPIYV3SYqbbHQQn8j+Ox4A2NqU9kn/13jDxYsfNZ/l5+rFZfLOaETbDzKRtSCPI34UL7zio4V+rCQwVCexmfyy4jHEUAOXCzwpSWCGpjTQd2h38Xkyem0moVWsOOtjpyGmo8nMN9sri9vkYHhTLHFS9VdvIM594xnEf7dgKstO8RAgp14ACJDB4NYsE1JxkjFR3Rt9SVuEg==
Received: from MN0PR04CA0001.namprd04.prod.outlook.com (2603:10b6:208:52d::35)
 by MN0PR12MB5905.namprd12.prod.outlook.com (2603:10b6:208:379::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8511.17; Wed, 5 Mar
 2025 18:23:58 +0000
Received: from BN3PEPF0000B06A.namprd21.prod.outlook.com
 (2603:10b6:208:52d:cafe::9b) by MN0PR04CA0001.outlook.office365.com
 (2603:10b6:208:52d::35) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8511.17 via Frontend Transport; Wed,
 5 Mar 2025 18:23:58 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.160)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.160 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.160; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.160) by
 BN3PEPF0000B06A.mail.protection.outlook.com (10.167.243.69) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8534.4 via Frontend Transport; Wed, 5 Mar 2025 18:23:58 +0000
Received: from rnnvmail205.nvidia.com (10.129.68.10) by mail.nvidia.com
 (10.129.200.66) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.4; Wed, 5 Mar 2025
 10:23:39 -0800
Received: from rnnvmail202.nvidia.com (10.129.68.7) by rnnvmail205.nvidia.com
 (10.129.68.10) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.14; Wed, 5 Mar
 2025 10:23:38 -0800
Received: from Asurada-Nvidia (10.127.8.12) by mail.nvidia.com (10.129.68.7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.14 via Frontend
 Transport; Wed, 5 Mar 2025 10:23:37 -0800
Date: Wed, 5 Mar 2025 10:23:36 -0800
From: Nicolin Chen <nicolinc@nvidia.com>
To: Jason Gunthorpe <jgg@nvidia.com>
CC: <will@kernel.org>, <robin.murphy@arm.com>, <joro@8bytes.org>,
	<linux-arm-kernel@lists.infradead.org>, <iommu@lists.linux.dev>,
	<linux-kernel@vger.kernel.org>, <shameerali.kolothum.thodi@huawei.com>
Subject: Re: [PATCH v1 0/4] iommu/arm-smmu-v3: Allocate vmid per vsmmu
 instead of s2_parent
Message-ID: <Z8iWqOBga8Xdunac@Asurada-Nvidia>
References: <cover.1741150594.git.nicolinc@nvidia.com>
 <20250305165452.GY133783@nvidia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20250305165452.GY133783@nvidia.com>
X-NV-OnPremToCloud: AnonymousSubmission
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN3PEPF0000B06A:EE_|MN0PR12MB5905:EE_
X-MS-Office365-Filtering-Correlation-Id: 8cdec9aa-bbb7-40ef-018e-08dd5c12e550
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|82310400026|1800799024|376014|36860700013;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?3mclzFo72Gvt1Uu2hmZwWf5omGLR2PjH8arp+TImYMuDIWgyaWV5ttL1HoXj?=
 =?us-ascii?Q?8fAocu+tT+2NfGDvvKZYefu495Hi63JSRocu/J3sRVvYzk0Z6qv0Jahi4bRr?=
 =?us-ascii?Q?i9anQetyCN47GwiOmXdy8/n6xK3cqzuQ4EWtia7dMkHg+GcWsA5CSAl2ttlp?=
 =?us-ascii?Q?dLO5YcSJYAKTrediZAKR7JieiBkwamWkTHggT6a+bClvu+OMnVrT5Fhib7gl?=
 =?us-ascii?Q?0ifqMTFFVISDekNlrSLrVjuruOKzXRYkl1hYO2JXgBNE0SCUO0qQm/Ygz6y8?=
 =?us-ascii?Q?liBZU0Lsf7beJ+ACpoRi54pn8aQfOODCn7XN905UDLU8gMK90AFcc+A5fx/j?=
 =?us-ascii?Q?+pZFD/99+Atan+XN2IygwYNDHEHe8RN53i9lHGq5qnYnhLILHEdiyTqYAjCt?=
 =?us-ascii?Q?6BmTANagEKrtaZCJfwaYe/XOX8E9SyngnJC5nSY/I5tTQFbVRFmOJTtlkavY?=
 =?us-ascii?Q?bzNwQ9hxYkP4KbdJ77/9Vlpz+aw15KexE59BuhLj2VlSkJKdsbxWqnj+4s2C?=
 =?us-ascii?Q?zWBcc6feNWgqtTPFJziC7x5tcn7Rjajvd0jsL9FeSWUitqhpcRnu8g3Yvr5W?=
 =?us-ascii?Q?nDVicb2iI0086/lVfT5ixUo1kneiH260EsPbe1nhjKEQTMXbbCHTLkXxjc34?=
 =?us-ascii?Q?VDrgkEJQJAXr7DF8FGv6Hh3bMrOjFk8FkGydJvEmpon41xazC5Ps0Xm7/RZV?=
 =?us-ascii?Q?PRrTWLTAqZipk9zfT413eO3yNmNC0TbT4kC3nyaZPDuz5Ttt85PZ9nNlGE/p?=
 =?us-ascii?Q?jDyx6TaqYm/HPjBMs28JpkouMmGOqQtDFgMkCHh6+6zMqz1f8xDqVeIykacA?=
 =?us-ascii?Q?Vw2tNqY9CzXtqIX5rQ0Qe8oe0qKBXspA86dcGbs7ysSgqbgMzpa8uZ75M+0h?=
 =?us-ascii?Q?qMmDLV68zSiZGSV5vXhJ260/Qhgm0/Q5P1ko+b7G3JTNXL6Ykoxezffv4JIn?=
 =?us-ascii?Q?fxgAr6+/YRKAXDAFE973WCXdSQrlp2zNGG6/KgMjcRuK1u8mmG1alevHH8u6?=
 =?us-ascii?Q?VB84GWKjIDu5bX6AcUlDyy8dTX/pShsGNzv7asoCaRo9MyCm0xJ7nmOC9sgx?=
 =?us-ascii?Q?lK2saxgW2AMPCvZukQatFUwmQkwZx3BSgMr6v1JghFjpDrbYPM8vNQ2Tm/4Y?=
 =?us-ascii?Q?iyZAz/ALFkRxjJVoxAuD9X6YiPLMOKOie7NpIB1Gz+oAWjryFwlDSREe2/g1?=
 =?us-ascii?Q?nZFnUQaf3wAmQOsBs/qQyXMxfSPsIQI/3TwLFcMU8gZK0glCtSeuD02DoCB9?=
 =?us-ascii?Q?ZJq5Zj83NyNDlGTv30r8518iKmrjkc9r76J/M1aE41ChVGEL6lC/+quGXpP8?=
 =?us-ascii?Q?buQTtL6kOPgd237Ntvzm814ETzDJGJewrPRYiT18hJ4K9LYt9B278Z6jF5hD?=
 =?us-ascii?Q?/J3aidwHtb+Odf0IYikddttsVR/c8crCKygnAB0hexBPMXmVhdD7NMBpEGjE?=
 =?us-ascii?Q?5ScFHSQ8edH3vagAWYs6SW89+fcrIBx+MhEeSlUKOH5JBPqD2xI2pA0Vw+Sc?=
 =?us-ascii?Q?xqUuWFDgpMgW94E=3D?=
X-Forefront-Antispam-Report: CIP:216.228.117.160;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge1.nvidia.com;CAT:NONE;SFS:(13230040)(82310400026)(1800799024)(376014)(36860700013);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Mar 2025 18:23:58.1464
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 8cdec9aa-bbb7-40ef-018e-08dd5c12e550
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.160];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: BN3PEPF0000B06A.namprd21.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN0PR12MB5905
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250305_102405_169874_097C8C16 
X-CRM114-Status: GOOD (  16.43  )
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

On Wed, Mar 05, 2025 at 12:54:52PM -0400, Jason Gunthorpe wrote:
> On Tue, Mar 04, 2025 at 09:03:59PM -0800, Nicolin Chen wrote:
> 
> > Have a pair of patches getting the functions ready for the vmid migration.
> > Decouple the vmid from S2 parent domains and move its allocation to vSMMU
> > instances. Note that a regular S2 domain (!nest_parent) has to retain the
> > s2_cfg and vmid for non-nesting use cases, if the SMMU HW doesn't support
> > stage 1. Then, an S2 invalidation has to be iterated for all the vmids in
> > the vSMMU list introduced in the S2 parent domain.
> 
> I was planning to also fix the S2 to be able to attach to multiple
> IOMMU instances at the same time as getting VMID to the viommu.. It
> doesn't quite make sense to me that viommu would allow multi-attach
> but the normal cases wouldn't. Did you find a shortcut?

Hmm, not quite following the question. You mean vIOMMU attaching to
multiple S2 domains?

> The main issue here was to do this without degrading the invalidation
> workflow and harming SVA and DMA API performance..

I see.. The ATC_INV and TLBI_NH_ALL will be increased for the shared
S2, even if the S2 change is about a device behind one physical SMMU.

Thanks
Nicolin

