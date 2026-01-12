Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3CF40D25056
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 12 Jan 2026 09:08:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=eVfwIuJRGwe5zPLGLVdha/ul/YfX3BQ3hrB+at5rA7M=; b=lFSosIiJeDl4k2JBWSjfPge4R2
	rXKhdT9VYy9C8wSXTDnIJALsr4SvZ+I1GFmFwQR688vd1YxkozobModRPqe+JUhCole5mx7DOzsLY
	C2QLQDilkz7PPFUllp3bfz1j3aRXifQg317xUsoN3HiCyKEKZByPteuPVKHQ9x5821rTpzRniAOK8
	DUsrvQwVxXG8iD5XvVHb+u5RVF/jTV3WdfOij2KKerEZkwDWMy6u2I66rutAH3xYTFicfY1AYW57w
	EuF/MIYcnv+NnY38e7bYYNR+qnF6u9WGJk9+5+ldK8li5RqUTO6OqyJVbs7M2dqS97ZzZjovS1bwA
	T98QE8JQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vfDum-000000053NG-1dkS;
	Mon, 12 Jan 2026 09:08:44 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vfDuj-000000053ML-3lc6
	for linux-arm-kernel@lists.infradead.org;
	Mon, 12 Jan 2026 09:08:43 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 27A2644084
	for <linux-arm-kernel@lists.infradead.org>; Mon, 12 Jan 2026 09:08:39 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 07058C2BC86
	for <linux-arm-kernel@lists.infradead.org>; Mon, 12 Jan 2026 09:08:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1768208919;
	bh=aNusfbvcvvIrZ1GK6+N/BWnHjCznHNoKX1GEoskKxrw=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=rdBWZ5KpxcbS00ewOLmz6VAc+OOKmUqd4MYWGLtm00Io/3Yei+jlv+kNP9Q0vdsOb
	 edfSASkvbc/gWY8nmaY2Jj0OjaSNAlRYniK/ApsqCWGIoSm1rSwQNomse/Y8kK9PwY
	 9fK1LpyqJng2uyWvtJoHtzXpxMoPWdWryEAxO+Drt6FRu+LeNlD4omI+l+jga+Y98t
	 gSNiUppaEZd8ROLEV1T8mUS3jQ2JcldlKpm941SCK3wzEcc+AiTU+s4dybHV9IxsSb
	 av8ri27WpDQhLEcGNkVC6sL707k1MmpdjObys2j7sl7neUqYOKqqqs4wn637/vDV15
	 tBfj/lw8836yw==
Received: by mail-lj1-f174.google.com with SMTP id 38308e7fff4ca-382fe06aa94so42436951fa.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 12 Jan 2026 01:08:38 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCVr49lwa5cS49rS4YC7IRw18hEJFix5/tJ90ckoMTVXl/0dPw2eLIVYu4hZ62eyrHruZSDlzn2HAbvnJNUbnXTQ@lists.infradead.org
X-Gm-Message-State: AOJu0YwSuRcWV/LJ0ISIQjFrXBAH9guSbQ5R+JwO6/gWWlXMc1OALG7Y
	lGnaWwjuOB/bbblDh3gJnIAatEEoBscTC89HUu939JnKCJot+TQMA7KoOXPGYg0YxHr2rhvw+b3
	9yo7z+JGaal9ft1aVqF0PLnKmWk704bmya1b63WWD+A==
X-Google-Smtp-Source: AGHT+IGTR9k5RSHNIpBJL834Ww0X8J1ZdzRZ6Hp2uk9hnACvGJbrlxz/VASX4yp2KTPlt556o88PPVY7jr7CQVZ9CaA=
X-Received: by 2002:a2e:a590:0:b0:383:213c:fc61 with SMTP id
 38308e7fff4ca-383213cff5cmr24069241fa.31.1768208917628; Mon, 12 Jan 2026
 01:08:37 -0800 (PST)
