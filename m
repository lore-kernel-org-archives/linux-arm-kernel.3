Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3007DC021AF
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 18 Feb 2025 18:18:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:CC:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=mWt9mIg+n96/VxLcOQeCpsNSiVm1sJbQx2LjwUcqGes=; b=HijWQInboBvph1sua3uO9Baxbw
	nFZG/VjDT6h+Voj+i6Rwt+EPxLsduySSAweZhx/EaKJSQ+9bsWRrcdctw4Y9YKdqXvO+j9XW/+d5t
	ufxrfuBhi4snYbhmXLigIqbdG+aOJgJVtAOPINyuCmhXUFlhQxiIDKEXM7jdE5AexSmQl59llxdaP
	a6xTyueFsTM+y4pTInEgTSYVopolmNlnpxy0yYTdGRnZiGjNYuFsqh34qrdPsAmqTyENZkL1DCjhv
	ZooElQQ+TSA5gXJq4+NHssxWtt7hkm8ADVYzHDrBDz8tFs/14cWeVeCSxdKAazB5zmyOwuMLGrdL0
	rHGe9OLA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tkSAJ-00000009J1H-0VEh;
	Tue, 18 Feb 2025 18:17:51 +0000
Received: from mail-mw2nam10on20608.outbound.protection.outlook.com ([2a01:111:f403:2412::608] helo=NAM10-MW2-obe.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tkS8c-00000009IYS-26QD
	for linux-arm-kernel@lists.infradead.org;
	Tue, 18 Feb 2025 18:16:07 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=r843ml5ZucLIAzfE9H0ExUkxlF6CjahsirL4HOVGHo0saUtA9SY/5kW+spVd2abJizt3tJ0IkJQznnsPmHt8EO1xr8D2bf/eLNLhnlYrvrlxuTZJjfJ29zyLBnk9i1swWnPheA1LlWkehRdgVtNZoa8rHpLw0CF97aD6/KLX274loWk1q8m2Oe8hxulymZNWfAYSkA1lUOEtssyf2Oqy9Rblrk8YVGPf2lCw7+jEDaU+W2lB+2mNQYIID8hskayJRr9lTNDXXP2QF5SF9uBP8N2Cp8CkKzQ2ynWDvjOpYD69cl/ax4yWf3XqjS1LWte1G3W1F09MIVaa/OivwSc+3g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=mWt9mIg+n96/VxLcOQeCpsNSiVm1sJbQx2LjwUcqGes=;
 b=VP1nhYWICkYH/Rx6Fr8YPHeFED8kfqMbYjhr6793rTJiVhCgu7EdqAT1YT/YsXXoF5KIpWJbeno/CIu07Cf7AtVjT6r+Loqd1XAcBe9PC68nBTUezbxmgHZziqYRz3Sh6GYjisWj8225nQln4/Taf0gnFjVccGFUtnHXcrLbjEw6jnUocEKsq0nUPzCVZYUXcUpXSInHgpQs1axcxhA+lIBXWQQWB5Z75e/Rl9e/rEXZQHf1ia3Hq6JEoRee478XBXz9NH8pJlWgi2wDVa4ptvcOIzUss4yAG3UPlMumaU/vAF3W+4p5F+VPe49C2zWwwajLhn+T82SsHAQu6XLAXQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.118.233) smtp.rcpttodomain=redhat.com smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mWt9mIg+n96/VxLcOQeCpsNSiVm1sJbQx2LjwUcqGes=;
 b=kIKxAc4YfaacR58wMl27nFTxqplkGMrsi93P3pbHHs4TaD9osBArsPkjkGGCGKxc4BR+Mz8riLGIAVlVCbVFKFhMtxDEYUVdkM6ei5UQDzI9+tyv9jMJQaVpf2kLI2WniAzy7ifGPm/2MOAEOL9vPW90YYRgwmZfG5zHtj2gxH3DVHZ3DHmPWqWJtyqQUVVrwmB+ZUCzXiFBGpfFpNUw76kIo+5SVlUUwbX3Tm7G3xYY4RWMIhIMFrGDvd6PVDmEbeUcFGTaBESKMQGlJ6jrrbjxAiEqRfbtzvh0NOdYc2Cd+uVfzoc2ViwV0p56V3vOnLhdUni+IryW9fvo7lMI3A==
