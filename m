Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 573F1F506DA
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 16 Mar 2026 14:37:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=eVKuPsgCZ5R+NM3Vp8Hdrk/12zE0ryNoGigOvkJgSMs=; b=O+OToGyn2KufFRWQICqF2t9CvJ
	mpJ7wvBvJNoJf16HESExiaD1GtMcoQoj88TzqzJy8H1pxd3HI5i7g0Gw5o4H8vVxinRuPK4RBsFGL
	G696BD1EnEey7QQ/adVBwLWC0ruSLM2sEexhuFd4WLho5KC+cefy9Xz7dPphf2yeqUPygws9f/+cH
	YBSZGoRgfsKQq4oC3RRCMLRDz+nXf882pp35xD9LXMGpfpgUebFYgOb4fX8fWwvxHkPcrKq8NzhQ/
	mhDowJVQThr7G5m13/d/Xtt15IZ09btRLGQPvoYMJ6kGLgxzBt22xkOoRjJl1hnkP/Cnpy0SGCWHa
	1BsMy9Qw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w294j-00000004CAX-2HEY;
	Mon, 16 Mar 2026 14:37:45 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w294h-00000004CAP-2nXe
	for linux-arm-kernel@bombadil.infradead.org;
	Mon, 16 Mar 2026 14:37:43 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=eVKuPsgCZ5R+NM3Vp8Hdrk/12zE0ryNoGigOvkJgSMs=; b=RMD45pHf1iDCSg/5KLF0CnCn/P
	+Vtkr/kLPz8hZL6qGANLIAKKlcOdqP89cIjKANET3849LQ0tRXvwCJHuFFo2WZh1HQORu5SP3iW4y
	LeP0O7J7MH2xSLrrpHSGol1FjMneM6Tmu5G4MCWn1ELUVNnoaBa9RqBxNWmPyqfNDAM53579SoOxO
	gmDzo6qY6Ag829VSzUFf3df6QegjtzfvoILNrk12dPtIlkA6v5gHHMamhA9/CSWJ1NUpvJLjx/0Q/
	dLjgeivSWfgay5DeSHv6Plht5bpl+D8O3KU7DdW/bGgx0fZIOpoTxuAxrim4OANYTShuXJmU1DlFZ
	CMPW20/Q==;
Received: from foss.arm.com ([217.140.110.172])
	by desiato.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w294d-00000006xyq-3hbD
	for linux-arm-kernel@lists.infradead.org;
	Mon, 16 Mar 2026 14:37:42 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 6286A1477;
	Mon, 16 Mar 2026 07:37:30 -0700 (PDT)
Received: from [192.168.178.24] (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id D9BB13F73B;
	Mon, 16 Mar 2026 07:37:34 -0700 (PDT)
Message-ID: <480b227c-c85b-4ff0-a825-3e82f64821f6@arm.com>
Date: Mon, 16 Mar 2026 15:37:32 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3] pinctrl: sunxi: fix gpiochip_lock_as_irq() failure
 when pinmux is unknown
To: Michal Piekos <michal.piekos@mmpsystems.pl>,
 Linus Walleij <linusw@kernel.org>, Chen-Yu Tsai <wens@kernel.org>,
 Jernej Skrabec <jernej.skrabec@gmail.com>,
 Samuel Holland <samuel@sholland.org>
Cc: linux-gpio@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org
References: <20260314-rc2-boot-hang-v3-1-0b48221181a9@mmpsystems.pl>
Content-Language: en-US
From: Andre Przywara <andre.przywara@arm.com>
In-Reply-To: <20260314-rc2-boot-hang-v3-1-0b48221181a9@mmpsystems.pl>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260316_143740_213597_C247B132 
X-CRM114-Status: GOOD (  26.06  )
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

Hi,

