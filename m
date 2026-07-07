Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C218DC43458
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  7 Jul 2026 12:44:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From
	:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=w+J6WdfZFH1bS2qqxlSi1x6do4VNs9xmmzTClw3OiBw=; b=NNo58Ij6Su7NSj0cghWuKJUTId
	zogBQS61yGyZszOIEVvJiQg+MeIL5MAta8TIFrT5atnmjyKsuIYcLSXnGBpCzp462skAeQZfhHTJT
	ZhOYA6XY8VjQigHM4rwQDOXZljq9SoCuQ2hMTdKc4snCUztfYV+g6pTaMWNE5Qi041wIW+8M3S0n/
	KAw4/imQuYSuUIYo0yWt3fcm+L1t7buD8cZKomlNR1iTQ8se22qe+SURP7fruHuCXClFHPursDncw
	YjPMNe2YlbwozPGWJOkzAHxcK3Z0Uk9mEw6z1mKrXt9bNPSg6nGs1DqKOW/icKOyqCA2ZD8KIVULo
	dJ9jfMhg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wh59Z-0000000EyrB-0sc8;
	Tue, 07 Jul 2026 12:43:57 +0000
Received: from mail-ed1-x52c.google.com ([2a00:1450:4864:20::52c])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wh59V-0000000EyoH-2DWK
	for linux-arm-kernel@lists.infradead.org;
	Tue, 07 Jul 2026 12:43:55 +0000
Received: by mail-ed1-x52c.google.com with SMTP id 4fb4d7f45d1cf-698bf053053so6100660a12.3
        for <linux-arm-kernel@lists.infradead.org>; Tue, 07 Jul 2026 05:43:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1783428231; x=1784033031; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=w+J6WdfZFH1bS2qqxlSi1x6do4VNs9xmmzTClw3OiBw=;
        b=J8TTiOnMd4gRCC5eWE9ZXJLN7UrrIKIsVMhCkEqfcQN8spMyjHrUZTCcr6N7tp3cD0
         hRIIJd75WYiX2v7tPYZ/B2CKFWy5UL7cSfQwOtttFCJqs5zarziSkddzYz+lS9J969dn
         8XLuq680KIjUyuMoXzx04ZywZwPXUcqrPN9qvnAhK9it434S6Am8GTGPwt3K/wdEP/DN
         ojnaoazuGqEtKg9m9o8Jc7MCvFXhnob3br9GNm40yr1rPE0kjRW0/MOy7yO1/FobdF5w
         Wt6DgMG1ti1KLzJW8+mraojo7fLyGQk83BaghSrs5ZYKJW3QXow0h1foZeivXh6ZHBC2
         X9xA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783428231; x=1784033031;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=w+J6WdfZFH1bS2qqxlSi1x6do4VNs9xmmzTClw3OiBw=;
        b=KQlP2vUGWvfme7k5MsqdHhEgg/VsyAhiD+WX06xO+u2+bEgNlAKmlHL2qLjKspNJa9
         c5jwkG8/ijH8MINGNptx46xbB7qR7lYcSto0NEIcKtnTP3134XIy9qhS/Vov5RXEAI0i
         pA/egbWhdrhV3A9Vbi82U8Zpox+Q4VoUVvLip3D4n4cHgXRwFQau6WsQNWn1LKpXPA1m
         /mpZvV2ZXpw5mi4XWfwkKhi2tUlQgQnhzExnOCoIHEzi+pMHOEKo9HxG7LLsrGwMAlM0
         TvDo4NN353qhwofp58LkbVUiAGpeFT899roCYSZT/C3xz+V+AIUBWdk6TzRZXfvCIY6c
         ru0w==
