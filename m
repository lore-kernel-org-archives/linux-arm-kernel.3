Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2A27ECE9D79
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  6 Jan 2026 16:27:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=vzik8nXSR3mn/i9DyKHW0aMjXX+S/DWXAlyIvVyk9CI=; b=ndeM4wVgqmgyYe5CJewDsYZQB4
	xlfZgmiNQFhHypfqhHW6Z29oxSnhnJ2QR6rUkuCM0chgO+GjyZrCaz8blp8/APq1WUQeM6FVoPrch
	zvRQfamwrK8jjFvK+JDkLXXDQUxeYTHA8+4FPH4xyTkAq95n8Cq+Q+GyJvMZJglwJFYoBSaUk9SOU
	9oUC7zzNoU0oNAeYTD7TwVJ4G/PXP42pfh+yGgzG9pkObYv5VUteieEsJ5+rv6ley0tb1lRbJBxsG
	cFhGb+8VgVI8WMrytGddT/rPL9n1+d2pHx3GBPDvS27c/r+HFPu1j/HHjMScc49CdRisgvvRPDkUg
	COqyWv0A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vd9uH-0000000DU48-2o4O;
	Tue, 06 Jan 2026 16:27:41 +0000
Received: from mail-ed1-x52c.google.com ([2a00:1450:4864:20::52c])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vd9uF-0000000DU3T-1COj
	for linux-arm-kernel@lists.infradead.org;
	Tue, 06 Jan 2026 16:27:40 +0000
Received: by mail-ed1-x52c.google.com with SMTP id 4fb4d7f45d1cf-6505d3b84bcso1763303a12.3
        for <linux-arm-kernel@lists.infradead.org>; Tue, 06 Jan 2026 08:27:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1767716857; x=1768321657; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=vzik8nXSR3mn/i9DyKHW0aMjXX+S/DWXAlyIvVyk9CI=;
        b=gmljXUzF0D1jK9Kv6oCdeCLZXcdDHzNKW8eFE+Yii3uWR4ja2sdIeLwwfxXD12SsRy
         CNuTPIvN7GtWEtxDohnLaEAZPkhgRpYHWG4xsUQOwSIw0OksWzH7mH2y33IHCPoQH9X8
         xKa+Gpuh1682lvhAN8euRdM6gl2VAb/szBHOj/zgEbQNfJlCHcWNsh30m2Qrn8xxQrFA
         RUTq878vf6Y/lqiLJ1erZQ5oVCmmS5VYZSzK93tSs/o5WoHZOtInnkCBQdaIXx5OLwve
         e37aMGLBRbLbd+Kwn90ezP+KhGY1DUWELiFj+6QlOIxBl3QhklM3TrxwSem09Io4D3Uq
         G4+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767716857; x=1768321657;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=vzik8nXSR3mn/i9DyKHW0aMjXX+S/DWXAlyIvVyk9CI=;
        b=BctmQ/ZDihf6Vx7/ooiW5QXvqHVh0B76z7k64dPEUmb8Pnn6wFxz4o8+fxr/GqRJkr
         iNbkoB8bbIm0raLxoEbrATCEQimDMHSUoaQ3DGiuB6eh0Sq7zPOeJ4rkqKBxGAHqN/mT
         qqyyXiuOZDskacK507m53RFfEaloOJTHZpI5grY2BGYdDUi2opq/sT9rZLVHsee92mMn
         rkRSmRbgbgWYvVfBfgmh8qDHf90DMYaBrBddm1A2rJI3BTMz7/yXbpSbPEaqukaagXiO
         1n7qEzEosoACFP05gFCOzzDfc5bcupnDeBCS72//ZPVWk8qWdutGNpeSFv5WWLPTEfCg
         VWWg==
