Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BBE6EC3ABC9
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 18 May 2025 15:22:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:CC:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=tfp2q5PgLwBizuG3HKzEM/Vj8/Iyibt8Rup8gaOnDSM=; b=iQ2wFUXCmMKS+M89bTPUZLGQmU
	KdyabX598XTqiZd6V1xPg4TclKQXw093YCU2TWe3AmK/k9DSdCg3B0GomE4z6fHLfZlrFzVi++UPV
	u2ClN3usX27ZhTUp/zCW+SnS1W057WSiEKqLgD70P2SF2+DLLwHFouWQiOKaAhax5aeIhd9d3PPAM
	w2tHfl3dL37o/D3dQaUnXj1fhGk6SqPMTUfhPE4IT6Qt1SKn+uEkfSB+b1zsJcX/eR2aN1y1uwNIu
	mthv5J46nn9YOl+C2xJpigtjYEcVyNn3lgl4/o7NzpaFHBhMyO20XhUHDju3kz4jfIYAmGA5FrsY3
	AEK2mmbQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uGfpu-00000007EmZ-2krl;
	Sun, 18 May 2025 15:21:58 +0000
Received: from mail-dm6nam04on20610.outbound.protection.outlook.com ([2a01:111:f403:2409::610] helo=NAM04-DM6-obe.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uGfnu-00000007EeZ-26Oe
	for linux-arm-kernel@lists.infradead.org;
	Sun, 18 May 2025 15:19:55 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=HwS2g8Qm9+AVjaVuJVeZu8cjLIkCnmTYSpScm9yOXMpE7DfwkRRQUBFgyT2Rp1NrA02JHbo3GRg1EtzuJB0oI9PVBJ0ZCCbpQAumLcj7DtHewG0f8+PJiqZtrldtGz0Qo09lSFuHES6ZLiPd4ZXmWEgBeyieOVo8pgPb0wgKhGU04YG9OgQr9KQA4D6V0CrzSwsb1UCXTKcud/ansFDOGk4XIUw7bhAdjwTf1rHg+7XMyIk6zCtOl0tHsBb6fvuNg/BNAPRSfcLp4zvhJ4mki64uzT4rb9IF1kFjG+lhvd/uU7Xzfwvr5RWbcXZJMMSP3rbyo5YQk1KDjSo6CrOBHw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=tfp2q5PgLwBizuG3HKzEM/Vj8/Iyibt8Rup8gaOnDSM=;
 b=XTIXA0fVwXmPsonNlIJFWVXnRbRvViWGpuQnw0bFStC1b2k57VG8hoo2uthwSVfuTTLoDV5Bh0TuXorIg4Ydpd1McG6iM1h7lvi99AQE6UZYUJ537KS8UijhClh17/BcVZfPWe9nEUjZn68HYmzNmNkHjh4H/OEyx6rY52ZaBLhvwUncjYupA0iMNV9uXYqVMgIHPrFrG/ugBAOL5Q3/pUHgCcdBmr+OvcVCh4c84oAEZSlVKchxw82D1LKKpOUJR+RxBE3L3B+QQgRE+ycAFwn08YLf7u0imWSItHJhtONClJr7LAOiENvZD3NAMhx2ovNkFoNoyH+LHAUNOcXiTQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.161) smtp.rcpttodomain=intel.com smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tfp2q5PgLwBizuG3HKzEM/Vj8/Iyibt8Rup8gaOnDSM=;
 b=rSEfD6BlnVHYs1jqSmuUga8WsbLjsOXZfgIHkVCO73ymYnML3jLOXBW2piHbw3vKK3zDRGqVLygtpCEKMrjthfolnDpP4CAHuKbs1IDU7QCiKZ1oWSog2qBlJ3DYoClvF+Tzi80zkuM6BB6uzdqhfzw3+/YSHAukc0tjlNEdlPomkSLJ0qZfn3KakY/9ZzYJqRJHB37UhpaGSmSJEHnPCk9elyo5P1t+g1twl1o2KZrppROUnzRkgSsrk+dlQLljyTLvwL3E8C3bEHy1KhO6sLyfPTB6ccqcAr2Y6qVAfElZBU5YgpMxoUy/yxV3R8m3lWEq7x0Oo8Xk+0zG2wOjrw==
