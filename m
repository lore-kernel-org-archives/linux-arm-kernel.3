Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5B4EDC369B2
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 14 Apr 2025 12:26:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ac6H1/o/h+9u2eKjIhXkLMaofu5biYHSL+e4b7ZsNoc=; b=Q1R6l8nvEnf/WzbVnEOSLXKUYf
	Hblmx76KER62eVZ2tq4+D2QQ1PQoG7TYrR4iMSUmKSON+D9q02qy3D9g6BceOIxI2ubaEiq+KYz4H
	fGkTIrWC4OaU2eud/uCPYO2JetQ50ZQE9UfF2Xt4m98swjhg13E87pUgaXb2rSdER1YN3YKdQTAMJ
	pgnzteORqa7S/keMdjzDdNWiuxuEZTCyt5bMy7f82h/cFyxnBTDwP3yLVmevoH0+m1ccHs2eUxMT3
	ym2k7iGw+PNvm1dfGwxwHb1dlxVE5HimFzLRexWMJBC8bho1JLPWV109jNInhYlmPpph538hHGKRa
	L4BcCiIg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u4It0-00000001wAF-2wMO;
	Mon, 14 Apr 2025 12:26:02 +0000
Received: from mail-ua1-x933.google.com ([2607:f8b0:4864:20::933])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u4If6-00000001tvy-0h3f
	for linux-arm-kernel@lists.infradead.org;
	Mon, 14 Apr 2025 12:11:42 +0000
Received: by mail-ua1-x933.google.com with SMTP id a1e0cc1a2514c-86b9a1466c3so166815241.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 14 Apr 2025 05:11:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744632699; x=1745237499; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ac6H1/o/h+9u2eKjIhXkLMaofu5biYHSL+e4b7ZsNoc=;
        b=eaAifMDRAA5oC7IE/XK71VsTs5q+Oyrgos4R+wFTmnXVAU3BRFL60h8u0FwhIiwQzn
         HM424zV4UVl5mnJF8vkDlJ1r0PRMoQVeo2AtQ9oF4KQG/It899MvJgGi6rXQUIy56FVx
         esBYMUHYttImSUPsOeIf84lWxilnjtFEBqJbjudIe/99m4K2fAABFMqW+ad/EXbgHSs9
         kRwYIfd93ZJcOGoBbt0CisDpTWRu/+N6mjdoTsUfkRcFYVvKtodr/RFb8/xmbs3wtH7h
         25ARbBCz9n2Z/7HcA92atasFZyo6hQsKIji2b7AFdQA2xIoJE9O4vs7mfa6+rk9HNuPm
         2IOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744632699; x=1745237499;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ac6H1/o/h+9u2eKjIhXkLMaofu5biYHSL+e4b7ZsNoc=;
        b=vDfkzVDskdScX00dbMeAIvl/keJz0rvDw53dxDQqiYPOzH9El3wRWnlcYDJy/kIVuH
         CNRF3eH58Y73HjmmNSbFWiSPc4Da+Pw3yi/fuyxt/5kuOLR+an1akF/0ND3PdWKr/jJf
         fOOlaINoz6p4uqMkrGa0vD5ZccHzoHZ3u+jmCsbqOV7XyB2dqeq0pGHl0v2HCBy70/cm
         LOEIczVRtm2N/t0lzGnnO9kXkoUPrkdujj7+rsfcPZqv3HEdaOFfsa2cRWtw5v71i931
         zS28jdkURWrOU1lrwZNrQJZf9HmkuZ4Dz0SwvScN3cpbTEEk5QTlbIqSLLs2a0FFp1cJ
         xdCg==
X-Forwarded-Encrypted: i=1; AJvYcCUI1TXHsZdDFG27I/ui93huBfo5dmf3zf4GS7//y3+6+Op2aiiyLf3iTD/Rp0xh78yuYM/kt++/4r4Bb1IyITKw@lists.infradead.org
X-Gm-Message-State: AOJu0YxUqKyVowWujoo9RyR1ORCBFb24yhEf8oz98f8nsTStOKJtRd9f
	rtfzZcSAx6aQ0J25IjfpPa9ZTnVISj9qRfRMufwVq3mHptbr0/no24+cn2aJ+eiXqvKqZj+updO
	lamb2wSCauJ1W99oaMSDgXeymaw==
X-Gm-Gg: ASbGnctVpix7Ir3zKQFFHuQFFHIFrwz9W5cFL9rr6pKcw+Y41eNcXZrhN6n1xOcjYz/
	RrjRLAU1KLmB8URKydCn3UlSQJpHxJBtEKHjv7T8aQunQRAsiMMayi4Jjw5wnV4Mc+7gWxNMEcf
	Kp14ibBfmWC5MMWfzJPfPdt4s=
