Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 33E02C3ABBF
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  7 May 2025 02:33:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:CC:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=g8OlaPzTgQwLF58wrbklL63f42htsLU0DiUMvyxJBpA=; b=0mwby0LFJxAxcDCt2wACgqIyvS
	DgHJIxja0GJIqDIiZ2vSJWpl0k3gR8JeNriF+kMLmGjV8X8/nA1N65l8R5WMriaAogGWHtwH3l4/Q
	PMCb5yL9zZIzzYzlYE52zdfpsLlB97lQeq6KwvosM/T8xCeDr1oWEiVSF4HJgmb5SEMpvFSapBmwo
	hUIU6tb6XAYHXwq3OyQ1FTKAKZ1wPL2xl/WUV1prnVXWOkIodITLXEk1FOEd69yeh0MjTNfPZjg+k
	gk/L7TQCyWrI2d3R5SECw1SAxs3LMN0hAYHIUimBn/ghPzoZvihf4P44F2zR0gPh5wek7Sh3S9Wot
	K+lFKxIg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uCUaw-0000000Dv9B-1y93;
	Wed, 07 May 2025 02:33:14 +0000
Received: from mail-bn7nam10on2060b.outbound.protection.outlook.com ([2a01:111:f403:2009::60b] helo=NAM10-BN7-obe.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uCPJT-0000000DOGx-35Qq
	for linux-arm-kernel@lists.infradead.org;
	Tue, 06 May 2025 20:54:53 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=OPJuI+sza9P9pVYcViNPekhUcXd8MpQDX6sRrklQgr3kqNtTJD+5twcsYep23QZFQYgSAgBEyUIIJlWahQp81EAbHdwEsNBNS/8o91qsODzaoYIACCOnLwJOTn6/aaFKdZgTqQdlbgR8zcpf9pNp/pofGa4wqqJD8Y9sPj+FytUUP2sk4gVUqZIXcVo41ylfJ6NH3j/R3u/TpRqy67OcfdQmEVWOgo8+13eAGIL2+jyh0cp5PFhcOg3owo/+AIJqXB5jDf3lyvqkH3tpv6p0XCb85y6P1XpESCWoNQ7nlq/hnH1FZE9K7Z7InD4L9ZsN0b3z2P8vvCBffaWBkh0vkg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=g8OlaPzTgQwLF58wrbklL63f42htsLU0DiUMvyxJBpA=;
 b=JoXNJWZABxcvyaWg3nL5NorH3BtwcL9aBe1MJwQEv74vYqEKgE2tbzjbE5RE1jEd4Je2lwh2yw768JeQmjHYzELcRFIK8A6r9KJbrbnrpwfK3OUN57xYEWjlDwfr+SZZso87jaXd59FnDdR5sGU9xZIaGDC3ZxeWu57OOqa2TuLANdqwTS3GTFbmFwddlTgQm6qmPQD6+72+vqGZJQWZZcYkVblWaaO3G2fyKpgZGM9RovOYfCtJ2DBN+Jp4uIz9IGQZ+8InX7tfnfFYX1mpX1kQwaaDxFGCB5ZAHnhV1s7j/gzn1kIUbJGq+jcsc47xXR/Ks0Sk5HUlNF6lmJxxrg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.160) smtp.rcpttodomain=lists.linux.dev smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=g8OlaPzTgQwLF58wrbklL63f42htsLU0DiUMvyxJBpA=;
 b=q/ZZUAQbLWWkBQJstAadPJJn1nrqjMcMy0BDPgJl0u/m6oa0KxIR+/BDEcRTS25rutVpD7PUG4ygkVDfE3/F8aNZqp3NIW0eREI32AhPTSNjK3UDDzXlEada5Skdax7l4S6FrarCGXljEgr5LQismmswbXiMI12cW8kqIxBjyEPMJKg4DSE7/nmisNNQP2aWYa9YPOCQcICqCrz/lETrSuQ9bfQVJnCzfGPqXteh16VvaLuuJGepT35ysSg/v08DZ3QroEyvapQytX1F6k6AW2uuonZNewQumIkG+gXZuO8CtSo53ZOfwTtz9SQgT6G2TP+zgKX4/bQOlxgAFuNQkg==