X-Forwarded-Encrypted: i=1; AJvYcCWi5Tl69QEvJ3JPTRKwqr9RERGFtgpECWdwahB7Omq0NWYZM/Mek8Hd0XO2hzlLfsNbPYj8xaJR9DKCKeqIvnnw@lists.infradead.org
X-Gm-Message-State: AOJu0YxfAQ+GC87xISL59B6iteO29sPQU8ZDXKMGBLLN6RVtwM0O6e8N
	1/fDOsn7tuCpej9tj6eRxTYwmCeoe2iZG2dMwIn6S5kAQfTX4uv9pqApBd2EGPoeqrg=
X-Gm-Gg: AY/fxX6tUODr7vmz33K84UgJiHnWtaZP6pP+MDNMYYVHbEOhSYcRcLvxc7Yr0zllASc
	S0TnTZ7MzQ0R0NrErHI3rXD09xZpwal4c79kpJjEc62JkBbFUrh2XNu+i9f+sOsXpfJmzD9Eb5u
	U7C9V/DiP9Iad2iVnwYQYnT4X/mPhaPrpraCa7sy80hqMU/odCHyaTVlsBGB+wDmSElc4WAwx2g
	ZBtJQ5SEcw6wl1GqajijGyESdMZSvBnPCY+/L45VS/11wb22vLThmLJLgw+Do/j4pZH8u1uAH4S
	pJUgLS9q8G46YTI6xfIUbBg0LXZCbaE8rMj6dMoIm9Zq90FtN3OmnsssY/BAsFW3Mi6Be816+ME
	wtKLW7yBvFGUn6s17BzXCDpC99ARAt+8W4Mp/bmHIitBipZQcLOkisikPxTPuTwjwZOwPOA49qe
	Y2eDAyq8lIFku511vx1HnyXk/EJzQ=
X-Google-Smtp-Source: AGHT+IFAk9Nui8g2Wvca+PO/+8m/8D82to1wW+PFqJUMRDqkKSTBkNs3hxMpJZxnAFqxb/4tZ/EvCQ==
X-Received: by 2002:a05:6402:210b:b0:641:15d:6b97 with SMTP id 4fb4d7f45d1cf-6507921efbemr2995418a12.2.1767716856825;
        Tue, 06 Jan 2026 08:27:36 -0800 (PST)
Received: from localhost ([2a02:8071:b783:6940:1d24:d58d:2b65:c291])
        by smtp.gmail.com with UTF8SMTPSA id 4fb4d7f45d1cf-6507b9d51c5sm2493981a12.14.2026.01.06.08.27.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 06 Jan 2026 08:27:36 -0800 (PST)
Date: Tue, 6 Jan 2026 17:27:34 +0100
From: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>
To: Richard GENOUD <richard.genoud@bootlin.com>
Cc: Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Chen-Yu Tsai <wens@csie.org>, 
	Jernej Skrabec <jernej.skrabec@gmail.com>, Samuel Holland <samuel@sholland.org>, 
	Philipp Zabel <p.zabel@pengutronix.de>, Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
	linux-pwm@vger.kernel.org, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org, Joao Schim <joao@schimsalabim.eu>
Subject: Re: [PATCH v2 2/4] pwm: sun50i: Add H616 PWM support
Message-ID: <mu3ciykmtxoaa24mdw7mofpdapbii23qrubw6uzptszok43tta@tq3rguupehwe>
References: <20251217082504.80226-1-richard.genoud@bootlin.com>
 <20251217082504.80226-3-richard.genoud@bootlin.com>
 <en7wscywn3xpw7cxvc2ngwrmjfciglzxgaje5qc5ngiehrjufh@jbvgp2neyzzx>
 <9c55d591-a280-4ed7-91b1-0c867cfff658@bootlin.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="xoh64gb6ddxqpmu6"
Content-Disposition: inline
In-Reply-To: <9c55d591-a280-4ed7-91b1-0c867cfff658@bootlin.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260106_082739_367077_D8C8510B 
X-CRM114-Status: GOOD (  46.31  )
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


--xoh64gb6ddxqpmu6
Content-Type: text/plain; protected-headers=v1; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH v2 2/4] pwm: sun50i: Add H616 PWM support
MIME-Version: 1.0

Hello Richard,