Received: from DM6PR17CA0013.namprd17.prod.outlook.com (2603:10b6:5:1b3::26)
 by CY8PR12MB8267.namprd12.prod.outlook.com (2603:10b6:930:7c::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8445.18; Tue, 18 Feb
 2025 18:16:01 +0000
Received: from DS2PEPF00003439.namprd02.prod.outlook.com
 (2603:10b6:5:1b3:cafe::66) by DM6PR17CA0013.outlook.office365.com
 (2603:10b6:5:1b3::26) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8445.19 via Frontend Transport; Tue,
 18 Feb 2025 18:16:01 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.118.233)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.118.233 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.118.233; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.118.233) by
 DS2PEPF00003439.mail.protection.outlook.com (10.167.18.36) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8466.11 via Frontend Transport; Tue, 18 Feb 2025 18:16:01 +0000
Received: from drhqmail202.nvidia.com (10.126.190.181) by mail.nvidia.com
 (10.127.129.6) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.4; Tue, 18 Feb
 2025 10:15:48 -0800
Received: from drhqmail202.nvidia.com (10.126.190.181) by
 drhqmail202.nvidia.com (10.126.190.181) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14; Tue, 18 Feb 2025 10:15:47 -0800
Received: from nvidia.com (10.127.8.13) by mail.nvidia.com (10.126.190.181)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.14 via Frontend
 Transport; Tue, 18 Feb 2025 10:15:46 -0800
Date: Tue, 18 Feb 2025 10:15:45 -0800
From: Nicolin Chen <nicolinc@nvidia.com>
To: Jason Gunthorpe <jgg@nvidia.com>
CC: <kevin.tian@intel.com>, <corbet@lwn.net>, <will@kernel.org>,
	<joro@8bytes.org>, <suravee.suthikulpanit@amd.com>, <robin.murphy@arm.com>,
	<dwmw2@infradead.org>, <baolu.lu@linux.intel.com>, <shuah@kernel.org>,
	<linux-kernel@vger.kernel.org>, <iommu@lists.linux.dev>,
	<linux-arm-kernel@lists.infradead.org>, <linux-kselftest@vger.kernel.org>,
	<linux-doc@vger.kernel.org>, <eric.auger@redhat.com>,
	<jean-philippe@linaro.org>, <mdf@kernel.org>, <mshavit@google.com>,
	<shameerali.kolothum.thodi@huawei.com>, <smostafa@google.com>,
	<ddutile@redhat.com>, <yi.l.liu@intel.com>, <patches@lists.linux.dev>
Subject: Re: [PATCH v6 05/14] iommufd: Add IOMMUFD_OBJ_VEVENTQ and
 IOMMUFD_CMD_VEVENTQ_ALLOC
Message-ID: <Z7TOUWm6eQPaRdN/@nvidia.com>
References: <cover.1737754129.git.nicolinc@nvidia.com>
 <2fb8d9c7b01ad36b42849283cd33d931f11092cb.1737754129.git.nicolinc@nvidia.com>
 <20250218152959.GB4099685@nvidia.com>
 <Z7THxrq/6sYP/AIi@nvidia.com>
 <20250218180805.GI4099685@nvidia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20250218180805.GI4099685@nvidia.com>
