Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 96529D2E9D3
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 11 Nov 2024 10:23:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=IaEOyMbaVWJTZKa+Sq5zT53vxz01/13ANVZcLosS5Ms=; b=30rIIh8VH+nbsRWQgeSzT4e4s8
	mTOJ+Jt0VrbK6FhEQ1VP7M4uSzTwtYqof8Jg+lbZ72si5h928O3O6JBF2rlyagsM0148aGTPQMNsg
	QMmbnYV2wb33Yq+X5SHLgskXy1NpsEFkr/jioblrYsdlVGPlaTKDraPime6e0HQuMrFzBoLePp4Gk
	PW4Pz2bFlr6JhYjiXMHsQnREM6XSgOc4gLhYTSFN7drhIRp9hAtWSrOSoxa4ovQDtzumRplpj1u68
	I6pJ9k/IX3YEE98/VHezI6aJ+mUAgsSGlAGl0n+xlOye9DYjZ7a73B6oPkt8oc/g20+Mu7lZEejil
	tBYFAY2A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tARZr-0000000HGI0-0UQc;
	Mon, 11 Nov 2024 10:23:23 +0000
Received: from mail-yb1-f171.google.com ([209.85.219.171])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tARY5-0000000HG7g-0QTA
	for linux-arm-kernel@lists.infradead.org;
	Mon, 11 Nov 2024 10:21:34 +0000
Received: by mail-yb1-f171.google.com with SMTP id 3f1490d57ef6-e333af0f528so3916019276.3
        for <linux-arm-kernel@lists.infradead.org>; Mon, 11 Nov 2024 02:21:32 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731320489; x=1731925289;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=IaEOyMbaVWJTZKa+Sq5zT53vxz01/13ANVZcLosS5Ms=;
        b=h9VKKOxa/3S2HB7NbHs9aCPaApP8URB/Dg4nn3r835m8VVlKboSuD1/LlNbsQRmkSk
         EQlCcKuHoIcRQEunW/WVRYY1eKEkNk5bbork4jeBysjLvWCQ409TI8FPxx3LVZOv09My
         xfNciIwCz+iJ/n92PL7o2/dlPzDWxeaCD1EXKzDVgkjuszPuPS83oKgV+o9yaYAkxdgF
         ToT603jxjG8RIVRNiUSkETi6pQ+iYRMqwgZTrQeJ/GyV4qUECTYOHi1C6Ud9p1Yw0SQe
         Th5gTzBQlM5HM+3b1TI+Xy8n1kqTgMPyYiir9hY7ouP2+XkCGQP/iwdNGxuGaXO+BMiy
         cf5Q==
X-Forwarded-Encrypted: i=1; AJvYcCXP9a2iu8JuTL+IK8f2PlYEubFBKuwoXk/CPwFA8kbuPik2YEWvopvimKEv3xE7iCk+P6v0k9K8ZFfq5+8BTXjK@lists.infradead.org
X-Gm-Message-State: AOJu0YzlX6pHl5Vj1wZIlX8RyAuM/h5By2YKtsfXkQwpKcquhBxZywAY
	1Zq4poIMd5aseywljTZ0+i9h+JYuIzcxSN+zLRd6EYO8PP8fXLvxfCJJkmg3
X-Google-Smtp-Source: AGHT+IH5YlOKH9xqp/XhKru7hL/xZG0Q6+2qja9V6Zv6It4F6qgs5JbEGHUTYrwV9BtCMs9S9kyLFQ==
X-Received: by 2002:a05:6902:1693:b0:e25:70c:ecde with SMTP id 3f1490d57ef6-e337f8f48ddmr7958972276.52.1731320489578;
        Mon, 11 Nov 2024 02:21:29 -0800 (PST)
Received: from mail-yw1-f172.google.com (mail-yw1-f172.google.com. [209.85.128.172])
        by smtp.gmail.com with ESMTPSA id 3f1490d57ef6-e336ee196d5sm2118955276.10.2024.11.11.02.21.27
        for <linux-arm-kernel@lists.infradead.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 11 Nov 2024 02:21:28 -0800 (PST)
Received: by mail-yw1-f172.google.com with SMTP id 00721157ae682-6ea07d119b7so33826497b3.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 11 Nov 2024 02:21:27 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCWmihBlL8Yuptk9XNi3pWoorswNCJGkUjBmifRy9xNre6GTICbimrQAfkSu+S49QVbt5ML+u9ziYtZj1OdKD0KR@lists.infradead.org
X-Received: by 2002:a05:690c:6288:b0:6e5:9cb7:853c with SMTP id
 00721157ae682-6eaddf6f2cemr115795827b3.31.1731320487426; Mon, 11 Nov 2024
 02:21:27 -0800 (PST)
MIME-Version: 1.0
References: <20241104093609.156059-1-andriy.shevchenko@linux.intel.com>
 <20241104093609.156059-4-andriy.shevchenko@linux.intel.com>
 <CAMuHMdXx6hYsdKo-5sw+-vH7GOJYWn_de=wSvhj1QVVpbwCN7Q@mail.gmail.com> <ZzHU4absCxcA1FBG@smile.fi.intel.com>
In-Reply-To: <ZzHU4absCxcA1FBG@smile.fi.intel.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 11 Nov 2024 11:21:15 +0100
X-Gmail-Original-Message-ID: <CAMuHMdVsjfSCcdVQee6tFgvs6PDB+iKWd964XhHKmF9WRDHWkA@mail.gmail.com>
Message-ID: <CAMuHMdVsjfSCcdVQee6tFgvs6PDB+iKWd964XhHKmF9WRDHWkA@mail.gmail.com>
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
X-CRM114-CacheID: sfid-20241111_022133_164542_3036EDFF 
X-CRM114-Status: GOOD (  27.59  )
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

On Mon, Nov 11, 2024 at 10:57=E2=80=AFAM Andy Shevchenko
<andriy.shevchenko@linux.intel.com> wrote:
> On Mon, Nov 11, 2024 at 10:45:13AM +0100, Geert Uytterhoeven wrote:
> > On Mon, Nov 4, 2024 at 10:37=E2=80=AFAM Andy Shevchenko
> > <andriy.shevchenko@linux.intel.com> wrote:
>
> ...
>
> > > -       if (template->active_low)
> > > -               flags |=3D GPIOF_ACTIVE_LOW;
> > > -
> > > -       ret =3D devm_gpio_request_one(dev, template->gpio, flags,
> > > +       ret =3D devm_gpio_request_one(dev, template->gpio, GPIOF_OUT_=
INIT_LOW,
> > >                                     template->name);
> >
> > Just wondering, as I am not 100% sure: can this change change the
> > initial state of the GPIO?
>
> You probably wonder how ACTIVE_LOW affects the OUT_INIT_LOW given above.
> I have an answer to you, however I might be mistaken as well, but I spent=
 some
> time to investigate.
>
> The above mentioned call ends up in the gpiod_direction_output_raw_commit=
() which
> uses the value (low in this case) as an absolute value. It does not inclu=
de the
> ACTIVE_LOW in the value calculations. Hence, setting ACTIVE_LOW before or=
 afterwards
> has no effect on the existing flow.
>
> If you notice a mistake, please elaborate this, so I can fix the approach=
!

Thanks, I had discovered the same, but wanted to double-check!

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

