Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 76F9CD1CA36
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  5 Nov 2024 06:19:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Message-ID:References:In-Reply-To:Subject:Cc:To:From:Date:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=pzT1yWuSYo32MDvy838pA2Z2cGHks6slx4by0MlbsfU=; b=0S3KmA90wdqyCeCU7RvmEGMj6f
	awockcKLvCn2zG8igmqtN1ezBWpSzLaM4ZlVyHvjCNkKF0V/gIpz6wVPrlvmDTJQBUczm+E/QfrCy
	JZm6ehcEUb5j6lFQVT1E7oEb73UgBqATSxLvHaNLiMTC0BSxXkTooQtrwszcfks1zftN1L0v9W2bY
	apEXTu5hfjYJJxJIr8WYR1vOG2hVC0KGTd8N86Qo2sNqHwguwSaqbiHrsTd+mNHgx9TuHZOuEzZUG
	YMe5ASZiqbz1CA2auIFOUgqSgBSelO29eF+JS6fO5qC/xuzPeGgdN0kty0JwMS4s396d98T5umlvx
	dEp9NlBw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t8Cu1-0000000G2FX-2rWn;
	Tue, 05 Nov 2024 06:18:57 +0000
Received: from mail.manjaro.org ([116.203.91.91])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t8CsK-0000000G26p-1VwD;
	Tue, 05 Nov 2024 06:17:14 +0000
MIME-Version: 1.0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=manjaro.org; s=2021;
	t=1730787427;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=pzT1yWuSYo32MDvy838pA2Z2cGHks6slx4by0MlbsfU=;
	b=K2K18R4p2w+mZKetYwZwYk+c++g/4wEGft+2ah3sEArgW3vNySgUUef6qkjhl1Ci0GvGSA
	8J7cTyUb24+u6qfBvP2f0/e4o28XLUf7O5WwO60h8NokGnwWHijC0Kj04Fzc8KLaexwxn0
	lRLnf3nJ3pA/LUnN3SMz612LhVwnanlYRJf0MB0m0bkXkzVGlEurzUQ7FEFve6useZKNr4
	1CvTSeNPHJhm5gKthRtojQoUgTFWAmXezntrjYdLqK56tUxrMbCAvBqh8OrMeD8HI28rTG
	hAb1vrJkSq9joeA+FWcyzwWYZqXDt757gNPq5iHj7qqcVLg98eWVACSHJaKaqw==
Date: Tue, 05 Nov 2024 07:17:05 +0100
From: Dragan Simic <dsimic@manjaro.org>
To: "Rob Herring (Arm)" <robh@kernel.org>
Cc: Linus Walleij <linus.walleij@linaro.org>, Bartosz Golaszewski
 <brgl@bgdev.pl>, Heiko Stuebner <heiko@sntech.de>,
 linux-gpio@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] gpio: Use of_property_present() for non-boolean
 properties
In-Reply-To: <20241104190628.274717-1-robh@kernel.org>
References: <20241104190628.274717-1-robh@kernel.org>
Message-ID: <61eb3f25ac1ab3d63e375350e0852b75@manjaro.org>
X-Sender: dsimic@manjaro.org
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
Authentication-Results: ORIGINATING;
	auth=pass smtp.auth=dsimic@manjaro.org smtp.mailfrom=dsimic@manjaro.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241104_221712_595112_F6B01D49 
X-CRM114-Status: GOOD (  17.36  )
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

Hello Rob,

On 2024-11-04 20:06, Rob Herring (Arm) wrote:
> The use of of_property_read_bool() for non-boolean properties is
> deprecated in favor of of_property_present() when testing for property
> presence.
> 
> Signed-off-by: Rob Herring (Arm) <robh@kernel.org>

Looking good to me, thanks for the patch!

Reviewed-by: Dragan Simic <dsimic@manjaro.org>

> ---
>  drivers/gpio/gpio-rockchip.c | 2 +-
>  drivers/gpio/gpiolib-of.c    | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/gpio/gpio-rockchip.c 
> b/drivers/gpio/gpio-rockchip.c
> index 365ab947983c..64924bc01591 100644
> --- a/drivers/gpio/gpio-rockchip.c
> +++ b/drivers/gpio/gpio-rockchip.c
> @@ -602,7 +602,7 @@ static int rockchip_gpiolib_register(struct
> rockchip_pin_bank *bank)
>  	 * files which don't set the "gpio-ranges" property or systems that
>  	 * utilize ACPI the driver has to call gpiochip_add_pin_range().
>  	 */
> -	if (!of_property_read_bool(bank->of_node, "gpio-ranges")) {
> +	if (!of_property_present(bank->of_node, "gpio-ranges")) {
>  		struct device_node *pctlnp = of_get_parent(bank->of_node);
>  		struct pinctrl_dev *pctldev = NULL;
> 
> diff --git a/drivers/gpio/gpiolib-of.c b/drivers/gpio/gpiolib-of.c
> index 880f1efcaca5..2e537ee979f3 100644
> --- a/drivers/gpio/gpiolib-of.c
> +++ b/drivers/gpio/gpiolib-of.c
> @@ -337,7 +337,7 @@ static void of_gpio_flags_quirks(const struct
> device_node *np,
>  	 * to determine if the flags should have inverted semantics.
>  	 */
>  	if (IS_ENABLED(CONFIG_SPI_MASTER) && !strcmp(propname, "cs-gpios") &&
> -	    of_property_read_bool(np, "cs-gpios")) {
> +	    of_property_present(np, "cs-gpios")) {
>  		u32 cs;
>  		int ret;

