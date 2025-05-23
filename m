Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6EB25C54ED1
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 23 May 2025 15:30:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=xqIyzg/Zmh6NDFSRkYXX2a3Img5joBgl9hB3KxXqRQ0=; b=W3la8YIoSK9ZsDvqEj7gjChHGl
	3gpGk5BnYt8Wcf0di/yDdo15wexM3g+whDGTIUMF5GfaclmHKyUpDoyLF9gAvpGNPWmzfN+32qgmg
	C2AuGhEJCIevyEhBfLV14XXE0dTh1Guf218kFYrs7dRCaNqeFs4VNbv1IMOqcksaZr6gFNQV3nAPr
	1KppfGYST/DZCsEcYzTMbJPD+VCPsebkMTvrqPgYlfzxafz1bCjg0UI2tTDDwaoXakU4hpfW41AD6
	kAZttPk9sDdl+zNF0YFHQqMdFAAuO7h9Qa2ill/O2ooDyphSfGlcYdkn6CYZ+SxvdV9g1LZY9rmYh
	ZOEQFzjA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uIULb-00000004FpS-28uO;
	Fri, 23 May 2025 15:30:11 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uITuy-00000004BPD-0zOs;
	Fri, 23 May 2025 15:02:41 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id DDE8B435BC;
	Fri, 23 May 2025 15:02:37 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 35808C4CEE9;
	Fri, 23 May 2025 15:02:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1748012557;
	bh=/wGZoZr06IvoSdy64ZfiSe05zg44AinRGPA1KN2DtPc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ST6iy15Lg5h6nD54beKKQeg4CoMEY0jA1cuXWk33lWYFl1tzeLymz0+Lq/X1ELwXM
	 4WvFH9SMl6BMpHgsFkNoWdmaVNvK31wsQ3ACnPIfGlvOQafRQsxr+W1UgBbpdWRyPd
	 41irkU6V53woz8P5kfb8bSmHqdOqDEsCNtIONZjnHiN7UFPqipzjDb42lDK/aLjOnf
	 50G5oF79c5hVBXSyZc5T0DV0tPSkcx8rYlyUGfcC/HOO7RqvBl64CWSzWP1xrOsJXU
	 5X6SD9yJnuP98lX868Oilid8d8oOU9UBWwOMCqT2f0bzWBsGxFFUG2Tz2mDFpzeVpX
	 UglKvQ3817qZA==
Date: Fri, 23 May 2025 17:02:34 +0200
From: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <ukleinek@kernel.org>
To: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
Cc: Linus Walleij <linus.walleij@linaro.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>, 
	William Breathitt Gray <wbg@kernel.org>, Sebastian Reichel <sebastian.reichel@collabora.com>, 
	Kever Yang <kever.yang@rock-chips.com>, linux-gpio@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org, 
	linux-pwm@vger.kernel.org, linux-iio@vger.kernel.org, kernel@collabora.com, 
	Jonas Karlman <jonas@kwiboo.se>, Detlev Casanova <detlev.casanova@collabora.com>
Subject: Re: [PATCH 5/7] pwm: Add rockchip PWMv4 driver
Message-ID: <gcirox4uq33lbfthusrphuabvxc2jnnjfazuhuyhohwlnv2gnu@5trpjknqaivm>
References: <20250408-rk3576-pwm-v1-0-a49286c2ca8e@collabora.com>
 <20250408-rk3576-pwm-v1-5-a49286c2ca8e@collabora.com>
 <zg47we7oopvuayi7wyosq6j7uuzz4numystbmluezsim2pxg4g@zvtm3pwzkice>
 <4313739.kQq0lBPeGt@workhorse>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="cskxjzqoesnte4kx"
Content-Disposition: inline
In-Reply-To: <4313739.kQq0lBPeGt@workhorse>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250523_080240_322851_89F2E843 
X-CRM114-Status: GOOD (  65.28  )
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


