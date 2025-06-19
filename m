Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D82DDC7115B
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 19 Jun 2025 09:50:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=eD7eXQjCVZXrASkEWcilBg8DLF0GyjTxOwYQy8veqf8=; b=u/8sCdsgF7l9EWw2Xbxazaz7z0
	WzS1IJ5WwHJXLEOrvqymmZd0etgkaZt6V5srcPt9ca5oaXfhmaN4PkdoJakKAgoGY4TphP9bnSy2e
	bUgZyz0JPIksS9NoQCqwrkv+OFmj3RXwcWFDqKV2JqUlsQ1IdD5kDbWRRsjUMDb/TgOx6NPY+H8fu
	HBNrDi8DwZH63Y4fzFkIGNkFQ/WIalciIQHHCWkhF+m774gN6OIe5GwGffZ/FgTo1r2t+6paYNrM9
	4qh8kNzZkWYMXG7s39yXflReRxwiCdWVYngMasednjkkPuW5SQP9fGSU/Eo0pSVd7Fh8Z6fC/u4wz
	OJu1HTHA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uSBuW-0000000CfiC-1zbb;
	Thu, 19 Jun 2025 09:50:20 +0000
Received: from gloria.sntech.de ([185.11.138.130])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uSB2o-0000000CVav-3ktq;
	Thu, 19 Jun 2025 08:54:51 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de;
	s=gloria202408; h=Content-Type:Content-Transfer-Encoding:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID;
	bh=eD7eXQjCVZXrASkEWcilBg8DLF0GyjTxOwYQy8veqf8=; b=o/6iUb+ZXais31yF8EysEgF4nP
	6sr4Vg/Z4rY9ovh5IfCwzyhKZLARasyvwvWzjrhIYyyxi94HFmFUF14PJKRMupQZJHu1sLL8CP7/9
	SECVU1JfQoHKkLSmOR3KKA0UQEUmmCIT67OvC71waWiCBcHaOdGuMGxtQZoPF1BAOKLeLdZw+Zsyu
	k4jFb8axA9Owba/EOT3Sh7ZoDF4e1T8qJFLkArK4D9dl4XdvWvvvw/bYZuLkL7vKH8csHF98J6NmP
	WGgyR6kjpFPZLcAFtdmlZLcItUXUz7oMJQHdT/v5gBQLkHy+wTzvafJZPhcpxyKw8tMESvkTq17my
	Fnly6pzQ==;
Received: from 85-207-219-154.static.bluetone.cz ([85.207.219.154] helo=phil.localnet)
	by gloria.sntech.de with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <heiko@sntech.de>)
	id 1uSB2j-00079q-Db; Thu, 19 Jun 2025 10:54:45 +0200
From: Heiko Stuebner <heiko@sntech.de>
To: Linus Walleij <linus.walleij@linaro.org>,
 Bartosz Golaszewski <brgl@bgdev.pl>, Andy Shevchenko <andy@kernel.org>,
 Orson Zhai <orsonzhai@gmail.com>,
 Baolin Wang <baolin.wang@linux.alibaba.com>,
 Chunyan Zhang <zhang.lyra@gmail.com>,
 Robert Jarzmik <robert.jarzmik@free.fr>, Bartosz Golaszewski <brgl@bgdev.pl>
Cc: linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org,
 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Subject: Re: [PATCH v2 10/12] gpio: rockchip: use new GPIO line value setter callbacks
Date: Thu, 19 Jun 2025 10:54:44 +0200
Message-ID: <15862883.tv2OnDr8pf@phil>
In-Reply-To: <20250619-gpiochip-set-rv-gpio-v2-10-74abf689fbd8@linaro.org>
References: <20250619-gpiochip-set-rv-gpio-v2-0-74abf689fbd8@linaro.org>
 <20250619-gpiochip-set-rv-gpio-v2-10-74abf689fbd8@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250619_015450_934373_4663A52A 
X-CRM114-Status: GOOD (  17.32  )
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

Am Donnerstag, 19. Juni 2025, 10:33:23 Mitteleurop=C3=A4ische Sommerzeit sc=
hrieb Bartosz Golaszewski:
> From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
>=20
> struct gpio_chip now has callbacks for setting line values that return
> an integer, allowing to indicate failures. Convert the driver to using
> them.
>=20
> Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

Reviewed-by: Heiko Stuebner <heiko@sntech.de>



> ---
>  drivers/gpio/gpio-rockchip.c | 8 +++++---
>  1 file changed, 5 insertions(+), 3 deletions(-)
>=20
> diff --git a/drivers/gpio/gpio-rockchip.c b/drivers/gpio/gpio-rockchip.c
> index 64700a003f9a17947dd38baea23a066e8c057caf..ecd60ff9e1dd1a090bfad204c=
8b86c4d7fb68ce7 100644
> --- a/drivers/gpio/gpio-rockchip.c
> +++ b/drivers/gpio/gpio-rockchip.c
> @@ -177,8 +177,8 @@ static int rockchip_gpio_set_direction(struct gpio_ch=
ip *chip,
>  	return 0;
>  }
> =20
> -static void rockchip_gpio_set(struct gpio_chip *gc, unsigned int offset,
> -			      int value)
> +static int rockchip_gpio_set(struct gpio_chip *gc, unsigned int offset,
> +			     int value)
>  {
>  	struct rockchip_pin_bank *bank =3D gpiochip_get_data(gc);
>  	unsigned long flags;
> @@ -186,6 +186,8 @@ static void rockchip_gpio_set(struct gpio_chip *gc, u=
nsigned int offset,
>  	raw_spin_lock_irqsave(&bank->slock, flags);
>  	rockchip_gpio_writel_bit(bank, offset, value, bank->gpio_regs->port_dr);
>  	raw_spin_unlock_irqrestore(&bank->slock, flags);
> +
> +	return 0;
>  }
> =20
>  static int rockchip_gpio_get(struct gpio_chip *gc, unsigned int offset)
> @@ -325,7 +327,7 @@ static int rockchip_gpio_to_irq(struct gpio_chip *gc,=
 unsigned int offset)
>  static const struct gpio_chip rockchip_gpiolib_chip =3D {
>  	.request =3D gpiochip_generic_request,
>  	.free =3D gpiochip_generic_free,
> -	.set =3D rockchip_gpio_set,
> +	.set_rv =3D rockchip_gpio_set,
>  	.get =3D rockchip_gpio_get,
>  	.get_direction	=3D rockchip_gpio_get_direction,
>  	.direction_input =3D rockchip_gpio_direction_input,
>=20
>=20





