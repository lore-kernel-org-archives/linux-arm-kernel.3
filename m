Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1FC72EB5961
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 11 Feb 2026 04:05:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=qEVbXEJobC5WrafOHG6I1blIMwKUcTYowOn3LM56dKc=; b=eEON4KOcvio+SvyjW9/zoQ+FQ6
	NaN24NuXkqSz/w2ANnf0jwEZ/5j+5VOW+ZAZOgN4N9LjMeG1hbBKoadJiI911gWdFk9Rm6OpCm5Mf
	N6vQT8CxnTvJNU7Tuc7t4IrTbB+I8Ys9XvdPoq76wlJCIaEANldfpzSu1ywN8vZfL58gubBHQYcuu
	iBGLlolzAifGktvOWJJcknJYUKbkk70CIvlXp2HhxMMYKYENMOBJ2DaFEhS+Codfk0uocUE8+Qcn9
	0JG9bNguVJwYnN1QYqw1vuVooFXaVjpHIUoqqDZ6uFI3hREwwsGsf15Wy3N2QqHk3YPI/7gVq0uJ8
	LActmnTQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vq1TQ-00000000BLQ-00YF;
	Wed, 11 Feb 2026 04:05:08 +0000
Received: from mail-ua1-x936.google.com ([2607:f8b0:4864:20::936])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vq1TN-00000000BL3-3nHN
	for linux-arm-kernel@lists.infradead.org;
	Wed, 11 Feb 2026 04:05:07 +0000
Received: by mail-ua1-x936.google.com with SMTP id a1e0cc1a2514c-94ace5d0e39so638390241.2
        for <linux-arm-kernel@lists.infradead.org>; Tue, 10 Feb 2026 20:05:05 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1770782704; cv=none;
        d=google.com; s=arc-20240605;
        b=fLpedNoLiV922Dn7UEmDfIkacBqhAY17C54OkuKYBQrLMdwTSoLkzSYU/5MyT5ZDuN
         4ZXJwnKv/6UVKivGoTxU3qKQLuk91umwLQDyhrn/qh4jgs29VEnPmgdZ3Z96/Wbp8rno
         4IKFQFtn0/eRbQXIVJhvo4HoT4umKhAxnU7ny0AusmJHSDp6BdZVUCJGMwzK9iZQ5YiM
         fKXGwu2nB8m+rhYGhedgd4bUxzYOvk5Uk3M4pT3+RrLnKVeMMX9RbY+ul4zujG8gUYsq
         oWPWOSMVejx8UwX86hPhjpr0rLQOKKmDWvf0LT/fXKVoyOUjnPLW0N6AJiHEvJwIpduk
         keAA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=qEVbXEJobC5WrafOHG6I1blIMwKUcTYowOn3LM56dKc=;
        fh=8AtHSalYC5rzVkg2hdSPJQRsqoZkMx5QLNhC6594PjQ=;
        b=Umt0cwEDvWsRYHxGah0IhG0PQQKvzWtXdAOqAPopvT4P5OPC0eidRZbCYJh65rK37/
         PjS78QfEjqO7fn4VV2izR8iqVVm99iHAQ0aK7Rvtji9mZhf8ZZtIRDHJKNQyQpRHQ5Mb
         uxlBtylHa8Foothm/Suw3awFsc1+YpaUg+6iRQHI3t3+E09sDnQee/nBvx3V4SlOEg2N
         EpcMXvZmYeB9rC/l1lJKFsvVmqCd7SNzuGZrR8Vf7loXeU9nHheC9ByfWDCoG/aM06y0
         Py4jbMbA7KZoCySLFLzJlzeHrEBWDevNCab/ca5gz58oh9lt7YnlYUfHjuCLbNujHJZ8
         lhYw==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1770782704; x=1771387504; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qEVbXEJobC5WrafOHG6I1blIMwKUcTYowOn3LM56dKc=;
        b=caGRPHUmd+NW/T9NAm67a1LB1s1FO0yzMKwxnvx+jqxx7O6bxawDTBaM2VzKT8eRpQ
         2/gnCblOgpdHets30Ok1uj3FfRiBZDcIl5T/IcQfTI2wanTcEXk9wep6xuvDKlTZnjlX
         wYudygfZtCD7kKFDVKAcUM7FqNXzQJp/EHBOgsxRZM/iTGj0pROMTQK1Z3YMoCcvDxYs
         E8RsEgJptAqJ2tEbuuhpfSn6mhNl00zSXMBzS/JQFycMMJN8WKXoxWrA346xaWq238+A
         kDoU3j6k9UoTt+7GJzsn4BpgqR/3/AjrB4gt7NcRiPrLVni4ExxTEv0/DNHHPNw7Vlgr
         Vylw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770782704; x=1771387504;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=qEVbXEJobC5WrafOHG6I1blIMwKUcTYowOn3LM56dKc=;
        b=fxu9CycXDPjgkwXDSvh6qbfob3+QTMKuf+z1cwBP3guO/fJXRpI9CZRprfrk1I+/22
         kG6ARafZlxYvhaMsKbkHGAlze6GAO4XsxB06rHC+0Q+F9GJ7IhWHGFook87mJjk6VRba
         YCOlISrC06ISNlUH8PGEp46NzCo87icdVZKx/4IMAZFAcbGErqmy1EfjZq9PlIJzjWZr
         dObl/N44HWrlLa6hSVmEB2Y6+uxcxamcOJ3X5U/9PJ2PIdV5iwERwoW4eyVUF44VxHN0
         H7cZtpA+1UYr/XrbnPKeorkh1gfe5w8IZXM8G6xk969JV1mE8lSMGs+A7ptowEXVkYPk
         GGfw==
