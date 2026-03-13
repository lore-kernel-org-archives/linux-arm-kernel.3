Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 247D2107BCE2
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 13 Mar 2026 21:04:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:CC:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=PKwDZaTDo06owffy8igLydKb2h1BiI7iUKQZP6VZBDY=; b=otUkSJ/59wZBxvYkN94EmsE9AF
	NZuXj0fiYxIroJ9YKEJhtogo2vF2doAmzra1sU0MjSl9UGWM7JXyMecj+9siZH//+/XfwZV2Tkqwe
	f2d9uRJAJFumDJtvrh0J+9Q+seqFLiX0ogwfcn/a1SWv4xQ9fQDozWpR/mlFuJdD8ZCBUho4I/G9H
	JwNbCzOk5mK6AOPRTY4aerwKDmJuVEbbJamw/MOYcfo57GtTamIHXDWz+yojQXjC6Yr3KjuwHfq6s
	GCLaCDXmHsmIE2mVn2Chfp9kqFVPKBBpDuY14IS9iMH1jPmjSJbTIqtGLNuU67FqWYHqOYepnvzZJ
	tkpKeuVg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w19gZ-00000001CMB-30mE;
	Fri, 13 Mar 2026 21:04:43 +0000
Received: from mail-eastus2azon11010070.outbound.protection.outlook.com ([52.101.56.70] helo=BN1PR04CU002.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w19gX-00000001CLH-0GT9
	for linux-arm-kernel@lists.infradead.org;
	Fri, 13 Mar 2026 21:04:42 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=SaZO7jRnOTaXvgyq52QbZ5HMG4KsqmmHjjCN4V/wwE71Jnl2cWjvzDsY/aJ833Vwg7fI+m3HZ52Cb6icg5C6L1OUEWZYEsOBgxiupsVBQ2kaAs2dhalI/pxfjEocSGI90bBZ2NtHRH5b21Ubzv6u9mrpkcPtueXvwg/7hnPc9Ib0/iYSx8zHxpGSkEE0Hdiv+k+tx7QjkoHh9zXgZTijjTaCWujBq7JnT34C8CqH+V5KyywwBIkJ6f+RxZ2svFM9DefB9/IbLeCBklgvuXX0i25duR8gVgwgMLZtw/z4jfspHzaBsyj1Q5VWK0mhtjLlc3i8KwZ1XEaVi0dLrMTWFA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=PKwDZaTDo06owffy8igLydKb2h1BiI7iUKQZP6VZBDY=;
 b=oqynfgg9zfO6nemrpqK0J+pVZIZq0P//rF3eKWSTwTlMF+KyI61+1O7zBNl7X5xk8TLbIKFzNa6R2xx9pH6DHD87MMSDwu8CxMqqNzY11d2/GIJw0Bi4fcidaV3VeGvGTlkkPdSNwfk+cF0+UKRXkBLURLL58eaVF2mTFwlcmBuDR3KCv1xYIXhXa1XS3tbhS5Mqi9NnL/hSj7ZiseD0YnWthH7wI27hBE8iRgFjEHms+2BfhhgOMa4hd1uS5Aq+VkItKytZCnRYOjZ6OBspqxsXfmM7E5fB5/BVT658Fj+g8ULezs98dYBNTJNyyLs4h38r9yhWHTEUo49HWbvDxg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.118.233) smtp.rcpttodomain=huawei.com smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=PKwDZaTDo06owffy8igLydKb2h1BiI7iUKQZP6VZBDY=;
 b=KbS46Kxhleqlou1PASV11doaOLD69+5JZhzdalwg30YbvkqVlmj1vhSsD9+trBl0YCzN/NPEGVI4rptbKgwQVpdKAx09OWeXttfjjwYSX6k25dRUL8o8ETKQKvutnPQ9XZ51VuGgbhx4xOdjCNyNFUDtNlW1Cxit0FPexhsu3+e5zBsOFS67rIlWrXW6UxFV9L8/tUEWRYCLYSg585xEbEhIwOavm+QTojRI/WkA3wz0MocOFCLoIen1I1CUTWF/1GXUPYJ1i8MU748NpkAmRpg6CIL2R/zEmXoPSXwTqZOEBFTyd4+md2NcImnEYkGaKhJeEGWoKuqXXMYvGwq4wg==
Received: from MW4PR04CA0228.namprd04.prod.outlook.com (2603:10b6:303:87::23)
 by CH2PR12MB4230.namprd12.prod.outlook.com (2603:10b6:610:aa::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9723.8; Fri, 13 Mar
 2026 21:04:33 +0000
Received: from MWH0EPF000C6194.namprd02.prod.outlook.com
 (2603:10b6:303:87:cafe::12) by MW4PR04CA0228.outlook.office365.com
 (2603:10b6:303:87::23) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9678.29 via Frontend Transport; Fri,
 13 Mar 2026 21:04:32 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.118.233)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.118.233 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.118.233; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.118.233) by
 MWH0EPF000C6194.mail.protection.outlook.com (10.167.249.104) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9700.17 via Frontend Transport; Fri, 13 Mar 2026 21:04:31 +0000