MIME-Version: 1.0
References: <20260106090011.21603-1-bartosz.golaszewski@oss.qualcomm.com> <aWGSQYCXP4R08koQ@venus>
In-Reply-To: <aWGSQYCXP4R08koQ@venus>
From: Bartosz Golaszewski <brgl@kernel.org>
Date: Mon, 12 Jan 2026 10:08:25 +0100
X-Gmail-Original-Message-ID: <CAMRc=Mf0tRxRrh7tn5OaDn3a47N_qvUcjO=zqbTi-GhY-Y9hOg@mail.gmail.com>
X-Gm-Features: AZwV_QhDDYd3G5smy1ZRDQbejdmCu0WGBNa60Ja3hID1ca2J3AnWia5Ug7Yy3bU
Message-ID: <CAMRc=Mf0tRxRrh7tn5OaDn3a47N_qvUcjO=zqbTi-GhY-Y9hOg@mail.gmail.com>
Subject: Re: [PATCH] gpio: rockchip: mark the GPIO controller as sleeping
To: Sebastian Reichel <sebastian.reichel@collabora.com>
Cc: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>, Linus Walleij <linusw@kernel.org>, 
	Heiko Stuebner <heiko@sntech.de>, linux-gpio@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, 
	linux-kernel@vger.kernel.org, stable@vger.kernel.org, 
	Marek Szyprowski <m.szyprowski@samsung.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260112_010841_975141_BA2F4F88 
X-CRM114-Status: GOOD (  29.81  )
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

On Sat, Jan 10, 2026 at 12:55=E2=80=AFAM Sebastian Reichel
<sebastian.reichel@collabora.com> wrote:
>
> Hi,
>
> On Tue, Jan 06, 2026 at 10:00:11AM +0100, Bartosz Golaszewski wrote:
> > The GPIO controller is configured as non-sleeping but it uses generic
> > pinctrl helpers which use a mutex for synchronization.
> >
> > This can cause the following lockdep splat with shared GPIOs enabled on
> > boards which have multiple devices using the same GPIO:
> >

[snip]

> >
> > Fixes: 936ee2675eee ("gpio/rockchip: add driver for rockchip gpio")
> > Cc: stable@vger.kernel.org
> > Reported-by: Marek Szyprowski <m.szyprowski@samsung.com>
> > Closes: https://lore.kernel.org/all/d035fc29-3b03-4cd6-b8ec-001f93540bc=
6@samsung.com/
> > Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.co=
m>
> > ---
> >  drivers/gpio/gpio-rockchip.c | 1 +
> >  1 file changed, 1 insertion(+)
> >
> > diff --git a/drivers/gpio/gpio-rockchip.c b/drivers/gpio/gpio-rockchip.=
c
> > index 47174eb3ba76..bae2061f15fc 100644
> > --- a/drivers/gpio/gpio-rockchip.c
> > +++ b/drivers/gpio/gpio-rockchip.c
> > @@ -593,6 +593,7 @@ static int rockchip_gpiolib_register(struct rockchi=
p_pin_bank *bank)
> >       gc->ngpio =3D bank->nr_pins;
> >       gc->label =3D bank->name;
> >       gc->parent =3D bank->dev;
> > +     gc->can_sleep =3D true;
>
> This means all operations are marked as can_sleep, even though
> pinctrl operations are only used for the direction setting.
> I.e. the common get/set operations always worked in atomic mode,
> but now complain. See for example:
>
> https://lore.kernel.org/all/20260108-media-synopsys-hdmirx-fix-gpio-cansl=
eep-v1-1-3570518d8bab@kernel.org/
>
> It's not a big issue for the hdmirx driver specifically, but I wonder
> how many more (less often tested) rockchip drivers use GPIOs from their
> IRQ handler.
>
> Considering setting or getting the GPIO from atomic context is much
> more common than changing the direction - is there some way to
> describe the sleep behavior in a more specific way in the GPIO
> controller?
>

No, there's no such switch at the moment. This is because there are
paths that we can take, where we *do* end up setting direction from
gpiod_set_value(). For instance:

gpiod_set_value()
  gpiod_set_value_nocheck()
    gpio_set_open_drain_value_commit()
      gpiochip_direction_output()

I'm afraid, for correctness, it has to be either sleeping, or not. I
would love - at some point - to make pinctrl mostly lockless with
SRCU, like we did with GPIO. That would solve this issue correctly.
But until then, I'm afraid we need to keep a chip-global switch for
sleeping.

Bartosz