On 3/14/26 09:09, Michal Piekos wrote:
> Fixes kernel hang during boot due to inability to set up IRQ on AXP313a.
> 
> The issue is caused by gpiochip_lock_as_irq() which is failing when gpio
> is in unitialized state.
> 
> Solution is to set pinmux to GPIO INPUT in
> sunxi_pinctrl_irq_request_resources() if it wasn't initialized
> earlier.
> 
> Tested on Orange Pi Zero 3.
> 
> Signed-off-by: Michal Piekos <michal.piekos@mmpsystems.pl>
> Suggested-by: Chen-Yu Tsai <wens@kernel.org>
> ---
> Changes in v3:
> - Drop v2 solution which was returning input instead of error when pin
>    is not initialized.
> - Add checking pinmux configuration in
>    sunxi_pinctrl_irq_request_resources() and set pin to input if
>    uninitialized
> - Link to v2: https://lore.kernel.org/r/20260308-rc2-boot-hang-v2-1-516fdb820953@mmpsystems.pl
> 
> Changes in v2:
> - Dropped the previous faulty solution which was forcing the axp313 to
>    use r_pio as interrupt controller as pointed out by Jernej Škrabec.
> - Implemented suggestion from Andrey Skvortsov to return default
>    direction as input
> - Link to v1: https://lore.kernel.org/r/20260308-rc2-boot-hang-v1-0-d792d1a78dfd@mmpsystems.pl
> ---
>   drivers/pinctrl/sunxi/pinctrl-sunxi.c | 13 +++++++++++++
>   drivers/pinctrl/sunxi/pinctrl-sunxi.h |  1 +
>   2 files changed, 14 insertions(+)
> 
> diff --git a/drivers/pinctrl/sunxi/pinctrl-sunxi.c b/drivers/pinctrl/sunxi/pinctrl-sunxi.c
> index c990b6118172..7d46f7613672 100644
> --- a/drivers/pinctrl/sunxi/pinctrl-sunxi.c
> +++ b/drivers/pinctrl/sunxi/pinctrl-sunxi.c
> @@ -1089,6 +1089,9 @@ static int sunxi_pinctrl_irq_request_resources(struct irq_data *d)
>   {
>   	struct sunxi_pinctrl *pctl = irq_data_get_irq_chip_data(d);
>   	struct sunxi_desc_function *func;
> +	unsigned int offset;
> +	u32 reg, shift, mask;
> +	u8 muxval;
>   	int ret;
>   
>   	func = sunxi_pinctrl_desc_find_function_by_pin(pctl,
> @@ -1096,6 +1099,16 @@ static int sunxi_pinctrl_irq_request_resources(struct irq_data *d)
>   	if (!func)
>   		return -EINVAL;
>   
> +	offset = pctl->irq_array[d->hwirq] - pctl->desc->pin_base;
> +	sunxi_mux_reg(pctl, offset, &reg, &shift, &mask);
> +	muxval = (readl(pctl->membase + reg) & mask) >> shift;
> +
> +	/* Change muxing to GPIO INPUT mode if at reset value */
> +	if (muxval == SUN4I_FUNC_IO_DISABLE) {

The "high impedance"/reset value depends on the SoC generation: older 
SoCs didn't have one, so they used 0 (GPIO_INPUT), which is the closest 
to "off" you can get there. Most SoCs afterwards indeed used 0x7, as you 
set below, but newer SoCs (D1/T113, A523, ...) use 0xf now.

Would it work to do:
	if (muxval != SUN4I_FUNC_INPUT) {
or shall we just force SUN4I_FUNC_INPUT always, without even checking? 
Or can there be other settings already (for instance the IRQ function)?

Not really familiar with the call chain here, but shouldn't the mux be 
set to the IRQ function (0x6/0xe) here anyway?

> +		sunxi_pmx_set(pctl->pctl_dev, pctl->irq_array[d->hwirq],
> +			      SUN4I_FUNC_INPUT);
> +	}
> +
>   	ret = gpiochip_lock_as_irq(pctl->chip,
>   			pctl->irq_array[d->hwirq] - pctl->desc->pin_base);
>   	if (ret) {
> diff --git a/drivers/pinctrl/sunxi/pinctrl-sunxi.h b/drivers/pinctrl/sunxi/pinctrl-sunxi.h
> index ad26e4de16a8..22c527fc6ae2 100644
> --- a/drivers/pinctrl/sunxi/pinctrl-sunxi.h
> +++ b/drivers/pinctrl/sunxi/pinctrl-sunxi.h
> @@ -86,6 +86,7 @@
>   
>   #define SUN4I_FUNC_INPUT	0
>   #define SUN4I_FUNC_IRQ		6
> +#define SUN4I_FUNC_IO_DISABLE	7

As mentioned above, this cannot be a simple fixed define for all SoCs.

Cheers,
Andre

>   
>   #define SUNXI_PINCTRL_VARIANT_MASK	GENMASK(7, 0)
>   #define SUNXI_PINCTRL_NEW_REG_LAYOUT	BIT(8)
> 
> ---
> base-commit: 4ae12d8bd9a830799db335ee661d6cbc6597f838
> change-id: 20260308-rc2-boot-hang-269e8546635b
> 
> Best regards,


