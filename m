Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2DCB7C79F9E
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  7 Sep 2026 04:08:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:CC:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=FixH4jhD47mlarX0tpsnXZp0i9GU1+Q4lsG4bzF6aNY=; b=QMAHIWulz9nuD0dhlK68fRgzD+
	eohXeedd57P6kNiXAnnvWwkBxghlMTqf/a6hAbO5A5SOps4lzZ2jXHxLJkN1fw94BC756SqudVc4Y
	Gi+i9wF733joXsp3AeF1EFcynoKPPC1H3+OD3i206zNmzpd3zQkw4SJOr6Db0nxI9GRcUe86XGIwG
	iAcKy4iY9tpmk0YdJ5YqN2Z6BGIvlHAK4flXwkNZ8xH0EhakVuBp/T2HS614BxBCD2bKm1tzf9SC6
	bU9x9pO7BMxoRrt5xe1faZBCx242FT0x1GCxQoJNOzldCjPqyzzbEpA1LZsiWtlKe1erzY6hlEu8Q
	LZo1YvmA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x3QeL-00000005pub-0oH6;
	Mon, 07 Sep 2026 04:08:05 +0000
Received: from mail-westus2azon11012064.outbound.protection.outlook.com ([52.101.48.64] helo=MW6PR02CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x3QeG-00000005puF-1YB1
	for linux-arm-kernel@lists.infradead.org;
	Mon, 07 Sep 2026 04:08:02 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=jl0MvVl+irIreBIb9BOauP+jAozNh6dNapqiIzIjVRAQtamkVikmvm2iHZXr8kuu/IZlrz3eiWWDqx/v4bWsLsauX8OloZm8j80uf3Ib89Y9PKcgYAYeuKdd3dA0KeHyLUBPMWSxxgpXqSzoVP+XMXPzIiVV3ksijs4liTkR0wK6zwvgDqOv7c8iskeQ1ga1sxjti6UdO7iroEzmhYzDnHCjR9nOyvWzGaBzZV8VLkG7KHRVV/5066+t8sSVJnhKtirrU8+GDQESkxpE03rGTUiVo6M+ed3WldFvC/SOOqIp4v6SS4BI+gF5lQkH7FNcBVfs/fJRo/zQHDHBSMwmwA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=FixH4jhD47mlarX0tpsnXZp0i9GU1+Q4lsG4bzF6aNY=;
 b=mEaO3Ro/W9qaD/IKMfHn1LHoeGjEhplsWZTYJvPIAL/rt6itXL4VL035UH9/XTCUGcySLDYw93dHoC867n373PWNQF6BpO+OUSY7zhlsBYmQS9B1b4aFj+PNWfzv4bAvbAiI/0cEEUaVzvzNwBaRSDqWxBlaXU6S/ecYG+uqfzDxo+3tT51xrLKjTrhQ6MTmdobS2aBCgt20wqWa9qfXpZ2diP0w/Nwoz2bY5TpM/n3Cr1YGYuvIA2gPZSjawHYlrsN83YgvfoV3o7AzebZ4+59N8cUO3aljZALhTmKAEZKKJHvhlb5Pcm2aaP+auI8PpEGcpU+jLQmtiUfGREWJ9w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.118.233) smtp.rcpttodomain=kernel.org smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=FixH4jhD47mlarX0tpsnXZp0i9GU1+Q4lsG4bzF6aNY=;
 b=Ir+NyU+P+F4gIZeT8IQYHVk6GS6kR7/pN0zrGyj0N7z0fPANhzNrGQYqyzx7r+6vogIVbc6u/kD/nTBq0UHekT1NANhDz48iNnJ3r0ZEbe+iZY09oC11a/eDkZOQrGRi+ME2v9o7r7/NNHWdXl/DlHQGFjAAEKUmIUv2RP7J/RGekWp32SiYvB37CKDfWeLGuAf5Pv9YIS/cWrB+FAjM2WrNRadBIctoL6YPcCNbR/VRATiHWR+ehHXW6/eGRBtqtN6bxCb+jvAl0boop2rk9IY8YVBhO/b2q/QSx0h/n8dq1MVLoCTbEQ4I+d0KA/x5rBdLEs+1honnJXlqrXXKQg==
Received: from SJ2P221CA0004.NAMP221.PROD.OUTLOOK.COM (2603:10b6:a03:5db::14)
 by DS4PR12MB9611.namprd12.prod.outlook.com (2603:10b6:8:277::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.382.15; Mon, 7 Sep
 2026 04:07:53 +0000
Received: from SJ1PEPF0000231A.namprd03.prod.outlook.com
 (2603:10b6:a03:5db:cafe::55) by SJ2P221CA0004.outlook.office365.com
 (2603:10b6:a03:5db::14) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.382.15 via Frontend Transport; Mon, 7
 Sep 2026 04:07:53 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.118.233)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.118.233 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.118.233; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.118.233) by
 SJ1PEPF0000231A.mail.protection.outlook.com (10.167.242.231) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.406.5 via Frontend Transport; Mon, 7 Sep 2026 04:07:53 +0000
