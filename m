Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 552F4CFA756
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 21 Nov 2025 08:52:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=uQD6IPCAAuAQSaBuKc7iCXVSBWn0b9pFdIhTL2DU8uw=; b=x7Gq2qyHEg5iKqj+ye1ZjNiJWq
	NUfdHyL/xxDbqGSrSCCzWZb3hW/bcbdycRbDgcieJIzMRNoi8X4pZH6BaFAd2EqpKCk62Y2RODS3j
	g0jelkMwZKJ6QOrwCWE5Fq3A4yyzUmN8iWuJc+Qjjk/RfQjJpE7fMaHMAWzlwRVQDuxln1dcs74Lw
	720qikctrUeAC2h9U8QTaKtMRqou4eGKHUEsaXBkzl/gpscrfiEqZUXU923/zx+gA3oBezOIb4JJD
	cUNecogBPgy9Mc/I4rEEsbV9JMuF7vYHZ5i42XofMn1w0nJ55NQ/XYQ8V+ujCW5BYT5Zjz3dE+fsc
	EETSMw3g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vMMsE-000000086Ht-0V6X;
	Fri, 21 Nov 2025 08:52:10 +0000
Received: from mail-wr1-x433.google.com ([2a00:1450:4864:20::433])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vMMsB-000000086Ga-1BRR
	for linux-arm-kernel@lists.infradead.org;
	Fri, 21 Nov 2025 08:52:08 +0000
Received: by mail-wr1-x433.google.com with SMTP id ffacd0b85a97d-42b39d51dcfso1085268f8f.2
        for <linux-arm-kernel@lists.infradead.org>; Fri, 21 Nov 2025 00:52:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1763715125; x=1764319925; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=uQD6IPCAAuAQSaBuKc7iCXVSBWn0b9pFdIhTL2DU8uw=;
        b=CNZUR8SpETIlJaRBKV+08auSSegiZsWIbFzJm/TmgkHSzN8Er/lm2fUUWee8PFLMVz
         xQ4sb6ahxXFX5L7To3Jxg6563MMvzsnkSxN3Qxs9fR6o3fGg6Avl55QvGLD+INEaY6V2
         ohqyOy9ER+/TDc0TMfEPVohR38mg953sroHkmUaUawaVqfRS0HyYcZ2VTUD7E+yGgSnw
         rlYnCP7q1HE7qr1UMyOLfXffA7JbQ/8Tgi8R7G03Z0aGMSS5r3leGZo92OSXaSIXqS8U
         oKcy352mf710e1t+fWpI+Q2ruwe/ItUApNoLNk6Wvh/AWh5nNd96grv5ZmbfZ21jW780
         TztA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763715125; x=1764319925;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=uQD6IPCAAuAQSaBuKc7iCXVSBWn0b9pFdIhTL2DU8uw=;
        b=DhcbaMZ5/C53OtAV9CZoLQHd8bbYCKPsUO6d4NM5p2ufeoA2UGM1wN+8OPLGsoolyf
         DbKx1V2+RPG/Ed3jm/9Vu1knr5UclYz5Mar+UXiaaA4RVZLw8aQevsevLoJp5QABm69v
         W8eXzAHvSLmnhlbMrhsxt7oWCadbm8UbmoazutoiOj9i6kQFnFOGNBk6g3BcB1MlI9tB
         mpQRh1A5j1SkpLVSLw3wprovGtdUIB9qxviPiv630Ttfwl1dGSbQBAmpRfQl+Gwk+ajI
         QcSVUwTqkSluttWpxwq+glcIVTNknUF2eeBoX+v/fl9/AOI+Y3vPMPEvhviOA6W4pY/H
         TnWQ==
X-Forwarded-Encrypted: i=1; AJvYcCUrsTMmKLaAiCaDZPmOti6+MbJFv3Gq/itBqdp3C8BDMe8KlWatVG2i7cxf+7qK6zoOWBOfTIrdF9PGHirE+RKU@lists.infradead.org
X-Gm-Message-State: AOJu0Yyg9V37j0EEl9WdUdY1UfQfOYSdIt1d92f8nyDPYhfK9AREDwaW
	+X3PGnL+VP4INrwCHJ+vxBs3xCqvFlvRO4XghXAxUAfFMUmk+gfqh0rKzAKCXEVtQ0I=
