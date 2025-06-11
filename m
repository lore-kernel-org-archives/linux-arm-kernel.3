Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2CE70C71136
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 11 Jun 2025 22:21:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ooALxjf044GRWDbSFrzyVi0Lni7sgXLgTftasv+y1gI=; b=TjHKU3k4cepJWMKFiPxlIGKRxr
	xtQzMgkORcAu7UpwqlTqvXv6yOkZXjYu1MoN+glGva0fP8YLsUl07qaW2esSHiqeDevd1+JS7Yq1u
	y8ZumzVktpvSEgIQOPWEtJGpI8ro6wou3UbvNo2lyBJiQXFGLg4xKI+oD3s9mNmcFI/yPy2fVNjQ2
	EeHD0UFBqeGQHMODJzMb3peRktXHFt+4fcGYroyCoYKPwj2IhCwTux5fhviPgwWmC3GXTj8TcwTUC
	CISMpjNj7QNsZDVFVrPC7/CGWhZk5EP6jqs2qDPC5YQLqcvP5HkK04sfzh68dE22WG9H4p4K4MuLL
	xMC4MhLQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uPToi-0000000BSjS-1nwZ;
	Wed, 11 Jun 2025 22:21:08 +0000
Received: from mail-ed1-x530.google.com ([2a00:1450:4864:20::530])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uPS5l-0000000BAWU-3G1o
	for linux-arm-kernel@lists.infradead.org;
	Wed, 11 Jun 2025 20:30:39 +0000
Received: by mail-ed1-x530.google.com with SMTP id 4fb4d7f45d1cf-605b9488c28so529087a12.2
        for <linux-arm-kernel@lists.infradead.org>; Wed, 11 Jun 2025 13:30:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1749673836; x=1750278636; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=ooALxjf044GRWDbSFrzyVi0Lni7sgXLgTftasv+y1gI=;
        b=Ns7HYIiJ2iRE55z85BXumDMS0X9jaE0EkmQ7/zCVfLcX1HqVoP6SY8mvFcGmBzr4qH
         DRJp9SEna6EoYs0bBdELzWs+iFNXL5WPqMGn7l61yfSbY1nsNyBfiixRQbamN6jbXWZP
         lcqydjbe90P5hkl7Lh+9z21cDLpbg3EkZb9vWIzmCR/fq9ArCzLEYUVSr1yhHKrENJXk
         H7O+KOWSSfQ9VfqKa18JuAyYo8Qpb8Kf7aeI+0iouS67LCpMNLbEHwsdWWRkhtiAH5EC
         rAamtgcFPUWJ2U37GbSbo1ou0+ssTg/r0uK/I7C/LVSLvVy5R7RHj1pI8Wpgz0P6dyFk
         brKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749673836; x=1750278636;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ooALxjf044GRWDbSFrzyVi0Lni7sgXLgTftasv+y1gI=;
        b=OpzhE6+ZsEw8COaFzk5rnIyh60IAQjOiRObnkuUZKmNl9u+KfkGsC3L3EuwARo6RTv
         vAil7YR3XGwpHr2GA8qgoW5fw/k4UUw8JwYHba2nivQj9RD+XrI53zbIUMxWhJ+jnMes
         iepQp8Ob41HuRgfQQ4P7Juw4VbsG9X9Oo+PXV5zNVP6qQH9C8x921wKHafpqdjLduWyv
         Pt6Qdjj7Rsr8M6Yza04xfPJE5LKb/26+QYatwFev5WS2WnNaAWqYySnjaZYMZSm4e0Qz
         Uzf48mXUWKPA/6VqNBMH7hOYpeqmo3ZuiN6oSN4xp0dheaXp46KTssx/0Xj5+RBx8/iu
         me3Q==
X-Gm-Message-State: AOJu0YzLSYAdpLuBTGLgR/GkJuuX9YeCRQROmoTxuGscdWQQckT+ICou
	i2A7UIzM1qPsfuk12s6yS2de1u0UqBWN7eZcrpp8gIpFZNtFh8Z53/aimondIYLOH+o=
