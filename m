Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3D9AFC02198
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 12 Feb 2025 10:51:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=8YQyjp6+29h2F3EYFjHKjF70n+p1GBygn5et5PTL1Z0=; b=QAQy62WGB83TMAFc7o++IXl/Fq
	pUFNizkpbKyEDIjT+mT9ENS/gy/HJuEXE5xMryF2t+GdCtB4PRo+cW0AqbwDZ3xjp6mM0lA54qmck
	msd9SOgUeRMbwfTGovQxyRekuIOlV6M9T1XM18o1SMO47YCXQOdQRtvez9iG8MScPJ1ZPXUq9HRM/
	XpGfZd1s+DwDN7t7RoMvchzuE5zwroCno9CRalgashxj3Bb7017JxPjdno4PFSqwzthjLmjYP+ZFR
	yFOY+Nh0ReECy73FnL/jQ7C5zd26yVGwtl1HRRebRNTbdk2sXCfz3dJ8Z+W+mGqwnKjPToiiSl8l1
	jFq4/mJg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tiAKx-000000073RZ-2fqR;
	Wed, 12 Feb 2025 10:51:23 +0000
Received: from mail-pl1-x632.google.com ([2607:f8b0:4864:20::632])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tiABI-000000071H4-1odW
	for linux-arm-kernel@lists.infradead.org;
	Wed, 12 Feb 2025 10:41:25 +0000
Received: by mail-pl1-x632.google.com with SMTP id d9443c01a7336-21f5a224544so59582395ad.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 12 Feb 2025 02:41:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1739356883; x=1739961683; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=8YQyjp6+29h2F3EYFjHKjF70n+p1GBygn5et5PTL1Z0=;
        b=jhxdIE1RtKvOkM1L+HTi/GCpFa0ZW6MoyoxE+wWgn9P4EDKU/Jsdd6ZZ1jOyGZhNA+
         GcgrULMBHtrKB6kdyOHsPEoxzdF0AgJbLCUVJD/aQ9NCHzTHYWVMPKE+xn6uazZjX22D
         dLEuad9r75foWfJXveUDI/zeQO4E1aUSNhIi3oN+jN2p7Zjb47kVG4+ZaSJCT9JWMUTN
         WNfhJXCGjGnd8kHYxZdfBolGbl8zrBPg153OWdd4ibKBzgi3ffiRGwcoVEHUGrDTzlIg
         mI2/V4ydASd53azDjTtYUMl4pdVAM+oFDCHKF1d0ujmQ8TcZETQBEZgNtz4jf2lGpKFM
         KnBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739356883; x=1739961683;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=8YQyjp6+29h2F3EYFjHKjF70n+p1GBygn5et5PTL1Z0=;
        b=YHd+AxGsCjMiMxPohI/Z9ClJisMMZ9y/SVU2/UrYN+MqE2eiMzMOY83wgGZqI/UEir
         JcawKgWsjTmzUrbMGdjyJjOWwDBBqxoRoDmtsS3UhKtlpWTjSr1gp5kOwT1+3AYOO+9T
         ZjRMNwunmoVjN4vFbT9TEUGJL/9O1VTElxbVF855v9N8QtweoqUQ7GocJfp5IfSfLo4D
         ZKQbuZrmdO7cgbChh04Paj6x1zPRuk4ybfRUJGfx2z384jAmDanYHLnuPflQCOPm+M/2
         YaiX3jhpROdTu8XCJH9wbztZo0q7P0VcNnu3nWDWF3bvXabcGN1l56U/Gfnx//5eWOdi
         BKKg==
X-Forwarded-Encrypted: i=1; AJvYcCUsDqkDidGo/uXatGgKy0Z1lbxsi38w4I5WDIxSplB/7d63qrWdmudTEV3CylrahsO9NZEzqYD2ktXzXll4ozGK@lists.infradead.org
X-Gm-Message-State: AOJu0YxcizXpTeijANMCeDz6GBBcGX46kRf0ffqeuqwLbjq0ecJROsTp
	LUq0ovoIf7Dda25cN5OMimyBv7LimHmPCckOR4MmZmZrom9NxB7Q
X-Gm-Gg: ASbGnctsva2ajnQEa8OhqpLHe8ZaEOXTcBTShL5PfUc+Hcp0z2lv+lTYvTd98+Cks0f
	DDWWiD1XRoh4dN8UwEzNw5b6j+mC5TMgnhlSy7nQ6knZiKjRgLSpNOABhPBykTIUg4my1OktD0I
	6xeg1EUYHucsVLf55koHLjMJ2RKOrYjfZZ/3zflgzuGOZ/wJ/7b0xXdoLbqP/02cp/daYh6DcRn
	TlSyK1E7RdsxBFBR+nWeVbl1YWdne9AYIEzNa7Mb/PAJxWORiJcwdm0ob7XII/MV9h+AmSbHoma
	+R3D/u+Jnt20CKtPdT3mdbgqsot5OnutGRT25Gy9RpzAlROgLhqjV1j2ALkVIHkES4xb
