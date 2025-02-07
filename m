Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CF7F3C02192
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  7 Feb 2025 04:28:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:CC:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=GICI1sVU7IE8LAc/pkl7rX92QdFp4Ol0mjoCyVP0FmQ=; b=RPqu+oNU5CHLJFrWqhxD70mpkW
	38iRxdYrPQF08GVDhf82dLufWMbUdiMyvMsmXKBhCzWitdHANLliUKK6T6Xc1b8qs2Z9QXTS5El4d
	OffuD7W6upioa1rI0UUHooCSFfbB0uMzlZ73Ry0Oqu88yf1NfNsyeK2unPHsJKabYoz4GoAyw5Owb
	KArZ46kf1+BfmylTjwwMKMWSVVJ6O0BHsOs6fNjb6KrXCdylZDaqVFRh11p5KmHGbq0uhk+A6lon5
	EFYHACXVf7I+CODgitdLc0HbHqVT5KwovkLZjZj/VLQVoEgnSXZq4uvfe8cL0VdaPtQk8pqj1sjdp
	D/ioyG0A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tgFy9-00000008IDF-3MUk;
	Fri, 07 Feb 2025 04:27:57 +0000
Received: from mail-bn8nam12on2062f.outbound.protection.outlook.com ([2a01:111:f403:2418::62f] helo=NAM12-BN8-obe.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tgFwl-00000008Htv-2YcG
	for linux-arm-kernel@lists.infradead.org;
	Fri, 07 Feb 2025 04:26:33 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=VeRs5443EXdvZXmBaitEsKhsyMwBZ1aGox23xoNHd37V0Pgk1nMHyHxl0wIxyMiribS7IpB5hHtAAQV5d3zzbIIxEF+CWqK+t40C2KvTguESFhtYApqKW5/gA76Dx7HNT/JPAlNuAnsgQJTFRKwFaW8+qERnq5590h3G+rLHONsW/6T0ZRF6N9kdDxdOMdOKoiPqkiyn5+YbMlBPtTK+oTekA+McqKi3GDr/hIOWFNAsUDFC7xJdM0e17/w6L8qGtd+hjoS9u4s4WOuLEQmtGCYEQPNjFKXqsvJFZxz9vHeRYvrAv/9cUKZ4OYniNgDTjPKJ/xO+juzMEKIFSNmhtQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=GICI1sVU7IE8LAc/pkl7rX92QdFp4Ol0mjoCyVP0FmQ=;
 b=jElpXMvpbpuYrELE/r0hv0/lNKhGN+Y+Z/qGEFYKaLJBrowd29Sz3crSUboaFdfuxMnVl9yqkE8ZGDWPn6Bf4AgTs4gwpe2OPBB5CzQ1IWXK+dNPdyyVhJeZAf/rAoahnjA0XUHWoDSkRQQk6zD8zWvsKP4XvigHajPfaLAk35Dwo0UKEttoKzCNERlkJr6z7iWDtgiJpqPSHSRwcn1i+s6DpIz3Msx7prqrcwkNyevhaBOSpgx4rLFiabVLU/rtxdewTFIFAOqupTu8H2tni3fHl1prQ+C/hqlOA3P9kTqOVCTXiutKtktrwSe7e+P9HwEW+paSPJ9yI1WkPQ/vxQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.160) smtp.rcpttodomain=huawei.com smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=GICI1sVU7IE8LAc/pkl7rX92QdFp4Ol0mjoCyVP0FmQ=;
 b=c6E6KI+MCFTLppEboTI9tiNvn5NPrPwr6A/oNWphRrfG7hrOI+4KgSYpmP8sFT1bm4q7y5E2zSocV7th0UW3tVf56oTwDHXHamSi5IAXZJ2aSURvE9oruUckDKd75zkTXAU8bUAAWA4Xhu9EGsN3Q1IqVcjRQ09iE+cx+v2moei8m6rfSqSDR3T0l6Aeg5U3u+yFfvXzst/93k+sXKwAa7pJ2o0WzYPSvIgvJUX2+rpnZd8Pi7Zy91R4+fAxg6aCsy1/T+XF8WyZuv8tIpiKb3gIBbH6mzkxXc9Cd3BY9RoS7Jzv5x9+0Ogr0tKOFLtpgQrzXLtqhGYhwjo+8RxS0w==
Received: from CH0PR07CA0010.namprd07.prod.outlook.com (2603:10b6:610:32::15)
 by MN2PR12MB4360.namprd12.prod.outlook.com (2603:10b6:208:266::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8422.13; Fri, 7 Feb
 2025 04:26:18 +0000
Received: from CH1PEPF0000AD7F.namprd04.prod.outlook.com
 (2603:10b6:610:32:cafe::28) by CH0PR07CA0010.outlook.office365.com
 (2603:10b6:610:32::15) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8398.28 via Frontend Transport; Fri,
 7 Feb 2025 04:26:18 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.160)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.160 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.160; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.160) by
 CH1PEPF0000AD7F.mail.protection.outlook.com (10.167.244.88) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8398.14 via Frontend Transport; Fri, 7 Feb 2025 04:26:18 +0000
