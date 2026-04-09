Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 490F1F31E5B
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  9 Apr 2026 16:14:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:Date:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=bBKgfLsTkzPVnY3AYieDVnJ/jktPCR6tcs7xRYIk1ro=; b=FPUFnDxNcH3VwYwa2w1kbdmESU
	L4XISVJ1LkQLPovzvVAoFf7vBvvj9PQ/RC4euspvxsdXa3VKNhVNaJ0pmP4jRLNryTxldX1dbLogl
	vH2+/YPHplIw33VaALNyZaqx27jG3CEednPfHgOTaTebVw6nC7Ec9Ahm9W+z6qXXbcRJ6gggMOlPe
	1S+97ABbo+zKze8gmHdw6IxGJpj8xLeLLMo3s89fM7QUhv4qjZk+wnao9aAInL+38Vfi56MVAvMhw
	lwhgMIG9gmVug2GTaNE2Y/X9i4EhzWXpx2NvgRt5AV9UNDa1+DUDJqv8Z3JErbWeHp/fE5gtoODdD
	uZMx3fQQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wAs0l-0000000Atsj-0Ect;
	Thu, 09 Apr 2026 16:13:43 +0000
Received: from mail-wr1-x42a.google.com ([2a00:1450:4864:20::42a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wAs0f-0000000Atrh-28k7
	for linux-arm-kernel@lists.infradead.org;
	Thu, 09 Apr 2026 16:13:39 +0000
Received: by mail-wr1-x42a.google.com with SMTP id ffacd0b85a97d-43cfbd17589so785139f8f.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 09 Apr 2026 09:13:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1775751215; x=1776356015; darn=lists.infradead.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:date:from:from:to
         :cc:subject:date:message-id:reply-to;
        bh=bBKgfLsTkzPVnY3AYieDVnJ/jktPCR6tcs7xRYIk1ro=;
        b=FIwwa8XhCTMNBwIf73ZTb41R0nqUeskJkiwAcyfoGafeK4Bd3abiSIJzwk882f4CJY
         9Phk5EUAAcFwG+7cPYfZYOHEMjehnIdDv5JLwQyQY4C2yYtsOZlkibkR6A7xbK7oVKag
         YMweYu9M9De0vXzcOZSHd+CL8bRRUDfJEF8umVmea+nJbIKhPRjXoAjpPxE6Xd9/z1r3
         +lD4tJMfK58oaFWdKZV/o+jB39Tqc7K3CGOiqVZZhmmeUWnAKMVsu+UCeXjQgZzKnBa+
         Wsv681bMTGwhTFfP64+XbtHilqCRGYYbQfCXo8/uW2OBEe2ElEKLSXUOw5wvLKynJxhS
         84ng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775751215; x=1776356015;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=bBKgfLsTkzPVnY3AYieDVnJ/jktPCR6tcs7xRYIk1ro=;
        b=kCI/MQikuTY4q4XChPF8amdypUouus8TUyreexHsV4Zx0khwFsPr5GSnvxD8nPLOnc
         +OGxVTyYZKUROZh38UBAunJyAYHcd1BUYCNKYWhjuzbxzxF4TynvP8LYJ4TJ4J8QYj+4
         //WDOQhq3Ew0IW5zTQWoeFRYHEa+41/r0Foc4/OSgkRqphYRIeY99XRYmrs6ElONaGXZ
         leaxOliHw584WkEyKj2MlRn7a0Baugm2RPH3/2uU4MsZn7JCjKPFmlxNcq1BoMDB4Ss0
         yypatDEwW/MPbSEAhaEonpPDPLosg3juCQN6lcPa+Ype0Mod/rZ1v/kmzlSmKx6v9iaa
         AUkA==
X-Forwarded-Encrypted: i=1; AJvYcCW6Z1P+Eb3wiaCsoN2ZUTBz7EreTn1DPc54qiuuR4lnxy21VOKJLkCV1DR/Rd7tOPGwYMiXNFDKih0uX5k1Fz9R@lists.infradead.org
X-Gm-Message-State: AOJu0Yw4xK723VK0uNPaDTMlWzhVsPZroOM0L3uP2mG2U/vFZjeQSc6x
	67O1MMCFhDEvZ2jwbukDxp+leEROdO8jRBd/90ttweZ2eDnfkmZtq16zr1nZp/csViI=
X-Gm-Gg: AeBDievycVqZwxlW7idLmm3KMfLP0u3gA9kvrZglUe8Pw5dNXBpTOB0MNc+KjN44cfP
	GhCifnqwsRByR79zFd0bZbqfXdfbpVyUWzNUizX7x3FXHclf7Zz9VzzBqmGBvTneoTOx0uL+y0o
	3VLCmtLqcBa20FlGolGxD/7WdOPoveVKvvJutOekt6BLzzHU9pjzD5Y6e3dyp+tRJB6vhvDQbDr
	TGOvb7XANoXWEdR5AH2HpFB7kHNpsHSIZ5ij+FHbkSKzjtqgLf9aG2RJRcbqL8l8L963MGuNMEA
	vD3dnZiIhA+hVOwb1KuAuO/gy9ySMw+jnG+0+M6oXSwL4WB5l1W9ilXYjYlBUMWWWwTsQVYQdxk
	vFlMsTEJZmGkcfgNbirNDgJP6CerfiHndQI99bLAyomrsk3FjS+YwT9/pNfSfBursuDvUopDcZt
	Uahpgaxiq78CAynFseYmzQAl+4XqsGA2c/gF6wmGE7jPn02SNOkQ==
X-Received: by 2002:a05:6000:4310:b0:43c:ffcc:b682 with SMTP id ffacd0b85a97d-43d5a1a21ecmr6369277f8f.33.1775751214675;
        Thu, 09 Apr 2026 09:13:34 -0700 (PDT)
Received: from localhost (93-41-3-120.ip79.fastwebnet.it. [93.41.3.120])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43d1e2a720dsm69291174f8f.4.2026.04.09.09.13.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Apr 2026 09:13:34 -0700 (PDT)
From: Andrea della Porta <andrea.porta@suse.com>
X-Google-Original-From: Andrea della Porta <aporta@suse.de>
Date: Thu, 9 Apr 2026 18:16:41 +0200
To: Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <ukleinek@kernel.org>
Cc: Andrea della Porta <andrea.porta@suse.com>, linux-pwm@vger.kernel.org,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Florian Fainelli <florian.fainelli@broadcom.com>,
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
	devicetree@vger.kernel.org, linux-rpi-kernel@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	Naushir Patuck <naush@raspberrypi.com>,
	Stanimir Varbanov <svarbanov@suse.de>
Subject: Re: [PATCH 2/3] pwm: rp1: Add RP1 PWM controller driver
Message-ID: <adfQ6Tvst3Vd1Mxe@apocalypse>
References: <cover.1775223441.git.andrea.porta@suse.com>
 <28e29fbfc20c0b8a115d006233c2759d8f49e639.1775223441.git.andrea.porta@suse.com>
 <adLTwOTbkJ0VQXy6@monoceros>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <adLTwOTbkJ0VQXy6@monoceros>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260409_091337_629982_89A58E96 
X-CRM114-Status: GOOD (  50.71  )
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

On 23:45 Sun 05 Apr     , Uwe Kleine-König wrote:
> Hello Andrea,
> 
> On Fri, Apr 03, 2026 at 04:31:55PM +0200, Andrea della Porta wrote:
> > From: Naushir Patuck <naush@raspberrypi.com>
> > 
> > The Raspberry Pi RP1 southbridge features an embedded PWM
> > controller with 4 output channels, alongside an RPM interface
> > to read the fan speed on the Raspberry Pi 5.
> > 
> > Add the supporting driver.
> > 
> > Signed-off-by: Naushir Patuck <naush@raspberrypi.com>
> > Co-developed-by: Stanimir Varbanov <svarbanov@suse.de>
> > Signed-off-by: Stanimir Varbanov <svarbanov@suse.de>
> > Signed-off-by: Andrea della Porta <andrea.porta@suse.com>
> > ---
> >  drivers/pwm/Kconfig   |  10 ++
> >  drivers/pwm/Makefile  |   1 +
> >  drivers/pwm/pwm-rp1.c | 244 ++++++++++++++++++++++++++++++++++++++++++
> >  3 files changed, 255 insertions(+)
> >  create mode 100644 drivers/pwm/pwm-rp1.c
> > 
> > diff --git a/drivers/pwm/Kconfig b/drivers/pwm/Kconfig
> > index 6f3147518376a..22e4fc6385da2 100644
> > --- a/drivers/pwm/Kconfig
> > +++ b/drivers/pwm/Kconfig
> > @@ -625,6 +625,16 @@ config PWM_ROCKCHIP
> >  	  Generic PWM framework driver for the PWM controller found on
> >  	  Rockchip SoCs.
> >  
> > +config PWM_RP1
> 
> I prefer PWM_RASPBERRYPI1, or PWM_RASPBERRYPI_RP1 here.

Ack.

> 
> > +	tristate "RP1 PWM support"
> > +	depends on MISC_RP1 || COMPILE_TEST
> > +	depends on HWMON
> > +	help
> > +	  PWM framework driver for Raspberry Pi RP1 controller
> > +
> > +	  To compile this driver as a module, choose M here: the module
> > +	  will be called pwm-rp1.
> > +
> >  config PWM_SAMSUNG
> >  	tristate "Samsung PWM support"
> >  	depends on PLAT_SAMSUNG || ARCH_S5PV210 || ARCH_EXYNOS || COMPILE_TEST
> > diff --git a/drivers/pwm/Makefile b/drivers/pwm/Makefile
> > index 0dc0d2b69025d..895a7c42fe9c0 100644
> > --- a/drivers/pwm/Makefile
> > +++ b/drivers/pwm/Makefile
> > @@ -56,6 +56,7 @@ obj-$(CONFIG_PWM_RENESAS_RZG2L_GPT)	+= pwm-rzg2l-gpt.o
> >  obj-$(CONFIG_PWM_RENESAS_RZ_MTU3)	+= pwm-rz-mtu3.o
> >  obj-$(CONFIG_PWM_RENESAS_TPU)	+= pwm-renesas-tpu.o
> >  obj-$(CONFIG_PWM_ROCKCHIP)	+= pwm-rockchip.o
> > +obj-$(CONFIG_PWM_RP1)		+= pwm-rp1.o
> >  obj-$(CONFIG_PWM_SAMSUNG)	+= pwm-samsung.o
> >  obj-$(CONFIG_PWM_SIFIVE)	+= pwm-sifive.o
> >  obj-$(CONFIG_PWM_SL28CPLD)	+= pwm-sl28cpld.o
> > diff --git a/drivers/pwm/pwm-rp1.c b/drivers/pwm/pwm-rp1.c
> > new file mode 100644
> > index 0000000000000..0a1c1c1dd27e9
> > --- /dev/null
> > +++ b/drivers/pwm/pwm-rp1.c
> > @@ -0,0 +1,244 @@
> > +// SPDX-License-Identifier: GPL-2.0
> > +/*
> > + * pwm-rp1.c
> > + *
> > + * Raspberry Pi RP1 PWM.
> > + *
> > + * Copyright © 2026 Raspberry Pi Ltd.
> > + *
> > + * Author: Naushir Patuck (naush@raspberrypi.com)
> > + *
> > + * Based on the pwm-bcm2835 driver by:
> > + * Bart Tanghe <bart.tanghe@thomasmore.be>
> > + */
> 
> Please add a paragraph here named "Limitations" in the same format as
> several other drivers describing how the driver behaves on disable and
> configuration changes (can glitches occur? Is the currently running
> period completed or aborted?)

Ack.

> 
> > +#include <linux/bitops.h>
> > +#include <linux/clk.h>
> > +#include <linux/err.h>
> > +#include <linux/hwmon.h>
> > +#include <linux/io.h>
> > +#include <linux/module.h>
> > +#include <linux/of.h>
> > +#include <linux/platform_device.h>
> > +#include <linux/pwm.h>
> > +
> > +#define PWM_GLOBAL_CTRL		0x000
> > +#define PWM_CHANNEL_CTRL(x)	(0x014 + ((x) * 0x10))
> > +#define PWM_RANGE(x)		(0x018 + ((x) * 0x10))
> > +#define PWM_PHASE(x)		(0x01C + ((x) * 0x10))
> > +#define PWM_DUTY(x)		(0x020 + ((x) * 0x10))
> > +
> > +/* 8:FIFO_POP_MASK + 0:Trailing edge M/S modulation */
> > +#define PWM_CHANNEL_DEFAULT	(BIT(8) + BIT(0))
> > +#define PWM_CHANNEL_ENABLE(x)	BIT(x)
> > +#define PWM_POLARITY		BIT(3)
> > +#define SET_UPDATE		BIT(31)
> > +#define PWM_MODE_MASK		GENMASK(1, 0)
> > +
> > +#define NUM_PWMS		4
> 
> Please prefix all #defines by something driver specific (e.g. RP1_PWM_).

Ack.

> 
> > +
> > +struct rp1_pwm {
> > +	void __iomem	*base;
> > +	struct clk	*clk;
> > +};
> > +
> > +static const struct hwmon_channel_info * const rp1_fan_hwmon_info[] = {
> > +	HWMON_CHANNEL_INFO(fan, HWMON_F_INPUT),
> > +	NULL
> > +};
> > +
> > +static umode_t rp1_fan_hwmon_is_visible(const void *data, enum hwmon_sensor_types type,
> > +					u32 attr, int channel)
> > +{
> > +	umode_t mode = 0;
> > +
> > +	if (type == hwmon_fan && attr == hwmon_fan_input)
> > +		mode = 0444;
> > +
> > +	return mode;
> > +}
> > +
> > +static int rp1_fan_hwmon_read(struct device *dev, enum hwmon_sensor_types type,
> > +			      u32 attr, int channel, long *val)
> > +{
> > +	struct rp1_pwm *rp1 = dev_get_drvdata(dev);
> > +
> > +	if (type != hwmon_fan || attr != hwmon_fan_input)
> > +		return -EOPNOTSUPP;
> > +
> > +	*val = readl(rp1->base + PWM_PHASE(2));
> > +
> > +	return 0;
> > +}
> 
> I don't like having hwmon bits in pwm drivers. Is the PWM only usable
> for a fan? I guess the hwmon parts should be dropped and a pwm-fan
> defined in dt.

The pwm-fan generic driver expects an interrupt to count the RPM, while
on RP1 this data is passed via a register filled by the RP1 fw running
on the internal core. Instead of changing the generic pwm-fan driver,
I'll add a syscon to export this register which will be read by a new
device/driver registering an hwmon device.

> 
> > +static const struct hwmon_ops rp1_fan_hwmon_ops = {
> > +	.is_visible = rp1_fan_hwmon_is_visible,
> > +	.read = rp1_fan_hwmon_read,
> > +};
> > +
> > +static const struct hwmon_chip_info rp1_fan_hwmon_chip_info = {
> > +	.ops = &rp1_fan_hwmon_ops,
> > +	.info = rp1_fan_hwmon_info,
> > +};
> > +
> > +static void rp1_pwm_apply_config(struct pwm_chip *chip, struct pwm_device *pwm)
> > +{
> > +	struct rp1_pwm *rp1 = pwmchip_get_drvdata(chip);
> > +	u32 value;
> > +
> > +	value = readl(rp1->base + PWM_GLOBAL_CTRL);
> > +	value |= SET_UPDATE;
> > +	writel(value, rp1->base + PWM_GLOBAL_CTRL);
> > +}
> > +
> > +static int rp1_pwm_request(struct pwm_chip *chip, struct pwm_device *pwm)
> > +{
> > +	struct rp1_pwm *rp1 = pwmchip_get_drvdata(chip);
> > +
> > +	writel(PWM_CHANNEL_DEFAULT, rp1->base + PWM_CHANNEL_CTRL(pwm->hwpwm));
> 
> Please add a comment about what this does.

Ack.

> 
> > +	return 0;
> > +}
> > +
> > +static void rp1_pwm_free(struct pwm_chip *chip, struct pwm_device *pwm)
> > +{
> > +	struct rp1_pwm *rp1 = pwmchip_get_drvdata(chip);
> > +	u32 value;
> > +
> > +	value = readl(rp1->base + PWM_CHANNEL_CTRL(pwm->hwpwm));
> > +	value &= ~PWM_MODE_MASK;
> > +	writel(value, rp1->base + PWM_CHANNEL_CTRL(pwm->hwpwm));
> > +
> > +	rp1_pwm_apply_config(chip, pwm);
> 
> What is the purpose of this call?

To update the configuration on the next PWM strobe in order to avoid
glitches. I'll add a short comment in the code.

> 
> > +}
> > +
> > +static int rp1_pwm_apply(struct pwm_chip *chip, struct pwm_device *pwm,
> > +			 const struct pwm_state *state)
> > +{
> > +	struct rp1_pwm *rp1 = pwmchip_get_drvdata(chip);
> > +	unsigned long clk_rate = clk_get_rate(rp1->clk);
> > +	unsigned long clk_period;
> > +	u32 value;
> > +
> > +	if (!clk_rate) {
> > +		dev_err(&chip->dev, "failed to get clock rate\n");
> > +		return -EINVAL;
> > +	}
> > +
> > +	/* set period and duty cycle */
> > +	clk_period = DIV_ROUND_CLOSEST(NSEC_PER_SEC, clk_rate);
> 
> DIV_ROUND_CLOSEST is wrong here. (I don't go into details as .apply()
> should be dropped.)

Ack.

> 
> > +	writel(DIV_ROUND_CLOSEST(state->duty_cycle, clk_period),
> 
> Dividing by the result of a division loses precision.
> 
> > +	       rp1->base + PWM_DUTY(pwm->hwpwm));
> > +
> > +	writel(DIV_ROUND_CLOSEST(state->period, clk_period),
> > +	       rp1->base + PWM_RANGE(pwm->hwpwm));
> > +
> > +	/* set polarity */
> > +	value = readl(rp1->base + PWM_CHANNEL_CTRL(pwm->hwpwm));
> > +	if (state->polarity == PWM_POLARITY_NORMAL)
> > +		value &= ~PWM_POLARITY;
> > +	else
> > +		value |= PWM_POLARITY;
> > +	writel(value, rp1->base + PWM_CHANNEL_CTRL(pwm->hwpwm));
> > +
> > +	/* enable/disable */
> > +	value = readl(rp1->base + PWM_GLOBAL_CTRL);
> > +	if (state->enabled)
> > +		value |= PWM_CHANNEL_ENABLE(pwm->hwpwm);
> > +	else
> > +		value &= ~PWM_CHANNEL_ENABLE(pwm->hwpwm);
> > +	writel(value, rp1->base + PWM_GLOBAL_CTRL);
> > +
> > +	rp1_pwm_apply_config(chip, pwm);
> > +
> > +	return 0;
> > +}
> > +
> > +static const struct pwm_ops rp1_pwm_ops = {
> > +	.request = rp1_pwm_request,
> > +	.free = rp1_pwm_free,
> > +	.apply = rp1_pwm_apply,
> 
> Please implement the waveform callbacks instead of .apply().

Ack.

> 
> > +};
> > +
> > +static int rp1_pwm_probe(struct platform_device *pdev)
> > +{
> > +	struct device *dev = &pdev->dev;
> > +	struct device *hwmon_dev;
> > +	struct pwm_chip *chip;
> > +	struct rp1_pwm *rp1;
> > +	int ret;
> > +
> > +	chip = devm_pwmchip_alloc(dev, NUM_PWMS, sizeof(*rp1));
> > +	if (IS_ERR(chip))
> > +		return PTR_ERR(chip);
> > +
> > +	rp1 = pwmchip_get_drvdata(chip);
> > +
> > +	rp1->base = devm_platform_ioremap_resource(pdev, 0);
> > +	if (IS_ERR(rp1->base))
> > +		return PTR_ERR(rp1->base);
> > +
> > +	rp1->clk = devm_clk_get_enabled(dev, NULL);
> > +	if (IS_ERR(rp1->clk))
> > +		return dev_err_probe(dev, PTR_ERR(rp1->clk), "clock not found\n");
> 
> Please start error messages with a capital letter.

Ack.

> 
> > +
> > +	ret = devm_clk_rate_exclusive_get(dev, rp1->clk);
> 
> After this call you can determine the rate just once and fail if it's ==
> 0.

Ack.

> 
> > +	if (ret)
> > +		return dev_err_probe(dev, ret, "fail to get exclusive rate\n");
> > +
> > +	chip->ops = &rp1_pwm_ops;
> > +
> > +	platform_set_drvdata(pdev, chip);
> > +
> > +	ret = devm_pwmchip_add(dev, chip);
> > +	if (ret)
> > +		return dev_err_probe(dev, ret, "failed to register PWM chip\n");
> > +
> > +	hwmon_dev = devm_hwmon_device_register_with_info(dev, "rp1_fan_tach", rp1,
> > +							 &rp1_fan_hwmon_chip_info,
> > +							 NULL);
> > +
> > +	if (IS_ERR(hwmon_dev))
> > +		return dev_err_probe(dev, PTR_ERR(hwmon_dev),
> > +				     "failed to register hwmon fan device\n");
> > +
> > +	return 0;
> > +}
> > +
> > +static int rp1_pwm_suspend(struct device *dev)
> > +{
> > +	struct rp1_pwm *rp1 = dev_get_drvdata(dev);
> > +
> > +	clk_disable_unprepare(rp1->clk);
> > +
> > +	return 0;
> > +}
> > +
> > +static int rp1_pwm_resume(struct device *dev)
> > +{
> > +	struct rp1_pwm *rp1 = dev_get_drvdata(dev);
> > +
> > +	return clk_prepare_enable(rp1->clk);
> 
> Hmm, if this fails and then the driver is unbound, the clk operations
> are not balanced.

I'll add some flags to check if the clock is really enabled or not.

Regards,
Andrea

> 
> > +}
> > +
> > +static DEFINE_SIMPLE_DEV_PM_OPS(rp1_pwm_pm_ops, rp1_pwm_suspend, rp1_pwm_resume);
> > +
> > +static const struct of_device_id rp1_pwm_of_match[] = {
> > +	{ .compatible = "raspberrypi,rp1-pwm" },
> > +	{ /* sentinel */ }
> > +};
> > +MODULE_DEVICE_TABLE(of, rp1_pwm_of_match);
> > +
> > +static struct platform_driver rp1_pwm_driver = {
> > +	.probe = rp1_pwm_probe,
> > +	.driver = {
> > +		.name = "rp1-pwm",
> > +		.of_match_table = rp1_pwm_of_match,
> > +		.pm = pm_ptr(&rp1_pwm_pm_ops),
> > +	},
> > +};
> > +module_platform_driver(rp1_pwm_driver);
> > +
> > +MODULE_DESCRIPTION("RP1 PWM driver");
> > +MODULE_AUTHOR("Naushir Patuck <naush@raspberrypi.com>");
> > +MODULE_LICENSE("GPL");
> > -- 
> > 2.35.3
> > 
> 
> Best regards
> Uwe



