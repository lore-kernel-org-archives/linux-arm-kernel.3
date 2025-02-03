Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E6C6AC02192
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  3 Feb 2025 18:57:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:CC:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=aSlgDEWbIzv/eLTk0xSrJxJaPS/F5KG72WV9MqzVXWs=; b=qXUmj5GDjJJhE8solVNtJVYeww
	MKAvoXAf1QQ8GwpdmMXGG416E3l8GQyZQqPrDLuHCQ4wjPt0uKHmPlopokjEswidURpN9odJ5O1dD
	07INLHpNbEqaElTatypg426BKiM/qPPxpUZJvTmHmJLU5lMuOev3ecgj3kOWPL7Zs9EjN8nL1oo50
	Tvkc4RfvGoy9Kcz8K7wcu7lKg8QEeOTiLLqBB+yScDxR4sLOpMNcCDGAJBRmYA6qeTjxaZheUBk4f
	ZHTJ7V3OrpDbHL4cejpnNsZ4C/DSsrq9Ddnja7N4guGZBJ6JT0w+hq3AFDoKRnszE//V4odSbTG9Q
	+bYYP3cg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tf1dG-0000000GLrG-0Lyu;
	Mon, 03 Feb 2025 18:57:18 +0000
Received: from mail-dm6nam12on20623.outbound.protection.outlook.com ([2a01:111:f403:2417::623] helo=NAM12-DM6-obe.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tf1Jv-0000000GHy3-2O21
	for linux-arm-kernel@lists.infradead.org;
	Mon, 03 Feb 2025 18:37:20 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Gb/IrpskEHOPaiCdJUvFAnVeBUpT/YXNzdPCz/GcqQSlMvHvvfXpdMzEwYwcGyDIi1FMdvlQCMxHa+4ntHCMUUULVzSCQbS17ajfvBnqHr/MEq9FC51Mip4FHcY962bYkVwe3DnI/KJoKnpQC1mxOTqVrZ9Rw42rT32ilMRtKaaFcnfXYRHCaRK6H5u7NXkUBDa5J16Bktnn4o2MKmZeMCNHROqE2znWn81EB7bhBGkia0r45atmgY2+cbJGTpejRVDX77VUAFEuIr5NVbLNX/0cK5UNNmbY+uqYni455lbcQoxIq18i1Hav8l1hYy3aGRHu6SQD4nOHlkjnx3fRqQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=aSlgDEWbIzv/eLTk0xSrJxJaPS/F5KG72WV9MqzVXWs=;
 b=Ptvop1NYsQI9ci6U4s2CqGvfXfitV3l40UV1i4JvO+RF281UujWkUEOFGGeTznSyDLcGS+7sm9kd/v5Hz2Hiou0mCVAGX3+l4QdH8b/w8oFfmLd1+vMeTyMO6iDslevjuBAz/+elkzdtea8AJ79LRFNahU88jfj+2BDzJgudpakceckHAXTJrgkI/bSeh/7bElwI4DyCkuTXTZuFZadZNANyPU5rh0Qm10mL3AaSbCiyU9VmwGlsk/2BufkLxwDKGiQkz8VQXnVPjFhYH9QoNxyAWUREuL+Wbo64jxTVQ8gqG2wgivh7aTHwaxS2Lz7hJphCOtaefgtA1yVqY3wZjQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.160) smtp.rcpttodomain=intel.com smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=aSlgDEWbIzv/eLTk0xSrJxJaPS/F5KG72WV9MqzVXWs=;
 b=PGxL0QHDnjIUPhuIftgYgjpjif8rpNTaa/RWdS/BHVc1768GqbhbvyLQ3Dvs5FcxA7P7V+vFPktdEC3DpfIL9w22t/730b5zJIgq/XeydvSL+R9h27OJfr7DEkyPfVGHuFYFCApucRJzfnvEEBQFjp32NhhLeWjR5wbV59ERIOPrmkhIb1hKKttsCYx2yrYdTyL+wjs6+UzHcwD693sa5PqeJThyIwIKTmWrvyStY8SfxSrl/c/KP2U8rq1/qdMyJxCfMBPM01VhSUxJVyrfmBdQ9aH3SuvvEPVMyiz8HJVaQzDpTBfdAfoLTKxQ5D89eXIDqlWkkm5PZ2IGbtpY4Q==
Received: from DM6PR06CA0094.namprd06.prod.outlook.com (2603:10b6:5:336::27)
 by DM6PR12MB4284.namprd12.prod.outlook.com (2603:10b6:5:21a::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8398.18; Mon, 3 Feb
 2025 18:37:05 +0000
Received: from DS1PEPF00017098.namprd05.prod.outlook.com
 (2603:10b6:5:336:cafe::5) by DM6PR06CA0094.outlook.office365.com
 (2603:10b6:5:336::27) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8398.24 via Frontend Transport; Mon,
 3 Feb 2025 18:37:05 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.160)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.160 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.160; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.160) by
 DS1PEPF00017098.mail.protection.outlook.com (10.167.18.102) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8398.14 via Frontend Transport; Mon, 3 Feb 2025 18:37:05 +0000
