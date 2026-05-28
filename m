Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 80DC8CD4F54
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 28 May 2026 23:19:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:CC:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=qb6dOgbgrFsdpsBNZkk0ujYCroogg/idL7Ue4XlIpC0=; b=3Wx4R6kRVMRS07asFc5CCLes1h
	vtZBFWMgzYx4tIuCOu4lVMoEkqTt7AThcyQT8tJtKkqLt07Rdw1NsT6t4B273cYLPLhPuqkkRu9X5
	SgnOwDRvCiTvdYKev1tsRROE3glhtE/9skYOtP9V7Dg6A7ymsEg0KFo6pwX45oW9b2PD1c+sMkAUz
	czNMkUEHs3kinR5fu3h9KNmYkyfY6fioQ5eZAewZNGwYa0gJJ4Ua0a9TrYCpmHyBklU6RunZe7ygz
	1ZLmIGxXmfcZ3gdBjMvTna6s3m1NLwH04v6K408sZ85iUnlf3VPSb6cGrkDMeQ1F240Ve/F4O4Ub6
	Tl/aP29g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wSk0X-00000006WIE-3zWc;
	Thu, 28 May 2026 23:19:21 +0000
Received: from mail-northcentralusazlp170100001.outbound.protection.outlook.com ([2a01:111:f403:c105::1] helo=CH1PR05CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wSk0V-00000006WHs-2ZzP
	for linux-arm-kernel@lists.infradead.org;
	Thu, 28 May 2026 23:19:20 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=S3ByOAIkhYNMvsOkmfc97lVVLSbLabgWH0qg4sfZ4ESyYSF71ZSKXoSoxxo6Kx1KAddlzm2hY3v9RZ1nCnG2ZtAYb/1LCAyhTUIZwEGqQHHCTkghe7lD1Lsjh2qQqmE6oGQDv18+mtSwfY1ttu8JcDWcDEWNvdyMkmhwN1TGoO6PYhRNpgLabuW2VbB9V+kdZG8RUMcRrEMiYzkffDMq1VSaVBp6nwMJc0zgDbymlYgQdcPQO64Njhz3W0HKvmNsqf/prIrWHdyTKcNtJL985kshyBHAVBPYKMFKkytiTs3TDaCGuMv7DMxtunga7miVoYEzz3M10DhkLIToH0r2gA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qb6dOgbgrFsdpsBNZkk0ujYCroogg/idL7Ue4XlIpC0=;
 b=dxoHd41hgyH6aHb2c5X00vKsMcKGALq8QS3G30WNOjGN8CfMt0hNAU87Y3j9ACXajN9HvI0x6T2tNwcI1kuJZbS/Y0ZADsGFd0xx6ke/5X7mHLQAk0dCVn8UGEJr/0aq+rDneSWLdx97q2lHLu6hlhmSlx1o0yQHUAAfKXhjMlIq1vR8WOfqz7f7gRZdYmIKWFXD1tkexqQMWOkeh4QQcwgCWhhBR0bBTiWyxTvgdM6N47K4rhj16doQCE7IdCditT85zGoczGqEeQNrNbL2OEv/LozmUenlgTf9Sx9wj8aJ3QtSnWKRLqX/xEedTDLScntefj1mVagUjboX9a1uWA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.118.233) smtp.rcpttodomain=google.com smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qb6dOgbgrFsdpsBNZkk0ujYCroogg/idL7Ue4XlIpC0=;
 b=gFhkWsVxJs0fArgf+kYYU9NvLveEGM134jFAlTwn/eohP/VbC0r1M+boUj0MgiB1t+p4+RoE/lTV4Y0B6GqMtodK8mhR1Yc85UWlhloCFINTrfDftfltOtBrJF5i3vXnLKI+yVe2Cc3NrvHqzjN5n9pYOHU04yvi/qHiCpuOM0GCMMri+m/+pwQr5fnALUOhX4sNFfdHPVj3AppUuxWcRyAwjjXnNIBXB5UMCmo2zge6eTxi+B79WC8Y25KFHnlRBG94z1yhA83zZ+hVx5qPzSb5xuviSGgMyukWNdP6HcX/tDb4dsT2kL8So7BXUmiZ3E72LZwkedDRhtlf6ONk2A==
