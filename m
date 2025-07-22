Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DFF33C83F25
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 22 Jul 2025 10:14:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:References:Cc:To:Subject:
	From:MIME-Version:Date:Message-ID:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=8p5LfuSX/Mmlw4uTxhLrmQy+4Ez8VbT/jSY03w1rUEM=; b=Fj+NVRanCi8SW9qOar3/MJEpEf
	R8duOsRHeIA/lc0kfPgTd7Fy/W5SpGdc836ddkhCj/ZCjdIWB1c1tp6CZBYZ+qnA79eoocceaZR4/
	TDNIxG6z5fZ+npYYHZhFymKQ7DIV1z3KYgzgSN+1sLiIGdWWwVsuT5sNNwh2r2YNL7v7zy/4xjToB
	/H3ady5mCmyqZazKneeeTYcnJe9/qqKlFC/ytlqYKDjEaUEuiZvqB/6DZCkVNrxHHhl8vdkpT15qn
	NfKPDlTonfcZwL4sGUIEl3FSVVtG8ambwopT48A0Hi9orkIxaw0069zchaGTrYSEONN8FQ3CbE06L
	Bwjf6bRg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ueA1A-000000028Ci-31pC;
	Tue, 22 Jul 2025 10:14:40 +0000
Received: from mail-wm1-x329.google.com ([2a00:1450:4864:20::329])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ue9qy-00000002608-3BKt
	for linux-arm-kernel@lists.infradead.org;
	Tue, 22 Jul 2025 10:04:10 +0000
Received: by mail-wm1-x329.google.com with SMTP id 5b1f17b1804b1-455b00339c8so37760565e9.3
        for <linux-arm-kernel@lists.infradead.org>; Tue, 22 Jul 2025 03:04:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1753178647; x=1753783447; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to;
        bh=8p5LfuSX/Mmlw4uTxhLrmQy+4Ez8VbT/jSY03w1rUEM=;
        b=x5gqhj3vcHCwpAAvZn0hYZpbVXaelUeUWkrMiSh/71+o2Rwm+r1LXwZvjUWzbHE6il
         nXZNgyv+tw69esLnVJa9aeibQqJ/UYhLk71wqczs03quz86ZKCnWb/rG3stpV04O5UN2
         KX0HHhzvILxNKZDjKnKsXGo//160hu62MYnMd4LIMDL8yjXCXUYgfYU5tPWwJEvy9lxA
         0iTUolG/+uHbZMgRjeVPUGOi7xQfcOpsvAVKWgy6NEtZjapmX79UtYx0Fxtmn3xe/mZp
         94eYj5prnsknPyUqbLno6WWJ1nBRY9wGdUZdnT8bzlOIx/DWgo7cclJ48zcDq/PkbE+P
         62VQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753178647; x=1753783447;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=8p5LfuSX/Mmlw4uTxhLrmQy+4Ez8VbT/jSY03w1rUEM=;
        b=CIvAuq/sUWWaWrZdMWSD2OSnqHGXKGTOuLA05ndvFFKavNxiwnziZUJGUrl/FQZDhV
         lVfLno9p5WIb34d1FkloTUSzfkEh8kkBzx07yedZ0QxaObKQ+6NP52fSMMsEmuV8JrK1
         9QgkTnAFDPPhSdPcQ2DjbnTlCWxD3j+wpmnU18VMkukYmlWvUm5VZJfVYAWKNmmbfEP7
         fQUzB3guFoiANOiAmnIaRdSc3FFYAGP30UAJBzIc61SNefVAeF6I1SzPYMtfAT5A4l2o
         e2vbcpssPP73SlyKx84aAiacpXvPlVIKEiau034ikAYYQKTvISso+h1SRNdXGrT2WA47
         tBYQ==
X-Gm-Message-State: AOJu0YzhMgXiDMHajz8Q4EP8uOxkLyKLML87/inaK1aXjzsY8ryRNgaC
	G7yKFTpU4oZtUhOfaZ5cCazNHp7DI5RMdZ51AggX5/PFSObs0J+Mv6rs2hT+yfsmyMs=
X-Gm-Gg: ASbGncsuvzXkp5T6zK3N7pIg2ea8kVnxTVHtgXRvnS/JHT+lkbdJqnN9A7cz24DP6Ig
	XnUZSua+p/hJ0SCriYHn36tzbjMOYM95QPx6mF0hUrEUE14Rx4fQqWEkEYUNAIggnLAX6uCH15L
	zreMdw/x4AvueMmZjFBQCvjI+ZvD9QQX6LF0ND38nf6jD1xZsS4t/5PD3D2BITRoPTaO2/JiFNC
	oi2YCvYOStmiB39RPa6UG6pIbkONNwxWSKT5aREEgSDPgIlYz4RqblP5kaR5vJaQt3ylxcsidCp
	p+VJJj3lEBX+o65H5/yzLPTykGb0Jp5I87dnVtdPxsDInCXzbC/nvyffApOKV9o0pabin+AOP47
	5o/riETeo5y9bN3oa4UyJJT32ZGOIsUEUbCkTLXsMJFg3peddFxU+qfOKbtNn56M86cOjtAcllY
	8=
