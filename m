Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5D254C88E75
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 26 Jan 2026 08:49:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=9NU6747xAQtlszERbdLA7vsZIAyECxzQomn05XOl7Jc=; b=mrUT1if94HMZ7kh0X5I/WOWyTV
	JN+QooOaI79cNqXN9SjcmGbw3FpzYPwkv6WyY71ABpoSD03cYDhLrkxy8BxoDQKEedAmMXZEtDZkY
	N3uW1ju+TJQRsw7TlGQsFyDlyiFGV2I/mMH5BZlHDa0ZC3ouDwUhs2wa02NGl+gllKcm/By34XneT
	uLqvUE8/DD4Ln33ePfJfY5bYqH0GlQwdfnua2KurDBh22zq/qyj9f0/6AKHl3KIUh+YJza78tDB6J
	kbtmm/uCfkEV/w8Ybu759LNInIGibfxoPt7PK9mA77IC8lgmMJGQBMeMkyZ/DgWihQDAOhrZJKhrk
	crqK57ag==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vkIHs-0000000C7jJ-3ivl;
	Mon, 26 Jan 2026 08:49:32 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vkIHq-0000000C7ic-29hD
	for linux-arm-kernel@lists.infradead.org;
	Mon, 26 Jan 2026 08:49:31 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id A3064440F0
	for <linux-arm-kernel@lists.infradead.org>; Mon, 26 Jan 2026 08:49:28 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 72B62C19425
	for <linux-arm-kernel@lists.infradead.org>; Mon, 26 Jan 2026 08:49:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1769417368;
	bh=FxNS7yMeaMMGExS9oCTJFUcXG9yW3cZSU+vkw2ft85g=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=ejOiCzrfB3ugjKY8fmB0dIhqllk0jbGF3e1woLrmRLZr7Z93QrepiNjuBBLhEeXwQ
	 nKf9UB/jab2wnRYqRJSL51ro/QIGTdj/g2EBPZhIMp0RQVa3lCxGeo6232+T4pi4Cb
	 /43+XEVFCbGH7j2aTJcdlP6B/9wsKooq2MLuhPDRWE2OP0P4RALiWHI98RXPEqHJUv
	 a0jUGmFEr4XLh5x4heuW9QV20KEq59fFCIT64GYlyQLniH3r4RQAlnkczZGu/N6s2J
	 nd5GLh6V31ZnrsUcfn5hXjuM8jzF2oqpuOOMigAUX5vhiLQns7hKZcSpRjGZh4L/Xo
	 rYGaQIYEa+X+g==
Received: by mail-lf1-f44.google.com with SMTP id 2adb3069b0e04-59dcdf60427so5012655e87.3
        for <linux-arm-kernel@lists.infradead.org>; Mon, 26 Jan 2026 00:49:28 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCURTlcw8CvTMYWIB4mXSkLMPAwrD6TCgKX4rXtcTFhDuMwhyeHPsrViewBMpdFyWCOzRMkwpN5gnaPC8jMCdcGT@lists.infradead.org
X-Gm-Message-State: AOJu0Yz6sw+PhC7mbS/GHkQj7w5TgFEUnmNgNEWQ+3f1jzjk7q+L2v4M
	xQoF07PGW7PMrsuT+eEzswMmWnSYzw4AAYf0PvO4ALPoe4zQA2srRqRpC24CrRkcQgTE0wPAOqq
	mvQiSPJdOY061ImUuFX/3RdDozdr0/3mw7hDo6rUyig==
X-Received: by 2002:a05:6512:10c1:b0:59d:d64e:b3d7 with SMTP id
 2adb3069b0e04-59df3a82273mr1300484e87.46.1769417367064; Mon, 26 Jan 2026
 00:49:27 -0800 (PST)
MIME-Version: 1.0
References: <20260106090011.21603-1-bartosz.golaszewski@oss.qualcomm.com>
 <cb13c3df-be09-4cf3-b679-4431862d7264@arm.com> <CAMRc=MfUawHpDgxj=fP2OF_-qg1O+P3oM_cSvGsbvAdLRB=+hw@mail.gmail.com>
 <3204984.tdWV9SEqCh@diego>
