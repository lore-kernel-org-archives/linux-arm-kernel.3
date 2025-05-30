Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C0536C5AD49
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 30 May 2025 18:36:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:CC:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=D6QvD4x6jCTU+tvxWzaktOZXpggd5xD4y8lZKAuNmTM=; b=XwB29L9preBqmfPoNJIWxbaqQD
	UMMS1j1kNg/AuyoCa4hLyiTjcqAH0rwh5+aHMO9WEdMXZhlTdYje7nOsrX0UimCahB33GO5RM8k5j
	KDPzvDMKOuXxdBwiPmyLQjzcdeRBiRvRfNXwXtMji/gkQO8VO8UG6HXP8SBYFe9hIofHbKE3n2g96
	G505OYy5g3k6gzIvi81AdVbyarROifQDH6vX2eEk9g2lGxRWSbn5baQF+gb5grZ8zp2tak3NNw60d
	bfeXmK0YaqEoAaIR5Zit1+jYHoZe9wfQwF0QI3uwppLhPijOIMlhmFHPiR1ttJEksO0ZykISThcZs
	2s4LMHbw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uL4ao-00000001WjD-2FWS;
	Fri, 30 May 2025 18:36:34 +0000
Received: from mail-bn8nam12on20618.outbound.protection.outlook.com ([2a01:111:f403:2418::618] helo=NAM12-BN8-obe.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uL4Yf-00000001WXB-1Rfy
	for linux-arm-kernel@lists.infradead.org;
	Fri, 30 May 2025 18:34:22 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=F+h6BM9xj17nYvuz2025vN3Vsnp9+p7WN7utePSwdu5+eRm2zPwonC2MuRPcF5ijpVQC8A1CcQ+bV9eEb+96icupCTog17hzFiyZXdj3PQnAEEL43LGASMPQc/xASmEtU+Tee9I9E+jTrgm6wlLDLr7rPhjXYNF7DQWTCClYiP4h3h3cTqySo9ylduHq4e7yK/HN2Gif1YJsvg40q7KSLuJhBkWMGwdkKHaReUVrNhE3ewxobJDF3ZNsTwwJu+m2OyisvDzPeHeF43nSXhNEesV1JMUA6ReaUkUwuCYTH4GmcN/RuIUIiWtEulKJWb005X6FMLoer7i7BZHTo9dG9Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=D6QvD4x6jCTU+tvxWzaktOZXpggd5xD4y8lZKAuNmTM=;
 b=Y1LRbiIEB1FHSgvslQv3u/oojpQLZBF+6kWRwV1fuDGUVDgVa8xc2MPaUl4v9sgW9f89SQvGViA22PKIF3XZgJ3vEhJIBDMvbOs8RctIwh+cjPktY6sDI90PvzoB7AfHBLHxq/Povb3ROnWpxaNuR1lS+PVQxGdcUvjvwUozKqIR1Zr0F4rOMPDozLR3Cn09YMcT3yESCloJLHSIQcDGGh4K8gKo9YhkjjTiSsBf3djieAi3RQwszBJf3jbxubLVUkSgw92xoQ78Xtzgyg6B1m4y7gj81ibgH2eYw5b96HSuU9ugHOGafFr6vj1e7ZqG3chi3JAKs7At8u5FpG6x+w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.118.232) smtp.rcpttodomain=lists.linux.dev smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=D6QvD4x6jCTU+tvxWzaktOZXpggd5xD4y8lZKAuNmTM=;
 b=JquPYbj/tVHo2Wyl8lnXGdMQ71xBFXNeNfgcEeiVAMCicgh3dslgUxPYVDX45qniVsW0CYbmxLVkVWHfu85h1A6o0epK2HNvnYwWzvwyV5+qt6iIpIDbewjXBxvRFxN4H1q9+lHcWTH4wTdsi6qYmp07+jCzB9qssV6kcLD/WajcLHiwYi4tUQTSlTemtMUyoaEplv2bDKsJPpb6yo8hQRvfYPZBSBQf/DM1cRD86iFUlo78RTs7O3KZv0MgCVj2xuXAdeDiYk0IPbAQJthtc40mZHrkTZGRTcXK4hBNuriWZ4wm6rIEn+3J/o+cWvDNrMfz5P830MnZs5tdqWdQfg==
Received: from CH5PR05CA0010.namprd05.prod.outlook.com (2603:10b6:610:1f0::22)
 by MW3PR12MB4457.namprd12.prod.outlook.com (2603:10b6:303:2e::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8769.32; Fri, 30 May
 2025 18:34:15 +0000
Received: from DS3PEPF0000C37F.namprd04.prod.outlook.com
 (2603:10b6:610:1f0:cafe::70) by CH5PR05CA0010.outlook.office365.com
 (2603:10b6:610:1f0::22) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8792.10 via Frontend Transport; Fri,
 30 May 2025 18:34:14 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.118.232)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.118.232 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.118.232; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.118.232) by
 DS3PEPF0000C37F.mail.protection.outlook.com (10.167.23.9) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8769.18 via Frontend Transport; Fri, 30 May 2025 18:34:14 +0000