X-Forwarded-Encrypted: i=1; AHgh+RotagFcfpnYIoGfLkMpoZP0HGBdBRfYJ4yN13IN9RSR59iJjnxJ/gNDQWBPbR5V5I9B9LLgGzOOGl3BOQOjCt+t@lists.infradead.org
X-Gm-Message-State: AOJu0YxUpunaAB9NzPGHVhXaR+D9zuiH0WWwWVLG3JeCkYA3K9DaVqyL
	/2NIejR4QKrJup8HcKv12G4734ZhW3U66qW6n5dydDuTDoUyG07XAlde680BE+1JD2U=
X-Gm-Gg: AfdE7cnghiS/m+0kNur/Btbx6O5jKzQAHVqArpWuBhJNYckuKNjtxjm4BvEQV6XX8OR
	rTIhr/vr0+8Hx/NXv74Ewum+5S1avK/YDrWC934MC8kJJBvI+qZKR7sHJAToCeA9d8dPEZAeIxA
	zY2v++dW8pl+ucMc4z5hzkrswuECK0Tb+vCxJ/eV0Tlf6n53jprMZ5tuc6rD82ujSdFFOPfy/x0
	k+TxshzxQSfuuxSQXH23cLLumWqKS108F2njjhrYT5Ij1P/c3TG0sEZqsCm++S8ac4vMUVBFo/2
	13X2+CZ+LWlThc7e3U+Uv3W+S3xZ2hZKqAXF8qjqPvziZRYrdLV9SggHWFLLKOZDbZ3p2192+V7
	JHnzUJFoBkF+45a+F8iz1jrDToaePFjP2VlHa8tHECKKaDRttLPBjlExD7R8YDg6Gh2enbL24SS
	dCA/XpS2ClfafFbu+XPPKp79pzStjVSNH6pkjwG+uNqK1TjrrX4MMkzXD79Vya
X-Received: by 2002:a17:906:b889:b0:c12:93e3:8a02 with SMTP id a640c23a62f3a-c15a67ce7c4mr198880866b.28.1783428231281;
        Tue, 07 Jul 2026 05:43:51 -0700 (PDT)
Received: from [192.168.2.177] (48.85-85-171.dynamic.clientes.euskaltel.es. [85.85.171.48])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c15ad821666sm126977766b.4.2026.07.07.05.43.49
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 07 Jul 2026 05:43:50 -0700 (PDT)
Message-ID: <aa8d27d8-8b4d-47bb-b401-94dde444ac7c@suse.com>
Date: Tue, 7 Jul 2026 14:43:49 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 2/3] pwm: rp1: Add RP1 PWM controller driver
To: Andrea della Porta <andrea.porta@suse.com>,
 =?UTF-8?Q?Uwe_Kleine-K=C3=B6nig?= <ukleinek@kernel.org>,
 linux-pwm@vger.kernel.org, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Florian Fainelli <florian.fainelli@broadcom.com>,
 Broadcom internal kernel review list
 <bcm-kernel-feedback-list@broadcom.com>, devicetree@vger.kernel.org,
 linux-rpi-kernel@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, Naushir Patuck <naush@raspberrypi.com>,
 Stanimir Varbanov <svarbanov@suse.de>, Sean Young <sean@mess.org>,
 Julian Braha <julianbraha@gmail.com>
References: <cover.1783097764.git.andrea.porta@suse.com>
 <5171610d8bebdd10eea44bff5236502d765b5918.1783097764.git.andrea.porta@suse.com>
Content-Language: en-US, ca-ES, es-ES
From: Matthias Brugger <mbrugger@suse.com>
Autocrypt: addr=mbrugger@suse.com; keydata=
 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
 PVrr2NoUqi/bxI8fFQJD1jVj8K0=
In-Reply-To: <5171610d8bebdd10eea44bff5236502d765b5918.1783097764.git.andrea.porta@suse.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260707_054353_729341_1D824E3B 
X-CRM114-Status: GOOD (  39.19  )
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



