Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B582AC369DC
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 29 Apr 2025 21:49:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:CC:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=r6Y7qu+vJUjVQaSkq/TB645V4JMvB9WmNVJFD7+ANEE=; b=W4sUZXPmRu6smyKOAE7x4SwM7N
	Wfed8nXMCZzzpOkI9YDaYWZXhRhZfBNI6OT3vTO76b5eIOFIaVT+EKeTdD8Lrf2swURb2dIHSfMcF
	WCOyZoWqYE0JFvR2G1O3l5iji7ezQId7t/pVLZuxvsyN4fS79dKkQ/KwYxkMfCZP5wzpRolCBGdDr
	PNSkfMHLPEH6+zcneyCZQ+Ca1G8K6oI1SquVWOqzVUUO/EcNdrU5s1UkG7RexZb/BKtoSZJBDHGQ+
	ByvZaIPT6ZonAPp7gtUqBaBQjlMP7NjxHN0JxJM/vDZkMCbnxDikRmWpW+MGXEYwwh/gXdEEtjHtB
	hxBzSiYw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u9soz-0000000Au60-0q5Z;
	Tue, 29 Apr 2025 21:48:57 +0000
Received: from mail-co1nam11on2062a.outbound.protection.outlook.com ([2a01:111:f403:2416::62a] helo=NAM11-CO1-obe.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u9smu-0000000Atcd-36Ud
	for linux-arm-kernel@lists.infradead.org;
	Tue, 29 Apr 2025 21:46:50 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ZdvON6sLggtz25Qe2Kgh/hW16Mrd5jdUBr5LFgGHkxrD7EEBgPIs4XU4y3oxMXSnM5lWzYxyn3AjaJripexpEbiFnqDvjX+wpvfGOaslZ8AjGQ3o7FvmLU3UJKGC5OCyRVU3HGUaTGnkC7Lu1du+QKiQpi3q9zBvlb9XK5qsUtvyOfjrmk+gjCyRGYYJgKCXhh/yicwyoVyBXvPjPVxenLDKgP+USCkvOkJcXrIURf5ufnyE8LvBxDXbal/al1qG7b3b6pLLWKPx9p4XK0+bwQDWqeSCgMi884Otz+WZODH/6TMbr6l3DP78ybHh+KrZ9RGGeNPHSr2C/kvpioRjkg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=r6Y7qu+vJUjVQaSkq/TB645V4JMvB9WmNVJFD7+ANEE=;
 b=KF2qX1RpowLEY4vbKMqYc5u/ZqRZe/3G3sjBddshBUosHloZwB6y+R5T8ZDBh0cibg9Dc2DRfwjr0LujhZyYbCB7h64c8YoabpWB8+aUSAwGOTNg4yhSN50cD01SZrAxIlD49h2BYM3NV/suqj4CnZ4mWXI2Hyd9YiKuyQH5rYKO0jgRSrgNQSt3ECI6cFmvp0HTpWT3DMI8XhU8jnbVGe56mduzICkP+p0GfaNrFeQDOsol3jaa34CBPzD1EzNZHdB3AamAgykj5zB8HF52T46dXpzHtu5thIJXwyT0qhzO7TOHH+GcjW6HogyWQs15jeWpHk7bJ3ww9Nn/ppYYLw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.161) smtp.rcpttodomain=google.com smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=r6Y7qu+vJUjVQaSkq/TB645V4JMvB9WmNVJFD7+ANEE=;
 b=fLEmBMJhT4dzShUavetUYFIZG6RVFbxFkBMLnUUJybMjNRGBznOqMgoJiStP/peRZNzDyZ93LkcONQi7z7gcjlXDNr03oq3/Th4nsePCdKsdabwuJTBjxgNTYYms8PMHLBUxFr2E2XiyUPwDDDj1TJnsZu8RaCV3ovOOx/QjPES7oh6zci+dpMpwQiRmOzo0hTcCx+fi6Mfiup04pgdBwz3b8g20Uz8m0+uKQ7YLUut4EdBMDHrQyL1f6/JksxC73ikmTOJRChe3cqE6/1vL/OGMTkWVXCWL/aw4z/F9C/VEQXI/uVINxC/oZ3XWz9eXD6GDbYq7TYvAR5H2OZO1uw==
