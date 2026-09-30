Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D46FCCA5FC7
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 30 Sep 2026 15:12:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=OSdmhz6QeIhKCNCrOk2rawQmJp3h2Ms8iDYvSFt+tko=; b=M1IXfZosHrxsZz1SyfEGgIcsIX
	NageqhIKByMC0AJDW+tT2yRRpTG/ev+zK8aemFveNMrta/MxEkWugAfMBYPdBK0T/YNj0UMqCy85D
	yA0Tal9hMu+zRhelMggN+2y4O4y+jD589v86IubDvg6lomhG7XwBLzT847KvhTeMM+ixGDURLE+Id
	FbRb1AfIh/Z8Cbs01Aull5t/Cm1ksChUraHE3Lsa+VPPYJNTtNHWie14dy8fUaz0TSi0u4Vb+zGrj
	LLbzsfQRWBNK6Xb0S5bGXScgfhJ94YuvnfnnT+VS9wuLnmapWTzNap3i+dJsUesqX9nK950/n186i
	6PL6K6hQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBvzJ-00000006Rlx-3Bls;
	Wed, 30 Sep 2026 15:12:53 +0000
Received: from mail-wm2-x11.google.com ([2a00:1450:4864:31::11])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBvzI-00000006Rk0-09IK
	for linux-arm-kernel@lists.infradead.org;
	Wed, 30 Sep 2026 15:12:53 +0000
Received: by mail-wm2-x11.google.com with SMTP id 5b1f17b1804b1-49ff9642c57so9768075e9.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 30 Sep 2026 08:12:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790781170; x=1791385970; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=OSdmhz6QeIhKCNCrOk2rawQmJp3h2Ms8iDYvSFt+tko=;
        b=fIm654Z05HmkKK3qgzAtMPNhMHSFlPZnfWFMZoL+bLPt14vdbf2gtp3WH04KYrSyxE
         h2htyoJxOaLsfKewxOg8AWA6XGehDtPhck6isiM41Tm9MrHR/EXhZKFdJgiSIesap9oW
         3YyUQA237zvtPKhIv0qF0BuuL2Fuhvubk1lEbsUlk4qvk3sQrPTSR91VDgpiH4+GPyuI
         uHcA6kzw4U1LYucVtRBVOVD1uEtNFmFMy0LKqxPDIRE8VagC8SSOSJK6xshTSL88bW4/
         7xTjubpG3piLrfd9Mr1fHvOAZtvQReRNPecK1NbmQ7V0uCzRYgOecsNvjvq4VKZrWN2C
         nFqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790781170; x=1791385970;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=OSdmhz6QeIhKCNCrOk2rawQmJp3h2Ms8iDYvSFt+tko=;
        b=MCOALxM50QhIuHsyKLwIr+GKnc0ZD+dThBN16rZDJkEAscjX/xyicgtnhMMKWtUcWv
         qAsrtOVK0usBuAaGmDuV0QTD5NajtxUcgtBRDQUAJ1sUMx6S6qncxof2l0TJc8C1OUZ+
         7LFCKgYaTo6lMwFf4v2rHxtG7y0ehBB9hNOYQF8l47zjc7ma2438chQvSdtjw/YGSUJt
         lGeb57GxQBHvkUsSGyPjd7LRtJQmTujDNE0VEffGP1hoD/0asLFBwU5f5WwyyqawToQG
         NfY+mebdf2jBGqk7OVEumkcdaMNMJ1AKySZJCIKy8x10Wk9Lyf2KjUBXTZ5o/SBpw3WY
         r1aA==
X-Forwarded-Encrypted: i=1; AKwUvBxWgoYPpE+k/xcxs3E3uuxdB8IUfZLKfWOPRk0m388C1thNyxpavEKBibXWl7ehSqVTC5X5UfihEmUCzQSJwFm0@lists.infradead.org
X-Gm-Message-State: AFuF++kniRtqJRuJBBAcNqx/JwP5TUfkCGbky77JjWbSS+jdSG535nj2
	MC2pS4oB70mZEQJfacxKBbD3qVa+dvUQkCRwoQgtdfbUJXAFUkQT0WTP
