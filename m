Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 640BCCD4F5B
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 19 May 2026 20:14:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:CC:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=pB3+7Yp2REzqVid/Y8/HT4X24WaW8B6QqXm8JN0NPXM=; b=f0m7K9N7+jh7sKQYqgpG2u3BlK
	gCi5Fy9x+x/QPW2U7dYhYw/hecDY/9rC8Eo18KVc1DeTRmmrM9GWMmoDQuTUUkk1apTui43dU+Qkz
	M6+tY0KznytPnU6zlv+mbaDdWY/YrAU1vGWeF5spHplnSskMtHJAcZqaAfO+cbcDSEhX3sSDC4X4J
	JVFCRgINB11nU7Gf2BOb53S9k/v/EUyA2dohGL2aevyGr4gT4vs0YZ1QypckXTevhaSH0EINRThry
	Fe5js+BrDcQsAZl2TP7bIu9huLPX2Wv5gQCBPYhWSwUd34U360OchM9Jvuor1L0v5FfcoDSf6KaxG
	Rs4odRNw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wPQp6-00000002h7N-3vhv;
	Tue, 19 May 2026 20:13:52 +0000
Received: from mail-westus3azon11012036.outbound.protection.outlook.com ([40.107.209.36] helo=PH8PR06CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wPQp4-00000002h6h-2kMM
	for linux-arm-kernel@lists.infradead.org;
	Tue, 19 May 2026 20:13:51 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Yh6JSiSNzz1TnSsG46bLxUT/F7a/LGPL19uBf14y/xDSKQX2TDOqPOez5HF64kRLZ3m7rS/Hqtv6l1+kCOGPcz/RWUec7xvf8ywk3A0eCRctY/OF+vPeUVYSmsyFpDU2frkIdLwFASkJZCAbAvdxrizPYFCemy2zhxi2JFqU5UhZi4FYZUAf1gj61rB9zJ9JPlUnqCRR7Tje475oiFLQCZqYWyTT5uzcD/KVb14P/Bi4U03KZ5EU/cZeu3Scw4qCkK0SGF6aK4Kcit/bbIT+Kaw/Y8rDXK5KNkMb6onIhUmpsVYJU4WvQokJOolXzCLuS9O9pgYXnmr+us7SDRwPBA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=pB3+7Yp2REzqVid/Y8/HT4X24WaW8B6QqXm8JN0NPXM=;
 b=nbn4ErsXMZvC2be+VMQhukEvBxuz/NOXwYFUullC9RJJT+YgW95cuOcD8LIPaqjVcMpuqE5IW95UgaR+6ucT1QHRVMLqkmOMUw515o9ncW53GDkVHKQGATDqvxNGpnJZkG+k9390RXxdcFjIlcQoXq9z9Dj7CtD/z7K4g7DOw/LxWihtq+cD7Xf8/gpsN6oPqWK1RM60H2GRfY79iOnyxj+FX2p0wetiJcJ9PkgfxK22zVy3uE/hAiSv9MZ+fosPaSiHamBSmVCPNx3jIKS1w0X6+nRGIOeid70w3D71w8NWVaaoPMsNxnp3uur296npavCzQYGkQNDO3JZVoxlV4w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.160) smtp.rcpttodomain=kernel.org smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=pB3+7Yp2REzqVid/Y8/HT4X24WaW8B6QqXm8JN0NPXM=;
 b=BUWISPHVkUVgYkY8jwW8e5mUVOy8dTKJ2QxbY/GL0NH/GbTURdS3Zp4De3J5i00OhVZ0kjntNwt4IMEVPaJN12qlIm5FtHLGxrsBGMhGVCdCvT+C6e1cjhBJLqkM8bmZ96REqqtKfn5U4pB3pyA23QlGVOYCOQs9JiNiKCvTDDXRmNm+QTE1DF36JAlUAo8SWL6kn7B5SYklv22PyvgkN73TcLfiertsd3QQCkqTq/E3FTaqZ5P0i2AQiP+vRJE9QLfByHiSms7vANuI+IxaOKXgc4Q5vpRG1VCsp2tHEG3m+wgCsGu8iur498+7pKqDUAtuX6Hcujsea7Zq55VGiw==
