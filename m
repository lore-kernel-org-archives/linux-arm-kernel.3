Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4DA4BD132A3
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  4 Nov 2024 09:34:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=gBT4omu7lVco4BMm5XUNG7vIgR1mZZtpzsVwZM90Y7U=; b=ojUWvdr8hYLr5Pw7J09XrMgEF7
	Nsj3oIssmDXkh5GXP19vdkQUKcuSCeVhwWajENsBD7c7wVXBSSwMIdDCUItnu45ZzPiV+OoEN+Y4I
	EhFeQCBVREYcTIotKUd04pJeml1VfaFeFw+cUZsTQIApCGggQjKErd7WCRt9N5jVOiTpUq22gc6tp
	0jGpkgwh7E/S+fi4z4jU/eh1cR3v3eB9h/IVnx7g4fQ+ZjrNNIvhvn3bckOfs2P9WK0vzECpvxyWH
	7boG/hjjuQ6VlDYxw5CL197HFebGL1fRdu0/Cy3WofIijvf5w3X84uBgx8IzdOiAKoulOqNkx6Umu
	MN5nuESw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t7tTA-0000000DANy-3Jmt;
	Mon, 04 Nov 2024 09:33:56 +0000
Received: from mail-ej1-x62a.google.com ([2a00:1450:4864:20::62a])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t7tRR-0000000DA6V-3wb5
	for linux-arm-kernel@lists.infradead.org;
	Mon, 04 Nov 2024 09:32:11 +0000
Received: by mail-ej1-x62a.google.com with SMTP id a640c23a62f3a-a99e3b3a411so771771466b.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 04 Nov 2024 01:32:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1730712728; x=1731317528; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=gBT4omu7lVco4BMm5XUNG7vIgR1mZZtpzsVwZM90Y7U=;
        b=xxD/ySkb/26nyISp7Lj7IY1c/RA5F5g92I2R8pIxBHZyKujtXgjJAGpgatX6XMuSUm
         Nd5PMUGhkhUpOqrQthSKBVqw+Lsh+KSsiBFVlqfMe4KGlI6tSni2KVQpefeljJNLQ2xx
         DHCXaYLEtq2kRPjnm8O8S7ZXyFPiPgBF23kf5thSIiV0j0X2MdM7J4BDZcSk0Us8OGzC
         hR8UtA6tschQSW3G+n9RQAoS6p/KZODIu7mkbNppOC+yu5ZBW+VZianF4V7wnFO6wm+x
         85poizsMDOfMjftenrCS4PfPLBDBX4z0Klfm+Z9luCqbUuu6trqycPvLj6yqy5MW//hA
         lIrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730712728; x=1731317528;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gBT4omu7lVco4BMm5XUNG7vIgR1mZZtpzsVwZM90Y7U=;
        b=SVWNHqpHw9a3gWR4QccePR2nm7VkmlSOnTkl9siSUKbaqRE4yZOLFGbgswb+ssAhcW
         3VQmsQlyVcOlRAt4wwXnkyAKBN0emYb3hWT+39S93OYTvlLlh+WVNh84uO6HcREK2pgC
         d164a/7OmyG9kr9MsMsDbWBAud2tGCueQxKULtcs2uPCuBpnW4P1cH1jjn3utOFxcOmt
         wBoPVHIiNEbFPe0IquSAcVgcixh8SvzkgAlnFmx07eE2MP88g/IzIqHtM+6MEeSTQ/YT
         ePOPXV5QGU94itOhhHcUhLiKG3JuWrqICA98RTil+nzgGTAP+2zf07O9hvD8aH4XAEEX
         1HyQ==
X-Forwarded-Encrypted: i=1; AJvYcCXcnTvY56WFPUhObfmsZo+XzoJcW4xnQL/TWVJqVsWj9hH12GoXm0AKWEjzfBF/vqqB0KJvmuda0FfKxpAdekmq@lists.infradead.org
X-Gm-Message-State: AOJu0Yz6+nzKkltOMJdikOKdn4gA+0KjRPq0A2TjUQr7YAvyFnU6y4xR
	ud34MdvX5BOTEyk0bYCKfThjkaeRF164Anve1Q6DXvkvbI9uCdQG3kZSH80anu0=
