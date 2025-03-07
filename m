Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 316C5C19F32
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  7 Mar 2025 15:15:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=3KPjXWWPyK0oX1t83TQ9M25n1uZNpHn3HsSYBqjRW2A=; b=sEX7zPNKvMIXjeP5pnGDYHLnEe
	s6yQ1G9F/eo9en7tE9eHW5WMhgc/MQe5XIb0JAxQvwHKLD70+AwtY+SXM1PDpXDhFE+Ot4l6/j47z
	qxiR2BIpywjb0PKfBfFp0O66AqlNL+6QxsOFbhSaPZZIYQuJBda42jPD31b22Cz1GNP+rvSYy9isJ
	q65978lJUD++5u7cPoCyvtuCIa5X8c9JvHVd8s4ianrlwjD/5L/st+koxzqtPaYMG4mtoIK7jYYKN
	GemGp/xiaYoT8TzhHtpxnGTkT3MUnOnI9YkWfZY1VhSu+mrzMt9lHoQNr1prvD5X4B2N/3qIgSrQS
	0jPqJ6bQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tqZPk-0000000EbPp-44aM;
	Fri, 07 Mar 2025 15:15:04 +0000
Received: from mail-wr1-x432.google.com ([2a00:1450:4864:20::432])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tqZN6-0000000EagA-06KC
	for linux-arm-kernel@lists.infradead.org;
	Fri, 07 Mar 2025 15:12:21 +0000
Received: by mail-wr1-x432.google.com with SMTP id ffacd0b85a97d-390f69e71c8so1148664f8f.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 07 Mar 2025 07:12:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1741360338; x=1741965138; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=3KPjXWWPyK0oX1t83TQ9M25n1uZNpHn3HsSYBqjRW2A=;
        b=eFao/uQEPb8ARNzraKS9/wXIPSzQ8ZtJGtzvDpa1fTHUsFoaYkM9hrwY4f6GP4Vluz
         IRqwLfvhfwreVzwUvzAWQInKkcwlkLzIuYvScFCGkrf1UBEJ2kynZKA/fEHmVDFGyx+X
         tQ31euNifjFwYkWv7BZ+ukRJfQYjn+WWfEGKGsUPOP7RvjGD6fRI/gXS0AvS21MEbJwt
         NFW/gUNr6E1lrNUGltvjmMG4IvmqI2T8o7cBkIGIL/8iOqfOaYtKUVtHN7RY6K2bZjjk
         yfBigqZ3oD6zK4VsFR+k4hnQqaHB/vL/nWkwnqUoEwGIXCMtB1XurLUdulDs+wgPJXV8
         beYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741360338; x=1741965138;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=3KPjXWWPyK0oX1t83TQ9M25n1uZNpHn3HsSYBqjRW2A=;
        b=jesKSnk8eYSpXDaqMfaaX2imD1eONZgEeFk/vC1/UN7F9+7DCUEZszxZvfjYc4/Za6
         nNOSNtzE5kw2u458agSm3dxacezL93PoU1wLBiOwSr2LIjGdkqu0vAghlzrT+2F8FG6F
         KOXZeMh907u+Pi0vRyGEB5sbg7gXaYOqK5CIn3y+VIzFA8n/k+eFTMkuyCkgk8vBF//B
         hsmV0+AEpvsSSlSHu/L4dWPXOckA0p6KdeUOs1ozafFYyr1l/u7/DG1GZIBLT57G7JRf
         qHK8FeTfpX7oW85f6n5SDOnilFXjp0NlJIrxcW6PjKZwVELmT2vYnzI7tcyz715iOJC1
         bBYg==
X-Forwarded-Encrypted: i=1; AJvYcCWHy6qyIJfLhO0Pb+mWWvPu39Cgu0nxJAsqvUIu3qNjE9uR+60SFWI3iQ3bC//NN7WLotrBYcauvAQR9X8PZwT9@lists.infradead.org
X-Gm-Message-State: AOJu0YyZ6eeeBTXMEtgVhuOvHUb9T6+2laVGokL62RPuTc609xKThvDs
	aSX98AXWmsFucjKXnf5R2zkmkixiXVcKakc0HLDscurq2t3s7VhjciHfIDS5P5M=
