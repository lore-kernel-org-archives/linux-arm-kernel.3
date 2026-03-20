Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 448411098781
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 20 Mar 2026 13:49:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Nebg+7WRoDRGl0vSeri1ZAsjMkX9tJhEqOj+V1Ki/O4=; b=JKpY56IRuZ8dWuVpJ8aE9yMJVJ
	DQsJp1inabHbknsh2f7PhMvXN+Mm4TY+EKNBEyN5rgOtN/QMnp1ODypQogojOsFcJpxLwjnTqrpSH
	zexU9ASWGGR/po3y3SJ5b1oUY97wEErukSVa1xISh8K2pl9tIciduSY4qlzJGuQ4uZSj4o2y+Plou
	Yi8zYwE65CqRrrFcOY/2ruDGDZN7mRqLMlc8mSPpdc9Q2I343y/p5yxPX91+OCJZck33LSBSA3nlF
	bYcAZ0z38/nzH2ZG/81lZFA/50zUs9jbHjCJByRw1xgmDAfhuThk3J/UPkkHuJo1FLqfbA31s93DW
	v/VbTUuQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w3aE4-0000000Ct8M-0Z2Y;
	Fri, 20 Mar 2026 13:49:20 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w3aE1-0000000Ct7v-1qxY
	for linux-arm-kernel@lists.infradead.org;
	Fri, 20 Mar 2026 13:49:19 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id A0F4D165C;
	Fri, 20 Mar 2026 06:49:08 -0700 (PDT)
Received: from [10.57.83.197] (unknown [10.57.83.197])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id D652A3F778;
	Fri, 20 Mar 2026 06:49:12 -0700 (PDT)
Message-ID: <53a12f3e-3dfd-42e5-910c-5ed97e20e14a@arm.com>
Date: Fri, 20 Mar 2026 14:48:55 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 2/2] pinctrl: sunxi: fix gpiochip_lock_as_irq() failure
 when pinmux is unknown
To: Michal Piekos <michal.piekos@mmpsystems.pl>,
 Linus Walleij <linusw@kernel.org>, Chen-Yu Tsai <wens@kernel.org>,
 Jernej Skrabec <jernej.skrabec@gmail.com>,
 Samuel Holland <samuel@sholland.org>
Cc: linux-gpio@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org
References: <20260319-rc2-boot-hang-v5-0-092834a882b1@mmpsystems.pl>
 <20260319-rc2-boot-hang-v5-2-092834a882b1@mmpsystems.pl>
Content-Language: en-US
From: Andre Przywara <andre.przywara@arm.com>
In-Reply-To: <20260319-rc2-boot-hang-v5-2-092834a882b1@mmpsystems.pl>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260320_064917_635379_6BC9003A 
X-CRM114-Status: GOOD (  23.74  )
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

Hi Michal,

On 3/19/26 18:19, Michal Piekos wrote:
> Fixes kernel hang during boot due to inability to set up IRQ on AXP313a.
> 
> The issue is caused by gpiochip_lock_as_irq() which is failing when gpio
> is in uninitialized state.
> 
> Solution is to set pinmux to GPIO INPUT in
> sunxi_pinctrl_irq_request_resources() if it wasn't initialized
> earlier.
> 
> Tested on Orange Pi Zero 3.
> 
> Fixes: 01e10d0272b9 ("pinctrl: sunxi: Implement gpiochip::get_direction()")
> Signed-off-by: Michal Piekos <michal.piekos@mmpsystems.pl>
> ---
>   drivers/pinctrl/sunxi/pinctrl-sunxi.c | 21 +++++++++++++++++++--
>   drivers/pinctrl/sunxi/pinctrl-sunxi.h |  2 ++
>   2 files changed, 21 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/pinctrl/sunxi/pinctrl-sunxi.c b/drivers/pinctrl/sunxi/pinctrl-sunxi.c
> index 685b79fc0bf8..e3aa2b70aa7d 100644
> --- a/drivers/pinctrl/sunxi/pinctrl-sunxi.c
> +++ b/drivers/pinctrl/sunxi/pinctrl-sunxi.c
> @@ -1092,15 +1092,32 @@ static int sunxi_pinctrl_irq_request_resources(struct irq_data *d)
>   {
>   	struct sunxi_pinctrl *pctl = irq_data_get_irq_chip_data(d);
>   	struct sunxi_desc_function *func;
> +	unsigned int offset;
> +	u32 reg, shift, mask;
> +	u8 muxval;
>   	int ret;
> +	u8 disabled_mux;

Iff you are going to respin, maybe use the inverted Christmas tree 
style, and group the u8 variables.

>   
>   	func = sunxi_pinctrl_desc_find_function_by_pin(pctl,
>   					pctl->irq_array[d->hwirq], "irq");
>   	if (!func)
>   		return -EINVAL;
>   
> -	ret = gpiochip_lock_as_irq(pctl->chip,
> -			pctl->irq_array[d->hwirq] - pctl->desc->pin_base);
> +	offset = pctl->irq_array[d->hwirq] - pctl->desc->pin_base;
> +	sunxi_mux_reg(pctl, offset, &reg, &shift, &mask);
> +	muxval = (readl(pctl->membase + reg) & mask) >> shift;
> +
> +	/* Change muxing to GPIO INPUT mode if at reset value */
> +	if (pctl->flags & SUNXI_PINCTRL_NEW_REG_LAYOUT)
> +		disabled_mux = SUN4I_FUNC_DISABLED_NEW;
> +	else
> +		disabled_mux = SUN4I_FUNC_DISABLED_OLD;
> +	
> +	if (muxval == disabled_mux)

There is whitespace damage in three of the four lines above.
Maybe this can be fixed up while applying?

The patch still feels a bit arbitrary, and looking at the definition of 
SUN4I_FUNC_IRQ below we probably need another rework, but if that fixes 
the issues observed, we should take it now:

(with the w/s damage fixed:)
Reviewed-by: Andre Przywara <andre.przywara@arm.com>

Cheers,
Andre

> +		sunxi_pmx_set(pctl->pctl_dev, pctl->irq_array[d->hwirq],
> +			      SUN4I_FUNC_INPUT);
> +
> +	ret = gpiochip_lock_as_irq(pctl->chip, offset);
>   	if (ret) {
>   		dev_err(pctl->dev, "unable to lock HW IRQ %lu for IRQ\n",
>   			irqd_to_hwirq(d));
> diff --git a/drivers/pinctrl/sunxi/pinctrl-sunxi.h b/drivers/pinctrl/sunxi/pinctrl-sunxi.h
> index 22bffac1c3f0..0daf7600e2fb 100644
> --- a/drivers/pinctrl/sunxi/pinctrl-sunxi.h
> +++ b/drivers/pinctrl/sunxi/pinctrl-sunxi.h
> @@ -86,6 +86,8 @@
>   
>   #define SUN4I_FUNC_INPUT	0
>   #define SUN4I_FUNC_IRQ		6
> +#define SUN4I_FUNC_DISABLED_OLD 7
> +#define SUN4I_FUNC_DISABLED_NEW 15
>   
>   #define SUNXI_PINCTRL_VARIANT_MASK	GENMASK(7, 0)
>   #define SUNXI_PINCTRL_NEW_REG_LAYOUT	BIT(8)
> 


