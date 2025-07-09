Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4AEAEC83F09
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  9 Jul 2025 21:59:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:CC:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=8LtzE1fB0PojPrl5ZBm3OK3/9ti96j0eq+tuRMGdzqE=; b=kJO1XTWFfie3JTDQIdhyoTeLJa
	8u2PqtYaVvPsJ77VmaOFk5f9Zqqn0OwcFdF9JZlm+sOYWbTZ7tCGcurlflDjRn4MXuslYgQ0K5TZo
	6fgOH5yKmtvi6Ved4X+blg32PB3v02EKNfAR1UgYA+Y/NPxm34dTJa4f+uEe1F2ROsCBXrVx9C3ly
	HZy+fEgDXK+WLhGCnfRiR5XdCRp7ZT3kuIpPEAosOAAB0YkvxJaE33p2bOqvABfdMjScE3c9k02mN
	FpqXJRbydknU7mYM7fGI58crFWtKKU0KRDhSZsAsBB/tst+/WxUo6U26LM+k1g97MClQcJimtKIQ+
	60i6xexA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uZcop-00000009yav-2znA;
	Wed, 09 Jul 2025 21:59:11 +0000
Received: from mail-bn8nam12on2061a.outbound.protection.outlook.com ([2a01:111:f403:2418::61a] helo=NAM12-BN8-obe.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uZa3m-00000009bTC-0Vtt
	for linux-arm-kernel@lists.infradead.org;
	Wed, 09 Jul 2025 19:02:27 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=vpqfKnhpwJOmDn8CwnGC0zMaaStmpCXIvjZofq0QOO3QqOba8ER2ClRP1zo9k8vE/+vMcMc6/sQcjRHIci4IFF9FI/kI6TulLLLyF8VBgxSqLeVJJ6G8YR2Lk1ZVujIO6hNufCPzjefdUzxdFqMFXjl0sxr0EaTCDLYS+hfj+S6odUDdY8HZUEguHcuye6fhMx1rrSRwJcY64QZvZm0t3SbNcvhl6RuuLa+pWeGoyDP8whWX6Un6MZq5pfoYtciWbptsGg+tYlIoGyCbGabHFkgVjqPusI5M3eeG+m1wFsqyFtKwjk8chZIpXl6M43BxJhZPjVxI43HkZsDXwySktg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8LtzE1fB0PojPrl5ZBm3OK3/9ti96j0eq+tuRMGdzqE=;
 b=X9rIoHVST7FG5h+yQXvSTZ5KaisDrjuDW6XOAyAOy7URjqIRDQmD2NZYt8L6RR9iSmqSNPzZjL0e+fjKxmCXJTPKvFL6kK+NYAqzjpPqWtTSLzALNwVXfakjxgiUwx/k+AQdhkJjlZfsJJHf8//s97xazWW2i5CCuf+N6lG7UBnh4kC5TMUQyiVRDUmfeTPheeKA/bfqZ4OF8x86KDX5a/sLjq8Qi6MP6vTz8CUkzgv+Rl1Y2WDM+Eac4tNz5LaXi2m9i0t8siiGWcuypYuFQdAWabxHmmbuk/osjq9ucqGMV/yMDXL4Z1ivMS24SRdAPSACNtjG/nup44VYxLmKjA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.118.233) smtp.rcpttodomain=amd.com smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8LtzE1fB0PojPrl5ZBm3OK3/9ti96j0eq+tuRMGdzqE=;
 b=TByd99i7MIIrxTIcexpG3MXK5tca95xrWExIlDxFKUS+rwVtOIeDMxfWLyd3i0ciIRvAJuup3QcQYO+lZK93MQtV4h75kEf0ZI+gjW3z4Np2ikD55AzqjY9wgcg4nnU6TSOOB4UKQf7F2Y9Oku7NAuGe1UXQD2jf1FbYT2gLDP4jioFkgECBB2l0RywQ3aWRALUj681nOJHzH1EU8x1YXtuHA2Nv65lcaoPCSV59QE1izeJgA3jKIhMKxyT7TWjvMd9cNQfQ4l3ryE/5rmsE3+J+ZczZD0KS+1QecgAKvQuk4ewBdygoh+DgjZFz1Di9u/OFa9hPCbKlU5Qgp9qNcA==
Received: from PH7P220CA0003.NAMP220.PROD.OUTLOOK.COM (2603:10b6:510:326::25)
 by IA0PPFD7DCFAC03.namprd12.prod.outlook.com (2603:10b6:20f:fc04::be7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8901.24; Wed, 9 Jul
 2025 19:02:19 +0000
Received: from SN1PEPF00036F3E.namprd05.prod.outlook.com
 (2603:10b6:510:326:cafe::5e) by PH7P220CA0003.outlook.office365.com
 (2603:10b6:510:326::25) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8922.22 via Frontend Transport; Wed,
 9 Jul 2025 19:02:19 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.118.233)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.118.233 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.118.233; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.118.233) by
 SN1PEPF00036F3E.mail.protection.outlook.com (10.167.248.22) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8922.22 via Frontend Transport; Wed, 9 Jul 2025 19:02:19 +0000
