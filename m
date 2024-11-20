Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D977DD711C0
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 20 Nov 2024 16:51:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=FNJkcwRcgLMLMuE8q5mBbqQ2JyH7D/IwifRJTKex0/w=; b=KlgjYIrJVpGrsA8rk3ZxbPox1L
	2bI2vQwqgHRyUH8HECD8kOjUlTpYFcoZknwIH4RgE3fwgoVuI41MKutOHgK7TmlvcgGbuMhq7Ueqb
	IVsCHkDVUStiFZ7+Bm//eNnX9qw9Hqir1qX+3geVvf3agULQ3Tt/gOCIiyb4Him+CEu2AhjxS9nKL
	3jAsx07nESJFQ9SDyKHG2fAwlx0xI7xhaIUcD98PfDLYNC1+tzMbU7p8f2zmXxyga3Qc7EQZUeuWZ
	rc5I59Y2/qHpq+5xN55uS/HPOfh2axU+HlQvws5Lf1ICe/us3CV21LEp8Yx5cXgVusuETNuaghcyT
	zX2ldx8w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tDnum-0000000FrAg-1tFo;
	Wed, 20 Nov 2024 16:50:52 +0000
Received: from mail-yw1-x1132.google.com ([2607:f8b0:4864:20::1132])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tDntn-0000000Fr3I-2qSG
	for linux-arm-kernel@lists.infradead.org;
	Wed, 20 Nov 2024 16:49:54 +0000
Received: by mail-yw1-x1132.google.com with SMTP id 00721157ae682-6e377e4aea3so35272357b3.3
        for <linux-arm-kernel@lists.infradead.org>; Wed, 20 Nov 2024 08:49:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1732121390; x=1732726190; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=FNJkcwRcgLMLMuE8q5mBbqQ2JyH7D/IwifRJTKex0/w=;
        b=oYvJKLqp2nYu4ajdz5I6slQZ6uK8SA9Oo32B/P21kETFHScw7Rqj0AvK9/AQyTphtJ
         7djyvykd5+/zKOtmY/QLIveMmZ6DoJOgDV5VKVHx51d13qKyuL0Z3v3Ou5EbGiQv17nS
         tSiz7dTj8KlNPZAGdtEnI9jIw5wPms+vhZaFSWneYtoxb5Th0DKb4ROA5SutSt7X8rBW
         9gSu/4oOQkaRxOAIgkO4NKm462bx5d/fYnFuuK8fEH5fXwgJv692dZPIWa6tP0NbRTUz
         rGJCxkSRJvrutJ6/4AWALhsPDY05qFUMmYZTOz7M1wXN6F5CNVKdYs1K6LldU/iar3vv
         rITA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732121390; x=1732726190;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=FNJkcwRcgLMLMuE8q5mBbqQ2JyH7D/IwifRJTKex0/w=;
        b=jIQZXStn4SjW9jbyaCRf0Wr9WSzjaiYexGwNIxIh/fwVcyybR3QUzX23FdiX6RaGY+
         CSeuBz8kcw6JZYliqBvvJT07TipJWCPZTj1p8LF2hilyWJA4gokXbHUzBpls69UCau9F
         Ook5+rGmSj5FmRoGWgOCPPwODoFaJogpc87ZLr4ZtAcCj4cvIbksRiMMTNBEaKmged9V
         3K89V66B7B96zGoz71Jeqm8Aqp6j0dQ+QqUM2leFpHfb/JiVKqU9tPqxEM9T4zv7M82b
         vSN8iKyc4OOcVRVvMmaUkzJBrgI6knUQkYzGrIfOauaY7Axt475Ew/n6jWxK4c+flixx
         RJyQ==
X-Gm-Message-State: AOJu0YxR5Xfz70PzU6Ljg/dznc7kaDORYpDURGYbXlWFQfdwtSSqeRYg
	6UutprHwwT11cBmgiQkuef36P12NrRqeO5bLS9SZRckgGN0ogl307B/0RhkCN9U=
X-Google-Smtp-Source: AGHT+IGwdWGaoYeSXKzm2/GlitpS+zOHktULnOeuKUobVI140EepHW/8+OKb4ahYFKL5oL68l9Ullw==
X-Received: by 2002:a05:690c:46c4:b0:6e3:4436:56ba with SMTP id 00721157ae682-6eebd141ebamr40783437b3.8.1732121389779;
        Wed, 20 Nov 2024 08:49:49 -0800 (PST)