Received: from rnnvmail205.nvidia.com (10.129.68.10) by mail.nvidia.com
 (10.129.200.66) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.4; Mon, 3 Feb 2025
 10:36:41 -0800
Received: from rnnvmail205.nvidia.com (10.129.68.10) by rnnvmail205.nvidia.com
 (10.129.68.10) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.14; Mon, 3 Feb
 2025 10:36:40 -0800
Received: from Asurada-Nvidia (10.127.8.12) by mail.nvidia.com (10.129.68.10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.14 via Frontend
 Transport; Mon, 3 Feb 2025 10:36:39 -0800
Date: Mon, 3 Feb 2025 10:36:37 -0800
From: Nicolin Chen <nicolinc@nvidia.com>
To: "Tian, Kevin" <kevin.tian@intel.com>
CC: "will@kernel.org" <will@kernel.org>, "robin.murphy@arm.com"
	<robin.murphy@arm.com>, "jgg@nvidia.com" <jgg@nvidia.com>,
	"tglx@linutronix.de" <tglx@linutronix.de>, "maz@kernel.org" <maz@kernel.org>,
	"alex.williamson@redhat.com" <alex.williamson@redhat.com>, "joro@8bytes.org"
	<joro@8bytes.org>, "shuah@kernel.org" <shuah@kernel.org>, "Chatre, Reinette"
	<reinette.chatre@intel.com>, "eric.auger@redhat.com" <eric.auger@redhat.com>,
	"yebin10@huawei.com" <yebin10@huawei.com>, "apatel@ventanamicro.com"
	<apatel@ventanamicro.com>, "shivamurthy.shastri@linutronix.de"
	<shivamurthy.shastri@linutronix.de>, "bhelgaas@google.com"
	<bhelgaas@google.com>, "anna-maria@linutronix.de" <anna-maria@linutronix.de>,
	"yury.norov@gmail.com" <yury.norov@gmail.com>, "nipun.gupta@amd.com"
	<nipun.gupta@amd.com>, "iommu@lists.linux.dev" <iommu@lists.linux.dev>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>, "kvm@vger.kernel.org"
	<kvm@vger.kernel.org>, "linux-kselftest@vger.kernel.org"
	<linux-kselftest@vger.kernel.org>, "patches@lists.linux.dev"
	<patches@lists.linux.dev>, "jean-philippe@linaro.org"
	<jean-philippe@linaro.org>, "mdf@kernel.org" <mdf@kernel.org>,
	"mshavit@google.com" <mshavit@google.com>,
	"shameerali.kolothum.thodi@huawei.com"
	<shameerali.kolothum.thodi@huawei.com>, "smostafa@google.com"
	<smostafa@google.com>, "ddutile@redhat.com" <ddutile@redhat.com>
Subject: Re: [PATCH RFCv2 09/13] iommufd: Add IOMMU_OPTION_SW_MSI_START/SIZE
 ioctls
Message-ID: <Z6EMtXD6Gaq3+eVw@Asurada-Nvidia>
References: <cover.1736550979.git.nicolinc@nvidia.com>
 <d3cb1694e07be0e214dc44dcb2cb74f014606560.1736550979.git.nicolinc@nvidia.com>
 <BN9PR11MB527616A2EA6C64824576E58F8CE02@BN9PR11MB5276.namprd11.prod.outlook.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <BN9PR11MB527616A2EA6C64824576E58F8CE02@BN9PR11MB5276.namprd11.prod.outlook.com>
X-NV-OnPremToCloud: AnonymousSubmission
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS1PEPF00017098:EE_|DM6PR12MB4284:EE_
X-MS-Office365-Filtering-Correlation-Id: ff9b4744-ac40-496b-14ee-08dd4481c24a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|36860700013|82310400026|7416014|1800799024|376014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?p2zM2Goq3/qi7K5eXuPvR3ZYU0lgCKoYb3GPV/eLIMFBzozQQAxBesF+2Kfn?=
 =?us-ascii?Q?+c21gAEk5bvm4E/Gd9dQ5+lw6gKcvz44cpgbfVuFlNaHm9OsOZQPD/AtvpJj?=
 =?us-ascii?Q?GT2qEUlsRogd3/T1/72buk8SnAYFBlzTqvH/h6AMbG27/1H5pZ0A2/mn8IRm?=
 =?us-ascii?Q?McnJf1LpJyeq2E8kx9S9AAScOlZuXschw0KCfbPTaYDkmoHBg3pGSs5EJ1Tv?=
 =?us-ascii?Q?yV2Vdy3oHDAiHrXCVYP8RvCyYapyx9mWDJRzVFIlD5M4iOECxEftvD9ySy3f?=
 =?us-ascii?Q?uAFqJqYjUJ3gJ6SL2mrxseD34rl1ViVkBc06xzwVaBRUz3Lolprm8dugKxAo?=
 =?us-ascii?Q?mHYP/vMCKJ7SYF+Ky9vethRl25wVIm4ME3/TXiP5R0mXXWrrCzWx8/V1MAp5?=
 =?us-ascii?Q?2cTu5G0A4Af7L+r4FJC4+ob38xIj4v9vsK6Sval2GCgTRtIsYLygADPsx/Aj?=
 =?us-ascii?Q?pr6RqcygFV9JeyandtwPvyOJSogC+L4ks1a9eRruC12ynjdyeyCIxUjBBiNi?=
 =?us-ascii?Q?yXMgTPJQPY7dY56m/t1uepnms9Ms4CJ2xnSV1TLfdl0C8EiD2NqvdG54kdYl?=
 =?us-ascii?Q?MVI3+ZLgUowxa4Wmq+ccnfN2qY7oZZePV0jO+pnMyExaouvfpJFS3QiZqtX4?=
 =?us-ascii?Q?PN29ef3t/ICcZ++CW76XdlTvbz4ZgrOvl5diODqmqeyTSqTGw/o6rIuFP7x0?=
 =?us-ascii?Q?GF/xN/KYiYcQspKEVZGZDbN8gMsQYlL4CBaZVUg4DohHsADP4I5FG4bgCYB0?=
 =?us-ascii?Q?1VBUWPEFjhGiQCdEe/HAqkYpN1nqsQ+eL28UmB6NDUYhrHCJKJip5MnTrfEl?=
 =?us-ascii?Q?2S2NUqvfj9JKEIXKWTsp3aNbpaVZbwjO6+uyQtSLmMi91VbH8GgOpTXaDIT7?=
 =?us-ascii?Q?C7ndskTOwsUkYIaMiA/VyCpsutvlZ2fZL7ob9BMnlMsISsuaf6zC+DS9s0No?=
 =?us-ascii?Q?d5gID7WpcbXcNOtlhOGuR+XenPNbTb4pZ4FEtoA6M7PJcYQW206wpkEJs3vg?=
 =?us-ascii?Q?oC8Zx+/Amwfd9Qx+R74r/alq2mqMKqdYNSR8vbdE6IQJBNbYUt2XOjSKVNb8?=
 =?us-ascii?Q?rOPCQJacPqR1py4/eqdW50GPkVDnddKmocfZZXfiFavCq1ghs9MoBtnJg2Py?=
 =?us-ascii?Q?ZrC9Co/+1RNkCLm8uYE9kpwUtEgCZwJ7oRuFObPMUS5F8PRpl3zh5akqlLeY?=
 =?us-ascii?Q?R15irPiY8DICIGzmCS+Mc4E8L0aPQsO8cVQ7GJ9Fieco25Et6uqQwzX9Q+mb?=
 =?us-ascii?Q?KUTwowpm4R4NmfyreEIM6phApHN7D/ItpgZjbnjv1olU5v2hiZ4C2vcwMUfg?=
 =?us-ascii?Q?yq2EzNSo79xEVAQ6U5O+L2yEFTX6aHKyKRgqqVeWLhWcq9+8f26DacRBsRYy?=
 =?us-ascii?Q?TPMRw2+uqLyWYHtx/AJFW8cA38zs8wYYAgPcFYDeO1+gEi8VdPVrHeLAUwJl?=
 =?us-ascii?Q?ayQ1uw4hMpUFdJVitBOLCG1PkI/+sKrue8p9K37BNrYvf18+5nvK6Q810eFc?=
 =?us-ascii?Q?nL4ywwz/g9bVxBA=3D?=
X-Forefront-Antispam-Report: CIP:216.228.117.160;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge1.nvidia.com;CAT:NONE;SFS:(13230040)(36860700013)(82310400026)(7416014)(1800799024)(376014);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Feb 2025 18:37:05.6333
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: ff9b4744-ac40-496b-14ee-08dd4481c24a
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.160];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: DS1PEPF00017098.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB4284
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250203_103719_608597_80865B81 
X-CRM114-Status: GOOD (  32.24  )
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

