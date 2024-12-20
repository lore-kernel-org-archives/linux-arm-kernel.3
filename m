Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F368CE77188
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 20 Dec 2024 11:12:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:References:Cc:To:Subject:
	From:MIME-Version:Date:Message-ID:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=9Rv0UntN9peSVxfJzXiam0tq/DzIR6KqCCDtf23v9d4=; b=YsZkp1MYE+rqHrKlh/6XiN5PrI
	f2EhAMJ8ztKEiUlgxxsaIb291aoBxXiRWh+VtMkl3rBB+Ip4j/CJAarXZWIprchBJc00Sx/BizlFK
	x/AFAVTc5bSXOqnzHJEyASVZ8c/EUjPiwYXwmx6wwMZe//AswP900YiweFXXJXnhDuziBPYJvCWuD
	5RN7p+ZCvr0L+KUBklsJ+lf7HXbqlJHIhT5SMJJHKhnQl7N1w4elusDMl702ZHukczTvFUggBhcxl
	A9lXStohLxkWLm2ay6+OWa5J741wTeQH4gbCiI3npbEPXbM3N5N8Z7PEnnJx3wn6Gtjjkq94TH+Vo
	D4si3m2g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tOavl-00000004gJc-2CEm;
	Fri, 20 Dec 2024 11:12:29 +0000
Received: from mail-ej1-x62f.google.com ([2a00:1450:4864:20::62f])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tOaLx-00000004bk7-1p8Y
	for linux-arm-kernel@lists.infradead.org;
	Fri, 20 Dec 2024 10:35:30 +0000
Received: by mail-ej1-x62f.google.com with SMTP id a640c23a62f3a-aa67f31a858so307690266b.2
        for <linux-arm-kernel@lists.infradead.org>; Fri, 20 Dec 2024 02:35:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1734690928; x=1735295728; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to;
        bh=9Rv0UntN9peSVxfJzXiam0tq/DzIR6KqCCDtf23v9d4=;
        b=NUHcLYXqViA7X4WkppuvtR6QjufLL2DD1BWe4ryyPqcv5ui8Rc3pLd93eGiJf78g7C
         4EohxRodZl8nAKbQRTPLedDndW+JzyC2fRBUpNU0w7wh0WRYkBQOh3UeqalOWVZ0bsBW
         DynTgn5pH7+E3BUKeWWAJTQpYfc4KfBCm4Z/d1kSRdNOlLDvwFRZ1sX2DtfAKWhWRHFN
         KYz3ZLTV0n7+R4JubWjqCt1ts11mJ2T5KxUxZM/9G3DtY0/CC2/vY4d3WuSUWoPRs1+T
         PnyPrLBpFctQum3WQe8o5UX2Ik/1lVoWCfaeNOCxy1Y7DDs3DJnAdrl19uRnj2Wfv4Od
         5lQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734690928; x=1735295728;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=9Rv0UntN9peSVxfJzXiam0tq/DzIR6KqCCDtf23v9d4=;
        b=bffUAU46hqZl4aqyUBNbyX8f/20VngtEVe/N+lqIYnH+WJsZUfqWE3L0HNLPxPooao
         GGS1XATYVqb0coBU4+rOBf4jdSIeQ5JRdKdLN10rgrhJ/hiV72DDlTXfcCDMi3Sc7p9I
         pTFoo5coaQOJ3Qko4vsCGI0MYNZ3pg2qWNN7tzn6zREi0SojLdd4UxA28OZ6TgeVtvbt
         eCzeL5KxXOJSA1Ytx6yC86qL/++IWFaP7PhD3eroUWastRS45VQEvX/c1d6ry9yiwrbc
         1N0TwHL6PhJcN9v0FbDqrKXUCyprb5Nn8Woq96nARJIIbhpjf3WyMvoVjT27Zbf0J6AK
         q8mw==
X-Forwarded-Encrypted: i=1; AJvYcCWsdaw40S1G2aydab5sGJEddPCnGx0VMHWA+cT8jzlGQ0l+urKgesdCR8272TYs3f5abEb4mjEPEO0TsXQN0NGs@lists.infradead.org
X-Gm-Message-State: AOJu0YzlCbylhEmbEBVEacqci4D/7nbSjrAlR4n14cibj6eALr+8PWiM
	eEDXjzDVAaUpygvtJonhOLlkBfsy1gwTshKZ8C6HskwsabgedA/wEAwv/nsw0t4=
