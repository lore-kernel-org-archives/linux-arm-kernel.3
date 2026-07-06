Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 81A99C43602
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  6 Jul 2026 17:47:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:CC:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=YXmCqTfpDxfe3YGphYbJKygjvZnKhOwXRJcNyJ1ebcs=; b=mYkGDYqaZM8Cp2A/04HLJvvgsE
	CFFH5PvEi7t1Wqne0HMgBIKiyySI1Axg85/5YCNEJ7h8sqLsq9vvGVGqrqwqFjLVPMp36w1gMginz
	a+zUHSPME8fHflem2Ia88R4UH7hfpS4M7sNB4SlKcoGBdj/UyigfkRbfdP0TUNZfogQHaHThKh+1z
	KDBopPkTKy+SEgZ3kWHZynbHEKpqLtiVKx3BV6wkuLfpsNTJBb0uiPYtnia2u11f+frhX6gIdzM3T
	OA5B4h1LO2+Z2xKfOOoPiPA/A2PNu/y9gXZ3x92nASO+3oXveoRQ243AZ2zoMbuT2GzwlNhBWqq23
	JA+DJlxg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wgnPh-0000000DErr-1nKx;
	Mon, 06 Jul 2026 17:47:25 +0000
Received: from mail-westusazlp170100005.outbound.protection.outlook.com ([2a01:111:f403:c001::5] helo=BYAPR05CU005.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wgnPd-0000000DEr7-21V8
	for linux-arm-kernel@lists.infradead.org;
	Mon, 06 Jul 2026 17:47:24 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=HS0f9IR3PchGBICY9qoVBbZQ4tlFFlN/LK25xUC+bg0nPNxQefVqQmvuS48NXgo2s9ltHGhZmRZtVNgL79pj8QZAsi4G3bnEGmxH/9SNBn8TfkX92Ky5La9igLrlrCmWPUalqmZ2jJf8NDSKPTEFZVnLxanMuManT0xDHQzGZ1LuLA4z2Xo2XMgX9f9QHbfn91+tTDrM1/ZyFkBeNXftrpaHEwIiZ4wLVFU8/3/Sx4jlxYI2H0jX1KVqiLxkJ9Hcm7vM5qi5BN47jVMfQIUFj21fj335DefY/gJiPfMBYVupxYmk1Ln3Cwf/l64ejTTm8ExV4za6kZN7gFzAGRBoQQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=YXmCqTfpDxfe3YGphYbJKygjvZnKhOwXRJcNyJ1ebcs=;
 b=TIgE33Rmiim/Te41JRnL8nwg2S076Ddk5o1qMkPK6saHzj8aeiBGaG4SJM5iv7jrk3nABiD+RoBud1LXg2sheH3BreVtnj3JPlqLaqWDZSq8kCy6gNVR4c1XqKLWnmGBVtGOwCHlxbXIVoPBMw/ny+GX63ebzmybFFmg1+pMkYbOhJSb3/yED30u6POp8pA2vWGeDE5kq6pJchsGmkyHIVnp3fbLYVltO778TM2CkClqSpxV7rYFDKYKw6zPk1yGAH63nbgN5oev/xU0tv160+49KuO+Ug2DWyJCYeLvfQDkjoPYfOsXQLgMRLZ8Tuno1D9TLEPEEDRNnMqmW2Rxig==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.160) smtp.rcpttodomain=kernel.org smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=YXmCqTfpDxfe3YGphYbJKygjvZnKhOwXRJcNyJ1ebcs=;
 b=sY1Qd8okhGYy9pyW5IorLE2nslkZ6mrp4WNwD1WxufnvYQUeowb0q9MQsVfTpHX6l2xVT8KP675inmEZDcENoUU+io/x3s3v3Tvv0zTGkMUJLSFLthWbo7sNwQJagWIeb7JDb+Rgp/fN0Pv6JCrpaxmW4hm7thseSHjkSmSBTRNA5ayv+hVMuv7iKXLcMYFAxhUMJnRXlZgCyrOseF+5yWHkQ4KBcVZWVCLyTyEiO+3XjDmudiSoD/dDSp0kPy/S/8Ws9ljwHK3lpoTo0EM3qe+q97bXqDS86KR8o/amSo9EW5o4enYI69KxrPlMGyFOMo1NbNQR0T8i3pl3ZVDa3A==
