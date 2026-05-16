Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CA95ECD4F25
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 16 May 2026 06:12:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=0HSemYvAyg7oF7KkWKvgahNXBgqxEPfiGmMTx54Opx8=; b=t1aCnyQKE2ny1orvWQjKKZCkgo
	6M7XFeB2LU1qznp1Gf9o0k0FozTsuC61nSyy2Ndaww+Arqdjp4olUCMqen9RKeCRGgIdIy2NhHu5D
	/3szSYehzSt7Kh2Xf0fvk9H5G54JM6SswzSIH+bAzpFELn1Tls9od1YuoSMXtNMkNGrA/64aKAft+
	O4/tWSFoyS1zwzSKpuzJSfsR2x9lOeD4vnNgfRhvogfXKp8ue6IpxFSM03Htegaz09q8Iftbas8Cp
	xrgCxyJcoyCZA7qqs+WofLWlVSGjek3uvmfhSBuA0hceQ+a2hX6Ww6PwSUQCux0rKsZZZgEgt0qyS
	Pb1mGUNQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wO8Fx-0000000AFYg-3u3k;
	Sat, 16 May 2026 06:12:13 +0000
Received: from mail-wr1-x430.google.com ([2a00:1450:4864:20::430])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wO8Fu-0000000AFXh-34JH
	for linux-arm-kernel@lists.infradead.org;
	Sat, 16 May 2026 06:12:12 +0000
Received: by mail-wr1-x430.google.com with SMTP id ffacd0b85a97d-4585a116a4aso340976f8f.3
        for <linux-arm-kernel@lists.infradead.org>; Fri, 15 May 2026 23:12:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20251104.gappssmtp.com; s=20251104; t=1778911929; x=1779516729; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=0HSemYvAyg7oF7KkWKvgahNXBgqxEPfiGmMTx54Opx8=;
        b=suaGqTgZzfH7bHWSRcVO/e2CqpGfLeEnDTKnz2K1S94sRV4ijhWCglNg/L/l4OU/y3
         ZRxfdeNsGiKAdKDN/XrKXUaSFbTwkA1XvHQLyH2UWE7yR4dq4j2Ngx57dOFjbbB4nDmh
         dsTwBiv1u3HbGjO4evJ+sk8Bbtq4MXM+OdR9fNxm3yailH+A4tn6IVoPhtjx05O4ajR/
         VtE+DloQBUvN5x2Fnbuc1iKyjVfuuD/bV2RC76RqW7DK8gneVJBam5y+ZMLf6Q4aH/CD
         EvB+XHG7nvXG9im+mEXFbqkagrl9x2JcXA/bJ4snrO2/1eRLE7AB+RM/DEBinUqUj1oa
         /Pzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778911929; x=1779516729;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=0HSemYvAyg7oF7KkWKvgahNXBgqxEPfiGmMTx54Opx8=;
        b=NT0nd9yQ5pIw/cyuVXWF2C2U9ElAZTQHZ53T2aUa66REud1dMyyBj1aPyiTQqF327H
         OJoMRc5Xrl0kA5iIAjawTCbOZ+8VVHkWnYdAO0v8/Ce7aVexGJBg96K6YvwEdr3xE9yT
         pcZB4BxGcJ89UiCdTtsMagMiKa/1lT5nDLq3BXQXZHqaz5ATfG7uglU5qqpRjmhIyHrg
         UDXyeUgpW4nrHNnmDwaqr5kXBhjPuz3PqyRhH9+gE3Qe6DmPjEZBLFtK3zqA4XP66gOe
         gr1M09zo5sBI5cg7xuW3+whFxGyxWBow7vi/FQOqN7nk5NH9s1rjhvWXErDfZ8sG8cX1
         g5tg==
X-Forwarded-Encrypted: i=1; AFNElJ+61ASemXrm1ipJdRfKOucWG8e+x0GItu4o4y5E8CwmARTRcc3aTZaLl5UNfmNRgYlV0N2Z8J6G4yxZ08zP7vYV@lists.infradead.org
X-Gm-Message-State: AOJu0Yyc+7Sr0UEMbKRmq2ap4Im4232X9Gp6kvlX+lKKxSJXUdD46E+m
	ZOfWeuzA6j36ERTH+rU1/GzzwYjStJqSWIfzhQCjOvwHpMM/eho7RKQ/UkhE/tmdDw8=
X-Gm-Gg: Acq92OHQ5ZdXtchrB8WOjSU1lASH6b09c53bmEJo1rpZsZ/3JK0taVkR1M3+xwfQEbH
	CMlZbRHzh3G2LpLk2oO9u+S7P7V0aHspv5uD1Ph0ZhNPsJUdJdvnKW/1mkyCvrBxYWXN1/UnfBM
	5BmO+r9iI6ztgaPpUecTI9xGBZaSd81HBU04tX8ssQ+6a5DEuwqdoyoRzVfAg5xnE1qT7h/1klb
	Yi5ksq65j9HSvG6Na18T9WGhyqohL5nN/2Je7ux2sKI5xCrpe4IbbSD7PeQOAEviufxFq4NOR3d
	I5Nck/ob/EmVq14pcZ5LTZpxcwrdlFZnpZgswpRby4u0+J+V7i4Ah5gide2qki/lwAFjUGU93pk
	eB3tMT4bCSFXhheZyOoxxrrjw0QSvUS8DhKZf8+4iCioiPXC2AdLOKVa4UDXbYdVa3ld1FgQVNy
	Tr3x5wkHAbW8/d4O818ZhSQf1CqygjRYbaUcHcTSA=
X-Received: by 2002:a05:6000:1ac7:b0:43f:e272:edff with SMTP id ffacd0b85a97d-45e5c57d308mr9641215f8f.4.1778911928801;
        Fri, 15 May 2026 23:12:08 -0700 (PDT)