Received: from MN0PR02CA0028.namprd02.prod.outlook.com (2603:10b6:208:530::22)
 by DS0PR12MB8442.namprd12.prod.outlook.com (2603:10b6:8:125::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8678.29; Tue, 29 Apr
 2025 21:46:40 +0000
Received: from BN1PEPF0000467F.namprd03.prod.outlook.com
 (2603:10b6:208:530:cafe::fa) by MN0PR02CA0028.outlook.office365.com
 (2603:10b6:208:530::22) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8655.38 via Frontend Transport; Tue,
 29 Apr 2025 21:46:40 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.161)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.161 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.161; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.161) by
 BN1PEPF0000467F.mail.protection.outlook.com (10.167.243.84) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8699.20 via Frontend Transport; Tue, 29 Apr 2025 21:46:40 +0000
Received: from rnnvmail205.nvidia.com (10.129.68.10) by mail.nvidia.com
 (10.129.200.67) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.4; Tue, 29 Apr
 2025 14:46:29 -0700
Received: from rnnvmail201.nvidia.com (10.129.68.8) by rnnvmail205.nvidia.com
 (10.129.68.10) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.14; Tue, 29 Apr
 2025 14:46:29 -0700
Received: from Asurada-Nvidia (10.127.8.14) by mail.nvidia.com (10.129.68.8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.14 via Frontend
 Transport; Tue, 29 Apr 2025 14:46:26 -0700
Date: Tue, 29 Apr 2025 14:46:25 -0700
From: Nicolin Chen <nicolinc@nvidia.com>
To: Pranjal Shrivastava <praan@google.com>
CC: <jgg@nvidia.com>, <kevin.tian@intel.com>, <corbet@lwn.net>,
	<will@kernel.org>, <bagasdotme@gmail.com>, <robin.murphy@arm.com>,
	<joro@8bytes.org>, <thierry.reding@gmail.com>, <vdumpa@nvidia.com>,
	<jonathanh@nvidia.com>, <shuah@kernel.org>, <jsnitsel@redhat.com>,
	<nathan@kernel.org>, <peterz@infradead.org>, <yi.l.liu@intel.com>,
	<mshavit@google.com>, <zhangzekun11@huawei.com>, <iommu@lists.linux.dev>,
	<linux-doc@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-tegra@vger.kernel.org>,
	<linux-kselftest@vger.kernel.org>, <patches@lists.linux.dev>,
	<mochs@nvidia.com>, <alok.a.tiwari@oracle.com>, <vasant.hegde@amd.com>
Subject: Re: [PATCH v2 13/22] iommufd: Add mmap interface
Message-ID: <aBFIsYg+ITU8RvTT@Asurada-Nvidia>
References: <cover.1745646960.git.nicolinc@nvidia.com>
 <7be26560c604b0cbc2fd218997b97a47e4ed11ff.1745646960.git.nicolinc@nvidia.com>
 <aBE1gUz9y415EuBQ@google.com>
 <aBE38GwvGBnpRNLc@google.com>
 <aBE47aySzDp2lsAz@Asurada-Nvidia>
 <aBE800DsAOOZ4ybv@google.com>
 <aBE/CD4Ilbydnmud@Asurada-Nvidia>
 <aBFGCxcTh54pecsk@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <aBFGCxcTh54pecsk@google.com>
X-NV-OnPremToCloud: AnonymousSubmission
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN1PEPF0000467F:EE_|DS0PR12MB8442:EE_
X-MS-Office365-Filtering-Correlation-Id: 034ec9ce-8a34-486c-6b16-08dd87675350
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|82310400026|7416014|376014|1800799024|36860700013;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?tg29d/oKrJE+6h35+T9B/08T2yz3PQS1BIv8xaO3lLrA/9S0jkkeBBg0FVmK?=
 =?us-ascii?Q?N0x2lUh78mjIoaNcftc2/npneWuASysj9z9xK/v1cixWW56NI1c5qLtmizX7?=
 =?us-ascii?Q?7xTuZzMLCT92Z86HwsA7vhHfeA5bQCbKi2FZgZ77snrwY4OfsxPpahax+gTi?=
 =?us-ascii?Q?i0j+ZHoyavfz493v9k0Q0Yj1c9//Fms15AlNZVZO1pWgJlJ7b4ZonF+T6VWa?=
 =?us-ascii?Q?CMl7krOYpXJBtOK+li0jyXzxwJoDJpy6UxP8eK9/nct2AoCfXe6oK4c9AtFs?=
 =?us-ascii?Q?g7V7ITx81kywvLCNstOJAKbQB1gHGvm/IWoQbnCcDvQvyqjrNxNPBEi8+J4e?=
 =?us-ascii?Q?0op+gjtAC/MBbv4Dbe1Pe1WWDhqDDZRu/OR6IH4PhEoVrZid7t4I32fWoGhq?=
 =?us-ascii?Q?dwnKfSUfxstbTJltCJS4WD+6/JQYgMKjZ3D6p68i3Ok0bmv6m38Wq+a0BaD+?=
 =?us-ascii?Q?0k/fC5rykEGNZKCZHUe3FM9NvJcd6V87ksaNEo+020T0er8hIKDARN8JeqbF?=
 =?us-ascii?Q?dsyzSnRY3Q2amlRW6Nf5zcZTFC+dHlJJLs8GjqS/8M/c1q2NqoRje+ULro20?=
 =?us-ascii?Q?QXA0c6NdstQWcRztPsFyqdEuku+mz4Z//AjEY8zzN8rfiU+SRVcbWsdCW46u?=
 =?us-ascii?Q?pyQJU3xPl3geyfFIxRn0jKek9DPFSrBnd2lgii3f4pc1gcEWW4HbADEBzqAs?=
 =?us-ascii?Q?N8ITQabQz4i0u03dFaj4j856r+ddLjymbXOmlFEop6MH51hl1HqXxMbZ7oTe?=
 =?us-ascii?Q?70p+yk0tHgQQsvdf3triOie9Ergxg8SAqXMwz8ZYFYXu5O6YG3BGlZKDPTyj?=
 =?us-ascii?Q?F7UTugaefHnOPyG9rsXNLF0qERUyQeNXSGLxdL3UCc0qEJ2SAmSb1RCEq/qZ?=
 =?us-ascii?Q?gudilKhxdY8hgiVUVWQIc+dFtkIld+uHRaB2u9atr3YNk8HmeyxAU+XXNBP6?=
 =?us-ascii?Q?KejqUyHoHSXK1hYUfJolS4lr5MPo1JaTUxqT1PIU4e+3c3VZ1dciK+hqSx3P?=
 =?us-ascii?Q?EyH6h6RDdsirFQBvnpD/VgE3iYxIOiA2Oq+he4b1Ho+QfL9xaBOwVTd4wemF?=
 =?us-ascii?Q?MHJxwNYJHEOm2yvuUY/afuqnHVxY6M0zp265tFGSLfCDe4RAcCu2TIowy23s?=
 =?us-ascii?Q?UmwLdr2vl7Hxxke3SjaHdADJ9I1eFD587fVwHmJwIyEDPnBQkRCswqAygf4S?=
 =?us-ascii?Q?YLB5e4JMrdIjLsYo/Hje81YdU54nuIGQYQMZ20mE93bUsA9WUdWVJ47QP21d?=
 =?us-ascii?Q?o+ROXik1XbIm8UGLwwDpjFoeEjtm0Imesijd3CRi1hY0NpUeA4IBJKyjeKLN?=
 =?us-ascii?Q?roWb51rEJlCfroE4DazKfqbjoJTkcK+hYEwRmhLZq6QihBjURxvKhMZdCRr0?=
 =?us-ascii?Q?uHVNhteRfzDarTe3HzcL7Mh1PflZifFcHD4MuY7OgQ7RV2Q5Q1VX+YBFxuVB?=
 =?us-ascii?Q?WCn/oaa9qjqkrIlPhoKdMVUQTNxkG+WLW3NidDtuOKnczOzG21xpNn+ziGZ1?=
 =?us-ascii?Q?b90Q2Zfuz3dVjK91dOtyxF+qNmizmLuRYkiC?=
X-Forefront-Antispam-Report: CIP:216.228.117.161;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge2.nvidia.com;CAT:NONE;SFS:(13230040)(82310400026)(7416014)(376014)(1800799024)(36860700013);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Apr 2025 21:46:40.3654
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 034ec9ce-8a34-486c-6b16-08dd87675350
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.161];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: BN1PEPF0000467F.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR12MB8442
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250429_144648_795826_4CC7E1DC 
X-CRM114-Status: GOOD (  23.20  )
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