Received: from SA1P222CA0081.NAMP222.PROD.OUTLOOK.COM (2603:10b6:806:35e::7)
 by DS0PR12MB9423.namprd12.prod.outlook.com (2603:10b6:8:192::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8699.26; Tue, 6 May
 2025 20:54:38 +0000
Received: from SN1PEPF000252A4.namprd05.prod.outlook.com
 (2603:10b6:806:35e:cafe::91) by SA1P222CA0081.outlook.office365.com
 (2603:10b6:806:35e::7) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8699.31 via Frontend Transport; Tue,
 6 May 2025 20:54:37 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.160)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.160 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.160; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.160) by
 SN1PEPF000252A4.mail.protection.outlook.com (10.167.242.11) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8722.18 via Frontend Transport; Tue, 6 May 2025 20:54:37 +0000
Received: from rnnvmail201.nvidia.com (10.129.68.8) by mail.nvidia.com
 (10.129.200.66) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.4; Tue, 6 May 2025
 13:54:26 -0700
Received: from rnnvmail201.nvidia.com (10.129.68.8) by rnnvmail201.nvidia.com
 (10.129.68.8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.14; Tue, 6 May
 2025 13:54:18 -0700
Received: from nvidia.com (10.127.8.14) by mail.nvidia.com (10.129.68.8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.14 via Frontend
 Transport; Tue, 6 May 2025 13:54:13 -0700
Date: Tue, 6 May 2025 13:54:10 -0700
From: Nicolin Chen <nicolinc@nvidia.com>
To: Jason Gunthorpe <jgg@nvidia.com>
CC: Baolu Lu <baolu.lu@linux.intel.com>, <kevin.tian@intel.com>,
	<corbet@lwn.net>, <will@kernel.org>, <bagasdotme@gmail.com>,
	<robin.murphy@arm.com>, <joro@8bytes.org>, <thierry.reding@gmail.com>,
	<vdumpa@nvidia.com>, <jonathanh@nvidia.com>, <shuah@kernel.org>,
	<jsnitsel@redhat.com>, <nathan@kernel.org>, <peterz@infradead.org>,
	<yi.l.liu@intel.com>, <mshavit@google.com>, <praan@google.com>,
	<zhangzekun11@huawei.com>, <iommu@lists.linux.dev>,
	<linux-doc@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-tegra@vger.kernel.org>,
	<linux-kselftest@vger.kernel.org>, <patches@lists.linux.dev>,
	<mochs@nvidia.com>, <alok.a.tiwari@oracle.com>, <vasant.hegde@amd.com>
Subject: Re: [PATCH v2 13/22] iommufd: Add mmap interface
Message-ID: <aBp28sjZpPfDUfYr@nvidia.com>
References: <cover.1745646960.git.nicolinc@nvidia.com>
 <7be26560c604b0cbc2fd218997b97a47e4ed11ff.1745646960.git.nicolinc@nvidia.com>
 <c4d03b52-422e-41ab-845b-1d2eda7ca9e2@linux.intel.com>
 <20250505165019.GM2260709@nvidia.com>
 <aBjzf9PrYnwF5uZN@nvidia.com>
 <20250505172813.GS2260709@nvidia.com>
 <aBkahmXQGxFC0Fdw@nvidia.com>
 <20250506125425.GX2260709@nvidia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20250506125425.GX2260709@nvidia.com>
X-NV-OnPremToCloud: AnonymousSubmission
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN1PEPF000252A4:EE_|DS0PR12MB9423:EE_
X-MS-Office365-Filtering-Correlation-Id: bb339c00-ab95-4991-0735-08dd8ce036c5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|7416014|82310400026|376014|36860700013;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?UqtWU8WjBfdN9DNjIisTxCvXESjBqbEc7d1fViBguHWZQ1KmuXL/0oAZ6Ct9?=
 =?us-ascii?Q?cDG0Q0lThyJBaC+M21hv28Wnq7KAKVu8/rTcIURQr/KWg6VOkt2VNx5aJr8s?=
 =?us-ascii?Q?Ie9eYpIWutRiYXea0yttoBp0PKWBr/ToFIrnRogeVOySlDvdCCqSFD7X6mJO?=
 =?us-ascii?Q?hBrEIRTgPjvIyF4i6KXgSNuB9mibF9M0oRnfjRsqjyIDV5opP63Gp1I7YPw6?=
 =?us-ascii?Q?3hfKEF6XDNK9C1QjutYWybAiYGgOdvzEq7HVSFE4zIt9lKnYMgDY4B4VdD1x?=
 =?us-ascii?Q?z4kugNZZVOh/74+n3djvNZx8oJ4NmgkjNnbUsXpuBF3ucADmslNaRjW5EJz/?=
 =?us-ascii?Q?sB4XoSviQOWM0FG3Lc1CJ6VCnObvlZ09+lcH7cu2AmD+BbrRc97MBMiz2Vfv?=
 =?us-ascii?Q?ARbTGjkZ4SydTuf8EVc8bmKZ/vhss7qVH4k51SfyI37cQ5Z9Lfo2IX+0f4eT?=
 =?us-ascii?Q?tm3VyPL5dGR2GhJbmD4+0BsXwr51klYBv6/21ACBE5WXnAJ3SzjFjl9ZSKIs?=
 =?us-ascii?Q?WCdWV9OzZD9j5VVoT4/ilKvUHdKS/F3NHixTZLyKV8RzvjFI2gPd3XvE+gQj?=
 =?us-ascii?Q?bgLOdz4VZH7KS6NMhBbSv+D2MxRUeEqXObK6UHLb489ZxuW+OytSNSsSdOoD?=
 =?us-ascii?Q?J29YdWMroBRfVZQXzrjxJROwpNfJNf2wXqfSKfSo0KFJlOxBES5EM8IUkZaL?=
 =?us-ascii?Q?caL2UHWCfkkOEZP4lgtDLNotqDokzp6J61zRRn9s2PGCUIEMFqnFXbIr/p/7?=
 =?us-ascii?Q?8cIqMDEVsXe9XgowqH949XuOBhyU51349/9v0cCyxJ2vbAgsotFPUgDWmqnT?=
 =?us-ascii?Q?ZxZjAwffQtbQzqXLFQjIog2UXu2FtYyOjoNuPrucYQHq66ilOq1IBZQ6aZGI?=
 =?us-ascii?Q?dk54zkEzpk2qwESSj+VCQwmIkM7mLyUfPFMgKp+EgTytS+e6y/Nth9alHCfp?=
 =?us-ascii?Q?nAszOOg1UjvTmzlGhCE9z7bkRP0jQcQuR9dPLX7VqtnbMU9OyMZgJIlBPc5d?=
 =?us-ascii?Q?IJthQDc8ArFLU6UoBgAwdfVG3rCkUVus9ATMs+xvtn/yLUmuBo7bghfgpNbI?=
 =?us-ascii?Q?nMpSEcHvmrwgfISPlQNHVj/fxl4cC9COST+7sN2YIhrQUQ50kGKMD2NpDeau?=
 =?us-ascii?Q?cvyR8SR+FzwU+iZUWE0jSUMQ+auPo4dXBqZhaFXrkpkFrVHXLQomttt4svfj?=
 =?us-ascii?Q?x3jJG17p+/myKVzvpv9cpGhLFXrVlmoyBoONpVY+CUIVaSITnbU9pBGafcHe?=
 =?us-ascii?Q?yoYINOKjQwuI1TlWeUKNKMXFSiZu0lLDcW8nsYCGmKwW1Xo3srxFTL/bzaQ7?=
 =?us-ascii?Q?hir+Q2bOJrh5E31d8NWjYEot0pEEGiUxYZMshV+qEAIVDJ420klwNZo+onp6?=
 =?us-ascii?Q?ycvTrGcvco3bStx3L4qa/g5PHYO3bKEhZ9f4CBXeUnYBz3qZZvVu7XFpzf3C?=
 =?us-ascii?Q?uTlIyzoX4/XP/O1iUuEzp0D3f4oXLqi/Zq/8YD07yiwni0ngxEqYDPEkVLy7?=
 =?us-ascii?Q?eH0BqWOZbw6B4E6/xsIzj2HkSrbjF1dt8XjT?=
X-Forefront-Antispam-Report: CIP:216.228.117.160;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge1.nvidia.com;CAT:NONE;SFS:(13230040)(1800799024)(7416014)(82310400026)(376014)(36860700013);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 May 2025 20:54:37.4551
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: bb339c00-ab95-4991-0735-08dd8ce036c5
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.160];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: SN1PEPF000252A4.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR12MB9423
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250506_135451_802137_9A877A7A 
X-CRM114-Status: GOOD (  31.70  )
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

On Tue, May 06, 2025 at 09:54:25AM -0300, Jason Gunthorpe wrote:
> On Mon, May 05, 2025 at 01:07:34PM -0700, Nicolin Chen wrote:
> > On Mon, May 05, 2025 at 02:28:13PM -0300, Jason Gunthorpe wrote:
> > > On Mon, May 05, 2025 at 10:21:03AM -0700, Nicolin Chen wrote:
> > > > > > > +void iommufd_ctx_free_mmap(struct iommufd_ctx *ictx, unsigned long immap_id)
> > > > > > > +{
> > > > > > > +	kfree(mtree_erase(&ictx->mt_mmap, immap_id >> PAGE_SHIFT));
> > > > > > 
> > > > > > MMIO lifecycle question: what happens if a region is removed from the
> > > > > > maple tree (and is therefore no longer mappable), but is still mapped
> > > > > > and in use by userspace?
> > > > > 
> > > > > I think we should probably zap it and make any existing VMAs
> > > > > SIGBUS... Otherwise it is hard to reason about from the kernel side
> > > > 
> > > > I added in v3 a pair of open/close op that would refcount the
> > > > vIOMMU object (owner of the mmap region). This would EBUSY the
> > > > vIOMMU destroy ioctl that would call this function.
> > > 
> > > That's no good, we can't have VMAs prevent cleaning up iommufd
> > 
> > Hmm, would you please elaborate why?
> 
> It would create weird dependencies in the kernel that become hard to
> manage. If we really need to unplug the PFNs behind the VMA for some
> reason then we should always allow that to progress. Requiring the VMA
> to be unmapped first is not great.

OK.

Now I start to think about the FD situation: either a fault queue or
an eventq returns an FD and holds a refcount on the event object. So
the event object can't be destroyed unless the FD is released first.
Are we doing it incorrectly here?

> > > objects, the right thing is to zap it with invalidate_mapping_range()
> > 
> > Also, I can't find much info about invalidate_mapping_range(). Is
> > it a user space call?
> 
> unmap_mapping_range(), see how VFIO uses it.

I see! It just needs to call that function when we remove the mmap
for a vIOMMU destroy().

> > I do see a few drivers defining a fault op in vm_operations_struct,
> > where VM_FAULT_SIGBUS is returned when there is page backing up the
> > VMAs. Is it what we need here?
> 
> Probably as well

Once the vma is unmapped, any further access would trigger a fault,
right? That's how it works.

I see do_fault() report a VM_FAULT_SIGBUS, when !vma->vm_ops->fault.
So, perhaps we don't need an iommufd fault op at this moment.

Thanks
Nicolin