X-Forwarded-Encrypted: i=1; AJvYcCXdZcTQ6Psh4GYNieYTZ+RJr82N5INm9pM2YZyMpPHCISDoOMOyOxzvvWmp4takOLH6KMTt+3gwORWpEOa38cVH@lists.infradead.org
X-Gm-Message-State: AOJu0YyYo3n6SgBnPhhbPW4ZjbkeApjK3gyelim2yJ7iLST0xt5uCx81
	zmgROMtWHx51mBA4t3ZXy5p8tJLfc8yo9pyqMNdy9NQ8cDxr5j1hI+uWnpkupkAeCOKKrEig4rG
	kCaZ3+arwHVjzz2hD9jGDS2rpk1mFdxE=
X-Gm-Gg: AZuq6aKkwNOhBaWW9RK8rP2fw/PZl0cMw4ncDLAqG2QXOzPCfxjS//oagOrbEQOLjIV
	1/LOE4pO+s4GalvpmbTQUhuYWhl2pBHDBQpZvEDd3Az82sPiaDHWn4f4MfLLmFwkUj/MYJgDpS5
	QBz6C0n5til2Z9vPE2wThAhN2nzxoJUEqqLJQmPRW2ICiye29JgJfjGsLm9xfm1RwMXSe8o28bA
	Q3MG8oqyMn18oZcvUxh0kPL4x73e5DKl4H2mrZXhz1Wq9Fi8oy57IfKeusd2zYhAKraFy9zxlGV
	eZ+G34lnmBybfTnVvUVKNLgLQsKqN737FnAvqtpudu2Ms5/nIIc7948whpssR3OMkbAU
X-Received: by 2002:a05:6102:4421:b0:5ee:a8c4:18f2 with SMTP id
 ada2fe7eead31-5fde93f801emr137229137.26.1770782704273; Tue, 10 Feb 2026
 20:05:04 -0800 (PST)
MIME-Version: 1.0
References: <20260211033249.2770281-1-james.hilliard1@gmail.com> <CAGb2v64TYWbvs7mmpa87X28WWQpTi7O+VZSz-x8GmGhyadBegQ@mail.gmail.com>
In-Reply-To: <CAGb2v64TYWbvs7mmpa87X28WWQpTi7O+VZSz-x8GmGhyadBegQ@mail.gmail.com>
From: James Hilliard <james.hilliard1@gmail.com>
Date: Tue, 10 Feb 2026 21:04:54 -0700
X-Gm-Features: AZwV_Qjf4ObSc92v7jkKvYHFiayN0060eKWYrAhspcIrTjh2lRHs_GV5KWc25f8
Message-ID: <CADvTj4p7YYhz-iZSRX=hDyL2E2JXPmnCJ59wX+9zMt7vnzn8GQ@mail.gmail.com>
Subject: Re: [PATCH 1/1] pinctrl: sunxi: add GPIO get_direction callback
To: wens@kernel.org
Cc: linux-sunxi@lists.linux.dev, linux-gpio@vger.kernel.org, 
	Linus Walleij <linusw@kernel.org>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
	Samuel Holland <samuel@sholland.org>, Bartosz Golaszewski <brgl@kernel.org>, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260210_200505_959913_49319054 
X-CRM114-Status: GOOD (  29.18  )
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

