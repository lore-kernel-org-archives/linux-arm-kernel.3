Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AFFC6EA7195
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 19 Apr 2026 10:16:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=3hALoF0Oo7o1hFUzR9bl3PUJDzj00xQhW5r1yoXZYQs=; b=jq4eqhKHTdymuEtQb636Ppbn+R
	QleC79W/IZXl1Hvy7kHR7DF5oA0l2UBFImd4ilXrhuFNM0hzmkOSN8L+/oa10E3Ui2k9I9UmwvJCp
	6kEVdss+e3fYVK/k9mIF/B/uDggnT3fdVrxUV6JusnL61BWZIygosfSk8kJtSeT/vy2sW9Jyj+8sK
	uoNRkVIuEeVWLFvJW/B6WWY20y3nq7DmEatMFzNDrQB4CFbsf3raBKkkjrWKa9+0lAjDDxSHtnrx3
	xqG9gcU53dx1ZTpF/LMEJl9dD4pTEzKfn3LX+U5CT7Cs5J209Pg3VgZ+zZ9gz4Co+5zVcNbNkrGhp
	dBuBiL9w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wEPC1-00000005hHu-1vmM;
	Sun, 19 Apr 2026 10:15:57 +0000
Received: from gloria.sntech.de ([185.11.138.130])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wEPBy-00000005hHU-1SxO;
	Sun, 19 Apr 2026 10:15:55 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de;
	s=gloria202408; h=Content-Type:Content-Transfer-Encoding:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Reply-To;
	bh=3hALoF0Oo7o1hFUzR9bl3PUJDzj00xQhW5r1yoXZYQs=; b=acoJCEHcollrpbOxAJevsKGWUM
	LbUHHMHCGAuFK9Z1DikrcPh+8Wl/rD3Md3X2Cx/OdphYPfYvGyUTnEULIcJlK7THYu0mgSX8w529Z
	em9wMX672M6pQNVNreXnvxDyY/FMX4NypD/Tm36Sd16YjCT5/dKva42QICdwpLWVdM3lPhij07qwb
	zh6NKZTZFn3inHqyKY0QU59vai1k73gSPggLD6GlpM+4Bz3tf6sZb5ut8Pa3UJ97Ns6hJlAojACsX
	TObHyVOp7ZG34IqpGJeY34RtyzH814kHmCZKP4ZYT4QYlBhU5+99/bQF8DVhPpaVU5DLfzltto3cl
	mapE4tZQ==;
From: Heiko Stuebner <heiko@sntech.de>
To: Linus Walleij <linusw@kernel.org>, Bartosz Golaszewski <brgl@kernel.org>,
 Shawn Lin <shawn.lin@rock-chips.com>, Jonas Karlman <jonas@kwiboo.se>
Cc: Jonas Karlman <jonas@kwiboo.se>,
 Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
 linux-gpio@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] gpio: rockchip: Fix GPIO after convert to dynamic base allocation
Date: Sun, 19 Apr 2026 12:15:35 +0200
Message-ID: <3847682.RUnXabflUD@phil>
In-Reply-To: <20260416154928.2103388-1-jonas@kwiboo.se>
References: <20260416154928.2103388-1-jonas@kwiboo.se>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260419_031554_448037_14E59F59 
X-CRM114-Status: GOOD (  18.87  )
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

