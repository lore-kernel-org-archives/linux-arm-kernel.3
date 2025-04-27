Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A6A61C369D1
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 27 Apr 2025 18:25:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=yUSiCMc3+HiLY3TDrmFMgC3VJtgyOzx1EV4C1MFAjrY=; b=uZAj7bThGNj21HtqwmDo04XA1Q
	C7Xi+pTqbPd9NZ9venUwlhIQ1VsTjPxt+3qYwJm7IGErp/poMOdaBgO7RxbOpTuoqd4tFfeRehkrd
	gzZ0St8iQYWrpYaXsd3+cYSb7O+KeOcT1gf3NVcG0vnuTC9dh+ih2aYVf8OW1cKGTKcy70A/2hx72
	+hZK0oKOzdpFZMh680LAUalneXs5Bxk4EIghAuzBfruFyygRkU8Cn95TNm8Hzk81iuqskislkBTrD
	ki5pAcGR9DMf1JnfFgH3X/UmF0UAJ9BvHqdmhZZp2zD4yMPHl8lL7pSybHnL2rtr1Icb85isHpCtM
	+q60cOEw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u96hE-00000003s05-1shz;
	Sun, 27 Apr 2025 18:25:44 +0000
Received: from mail-ed1-x52b.google.com ([2a00:1450:4864:20::52b])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u96fH-00000003ro9-3xtp
	for linux-arm-kernel@lists.infradead.org;
	Sun, 27 Apr 2025 18:23:45 +0000
Received: by mail-ed1-x52b.google.com with SMTP id 4fb4d7f45d1cf-5f4d6d6aaabso6377409a12.2
        for <linux-arm-kernel@lists.infradead.org>; Sun, 27 Apr 2025 11:23:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1745778222; x=1746383022; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=yUSiCMc3+HiLY3TDrmFMgC3VJtgyOzx1EV4C1MFAjrY=;
        b=C5N9kSaGuOzCX8bIgIFa5vD87mxvfQXzLCRccREXScWoHOZbaibqf9Rhv/SvN/nQeB
         AHghndNy5TzrL0LOMAX6KitvNFbTG4mCFjgFwUiWXP7cEJ1I708rve8JLCGl+ZNpOm7G
         ay5nSnvXqI84z4Qc+e7GdwU2ThqTmuGXRYDxBL19bfOWVJ6oSYuycNQ2wyLcUAObfR97
         36GPOsGXFAsF7JMlF9oYgW5yk4nmrPjwDq42s2EpqQdK2wRxyqqCAddUrXt1EK3g7nPU
         apff/Xww6Q8AiRgYVWBilhKA70zyP7g6rGSOyTOvsyRYjf8icmezXveAxOMGRnoOFsXY
         H0Ag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745778222; x=1746383022;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=yUSiCMc3+HiLY3TDrmFMgC3VJtgyOzx1EV4C1MFAjrY=;
        b=hjLvEFqanmTsR+WZYWUFhK9Bvas6D7nqjb8/JPquSYnCVDSHH4FNdQSW/VE9PavVcv
         wysabtv/lv7OQDeddak/jl8yOzXy2Kf8BmIlYkCD4K/7IQ12X1DIf+x+Y+A9crqoa+Y4
         vDkwvG4LEqEErqRDcrs2Q2nvCxlzKzdkuW6o6K38dcgTwWQZqHjZpj1m/0qzGRRHDqiJ
         Vofqyd8WdOSvNCogSngRU93xN9AjF6w/vh0nkWNBFq6hXYPOA28KbN3tSKKA+IaiKYcz
         furyrrNOQcb9CzqcSMWC+URqmf5szWYM91sarQlTblaskU9ra+9JjgI1jq8/pl++Bocs
         aaCA==
X-Gm-Message-State: AOJu0YwrBJl5ITqB+Oqjoi81iKDOgdmpRRWMbzKjZjxMYCq4WsjlPutE
	itBQ+vXVWt1XSKsZBydsEfmtsUeCSfl4q1AqvtN2UL9SAUwtORsukpioRQ==
X-Gm-Gg: ASbGncsioVU2/5NwbPpviw3fwIOV1gfkSCmUhLggoyTIAKpdQxg+nM8WUwurusSOZYx
	3XDw9qY5quDgQDyCZl/sSK1AUSlBTs3Rm5+piE5B4zmdwyJH+XWRtjGM3qv9cQDe/r4ErHFhFgX
	f3c141u0JDDUUIitsVcnY3vLEdcQVD6kYd5fBFnBH8QoCE8ZiirXGknLx0cmC/+i/urShtIIP73
	qggzQ11RpxUi8wufUCfN24sBQyTGUg64UoSmcxQG8kjJXaa4U71If/Dx0tLLRBjgAjtUZrKbh5b
	j1D1NefDbiUNeMbmVyX2v7eVUE0nzxpdq9b11Bd0hwO0IUIVKnL9hSXdhvucWuLLNQv9UXyoKhE
	N2FDmRucUGrvX0fVnMKyH3aDfdQTIgsEQ3SsW
