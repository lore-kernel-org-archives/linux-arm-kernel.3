Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A1AB0C021A4
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 24 Feb 2025 22:26:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:CC:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=FoYoG7UmIrw7C7LcYpxyi0Q+9LRtm0iYJgdTNAM3uVA=; b=if1Le6lc0bvdHBn7kIOuRF66X/
	rT0kruQQYsYaqGKtJK5tZ7XhEx/S1XU5hM4bhbyHB99usxHvO+vfel2d/d/gc5eFQSqdeV2p31VpO
	HXQSbY3l79BZDG24LNrkR6TDET7A4AHxPpQjS4grIwvavkZNmBSfSxlLXIZCiZVd+ZT4RD2t7TdmM
	Kn8mtHjFAGvNfq7pcGoCMro9NYTMX8wGQOny6Q6okMxiYHRJ6H6lZM5yh4c5rgKYWZLXNJ9wwnoc7
	Zss+Dn3OF068cOFC/OUYPXmX9JGmCT8aEWRpNJZbtKVNitN5L2bomo+0z1lJBwg2+Lmhbo8FqGtOl
	RJ2PrkKg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tmguS-0000000FMpI-46Ik;
	Mon, 24 Feb 2025 22:26:44 +0000
Received: from mail-mw2nam12on2062b.outbound.protection.outlook.com ([2a01:111:f403:200a::62b] helo=NAM12-MW2-obe.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tmgsx-0000000FMUx-0w7y
	for linux-arm-kernel@lists.infradead.org;
	Mon, 24 Feb 2025 22:25:12 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=QW1RQQSQ7JJOpDd6RGyaPXYn7pZNL2mG4sZDKdTImz8LRyOFJQIOQV/vtMTVNudOtnEzAKHthTqx3kk8DaFPTsb/NCkjhE86s598l9NVPWB1xTNI6IFq3FEbQOxZzPtZY2wkP44wb7scARd8eMWD576hhSEpdjROcCKKFFToTT9RQ/cCBG8l0H09qHLBSkGlX1KluIsO/PVUCgSRX4KEDE0SS9JW4MiWe+1/+D4tarLPR4niDe1dPF8f2gymb/k/xl9knk3Jt8tzQRyDsistXzlZbG84aR/bM6bsgCzrjuXdoFrDd3VZnkbLi8UJnueXWS3FcWjkTqpxM8rqm29qgw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=FoYoG7UmIrw7C7LcYpxyi0Q+9LRtm0iYJgdTNAM3uVA=;
 b=kk6pKLTOSPNFlHrKe6w/G+yXrzzItu4o3QLjU/zNHEspmOI0s8BZV2zb/1sW2KCyQDhMdINtciZHnY7sqt8MFOpc685UsKB67zWnrNEerzWoOfdOxMUs172m4p73wyuq9P+QpkghflbxpC+gjRRLLw9Joij+bx3WSRqgADeODMGArbU+PFQFI/juQuJoCZER67/Jv3OGkiVtiy9P/T/hRs/lxIyJ10lSJ+cDAjUBfl7c5mqDpsmH3M1kUFHRZ9byjxGcwo/qHsw7jJ/6LC1WmAiYNzDPfOtktwWvwabebMUNneGAePWUSrcKVYDnvH6/sE61Yj08uEM9EtS3V5DIVQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.118.232) smtp.rcpttodomain=google.com smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=FoYoG7UmIrw7C7LcYpxyi0Q+9LRtm0iYJgdTNAM3uVA=;
 b=mFpHnqGEmBf4saGFSrgHz0kZ1CZvdHx/hHqD52FtQPstNiBRxbisIz6Ww7un4yx2WcHIo9H45DX+auDHwH6KH55a7XafspFaOXFEFbFtHgGlMRtgkWHX26i56Pqm3OG4eu16fFP3+gid6WWyFTD0Qy5AB9V2JUN0Mn60/IaROnCTyA6zRciEXx9HU17aEiAs9iUtg/2xrSpSRUu9jApr4U1yqxTkNZA89C0nBIn2E9Du06a5DXG/UvXgclmPWhueKallHLb3f601OSpVgzRT1QGe/OMWqYAIAIt/gg3ivyQ69JVsYDmBBELSr+y5Zi15rxd0UBIn7lnXLVtrX7ji5w==