Received: from drhqmail203.nvidia.com (10.126.190.182) by mail.nvidia.com
 (10.127.129.5) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.4; Fri, 30 May
 2025 11:34:09 -0700
Received: from drhqmail203.nvidia.com (10.126.190.182) by
 drhqmail203.nvidia.com (10.126.190.182) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14; Fri, 30 May 2025 11:34:09 -0700
Received: from Asurada-Nvidia (10.127.8.11) by mail.nvidia.com
 (10.126.190.182) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.14 via Frontend
 Transport; Fri, 30 May 2025 11:34:08 -0700
Date: Fri, 30 May 2025 11:34:07 -0700
From: Nicolin Chen <nicolinc@nvidia.com>
To: Jason Gunthorpe <jgg@nvidia.com>
CC: <kevin.tian@intel.com>, <corbet@lwn.net>, <will@kernel.org>,
	<bagasdotme@gmail.com>, <robin.murphy@arm.com>, <joro@8bytes.org>,
	<thierry.reding@gmail.com>, <vdumpa@nvidia.com>, <jonathanh@nvidia.com>,
	<shuah@kernel.org>, <jsnitsel@redhat.com>, <nathan@kernel.org>,
	<peterz@infradead.org>, <yi.l.liu@intel.com>, <mshavit@google.com>,
	<praan@google.com>, <zhangzekun11@huawei.com>, <iommu@lists.linux.dev>,
	<linux-doc@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-tegra@vger.kernel.org>,
	<linux-kselftest@vger.kernel.org>, <patches@lists.linux.dev>,
	<mochs@nvidia.com>, <alok.a.tiwari@oracle.com>, <vasant.hegde@amd.com>
Subject: Re: [PATCH v4 05/23] iommufd/driver: Let iommufd_viommu_alloc helper
 save ictx to viommu->ictx
Message-ID: <aDn6Hy6TcclMYhYJ@Asurada-Nvidia>
References: <cover.1746757630.git.nicolinc@nvidia.com>
 <5288cec9804e7e394be3b7de6b246d8ca9c4792a.1746757630.git.nicolinc@nvidia.com>
 <20250514170637.GE382960@nvidia.com>
 <aCadeeP+Z4s6WzOi@Asurada-Nvidia>
 <20250516132845.GH613512@nvidia.com>
 <aCemeved47HE6Q2B@Asurada-Nvidia>
 <20250526133046.GD9786@nvidia.com>
 <aDYHT1iCxJKO9Vnh@Asurada-Nvidia>
 <20250530182723.GW233377@nvidia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20250530182723.GW233377@nvidia.com>
