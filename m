Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2D2EFC369C2
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 16 Apr 2025 22:39:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=4BoH+O5NCuGSIVDmQBF6wDB6F5fTfV3Gp+41EkwRIMg=; b=IzGqeA8Tqvu75cwxw4eAJgvg0p
	FpQTeZSGCdok3F+bMU0HagqLXC9cXMUKlKectIL8GSv2Uc7W1I2fxjg8G35rJSG0HbdnOLCVQUp75
	lW8Kk1NbWB7cQ9MyiUFTquLgxRUMA8t/iKQO7267lGrFkpdzuUqbZPl4zuA1/rqZVUR9DJ6xsVJQc
	MHV10XMG2i1bBod3bYcyhCCbdvw7RxQJPT9rF4gBZj3pCmHXEB9oGrIzb+H7SXlPLzo1v2E/iKJBa
	TmRnprGfbw3lDA2UlYR+QdiMF5cYzD2yHzf223zsQERrvw0SPRIHV/4UAL8mWUuNo4B7vdJrWzUnt
	36keeN3w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u5BPS-0000000B3pV-2Xdd;
	Wed, 16 Apr 2025 22:39:10 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u5BNZ-0000000B3cg-2i3X;
	Wed, 16 Apr 2025 22:37:13 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 6D3B66156A;
	Wed, 16 Apr 2025 22:36:55 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 36CBCC4CEE2;
	Wed, 16 Apr 2025 22:37:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1744843032;
	bh=GdvsN1LtIHMY8zJSroI+9TWLVN4zqOg8OLguK4T3YjA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ZClOAeIM863a5cHtZdWqGyG/lFZkKazWfOYJgO2WTst8ltDgkE9vnjhpEYrBZLHIe
	 C3pO+37q5MOe5PHcz02RW3JmIudnwBydcFQpofXfAhdeU/1yQ7sVWog0OpOIbCXavF
	 2NmAncXKuOlvIqQ6EHSXOFpbZVeiAEGY92cv6RK6NKNo5VrOWUXtZ8LuZqUm2pe9pp
	 hwytpPlUSzl/cgKgjiGN//rCk5vjCi6qd7puCiw47a+cR1NiuZ9MXB2F9shwJwsVZT
	 G99jaqyYHUVZPwSz2sCWrhPMOtPhOMUR6PTdwn2boubTP7LQvijpzr9UBDOerornaZ
	 VyNtIsoMCcktg==
Date: Wed, 16 Apr 2025 15:37:06 -0700
From: Nathan Chancellor <nathan@kernel.org>
To: Bartosz Golaszewski <brgl@bgdev.pl>
Cc: Ludovic Desroches <ludovic.desroches@microchip.com>,
	Linus Walleij <linus.walleij@linaro.org>,
	Nicolas Ferre <nicolas.ferre@microchip.com>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Claudiu Beznea <claudiu.beznea@tuxon.dev>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Kevin Hilman <khilman@baylibre.com>,
	Jerome Brunet <jbrunet@baylibre.com>,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
	Xianwei Zhao <xianwei.zhao@amlogic.com>,
	Patrick Rudolph <patrick.rudolph@9elements.com>,
	linux-arm-kernel@lists.infradead.org, linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-amlogic@lists.infradead.org,
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Subject: Re: [PATCH 07/10] pinctrl: sx150x: enable building modules with
 COMPILE_TEST=y
Message-ID: <20250416223706.GA3230303@ax162>
References: <20250408-gpiochip-set-rv-pinctrl-part1-v1-0-c9d521d7c8c7@linaro.org>
 <20250408-gpiochip-set-rv-pinctrl-part1-v1-7-c9d521d7c8c7@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250408-gpiochip-set-rv-pinctrl-part1-v1-7-c9d521d7c8c7@linaro.org>
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

On Tue, Apr 08, 2025 at 09:17:44AM +0200, Bartosz Golaszewski wrote:
> From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> 
> Increase the build coverage by enabling the sx150x modules with
> COMPILE_TEST=y.
> 
> Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> ---
>  drivers/pinctrl/Kconfig | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/pinctrl/Kconfig b/drivers/pinctrl/Kconfig
> index 464cc9aca157..94eb41bb9cf2 100644
> --- a/drivers/pinctrl/Kconfig
> +++ b/drivers/pinctrl/Kconfig
> @@ -541,7 +541,7 @@ config PINCTRL_STMFX
>  
>  config PINCTRL_SX150X
>  	bool "Semtech SX150x I2C GPIO expander pinctrl driver"
> -	depends on I2C=y
> +	depends on I2C=y || COMPILE_TEST
>  	select PINMUX
>  	select PINCONF
>  	select GENERIC_PINCONF
> 
> -- 
> 2.45.2
> 

This appears to break allmodconfig with

  ld.lld: error: undefined symbol: i2c_get_match_data
  >>> referenced by pinctrl-sx150x.c
  >>>               drivers/pinctrl/pinctrl-sx150x.o:(sx150x_probe) in archive vmlinux.a

  ld.lld: error: undefined symbol: i2c_smbus_write_byte_data
  >>> referenced by pinctrl-sx150x.c
  >>>               drivers/pinctrl/pinctrl-sx150x.o:(sx150x_probe) in archive vmlinux.a
  >>> referenced by pinctrl-sx150x.c
  >>>               drivers/pinctrl/pinctrl-sx150x.o:(sx150x_probe) in archive vmlinux.a
  >>> referenced by pinctrl-sx150x.c
  >>>               drivers/pinctrl/pinctrl-sx150x.o:(sx150x_regmap_reg_write) in archive vmlinux.a

  ld.lld: error: undefined symbol: i2c_smbus_read_byte_data
  >>> referenced by pinctrl-sx150x.c
  >>>               drivers/pinctrl/pinctrl-sx150x.o:(sx150x_regmap_reg_read) in archive vmlinux.a

  ld.lld: error: undefined symbol: i2c_register_driver
  >>> referenced by pinctrl-sx150x.c
  >>>               drivers/pinctrl/pinctrl-sx150x.o:(sx150x_init) in archive vmlinux.a
  make[4]: *** [scripts/Makefile.vmlinux:91: vmlinux] Error 1

I don't think this change makes much sense in light of this error,
unless the driver was converted to tristate.

Cheers,
Nathan

