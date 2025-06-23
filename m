Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3AAE5C7EE30
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 23 Jun 2025 12:37:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=7Yw6imxd4BTDTWrkr9aN2QlmFrVCvg38lQ/oem6/zBU=; b=yHfGvqZPsTv0EKBUD3VMH5Fudf
	6Sg6E4SSYJfjtfU6R08pauYHj+weBJYwEzejV0x+qQLtKqkppWq+RhZmuQU3GTQHDSnvu3RQ1ode0
	bgQ5ux/EqJj4KxQJ6708cExjKTuDWVNoCWCHgRBaencKh983nKPZjWY6wPUJnkJsfj54aXxRByPr3
	LSfOqoGohatUDXun/zIJPgC4KQtkV9kUy1hYwJkzc9P3VP7WaS2FotB4rtlbeMWN4f7WuYbbLFU+W
	IG8Z337NAf45OlK5Hl7vSWlaX5O4UCV1rs3p7jMyAmWgK/tgJPXfqxIthZFbjSNxw+TLXlm2tztPu
	YvLr8yGg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uTgQZ-00000002id3-3Mxy;
	Mon, 23 Jun 2025 12:37:35 +0000
Received: from mail-ed1-x52a.google.com ([2a00:1450:4864:20::52a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uTed1-00000002Orh-2gNI
	for linux-arm-kernel@lists.infradead.org;
	Mon, 23 Jun 2025 10:42:20 +0000
Received: by mail-ed1-x52a.google.com with SMTP id 4fb4d7f45d1cf-60794c43101so6008296a12.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 23 Jun 2025 03:42:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1750675337; x=1751280137; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=7Yw6imxd4BTDTWrkr9aN2QlmFrVCvg38lQ/oem6/zBU=;
        b=E2aLufmzXBccb4EfhmtqNdtACJOTHXcHrbxgTQrBBzar0GKmgpiC63HMKiKYEIKCew
         YfuJt2pUsesKCYAWZi4U5qQx7t6msXIScDEF/wVepIhU8dqwEzM9roMjzOunWFPPFD4i
         +BYQo7C0crKu5JBZFJdngVk4MT+Wd3z8z7iYbLznz3B/TjbA7qblfIf2U9wPvJGBsntr
         AUN1Bgr462B+O2k/lPEf6IaZag2d7ZpnpGMp4UgbHfZdz5yHzvySbzowoiOqJ+FbaExl
         UNZf0oBuMnIbTY3Uzaqsu/WzT7rlRCYsKvK0l09mOllo/Ttym1CLbunEHl+DP1OCundo
         kRyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750675337; x=1751280137;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=7Yw6imxd4BTDTWrkr9aN2QlmFrVCvg38lQ/oem6/zBU=;
        b=P22B1cOf1UIm+cjZiUDhjCKgGKmXeyEQG+O+cjMsUL5XdCOGyfMDZMABLwaUzUuEjA
         Sc0CpG0BvcQ7zaoIMuz8N5TXlK4Ds7aPgwzt1gHKxGimQW2aGOP6xbyv75FjsCacxIOG
         cXgQHusizzCmMbLxSX663NOK6pZnhAtszX9jG2eOeu4M+qEIT+xM1NHA+fyVBLhzCjRe
         8jtXyKSsIw6mKIuUGadcKr9OnUI6VgHlE05BM3cUm5kcbRepNmuppIce5xLHMBds6QdC
         udHrWNJ3/dxpmvaWEjgjcTjTVLpf0tT994T/2pEyvdXovtPg8YG8e2wULzeWrKXS/VmJ
         5lPw==
X-Forwarded-Encrypted: i=1; AJvYcCWhEeGce7nz1t1GumsE24m+lSam2DaQtj+IQDx9JEIt9Y4cCSVZmXGMjKn+8iv3cpw0bXHj3o8kct9gdYrysUij@lists.infradead.org
X-Gm-Message-State: AOJu0YypDJwcwFq9cCOOlO1FW1rU1ksenCiEIK2M+ApobSFviQbSlLI7
	ChzZjulpHKboz65I0F2i+jN7JZU7IN142mFsG5RmAtzMhHg24ThYfsdz
X-Gm-Gg: ASbGncs2gKYT9AXi1K9Km10blg+X0xuH5bGsWCNfNePB+XE1SGngZB/L9ose6WN2V55
	HmMdfKq/mLJR+RkV3BC3BehSAsh3dSLFpvfXdjjTsH16uq/VGX73RCYmgpXiCvAURasBwCuasvm
	I+gV6p9RYSyvEEK2ZLci1+ix9K6/buQiJNHu3Anuf+FnbxK6nesBN0g+hWoH773OoC0S2axsfhl
	1zb6XE1NTwicdw3kRq9A+6GAcMERCy2/VgVAgsYXQ0SbESCaEnbwRFyGjzAQB69sg0m/Zk096+I
	T+ewQ4VnE/uzgdLa861qcfJxQ5bfF//Sdlq4MOg5PQ5u1Dc0pN9qKGizS/ytBD4UalEF4EGAqui
	B7h8Yp4dFKqFuNdTXfAEqmAoQBYDNrlNJXoLFO+4Jv9H8iHg=
X-Google-Smtp-Source: AGHT+IEfNTyPHjwPJEzLQfQoS55yQsLH7CzoYZynUgBsxDONAr3ULxD/B75b39rL0u4RhOVhHN1eXA==
X-Received: by 2002:a17:906:6a1a:b0:ad2:1cd6:aacf with SMTP id a640c23a62f3a-ae057c0d793mr1084866966b.47.1750675337254;
        Mon, 23 Jun 2025 03:42:17 -0700 (PDT)
Received: from ?IPV6:2a02:2f0e:c51b:8900:a03f:12cb:72f7:9069? ([2a02:2f0e:c51b:8900:a03f:12cb:72f7:9069])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ae0541b6894sm687693066b.111.2025.06.23.03.42.16
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 23 Jun 2025 03:42:16 -0700 (PDT)
Message-ID: <0b963009-85fe-473a-a65b-6b427bee98c5@gmail.com>
Date: Mon, 23 Jun 2025 13:42:15 +0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] crypto: sun8i-ce: Fix `dma_unmap_sg()` nents value
To: Thomas Fourier <fourier.thomas@gmail.com>
Cc: Corentin Labbe <clabbe.montjoie@gmail.com>,
 Herbert Xu <herbert@gondor.apana.org.au>,
 "David S. Miller" <davem@davemloft.net>, Chen-Yu Tsai <wens@csie.org>,
 Jernej Skrabec <jernej.skrabec@gmail.com>,
 Samuel Holland <samuel@sholland.org>, Andre Przywara
 <andre.przywara@arm.com>, linux-crypto@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev,
 linux-kernel@vger.kernel.org
References: <20250623091009.65436-2-fourier.thomas@gmail.com>
Content-Language: en-US
From: Ovidiu Panait <ovidiu.panait.oss@gmail.com>
In-Reply-To: <20250623091009.65436-2-fourier.thomas@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250623_034219_684007_69CCBAC1 
X-CRM114-Status: GOOD (  17.71  )
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

Hi Thomas,

On 6/23/25 12:10 PM, Thomas Fourier wrote:
> The `dma_unmap_sg()` functions should be called with the same nents as the
> `dma_map_sg()`, not the value the map function returned.
> 

This should already be fixed by:
https://git.kernel.org/pub/scm/linux/kernel/git/herbert/cryptodev-2.6.git/commit/?id=b6cd3cfb5afe49952f8f6be947aeeca9ba0faebb

The sg nents are saved to request context during prepare() and then used
in unprepare().

Thanks,
Ovidiu

> Fixes: 0605fa0f7826 ("crypto: sun8i-ce - split into prepare/run/unprepare")
> Signed-off-by: Thomas Fourier <fourier.thomas@gmail.com>
> ---
>  drivers/crypto/allwinner/sun8i-ce/sun8i-ce-cipher.c | 12 ++++++------
>  1 file changed, 6 insertions(+), 6 deletions(-)
> 
> diff --git a/drivers/crypto/allwinner/sun8i-ce/sun8i-ce-cipher.c b/drivers/crypto/allwinner/sun8i-ce/sun8i-ce-cipher.c
> index f9cf00d690e2..ce9d071f5693 100644
> --- a/drivers/crypto/allwinner/sun8i-ce/sun8i-ce-cipher.c
> +++ b/drivers/crypto/allwinner/sun8i-ce/sun8i-ce-cipher.c
> @@ -326,8 +326,8 @@ static void sun8i_ce_cipher_unprepare(struct crypto_engine *engine,
>  	struct sun8i_ce_flow *chan;
>  	struct ce_task *cet;
>  	unsigned int ivsize, offset;
> -	int nr_sgs = rctx->nr_sgs;
> -	int nr_sgd = rctx->nr_sgd;
> +	int ns = sg_nents_for_len(areq->src, areq->cryptlen);
> +	int nd = sg_nents_for_len(areq->dst, areq->cryptlen);
>  	int flow;
>  
>  	flow = rctx->flow;
> @@ -336,11 +336,11 @@ static void sun8i_ce_cipher_unprepare(struct crypto_engine *engine,
>  	ivsize = crypto_skcipher_ivsize(tfm);
>  
>  	if (areq->src == areq->dst) {
> -		dma_unmap_sg(ce->dev, areq->src, nr_sgs, DMA_BIDIRECTIONAL);
> +		dma_unmap_sg(ce->dev, areq->src, ns, DMA_BIDIRECTIONAL);
>  	} else {
> -		if (nr_sgs > 0)
> -			dma_unmap_sg(ce->dev, areq->src, nr_sgs, DMA_TO_DEVICE);
> -		dma_unmap_sg(ce->dev, areq->dst, nr_sgd, DMA_FROM_DEVICE);
> +		if (rctx->nr_sgs > 0)
> +			dma_unmap_sg(ce->dev, areq->src, ns, DMA_TO_DEVICE);
> +		dma_unmap_sg(ce->dev, areq->dst, nd, DMA_FROM_DEVICE);
>  	}
>  
>  	if (areq->iv && ivsize > 0) {


