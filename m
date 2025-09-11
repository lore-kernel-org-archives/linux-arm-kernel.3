Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 31ADECAC58F
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 11 Sep 2025 00:37:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=GYrvQ7D9b6NhRXRDHgVqulriX5zXTRTpYH1+E3ILgrk=; b=FZNauEXNnbgr/RZysLm8hpo6MP
	pGuI0EoqGHV2XT/ymtwaHB4oZddzbWf6wG0A7JlxS2LM6skLBkZzOGYqZQynELr2k6/6IHnnrqvGl
	ZMUgLjD6d4m5+MLbmWWG7J1r7oPbO+kuM9Xfb/NYO285OAYl81w+GYJ1kI0/yXja5QwvMoG3aIvXI
	EW2nMnbuK7ihOVJgeoASW8VeWighfktluNlJVmLcmDlDQeTl6Gyn/Epy2xBeVDT8b+2egSE5bSDtR
	KlGGFIOLf0tf/TYQGkKuwUKAF65woFQQEyle8B6xhbBe7F6ulkP5rySA66hsiOS8SP/uKp6ycFQF2
	IcTp0yPQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uwVJw-0000000HXPz-1xgd;
	Thu, 11 Sep 2025 00:37:52 +0000
Received: from mail-io1-xd31.google.com ([2607:f8b0:4864:20::d31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uwVJu-0000000HXOg-0r5K
	for linux-arm-kernel@lists.infradead.org;
	Thu, 11 Sep 2025 00:37:51 +0000
Received: by mail-io1-xd31.google.com with SMTP id ca18e2360f4ac-88c4a7ff3c5so4751539f.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 10 Sep 2025 17:37:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1757551069; x=1758155869; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=GYrvQ7D9b6NhRXRDHgVqulriX5zXTRTpYH1+E3ILgrk=;
        b=OD8jjdNabbBVlVsWklqx4PWPTi+8W4GAJg+POHA33rEm6fm7jo0/jehmDcTqSZ4bcQ
         RCoL8BIIpxgvvCtxaOkFNt4CVwjjkhzWL0sNEAimM+6g6jeEq5c9t1DSJLF/lut3V+Mr
         ZyMGQqYB+qyJGTwRDqr1owq18CEDNgxBK8O2tk3o/DWfU1O1h0Tfyp/qWC6KDuTFhoc5
         Trkf1BciE2BcYr7Msg/1lpITfDVg7bFnLd7V5qQPVBAGp1EJdIQupg3Rte5NHHLh7bYd
         cS1t3NEEfNiYh1Tw1Sp60a7kPGBSB6noUP3owd5xkC4MjuU/KtfYKZZcErBkMRtxOPP4
         EGnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757551069; x=1758155869;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=GYrvQ7D9b6NhRXRDHgVqulriX5zXTRTpYH1+E3ILgrk=;
        b=J1U8D/ZNf6m3YbYy5vYloI8mG4ZWEooB6fa/eVJmq2jUR07EqkTQow55qCLP8ZK2XC
         6EV/RML5Kn+4Ben96q54BuhFGZUziP7fujND9Jk7KQLjOgh2qr0eA6+ljE4Doknbmn+V
         6t4C+vEW7m/Sk1GUDhoF9L/OJG3l0HzgjMjE0oP1Lsk9VmycIssb9N8ZekORbpN6uowm
         2vy16BDqQEV8D6VzmqbYOjkREzixIWQN+nqVx6mmAA9FmRP/1jD92oymj5nEpjOo8anG
         Ply5qfOlX5Oq26t3TKtl+yp0e/21wrFxtvhi+WBVgHpKFZihLLniCR/Wano7712hSrsV
         +PKA==
X-Forwarded-Encrypted: i=1; AJvYcCVVNUUdpsFxB+ZSVB8+OS+8Q5v/tVhyGIqZKohbvKd22apD6yx3C7Aar/Uzx2qr11riaJKr4PfqvJqy3RvoGduN@lists.infradead.org
X-Gm-Message-State: AOJu0YykrKpv6XHgQL7c/QTBwRFEsZ23txrn8unp28B3uFRasse+a4FY
	kFKP5amFwW1DgihBZPG8fEW88Ly2V01YlxHcJk2O0dKC6DAb0gfnQq/j5G6spfmOVhI=
X-Gm-Gg: ASbGncsDmZi41rgkfcVsQyzRCTFFjL8iwGD876E1PUAezRyVrGrjhu0dIQwO87xQo1p
	pMzRYPNoLI0ibYFzVyzUHCWi+nO8N5l2Iezo42fjCd9QK1wt6uWXK3v6q+A1H2UL39Djj3F+jvh
	g8tTfIHOG5K3mfVWDZYKfEwLVZIS7E78Rmg/87OmYHqj44OqMfQn/hjLSC2VWf6qWHPwazxdtyv
	8WGKq/09LRDBBJRfHmnd5XGiv9xRIcSegGbwKO6C1TqnPuVsYNmPHUWQwDA892p/jnKiW/c33bL
	WSMLTmU3UJCRZNZ34iAlQ3GitvKzZKm68zxvTj0eRlSg9S3kmGMb8NzXd0Tv5m/VqbGgPHEC5tX
	M+BX0P1stSF3MKX5fAh+a8UmjVJE=
X-Google-Smtp-Source: AGHT+IHypX0rxdgejA/TynvZgj1dNh9JG3EM022EojH8sVkAbfYd3XtSQqZeY9jgEc3I2pTdN6xPVg==
X-Received: by 2002:a05:6e02:b4c:b0:405:5e08:a3e4 with SMTP id e9e14a558f8ab-4055e17ea60mr187077025ab.1.1757551068770;
        Wed, 10 Sep 2025 17:37:48 -0700 (PDT)
Received: from [100.64.0.1] ([170.85.6.207])
        by smtp.gmail.com with ESMTPSA id 8926c6da1cb9f-511f3067eb8sm8720173.54.2025.09.10.17.37.47
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 10 Sep 2025 17:37:48 -0700 (PDT)
Message-ID: <01a7cc78-fdae-4a1e-bf78-961e7ec214b2@sifive.com>
Date: Wed, 10 Sep 2025 19:37:46 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 11/15] gpio: sifive: use new generic GPIO chip API
To: Bartosz Golaszewski <brgl@bgdev.pl>
Cc: linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-mips@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, linux-riscv@lists.infradead.org,
 spacemit@lists.linux.dev,
 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
 Linus Walleij <linus.walleij@linaro.org>,
 Keguang Zhang <keguang.zhang@gmail.com>, Alban Bedel <albeu@free.fr>,
 Doug Berger <opendmb@gmail.com>,
 Florian Fainelli <florian.fainelli@broadcom.com>,
 Broadcom internal kernel review list
 <bcm-kernel-feedback-list@broadcom.com>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Paul Walmsley <paul.walmsley@sifive.com>, Yixun Lan <dlan@gentoo.org>,
 Andy Shevchenko <andy@kernel.org>
References: <20250910-gpio-mmio-gpio-conv-part4-v2-0-f3d1a4c57124@linaro.org>
 <20250910-gpio-mmio-gpio-conv-part4-v2-11-f3d1a4c57124@linaro.org>
From: Samuel Holland <samuel.holland@sifive.com>
Content-Language: en-US
In-Reply-To: <20250910-gpio-mmio-gpio-conv-part4-v2-11-f3d1a4c57124@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250910_173750_278616_72EC851B 
X-CRM114-Status: GOOD (  27.29  )
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

Hi Bartosz,

On 2025-09-10 2:12 AM, Bartosz Golaszewski wrote:
> From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> 
> Convert the driver to using the new generic GPIO chip interfaces from
> linux/gpio/generic.h.
> 
> Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> ---
>  drivers/gpio/gpio-sifive.c | 73 ++++++++++++++++++++++++----------------------
>  1 file changed, 38 insertions(+), 35 deletions(-)
> 
> diff --git a/drivers/gpio/gpio-sifive.c b/drivers/gpio/gpio-sifive.c
> index 98ef975c44d9a6c9238605cfd1d5820fd70a66ca..2ced87ffd3bbf219c11857391eb4ea808adc0527 100644
> --- a/drivers/gpio/gpio-sifive.c
> +++ b/drivers/gpio/gpio-sifive.c
> @@ -7,6 +7,7 @@
>  #include <linux/device.h>
>  #include <linux/errno.h>
>  #include <linux/gpio/driver.h>
> +#include <linux/gpio/generic.h>
>  #include <linux/init.h>
>  #include <linux/platform_device.h>
>  #include <linux/property.h>
> @@ -32,7 +33,7 @@
>  
>  struct sifive_gpio {
>  	void __iomem		*base;
> -	struct gpio_chip	gc;
> +	struct gpio_generic_chip gen_gc;
>  	struct regmap		*regs;
>  	unsigned long		irq_state;
>  	unsigned int		trigger[SIFIVE_GPIO_MAX];
> @@ -41,10 +42,10 @@ struct sifive_gpio {
>  
>  static void sifive_gpio_set_ie(struct sifive_gpio *chip, unsigned int offset)
>  {
> -	unsigned long flags;
>  	unsigned int trigger;
>  
> -	raw_spin_lock_irqsave(&chip->gc.bgpio_lock, flags);
> +	guard(gpio_generic_lock_irqsave)(&chip->gen_gc);
> +
>  	trigger = (chip->irq_state & BIT(offset)) ? chip->trigger[offset] : 0;
>  	regmap_update_bits(chip->regs, SIFIVE_GPIO_RISE_IE, BIT(offset),
>  			   (trigger & IRQ_TYPE_EDGE_RISING) ? BIT(offset) : 0);
> @@ -54,7 +55,6 @@ static void sifive_gpio_set_ie(struct sifive_gpio *chip, unsigned int offset)
>  			   (trigger & IRQ_TYPE_LEVEL_HIGH) ? BIT(offset) : 0);
>  	regmap_update_bits(chip->regs, SIFIVE_GPIO_LOW_IE, BIT(offset),
>  			   (trigger & IRQ_TYPE_LEVEL_LOW) ? BIT(offset) : 0);
> -	raw_spin_unlock_irqrestore(&chip->gc.bgpio_lock, flags);
>  }
>  
>  static int sifive_gpio_irq_set_type(struct irq_data *d, unsigned int trigger)
> @@ -72,13 +72,12 @@ static int sifive_gpio_irq_set_type(struct irq_data *d, unsigned int trigger)
>  }
>  
>  static void sifive_gpio_irq_enable(struct irq_data *d)
> -{
> +	{

This looks like an unintentional whitespace change.

>  	struct gpio_chip *gc = irq_data_get_irq_chip_data(d);
>  	struct sifive_gpio *chip = gpiochip_get_data(gc);
>  	irq_hw_number_t hwirq = irqd_to_hwirq(d);
>  	int offset = hwirq % SIFIVE_GPIO_MAX;
>  	u32 bit = BIT(offset);
> -	unsigned long flags;
>  
>  	gpiochip_enable_irq(gc, hwirq);
>  	irq_chip_enable_parent(d);
> @@ -86,13 +85,13 @@ static void sifive_gpio_irq_enable(struct irq_data *d)
>  	/* Switch to input */
>  	gc->direction_input(gc, offset);
>  
> -	raw_spin_lock_irqsave(&gc->bgpio_lock, flags);
> -	/* Clear any sticky pending interrupts */
> -	regmap_write(chip->regs, SIFIVE_GPIO_RISE_IP, bit);
> -	regmap_write(chip->regs, SIFIVE_GPIO_FALL_IP, bit);
> -	regmap_write(chip->regs, SIFIVE_GPIO_HIGH_IP, bit);
> -	regmap_write(chip->regs, SIFIVE_GPIO_LOW_IP, bit);
> -	raw_spin_unlock_irqrestore(&gc->bgpio_lock, flags);
> +	scoped_guard(gpio_generic_lock_irqsave, &chip->gen_gc) {
> +		/* Clear any sticky pending interrupts */
> +		regmap_write(chip->regs, SIFIVE_GPIO_RISE_IP, bit);
> +		regmap_write(chip->regs, SIFIVE_GPIO_FALL_IP, bit);
> +		regmap_write(chip->regs, SIFIVE_GPIO_HIGH_IP, bit);
> +		regmap_write(chip->regs, SIFIVE_GPIO_LOW_IP, bit);
> +	}

This block (and the copy below) don't actually need any locking, since these are
R/W1C bits. From the manual: "Once the interrupt is pending, it will remain set
until a 1 is written to the *_ip register at that bit." I can send this as a
follow-up improvement if you want to keep this limited to the API conversion.

So with the minor whitespace fix:
Reviewed-by: Samuel Holland <samuel.holland@sifive.com>

Regards,
Samuel

>  
>  	/* Enable interrupts */
>  	assign_bit(offset, &chip->irq_state, 1);
> @@ -118,15 +117,14 @@ static void sifive_gpio_irq_eoi(struct irq_data *d)
>  	struct sifive_gpio *chip = gpiochip_get_data(gc);
>  	int offset = irqd_to_hwirq(d) % SIFIVE_GPIO_MAX;
>  	u32 bit = BIT(offset);
> -	unsigned long flags;
>  
> -	raw_spin_lock_irqsave(&gc->bgpio_lock, flags);
> -	/* Clear all pending interrupts */
> -	regmap_write(chip->regs, SIFIVE_GPIO_RISE_IP, bit);
> -	regmap_write(chip->regs, SIFIVE_GPIO_FALL_IP, bit);
> -	regmap_write(chip->regs, SIFIVE_GPIO_HIGH_IP, bit);
> -	regmap_write(chip->regs, SIFIVE_GPIO_LOW_IP, bit);
> -	raw_spin_unlock_irqrestore(&gc->bgpio_lock, flags);
> +	scoped_guard(gpio_generic_lock_irqsave, &chip->gen_gc) {
> +		/* Clear all pending interrupts */
> +		regmap_write(chip->regs, SIFIVE_GPIO_RISE_IP, bit);
> +		regmap_write(chip->regs, SIFIVE_GPIO_FALL_IP, bit);
> +		regmap_write(chip->regs, SIFIVE_GPIO_HIGH_IP, bit);
> +		regmap_write(chip->regs, SIFIVE_GPIO_LOW_IP, bit);
> +	}
>  
>  	irq_chip_eoi_parent(d);
>  }
> @@ -179,6 +177,7 @@ static const struct regmap_config sifive_gpio_regmap_config = {
>  
>  static int sifive_gpio_probe(struct platform_device *pdev)
>  {
> +	struct gpio_generic_chip_config config;
>  	struct device *dev = &pdev->dev;
>  	struct irq_domain *parent;
>  	struct gpio_irq_chip *girq;
> @@ -217,13 +216,17 @@ static int sifive_gpio_probe(struct platform_device *pdev)
>  	 */
>  	parent = irq_get_irq_data(chip->irq_number[0])->domain;
>  
> -	ret = bgpio_init(&chip->gc, dev, 4,
> -			 chip->base + SIFIVE_GPIO_INPUT_VAL,
> -			 chip->base + SIFIVE_GPIO_OUTPUT_VAL,
> -			 NULL,
> -			 chip->base + SIFIVE_GPIO_OUTPUT_EN,
> -			 chip->base + SIFIVE_GPIO_INPUT_EN,
> -			 BGPIOF_READ_OUTPUT_REG_SET);
> +	config = (struct gpio_generic_chip_config) {
> +		.dev = dev,
> +		.sz = 4,
> +		.dat = chip->base + SIFIVE_GPIO_INPUT_VAL,
> +		.set = chip->base + SIFIVE_GPIO_OUTPUT_VAL,
> +		.dirout = chip->base + SIFIVE_GPIO_OUTPUT_EN,
> +		.dirin = chip->base + SIFIVE_GPIO_INPUT_EN,
> +		.flags = BGPIOF_READ_OUTPUT_REG_SET,
> +	};
> +
> +	ret = gpio_generic_chip_init(&chip->gen_gc, &config);
>  	if (ret) {
>  		dev_err(dev, "unable to init generic GPIO\n");
>  		return ret;
> @@ -236,12 +239,12 @@ static int sifive_gpio_probe(struct platform_device *pdev)
>  	regmap_write(chip->regs, SIFIVE_GPIO_LOW_IE, 0);
>  	chip->irq_state = 0;
>  
> -	chip->gc.base = -1;
> -	chip->gc.ngpio = ngpio;
> -	chip->gc.label = dev_name(dev);
> -	chip->gc.parent = dev;
> -	chip->gc.owner = THIS_MODULE;
> -	girq = &chip->gc.irq;
> +	chip->gen_gc.gc.base = -1;
> +	chip->gen_gc.gc.ngpio = ngpio;
> +	chip->gen_gc.gc.label = dev_name(dev);
> +	chip->gen_gc.gc.parent = dev;
> +	chip->gen_gc.gc.owner = THIS_MODULE;
> +	girq = &chip->gen_gc.gc.irq;
>  	gpio_irq_chip_set_chip(girq, &sifive_gpio_irqchip);
>  	girq->fwnode = dev_fwnode(dev);
>  	girq->parent_domain = parent;
> @@ -249,7 +252,7 @@ static int sifive_gpio_probe(struct platform_device *pdev)
>  	girq->handler = handle_bad_irq;
>  	girq->default_type = IRQ_TYPE_NONE;
>  
> -	return gpiochip_add_data(&chip->gc, chip);
> +	return gpiochip_add_data(&chip->gen_gc.gc, chip);
>  }
>  
>  static const struct of_device_id sifive_gpio_match[] = {
> 