Received: from CH0PR03CA0024.namprd03.prod.outlook.com (2603:10b6:610:b0::29)
 by CY5PR12MB6573.namprd12.prod.outlook.com (2603:10b6:930:43::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.71.12; Thu, 28 May
 2026 23:19:11 +0000
Received: from CH1PEPF0000AD81.namprd04.prod.outlook.com
 (2603:10b6:610:b0:cafe::86) by CH0PR03CA0024.outlook.office365.com
 (2603:10b6:610:b0::29) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.71.13 via Frontend Transport; Thu, 28
 May 2026 23:19:10 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.118.233)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.118.233 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.118.233; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.118.233) by
 CH1PEPF0000AD81.mail.protection.outlook.com (10.167.244.89) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.92.5 via Frontend Transport; Thu, 28 May 2026 23:19:10 +0000
Received: from drhqmail203.nvidia.com (10.126.190.182) by mail.nvidia.com
 (10.127.129.6) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Thu, 28 May
 2026 16:19:01 -0700
Received: from drhqmail202.nvidia.com (10.126.190.181) by
 drhqmail203.nvidia.com (10.126.190.182) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.20; Thu, 28 May 2026 16:19:00 -0700
Received: from Asurada-Nvidia (10.127.8.13) by mail.nvidia.com
 (10.126.190.181) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Thu, 28 May 2026 16:19:00 -0700
Date: Thu, 28 May 2026 16:18:58 -0700
From: Nicolin Chen <nicolinc@nvidia.com>
To: Pranjal Shrivastava <praan@google.com>
CC: <iommu@lists.linux.dev>, Will Deacon <will@kernel.org>, Joerg Roedel
	<joro@8bytes.org>, Robin Murphy <robin.murphy@arm.com>, Jason Gunthorpe
	<jgg@ziepe.ca>, Mostafa Saleh <smostafa@google.com>, Daniel Mentz
	<danielmentz@google.com>, Ashish Mhetre <amhetre@nvidia.com>,
	<linux-arm-kernel@lists.infradead.org>
Subject: Re: [PATCH v7 10/11] iommu/arm-smmu-v3: Invoke pm_runtime before hw
 access
Message-ID: <ahjNYqe8hjPUQIQD@Asurada-Nvidia>
References: <20260527221407.1756491-1-praan@google.com>
 <20260527221407.1756491-11-praan@google.com>
 <ahilX8Za1NRCH3ik@Asurada-Nvidia>
 <ahi3uY9YZZtR1Lq5@google.com>
 <ahi7KWov1+GC3xVx@Asurada-Nvidia>
 <ahjAxx-cyww2va__@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <ahjAxx-cyww2va__@google.com>
X-NV-OnPremToCloud: ExternallySecured
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH1PEPF0000AD81:EE_|CY5PR12MB6573:EE_
X-MS-Office365-Filtering-Correlation-Id: da22f7e0-8d34-4621-bc2a-08debd0f8648
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|82310400026|36860700016|1800799024|376014|18002099003|22082099003|6133799003|3023799007|56012099006|11063799006|4143699003;
X-Microsoft-Antispam-Message-Info: C3RnyQVT7sQfsuE6v5PEjzuJAOUrvVOTuc9cCiqxa4G3g2MGyREpK9XgNzjpUYiFoAGpy7bqvAdtDvcAtfTGsO0Brf3whsVPvCvonFNVu99moJSXT2lUaF4nmMM1+wC0g5RjfK1zOwZWBYDnEMbkLJ8V6g6xzvJ1b03coKQbE2gZ0IIYhWjTzUEfJkit1j8kkR7YfA2Zp0KXlzUsxl7riY/KS1w6t3oOrovk275jgErX6/x5+ZDt0ha+7hwVCpGmJSfsbKT3tH6HwwsKzWrpgAGqPlOwuOgRTZw1IlKMoW/MajUf4We4I++c2byp4cEGjWL8umORebXSgLF9ZKiuRVPP8YzvhkKrIEZaI9V/Pej9WmPGBxtm/L4CzzDgTiN6tIiyFVHy+Zuv35Dwd3/MvtyTM9fwHo7mofpeowroc3dkvMZW0FLgnCXurCZ9TY0ky6PaOzxHxy/1grGxN/MxJRAR0qFE1ICRIIzx4g/HnD878Hdfpr40Fr6j1NR6ctNzGZpdO/ueOvC/8ZuzdOqRnWgF157TYeExjUylBKaq00KMafTXGYFlcQV5aSLZh2BA0J6Jlje0BoOd080Jp3Ny1FlDwu1+T+yuhGmJMqdIzpAtvONi9pC7rNtICZ1VhobEoNMjjiKQf5NBj5OcInnO6suBvoainbTJ6yP36KRB/W3azb/YXuAIzmTBbn2+lJdXyjbg5sripsSO3IVn/hQOWXRAPSIVP7PLUSPNlKtUtmY=
X-Forefront-Antispam-Report: CIP:216.228.118.233;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc7edge2.nvidia.com;CAT:NONE;SFS:(13230040)(82310400026)(36860700016)(1800799024)(376014)(18002099003)(22082099003)(6133799003)(3023799007)(56012099006)(11063799006)(4143699003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 3IsWR6LJ0ue4I5ps09wWyaA1lNoDENeYVTY/+TXmbRgZ0n+yG0+6ddyKTnZuq5/bSuRjuDvmM0ZHmdijnDkJbWIl/V+IO96RveGuEsLyNbodKD6qrEAUz5v8AEjUWa6hoY9VqNZpuzC1rusb1kYGvyBq+d/+5C+o/XNR7psnSp3Av8ERUSMXqrQ+86b1MQVeS0PG0dHvsvjrg+oLkRuzeH1nZMSE0laW0AuvhTaJ+P+Cy3oxe3iKrJ4zyHBwC/visSIvadYQB1D0aKpp4NFvwxNMwHnVAfeXTbd2avW5dHGFonVp3g9d+2hrmYvjN4c/A2HcSteeaA7j0A6Bf+OGv9+WsIHgti+Nu4P13a3+/Q7RcAterEQ2fcxVaVGLRYwJ6gQbDF0wvgvGWcqMMSwAGRe6Tbemb3A9mLpVHpptUVUvIsiJ4EyyimTc51QYq6dz
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 May 2026 23:19:10.6709
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: da22f7e0-8d34-4621-bc2a-08debd0f8648
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.118.233];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: CH1PEPF0000AD81.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY5PR12MB6573
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260528_161919_660839_C999E9DE 
X-CRM114-Status: GOOD (  27.49  )
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