X-Gm-Gg: ASbGncvch2MZHPmhTDtoMt/1p8drCdHVjkDuzniIt3Y0Bp/6HJPft1mySTPgVYfq+xQ
	eM/cRR8mbhziYEz7k2btjcAH+eKIwGKRFDI4hWBUJZB0MgUOVK92/Jgvlkk2pAJec347F6lmLXi
	bvW376Pi0KdH2q6Fu1VIKHPG62W80BtqrkKfQAAlTyeD2oeQ3n1xzuKi+4/DRYaHA/8bfWQPvxq
	RrfGKPPUwVxYqsN+gyuLQOeey8swXegtDcxcR+kBTLD3BkvmsY5IOq58SZExIf78CD9sdnlaRAr
	etXerIWLAiuv/4aquDbo7k9a8lJRfKaOjjGIOB2+5XVKU1HniI7+rdzsxbuUF+wLIPE=
X-Google-Smtp-Source: AGHT+IHJBH4d2C783mF51S+AT4bh5IyeawOSGcxknA0J3JMZXbjUKz7B08z1l8NjwiFP1xHqX12uLQ==
X-Received: by 2002:a17:906:f581:b0:ad8:9b5d:2c1b with SMTP id a640c23a62f3a-adea21d38cdmr101972066b.9.1749673835685;
        Wed, 11 Jun 2025 13:30:35 -0700 (PDT)
Received: from localhost ([2a02:8071:b783:6940:36f3:9aff:fec2:7e46])
        by smtp.gmail.com with UTF8SMTPSA id a640c23a62f3a-adeadee8a60sm5588066b.162.2025.06.11.13.30.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Jun 2025 13:30:35 -0700 (PDT)
Date: Wed, 11 Jun 2025 22:30:32 +0200
From: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>
To: Marek Vasut <marek.vasut+renesas@mailbox.org>
Cc: linux-arm-kernel@lists.infradead.org, 
	Dave Stevenson <dave.stevenson@raspberrypi.com>, 
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, Conor Dooley <conor+dt@kernel.org>, 
	Florian Fainelli <florian.fainelli@broadcom.com>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, Rob Herring <robh@kernel.org>, 
	devicetree@vger.kernel.org, linux-renesas-soc@vger.kernel.org, 
	linux-rpi-kernel@lists.infradead.org
Subject: Re: [PATCH 2/2] regulator: rpi-panel-v2: Add regulator for 7"
 Raspberry Pi 720x1280
Message-ID: <fsihsojbs3pex6i6vag4njw27esv257nz3yuacl2bbflyfzfvx@6cc6k7tczdi7>
References: <20250609000748.1665219-1-marek.vasut+renesas@mailbox.org>
 <20250609000748.1665219-2-marek.vasut+renesas@mailbox.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="3wk5f4esmuzvwutl"
Content-Disposition: inline
In-Reply-To: <20250609000748.1665219-2-marek.vasut+renesas@mailbox.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250611_133037_808300_D5112066 
X-CRM114-Status: GOOD (  19.07  )
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


--3wk5f4esmuzvwutl
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH 2/2] regulator: rpi-panel-v2: Add regulator for 7"
 Raspberry Pi 720x1280
MIME-Version: 1.0

Hello Marek,