X-Google-Smtp-Source: AGHT+IFvq46nAYQLC0nkEAA7EJrWLuZNcuxxB8BvzF8vxeFLFcLhIZ0aOQG+z7k46qu9zHJydkv9Kg==
X-Received: by 2002:a05:6402:5109:b0:5f3:26bb:8858 with SMTP id 4fb4d7f45d1cf-5f723a15496mr7817963a12.34.1745778221650;
        Sun, 27 Apr 2025 11:23:41 -0700 (PDT)
Received: from ?IPV6:2a02:2f0e:c50a:8800:cf9e:ee0b:4a01:37f6? ([2a02:2f0e:c50a:8800:cf9e:ee0b:4a01:37f6])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5f7038328f1sm4417391a12.70.2025.04.27.11.23.40
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 27 Apr 2025 11:23:41 -0700 (PDT)
Message-ID: <e147c220-92e1-40cb-920b-916cf6703b40@gmail.com>
Date: Sun, 27 Apr 2025 21:23:40 +0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RESEND] crypto: sun8i-ss: do not use sg_dma_len before
 calling DMA functions
To: Corentin Labbe <clabbe.montjoie@gmail.com>, herbert@gondor.apana.org.au,
 jernej.skrabec@gmail.com, samuel@sholland.org, wens@csie.org
Cc: linux-arm-kernel@lists.infradead.org, linux-crypto@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-sunxi@lists.linux.dev
References: <20250427111236.25668-1-clabbe.montjoie@gmail.com>
Content-Language: en-US
From: Ovidiu Panait <ovidiu.panait.oss@gmail.com>
In-Reply-To: <20250427111236.25668-1-clabbe.montjoie@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250427_112343_991052_3A88ADE8 
X-CRM114-Status: GOOD (  20.66  )
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

On 4/27/25 2:12 PM, Corentin Labbe wrote:
> When testing sun8i-ss with multi_v7_defconfig, all CBC algorithm fail crypto
> selftests.
> This is strange since on sunxi_defconfig, everything was ok.
> The problem was in the IV setup loop which never run because sg_dma_len
> was 0.
> 
> Fixes: 359e893e8af4 ("crypto: sun8i-ss - rework handling of IV")
> Signed-off-by: Corentin Labbe <clabbe.montjoie@gmail.com>
> ---
> 
> If someone know why sunxi_defconfig have sg_dma_len() which always works
> even with any DMA call not done.
> 

It seems that sunxi_defconfig has CONFIG_NEED_SG_DMA_LENGTH disabled, so
sg_dma_len() defaults to sg->length.

From include/linux/scatterlist.h:

/*
 * These macros should be used after a dma_map_sg call has been done
 * to get bus addresses of each of the SG entries and their lengths.
 * You should only work with the number of sg entries dma_map_sg
 * returns, or alternatively stop on the first sg_dma_len(sg) which
 * is 0.
 */
...
#ifdef CONFIG_NEED_SG_DMA_LENGTH
#define sg_dma_len(sg)		((sg)->dma_length)
#else
#define sg_dma_len(sg)		((sg)->length)
#endif


On the other hand, multi_v7_defconfig has CONFIG_NEED_SG_DMA_LENGTH
enabled, so sg_dma_len(sg) defaults to sg->dma_length and it would need
to be used after calling dma_map_sg() (as indicated in the comment from
include/linux/scatterlist.h).


Ovidiu

>  drivers/crypto/allwinner/sun8i-ss/sun8i-ss-cipher.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/crypto/allwinner/sun8i-ss/sun8i-ss-cipher.c b/drivers/crypto/allwinner/sun8i-ss/sun8i-ss-cipher.c
> index 4caf17310e90..ddec1b08d4f6 100644
> --- a/drivers/crypto/allwinner/sun8i-ss/sun8i-ss-cipher.c
> +++ b/drivers/crypto/allwinner/sun8i-ss/sun8i-ss-cipher.c
> @@ -141,7 +141,7 @@ static int sun8i_ss_setup_ivs(struct skcipher_request *areq)
>  
>  	/* we need to copy all IVs from source in case DMA is bi-directionnal */
>  	while (sg && len) {
> -		if (sg_dma_len(sg) == 0) {
> +		if (sg->length == 0) {
>  			sg = sg_next(sg);
>  			continue;
>  		}


