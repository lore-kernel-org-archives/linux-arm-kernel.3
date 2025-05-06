Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 42751C3ABC6
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  7 May 2025 02:33:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:CC:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=3HKfT6ocbULwrgv2K2mQ+uAPIyk8urZ/WzBV2gZOKhA=; b=2xQSF8nibMqlUyi3B/a+NdN7/2
	ONvaJBYw/xvuyjvgVL6FPcWJK20nfPJI5j65Idbk4O+vgRVCgJvn0gilxsrVgiyguhEgy0s3Sb/vt
	kJ/VHaaOS4oymrnF0grTmk2Ips7mKDoEVY2vTf1qWa9RN0GDNYbUwUkFPIplw5f8yAzEKIOth6R4B
	xh5Zd8M2nZAAL75qAeQP2SfePt669f7V9/1P7QKcpI0gmdX99KpFuW0DoBDWNMv0VzCxOkAnsrp2Z
	cU/5ioQZM9ijCLoeTvTkW3jwxu5fhPvgB61kjBfhrZQGIzxw0S8nCoOoTU4KM+GUYrFyqGWmiuQdB
	81HKxrOA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uCUag-0000000DugM-1m7C;
	Wed, 07 May 2025 02:32:58 +0000
Received: from mail-mw2nam10on20601.outbound.protection.outlook.com ([2a01:111:f403:2412::601] helo=NAM10-MW2-obe.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uCOfJ-0000000DL5a-2kAZ
	for linux-arm-kernel@lists.infradead.org;
	Tue, 06 May 2025 20:13:22 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ZoPYdvMez1I68g/0klDHkNmTTeDlmd/5UlRCQIBErpgIUCT9On32xQg+23duDIGrnIKt7CODaSD7awYnGJtonwKlySFvyun8US0FyAoNeUI8bOeurCfmuFKJeB7XwOzDzf8JQsBIxupUQqArL9yB0ix7bKeJjnU2hvEbfX8ohLewHvHKXDfyhbQH1759s9jQDC86zHUPNzo/YSqK7C8jOnrKiH8MFNxuVHTf0GXQOK1DYkr+uqfqJiX0qfUQiVzhNhISBg1wLMmJZY4Lr5iTfadilW9qEH3GnLO9hjSgiabxGvgc1OqEM8qFDfvbT+9qFb4oevLH7xgX1k+827Wbng==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3HKfT6ocbULwrgv2K2mQ+uAPIyk8urZ/WzBV2gZOKhA=;
 b=nC0mBWE8wRNed2BVs6vdqAeUtAGECIx2iLL6OMtnZwqNDEAjqXpoxkLJpKzsKueV5cC1GdwlK9h8R1SVePwmuUbLXsxl/bBWRA1jRfk+HebNjoZ4NOBDM6O+nl6vRYatEdqrhIncBIQ2MStJNmWpoeB/BsF/svFqWpBodNyJTqYx0QajQxzAPHKe+cSMEq/YUUCc8lg/LFMhWBaWZMTP/aKJPWvqGBzhnSu678U7ekf+rDSJrczxTk5hQW24K8dVOWGAzyihjzU0OnsmsRiIJ8wOsQ2TpVfm7DgK2E4s+QtT0adQf8ayU43aZ8InQd6jmAU9mACAvm5tmYRs+DKhKQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.161) smtp.rcpttodomain=lists.linux.dev smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3HKfT6ocbULwrgv2K2mQ+uAPIyk8urZ/WzBV2gZOKhA=;
 b=BUb8MSGON3Sf/zMPO6jsm79H23Aids/Tc1qzcoiIE28kcup9h8wKp9NQpQhg3wJmRNz9fICS4p1a8zioO3K+8ZXKZXaWqAKaL7iWtkgEi45loRkotea8pquQE10MXSyVWPOrw+X88RXe01Xu7ixVgNsdmXGO6aBHfum3/r6f6W13exlQWJmodrWWlubY9xjFfGw/h4pHXel8+YPe0unUTSz9EIL5bfVx2CkBfKZCs5y9hzz898Obl/njrwf0q9v6CdCkrV88M+ioxPlkhTaWFQmPUF9JhcmSIgzD//tQpQULIxpz26quScFnqYsfFSMCd13LdtVvyYqS+RXeczMrKA==
Received: from SJ0PR03CA0191.namprd03.prod.outlook.com (2603:10b6:a03:2ef::16)
 by DM3PR12MB9434.namprd12.prod.outlook.com (2603:10b6:0:4b::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8699.21; Tue, 6 May
 2025 20:13:11 +0000
Received: from SJ5PEPF000001D7.namprd05.prod.outlook.com
 (2603:10b6:a03:2ef:cafe::1a) by SJ0PR03CA0191.outlook.office365.com
 (2603:10b6:a03:2ef::16) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8699.27 via Frontend Transport; Tue,
 6 May 2025 20:13:11 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.161)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.161 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.161; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.161) by
 SJ5PEPF000001D7.mail.protection.outlook.com (10.167.242.59) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8722.18 via Frontend Transport; Tue, 6 May 2025 20:13:11 +0000