Received: from drhqmail202.nvidia.com (10.126.190.181) by mail.nvidia.com
 (10.127.129.6) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Fri, 13 Mar
 2026 14:04:12 -0700
Received: from drhqmail201.nvidia.com (10.126.190.180) by
 drhqmail202.nvidia.com (10.126.190.181) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.20; Fri, 13 Mar 2026 14:04:11 -0700
Received: from Asurada-Nvidia (10.127.8.14) by mail.nvidia.com
 (10.126.190.180) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Fri, 13 Mar 2026 14:04:11 -0700
Date: Fri, 13 Mar 2026 14:04:10 -0700
From: Nicolin Chen <nicolinc@nvidia.com>
To: Qinxin Xia <xiaqinxin@huawei.com>
CC: <will@kernel.org>, <robin.murphy@arm.com>, <jpb@kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <iommu@lists.linux.dev>,
	<wangzhou1@hisilicon.com>, <prime.zeng@hisilicon.com>,
	<fanghao11@huawei.com>, <jonathan.cameron@huawei.com>, <linuxarm@huawei.com>
Subject: Re: [RFC PATCH 5/5] iommu/arm-smmu-v3: Add Context Descriptor
 display to debugfs
Message-ID: <abR7ys1LYRhJ8Hn6@Asurada-Nvidia>
References: <20260313104351.3502293-1-xiaqinxin@huawei.com>
 <20260313104351.3502293-6-xiaqinxin@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260313104351.3502293-6-xiaqinxin@huawei.com>
X-NV-OnPremToCloud: ExternallySecured
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MWH0EPF000C6194:EE_|CH2PR12MB4230:EE_
X-MS-Office365-Filtering-Correlation-Id: 8261023b-c7a0-44b1-a5ae-08de81441f75
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|82310400026|36860700016|376014|7416014|18002099003|56012099003|22082099003;
X-Microsoft-Antispam-Message-Info: sWKp3/B4GszCH0GERBqr+rXeX62zZYXOromZlgziI1G2i7Ec2/hvR7VampJdBEECLFaQCdCNXFoaZzp4053yX6pKDCcPtI26yrfaS3bMqeUb4M9+LA6EyDjkq/T5LxZvPcJP4VyYmwBzhNsFT7L+luEhlORuOmRRTR3cQx0TX7CpnfXpezPU9qguQZg6+FM3uErN4vc2yNw5c24frdQ/wme6e80ECAAoBLyzR+t/nWlG0sxX+XzWBzAxReBhkKuueZMZR2pPZSxAKDSCyaXKmJpxfB9+JVaHRAUg+jqxrLkKBatF3rstXu7MeRkrEejlXC7yiggfHjEb/zS9u0POQIabrsAyY2IZAeFn35AjEBkg4pd3iJjfJ4PbZEIyUm4tGBnwjVjZs12syAI09Ix4tJ0FrJQL3hHZ34Tkfpe1HmdlCGr4tHgfzh+w44TFpCtStgKjkxJjH1MNb4BjEKJ7bkw1i8raf+kSf4kyqDEMj9GnTmzj/jF1Ss5hBdB/MuU9ho8RVRYU1q1/ei/rmghTB5pxzMNTh0LU6nW8+IXXmahmUhtyj4+gZVwpkUCXrxMA/mM8ujkeYppRQ2uNdzu05Upb11iVGOBRMNe0pvpQX9Mu+E98T2XFmOyyLW2BKz/A6cdHcXFgPe4HPpy81RzNIqvnmN4CvGX501XG3q7CEUlJIKV4wzf0ybp6kMSSoJZYOWix+ple5QzhoJLqqwqmo6W4R4uMeq9QBoaecClcL9/zcNyuYvx0H+MKsjoXl6lr5sJ3I4jo7wtbg1h2RaKEOw==
X-Forefront-Antispam-Report: CIP:216.228.118.233;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc7edge2.nvidia.com;CAT:NONE;SFS:(13230040)(1800799024)(82310400026)(36860700016)(376014)(7416014)(18002099003)(56012099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: Yde8qgit3JOIY3KnRxW/tkAKeBU3GnRBZkfvChgtdr8ACZY/pzGezF893XjpjULJ/dTMphMn5SlFhvkM4Q3Ym0jnCaEx8VwOc/N9TJ3GxVBcAopAitP0eTVeES1x2EAP3ivnTucj1M9TwR6wnAFMXPPvti1WLXKAApIlIZXC/YeohT1gwnmYLFwXjwO17xexBiLoCLTknehNy0hzu59DKU0YcQvVZs2YF+RndogzmR62jLimAdyU1v+OppKN9QxdeqvoXB8pXhqGxOb2+dAMw5bq8Ve965xTL0VAqaUUFVU5VQLvhf+Nh3f/l6ZPcIQy2P02Q1h9qddeti3s8AQTbspB4WopAvMMfK/nW8uZsHRX5bPgB1aTOSOW8txpI06NQhaqSLxSM0nGYokE5swsgr7sLJ3r+gs9/aA3RY1rSBTBuvkgzqmbfD4/BHNectE9
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Mar 2026 21:04:31.6945
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 8261023b-c7a0-44b1-a5ae-08de81441f75
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.118.233];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: MWH0EPF000C6194.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH2PR12MB4230
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260313_140441_106445_5C4CDD29 
X-CRM114-Status: GOOD (  15.85  )
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

