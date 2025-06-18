Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BD22FC7115D
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 18 Jun 2025 16:01:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=7NCFXvXRzTnNTsIn79B1ObpiC19qiQmFuZrgGsmP12M=; b=PDmXYKP+xbVub3eZFVvJBBQcNO
	CeGS42HPhZkblnISKw45wzLtA3Yf5NknMF5PyOWK/iAnYUhNeuAV6YK+DZZ2nUonYEzUVVw+ByMrh
	gh9uOAH95aTE2+rj1ls5lAm/LLHsgOBhys1jFV1XNuL4YHwgXOoRPfqZCI+cYzUFANA93RhsAOZWE
	UsHxl7aOhfR0dhYeeqTIqO4VJl5BhoKikXVT3WxTzGv/Abzlt0p+oIlYiIajL3A8NWiuQoORTf2rx
	il1kND3oQfzc0GZz4tpLHvednUb3EapZwGkxvY9sMnHFEd+ffT5IAfl1pnGu1ZSbFCAf5xy2WUhmv
	Ra7E2LcA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uRvEU-0000000Afbh-3Xmw;
	Wed, 18 Jun 2025 16:01:51 +0000
Received: from mail-lf1-x132.google.com ([2a00:1450:4864:20::132])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uRs0I-0000000A9AQ-1oBA
	for linux-arm-kernel@lists.infradead.org;
	Wed, 18 Jun 2025 12:35:00 +0000
Received: by mail-lf1-x132.google.com with SMTP id 2adb3069b0e04-553c31542b1so3358411e87.2
        for <linux-arm-kernel@lists.infradead.org>; Wed, 18 Jun 2025 05:34:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1750250097; x=1750854897; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7NCFXvXRzTnNTsIn79B1ObpiC19qiQmFuZrgGsmP12M=;
        b=E3WWQsE+B7mUbttvreWYIP8DCXObXFraGmbjVitWXDNljHcejRPvjyLNTboq+XX9OO
         yLxg+jMx9A62+EgeLs87J6+wrABzNLnRvnxMpv7foJ2n9PkJYfeZX8PLUQPGsoZn/q5z
         jD2UbV347kVfGuX6AxDzDv+H+3HeZcsUuUjw4swyxQk84xXR3z7uDmKBReecqPMXXEHb
         ZpJpAlaCQpN441phGi/N2SjWFWDmgzFPY7Nqsce8QsQ/yfZIOPLIH92E308xEaSAIQ0Y
         zYbysfHRjqKWiQaJn7lORJDcs9KA857tZJ7pSPMrOBXCq+26t4IWeVYeUKMzQtzV/kU3
         4u2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750250097; x=1750854897;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=7NCFXvXRzTnNTsIn79B1ObpiC19qiQmFuZrgGsmP12M=;
        b=Peuougis7cp/VC5SRBQOOFNIahyhHqK78gJBTQGoCtQkQm4bKUmTNuI4Jz90Xt5HW/
         FidPvkjRJ3DgUJI4Wk99Y8WCRFOAPKQUDobd2dof47YZDOyljz6b79WVSe1Ox0F2glXq
         4Yhi/s3etkcbjms3TYi56UqWJLV26IB4iDQ4S1s/GFXcaGoNHQD7xK7HZxsGOC5D/rlU
         RyN+MjA49w9r5P4iYfnVutbEsMe3LHOV+8JdkcmmBEjLDWSEk3u0KeGxogV7k0FR/FA4
         CBcHuLOstE2Av2nanv9XtQZwAcrS7Z7gvvu6GbVy7PbKXkpO4T+sm4kVH1HYuljTr9d3
         Q7Xg==