X-Google-Smtp-Source: AGHT+IFP7uDPMOtcJPWpn+z+rM3OxxIslWfpFco2yog0FSQmlxVhhiL3Isz0ruKyu2Q9v3QrVvfTVw==
X-Received: by 2002:a17:907:86a6:b0:a9a:bbd1:aa5 with SMTP id a640c23a62f3a-a9e65499cdfmr911473866b.31.1730712728095;
        Mon, 04 Nov 2024 01:32:08 -0800 (PST)
Received: from localhost (p50915d2d.dip0.t-ipconnect.de. [80.145.93.45])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a9e564c53d6sm530652866b.68.2024.11.04.01.32.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 04 Nov 2024 01:32:07 -0800 (PST)
Date: Mon, 4 Nov 2024 10:32:06 +0100
From: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>
To: George Stark <gnstark@salutedevices.com>
Cc: neil.armstrong@linaro.org, khilman@baylibre.com, jbrunet@baylibre.com, 
	martin.blumenstingl@googlemail.com, linux-pwm@vger.kernel.org, linux-amlogic@lists.infradead.org, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, kernel@salutedevices.com
Subject: Re: [PATCH v2 2/4] pwm: meson: Support constant and polarity bits
Message-ID: <w3igi2jmva6mfa7anlieyp3iiwfzhsvi3t37wwcqqtzdy42fqn@btmdsfsmpw7r>
References: <20241016152553.2321992-1-gnstark@salutedevices.com>
 <20241016152553.2321992-3-gnstark@salutedevices.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="3rn6i6zl2o5dcpxg"
Content-Disposition: inline
In-Reply-To: <20241016152553.2321992-3-gnstark@salutedevices.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241104_013210_185522_651E1A07 
X-CRM114-Status: GOOD (  29.84  )
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


--3rn6i6zl2o5dcpxg
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH v2 2/4] pwm: meson: Support constant and polarity bits
MIME-Version: 1.0

Hello George,

there are two minor things I dislike in this patch/driver. But I'm not
sure the alternatives are objectively considerably better. See below and
judge yourself.

On Wed, Oct 16, 2024 at 06:25:51PM +0300, George Stark wrote:
> Newer meson PWM IPs support constant and polarity bits. Support them to
> correctly implement constant and inverted output levels.
>=20
> Using constant bit allows to have truly stable low or high output level.
> Since hi and low regs internally increment its values by 1 just writing
> zero to any of them gives 1 clock count impulse. If constant bit is set
> zero value in hi and low regs is not incremented.
>=20
> Using polarity bit instead of swapping hi and low reg values allows to
> correctly identify inversion in .get_state().
>=20
> Signed-off-by: George Stark <gnstark@salutedevices.com>
> ---
>  drivers/pwm/pwm-meson.c | 63 ++++++++++++++++++++++++++++++++++++-----
>  1 file changed, 56 insertions(+), 7 deletions(-)
>=20
> diff --git a/drivers/pwm/pwm-meson.c b/drivers/pwm/pwm-meson.c
> index 2ef632caebcc..974c3c74768c 100644
> --- a/drivers/pwm/pwm-meson.c
> +++ b/drivers/pwm/pwm-meson.c
> @@ -6,7 +6,7 @@
>   * PWM output is achieved by calculating a clock that permits calculating
>   * two periods (low and high). The counter then has to be set to switch =
after
>   * N cycles for the first half period.
> - * The hardware has no "polarity" setting. This driver reverses the peri=
od
> + * Partly the hardware has no "polarity" setting. This driver reverses t=
he period
>   * cycles (the low length is inverted with the high length) for
>   * PWM_POLARITY_INVERSED. This means that .get_state cannot read the pol=
arity
>   * from the hardware.
> @@ -56,6 +56,10 @@
>  #define MISC_B_CLK_SEL_SHIFT	6
>  #define MISC_A_CLK_SEL_SHIFT	4
>  #define MISC_CLK_SEL_MASK	0x3
> +#define MISC_B_CONSTANT_EN	BIT(29)
> +#define MISC_A_CONSTANT_EN	BIT(28)
> +#define MISC_B_INVERT_EN	BIT(27)
> +#define MISC_A_INVERT_EN	BIT(26)
>  #define MISC_B_EN		BIT(1)
>  #define MISC_A_EN		BIT(0)
> =20
> @@ -68,6 +72,8 @@ static struct meson_pwm_channel_data {
>  	u8		clk_div_shift;
>  	u8		clk_en_shift;
>  	u32		pwm_en_mask;
> +	u32		const_en_mask;
> +	u32		inv_en_mask;
>  } meson_pwm_per_channel_data[MESON_NUM_PWMS] =3D {
>  	{
>  		.reg_offset	=3D REG_PWM_A,
> @@ -75,6 +81,8 @@ static struct meson_pwm_channel_data {
>  		.clk_div_shift	=3D MISC_A_CLK_DIV_SHIFT,
>  		.clk_en_shift	=3D MISC_A_CLK_EN_SHIFT,
>  		.pwm_en_mask	=3D MISC_A_EN,
> +		.const_en_mask	=3D MISC_A_CONSTANT_EN,
> +		.inv_en_mask	=3D MISC_A_INVERT_EN,
>  	},
>  	{
>  		.reg_offset	=3D REG_PWM_B,
> @@ -82,6 +90,8 @@ static struct meson_pwm_channel_data {
>  		.clk_div_shift	=3D MISC_B_CLK_DIV_SHIFT,
>  		.clk_en_shift	=3D MISC_B_CLK_EN_SHIFT,
>  		.pwm_en_mask	=3D MISC_B_EN,
> +		.const_en_mask	=3D MISC_B_CONSTANT_EN,
> +		.inv_en_mask	=3D MISC_B_INVERT_EN,
>  	}
>  };

So the generic register description describes the const and invert bits,
but it doesn't apply to all IPs. Thinking about that, I wonder why this
struct exists at all. I would have done this as follows:

	#define MESON_PWM_REG_PWM(chan)		(0 + 4 * (chan))

	#define MESON_PWM_REG_MISC		(8)
	#define MESON_PWM_REG_MISC_EN(chan)		BIT(chan)
	#define MESON_PWM_REG_MISC_CLK_SEL(chan)	GENMASK(5 + 2 * (chan), 4 + 2 * (=
chan))
	....