On Tue, Apr 29, 2025 at 09:35:07PM +0000, Pranjal Shrivastava wrote:
> On Tue, Apr 29, 2025 at 02:05:12PM -0700, Nicolin Chen wrote:
> > On Tue, Apr 29, 2025 at 08:55:47PM +0000, Pranjal Shrivastava wrote:
> > > On Tue, Apr 29, 2025 at 01:39:09PM -0700, Nicolin Chen wrote:
> > > > On Tue, Apr 29, 2025 at 08:34:56PM +0000, Pranjal Shrivastava wrote:
> > > > > On Tue, Apr 29, 2025 at 08:24:33PM +0000, Pranjal Shrivastava wrote:
> > > > > > On Fri, Apr 25, 2025 at 10:58:08PM -0700, Nicolin Chen wrote:
> > > > > > > +	struct iommufd_mmap *immap;
> > > > > > > +	int rc;
> > > > > > > +
> > > > > > > +	if (WARN_ON_ONCE(!immap_id))
> > > > > > > +		return -EINVAL;
> > > > > > > +	if (base & ~PAGE_MASK)
> > > > > > > +		return -EINVAL;
> > > > > > > +	if (!size || size & ~PAGE_MASK)
> > > > > > > +		return -EINVAL;
> > > > > > > +
> > > > > > > +	immap = kzalloc(sizeof(*immap), GFP_KERNEL);
> > > > > > > +	if (!immap)
> > > > > > > +		return -ENOMEM;
> > > > > > > +	immap->pfn_start = base >> PAGE_SHIFT;
> > > > > > > +	immap->pfn_end = immap->pfn_start + (size >> PAGE_SHIFT) - 1;
> > > > > > > +
> > > > > > > +	rc = mtree_alloc_range(&ictx->mt_mmap, immap_id, immap, sizeof(immap),
> > > > > > 
> > > > > > I believe this should be sizeof(*immap) ?
> > > > > 
> > > > > Ugh, Sorry, shouldn't this be size >> PAGE_SHIFT (num_indices to alloc) ?
> > > > 
> > > > mtree_load() returns a "struct iommufd_map *" pointer.
> > > 
> > > I'm not talking about mtree_load. I meant mtree_alloc_range takes in a
> > > "size" parameter, which is being passed as sizeof(imap) in this patch.
> > > IIUC, the mtree_alloc_range, via mas_empty_area, gets a range that is
> > > sufficient for the given "size". 
> > > 
> > > Now in this case, "size" would be the no. of pfns which are mmap-able.
> > > By passing sizeof(immap), we're simply reserving sizeof(ptr) i.e. 8 pfns
> > > for a 64-bit machine. Whereas we really, just want to reserve a range
> > > for size >> PAGE_SHIFT pfns.
> > 
> > But we are not storing pfns but the immap pointer..
> 
> Ohh... so we are storing the raw pointer in the mtree.. I got confused
> with the `LONG_MAX >> PAGE_SHIFT`.. Sorry about the confusion!

Yes. We want the pointer at mtree_load(). The pfn range is for
validation after mtree_load(). And we are likely to stuff more
bits into the immap structure for other verifications.

Thanks
Nicolin