Am Donnerstag, 16. April 2026, 17:49:28 Mitteleurop=C3=A4ische Sommerzeit s=
chrieb Jonas Karlman:
> The commit c8079f83e0bf ("gpio: rockchip: convert to dynamic GPIO base
> allocation") broke GPIO on devices using device trees which don't set
> the gpio-ranges property, something only Rockchip RK35xx SoC DTs do.
>=20
> On a Rockchip RK3399 device something like following is now observed:
>=20
> [    0.082771] rockchip-gpio ff720000.gpio: probed /pinctrl/gpio@ff720000
> [    0.083531] rockchip-gpio ff730000.gpio: probed /pinctrl/gpio@ff730000
> [    0.084110] rockchip-gpio ff780000.gpio: probed /pinctrl/gpio@ff780000
> [    0.084746] rockchip-gpio ff788000.gpio: probed /pinctrl/gpio@ff788000
> [    0.085389] rockchip-gpio ff790000.gpio: probed /pinctrl/gpio@ff790000
> --
> [    0.212208] rockchip-pinctrl pinctrl: pin 637 is not registered so it =
cannot be requested
> [    0.212271] rockchip-pinctrl pinctrl: error -EINVAL: pin-637 (gpio3:63=
7)
> [    0.212344] leds-gpio leds: error -EINVAL: Failed to get GPIO '/leds/l=
ed-0'
> [    0.212389] leds-gpio leds: probe with driver leds-gpio failed with er=
ror -22
> --
> [    0.607545] rockchip-pinctrl pinctrl: pin 519 is not registered so it =
cannot be requested
> [    0.608775] rockchip-pinctrl pinctrl: error -EINVAL: pin-519 (gpio0:51=
9)
> [    0.610003] dwmmc_rockchip fe320000.mmc: probe with driver dwmmc_rockc=
hip failed with error -22
> --
> [    0.805882] rockchip-pinctrl pinctrl: pin 547 is not registered so it =
cannot be requested
> [    0.806672] rockchip-pinctrl pinctrl: error -EINVAL: pin-547 (gpio1:54=
7)
> [    0.807301] reg-fixed-voltage regulator-vbus-typec: error -EINVAL: can=
't get GPIO
> [    0.807307] rockchip-pinctrl pinctrl: pin 602 is not registered so it =
cannot be requested
> [    0.807970] reg-fixed-voltage regulator-vbus-typec: probe with driver =
reg-fixed-voltage failed with error -22
> [    0.808692] rockchip-pinctrl pinctrl: error -EINVAL: pin-602 (gpio2:60=
2)
> [    0.810279] reg-fixed-voltage regulator-vcc3v3-pcie: error -EINVAL: ca=
n't get GPIO
> [    0.810284] rockchip-pinctrl pinctrl: pin 665 is not registered so it =
cannot be requested
> [    0.810299] rockchip-pinctrl pinctrl: error -EINVAL: pin-665 (gpio4:66=
5)
> [    0.810960] reg-fixed-voltage regulator-vcc3v3-pcie: probe with driver=
 reg-fixed-voltage failed with error -22
> [    0.811679] reg-fixed-voltage regulator-vcc5v0-host: error -EINVAL: ca=
n't get GPIO
> [    0.813943] reg-fixed-voltage regulator-vcc5v0-host: probe with driver=
 reg-fixed-voltage failed with error -22
> --
> [    0.867788] rockchip-pinctrl pinctrl: pin 522 is not registered so it =
cannot be requested
> [    0.868537] rockchip-pinctrl pinctrl: error -EINVAL: pin-522 (gpio0:52=
2)
> [    0.869166] pwrseq_simple sdio-pwrseq: error -EINVAL: reset GPIOs not =
ready
> [    0.869798] pwrseq_simple sdio-pwrseq: probe with driver pwrseq_simple=
 failed with error -22
> --
> [    0.940365] rockchip-pinctrl pinctrl: pin 623 is not registered so it =
cannot be requested
> [    0.941084] rockchip-pinctrl pinctrl: error -EINVAL: pin-623 (gpio3:62=
3)
> [    0.941823] rk_gmac-dwmac fe300000.ethernet: error -EINVAL: Cannot reg=
ister the MDIO bus
> [    0.942542] rk_gmac-dwmac fe300000.ethernet: error -EINVAL: MDIO bus (=
id: 0) registration failed
> [    0.943772] rk_gmac-dwmac fe300000.ethernet: probe with driver rk_gmac=
=2Ddwmac failed with error -22
>=20
> Restore GPIO to a working state on devices using older Rockchip SoCs
> and/or DTs not having the gpio-ranges property set by restoring prior
> use of bank->pin_base as the pin_offset value.
>=20
> Also change to use bank->nr_pins as the npins value to align and prevent
> a possible future breakage if gc->ngpio is ever changed to match the 32
> GPIOs each controller theoretically can handle.
>=20
> Fixes: c8079f83e0bf ("gpio: rockchip: convert to dynamic GPIO base alloca=
tion")
> Signed-off-by: Jonas Karlman <jonas@kwiboo.se>

Acked-by: Heiko Stuebner <heiko@sntech.de>

> ---
>  drivers/gpio/gpio-rockchip.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/drivers/gpio/gpio-rockchip.c b/drivers/gpio/gpio-rockchip.c
> index 08ea64434f8f..44d7ebd12724 100644
> --- a/drivers/gpio/gpio-rockchip.c
> +++ b/drivers/gpio/gpio-rockchip.c
> @@ -617,7 +617,7 @@ static int rockchip_gpiolib_register(struct rockchip_=
pin_bank *bank)
>  			return -ENODEV;
> =20
>  		ret =3D gpiochip_add_pin_range(gc, dev_name(pctldev->dev), 0,
> -					     gc->base, gc->ngpio);
> +					     bank->pin_base, bank->nr_pins);
>  		if (ret) {
>  			dev_err(bank->dev, "Failed to add pin range\n");
>  			goto fail;
>=20