Received: from drhqmail201.nvidia.com (10.126.190.180) by mail.nvidia.com
 (10.127.129.6) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.4; Wed, 9 Jul 2025
 12:02:06 -0700
Received: from drhqmail201.nvidia.com (10.126.190.180) by
 drhqmail201.nvidia.com (10.126.190.180) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14; Wed, 9 Jul 2025 12:02:05 -0700
Received: from Asurada-Nvidia (10.127.8.14) by mail.nvidia.com
 (10.126.190.180) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.14 via Frontend
 Transport; Wed, 9 Jul 2025 12:02:04 -0700
Date: Wed, 9 Jul 2025 12:02:03 -0700
From: Nicolin Chen <nicolinc@nvidia.com>
To: Vasant Hegde <vasant.hegde@amd.com>
CC: <jgg@nvidia.com>, <kevin.tian@intel.com>, <corbet@lwn.net>,
	<will@kernel.org>, <bagasdotme@gmail.com>, <robin.murphy@arm.com>,
	<joro@8bytes.org>, <thierry.reding@gmail.com>, <vdumpa@nvidia.com>,
	<jonathanh@nvidia.com>, <shuah@kernel.org>, <jsnitsel@redhat.com>,
	<nathan@kernel.org>, <peterz@infradead.org>, <yi.l.liu@intel.com>,
	<mshavit@google.com>, <praan@google.com>, <zhangzekun11@huawei.com>,
	<iommu@lists.linux.dev>, <linux-doc@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-tegra@vger.kernel.org>, <linux-kselftest@vger.kernel.org>,
	<patches@lists.linux.dev>, <mochs@nvidia.com>, <alok.a.tiwari@oracle.com>,
	<dwmw2@infradead.org>, <baolu.lu@linux.intel.com>
Subject: Re: [PATCH v8 14/29] iommufd/viommu: Add IOMMUFD_CMD_HW_QUEUE_ALLOC
 ioctl
Message-ID: <aG68q0Uv+AuIgbvX@Asurada-Nvidia>
References: <cover.1751677708.git.nicolinc@nvidia.com>
 <49a93d92ce657cf6a0d588d2b31ad3600ace21f7.1751677708.git.nicolinc@nvidia.com>
 <1f18d7a3-b515-4096-aff5-1aea31ce4f7e@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <1f18d7a3-b515-4096-aff5-1aea31ce4f7e@amd.com>