X-Google-Smtp-Source: AGHT+IF+TKucMPytpTJ5R+CA8NEB5VA18YC7dTPTBjoM8fCHrXGk3NfE5eJA70tng973CAZHmwTuo9mPRPDMashJT88=
X-Received: by 2002:a05:6102:568c:b0:4c1:8047:e002 with SMTP id
 ada2fe7eead31-4c9e4ebb690mr2539916137.1.1744632698529; Mon, 14 Apr 2025
 05:11:38 -0700 (PDT)
MIME-Version: 1.0
References: <20250412193153.49138-1-chenyuan0y@gmail.com> <D9694O0MKV31.3SY6ZCTSKXWI9@bootlin.com>
In-Reply-To: <D9694O0MKV31.3SY6ZCTSKXWI9@bootlin.com>
From: Chenyuan Yang <chenyuan0y@gmail.com>
Date: Mon, 14 Apr 2025 07:11:27 -0500
X-Gm-Features: ATxdqUEmzNKqNy2VeDRm0Ya7G52O07CobBBqgfreeKbyqmOiDNlMjis513mrcFY
Message-ID: <CALGdzurLWayryjUEdSy4iuHAgFO=RA=HN=u+BZY96JqESKvi+A@mail.gmail.com>
Subject: Re: [PATCH] gpio: nomadik: Add check for clk_enable()
To: =?UTF-8?B?VGjDqW8gTGVicnVu?= <theo.lebrun@bootlin.com>
Cc: linus.walleij@linaro.org, brgl@bgdev.pl, 
	linux-arm-kernel@lists.infradead.org, linux-gpio@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250414_051140_207787_80762EBD 
X-CRM114-Status: GOOD (  27.55  )
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

On Mon, Apr 14, 2025 at 4:24=E2=80=AFAM Th=C3=A9o Lebrun <theo.lebrun@bootl=
in.com> wrote:
>
> Hello Chenyuan, Linus, Bartosz,
>
> On Sat Apr 12, 2025 at 9:31 PM CEST, Chenyuan Yang wrote:
> > Add check for the return value of clk_enable() to catch
> > the potential error.
> >
> > This is similar to the commit 8332e6670997
> > ("spi: zynq-qspi: Add check for clk_enable()").
> >
> > Signed-off-by: Chenyuan Yang <chenyuan0y@gmail.com>
> > Fixes: 966942ae4936 ("gpio: nomadik: extract GPIO platform driver from =
drivers/pinctrl/nomadik/")
> > ---
> >  drivers/gpio/gpio-nomadik.c | 5 ++++-
> >  1 file changed, 4 insertions(+), 1 deletion(-)
> >
> > diff --git a/drivers/gpio/gpio-nomadik.c b/drivers/gpio/gpio-nomadik.c
> > index fa19a44943fd..dbc4cdddf4df 100644
> > --- a/drivers/gpio/gpio-nomadik.c
> > +++ b/drivers/gpio/gpio-nomadik.c
> > @@ -262,8 +262,11 @@ static unsigned int nmk_gpio_irq_startup(struct ir=
q_data *d)
> >  {
> >       struct gpio_chip *gc =3D irq_data_get_irq_chip_data(d);
> >       struct nmk_gpio_chip *nmk_chip =3D gpiochip_get_data(gc);
> > +     int ret;
> >
> > -     clk_enable(nmk_chip->clk);
> > +     ret =3D clk_enable(nmk_chip->clk);
> > +     if (ret)
> > +             return ret;
> >       nmk_gpio_irq_unmask(d);
> >       return 0;
> >  }
>
> Returning a negative value whereas the ->irq_startup() [0] return value
> is an unsigned int? From some quick godbolt testing and briefly reading
> the spec it looks safe to do a round trip (signed->unsigned->signed),
> though not ideal to my eyes.
>
> The caller is __irq_startup() [1].
>
> As for why irq_startup returns an unsigned int, I am unsure. The kernel
> Git history isn't enough to know more. The startup field in struct
> hw_interrupt_type appeared on v2.3.14 [2], so no commit message to
> explain decisions.
>
> Seeing the __irq_startup() code, my proposal would be to turn the return
> value to a signed int, but I haven't exhaustively checked codepaths.

Good catch! I agree that using a signed int could be a better option.

Dear Linus and Bartosz, could you please share your thoughts? If
you=E2=80=99re on board with the change, I=E2=80=99ll go ahead and send a n=
ew patch.

> Thanks,
>
> [0]: https://elixir.bootlin.com/linux/v6.13.7/source/include/linux/irq.h#=
L503
> [1]: https://elixir.bootlin.com/linux/v6.13.7/source/kernel/irq/chip.c#L2=
44
> [2]: https://elixir.bootlin.com/linux/2.3.14/source/include/linux/irq.h#L=
21
>
> --
> Th=C3=A9o Lebrun, Bootlin
> Embedded Linux and Kernel engineering
> https://bootlin.com

-Chenyuan