X-Gm-Gg: AYBFou2zUojfndEka6QqQOeo6XZvtBMuN4edQpEevo8v6qyjjU4WKYTHCaqrrriatJS
	1vtNgPFcaYwr3FKZ2rq578vf3xFT9EV19BcP0SxwXJDoWq5pL26XWTFmeDDWcZLIesJTeNUkFuX
	lLp4/vev6xNFVa7/cXtQdtBC9XI7P3X6iPGrtdWL+HxkDvkLzoAi4QYUWQ1egNV4QcY7Bf4Lc3p
	dKYdlRVv5K3KbI4XswjoWqOGMOO1fKquQUJ/hzGLvEK8cdyz9eO66UfFPweEJ1Jx+tKVCLGiLCG
	hp0Rzbk37160Vp9yFX/gG27uWWRaaJc82RUS5LhuH7//IAwJ+VDT++PcUUxallaNSouYCA4UTtu
	I65baKSe01OD1nd1rGNJrqomlDOjXIasHcjxywKBMAqbBwX776uZ10++V2MKVDHbJt4FKNb+rHO
	InP01TkkIrqJRl+V/2JsT97Hq4DA4kDKJxgKgFI/9yo2GLlosFYg3xqplyhuBtJjDeHKMGGT+3U
	UIgbkUenZb+BefvYeYbWJ7LY1KA04+cLynicnxOz47BGoq/YeVAju1qkKqrhfg16rGz8LO59l4Q
	mJYMHqy4GmFOA2tSWPMTWj3jkfVMWqEofxD8u1z1E+ROZOGV+p7mb17WzxwIYBGPYwvSdGfvKQO
	p0wLOhqVouHRbgd+8wXcEb5EZOXG0KRh3qQziVVl2QkuhsCENR1FcrcB5tLAEasI9OiOTclwvpy
	F3V+La
X-Received: by 2002:a05:600c:5391:b0:4a0:34a:588c with SMTP id 5b1f17b1804b1-4a01b1ba781mr26714605e9.14.1790781169765;
        Wed, 30 Sep 2026 08:12:49 -0700 (PDT)
Received: from localhost (90-182-112-124.rcp.o2.cz. [90.182.112.124])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a01ccd1566sm18147705e9.2.2026.09.30.08.12.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 30 Sep 2026 08:12:49 -0700 (PDT)
Date: Wed, 30 Sep 2026 17:12:48 +0200
From: Joshua Crofts <joshua.crofts1@gmail.com>
To: Fabrice Gasnier <fabrice.gasnier@foss.st.com>
Cc: Jonathan Cameron <jic23@kernel.org>, David Lechner
 <dlechner@baylibre.com>, Nuno =?ISO-8859-1?Q?S=E1?= <nuno.sa@analog.com>,
 "Andy Shevchenko" <andy@kernel.org>, Rob Herring <robh@kernel.org>,
 "Krzysztof Kozlowski" <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, "Maxime Coquelin" <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>, Marek Vasut
 <marex@nabladev.com>, <linux-iio@vger.kernel.org>,
 <devicetree@vger.kernel.org>, <linux-stm32@st-md-mailman.stormreply.com>,
 <linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
 Cheick Traore <cheick.traore-ext@st.com>, Olivier Moysan
 <olivier.moysan@foss.st.com>
Subject: Re: [PATCH v3 09/15] iio: adc: stm32-adc: add support for stm32mp23
Message-ID: <20260930171248.00004562@gmail.com>
In-Reply-To: <20260930-adc-stm32mp25-v1-v3-9-406834430d72@foss.st.com>
References: <20260930-adc-stm32mp25-v1-v3-0-406834430d72@foss.st.com>
	<20260930-adc-stm32mp25-v1-v3-9-406834430d72@foss.st.com>
X-Mailer: Claws Mail 4.4.0 (GTK 3.24.51; x86_64-w64-mingw32)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260930_081252_107282_573E44C7 
X-CRM114-Status: GOOD (  22.39  )
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

On Wed, 30 Sep 2026 16:18:30 +0200
Fabrice Gasnier <fabrice.gasnier@foss.st.com> wrote:

