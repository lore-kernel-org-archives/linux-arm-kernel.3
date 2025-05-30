Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E5E97C5B543
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 30 May 2025 17:31:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:CC:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=qizEhiomuE6nYG5D/ARrFIwgLqPK91jCxOZb3uHEr40=; b=n9kp5fA21q+MACfE9Rnm9DbCzP
	iltwnmqjVPjNpIln3IaDw5nB2Kksr/m9a6UBwPL0qGVAhADgFxTnfHZSdhVOIncdXCP5d/0vtpe8f
	4mosr4lvJe0iCfWMC7UonR5KCVlSATd4wbqbaM0Ebh8GIypVf9041w4v6vgH0QG+aG1ySc9bbJKwt
	cqtEUeA0x/I2HAL6x2nGbsiY2OWkGrVjwQoxrdb3L6T+c/SEGWQ5byFvLDclKXUyVUpFHbczWTMfn
	XvwCb23BlnPKOwnkc377jZkf8C73Ry+yT+MZ/K55C8itX6fW32HIszz7SZnJqGOd3DpanhlQ3wcyZ
	Rr5chV4w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uL3ZO-00000001PNJ-1J2T;
	Fri, 30 May 2025 17:31:02 +0000
Received: from mail-dm6nam11on2062f.outbound.protection.outlook.com ([2a01:111:f403:2415::62f] helo=NAM11-DM6-obe.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uL3OH-00000001Nyq-3Fs2
	for linux-arm-kernel@lists.infradead.org;
	Fri, 30 May 2025 17:19:34 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=uRWfORWzQLz9T4UDa/rfSCMIajvSevgw3bjqlMyU0vTAG1PYtH8qdpmTQiz38yZMhu3nkxwvd7RvZ3Tjy2ronkPR4MIbOgMv80QDDINPS8y0+3LHF7HRi5j6hlmJ1Nfs71C9DtTFHWz7BxIgTfcDFN8EHMcKcrlpuFsIGX3fDGNrMZVAg9/J26+jvWXraDo5RTpNrwVmi78t+YyYRvrIX/3qJQjCWTZ/KjlgjMDsA6WmbdtAUAxLJt5G/9lVi+l3C+eYOz6MAfpTPzfiicGREqa67x/0EV09BEJ++vGHPqXWfABuIkDVki809ebgZUSEMgpOhlQgGcvd69NC8n4Q8g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qizEhiomuE6nYG5D/ARrFIwgLqPK91jCxOZb3uHEr40=;
 b=LtZ5VREBmAMD3/bF8GEbdSOH4QRbAanRBH8Ao0Ro8H4bFRJGPxm3rO//q2UcQz5HDt9tmHTNQRIBc8MXjcZRKJsEvSDYS59uZKxVHXxCWY6/nMYgN0HxZ8fHbISZge8IA4XC976YiOYZi1BUrlzFObtgTs2pFeulSuwCHGD5FGY29I8B/XzDRwndIQd/SOeLIidejY2uwtdPNDy7MeLMEdIzzlKTyA3dwHmsDabPMRkp7N7ogtC17JlyW4UxT3l6JjFaywthkFt1szr8dHy+7xSTLhq1XrWeL/xvBtNSl0ibJJeV9782RAr6FRc5nYltEeU1HyrNCXl+uCMisuOlmA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.161) smtp.rcpttodomain=amd.com smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qizEhiomuE6nYG5D/ARrFIwgLqPK91jCxOZb3uHEr40=;
 b=OGj8wp2C7hKi3SBzDtBQns1TS/cXLb7vkDu3a0cUP3si+stsSS6mxgrvDdknKV8P7B4aT77ZakKs0BJByS4uKGRilLE4MiczDD9WLKp9/qeXLyGIDBvU1/splt0TY+6IBxfSZ5Xa42ETGPIjqh0hg+esy5j9fVkbf24f63rLt2Me8EIl76N+fXWuTBi82h8g/H2vquqF4XqIKkOYlAeINOKdOeQ98VqRWLsC0nGFwW/uQ/k1iXmcShnAeegdT6otSZ6OSd2JsPWIFfAeByuQUPh7vofyxRwiq1p0UzHiyl01NbVgdW1H7DRB9hfpsxM+cq1fkSpmoJMMUhmIA8LEsg==
Received: from CH5P220CA0009.NAMP220.PROD.OUTLOOK.COM (2603:10b6:610:1ef::11)
 by CH3PR12MB7666.namprd12.prod.outlook.com (2603:10b6:610:152::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8769.29; Fri, 30 May
 2025 17:19:28 +0000
Received: from DS2PEPF00003443.namprd04.prod.outlook.com
 (2603:10b6:610:1ef:cafe::b0) by CH5P220CA0009.outlook.office365.com
 (2603:10b6:610:1ef::11) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8769.22 via Frontend Transport; Fri,
 30 May 2025 17:19:28 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.161)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.161 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.161; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.161) by
 DS2PEPF00003443.mail.protection.outlook.com (10.167.17.70) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8769.18 via Frontend Transport; Fri, 30 May 2025 17:19:27 +0000