Received: from localhost ([2a02:8071:56d1:2de0:1d24:d58d:2b65:c291])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-45d9ed2f738sm19944411f8f.16.2026.05.15.23.12.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 15 May 2026 23:12:08 -0700 (PDT)
Date: Sat, 16 May 2026 08:12:06 +0200
From: Uwe =?utf-8?Q?Kleine-K=C3=B6nig_=28The_Capable_Hub=29?= <u.kleine-koenig@baylibre.com>
To: Lee Jones <lee@kernel.org>
Cc: Markus Schneider-Pargmann <msp@baylibre.com>, 
	Michael Hennerich <michael.hennerich@analog.com>, Chen-Yu Tsai <wens@kernel.org>, 
	Marek Vasut <marek.vasut+renesas@gmail.com>, James Ogletree <jogletre@opensource.cirrus.com>, 
	Fred Treven <fred.treven@cirrus.com>, Ben Bright <ben.bright@cirrus.com>, 
	Support Opensource <support.opensource@diasemi.com>, Andy Shevchenko <andy@kernel.org>, 
	Charles Keepax <ckeepax@opensource.cirrus.com>, Richard Fitzgerald <rf@opensource.cirrus.com>, 
	Chanwoo Choi <cw00.choi@samsung.com>, Krzysztof Kozlowski <krzk@kernel.org>, 
	=?utf-8?B?QW5kcsOp?= Draszik <andre.draszik@linaro.org>, Aaro Koskinen <aaro.koskinen@iki.fi>, 
	Andreas Kemnade <andreas@kemnade.info>, Kevin Hilman <khilman@baylibre.com>, 
	Roger Quadros <rogerq@kernel.org>, Tony Lindgren <tony@atomide.com>, 
	Samuel Kayode <samkay014@gmail.com>, Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
	Alexandre Torgue <alexandre.torgue@foss.st.com>, linux-kernel@vger.kernel.org, linux-renesas-soc@vger.kernel.org, 
	linux-sound@vger.kernel.org, linux-omap@vger.kernel.org, imx@lists.linux.dev, 
	linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org, linux-i2c@vger.kernel.org
Subject: Re: [PATCH v1] mfd: Use named initializers for arrays of
 i2c_device_data
Message-ID: <aggJiZk8Kp-309q7@monoceros>
References: <20260515095839.4005460-2-u.kleine-koenig@baylibre.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="2sdvcea3fsfmjq6y"
Content-Disposition: inline
In-Reply-To: <20260515095839.4005460-2-u.kleine-koenig@baylibre.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260515_231211_034602_9BE34BAA 
X-CRM114-Status: GOOD (  17.56  )
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


--2sdvcea3fsfmjq6y
Content-Type: text/plain; protected-headers=v1; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH v1] mfd: Use named initializers for arrays of
 i2c_device_data
MIME-Version: 1.0

On Fri, May 15, 2026 at 11:58:39AM +0200, Uwe Kleine-K=F6nig (The Capable H=
ub) wrote:
> diff --git a/drivers/mfd/tps65910.c b/drivers/mfd/tps65910.c
> index 6a7b7a697fb7..fb23d5ed1f26 100644
> --- a/drivers/mfd/tps65910.c
> +++ b/drivers/mfd/tps65910.c
> @@ -518,8 +518,8 @@ static int tps65910_i2c_probe(struct i2c_client *i2c)
>  }
> =20
>  static const struct i2c_device_id tps65910_i2c_id[] =3D {
> -       { "tps65910", TPS65910 },
> -       { "tps65911", TPS65911 },
> +       { .name =3D "tps65910", .driver_data =3D TPS65910 },
> +       { .name =3D "tps65911", .driver_data =3D TPS65911 },
>         { }
>  };
> =20

The indention in this hunk uses spaces instead of tabs (both with and
without my patch). I fixed that in my tree, so if it comes to a v2 the
indention will be fixed there.

> [...]
> diff --git a/drivers/mfd/wm8400-core.c b/drivers/mfd/wm8400-core.c
> index 8ecfe878a5ba..1c0ba450ef9b 100644
> --- a/drivers/mfd/wm8400-core.c
> +++ b/drivers/mfd/wm8400-core.c
> @@ -135,7 +135,7 @@ static int wm8400_i2c_probe(struct i2c_client *i2c)
>  }
> =20
>  static const struct i2c_device_id wm8400_i2c_id[] =3D {
> -       { "wm8400" },
> +       { .name =3D "wm8400" },
>         { }
>  };
> =20

ditto.

Best regards
Uwe

--2sdvcea3fsfmjq6y
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEP4GsaTp6HlmJrf7Tj4D7WH0S/k4FAmoICrIACgkQj4D7WH0S
/k7niwf+L8OYV1m8gjYa2gWHbcQnsCJgzdFKCpbXliu2T5EWq+pQK9qpV9Z1VizU
c2aUOPFJ5EiekEJu5DCu2EP0hYSk7XVsIzj1X6S2yAUDcUn5KFqmgkRAQsZKxRUN
To4/9O43tr+/WYuyUT/kM1mZFYHw3kubucsATq5rprulQ8SwNsFWG1hADna3KAHe
VE+iBDWGgcWuextWGVmh9DL+KyuYXcHSYZ6jwMkUkzdTGE6XIJeZ4AgCXM5X6wl/
9G5OpBfgo0IXSCrfxQRCx2Rq617B5x7i9u3851/XC/G8l04/lZOsk8vW92H4tVvR
IqdTaRQtvMJ/Itv6B4DadpEPZbkW2g==
=AyjU
-----END PGP SIGNATURE-----

--2sdvcea3fsfmjq6y--

