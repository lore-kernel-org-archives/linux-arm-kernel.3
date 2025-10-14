Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 31F81CCD193
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 14 Oct 2025 17:18:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=KLgUmWAdR+q8Ii5cGcW1JkahYs4m0LTFDjjWV5fYKHo=; b=LfjbCngIgbUgTnQ46HwK4WfhoV
	z3m4hhWwP5uYylQvWiP9LWxPdR0d9z3nOxoSGQvHfT0ovBpdyZGYMGsC/eYIYDRjZgbKrLDMfnOGT
	afsTOXyFK/bCxzHqK1Nz//joGe90+38p774HRdm2D/z2cqwes9EOH1QDOS+LTNaKs6wkvFNrjiLEv
	Ganv5q4+sCN9lfM7FfdVo2uoUNHPtUYvfaOLpIvoPiVlTRnz8/E2TWpej+oMN30Mi9SZLdvGeHEZ/
	pV21yAGvTmsKJKdwzFXzCQev86VkVNXFFaZWCZqbjinyK51s9XQsjMC2inYWAvwIR0wnnE02YPmn0
	6u1IFT4w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v8ifD-0000000H4Q3-3nhn;
	Tue, 14 Oct 2025 17:18:19 +0000
Received: from mail-northcentralusazlp170120005.outbound.protection.outlook.com ([2a01:111:f403:c105::5] helo=CH5PR02CU005.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v8ifA-0000000H4On-42bp
	for linux-arm-kernel@lists.infradead.org;
	Tue, 14 Oct 2025 17:18:18 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=EQxmn8SwYgSENvFEVHUXOhNiVTXHBbBbxHjfLC+LFcaV1k2TuG6uQ40fFUgPG1uAyYPRghZE6ydhUYog8eoCUhq2wiOGaW6VGjAXBXbePqwcodaZsQfLjK8FormxNJV+G9OToOQ3jP4w5MIKjLRT2C3OJSAFLxIHr5lCspebIMvTNk6s9wpyJ8zcA8cdyL2BXOJ2+umkVX5emEPQ1HFfbcz2lbUjedqPApuM2jAVD/vLmUAAAB5az8E/ztACIdASJlXx2ZH0gRtGrGHjYmFl8z+IODxuaL1CvTKaT9SlnwJSFuIsmZQDGqJZZsfstkD3YRYVLOxo77XxQAq0JGd2iA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=KLgUmWAdR+q8Ii5cGcW1JkahYs4m0LTFDjjWV5fYKHo=;
 b=C4ehI7/87FWBzjIiXlUDZP4jeZT0rlax6nlg7lVR91tqHvV5B8gpqjZnUvOhnIwfICNrjMHyK3//VGIT83VTfT3pNrWzzGga3ttlBZUH3zllyC8vKbLImb5CIkdGA/TZnCM2kVcX1oTjt0fBfSGQnblWyxQZ3EvjuuUKMll85I51iiC7VO0gcsKl0G5b43WINHKD9gYRXwu1O5UUvIufmYmUoCGz/lwKB1gY6JXWYkc+fo+/DzxXwoRQYpLBdItToUuCx10HXeBiwqh/ywm27X2N59T4bJaZ1OU8kt6uQAwwyBZYT5w/cVn/a7syVoP3Dr/IILBfXcXuQU4iY5hyUg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=ew.tq-group.com smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KLgUmWAdR+q8Ii5cGcW1JkahYs4m0LTFDjjWV5fYKHo=;
 b=Pj6UpvsB/67NY/FsCKoH0Zq5ckCvIKam/Nj6Zb/Mn6c4AQX6ahwdjZl0ijlVGuG+95N87ZZolsuZaOTq5RcSdZZEYaHn/dzSEoKmaH2mi1XOT13qHenqCfpVLzj20Ic92jyLVsUf0XPaTrsfR6YbBLRdqWx/9wPvikYBheadAOs=
Received: from BN0PR04CA0043.namprd04.prod.outlook.com (2603:10b6:408:e8::18)
 by SA5PPFE91247D15.namprd12.prod.outlook.com (2603:10b6:80f:fc04::8e8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9203.12; Tue, 14 Oct
 2025 17:18:03 +0000
Received: from BL02EPF0001A0FD.namprd03.prod.outlook.com
 (2603:10b6:408:e8:cafe::9c) by BN0PR04CA0043.outlook.office365.com
 (2603:10b6:408:e8::18) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9228.10 via Frontend Transport; Tue,
 14 Oct 2025 17:18:02 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb08.amd.com; pr=C
Received: from satlexmb08.amd.com (165.204.84.17) by
 BL02EPF0001A0FD.mail.protection.outlook.com (10.167.242.104) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9228.7 via Frontend Transport; Tue, 14 Oct 2025 17:18:01 +0000
Received: from SATLEXMB04.amd.com (10.181.40.145) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.2.2562.17; Tue, 14 Oct
 2025 10:18:01 -0700
Received: from satlexmb08.amd.com (10.181.42.217) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Tue, 14 Oct
 2025 12:18:01 -0500
Received: from [172.19.71.207] (10.180.168.240) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server id 15.2.2562.17 via Frontend
 Transport; Tue, 14 Oct 2025 10:18:00 -0700
Message-ID: <731cca87-0065-0fc3-9f97-28a9ce017c36@amd.com>
Date: Tue, 14 Oct 2025 10:18:00 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH 1/1] dmaengine: xilinx: xdma: Fix regmap init error
 handling
Content-Language: en-US
To: Alexander Stein <alexander.stein@ew.tq-group.com>, Brian Xu
	<brian.xu@amd.com>, Raj Kumar Rampelli <raj.kumar.rampelli@amd.com>, "Vinod
 Koul" <vkoul@kernel.org>, Michal Simek <michal.simek@amd.com>, Max Zhen
	<max.zhen@amd.com>, Sonal Santan <sonal.santan@amd.com>
CC: <dmaengine@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>
References: <20251014061309.283468-1-alexander.stein@ew.tq-group.com>
From: Lizhi Hou <lizhi.hou@amd.com>
In-Reply-To: <20251014061309.283468-1-alexander.stein@ew.tq-group.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: None (SATLEXMB04.amd.com: lizhi.hou@amd.com does not designate
 permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL02EPF0001A0FD:EE_|SA5PPFE91247D15:EE_
X-MS-Office365-Filtering-Correlation-Id: aa824fe0-3f92-41a2-6837-08de0b45a147
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|36860700013|1800799024|82310400026|7053199007;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?bWd4MS82MHhOSzdra1FhZi9pV0FlYy9Yb0IxYk9qWEVWeWQ5cGVvcnVXNVBJ?=
 =?utf-8?B?Zk1CYkdoN2pqeWVpc016RWx6dE9DNW5HdzhxOVFXWk9iWTFFZGhDOFlPOHhp?=
 =?utf-8?B?Z2oyUEZzNEQwb3ZORXN2OWJIK29PQ0M4U2R0Mkh6d0J0NlpIcUJCK1pzR0hS?=
 =?utf-8?B?OHdCSFNObUN2dG1CNjB1dlpGQXFicVVJdGY4OFhnZnIxOWFmRnlONUhvU0hy?=
 =?utf-8?B?a2xBNFRtN2ZzR2svcWVGRFVLbnJxeXVWYW1EQ3l4eVBXNzFMQWJaUHU2dlpS?=
 =?utf-8?B?QUl3dlZoMW5ZUVdwekptSVd0NzRaa3ZEaGtLd3M0cmlCWCtUQW5ZSXIxV20v?=
 =?utf-8?B?YUphTy9UVEg1RDVUenVvbGlObDZ6TXViQUJzdTlLSVQxSzZCQlZxRmhVc2Q4?=
 =?utf-8?B?aVNBSitFL2FpTGZLVTJkRUJQNkJSQ20zZHhhekc2alZLZ2xMY2RlTFJpTGFv?=
 =?utf-8?B?N0R2N1RSa3N0ZVduQll0TjAxc0ZUbFhPOTJRbm1pcEdPeUtxVHBVRFZoM0g5?=
 =?utf-8?B?Z0x6UlVicGZPcG5wRVVmUjBVMzltRldtaURQbGRGNFBaSzduVTZMVlpJaVN4?=
 =?utf-8?B?K05vMVN0cFVKYzg5dVhsTVNDMnN5QXNuUVlSRGduZWRaT3dublF1YmVvNnZs?=
 =?utf-8?B?VWF3dmFGMVlRVEg2ZmtDQ05JQkJGeTNxSk9KeVdkSUFBOUxHRStERHh3N1Nw?=
 =?utf-8?B?ajNMZmd3TXU5UDVuVm0xWXNtcW9MdXZ5OGZJMGxGVDVCTk5JWXdKRWV5aEZP?=
 =?utf-8?B?WUxWWkwrR245RXhzNGR0VUdhWFlCRVdmSFZvdFhxcjFxdDVIeUNSL3l0aGZC?=
 =?utf-8?B?VEZpalloL0dJRDMwZzNJemxuL0pIOFUrd2t4cUlBMDJEenlVRkMxT2pJMkdv?=
 =?utf-8?B?bTFqcWhYV3AxWW9zOVBDSmN2eERFQlFnRUhaT3RZRElHTnFIQ01ZSzJ0VlNY?=
 =?utf-8?B?T3JZMDB1bmxNeVFDNDFDb0w4QUdpN1VWWU1xU3BoUkp1VUEvOVNUWi9KZ2c0?=
 =?utf-8?B?TE1MaC9JQnp5MmlJdThCSDY0QUhxVTRaME1OUlBwNEgyWExkM3VxbnZKc1cr?=
 =?utf-8?B?TithR3Fxc25SWEtoYjgwcGRHUTRTbzN1YlpJTTVvZUFuS3Z4OTJwbFV4UXRz?=
 =?utf-8?B?TDhtWDNQblZvMzhGRHpBaWQ5OXMwcEhTSTJ0eGVkNDVLc0czN1k5dVZtT2dC?=
 =?utf-8?B?TFpNVjFvVmV1QmNFQnlHcUtBWkQ5V0plZlhEakx0akFiRkZJQzZoaTJkRTRC?=
 =?utf-8?B?RnBpSXBOanMxajdVVXd5UTRWaXlDN1JnNHFoN0RLOXV5c0RNbjFjS3RsMk1m?=
 =?utf-8?B?cUNQa3dTVmhwYlJJMCtMUXVoelU2d0ZsbDFsN0FYUkNPdEdBbUJIblIxejhq?=
 =?utf-8?B?RDhZNitBdGVNV0NnK2ROSHJLdms2emhXNGZsZ0FHRFZkeTVJcTV2NWNZUjRI?=
 =?utf-8?B?UHBOUnRyS0RXdUlhTmRGdkZ6eWdQTXU1dG9hSUJVUnBDZkM5ZTR2aDBzV2Uy?=
 =?utf-8?B?dVdBenBRTWFDZndONWxRK3RxWDlhbmhudEE5eHdLQ0l4QUdBUVo5NU5UTDA5?=
 =?utf-8?B?ZTdIK2UzOU9HUnZpazUyRURvU3ZYd2dtUnRqeHhOUVJaWHg0KzVrdHMxZnVT?=
 =?utf-8?B?TEZRU3FMSWxRdUJEQkE4QTFYb3hBOHFUekZVV3hhY1ZHMUsxQ2dUa2d5alFv?=
 =?utf-8?B?QXkzdGhzRHQ3REJaQlJoY01QbnVlSUN5UVBKU2VJMUhxR215RHU0bmRReitC?=
 =?utf-8?B?dHNnWkEzOEtPb1RrdXhUdXpHamhuM0RPL01WQzM3cEg2S0JxS2FRbnVkWk8w?=
 =?utf-8?B?SzVCTy8vSXVBWDYxUUpYeXhFYkR6ajBKZEppcFdnWGluUkZYeHh0K3pnSHZZ?=
 =?utf-8?B?UnJqSTNpd1N5TzVSSzJWNGdLcDNiM3NtVjhGZUlnR0IyL08wSDNOMXVpQlBE?=
 =?utf-8?B?MStVcU5aNmpXL2t2RGp4ZThFampjaFRDNy9LRUwxSm9yZkJMclBWc0hOSEky?=
 =?utf-8?B?dE5BckhqU293bm9zcnltVmphU3YvV04yak5GSXRuaUV1Ynd4VlBDZkZyVWJn?=
 =?utf-8?B?M2pUOXMwR2I2OHFBc0tmeEtnSmxaenoxVUdsbklLMElpRXdHQWFKZzNIMDU4?=
 =?utf-8?Q?xZoMt4+3QUPccEW9gxwN63sA9?=
X-Forefront-Antispam-Report: CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:satlexmb08.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(36860700013)(1800799024)(82310400026)(7053199007);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Oct 2025 17:18:01.9196
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: aa824fe0-3f92-41a2-6837-08de0b45a147
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb08.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: BL02EPF0001A0FD.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA5PPFE91247D15
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251014_101817_002379_6EC64AF1 
X-CRM114-Status: GOOD (  19.59  )
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

Hi Vinod,


This has been reported by multiple users. e.g.

https://lore.kernel.org/dmaengine/CALYqZ9=pVRtSY=w4hG0R3HEM_Y=bpLba2_jRcvcZX4eLX5Yw-A@mail.gmail.com/

https://lore.kernel.org/dmaengine/20240819193641.600176-1-harshit.m.mogalapalli@oracle.com/

Could you help to merge this fix?


Thanks,

Lizhi

On 10/13/25 23:13, Alexander Stein wrote:
> devm_regmap_init_mmio returns an ERR_PTR() upon error, not NULL.
> Fix the error check and also fix the error message. Use the error code
> from ERR_PTR() instead of the wrong value in ret.
>
> Fixes: 17ce252266c7 ("dmaengine: xilinx: xdma: Add xilinx xdma driver")
> Signed-off-by: Alexander Stein <alexander.stein@ew.tq-group.com>
> ---
>   drivers/dma/xilinx/xdma.c | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/dma/xilinx/xdma.c b/drivers/dma/xilinx/xdma.c
> index 3d9e92bbc9bb0..c5fe69b98f61d 100644
> --- a/drivers/dma/xilinx/xdma.c
> +++ b/drivers/dma/xilinx/xdma.c
> @@ -1325,8 +1325,8 @@ static int xdma_probe(struct platform_device *pdev)
>   
>   	xdev->rmap = devm_regmap_init_mmio(&pdev->dev, reg_base,
>   					   &xdma_regmap_config);
> -	if (!xdev->rmap) {
> -		xdma_err(xdev, "config regmap failed: %d", ret);
> +	if (IS_ERR(xdev->rmap)) {
> +		xdma_err(xdev, "config regmap failed: %pe", xdev->rmap);
>   		goto failed;
>   	}
>   	INIT_LIST_HEAD(&xdev->dma_dev.channels);

