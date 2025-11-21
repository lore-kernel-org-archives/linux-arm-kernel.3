Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9DACFCFA761
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 21 Nov 2025 09:26:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=KDp2iG5BTBVt/GPrCjnqeO98ZCL9PVStlkdxlxkQjj0=; b=oSMiz3UGKXPbN2yuUSzIlBnjrB
	Urcw9j2EFcotdILAPS/qyqiWM2Cu5lIrierJiXxX3IucxBm6uZO1FzvjcmyEL7A0iwJEAgudW4mp9
	I+eN45YK9XiIZvZ7m8ro8HiVopalbCAUvZgsTHVZC60VhRp0aX72RpKucnc35fkVmLjv80ICGl6QY
	4ks4Qf4PpmUGKyIWpKGT/3+kzNKDGn07C9Pxo/gbGLkTDmSA+S7dmJcs0CMCYeryugq3+5tGLcmaI
	gmFkdF3bdqGOFqKIG8x/NELzgC55ZnpUzdkblo+119ftB76v2EbZ14dnJ40YH+hvsr011oOeRQTj2
	qi75gqpg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vMNPo-000000089RT-420H;
	Fri, 21 Nov 2025 09:26:52 +0000
Received: from mail-wm1-x335.google.com ([2a00:1450:4864:20::335])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vMNPn-000000089Qp-28NW
	for linux-arm-kernel@lists.infradead.org;
	Fri, 21 Nov 2025 09:26:52 +0000
Received: by mail-wm1-x335.google.com with SMTP id 5b1f17b1804b1-477a1c28778so20409835e9.3
        for <linux-arm-kernel@lists.infradead.org>; Fri, 21 Nov 2025 01:26:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1763717210; x=1764322010; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=KDp2iG5BTBVt/GPrCjnqeO98ZCL9PVStlkdxlxkQjj0=;
        b=jZ5UcCClOm53WO3/UgQQ4vRd6bu89jUXAfKosGiyN4uWMhQQ+FBNjs5iFK/Ur2IpQ5
         abZRL/47KBF2YFdqXaqHsGLZDJV5Z340LNenygfGbBkVRFYxIszxpTinTj01RJ4CosW8
         3YY+hTC7wmzaEOtCJtsAP/VHpLmLEGfjwdimaqNBdW4fd4U5sgIVi6tt/e4BP4IXw3yq
         WtJL0UCOvFGP/jJf5C+pSRYv+EY3dTPPLnR+/bnBsrJX9RbnP0wZXHzxEHPjbNrZGVOI
         hz8yaO3XdosdappNdeDV7XlR3FyDy3MfUtpE+ewQ5QujvHFvP06guR00/rJQNqO/oJzk
         HNRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763717210; x=1764322010;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=KDp2iG5BTBVt/GPrCjnqeO98ZCL9PVStlkdxlxkQjj0=;
        b=WM0oIWENPzdqq/wMc4yITk2jL2o65XZnLMLGg0SB7xXhTz5hdo1FPdlJTVtoaaK4l7
         GdTLvWENdz3CPXzmMlVxK0bqYVy3pp7t89AbCthKWln4LBzv1XM1ISjeu88MIv6xcY12
         5+oXvJmg3HtbyNjSwf5Jium+K1V13N5/Il6bhuAGOc+euggV51A6HVV5CSkt/0LuB5U/
         LbuSF5dDqnAcLRplNKgBZtzmTq54UN5F7tidmbGyH3o60l5NH3htxtX2kXq01D+2gCMK
         z1YtEYNXK15YuXgH0gb13Fk1RvJoF5tZt+8drTIyNHL8WMxTP3n3tUFfFWN2oVs45mIg
         Fqlw==
X-Forwarded-Encrypted: i=1; AJvYcCVuoVFBGxYzsq3nYBnEtOYAL2be51zV1mmBqVEwH20q5tgZXIvr1ZbZPWWSZWh9xvqoudvSTdNdslSnnEYwb912@lists.infradead.org
X-Gm-Message-State: AOJu0YzMpduFFM59sn3ehmea9crHjeCSdgzMndiy+ZEYpJ3nR7h3LXm0
	D0uHS8Nd1oLB9feIONtYtgvABaORI1/stUQFEuXwzlk9mrKq3lD2bkic4aOFZHMKDGw=