X-NV-OnPremToCloud: AnonymousSubmission
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN1PEPF00036F3E:EE_|IA0PPFD7DCFAC03:EE_
X-MS-Office365-Filtering-Correlation-Id: eedfd18b-933d-45a0-eec1-08ddbf1b20d4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|36860700013|376014|82310400026|7416014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?5gbWBMfTS+q6e08U+3zsnwEbM0QlV/THggHdBPaBGqRPvGZDI3VJjJ1m8VH2?=
 =?us-ascii?Q?Pb+nArhrS2jLfHI2Ws9PI6M+7wUQYau9T24Grtdf7OCA8CLC22Yg8RqJ0LLH?=
 =?us-ascii?Q?4iMtSJUuu1M++xQkW8RXMrHbmN36J+F7+oCJhTdNRkZluqXw4XTcYpa4OKYw?=
 =?us-ascii?Q?3yFqLv+m7VonaF+b3UScrJnO+XDFn3ob284AT2fk4bCMUQo3y0SS1/XmYx6l?=
 =?us-ascii?Q?94Nd7tfdC9/D/YgBfmFcU+hcQwo1/XaJIIHSiwYwTOfmBbDtRsYo7g3jVScB?=
 =?us-ascii?Q?hebeHfSVvA8Jv2wxS1tmBxX2X1xAVBiqyqcjC6ewHV6FGceUW7vxriEhbrda?=
 =?us-ascii?Q?W00PNmnucWdA9mwznOJ8/NBIg7ww95f9pHaztL7q65eDAn8MX90wFbWTAy6c?=
 =?us-ascii?Q?Nlgv+DrHnuMTxubeI9U0AsHplVODJjDPrUMvwgYndLzDJ7lgl1pEh68Nz9fu?=
 =?us-ascii?Q?dXynjHqQbk1UZkSwFGrvPq2gvOiVFYzaRsSFcc/tYLJKbudUthioUYhU5QKg?=
 =?us-ascii?Q?ibHtNipan6Wu1Pge+kZmG0CNP1zcysF9uxmBViiPhii48EXKWKrrsoDL41ll?=
 =?us-ascii?Q?BioREjyiBOSweJmP+B9sw2pO08GoA2SVVzDeAAoc5TuKYUalpou3lOL4XjaA?=
 =?us-ascii?Q?Y4BPqAtvW9XbogiFS0AlEnF5HRU8Cfxzj0WoyV0Zrc7e0pn+UhIfZoU9q2r+?=
 =?us-ascii?Q?UsHXSRf3vS+M4fVW17G9bIL3sI7fY47ZjdL2vvHi8VLULSbcaF6eODHhdwCm?=
 =?us-ascii?Q?YSzbRQR624rQ2Jo0t7Il9/Gsx5a7QpGSzqla94qWmCJiIoXhVjhdX6IyEN4g?=
 =?us-ascii?Q?EMDguZT8GIetsoU6LYD8mlR68TswHdThpIIlH1kzqNG5iRFFfLPhnC0UGwk+?=
 =?us-ascii?Q?aoOkPuF0703NfecGhTIf1zTGY5NWjsVk7AjgHEay2jnM9ytKk4VFn7UuAD1G?=
 =?us-ascii?Q?p4ff7N/+S+hDWucghDKUzm5i5ZEnRvBWBwKBlh+qdU36pF9hdQld2TatGetc?=
 =?us-ascii?Q?9quDZQFAqt5p90rgTumIa9Qpk2R1KAk/eSOh70eL7fKRjtvyhpvn6md5VLwJ?=
 =?us-ascii?Q?Ywj3DCuMt+NQxL2QzfuWWZVoJ6EAApGujNnBG+ZdYwUZQpKv2V7HnU778lbJ?=
 =?us-ascii?Q?SWgCxydHDXnp4pBsfmC99nQsBwHArAUWqqtK+3mg8LZt+jM7R00mIYodYIIP?=
 =?us-ascii?Q?hg4bN8kJsKhuDgidMiE2ku36AauCQCtQt5SVtXCkQ9qNwdAv1EGQMwV0z+Wc?=
 =?us-ascii?Q?JXesh82hOgyiGLZq1o+vG1Id9sIfNtUmxW29QCqFqGkbIyrESPT8o67gUf4r?=
 =?us-ascii?Q?fEpF8FcS7hxvHb5ojxqEWV9l5+Fcmet7uKeoQR2aCvy1ZXlWwgAFtmKv8X4+?=
 =?us-ascii?Q?2YSYzGOi4xAz/Y2mGFKcoMHNecihm62WZHQvRCQy9wtd2s5z1rE5hMEUi+U3?=
 =?us-ascii?Q?4D5a13DyctLqPlJmwpx1WLVejKmW96dSbveKP930lfNCRaGYXCK4SBBG81pv?=
 =?us-ascii?Q?Q69NWQMnvztBbwXq1r7sF3kXSKBBErHQoCsc?=
X-Forefront-Antispam-Report: CIP:216.228.118.233;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc7edge2.nvidia.com;CAT:NONE;SFS:(13230040)(1800799024)(36860700013)(376014)(82310400026)(7416014);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Jul 2025 19:02:19.0990
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: eedfd18b-933d-45a0-eec1-08ddbf1b20d4
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.118.233];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: SN1PEPF00036F3E.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PPFD7DCFAC03
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250709_120226_163743_E7362DD3 
X-CRM114-Status: GOOD (  16.54  )
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

On Mon, Jul 07, 2025 at 01:11:00PM +0530, Vasant Hegde wrote:
> Hi ,
> 
> 
> On 7/5/2025 6:43 AM, Nicolin Chen wrote:
> > Introduce a new IOMMUFD_CMD_HW_QUEUE_ALLOC ioctl for user space to allocate
> > a HW QUEUE object for a vIOMMU specific HW-accelerated queue, e.g.:
> >  - NVIDIA's Virtual Command Queue
> >  - AMD vIOMMU's Command Buffer, Event Log Buffers, and PPR Log Buffers
> > 
> > Since this is introduced with NVIDIA's VCMDQs that access the guest memory
> > in the physical address space, add an iommufd_hw_queue_alloc_phys() helper
> > that will create an access object to the queue memory in the IOAS, to avoid
> > the mappings of the guest memory from being unmapped, during the life cycle
> > of the HW queue object.
> > 
> > AMD's HW will need an hw_queue_init op that is mutually exclusive with the
> > hw_queue_init_phys op, and their case will bypass the access part, i.e. no
> > iommufd_hw_queue_alloc_phys() call.
> 
> Thanks. We will implement hw_queue_init[_iova] to support AMD driver and fixup
> iommufd_hw_queue_alloc_ioctl(). Is that the correct understanding?

Yes. I think just a simple "hw_queue_init" will be good as the
object structure stores "iova" already:

struct iommufd_hw_queue {
	...
	u64 base_addr; /* in guest physical address space */
	...
};

Thanks
Nicolin

