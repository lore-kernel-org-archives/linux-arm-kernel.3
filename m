Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EE2FBD2E9CD
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 11 Nov 2024 09:48:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=NG3w6IoKtjFw3GDAzprXMtFGp5ZzUMYeN9BzuAyCT4k=; b=f/FokKzFmvWIp1PUxxJKwrbGdF
	VPXX86Dz9KDzycn5CfUIf1mXyMviZ3vmp0+NH5UjMbjJdMgO5vP8Mv4LP6H7aN7yWIvLB/qAtdNZO
	7ekFvE1fGEaY/ohFzIFm/pOqylkxylaJYjOCfYn4aR0pYiDWol65kFTbeQQNGv4n5bxJ3IufqgG98
	oDsVH4ZvWELaqY8elH4ip8PKTFknD7cWkjyj6xI1RSg0lMZbUtAmIxVx3KSuRJbeUNUrn0ZHK8djo
	vy0d2A89IVYFUorvqJx4jvQz0zP9KVoCqq+NmP9THu7WOZZs2JsOy40WAJc/7n6wYz0h4a4ZysK6M
	8BjGhBpA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tAR2K-0000000HAm5-3yQI;
	Mon, 11 Nov 2024 09:48:44 +0000
Received: from mail-yb1-f178.google.com ([209.85.219.178])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tAQzE-0000000H9yV-0Q1d
	for linux-arm-kernel@lists.infradead.org;
	Mon, 11 Nov 2024 09:45:34 +0000
Received: by mail-yb1-f178.google.com with SMTP id 3f1490d57ef6-e29327636f3so3988726276.2
        for <linux-arm-kernel@lists.infradead.org>; Mon, 11 Nov 2024 01:45:31 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731318329; x=1731923129;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=NG3w6IoKtjFw3GDAzprXMtFGp5ZzUMYeN9BzuAyCT4k=;
        b=L1oAgxMkT21GicOj8xB5ig0FrCPudq8bzWOsXBg6j5shpd9AsglDEWDeMFTXjHZCwj
         ufXvpxVoFeVzl+CM//XOqHDwZRZnGyD672S9Cu9cbiop5BsYBB9zUyOEA+v1n7mcms3w
         hK0rAK/PvmY9PB0IfHsnwfKbA9PpkG4TL3Atfqg5fIqClgdJOCkgYIpsXLhbI1Cm35KF
         yPtwFqDUpwwrQsTseqSbmDD7cVBUD5Jj3RXCDv2pdH0zpEtTADqGPBwj9z8r6rEm/hJE
         mrvEU5Ida0BxeQuc+xRDqvjbUYNhHax4HIbGAUQ9qPE95hQIh8J5mFENkxUYw5rCQT8d
         DXug==
X-Forwarded-Encrypted: i=1; AJvYcCUI380UWRFWL/H3nBz3GRjVAcQROss/03tDrKlbhrue24238to9cdpYqMo0jiwFeJf6Egn6WsVUrK+LN2KSMQKc@lists.infradead.org
X-Gm-Message-State: AOJu0YwBvTLcupdSngl60f3UUz5iwa6snoKBK/nNmNamQROcYMpmGPk6
	+TniLk+Z/sLrAV7zO/2hFCy/PPeTE+JY8Jc6wJ8XYRA/crMSYZ2LWb6qu0rc
X-Google-Smtp-Source: AGHT+IGtNs1uAZUA6U3mM0+Vk5oRBTspg2MRUlJd75d1lrnS94xG3h9m2ks0wBHEITDCzBKbCjp8Mw==
X-Received: by 2002:a05:6902:188a:b0:e28:6b10:51b4 with SMTP id 3f1490d57ef6-e337f8eb50emr12412465276.46.1731318328693;
        Mon, 11 Nov 2024 01:45:28 -0800 (PST)
Received: from mail-yb1-f172.google.com (mail-yb1-f172.google.com. [209.85.219.172])
        by smtp.gmail.com with ESMTPSA id 3f1490d57ef6-e336ef4a9e9sm2167833276.34.2024.11.11.01.45.26
        for <linux-arm-kernel@lists.infradead.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 11 Nov 2024 01:45:26 -0800 (PST)
Received: by mail-yb1-f172.google.com with SMTP id 3f1490d57ef6-e30eca40dedso4118892276.3
        for <linux-arm-kernel@lists.infradead.org>; Mon, 11 Nov 2024 01:45:26 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCU5aGGjbO/v/dh5X0HFv2Y5ig3Xi8dY6xNKsjpTOKpWnE+/fEZpCz3kadQCuT6xICH8u3I3Wuoig9f1vOLajDBF@lists.infradead.org