Received: from BLAPR05CA0045.namprd05.prod.outlook.com (2603:10b6:208:335::25)
 by DSVPR12MB999191.namprd12.prod.outlook.com (2603:10b6:8:496::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.159.18; Mon, 6 Jul
 2026 17:47:12 +0000
Received: from BL02EPF0001A104.namprd05.prod.outlook.com
 (2603:10b6:208:335:cafe::3d) by BLAPR05CA0045.outlook.office365.com
 (2603:10b6:208:335::25) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.202.9 via Frontend Transport; Mon, 6
 Jul 2026 17:47:12 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.160)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.160 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.160; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.160) by
 BL02EPF0001A104.mail.protection.outlook.com (10.167.241.135) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.181.6 via Frontend Transport; Mon, 6 Jul 2026 17:47:11 +0000
Received: from rnnvmail202.nvidia.com (10.129.68.7) by mail.nvidia.com
 (10.129.200.66) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Mon, 6 Jul
 2026 10:46:42 -0700
Received: from rnnvmail202.nvidia.com (10.129.68.7) by rnnvmail202.nvidia.com
 (10.129.68.7) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Mon, 6 Jul
 2026 10:46:41 -0700
Received: from Asurada-Nvidia (10.127.8.10) by mail.nvidia.com (10.129.68.7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Mon, 6 Jul 2026 10:46:41 -0700
Date: Mon, 6 Jul 2026 10:46:39 -0700
From: Nicolin Chen <nicolinc@nvidia.com>
To: Jason Gunthorpe <jgg@nvidia.com>
CC: Will Deacon <will@kernel.org>, Kevin Tian <kevin.tian@intel.com>, Lu Baolu
	<baolu.lu@linux.intel.com>, Robin Murphy <robin.murphy@arm.com>,
	<joro@8bytes.org>, David Woodhouse <dwmw2@infradead.org>,
	<linux-arm-kernel@lists.infradead.org>, <iommu@lists.linux.dev>,
	<linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v1 1/5] iommu/arm-smmu-v3-iommufd: Reject unsupported
 bits in invalidation commands
Message-ID: <akvp/5ogTOOrOFYN@Asurada-Nvidia>
References: <cover.1782767398.git.nicolinc@nvidia.com>
 <eb89a1c564956d9a2ba1d56bd76d57defac205aa.1782767398.git.nicolinc@nvidia.com>
 <20260706171632.GA118313@nvidia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20260706171632.GA118313@nvidia.com>