X-Gm-Gg: ASbGncvyxIN7nJAA+3Y9m7Kas+fXLWeLQUaZoqsnvoSVeBPjrarI7qRh/0KbQHcmm/C
	DAQwtoI2BSJN+pdYCZHv5Jxey+POMSW217tEdemnLct28Kag4jsOLrX9pbIyBWtLAF5LzWJQHzR
	1Hzzh7xtCCnLaZKhUrzl8NaynfV05j4Ofngjr/YlRATnl8fxroAo83RLH+bIrXMkuQHHJ1J4IEV
	/eMtlKdpn4l8R/PubOm1yrhjOinVxDhPZeLVq7bcpTsPBE198wRuIxy/3I6n32T0CW05hP82iiX
	2kuGMZBeSKYV6lTvOgj2ZmCHmibHuzs/9dAi96LK3nBjFB/v1L9wGc4ljCcifjRJfsVfyuQ4+uY
	RYkmqwmQk
X-Google-Smtp-Source: AGHT+IF/RAT3IwHfPoJTNREYxSSMrMjlEJSFksJXdPdttaAQyHvw/bJK7g/nq3YVVLUv/LTreYAVjw==
X-Received: by 2002:a5d:59ae:0:b0:391:22e2:ccd2 with SMTP id ffacd0b85a97d-391296c2485mr5482638f8f.3.1741360338305;
        Fri, 07 Mar 2025 07:12:18 -0800 (PST)
Received: from [192.168.10.46] (146725694.box.freepro.com. [130.180.211.218])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-3912c104acesm5662531f8f.98.2025.03.07.07.12.17
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 07 Mar 2025 07:12:17 -0800 (PST)
Message-ID: <83283a94-6833-4d7d-8d89-6ba42b43b96c@linaro.org>
Date: Fri, 7 Mar 2025 16:12:16 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 4/8] clocksource: stm32-lptimer: add support for
 stm32mp25
To: Fabrice Gasnier <fabrice.gasnier@foss.st.com>, lee@kernel.org,
 ukleinek@kernel.org, alexandre.torgue@foss.st.com, robh@kernel.org,
 krzk+dt@kernel.org, conor+dt@kernel.org, jic23@kernel.org, tglx@linutronix.de
Cc: catalin.marinas@arm.com, will@kernel.org, devicetree@vger.kernel.org,
 wbg@kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-iio@vger.kernel.org, linux-pwm@vger.kernel.org,
 olivier.moysan@foss.st.com
References: <20250305094935.595667-1-fabrice.gasnier@foss.st.com>
 <20250305094935.595667-5-fabrice.gasnier@foss.st.com>
Content-Language: en-US
From: Daniel Lezcano <daniel.lezcano@linaro.org>
In-Reply-To: <20250305094935.595667-5-fabrice.gasnier@foss.st.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250307_071220_070120_7C323D3D 
X-CRM114-Status: GOOD (  22.87  )
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

