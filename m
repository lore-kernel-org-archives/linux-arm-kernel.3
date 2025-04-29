Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E0F69C369DC
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 29 Apr 2025 21:07:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:CC:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=sUVOvz8hR05dMk0Wa0czinEoziHByHwpuwtod18R0TE=; b=VFRA5yrbrQhUysivKngdRTqD++
	mIt4DndFo3i0j+3d3I163/Y9BnnvRGo2r1Q45GclBq2lUbFSfuqOvMe/tryJErBo54XVSg+C88pRF
	EAgtGoextUX3vY/gew4CCdmTJTU+lO1aPI/SC0ig6+JRkVmGIqyBwyRaF7V/jUJqw3B+994xiJEvA
	BdzompcqFMsIAJfjFD0dv4L6mQAS3bkzWASOI2halnSH5ZKjgjlpZFC5YmhUJNt/cAkKlsRcrMsaO
	PpHoDbah7YL1MM+IsQ2A7xAzK51ZKUi1Wy5SD+UK4MrbkzaiZGmq8i/l1Bo0Xg3ng4LkFb3Wxe+k5
	ntD0cG7Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u9sB0-0000000ApP0-3lZl;
	Tue, 29 Apr 2025 21:07:38 +0000
Received: from mail-dm6nam10on20615.outbound.protection.outlook.com ([2a01:111:f403:2413::615] helo=NAM10-DM6-obe.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u9s8y-0000000Ap82-2A7J
	for linux-arm-kernel@lists.infradead.org;
	Tue, 29 Apr 2025 21:05:33 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Sb8IDv0yMKQkSRWT/TQ4BJ6hEjJt050q0w/9MbxOgPE7mvUQ3Jie58MI77HW27B4K32/V5s6UsS5ZrOp6S/T1MVW3qSMBvPPwAo0Zq+EYY6CAK/BU2qpl3PgPlsVGmYiHUQdhCwWhOb+IZFLYKreSLLtK8zp1bV2JYWHTia5jVAXpCu0yzF/npiW38y3wiKVFTS50UumRUJKQfbaIAxRRPSSxWenQUa7rNN1O5M0tvg5dEZiaU5XVxYIrae/Jjs7iQ49Y+WYLI0YKxtMGFHXT2ZXP385VFv1c1Ltan0nsfV9e54j8VBCUSG3VwfxPLvmVHUWz9ngZspwagxAWcFZng==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=sUVOvz8hR05dMk0Wa0czinEoziHByHwpuwtod18R0TE=;
 b=YIzy2RUuoSM7g05J8P9hFkSDVbjdvVoUor2kw/77/XjA4CTddsoIYir8J+mw4H5MPAopBuoahR5lXaVPC/r7nx2JL+7oxiZzqeFyp/BG/CBYNF3LRGfD2225yL6Enc5BXIFSmZwvQ1r/qeWldN732wt1ZJJbiRHDQd0OZF6dIdcr33alywE9PGxrDG6e8SSbxwPqYR9RhYkyhA7pQgaK/COu2Dniqhp4HusJvRZ4pOEaiK68bb4LNeNLUKMg4m0Xnwg2uX4Z6+fQzMPGHOrEXzdthzISTtUDH8JwSciYzkyEHK5jEcCNax7Dsx1QLTIAzjnBpsHPjsgN2aTwY1BUKQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.118.233) smtp.rcpttodomain=google.com smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=sUVOvz8hR05dMk0Wa0czinEoziHByHwpuwtod18R0TE=;
 b=kQE/1Zemn+FZX1WOPqPmd2z0k7tKmlHcCc7yj66MGS/z9LfsgLjLX9C40wLRAaS/TBTDFau+UAmQjU1UCElgcsPiDu6yol/3OWxJoAULwyo7sCV+IRvGYgigeVgtFpvzzF+sHPNWFZ3G9gu3XqGCMpa5BykYS2k4qQT5ItFKjEFhDU08CV6aoeJawKw4L/Zkpw78n/uSQRp1BvmQoROKZ7E+42KIJ0IAWoGfXjyPC2ZY+AVMCRUgy4ZeuUQ9RMWoZOgPMOQzj3fQM4c9XdE3m6kx/ZEb68RdeM9jdlyVMmwXpvNvs8ZCeF/ZGJhbgxYn4vw2oQBFOUd1yan2TO7/6w==
