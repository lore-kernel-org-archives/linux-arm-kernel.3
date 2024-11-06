Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 45855D59F75
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  6 Nov 2024 21:56:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:CC:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=eeBrkSbmAmRJo7VDs4EymTa1Gnln7vU9FxxHjW2QMQU=; b=itKSAYzMX3SSMuQiqTCgOTXkZb
	aYaj/wp48ibbPNuDr/7KqjiTFmPzdgETNReBWMuLwm8e/H5kOwx0mGEwyTyiv3ZevCISS/YKsjCSE
	qbYl9Q3Ds7vGvTLasMXoaAHxtFfIwDuo1XfQ4Uj61qHo32WTLsa8MhvDOT/ibhPk/2FTKAwc4lzm7
	hlJd85+17etOW4HDS9Q/c2tRwdgQ4EuqpDb1plEZAoGBZNG6wCOj/vvIZ5gTViR4LFN6EcRgMgqA+
	JbZT9zHGKWAaOTG+EVoPWfR8H61hMX/L+DtErjUW+Q4la7cULIToftRdqoDYNwZ4626zdVkuF9YMn
	C+s5c0Mg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t8o17-00000004qnU-2lEA;
	Wed, 06 Nov 2024 21:56:45 +0000
Received: from mail-dm6nam10on20630.outbound.protection.outlook.com ([2a01:111:f403:2413::630] helo=NAM10-DM6-obe.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t8ny3-00000004qSW-3KWt
	for linux-arm-kernel@lists.infradead.org;
	Wed, 06 Nov 2024 21:53:37 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=QNOS9lGqv22Bo1IWRI68p37sZnF35VFUgZRi0Nv0fCb7HqU66TW2z0Y2ugUEemv/HRyQF36aE/QiLUnEOU0NKn4OVyQ27EHpMeLQ+2VvlGaFcGsTrJpERBYc1+5tiVgF3iuEZKlepxiBalW3cCcjFsnRevySkheLgxjYWVHl7SPQQqNzpN/OY3OxTheWBjfmWhJWAbyH0J3TNiyO4+cUTplVLQDN/ayDpy2jqjc2ha87DcjXHAMOjRlPWCyy4+z6jCaASpVNASIVh63fXn2v1Azlios/Sz9TBSWPg9oEHt1C38VuHJP3qxuBF9305FE1KKnn+mxe3Hrbow1Z/VjjmA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=eeBrkSbmAmRJo7VDs4EymTa1Gnln7vU9FxxHjW2QMQU=;
 b=xOEq+voR8CVO2wd4QIDVud1hQfm0fzqDx0l93ZkDljhRDjQtT6N04kAHhys3DuBmtMs3hET6uVwZzZobvuhfViOLqXit16J0r3YQoDlCSSqN4tjOVA+kRRYOA3z5Ai8txU8FmIO/bPpVbfxyyO2Nv8Pk5vqHJkm3Fj9XPHBz2Joujl8i4euODgzfECzXBb1+gCSodjBWRmrmVysFmXJQ3yzgkPJR5iq6jIyZVWT1OE0EJ6wLaQrZ4mPpB9QhrDR3UALPzMv5wj+5BaCcUHPVviE/mXtMXGEQFXTd26bHaV2OQxpcBexHjUtiHxtNPCy3VEiUsBjVVCeJo5yvh8uQMQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.160) smtp.rcpttodomain=arm.com smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=eeBrkSbmAmRJo7VDs4EymTa1Gnln7vU9FxxHjW2QMQU=;
 b=KizVLTivxXOCe22WVAd48I6d9ZWncp0SpzUXQFK8IbI6FcoVGELHRB7kTSxkhnQiIH/KLu0pzBlgbYACNQ92fV6GZfdwr3O7phBVcgyMUCF/pDbvZaGQd8dzFq+MgDQTmuMajPvwGvhIzYMR/orDDh0BkjwtAofm76AKTgDOYwqUOn/qy2UkwpKPSOe3XHh7ZBw+WD8d+kA3apMCmkBfB34wYV7WeOEcZ3e46ZZWmE2aHgqS0H9NLogUOisK50LfBVbn4U4T7u0EigeRdhaPBBKRZpYpY5YJ8jyPD6SSlXSlu4oROVOjSegYQOGXfxRdZXauOMlK0kOElr52F3Nouw==
