Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 075F4C61DD3
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  1 Sep 2026 13:20:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=nBPcbU1kOOJbitssHgqfM8emDTDgPwqNuIYSmdifkXs=; b=a8vExidbntODkhOTVH1ZQ2Bzmz
	/yJD0lXNMPvWbKiFk0d6BE6wSTx8ncjGgTqYNTcGMl/CO/mhEtt0qOOkLELNIWM9Y1hsNWe4YB/jQ
	JBsNk0ty4P1VaZXDI2KZAKjvUuXwzjtYeDaPc5g1V/OWoyI3FB/VZAAjNORZoMgbAta5jKg8mqQUn
	gAbHSTfMXCuL2kDTtikUzNjXE5yC9MfKXmb1/CDS5fXAo73S2+OP2ts+XSqdHVyDdXD8BjT5V1W/w
	ujqm5dT3KSh4M0P4MVq/n75O8XVwKIGHrbooQo1PrPJckJL2cOy/8OMf/3Dtnoi+X8Tgux/z8xcoQ
	QJcBk+XA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x1OPV-0000000CCUQ-2R5x;
	Tue, 01 Sep 2026 13:20:21 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x1OPT-0000000CCTH-1hH7
	for linux-arm-kernel@lists.infradead.org;
	Tue, 01 Sep 2026 13:20:21 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 8B12E1756;
	Tue,  1 Sep 2026 06:20:12 -0700 (PDT)
Received: from [10.2.212.23] (e121345-lin.cambridge.arm.com [10.2.212.23])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 1B1C13F882;
	Tue,  1 Sep 2026 06:20:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1788268816; bh=nenqtb/1rWx2Wc6vlwOfg7g3fX9Nslava+BW/4x7vh4=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=tzKLefnuBA7K2Sihm5EsIoRPnR7tt84b4HlzA3r6ntwk+h/pizCIhB6DoHKi0Oap4
	 NcimuH7tdrG7nmkmdsp/Ddt6kwbYO5dFp6IqX4SdbzLKacSqriv8YSnmg6ZCE0B2Hk
	 urDNCconsocbyOBB0rv0iG18tKFRDQ6vTan/R3Rk=
Message-ID: <0872f586-ce2c-41b4-9452-0b9c3052aea1@arm.com>
Date: Tue, 1 Sep 2026 14:20:11 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] iommu/exynos: Initialize lock before requesting IRQ
To: Runyu Xiao <runyu.xiao@seu.edu.cn>,
 Marek Szyprowski <m.szyprowski@samsung.com>
Cc: Joerg Roedel <joro@8bytes.org>, Will Deacon <will@kernel.org>,
 Krzysztof Kozlowski <krzk@kernel.org>, Alim Akhtar
 <alim.akhtar@samsung.com>, KyongHo Cho <pullip.cho@samsung.com>,
 Kukjin Kim <kgene.kim@samsung.com>, iommu@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org,
 linux-kernel@vger.kernel.org, stable@vger.kernel.org,
 Jianhao Xu <jianhao.xu@seu.edu.cn>
References: <20260901130527.3289245-1-runyu.xiao@seu.edu.cn>
From: Robin Murphy <robin.murphy@arm.com>
Content-Language: en-GB
In-Reply-To: <20260901130527.3289245-1-runyu.xiao@seu.edu.cn>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260901_062019_482628_9A30B7F6 
X-CRM114-Status: GOOD (  17.03  )
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

On 01/09/2026 2:05 pm, Runyu Xiao wrote:
> The SysMMU interrupt handler can run as soon as devm_request_irq() is
> called. Initialize the driver lock before registering the handler so an
> early interrupt cannot use an uninitialized lock.

And what about all the _other_ data the handler unconditionally 
dereferences which is also still uninitialised at this point? If you 
think this (clearly theoretical) race is worth fixing then at least 
actually fix it...

Thanks,
Robin.

> Fixes: 2a96536e77b4 ("iommu/exynos: Add iommu driver for EXYNOS Platforms")
> Cc: stable@vger.kernel.org
> Signed-off-by: Runyu Xiao <runyu.xiao@seu.edu.cn>
> Assisted-by: Codex:GPT-5
> ---
>   drivers/iommu/exynos-iommu.c | 3 ++-
>   1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/iommu/exynos-iommu.c b/drivers/iommu/exynos-iommu.c
> index 874d05f4b..e9feb83b3 100644
> --- a/drivers/iommu/exynos-iommu.c
> +++ b/drivers/iommu/exynos-iommu.c
> @@ -735,6 +735,8 @@ static int exynos_sysmmu_probe(struct platform_device *pdev)
>   	if (!data)
>   		return -ENOMEM;
>   
> +	spin_lock_init(&data->lock);
> +
>   	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
>   	data->sfrbase = devm_ioremap_resource(dev, res);
>   	if (IS_ERR(data->sfrbase))
> @@ -773,7 +775,6 @@ static int exynos_sysmmu_probe(struct platform_device *pdev)
>   		return PTR_ERR(data->clk_master);
>   
>   	data->sysmmu = dev;
> -	spin_lock_init(&data->lock);
>   
>   	__sysmmu_get_version(data);
>   