X-Google-Smtp-Source: AGHT+IG7fHsk50vr9pXagmuT+ZX4Yh0LGYL9EwtalbavDIXdjP2t7+2HdTqNPipABP7b7Tt+/gYa/g==
X-Received: by 2002:a17:902:e74a:b0:215:9f5a:a236 with SMTP id d9443c01a7336-220bbaafce5mr31717535ad.6.1739356882983;
        Wed, 12 Feb 2025 02:41:22 -0800 (PST)
Received: from [172.19.1.42] (60-250-196-139.hinet-ip.hinet.net. [60.250.196.139])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-21f36561c0bsm110057805ad.102.2025.02.12.02.41.20
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 12 Feb 2025 02:41:22 -0800 (PST)
Message-ID: <ed945ca8-f66a-4706-94be-8e4ff48872e6@gmail.com>
Date: Wed, 12 Feb 2025 18:41:20 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 2/2] pwm: Add Nuvoton MA35D1 PWM controller support
To: =?UTF-8?Q?Uwe_Kleine-K=C3=B6nig?= <ukleinek@kernel.org>
Cc: robh@kernel.org, krzysztof.kozlowski@linaro.org, conor+dt@kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-pwm@vger.kernel.org,
 devicetree@vger.kernel.org, ychuang3@nuvoton.com, schung@nuvoton.com,
 cwweng@nuvoton.com, Trevor Gamblin <tgamblin@baylibre.com>
References: <20241206085501.2623772-1-cwweng.linux@gmail.com>
 <20241206085501.2623772-3-cwweng.linux@gmail.com>
 <c4x3spvvlxmrfypfbl57pki2akwf4rmooufw26w5ku7rwurjw4@gwtae2pqrutk>
Content-Language: en-US
From: Chi-Wen Weng <cwweng.linux@gmail.com>
In-Reply-To: <c4x3spvvlxmrfypfbl57pki2akwf4rmooufw26w5ku7rwurjw4@gwtae2pqrutk>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250212_024124_475591_E45731F4 
X-CRM114-Status: GOOD (  42.22  )
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

Hi Uwe,

Thanks for your reply.