Received: from rnnvmail201.nvidia.com (10.129.68.8) by mail.nvidia.com
 (10.129.200.67) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.4; Tue, 6 May 2025
 13:13:04 -0700
Received: from rnnvmail202.nvidia.com (10.129.68.7) by rnnvmail201.nvidia.com
 (10.129.68.8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.14; Tue, 6 May
 2025 13:12:55 -0700
Received: from nvidia.com (10.127.8.14) by mail.nvidia.com (10.129.68.7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.14 via Frontend
 Transport; Tue, 6 May 2025 13:12:50 -0700
Date: Tue, 6 May 2025 13:12:48 -0700
From: Nicolin Chen <nicolinc@nvidia.com>
To: "jgg@nvidia.com" <jgg@nvidia.com>, "Tian, Kevin" <kevin.tian@intel.com>
CC: Vasant Hegde <vasant.hegde@amd.com>, "corbet@lwn.net" <corbet@lwn.net>,
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
	"alok.a.tiwari@oracle.com" <alok.a.tiwari@oracle.com>, Suravee Suthikulpanit
	<suravee.suthikulpanit@amd.com>
Subject: Re: [PATCH v2 10/22] iommufd/viommmu: Add IOMMUFD_CMD_VCMDQ_ALLOC
 ioctl
Message-ID: <aBptQO9VBnO2AG9V@nvidia.com>
References: <cover.1745646960.git.nicolinc@nvidia.com>
 <094992b874190ffdcf6012104b419c8649b5e4b4.1745646960.git.nicolinc@nvidia.com>
 <b0d01609-bdda-49a3-af0c-ca828a9c4cea@amd.com>
 <aA/exylmYJhIhEVL@Asurada-Nvidia>
 <b8338b47-6fbf-44ac-9b99-3555997c9f36@amd.com>
 <aBB1gLfahnLmn0N1@Asurada-Nvidia>
 <a3860aed-5b6b-4e68-a8fd-1a6ee28ba022@amd.com>
 <aBEI+T7P+hV8Y6tU@Asurada-Nvidia>
 <BN9PR11MB5276A00FDB2685B394FB9D4D8C892@BN9PR11MB5276.namprd11.prod.outlook.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <BN9PR11MB5276A00FDB2685B394FB9D4D8C892@BN9PR11MB5276.namprd11.prod.outlook.com>
X-NV-OnPremToCloud: AnonymousSubmission
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ5PEPF000001D7:EE_|DM3PR12MB9434:EE_
X-MS-Office365-Filtering-Correlation-Id: 3d421ba3-832a-49d6-3415-08dd8cda6ce6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|36860700013|1800799024|376014|82310400026|7416014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?3t42iguishOmiZlM5uQqb1Q/HGXNdDXtPzI6HHHfmiVfJO5POvVhH+7l8IzB?=
 =?us-ascii?Q?NXfTVH+16LQHfP0LIk+RCQMyCFUhWWnAkwnm38qK1fPY6hZh9rZ03lasHQfN?=
 =?us-ascii?Q?4GREu25S2s9hGozaz4i0VfMpUDb1cVAFTJN3lPsPCxlZkwgOtAEFSrq6qL40?=
 =?us-ascii?Q?+o3p81+eaVS/aKHYDmre9GwtXos3D7+rLl00rNuyF/F3IT44w7QI3amhOjah?=
 =?us-ascii?Q?+/ADz/2+OWo9uNcv1FtaKOt75hmZyKsqrNlDzqudrGKBMwC/IUsI5rqx1CWa?=
 =?us-ascii?Q?TW43Nzg5K4DxKHpnzPZIbMVIu/Dc6k9dCdtAg3DjMkWI+dI/HijXdRTISM/B?=
 =?us-ascii?Q?OGGYtQAygxUwiwR7J4D+hfO1dmQBYwCbRNvMQDG11vSc0NTHPY7hHoyEnLO8?=
 =?us-ascii?Q?dGg+DrQm0NywQ+/yg+0/B1ObbDRaKR8VSh1MVxKBQthp6kakJPTB2l5TKSts?=
 =?us-ascii?Q?Pqjkx3R0sW86IVabDHzyK8SPrLrMrSsZOCHGtoFdr9yF4BN5l6GOl5kNgjHJ?=
 =?us-ascii?Q?hec6/soWqKvc1YOAKkkywCPBu0CMKvHA5jEv6iN/ZesDZtSXKkjr1gxkrVur?=
 =?us-ascii?Q?2vpJ3FcWskStSRzQ56WvAL/IKmWZ/ik84AiS1tYQ1MV/fAFZuYqpfYk1R4ok?=
 =?us-ascii?Q?E26/0fw8Oe6EYafWGskI+3k0JpUEP44QvRSXVn2y6SuG05oPxHP8hLiil9WH?=
 =?us-ascii?Q?KJBjvOezHX3Pv4/3bAJNnsqbeCiCKuKTSU+8Term6MHOzNaVLk11hjSWfRqY?=
 =?us-ascii?Q?GUDtTr4FgSPp1zVwi/3qp5uI1ndYprJNUsvOoSL0OQBXa2ENWXCXUjYVRNQD?=
 =?us-ascii?Q?gBpd1f3VktRK13mVZoQnaG40Nz221Un03/TUfBRedb2ZYNimuRSCNrVkyLF+?=
 =?us-ascii?Q?Cc53rtBuSeu6tPTUurek4gUZk+ZIsHW1qJBazXAS1F40R8h6+GmuBDvpN18N?=
 =?us-ascii?Q?3wif/c06m8cm/BrE3VVIr49C/6xJwx+psfN4rvAyXpOG6OTu73RkEf/J1LM9?=
 =?us-ascii?Q?95Y8fU3H0CO7Hx0RrDA92uT0jclEogVg1vmqfWlMZdsiZuSG6g5VVfDTXd0j?=
 =?us-ascii?Q?XQHsR/eSQDkI54WJ/n3fXfWySb24vACdRFePYJylCOHdcUlrtF9KDcB2r6fT?=
 =?us-ascii?Q?TkeyC0qceKdlVEg2TuOmLEt7MyGtTgw5IRC5klG9y/P/mmGOxnbjRJ6CWijF?=
 =?us-ascii?Q?wK4nfY+VSj/sf/KDjAlOZcezh8GgkjTTLjObeLS5jQ8VWqYrW3YByBCFEp4/?=
 =?us-ascii?Q?ZeznENdeC9xqudZ0gCNPkn+l+dZlQEVve+f2LmrIt+V4FqnTpGIXs46nDsW9?=
 =?us-ascii?Q?J6JivALMXMelzT12OlywgK4U/l/tt8EuyjLybLlEqHLkr9fnTjvywrlydFtN?=
 =?us-ascii?Q?VD1m8eszVLdHTxfkOBepFl7WnKQe52pxPplg0I3U2mWigtDGRJp4lXFc8rUU?=
 =?us-ascii?Q?kAQ0VDvUDiOZUGu1KeyZINbFWaJ6f+uxnw1sBAofixtA8LpV0TKr2RCGDB/p?=
 =?us-ascii?Q?l0tpVSor/JrEr8adyUiPKShzHHkAIP2qQyoh?=
X-Forefront-Antispam-Report: CIP:216.228.117.161;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge2.nvidia.com;CAT:NONE;SFS:(13230040)(36860700013)(1800799024)(376014)(82310400026)(7416014);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 May 2025 20:13:11.3667
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 3d421ba3-832a-49d6-3415-08dd8cda6ce6
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.161];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: SJ5PEPF000001D7.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM3PR12MB9434
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250506_131321_697725_0F0AC6B7 
X-CRM114-Status: GOOD (  19.28  )
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

On Tue, May 06, 2025 at 09:25:59AM +0000, Tian, Kevin wrote:
> > From: Nicolin Chen <nicolinc@nvidia.com>
> > Sent: Wednesday, April 30, 2025 1:15 AM
> > 
> > On Tue, Apr 29, 2025 at 03:52:48PM +0530, Vasant Hegde wrote:
> > > On 4/29/2025 12:15 PM, Nicolin Chen wrote:
> > > > On Tue, Apr 29, 2025 at 11:04:06AM +0530, Vasant Hegde wrote:
> > > >
> > > > Will the hardware replace the physical device ID in the event with
> > > > the virtual device ID when injecting the event to a guest event/PPR
> > > > queue?
> > > > If so, yea, I think you can define them separately using the> vCMDQ
> > > infrastructures:
> > > >  - IOMMU_VCMDQ_TYPE_AMD_VIOMMU_CMDBUF
> > > >  - IOMMU_VCMDQ_TYPE_AMD_VIOMMU_EVENTLOG
> > > >  - IOMMU_VCMDQ_TYPE_AMD_VIOMMU_PPRLOG
> > > > (@Kevin @Jason Hmm, in this case we might want to revert the naming
> > > >  "vCMDQ" back to "vQEUEUE", once Vasant confirms.)
> > 
> > I think I should rename IOMMUFD_OBJ_VCMDQ back to
> > IOMMUFD_OBJ_VQUEUE
> > since the same object fits three types of queue now in the AMD case.
> > 
> > Or any better naming suggestion?
> > 
> 
> What about IOMMUFD_OBJ_HQUEUE to differentiate from other
> pure software queue structs? 'H" stands for direct hw access to
> the queue object.

I think it make some sense. There has been a concern of mine that
some day we might need vQUEUE to deal with some non-HW-acced case,
given "vQUEUE" is named much wider than what it actually supports.

Also, vEVENTQ and FAULT_QUEUE fit into the "QUEUE" category too..

Though "hQUEUE" would break the naming pattern that we have, maybe
we could try something like: "HW_QUEUE", "DIRECT_QUEUE", or so?

Jason, do you have a better idea?

Thanks
Nicolin