X-Gm-Gg: ASbGnctEXgnpiH269KpEgXC67x9mSYA+HB0amRi4Hr46CXj6PBiC9y120WGmpiIp9/a
	CsVVe4fSyAeeaAfyJxuFSU3xsFJtQeEoZNn7Ow8GZ8Y/Gl603pwRqT4HgLnQ23xYcsl7BrBMVQI
	d/zznmmHbe/LK9CgNEvAigxhA8Xpk9RLDxL5IXyShbCU8qdl8KznyCIxET1i0XOLkfckHIduh50
	+UJbs78sE+IHlyTYVyXUOcm0zVaECq83KvEh8cJjAR5w8jYWWd8v/kBq4QAmMlL8E2fKsUlB896
	j0B2FCz0YZB3CH52eLsReTgb9nD54ST3d5w1mEjUOiM9Fdmel++QuI7O4vbba3dYUjCF4Wzl6Fq
	bkG0ZlU9dXk/pEFhKv81GMsMcmwNgKx6w53rpVQAjO34ecIRSg3C64AN/yw9hQuZIY8yCYhE/l0
	uCvbBzGjX+G7UeFkmlNdi333uXx0k1
X-Google-Smtp-Source: AGHT+IEinokPPaK0hYNLhqdwlX0uFESNUqrKrPuclcH1lbM4qDAV3Wx0cwOCGh0v5dfKc0oa55/cew==
X-Received: by 2002:a05:600c:3588:b0:477:bcb:24cd with SMTP id 5b1f17b1804b1-477c11179ffmr14043965e9.22.1763715125067;
        Fri, 21 Nov 2025 00:52:05 -0800 (PST)
Received: from [192.168.0.39] ([82.76.24.202])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-42cb7fa3a81sm10032980f8f.26.2025.11.21.00.52.04
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 21 Nov 2025 00:52:04 -0800 (PST)
Message-ID: <af7028da-34cc-42e5-8768-b6218ebae3f2@linaro.org>
Date: Fri, 21 Nov 2025 10:52:03 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH dmaengine 1/2] dmaengine: at_hdmac: fix formats under
 64-bit
To: Rosen Penev <rosenp@gmail.com>, dmaengine@vger.kernel.org
Cc: Vinod Koul <vkoul@kernel.org>,
 Ludovic Desroches <ludovic.desroches@microchip.com>,
 open list <linux-kernel@vger.kernel.org>,
 "moderated list:MICROCHIP AT91 DMA DRIVERS"
 <linux-arm-kernel@lists.infradead.org>
References: <20251106022405.85604-1-rosenp@gmail.com>
 <20251106022405.85604-2-rosenp@gmail.com>
Content-Language: en-US
From: Eugen Hristev <eugen.hristev@linaro.org>
In-Reply-To: <20251106022405.85604-2-rosenp@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251121_005207_353542_CF063FCA 
X-CRM114-Status: GOOD (  12.73  )
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



On 11/6/25 04:24, Rosen Penev wrote:
> size_t formats under 32-bit evaluate to the same thing and GCC does not
> warn against it. Not the case with 64-bit.
> 
> Signed-off-by: Rosen Penev <rosenp@gmail.com>

Reviewed-by: Eugen Hristev <eugen.hristev@linaro.org>

> ---
>  drivers/dma/at_hdmac.c | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/dma/at_hdmac.c b/drivers/dma/at_hdmac.c
> index 2d147712cbc6..7d226453961f 100644
> --- a/drivers/dma/at_hdmac.c
> +++ b/drivers/dma/at_hdmac.c
> @@ -887,7 +887,7 @@ atc_prep_dma_interleaved(struct dma_chan *chan,
>  	first = xt->sgl;
>  
>  	dev_info(chan2dev(chan),
> -		 "%s: src=%pad, dest=%pad, numf=%d, frame_size=%d, flags=0x%lx\n",
> +		 "%s: src=%pad, dest=%pad, numf=%zu, frame_size=%zu, flags=0x%lx\n",
>  		__func__, &xt->src_start, &xt->dst_start, xt->numf,
>  		xt->frame_size, flags);
>  
> @@ -1174,7 +1174,7 @@ atc_prep_dma_memset_sg(struct dma_chan *chan,
>  	int			i;
>  	int			ret;
>  
> -	dev_vdbg(chan2dev(chan), "%s: v0x%x l0x%zx f0x%lx\n", __func__,
> +	dev_vdbg(chan2dev(chan), "%s: v0x%x l0x%x f0x%lx\n", __func__,
>  		 value, sg_len, flags);
>  
>  	if (unlikely(!sgl || !sg_len)) {
> @@ -1503,7 +1503,7 @@ atc_prep_dma_cyclic(struct dma_chan *chan, dma_addr_t buf_addr, size_t buf_len,
>  	unsigned int		periods = buf_len / period_len;
>  	unsigned int		i;
>  
> -	dev_vdbg(chan2dev(chan), "prep_dma_cyclic: %s buf@%pad - %d (%d/%d)\n",
> +	dev_vdbg(chan2dev(chan), "prep_dma_cyclic: %s buf@%pad - %d (%zu/%zu)\n",
>  			direction == DMA_MEM_TO_DEV ? "TO DEVICE" : "FROM DEVICE",
>  			&buf_addr,
>  			periods, buf_len, period_len);