On 2025/2/7 下午 05:28, Uwe Kleine-König wrote:
> Hello,
>
> On Fri, Dec 06, 2024 at 04:55:01PM +0800, Chi-Wen Weng wrote:
>> [...]
>> diff --git a/drivers/pwm/pwm-ma35d1.c b/drivers/pwm/pwm-ma35d1.c
>> new file mode 100644
>> index 000000000000..380f17b20a3d
>> --- /dev/null
>> +++ b/drivers/pwm/pwm-ma35d1.c
>> @@ -0,0 +1,179 @@
>> +// SPDX-License-Identifier: GPL-2.0
>> +/*
>> + * Driver for the Nuvoton MA35D1 PWM controller
>> + *
>> + * Copyright (C) 2024 Nuvoton Corporation
>> + *               Chi-Wen Weng <cwweng@nuvoton.com>
> Please add some information here about the hardware. The idea is to get
> some info about the device's capabilities. Please stick to the format
> that many other drivers are using such that
>
> 	sed -rn '/Limitations:/,/\*\/?$/p' drivers/pwm/pwm-ma35d1.c
>
> emits the info for your driver. Things to mention are: possible glitches
> during .apply(); behaviour of the pin when the PWM is disabled (constant
> signal? High-Z?)
>
> Also a link to a reference manual would be awesome.
Okay, I will add the information into driver.
>> + */
>> +
>> +#include <linux/clk.h>
>> +#include <linux/io.h>
>> +#include <linux/math64.h>
>> +#include <linux/mod_devicetable.h>
>> +#include <linux/module.h>
>> +#include <linux/platform_device.h>
>> +#include <linux/pwm.h>
>> +
>> +/* The following are registers address offset for MA35D1 PWM controller */
>> +#define MA35D1_REG_PWM_CTL0            (0x00)
>> +#define MA35D1_REG_PWM_CNTEN           (0x20)
>> +#define MA35D1_REG_PWM_PERIOD0         (0x30)
>> +#define MA35D1_REG_PWM_CMPDAT0         (0x50)
>> +#define MA35D1_REG_PWM_WGCTL0          (0xB0)
>> +#define MA35D1_REG_PWM_POLCTL          (0xD4)
>> +#define MA35D1_REG_PWM_POEN            (0xD8)
>> +
>> +/* The following are register address of MA35D1 PWM controller */
>> +#define MA35D1_PWM_CH_REG_SIZE         4
>> +#define MA35D1_PWM_CMPDAT0_ADDR(base, ch)     ((base) + MA35D1_REG_PWM_CMPDAT0 + \
>> +					       ((ch) * MA35D1_PWM_CH_REG_SIZE))
>> +#define MA35D1_PWM_CNTEN_ADDR(base)           ((base) + MA35D1_REG_PWM_CNTEN)
>> +#define MA35D1_PWM_PERIOD0_ADDR(base, ch)     ((base) + MA35D1_REG_PWM_PERIOD0 + \
>> +					       ((ch) * MA35D1_PWM_CH_REG_SIZE))
>> +#define MA35D1_PWM_POEN_ADDR(base)            ((base) + MA35D1_REG_PWM_POEN)
>> +#define MA35D1_PWM_POLCTL_ADDR(base)          ((base) + MA35D1_REG_PWM_POLCTL)
> I would drop the base part in these defines and add them to the above
> list sorted by address.
>
> So something like:
>
> #define MA35D1_REG_PWM_CTL0		0x00
> #define MA35D1_REG_PWM_CNTEN		0x20
> #define MA35D1_REG_PWM_PERIOD(ch)	(0x30 + 4 * (ch))
> #define MA35D1_REG_PWM_CMPDAT(ch)	(0x50 + 4 * (ch))
> #define MA35D1_REG_PWM_WGCTL0		0xB0
> #define MA35D1_REG_PWM_POLCTL		0xD4
> #define MA35D1_REG_PWM_POEN		0xD8
>
> To make up for the missing base, I'd create wrappers for readl and
> writel à la:
>
> 	static u32 nuvoton_pwm_readl(struct nuvoton_pwm *nvtpwm, unsigned int offset);
> 	static void nuvoton_pwm_writel(struct nuvoton_pwm *nvtpwm, unsigned int offset, u32 value);
>
> As you see I wouldn't use a define for 4, because IMHO that hurts
> readability. But I don't feel strong here.

It really can let my driver more readable. Thanks.