On Tue, Jan 06, 2026 at 12:19:59PM +0100, Richard GENOUD wrote:
> Le 24/12/2025 =E0 10:54, Uwe Kleine-K=F6nig a =E9crit :
> > this patch isn't checkpatch clean.
>=20
> Yes, I've seen that.
> It's because checkpatch doesn't detect that PWM_XY_SRC_MUX/GATE/DIV are
> structures
> If I unwrap PWM_XY_SRC_MUX/GATE/DIV and PWM_X_DIV, checkpatch doesn't
> complain anymore (indeed, do/while loops are not allowed at file-scope)

At least add parenthesis around usages of _reg. (And if you know that
checkpatch points out things that you don't agree to, preempting the
critic in the cover letter is a good idea.)

> I can drop PWM_XY_SRC_MUX/GATE/DIV PWM_X_DIV and declare the structures
> directly under PWM_XY_CLK_SRC() and PWM_X_CLK() if you prefer, but I
> find it less readable than the current form.

No strong feeling here.
=20
> > On Wed, Dec 17, 2025 at 09:25:02AM +0100, Richard Genoud wrote:
> > > +#define PWM_XY_SRC_GATE(_pair, _reg)			\
> > > +struct clk_gate gate_xy_##_pair =3D {			\
> > > +	.reg =3D (void *)_reg,				\
> > > +	.bit_idx =3D PWM_XY_CLK_CR_GATE_BIT,		\
> > > +	.hw.init =3D &(struct clk_init_data){		\
> > > +		.ops =3D  &clk_gate_ops,			\
> > > +	}						\
> >=20
> > I would consider
> >=20
> > 	.hw.init.ops =3D ...;
> >=20
> > and
> >=20
> > 	.hw =3D {
> > 		.init =3D {
> > 			.ops =3D ...;
> > 		},
> > 	},
> >=20
> > natural here. The middleway you chose looks strange to me.
>=20
> Actually, it's:
> 	.hw.init->ops =3D ... ;
> That's why I used this middleway construct.

Ah I see. Then it's fine for me.

> > > +#define PWM_XY_SRC_MUX(_pair, _reg)			\
> > > +struct clk_mux mux_xy_##_pair =3D {			\
> > > +	.reg =3D (void *)_reg,				\
> > > +	.shift =3D PWM_XY_CLK_CR_SRC_SHIFT,		\
> > > +	.mask =3D PWM_XY_CLK_CR_SRC_MASK,			\
> >=20
> > Huh, why does this structure has both a shift and a mask value? What is
> > the difference between
> >=20
> > 	.shift =3D 7,
> > 	.mask =3D 1,
> >=20
> > and
> >=20
> > 	.shift =3D 0,
> > 	.mask =3D 1 << 7,
> >=20
> > ? If the latter is equivalent, you could just pass
> > H616_PWM_XY_CLK_CR_SRC and get rid of the extra definitions for _SHIFT
> > and _MASK.
> >=20
> Unfortunately, struct clk_mux wants a shift and an unshifted mask, and
> according to:
> https://elixir.bootlin.com/linux/v6.18.3/source/drivers/clk/clk-mux.c#L93=
-L94
> using a 0 shift and mask =3D 1 << 7 won't work.

How annoying, I put that on my todo list ...

> > > +static inline struct h616_pwm_chip *to_h616_pwm_chip(struct pwm_chip=
 *chip)
> >=20
> > It probably doesn't help much, but conceptually this could be
> >=20
> > 	static inline struct h616_pwm_chip *to_h616_pwm_chip(const struct pwm_=
chip *chip)
> >=20
> Indeed, I'll add that.

If you rename it to h616_pwm_from_chip it even has the driver specific
prefix.

