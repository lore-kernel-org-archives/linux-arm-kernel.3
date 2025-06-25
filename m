Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4A727C7EE2A
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 25 Jun 2025 20:58:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:CC:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Ay+OoYaAjDj9hZe+qVQx/WgvfjaQQCv+QQtBOyngybE=; b=TGXLCPTmdXtqCEPo5Gc4INOK2/
	LILBOw8d3L53xO2Wa9UXRQxAiwYo2hy7yah0KDeOSe8NRaztoNYzdFtiYiszTNSWltE+g128qdsi0
	BP++d1KUMvFvwzUSGhAE0pg+ZFkRQrYUDW4Ea/cBuU6Rpxh7M4LwWsF1Ydm8XAaBF93tVOHvcA3X2
	idZVQ6uGLy/BgxkfCR1dpsFj3balv8l671wL/ND6vEJrAzH2jmae2H9dh6TQHnIJwgPaHHHDvmzzL
	NWZArenk03r5K5wduU12Fl00MxrDEopVCiK+ILr2MTp95LbY2v2rV6GpLH8/unbN4zN3Anut8ip24
	XK2EKZtw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uUXCG-00000009vUT-0VuS;
	Wed, 25 Jun 2025 20:58:20 +0000
Received: from mail-dm6nam10on20621.outbound.protection.outlook.com ([2a01:111:f403:2413::621] helo=NAM10-DM6-obe.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uUU09-00000009Spj-0nLZ
	for linux-arm-kernel@lists.infradead.org;
	Wed, 25 Jun 2025 17:33:38 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=iMDQ4KE48BVzvysYtGAeiFuyzPFsp9zbyT7/j5LFxGC9knjA6Xei8TBIAlQ47o2FfPsTqw0uhHQ2gb8M3fcXlz3/HOHo5sNBWizEIonYKor1VIQ2VhUlqKVmLtP+E+akO5xK1tzrfDgUxMBuLCzBTiX+SNLwJHnu0/cWcksyTjMGa8v9fpqxCb5V+p6b/330y3sVkE7sH0t1uH0JkVY2b2nLj0yFuUI7yfKPBB0hsPQlF3vFO+jPPVNeEvp4ANL0o2XvUj3mN1E+kPPSobLI4Kv9TGD1MtILEcBHA1Uc3wPsZq13jcTXtCm4T8WitUC4zYxv2nBEQ3XksXxUW9H0Ug==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Ay+OoYaAjDj9hZe+qVQx/WgvfjaQQCv+QQtBOyngybE=;
 b=eTZVt9FRojx02Xtmwyv8CahpQ8guIcYQ7vHeHt0aUoBOtm5z4RmrwQ+RJ2Sts47BYofNL1qBhdN9j2zAAiRl/gP9LQiSvMyk1mRdPCLQROexAoMruGfgGjCu8WvoVHOppsPjo+wUK97EhtlEDtIF+6Xto8ttUPk2jo8saqydAToO6ExhLaYBG+k8PhUF0jCdqUXLGtEFGSbvfFE1l4OTV7AgCQhPxWTn3pYE8gGx0jz34qtHMusKk1tXSEOPjAPvFxk6pnC5Vc9y+b/VLMGfH3Jgi7UaGb1mpM4g0UyJIla66iEsocDjRhoZoxE/LCYJvHA6v5m9T22sJNnLAC7lEg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.118.232) smtp.rcpttodomain=intel.com smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Ay+OoYaAjDj9hZe+qVQx/WgvfjaQQCv+QQtBOyngybE=;
 b=rTxzWXXjRjN7JGPzwJGr8aiJ4kjIgVZMSWEUNAh4z3sOBIUp+lmuftlnp6DlLKCc5Gs6DDU04ypPgiLF++vtB6S5fsnpQ+qQXYWSFzEosZSZuJcQPcHwF5HijTJxgvB9iEDKfemYWyA2+/Cfncfvh9NaMbmpXbi8gk0U9n5YRM/yTOFEWJrPXtDN6cOAQr8T5RsBsqZ5xCNXyY51a+lj7QfA+JpZ9QRplMTH9SjcalmI0yroCyG9slqsgHVqD7h7TSIafyubeyBbk72l5AvG5+tJraNBdbLH07q542QpZmmnZbfrXIli1lsDzcI4NhU5bOLgjc57xjTZ1f1bYoXxAQ==