X-Gm-Gg: ASbGncvtH8T0l1qj2oyEfJ50NwE9yQToLRRowpaYxw85XbgqB9Jlo3OmYiT42xt7daK
	rB1i+pivGjP0I6fy/u0MrUEQsZ+4w9YI/6EWFfWdF5jNp0J+V1AlLcamSsWJXYsawA50lKkSz0T
	d4lPHXtXvPzK1B8HD3zIZWlgggGjBIoN22fpka8W9nrfxcJRfBvQeUIXShQDyjk7GLUg/RIpf9n
	kbPlTqOiw9UrYOODvx3KgcJ6w6/i5T/3/09mJNU5G7ckVSk4wNNEeTHAv3wG7SXfyFTKydHiN6J
	cdvLCHDwGQ5robXLjVmJB53kekQJs7FhiSuzBS0ot2fCAgcc4P3R2DN/wGG7A2aPgqdatMrB4Dx
	74qWLQZpV93k58jcBedp13r8gjabFMQ5yDTTO6/xHDWxD7StACx8toEQzFFyriwnO7V+SFsTyLP
	7Lr0ZccgTznJZiHg9PSQ==
X-Google-Smtp-Source: AGHT+IFFoQKN4lvZpPcX6YcwQEY2oYp+D9yrpDQzITsjrjlHpyL9s6Wn+65FnIuxFxbiNVzQkT63aA==
X-Received: by 2002:a05:600c:3b09:b0:46e:6d5f:f68 with SMTP id 5b1f17b1804b1-477c0185b65mr19721245e9.12.1763717209146;
        Fri, 21 Nov 2025 01:26:49 -0800 (PST)
Received: from [192.168.0.39] ([82.76.24.202])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-477bf3b4fafsm34690175e9.14.2025.11.21.01.26.48
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 21 Nov 2025 01:26:48 -0800 (PST)
Message-ID: <e7f489db-e04f-4e45-b331-51666b244a69@linaro.org>
Date: Fri, 21 Nov 2025 11:26:47 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/4] dmaengine: stm32-dma3: use module_platform_driver
To: Amelie Delaunay <amelie.delaunay@foss.st.com>,
 Vinod Koul <vkoul@kernel.org>, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>
Cc: dmaengine@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20251103-dma3_improv-v1-0-57f048bf2877@foss.st.com>
 <20251103-dma3_improv-v1-1-57f048bf2877@foss.st.com>
From: Eugen Hristev <eugen.hristev@linaro.org>
Content-Language: en-US
In-Reply-To: <20251103-dma3_improv-v1-1-57f048bf2877@foss.st.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251121_012651_565042_B255E435 
X-CRM114-Status: GOOD (  14.28  )
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



On 11/3/25 12:15, Amelie Delaunay wrote:
> Without module_platform_driver(), stm32-dma3 doesn't have a
> module_exit procedure. Once stm32-dma3 module is inserted, it
> can't be removed, marked busy.
> Use module_platform_driver() instead of subsys_initcall() to register
> (insmod) and unregister (rmmod) stm32-dma3 driver.
> 
> Signed-off-by: Amelie Delaunay <amelie.delaunay@foss.st.com>

Reviewed-by: Eugen Hristev <eugen.hristev@linaro.org>

> ---
>  drivers/dma/stm32/stm32-dma3.c | 7 +------
>  1 file changed, 1 insertion(+), 6 deletions(-)
> 
> diff --git a/drivers/dma/stm32/stm32-dma3.c b/drivers/dma/stm32/stm32-dma3.c
> index 50e7106c5cb7..9500164c8f68 100644
> --- a/drivers/dma/stm32/stm32-dma3.c
> +++ b/drivers/dma/stm32/stm32-dma3.c
> @@ -1914,12 +1914,7 @@ static struct platform_driver stm32_dma3_driver = {
>  	},
>  };
>  
> -static int __init stm32_dma3_init(void)
> -{
> -	return platform_driver_register(&stm32_dma3_driver);
> -}
> -
> -subsys_initcall(stm32_dma3_init);
> +module_platform_driver(stm32_dma3_driver);
>  
>  MODULE_DESCRIPTION("STM32 DMA3 controller driver");
>  MODULE_AUTHOR("Amelie Delaunay <amelie.delaunay@foss.st.com>");
> 


