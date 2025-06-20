Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B06F6C71155
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 20 Jun 2025 13:02:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=2h9UIYX1uYfUtH693EwkaDV+piOGtAPqTMVpXrWNLM4=; b=e+joyxDqEA9YnDjf6NJPS68Ty5
	zuVlhqL2WiiGEqid7exsWOOV5Oole+j50EzSogAwCAPXL5LFrHBVZ3SE4qCAOQSYTCCUQlC1GtRF3
	Rfp2gehDJWquV0/KuMPUVWuztAdO88GBG37fL3bsxGuQTQ1UEmof8/Vcfr8AEa3hql81rXb8SmKW4
	xnHlQbK/CATSnVB3IdzDouc4ZObkJSNZiJiMMtzFh16IUKkpH3Mjq9dKD6s4CbYD9yvqAteNRc5qH
	x9+EgzpbC+pPFwnaGx/MInEmlWzS460MyXQH6PMpUmfUMaP6mH7J6rzf3HhmacYXPMyGcmQ4w9SOs
	JSnLw5Nw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uSbNm-0000000Fepb-2W8v;
	Fri, 20 Jun 2025 13:02:14 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uSZmX-0000000FRyT-0twX;
	Fri, 20 Jun 2025 11:19:42 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id D909C176A;
	Fri, 20 Jun 2025 04:19:18 -0700 (PDT)
Received: from [10.57.31.151] (unknown [10.57.31.151])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id C72773F673;
	Fri, 20 Jun 2025 04:19:35 -0700 (PDT)
Message-ID: <340d76b8-c3a6-4116-ae51-ac4e4ee6a994@arm.com>
Date: Fri, 20 Jun 2025 12:19:28 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] iommu/rockchip: prevent iommus dead loop when two masters
 share one IOMMU
To: Simon Xue <xxm@rock-chips.com>, joro@8bytes.org, will@kernel.org,
 heiko@sntech.de
Cc: iommu@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
 linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20250620073945.572523-1-xxm@rock-chips.com>
From: Robin Murphy <robin.murphy@arm.com>
Content-Language: en-GB
In-Reply-To: <20250620073945.572523-1-xxm@rock-chips.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250620_041941_302178_AB4A4BE0 
X-CRM114-Status: GOOD (  17.38  )
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

On 2025-06-20 8:39 am, Simon Xue wrote:
> When two masters share an IOMMU, calling ops->of_xlate during
> the second master's driver init may overwrite iommu->domain set
> by the first. This causes the check if (iommu->domain == domain)
> in rk_iommu_attach_device() to fail, resulting in the same
> iommu->node being added twice to &rk_domain->iommus, which can
> lead to an infinite loop in subsequent &rk_domain->iommus operations.

Indeed this is a property of the IOMMU instance itself so it really 
should be initialised before registration, irrespective of client 
devices. FWIW, if it's possible to take an unexpected 
RK_MMU_IRQ_PAGE_FAULT immediately after requesting the IRQ (e.g. in a 
kdump kernel after a crash with the hardware still running) then I think 
the current code could probably end up dereferencing NULL in 
report_iommu_fault() as well.

Reviewed-by: Robin Murphy <robin.murphy@arm.com>

And probably also:

Cc: stable@vger.kernel.org
Fixes: 25c2325575cc ("iommu/rockchip: Add missing set_platform_dma_ops 
callback")

Thanks,
Robin.

> Signed-off-by: Simon Xue <xxm@rock-chips.com>
> ---
>   drivers/iommu/rockchip-iommu.c | 3 ++-
>   1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/iommu/rockchip-iommu.c b/drivers/iommu/rockchip-iommu.c
> index 22f74ba33a0e..e6bb3c784017 100644
> --- a/drivers/iommu/rockchip-iommu.c
> +++ b/drivers/iommu/rockchip-iommu.c
> @@ -1157,7 +1157,6 @@ static int rk_iommu_of_xlate(struct device *dev,
>   		return -ENOMEM;
>   
>   	data->iommu = platform_get_drvdata(iommu_dev);
> -	data->iommu->domain = &rk_identity_domain;
>   	dev_iommu_priv_set(dev, data);
>   
>   	platform_device_put(iommu_dev);
> @@ -1195,6 +1194,8 @@ static int rk_iommu_probe(struct platform_device *pdev)
>   	if (!iommu)
>   		return -ENOMEM;
>   
> +	iommu->domain = &rk_identity_domain;
> +
>   	platform_set_drvdata(pdev, iommu);
>   	iommu->dev = dev;
>   	iommu->num_mmu = 0;