On Mon, Jun 09, 2025 at 02:06:42AM +0200, Marek Vasut wrote:
> +static int rpi_panel_v2_pwm_apply(struct pwm_chip *chip, struct pwm_devi=
ce *pwm,
> +				  const struct pwm_state *state)
> +{
> +	struct regmap *regmap =3D pwmchip_get_drvdata(chip);
> +	unsigned int duty;
> +
> +	if (state->polarity !=3D PWM_POLARITY_NORMAL)
> +		return -EINVAL;
> +
> +	if (!state->enabled)
> +		return regmap_write(regmap, REG_PWM, 0);

I would swap these two if blocks to ensure that disable works even if
the wrong polarity is passed.

> +	duty =3D pwm_get_relative_duty_cycle(state, PWM_BL_MASK);

This is not how it works. I assume this one can only do a single period
length? Then duty should be calculated as:

	duty_cycle =3D state->duty_cycle > RPI_PANEL_PWM_PERIOD ?  RPI_PANEL_PWM_P=
ERIOD : state->duty_cycle

	duty =3D duty_cycle * PWM_BL_MASK / RPI_PANEL_PWM_PERIOD;

> +	return regmap_write(regmap, REG_PWM, duty | PWM_BL_ENABLE);
> +}
> +
> +static const struct pwm_ops rpi_panel_v2_pwm_ops =3D {
> +	.apply =3D rpi_panel_v2_pwm_apply,
> +};

I would prefer to see new pwm drivers use the waveform stuff.

> +/*
> + * I2C driver interface functions
> + */
> +static int rpi_panel_v2_i2c_probe(struct i2c_client *i2c)
> +{
> +	struct gpio_regmap_config gconfig =3D {
> +		.ngpio		=3D NUM_GPIO,
> +		.ngpio_per_reg	=3D NUM_GPIO,
> +		.parent		=3D &i2c->dev,
> +		.reg_set_base	=3D REG_POWERON,
> +	};
> +	struct regmap *regmap;
> +	struct pwm_chip *pc;
> +	int ret;
> +
> +	pc =3D devm_pwmchip_alloc(&i2c->dev, 1, 0);
> +	if (IS_ERR(pc))
> +		return PTR_ERR(pc);
> +
> +	pc->ops =3D &rpi_panel_v2_pwm_ops;
> +
> +	regmap =3D devm_regmap_init_i2c(i2c, &rpi_panel_regmap_config);
> +	if (IS_ERR(regmap))
> +		return dev_err_probe(&i2c->dev, PTR_ERR(regmap), "Failed to allocate r=
egmap\n");
> +
> +	pwmchip_set_drvdata(pc, regmap);
> +
> +	regmap_write(regmap, REG_POWERON, 0);
> +
> +	gconfig.regmap =3D regmap;
> +	ret =3D PTR_ERR_OR_ZERO(devm_gpio_regmap_register(&i2c->dev, &gconfig));
> +	if (ret)
> +		return dev_err_probe(&i2c->dev, ret, "Failed to create gpiochip\n");
> +
> +	return devm_pwmchip_add(&i2c->dev, pc);

	ret =3D devm_pwmchip_add(&i2c->dev, pc);
	if (ret < 0)
		return dev_err_probe(...);

> +}
>=20

Best regards
Uwe

--3wk5f4esmuzvwutl
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEP4GsaTp6HlmJrf7Tj4D7WH0S/k4FAmhJ52UACgkQj4D7WH0S
/k6m0wf/Zj+902IqzoG39t1WOJ/5LfsJHptTTGisVEl6J9Gg2+ol/pAz/Vl0nnh5
1PPKIDMoZr4oimN/R5gWddDF2mUNiA/L/biXDqthzoi2q4Dlg2YI/zAQ9RYkpUml
oNsWnlxk7x959uBbudZbD2knDNg5x/R8GNOJyt3JMvOwsA4SVWLl7Mfz061n/Vyb
r3uA/Uam5mN2gE1OIz9dcZ1X4jvM3QPfrWPq7vnNbCG5piF8xvak5G28zmmWmLNp
69ax5LP4vACpKtmlYoR0qq629Uujf3enTVWZdSlSuSBGqLluaTnUkYyQkK4Uzmoz
UT+WKDqr5GL8IuzHaSC/wqwUxlwDgg==
=oxr7
-----END PGP SIGNATURE-----

--3wk5f4esmuzvwutl--