Received: from BN1PR13CA0028.namprd13.prod.outlook.com (2603:10b6:408:e2::33)
 by SJ1PR12MB6243.namprd12.prod.outlook.com (2603:10b6:a03:456::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8835.30; Wed, 25 Jun
 2025 17:33:22 +0000
Received: from BL02EPF0001A101.namprd05.prod.outlook.com
 (2603:10b6:408:e2:cafe::9d) by BN1PR13CA0028.outlook.office365.com
 (2603:10b6:408:e2::33) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8880.16 via Frontend Transport; Wed,
 25 Jun 2025 17:33:20 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.118.232)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.118.232 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.118.232; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.118.232) by
 BL02EPF0001A101.mail.protection.outlook.com (10.167.241.132) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8880.14 via Frontend Transport; Wed, 25 Jun 2025 17:33:20 +0000
Received: from drhqmail202.nvidia.com (10.126.190.181) by mail.nvidia.com
 (10.127.129.5) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.4; Wed, 25 Jun
 2025 10:33:12 -0700
Received: from drhqmail201.nvidia.com (10.126.190.180) by
 drhqmail202.nvidia.com (10.126.190.181) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14; Wed, 25 Jun 2025 10:33:11 -0700
Received: from Asurada-Nvidia (10.127.8.13) by mail.nvidia.com
 (10.126.190.180) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.14 via Frontend
 Transport; Wed, 25 Jun 2025 10:33:10 -0700
Date: Wed, 25 Jun 2025 10:33:09 -0700
From: Nicolin Chen <nicolinc@nvidia.com>
To: "Tian, Kevin" <kevin.tian@intel.com>
CC: "jgg@nvidia.com" <jgg@nvidia.com>, "corbet@lwn.net" <corbet@lwn.net>,
	"will@kernel.org" <will@kernel.org>, "bagasdotme@gmail.com"
	<bagasdotme@gmail.com>, "robin.murphy@arm.com" <robin.murphy@arm.com>,
	"joro@8bytes.org" <joro@8bytes.org>, "thierry.reding@gmail.com"
	<thierry.reding@gmail.com>, "vdumpa@nvidia.com" <vdumpa@nvidia.com>,
	"jonathanh@nvidia.com" <jonathanh@nvidia.com>, "shuah@kernel.org"
	<shuah@kernel.org>, "jsnitsel@redhat.com" <jsnitsel@redhat.com>,
	"nathan@kernel.org" <nathan@kernel.org>, "peterz@infradead.org"
	<peterz@infradead.org>, "Liu, Yi L" <yi.l.liu@intel.com>,
	"mshavit@google.com" <mshavit@google.com>, "praan@google.com"
	<praan@google.com>, "zhangzekun11@huawei.com" <zhangzekun11@huawei.com>,
	"iommu@lists.linux.dev" <iommu@lists.linux.dev>, "linux-doc@vger.kernel.org"
	<linux-doc@vger.kernel.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>, "linux-tegra@vger.kernel.org"
	<linux-tegra@vger.kernel.org>, "linux-kselftest@vger.kernel.org"
	<linux-kselftest@vger.kernel.org>, "patches@lists.linux.dev"
	<patches@lists.linux.dev>, "mochs@nvidia.com" <mochs@nvidia.com>,
	"alok.a.tiwari@oracle.com" <alok.a.tiwari@oracle.com>, "vasant.hegde@amd.com"
	<vasant.hegde@amd.com>, "dwmw2@infradead.org" <dwmw2@infradead.org>,
	"baolu.lu@linux.intel.com" <baolu.lu@linux.intel.com>
Subject: Re: [PATCH v6 06/25] iommufd/access: Allow access->ops to be NULL
 for internal use
