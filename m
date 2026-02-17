Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 42300E909D6
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 17 Feb 2026 16:32:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ElvIAvGrW0jtYKqF5SgRWgdzNi9aqDXovCNIFUpMkSU=; b=oV7ZawStu8dyg+jDsqZdMTCuXH
	5SNmhtugC1HZe3o6WhwtOrZm+pfAL1NC0Avr8G4hdvPTS5spB7R/bWtl7fRvwzy2rrRp3puG6UmEq
	k6Rn2DTIdXilEPx82Z0wCChHcFvE97SUXlxjvehpl32hWVVDfF01aMlJ39Kq0OW9uS/5Vp/KqbJ7B
	Ces4SC1aS1bi/8z/LurquTETxkXFQ7HdFOKxRbTged0uZpN6xOAMw/mn2VQyywClCA1IZLHV4jzlr
	ofQO0xwMtoIENFNs039th6nvTFSmGiu5QeMP1Jf29UOwHHClcS7XpSl8reGwU1WYdJcLQiZ7mZcdn
	Ah4C3rTg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vsO03-00000008ZWc-2xti;
	Tue, 17 Feb 2026 16:32:35 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vsNzi-00000008ZV8-38BC
	for linux-arm-kernel@lists.infradead.org;
	Tue, 17 Feb 2026 16:32:33 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id C255D1477;
	Tue, 17 Feb 2026 08:32:06 -0800 (PST)
Received: from orionap.fritz.box (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 585743F62B;
	Tue, 17 Feb 2026 08:32:11 -0800 (PST)
Date: Tue, 17 Feb 2026 16:32:08 +0000
From: Andre Przywara <andre.przywara@arm.com>
To: Chen-Yu Tsai <wens@kernel.org>
Cc: Jernej Skrabec <jernej@kernel.org>, Samuel Holland
 <samuel@sholland.org>, Bartosz Golaszewski <brgl@kernel.org>, Linus Walleij
 <linusw@kernel.org>, James Hilliard <james.hilliard1@gmail.com>,
 linux-gpio@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] pinctrl: sunxi: Implement gpiochip::get_direction()
Message-ID: <20260217163208.5db4cd1e@orionap.fritz.box>
In-Reply-To: <20260216160946.2977985-1-wens@kernel.org>
References: <20260216160946.2977985-1-wens@kernel.org>
Organization: ARM
X-Mailer: Claws Mail 4.3.1 (GTK 3.24.49; aarch64-unknown-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260217_083221_102283_73CF43BB 
X-CRM114-Status: GOOD (  27.46  )
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

On Tue, 17 Feb 2026 00:09:45 +0800
Chen-Yu Tsai <wens@kernel.org> wrote:

> After commit e623c4303ed1 ("gpiolib: sanitize the return value of
> gpio_chip::get_direction()"), a warning will be printed if the
> gpio driver does not implement this callback.

I am curious how this could slip through? Did the get_direction()
callback become mandatory at one point, but no one noticed that it was
missing for sunxi? It looks like the situation was even worse before that
patch, as it was dereferencing the function pointer without any check?

> Implement it for the sunxi driver. This is simply a matter of reading
> out the mux value from the registers, then checking if it is one of
> the GPIO functions and which direction it is.

Mmh, it feels a bit backwards to resort to the function name *string* for
comparison, when it's always 0 for in and 1 for out (which we actually set
in pinctrl-sunxi-dt.c now). But the mux value for IRQ is different between
SoC generations, and I guess for historic reasons function strings are a
thing in pinctrl, so this is probably the best solution after all:

> Signed-off-by: Chen-Yu Tsai <wens@kernel.org>

FWIW:
Reviewed-by: Andre Przywara <andre.przywara@arm.com>

Cheers,
Andre

P.S. Should we have some CC: stable tag here?

> ---
> This is an alternative to James's version. My version does one lookup
> instead of three.
> 
>  drivers/pinctrl/sunxi/pinctrl-sunxi.c | 51 +++++++++++++++++++++++++++
>  1 file changed, 51 insertions(+)
> 
> diff --git a/drivers/pinctrl/sunxi/pinctrl-sunxi.c b/drivers/pinctrl/sunxi/pinctrl-sunxi.c
> index 0fb057a07dcc..27b2a3e9d78d 100644
> --- a/drivers/pinctrl/sunxi/pinctrl-sunxi.c
> +++ b/drivers/pinctrl/sunxi/pinctrl-sunxi.c
> @@ -204,6 +204,32 @@ sunxi_pinctrl_desc_find_function_by_pin(struct sunxi_pinctrl *pctl,
>  	return NULL;
>  }
>  
> +static struct sunxi_desc_function *
> +sunxi_pinctrl_desc_find_function_by_pin_and_mux(struct sunxi_pinctrl *pctl,
> +						const u16 pin_num,
> +						const u8 muxval)
> +{
> +	for (unsigned int i = 0; i < pctl->desc->npins; i++) {
> +		const struct sunxi_desc_pin *pin = pctl->desc->pins + i;
> +		struct sunxi_desc_function *func = pin->functions;
> +
> +		if (pin->pin.number != pin_num)
> +			continue;
> +
> +		if (pin->variant && !(pctl->variant & pin->variant))
> +			continue;
> +
> +		while (func->name) {
> +			if (func->muxval == muxval)
> +				return func;
> +
> +			func++;
> +		}
> +	}
> +
> +	return NULL;
> +}
> +
>  static int sunxi_pctrl_get_groups_count(struct pinctrl_dev *pctldev)
>  {
>  	struct sunxi_pinctrl *pctl = pinctrl_dev_get_drvdata(pctldev);
> @@ -930,6 +956,30 @@ static const struct pinmux_ops sunxi_pmx_ops = {
>  	.strict			= true,
>  };
>  
> +static int sunxi_pinctrl_gpio_get_direction(struct gpio_chip *chip,
> +					    unsigned int offset)
> +{
> +	struct sunxi_pinctrl *pctl = gpiochip_get_data(chip);
> +	const struct sunxi_desc_function *func;
> +	u32 pin = offset + chip->base;
> +	u32 reg, shift, mask;
> +	u8 muxval;
> +
> +	sunxi_mux_reg(pctl, offset, &reg, &shift, &mask);
> +
> +	muxval = (readl(pctl->membase + reg) & mask) >> shift;
> +
> +	func = sunxi_pinctrl_desc_find_function_by_pin_and_mux(pctl, pin, muxval);
> +	if (!func)
> +		return -ENODEV;
> +
> +	if (!strcmp(func->name, "gpio_out"))
> +		return GPIO_LINE_DIRECTION_OUT;
> +	if (!strcmp(func->name, "gpio_in") || !strcmp(func->name, "irq"))
> +		return GPIO_LINE_DIRECTION_IN;
> +	return -EINVAL;
> +}
> +
>  static int sunxi_pinctrl_gpio_direction_input(struct gpio_chip *chip,
>  					unsigned offset)
>  {
> @@ -1601,6 +1651,7 @@ int sunxi_pinctrl_init_with_flags(struct platform_device *pdev,
>  	pctl->chip->request = gpiochip_generic_request;
>  	pctl->chip->free = gpiochip_generic_free;
>  	pctl->chip->set_config = gpiochip_generic_config;
> +	pctl->chip->get_direction = sunxi_pinctrl_gpio_get_direction;
>  	pctl->chip->direction_input = sunxi_pinctrl_gpio_direction_input;
>  	pctl->chip->direction_output = sunxi_pinctrl_gpio_direction_output;
>  	pctl->chip->get = sunxi_pinctrl_gpio_get;


