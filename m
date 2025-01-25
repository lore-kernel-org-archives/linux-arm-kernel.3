Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C9553C0218C
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 25 Jan 2025 12:20:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=OCWgEAVbuUHv7u/Fo6MrCUR48eIzDRgKs9rEqTQ+aJ4=; b=MWnLtHwZCkkYb+yAHcwiSnpNXd
	uj4TMwNQXfGzS7zXDTfeDxc6RXSAQ4C5i1j6CfrDiaFMSI7ku2r9amGlkeqmcmaUwggpGDmgQFI0H
	CtRgqheRZtLICCqLuo08IQqS7FITVvzLqtHoCojhUQe4BqiaXFRxeZD20cHrhCRORZyCw0T/VGRpl
	e/V/G8gX8ep0izkPyLgauk8KN5B4RDUD5QjfRjuxSN3GQx/5rVYyNzdHC/Px3d80gwduairDw4Al4
	1c4rV+lmH/pwhX44nY21G6uB51DEg6JQnWz/UdYlf2SUoYYSm45H0bnpLFmU+aXSZSnFHEd34R4j4
	+yqTLYrA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tbf8u-0000000GNwG-2IuW;
	Sat, 25 Jan 2025 12:20:04 +0000
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tbf7a-0000000GNnp-2tp7
	for linux-arm-kernel@lists.infradead.org;
	Sat, 25 Jan 2025 12:18:43 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id E9CE8A40CFB;
	Sat, 25 Jan 2025 12:16:53 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 911EDC4CED6;
	Sat, 25 Jan 2025 12:18:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1737807520;
	bh=DtuhUQo6cIIxFbScvGXGCdL8XY+9bxpDxjbA4P0hs2A=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=cYD3h+lkMGNnzm2VvMEKLWI+anIFSrxSQ7RBx+ZOOJXsShl7H/nUZJqoBauhxSXzU
	 Je3iHX2RhK1J9lB+CvirOwsPzXs7kIQmGu7KqNSVA88klIgAkuycVFLeo8ToRsZ1V1
	 fZdRXkCqs4C0T5VQ5AZvYDukgddGsgaV7j4MiJ5WU7/hB8D1qGiYfwLkBRMYx3RZfy
	 DIBWhJKQ148COISM891tm1GK4pGPcx8MrQWpzJljcIJG5dfCMZm6slB5Tyg+sa/aA6
	 Pl9Byz7ftZLewvj4v9gsNtMsaCB0ynxhoXFphvRLETZ+hiyK4k0IN2y1phL+lRCBuO
	 WV4t2aLZjAf/Q==
Date: Sat, 25 Jan 2025 12:18:26 +0000
From: Jonathan Cameron <jic23@kernel.org>
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Claudiu <claudiu.beznea@tuxon.dev>, rafael@kernel.org,
 daniel.lezcano@linaro.org, rui.zhang@intel.com, lukasz.luba@arm.com,
 robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
 magnus.damm@gmail.com, mturquette@baylibre.com, sboyd@kernel.org,
 p.zabel@pengutronix.de, ulf.hansson@linaro.org, linux-pm@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-renesas-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-clk@vger.kernel.org, Claudiu Beznea
 <claudiu.beznea.uj@bp.renesas.com>, "open list:IIO SUBSYSTEM AND DRIVERS"
 <linux-iio@vger.kernel.org>
Subject: Re: [PATCH 4/6] thermal: renesas: rzg3s: Add thermal driver for the
 Renesas RZ/G3S SoC
Message-ID: <20250125121826.6abbe7de@jic23-huawei>
In-Reply-To: <CAMuHMdUDKFRsZWsZG9DY4PHdxQEDoPqzfeRx8MNTreOpxdLvpw@mail.gmail.com>
References: <20250103163805.1775705-1-claudiu.beznea.uj@bp.renesas.com>
	<20250103163805.1775705-5-claudiu.beznea.uj@bp.renesas.com>
	<CAMuHMdUDKFRsZWsZG9DY4PHdxQEDoPqzfeRx8MNTreOpxdLvpw@mail.gmail.com>
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.43; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250125_041842_857780_F7F338C2 
X-CRM114-Status: GOOD (  26.99  )
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