Received: from BY5PR13CA0004.namprd13.prod.outlook.com (2603:10b6:a03:180::17)
 by SA0PR12MB4494.namprd12.prod.outlook.com (2603:10b6:806:94::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8114.30; Wed, 6 Nov
 2024 21:53:30 +0000
Received: from CO1PEPF000066E7.namprd05.prod.outlook.com
 (2603:10b6:a03:180:cafe::32) by BY5PR13CA0004.outlook.office365.com
 (2603:10b6:a03:180::17) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8137.16 via Frontend
 Transport; Wed, 6 Nov 2024 21:53:30 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.160)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.160 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.160; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.160) by
 CO1PEPF000066E7.mail.protection.outlook.com (10.167.249.9) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8137.17 via Frontend Transport; Wed, 6 Nov 2024 21:53:29 +0000
Received: from rnnvmail205.nvidia.com (10.129.68.10) by mail.nvidia.com
 (10.129.200.66) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.4; Wed, 6 Nov 2024
 13:53:13 -0800
Received: from rnnvmail201.nvidia.com (10.129.68.8) by rnnvmail205.nvidia.com
 (10.129.68.10) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.4; Wed, 6 Nov 2024
 13:53:12 -0800
Received: from Asurada-Nvidia (10.127.8.13) by mail.nvidia.com (10.129.68.8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.4 via Frontend
 Transport; Wed, 6 Nov 2024 13:53:10 -0800
Date: Wed, 6 Nov 2024 13:53:08 -0800
From: Nicolin Chen <nicolinc@nvidia.com>
To: Robin Murphy <robin.murphy@arm.com>
CC: Jason Gunthorpe <jgg@nvidia.com>, Will Deacon <will@kernel.org>,
	<acpica-devel@lists.linux.dev>, <iommu@lists.linux.dev>, Joerg Roedel
	<joro@8bytes.org>, Kevin Tian <kevin.tian@intel.com>, <kvm@vger.kernel.org>,
	Len Brown <lenb@kernel.org>, <linux-acpi@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, Lorenzo Pieralisi
	<lpieralisi@kernel.org>, "Rafael J. Wysocki" <rafael@kernel.org>, "Robert
 Moore" <robert.moore@intel.com>, Sudeep Holla <sudeep.holla@arm.com>, "Alex
 Williamson" <alex.williamson@redhat.com>, Donald Dutile <ddutile@redhat.com>,
	Eric Auger <eric.auger@redhat.com>, Hanjun Guo <guohanjun@huawei.com>,
	Jean-Philippe Brucker <jean-philippe@linaro.org>, Jerry Snitselaar
	<jsnitsel@redhat.com>, Moritz Fischer <mdf@kernel.org>, Michael Shavit
	<mshavit@google.com>, <patches@lists.linux.dev>, "Rafael J. Wysocki"
	<rafael.j.wysocki@intel.com>, Shameerali Kolothum Thodi
	<shameerali.kolothum.thodi@huawei.com>, Mostafa Saleh <smostafa@google.com>
Subject: Re: [PATCH v4 05/12] iommu/arm-smmu-v3: Support IOMMU_GET_HW_INFO
 via struct arm_smmu_hw_info
Message-ID: <ZyvlRFi6W9vK5IZj@Asurada-Nvidia>
References: <0-v4-9e99b76f3518+3a8-smmuv3_nesting_jgg@nvidia.com>
 <5-v4-9e99b76f3518+3a8-smmuv3_nesting_jgg@nvidia.com>
 <20241104114723.GA11511@willie-the-truck>
 <20241104124102.GX10193@nvidia.com>
 <8a5940b0-08f3-48b1-9498-f09f0527a964@arm.com>
 <20241106180531.GA520535@nvidia.com>
 <2a0e69e3-63ba-475b-a5a9-0863ad0f2bf8@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <2a0e69e3-63ba-475b-a5a9-0863ad0f2bf8@arm.com>
X-NV-OnPremToCloud: ExternallySecured
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PEPF000066E7:EE_|SA0PR12MB4494:EE_
X-MS-Office365-Filtering-Correlation-Id: a9afa297-7052-44fb-44ed-08dcfead7361
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|36860700013|376014|82310400026|7416014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?O+OxZ18LkgHYRMoy2Clx9IHj0aqOtiI6ajxDREEePuvtE6Wkvj0gxtzErgRO?=
 =?us-ascii?Q?x8dGEPEHuiuMacPdiAHvrYuiRKviYUHTTu+qI4MINbctNnJnI2SCVsBJhm+c?=
 =?us-ascii?Q?2UPikwOAbaIbnB6LmpX/050WdCjkfyIR+hBhoECv3fJo1fZczesQDi3QC0ZK?=
 =?us-ascii?Q?Sfu0GwBnPu8PWHo80+XMZICVw+tR8RASUlGR94heCOGqEM6eH6rSI7+LJMHq?=
 =?us-ascii?Q?hTyIQOHkegTq7Sm/WQAGE4JR616TPOdRIoroi2R2XC7ITeoxz3uRx4oawu84?=
 =?us-ascii?Q?fMTc756oR7fx7ZDkc6ihOy6dWU2yUqj9PmYXlB7bwCa8b4LNgXkPpOHayhVX?=
 =?us-ascii?Q?slj0F92aWGPG9qj9E15qXVHs7YHeo1+JxIqjZC+/bR7AeCp26aG1dG9hqwKW?=
 =?us-ascii?Q?cZ8IEA7Vw058prdpZYZChqvcnNhAORYmJ+AdSCgfRKAuL1H3aYxtoFRlfhWU?=
 =?us-ascii?Q?Efe9pvsakMxFaACfpKoVRDBaTJnWkPz5kK44MDilXrfWhTipcE5bnDnkbM1j?=
 =?us-ascii?Q?pW/wl2Hqu/ThBEtCig0rDyHxKvyxmsjLQto7g/ay4CvkOzmI1daIx3PCM7f+?=
 =?us-ascii?Q?XT07ks6T8KwgrhE1nWWTOkA594ivotbQjgNlx3/R2iG/8qKy8WrDhatjFD8H?=
 =?us-ascii?Q?XeFk0NduaPAnSPLWa41xJaLDha+1XgeFbv5dMGRoaQORNxer0QLpuka8d1yn?=
 =?us-ascii?Q?u05i52Edc6Q+exX9Flb2osHEOG6NM8916sgwOF1q8StZ3bNpX9TmLmH0M3vr?=
 =?us-ascii?Q?58BU6/XcLdJ4TggF5GNQgTgTw+u16jOqNOzwc0K2n588NXl50jAWtAzKuVdR?=
 =?us-ascii?Q?OW/s0ZaMoPKSz3SsERVAP77VqH3ftKaDqSyhbl385PNvgeqPaf1EbIh26UcK?=
 =?us-ascii?Q?rY1iO46Kfs0em4IdoEILvL8P0ucAFFC5eQTdUJNh7mTvRcZcHDFaPiOldOnR?=
 =?us-ascii?Q?nF04CR+KLVCsEz4hbIEEBXWVRYHdReLzeILVKds1KgjFIO7H4Yf5IZWmognH?=
 =?us-ascii?Q?s+2Ov8k++S5M1c46OEdYQGx3/0OHTG8aJo+1Y0Q+Fqxtfs67v4AiJOBwyDLa?=
 =?us-ascii?Q?ROt1ebMTp+VIAN54jwuU9YtvZsHJP/gmpYnMrt8/y9aMu26anYByyWAOiCo0?=
 =?us-ascii?Q?Tl6/QPl+nVEPk2oMgvGqNiw7Big4EbVlTJXwltoeaXDkb/cO3WF/YRtN7vVR?=
 =?us-ascii?Q?sPZgDHOaguMmGgkLEsWUrQ4w+KfL8CbZ1tPelCnTYuGcLgI535BwxaeHOuTq?=
 =?us-ascii?Q?X8y9AmilcDfanmpXnwcfjqLS/GAzWhf2RFLVQfIov2eg/v6t/GNi5GetWL7i?=
 =?us-ascii?Q?o2xGtDe2kanbTLBS5mLnPV9bfjcWc/wkSQlz9wAfnON0NXflcPTJ96Nv83X8?=
 =?us-ascii?Q?hUmSnVYxu601Mk2AHMya2sNAgiUd5d0RIji3gI2YHGu9jGF6Bw=3D=3D?=
X-Forefront-Antispam-Report: CIP:216.228.117.160;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge1.nvidia.com;CAT:NONE;SFS:(13230040)(1800799024)(36860700013)(376014)(82310400026)(7416014);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Nov 2024 21:53:29.7382
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: a9afa297-7052-44fb-44ed-08dcfead7361
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.160];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: CO1PEPF000066E7.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA0PR12MB4494
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241106_135335_881516_01EB4AE5 
X-CRM114-Status: GOOD (  16.18  )
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

On Wed, Nov 06, 2024 at 09:05:26PM +0000, Robin Murphy wrote:
> On 2024-11-06 6:05 pm, Jason Gunthorpe wrote:
> > If you still feel strongly about this please let me know by Friday and
> > I will drop the idr[] array from this cycle. We can continue to
> > discuss a solution for the next cycle.
> 
> It already can't work as-is, I don't see how making it even more broken
> would help. IMO it doesn't seem like a good idea to be merging UAPI at
> all while it's still clearly incomplete and by its own definition unusable.

Robin, would you please give a clear suggestion for the hw_info?

My takeaway is that you would want the unsupported features (per
firmware overrides and errata) to be stripped from the reporting
IDR array. Alternatively, we could start with some basic nesting
features less those advanced ones (HTTU/PRI or so), and then add
then later once we're comfortable to advertise.

Does this sound okay to you?

Thanks
Nicolin