X-Forwarded-Encrypted: i=1; AJvYcCW236UnJuCYKh3aTuWGjZMHRU2mIC7uRHCxk2ErtzyiGytGOkiPSzDu53Ej2U9e8Zy9eW4PxgFtWd/v5SITBcl3@lists.infradead.org
X-Gm-Message-State: AOJu0YyVC4ikv4Kt237B+oP9q4E7VDGVnMDc3q0S7P970y3PBY+i1Rls
	k0wNG8f3z/N+e22U8v5B/IoztQR/DIyc17TBJ3tS0bYht1JkXAZZAiomTFrgvn7ZEae9BkEa//P
	5SKXCxbnJSTXbRq+AkD6gOpD/TrLYjvnCrgprnJW+9w==
X-Gm-Gg: ASbGnct1XmMYTFwFHT0vGQL+gaUr/qMB0EA6ztRi/GaWgfP4OyVuvf6D+Se5ntvuTcH
	eQQdstjv0bKyg4zJkiMySq8mR8lDdg8CdRJ6KDWPem5g2a5+CAPifKNaNzug1o+tzPhwrjtvfYF
	HlQsd3V5rs5EHq0UQBTXCUBRKzznZ9ti7pri8k7kd79Vd0Wuj1TR0gpx/1BuPY6i6xiOSFpaNtL
	g==
X-Google-Smtp-Source: AGHT+IEcY0ia8sTwoRAYv0yUxmwNgwPhm8wtdrftfa4ddrwo+GTxfk9hINsrO5aUlvjYzopy0PhTBONSdU1zFixC2QI=
X-Received: by 2002:a05:6512:4005:b0:553:a30b:ee0a with SMTP id
 2adb3069b0e04-553b6e8c9bamr5355914e87.24.1750250096692; Wed, 18 Jun 2025
 05:34:56 -0700 (PDT)
MIME-Version: 1.0
References: <20250610-gpiochip-set-rv-gpio-v1-0-3a9a3c1472ff@linaro.org>
 <20250610-gpiochip-set-rv-gpio-v1-1-3a9a3c1472ff@linaro.org> <2rw2sncevdiyirpdovotztlg77apcq2btzytuv5jnm55aqhlne@swtts3hl53tw>
In-Reply-To: <2rw2sncevdiyirpdovotztlg77apcq2btzytuv5jnm55aqhlne@swtts3hl53tw>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Wed, 18 Jun 2025 14:34:43 +0200
X-Gm-Features: AX0GCFtJGsl5fi6e6i6LCEjO1TuJe6n2Li_qY-Pi8nS955_BMUgd9yxByrvzkO8
Message-ID: <CAMRc=Mf==gzqXEUMd3D_-XYG7Bg7dSMLgjg3sq5-GoB1BUGchA@mail.gmail.com>
Subject: Re: [PATCH 01/12] gpio: mmio: use new GPIO line value setter callbacks
To: Klara Modin <klarasmodin@gmail.com>
Cc: Linus Walleij <linus.walleij@linaro.org>, =?UTF-8?B?TWFyZWsgQmVow7pu?= <kabel@kernel.org>, 
	Conor Dooley <conor.dooley@microchip.com>, Daire McNamara <daire.mcnamara@microchip.com>, 
	Daniel Palmer <daniel@thingy.jp>, Romain Perier <romain.perier@gmail.com>, 
	Avi Fishman <avifishman70@gmail.com>, Tomer Maimon <tmaimon77@gmail.com>, 
	Tali Perry <tali.perry1@gmail.com>, Patrick Venture <venture@google.com>, 
	Nancy Yuen <yuenn@google.com>, Benjamin Fair <benjaminfair@google.com>, 
	Grygorii Strashko <grygorii.strashko@ti.com>, Santosh Shilimkar <ssantosh@kernel.org>, 
	Kevin Hilman <khilman@kernel.org>, linux-gpio@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org, 
	linux-arm-kernel@lists.infradead.org, openbmc@lists.ozlabs.org, 
	linux-omap@vger.kernel.org, 
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250618_053458_469166_E85E03B2 
X-CRM114-Status: GOOD (  24.05  )
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

On Wed, Jun 18, 2025 at 1:59=E2=80=AFPM Klara Modin <klarasmodin@gmail.com>=
 wrote:
>
> Hi,
>
> On 2025-06-10 14:33:11 +0200, Bartosz Golaszewski wrote:
> > From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> >
> > struct gpio_chip now has callbacks for setting line values that return
> > an integer, allowing to indicate failures. Convert the driver to using
> > them.
> >
> > Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> > ---
> >  drivers/gpio/gpio-mmio.c | 53 ++++++++++++++++++++++++++++++----------=
--------
> >  1 file changed, 33 insertions(+), 20 deletions(-)
> >
> > diff --git a/drivers/gpio/gpio-mmio.c b/drivers/gpio/gpio-mmio.c
> > index 4841e4ebe7a67d0f954e9a6f995ec5758f124edd..9169eccadb238efe944d494=
054b1e009f16eee7f 100644
> > --- a/drivers/gpio/gpio-mmio.c
> > +++ b/drivers/gpio/gpio-mmio.c
> > @@ -211,11 +211,12 @@ static int bgpio_get_multiple_be(struct gpio_chip=
 *gc, unsigned long *mask,
> >       return 0;
> >  }
> >
> > -static void bgpio_set_none(struct gpio_chip *gc, unsigned int gpio, in=
t val)
> > +static int bgpio_set_none(struct gpio_chip *gc, unsigned int gpio, int=
 val)
> >  {
> > +     return 0;
> >  }
> >
> > -static void bgpio_set(struct gpio_chip *gc, unsigned int gpio, int val=
)
> > +static int bgpio_set(struct gpio_chip *gc, unsigned int gpio, int val)
> >  {
> >       unsigned long mask =3D bgpio_line2mask(gc, gpio);
> >       unsigned long flags;
> > @@ -230,10 +231,12 @@ static void bgpio_set(struct gpio_chip *gc, unsig=
ned int gpio, int val)
> >       gc->write_reg(gc->reg_dat, gc->bgpio_data);
> >
> >       raw_spin_unlock_irqrestore(&gc->bgpio_lock, flags);
> > +
> > +     return 0;
> >  }
> >
> > -static void bgpio_set_with_clear(struct gpio_chip *gc, unsigned int gp=
io,
> > -                              int val)
> > +static int bgpio_set_with_clear(struct gpio_chip *gc, unsigned int gpi=
o,
> > +                             int val)
> >  {
> >       unsigned long mask =3D bgpio_line2mask(gc, gpio);
> >
> > @@ -241,9 +244,11 @@ static void bgpio_set_with_clear(struct gpio_chip =
*gc, unsigned int gpio,
> >               gc->write_reg(gc->reg_set, mask);
> >       else
> >               gc->write_reg(gc->reg_clr, mask);
> > +
> > +     return 0;
> >  }
> >
> > -static void bgpio_set_set(struct gpio_chip *gc, unsigned int gpio, int=
 val)
> > +static int bgpio_set_set(struct gpio_chip *gc, unsigned int gpio, int =
val)
> >  {
> >       unsigned long mask =3D bgpio_line2mask(gc, gpio);
> >       unsigned long flags;
> > @@ -258,6 +263,8 @@ static void bgpio_set_set(struct gpio_chip *gc, uns=
igned int gpio, int val)
> >       gc->write_reg(gc->reg_set, gc->bgpio_data);
> >
> >       raw_spin_unlock_irqrestore(&gc->bgpio_lock, flags);
> > +
> > +     return 0;
> >  }
> >
> >  static void bgpio_multiple_get_masks(struct gpio_chip *gc,
> > @@ -298,21 +305,25 @@ static void bgpio_set_multiple_single_reg(struct =
gpio_chip *gc,
> >       raw_spin_unlock_irqrestore(&gc->bgpio_lock, flags);
> >  }
> >
> > -static void bgpio_set_multiple(struct gpio_chip *gc, unsigned long *ma=
sk,
> > +static int bgpio_set_multiple(struct gpio_chip *gc, unsigned long *mas=
k,
> >                              unsigned long *bits)
> >  {
> >       bgpio_set_multiple_single_reg(gc, mask, bits, gc->reg_dat);
> > +
> > +     return 0;
> >  }
> >
> > -static void bgpio_set_multiple_set(struct gpio_chip *gc, unsigned long=
 *mask,
> > -                                unsigned long *bits)
> > +static int bgpio_set_multiple_set(struct gpio_chip *gc, unsigned long =
*mask,
> > +                               unsigned long *bits)
> >  {
> >       bgpio_set_multiple_single_reg(gc, mask, bits, gc->reg_set);
> > +
> > +     return 0;
> >  }
> >
> > -static void bgpio_set_multiple_with_clear(struct gpio_chip *gc,
> > -                                       unsigned long *mask,
> > -                                       unsigned long *bits)
> > +static int bgpio_set_multiple_with_clear(struct gpio_chip *gc,
> > +                                      unsigned long *mask,
> > +                                      unsigned long *bits)
> >  {
> >       unsigned long set_mask, clear_mask;
> >
> > @@ -322,6 +333,8 @@ static void bgpio_set_multiple_with_clear(struct gp=
io_chip *gc,
> >               gc->write_reg(gc->reg_set, set_mask);
> >       if (clear_mask)
> >               gc->write_reg(gc->reg_clr, clear_mask);
> > +
> > +     return 0;
> >  }
> >
> >  static int bgpio_dir_return(struct gpio_chip *gc, unsigned int gpio, b=
ool dir_out)
> > @@ -510,18 +523,18 @@ static int bgpio_setup_io(struct gpio_chip *gc,
> >       if (set && clr) {
> >               gc->reg_set =3D set;
> >               gc->reg_clr =3D clr;
> > -             gc->set =3D bgpio_set_with_clear;
> > -             gc->set_multiple =3D bgpio_set_multiple_with_clear;
> > +             gc->set_rv =3D bgpio_set_with_clear;
> > +             gc->set_multiple_rv =3D bgpio_set_multiple_with_clear;
> >       } else if (set && !clr) {
> >               gc->reg_set =3D set;
> > -             gc->set =3D bgpio_set_set;
> > -             gc->set_multiple =3D bgpio_set_multiple_set;
> > +             gc->set_rv =3D bgpio_set_set;
> > +             gc->set_multiple_rv =3D bgpio_set_multiple_set;
> >       } else if (flags & BGPIOF_NO_OUTPUT) {
> > -             gc->set =3D bgpio_set_none;
> > -             gc->set_multiple =3D NULL;
> > +             gc->set_rv =3D bgpio_set_none;
> > +             gc->set_multiple_rv =3D NULL;
> >       } else {
> > -             gc->set =3D bgpio_set;
> > -             gc->set_multiple =3D bgpio_set_multiple;
> > +             gc->set_rv =3D bgpio_set;
> > +             gc->set_multiple_rv =3D bgpio_set_multiple;
> >       }
> >
> >       if (!(flags & BGPIOF_UNREADABLE_REG_SET) &&
> > @@ -654,7 +667,7 @@ int bgpio_init(struct gpio_chip *gc, struct device =
*dev,
> >       }
> >
> >       gc->bgpio_data =3D gc->read_reg(gc->reg_dat);
> > -     if (gc->set =3D=3D bgpio_set_set &&
> > +     if (gc->set_rv =3D=3D bgpio_set_set &&
> >                       !(flags & BGPIOF_UNREADABLE_REG_SET))
> >               gc->bgpio_data =3D gc->read_reg(gc->reg_set);
> >
> >
> > --
> > 2.48.1
> >
>
> Isn't this missing to convert gc->set() to gc-set_rv() in several
> places?
>
> Without the attached diff I get a null pointer reference on e.g. the
> spacemit k1 driver.
>

Ah, yes, sorry for this and thanks for the catch. I will send a follow-up.

Bartosz

