Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A3847C624A4
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  3 Sep 2026 09:00:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:References:MIME-Version:In-Reply-To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=GEYx+ojq8Royd9vV2bcO4nv/HSwYCfpOYZxRsx+XsKc=; b=0MY9T4QhGktE6a329ar2dPAJoA
	E+TseiQiJqervTZc5b8sWNaHE1Izvd8XZOM9bFGaU1H00j3ph9a8v6nD14wW+F9r0EX0fESwZOIFY
	z256SyMrIu7MFRLJixW0HK9ycEONpM2ktAE5xjchB6wq+XUyR4MAdrOBicoypm4cfLAm/sgmIZ/j9
	pzwB+DdH0HRkxRS3b+uF3PdxeDha62RkmOQPjGohg3X6I8+fnMv5OIxBWJsKTAk3adP153LDOJrR0
	DYu4zfE/xj7fh3nrNGATwT3d4DR9aoQhIJE5g5/XxgUH4Ta9SkaGytzsY8R51O7ZvErOwE14xWws1
	M6POa8oA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x23Ik-0000000Gs5x-3ypq;
	Thu, 03 Sep 2026 09:00:06 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x23Ij-0000000Gs5I-1Gc5
	for linux-arm-kernel@lists.infradead.org;
	Thu, 03 Sep 2026 09:00:05 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id CCC43600C8
	for <linux-arm-kernel@lists.infradead.org>; Thu,  3 Sep 2026 09:00:03 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 824E71F00A3E
	for <linux-arm-kernel@lists.infradead.org>; Thu,  3 Sep 2026 09:00:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788426003;
	bh=GEYx+ojq8Royd9vV2bcO4nv/HSwYCfpOYZxRsx+XsKc=;
	h=From:In-Reply-To:References:Date:Subject:To:Cc;
	b=DUGVww6FJhsGnXgZhiEjqrGKNx0H1mihS+E/HisLo7qmpgwpwIOXbWmI49CWvOfr7
	 9PMQy60Ar7ZhfLon9PR4b43NXAWKtKz/MfOYfLF1Pn2vOItlm7hmfrY8SGq2nTbYBU
	 0OnM16+vFDKxfanEkHLZNkJRNsSa56qb6LHSBKJ2nYHm0WD/a7S70rpL5BL2U0hDX/
	 wi2QQeQGoSS6tvrsj/52UUKcBBKyyg9bDDFvs/cNmQWBrDvNtSrS/uSYYBMAifHkUP
	 O/cm1CP65IbWbbcwux3IhEjWGfWjEC++6TitWyCGMHBlWKw2Lo/FffmZzlscWNFPzV
	 S6aDXhTjJ6W5g==
Received: by mail-lf1-f50.google.com with SMTP id 2adb3069b0e04-5b5e5ab03afso2072620e87.3
        for <linux-arm-kernel@lists.infradead.org>; Thu, 03 Sep 2026 02:00:03 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBza7uGppv5L6OcJ4Xue2t64K6vjLeG1HVwSObCny6p1yHnvQrryaseCcwBUdt3jFrBOSkbXlLuol4dpkclLEVGA@lists.infradead.org
X-Gm-Message-State: AFuF++l/4nSp4Vc2iyQHHr8eLXvOWoDF9pcVJUvEeLABHaAIMYX9J46/
	Covlh54+2noDR3SGNCF0IVs7UXlB7t8HO7Nvcw1RQN32iXJP1upL0GiFoGoDVdbaUhnRy1M9CZY
	Tr/N9slcGBrO9z0VCAfaY1sVCNmXJV792I5TPqr1d3Q==