Received: from rnnvmail204.nvidia.com (10.129.68.6) by mail.nvidia.com
 (10.129.200.67) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.4; Fri, 30 May
 2025 10:19:14 -0700
Received: from rnnvmail203.nvidia.com (10.129.68.9) by rnnvmail204.nvidia.com
 (10.129.68.6) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.14; Fri, 30 May
 2025 10:19:14 -0700
Received: from Asurada-Nvidia (10.127.8.11) by mail.nvidia.com (10.129.68.9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.14 via Frontend
 Transport; Fri, 30 May 2025 10:19:12 -0700
Date: Fri, 30 May 2025 10:19:10 -0700
From: Nicolin Chen <nicolinc@nvidia.com>
To: Jason Gunthorpe <jgg@nvidia.com>
CC: <kevin.tian@intel.com>, <corbet@lwn.net>, <will@kernel.org>,
	<bagasdotme@gmail.com>, <robin.murphy@arm.com>, <joro@8bytes.org>,
	<thierry.reding@gmail.com>, <vdumpa@nvidia.com>, <jonathanh@nvidia.com>,
	<shuah@kernel.org>, <jsnitsel@redhat.com>, <nathan@kernel.org>,
	<peterz@infradead.org>, <yi.l.liu@intel.com>, <mshavit@google.com>,
	<praan@google.com>, <zhangzekun11@huawei.com>, <iommu@lists.linux.dev>,
	<linux-doc@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-tegra@vger.kernel.org>,
	<linux-kselftest@vger.kernel.org>, <patches@lists.linux.dev>,
	<mochs@nvidia.com>, <alok.a.tiwari@oracle.com>, <vasant.hegde@amd.com>,
	<dwmw2@infradead.org>, <baolu.lu@linux.intel.com>
Subject: Re: [PATCH v5 28/29] iommu/tegra241-cmdqv: Add user-space use support
Message-ID: <aDnojjuMUqMbIRTb@Asurada-Nvidia>
References: <cover.1747537752.git.nicolinc@nvidia.com>
 <4a84673ef6fe040f1b551d059be466c2c7bdf2af.1747537752.git.nicolinc@nvidia.com>
 <20250530171052.GM233377@nvidia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20250530171052.GM233377@nvidia.com>
X-NV-OnPremToCloud: AnonymousSubmission
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS2PEPF00003443:EE_|CH3PR12MB7666:EE_
X-MS-Office365-Filtering-Correlation-Id: 562d4402-4e14-4e98-a84c-08dd9f9e2203
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|82310400026|7416014|376014|36860700013|1800799024;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?4Z/gAUq682cGLKxfGzCPEzQYC3LhOU3OO6/3Xb9Mrpo8FyBruySfJ1vFpF0n?=
 =?us-ascii?Q?uUcsOiQ3CqQH1JGk0iGs5D6Nnb7o2OjoaoZjEUK84eXBsv29EjW5+ecX8l19?=
 =?us-ascii?Q?M8yJbzP2XgWvHNux+XVaxcpL2lf0/NAUY87sfg5I3RtSusjkrk7A5Q//q94u?=
 =?us-ascii?Q?Ra/k9xKfZT0c2HatFkIxnE8pvAOUGtIy9rJ7Yj3LhU4lKAYHs2FcbADUfq/l?=
 =?us-ascii?Q?gX+w4FIc/OxLA+0EBFHswZcXs2tDmaJlNomP42Q+R+U6cMfYBCb+bFr4PHV/?=
 =?us-ascii?Q?RiBRbkoGOat7ew8+RqyoaSga3TwC7/9I1QHyb7ggVcn4DNLLFarAzPb35tCO?=
 =?us-ascii?Q?2v09Y/xV6AcT/3ceKK0HvW1fAQIGWo01CaT59Q+awwYWMoN1J1KOYOPRl172?=
 =?us-ascii?Q?h5qsqYt/SULWkssKfwa4MdskR4VGmtVmOTAZ2/PpYU8Zv5IEtun/9Pcuj6Vj?=
 =?us-ascii?Q?faQ6odmlGHqBCtx6uYeuyuJzrf8JQwmNJZCgOyOLSPP5FzueVVs7FJcvX+jV?=
 =?us-ascii?Q?Uc9nTZtavp/rzBkl0X9/d3wmGiJCi/Bwra4vltnUWjOitMOUXgVu1JXL6YVz?=
 =?us-ascii?Q?LHU53s+XnRS60zV3Gl+EhmTkOEyNNH0T4tL75Mgpj/kzBwhXrxVDiLr8Bkhm?=
 =?us-ascii?Q?9kYS3UJldev1ldbOZqEQ9lTy2eojYpoX6tX1Txe1P+lIZa+MErrYdwwk8ETg?=
 =?us-ascii?Q?fG98lKf0XH8Cr32lyHUsOUuOvo4FCmy/6LhY+UFFxy1oLqyyequgmH++FOzk?=
 =?us-ascii?Q?zkdB1M2NRd5NmlemBC24Gc2Zg9nIUhh97lpUQ34C6rreqKGAWgD+iXSn4zCN?=
 =?us-ascii?Q?FrBok8X/qT6Z3Y6m7d3rHU8hTtuc5llJco4p/tsTOC3WuiA+unEelSxxvtID?=
 =?us-ascii?Q?I0/zgSw/IYDBpdlsnRLfPevi2dsIYSJcxNORzJ4ZzqLudfJmFbJTDu5yJgUl?=
 =?us-ascii?Q?k+14wO4FBgCbrvPzobYTA9OWpvc/OnQQ72Rg1tQ3vimkK0eXMUW2Fch0LZAQ?=
 =?us-ascii?Q?R0DDRj35L51JHiMyOKRpbMLQu6M7RBHxYXjC+HlMAy1qyVebAc0VOarScYrV?=
 =?us-ascii?Q?C/Ah+WY8kYCAZVGGXjrMLm5OW7TasCoxgp8UPMj3eBpFmbDNHd/iCK6vKEL/?=
 =?us-ascii?Q?8f81sBo0GetoeW1vuCv41EtXMoP/bsy7y44hki395j9O4qWtpqgUFOIcZ+oZ?=
 =?us-ascii?Q?995+9FqENYFTKctqFRbjj5eMc0ruD3iQgEs9C9/KsLaa1a/8QGfeJUNin2mv?=
 =?us-ascii?Q?FcG8On2M50SptjA1fA87Fyjqqi3zfEcfYmaXr+y3Zmc08O7ZSqphRPggUc0N?=
 =?us-ascii?Q?vs5ZHbV4g+lCapvcgDt82YcRKrQloQHFTG4onykQeBnX7oTl+sAl1OaVSG02?=
 =?us-ascii?Q?ybuQmjNufp2bhOifzrEqYJ+B22Xxlv7ZRFpdEgFTjqSMWw/dASeA1R//pGBt?=
 =?us-ascii?Q?ojPzSrMW6JZBaSM5q9tJgprKTHLyZkzAoXF1jSjJ58EZ/lbszlCxDR4VtP83?=
 =?us-ascii?Q?PGXBentj9bqJq1bKPasq726V6G9Acrg8JR9L?=
X-Forefront-Antispam-Report: CIP:216.228.117.161;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge2.nvidia.com;CAT:NONE;SFS:(13230040)(82310400026)(7416014)(376014)(36860700013)(1800799024);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 May 2025 17:19:27.9548
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 562d4402-4e14-4e98-a84c-08dd9f9e2203
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.161];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: DS2PEPF00003443.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR12MB7666
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250530_101933_814393_B86864FC 
X-CRM114-Status: GOOD (  13.72  )
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

On Fri, May 30, 2025 at 02:10:52PM -0300, Jason Gunthorpe wrote:
> On Sat, May 17, 2025 at 08:21:45PM -0700, Nicolin Chen wrote:
> > +static inline phys_addr_t
> > +arm_smmu_domain_ipa_to_pa(struct arm_smmu_domain *smmu_domain, u64 ipa)
> > +{
> > +	if (WARN_ON_ONCE(smmu_domain->stage != ARM_SMMU_DOMAIN_S2))
> > +		return 0;
> > +	return iommu_iova_to_phys(&smmu_domain->domain, ipa);
> > +}
> 
> It is not allowed to call this function unless you are holding a range
> lock on the IOAS that covers ipa, and this path does not.
> 
> This is why it has to go through an access to get the physical as that
> has the right locking.

OK. It would not be needed either once the core passes in type
phys_addr_t as you suggested in the other patch.

Thanks
Nicolin

