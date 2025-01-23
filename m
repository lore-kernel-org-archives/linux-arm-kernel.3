Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5DC38C02182
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 23 Jan 2025 07:05:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:CC:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=7PUDWflv1IsiwIz6s7j0WbLrVTgZNrVXZBwlWJYex78=; b=ZowLERON1aj4cXGnjTiPJf8KyC
	c8x8qT9OvCZGxATMFE7lM4/sWFZp7vmXRmIyeXcIZTp3jXsqO3HscJRSQmQ49oxdC8vFF6qNRTUln
	R7pqzeOHHvygyc17tKMxUb2NBfr6BlCLrxyoeVKa7amgIdZq+mB2lMETdLbpIFF594xQ+mM3Wq+i+
	MWEvlGcaKdsZwmD5rh4AiktZurX7mO6+CbHtv7WzuJ+C4HJwkitA6rkkwbrPsOQ0mliYa3tK1ZFto
	urpQB1dFBwFeU/TuGv5FLlu1YXogNJu0pH9FwrEvvUXAuZ7Zufi7MDZxkyKPFFW0/v2tZUnquos1I
	H0MUtorA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tarHU-0000000Bpvi-42TP;
	Thu, 23 Jan 2025 07:05:36 +0000
Received: from mail-dm6nam12on20621.outbound.protection.outlook.com ([2a01:111:f403:2417::621] helo=NAM12-DM6-obe.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tarFI-0000000Bpbu-42NS
	for linux-arm-kernel@lists.infradead.org;
	Thu, 23 Jan 2025 07:03:22 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=hI8f2fIetf+WUXjJj22guRSw8Iiq8JLL8AJ2e38lHiUPqVQIOUd4esfyNrfgOEokjcIlj3dT46r7y1pg8mpPiAAuq+/31Ogv7x6oLwPssd0PL2RMeY+Cq78PHBRZvJggToNLxFFlLjFMYaE6aOymBpKNAJySNHVayPzixQyK3M6REZZVNn59QC/5Yr2FaosymD1e7BuFt4kePdmJOZQGaFhdDO8DdetrXxTWkKAdre/NB4z57G7gN+XFUzxJkwjXoY4y5S1B7GUYNjny45nBHnE3zpIuNbjZQ/385mGDfPxl/XpaFOt3vC3bZO6ybFc/+hgUjHXKvmF4fm2zH4T9cg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7PUDWflv1IsiwIz6s7j0WbLrVTgZNrVXZBwlWJYex78=;
 b=IYykq2JFYu7PH0fGW9ihJW/lPUH4p+LEqt53Us9x3BzUXDH1kMDL+bWXmoMqhHlo1bT6XE+XzEZFcWUXMhuz6BeW8bZSJwSwsiju14V7Jb36uQd0CW4FPT+DXQWNzxuiJghdQNm3LryuXM/tHO8kkd+eXonjMkEZSPHUYi8cE6h0CPnbK/C+xM65eXnjyc/VgXkDlozq3+2HoTKwAmEeALu1r+hCSw67rd6F9wET0pEdflo7/XGWiYLHJ07qT+xjDR76o1MY9Wy+QNGekYHoENC0pD9RQ+mgj8P03fJ1BpIkxN8PBtiPZraqHWAn1LBRzVYrX31W6e/sZiBINqL1MQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.118.232) smtp.rcpttodomain=redhat.com smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7PUDWflv1IsiwIz6s7j0WbLrVTgZNrVXZBwlWJYex78=;
 b=qCnuGAX9X5Y1pMbmZ+sztVYMZ75hafD6kQ/dJVnyL41lf8IZBChZAV9zAH5VGcKUwdbu3NqFeji0p3lyeZQt0SdRsxi1vJddtELM9GILpVmLwNjeRQn5Huli/fvLzzWpH/Yo/2tpz58JCUAFZN0dpabJuThQCHyLmsnpeUGahizkHFAMPOObpKwiM+JZAEiLRBk9b/vchMVW/caGHNRKneDAY9+JVqjTcPrki2GmENPewtp6r6n0odzeSlBOMMeSiUbapOiJeWMQlGtuv8xgYxxhFwNLCnXscY1oy+Niu6Ivhq6wxgTiP1puxi7NuKsKXLSaeIHr8OCNawnZ2zOfDA==