X-Gm-Gg: ASbGncuCqNnKJ6k3JCr6IMPxwNYHdaZZjJb2uKLA+uj4GGqzVpSPza2qleLwdz1aHS2
	/jFxpFhn987O1/CMrWJh85Ubk/zJZtRHxzl66re9+LNqRn58KdY8kG/dcPY7xRune5tVFkuq4m5
	Q93nxTaL+mYu3085fe8Se2G+RwJp+9hSwfRTDanPssWo4kaDZdPbk80siYkIj8sVKpaiq2jzurv
	rIRQtgpT2KxSHfhP5iap+0y61R9a0O1Kj8Nd4WF0XNsR++rb9WgOXb9WKuQvmEhgI6z
X-Google-Smtp-Source: AGHT+IFAtwJ+blPxyb/enh4drXznLmMhq3Xg9jY4Fyo3nuW5sg/0md1T6M+1jUSvQ7usw39sxgNTWg==
X-Received: by 2002:a17:907:809:b0:aa6:832b:8d71 with SMTP id a640c23a62f3a-aac270283bfmr169199266b.2.1734690927584;
        Fri, 20 Dec 2024 02:35:27 -0800 (PST)
Received: from [192.168.7.191] ([212.114.21.58])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-aac0e8953b6sm164516066b.65.2024.12.20.02.35.26
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 20 Dec 2024 02:35:26 -0800 (PST)
Message-ID: <72f222a9-32b4-479a-8307-4653bc99686d@linaro.org>
Date: Fri, 20 Dec 2024 11:35:25 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH 2/2] clk: amlogic: gxbb: drop non existing 32k clock
 parent
To: Jerome Brunet <jbrunet@baylibre.com>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
 <sboyd@kernel.org>, Kevin Hilman <khilman@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Cc: linux-amlogic@lists.infradead.org, linux-clk@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20241220-amlogic-clk-gxbb-32k-fixes-v1-0-baca56ecf2db@baylibre.com>
 <20241220-amlogic-clk-gxbb-32k-fixes-v1-2-baca56ecf2db@baylibre.com>
Content-Language: en-US, fr
Autocrypt: addr=neil.armstrong@linaro.org; keydata=
 xsBNBE1ZBs8BCAD78xVLsXPwV/2qQx2FaO/7mhWL0Qodw8UcQJnkrWmgTFRobtTWxuRx8WWP
 GTjuhvbleoQ5Cxjr+v+1ARGCH46MxFP5DwauzPekwJUD5QKZlaw/bURTLmS2id5wWi3lqVH4
 BVF2WzvGyyeV1o4RTCYDnZ9VLLylJ9bneEaIs/7cjCEbipGGFlfIML3sfqnIvMAxIMZrvcl9
 qPV2k+KQ7q+aXavU5W+yLNn7QtXUB530Zlk/d2ETgzQ5FLYYnUDAaRl+8JUTjc0CNOTpCeik
 80TZcE6f8M76Xa6yU8VcNko94Ck7iB4vj70q76P/J7kt98hklrr85/3NU3oti3nrIHmHABEB
 AAHNKk5laWwgQXJtc3Ryb25nIDxuZWlsLmFybXN0cm9uZ0BsaW5hcm8ub3JnPsLAkQQTAQoA
 OwIbIwULCQgHAwUVCgkICwUWAgMBAAIeAQIXgBYhBInsPQWERiF0UPIoSBaat7Gkz/iuBQJk
 Q5wSAhkBAAoJEBaat7Gkz/iuyhMIANiD94qDtUTJRfEW6GwXmtKWwl/mvqQtaTtZID2dos04
 YqBbshiJbejgVJjy+HODcNUIKBB3PSLaln4ltdsV73SBcwUNdzebfKspAQunCM22Mn6FBIxQ
 GizsMLcP/0FX4en9NaKGfK6ZdKK6kN1GR9YffMJd2P08EO8mHowmSRe/ExAODhAs9W7XXExw
 UNCY4pVJyRPpEhv373vvff60bHxc1k/FF9WaPscMt7hlkbFLUs85kHtQAmr8pV5Hy9ezsSRa
 GzJmiVclkPc2BY592IGBXRDQ38urXeM4nfhhvqA50b/nAEXc6FzqgXqDkEIwR66/Gbp0t3+r
 yQzpKRyQif3OwE0ETVkGzwEIALyKDN/OGURaHBVzwjgYq+ZtifvekdrSNl8TIDH8g1xicBYp
 QTbPn6bbSZbdvfeQPNCcD4/EhXZuhQXMcoJsQQQnO4vwVULmPGgtGf8PVc7dxKOeta+qUh6+
 SRh3vIcAUFHDT3f/Zdspz+e2E0hPV2hiSvICLk11qO6cyJE13zeNFoeY3ggrKY+IzbFomIZY
 4yG6xI99NIPEVE9lNBXBKIlewIyVlkOaYvJWSV+p5gdJXOvScNN1epm5YHmf9aE2ZjnqZGoM
 Mtsyw18YoX9BqMFInxqYQQ3j/HpVgTSvmo5ea5qQDDUaCsaTf8UeDcwYOtgI8iL4oHcsGtUX
 oUk33HEAEQEAAcLAXwQYAQIACQUCTVkGzwIbDAAKCRAWmrexpM/4rrXiB/sGbkQ6itMrAIfn
 M7IbRuiSZS1unlySUVYu3SD6YBYnNi3G5EpbwfBNuT3H8//rVvtOFK4OD8cRYkxXRQmTvqa3
 3eDIHu/zr1HMKErm+2SD6PO9umRef8V82o2oaCLvf4WeIssFjwB0b6a12opuRP7yo3E3gTCS
 KmbUuLv1CtxKQF+fUV1cVaTPMyT25Od+RC1K+iOR0F54oUJvJeq7fUzbn/KdlhA8XPGzwGRy
 4zcsPWvwnXgfe5tk680fEKZVwOZKIEuJC3v+/yZpQzDvGYJvbyix0lHnrCzq43WefRHI5XTT
 QbM0WUIBIcGmq38+OgUsMYu4NzLu7uZFAcmp6h8g