X-Google-Smtp-Source: AGHT+IH5isWZZMV6lAZUl2wzToF7WffjH1cxA2l1CmGXi9Cw3lTE/r5VaLV4Z3CfBiDjNOhMbKQDEg==
X-Received: by 2002:a05:600c:4e03:b0:456:8eb:a35c with SMTP id 5b1f17b1804b1-4562e38b16emr259056935e9.31.1753178647077;
        Tue, 22 Jul 2025 03:04:07 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:3d9:2080:bce4:725d:6922:d1ba? ([2a01:e0a:3d9:2080:bce4:725d:6922:d1ba])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3b75baa6f78sm6114413f8f.3.2025.07.22.03.04.06
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 22 Jul 2025 03:04:06 -0700 (PDT)
Message-ID: <3bc3e7f9-ef8f-4d09-8da8-c965540f624c@linaro.org>
Date: Tue, 22 Jul 2025 12:04:06 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH v2] soc: amlogic: clk-measure: Optimize measurement
 accuracy
To: chuan.liu@amlogic.com, Kevin Hilman <khilman@baylibre.com>,
 Jerome Brunet <jbrunet@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org,
 linux-kernel@vger.kernel.org
References: <20250722-optimize_clk-measure_accuracy-v2-1-cb121fd57e6d@amlogic.com>
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
In-Reply-To: <20250722-optimize_clk-measure_accuracy-v2-1-cb121fd57e6d@amlogic.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250722_030408_804079_6874C17C 
X-CRM114-Status: GOOD (  23.94  )
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
Reply-To: Neil Armstrong <neil.armstrong@linaro.org>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

Hi,

On 22/07/2025 08:06, Chuan Liu via B4 Relay wrote:
> From: Chuan Liu <chuan.liu@amlogic.com>
> 
> The cycle count register has a 20-bit effective width, but the driver
> only utilizes 16 bits. This reduces the sampling window when measuring
> high-frequency clocks, resulting in (slightly) degraded measurement
> accuracy.
> 
> The input clock signal path from gate (Controlled by MSR_RUN) to internal
> sampling circuit in clk-measure has a propagation delay requirement: 24
> clock cycles must elapse after mux selection before sampling.
> 
> The measurement circuit employs single-edge sampling for clock frequency
> detection, resulting in a ±1 cycle count error within the measurement window.
> 
> +1 cycle: 3 rising edges captured in 2-cycle measurement window.
>      __    __    __
>   __↑  |__↑  |__↑  |__
>    ^             ^
> 
> -1 cycle: 2 rising edges captured in 3-cycle measurement window.
>      __    __    __
>   __↑  |__↑  |__↑  |__↑
>      ^               ^
> 
> Change-Id: If367c013fe2a8d0c8f5f06888bb8f30a1e46b927

Please drop Change-Id