and then use these constants directly (with pwm->hwpwm as parameter if
needed) in the code. I would expect this to result in more efficient and
smaller code.

> @@ -227,6 +252,15 @@ static void meson_pwm_enable(struct pwm_chip *chip, =
struct pwm_device *pwm)
> =20
>  	value =3D readl(meson->base + REG_MISC_AB);
>  	value |=3D channel_data->pwm_en_mask;
> +
> +	if (meson->data->has_constant)
> +		meson_pwm_assign_bit(&value, channel_data->const_en_mask,
> +				     channel->constant);

Personally I'd prefer:

	value &=3D ~MESON_PWM_REG_MISC_CONST_EN(pwm->hwpwm);
	if (meson->data->has_constant && channel->constant)
		value |=3D MESON_PWM_REG_MISC_CONST_EN(pwm->hwpwm);

even though your variant only mentions the mask once. While it has this
repetition, it's clear what happens without having to know what
meson_pwm_assign_bit() does. Maybe that's subjective?

Best regards
Uwe

--3rn6i6zl2o5dcpxg
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEP4GsaTp6HlmJrf7Tj4D7WH0S/k4FAmcolJMACgkQj4D7WH0S
/k5SmQf5AVHb+2560do8K6cpJeSamFxUb+0mKHgotG6R/mQStG7hRiLWlR3PAVOF
iYSCZjorNJU44x/PBKG/mxlUJB5WiIy00ONqhivhr7Gh6n+KtyJBWMCcVZHiVktp
6NcUGOCN/j7e1VjzGgL3oVaMk+eir+so5qsQ5Ptg7bD20YGkv1zQAAAF/Z/MkVBP
CtV24+C5MHYn2a2BLcKcJ6+d6t+JAK6t4LQszmhYSaCq+cutcQ58rfXtx2zGLa10
jBmyA3FYtcsQsv5gVLQxi5RxZSCuF+BwyMt0tdVubF3PF0Ba+3Mi5LgRIE2MdLW1
r5YAWOH6z+iQA7gJhobnVcBh0QSpsQ==
=217M
-----END PGP SIGNATURE-----

--3rn6i6zl2o5dcpxg--

