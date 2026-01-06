Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DF781CE9D7F
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  6 Jan 2026 16:58:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=W+yaMBdttipWH+qCj6rq+qhgb8Gvgy18kNC7/oWi2sk=; b=1/sVMvj7gTmCNr
	6YUoySVLoIJ+Ucz5HL9JYDQWAg5yszqeIGTYElq3Z4tvDA+5nLohA21q9W6o82sNrjNEvZjrhX4AS
	6ojWlCAatGWSHdfb1yh69MJW7vSpMgHH/z3rFDvgz1QpdwyelFRIwYkzD2mrV9R9OpRwcf2XQamiL
	imIMJzZX1lFfY2ntLAlXUqB3wM01i2fg/LF4gDGWMEi3iCWutWnc0IHEWtkCvga8hk7oxZsu3he9O
	q9Yt256yPiSjzGbyGoVOe5tv1ECFUI/OrGJaR+ORuaxYzy0IUEFupnEMthIrFd/hb4A5/rLOK1rNh
	amSPZqRzlQojNDPXC0ng==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vdAOF-0000000DX3y-1iOe;
	Tue, 06 Jan 2026 16:58:39 +0000
Received: from mail-lf1-f48.google.com ([209.85.167.48])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vdAOC-0000000DX3X-3Yb3
	for linux-arm-kernel@lists.infradead.org;
	Tue, 06 Jan 2026 16:58:38 +0000
Received: by mail-lf1-f48.google.com with SMTP id 2adb3069b0e04-597d712c0a7so1211109e87.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 06 Jan 2026 08:58:35 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767718714; x=1768323514;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :reply-to:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=W+yaMBdttipWH+qCj6rq+qhgb8Gvgy18kNC7/oWi2sk=;
        b=YmT4Yjv1yGIww7J44xz19rRPyjy/Cw9Z72WGTlHRcDo6VdUteaLOWEMAXZWNSnQ308
         y+oUBmsN5WhrsBANUUXxXDdDc92pJjmZxdfd5oIZhucE7ugjoyl/hT3GfiI0xPJwDvqK
         Uy7/TMPaCYysxgQpj6IL5sjCmOC6mn7TdbG1LwL9SBRSSJyI/UFuJ8Y02ATKj8X5m/2v
         cEpjOSiGGvu257snWj5JIkQntjgSmzRTANB0YaJkwDVvRqICqd867RKUD8Z9mIPgQ3eS
         kV2iYUwswu+Zno7nmAlPL5GgGrvbyGqLFcuGmafei6H0g/JFub8qCa8vG/H45nMx4eiK
         +LFw==
X-Forwarded-Encrypted: i=1; AJvYcCWgPvLMvZqE1Oowx36dDOD0ceFFUcr7JvAqESKmG6YWmKqkp5Vs1rONHVkAkuHihx/ptx4w0Uphi2SZnvnQAzpL@lists.infradead.org
X-Gm-Message-State: AOJu0Yz2a1kL/fnfCjtcabp3m7vXfe5vsGzDubjgFpB54UtDf0RRiA58
	QFZIWESamw6xxbKkBI8Q2ujZeC4QQc13/1EEK80bDk1pHtjqV1b1jtdDgiTwMnPB
X-Gm-Gg: AY/fxX7BzthG6tqNoRn8pVA2RRI6HIAzLVkvRS0OUNYiMlUhraVtR+c1wI6iIw70P/t
	Yi5tJrc8vkHkU5n66icvavHRJJ4/sM3SRjtsxoKSHuv6K6zOntQmw/I4GWSFtPwrB+hwT1toQa7
	EqAtzUvU5GmNhA7V0lbzHspawCsHmGXtO8S2K/tSC3apTuWtUfEz3IEuM7RpC9IGtmEsJGIzix1
	dCWAOZRY6Vly9hNDIxykPMvUIH2PdhWR2fOo0GumcbFpV1E3O+BSPb8GWhZ2yJkhjAlL+pMgFM5
	rNs+dYs3h4nFVBMXQMpP1A8y1QVcc6ZUaMc2eYQWlcAb+nL59Z4aXiT+xF8EQ+VVBP8b6ZIwbuR
	99xn3ShjBaTP4dcq2ZHQ1LmgD/vyRnd0YkR/p+pBt+QwhVByi3MWXDVv7rW0Jtkpj3HfmGIiNXr
	CcioOTJo1FUKvrm4iBcsiIZRjbgJmsZOSYQp69qK/UzrPwTddxqBAQFg==