X-NV-OnPremToCloud: AnonymousSubmission
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS3PEPF0000C37F:EE_|MW3PR12MB4457:EE_
X-MS-Office365-Filtering-Correlation-Id: 3e655ba2-a41b-4893-5be0-08dd9fa89465
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|82310400026|1800799024|36860700013|376014|7416014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?EFKV8wiqJHetNDhVjMHRkSKkPSlgR8kAyHJq8vgYYumwnEoagHqjwnuDKcub?=
 =?us-ascii?Q?gVZdj+wR7wHxQoDWNt4Qskr/uAL4GIwwBwxa/+QhRSmg6moRopSmCADLBq90?=
 =?us-ascii?Q?ufQRzxJ8Zffzosg2nvbXbIfslrY5enUNDxs7XouebU1fwJfQf8BF5Wl6GjFP?=
 =?us-ascii?Q?2Ie/3FApQuFxiSb6uFqm1+X4ABcjGGrlig63p+hJ2/ZsAXsbb6+W3Dgp9JSB?=
 =?us-ascii?Q?FtRYZY2Icr9YIS6u+jEI1df9BmKqQFD0gf0GYHYvL8q/DLNi+321MC90mxaw?=
 =?us-ascii?Q?LOJ/3Y6kkQTIOrX4BqrMqyrEckruwDvHLzZ0NjHa4xZp7JdkeZd2lO7Y9XQS?=
 =?us-ascii?Q?AjnEojiB5z5b0oDcRT3TEiVSp+8IwsgCuQfZ7fUyv7sU+zujwPoweQT+ZFlB?=
 =?us-ascii?Q?a78YYz1KtmaWOa7e8s7WK1crv+JDDtPhb5/XjOeHxA26VRvgyljcuVIlZxp2?=
 =?us-ascii?Q?4/sAg9cB9badks9anKX9mReswrOyY5Mla0X49ZPr674P/vo/kgyE4hBsl4oy?=
 =?us-ascii?Q?3SIcZUxpmFl8orW3J/FwSSG52CPi5EH2gPb13XN5O/zlEjVmAA67igqd4NKu?=
 =?us-ascii?Q?CVoJ2cebMU87FeH6AWPIteqbJ70XUgqJqvJoGREzfHx3FgVn1+e24harBrRQ?=
 =?us-ascii?Q?OQbhOKo95FtO7U5XVJF8bOC1QSywrv+tQEOvR+oypUDa/ONLTE0ZdsLfZFLw?=
 =?us-ascii?Q?l33shFFYOXhBuIVWRE9AyfL3w3Dx1k7rBnxkANiZ/3y9HxZ6Yfu0wZpOkvpz?=
 =?us-ascii?Q?byWJXglmxGHBqwUCt6rEgyUJ4lfpyGC1lqO42AK+RMRvi9+cl5bBlXmzrZiA?=
 =?us-ascii?Q?pPcFX98VJbgipNHS8Q8Z9VQJbCDOTmghW5WQxuTbb0Mru49kujmKUzgoaZFf?=
 =?us-ascii?Q?9cGF1xxekMJbaKCr1EiM8IgU/J97b6vKbYeMpq3a5p5l7iAAyETvYl/vlwC1?=
 =?us-ascii?Q?lOXs4Ra5+4iAD8cr6bqxptjQ5o7grINDLX7bcfCWYYKvKSu+t7h4JQDyKZLn?=
 =?us-ascii?Q?S5iGW5ws6wP8YA4RM9b2FfizgS+CPjdNsN1+g0ZD+Q7Nr1uhIyH0VKGct7io?=
 =?us-ascii?Q?fPUW/COU03jX5ZMlylM4kSRLMSAeRpOPjwJlHFHBbOM5xJQcQziXi0w/Re+y?=
 =?us-ascii?Q?FMvB7G6lrGKx15PzVtq3BC2S1UuvT8YbcApFy3LIjPO1sTjVSy8333TkPL4P?=
 =?us-ascii?Q?kmeil9Jv4ZRpbPfIMf8Q6GPV8iLm+N6XsqvPWziEh7gdfSG+ZehqrtgPGRe5?=
 =?us-ascii?Q?wzXQHvtZKPpBaWr+qVvCkaYX3Tn1aYz0Pio/Hp0ko305F5NC9vmcSc6R6ofi?=
 =?us-ascii?Q?ObJRMHfpeASgeXePdDFN5MLlXWsQL5urTrNdHNZdvuwTwdT501pZZ1P14top?=
 =?us-ascii?Q?MA4bnnta+tGMt9+KawKMG1+zCN3xIBrtE5owzgeTURDW3ydAqBoR5MK23KKX?=
 =?us-ascii?Q?4mrhohNm5bg1pTiTrm3tV9UlHtfVnEm7o+tUy9PvjhJFljg2vdLkK+0+vhRV?=
 =?us-ascii?Q?eXsoUGob5NZ154vFekt84FdKi60S/oaQ1xKA?=
X-Forefront-Antispam-Report: CIP:216.228.118.232;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc7edge1.nvidia.com;CAT:NONE;SFS:(13230040)(82310400026)(1800799024)(36860700013)(376014)(7416014);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 May 2025 18:34:14.8512
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 3e655ba2-a41b-4893-5be0-08dd9fa89465
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.118.232];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: DS3PEPF0000C37F.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW3PR12MB4457
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250530_113421_380862_CCE36952 
X-CRM114-Status: GOOD (  19.69  )
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

On Fri, May 30, 2025 at 03:27:23PM -0300, Jason Gunthorpe wrote:
> On Tue, May 27, 2025 at 11:41:19AM -0700, Nicolin Chen wrote:
> > On Mon, May 26, 2025 at 10:30:46AM -0300, Jason Gunthorpe wrote:
> > > On Fri, May 16, 2025 at 01:56:26PM -0700, Nicolin Chen wrote:
> > > 
> > > > > You don't need to move this unless you are using inlines. Just use a
> > > > > forward declaration.
> > > > 
> > > > Since we forward ucmd now, ictx is in the ucmd so we need this
> > > > structure for:
> > > > 
> > > > -		if (!IS_ERR(ret))                                              \
> > > > +		if (!IS_ERR(ret)) {                                            \
> > > >  			ret->member.ops = viommu_ops;                          \
> > > > +			ret->member.ictx = ucmd->ictx;                         \
> > > > +		}                                                              \
> > > 
> > > De-inline more of that function probably..
> > > 
> > > Also seem my other remarks about not storing ictx so much..
> > 
> > I found that all other ictx pointers in vdev/hw_queue are unused,
> > as the core simply gets an ictx from their viommu pointers. This
> > means that only this viommu allocator here needs such a storing.
> > 
> > With that, how about a change like this v.s. inline:
> 
> So I think the other suggestion with init vs alloc supersedes this and
> makes it all pretty clean?

I believe so!

Nicolin