Received: from CH2PR20CA0029.namprd20.prod.outlook.com (2603:10b6:610:58::39)
 by BL4PR12MB9477.namprd12.prod.outlook.com (2603:10b6:208:58d::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8699.19; Tue, 29 Apr
 2025 21:05:27 +0000
Received: from CH2PEPF0000013C.namprd02.prod.outlook.com
 (2603:10b6:610:58:cafe::89) by CH2PR20CA0029.outlook.office365.com
 (2603:10b6:610:58::39) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8655.37 via Frontend Transport; Tue,
 29 Apr 2025 21:05:27 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.118.233)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.118.233 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.118.233; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.118.233) by
 CH2PEPF0000013C.mail.protection.outlook.com (10.167.244.73) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8699.20 via Frontend Transport; Tue, 29 Apr 2025 21:05:27 +0000
Received: from drhqmail203.nvidia.com (10.126.190.182) by mail.nvidia.com
 (10.127.129.6) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.4; Tue, 29 Apr
 2025 14:05:16 -0700
Received: from drhqmail202.nvidia.com (10.126.190.181) by
 drhqmail203.nvidia.com (10.126.190.182) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14; Tue, 29 Apr 2025 14:05:16 -0700
Received: from Asurada-Nvidia (10.127.8.14) by mail.nvidia.com
 (10.126.190.181) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.14 via Frontend
 Transport; Tue, 29 Apr 2025 14:05:14 -0700
Date: Tue, 29 Apr 2025 14:05:12 -0700
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
Message-ID: <aBE/CD4Ilbydnmud@Asurada-Nvidia>
References: <cover.1745646960.git.nicolinc@nvidia.com>
 <7be26560c604b0cbc2fd218997b97a47e4ed11ff.1745646960.git.nicolinc@nvidia.com>
 <aBE1gUz9y415EuBQ@google.com>
 <aBE38GwvGBnpRNLc@google.com>
 <aBE47aySzDp2lsAz@Asurada-Nvidia>
 <aBE800DsAOOZ4ybv@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <aBE800DsAOOZ4ybv@google.com>
X-NV-OnPremToCloud: AnonymousSubmission
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PEPF0000013C:EE_|BL4PR12MB9477:EE_
X-MS-Office365-Filtering-Correlation-Id: c84f94a2-9a5d-4017-b171-08dd87619133
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|82310400026|376014|7416014|36860700013|1800799024;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?wyfzhim6PCthVgc95Vj2wQmJDGhNJkuPWDzbMJjwFWmQvMOB2m5L9Yt3ZGT0?=
 =?us-ascii?Q?Cl0YWZ6xd+b0Si/UoAAn14dO1J1mb2D2E702y69wHxfM9XH5EGrig5WoypgD?=
 =?us-ascii?Q?5DsbKpJOGJUBGPYvRSPU6YnwN2y3E/zslXEJMwxHiHxPxeGW6sC/z9RYEIId?=
 =?us-ascii?Q?nVAndSxnUW/o48gDus11qsuMayyVkL1i5XVGm9/uKiEy1W51rlAy1ezam5PV?=
 =?us-ascii?Q?R74BcRfPDfqsn9bE3WolRSEmzmUIgoYk/sbHdmF9a3tGZLReVz8FXBuJgwAt?=
 =?us-ascii?Q?mwASRRbBlBQc1t3F0UH+19GWft3WbTVt3oCoqb7Q5tn+Qtpyeyra8e+AAWGf?=
 =?us-ascii?Q?LTOhw3kz/qNVhOBB7Js64GGshmGsOrlWbkgQIaAe2t1gtG191Uxkp9Dfm1BZ?=
 =?us-ascii?Q?bifR6/zR/e86NuQN+fidVfudH8ggvAw29UIeqGbP4mfY3Pxdl549uS/29fuv?=
 =?us-ascii?Q?mIbPy42hQQczZ4HAnKtpZmSoiWh1kerbUK5eg9jMgLAOtAEvHjz1XAATHPKZ?=
 =?us-ascii?Q?oqAdpoxX7PlI7eVOjrZAfHXp91twlN2pxHGI9TBlu4BcXqC5YekzsmHwug9Z?=
 =?us-ascii?Q?n1vkdN1mWS7UZD3X3cmm9TVnz2spL3tmIckkUbqBehREks3HGxnWJXd9S2P5?=
 =?us-ascii?Q?ZxaOhjNY40JdIQv0+N/78jWHMOIR7wfejbNjb215FjCwPe8WwXTp9CPUmhlf?=
 =?us-ascii?Q?ubE+FgqowBVUNCQ3jWKhlg9kXuT03muv7cVWuYjlVVKLNRI1j2xO0ckcKt5c?=
 =?us-ascii?Q?U5GjSfa9hHuzYItwFjiuOWIRg8rJYHEEcyfDEo3WmKHBoCJuyRucXDLwxZir?=
 =?us-ascii?Q?B1Zv+84zWMBP2zvBhR3w5D9BzDMNaG9xKPaqXSOhS6PHazmM5UZV7QNNNNzp?=
 =?us-ascii?Q?d5t2DAw8LEyHa4HtFbShhW2lJEZCjMiXU6lqs5GPlYFBgTJCWnQHEfbDxo5F?=
 =?us-ascii?Q?DGyTZdtS2gHMc9GC5HIT/kpm0rqP2D+T0pRwPNhFlVduuwdGfyojLkITpcAr?=
 =?us-ascii?Q?6FTaPhdSWGI7vbWa37Lasolc95GcHi/1Tvi31mi+Nqs7watfldNWWbiZgYNH?=
 =?us-ascii?Q?kwzXam2kqHBSOPbPVYN6nkyREkWRJZIAu5XS4WR3ldxOs9A+ragfK7am/BBm?=
 =?us-ascii?Q?5vab8N6Fiz/Lf50IMWF7GjOPCjg9jrqxt6CRx2YFIPBchvjwYEWRfE+3RQf6?=
 =?us-ascii?Q?mYc/cXfxRbKki+33zmNKVS8Vp/f0Lns/jHfebeSO8MvRFPraclpYE8ewLfxI?=
 =?us-ascii?Q?Rtzlx1NKnGWWcm1kDb1zUbowGuOeTrfW2LJx7VXVj53uRvvkZC2UtGajRRrI?=
 =?us-ascii?Q?CF50LJCY17LqPEIGPLCud92GUiuHlkPDqGiaZbKzg5h8I2nJc0jz9Jlta0z4?=
 =?us-ascii?Q?BkBv9EStqUf5PNm0PWcf134sMMrXyiW7ZUX99E7heh0AjoCj6SEhAbUJ6HRE?=
 =?us-ascii?Q?hRitqXGOT+l/bN76YiazSoH3bx6h1XHmjBv4tRMGFcpZjUBvFrq0NjM1KA4V?=
 =?us-ascii?Q?PDIq7Bo6r/ESj4Hau7rfkFSs6NtxHzkqE/IF?=