Received: from CH0PR03CA0308.namprd03.prod.outlook.com (2603:10b6:610:118::10)
 by DM4PR12MB6208.namprd12.prod.outlook.com (2603:10b6:8:a5::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8466.20; Mon, 24 Feb
 2025 22:25:01 +0000
Received: from CH2PEPF0000013E.namprd02.prod.outlook.com
 (2603:10b6:610:118:cafe::82) by CH0PR03CA0308.outlook.office365.com
 (2603:10b6:610:118::10) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8466.21 via Frontend Transport; Mon,
 24 Feb 2025 22:25:01 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.118.232)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.118.232 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.118.232; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.118.232) by
 CH2PEPF0000013E.mail.protection.outlook.com (10.167.244.70) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8489.16 via Frontend Transport; Mon, 24 Feb 2025 22:25:01 +0000
Received: from drhqmail201.nvidia.com (10.126.190.180) by mail.nvidia.com
 (10.127.129.5) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.4; Mon, 24 Feb
 2025 14:24:52 -0800
Received: from drhqmail203.nvidia.com (10.126.190.182) by
 drhqmail201.nvidia.com (10.126.190.180) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14; Mon, 24 Feb 2025 14:24:51 -0800
Received: from Asurada-Nvidia (10.127.8.11) by mail.nvidia.com
 (10.126.190.182) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.14 via Frontend
 Transport; Mon, 24 Feb 2025 14:24:50 -0800
Date: Mon, 24 Feb 2025 14:24:49 -0800
From: Nicolin Chen <nicolinc@nvidia.com>
To: Pranjal Shrivastava <praan@google.com>
CC: <jgg@nvidia.com>, <kevin.tian@intel.com>, <corbet@lwn.net>,
	<will@kernel.org>, <joro@8bytes.org>, <suravee.suthikulpanit@amd.com>,
	<robin.murphy@arm.com>, <dwmw2@infradead.org>, <baolu.lu@linux.intel.com>,
	<shuah@kernel.org>, <linux-kernel@vger.kernel.org>, <iommu@lists.linux.dev>,
	<linux-arm-kernel@lists.infradead.org>, <linux-kselftest@vger.kernel.org>,
	<linux-doc@vger.kernel.org>, <eric.auger@redhat.com>,
	<jean-philippe@linaro.org>, <mdf@kernel.org>, <mshavit@google.com>,
	<shameerali.kolothum.thodi@huawei.com>, <smostafa@google.com>,
	<ddutile@redhat.com>, <yi.l.liu@intel.com>, <patches@lists.linux.dev>
Subject: Re: [PATCH v7 12/14] iommu/arm-smmu-v3: Introduce struct
 arm_smmu_vmaster
Message-ID: <Z7zxsbJsOFp41Dzd@Asurada-Nvidia>
References: <cover.1740238876.git.nicolinc@nvidia.com>
 <be799951a817557ac093ac3e18d02a631306aa35.1740238876.git.nicolinc@nvidia.com>
 <Z7zYLBLZGKim-5UL@google.com>
 <Z7zlH74/orq9HF7Q@Asurada-Nvidia>
 <Z7zqdrQn7Q8yXfcn@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <Z7zqdrQn7Q8yXfcn@google.com>