Received: from rnnvmail202.nvidia.com (10.129.68.7) by mail.nvidia.com
 (10.129.200.66) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.4; Thu, 6 Feb 2025
 20:26:08 -0800
Received: from rnnvmail202.nvidia.com (10.129.68.7) by rnnvmail202.nvidia.com
 (10.129.68.7) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.14; Thu, 6 Feb
 2025 20:26:08 -0800
Received: from Asurada-Nvidia (10.127.8.12) by mail.nvidia.com (10.129.68.7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.14 via Frontend
 Transport; Thu, 6 Feb 2025 20:26:06 -0800
Date: Thu, 6 Feb 2025 20:26:05 -0800
From: Nicolin Chen <nicolinc@nvidia.com>
To: Jason Gunthorpe <jgg@nvidia.com>
CC: Eric Auger <eric.auger@redhat.com>, <will@kernel.org>,
	<robin.murphy@arm.com>, <kevin.tian@intel.com>, <tglx@linutronix.de>,
	<maz@kernel.org>, <alex.williamson@redhat.com>, <joro@8bytes.org>,
	<shuah@kernel.org>, <reinette.chatre@intel.com>, <yebin10@huawei.com>,
	<apatel@ventanamicro.com>, <shivamurthy.shastri@linutronix.de>,
	<bhelgaas@google.com>, <anna-maria@linutronix.de>, <yury.norov@gmail.com>,
	<nipun.gupta@amd.com>, <iommu@lists.linux.dev>,
	<linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<kvm@vger.kernel.org>, <linux-kselftest@vger.kernel.org>,
	<patches@lists.linux.dev>, <jean-philippe@linaro.org>, <mdf@kernel.org>,
	<mshavit@google.com>, <shameerali.kolothum.thodi@huawei.com>,
	<smostafa@google.com>, <ddutile@redhat.com>
Subject: Re: [PATCH RFCv2 09/13] iommufd: Add IOMMU_OPTION_SW_MSI_START/SIZE
 ioctls
Message-ID: <Z6WLXTiYVzuN368E@Asurada-Nvidia>
References: <cover.1736550979.git.nicolinc@nvidia.com>
 <d3cb1694e07be0e214dc44dcb2cb74f014606560.1736550979.git.nicolinc@nvidia.com>
 <0521187e-c511-4ab1-9ffa-be2be8eacd04@redhat.com>
 <20250129145800.GG5556@nvidia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20250129145800.GG5556@nvidia.com>
X-NV-OnPremToCloud: AnonymousSubmission
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH1PEPF0000AD7F:EE_|MN2PR12MB4360:EE_
X-MS-Office365-Filtering-Correlation-Id: 8e0af187-81e5-476b-5b07-08dd472f913a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|7416014|376014|36860700013|82310400026|1800799024;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?ex/3JWcd9yNeGPIWOnzBt1AUDePtoXZJTpKlQpe+OoEdOZSSWmPJTjWrl4e6?=
 =?us-ascii?Q?XVsXfKYya8q+28VNjwLwHYw/JlAD1LmrP5h2HrerJzZhERHlWAjx8ulifb1f?=
 =?us-ascii?Q?d9hH3SSqPMDCz/0btU2P7KobKuLYSMHByM3BB1junu94PFSTSSRYU4yQOPoX?=
 =?us-ascii?Q?BgnBKSJdwazHE81gCXYGhpGcTKTI68H4wE1+qVcbiK7yYH5ElYPGokdonyPP?=
 =?us-ascii?Q?2iJMF8qsGHvF62yGmmg5SvWSpeHmmotg6jHixDTR8D1NL5o6mUQcG8XUBUE7?=
 =?us-ascii?Q?a7e5JeAlQrx7moUDrydcVLyNiVKdN8A6AA90tGGCndFAsJ98bO7jnfZ/dW26?=
 =?us-ascii?Q?QbhS9YFuC4zYwCRFUK9kxmeEOZIJOXtfyZsg8y3/Hhdi5P5PxAWbn3KNmW7b?=
 =?us-ascii?Q?6XvCDN+NJZYYz+85cNIUszInj76WNdd1frJpQOzHy64mhwxfJ/wZjZPTet1x?=
 =?us-ascii?Q?uo9QzXoSrpMoAdAaRtqDmfvC1ffW1/FsfaYeGZKzyWD+LYhXtzxUfI5TrpcK?=
 =?us-ascii?Q?DMF5EcztyDfzybgaFlW83LJWvtzCxC1mbT4fcfxwVTO/wGpDUEp7Xiquh50X?=
 =?us-ascii?Q?ygiat8iuqNuk67dNjmsxtmWi80q8gLqjncGB2ONBetX4T2m4EQXQO03CG1jQ?=
 =?us-ascii?Q?1k76Bd75XZQuQBBA/3q+Mj1Hn9yA9+ypdAmSUH+phT2oaHXWEIHpvxrzNfqT?=
 =?us-ascii?Q?RW70rZo81cQL49nu/2Y1l43mza1oVXJsklGzScGSUKawlcxStoaKYYZ6Slt1?=
 =?us-ascii?Q?BPnCV6U+ZaDXuBUojuCFKw0JnhayIeKmQNBdAci/1GtVAcg+Uw+0pQjxOsYU?=
 =?us-ascii?Q?6n5tqR/ezPVNLDguA6THoyDyJS+X7nf6uElbx9OphmVrkJL8+ELDVQx1rypf?=
 =?us-ascii?Q?XitbPM/BXT2e5nZSyjFYEKEkVH15pHM8qCsQ+OMuZnjWQIJtctpB8lXFVMPb?=
 =?us-ascii?Q?uIHifcmh59L31HA4l8FK+1Eb/HYKpwkwFYCmr1vS0NT9AdX8BValYDRlgjR/?=
 =?us-ascii?Q?MO2vVSHlYFLMP4I6hdvrfCSnvaZDZDytaCg2FAoCK2BOF9U39accw6Fr6aJz?=
 =?us-ascii?Q?9HkJgqUTlfc3CQWPhQam1Y2xJcSgl19B8QNopw0obS6bvzT3r6vgCyd++HQ7?=
 =?us-ascii?Q?PgkWzmhLSeDt1+i9PUkJigYMVHKMLtCMNXLDt/Awi3jun23+gc+Is7FJWMv4?=
 =?us-ascii?Q?POdP6a3dmcuG3h73KeFpYJ4PZaXxkepOOFZT6oUsPNJnroifvRsPQd1dt8Yu?=
 =?us-ascii?Q?DkTX/Nf19BxIuay1QWEKNaCkSTSQXiDTTyH+c4fCxSVmrhlR0Fh6vsvDfCo1?=
 =?us-ascii?Q?+c+9V4KE+DAE/kIozEs0WlFUKIf1OFQSgv38KT/7Fq1Di90tmsqNqAamW4/4?=
 =?us-ascii?Q?kUc9WqsMc7G73T4C56m/sXbXXLS27GyRhVPdHiI21yqh6DnCLThWV8Zeu+P4?=
 =?us-ascii?Q?rvWiJODDbbqqrT0LBfn1ObOHidQ4aHgOGzbWPeGCngDK8L08AHpvP56t8E+L?=
 =?us-ascii?Q?U9zq487oueJA6WI=3D?=
X-Forefront-Antispam-Report: CIP:216.228.117.160;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge1.nvidia.com;CAT:NONE;SFS:(13230040)(7416014)(376014)(36860700013)(82310400026)(1800799024);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Feb 2025 04:26:18.0627
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 8e0af187-81e5-476b-5b07-08dd472f913a
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.160];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: CH1PEPF0000AD7F.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB4360
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250206_202631_649015_3556339B 
X-CRM114-Status: GOOD (  26.17  )
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