Received: from [192.168.40.12] (d24-150-219-207.home.cgocable.net. [24.150.219.207])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6d4381340f8sm12779316d6.110.2024.11.20.08.49.48
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 20 Nov 2024 08:49:49 -0800 (PST)
Message-ID: <5a6ad0dc-f777-4129-962f-e10a0f7d6ee1@baylibre.com>
Date: Wed, 20 Nov 2024 11:49:48 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RESEND v2 2/2] pwm: Add Nuvoton MA35D1 PWM controller
 support
To: Chi-Wen Weng <cwweng.linux@gmail.com>, ukleinek@kernel.org,
 robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org
Cc: linux-arm-kernel@lists.infradead.org, linux-pwm@vger.kernel.org,
 devicetree@vger.kernel.org, ychuang3@nuvoton.com, schung@nuvoton.com,
 cwweng@nuvoton.com
References: <20241024104309.169510-1-cwweng.linux@gmail.com>
 <20241024104309.169510-3-cwweng.linux@gmail.com>
Content-Language: en-US
From: Trevor Gamblin <tgamblin@baylibre.com>
In-Reply-To: <20241024104309.169510-3-cwweng.linux@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241120_084951_725678_D3666530 
X-CRM114-Status: GOOD (  38.69  )
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

Hello,

On 2024-10-24 06:43, Chi-Wen Weng wrote:
> This commit adds a generic PWM framework driver for Nuvoton MA35D1
> PWM controller.
>
> Signed-off-by: Chi-Wen Weng <cwweng.linux@gmail.com>
> ---
>   drivers/pwm/Kconfig      |   9 +++
>   drivers/pwm/Makefile     |   1 +
>   drivers/pwm/pwm-ma35d1.c | 169 +++++++++++++++++++++++++++++++++++++++
>   3 files changed, 179 insertions(+)
>   create mode 100644 drivers/pwm/pwm-ma35d1.c
I don't see a MAINTAINERS entry? That needs to be added in the bindings 
patch first, and then it should be updated to list this driver file.
>
> diff --git a/drivers/pwm/Kconfig b/drivers/pwm/Kconfig
> index 0915c1e7df16..97b9e83af020 100644
> --- a/drivers/pwm/Kconfig
> +++ b/drivers/pwm/Kconfig
> @@ -411,6 +411,15 @@ config PWM_LPSS_PLATFORM
>   	  To compile this driver as a module, choose M here: the module
>   	  will be called pwm-lpss-platform.
>   
> +config PWM_MA35D1
> +	tristate "Nuvoton MA35D1 PWM support"
> +	depends on ARCH_MA35 || COMPILE_TEST
> +	help
> +	  Generic PWM framework driver for Nuvoton MA35D1.
> +
> +	  To compile this driver as a module, choose M here: the module
> +	  will be called pwm-ma35d1.
> +
>   config PWM_MESON
>   	tristate "Amlogic Meson PWM driver"
>   	depends on ARCH_MESON || COMPILE_TEST
> diff --git a/drivers/pwm/Makefile b/drivers/pwm/Makefile
> index 9081e0c0e9e0..c1d3a1d8add0 100644
> --- a/drivers/pwm/Makefile
> +++ b/drivers/pwm/Makefile
> @@ -36,6 +36,7 @@ obj-$(CONFIG_PWM_LPC32XX)	+= pwm-lpc32xx.o
>   obj-$(CONFIG_PWM_LPSS)		+= pwm-lpss.o
>   obj-$(CONFIG_PWM_LPSS_PCI)	+= pwm-lpss-pci.o
>   obj-$(CONFIG_PWM_LPSS_PLATFORM)	+= pwm-lpss-platform.o
> +obj-$(CONFIG_PWM_MA35D1)	+= pwm-ma35d1.o
>   obj-$(CONFIG_PWM_MESON)		+= pwm-meson.o
>   obj-$(CONFIG_PWM_MEDIATEK)	+= pwm-mediatek.o
>   obj-$(CONFIG_PWM_MICROCHIP_CORE)	+= pwm-microchip-core.o
> diff --git a/drivers/pwm/pwm-ma35d1.c b/drivers/pwm/pwm-ma35d1.c
> new file mode 100644
> index 000000000000..0c4eec4a0b07
> --- /dev/null
> +++ b/drivers/pwm/pwm-ma35d1.c
> @@ -0,0 +1,169 @@
> +// SPDX-License-Identifier: GPL-2.0
> +/*
> + * Driver for the Nuvoton MA35D1 PWM controller
> + *
> + * Copyright (C) 2024 Nuvoton Corporation
> + *               Chi-Wen Weng <cwweng@nuvoton.com>
> + */
> +
> +#include <linux/mod_devicetable.h>
> +#include <linux/module.h>
> +#include <linux/platform_device.h>
> +#include <linux/pwm.h>
> +#include <linux/io.h>
> +#include <linux/clk.h>
> +#include <linux/math64.h>
These should be organized alphabetically.
> +
> +/* The following are registers for PWM controller */
> +#define REG_PWM_CTL0            (0x00)
> +#define REG_PWM_CNTEN           (0x20)
> +#define REG_PWM_PERIOD0         (0x30)
> +#define REG_PWM_CMPDAT0         (0x50)
> +#define REG_PWM_WGCTL0          (0xB0)
> +#define REG_PWM_POLCTL          (0xD4)
> +#define REG_PWM_POEN            (0xD8)

