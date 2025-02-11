Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6BF5DC0219B
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 11 Feb 2025 18:53:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=QmvZ3RXa4X1W3kth/1G0cLaArrTjAmGGTBUJMNmmIlQ=; b=IgMD3IutWoV7MItIE2mcXVr1pU
	cxq5pONAPxJNmfTtSyj5e/F6OFdEpw6kTRzONjLlhMQ6YK1mJlDrL3wrCLF2TvKsslbzjd9g1ct4/
	4SH2+bar8nNlwTDh7KQDDq2tfpc7cwtLywA1fr4vVmVdyOdP9H8XeJSj5P5VYVAwB2yR4trZL3PPW
	zP7xNaw3qTJJBeUqj5Yd2ILuXOU+Qab5tK1cuZMhd5q5Tpxe8DmENFGmaan9bGaXUh8dGIMTFw4gq
	62Er/fducjgGznD649clXTOymywAshwaIbJkImoLHwvM5TOQSJ5rP3vzBz4IyP+bWeI0ofBbizYv4
	EwKDPhuA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1thvO9-00000004v0e-0wLm;
	Tue, 11 Feb 2025 18:53:41 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1thvC1-00000004shv-0VFV
	for linux-arm-kernel@bombadil.infradead.org;
	Tue, 11 Feb 2025 18:41:09 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=QmvZ3RXa4X1W3kth/1G0cLaArrTjAmGGTBUJMNmmIlQ=; b=HRtIOkCLbQ3FvcJRQfUROFyA6U
	pX5fe54/cqLNKW+XTX7CglnRP2v8mK3D5z1rH+vK+kwyPyVTD6/14lZwfxpslK0ATY73OUIASsrl+
	NiEiJ+/Or7TWAK6/rkhjRrU/cJ578bDPdmF7E6L1yIQluk/3nNnWZWPJwq6OkgA7rQ/LOPcqG5KmY
	ljqKRvOND8zDKzutnii6KcyaUHRq9YOyIr0XTVOwPE+w/NBuuDe8j7FWWcZ7ak65mvuZMdMiFaVP+
	GUznmoJ5nvBvhlDKu28h0JCzqJKBjW7RTb50Tf0dVwyXghGZSrn3K2jnLM+LmNSG3frXlJnxNiiOy
	RxT0XcJg==;
Received: from foss.arm.com ([217.140.110.172])
	by desiato.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1thvBx-00000000gWm-3k6Z
	for linux-arm-kernel@lists.infradead.org;
	Tue, 11 Feb 2025 18:41:07 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 1CCD713D5;
	Tue, 11 Feb 2025 10:41:25 -0800 (PST)
Received: from [10.57.35.63] (unknown [10.57.35.63])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 17DC03F58B;
	Tue, 11 Feb 2025 10:41:01 -0800 (PST)
Message-ID: <756ba6d7-b18e-4139-851b-496b1820117a@arm.com>
Date: Tue, 11 Feb 2025 18:41:00 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 5/5] iommu/dart: Assert !locked when configuring
To: Alyssa Rosenzweig <alyssa@rosenzweig.io>, Sven Peter
 <sven@svenpeter.dev>, Janne Grunau <j@jannau.net>,
 Joerg Roedel <joro@8bytes.org>, Will Deacon <will@kernel.org>
Cc: asahi@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
 iommu@lists.linux.dev, linux-kernel@vger.kernel.org
References: <20250210-locked-dart-v1-0-5d97fe247f35@rosenzweig.io>
 <20250210-locked-dart-v1-5-5d97fe247f35@rosenzweig.io>
From: Robin Murphy <robin.murphy@arm.com>
Content-Language: en-GB
In-Reply-To: <20250210-locked-dart-v1-5-5d97fe247f35@rosenzweig.io>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250211_184106_227265_E69D502B 
X-CRM114-Status: GOOD (  13.47  )
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
> Configuration is only possible and needed for non-locked DARTs and will
> fail for locked DARTs. We cannot try -- assert that we do not.

Except now we absolutely will - if a locked DART and its client device 
are advertised to Linux, instead of gracefully refusing to touch it, 
we'll now attach the client to a DMA domain, firing a barrage of 
multiple WARNs in the process, and give it DMA ops which still cannot 
work. I'm not really convinced this series on its own leaves us in a 
better position than we're already in now... :/

How hideous is the rest of what's required to actually make this usable?

Thanks,
Robin.

> Signed-off-by: Alyssa Rosenzweig <alyssa@rosenzweig.io>
> ---
>   drivers/iommu/apple-dart.c | 6 +++++-
>   1 file changed, 5 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/iommu/apple-dart.c b/drivers/iommu/apple-dart.c
> index 29b627b38e8c37afd2b6a72865f43d24b633834a..87eb87bb2f5158d000a2c2fc801b722a2262c941 100644
> --- a/drivers/iommu/apple-dart.c
> +++ b/drivers/iommu/apple-dart.c
> @@ -309,6 +309,7 @@ apple_dart_hw_enable_translation(struct apple_dart_stream_map *stream_map)
>   	struct apple_dart *dart = stream_map->dart;
>   	int sid;
>   
> +	WARN_ON(stream_map->dart->locked);
>   	for_each_set_bit(sid, stream_map->sidmap, dart->num_streams)
>   		writel(dart->hw->tcr_enabled, dart->regs + DART_TCR(dart, sid));
>   }
> @@ -318,6 +319,7 @@ static void apple_dart_hw_disable_dma(struct apple_dart_stream_map *stream_map)
>   	struct apple_dart *dart = stream_map->dart;
>   	int sid;
>   
> +	WARN_ON(stream_map->dart->locked);
>   	for_each_set_bit(sid, stream_map->sidmap, dart->num_streams)
>   		writel(dart->hw->tcr_disabled, dart->regs + DART_TCR(dart, sid));
>   }
> @@ -328,7 +330,7 @@ apple_dart_hw_enable_bypass(struct apple_dart_stream_map *stream_map)
>   	struct apple_dart *dart = stream_map->dart;
>   	int sid;
>   
> -	WARN_ON(!stream_map->dart->supports_bypass);
> +	WARN_ON(stream_map->dart->locked || !stream_map->dart->supports_bypass);
>   	for_each_set_bit(sid, stream_map->sidmap, dart->num_streams)
>   		writel(dart->hw->tcr_bypass,
>   		       dart->regs + DART_TCR(dart, sid));
> @@ -340,6 +342,7 @@ static void apple_dart_hw_set_ttbr(struct apple_dart_stream_map *stream_map,
>   	struct apple_dart *dart = stream_map->dart;
>   	int sid;
>   
> +	WARN_ON(stream_map->dart->locked);
>   	WARN_ON(paddr & ((1 << dart->hw->ttbr_shift) - 1));
>   	for_each_set_bit(sid, stream_map->sidmap, dart->num_streams)
>   		writel(dart->hw->ttbr_valid |
> @@ -353,6 +356,7 @@ static void apple_dart_hw_clear_ttbr(struct apple_dart_stream_map *stream_map,
>   	struct apple_dart *dart = stream_map->dart;
>   	int sid;
>   
> +	WARN_ON(stream_map->dart->locked);
>   	for_each_set_bit(sid, stream_map->sidmap, dart->num_streams)
>   		writel(0, dart->regs + DART_TTBR(dart, sid, idx));
>   }
> 