On Wed, Jan 29, 2025 at 10:58:00AM -0400, Jason Gunthorpe wrote:
> On Wed, Jan 29, 2025 at 02:44:12PM +0100, Eric Auger wrote:
> > On 1/11/25 4:32 AM, Nicolin Chen wrote:
> > > For systems that require MSI pages to be mapped into the IOMMU translation
> > > the IOMMU driver provides an IOMMU_RESV_SW_MSI range, which is the default
> > > recommended IOVA window to place these mappings. However, there is nothing
> > > special about this address. And to support the RMR trick in VMM for nested
> > well at least it shall not overlap VMM's RAM. So it was not random either.
> > > translation, the VMM needs to know what sw_msi window the kernel is using.
> > > As there is no particular reason to force VMM to adopt the kernel default,
> > > provide a simple IOMMU_OPTION_SW_MSI_START/SIZE ioctl that the VMM can use
> > > to directly specify the sw_msi window that it wants to use, which replaces
> > > and disables the default IOMMU_RESV_SW_MSI from the driver to avoid having
> > > to build an API to discover the default IOMMU_RESV_SW_MSI.
> > IIUC the MSI window will then be different when using legacy VFIO
> > assignment and iommufd backend.
> 
> ? They use the same, iommufd can have userspace override it. Then it
> will ignore the reserved region.
> 
> > MSI reserved regions are exposed in
> > /sys/kernel/iommu_groups/<n>/reserved_regions
> > 0x0000000008000000 0x00000000080fffff msi
>  
> > Is that configurability reflected accordingly?
> 
> ?
> 
> Nothing using iommufd should parse that sysfs file.
>  
> > How do you make sure it does not collide with other resv regions? I
> > don't see any check here.
> 
> Yes this does need to be checked, it does look missing. It still needs
> to create a reserved region in the ioas when attaching to keep the
> areas safe and it has to intersect with the incoming reserved
> regions from the driver.

Yea, I found iopt_reserve_iova() is actually missed entirely...

While fixing this, I see a way to turn the OPTIONs back to per-
idev, if you still prefer them to be per-idev(?). Then, we can
check a given input in the set_option() against the device's
reserved region list from the driver, prior to device attaching
to any HWPT.

Otherwise, we just rely on iopt_enforce_device_reserve_region()
during an attach, keeping the option global to simplify VMMs.

Thanks
Nicolin

