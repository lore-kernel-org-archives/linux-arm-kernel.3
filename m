Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AA241C79FAA
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  7 Sep 2026 18:45:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=4kL4fMGCj3SR3hY6TLqzXN2o5Y2eftf1hKQIXB63uPk=; b=ilRr5OwNF0EU8p9RtdJRt2DeAx
	Rb3f17DejCxMvG0Dayx+46cYKxN0ELWTYB/y0TTfPVVXIo4bOtCwuRnumerur3NM6njVXVFnr/FB/
	f2S9yarli0vrXOvBsy7dOpL7fG9oa74q5x4hvlyJKrrbCmAWvja1AwELsRC8ptWIsK9lFGM2B+e+I
	nJoV0hLzy36O5ae5kZeaNORY3OzzSgz9M4kNCi1yOGmNdAmcQgfP0C12j7DKCDazU2cqpqsvns55y
	ji8s7XMjI+m8awINv1ypaTGXxtk1cY9u98WkVvP9p58tMF/fpyUiRyLgYcJZRGM6mkK4AUmoHmVFu
	ZlU43gqQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x3eL5-00000007bUu-3D8d;
	Mon, 07 Sep 2026 18:45:07 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x3eKz-00000007bTU-1D1G;
	Mon, 07 Sep 2026 18:45:06 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with UTF8SMTP id 4EBD9601DB;
	Mon,  7 Sep 2026 18:45:00 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with UTF8SMTPSA id 4F61F1F00A3D;
	Mon,  7 Sep 2026 18:44:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788806700;
	bh=4kL4fMGCj3SR3hY6TLqzXN2o5Y2eftf1hKQIXB63uPk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=EHiwNtgahfVLLxqooLJy9yugeOedCoj0u/L/QLWi7R51lB73ZwzggqX1DEeIFcqSa
	 +StBg2yUEY7/V0YAmw2I92dUjc1TyFKqMPUfFSp9lITzCSBHjFLObwV3M3NSjtCY/Z
	 zFTxTkty8xZEpT57ICoM/7HQI3LX810s8aS3eQjeC503tQn0mdXt9kckxMY+XF3PQ9
	 YrJdA8sr1HAh345kVuRLc7WAS3eT1Q2sRuzjc5cVOMbVs1pb64+txToCR5TjweYVdT
	 Nq4rccYkzphu0psyJKuIOP69hzSnkoZg4LGViZL8iFB/pMyzqNuwox+qMLm2ThDf1g
	 80/xWvfpQtNGg==
Date: Mon, 7 Sep 2026 20:44:56 +0200
From: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <ukleinek@kernel.org>
To: Alexandre Mergnat <amergnat@baylibre.com>
Cc: Xianwei Zhao <xianwei.zhao@amlogic.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Heiner Kallweit <hkallweit1@gmail.com>, Neil Armstrong <neil.armstrong@linaro.org>, 
	Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>, 
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>, linux-pwm@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-amlogic@lists.infradead.org
Subject: Re: [PATCH v4 3/4] pwm: meson: use bulk API for per-channel clocks
Message-ID: <ap8FuWnIRVgcP98G@monoceros>
References: <20260827-s6-s7-pwm-v4-0-d28a2015177d@amlogic.com>
 <20260827-s6-s7-pwm-v4-3-d28a2015177d@amlogic.com>
 <178879456435.2256446.2005394820666057840.b4-review@b4>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="t7gsagdcfeml35k4"
Content-Disposition: inline
In-Reply-To: <178879456435.2256446.2005394820666057840.b4-review@b4>
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


--t7gsagdcfeml35k4
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH v4 3/4] pwm: meson: use bulk API for per-channel clocks
MIME-Version: 1.0

Hello,