Received: from CH0PR03CA0056.namprd03.prod.outlook.com (2603:10b6:610:b3::31)
 by IA0PPF12042BF6F.namprd12.prod.outlook.com (2603:10b6:20f:fc04::bc8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9891.22; Tue, 19 May
 2026 20:13:39 +0000
Received: from CH3PEPF00000010.namprd04.prod.outlook.com
 (2603:10b6:610:b3:cafe::44) by CH0PR03CA0056.outlook.office365.com
 (2603:10b6:610:b3::31) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.25.25 via Frontend Transport; Tue, 19
 May 2026 20:13:39 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.160)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.160 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.160; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.160) by
 CH3PEPF00000010.mail.protection.outlook.com (10.167.244.41) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.48.11 via Frontend Transport; Tue, 19 May 2026 20:13:39 +0000
Received: from rnnvmail202.nvidia.com (10.129.68.7) by mail.nvidia.com
 (10.129.200.66) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Tue, 19 May
 2026 13:13:12 -0700
Received: from rnnvmail203.nvidia.com (10.129.68.9) by rnnvmail202.nvidia.com
 (10.129.68.7) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Tue, 19 May
 2026 13:13:12 -0700
Received: from Asurada-Nvidia (10.127.8.9) by mail.nvidia.com (10.129.68.9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Tue, 19 May 2026 13:13:10 -0700
Date: Tue, 19 May 2026 13:13:09 -0700
From: Nicolin Chen <nicolinc@nvidia.com>
To: Jason Gunthorpe <jgg@nvidia.com>
CC: <will@kernel.org>, <robin.murphy@arm.com>, <kevin.tian@intel.com>,
	<joro@8bytes.org>, <praan@google.com>, <kees@kernel.org>,
	<baolu.lu@linux.intel.com>, <miko.lenczewski@arm.com>, <smostafa@google.com>,
	<linux-arm-kernel@lists.infradead.org>, <iommu@lists.linux.dev>,
	<linux-kernel@vger.kernel.org>, <stable@vger.kernel.org>, <jamien@nvidia.com>
Subject: Re: [PATCH v5 3/6] iommu/arm-smmu-v3: Suppress EVTQ/PRIQ events in
 kdump kernel
Message-ID: <agzEVS5SFKHPb6/u@Asurada-Nvidia>
References: <cover.1778416609.git.nicolinc@nvidia.com>
 <6e5828f3288aed6f9e9f4e0ca54e7fbd9f439274.1778416609.git.nicolinc@nvidia.com>
 <20260519174453.GF3602937@nvidia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20260519174453.GF3602937@nvidia.com>
X-NV-OnPremToCloud: ExternallySecured
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH3PEPF00000010:EE_|IA0PPF12042BF6F:EE_
X-MS-Office365-Filtering-Correlation-Id: 0b2a8a63-bba6-4a76-20e6-08deb5e31e06
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|82310400026|376014|7416014|36860700016|11063799006|22082099003|56012099003|18002099003|4143699003;
X-Microsoft-Antispam-Message-Info: ahuy7FS79HYwot0kA5noQefUDA7PsxW1LtKZURRXIoTvJS6i4PB4qKqigF6oXQERvcCmDqgqeo3wng4pJugWQdpTyXL4D/sOUSWpQLnKB7f8XKE6ZWVMUUGzDziC2/oy00ArOjki0Z5qO0BK2rBFA9QOgnc6pc4eNOhkBbL0GukkQjash1a2ZEr7e9Yxm9y5y3PmsnVqhCSZtr52RA7lV21IZ2jd0edLpEZF6jAFWaVD6P/BxRXgVq2NQmxWw/1e64jvbfNSsE46evrtnjhPsFkygpVFwT0HVM1sTkfdD4SaDLrk28aZV/WxwBAGeRazshL2mqVb76hQ55h1r6qhANlQmFMl9opXvVt6xnC2CqtVdWTMbUKBuOCZG2WoIpo+YmF+cpLeDVvsWqxAD6Ih20/5mqQZaUqoDcoyVxqA2xTGiK4Im6k8IwynX6VHSVzpB1A+KenyYTPscI2WF1wkHmNub8vOe60IPfnXyUoLRtS9pR/nOc7JNClnQLWa0L6CZXKNypOFNSex6kE0sq2InQ+B7npY8ROBftp0jG/5dr6bUQx4lFxLs5eOTOQMdwYIMqFbSDB2USQeod9WCmWIOJ4PtJcncrW9JN5u6n5RPGRqry2Y82Vpi2KrR5aDBjuSLOhIrftcwhRyDdvrXvGWH6T4wazSLZTia8oU9inMyObsGXA1+aTrnvz86XcJv2TBBe0UACe9W5NWvwMI8NiVqJ8u3o8EyJl5e6hOQBCCgvw=
X-Forefront-Antispam-Report: CIP:216.228.117.160;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge1.nvidia.com;CAT:NONE;SFS:(13230040)(1800799024)(82310400026)(376014)(7416014)(36860700016)(11063799006)(22082099003)(56012099003)(18002099003)(4143699003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: dDe1/e9b1O0bmudet1P1Bs1Exjw1hcckS+WebgUeqfzS1rl5lJ4fWzhAZDqt9jdpeyBTvTnSKutC30basAjH63q/B2XNyOmTrTDxYig9iZc1V+zq8wwuD84r1dmzK57dtNw3jVA7IdLwFAHbwbZWjhFiwO3hdtBjFOc7tZAdDavINn5+uTgFwxare5YGAGVsXG7gQrCtYIt8NmHv1jA8c1hLSocdzboWyLjl5raz/cxjagCdBFOnmGFS4DmWVoZbrz6lHE36/1gCrsDaakjO8ln9rym9m27XJgtJYehSQJomHEQ/tSJnlrnVId0XeRquXD2EXqinsq27U45ThEglM69GzJ0GMFdXnhWVHUOa5RTxndt8CrZWcu++fgPpqhkolswFdRJMvrWz7+mWVbyjtdHfVFyf6GtyookPwVphQZZhPSqiQOGVPCQaxQeHduYv
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 May 2026 20:13:39.7411
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 0b2a8a63-bba6-4a76-20e6-08deb5e31e06
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.160];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: CH3PEPF00000010.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PPF12042BF6F
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260519_131350_696507_CA04B15C 
X-CRM114-Status: GOOD (  15.49  )
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

On Tue, May 19, 2026 at 02:44:53PM -0300, Jason Gunthorpe wrote:
> On Sun, May 10, 2026 at 02:23:02PM -0700, Nicolin Chen wrote:
> > @@ -2364,6 +2364,14 @@ static irqreturn_t arm_smmu_evtq_thread(int irq, void *dev)
> >  	static DEFINE_RATELIMIT_STATE(rs, DEFAULT_RATELIMIT_INTERVAL,
> >  				      DEFAULT_RATELIMIT_BURST);
> >  
> > +	/*
> > +	 * A combined IRQ might call into this function with the queue disabled.
> > +	 * E.g. kdump, where stale HW PROD vs SW CONS would drive a bogus drain
> > +	 * and a CONS write to a disabled queue.
> > +	 */
> > +	if (!(readl_relaxed(smmu->base + ARM_SMMU_CR0) & CR0_EVTQEN))
> > +		return IRQ_NONE;
> 
> I don't think we should be doing register reads on these paths. 
> 
> Why not load a different irq function instead?

Yea. Perhaps we could even entirely skip their IRQ requests. Only
gerror should be kept in kdump case.

Thanks
Nicolin