> Add support for ADC on STM32MP23 SoC. It has 3 ADCs, split into two blocks:
> - ADC1 & ADC2 are tightly coupled.
> - ADC3 is managed independently.
> 
> It is quite similar to STM32MP25 ADC, except for the trigger list. TIM20
> triggers have been removed. So, handle the differences with a dedicated
> compatible and compatible data.
> 
> Co-developed-by: Cheick Traore <cheick.traore-ext@st.com>
> Signed-off-by: Cheick Traore <cheick.traore-ext@st.com>
> Co-developed-by: Olivier Moysan <olivier.moysan@foss.st.com>
> Signed-off-by: Olivier Moysan <olivier.moysan@foss.st.com>
> Signed-off-by: Fabrice Gasnier <fabrice.gasnier@foss.st.com>
> ---
> Changes in v3:
> - Style: Wrap core ID table to 100 chars.
> 
> Changes in v2:
> - New patch, split as advised by Andy: one patch for this new SoC
> ---
>  drivers/iio/adc/stm32-adc-core.c |   1 +
>  drivers/iio/adc/stm32-adc.c      | 112 +++++++++++++++++++++++++++++++++++++++
>  2 files changed, 113 insertions(+)
> 
> diff --git a/drivers/iio/adc/stm32-adc-core.c b/drivers/iio/adc/stm32-adc-core.c
> index bb8b53f52914..f94cc6fe4c02 100644
> --- a/drivers/iio/adc/stm32-adc-core.c
> +++ b/drivers/iio/adc/stm32-adc-core.c
> @@ -936,6 +936,7 @@ static const struct of_device_id stm32_adc_of_match[] = {
>  	{ .compatible = "st,stm32h7-adc-core", .data = (void *)&stm32h7_adc_priv_cfg },
>  	{ .compatible = "st,stm32mp1-adc-core",	.data = (void *)&stm32mp1_adc_priv_cfg },
>  	{ .compatible = "st,stm32mp13-adc-core", .data = (void *)&stm32mp13_adc_priv_cfg },
> +	{ .compatible = "st,stm32mp23-adc-core", .data = (void *)&stm32mp25_adc_priv_cfg },
>  	{ .compatible = "st,stm32mp25-adc-core", .data = (void *)&stm32mp25_adc_priv_cfg },
>  	{ }
>  };
> diff --git a/drivers/iio/adc/stm32-adc.c b/drivers/iio/adc/stm32-adc.c
> index 33e41505b2e9..210b76b21d13 100644
> --- a/drivers/iio/adc/stm32-adc.c
> +++ b/drivers/iio/adc/stm32-adc.c
> @@ -563,6 +563,64 @@ static const struct stm32_adc_regspec stm32h7_adc_regspec = {
>  	.smp_bits = stm32h7_smp_bits,
>  };
>  
> +/* STM32MP23 external trigger sources for ADC1 and ADC2 */
> +static struct stm32_adc_trig_info stm32mp23_adc1_adc2_trigs[] = {

This should be const, the trigs field is marked const in stm32_adc_cfg.

> +	{ TIM1_TRGO, STM32_EXT0 },
> +	{ TIM1_TRGO2, STM32_EXT1 },
> +	{ TIM8_TRGO, STM32_EXT2 },
> +	{ TIM8_TRGO2, STM32_EXT3 },
> +	{ TIM2_TRGO, STM32_EXT6 },
> +	{ TIM3_TRGO, STM32_EXT7 },
> +	{ TIM4_TRGO, STM32_EXT8 },
> +	{ TIM5_TRGO, STM32_EXT9 },
> +	{ TIM6_TRGO, STM32_EXT10 },
> +	{ TIM15_TRGO, STM32_EXT11 },
> +	{ TIM1_CH1, STM32_EXT12 },
> +	{ TIM1_CH2, STM32_EXT13 },
> +	{ TIM1_CH3, STM32_EXT14 },
> +	{ TIM2_CH2, STM32_EXT18 },
> +	{ TIM3_CH4, STM32_EXT19 },
> +	{ TIM4_CH4, STM32_EXT20 },
> +	{ TIM5_CH1, STM32_EXT21 },
> +	{ TIM12_CH1, STM32_EXT22 },
> +	{ LPTIM1_CH1, STM32_EXT24 },
> +	{ LPTIM2_CH1, STM32_EXT25 },
> +	{ LPTIM3_CH1, STM32_EXT26 },
> +	{ LPTIM4_CH1, STM32_EXT27 },
> +	{ LPTIM5_OUT, STM32_EXT28 },
> +	{ }
> +};
> +
> +/* STM32MP23 external trigger sources for ADC3 */
> +static struct stm32_adc_trig_info stm32mp23_adc3_trigs[] = {

Same here.

-- 
Kind regards,
Joshua Crofts