Received: from drhqmail202.nvidia.com (10.126.190.181) by mail.nvidia.com
 (10.127.129.6) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.46; Sun, 6 Sep
 2026 21:07:41 -0700
Received: from drhqmail203.nvidia.com (10.126.190.182) by
 drhqmail202.nvidia.com (10.126.190.181) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Sun, 6 Sep 2026 21:07:41 -0700
Received: from nvidia.com (10.127.8.11) by mail.nvidia.com (10.126.190.182)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.46 via Frontend
 Transport; Sun, 6 Sep 2026 21:07:38 -0700
Date: Sun, 6 Sep 2026 21:07:35 -0700
From: Nicolin Chen <nicolinc@nvidia.com>
To: "Kiryl Shutsemau (Meta)" <kas@kernel.org>
CC: Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>, "Joerg
 Roedel" <joro@8bytes.org>, Jason Gunthorpe <jgg@nvidia.com>, "Pranjal
 Shrivastava" <praan@google.com>, Mostafa Saleh <smostafa@google.com>,
	"Thierry Reding" <thierry.reding@kernel.org>, Krishna Reddy
	<vdumpa@nvidia.com>, Jonathan Hunter <jonathanh@nvidia.com>, Breno Leitao
	<leitao@debian.org>, Kyle McMartin <jkkm@meta.com>, Usama Arif
	<usama.arif@linux.dev>, <kernel-team@meta.com>,
	<linux-arm-kernel@lists.infradead.org>, <iommu@lists.linux.dev>,
	<linux-tegra@vger.kernel.org>, <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v4 1/2] iommu/arm-smmu-v3: Add a cmdq_entries module
 parameter
Message-ID: <ap44h0CSuwm173NO@nvidia.com>
References: <20260902121724.3494954-1-kas@kernel.org>
 <20260902121724.3494954-2-kas@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20260902121724.3494954-2-kas@kernel.org>
X-NV-OnPremToCloud: ExternallySecured
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ1PEPF0000231A:EE_|DS4PR12MB9611:EE_
X-MS-Office365-Filtering-Correlation-Id: b42698db-8e8f-4cc2-b686-08df0c959731
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|23010399003|82310400026|36860700016|7416014|1800799024|376014|10067099003|3023799007|22082099003|18002099003|56012099006|11063799006|4143699003;
X-Microsoft-Antispam-Message-Info: mFU7wjGgzRI1cnffVcG9qpsHGFACrYWu8+rijlj4YQQ4LbO8t5TwN8NyHqtNT6GTd8/WaTFV5dwuAiiYHURoPObrxurXeHa28jC9aquaF5yeEzFkPYjPp8DlkB0SdYD68g/8CkLbNTDF5gLA8c+Z72qXePObqz5S2mfHF7cXpwuseq4C+SjxWKQBQd8bARDCpbK2FzqQbttQ3jIS5IqeXthX6pTxGq0tPU9r/oZ7tgY3cgD5EvbC2fEfN8Qw2o+WGl5/FUw+EMMvkL1UGnJgohpdUdOoInOYfjNCy1BGI5OVMsqYGNHCIU6523Ou8sgYn3Sc8eJ+B4Y5RtqZ3R090pHvE/Crx3KsEwVm3B52qf1DnCatzBy0/3FS/BuZcGXCJfQqXLHr/IMPaHXwTVIfS6SZDA0EhpaeG7d+QqRAtaTDqEQCj2wK3oPN17ZUavWobZ7pzIA7Hs0mX2AQGO8kHZrBZnry37QFN2Zf1RvMw/f2ns+MMfbNwXmUPZr9npCYfwyDjg/GlUTEVLmlu0f/Ekbzirxjfyc53k3EpByQTcZklx+WRGpmOhffyLoQOzOwTIhMtHXyWpBbjA2ws4F8CykUL6RBg9vyRLZ65rD4PSIM7EhsJAJd5oz04lfzVk1znKHT4OauLUZE1ItjdfMgC93RSB/5CZayUalC7DTBuObziZoix34gc8J/drayhAYqSqupf6cA7/qfpo4jAROJOQ==
X-Forefront-Antispam-Report: CIP:216.228.118.233;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc7edge2.nvidia.com;CAT:NONE;SFS:(13230040)(23010399003)(82310400026)(36860700016)(7416014)(1800799024)(376014)(10067099003)(3023799007)(22082099003)(18002099003)(56012099006)(11063799006)(4143699003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: eOyYzVghoExKprLyE19S+5xwN5IP4cl6z0+YaHCoNCZFz5GH+VNR8dbJ9gyDroN/HlySKXOjulycXQdWEuKCsYEDXPqdhRUFt+2Cg1GePktU+AAsUr0fU3BHO149jnH0754CHfU7NjzuUMjyh0THUW5SV3jwY+GCCc8EiRY0H+BmzNsCiPS2qVB2+xYibGakKWXhIfdaJsT2KqLzNUZlbBIjxxSs2Hz5PAo+1SHmhlFKmJ+F8luC689PR4x1qC1LGBEkj9eUdr5OwZok8ItRLUGQ7QrAAHtEkIVA9i5zN/T0g/zG0ZHf++zQiJeM+l8Vy7R9KBeFgx1irvh23z1UYF6odDFOJfC0DcUtbP+zGu/Y4NOVsgLPxAwdymVOmEkYhDP3WXKszwgDlsv5riM57Y+7R/wMsiJzIia3VQYKTfjtDsxbxFzmwBXKU19E/Z0k
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Sep 2026 04:07:53.5565
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: b42698db-8e8f-4cc2-b686-08df0c959731
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.118.233];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: SJ1PEPF0000231A.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS4PR12MB9611
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260906_210800_434723_303BF83A 
X-CRM114-Status: GOOD (  18.46  )
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