On Thu, May 28, 2026 at 10:25:11PM +0000, Pranjal Shrivastava wrote:
> On Thu, May 28, 2026 at 03:01:13PM -0700, Nicolin Chen wrote:
> > On Thu, May 28, 2026 at 09:46:33PM +0000, Pranjal Shrivastava wrote:
> > > On Thu, May 28, 2026 at 01:28:15PM -0700, Nicolin Chen wrote:
> > > > On Wed, May 27, 2026 at 10:14:06PM +0000, Pranjal Shrivastava wrote:
> > > > > TLB and CFG invalidations are
> > > > > elided if the SMMU is suspended by observing the CMDQ_PROD_STOP_FLAG via
> > > > > the arm_smmu_can_elide() helper.
> > > > 
> > > > All the arm_smmu_can_elide() call sites here would eventually elide
> > > > the commands in arm_smmu_cmdq_issue_cmdlist() that is already gated
> > > > by CMDQ_PROD_STOP_FLAG? It doesn't seem necessary to gate again?
> > > 
> > > While issue_cmdlist() would eventually elide these commands, the 
> > > can_elide() check is necessary to return early during suspension. 
> > > 
> > > This avoids unnecessary stack allocation, cmd building, and spinlock
> > > contention on the cmdq->lock for threads that are anyway about to be 
> > > elided. 
> > 
> > We aren't in the perf sensitive path.. most of those aren't going
> > to be that bad.
> > 
> > arm_smmu_cmdq_shared_lock() on the other hand is taken at step 2,
> > and the STOP flag in the same function is gated at step 1?
> 
> DMA unmaps frequently occur from atomic contexts, interrupt handlers etc
> Thee Step 1 check in issue_cmdlist() happens under local_irq_save().
> We may argue that it doesn't happen for long though..

It shouldn't IMHO. At least most of the call sites in this patch
are right before calling issue() functions, so they are merely a
few cycles away from the STOP gate in issue_cmdlist()?

The only place that might be slightly longer is the inv_range(),
if the domain->invs is really long (e.g. nesting parent for VM),
in which case, it might be plausible to add a gate. And even with
that being said, it should be add to the top of the iteration (on
invs->has_ats) rather than before submit()?

> > > By dropping these requests immediately, we significantly reduce cacheline
> > > bouncing and contention during unmap storms.
> > 
> > How significantly, so as to justify invading every command issue()
> > call site, which would be difficult to maintain? If we really need
> > an early return, it would be nicer to have a common place at least.
> 
> Eliding early is more of an early-exit from the DMA unmap paths really..
> If maintaining these high-level elision checks at 4 or 5 call sites is
> a maintenance burden, maybe we could move the logic into the issue_cmd
> macros? 

What kinda of macro? Again, if it is added to just a few cycles
right before issue_cmdlist(), it still wouldn't seem necessary.

Nicolin