--cskxjzqoesnte4kx
Content-Type: text/plain; protected-headers=v1; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH 5/7] pwm: Add rockchip PWMv4 driver
MIME-Version: 1.0

[Dropped Jonas Karlman from Cc as his email address doesn't work.]

Hello Nicolas,

On Thu, May 22, 2025 at 03:02:29PM +0200, Nicolas Frattaroli wrote:
> On Tuesday, 13 May 2025 19:26:31 Central European Summer Time Uwe Kleine-=
K=F6nig wrote:
> > On Tue, Apr 08, 2025 at 02:32:17PM +0200, Nicolas Frattaroli wrote:
> > > The Rockchip RK3576 brings with it a new PWM IP, in downstream code
> > > referred to as "v4". This new IP is different enough from the previous
> > > Rockchip IP that I felt it necessary to add a new driver for it, inst=
ead
> > > of shoehorning it in the old one.
> > >=20
> > > Add this new driver, based on the PWM core's waveform APIs. Its platf=
orm
> > > device is registered by the parent mfpwm driver, from which it also
> > > receives a little platform data struct, so that mfpwm can guarantee t=
hat
> > > all the platform device drivers spread across different subsystems for
> > > this specific hardware IP do not interfere with each other.
> > >=20
> > > Signed-off-by: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
> > > ---
> > >  MAINTAINERS                   |   1 +
> > >  drivers/pwm/Kconfig           |  13 ++
> > >  drivers/pwm/Makefile          |   1 +
> > >  drivers/pwm/pwm-rockchip-v4.c | 336 ++++++++++++++++++++++++++++++++=
++++++++++
> > >  4 files changed, 351 insertions(+)
> > >=20
> > > diff --git a/MAINTAINERS b/MAINTAINERS
> > > index e6a9347be1e7889089e1d9e655cb23c2d8399b40..3ddd245fd4ad8d9ed2e76=
2910a7a1f6436f93e34 100644
> > > --- a/MAINTAINERS
> > > +++ b/MAINTAINERS
> > > @@ -20891,6 +20891,7 @@ L:	linux-rockchip@lists.infradead.org
> > >  L:	linux-pwm@vger.kernel.org
> > >  S:	Maintained
> > >  F:	Documentation/devicetree/bindings/pwm/rockchip,rk3576-pwm.yaml
> > > +F:	drivers/pwm/pwm-rockchip-v4.c
> > >  F:	drivers/soc/rockchip/mfpwm.c
> > >  F:	include/soc/rockchip/mfpwm.h
> > > =20
> > > diff --git a/drivers/pwm/Kconfig b/drivers/pwm/Kconfig
> > > index 4731d5b90d7edcc61138e4a5bf7e98906953ece4..242039f62ab091cea337b=
f27ef310bcf696b6ed0 100644
> > > --- a/drivers/pwm/Kconfig
> > > +++ b/drivers/pwm/Kconfig
> > > @@ -540,6 +540,19 @@ config PWM_ROCKCHIP
> > >  	  Generic PWM framework driver for the PWM controller found on
> > >  	  Rockchip SoCs.
> > > =20
> > > +config PWM_ROCKCHIP_V4
> > > +	tristate "Rockchip PWM v4 support"
> > > +	depends on ARCH_ROCKCHIP || COMPILE_TEST
> > > +	depends on ROCKCHIP_MFPWM
> > > +	depends on HAS_IOMEM
> > > +	help
> > > +	  Generic PWM framework driver for the PWM controller found on
> > > +	  later Rockchip SoCs such as the RK3576.
> > > +
> > > +	  Uses the Rockchip Multi-function PWM controller driver infrastruc=
ture
> > > +	  to guarantee fearlessly concurrent operation with other functions=
 of
> > > +	  the same device implemented by drivers in other subsystems.
> > > +
> > >  config PWM_RZ_MTU3
> > >  	tristate "Renesas RZ/G2L MTU3a PWM Timer support"
> > >  	depends on RZ_MTU3
> > > diff --git a/drivers/pwm/Makefile b/drivers/pwm/Makefile
> > > index 539e0def3f82fcb866ab83a0346a15f7efdd7127..b5aca7ff58ac83f844581=
df526624617025291de 100644
> > > --- a/drivers/pwm/Makefile
> > > +++ b/drivers/pwm/Makefile
> > > @@ -49,6 +49,7 @@ obj-$(CONFIG_PWM_RASPBERRYPI_POE)	+=3D pwm-raspberr=
ypi-poe.o
> > >  obj-$(CONFIG_PWM_RCAR)		+=3D pwm-rcar.o
> > >  obj-$(CONFIG_PWM_RENESAS_TPU)	+=3D pwm-renesas-tpu.o
> > >  obj-$(CONFIG_PWM_ROCKCHIP)	+=3D pwm-rockchip.o
> > > +obj-$(CONFIG_PWM_ROCKCHIP_V4)	+=3D pwm-rockchip-v4.o
> > >  obj-$(CONFIG_PWM_RZ_MTU3)	+=3D pwm-rz-mtu3.o
> > >  obj-$(CONFIG_PWM_SAMSUNG)	+=3D pwm-samsung.o
> > >  obj-$(CONFIG_PWM_SIFIVE)	+=3D pwm-sifive.o
> > > diff --git a/drivers/pwm/pwm-rockchip-v4.c b/drivers/pwm/pwm-rockchip=
-v4.c
> > > new file mode 100644
> > > index 0000000000000000000000000000000000000000..980b27454ef9b930bef04=
96ca528533cf419fa0e
> > > --- /dev/null
> > > +++ b/drivers/pwm/pwm-rockchip-v4.c
> > > @@ -0,0 +1,336 @@
> > > +// SPDX-License-Identifier: GPL-2.0-or-later
> > > +/*
> > > + * Copyright (c) 2025 Collabora Ltd.
> > > + *
> > > + * A Pulse-Width-Modulation (PWM) generator driver for the generator=
s found in
> > > + * Rockchip SoCs such as the RK3576, internally referred to as "PWM =
v4". Uses
> > > + * the MFPWM infrastructure to guarantee exclusive use over the devi=
ce without
> > > + * other functions of the device from different drivers interfering =
with its
> > > + * operation while it's active.
> >=20
> > Can you please add a "Limitations" paragraph here similar to the other
> > newer drivers that explains how the hardware behave on disable
> > (inactive? High-Z? freeze?), if there are glitches possible when
> > settings are changed or if the currently running period is completed on
> > reconfiguration.
>=20
> Will do. Might need a few long hours with the logic analyzer and poking at
> the common clock framework to cover all bases.

Usually it's simpler. e.g. if you set period=3D1s,duty=3D0 and then
period=3D2s,duty=3D2 an LED is enough to determine if the current period is
completed before a change.

You don't find High-Z with an LED but can distinguish between "inactive
when off" and "freeze when off". The datasheet might know about High-Z.

Apropos datasheet: If that is publically available, a reference to it in
the driver's header would be awesome.

> > > +static int rockchip_pwm_v4_round_wf_tohw(struct pwm_chip *chip,
> > > +					 struct pwm_device *pwm,
> > > +					 const struct pwm_waveform *wf,
> > > +					 void *_wfhw)
> > > +{
> > > +	struct rockchip_pwm_v4 *pc =3D to_rockchip_pwm_v4(chip);
> > > +	struct rockchip_pwm_v4_wf *wfhw =3D _wfhw;
> > > +	unsigned long rate;
> > > +	int ret =3D 0;
> > > +
> > > +	/* We do not want chosen_clk to change out from under us here */
> > > +	ret =3D mfpwm_acquire(pc->pwmf);
> > > +	if (ret)
> > > +		return ret;
> > > +
> > > +	rate =3D mfpwm_clk_get_rate(pc->pwmf->parent);
> > > +
> > > +	ret =3D rockchip_pwm_v4_round_params(rate, wf->duty_length_ns,
> > > +					   wf->period_length_ns,
> > > +					   wf->duty_offset_ns, &wfhw->duty,
> > > +					   &wfhw->period, &wfhw->offset);
> > > +
> > > +	if (wf->period_length_ns > 0)
> > > +		wfhw->enable =3D PWMV4_EN_BOTH_MASK;
> > > +	else
> > > +		wfhw->enable =3D 0;
> > > +
> > > +	dev_dbg(&chip->dev, "tohw: duty =3D %u, period =3D %u, offset =3D %=
u, rate %lu\n",
> > > +		wfhw->duty, wfhw->period, wfhw->offset, rate);
> > > +
> > > +	mfpwm_release(pc->pwmf);
> > > +	return ret;
> >=20
> > This is wrong. If a too high value for (say) period_length_ns is
> > requested, you're supposed to configure the maximal possible
> > period_length and not return a failure.
>=20
> Ack. What if offset > period - duty is requested? Should I just saturate =
it
> to period - duty in that case?

If you configure period =3D 10, duty =3D offset =3D 6 the period restart is
supposed to happen during the active phase, that is it looks as follows:

    __     _____     _____     _____     ____
      \___/     \___/     \___/     \___/   =20
    ^         ^         ^         ^         ^
    01234567890

('^' marks the period start.)

> > > +	ret =3D mfpwm_acquire(pc->pwmf);
> > > +	if (ret)
> > > +		return ret;
> > > +
> > > +	rate =3D mfpwm_clk_get_rate(pc->pwmf->parent);
> >=20
> > Why isn't that a proper clock that you can call clk_get_rate() (and
> > clk_rate_exclusive_get()) for?
>=20
> Because I didn't know clk-mux.c existed :( But even with it, I'm not sure
> if letting mfpwm function drivers touch the clk directly is a good idea,
> as this either means storing it in their pwmf struct or making the members
> of the mfpwm struct part of the shared header.