On Mon, Sep 07, 2026 at 05:22:44PM +0200, Alexandre Mergnat wrote:
> > The S4 PWM driver currently gets each channel clock individually with
> > of_clk_get() and uses a custom cleanup action to release the clocks.
> >=20
> > Use devm_clk_bulk_get_all() instead to retrieve all per-channel clocks
> > at once. Verify that the number of clocks matches the number of PWM
> > channels and assign each clock to its corresponding channel.
> >=20
> > This also allows the per-channel clock initialization code to be shared
> > by Meson PWM variants using one clock per channel.
> >=20
> > Signed-off-by: Xianwei Zhao <xianwei.zhao@amlogic.com>
> >
> > diff --git a/drivers/pwm/pwm-meson.c b/drivers/pwm/pwm-meson.c
> > index 22cefc6d5dd0..6f151464d7cc 100644
> > --- a/drivers/pwm/pwm-meson.c
> > +++ b/drivers/pwm/pwm-meson.c
> > @@ -497,33 +497,25 @@ static int meson_pwm_init_channels_meson8b_v2(str=
uct pwm_chip *chip)
> >  	return meson_pwm_init_clocks_meson8b(chip, mux_parent_data);
> >  }
> > =20
> > -static void meson_pwm_s4_put_clk(void *data)
> > -{
> > -	struct clk *clk =3D data;
> > -
> > -	clk_put(clk);
> > -}
> > -
> > -static int meson_pwm_init_channels_s4(struct pwm_chip *chip)
> > +static int meson_pwm_init_channels_per_channel_clk(struct pwm_chip *ch=
ip)
> >  {
> >  	struct device *dev =3D pwmchip_parent(chip);
> > -	struct device_node *np =3D dev->of_node;
> >  	struct meson_pwm *meson =3D to_meson_pwm(chip);
> > -	int i, ret;
> > +	struct clk_bulk_data *clks;
> > +	unsigned int i;
> > +	int num;
> > =20
> > -	for (i =3D 0; i < chip->npwm; i++) {
> > -		meson->channels[i].clk =3D of_clk_get(np, i);
> > -		if (IS_ERR(meson->channels[i].clk))
> > -			return dev_err_probe(dev,
> > -					     PTR_ERR(meson->channels[i].clk),
> > -					     "Failed to get clk\n");
> > -
> > -		ret =3D devm_add_action_or_reset(dev, meson_pwm_s4_put_clk,
> > -					       meson->channels[i].clk);
> > -		if (ret)
> > -			return dev_err_probe(dev, ret,
> > -					     "Failed to add clk_put action\n");
> > -	}
> > +	num =3D devm_clk_bulk_get_all(dev, &clks);
> > +	if (num < 0)
> > +		return dev_err_probe(dev, num, "Failed to get clocks\n");
> > +
> > +	if (num !=3D chip->npwm)
> > +		return dev_err_probe(dev, -EINVAL,
> > +				"expected %u clocks, got %d\n",
>=20
> Small style nit: the continuation arguments are not aligned with the open
> parenthesis, whereas the dev_err_probe() just above and the rest of the d=
river
> do align them. Can you fix it please ?

No need to resend for that, I can fix that up while applying (after
checking I don't have further concerns).

Thanks Alex for your review!

Best regards
Uwe

--t7gsagdcfeml35k4
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEP4GsaTp6HlmJrf7Tj4D7WH0S/k4FAmqfBhsACgkQj4D7WH0S
/k4H5gf/b2Cwr+NerQlDrFtCUTp4liuubWlge5tlRlMWOcb5v+9nUeJWlgs2tQvu
yWPt8d+Zt+e3Ro1Lltt6/0z/V2EMCeWmtbyUAUgVB509psrAZq+tEvC5dPNMJOBJ
1NdEPZSVCMSlaPKFFd7mmxORfZRVoOq328+Ou9pKtuvxRFAV20KwWw7SpdZnYNRZ
HKdhlu0iIXKVC20ipM5jSoOuCBjbSyxUcFdlnQIR76rsUeFxWUSt98aAzTntv3YE
G6TZefYdA0k3oSnyd0vQ3vc8zomM9PsuRxdGiyCICdF8NasUaM3sqWgH67mote90
ROqVOOH2Xl9Lo70ugL/zbQq89aaHzA==
=DC7A
-----END PGP SIGNATURE-----

--t7gsagdcfeml35k4--