X-NV-OnPremToCloud: AnonymousSubmission
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PEPF0000013E:EE_|DM4PR12MB6208:EE_
X-MS-Office365-Filtering-Correlation-Id: 01744dfd-aef8-4ead-1601-08dd5522145c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|7416014|82310400026|36860700013;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?cUCYptckUlPsGP6kdARH0Cb3Zn3YoobGhHtUdmNpQLMqufDy+KfvSYM27t9w?=
 =?us-ascii?Q?4HumY+Lapsv51PBt4+nUzaUfhpzS9wCw6f3EaBUtms6AS58QB+92g7/+zYqI?=
 =?us-ascii?Q?pIodKVO/fOE+Xdv+gIS078kZiMDJbSFVssa3v79S20FkvGvy11Amsn5ef4sR?=
 =?us-ascii?Q?2X3RtzXLjv6Oqwb9q86LXnp9E8cMOtd05oVTDdHzVV9ZOBrESR6J3Q99no/i?=
 =?us-ascii?Q?37cq1uBVikNYTUX5hj0lpuYdYzNTBOyDde2TAgkgTloAaXkM7x3XrctxLKx1?=
 =?us-ascii?Q?xEg1gZl01yPKN6bu5HC55AymO7zDj0hF52JMdRj4UKUKIyEyLRENPUAQVu9i?=
 =?us-ascii?Q?sco+Fsa/oJOqMKnUtuRQb8zDv0rhmZGawCuOndmMdzCryBlePKRMrZ9cdQTb?=
 =?us-ascii?Q?qyI3plySuEk9BtR7ViD/fPqiLUhsKkpGeqhVy+Xwo5LX7wjcx518GouCnHoE?=
 =?us-ascii?Q?275uTqJONbKtFjDet6ImOIOvhgzRirsjBJy+nw/mAXm76IMFgsIv+erAWXix?=
 =?us-ascii?Q?JPLg6sf5sc4UPJ5yML21S3zQmSylPTmJcqIDLnjSm+EO1kHNFU0I2xpTP692?=
 =?us-ascii?Q?7Pv7OCUeHkx62QrduIcbpzvcv3y236+bgVhW8x2nhCv/thlhwVvM065Kq6g/?=
 =?us-ascii?Q?ozWjic1N0bgJOPsBJgvZe6SZH3WvNDJd0VnxvJsKVOhjAM2E6KUFt4KOpSzY?=
 =?us-ascii?Q?RGGIxkpLGOVm6W/atwSMkLptGAZJvvRXDZ5K4L62p60Q3OGu5kBPWH2/0YdB?=
 =?us-ascii?Q?f6wEieX4tBSwFOviGMFJjgshRIlSF0P+LPpft0m3Gq0m3EOboZUD9UzFcBlL?=
 =?us-ascii?Q?NW6QMQfZhMhAwwNp1glbPe0wYi0p8ezzplc4TQx/FJSKq3nUL1vW9we4E1ZK?=
 =?us-ascii?Q?GI3Ry77krMaYywPsgK8Js/ar8aoEZgIobCfgeBjtaFQxzP1nywvzqvT1vXce?=
 =?us-ascii?Q?e7BzaNWrhldR1oC/miiYYoKYexnhCs/bS4cLF6ADD02lqvnZVoZiczJJ1R9e?=
 =?us-ascii?Q?tUV2D4/H/tcLDg9/Fev0ov27DkIZ2dE8h2DUGAMIGtlbQbTMcTRwLw7/3lGe?=
 =?us-ascii?Q?WjYWYc30Zn4tYQqG3YnR2sRNlY8ar44IdXI4TCZPZWA+nCcIYuPxF1BEQhut?=
 =?us-ascii?Q?IBbLOdABNbS3K8rnTksX0MY5MG1pB5ye4B3tb7VPeNNqx7sP64ljgufqPNpy?=
 =?us-ascii?Q?qv4YRYr7/uU/oDDRJAezY/ig9WArSQP0i2Wt2yYXHNGe8pH0CV0bmSTcYdOs?=
 =?us-ascii?Q?tf8lH2phUay9Z4RGy1j35gyMK25f4qf9t0MTKocJZcB+ZlfUEBgKqAn2gEx0?=
 =?us-ascii?Q?vELqmBgdtrpG45ItRrKWKk+SAZVVtuiap/jK+uepjNB5S95o0iPXD8e52UiD?=
 =?us-ascii?Q?seJmHtSmXbt9TUCTiUWFxqkFY5mACggl+ndy09GBjt3WLqUh79t9Q9vUYP7x?=
 =?us-ascii?Q?5mFgSH+7EK2XFLycoAONw06S5cnpMrelnEQISFQRneZKjBgYHZ2oexvAGrqY?=
 =?us-ascii?Q?nIqk6s9HNuQlkmU=3D?=