The different drivers shouldn't need to touch the clk directly, the clk
API functions should be enough?!
=20
> > > +	wfhw->period =3D mfpwm_reg_read(pc->pwmf->base, PWMV4_REG_PERIOD);
> > > +	wfhw->duty =3D mfpwm_reg_read(pc->pwmf->base, PWMV4_REG_DUTY);
> > > +	wfhw->offset =3D mfpwm_reg_read(pc->pwmf->base, PWMV4_REG_OFFSET);
> > > +	wfhw->enable =3D mfpwm_reg_read(pc->pwmf->base, PWMV4_REG_ENABLE) &=
 PWMV4_EN_BOTH_MASK;
> > > +
> > > +	mfpwm_release(pc->pwmf);
> > > +
> > > +	return 0;
> > > +}
> > > +
> > > +static int rockchip_pwm_v4_write_wf(struct pwm_chip *chip, struct pw=
m_device *pwm,
> > > +				    const void *_wfhw)
> > > +{
> > > +	struct rockchip_pwm_v4 *pc =3D to_rockchip_pwm_v4(chip);
> > > +	const struct rockchip_pwm_v4_wf *wfhw =3D _wfhw;
> > > +	bool was_enabled =3D false;
> > > +	int ret =3D 0;
> > > +
> > > +	ret =3D mfpwm_acquire(pc->pwmf);
> > > +	if (ret)
> > > +		return ret;
> > > +
> > > +	was_enabled =3D pwmv4_is_enabled(mfpwm_reg_read(pc->pwmf->base,
> > > +						      PWMV4_REG_ENABLE));

Just noticed: pwmv4_is_enabled has the wrong prefix. Please use
"rockchip_pwm_v4" consistently.

> > > +	/*
> > > +	 * "But Nicolas", you ask with valid concerns, "why would you enabl=
e the
> > > +	 * PWM before setting all the parameter registers?"
> >=20
> > Funny, I had this thought alread for mfpwm_acquire() above. Do you also
> > need that if wfhw->enable =3D=3D 0?
>=20
> The only thing mfpwm_acquire does is check that this driver is the only
> one using the hardware, and enabling the bus clk so registers can be
> accessed. The clock that the PWM signal is derived from, as well as
> enabling and disabling PWM, is a separate step. In this case, we need
> to have acquired mfpwm beforehand to do the reg read for was_enabled.

ok.

> > > +	if (pwmv4_is_enabled(wfhw->enable)) {
> > > +		if (!was_enabled) {
> > > +			dev_dbg(&chip->dev, "enabling PWM output\n");
> > > +			ret =3D mfpwm_pwmclk_enable(pc->pwmf);
> > > +			if (ret)
> > > +				goto err_mfpwm_release;
> > > +
> > > +			/*
> > > +			 * Output should be on now, acquire device to guarantee
> > > +			 * exclusion with other device functions while it's on.
> > > +			 */
> > > +			ret =3D mfpwm_acquire(pc->pwmf);
> > > +			if (ret)
> > > +				goto err_mfpwm_release;
> >=20
> > Alternatively to calling mfpwm_acquire once more, you could also skip
> > the mfpwm_release() below. That makes the code a bit more complicated,
> > but also reduces the number of possible failing points.
>=20
> I think I did this at some stage but it'd just necessitate duplicating the
> if condition at the release point. The else-if branch just down below sti=
ll
> needs to exist since we need to not just balance this function's acquire,
> but the fact that we kept it acquired when we turned it on so we need to
> release it an extra time when we turn it off. I don't think changing this
> to eliminate the additional acquire call has clear benefits here.

I'll keep that in mind and will try it maybe myself on top of v2.

> > > +static int rockchip_pwm_v4_probe(struct platform_device *pdev)
> > > +{
> > > +	struct rockchip_mfpwm_func *pwmf =3D dev_get_platdata(&pdev->dev);
> > > +	struct rockchip_pwm_v4 *pc;
> > > +	struct pwm_chip *chip;
> > > +	int ret;
> > > +
> > > +	chip =3D devm_pwmchip_alloc(&pdev->dev, 1, sizeof(*pc));
> > > +	if (IS_ERR(chip))
> > > +		return PTR_ERR(chip);
> > > +
> > > +	pc =3D to_rockchip_pwm_v4(chip);
> > > +	pc->pwmf =3D pwmf;
> > > +
> > > +	platform_set_drvdata(pdev, pc);
> > > +
> > > +	chip->ops =3D &rockchip_pwm_v4_ops;
> > > +	chip->atomic =3D true;
> > > +
> >=20
> > If the PWM is already enabled you better call mfpwm_acquire() here?
>=20
> As in, if the hardware set the PWM on before the driver probed? I hadn't
> considered this case, and will need to think about it. Could very well be
> a possibility as u-boot does things before us.

The typical application is that the bootloader already shows a splash
screen and then you don't want Linux booting result in a flashing
display.

Best regards
Uwe

--cskxjzqoesnte4kx
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEP4GsaTp6HlmJrf7Tj4D7WH0S/k4FAmgwjggACgkQj4D7WH0S
/k4UlwgAk28UHetAaTVeURSzEQoT8l+QZqvpc0+kyH6VpxwNQSrAtB5d/eYbjqYl
tZeS4WZ8KTBwuE/i5AY/D0hHG7XZ0WjfLV3WKJTXgueqfkRyw+ldzZ/e9nuA2/ot
5T9j9bUCun+4c5sssNNWjb1u8Hi7WtwvG22ALW+BlqNgRavPqzL66ESxfgNgAt9l
eYFLhhX5GpP1ScFqKgOpmCfIT9fD2A3wc8WuPIlj+H1tkhbNMEjZOrKHJXVMCtO8
BDwq9hxbwzB5KSQPZVKLfd+cBhx/Cr2L8VQacloeEsDyu5nckLurLIBa0SfJ90sc
j4gRgTkVbEn1kuiRsgqxp+GK2mX7mA==
=PK9h
-----END PGP SIGNATURE-----

--cskxjzqoesnte4kx--

