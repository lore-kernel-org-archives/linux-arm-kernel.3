Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2B5A5CD5BB1
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 25 May 2026 21:39:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=adzq6nr/DeyYomGk4hHEPX5Vydbnm8oEWvTqr4RQfpQ=; b=uG4bZFPQu+7bH0wJ/hdEwu+WjN
	OHh7Dwoe7UiYpl5ZCOmO4gTSjgIrOcfIVDbJioG2QGN8m3tIg6px1x6k0QFo1bsRNKv5YGx9wN4C2
	gASj1akT4QfWOdcgrTjW+elrcuh6D/vmcQr40j88b0wcHtyrSE0wHWPH3wZfaylraiQjCwdXWnWzW
	UJ5VAZ4pmlhAUbTkg4C+afL4m/f9RGjxjL8YHwTESdJd0ha4FscbWFj4rGJW0xLMy5UOIDB/nDJM+
	1pb+wMNsVrqg+6fOMmKhzOeh4BLdJnLxCxelieG+ShHHRPeSt9lq5molKXL5K8CS/yYPulTesTpDD
	aXXnT2KQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wRd0q-00000000W6x-3irP;
	Mon, 25 May 2026 21:39:04 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wRd0p-00000000W6V-1Hqr
	for linux-arm-kernel@lists.infradead.org;
	Mon, 25 May 2026 21:39:04 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id EB9381758;
	Mon, 25 May 2026 14:38:55 -0700 (PDT)
Received: from ryzen.lan (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 5E5543F632;
	Mon, 25 May 2026 14:38:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1779745141; bh=xmlZyiLM/KlQv4wu5tJkU7v4YAEMiImxkEyCCggM9jI=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=qDrIXuT7h1R7aairMJhZ7AQ0aqjUW0JeR/oLswk+6MuIyQ0ENo5fU5+xxmKG4GNK+
	 1XfDeUNR8nvkGPUkAXwd1wJUo/qll0+G1OxatpuagZ8zXYJSfE9DpXtJDYEHSYzcPY
	 l0hLvnPjkDXel5XMUq6GUShsHS8aknfU1Bli+Nhw=
Date: Mon, 25 May 2026 23:38:08 +0200
From: Andre Przywara <andre.przywara@arm.com>
To: Paul Kocialkowski <paulk@sys-base.io>
Cc: linux-gpio@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org, Linus Walleij
 <linusw@kernel.org>, Chen-Yu Tsai <wens@kernel.org>, Jernej Skrabec
 <jernej.skrabec@gmail.com>, Samuel Holland <samuel@sholland.org>
Subject: Re: [PATCH] pinctrl: sunxi: Implement function_is_gpio
Message-ID: <20260525233808.20e75a21@ryzen.lan>
In-Reply-To: <20260517171405.3697469-1-paulk@sys-base.io>
References: <20260517171405.3697469-1-paulk@sys-base.io>
Organization: Arm Ltd.
X-Mailer: Claws Mail 4.4.0 (GTK 3.24.31; x86_64-slackware-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260525_143903_394378_8E3D3251 
X-CRM114-Status: GOOD (  22.10  )
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

On Sun, 17 May 2026 19:14:05 +0200
Paul Kocialkowski <paulk@sys-base.io> wrote:

Hi Paul,

> The function_is_gpio pinmux op allows the core to find out whether a
> GPIO can be safely requested from a pinctrl property and requested as a
> GPIO at the same time.
> 
> This is especially useful to request a GPIO with a particular drive
> strength, which would otherwise not be possible.

That looks a easy enough solution, but:

> Signed-off-by: Paul Kocialkowski <paulk@sys-base.io>
> ---
>  drivers/pinctrl/sunxi/pinctrl-sunxi.c | 12 ++++++++++++
>  1 file changed, 12 insertions(+)
> 
> diff --git a/drivers/pinctrl/sunxi/pinctrl-sunxi.c b/drivers/pinctrl/sunxi/pinctrl-sunxi.c
> index d3042e0c9712..6162f2d86723 100644
> --- a/drivers/pinctrl/sunxi/pinctrl-sunxi.c
> +++ b/drivers/pinctrl/sunxi/pinctrl-sunxi.c
> @@ -821,6 +821,17 @@ static int sunxi_pmx_get_func_groups(struct pinctrl_dev *pctldev,
>  	return 0;
>  }
>  
> +static bool sunxi_pmx_function_is_gpio(struct pinctrl_dev *pctldev,
> +				       unsigned function)
> +{
> +	struct sunxi_pinctrl *pctl = pinctrl_dev_get_drvdata(pctldev);
> +
> +	if (!strncmp(pctl->functions[function].name, "gpio", 4))

I wonder if this condition is a bit too relaxed? There could be
some (theoretical) function just starting with gpio, but not being mux
0 or 1. So should we check for gpio_in or gpio_out, explicitly? Or at
least use (strcmp(name, "gpio_", 5)? Or maybe even better for the mux
value directly? Is "function" an indicator of this, or does this rely
on the two GPIO functions being always listed first, at least so far?

And what about the IRQ function? Isn't that some GPIO as well, or does
that not count for the purpose of the function_is_gpio() callback?

Cheers,
Andre

> +		return true;
> +
> +	return false;
> +}
> +
>  static void sunxi_pmx_set(struct pinctrl_dev *pctldev,
>  				 unsigned pin,
>  				 u8 config)
> @@ -952,6 +963,7 @@ static const struct pinmux_ops sunxi_pmx_ops = {
>  	.get_functions_count	= sunxi_pmx_get_funcs_cnt,
>  	.get_function_name	= sunxi_pmx_get_func_name,
>  	.get_function_groups	= sunxi_pmx_get_func_groups,
> +	.function_is_gpio	= sunxi_pmx_function_is_gpio,
>  	.set_mux		= sunxi_pmx_set_mux,
>  	.gpio_set_direction	= sunxi_pmx_gpio_set_direction,
>  	.request		= sunxi_pmx_request,