On Fri, Mar 13, 2026 at 06:43:51PM +0800, Qinxin Xia wrote:
>   * Directory Structure:
>   * /sys/kernel/debug/iommu/arm_smmu_v3/
>   * └── smmu0/
> @@ -35,6 +42,8 @@
>   *     └── stream_table
>   *	   └── 0000:01:00.0:0/                    # PCI device with Stream ID 0
>   *             ├── ste                           # Stream Table Entry
> + *             └── context_descriptors/
> + *                 └── all                       # All Context Descriptors

I wonder if we should do per-RID/PASID v.s. all. Otherwise, cd_dir
seems unnecessary, as it could be a file instead?

> +/**
> + * smmu_debug_dump_cd() - Dump Context Descriptor details to seq_file
> + * @seq: seq_file to write to
> + * @dev: device associated with the CD
> + * @ssid: Substream ID
> + */
> +static void smmu_debug_dump_cd(struct seq_file *seq, struct device *dev, u32 ssid)
> +{
> +	struct arm_smmu_master *master = dev_iommu_priv_get(dev);
> +	struct arm_smmu_cd *cd;
> +	u64 data;
> +	int i;
> +
> +	if (!master) {
> +		seq_puts(seq, "No master data\n");
> +		return;
> +	}
> +
> +	cd = arm_smmu_get_cd_ptr(master, ssid);
> +	if (!cd) {
> +		seq_printf(seq, "CD not available for SSID %u\n", ssid);
> +		return;
> +	}

master->cd_table can be free-ed. We could hit UAF in a race. This
very likely needs arm_smmu_asid_lock.

> +	seq_printf(seq, "CD for Substream ID %u:\n", ssid);
> +
> +	/* CD 0 */
> +	data = le64_to_cpu(cd->data[0]);
> +	seq_printf(seq, "  Valid: %s\n", data & CTXDESC_CD_0_V ? "Yes" : "No");
> +	seq_printf(seq, "  T0SZ: 0x%llx\n", data & CTXDESC_CD_0_TCR_T0SZ);
> +	seq_printf(seq, "  EPD0: %s\n", data & CTXDESC_CD_0_TCR_EPD0 ? "Yes" : "No");
> +	seq_printf(seq, "  EPD1: %s\n", data & CTXDESC_CD_0_TCR_EPD1 ? "Yes" : "No");

All these are unnecessary if V=0? Maybe the per-SSID output should
depend on V=1 at all. Same might apply to STE.

> +/* All CDs debugfs file operations */
> +static int smmu_debugfs_all_cds_show(struct seq_file *seq, void *v)
> +{
> +	struct device *dev = seq->private;
> +
> +	smmu_debug_dump_all_cds(seq, dev);
> +	return 0;

Just unwrap the smmu_debug_dump_all_cds().

Nicolin

