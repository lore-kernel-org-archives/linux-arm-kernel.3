Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9A9ACD5AE73
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  7 Nov 2024 08:44:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=gCBwFpuOJkUFhUsOyTcZgxDubddLr0CvKoCO+bs50mg=; b=pCCbCiZeo98wnkjSVq+nV9WDIy
	6vwn6FrSOYS3tE1m13s/bz6XvkR3i4wBBQxVJw+QOpIuQBrrOL+ce4H9XKT5eLN7K/Plamh5JkPaY
	6HQLq2XVhZG46q9T/GlOecEiO/oDgnH0xxuibcN5Re6c3rrKxCDL60i8lBn7oCs8Hg3g6b2Tiw8iT
	RiE5kNIcVPn1SkALOedgIGxdbZZTRAevdBeyA1Ah0AUJubDCl6kw4xv/AGwBX3JWtI2Q2XJc9voRH
	c2Pr4ViPsw3BbaHinNSqUnzB6kUii4PDmUnam1Je50E0nMC2JoIHX2kyGvcbljy4KPiYeUTO5kPQX
	7KHXf8EQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t8y8A-00000006ADT-04B1;
	Thu, 07 Nov 2024 08:44:42 +0000
Received: from mail-ej1-x635.google.com ([2a00:1450:4864:20::635])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t8y5C-000000069gZ-2Ij2
	for linux-arm-kernel@lists.infradead.org;
	Thu, 07 Nov 2024 08:41:40 +0000
Received: by mail-ej1-x635.google.com with SMTP id a640c23a62f3a-a9a0c7abaa6so72030066b.2
        for <linux-arm-kernel@lists.infradead.org>; Thu, 07 Nov 2024 00:41:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1730968896; x=1731573696; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=gCBwFpuOJkUFhUsOyTcZgxDubddLr0CvKoCO+bs50mg=;
        b=x5p0fRbQTVb8aRcHMQet/k0Ehd5BLGGBsLRziCjdZ0f8255rT9BiXZVZPRxsiUE28U
         8ZAonCeQrpxYLeX45FABeRHtPOC3UUimGTAxrVBxnIuctWsZUdMc277BkmjtjWIq6Suj
         r26rTZTatNsmP30gKbin0Kd7UkAnou/8l47qGTi04ppMwpxKv2QW08gopFi7Da7OgF8O
         TDPOIUH4X8riEuPivpsrQqLcWs2/SSCmhsC/AcTKT0c5NzXkYHciF2kGtt17zDoUJDoH
         t5xPigpwmDaVOkw5cK9AjEIKxW5+yMXWHoIbboFg942b4dgRJ/X7HHaZR5wDO5BD4HMF
         gY7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730968896; x=1731573696;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gCBwFpuOJkUFhUsOyTcZgxDubddLr0CvKoCO+bs50mg=;
        b=C83vCUEb90iwrz2P4wuY0jo2gOvlyz4apLMj0sBApH7jn+oOhKbAGuD2S3pUsFmpPl
         SLsN0kDYeZXmYnH8i9VGhI37udezlConcwIiAMrGHbyoYcgWJuEqrggnEUZh233ReaZ/
         K2QzrCv3dBSK0NAt4FZRqPhvUvA3NEJwIuSNFgxwlkpCROaoykWqxy3uSq9Fs9yuI5S5
         btTePRKhxGDlZaMDN+Gy4rNxJe5J+rGOM1wgk5VVnEPUVh7pd+H4FlA7iUIlEPKcmzET
         Xsn+sqnB+fTYv1T1Sfm+aBVZME23am+gYOlYH9lcSCgQLrWoNEIzRXy7b4Z7poYKjC30
         GO1g==
X-Forwarded-Encrypted: i=1; AJvYcCU5/OlobaqtGVlWRvb3H6oyHNQFc5RCXB1Jrhey2YdsWHk78SX9U79LNqoWYe3DhF3vFE46NrqVXPDK2WuBfHVW@lists.infradead.org
X-Gm-Message-State: AOJu0Yz41ILAUq0lfY6XQYsgOHrY8R/ell6o71/Gb3hjk/ld3YCf5llJ
	5xoXU/09qMFyghj1DOpQ3brwZdshWSjGc4Bp+VEAf8VzC9UpH2qin/KvL7hDX4YKqmEwaFCblJS
	v