>
>> +#define MA35D1_PWM_MAX_COUNT           0xFFFF
>> +#define MA35D1_PWM_TOTAL_CHANNELS      6
> s/TOTAL/NUM/
Okay, I will modify it in next version.
>> +
>> +struct nuvoton_pwm {
>> +	void __iomem *base;
>> +	u64 clkrate;
> clk_get_rate() returns an unsigned long value. Please stick to that for
> .clkrate as there is no use to double the size of this struct on 32-bit
> platforms just to store zeros and padding.
Okay, I will modify it in next version.
>> +};
>> +
>> +static inline struct nuvoton_pwm *to_nuvoton_pwm(struct pwm_chip *chip)
>> +{
>> +	return pwmchip_get_drvdata(chip);
>> +}
> I slightly prefer nuvoton_pwm_from_chip() for this function's name to
> have the same function prefix for all functions here.
Okay, I will modify it in next version.
>> +
>> +static int nuvoton_pwm_apply(struct pwm_chip *chip, struct pwm_device *pwm,
>> +			     const struct pwm_state *state)
>> +{
>> +	struct nuvoton_pwm *nvtpwm;
>> +	u32 ch = pwm->hwpwm;
>> +
>> +	nvtpwm = to_nuvoton_pwm(chip);
>> +	if (state->enabled) {
>> +		u64 duty_cycles, period_cycles;
>> +
>> +		/* Calculate the duty and period cycles */
>> +		duty_cycles = mul_u64_u64_div_u64(nvtpwm->clkrate,
>> +						  state->duty_cycle, NSEC_PER_SEC);
>> +		if (duty_cycles > MA35D1_PWM_MAX_COUNT)
>> +			duty_cycles = MA35D1_PWM_MAX_COUNT;
>> +
>> +		period_cycles = mul_u64_u64_div_u64(nvtpwm->clkrate,
>> +						    state->period, NSEC_PER_SEC);
>> +		if (period_cycles > MA35D1_PWM_MAX_COUNT)
>> +			period_cycles = MA35D1_PWM_MAX_COUNT;
>> +
>> +		/* Write the duty and period cycles to registers */
>> +		writel(duty_cycles, MA35D1_PWM_CMPDAT0_ADDR(nvtpwm->base, ch));
>> +		writel(period_cycles, MA35D1_PWM_PERIOD0_ADDR(nvtpwm->base, ch));
>> +		/* Enable counter */
>> +		writel(readl(MA35D1_PWM_CNTEN_ADDR(nvtpwm->base)) | BIT(ch),
>> +		       MA35D1_PWM_CNTEN_ADDR(nvtpwm->base));
>> +		/* Enable output */
>> +		writel(readl(MA35D1_PWM_POEN_ADDR(nvtpwm->base)) | BIT(ch),
>> +		       MA35D1_PWM_POEN_ADDR(nvtpwm->base));
> Can this result in glitches? E.g. is it possible to see a waveform with
> the old period_cycles but the new duty_cycles output? If you switch
> polarity, do you see the new settings with the wrong polarity for some
> time? Setup polarity before enabling the counter and output? Maybe only
> enable the counter when the output is enabled to be sure to emit the
> first edge with the correct timing?

Yes, enable counter should be after the output is enabled. Will fix in 
next version.


>> +	} else {
>> +		/* Disable counter */
>> +		writel(readl(MA35D1_PWM_CNTEN_ADDR(nvtpwm->base)) & ~BIT(ch),
>> +		       MA35D1_PWM_CNTEN_ADDR(nvtpwm->base));
>> +		/* Disable output */
>> +		writel(readl(MA35D1_PWM_POEN_ADDR(nvtpwm->base)) & ~BIT(ch),
>> +		       MA35D1_PWM_POEN_ADDR(nvtpwm->base));
> Maybe add another wrapper for this kind of rmw operation. Also I suggest
> to introduce a name for BIT(ch) here such that this can become:
>
> 	nuvoton_pwm_rmw(nvtpwm, MA35D1_REG_PWM_POEN, MA35D1_REG_PWM_POEN_EN(ch), 0);
>
> (Assuming "EN0" is the name of the bit for channel 0 in
> MA35D1_REG_PWM_POEN.)
Okay, I will modify it next version.
>> +	}
>> +
>> +	/* Set polarity state to register */
>> +	if (state->polarity == PWM_POLARITY_NORMAL)
>> +		writel(readl(MA35D1_PWM_POLCTL_ADDR(nvtpwm->base)) & ~BIT(ch),
>> +		       MA35D1_PWM_POLCTL_ADDR(nvtpwm->base));
>> +	else
>> +		writel(readl(MA35D1_PWM_POLCTL_ADDR(nvtpwm->base)) | BIT(ch),
>> +		       MA35D1_PWM_POLCTL_ADDR(nvtpwm->base));
> You can skip setting up period if !state->enabled.
Yes, it should be skip if !state->enabled.
>> +	return 0;
>> +}
>> +
>> [...]
>> +
>> +static int nuvoton_pwm_probe(struct platform_device *pdev)
>> +{
>> +	struct pwm_chip *chip;
>> +	struct nuvoton_pwm *nvtpwm;
>> +	struct clk *clk;
>> +	int ret;
>> +
>> +	chip = devm_pwmchip_alloc(&pdev->dev, MA35D1_PWM_TOTAL_CHANNELS, sizeof(*nvtpwm));
>> +	if (IS_ERR(chip))
>> +		return PTR_ERR(chip);
>> +
>> +	nvtpwm = to_nuvoton_pwm(chip);
>> +
>> +	nvtpwm->base = devm_platform_ioremap_resource(pdev, 0);
>> +	if (IS_ERR(nvtpwm->base))
>> +		return PTR_ERR(nvtpwm->base);
>> +
>> +	clk = devm_clk_get_enabled(&pdev->dev, NULL);
>> +	if (IS_ERR(clk))
>> +		return dev_err_probe(&pdev->dev, PTR_ERR(clk), "unable to get the clock");
> Please start all error messages with a capital letter and end them with
> \n.
>
> devm_clk_rate_exclusive_get(&pdev->dev, clk) here please.
Okay, I will modify it in next version.
>> +
>> +	nvtpwm->clkrate = clk_get_rate(clk);
>> +	if (nvtpwm->clkrate > NSEC_PER_SEC)
>> +		return dev_err_probe(&pdev->dev, -EINVAL, "pwm clock out of range");
> 	return dev_err_probe(&pdev->dev, -EINVAL, "PWM clock out of range (%lu)\n", nvtpwm->clkrate);
Okay, I will modify it in next version.
>> +
>> +	chip->ops = &nuvoton_pwm_ops;
>> +	chip->atomic = true;
>> +
>> +	ret = devm_pwmchip_add(&pdev->dev, chip);
>> +	if (ret < 0)
>> +		return dev_err_probe(&pdev->dev, ret, "unable to add pwm chip");
>> +
>> +	return 0;
>> +}
> Best regards
> Uwe


Thanks.

Chi-Wen Weng