Received: from CH0PR03CA0284.namprd03.prod.outlook.com (2603:10b6:610:e6::19)
 by LV8PR12MB9272.namprd12.prod.outlook.com (2603:10b6:408:201::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8722.33; Sun, 18 May
 2025 15:19:47 +0000
Received: from CH1PEPF0000A345.namprd04.prod.outlook.com
 (2603:10b6:610:e6:cafe::d1) by CH0PR03CA0284.outlook.office365.com
 (2603:10b6:610:e6::19) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8746.29 via Frontend Transport; Sun,
 18 May 2025 15:19:46 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.161)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.161 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.161; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.161) by
 CH1PEPF0000A345.mail.protection.outlook.com (10.167.244.8) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8746.27 via Frontend Transport; Sun, 18 May 2025 15:19:46 +0000
Received: from rnnvmail202.nvidia.com (10.129.68.7) by mail.nvidia.com
 (10.129.200.67) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.4; Sun, 18 May
 2025 08:19:37 -0700
Received: from rnnvmail204.nvidia.com (10.129.68.6) by rnnvmail202.nvidia.com
 (10.129.68.7) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.14; Sun, 18 May
 2025 08:19:37 -0700
Received: from Asurada-Nvidia (10.127.8.11) by mail.nvidia.com (10.129.68.6)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.14 via Frontend
 Transport; Sun, 18 May 2025 08:19:36 -0700
Date: Sun, 18 May 2025 08:19:34 -0700
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
	<vasant.hegde@amd.com>
Subject: Re: [PATCH v4 11/23] iommufd/viommu: Add IOMMUFD_CMD_HW_QUEUE_ALLOC
 ioctl
Message-ID: <aCn6hrev3k7A1Q1E@Asurada-Nvidia>
References: <cover.1746757630.git.nicolinc@nvidia.com>
 <f52937c027e2fd25d76bc47f4965ba46f82c77c0.1746757630.git.nicolinc@nvidia.com>
 <BN9PR11MB52761EF8360BEF5C19C2382F8C90A@BN9PR11MB5276.namprd11.prod.outlook.com>
 <aCY2GKfMh6f+vXHj@Asurada-Nvidia>
 <BN9PR11MB52761839AABD5AA55DF3FE118C93A@BN9PR11MB5276.namprd11.prod.outlook.com>
 <aCauEGCqk5lVikwR@Asurada-Nvidia>
 <BN9PR11MB5276C2D25DCF30A7367EFD168C93A@BN9PR11MB5276.namprd11.prod.outlook.com>
 <aCa5dLKso2WXliut@Asurada-Nvidia>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <aCa5dLKso2WXliut@Asurada-Nvidia>