X-Google-Smtp-Source: AGHT+IECtbyHGknyaysdu7uNuPBdqFJ/lC8OST23yihlsX4TuSJya+GcgvzFJKIKUAa2ZP1s0r51nw==
X-Received: by 2002:a17:907:1c02:b0:a99:a9b6:2eb6 with SMTP id a640c23a62f3a-a9e652c179emr2216146166b.0.1730968896486;
        Thu, 07 Nov 2024 00:41:36 -0800 (PST)
Received: from localhost (p509159f1.dip0.t-ipconnect.de. [80.145.89.241])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a9ee0a46119sm60879066b.46.2024.11.07.00.41.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 07 Nov 2024 00:41:35 -0800 (PST)
Date: Thu, 7 Nov 2024 09:41:34 +0100
From: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>
To: George Stark <gnstark@salutedevices.com>
Cc: neil.armstrong@linaro.org, khilman@baylibre.com, jbrunet@baylibre.com, 
	martin.blumenstingl@googlemail.com, linux-pwm@vger.kernel.org, linux-amlogic@lists.infradead.org, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, kernel@salutedevices.com
Subject: Re: [PATCH v2 2/4] pwm: meson: Support constant and polarity bits
Message-ID: <l5xvdndysdvtil472it6ylthcfam5jp7lh3son45mezq7dh2yk@3yj557k2o5k5>
References: <20241016152553.2321992-1-gnstark@salutedevices.com>
 <20241016152553.2321992-3-gnstark@salutedevices.com>
 <w3igi2jmva6mfa7anlieyp3iiwfzhsvi3t37wwcqqtzdy42fqn@btmdsfsmpw7r>
 <f08513c8-56d6-4551-8ac6-84641c134552@salutedevices.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="7ur3dmr5dbhirxpm"
Content-Disposition: inline
In-Reply-To: <f08513c8-56d6-4551-8ac6-84641c134552@salutedevices.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241107_004138_830159_796A38C3 
X-CRM114-Status: GOOD (  32.68  )
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


--7ur3dmr5dbhirxpm
Content-Type: text/plain; protected-headers=v1; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH v2 2/4] pwm: meson: Support constant and polarity bits
MIME-Version: 1.0

On Wed, Nov 06, 2024 at 04:54:41PM +0300, George Stark wrote:
> On 11/4/24 12:32, Uwe Kleine-K=F6nig wrote:
> > > @@ -68,6 +72,8 @@ static struct meson_pwm_channel_data {
> > >   	u8		clk_div_shift;
> > >   	u8		clk_en_shift;
> > >   	u32		pwm_en_mask;
> > > +	u32		const_en_mask;
> > > +	u32		inv_en_mask;
> > >   } meson_pwm_per_channel_data[MESON_NUM_PWMS] =3D {
> > >   	{
> > >   		.reg_offset	=3D REG_PWM_A,
> > > @@ -75,6 +81,8 @@ static struct meson_pwm_channel_data {
> > >   		.clk_div_shift	=3D MISC_A_CLK_DIV_SHIFT,
> > >   		.clk_en_shift	=3D MISC_A_CLK_EN_SHIFT,
> > >   		.pwm_en_mask	=3D MISC_A_EN,
> > > +		.const_en_mask	=3D MISC_A_CONSTANT_EN,
> > > +		.inv_en_mask	=3D MISC_A_INVERT_EN,
> > >   	},
> > >   	{
> > >   		.reg_offset	=3D REG_PWM_B,
> > > @@ -82,6 +90,8 @@ static struct meson_pwm_channel_data {
> > >   		.clk_div_shift	=3D MISC_B_CLK_DIV_SHIFT,
> > >   		.clk_en_shift	=3D MISC_B_CLK_EN_SHIFT,
> > >   		.pwm_en_mask	=3D MISC_B_EN,
> > > +		.const_en_mask	=3D MISC_B_CONSTANT_EN,
> > > +		.inv_en_mask	=3D MISC_B_INVERT_EN,
> > >   	}
> > >   };
> >=20
> > So the generic register description describes the const and invert bits,
> > but it doesn't apply to all IPs. Thinking about that, I wonder why this
> > struct exists at all. I would have done this as follows:
> >=20
> > 	#define MESON_PWM_REG_PWM(chan)		(0 + 4 * (chan))
> >=20
> > 	#define MESON_PWM_REG_MISC		(8)
> > 	#define MESON_PWM_REG_MISC_EN(chan)		BIT(chan)
> > 	#define MESON_PWM_REG_MISC_CLK_SEL(chan)	GENMASK(5 + 2 * (chan), 4 + 2=
 * (chan))
> > 	....
> >=20
> > and then use these constants directly (with pwm->hwpwm as parameter if
> > needed) in the code. I would expect this to result in more efficient and
> > smaller code.
>=20
> I've been looking into this driver for more than a year and got used to
> it so much so never thought about changing the foundations :) Although it=
's
> an interesting thought.
>=20
> 1. I took meson_pwm_enable() without
> const patches and reimplemented it using only defines (e.g. w/o local
> var channel_data) and objdumped current and new versions. New version
> turned out to be one instruction longer (arm64, gcc, default -O2). So tot=
al
> difference in executable code may be not that significant although
> we can win in C-code line count.