X-Forefront-Antispam-Report: CIP:216.228.118.232;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc7edge1.nvidia.com;CAT:NONE;SFS:(13230040)(376014)(1800799024)(7416014)(82310400026)(36860700013);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Feb 2025 22:25:01.3744
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 01744dfd-aef8-4ead-1601-08dd5522145c
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.118.232];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: CH2PEPF0000013E.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB6208
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250224_142511_261658_14B8B770 
X-CRM114-Status: GOOD (  20.37  )
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

On Mon, Feb 24, 2025 at 09:53:58PM +0000, Pranjal Shrivastava wrote:
> On Mon, Feb 24, 2025 at 01:31:11PM -0800, Nicolin Chen wrote:
> > On Mon, Feb 24, 2025 at 08:35:56PM +0000, Pranjal Shrivastava wrote:
> > > oN sAt, Feb 22, 2025 at 07:54:09AM -0800, Nicolin Chen wrote:
> > > > diff --git a/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3-iommufd.c b/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3-iommufd.c
> > > > index 5aa2e7af58b4..364d8469a480 100644
> > > > --- a/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3-iommufd.c
> > > > +++ b/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3-iommufd.c
> > > > @@ -85,6 +85,59 @@ static void arm_smmu_make_nested_domain_ste(
> > > >  	}
> > > >  }
> > > >  
> > > > +int arm_smmu_attach_prepare_vmaster(struct arm_smmu_attach_state *state,
> > > > +				    struct iommu_domain *domain)
> > > > +{
> > > > +	struct arm_smmu_nested_domain *nested_domain;
> > > > +	struct arm_smmu_vmaster *vmaster;
> > > > +	unsigned long vsid;
> > > > +	int ret;
> > > > +
> > > > +	iommu_group_mutex_assert(state->master->dev);
> > > > +
> > > > +	if (domain->type != IOMMU_DOMAIN_NESTED)
> > > > +		return 0;
> > > > +	nested_domain = to_smmu_nested_domain(domain);
> > > > +
> > > > +	/* Skip invalid vSTE */
> > > > +	if (!(nested_domain->ste[0] & cpu_to_le64(STRTAB_STE_0_V)))
> > > > +		return 0;
> > > > +
> > > > +	ret = iommufd_viommu_get_vdev_id(&nested_domain->vsmmu->core,
> > > > +					 state->master->dev, &vsid);
> > > > +	if (ret)
> > > > +		return ret;
> > > > +
> > > > +	vmaster = kzalloc(sizeof(*vmaster), GFP_KERNEL);
> > > > +	if (!vmaster)
> > > > +		return -ENOMEM;
> > > > +	vmaster->vsmmu = nested_domain->vsmmu;
> > > > +	vmaster->vsid = vsid;
> > > > +	state->vmaster = vmaster;
> > > > +
> > > > +	return 0;
> > > > +}
> > > > +
> > > > +void arm_smmu_attach_commit_vmaster(struct arm_smmu_attach_state *state)
> > > > +{
> > > > +	struct arm_smmu_master *master = state->master;
> > > > +
> > > > +	mutex_lock(&master->smmu->streams_mutex);
> > > > +	if (state->vmaster != master->vmaster) {
> > > > +		kfree(master->vmaster);
> > > > +		master->vmaster = state->vmaster;
> > > > +	}
> > > 
> > > Does this condition suggest that we might end up calling
> > > `arm_smmu_attach_prepare_vmaster()` multiple times before __actually__
> > > commiting to a vmaster?
> > 
> > No. prepare() and commit() are 1:1. How is it interpreted to have
> > "multiple times"?
> 
> Ohh alright. I was just confused about why do we need to check:
> `if (state->vmaster != master->vmaster)` ?

Hmm, it's probably not necessary, since we always allocate a new
vmaster pointer to the "state" or set a NULL.

I will clean that up a bit.

Thanks
Nicolin