Received: from MW4PR02CA0022.namprd02.prod.outlook.com (2603:10b6:303:16d::15)
 by PH7PR12MB6393.namprd12.prod.outlook.com (2603:10b6:510:1ff::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8377.16; Thu, 23 Jan
 2025 07:03:14 +0000
Received: from MWH0EPF000989E7.namprd02.prod.outlook.com
 (2603:10b6:303:16d:cafe::eb) by MW4PR02CA0022.outlook.office365.com
 (2603:10b6:303:16d::15) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8377.14 via Frontend Transport; Thu,
 23 Jan 2025 07:03:14 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.118.232)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.118.232 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.118.232; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.118.232) by
 MWH0EPF000989E7.mail.protection.outlook.com (10.167.241.134) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8377.8 via Frontend Transport; Thu, 23 Jan 2025 07:03:14 +0000
Received: from drhqmail201.nvidia.com (10.126.190.180) by mail.nvidia.com
 (10.127.129.5) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.4; Wed, 22 Jan
 2025 23:03:05 -0800
Received: from drhqmail202.nvidia.com (10.126.190.181) by
 drhqmail201.nvidia.com (10.126.190.180) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14; Wed, 22 Jan 2025 23:03:05 -0800
Received: from nvidia.com (10.127.8.9) by mail.nvidia.com (10.126.190.181)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.4 via Frontend
 Transport; Wed, 22 Jan 2025 23:03:01 -0800
Date: Wed, 22 Jan 2025 23:02:59 -0800
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
Subject: Re: [PATCH v5 08/14] iommufd/viommu: Add iommufd_viommu_report_event
 helper
Message-ID: <Z5Hpo+Q6gcwc0+r6@nvidia.com>
References: <20250120181854.GQ5556@nvidia.com>
 <Z463eXfgNArCOfPn@nvidia.com>
 <20250121183611.GY5556@nvidia.com>
 <Z4/7pGx6F1mpAUuV@nvidia.com>
 <20250121200924.GZ5556@nvidia.com>
 <Z5ALWFVTOSC/8+ji@nvidia.com>
 <20250121211404.GB5556@nvidia.com>
 <Z5AUNVHzJPATVqAY@nvidia.com>
 <Z5Cmvfp4JW9vmMTP@nvidia.com>
 <Z5Eywl1o9pdYyuQO@nvidia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <Z5Eywl1o9pdYyuQO@nvidia.com>
X-NV-OnPremToCloud: AnonymousSubmission
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MWH0EPF000989E7:EE_|PH7PR12MB6393:EE_
X-MS-Office365-Filtering-Correlation-Id: 65ae463e-10ac-4ff9-b4fd-08dd3b7c0161
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|82310400026|376014|7416014|1800799024|36860700013;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?g6n46JD4XoLiSogMFA2PIlth23m2HEgxWU/Dkrw2sRCRVer6O1/nSSjHn0On?=
 =?us-ascii?Q?oZAmNcKVCLUg1zZ/nKPwyN0MHmEooJiZvnnO0bOHhN3Gj5bCT1w1z0Yq7MtH?=
 =?us-ascii?Q?Jy8QcHn6fPIDyDZgFBrBIy8HHx16fPsZRryTakILATTog9lu+50FrA66SjI8?=
 =?us-ascii?Q?eAzYtQDoABlCimmQ6bN2c+EijEFL8B+MQQPg6WQ/qf2bEqE6xC82oC2PU0iK?=
 =?us-ascii?Q?5CXwq04FQZX/y/fMbWE0vDQsxmxc3WqNXZCtI4fhu+XWu1z9kElUnwBi/gem?=
 =?us-ascii?Q?+gtLxyok4J7LtG1aTfQC0kXNLVy43m6+DwQ3xIy59rHIC56oDL0rhZQexGUs?=
 =?us-ascii?Q?TiYRN3lDGbUObNDU1DPbmmyc/5BSOGwcLbuxxx15vxsPYwXFPybQq9CBp59k?=
 =?us-ascii?Q?kyFtAPJ9JwltT0yUpSEFq4s+2TzcHmJDoJYbZeJDhioUS1UJpcIydMY8sYNl?=
 =?us-ascii?Q?Gz71bBwNbSp8704TF5+wazs6BgwtBQDgLS7TiOMjMXyV/KrS7O+mWWwagrPc?=
 =?us-ascii?Q?USqlbK+VrW556Raj9rFwBv0PwE14ofqI/QML8JZYwafjCAUmIiOer2oUke9a?=
 =?us-ascii?Q?deWkN+pdjxJ2G47eqwHJgmb5eD64AC3p3qLep0JUV89ACm5XaZ0eXMSyxbTl?=
 =?us-ascii?Q?f38sj5d/8Zm3VUwHMK6Nd2xwxJ2wBkAizg0pM5FtJhuDUKE+hA93ZE1Ig9o3?=
 =?us-ascii?Q?igonZT8HR0Ch+ECBvDLNvz0IL+HO3Jbwhpw8QXkojXvEpTdOiXWa4j9SSKmf?=
 =?us-ascii?Q?PMExCAzhx6zmAqRDEx1aOTSRqyAmIvoinV3z4DWJjyr5c8nGuLOuVrhC94ym?=
 =?us-ascii?Q?STZAlUV/SjxsNItEqNtS772JvpTIrJ2WlHM0DTGpajqoZNQ0RvWn1OJKChJr?=
 =?us-ascii?Q?Eg35E6TSZTAOuYePhx4O+BtGk9PYrmKJ7dlgWQzR3jVwztMpJ4KLXZu/B+py?=
 =?us-ascii?Q?OkQYTv8fIi/5/9hAAy68qS5l4776NzxwaZR0J6wmEeNpQm1YnEGXw4JPm86W?=
 =?us-ascii?Q?FwHj9I8QsqCLRW6BS15LAocpfQxh9skOnuM9l6fO4cGqKL2qVww7r8mG3ZTu?=
 =?us-ascii?Q?9u3q/vq3f4dlGBxIMKubWxTUJBTBoGxFYQJGal8cM4L5gMNtL/VS8ENN8cZM?=
 =?us-ascii?Q?vkIOudTj8J+NmMJoEbPBsZ4+Zi6bfQVoM87yJtJWtJ+t4Bp8196mJEOATcbC?=
 =?us-ascii?Q?XuPfXFw1IBUSieMSJ2Jbl6QXEdJ8cq8b6UPParMakuHV+ypjqmKoLZLewwgf?=
 =?us-ascii?Q?N79zpldIpyEx7ysm8mHebYGIMW+roRU+X2gj8Qvs1N8rcIL1LXEQlcWkptV3?=
 =?us-ascii?Q?zbQEYy9PZF9fxt9KOYyFaEQvQJYCHoiDpJ27nRcCFF71+4ozk0+XapDnnhFi?=
 =?us-ascii?Q?FBa6rp+90+G4+Q3OC2IORTO/Fc3HYZ8t6ueAVSk93wWV8pgzdWZAbKJZKSde?=
 =?us-ascii?Q?lFOf/RtskL6/8vU7D5ynJHKFHfqdJN/rfhti6ddWFGN2xgWauYCxygFdihtH?=
 =?us-ascii?Q?xTCMqE15z+p41nI=3D?=