X-Google-Smtp-Source: AGHT+IGkf1MN1xi8ic1R2hQlsdU/vmkq/U9ogf1Nkw04WOMt7KYdmWsdoOFlKMhp1DAB0DaoCazpMQ==
X-Received: by 2002:ac2:4c52:0:b0:598:eacd:ceb2 with SMTP id 2adb3069b0e04-59b65279ecfmr1158659e87.7.1767718713795;
        Tue, 06 Jan 2026 08:58:33 -0800 (PST)
Received: from mail-lj1-f176.google.com (mail-lj1-f176.google.com. [209.85.208.176])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-59b65d69750sm688210e87.76.2026.01.06.08.58.33
        for <linux-arm-kernel@lists.infradead.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 06 Jan 2026 08:58:33 -0800 (PST)
Received: by mail-lj1-f176.google.com with SMTP id 38308e7fff4ca-382fe06aa94so448661fa.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 06 Jan 2026 08:58:33 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCVg4jwdUWz3WUupmuih7TOvJWlAvuwu/NV+DrWq+U8pSrO0gO17Q0gOoZm0HqbMbU1B1HHY1CbDkcPbVdBSbqA5@lists.infradead.org
X-Received: by 2002:a05:651c:154a:b0:382:fb5b:391a with SMTP id
 38308e7fff4ca-382fb5b3d74mr3007881fa.39.1767718713265; Tue, 06 Jan 2026
 08:58:33 -0800 (PST)
MIME-Version: 1.0
References: <20251217082504.80226-1-richard.genoud@bootlin.com>
 <20251217082504.80226-3-richard.genoud@bootlin.com> <en7wscywn3xpw7cxvc2ngwrmjfciglzxgaje5qc5ngiehrjufh@jbvgp2neyzzx>
 <9c55d591-a280-4ed7-91b1-0c867cfff658@bootlin.com> <mu3ciykmtxoaa24mdw7mofpdapbii23qrubw6uzptszok43tta@tq3rguupehwe>
In-Reply-To: <mu3ciykmtxoaa24mdw7mofpdapbii23qrubw6uzptszok43tta@tq3rguupehwe>
From: Chen-Yu Tsai <wens@csie.org>
Date: Wed, 7 Jan 2026 00:58:20 +0800
X-Gmail-Original-Message-ID: <CAGb2v67O8xKUfXg2Xr0+G72upPsp6V=OpXeej8T8JeJf5sWk=A@mail.gmail.com>
X-Gm-Features: AQt7F2oUlgvIASVJbB18PqSaF_gWeVAJrv7ZCEFYwIRXVXpnDHSC_HjANB0daRE
Message-ID: <CAGb2v67O8xKUfXg2Xr0+G72upPsp6V=OpXeej8T8JeJf5sWk=A@mail.gmail.com>
Subject: Re: [PATCH v2 2/4] pwm: sun50i: Add H616 PWM support
To: =?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig?= <u.kleine-koenig@baylibre.com>
Cc: Richard GENOUD <richard.genoud@bootlin.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Jernej Skrabec <jernej.skrabec@gmail.com>, Samuel Holland <samuel@sholland.org>, 
	Philipp Zabel <p.zabel@pengutronix.de>, Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
	linux-pwm@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev, 
	linux-kernel@vger.kernel.org, Joao Schim <joao@schimsalabim.eu>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260106_085836_934180_453D2980 
X-CRM114-Status: GOOD (  52.38  )
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
Reply-To: wens@csie.org
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