X-Received: by 2002:a05:6512:239c:b0:5b0:c96:cc8c with SMTP id
 2adb3069b0e04-5b60834d7a2mr3312319e87.12.1788426000493; Thu, 03 Sep 2026
 02:00:00 -0700 (PDT)
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Thu, 3 Sep 2026 04:59:57 -0400
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Thu, 3 Sep 2026 04:59:57 -0400
From: Bartosz Golaszewski <brgl@kernel.org>
In-Reply-To: <20260903-axiado-ax3000-sgpio-controller-v3-2-b30820e1b858@axiado.com>
MIME-Version: 1.0
References: <20260903-axiado-ax3000-sgpio-controller-v3-0-b30820e1b858@axiado.com>
 <20260903-axiado-ax3000-sgpio-controller-v3-2-b30820e1b858@axiado.com>
Date: Thu, 3 Sep 2026 04:59:57 -0400
X-Gmail-Original-Message-ID: <CAMRc=MejseGw7P5MYSC=MKi1KeDn9PTd4WKJX_cgoh1WD3egVg@mail.gmail.com>
X-Gm-Features: AcwNN1Wb5d53ipUlE15H5F27WGBwMP5PUHZHGBO94uLYxXdMLAqLj2hyPpx69zo
Message-ID: <CAMRc=MejseGw7P5MYSC=MKi1KeDn9PTd4WKJX_cgoh1WD3egVg@mail.gmail.com>
Subject: Re: [PATCH v3 2/2] gpio: axiado: add AX3005 SGPIO controller support
To: Petar Stepanovic <pstepanovic@axiado.com>
Cc: linux-gpio@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	openbmc@lists.ozlabs.org, Tzu-Hao Wei <twei@axiado.com>, Swark Yang <syang@axiado.com>, 
	Prasad Bolisetty <pbolisetty@axiado.com>, Linus Walleij <linusw@kernel.org>, 
	Bartosz Golaszewski <brgl@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Harshit Shah <hshah@axiado.com>, SriNavmani A <srinavmani@axiado.com>, 
	Karthikeyan Mitran <kmitran@axiado.com>, Michael Walle <mwalle@kernel.org>
Content-Type: text/plain; charset="UTF-8"
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

On Thu, 3 Sep 2026 09:11:33 +0200, Petar Stepanovic
<pstepanovic@axiado.com> said:
> Add support for the Axiado AX3005 SGPIO controller.
>
> Each SGPIO position provides one input GPIO and one output GPIO with
> fixed directions. The driver registers the controller as a gpio_chip,
> supports interrupts on input GPIOs, and uses regmap for register access.
>
> Signed-off-by: Petar Stepanovic <pstepanovic@axiado.com>
> ---

...