X-Forefront-Antispam-Report: CIP:216.228.118.232;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc7edge1.nvidia.com;CAT:NONE;SFS:(13230040)(82310400026)(376014)(7416014)(1800799024)(36860700013);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Jan 2025 07:03:14.0861
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 65ae463e-10ac-4ff9-b4fd-08dd3b7c0161
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.118.232];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: MWH0EPF000989E7.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB6393
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250122_230321_040873_721E4525 
X-CRM114-Status: GOOD (  24.01  )
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

On Wed, Jan 22, 2025 at 10:02:49AM -0800, Nicolin Chen wrote:
> On Wed, Jan 22, 2025 at 12:05:27AM -0800, Nicolin Chen wrote:
> > On Tue, Jan 21, 2025 at 01:40:13PM -0800, Nicolin Chen wrote:
> > > On Tue, Jan 21, 2025 at 05:14:04PM -0400, Jason Gunthorpe wrote:
> > > > Since we don't hold the spinlock the whole time there is a race where
> > > > we could pull the overflow off and then another entry could be pushed
> > > > while we do the copy_to_user.
> > > 
> > > I see. I'll be careful around that. I can imagine that one tricky
> > > thing can be to restore the overflow node back to the list when a
> > > copy_to_user fails..
> > 
> > Hmm, it gets trickier because the overflow node is a preallocated
> > single node per vEVENTQ. We must not only check list_empty for its
> > restore, but also protect the overflow->header.sequence from races
> > between atomic_inc and copy_to_user. However, we can't use a mutex
> > because copy_to_user might DOS...
> > 
> > A simple solution could be to just duplicate overflow nodes, each
> > of which contains a different sequence, like a regular vEVENT node.
> > This certainly changes the uAPI for read(). Though the duplication
> > of overflow nodes doesn't sound optimal, it's acceptable since the
> > duplicated nodes would have been regular vEVENT nodes if there was
> > no overflow (i.e. no extra overhead)?
> 
> Ah, didn't think clearly last night.. We can't simply add overflow
> nodes either for rate/memory limit reason that you concerned about
> in the other email. On the other hand, though certainly not being
> ideal, indulging the race at the sequence index might not be that
> harmful, compared to the extreme of the other case..
> 
> I'll give another thought today if there's some other way out.

I made a change to duplicate the overflow node in the fetch() that
is protected by the spinlock, which is used for copy_to_user. Then
the other routine for vEVENT reporting, protected by the spinlock,
can race-freely update the preallocated overflow node.

Nicolin