> > > +
> > > +	return 0;
> > > +}
> > > +
> > > +static int h616_pwm_calc(struct pwm_chip *chip, unsigned int idx,
> > > +			 const struct pwm_state *state)
> > > +{
> > > +	struct h616_pwm_chip *h616chip =3D to_h616_pwm_chip(chip);
> > > +	struct h616_pwm_channel *chan =3D &h616chip->channels[idx];
> > > +	unsigned int cnt, duty_cnt;
> > > +	unsigned long max_rate;
> > > +	long calc_rate;
> > > +	u64 duty, period, freq;
> > > +
> > > +	duty =3D state->duty_cycle;
> > > +	period =3D state->period;
> > > +
> > > +	max_rate =3D clk_round_rate(chan->pwm_clk, UINT32_MAX);
> >=20
> > Huh, is this an artificial limitation? Do you rely on how clk_round_rate
> > picks the return value? (I.e. nearest value? nearest time? round up?
> > round down?)
>=20
> What I want to achieve here is to handle the lowest possible period case.
> Without the bypass, the lowest period is build with the highest clock,
> duty cycle =3D 1 and period cycle =3D 2 (0x10001 in period register)
> So, if the input clock is 100MHz, we have a lowest period of 20ns.
> Now, if we enable the bypass, the period register is ignored and we direc=
tly
> have the 100MHz clock as PWM output, that can act as a 10ns period with 5=
ns
> duty
> So the logic here is to detect this specific lowest period case that can =
be
> achieved by enabling the bypass.
> For that, the highest clock is retrieved and compared to the wanted period
> and duty.
>=20
> Now, I learned the hard way that clk_round_rate() is actually limited to a
> 32 bits value:
> clk_round_rate() calls at one point clk_divider_bestdiv() that uses
> DIV_ROUND_UP_ULL() which in turn uses do_div(n,base):
>   do_div - returns 2 values: calculate remainder and update new dividend
>   @n: uint64_t dividend (will be updated)
>   @base: uint32_t divisor
> So, in order to get the exact highest clock rate, I use clk_round_rate()
> with U32_MAX.

IMHO this should be addressed in the clk framework. And until this
happend the code in the pwm driver needs a verbose comment.
=20
> > > +	dev_dbg(pwmchip_parent(chip), "period=3D%llu cnt=3D%u duty=3D%llu d=
uty_cnt=3D%u\n",
> > > +		period, cnt, duty, duty_cnt);
> >=20
> > This is little helpful without the input parameters.
> >=20
> as
> 	duty =3D state->duty_cycle;
> 	period =3D state->period;
> The input parameters are there, right?
> But I can add the missing idx.

Today I agree, don't know why I missed that. It would be nice to stick
to the format that e.g. pwm-stm32 uses for the input parameters to make
me notice even on busy days that the input parameters are there :-)

> > > +	for (unsigned int i =3D 0; i < data->npwm; i++) {
> >=20
> > Huh, AFAIK we're not using declarations in for loops in the kernel.
>
> Actually, I've read somewhere (in LWN I guess) that Linus seems ok with t=
hat,
> but I'll remove it if you prefer.

If you find your source again, I'd be interested.

Best regards
Uwe

--xoh64gb6ddxqpmu6
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEP4GsaTp6HlmJrf7Tj4D7WH0S/k4FAmldN/QACgkQj4D7WH0S
/k6a3wf/dyB2OrJF/DAgW2HOZ0tlnIpsQAvUNWwXN8AM1HMaPt4MSdhAioirsfN0
/Aw1KjjVBKXpdbfo2twmv9ZSbREgKxIH6hske49hZVlubzdGwbSkxy61kdL6j1xG
odksjFrtzafYhMt8gC4tAmdSdigtAGF146BBSyrRksobpo4mySFMYUIQmQMnZIM7
znYdQIuYbtMsTkZ7B+uSveguzBgoDPvlzA6E4n6as9mATma6EW5GNw0WOqcdioQt
kh74bbrr+qilk1uS7x7AaMS5HPqL3R0/qiZpxobJkXoSUn36WRqEAGWGmvs1XoYt
5E9L+65geD1aHNOvvn5S3ezdcebtyA==
=mAfF
-----END PGP SIGNATURE-----

--xoh64gb6ddxqpmu6--