These too, I think - it will make it more readable for others.

You should also prefix all of your macros to be more explicit about 
their use, e.g. MA35D1_REG_PWM_CTL0. That way it's clearer that they're 
specific to this driver and not from elsewhere.

> +
> +#define PWM_TOTAL_CHANNELS      6
> +#define PWM_CH_REG_SIZE         4
And these.
> +
> +struct nuvoton_pwm {
> +	void __iomem *base;
> +	u64 clkrate;
> +};
> +
> +static inline struct nuvoton_pwm *to_nuvoton_pwm(struct pwm_chip *chip)
> +{
> +	return pwmchip_get_drvdata(chip);
> +}
> +
> +static int nuvoton_pwm_apply(struct pwm_chip *chip, struct pwm_device *pwm,
> +			     const struct pwm_state *state)
> +{
> +	struct nuvoton_pwm *nvtpwm;
> +	unsigned int ch = pwm->hwpwm;
> +
> +	nvtpwm = to_nuvoton_pwm(chip);
> +	if (state->enabled) {
> +		u64 duty_cycles, period_cycles;
> +
> +		/* Calculate the duty and period cycles */
> +		duty_cycles = mul_u64_u64_div_u64(nvtpwm->clkrate,
> +						  state->duty_cycle, NSEC_PER_SEC);
> +		if (duty_cycles > 0xFFFF)
> +			duty_cycles = 0xFFFF;
It would be good to create a macro for this value 0xFFFF, e.g. 
MA35D1_MAX_PWM_RATE.
> +
> +		period_cycles = mul_u64_u64_div_u64(nvtpwm->clkrate,
> +						    state->period, NSEC_PER_SEC);
> +		if (period_cycles > 0xFFFF)
> +			period_cycles = 0xFFFF;
> +
> +		/* Write the duty and period cycles to registers */
> +		writel(duty_cycles, nvtpwm->base + REG_PWM_CMPDAT0 + (ch * PWM_CH_REG_SIZE));
> +		writel(period_cycles, nvtpwm->base + REG_PWM_PERIOD0 + (ch * PWM_CH_REG_SIZE));

Since you are using things like

nvtpwm->base + REG_PWM_CMPDAT0 + (ch * PWM_CH_REG_SIZE)

and similar so frequently, I suggest creating more macros for these 
sorts of accesses to improve readability, e.g.

#define MA35D1_PWM_CMPDAT0_ADDR(base, ch) 	base + REG_PWM_CMPDAT0 + (ch * PWM_CH_REG_SIZE));

or even

#define MA35D1_PWM_CMPDAT0_ADDR(nvtpwm, ch) 	nvtpwm->base + REG_PWM_CMPDAT0 + (ch * PWM_CH_REG_SIZE));

and then use those instead.

> +		/* Enable counter */
> +		writel(readl(nvtpwm->base + REG_PWM_CNTEN) | BIT(ch),
> +		       nvtpwm->base + REG_PWM_CNTEN);
Same for cases like this.
> +		/* Enable output */
> +		writel(readl(nvtpwm->base + REG_PWM_POEN) | BIT(ch),
> +		       nvtpwm->base + REG_PWM_POEN);
> +	} else {
> +		/* Disable counter */
> +		writel(readl(nvtpwm->base + REG_PWM_CNTEN) & ~BIT(ch),
> +		       nvtpwm->base + REG_PWM_CNTEN);
> +		/* Disable output */
> +		writel(readl(nvtpwm->base + REG_PWM_POEN) & ~BIT(ch),
> +		       nvtpwm->base + REG_PWM_POEN);
> +	}
> +
> +	/* Set polarity state to register */
> +	if (state->polarity == PWM_POLARITY_NORMAL)
> +		writel(readl(nvtpwm->base + REG_PWM_POLCTL) & ~BIT(ch),
> +		       nvtpwm->base + REG_PWM_POLCTL);
> +	else
> +		writel(readl(nvtpwm->base + REG_PWM_POLCTL) | BIT(ch),
> +		       nvtpwm->base + REG_PWM_POLCTL);
> +
> +	return 0;
> +}
> +
> +static int nuvoton_pwm_get_state(struct pwm_chip *chip, struct pwm_device *pwm,
> +				 struct pwm_state *state)
> +{
> +	struct nuvoton_pwm *nvtpwm;
> +	unsigned int duty_cycles, period_cycles, cnten, outen, polarity;
> +	unsigned int ch = pwm->hwpwm;
> +
> +	nvtpwm = to_nuvoton_pwm(chip);
> +
> +	cnten = readl(nvtpwm->base + REG_PWM_CNTEN);
> +	outen = readl(nvtpwm->base + REG_PWM_POEN);
> +	duty_cycles = readl(nvtpwm->base + REG_PWM_CMPDAT0 + (ch * PWM_CH_REG_SIZE));
> +	period_cycles = readl(nvtpwm->base + REG_PWM_PERIOD0 + (ch * PWM_CH_REG_SIZE));
> +	polarity = readl(nvtpwm->base + REG_PWM_POLCTL) & BIT(ch);
> +
> +	state->enabled = (cnten & BIT(ch)) && (outen & BIT(ch));
> +	state->polarity = polarity ? PWM_POLARITY_INVERSED : PWM_POLARITY_NORMAL;
> +	state->duty_cycle = DIV64_U64_ROUND_UP((u64)duty_cycles * NSEC_PER_SEC, nvtpwm->clkrate);
> +	state->period = DIV64_U64_ROUND_UP((u64)period_cycles * NSEC_PER_SEC, nvtpwm->clkrate);
> +
> +	return 0;
> +}
> +
> +static const struct pwm_ops nuvoton_pwm_ops = {
> +	.apply = nuvoton_pwm_apply,
> +	.get_state = nuvoton_pwm_get_state,
> +};
> +
> +static int nuvoton_pwm_probe(struct platform_device *pdev)
> +{
> +	struct pwm_chip *chip;
> +	struct nuvoton_pwm *nvtpwm;
> +	struct clk *clk;
> +	int ret;
> +
> +	chip = devm_pwmchip_alloc(&pdev->dev, PWM_TOTAL_CHANNELS, sizeof(*nvtpwm));
> +	if (IS_ERR(chip))
> +		return PTR_ERR(chip);
> +
> +	nvtpwm = to_nuvoton_pwm(chip);
> +
> +	nvtpwm->base = devm_platform_ioremap_resource(pdev, 0);
> +	if (IS_ERR(nvtpwm->base))
> +		return PTR_ERR(nvtpwm->base);
> +
> +	clk = devm_clk_get_enabled(&pdev->dev, NULL);
> +	if (IS_ERR(clk))
> +		return dev_err_probe(&pdev->dev, PTR_ERR(clk), "unable to get the clock");
> +
> +	nvtpwm->clkrate = clk_get_rate(clk);
> +	if (nvtpwm->clkrate > NSEC_PER_SEC)
> +		return dev_err_probe(&pdev->dev, -EINVAL, "pwm clock out of range");
> +
> +	chip->ops = &nuvoton_pwm_ops;
> +	chip->atomic = true;
> +
> +	ret = devm_pwmchip_add(&pdev->dev, chip);
> +	if (ret < 0)
> +		return dev_err_probe(&pdev->dev, ret, "unable to add pwm chip");
> +
> +	return 0;
> +}

As a final note, please be aware that there is a change to the PWM 
subsystem coming in 6.13. You don't need to do anything now, but it's 
worth considering how the driver might change once that hits mainline.

You can find the changes here: 
https://git.kernel.org/pub/scm/linux/kernel/git/ukleinek/linux.git/log/?h=pwm/duty_offset 
.

> +
> +static const struct of_device_id nuvoton_pwm_of_match[] = {
> +	{ .compatible = "nuvoton,ma35d1-pwm" },
> +	{}
> +};
> +MODULE_DEVICE_TABLE(of, nuvoton_pwm_of_match);
> +
> +static struct platform_driver nuvoton_pwm_driver = {
> +	.probe = nuvoton_pwm_probe,
> +	.driver = {
> +		.name = "nuvoton-pwm",
> +		.of_match_table = nuvoton_pwm_of_match,
> +	},
> +};
> +module_platform_driver(nuvoton_pwm_driver);
> +
> +MODULE_AUTHOR("Chi-Wen Weng <cwweng@nuvoton.com>");
> +MODULE_DESCRIPTION("Nuvoton MA35D1 PWM driver");
> +MODULE_LICENSE("GPL");

