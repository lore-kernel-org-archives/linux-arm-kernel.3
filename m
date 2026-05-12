Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4D9F3CD4F24
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 12 May 2026 14:38:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=XiWgH5OkTpRZkOAFv9kZJqetc988/1EXukNwEgLB+x8=; b=ZfHTeY948HeH2gdIgAgH8d6JjM
	gVaNTFyva/dD9ac/E3huAvfTNn1KyNVbvKE/E1Tn37HGo213Jx1m78xs3cswFS2NTqKgKRTP5HwQb
	f0o9zLdpJdUDHHZf/0j+2h+f81TmKi03y1eYJjYQT0bV61JyGxey2ofD17MBiWW2qfcHrhL6duz+1
	anQg6Z52HcKtPV/T/IFmA0b8C9j94HKJcuspA+ll0GPIVTI/W80b03SGTXdtZLTokyyrlYSEu9dbt
	GH/KHAHrxCA4f5XggvWWh6/76LdyS9d6eNY7DcbpEo3JOzHhl7uRJASt/Q7fSUTXMiOnziUo4gDdw
	U1s64y0A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wMoFF-0000000H3Xr-3Z7s;
	Tue, 12 May 2026 14:38:01 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wMoFD-0000000H3Wx-1qSG;
	Tue, 12 May 2026 14:38:00 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id C0C1344A99;
	Tue, 12 May 2026 14:37:58 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 85C47C2BCF6;
	Tue, 12 May 2026 14:37:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778596678;
	bh=80j3GK9Ky80LtSOqwjpJhxCkLUAXDfbcjbp8T8hGbwA=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=RU0ua3zOPzd4L/YCZwE2kd9BD+QWdEVWpNMLhEtTCRBDVlYFWdwunBaUp+nYfgr9P
	 kintRagou4DCi8iB/GcbwFgRCX5moMgdTV2LpB/qW/1GkoycwRfl7tv+xpmyMcqXrG
	 f7A4aQDA27yilq67keceHfKxBIQdeeAkw5ZVGRo3kz8n1LTdn1yDS5i1ZdTfo0IzPK
	 NlfCZdHNghOWZX2pWd5bOHZMyKmpFm16ZoZgw+ldxI7gQnRme/Eiwte1QiYljHauoz
	 Nald8RK22uuthwLyq249SyrkH31H27N4eowH83oyDoxFnPwu6PDi4MQcro617OGbDJ
	 Wm7jGgN4LQS8Q==
Date: Tue, 12 May 2026 15:37:45 +0100
From: Jonathan Cameron <jic23@kernel.org>
To: Yu-Chun Lin <eleanor.lin@realtek.com>
Cc: <linusw@kernel.org>, <brgl@kernel.org>, <robh@kernel.org>,
 <krzk+dt@kernel.org>, <conor+dt@kernel.org>, <afaerber@suse.com>,
 <wbg@kernel.org>, <mathieu.dubois-briand@bootlin.com>, <mwalle@kernel.org>,
 <lars@metafoo.de>, <Michael.Hennerich@analog.com>, <nuno.sa@analog.com>,
 <andy@kernel.org>, <dlechner@baylibre.com>, <tychang@realtek.com>,
 <linux-gpio@vger.kernel.org>, <devicetree@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
 <linux-realtek-soc@lists.infradead.org>, <linux-iio@vger.kernel.org>,
 <cy.huang@realtek.com>, <stanley_chang@realtek.com>,
 <james.tai@realtek.com>, Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH v3 3/7] gpio: regmap: Add gpio_regmap_operation and
 write-enable support
Message-ID: <20260512153745.3ec68675@jic23-huawei>
In-Reply-To: <20260512033317.1602537-4-eleanor.lin@realtek.com>
References: <20260512033317.1602537-1-eleanor.lin@realtek.com>
	<20260512033317.1602537-4-eleanor.lin@realtek.com>