On 05/03/2025 10:49, Fabrice Gasnier wrote:
> On stm32mp25, DIER (former IER) must only be modified when the lptimer
> is enabled. On earlier SoCs, it must be only be modified when it is
> disabled. Read the LPTIM_VERR register to properly manage the enable
> state, before accessing IER.
> 
> Signed-off-by: Patrick Delaunay <patrick.delaunay@foss.st.com>
> Signed-off-by: Fabrice Gasnier <fabrice.gasnier@foss.st.com>
> ---
> Changes in V2:
> - rely on fallback compatible as no specific .data is associated to the
>    driver. Use version data from MFD core.
> - Added interrupt enable register access update in (missed in V1)
> ---
>   drivers/clocksource/timer-stm32-lp.c | 26 ++++++++++++++++++++++----
>   1 file changed, 22 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/clocksource/timer-stm32-lp.c b/drivers/clocksource/timer-stm32-lp.c
> index a4c95161cb22..96d975adf7a4 100644
> --- a/drivers/clocksource/timer-stm32-lp.c
> +++ b/drivers/clocksource/timer-stm32-lp.c
> @@ -25,6 +25,7 @@ struct stm32_lp_private {
>   	struct clock_event_device clkevt;
>   	unsigned long period;
>   	struct device *dev;
> +	bool ier_wr_enabled;	/* Enables LPTIMER before writing into IER register */
>   };
>   
>   static struct stm32_lp_private*
> @@ -37,8 +38,15 @@ static int stm32_clkevent_lp_shutdown(struct clock_event_device *clkevt)
>   {
>   	struct stm32_lp_private *priv = to_priv(clkevt);
>   
> -	regmap_write(priv->reg, STM32_LPTIM_CR, 0);
> +	/* Disable LPTIMER either before or after writing IER register (else, keep it enabled) */
> +	if (!priv->ier_wr_enabled)
> +		regmap_write(priv->reg, STM32_LPTIM_CR, 0);
> +
>   	regmap_write(priv->reg, STM32_LPTIM_IER, 0);
> +

Why not encapsulate the function ?

	regmap_write_ier(struct stm32_lp_private *priv, int value)
	{

		/* A comment ... */
		if (!priv->ier_wr_enabled)
			regmap_write(priv->reg, STM32_LPTIM_CR, 0);

		regmap_write(priv->reg, STM32_LPTIM_IER, value);

		if (!priv->ier_wr_enabled)
			regmap_write(priv->reg, STM32_LPTIM_CR, STM32_LPTIM_ENABLE);
	}


> +	if (priv->ier_wr_enabled)
> +		regmap_write(priv->reg, STM32_LPTIM_CR, 0);
> +

>   	/* clear pending flags */
>   	regmap_write(priv->reg, STM32_LPTIM_ICR, STM32_LPTIM_ARRMCF);
>   
> @@ -51,12 +59,21 @@ static int stm32_clkevent_lp_set_timer(unsigned long evt,
>   {
>   	struct stm32_lp_private *priv = to_priv(clkevt);
>   
> -	/* disable LPTIMER to be able to write into IER register*/
> -	regmap_write(priv->reg, STM32_LPTIM_CR, 0);
> +	if (!priv->ier_wr_enabled) {
> +		/* Disable LPTIMER to be able to write into IER register */
> +		regmap_write(priv->reg, STM32_LPTIM_CR, 0);
> +	} else {
> +		/* Enable LPTIMER to be able to write into IER register */
> +		regmap_write(priv->reg, STM32_LPTIM_CR, STM32_LPTIM_ENABLE);
> +	}
> +
>   	/* enable ARR interrupt */
>   	regmap_write(priv->reg, STM32_LPTIM_IER, STM32_LPTIM_ARRMIE);
> +
>   	/* enable LPTIMER to be able to write into ARR register */
> -	regmap_write(priv->reg, STM32_LPTIM_CR, STM32_LPTIM_ENABLE);
> +	if (!priv->ier_wr_enabled)
> +		regmap_write(priv->reg, STM32_LPTIM_CR, STM32_LPTIM_ENABLE);
> +
>   	/* set next event counter */
>   	regmap_write(priv->reg, STM32_LPTIM_ARR, evt);
>   
> @@ -151,6 +168,7 @@ static int stm32_clkevent_lp_probe(struct platform_device *pdev)
>   		return -ENOMEM;
>   
>   	priv->reg = ddata->regmap;
> +	priv->ier_wr_enabled = ddata->version == STM32_LPTIM_VERR_23;
>   	ret = clk_prepare_enable(ddata->clk);
>   	if (ret)
>   		return -EINVAL;


-- 
<http://www.linaro.org/> Linaro.org │ Open source software for ARM SoCs

Follow Linaro:  <http://www.facebook.com/pages/Linaro> Facebook |
<http://twitter.com/#!/linaroorg> Twitter |
<http://www.linaro.org/linaro-blog/> Blog