Message-ID: <aFwy1V81mmM6R/yU@Asurada-Nvidia>
References: <cover.1749884998.git.nicolinc@nvidia.com>
 <e6a989c4dd9cb94aa4a98d46ed56a2afcb41b70d.1749884998.git.nicolinc@nvidia.com>
 <BN9PR11MB52766D0C0B12F1F10A6BE7548C7BA@BN9PR11MB5276.namprd11.prod.outlook.com>
 <aFwlu7FlfIP85gko@Asurada-Nvidia>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <aFwlu7FlfIP85gko@Asurada-Nvidia>
X-NV-OnPremToCloud: AnonymousSubmission
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL02EPF0001A101:EE_|SJ1PR12MB6243:EE_
X-MS-Office365-Filtering-Correlation-Id: fc3bf00f-a8b4-4a94-0640-08ddb40e60de
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|7416014|36860700013|82310400026|1800799024;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?Xvg1vGQEWv8PvdcMD90bZq63guzx/PT0227WMo3s95vpbBnYMD7wWDttUk3s?=
 =?us-ascii?Q?hR8OkpB4LqXQMNOWInvqk2Yiun2rcOvaiwNPjccu+4souQFxWF7OBKLm9LXS?=
 =?us-ascii?Q?TydMm4fsxX2+WZKQ8pWkgqnBrv2qa2xWUQmBEYPS9Yw+gEtmhkiP/Laho6Ab?=
 =?us-ascii?Q?QqpNBcrG2OQbSKe1a8lPu5ojWckUWiqGy3Yt3kpXlPQLyES9JTPBbPMhjq22?=
 =?us-ascii?Q?vr0nPnbiySSVwckzBfg67QIabIjrJnD6/m0aBFkOlH8ZJzNd1ioEp1f9N1Cy?=
 =?us-ascii?Q?KF9z4Ir1wTu6gqLosOcfn2QaC0Ejx24U5nMNkpNToO4pIDi4hFgBxUgHyW4Q?=
 =?us-ascii?Q?aGH5sMZlqT2gDE0eNR6XD2P57uWZQEX3/8RnOcwndhD/b8XVKfIydPAFpKOH?=
 =?us-ascii?Q?WEoq47RN6kKMOb+Fqeej3Hcjs+9G40hfo8gBaoFGlkGNj+8vRSolV6YyfObm?=
 =?us-ascii?Q?Zy59muMV0o+Xzz4DU5CawYWXfthMQinUEF/IFA40e+R4cuCx6DO/s9+2NpKU?=
 =?us-ascii?Q?5IERosOTsoqMECDG/LGfYmXOeuKLeq9rjb6wgqjdQEObHCJ/9TcZGz3j1oFU?=
 =?us-ascii?Q?obWTD66Ehee32h8N8IcJd5fjWFhNtH528vSs+t6RCvIIkHIaxjJYk6pEHXmA?=
 =?us-ascii?Q?aCD/5AzYYRwCUsHRFioTQy8tE6dsOzQ4bkDA7WOdUg2BBKw4n5MNIJchAHmU?=
 =?us-ascii?Q?IZQEIfuTFY2ODXSxfEQkr/Lr4nCaJ+t8R5ZBMspb+JlvQgWC/YoXAfvo5tp/?=
 =?us-ascii?Q?ZCHNAOR6u/bqdBkSpTBx3J4Dmc68dccxatRWZmv1UWNCn2iEQ8kKzXfVY3EV?=
 =?us-ascii?Q?PemV+MXX6iJgPNVWmpxqWKs9QRMnqqcPlT6kJMg2dFjR4INhz3KasuTFn0Kq?=
 =?us-ascii?Q?O5YztEuICZi0irg/VPxCxiUkXFojCZ9H/h+UKG2ssA1ERQencrV140AfMkd8?=
 =?us-ascii?Q?RWCOfXqJaMd72GVIVXWYiyDq2OT06kC/+I2PwG/a6mmZuo4/etLN4g2qPSJO?=
 =?us-ascii?Q?G+bXQrK5uXnPzCXY84wwciWzXyDcRWttERukutzfSkVzmbD4+R95THBX2Wdg?=
 =?us-ascii?Q?IeIR1Ez2e+GRKIEsJiVCtf09WFkUTVFVEhiHDzPLUjHWoxvuu390jHkKchy4?=
 =?us-ascii?Q?vYFPRuYn3zGC6X5Ye/5p3qmGOBp1KFiFhe42w57/6niu/ScHt4u7mVXRdo1u?=
 =?us-ascii?Q?g0gJ+JjlJ+68sF9pVEVYuEvo2fbUhySjZaxnsLSfz3J7NN3ZFaLJPsYNuKuI?=
 =?us-ascii?Q?R2k97t1BnXwFygweJJWicBxNrFTBuF4T4+zqc2YqTZ6L9N1IzHzxSVEfJhVb?=
 =?us-ascii?Q?IRbDgDduU1934Sa7dfwFaaxiSlCcpnbP2RV/IUSphWRUQ8SfZKb2/oCp2PTV?=
 =?us-ascii?Q?fKTT5rlpGioJakzgpQdSdbzUC3xWphZOrvdOSGJ6GidJl1Pe2ChPjzKAVzd/?=
 =?us-ascii?Q?gvnI6DMa+puyK4b/6hj7xvyjMVIZPF9xCqhbcn6aM/9nJ0aUHJehjBvhQAYs?=
 =?us-ascii?Q?QjOCg0MlNZ4qA0zWLoOsDM65oXCeJB48jDsj?=