On Tue, Feb 10, 2026 at 8:49=E2=80=AFPM Chen-Yu Tsai <wens@kernel.org> wrot=
e:
>
> On Wed, Feb 11, 2026 at 11:33=E2=80=AFAM James Hilliard
> <james.hilliard1@gmail.com> wrote:
>
> Ah, you beat me to it.
>
> > Implement sunxi_pinctrl_gpio_get_direction() and wire it into
> > the sunxi gpio_chip setup.
>
> Can you also mention that without this, calls to gpiochip_get_direction()
> cause a big warning?

Yeah, this was mostly just to silence that warning(I don't think I actually
was actually using the functionality).

> > The new callback reads the pin mux register and compares the mux
> > value against the pin descriptor gpio_in and gpio_out functions
> > to report GPIO_LINE_DIRECTION_IN or GPIO_LINE_DIRECTION_OUT.
> > If the pin is muxed to irq, report it as input.
> >
> > Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
> > ---
> >  drivers/pinctrl/sunxi/pinctrl-sunxi.c | 32 +++++++++++++++++++++++++++
> >  1 file changed, 32 insertions(+)
> >
> > diff --git a/drivers/pinctrl/sunxi/pinctrl-sunxi.c b/drivers/pinctrl/su=
nxi/pinctrl-sunxi.c
> > index 0fb057a07dcc..424f23be27b2 100644
> > --- a/drivers/pinctrl/sunxi/pinctrl-sunxi.c
> > +++ b/drivers/pinctrl/sunxi/pinctrl-sunxi.c
> > @@ -995,6 +995,37 @@ static int sunxi_pinctrl_gpio_direction_output(str=
uct gpio_chip *chip,
> >                                             chip->base + offset, false)=
;
> >  }
> >
> > +static int sunxi_pinctrl_gpio_get_direction(struct gpio_chip *chip,
> > +                                           unsigned int offset)
> > +{
> > +       struct sunxi_pinctrl *pctl =3D gpiochip_get_data(chip);
> > +       struct sunxi_desc_function *in, *out, *irq;
> > +       u32 reg, shift, mask, val;
> > +       u16 pin =3D chip->base + offset;
> > +
> > +       in =3D sunxi_pinctrl_desc_find_function_by_pin(pctl, pin, "gpio=
_in");
> > +       out =3D sunxi_pinctrl_desc_find_function_by_pin(pctl, pin, "gpi=
o_out");
> > +       if (!in || !out)
> > +               return -EINVAL;
> > +
> > +       irq =3D sunxi_pinctrl_desc_find_function_by_pin(pctl, pin, "irq=
");
>
> This is less efficient, as you end up (linearly) searching the whole pin
> array three times.
>
> What I did in my version was implement a search based on pin and muxval.
> I can send that out if it's OK with you.

If you have a better patch I'll just use that instead of sending
a follow up.

>
>
> ChenYu
>
> > +
> > +       sunxi_mux_reg(pctl, offset, &reg, &shift, &mask);
> > +       val =3D (readl(pctl->membase + reg) & mask) >> shift;
> > +
> > +       if (val =3D=3D in->muxval)
> > +               return GPIO_LINE_DIRECTION_IN;
> > +
> > +       if (val =3D=3D out->muxval)
> > +               return GPIO_LINE_DIRECTION_OUT;
> > +
> > +       /* IRQ function is effectively input. */
> > +       if (irq && val =3D=3D irq->muxval)
> > +               return GPIO_LINE_DIRECTION_IN;
> > +
> > +       return -EINVAL;
> > +}
> > +
> >  static int sunxi_pinctrl_gpio_of_xlate(struct gpio_chip *gc,
> >                                 const struct of_phandle_args *gpiospec,
> >                                 u32 *flags)
> > @@ -1603,6 +1634,7 @@ int sunxi_pinctrl_init_with_flags(struct platform=
_device *pdev,
> >         pctl->chip->set_config =3D gpiochip_generic_config;
> >         pctl->chip->direction_input =3D sunxi_pinctrl_gpio_direction_in=
put;
> >         pctl->chip->direction_output =3D sunxi_pinctrl_gpio_direction_o=
utput;
> > +       pctl->chip->get_direction =3D sunxi_pinctrl_gpio_get_direction;
> >         pctl->chip->get =3D sunxi_pinctrl_gpio_get;
> >         pctl->chip->set =3D sunxi_pinctrl_gpio_set;
> >         pctl->chip->of_xlate =3D sunxi_pinctrl_gpio_of_xlate;
> > --
> > 2.43.0
> >