X-Mailer: Claws Mail 4.4.0 (GTK 3.24.52; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260512_073759_533222_C8B2BD76 
X-CRM114-Status: GOOD (  26.98  )
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

On Tue, 12 May 2026 11:33:13 +0800
Yu-Chun Lin <eleanor.lin@realtek.com> wrote:

> Extend the reg_mask_xlate callback with an operation type parameter
> (gpio_regmap_operation) to allow drivers to return different
> register/mask combinations for different GPIO operations.
> 
> Also add write-enable mechanism for hardware that requires setting a
> write-enable bit before modifying GPIO control registers.
> 
> Consequently, update all existing drivers utilizing the gpio-regmap
> framework (across drivers/gpio, drivers/iio, and drivers/pinctrl)
> to accommodate the new reg_mask_xlate function signature.

What is the reasoning behind setting *mask = 0 for unsupported operations?
If it is a special value why not just return an error code to indicate
not supported?  This seems to come from the assumption that you will want
to | that with masks for another operation.

I'm coming into this late but to me there look to be a bunch of undocumented
assumptions. Why do the operations have to share a register for example?

Perhaps an interface where you provide a single operation for write_enable
and whatever else and hence t here is only one 'reg' would work better?


> 
> Suggested-by: Linus Walleij <linus.walleij@linaro.org>
> Signed-off-by: Yu-Chun Lin <eleanor.lin@realtek.com>

> diff --git a/drivers/gpio/gpio-regmap.c b/drivers/gpio/gpio-regmap.c
> index deb9eebb58de..c76eef20e412 100644
> --- a/drivers/gpio/gpio-regmap.c
> +++ b/drivers/gpio/gpio-regmap.c
> @@ -38,9 +38,10 @@ struct gpio_regmap {
>  	struct regmap_irq_chip_data *irq_chip_data;
>  #endif
>  
> -	int (*reg_mask_xlate)(struct gpio_regmap *gpio, unsigned int base,
> -			      unsigned int offset, unsigned int *reg,
> -			      unsigned int *mask);
> +	int (*reg_mask_xlate)(struct gpio_regmap *gpio,
> +			      enum gpio_regmap_operation op,
> +			      unsigned int base, unsigned int offset,
> +			      unsigned int *reg, unsigned int *mask);
>  
>  	void *driver_data;
>  };
> @@ -54,6 +55,7 @@ static unsigned int gpio_regmap_addr(unsigned int addr)
>  }
>  
>  static int gpio_regmap_simple_xlate(struct gpio_regmap *gpio,
> +				    enum gpio_regmap_operation op,
>  				    unsigned int base, unsigned int offset,
>  				    unsigned int *reg, unsigned int *mask)
>  {
> @@ -61,7 +63,16 @@ static int gpio_regmap_simple_xlate(struct gpio_regmap *gpio,
>  	unsigned int stride = offset / gpio->ngpio_per_reg;
>  
>  	*reg = base + stride * gpio->reg_stride;
> -	*mask = BIT(line);
> +
> +	switch (op) {
> +	case GPIO_REGMAP_SET_WREN_OP:
> +	case GPIO_REGMAP_SET_DIR_WREN_OP:
> +		*mask = 0;
> +		break;
> +	default:
> +		*mask = BIT(line);
> +		break;
> +	}
>  
>  	return 0;
>  }
> @@ -69,7 +80,7 @@ static int gpio_regmap_simple_xlate(struct gpio_regmap *gpio,
>  static int gpio_regmap_get(struct gpio_chip *chip, unsigned int offset)
>  {
>  	struct gpio_regmap *gpio = gpiochip_get_data(chip);
> -	unsigned int base, val, reg, mask;
> +	unsigned int base, val, reg, mask, dir_mask;
>  	int ret;
>  
>  	/* we might not have an output register if we are input only */
> @@ -78,10 +89,24 @@ static int gpio_regmap_get(struct gpio_chip *chip, unsigned int offset)
>  	else
>  		base = gpio_regmap_addr(gpio->reg_set_base);
>  
> -	ret = gpio->reg_mask_xlate(gpio, base, offset, &reg, &mask);
> +	ret = gpio->reg_mask_xlate(gpio, GPIO_REGMAP_GET_OP, base, offset, &reg, &dir_mask);
>  	if (ret)
>  		return ret;
>  
> +	ret = regmap_read(gpio->regmap, reg, &val);
> +	if (ret)
> +		return ret;
> +
> +	if (val & dir_mask) {
> +		ret = gpio->reg_mask_xlate(gpio, GPIO_REGMAP_OUT, base, offset, &reg, &mask);
> +		if (ret)
> +			return ret;
> +	} else {
> +		ret = gpio->reg_mask_xlate(gpio, GPIO_REGMAP_IN, base, offset, &reg, &mask);
> +		if (ret)
> +			return ret;
> +	}
> +
>  	/* ensure we don't spoil any register cache with pin input values */
>  	if (gpio->reg_dat_base == gpio->reg_set_base)
>  		ret = regmap_read_bypassed(gpio->regmap, reg, &val);
> @@ -98,10 +123,14 @@ static int gpio_regmap_set(struct gpio_chip *chip, unsigned int offset,
>  {
>  	struct gpio_regmap *gpio = gpiochip_get_data(chip);
>  	unsigned int base = gpio_regmap_addr(gpio->reg_set_base);
> -	unsigned int reg, mask, mask_val;
> +	unsigned int reg, mask, mask_val, wren_mask;
>  	int ret;
>  
> -	ret = gpio->reg_mask_xlate(gpio, base, offset, &reg, &mask);
> +	ret = gpio->reg_mask_xlate(gpio, GPIO_REGMAP_SET_WREN_OP, base, offset, &reg, &wren_mask);
> +	if (ret)
> +		return ret;
> +
> +	ret = gpio->reg_mask_xlate(gpio, GPIO_REGMAP_SET_OP, base, offset, &reg, &mask);
>  	if (ret)
>  		return ret;
>  
> @@ -112,9 +141,9 @@ static int gpio_regmap_set(struct gpio_chip *chip, unsigned int offset,
>  
>  	/* ignore input values which shadow the old output value */
>  	if (gpio->reg_dat_base == gpio->reg_set_base)
> -		ret = regmap_write_bits(gpio->regmap, reg, mask, mask_val);
> +		ret = regmap_write_bits(gpio->regmap, reg, mask | wren_mask, mask_val | wren_mask);
>  	else
> -		ret = regmap_update_bits(gpio->regmap, reg, mask, mask_val);
> +		ret = regmap_update_bits(gpio->regmap, reg, mask | wren_mask, mask_val | wren_mask);
>  
>  	return ret;
>  }
> @@ -123,7 +152,7 @@ static int gpio_regmap_set_with_clear(struct gpio_chip *chip,
>  				      unsigned int offset, int val)
>  {
>  	struct gpio_regmap *gpio = gpiochip_get_data(chip);
> -	unsigned int base, reg, mask;
> +	unsigned int base, reg, mask, wren_mask;
>  	int ret;
>  
>  	if (val)
> @@ -131,11 +160,15 @@ static int gpio_regmap_set_with_clear(struct gpio_chip *chip,
>  	else
>  		base = gpio_regmap_addr(gpio->reg_clr_base);
>  
> -	ret = gpio->reg_mask_xlate(gpio, base, offset, &reg, &mask);
> +	ret = gpio->reg_mask_xlate(gpio, GPIO_REGMAP_SET_WREN_OP, base, offset, &reg, &wren_mask);
>  	if (ret)
>  		return ret;
>  
> -	return regmap_write(gpio->regmap, reg, mask);
> +	ret = gpio->reg_mask_xlate(gpio, GPIO_REGMAP_SET_WITH_CLEAR_OP, base, offset, &reg, &mask);
> +	if (ret)
> +		return ret;
> +
> +	return regmap_write(gpio->regmap, reg, mask | wren_mask);
>  }
>  
>  static int gpio_regmap_get_direction(struct gpio_chip *chip,
> @@ -167,7 +200,7 @@ static int gpio_regmap_get_direction(struct gpio_chip *chip,
>  		return -ENOTSUPP;
>  	}
>  
> -	ret = gpio->reg_mask_xlate(gpio, base, offset, &reg, &mask);
> +	ret = gpio->reg_mask_xlate(gpio, GPIO_REGMAP_GET_DIR_OP, base, offset, &reg, &mask);
>  	if (ret)
>  		return ret;
>  
> @@ -185,7 +218,7 @@ static int gpio_regmap_set_direction(struct gpio_chip *chip,
>  				     unsigned int offset, bool output)
>  {
>  	struct gpio_regmap *gpio = gpiochip_get_data(chip);
> -	unsigned int base, val, reg, mask;
> +	unsigned int base, val, reg, mask, wren_mask;
>  	int invert, ret;
>  
>  	if (gpio->reg_dir_out_base) {
> @@ -198,7 +231,12 @@ static int gpio_regmap_set_direction(struct gpio_chip *chip,
>  		return -ENOTSUPP;
>  	}
>  
> -	ret = gpio->reg_mask_xlate(gpio, base, offset, &reg, &mask);
> +	ret = gpio->reg_mask_xlate(gpio, GPIO_REGMAP_SET_DIR_OP, base, offset, &reg, &mask);
> +	if (ret)
> +		return ret;
> +
> +	ret = gpio->reg_mask_xlate(gpio, GPIO_REGMAP_SET_DIR_WREN_OP, base, offset, &reg,
> +				   &wren_mask);

What constrains these two to provide the same value back for reg?
To me it seems like the write enable might well be in a different register.

>  	if (ret)
>  		return ret;
>  
> @@ -207,7 +245,7 @@ static int gpio_regmap_set_direction(struct gpio_chip *chip,
>  	else
>  		val = output ? mask : 0;
>  
> -	return regmap_update_bits(gpio->regmap, reg, mask, val);
> +	return regmap_update_bits(gpio->regmap, reg, mask | wren_mask, val | wren_mask);
>  }
>  
>  static int gpio_regmap_direction_input(struct gpio_chip *chip,