> +
> +static int axiado_sgpio_probe(struct platform_device *pdev)
> +{
> +	struct gpio_regmap_config config = { };
> +	struct irq_domain_info d_info = { };
> +	struct axiado_sgpio *sgpio;
> +	unsigned int ngpio, i;
> +	unsigned long apb_freq;
> +	struct clk *apb_clk;
> +	void __iomem *base;
> +	u32 sgpio_freq;
> +	int irq, rc;
> +
> +	sgpio = devm_kzalloc(&pdev->dev, sizeof(*sgpio), GFP_KERNEL);
> +	if (!sgpio)
> +		return -ENOMEM;
> +
> +	/* The regmap callbacks below need both of these. */
> +	platform_set_drvdata(pdev, sgpio);
> +
> +	sgpio->regs = &axiado_sgpio_offsets;
> +
> +	base = devm_platform_ioremap_resource(pdev, 0);
> +	if (IS_ERR(base))
> +		return PTR_ERR(base);
> +
> +	sgpio->regmap = devm_regmap_init_mmio(&pdev->dev, base,
> +					      &axiado_sgpio_regmap_config);
> +	if (IS_ERR(sgpio->regmap))
> +		return dev_err_probe(&pdev->dev, PTR_ERR(sgpio->regmap),
> +				     "Failed to init regmap\n");
> +
> +	rc = device_property_read_u32(&pdev->dev, "ngpios", &ngpio);
> +	if (rc)
> +		return dev_err_probe(&pdev->dev, rc,
> +				     "Failed to read ngpios property\n");
> +
> +	/*
> +	 * Each SGPIO signal is exposed as one input and one output line, so
> +	 * the number of lines is twice the number of signals.
> +	 */
> +	if (!ngpio || ngpio % 2 || ngpio > SGPIO_MAX_SIGNALS * 2)
> +		return dev_err_probe(&pdev->dev, -EINVAL,
> +				     "Invalid ngpios value: %u (even, max %u)\n",
> +				     ngpio, SGPIO_MAX_SIGNALS * 2);
> +
> +	sgpio->nsignals = ngpio / 2;
> +
> +	sgpio->din_shadow = devm_kcalloc(&pdev->dev,
> +					 DIV_ROUND_UP(sgpio->nsignals,
> +						      SGPIO_BANK_SIZE),
> +					 sizeof(*sgpio->din_shadow), GFP_KERNEL);
> +	sgpio->irq_unmasked = devm_bitmap_zalloc(&pdev->dev, sgpio->nsignals,
> +						 GFP_KERNEL);
> +	sgpio->irq_rising = devm_bitmap_zalloc(&pdev->dev, sgpio->nsignals,
> +					       GFP_KERNEL);
> +	sgpio->irq_falling = devm_bitmap_zalloc(&pdev->dev, sgpio->nsignals,
> +						GFP_KERNEL);
> +	if (!sgpio->din_shadow || !sgpio->irq_unmasked ||
> +	    !sgpio->irq_rising || !sgpio->irq_falling)
> +		return -ENOMEM;
> +
> +	apb_clk = devm_clk_get_enabled(&pdev->dev, NULL);
> +	if (IS_ERR(apb_clk))
> +		return dev_err_probe(&pdev->dev, PTR_ERR(apb_clk),
> +				     "Failed to get and enable APB clock\n");
> +
> +	rc = device_property_read_u32(&pdev->dev, "bus-frequency",
> +				      &sgpio_freq);
> +	if (rc)
> +		return dev_err_probe(&pdev->dev, rc,
> +				     "Failed to read bus-frequency\n");
> +
> +	apb_freq = clk_get_rate(apb_clk);
> +
> +	if (!apb_freq || !sgpio_freq || sgpio_freq > apb_freq)
> +		return dev_err_probe(&pdev->dev, -EINVAL,
> +				     "Invalid SGPIO bus frequency\n");
> +
> +	sgpio->preset_value = (apb_freq / sgpio_freq) - 1;
> +	sgpio->count_value = sgpio->preset_value;
> +
> +	sgpio->pos_reg = SGPIO_POS(sgpio->nsignals - 1);
> +
> +	sgpio->din_bank_shift =	SGPIO_NUM_BANKS -
> +				DIV_ROUND_UP(sgpio->nsignals, SGPIO_BANK_SIZE);
> +
> +	/*
> +	 * From here on the hardware may be running, so the shutdown action has
> +	 * to be in place before the first register is programmed. It only ever
> +	 * writes zeroes, which is harmless if initialisation never got that
> +	 * far, and it runs before the APB clock is disabled because that was
> +	 * requested earlier.
> +	 */
> +	rc = devm_add_action_or_reset(&pdev->dev, axiado_sgpio_disable, sgpio);
> +	if (rc)
> +		return rc;
> +
> +	rc = axiado_sgpio_hw_init(sgpio);
> +	if (rc)
> +		return dev_err_probe(&pdev->dev, rc,
> +				     "Failed to initialize hardware\n");
> +
> +	rc = axiado_sgpio_init_input_cache(sgpio);
> +	if (rc)
> +		return dev_err_probe(&pdev->dev, rc,
> +				     "Failed to initialize input cache\n");
> +
> +	sgpio->dir_out = devm_bitmap_zalloc(&pdev->dev, ngpio, GFP_KERNEL);
> +	if (!sgpio->dir_out)
> +		return -ENOMEM;
> +
> +	/* Even lines are the serial inputs, odd lines the serial outputs. */
> +	for (i = 1; i < ngpio; i += 2)
> +		__set_bit(i, sgpio->dir_out);
> +
> +	d_info.fwnode = dev_fwnode(&pdev->dev);
> +	d_info.size = ngpio;
> +	d_info.hwirq_max = ngpio;
> +	d_info.ops = &axiado_sgpio_domain_ops;
> +	d_info.host_data = sgpio;
> +
> +	sgpio->domain = devm_irq_domain_instantiate(&pdev->dev, &d_info);
> +	if (IS_ERR(sgpio->domain))
> +		return PTR_ERR(sgpio->domain);
> +
> +	config.parent = &pdev->dev;
> +	config.regmap = sgpio->regmap;
> +	config.ngpio = ngpio;
> +	config.reg_dat_base = GPIO_REGMAP_ADDR(sgpio->regs->din_ss);
> +	config.reg_set_base = GPIO_REGMAP_ADDR(sgpio->regs->dout_ss);
> +	config.reg_mask_xlate = axiado_sgpio_reg_mask_xlate;
> +	config.fixed_direction_output = sgpio->dir_out;
> +	config.irq_domain = sgpio->domain;
> +	config.drvdata = sgpio;
> +
> +	sgpio->gpio = devm_gpio_regmap_register(&pdev->dev, &config);
> +	if (IS_ERR(sgpio->gpio))
> +		return dev_err_probe(&pdev->dev, PTR_ERR(sgpio->gpio),
> +				     "Could not register gpiochip\n");
> +
> +	irq = platform_get_irq(pdev, 0);
> +	if (irq < 0)
> +		return irq;
> +
> +	rc = devm_request_threaded_irq(&pdev->dev, irq, NULL, axiado_sgpio_irq_handler,
> +				       IRQF_ONESHOT, dev_name(&pdev->dev), sgpio);
> +	if (rc)
> +		return dev_err_probe(&pdev->dev, rc, "Failed to request IRQ\n");
> +
> +	rc = axiado_sgpio_irq_enable(sgpio);
> +	if (rc)
> +		return dev_err_probe(&pdev->dev, rc,
> +				     "Failed to enable interrupts\n");

Phew, that's a complex probe but I don't see anything inherently wrong. Linus
is a better expert in interrupts so may want to chime in.

> +
> +	/*
> +	 * Registered last so that it runs first on teardown: the interrupts
> +	 * must be masked while the parent interrupt is still requested. The
> +	 * shift engine is stopped by axiado_sgpio_disable(), registered before
> +	 * the hardware was programmed so that it also covers failures during
> +	 * probe.
> +	 */

In this case it would actually be clearer to just have it in the .remove()
callback which runs before devres unwind. You don't get anything out of using
devres here wrt error handling as it's already the bottom of probe().

Fix it only if you'll need to send another version, otherwise LGTM.

Bart

> +	return devm_add_action_or_reset(&pdev->dev, axiado_sgpio_mask_irqs,
> +					sgpio);
> +}
> +
> +static const struct of_device_id axiado_sgpio_of_match[] = {
> +	{ .compatible = "axiado,ax3005-sgpio" },
> +	{ }
> +};
> +MODULE_DEVICE_TABLE(of, axiado_sgpio_of_match);
> +
> +static struct platform_driver axiado_sgpio_driver = {
> +	.driver = {
> +		.name = KBUILD_MODNAME,
> +		.of_match_table = axiado_sgpio_of_match,
> +	},
> +	.probe = axiado_sgpio_probe,
> +};
> +module_platform_driver(axiado_sgpio_driver);
> +
> +MODULE_DESCRIPTION("Axiado AX3005 Serial GPIO Driver");
> +MODULE_AUTHOR("Axiado Corporation");
> +MODULE_LICENSE("GPL");
>
> --
> 2.34.1
>
>

Bart

