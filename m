Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8914FD31769
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  5 Nov 2024 17:12:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=UUlPSBaOC9d+zd+83UAmHf4D5WXCkU2ZNOnKm544xr0=; b=y4XTeX+P6ihdIrs0nNB/Tv9Kb4
	doeF05zvgyvF+ZUBqA546vKhSPQgq6IHXAlv/+2CldtdDpPJjHXNR85OvOV9cCbO0XZxPJOSPuLTY
	5pX0/FYNeZ05Ew8/mJVl8Z+Rhisawww05j8bzTCaOWT1QcHYTO3dk2ryUX5sNi2Gg3Sc7yMJ0j60Z
	HEqBF1dXCT41lkMIup2kJXAZroOonzzalAogSZSUvI6J2X2BTKZqHoGY5e2daw3NTBrxPm8E60WQR
	Vi5TqpokdZLG57xp6jEBTN4sgADOTIo4LasCQeM28/yJgfXFJ7jQ+y+nIRR4PNHTZ2ihXonnMDRQe
	Gp01lk4A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t8N6J-00000000Ano-0Xxx;
	Tue, 05 Nov 2024 17:12:19 +0000
Received: from gloria.sntech.de ([185.11.138.130])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t8M97-0000000HaTP-2prp;
	Tue, 05 Nov 2024 16:11:10 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de;
	s=gloria202408; h=Content-Type:Content-Transfer-Encoding:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=UUlPSBaOC9d+zd+83UAmHf4D5WXCkU2ZNOnKm544xr0=; b=P/tXaSv90nk6bdipbMTMj/vRGt
	IDM6BNLW6i0VuzErzDEVBN9hV9vpg1mk49x1B86HjXEMDYd2KbpWOJCbfKSBC+0MqwPhZ+Re1MFVl
	DLX3kutygIT+jIff8xJl1amvNNYrdugI58Avp4IfEuUjO5HHY7jTIFKMChmpCI8itX27ZSTxSS8JK
	dHIlxB3WJt5DNgkyGFnjqn8ZcprfNgqQ095Dn78bln92O8zW5Q1w3lf5Il+GKH1TkQ58iUgrDv1xw
	gFBTILN0O/GdxXUTjJ7uEYb0HlOdbVaaLnm3CRHpeNACeL0NUksu9xJ29unzDHxm2MSobs4bduzNi
	IvQLbzKg==;
Received: from i53875b28.versanet.de ([83.135.91.40] helo=diego.localnet)
	by gloria.sntech.de with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <heiko@sntech.de>)
	id 1t8M92-0000mH-59; Tue, 05 Nov 2024 17:11:04 +0100
From: Heiko =?ISO-8859-1?Q?St=FCbner?= <heiko@sntech.de>
To: Linus Walleij <linus.walleij@linaro.org>,
 Bartosz Golaszewski <brgl@bgdev.pl>, "Rob Herring (Arm)" <robh@kernel.org>
Cc: linux-gpio@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] gpio: Use of_property_present() for non-boolean properties
Date: Tue, 05 Nov 2024 17:11:03 +0100
Message-ID: <7731755.EvYhyI6sBW@diego>
In-Reply-To: <20241104190628.274717-1-robh@kernel.org>
References: <20241104190628.274717-1-robh@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241105_081109_775628_6AAA6511 
X-CRM114-Status: GOOD (  22.43  )
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

Am Montag, 4. November 2024, 20:06:27 CET schrieb Rob Herring (Arm):
> The use of of_property_read_bool() for non-boolean properties is
> deprecated in favor of of_property_present() when testing for property
> presence.
> 
> Signed-off-by: Rob Herring (Arm) <robh@kernel.org>

With of_property_present essentially just mapping to of_property_read_bool,
this change looks correct and should not introduce any functional differences

Reviewed-by: Heiko Stuebner <heiko@sntech.de>

> ---
>  drivers/gpio/gpio-rockchip.c | 2 +-
>  drivers/gpio/gpiolib-of.c    | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/gpio/gpio-rockchip.c b/drivers/gpio/gpio-rockchip.c
> index 365ab947983c..64924bc01591 100644
> --- a/drivers/gpio/gpio-rockchip.c
> +++ b/drivers/gpio/gpio-rockchip.c
> @@ -602,7 +602,7 @@ static int rockchip_gpiolib_register(struct rockchip_pin_bank *bank)
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
> @@ -337,7 +337,7 @@ static void of_gpio_flags_quirks(const struct device_node *np,
>  	 * to determine if the flags should have inverted semantics.
>  	 */
>  	if (IS_ENABLED(CONFIG_SPI_MASTER) && !strcmp(propname, "cs-gpios") &&
> -	    of_property_read_bool(np, "cs-gpios")) {
> +	    of_property_present(np, "cs-gpios")) {
>  		u32 cs;
>  		int ret;
>  
> 