On Wed, Jan 7, 2026 at 12:27=E2=80=AFAM Uwe Kleine-K=C3=B6nig
<u.kleine-koenig@baylibre.com> wrote:
>
> Hello Richard,
>
> On Tue, Jan 06, 2026 at 12:19:59PM +0100, Richard GENOUD wrote:
> > Le 24/12/2025 =C3=A0 10:54, Uwe Kleine-K=C3=B6nig a =C3=A9crit :
> > > this patch isn't checkpatch clean.
> >
> > Yes, I've seen that.
> > It's because checkpatch doesn't detect that PWM_XY_SRC_MUX/GATE/DIV are
> > structures
> > If I unwrap PWM_XY_SRC_MUX/GATE/DIV and PWM_X_DIV, checkpatch doesn't
> > complain anymore (indeed, do/while loops are not allowed at file-scope)
>
> At least add parenthesis around usages of _reg. (And if you know that
> checkpatch points out things that you don't agree to, preempting the
> critic in the cover letter is a good idea.)
>
> > I can drop PWM_XY_SRC_MUX/GATE/DIV PWM_X_DIV and declare the structures
> > directly under PWM_XY_CLK_SRC() and PWM_X_CLK() if you prefer, but I
> > find it less readable than the current form.
>
> No strong feeling here.
>
> > > On Wed, Dec 17, 2025 at 09:25:02AM +0100, Richard Genoud wrote:
> > > > +#define PWM_XY_SRC_GATE(_pair, _reg)                     \
> > > > +struct clk_gate gate_xy_##_pair =3D {                      \
> > > > + .reg =3D (void *)_reg,                            \
> > > > + .bit_idx =3D PWM_XY_CLK_CR_GATE_BIT,              \
> > > > + .hw.init =3D &(struct clk_init_data){             \
> > > > +         .ops =3D  &clk_gate_ops,                  \
> > > > + }                                               \
> > >
> > > I would consider
> > >
> > >     .hw.init.ops =3D ...;
> > >
> > > and
> > >
> > >     .hw =3D {
> > >             .init =3D {
> > >                     .ops =3D ...;
> > >             },
> > >     },
> > >
> > > natural here. The middleway you chose looks strange to me.
> >
> > Actually, it's:
> >       .hw.init->ops =3D ... ;
> > That's why I used this middleway construct.
>
> Ah I see. Then it's fine for me.
>
> > > > +#define PWM_XY_SRC_MUX(_pair, _reg)                      \
> > > > +struct clk_mux mux_xy_##_pair =3D {                        \
> > > > + .reg =3D (void *)_reg,                            \
> > > > + .shift =3D PWM_XY_CLK_CR_SRC_SHIFT,               \
> > > > + .mask =3D PWM_XY_CLK_CR_SRC_MASK,                 \
> > >
> > > Huh, why does this structure has both a shift and a mask value? What =
is
> > > the difference between
> > >
> > >     .shift =3D 7,
> > >     .mask =3D 1,
> > >
> > > and
> > >
> > >     .shift =3D 0,
> > >     .mask =3D 1 << 7,
> > >
> > > ? If the latter is equivalent, you could just pass
> > > H616_PWM_XY_CLK_CR_SRC and get rid of the extra definitions for _SHIF=
T
> > > and _MASK.
> > >
> > Unfortunately, struct clk_mux wants a shift and an unshifted mask, and
> > according to:
> > https://elixir.bootlin.com/linux/v6.18.3/source/drivers/clk/clk-mux.c#L=
93-L94
> > using a 0 shift and mask =3D 1 << 7 won't work.
>
> How annoying, I put that on my todo list ...
>
> > > > +static inline struct h616_pwm_chip *to_h616_pwm_chip(struct pwm_ch=
ip *chip)
> > >
> > > It probably doesn't help much, but conceptually this could be
> > >
> > >     static inline struct h616_pwm_chip *to_h616_pwm_chip(const struct=
 pwm_chip *chip)