X-Forefront-Antispam-Report: CIP:216.228.118.233;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc7edge2.nvidia.com;CAT:NONE;SFS:(13230040)(82310400026)(376014)(7416014)(36860700013)(1800799024);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Apr 2025 21:05:27.2627
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: c84f94a2-9a5d-4017-b171-08dd87619133
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.118.233];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: CH2PEPF0000013C.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL4PR12MB9477
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250429_140532_575119_ECF887F6 
X-CRM114-Status: GOOD (  18.74  )
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

On Tue, Apr 29, 2025 at 08:55:47PM +0000, Pranjal Shrivastava wrote:
> On Tue, Apr 29, 2025 at 01:39:09PM -0700, Nicolin Chen wrote:
> > On Tue, Apr 29, 2025 at 08:34:56PM +0000, Pranjal Shrivastava wrote:
> > > On Tue, Apr 29, 2025 at 08:24:33PM +0000, Pranjal Shrivastava wrote:
> > > > On Fri, Apr 25, 2025 at 10:58:08PM -0700, Nicolin Chen wrote:
> > > > > +	struct iommufd_mmap *immap;
> > > > > +	int rc;
> > > > > +
> > > > > +	if (WARN_ON_ONCE(!immap_id))
> > > > > +		return -EINVAL;
> > > > > +	if (base & ~PAGE_MASK)
> > > > > +		return -EINVAL;
> > > > > +	if (!size || size & ~PAGE_MASK)
> > > > > +		return -EINVAL;
> > > > > +
> > > > > +	immap = kzalloc(sizeof(*immap), GFP_KERNEL);
> > > > > +	if (!immap)
> > > > > +		return -ENOMEM;
> > > > > +	immap->pfn_start = base >> PAGE_SHIFT;
> > > > > +	immap->pfn_end = immap->pfn_start + (size >> PAGE_SHIFT) - 1;
> > > > > +
> > > > > +	rc = mtree_alloc_range(&ictx->mt_mmap, immap_id, immap, sizeof(immap),
> > > > 
> > > > I believe this should be sizeof(*immap) ?
> > > 
> > > Ugh, Sorry, shouldn't this be size >> PAGE_SHIFT (num_indices to alloc) ?
> > 
> > mtree_load() returns a "struct iommufd_map *" pointer.
> 
> I'm not talking about mtree_load. I meant mtree_alloc_range takes in a
> "size" parameter, which is being passed as sizeof(imap) in this patch.
> IIUC, the mtree_alloc_range, via mas_empty_area, gets a range that is
> sufficient for the given "size". 
> 
> Now in this case, "size" would be the no. of pfns which are mmap-able.
> By passing sizeof(immap), we're simply reserving sizeof(ptr) i.e. 8 pfns
> for a 64-bit machine. Whereas we really, just want to reserve a range
> for size >> PAGE_SHIFT pfns.

But we are not storing pfns but the immap pointer..

Nicolin