On Thu, Jan 23, 2025 at 10:07:13AM +0000, Tian, Kevin wrote:
> > From: Nicolin Chen <nicolinc@nvidia.com>
> > Sent: Saturday, January 11, 2025 11:32 AM
> > 
> > @@ -294,7 +294,9 @@ struct iommu_ioas_unmap {
> > 
> >  /**
> >   * enum iommufd_option - ioctl(IOMMU_OPTION_RLIMIT_MODE) and
> > - *                       ioctl(IOMMU_OPTION_HUGE_PAGES)
> > + *                       ioctl(IOMMU_OPTION_HUGE_PAGES) and
> > + *                       ioctl(IOMMU_OPTION_SW_MSI_START) and
> > + *                       ioctl(IOMMU_OPTION_SW_MSI_SIZE)
> >   * @IOMMU_OPTION_RLIMIT_MODE:
> >   *    Change how RLIMIT_MEMLOCK accounting works. The caller must have
> > privilege
> >   *    to invoke this. Value 0 (default) is user based accounting, 1 uses process
> > @@ -304,10 +306,24 @@ struct iommu_ioas_unmap {
> >   *    iommu mappings. Value 0 disables combining, everything is mapped to
> >   *    PAGE_SIZE. This can be useful for benchmarking.  This is a per-IOAS
> >   *    option, the object_id must be the IOAS ID.
> > + * @IOMMU_OPTION_SW_MSI_START:
> > + *    Change the base address of the IOMMU mapping region for MSI
> > doorbell(s).
> > + *    It must be set this before attaching a device to an IOAS/HWPT,
> 
> remove 'this'

Ack.

> > otherwise
> > + *    this option will be not effective on that IOAS/HWPT. User can 
> 
> Do we want to explicitly check this instead of leaving it no effect
> silently?

So, the idea here is:
If this option is unset, use the default SW_MSI from the driver
If this option is set, use it over the default SW_MSI from the driver

That's what the following statement "User can choose to let.." means.

> > choose to
> > + *    let kernel pick a base address, by simply ignoring this option or setting
> > + *    a value 0 to IOMMU_OPTION_SW_MSI_SIZE. Global option, object_id
> > must be 0
> > + * @IOMMU_OPTION_SW_MSI_SIZE:
> > + *    Change the size of the IOMMU mapping region for MSI doorbell(s). It
> > must
> > + *    be set this before attaching a device to an IOAS/HWPT, otherwise it
> > won't
> > + *    be effective on that IOAS/HWPT. The value is in MB, and the minimum
> > value
> > + *    is 1 MB. A value 0 (default) will invalidate the MSI doorbell base address
> > + *    value set to IOMMU_OPTION_SW_MSI_START. Global option, object_id
> > must be 0
> 
> hmm there is no check on the minimal value and enable the effect
> of value 0 in this patch.

Well, it's somewhat enforced by __aligned_u64 since it can't be any
value between 0 (disable) and 1 (minimal)?

And the override code checks "ctx->sw_msi_size".

> >  iommufd_device_attach_reserved_iova(struct iommufd_device *idev,
> >  				    struct iommufd_hwpt_paging
> > *hwpt_paging)
> >  {
> > +	struct iommufd_ctx *ictx = idev->ictx;
> >  	int rc;
> > 
> >  	lockdep_assert_held(&idev->igroup->lock);
> > 
> > +	/* Override it with a user-programmed SW_MSI region */
> > +	if (ictx->sw_msi_size && ictx->sw_msi_start != PHYS_ADDR_MAX)
> > +		idev->igroup->sw_msi_start = ictx->sw_msi_start;
> >  	rc = iopt_table_enforce_dev_resv_regions(&hwpt_paging->ioas->iopt,
> >  						 idev->dev,
> >  						 &idev->igroup-
> > >sw_msi_start);
> 
> what about moving above additions into 
> iopt_table_enforce_dev_resv_regions() which is all about finding
> a sw_msi address and can check the user setting internally?

We could. Probably would be cleaner by doing that in one place.

> > diff --git a/drivers/iommu/iommufd/io_pagetable.c
> > b/drivers/iommu/iommufd/io_pagetable.c
> > index 8a790e597e12..5d7f5ca1eecf 100644
> > --- a/drivers/iommu/iommufd/io_pagetable.c
> > +++ b/drivers/iommu/iommufd/io_pagetable.c
> > @@ -1446,7 +1446,9 @@ int iopt_table_enforce_dev_resv_regions(struct
> > io_pagetable *iopt,
> >  		if (sw_msi_start && resv->type == IOMMU_RESV_MSI)
> >  			num_hw_msi++;
> >  		if (sw_msi_start && resv->type == IOMMU_RESV_SW_MSI) {
> > -			*sw_msi_start = resv->start;
> > +			/* Bypass the driver-defined SW_MSI region, if preset
> > */
> > +			if (*sw_msi_start == PHYS_ADDR_MAX)
> > +				*sw_msi_start = resv->start;
> 
> the code is not about bypass. Instead it's to use the driver-defined
> region if user doesn't set it.

Ack:
			/* If being unset, Use the default IOMMU_RESV_SW_MSI */

Thanks
Nicolin