Hi,

I think there can be some small cosmetic changes. I gave it a try, and
it looks overall cleaner to me. Hope you would agree.

On Wed, Sep 02, 2026 at 01:17:23PM +0100, Kiryl Shutsemau (Meta) wrote:
> +/**
> + * arm_smmu_queue_max_n_shift() - pick the log2 depth of a queue
> + * @hw_shift: log2 depth the hardware allows, capped for natural alignment

We can drop "capped for natural alignment" -- evtq/priq don't cap.

> + * @ent_sz_shift: log2 of the queue entry size in bytes
> + * @want: number of entries asked for, or zero to use @hw_shift

Instead, rename to:

@ceiling: default max_n_shift ceiling of the queue
@ent_sz_shift: log2 of the queue entry size in bytes
@new_ceiling: new ceiling to override; use the default if 0

> + * @want is rounded down to a power of two. It never sizes a queue below one
> + * page, because coherent DMA is page granular: a shallower queue occupies the
> + * same memory as one that fills the page, and arm_smmu_init_one_queue() stops
> + * shrinking at a page too.
> + */
> +static u32 arm_smmu_queue_max_n_shift(u32 hw_shift, u32 ent_sz_shift, u32 want)
> +{
> +	u32 page_shift = PAGE_SHIFT - ent_sz_shift;

And let's call it "floor". It fits the comments and commit message.

> +
> +	if (!want)
> +		return hw_shift;
> +
> +	return min(hw_shift, max(ilog2(want), page_shift));
> +}
> +
> +/*
> + * Command queues are also allocated by the Tegra241 CMDQV for its VCMDQs, which
> + * need the same depth decision.
> + */
> +u32 arm_smmu_cmdq_max_n_shift(u32 hw_shift)
> +{
> +	return arm_smmu_queue_max_n_shift(hw_shift, CMDQ_ENT_SZ_SHIFT,
> +					  cmdq_entries);
> +}

Here, move in the natural alignment cap.

u32 arm_smmu_cmdq_max_n_shift(u32 ceiling)
{
	/* Capped to ensure natural alignment */
	ceiling = min_t(u32, CMDQ_MAX_SZ_SHIFT, ceiling);

	return arm_smmu_queue_max_n_shift(
		ceiling, CMDQ_ENT_SZ_SHIFT,
		cmdq_max_entries ? ilog2(cmdq_max_entries) : 0);
}
  
> @@ -662,8 +663,8 @@ static int tegra241_vcmdq_alloc_smmu_cmdq(struct tegra241_vcmdq *vcmdq)
>  
>  	/* Cap queue size to SMMU's IDR1.CMDQS and ensure natural alignment */
>  	regval = readl_relaxed(smmu->base + ARM_SMMU_IDR1);
> -	q->llq.max_n_shift =
> -		min_t(u32, CMDQ_MAX_SZ_SHIFT, FIELD_GET(IDR1_CMDQS, regval));
> +	hw_shift = min_t(u32, CMDQ_MAX_SZ_SHIFT, FIELD_GET(IDR1_CMDQS, regval));
> +	q->llq.max_n_shift = arm_smmu_cmdq_max_n_shift(hw_shift);

Then, we can just use FIELD_GET() at the two call sites:

	smmu->cmdq.q.llq.max_n_shift =
		arm_smmu_cmdq_max_n_shift(FIELD_GET(IDR1_CMDQS, reg));

Thanks
Nicolin

