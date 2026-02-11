Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ADD2AEB597E
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 11 Feb 2026 09:08:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=1QCKGQMBJpefZ4e5yK9+2w5vu5sQ26oBeLHe6vX8tFg=; b=QFoH7BIYfPHnOxvkud4O4kDpmK
	hVW4IhpQJ9n5atLn7KhSV/tswHHbmbZy8bwLqoQjVhaXBaNtph80xVBrYPvkfnTpTVIyvzzIAAtCu
	xKr1B0TM5SQsGINrqXVecqaghJfdRu3vFbnBmNl/PceZhGgymmiojuGQnRfN0Z6/7XbU4QlAyT4Zz
	5WSosDuET2VmLgqkbK89ruFo3Ovgr3F+TKizC/7JtQ2cDSJ1sMDzRbAOVFk893z3hoYYxL/tDDQl3
	mBBtf9fqGNGTj2THWHZHWiTgb2tz52MxwU2PpgGd1c1ELGx0ngxSF4s8MHz6+3HmfBgXln8z0DWWw
	VmkYEz3g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vq6DN-00000000PsU-21V0;
	Wed, 11 Feb 2026 09:08:53 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vq6DK-00000000Ps6-2xUW
	for linux-arm-kernel@lists.infradead.org;
	Wed, 11 Feb 2026 09:08:52 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 9CDAE339;
	Wed, 11 Feb 2026 01:08:40 -0800 (PST)
Received: from [192.168.178.73] (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 201C83F740;
	Wed, 11 Feb 2026 01:08:44 -0800 (PST)
Message-ID: <c78bd0c3-6889-46f8-8b5a-e3490ce7b9c5@arm.com>
Date: Wed, 11 Feb 2026 10:08:43 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/1] pinctrl: sunxi: add GPIO get_direction callback
To: James Hilliard <james.hilliard1@gmail.com>, linux-sunxi@lists.linux.dev,
 linux-gpio@vger.kernel.org
Cc: Linus Walleij <linusw@kernel.org>, Chen-Yu Tsai <wens@kernel.org>,
 Jernej Skrabec <jernej.skrabec@gmail.com>,
 Samuel Holland <samuel@sholland.org>, Bartosz Golaszewski <brgl@kernel.org>,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20260211033249.2770281-1-james.hilliard1@gmail.com>
Content-Language: en-US
From: Andre Przywara <andre.przywara@arm.com>
In-Reply-To: <20260211033249.2770281-1-james.hilliard1@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260211_010850_904629_0D5372A4 
X-CRM114-Status: GOOD (  21.43  )
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

Hi James,

On 2/11/26 04:32, James Hilliard wrote:
> Implement sunxi_pinctrl_gpio_get_direction() and wire it into
> the sunxi gpio_chip setup.

thanks for taking care and sending a patch! I am still scratching my 
head what this warning is about exactly and why we only see this now? I 
never saw this, so what caused that? libgpiod accesses from userland?

Regardless, can we hold back this patch, please? As part of the A733 
pinctrl support (and as LinusW asked kindly about that) I was reworking 
our driver to use the generic gpio interface, and I have a feeling this 
would solve this problem automatically?
The actual pinctrl conversion is done, I just need to plug in the IRQ 
support. I ideally would have something in the next days to post, would 
that be worth waiting for?

Cheers,
Andre



> 
> The new callback reads the pin mux register and compares the mux
> value against the pin descriptor gpio_in and gpio_out functions
> to report GPIO_LINE_DIRECTION_IN or GPIO_LINE_DIRECTION_OUT.
> If the pin is muxed to irq, report it as input.
> 
> Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
> ---
>   drivers/pinctrl/sunxi/pinctrl-sunxi.c | 32 +++++++++++++++++++++++++++
>   1 file changed, 32 insertions(+)
> 
> diff --git a/drivers/pinctrl/sunxi/pinctrl-sunxi.c b/drivers/pinctrl/sunxi/pinctrl-sunxi.c
> index 0fb057a07dcc..424f23be27b2 100644
> --- a/drivers/pinctrl/sunxi/pinctrl-sunxi.c
> +++ b/drivers/pinctrl/sunxi/pinctrl-sunxi.c
> @@ -995,6 +995,37 @@ static int sunxi_pinctrl_gpio_direction_output(struct gpio_chip *chip,
>   					    chip->base + offset, false);
>   }
>   
> +static int sunxi_pinctrl_gpio_get_direction(struct gpio_chip *chip,
> +					    unsigned int offset)
> +{
> +	struct sunxi_pinctrl *pctl = gpiochip_get_data(chip);
> +	struct sunxi_desc_function *in, *out, *irq;
> +	u32 reg, shift, mask, val;
> +	u16 pin = chip->base + offset;
> +
> +	in = sunxi_pinctrl_desc_find_function_by_pin(pctl, pin, "gpio_in");
> +	out = sunxi_pinctrl_desc_find_function_by_pin(pctl, pin, "gpio_out");
> +	if (!in || !out)
> +		return -EINVAL;
> +
> +	irq = sunxi_pinctrl_desc_find_function_by_pin(pctl, pin, "irq");
> +
> +	sunxi_mux_reg(pctl, offset, &reg, &shift, &mask);
> +	val = (readl(pctl->membase + reg) & mask) >> shift;
> +
> +	if (val == in->muxval)
> +		return GPIO_LINE_DIRECTION_IN;
> +
> +	if (val == out->muxval)
> +		return GPIO_LINE_DIRECTION_OUT;
> +
> +	/* IRQ function is effectively input. */
> +	if (irq && val == irq->muxval)
> +		return GPIO_LINE_DIRECTION_IN;
> +
> +	return -EINVAL;
> +}
> +
>   static int sunxi_pinctrl_gpio_of_xlate(struct gpio_chip *gc,
>   				const struct of_phandle_args *gpiospec,
>   				u32 *flags)
> @@ -1603,6 +1634,7 @@ int sunxi_pinctrl_init_with_flags(struct platform_device *pdev,
>   	pctl->chip->set_config = gpiochip_generic_config;
>   	pctl->chip->direction_input = sunxi_pinctrl_gpio_direction_input;
>   	pctl->chip->direction_output = sunxi_pinctrl_gpio_direction_output;
> +	pctl->chip->get_direction = sunxi_pinctrl_gpio_get_direction;
>   	pctl->chip->get = sunxi_pinctrl_gpio_get;
>   	pctl->chip->set = sunxi_pinctrl_gpio_set;
>   	pctl->chip->of_xlate = sunxi_pinctrl_gpio_of_xlate;