Oh, I indeed would have expected a slight advantage size-wise. Maybe the
compiler already optimizes out the meson_pwm_per_channel_data variable.

> 2. Things like
> #define MISC_B_EN		BIT(1)
> #define MISC_A_EN		BIT(0)
> is more straightforward and can be matched to the datasheet easier
> comparing to (a + b * (chan)) things.

In my (subjective) view that comparison isn't hard with the
parametrised definition.

> So I'm not sure either.
>=20
> > > @@ -227,6 +252,15 @@ static void meson_pwm_enable(struct pwm_chip *ch=
ip, struct pwm_device *pwm)
> > >   	value =3D readl(meson->base + REG_MISC_AB);
> > >   	value |=3D channel_data->pwm_en_mask;
> > > +
> > > +	if (meson->data->has_constant)
> > > +		meson_pwm_assign_bit(&value, channel_data->const_en_mask,
> > > +				     channel->constant);
> >=20
> > Personally I'd prefer:
> >=20
> > 	value &=3D ~MESON_PWM_REG_MISC_CONST_EN(pwm->hwpwm);
> > 	if (meson->data->has_constant && channel->constant)
> > 		value |=3D MESON_PWM_REG_MISC_CONST_EN(pwm->hwpwm);
> >=20
> > even though your variant only mentions the mask once. While it has this
> > repetition, it's clear what happens without having to know what
> > meson_pwm_assign_bit() does. Maybe that's subjective?
>=20
> Actually I also don't like meson_pwm_assign_bit() too match and I'm
> surprised there's no something like this in the kernel already.
> I again objdumped versions meson_pwm_assign_bit() vs double mask repetiti=
on.
> Unconditional bit clearing takes only a single instruction:
>=20
> // value &=3D ~channel_data->const_en_mask;
> 9ac:	0a250040 	bic	w0, w2, w5
>=20
> So in the current series I could drop meson_pwm_assign_bit() and use:
>=20
> value &=3D ~channel_data->const_en_mask;
> if (meson->data->has_constant && channel->constant)
> 	value |=3D channel_data->const_en_mask;
>=20
> If it's decided now or later to drop meson_pwm_channel_data then
> w\o meson_pwm_assign_bit() future patch will be line-to-line change.
>=20
> What you think?

Sounds sensible.

Best regards
Uwe

--7ur3dmr5dbhirxpm
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEP4GsaTp6HlmJrf7Tj4D7WH0S/k4FAmcsfTwACgkQj4D7WH0S
/k7W2ggAiWbFklqZfRb0lCzJW9msXnzW0j2vYPkmdTdU4UXb+bz4Nc/vo6AbIG4V
zgaSDWYTwULDPzgKvkP403SAaZeB6Jg875zyty8nLVyCuydPE9LM7fc598PPzfUf
8VgBR7p3x7iq/Zlnpb5btp2o3nCwniHPCc2wsjooAYy6j50dCK1UVvtlbJL8zzN4
vgc98VppmOeutOa8/2ZhcXhczb5pgJfCviPGyyXlwoaeHB7WV358AkaOcvcMpDbN
1TKOPew6x4fiRd56KOzN0C/M1Fpb3DSPhf21z3kdo/9LKPnap/sZ1Au22xOHTawD
+8ZSV6hZqzueMQJQY307eFT+otZ9hg==
=7j4z
-----END PGP SIGNATURE-----

--7ur3dmr5dbhirxpm--