X-NV-OnPremToCloud: AnonymousSubmission
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS2PEPF00003439:EE_|CY8PR12MB8267:EE_
X-MS-Office365-Filtering-Correlation-Id: 1de284d1-3547-4957-fcd0-08dd50484d08
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|7416014|82310400026|376014|1800799024|36860700013;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?D9kv7cerdKC8lGz2MkuAKUnIl6l5E5zOvMkzN0xvbvMyiqSKI6k2ddOiXlpQ?=
 =?us-ascii?Q?XvWniNCJFR7q2F6qxfmwhnvpp+mqZQIFja5AoUr6WdwysImk229lSLrr2lWc?=
 =?us-ascii?Q?blCtu9vCQx7S0JfLrbtwDfHJw9oA0/LiejfA1HJcxp1GUyD5QmmCJYugxsEx?=
 =?us-ascii?Q?2S1hDXyVOp05kChzO6OGW8w9d5Y3Fxo7SNczXaYKftkn384rZFtS6yKqJzV9?=
 =?us-ascii?Q?DpX2Ln+ciR/sYVLDp5Iyv27wwA2o7lIIclyrHfm6lus4fzeKWU1rIfBsHsYW?=
 =?us-ascii?Q?EzJM/vivEyCQDaF2H7LX0g50Ej8tkqQC1sss60N2q9crceF/CbD9Avxwd6yw?=
 =?us-ascii?Q?O4HTt1oBMbk6TT9E9z96X40ZOv+5ltdDmX+wwzx5WTbTR5OCcai06QtTJGpb?=
 =?us-ascii?Q?ME4IciM+/CS6PAnuSU5VRZP9zyt+HeDBFbsaRl4qMhpX+YGAxmeWKdXrR9Wk?=
 =?us-ascii?Q?Mr745HU/MH/6KjLG4O0hc6kzGNyes16po0WlPhLC8BtjRg+d4MamzfMzz7io?=
 =?us-ascii?Q?lrbZJMY1Imv3p0hLP/5rVuQIa7y43Azote4W1PREk7HtZtNl66Ik/X1vx0bE?=
 =?us-ascii?Q?nTCRBXGe1PyUYiI5bIognmxnaM6Y4eOt9CzroM7+Pi+nCVwn8AlwjnP2jPyB?=
 =?us-ascii?Q?3patrI4Xas7/cnwi8KzfxDcDcJmMhjPWWaqhHLA9hAkAEycCYWSVkdziG2pE?=
 =?us-ascii?Q?MJ/yqR7X8hB0oaqsM68tEs25ivsxJeT64hwUuccxbMgaNSIz8X9i/EXgFy99?=
 =?us-ascii?Q?tUaQbUf96frgoz0WqOuybdO7JLLvygTaH4OywvREgrmxS5CK3yTKMdtjijMI?=
 =?us-ascii?Q?M+RwzCnKfPy0jF5j/l/Ucs2G5ZtXy286F9q2SDb6erlwjDjpyK4UOmsihYbQ?=
 =?us-ascii?Q?ve2KPqJ0p0NsXpNGXaAVA/WQ8YGCDbFJLtjbTXRVm8UAiWer8XMznvxP07z8?=
 =?us-ascii?Q?5QtlJreWk9gTyJkueTqN+l3cwCu0KyIwBuTdEzn3aTDUvhVMoLTYxxiuzjnV?=
 =?us-ascii?Q?rDaSCAsk/EGYuN8mv5HT7PD2xMaSmxljgfaNSakX9wgDLfIrtLMyJRolK6Ch?=
 =?us-ascii?Q?JtnGLPpsmhBTBjBjXmRNd1ghF1PaWLoabZj56pHHE+UMYnL013qp/bMSV22W?=
 =?us-ascii?Q?bfsgyC9VvBawrwV1JCUTGpRT3V3kFET4rgzTySigo0SGHa5np59sJt6sCY8X?=
 =?us-ascii?Q?UEXFn5xJS+5XRhzr8fz/RPXyfx1m3+g39AVlotxypHAnu0jAp+VM5JK+cbl0?=
 =?us-ascii?Q?1MeOsKFaZm5QUUp+ko276lsCz1im4ZASIajvIaRGIVwWSOp0mc/IdKFxdyHr?=
 =?us-ascii?Q?blJ8WFf0jWT8XAs9/9di5d2WtP4sWSgjD5nEbx7wfU/gD15qgkH7S3zPZuQ+?=
 =?us-ascii?Q?OuO095CMvVJSIRxLVA0KGcBAmum7MyzRXakwXVnlj+s32DsAs9M06R+gbF93?=
 =?us-ascii?Q?YU1SvOKF2njLJCgyHGt3MccrPdHzvmsqcIWHKsemsjAnv+n6EMBygZITUmyc?=
 =?us-ascii?Q?OQNyBU1e6hsx/e0=3D?=
X-Forefront-Antispam-Report: CIP:216.228.118.233;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc7edge2.nvidia.com;CAT:NONE;SFS:(13230040)(7416014)(82310400026)(376014)(1800799024)(36860700013);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Feb 2025 18:16:01.5217
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 1de284d1-3547-4957-fcd0-08dd50484d08
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.118.233];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: DS2PEPF00003439.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR12MB8267
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250218_101606_536038_8A5C0150 
X-CRM114-Status: GOOD (  11.94  )
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

On Tue, Feb 18, 2025 at 02:08:05PM -0400, Jason Gunthorpe wrote:
> On Tue, Feb 18, 2025 at 09:47:50AM -0800, Nicolin Chen wrote:
> > > > +int iommufd_veventq_alloc(struct iommufd_ucmd *ucmd)
> > > > +{
> > > > +	struct iommu_veventq_alloc *cmd = ucmd->cmd;
> > > > +	struct iommufd_veventq *veventq;
> > > > +	struct iommufd_viommu *viommu;
> > > > +	int fdno;
> > > > +	int rc;
> > > > +
> > > > +	if (cmd->flags || cmd->type == IOMMU_VEVENTQ_TYPE_DEFAULT)
> > > > +		return -EOPNOTSUPP;
> > > > +	if (!cmd->veventq_depth)
> > > > +		return -EINVAL;
> > > 
> > > Check __reserved for 0 too
> > 
> > Kevin is suggesting a 32-bit flag field, so I think we can drop
> > the __reserved in that case.
> 
> Those are different structs?

Oops. Right. I will check the __reserved.

Thanks
Nicolin