In-Reply-To: <3204984.tdWV9SEqCh@diego>
From: Bartosz Golaszewski <brgl@kernel.org>
Date: Mon, 26 Jan 2026 09:49:15 +0100
X-Gmail-Original-Message-ID: <CAMRc=MdNkjp6gZJcdTMoFtvQo8kW4damvNFA3+MhVbXhFU7D9w@mail.gmail.com>
X-Gm-Features: AZwV_Qid_m7MIJWeeUTftl8ot9-gB4gBnX-3Xp4Ry9ijoNtlg41NuwGQDS78pYc
Message-ID: <CAMRc=MdNkjp6gZJcdTMoFtvQo8kW4damvNFA3+MhVbXhFU7D9w@mail.gmail.com>
Subject: Re: [PATCH] gpio: rockchip: mark the GPIO controller as sleeping
To: =?UTF-8?Q?Heiko_St=C3=BCbner?= <heiko@sntech.de>
Cc: Robin Murphy <robin.murphy@arm.com>, 
	Sebastian Reichel <sebastian.reichel@collabora.com>, 
	Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>, Linus Walleij <linusw@kernel.org>, 
	linux-gpio@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org, 
	stable@vger.kernel.org, Marek Szyprowski <m.szyprowski@samsung.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260126_004930_606749_6A75DC1F 
X-CRM114-Status: GOOD (  21.47  )
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

On Sun, Jan 25, 2026 at 2:23=E2=80=AFPM Heiko St=C3=BCbner <heiko@sntech.de=
> wrote:
>
> Am Samstag, 24. Januar 2026, 22:07:12 Mitteleurop=C3=A4ische Normalzeit s=
chrieb Bartosz Golaszewski:
> > On Sat, 24 Jan 2026 00:45:25 +0100, Robin Murphy <robin.murphy@arm.com>=
 said:
> > > On 2026-01-23 9:52 pm, Heiko St=C3=BCbner wrote:
>
> [ snip to get to the core question at the bottom ]
>
> > > diff --git a/drivers/pinctrl/pinctrl-rockchip.c b/drivers/pinctrl/pin=
ctrl-rockchip.c
> > > index e44ef262beec..2fc67aeafdb3 100644
> > > --- a/drivers/pinctrl/pinctrl-rockchip.c
> > > +++ b/drivers/pinctrl/pinctrl-rockchip.c
> > > @@ -3545,10 +3545,9 @@ static int rockchip_pmx_set(struct pinctrl_dev=
 *pctldev, unsigned selector,
> > >     return 0;
> > >   }
> > >
> > > -static int rockchip_pmx_gpio_set_direction(struct pinctrl_dev *pctld=
ev,
> > > -                                      struct pinctrl_gpio_range *ran=
ge,
> > > -                                      unsigned offset,
> > > -                                      bool input)
> > > +static int rockchip_pmx_gpio_request_enable(struct pinctrl_dev *pctl=
dev,
> > > +                                       struct pinctrl_gpio_range *ra=
nge,
> > > +                                       unsigned int offset)
> > >   {
> > >     struct rockchip_pinctrl *info =3D pinctrl_dev_get_drvdata(pctldev=
);
> > >     struct rockchip_pin_bank *bank;
> > > @@ -3562,7 +3561,7 @@ static const struct pinmux_ops rockchip_pmx_ops=
 =3D {
> > >     .get_function_name      =3D rockchip_pmx_get_func_name,
> > >     .get_function_groups    =3D rockchip_pmx_get_groups,
> > >     .set_mux                =3D rockchip_pmx_set,
> > > -   .gpio_set_direction     =3D rockchip_pmx_gpio_set_direction,
> > > +   .gpio_request_enable    =3D rockchip_pmx_gpio_request_enable,
> > >   };
> > >
> > >   /*
> > >
> >
> > I'm not sure what's going on here. You don't really need to call
> > pinctrl_gpio_direction_input/output()?
>
> No we actually don't.
>
> The current _set_direction function:
>
> static int rockchip_pmx_gpio_set_direction(struct pinctrl_dev *pctldev,
>                                            struct pinctrl_gpio_range *ran=
ge,
>                                            unsigned offset,
>                                            bool input)
> {
>         struct rockchip_pinctrl *info =3D pinctrl_dev_get_drvdata(pctldev=
);
>         struct rockchip_pin_bank *bank;
>
>         bank =3D pin_to_bank(info, offset);
>         return rockchip_set_mux(bank, offset - bank->pin_base, RK_FUNC_GP=
IO);
> }
>
> really only ever touches the pinmux and has nothing to do with setting
> the direction, which is solely the task of the gpio-controller/-driver.
>
> So moving that to the request callback would likely solve all our current
> problems?
>
> Heiko
>
>
>

If that fixes the issue, allows us to revert cansleep to false and
doesn't cause any problems - yes, for sure.

Do you want to send a patch?

Bartosz