Organization: Linaro
In-Reply-To: <20241220-amlogic-clk-gxbb-32k-fixes-v1-2-baca56ecf2db@baylibre.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241220_023529_481479_49587F9A 
X-CRM114-Status: GOOD (  22.33  )
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
Reply-To: neil.armstrong@linaro.org
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

On 20/12/2024 11:25, Jerome Brunet wrote:
> The 32k clock reference a parent 'cts_slow_oscin' with a fixme note saying
> that this clock should be provided by AO controller.
> 
> The HW probably has this clock but it does not exist at the moment in
> any controller implementation. Furthermore, referencing clock by the global
> name should be avoided whenever possible.
> 
> There is no reason to keep this hack around, at least for now.
> 
> Fixes: 14c735c8e308 ("clk: meson-gxbb: Add EE 32K Clock for CEC")
> Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>
> ---
>   drivers/clk/meson/gxbb.c | 12 ++++++------
>   1 file changed, 6 insertions(+), 6 deletions(-)
> 
> diff --git a/drivers/clk/meson/gxbb.c b/drivers/clk/meson/gxbb.c
> index 62494cf06e7d775bdb18b2242c3d45bf246bdd0e..66f299f6fef1442ead5e978c1d3750b55b800c2e 100644
> --- a/drivers/clk/meson/gxbb.c
> +++ b/drivers/clk/meson/gxbb.c
> @@ -1266,14 +1266,13 @@ static struct clk_regmap gxbb_cts_i958 = {
>   	},
>   };
>   
> +/*
> + * This table skips a clock named 'cts_slow_oscin' in the documentation
> + * This clock does not exist yet in this controller or the AO one
> + */
> +static u32 gxbb_32k_clk_parents_val_table[] = { 0, 2, 3 };
>   static const struct clk_parent_data gxbb_32k_clk_parent_data[] = {
>   	{ .fw_name = "xtal", },
> -	/*
> -	 * FIXME: This clock is provided by the ao clock controller but the
> -	 * clock is not yet part of the binding of this controller, so string
> -	 * name must be use to set this parent.
> -	 */
> -	{ .name = "cts_slow_oscin", .index = -1 },
>   	{ .hw = &gxbb_fclk_div3.hw },
>   	{ .hw = &gxbb_fclk_div5.hw },
>   };
> @@ -1283,6 +1282,7 @@ static struct clk_regmap gxbb_32k_clk_sel = {
>   		.offset = HHI_32K_CLK_CNTL,
>   		.mask = 0x3,
>   		.shift = 16,
> +		.table = gxbb_32k_clk_parents_val_table,
>   		},
>   	.hw.init = &(struct clk_init_data){
>   		.name = "32k_clk_sel",
> 

I guess it's for using alternate 32k clk source from the GPIOAO_6/CLK_32K_IN,
but AFAIK no boards never used that so we can't even test it...

Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>