X-NV-OnPremToCloud: AnonymousSubmission
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH1PEPF0000A345:EE_|LV8PR12MB9272:EE_
X-MS-Office365-Filtering-Correlation-Id: 8b4b9fb6-155f-4436-fe52-08dd961f6cbb
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|7416014|36860700013|1800799024|82310400026;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?S+kgzV3ErX/41RLsqCeUxs77hTi6RhGKdRSZvR/VR2dNneB5U4nWIlaKb50u?=
 =?us-ascii?Q?9LrpRHJpWSOYIwo7RNWisCDbsLwzuy145gRkZ4gsyFGXyJhS4Ejn+zpp1GQP?=
 =?us-ascii?Q?ZLKV12R6quv8XxHtXct/qTN1ZfDoxPzMSAMH/dCwHnDvW336UgGX49lGivZK?=
 =?us-ascii?Q?u5RV2+ZoD8I47I2iQ/A7J8ORFPBXN4AcjtYgO5SUwR/pR1xz1vQcYweagzIO?=
 =?us-ascii?Q?TtaGC5qiFjS14q0avi8KFVbU+ODb05bFiBcJdbU1Rpq+u2ubfOriZyvhiB9n?=
 =?us-ascii?Q?g+PPO46imCjE6jHEH/ZgQmxRNjLjLYLez+VJR1Oh3qEfl0zo5f4j18X+WvVE?=
 =?us-ascii?Q?d6GVfkIWehDtiUU1bK/JgR67ElVrLBSsxoKKXCVyQ7tk3XJ8++zWlNbIgJ0X?=
 =?us-ascii?Q?LvtePLj0tGV9Kt6PHPXKB9AF8VCJtDecq6b4mjTyb0WbcDSpBqZDTy2ZZfiP?=
 =?us-ascii?Q?C5TjbX68bSg0Zz8Il9UFY6QKNWVxr4EPKKzaVFoRRxOrrwb9KDP95lCGmK98?=
 =?us-ascii?Q?MgNuCteige5MDUPsWCmlzp8Er6eljUSlqExkept45/5Cn/r9oRjzjFwL4XYR?=
 =?us-ascii?Q?d3BtPC+ZFGKctpvA1Z+dNFTEbojpE36xi/TKFMHFHOzh6O2veYUEBF+/kKU9?=
 =?us-ascii?Q?9+afNA2wO1flk5y6LSdNwIKSDUwy/WBKWNP04tLr9xIObG6fi2FqAyO+aWuU?=
 =?us-ascii?Q?GBgfd7DG7X8wsAtNGuk/8NI3NQyhKRNFXK1gg9cJUL8H03iDOQYxfpIPdW0z?=
 =?us-ascii?Q?lPoJEl1cLgpAqb9VL/fCwmfuzPBJ8U/1jcrNvqND2TdqOS0CoiDYG/RvAHG2?=
 =?us-ascii?Q?r19C09iiB1OMymFN1SxZLO0GBIXU/VHK9QvDqFhGpgOdLhIbnNPzyx/XhWq2?=
 =?us-ascii?Q?veCAQEbysqus1qJgR8IAb9ub3eCbuqui8XiTne7yXexUTpLJ+LQ1DDsPHTrn?=
 =?us-ascii?Q?z08lGSjmGvkb686/+GUGS/EqOBWYjwaPGm0L3w1UWvMzII0mf+SUmHFKpCxM?=
 =?us-ascii?Q?Jnw+bIJHJGVl9tNTfd0y6fHfrSCxk1lfSWjjS/W4V3wFRkU8BGhi7Zqk30Y6?=
 =?us-ascii?Q?SC9O0qCZvdBEi9wLhCRPhOAmGfkRThQuLSI6y0cvza4sxMPNCfJO7H1gIJYX?=
 =?us-ascii?Q?6wMt6hNhMygiWl8p0DZSUmCghXO5oRT3aThPuaC1NxwPGG40ueT3/A9R+AUq?=
 =?us-ascii?Q?nQrPtNb2df5tOzRFk5Hg7En+Fy5xu3ut0CEPqJPDzRGIUexX6CNWCXE/jnDe?=
 =?us-ascii?Q?GLOL2yDLa6f5Y2zzfQQR4nsKUUCphG1gDv55lflrTATgN6aH9wpoJc9ayp0P?=
 =?us-ascii?Q?Y1w5/XDkCtZZ/KSjmw0n01DwDRs4u2kzk4jQ5CkQe4Hgbuu8bC0XtW6jAI+q?=
 =?us-ascii?Q?+kBzlg2mV2SVU2AQ8lNpnWc5R4Jd/V0I5bgyilDGMpE7X6KIfkAM5tbb2QSD?=
 =?us-ascii?Q?mpoEE7K3WI858oQhAcTmyxCdOBkT07DD4vVkGTugW0j2c+frnq93Ir3stJM2?=
 =?us-ascii?Q?LYHQQhAdEd8UImrW16ZeAzZ//nAQZE8bOJ5y?=
X-Forefront-Antispam-Report: CIP:216.228.117.161;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge2.nvidia.com;CAT:NONE;SFS:(13230040)(376014)(7416014)(36860700013)(1800799024)(82310400026);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 May 2025 15:19:46.7276
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 8b4b9fb6-155f-4436-fe52-08dd961f6cbb
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.161];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: CH1PEPF0000A345.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV8PR12MB9272
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250518_081954_541545_3DFD3B65 
X-CRM114-Status: GOOD (  19.45  )
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

Hi Kevin,

On Thu, May 15, 2025 at 09:05:11PM -0700, Nicolin Chen wrote:
> On Fri, May 16, 2025 at 03:52:16AM +0000, Tian, Kevin wrote:
> > But hey, we are already adding various restrictions to the uAPI
> > about dependency, contiguity, etc. which the VMM should conform
> > to. What hurts if we further say that the VMM should allocate
> > virtual index in an ascending order along with hw queue allocation?
> 
> You mean adding another flag to manage the dependency in the core,
> right?
> 
> I talked with Jason offline when adding that depend API. He didn't
> want it to be in the core, saying that is a driver thing.
> 
> But that was before we added pin and contiguity, which he doesn't
> really enjoy being in the core either.
> 
> So, yea, I think you have a point here..

It seems Jason is out of office. And in the last sync w.r.t this,
he thinks that this ascending order stuff is too unique/weird to
make sense as a feature in the core, that there would be unlikely
a second HW wanting this..

I think that's a valid point too. The pin/contiguity requirement
at least serves for HW that reads in physical address space, and
it could result in a slightly faster memory access since it does
not need a translation, which though gives software some trouble
yet still makes sense IMHO.

So, in v5, I kept the dependency APIs rather than moving to the
core. I think we can move to the core later if we see another HW
doing the same thing.

Thanks
Nicolin