On 03/07/2026 19:05, Andrea della Porta wrote:
> From: Naushir Patuck <naush@raspberrypi.com>
> 
> The Raspberry Pi RP1 southbridge features an embedded PWM
> controller with 4 output channels, alongside an RPM interface
> to read the fan speed on the Raspberry Pi 5.
> 
> Add the supporting driver.
> 
> Signed-off-by: Naushir Patuck <naush@raspberrypi.com>
> Co-developed-by: Stanimir Varbanov <svarbanov@suse.de>
> Signed-off-by: Stanimir Varbanov <svarbanov@suse.de>
> Signed-off-by: Andrea della Porta <andrea.porta@suse.com>

Reviewed-by: Matthias Brugger <mbrugger@suse.com>

> ---
>   drivers/pwm/Kconfig   |   9 +
>   drivers/pwm/Makefile  |   1 +
>   drivers/pwm/pwm-rp1.c | 435 ++++++++++++++++++++++++++++++++++++++++++
>   3 files changed, 445 insertions(+)
>   create mode 100644 drivers/pwm/pwm-rp1.c
> 
> diff --git a/drivers/pwm/Kconfig b/drivers/pwm/Kconfig
> index e8886a9b64d96..0373dcf8d400d 100644
> --- a/drivers/pwm/Kconfig
> +++ b/drivers/pwm/Kconfig
> @@ -637,6 +637,15 @@ config PWM_ROCKCHIP
>   	  Generic PWM framework driver for the PWM controller found on
>   	  Rockchip SoCs.
>   
> +config PWM_RASPBERRYPI_RP1
> +	tristate "RP1 PWM support"
> +	depends on MISC_RP1 || COMPILE_TEST
> +	depends on HAS_IOMEM
> +	select REGMAP_MMIO
> +	select MFD_SYSCON
> +	help
> +	  PWM framework driver for Raspberry Pi RP1 controller.
> +
>   config PWM_SAMSUNG
>   	tristate "Samsung PWM support"
>   	depends on PLAT_SAMSUNG || ARCH_S5PV210 || ARCH_EXYNOS || COMPILE_TEST
> diff --git a/drivers/pwm/Makefile b/drivers/pwm/Makefile
> index 5630a521a7cff..c07fd24f69f39 100644
> --- a/drivers/pwm/Makefile
> +++ b/drivers/pwm/Makefile
> @@ -57,6 +57,7 @@ obj-$(CONFIG_PWM_RENESAS_RZG2L_GPT)	+= pwm-rzg2l-gpt.o
>   obj-$(CONFIG_PWM_RENESAS_RZ_MTU3)	+= pwm-rz-mtu3.o
>   obj-$(CONFIG_PWM_RENESAS_TPU)	+= pwm-renesas-tpu.o
>   obj-$(CONFIG_PWM_ROCKCHIP)	+= pwm-rockchip.o
> +obj-$(CONFIG_PWM_RASPBERRYPI_RP1)	+= pwm-rp1.o
>   obj-$(CONFIG_PWM_SAMSUNG)	+= pwm-samsung.o
>   obj-$(CONFIG_PWM_SIFIVE)	+= pwm-sifive.o
>   obj-$(CONFIG_PWM_SL28CPLD)	+= pwm-sl28cpld.o
> diff --git a/drivers/pwm/pwm-rp1.c b/drivers/pwm/pwm-rp1.c
> new file mode 100644
> index 0000000000000..8ef5ec9ed3a07
> --- /dev/null
> +++ b/drivers/pwm/pwm-rp1.c
> @@ -0,0 +1,435 @@
> +// SPDX-License-Identifier: GPL-2.0
> +/*
> + * pwm-rp1.c
> + *
> + * Raspberry Pi RP1 PWM.
> + *
> + * Copyright © 2026 Raspberry Pi Ltd.
> + *
> + * Author: Naushir Patuck (naush@raspberrypi.com)
> + *
> + * Based on the pwm-bcm2835 driver by:
> + * Bart Tanghe <bart.tanghe@thomasmore.be>
> + *
> + * Datasheet: https://pip-assets.raspberrypi.com/categories/892-raspberry-pi-5/documents/RP-008370-DS-1-rp1-peripherals.pdf?disposition=inline
> + *
> + * Limitations:
> + * - Channels can be enabled/disabled through a global update flag, while the
> + *   period and duty per-channel registers are independently updatable, and
> + *   they are latched on the end of (specific channel) period strobe.
> + *   This means that period and duty changes might result in glitches if the
> + *   period/duty is changed exactly during an end of period strobe.
> + * - Since the duty/period registers are freely updatable (do not depend on
> + *   the global update flag), setting one of them close to the period end and
> + *   the other right afterwards results in a mixed output for that cycle because
> + *   the write ops are not atomic.
> + * - The global update flag prevents mis-sampling of multi-bit bus signals in
> + *   the PWM clock domain. This ensures that all PWM channel settings update
> + *   on the same PWM clock cycle. Channels start in sync only if they share the
> + *   same period.
> + * - If both duty and period are set to 0, the output is a constant low signal
> + *   if polarity is normal or a constant high signal if polarity is inversed.
> + * - When disabled the output is driven to 0 if polarity is normal, or to 1
> + *   if polarity is inversed.
> + * - Disabling the PWM stops the output immediately, without waiting for current
> + *   period to complete first.
> + * - Channels are phase-capable, but on RPi5, the firmware can use a channel
> + *   phase register to report the RPM of the fan connected to that PWM
> + *   channel. As a result, phase control will be ignored for now.
> + */
> +
> +#include <linux/bitops.h>
> +#include <linux/clk.h>
> +#include <linux/err.h>
> +#include <linux/io.h>
> +#include <linux/module.h>
> +#include <linux/of.h>
> +#include <linux/platform_device.h>
> +#include <linux/pwm.h>
> +#include <linux/regmap.h>
> +#include <linux/mfd/syscon.h>
> +#include <linux/units.h>
> +
> +#define RP1_PWM_GLB_CTRL			0x000
> +#define RP1_PWM_GLB_CTRL_CHANNEL_ENABLE(chan)	BIT(chan)
> +#define RP1_PWM_GLB_CTRL_SET_UPDATE		BIT(31)
> +
> +#define RP1_PWM_CHAN_CTRL(chan)			(0x014 + ((chan) * 0x10))
> +#define RP1_PWM_CHAN_CTRL_POLARITY		BIT(3)
> +#define RP1_PWM_CHAN_CTRL_FIFO_POP_MASK		BIT(8)
> +#define RP1_PWM_CHAN_CTRL_MODE			GENMASK(2, 0)
> +enum rp1_pwm_ctrl_mode {
> +	RP1_PWM_CHAN_CTRL_MODE_ZERO,
> +	RP1_PWM_CHAN_CTRL_MODE_TE_MS,
> +	RP1_PWM_CHAN_CTRL_MODE_PC_MS,
> +	RP1_PWM_CHAN_CTRL_MODE_PD_ENC,
> +	RP1_PWM_CHAN_CTRL_MODE_MSB_SER,
> +	RP1_PWM_CHAN_CTRL_MODE_PPM,
> +	RP1_PWM_CHAN_CTRL_MODE_LE_MS,
> +	RP1_PWM_CHAN_CTRL_MODE_LSB_SER,
> +};
> +
> +#define RP1_PWM_CHAN_CTRL_DEFAULT		(RP1_PWM_CHAN_CTRL_FIFO_POP_MASK +  \
> +						FIELD_PREP(RP1_PWM_CHAN_CTRL_MODE, \
> +						RP1_PWM_CHAN_CTRL_MODE_TE_MS))
> +
> +#define RP1_PWM_RANGE(chan)			(0x018 + ((chan) * 0x10))
> +#define RP1_PWM_PHASE(chan)			(0x01C + ((chan) * 0x10))
> +#define RP1_PWM_DUTY(chan)			(0x020 + ((chan) * 0x10))
> +
> +#define RP1_PWM_NUM_PWMS			4
> +
> +struct rp1_pwm {
> +	struct regmap *regmap;
> +	struct clk *clk;
> +	unsigned long clk_rate;
> +	bool clk_enabled;
> +};
> +
> +struct rp1_pwm_waveform {
> +	u32 period_ticks;
> +	u32 duty_ticks;
> +	bool enabled;
> +	bool inverted_polarity;
> +};
> +
> +static const struct regmap_config rp1_pwm_regmap_config = {
> +	.reg_bits = 32,
> +	.val_bits = 32,
> +	.reg_stride = 4,
> +	.max_register = 0x60,
> +};
> +
> +static void rp1_pwm_apply_config(struct pwm_chip *chip, struct pwm_device *pwm)
> +{
> +	struct rp1_pwm *rp1 = pwmchip_get_drvdata(chip);
> +	u32 value;
> +
> +	/* update the changed registers on the next strobe to avoid glitches */
> +	regmap_read(rp1->regmap, RP1_PWM_GLB_CTRL, &value);
> +	value |= RP1_PWM_GLB_CTRL_SET_UPDATE;
> +	regmap_write(rp1->regmap, RP1_PWM_GLB_CTRL, value);
> +}
> +
> +static int rp1_pwm_request(struct pwm_chip *chip, struct pwm_device *pwm)
> +{
> +	struct rp1_pwm *rp1 = pwmchip_get_drvdata(chip);
> +
> +	/* init channel to reset defaults, preserving the polarity bit */
> +	regmap_update_bits(rp1->regmap, RP1_PWM_CHAN_CTRL(pwm->hwpwm),
> +			   ~(u32)RP1_PWM_CHAN_CTRL_POLARITY, RP1_PWM_CHAN_CTRL_DEFAULT);
> +	return 0;
> +}
> +
> +static int rp1_pwm_round_waveform_tohw(struct pwm_chip *chip,
> +				       struct pwm_device *pwm,
> +				       const struct pwm_waveform *wf,
> +				       void *_wfhw)
> +{
> +	struct rp1_pwm *rp1 = pwmchip_get_drvdata(chip);
> +	u64 period_ticks, duty_ticks, offset_ticks;
> +	struct rp1_pwm_waveform *wfhw = _wfhw;
> +	u64 clk_rate = rp1->clk_rate;
> +	int ret = 0;
> +
> +	if (!wf->period_length_ns) {
> +		wfhw->enabled = false;
> +		wfhw->inverted_polarity = (pwm_get_polarity(pwm) == PWM_POLARITY_INVERSED);
> +		return 0;
> +	}
> +
> +	period_ticks = mul_u64_u64_div_u64(wf->period_length_ns, clk_rate, NSEC_PER_SEC);
> +
> +	/*
> +	 * The period is limited to U32_MAX, and it will be decremented by one later
> +	 * to allow 100% duty cycle.
> +	 */
> +	if (period_ticks > U32_MAX) {
> +		period_ticks = U32_MAX;
> +	} else if (period_ticks < 2) {
> +		period_ticks = 2;
> +		ret = 1;
> +	}
> +
> +	duty_ticks = mul_u64_u64_div_u64(wf->duty_length_ns, clk_rate, NSEC_PER_SEC);
> +	duty_ticks = min(duty_ticks, period_ticks);
> +	offset_ticks = mul_u64_u64_div_u64(wf->duty_offset_ns, clk_rate, NSEC_PER_SEC);
> +	if (offset_ticks >= period_ticks) {
> +		u64 remainder;
> +
> +		div64_u64_rem(offset_ticks, period_ticks, &remainder);
> +		offset_ticks = remainder;
> +	}
> +	if (duty_ticks && offset_ticks &&
> +	    duty_ticks + offset_ticks >= period_ticks) {
> +		wfhw->duty_ticks = period_ticks - duty_ticks;
> +		wfhw->inverted_polarity = true;
> +	} else {
> +		wfhw->duty_ticks = duty_ticks;
> +		wfhw->inverted_polarity = false;
> +	}
> +	/* Account for the extra tick at the end of the period */
> +	wfhw->period_ticks = period_ticks - 1;
> +
> +	wfhw->enabled = true;
> +
> +	return ret;
> +}
> +
> +static int rp1_pwm_round_waveform_fromhw(struct pwm_chip *chip,
> +					 struct pwm_device *pwm,
> +					 const void *_wfhw,
> +					 struct pwm_waveform *wf)
> +{
> +	struct rp1_pwm *rp1 = pwmchip_get_drvdata(chip);
> +	const struct rp1_pwm_waveform *wfhw = _wfhw;
> +	u64 clk_rate = rp1->clk_rate;
> +	u64 ticks;
> +
> +	*wf = (struct pwm_waveform){ };
> +
> +	if (!wfhw->enabled)
> +		return 0;
> +
> +	wf->period_length_ns = DIV_ROUND_UP_ULL(((u64)wfhw->period_ticks + 1) * NSEC_PER_SEC,
> +						clk_rate);
> +
> +	if (!wfhw->inverted_polarity) {
> +		wf->duty_length_ns = DIV_ROUND_UP_ULL((u64)wfhw->duty_ticks * NSEC_PER_SEC,
> +						      (u32)clk_rate);
> +	} else {
> +		if (wfhw->duty_ticks > (u64)wfhw->period_ticks + 1) {
> +			/* 100% duty cycle case */
> +			ticks = 0;
> +		} else {
> +			ticks = (u64)wfhw->period_ticks + 1 - wfhw->duty_ticks;
> +		}
> +		wf->duty_length_ns = DIV_ROUND_UP_ULL(ticks * NSEC_PER_SEC, clk_rate);
> +		wf->duty_offset_ns = wf->period_length_ns - wf->duty_length_ns;
> +	}
> +
> +	return 0;
> +}
> +
> +static int rp1_pwm_write_waveform(struct pwm_chip *chip,
> +				  struct pwm_device *pwm,
> +				  const void *_wfhw)
> +{
> +	struct rp1_pwm *rp1 = pwmchip_get_drvdata(chip);
> +	const struct rp1_pwm_waveform *wfhw = _wfhw;
> +	u32 value, ctrl;
> +
> +	/* set polarity */
> +	regmap_read(rp1->regmap, RP1_PWM_CHAN_CTRL(pwm->hwpwm), &value);
> +	if (!wfhw->inverted_polarity)
> +		value &= ~RP1_PWM_CHAN_CTRL_POLARITY;
> +	else
> +		value |= RP1_PWM_CHAN_CTRL_POLARITY;
> +	regmap_write(rp1->regmap, RP1_PWM_CHAN_CTRL(pwm->hwpwm), value);
> +
> +	/* early exit if disabled */
> +	regmap_read(rp1->regmap, RP1_PWM_GLB_CTRL, &ctrl);
> +	if (!wfhw->enabled) {
> +		ctrl &= ~RP1_PWM_GLB_CTRL_CHANNEL_ENABLE(pwm->hwpwm);
> +		goto exit_disable;
> +	}
> +
> +	/* set period and duty cycle */
> +	regmap_write(rp1->regmap,
> +		     RP1_PWM_RANGE(pwm->hwpwm), wfhw->period_ticks);
> +	regmap_write(rp1->regmap,
> +		     RP1_PWM_DUTY(pwm->hwpwm), wfhw->duty_ticks);
> +
> +	/* enable the channel */
> +	ctrl |= RP1_PWM_GLB_CTRL_CHANNEL_ENABLE(pwm->hwpwm);
> +exit_disable:
> +	regmap_write(rp1->regmap, RP1_PWM_GLB_CTRL, ctrl);
> +
> +	rp1_pwm_apply_config(chip, pwm);
> +
> +	return 0;
> +}
> +
> +static int rp1_pwm_read_waveform(struct pwm_chip *chip,
> +				 struct pwm_device *pwm,
> +				 void *_wfhw)
> +{
> +	struct rp1_pwm *rp1 = pwmchip_get_drvdata(chip);
> +	struct rp1_pwm_waveform *wfhw = _wfhw;
> +	u32 value;
> +
> +	regmap_read(rp1->regmap, RP1_PWM_GLB_CTRL, &value);
> +	wfhw->enabled = !!(value & RP1_PWM_GLB_CTRL_CHANNEL_ENABLE(pwm->hwpwm));
> +
> +	regmap_read(rp1->regmap, RP1_PWM_CHAN_CTRL(pwm->hwpwm), &value);
> +	wfhw->inverted_polarity = !!(value & RP1_PWM_CHAN_CTRL_POLARITY);
> +
> +	if (wfhw->enabled) {
> +		regmap_read(rp1->regmap, RP1_PWM_RANGE(pwm->hwpwm), &wfhw->period_ticks);
> +		regmap_read(rp1->regmap, RP1_PWM_DUTY(pwm->hwpwm), &wfhw->duty_ticks);
> +	} else {
> +		wfhw->period_ticks = 0;
> +		wfhw->duty_ticks = 0;
> +	}
> +
> +	return 0;
> +}
> +
> +static const struct pwm_ops rp1_pwm_ops = {
> +	.sizeof_wfhw = sizeof(struct rp1_pwm_waveform),
> +	.request = rp1_pwm_request,
> +	.round_waveform_tohw = rp1_pwm_round_waveform_tohw,
> +	.round_waveform_fromhw = rp1_pwm_round_waveform_fromhw,
> +	.read_waveform = rp1_pwm_read_waveform,
> +	.write_waveform = rp1_pwm_write_waveform,
> +};
> +
> +static int rp1_pwm_probe(struct platform_device *pdev)
> +{
> +	struct device *dev = &pdev->dev;
> +	struct device_node *np = dev->of_node;
> +	unsigned long clk_rate;
> +	struct pwm_chip *chip;
> +	void __iomem	*base;
> +	struct rp1_pwm *rp1;
> +	int ret;
> +
> +	chip = devm_pwmchip_alloc(dev, RP1_PWM_NUM_PWMS, sizeof(*rp1));
> +	if (IS_ERR(chip))
> +		return PTR_ERR(chip);
> +
> +	rp1 = pwmchip_get_drvdata(chip);
> +
> +	base = devm_platform_ioremap_resource(pdev, 0);
> +	if (IS_ERR(base))
> +		return PTR_ERR(base);
> +
> +	rp1->regmap = devm_regmap_init_mmio(dev, base, &rp1_pwm_regmap_config);
> +	if (IS_ERR(rp1->regmap))
> +		return dev_err_probe(dev, PTR_ERR(rp1->regmap), "Cannot initialize regmap\n");
> +
> +	rp1->clk = devm_clk_get(dev, NULL);
> +	if (IS_ERR(rp1->clk))
> +		return dev_err_probe(dev, PTR_ERR(rp1->clk), "Clock not found\n");
> +
> +	ret = clk_prepare_enable(rp1->clk);
> +	if (ret)
> +		return dev_err_probe(dev, ret, "Failed to enable clock\n");
> +	rp1->clk_enabled = true;
> +
> +	ret = devm_clk_rate_exclusive_get(dev, rp1->clk);
> +	if (ret) {
> +		dev_err_probe(dev, ret, "Failed to get exclusive rate\n");
> +		goto err_disable_clk;
> +	}
> +
> +	clk_rate = clk_get_rate(rp1->clk);
> +	if (!clk_rate) {
> +		ret = dev_err_probe(dev, -EINVAL, "Failed to get clock rate\n");
> +		goto err_disable_clk;
> +	}
> +	/*
> +	 * To prevent u64 overflow in period calculations:
> +	 * mul_u64_u64_div_u64(period_ns, clk_rate, NSEC_PER_SEC)
> +	 * If clk_rate > 1 GHz, the result can overflow.
> +	 */
> +	if (clk_rate > HZ_PER_GHZ) {
> +		ret = dev_err_probe(dev, -EINVAL, "Clock rate > 1 GHz is not supported\n");
> +		goto err_disable_clk;
> +	}
> +	rp1->clk_rate = clk_rate;
> +
> +	chip->ops = &rp1_pwm_ops;
> +	chip->atomic = true;
> +
> +	platform_set_drvdata(pdev, chip);
> +
> +	ret = pwmchip_add(chip);
> +	if (ret) {
> +		dev_err_probe(dev, ret, "Failed to register PWM chip\n");
> +		goto err_disable_clk;
> +	}
> +
> +	ret = of_syscon_register_regmap(np, rp1->regmap);
> +	if (ret) {
> +		dev_err_probe(dev, ret, "Failed to register syscon\n");
> +		goto err_remove_chip;
> +	}
> +
> +	return 0;
> +
> +err_remove_chip:
> +	pwmchip_remove(chip);
> +err_disable_clk:
> +	clk_disable_unprepare(rp1->clk);
> +
> +	return ret;
> +}
> +
> +static void rp1_pwm_remove(struct platform_device *pdev)
> +{
> +	struct pwm_chip *chip = platform_get_drvdata(pdev);
> +	struct rp1_pwm *rp1 = pwmchip_get_drvdata(chip);
> +
> +	pwmchip_remove(chip);
> +
> +	if (rp1->clk_enabled) {
> +		clk_disable_unprepare(rp1->clk);
> +		rp1->clk_enabled = false;
> +	}
> +}
> +
> +static int rp1_pwm_suspend(struct device *dev)
> +{
> +	struct pwm_chip *chip = dev_get_drvdata(dev);
> +	struct rp1_pwm *rp1 = pwmchip_get_drvdata(chip);
> +
> +	if (rp1->clk_enabled) {
> +		clk_disable_unprepare(rp1->clk);
> +		rp1->clk_enabled = false;
> +	}
> +
> +	return 0;
> +}
> +
> +static int rp1_pwm_resume(struct device *dev)
> +{
> +	struct pwm_chip *chip = dev_get_drvdata(dev);
> +	struct rp1_pwm *rp1 = pwmchip_get_drvdata(chip);
> +	int ret;
> +
> +	ret = clk_prepare_enable(rp1->clk);
> +	if (ret) {
> +		dev_err(dev, "Failed to enable clock on resume: %pe\n", ERR_PTR(ret));
> +		return ret;
> +	}
> +
> +	rp1->clk_enabled = true;
> +
> +	return 0;
> +}
> +
> +static DEFINE_SIMPLE_DEV_PM_OPS(rp1_pwm_pm_ops, rp1_pwm_suspend, rp1_pwm_resume);
> +
> +static const struct of_device_id rp1_pwm_of_match[] = {
> +	{ .compatible = "raspberrypi,rp1-pwm" },
> +	{ /* sentinel */ }
> +};
> +MODULE_DEVICE_TABLE(of, rp1_pwm_of_match);
> +
> +static struct platform_driver rp1_pwm_driver = {
> +	.probe = rp1_pwm_probe,
> +	.remove = rp1_pwm_remove,
> +	.driver = {
> +		.name = "rp1-pwm",
> +		.of_match_table = rp1_pwm_of_match,
> +		.pm = pm_ptr(&rp1_pwm_pm_ops),
> +		.suppress_bind_attrs = true,
> +	},
> +};
> +builtin_platform_driver(rp1_pwm_driver);
> +
> +MODULE_DESCRIPTION("RP1 PWM driver");
> +MODULE_AUTHOR("Naushir Patuck <naush@raspberrypi.com>");
> +MODULE_AUTHOR("Andrea della Porta <andrea.porta@suse.com>");
> +MODULE_LICENSE("GPL");