> Signed-off-by: Chuan Liu <chuan.liu@amlogic.com>
> ---
> Improve measurement accuracy by increasing the bit width of the cycle
> counter register and adding delay during measurement.
> 
> The 800μs delay between enabling the input clock gate and activating
> sampling is determined by the minimum sampling frequency of 30kHz (the
> lowest commonly used frequency in applications is 32.768kHz).
> 
> Here are the test comparisons based on C3:
> 
> Pre-optimization:
> cat /sys/kernel/debug/meson-clk-msr/measure_summary
>    clock                     rate    precision
> ---------------------------------------------
>   sys_clk               166664063    +/-5208Hz
>   axi_clk               499968750    +/-15625Hz
>   rtc_clk                23982813    +/-3125Hz
>   p20_usb2_ckout        479968750    +/-15625Hz
>   eth_mpll_test         499992188    +/-15625Hz
>   sys_pll              1919875000    +/-62500Hz
>   cpu_clk_div16         119998162    +/-3676Hz
>   ts_pll                        0    +/-3125Hz
>   fclk_div2             999843750    +/-31250Hz
>   fclk_div2p5           799953125    +/-31250Hz
>   fclk_div3             666625000    +/-20833Hz
>   fclk_div4             499914063    +/-15625Hz
>   fclk_div5             399987500    +/-12500Hz
>   fclk_div7             285709821    +/-8928Hz
>   fclk_50m               49982813    +/-3125Hz
>   sys_oscin32k_i            26563    +/-3125Hz
> 
> Post-optimization:
> cat /sys/kernel/debug/meson-clk-msr/measure_summary
>    clock                     rate    precision
> ---------------------------------------------
>   sys_clk               166665625    +/-1562Hz
>   axi_clk               499996875    +/-1562Hz
>   rtc_clk                24000000    +/-1562Hz
>   p20_usb2_ckout        479996875    +/-1562Hz
>   eth_mpll_test         499996875    +/-1562Hz
>   sys_pll              1919987132    +/-1838Hz
>   cpu_clk_div16         119998438    +/-1562Hz
>   ts_pll                        0    +/-1562Hz
>   fclk_div2             999993750    +/-1562Hz
>   fclk_div2p5           799995313    +/-1562Hz
>   fclk_div3             666656250    +/-1562Hz
>   fclk_div4             499996875    +/-1562Hz
>   fclk_div5             399993750    +/-1562Hz
>   fclk_div7             285712500    +/-1562Hz
>   fclk_50m               49998438    +/-1562Hz
>   sys_oscin32k_i            32813    +/-1562Hz
> ---
> Changes in v2:
> - Change "HACK" in comments to "NOTE" according to Martin's suggestion.
> - Link to v1: https://lore.kernel.org/r/20250717-optimize_clk-measure_accuracy-v1-1-3b82d7ccd743@amlogic.com
> ---
>   drivers/soc/amlogic/meson-clk-measure.c | 27 ++++++++++++++++++---------
>   1 file changed, 18 insertions(+), 9 deletions(-)
> 
> diff --git a/drivers/soc/amlogic/meson-clk-measure.c b/drivers/soc/amlogic/meson-clk-measure.c
> index d862e30a244e..df395e015f26 100644
> --- a/drivers/soc/amlogic/meson-clk-measure.c
> +++ b/drivers/soc/amlogic/meson-clk-measure.c
> @@ -22,7 +22,7 @@ static DEFINE_MUTEX(measure_lock);
>   #define MSR_CLK_SRC		GENMASK(26, 20)
>   #define MSR_BUSY		BIT(31)
>   
> -#define MSR_VAL_MASK		GENMASK(15, 0)
> +#define MSR_VAL_MASK		GENMASK(19, 0)
>   
>   #define DIV_MIN			32
>   #define DIV_STEP		32
> @@ -805,14 +805,23 @@ static int meson_measure_id(struct meson_msr_id *clk_msr_id,
>   	regmap_update_bits(priv->regmap, reg->freq_ctrl, MSR_DURATION,
>   			   FIELD_PREP(MSR_DURATION, duration - 1));
>   
> -	/* Set ID */
> -	regmap_update_bits(priv->regmap, reg->freq_ctrl, MSR_CLK_SRC,
> -			   FIELD_PREP(MSR_CLK_SRC, clk_msr_id->id));
> +	/* Set the clock channel ID and enable the input clock gate. */
> +	regmap_update_bits(priv->regmap, reg->freq_ctrl, MSR_CLK_SRC | MSR_RUN,
> +			   FIELD_PREP(MSR_CLK_SRC, clk_msr_id->id) | MSR_RUN);
>   
> -	/* Enable & Start */
> -	regmap_update_bits(priv->regmap, reg->freq_ctrl,
> -			   MSR_RUN | MSR_ENABLE,
> -			   MSR_RUN | MSR_ENABLE);
> +	/*
> +	 * NOTE: The input clock signal path from gate (Controlled by MSR_RUN)
> +	 * to internal sampling circuit in clk-measure has a propagation delay
> +	 * requirement: 24 clock cycles must elapse after mux selection before
> +	 * sampling.
> +	 *
> +	 * For a 30kHz measurement clock, this translates to an 800μs delay:
> +	 * 800us = 24 / 30000Hz.
> +	 */
> +	fsleep(800);
> +
> +	/* Enable the internal sampling circuit and start clock measurement. */
> +	regmap_update_bits(priv->regmap, reg->freq_ctrl, MSR_ENABLE, MSR_ENABLE);
>   
>   	ret = regmap_read_poll_timeout(priv->regmap, reg->freq_ctrl,
>   				       val, !(val & MSR_BUSY), 10, 10000);
> @@ -846,7 +855,7 @@ static int meson_measure_best_id(struct meson_msr_id *clk_msr_id,
>   	do {
>   		ret = meson_measure_id(clk_msr_id, duration);
>   		if (ret >= 0)
> -			*precision = (2 * 1000000) / duration;
> +			*precision = 1000000 / duration;
>   		else
>   			duration -= DIV_STEP;
>   	} while (duration >= DIV_MIN && ret == -EINVAL);
> 
> ---
> base-commit: 58abdca0eb653c1a2e755ba9ba406ee475d87636
> change-id: 20250523-optimize_clk-measure_accuracy-9e16ee346dd2
> 
> Best regards,


Thanks a lot for this great work, please send a v3 without the Change-Id and add my:
Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>

Neil