X-Received: by 2002:a05:690c:6f83:b0:6ea:c928:771 with SMTP id
 00721157ae682-6eaddf7ffabmr110486467b3.28.1731318326288; Mon, 11 Nov 2024
 01:45:26 -0800 (PST)
MIME-Version: 1.0
References: <20241104093609.156059-1-andriy.shevchenko@linux.intel.com> <20241104093609.156059-4-andriy.shevchenko@linux.intel.com>
In-Reply-To: <20241104093609.156059-4-andriy.shevchenko@linux.intel.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 11 Nov 2024 10:45:13 +0100
X-Gmail-Original-Message-ID: <CAMuHMdXx6hYsdKo-5sw+-vH7GOJYWn_de=wSvhj1QVVpbwCN7Q@mail.gmail.com>
Message-ID: <CAMuHMdXx6hYsdKo-5sw+-vH7GOJYWn_de=wSvhj1QVVpbwCN7Q@mail.gmail.com>
Subject: Re: [PATCH v1 3/6] leds: gpio: Avoid using GPIOF_ACTIVE_LOW
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>, 
	Dmitry Torokhov <dmitry.torokhov@gmail.com>, Tony Lindgren <tony@atomide.com>, Lee Jones <lee@kernel.org>, 
	linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-input@vger.kernel.org, linux-leds@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-usb@vger.kernel.org, 
	Linus Walleij <linus.walleij@linaro.org>, Bartosz Golaszewski <brgl@bgdev.pl>, Pavel Machek <pavel@ucw.cz>, 
	Dominik Brodowski <linux@dominikbrodowski.net>, Daniel Mack <daniel@zonque.org>, 
	Haojian Zhuang <haojian.zhuang@gmail.com>, Robert Jarzmik <robert.jarzmik@free.fr>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241111_014532_159836_367F9E48 
X-CRM114-Status: GOOD (  21.68  )
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

Hi Andy,

On Mon, Nov 4, 2024 at 10:37=E2=80=AFAM Andy Shevchenko
<andriy.shevchenko@linux.intel.com> wrote:
> Avoid using GPIOF_ACTIVE_LOW as it's deprecated and subject to remove.
>
> Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>

Thanks for your patch, which is now commit e6a2f0ea519fd247
("leds: gpio: Avoid using GPIOF_ACTIVE_LOW") in gpio/gpio/for-next.

> --- a/drivers/leds/leds-gpio.c
> +++ b/drivers/leds/leds-gpio.c
> @@ -212,7 +212,6 @@ static struct gpio_desc *gpio_led_get_gpiod(struct de=
vice *dev, int idx,
>                                             const struct gpio_led *templa=
te)
>  {
>         struct gpio_desc *gpiod;
> -       unsigned long flags =3D GPIOF_OUT_INIT_LOW;
>         int ret;
>
>         /*
> @@ -239,10 +238,7 @@ static struct gpio_desc *gpio_led_get_gpiod(struct d=
evice *dev, int idx,
>         if (!gpio_is_valid(template->gpio))
>                 return ERR_PTR(-ENOENT);
>
> -       if (template->active_low)
> -               flags |=3D GPIOF_ACTIVE_LOW;
> -
> -       ret =3D devm_gpio_request_one(dev, template->gpio, flags,
> +       ret =3D devm_gpio_request_one(dev, template->gpio, GPIOF_OUT_INIT=
_LOW,
>                                     template->name);

Just wondering, as I am not 100% sure: can this change change the
initial state of the GPIO?

>         if (ret < 0)
>                 return ERR_PTR(ret);
> @@ -251,6 +247,9 @@ static struct gpio_desc *gpio_led_get_gpiod(struct de=
vice *dev, int idx,
>         if (!gpiod)
>                 return ERR_PTR(-EINVAL);
>
> +       if (template->active_low ^ gpiod_is_active_low(gpiod))
> +               gpiod_toggle_active_low(gpiod);
> +
>         return gpiod;
>  }

Gr{oetje,eeting}s,

                        Geert

--=20
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k=
.org

In personal conversations with technical people, I call myself a hacker. Bu=
t
when I'm talking to journalists I just say "programmer" or something like t=
hat.
                                -- Linus Torvalds

