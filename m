Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B7F03C0219B
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 11 Feb 2025 18:45:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ikq330kp12IPzqUVNcE/oi7B+kXcd2iYAVVOt1TumWg=; b=LS9yLE0I7GglrmVtXX/i9O27Kd
	V/obyRlXOtoJtCv52ItoixaJcotPQgPFd+3i0QnLpf8r+9lDo4+uFZyc+uV4RdhZtzZAR1S9RhRCd
	GK5N67oLfoyvpk+L1KIArEvRXpTqFGk4UOa15tGSzwLPomXtrPsfTIYwTp+RFCmWbVqtO+XutaZJR
	yXrZCgKqX4EwuBp7+jI+nG+Ru8GlMLbkVI1na6A9nHcRaRZMYnj2EMXYHVFhok23gyY6XkRAaUIdO
	y4vxCDZn+N3rNH4LAy+L12X6PWQhyKrRODOtFEz158CnCBFacbfjAq7G7BGROa0iJ5p3SdsqfiHV5
	S+Y4ke+Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1thvFr-00000004tTc-3AIv;
	Tue, 11 Feb 2025 18:45:07 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1thv5d-00000004rHR-3CNU
	for linux-arm-kernel@lists.infradead.org;
	Tue, 11 Feb 2025 18:34:34 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id DDA0E13D5;
	Tue, 11 Feb 2025 10:34:53 -0800 (PST)
Received: from [10.57.35.63] (unknown [10.57.35.63])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 2C11D3F58B;
	Tue, 11 Feb 2025 10:34:30 -0800 (PST)
Message-ID: <98af5c02-5006-4272-aaf0-a0e30c312059@arm.com>
Date: Tue, 11 Feb 2025 18:34:27 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/5] iommu/dart: Skip reset for locked DARTs
To: Alyssa Rosenzweig <alyssa@rosenzweig.io>, Sven Peter
 <sven@svenpeter.dev>, Janne Grunau <j@jannau.net>,
 Joerg Roedel <joro@8bytes.org>, Will Deacon <will@kernel.org>
Cc: asahi@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
 iommu@lists.linux.dev, linux-kernel@vger.kernel.org,
 Hector Martin <marcan@marcan.st>
References: <20250210-locked-dart-v1-0-5d97fe247f35@rosenzweig.io>
 <20250210-locked-dart-v1-2-5d97fe247f35@rosenzweig.io>
From: Robin Murphy <robin.murphy@arm.com>
Content-Language: en-GB
In-Reply-To: <20250210-locked-dart-v1-2-5d97fe247f35@rosenzweig.io>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250211_103433_850800_735A7771 
X-CRM114-Status: GOOD (  19.06  )
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

On 2025-02-10 7:39 pm, Alyssa Rosenzweig wrote:
> Locked DARTs cannot be reconfigured, therefore the reset/restore
> procedure can't work and should not be needed. Skip it, allowing locked
> DARTs to probe.
> 
> Co-developed-by: Hector Martin <marcan@marcan.st>
> Signed-off-by: Hector Martin <marcan@marcan.st>
> Signed-off-by: Alyssa Rosenzweig <alyssa@rosenzweig.io>
> ---
>   drivers/iommu/apple-dart.c | 24 ++++++++++++------------
>   1 file changed, 12 insertions(+), 12 deletions(-)
> 
> diff --git a/drivers/iommu/apple-dart.c b/drivers/iommu/apple-dart.c
> index 460cf96bc8001e051916f356d5d175b35e36c608..9c74a95eb7e819e94ab2fb47ed0d411a1eba8bf7 100644
> --- a/drivers/iommu/apple-dart.c
> +++ b/drivers/iommu/apple-dart.c
> @@ -452,17 +452,9 @@ apple_dart_t8110_hw_invalidate_tlb(struct apple_dart_stream_map *stream_map)
>   
>   static int apple_dart_hw_reset(struct apple_dart *dart)
>   {
> -	u32 config;
>   	struct apple_dart_stream_map stream_map;
>   	int i;
>   
> -	config = readl(dart->regs + dart->hw->lock);
> -	if (config & dart->hw->lock_bit) {
> -		dev_err(dart->dev, "DART is locked down until reboot: %08x\n",
> -			config);
> -		return -EINVAL;
> -	}
> -
>   	stream_map.dart = dart;
>   	bitmap_zero(stream_map.sidmap, DART_MAX_STREAMS);
>   	bitmap_set(stream_map.sidmap, 0, dart->num_streams);
> @@ -1151,9 +1143,11 @@ static int apple_dart_probe(struct platform_device *pdev)
>   	}
>   
>   	dart->locked = apple_dart_is_locked(dart);
> -	ret = apple_dart_hw_reset(dart);
> -	if (ret)
> -		goto err_clk_disable;
> +	if (!dart->locked) {
> +		ret = apple_dart_hw_reset(dart);
> +		if (ret)
> +			goto err_clk_disable;
> +	}
>   
>   	ret = request_irq(dart->irq, dart->hw->irq_handler, IRQF_SHARED,
>   			  "apple-dart fault handler", dart);
> @@ -1192,7 +1186,9 @@ static void apple_dart_remove(struct platform_device *pdev)
>   {
>   	struct apple_dart *dart = platform_get_drvdata(pdev);
>   
> -	apple_dart_hw_reset(dart);
> +	if (!dart->locked)
> +		apple_dart_hw_reset(dart);

Not much point saving anything on suspend either, in that case.

Thanks,
Robin.

> +
>   	free_irq(dart->irq, dart);
>   
>   	iommu_device_unregister(&dart->iommu);
> @@ -1325,6 +1321,10 @@ static __maybe_unused int apple_dart_resume(struct device *dev)
>   	unsigned int sid, idx;
>   	int ret;
>   
> +	/* Locked DARTs can't be restored, and they should not need it */
> +	if (dart->locked)
> +		return 0;
> +
>   	ret = apple_dart_hw_reset(dart);
>   	if (ret) {
>   		dev_err(dev, "Failed to reset DART on resume\n");
> 


