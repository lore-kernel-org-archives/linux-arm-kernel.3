Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 28817C43458
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  2 Jul 2026 23:50:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:
	Content-Type:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=XP8NS1SBrjDxcUbOY7hTvfRrmYWW+k7OFWmRzlJwnao=; b=S7BLMwXueszyYuwsy33iXyeg7f
	onaxz79QR4bGH8/yhSOOncVqGmI7aMc2xTJ3P02+3A0EFEelmA62Qh6BIj1wO54X2D90Q/cz6DfGW
	gDZvRTGkmfxbVW/Okb/fUD4moGPdBd3cu63BZkdbXGT4mTxvdRnx60i4Uo7T8drjiwZ8/xaxepyI1
	vjh4grmtZsfClGurPXda8w7zbPmcebqy7WdCAt2TORvf/5i2GalUdgex9Jidy+DNc9qRWLa+krTpz
	IEc8UboDMpE9eDQ92yv6eytBwwBe7bgyN2mYcKe+vn0PurGbrdnz2Ms50vqnQw/lNgqJPqP2tYWD9
	sLa8E1rg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wfRAg-00000005l8r-2bPU;
	Thu, 02 Jul 2026 23:50:18 +0000
Received: from mail-westus3azlp170110003.outbound.protection.outlook.com ([2a01:111:f403:c107::3] helo=PH0PR06CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wfRAb-00000005l7j-1oes
	for linux-arm-kernel@lists.infradead.org;
	Thu, 02 Jul 2026 23:50:17 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=YnVc6qsTJmKPwoxZjxze1LbytSsOga5IVBcP/LqxZ0nCMM1uWlDnZyEDhiXhdRlYEzlS0y4/bnzP2Fr6KgLt9GiNebp8T7sdU6lW/cBFLupyUAuKugzyieqPoOgMcRrn7BuCB43pVl2K+YYjzAJ38ud5W1c00Ufl5qfdWX1bQU5bYV3jTecpxsNsriTq1yt2O/T2gbX+u94rwCuj8D8RL0W6tW/JJJnXv9Y6qRbOQPqvh/tPm15r+4aQtYeQNZcl1cigFwjMwC6SKE150F3BPPWJrZl9NkrEvWftSUZBgXnGTYLdnL6ujdaqBNAQ/QiAhPr12/pry/oRc0WiHX9jCw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=XP8NS1SBrjDxcUbOY7hTvfRrmYWW+k7OFWmRzlJwnao=;
 b=rol59God46SMVYzUwbBMc2HUb/PP7p8Nmjz2r1FcLohC32JJokJb7+Qs7x1qLbDwKZ5h1P80LEaBzEC97DPvuzJsHAi4I6Pev+EXYUngt5M7kh5eqW/7oQlKKncMi7q3InvNi+nKyeliCAKJRPHdsfAUGWvIK85YMW3REZ568DW0KayR8DWOEITfxAqdUY/aBROAH93J/0gpXIA3cucTsi1rg5E/OD8HikX0FFWszp3+u7uiDeA7Iwl4Usu/sxFSSx79fvibkyZi0c5cueII1x9xG0V8njv1BWGfxuJV9mql7uy/d0P+nccWq0iCOD/tsQovHhUgN0TBe49bzkyNKw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XP8NS1SBrjDxcUbOY7hTvfRrmYWW+k7OFWmRzlJwnao=;
 b=iLtragCfEg4Hkoz6BE5co1+H5TBaGZ8AKLxe/RCe5hJlpLNVAXlGlTqO7EhtJWUqWQPkHYWztShhZKqiE7BIp0Ap9BS2v9M+QTKdW4vKjoNvHdNtSmJHVgdzFM4wE80CZxGdp0W9qvKiAeoYTcBIaQFoXnDej6FRR8UFLbxppwslX0GGzS0oJn6UrMQT1D2+un53INlokjISli6BBkYAAtgjhOgU6YQ9Z36xAa5AwecyIjjjwWB1V4rtUK1fTow3Xgv897mNRqhRe9tsFt8XEGVUVWxV3gzggNNZmk7QVXJZvMCa9YNK2O8xzw5rFQKXlsW/ieedSiSLReoESekTIA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from LV8PR12MB9620.namprd12.prod.outlook.com (2603:10b6:408:2a1::19)
 by DM4PR12MB7744.namprd12.prod.outlook.com (2603:10b6:8:100::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.181.10; Thu, 2 Jul
 2026 23:50:06 +0000
Received: from LV8PR12MB9620.namprd12.prod.outlook.com
 ([fe80::299d:f5e0:3550:1528]) by LV8PR12MB9620.namprd12.prod.outlook.com
 ([fe80::299d:f5e0:3550:1528%4]) with mapi id 15.21.0181.008; Thu, 2 Jul 2026
 23:50:06 +0000
Date: Thu, 2 Jul 2026 20:50:04 -0300
From: Jason Gunthorpe <jgg@nvidia.com>
To: Nicolin Chen <nicolinc@nvidia.com>
Cc: Pranjal Shrivastava <praan@google.com>,
	Mostafa Saleh <smostafa@google.com>, will@kernel.org,
	robin.murphy@arm.com, joro@8bytes.org, kees@kernel.org,
	baolu.lu@linux.intel.com, kevin.tian@intel.com,
	miko.lenczewski@arm.com, linux-arm-kernel@lists.infradead.org,
	iommu@lists.linux.dev, linux-kernel@vger.kernel.org,
	stable@vger.kernel.org, jamien@nvidia.com
Subject: Re: [PATCH rc v7 0/7] iommu/arm-smmu-v3: Fix device crash on kdump
 kernel
Message-ID: <20260702235004.GN7481@nvidia.com>
References: <cover.1782799827.git.nicolinc@nvidia.com>
 <akPB6l-fuJUcg4a2@google.com>
 <akPX_N0P2EcI_jbV@google.com>
 <akPhuF9pAWaBXzpi@google.com>
 <20260630185942.GF7481@nvidia.com>
 <akUQj2pa1W-MekgF@google.com>
 <akUX3T3fIoN42sdM@google.com>
 <20260702144157.GM7481@nvidia.com>
 <aka7N6oLVq3CoBqn@nvidia.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aka7N6oLVq3CoBqn@nvidia.com>
X-ClientProxiedBy: BL0PR05CA0015.namprd05.prod.outlook.com
 (2603:10b6:208:91::25) To LV8PR12MB9620.namprd12.prod.outlook.com
 (2603:10b6:408:2a1::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LV8PR12MB9620:EE_|DM4PR12MB7744:EE_
X-MS-Office365-Filtering-Correlation-Id: aeca3b70-3b52-4035-5e85-08ded894a44f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|23010399003|366016|1800799024|376014|7416014|4143699003|11063799006|6133799003|56012099006|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info: LI4XVqDUp5eSobD9/0zogahZQXH5ltltD7ALMA72UEPXtZ66GIJ4IN7q8ypFK6cwx6ZzBxkIAO8zcESidU8x6kgbtmB0QBgiXsEwngFYhAQg9x8gGe5wXtLAXkXpDHv+HnjV912O51ksetXt2VQrdV4t3DFJLgbetSOZ41BXieWuCsq1d1NYaa2qFqA1hx3hBdiTW+w098DIieTzjQS4SbOqv+XBQZXlM+aQAJHO4DeJBloOxMWDSnAFiYzDJS/utDece7P+AMS8Q4LNYRIptn/YAVeoNFlq0j0kzWW8xxdShpbsFizlJ0A4/0Hv0x9iI6qMGh2x3Yac7DtQCc1/iAByCLZQrHnmMoc41MTSVkn/5E+OVANwSdlLB5YX6wf9UgiDkqvmvYvKwkoC29JIch5MdkUTBupMuiZVOhr6OKie6wchlO4vRPMGk8dh7ZXYTIEsMzr6i0ccOzLUnWvnz2xIIx7fXCaJQ2JtCGBu+jjvE5R8rkStpUH4eEtUrHE55Dxn5Rni5VqZuyaUpVZPiQsiAmYflHK6fEhPkWw9qLOEmMtBf5sJT1GHLg3IMsv651ystMJCC1fZJHl5ugZWK2OEP//qGocQrtTgvrPA6UevQRcZS8J77NEoqnNywAlAF8Ft63+JwIPuhSscbk2Y0UXg3wddoEzZQu/LrCRhQfg=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LV8PR12MB9620.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(366016)(1800799024)(376014)(7416014)(4143699003)(11063799006)(6133799003)(56012099006)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?9cCgkV1m2SDTRsXE9d+8axWNhdFNHKTyIQ9dfPl7g3hNdztFhjq9wVMbR904?=
 =?us-ascii?Q?naS7FXVQg2i4rhxdIDG/ZtrZ4QCNnP8/4sYQQ/BGkGy2IWjR3ery7K0dRlkY?=
 =?us-ascii?Q?qpTnnkRY4ZgIFBnBr1w3XRowODun5tYVssAGv++l7I6VT8Pt3nSW2ZVkng7R?=
 =?us-ascii?Q?0wXoMNAJK7ewN2/TcwTv5DeAmhUos44sPR9cxARZ4YVz318LoG2IFn1btkaN?=
 =?us-ascii?Q?ZyMKjSKPtPFxqVUql2ei1LB69QRHwal9zBQBczttj8VOvhp2XaK7XFiQLkSw?=
 =?us-ascii?Q?ZQTUsM3dbdjQgETx6J5Ifbwpin0k6f4Bop+7aKGsvlXKIy/A8d1587vHMwR+?=
 =?us-ascii?Q?S7wCYhrTm0dzH2wFmQYfg+0ny4t1d6Dgd/JMovREcSdd9vptweKAJrIvN/7B?=
 =?us-ascii?Q?zZQvtk8dM/7nuDwg9angvQU5OIkQic7E0zFvZ2C23sFsKcYDIu649+KQrV50?=
 =?us-ascii?Q?XHxS2ADqIuGJzLVW4xGFbIdQQ6hsNBN/xrRCBIPqc2uKBNAKFDmr5iPNGP/V?=
 =?us-ascii?Q?ellQ8rNo9cln+F0WcB4yrXQBpsli0fRioo+qWXXF5WTPC2eXunP1043c57hI?=
 =?us-ascii?Q?zvOpvJz7x4v75IKxZu9EjiLZfQ8EHiwzGZtNPdK5HWY0Yv7oSoUvrr+ZGopT?=
 =?us-ascii?Q?4ekbLwo1iPU//HbxdBnszJD5bd+EY3lkHObekXbHLV6GGI/lUVUL561VlkyG?=
 =?us-ascii?Q?wgqgWD4XKvE53ka/Xj5+WZROWIwx/2iDMZPLQSrF2iBJwzJgS2YibWZIuZm5?=
 =?us-ascii?Q?P+uMcygiLQo0CNm2d7bmH9d5SGNvzJrIfe2AqYg+lawIvWBpdkpy2lUOn0Bo?=
 =?us-ascii?Q?IK/drI4d7qCdVHmVqM/Tgg41UU5mHC/e/7uLOQPuIjy8E8qTd5j9zij7055q?=
 =?us-ascii?Q?raGg5Bkv6MMwekBIlqFj8mlrepsYbAthCJgf50WJiV9cqp/XHb/vDbtnBTjg?=
 =?us-ascii?Q?IDBH7WFDraQsH15PQ6M0KN7/y/sZ1fky1yNBjnI+j013keEvao8b0bliybN3?=
 =?us-ascii?Q?+LsmrGfLPL/oiu7sdjbfFFIApH2SKwXX7fPFdInEyZ7k6VkZ9msJdEQjMyQl?=
 =?us-ascii?Q?p6+1sVuMVe3QbT6VoTjdb8q7NFv30NrzvracPNCJz2BW9PtF+JF3qCgHO7DX?=
 =?us-ascii?Q?sqdotBXO1fcCTt+aJUlxfSXXXRV216rBm1716qg6mrlAhgubkbbFQ00DIXRD?=
 =?us-ascii?Q?C5MOOIJQnWuiOB/PV2hsVXyC3mTefLdqtbMqbUs3dkrEmACh9m5p+2mnzObS?=
 =?us-ascii?Q?WFIi2AngfUO4cxIkvCZIoN+7D/naEI5nAgzPlTIatYLA1krmjoNNePAy9XsJ?=
 =?us-ascii?Q?MAHq6UC0B3dtaGYVvwIKNGLwTiuVTB+Us9vXtf/8YVYSvcNo+AwYirMAPUqZ?=
 =?us-ascii?Q?1N1RrvBYKAtYdlAIVGNX1YoaR6riLCQtc9vuIKCFQvnsahfP2bRBNlWdEtRw?=
 =?us-ascii?Q?EHhgF/ApZoSBjCuYGmCuQ1X3Rbcx1DDeHbWlbAoHesQmiAQoexZ9hCf2Op7T?=
 =?us-ascii?Q?uAhHkh5GqsL5q7pNmt7ImlKkayhgWE2hgZyVqOj+Li5+2zELa2y2oX8D9Nuf?=
 =?us-ascii?Q?SONZC0u5Ud6C/9Iyk5PgGW9Nr5Zi1gidcxSwYRAC3tzPqaqnJG/AzmW5Tjgf?=
 =?us-ascii?Q?yKjo8mG6CivB0g1gi+rrphMbpQ7wi4VtE46dIqxjx2EoLgDfsKN8+nILcni1?=
 =?us-ascii?Q?bcKU/DFD51DBA/tn2AesPoUV/KQBaXAWvipitEUYZDmMtwfg?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: aeca3b70-3b52-4035-5e85-08ded894a44f
X-MS-Exchange-CrossTenant-AuthSource: LV8PR12MB9620.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Jul 2026 23:50:05.9914
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Zp3fZcfc4LCozAxv4KKe/wp/5yUzjILEHyV85v342zM2fNCJ/qtk3oIomlqux17b
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB7744
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260702_165013_473934_0C121676 
X-CRM114-Status: GOOD (  25.83  )
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

On Thu, Jul 02, 2026 at 12:25:43PM -0700, Nicolin Chen wrote:
> On Thu, Jul 02, 2026 at 11:41:57AM -0300, Jason Gunthorpe wrote:
> > On Wed, Jul 01, 2026 at 01:36:29PM +0000, Pranjal Shrivastava wrote:
> > 
> > > However, I agree with the overall problem, i.e. IF an active device
> > > unmaps the DMA addr after the transaction in the previous kernel, 
> > > (with the SMMU powered ON) but the TLBI was missed due to a crash/panic,
> > > Any new DMA in the new kernel may alias onto a memory in the previous 
> > > (crashed) kernel, not the kdump kernel.
> > 
> > It looks like there is an issue in this series, it isn't doing
> > anything with the VMIDs.
> > 
> > The VMIDs that are in-used by the adopted stream table have to be
> > removed from the idr as well (and similarly for ASID if we don't have
> > VMID HW support).
> > 
> > Then the VMIDs that may be dirtied by the prior kernel remain isolated
> > and are never re-used by the new kernel. When the new kernel wants to
> > do DMA it will replace the STE with a new, clean VMID, and there is no
> > problem.
> 
> I see. I assume the reserved VMID for the kdump kernel will be a
> clean VMID (!=0). That should guarantee different cache tags.

You will also have to change things to allocate the kernel global vmid
from the IDR, it will usually be 0 but not for kdump. Then you have to
find all the places where the 0 is implicitly placed and put in the
actual value.
 
> But, do we have to scan CDs for ASID? I wonder if we could limit
> to ARM_SMMU_FEAT_TRANS_S2 only, as this series does not memremap
> CDs at all..

Yeah, I would limit to S2 for now

Jason