X-NV-OnPremToCloud: ExternallySecured
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL02EPF0001A104:EE_|DSVPR12MB999191:EE_
X-MS-Office365-Filtering-Correlation-Id: 60003c35-6d9c-4cae-81c9-08dedb869b6e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|82310400026|23010399003|36860700016|22082099003|18002099003|56012099006|11063799006|4143699003;
X-Microsoft-Antispam-Message-Info: meju0fobQJ1H6ugmDZs+2C0/rvt/kH0mCraE9byvK1E4TXMtk+nEnwHMLx4Grpu9gTTm7Ly49rnpA7sDWKJhqirH4DZt4znnD8USmzHc2885qGyJuTXBnrKjHP27OoVf4SxSaYML+M0Sgq2CpKxFyhVq6DbSqoVY0CLFg5+S6w6+VFhe9ywsGSXq63uufQwGGVjm+oW8MRfUDxpcwP/51EJvLMC7ScghqGQJ5DMPjc95xsmeYHbPlhxUCRaSo8p4Gqlo15F9HnZxGRkZP+yhxJAMB3IfG2VCFqJzI6WvgyBjFe9aMU7m+MPYHjXFJ8tvalpQwk2wzq2p+LOuUXZoXl0Ffo2cGU1FyYMT0p35RTQkE4ZZtXP4U1c8ux7BqEVKHgnJixN1AlDNysRAgPS0VJyJGWz33YsAjaB6BbegBKd+tSJFkuhSZ17R/QnxMBO8+80YMKAyQxj2edt99p+Z7IFX+HM3FBpcTyJKRSDBx28a3ADJBRwZH4nYNFql2YyJRbZfURgulY8aPvPqqDGO7sl1ylmVYCBJaXxZ0gNYhAkWAWdcAf+h4zgs4FEvNWOH3sXXt6bZabQGHG4Z2Flq0l5OPExaZif1Ka59kn8FOKkO8Vzf/dOH8xWbxyiFYJ0BfonSyT5B6NWEsO6U/2e24oRNtyY0RLpHSVBRzOyL+toElDaoG2cGeb139eHOU68xx/kQxYWbn8NtoxfyxqiFrA==
X-Forefront-Antispam-Report: CIP:216.228.117.160;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge1.nvidia.com;CAT:NONE;SFS:(13230040)(1800799024)(376014)(82310400026)(23010399003)(36860700016)(22082099003)(18002099003)(56012099006)(11063799006)(4143699003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: V5f1MWAzhkgmn+LCQbhT3FQnU11bvjRJxrXipQptOjPcc9a3RGh8GgyGgwjKKfZuIN4mP9I5EocvoLS+knIbB21IT6IdjWIXMzJiko0dElwVTchlp2iwDKsXC/XSdiDC1V5ISWemj0AMSqo9p/EJJk5A8mfiq4VnPjaIxCwLSHGH7cj02QLXFWcxrnZvPvRy3/cCVMvnAJYO1FoZBHks9aAjLi7YWqM+SRyn524t2nw2HIjVXizGlNsdnUixENqkw9K2mVVtOf5YTHLTCJ28kXJUCMcUM1rw6Yd29fJayP7fUi2KIezee7jN2zR+SAg4Mp/MY9XtK6RxIlEEYf/AVkKhCxMDV/7tK9AyfPaKB3ehQKS786blmwviNf3bo7387XLOqEf1O280XEUjhF2JZUN4FDr2VXYoCcsbh/ozjympWZY1nIlXryknCD0H5qBx
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Jul 2026 17:47:11.1032
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 60003c35-6d9c-4cae-81c9-08dedb869b6e
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.160];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: BL02EPF0001A104.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DSVPR12MB999191
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260706_104721_524591_D473E29B 
X-CRM114-Status: GOOD (  11.98  )
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

On Mon, Jul 06, 2026 at 02:16:32PM -0300, Jason Gunthorpe wrote:
> On Mon, Jun 29, 2026 at 02:15:36PM -0700, Nicolin Chen wrote:
> > +	case CMDQ_OP_TLBI_NH_VAA:
> > +		allowed[0] |= CMDQ_TLBI_0_VMID;
> > +		allowed[1] |= CMDQ_TLBI_1_LEAF | CMDQ_TLBI_1_TTL |
> > +			      CMDQ_TLBI_1_VA_MASK;
> > +		/* NUM/SCALE/TG are range fields gated on FEAT_RANGE_INV */
> > +		if (vsmmu->smmu->features & ARM_SMMU_FEAT_RANGE_INV) {
> > +			allowed[0] |= CMDQ_TLBI_0_NUM | CMDQ_TLBI_0_SCALE;
> > +			allowed[1] |= CMDQ_TLBI_1_TG;
> > +		}
> 
> There are a couple of additional conditions on tg and num in the spec
> under RIL which are reserved and illegal, I guess those should be
> checked too if we want to block any illegal command

Yea. I have those covered in v2.

Thanks
Nicolin