X-Forefront-Antispam-Report: CIP:216.228.118.232;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc7edge1.nvidia.com;CAT:NONE;SFS:(13230040)(376014)(7416014)(36860700013)(82310400026)(1800799024);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Jun 2025 17:33:20.2388
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: fc3bf00f-a8b4-4a94-0640-08ddb40e60de
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.118.232];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: BL02EPF0001A101.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ1PR12MB6243
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250625_103337_224415_F1295B24 
X-CRM114-Status: GOOD (  21.87  )
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

On Wed, Jun 25, 2025 at 09:37:18AM -0700, Nicolin Chen wrote:
> On Wed, Jun 25, 2025 at 03:38:19AM +0000, Tian, Kevin wrote:
> > > From: Nicolin Chen <nicolinc@nvidia.com>
> > > Sent: Saturday, June 14, 2025 3:15 PM
> > > 
> > > +int iommufd_access_notify_unmap(struct io_pagetable *iopt, unsigned long
> > > iova,
> > > +				unsigned long length)
> > >  {
> > >  	struct iommufd_ioas *ioas =
> > >  		container_of(iopt, struct iommufd_ioas, iopt);
> > >  	struct iommufd_access *access;
> > >  	unsigned long index;
> > > +	int ret = 0;
> > > 
> > >  	xa_lock(&ioas->iopt.access_list);
> > >  	xa_for_each(&ioas->iopt.access_list, index, access) {
> > > +		if (!access->ops || !access->ops->unmap) {
> > > +			ret = -EBUSY;
> > > +			goto unlock;
> > > +		}
> > 
> > then accesses before this one have been notified to unpin the area
> > while accesses afterwards are left unnotified.
> > 
> > in the end the unmap fails but with some side-effect incurred.
> > 
> > I'm not sure whether this intermediate state may lead to any undesired
> > effect later. Just raise it in case you or Jason already thought about it.
> 
> That's a good point. When an access blocks the unmap, there is no
> unmap happening so no point in notifying devices for ops->unmap.
> 
> And, when the function is re-entered, there could be a duplicated
> ops->unmap call for those devices that are already notified once?
> 
> So, if we play safe, there can be a standalone xa_for_each to dig
> for !access->ops->unmap. And it could be a bit cleaner to add an
> iommufd_access_has_internal_use() to be called under those rwsems.

Correct: it has to be under the xa_lock. So, this pre-check needs
to be done in this function.

Thanks
Nicolin