> > >
> > Indeed, I'll add that.
>
> If you rename it to h616_pwm_from_chip it even has the driver specific
> prefix.
>
> > > > +
> > > > + return 0;
> > > > +}
> > > > +
> > > > +static int h616_pwm_calc(struct pwm_chip *chip, unsigned int idx,
> > > > +                  const struct pwm_state *state)
> > > > +{
> > > > + struct h616_pwm_chip *h616chip =3D to_h616_pwm_chip(chip);
> > > > + struct h616_pwm_channel *chan =3D &h616chip->channels[idx];
> > > > + unsigned int cnt, duty_cnt;
> > > > + unsigned long max_rate;
> > > > + long calc_rate;
> > > > + u64 duty, period, freq;
> > > > +
> > > > + duty =3D state->duty_cycle;
> > > > + period =3D state->period;
> > > > +
> > > > + max_rate =3D clk_round_rate(chan->pwm_clk, UINT32_MAX);
> > >
> > > Huh, is this an artificial limitation? Do you rely on how clk_round_r=
ate
> > > picks the return value? (I.e. nearest value? nearest time? round up?
> > > round down?)
> >
> > What I want to achieve here is to handle the lowest possible period cas=
e.
> > Without the bypass, the lowest period is build with the highest clock,
> > duty cycle =3D 1 and period cycle =3D 2 (0x10001 in period register)
> > So, if the input clock is 100MHz, we have a lowest period of 20ns.
> > Now, if we enable the bypass, the period register is ignored and we dir=
ectly
> > have the 100MHz clock as PWM output, that can act as a 10ns period with=
 5ns
> > duty
> > So the logic here is to detect this specific lowest period case that ca=
n be
> > achieved by enabling the bypass.
> > For that, the highest clock is retrieved and compared to the wanted per=
iod
> > and duty.
> >
> > Now, I learned the hard way that clk_round_rate() is actually limited t=
o a
> > 32 bits value:
> > clk_round_rate() calls at one point clk_divider_bestdiv() that uses
> > DIV_ROUND_UP_ULL() which in turn uses do_div(n,base):
> >   do_div - returns 2 values: calculate remainder and update new dividen=
d
> >   @n: uint64_t dividend (will be updated)
> >   @base: uint32_t divisor
> > So, in order to get the exact highest clock rate, I use clk_round_rate(=
)
> > with U32_MAX.
>
> IMHO this should be addressed in the clk framework. And until this
> happend the code in the pwm driver needs a verbose comment.
>
> > > > + dev_dbg(pwmchip_parent(chip), "period=3D%llu cnt=3D%u duty=3D%llu=
 duty_cnt=3D%u\n",
> > > > +         period, cnt, duty, duty_cnt);
> > >
> > > This is little helpful without the input parameters.
> > >
> > as
> >       duty =3D state->duty_cycle;
> >       period =3D state->period;
> > The input parameters are there, right?
> > But I can add the missing idx.
>
> Today I agree, don't know why I missed that. It would be nice to stick
> to the format that e.g. pwm-stm32 uses for the input parameters to make
> me notice even on busy days that the input parameters are there :-)
>
> > > > + for (unsigned int i =3D 0; i < data->npwm; i++) {
> > >
> > > Huh, AFAIK we're not using declarations in for loops in the kernel.
> >
> > Actually, I've read somewhere (in LWN I guess) that Linus seems ok with=
 that,
> > but I'll remove it if you prefer.
>
> If you find your source again, I'd be interested.

IIRC Linus said this is the one case that made sense for "declare anywhere"=
.

I dug up this one:

https://lore.kernel.org/all/CAHk-=3DwgLYqYcw0xv65xrLSR7KDpS_6M+S9737m6NQorH=
GWsXYQ@mail.gmail.com/

 - quote -

The actual C99 version is the sane one which actually makes it easier
and clearer to have loop iterators that are clearly just in loop
scope.

That's a good idea in general, and I have wanted to start using that
in the kernel even aside from some of the loop construct macros.
Because putting variables in natural minimal scope is a GoodThing(tm).

 - end quote -

If you look around the kernel, you will see many for loops that are in
this style now.


ChenYu