On Wed, 22 Jan 2025 11:29:19 +0100
Geert Uytterhoeven <geert@linux-m68k.org> wrote:

> Hi Claudiu,
>=20
> CC iio
>=20
> On Fri, Jan 3, 2025 at 5:38=E2=80=AFPM Claudiu <claudiu.beznea@tuxon.dev>=
 wrote:
> > From: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
> >
> > The Renesas RZ/G3S SoC features a Thermal Sensor Unit (TSU) that reports
> > the junction temperature. The temperature is reported through a dedicat=
ed
> > ADC channel. Add a driver for the Renesas RZ/G3S TSU.
> >
> > Signed-off-by: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com> =20
>=20
> Thanks for your patch!
>=20
> > --- /dev/null
> > +++ b/drivers/thermal/renesas/rzg3s_thermal.c =20
>=20
> > +static int rzg3s_thermal_probe(struct platform_device *pdev)
> > +{
> > +       struct rzg3s_thermal_priv *priv;
> > +       struct device *dev =3D &pdev->dev;
> > +       int ret;
> > +
> > +       priv =3D devm_kzalloc(dev, sizeof(*priv), GFP_KERNEL);
> > +       if (!priv)
> > +               return -ENOMEM;
> > +
> > +       priv->base =3D devm_platform_ioremap_resource(pdev, 0);
> > +       if (IS_ERR(priv->base))
> > +               return PTR_ERR(priv->base);
> > +
> > +       priv->channel =3D devm_iio_channel_get(dev, "tsu"); =20
>=20
> Given there's only a single IIO channel, you could pass NULL instead
> of the name, and drop "io-channel-names" from the DT bindings.
> I don't know what's the IIO policy w.r.t. unnamed channels, though.

It's supported, so fine as long as no future additional names show up.
Will just fallback to index 0 I think.

Jonathan

>=20
> > +       if (IS_ERR(priv->channel))
> > +               return dev_err_probe(dev, PTR_ERR(priv->channel), "Fail=
ed to get IIO channel!\n");
> > +
> > +       priv->rstc =3D devm_reset_control_get_exclusive_deasserted(dev,=
 NULL);
> > +       if (IS_ERR(priv->rstc))
> > +               return dev_err_probe(dev, PTR_ERR(priv->rstc), "Failed =
to get reset!\n");
> > +
> > +       priv->dev =3D dev;
> > +       priv->mode =3D THERMAL_DEVICE_DISABLED;
> > +       platform_set_drvdata(pdev, priv);
> > +
> > +       pm_runtime_set_autosuspend_delay(dev, 300);
> > +       pm_runtime_use_autosuspend(dev);
> > +       pm_runtime_enable(dev);
> > +
> > +       ret =3D rzg3s_thermal_read_calib(priv);
> > +       if (ret) {
> > +               dev_err_probe(dev, ret, "Failed to read calibration dat=
a!\n");
> > +               goto rpm_disable;
> > +       }
> > +
> > +       priv->tz =3D thermal_of_zone_register(dev->of_node, 0, priv, &r=
zg3s_tz_of_ops);
> > +       if (IS_ERR(priv->tz)) {
> > +               dev_err_probe(dev, PTR_ERR(priv->tz), "Failed to regist=
er thermal zone!\n");
> > +               goto rpm_disable;
> > +       }
> > +
> > +       ret =3D thermal_add_hwmon_sysfs(priv->tz);
> > +       if (ret) {
> > +               dev_err_probe(dev, ret, "Failed to add hwmon sysfs!\n");
> > +               goto tz_unregister;
> > +       }
> > +
> > +       return 0;
> > +
> > +tz_unregister:
> > +       thermal_of_zone_unregister(priv->tz);
> > +rpm_disable:
> > +       pm_runtime_disable(dev);
> > +       pm_runtime_dont_use_autosuspend(dev);
> > +       return ret;
> > +} =20
>=20
> Gr{oetje,eeting}s,
>=20
>                         Geert
>=20
> --
> Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m6=
8k.org
>=20
> In personal conversations with technical people, I call myself a hacker. =
But
> when I'm talking to journalists I just say "programmer" or something like=
 that.
>                                 -- Linus Torvalds
>=20


