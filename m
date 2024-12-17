Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BD39EE7717F
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 17 Dec 2024 13:40:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=HMjCYKV984QoRr28xf3w0OYwbaOYhzni2D5iyXZ+XqY=; b=wW/9QUaPkI0qAcsdYnDX9pk83P
	IXMkpZOgyAviT1m1PQsKC0fX84xb9DhetV5D0vcWe9aGvzQhfyUAoMgcnd+6ALIIQFFjvtVqapdRu
	+PBsyJwqPfvTxFGdAbx45LsHzF9QMBietujT2Mo3bgi3KPlzY9ZO6Bob/P9xY0oColfN/LBxRgRYu
	YZfYzlcPu/p1exhtkRDwI28BBSPE8onsuvASAyZA6YZnL16GfS5Qps/PPbMwFfrAbgOJcWhQSyjh0
	hDJN9aH9Ba6ZOUVB39nWNekwhBYHqocoYV/ClMM4AaIGG8FyGx07Bgk0IEdwR+Sn7rCCCuDLri5vT
	KH81m+nQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tNXoG-0000000DcDS-0NGS;
	Tue, 17 Dec 2024 13:40:24 +0000
Received: from mail-lf1-x131.google.com ([2a00:1450:4864:20::131])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tNXnA-0000000Dc0Z-1iLt
	for linux-arm-kernel@lists.infradead.org;
	Tue, 17 Dec 2024 13:39:17 +0000
Received: by mail-lf1-x131.google.com with SMTP id 2adb3069b0e04-54025432becso5303978e87.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 17 Dec 2024 05:39:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1734442755; x=1735047555; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=HMjCYKV984QoRr28xf3w0OYwbaOYhzni2D5iyXZ+XqY=;
        b=slNM/HyoxZMXr53KLk0RuFIOQOd4ejGNIVhr683xj3U6TQrO23LSkDqN5+YV04DMVr
         ItnbLkNn+PSNWn+dGgTTC4W1AhQ8oaWTU1fQIY9BTNr/23uFvw7yUH7pLpily4TKGSe6
         ZtyIe+hHTHoN6jonQzmLPFetRhH2rq6zJCK08kb+BhmRb0mCC20uKT20LaHldkS3h9c8
         YO3VdrXVkQfvO3rAC+tycgldjwPd/kv+GL3H9EldkRsXsgYyboZYhmV2RxOnAxU/5Acb
         ySdjdulcg394qr6ZZww4jmjQL3B2hTkHIgDDVaY5eVi9wn6r3Trkx7mE3AJXFtAo/fXh
         ZTGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734442755; x=1735047555;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=HMjCYKV984QoRr28xf3w0OYwbaOYhzni2D5iyXZ+XqY=;
        b=cIErZnmODFklXSLUnb6k7LvQoXPE459fjlmRlC+qn6D1C1FBT6Kzpz8IMop9/cjedh
         bsS2Zo0ZOFkxFi0CdfyjSY3QGGZMJzWYna2440A87Cp40b6d968Lhm3zTpy6fE75NDnt
         +tth9zdiKXXEugtMA3mMCspaHr0QVVxAKiXASp68bqNIYFk6ekcTyWiqO/J0s0HxmNEx
         lIVHYtY4DB8rinkzYPQ98rJfo0bYE13edGXIsa0OxKp0khJhf+LGckloa3M/+qfoAkBh
         SUvYwuDxwO6LJC4HR9QHlMyF7BxNM3cAe3k9Uwn6SCb72g3ZtATzq2nSoagF+ahWXxYp
         dOWA==
X-Forwarded-Encrypted: i=1; AJvYcCUo8AtAE92ufWJctcU4hTBTqZ4cbq09ExnEZsPudSNHuhBrWOFaVxjzYTWKD89ZXfIJegLAsY804dKmB2cxrwKF@lists.infradead.org
X-Gm-Message-State: AOJu0YzYDzSfhmKnGchkjf4mhLpUW+H50E2AC9pcMmY0YYuc0Q+3etMV
	ZwHlETi//uWfkHAFWLI0UVktba4RNotfcau0XWBaVm8mNfjIGvu56DWM1rYaE44w8h0uSEIKWRC
	xbMAbCurUIq3ICP7aA1n8le5k66dA4EpX1UXeBg==
X-Gm-Gg: ASbGnctgjnJg/f0Qh2DsMGWjxYCA6g5OWkHhPp25x7FQq0PnajTS+fFJrsGLuaFD4SK
	DvFfkziXcr2EM5UqLO3b6i+tkQEKsXbo1XLETWw==
X-Google-Smtp-Source: AGHT+IEjrp870JNskf6bHNzYI2aNmKqs1NPMelQxcm9rfeKc8LyEkX5SdkkUq1R1luqQe2P7T5643ul/B1u9O9Mw0vc=
X-Received: by 2002:a05:6512:1287:b0:540:1ca7:4fe9 with SMTP id
 2adb3069b0e04-5409054e4b0mr4948477e87.22.1734442754678; Tue, 17 Dec 2024
 05:39:14 -0800 (PST)
MIME-Version: 1.0
References: <20241119140805.3345412-1-paulk@sys-base.io> <20241119-prudent-jasmine-lizard-195cef@houat>
 <ZzyoIABRArkGoZBn@collins>
In-Reply-To: <ZzyoIABRArkGoZBn@collins>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Tue, 17 Dec 2024 14:39:03 +0100
Message-ID: <CACRpkdbqufNVq4Ai6GQpgK2OY0rxLnp1wLQNmRoCv44T0xmFkQ@mail.gmail.com>
Subject: Re: [PATCH] pinctrl: sunxi: Use minimal debouncing period as default
To: Paul Kocialkowski <paulk@sys-base.io>
Cc: Maxime Ripard <mripard@kernel.org>, linux-arm-kernel@lists.infradead.org, 
	linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org, 
	=?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig?= <ukleinek@kernel.org>, 
	Chen-Yu Tsai <wens@csie.org>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
	Samuel Holland <samuel@sholland.org>, Paul Kocialkowski <contact@paulk.fr>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241217_053916_456768_9F0D9E1C 
X-CRM114-Status: GOOD (  20.71  )
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

Some discussion here, and some emotions involved.

I can't seem to follow the technical matter because of all the
social matters :/

On Tue, Nov 19, 2024 at 4:00=E2=80=AFPM Paul Kocialkowski <paulk@sys-base.i=
o> wrote:

> My use-case here was hooking up a sparkfun sensor board by the way,
> not some very advanced corner-case.

Are you adding this as a DT overlay or by modifying an existing device
tree? Does this sensor have an established device tree binding?

Are you using that sparkfun sensor by a kernel driver or from userspace
using the GPIO character device?

I noticed that the sunxi GPIO driver is implementing the
.set_config() callback calling gpiochip_generic_config,
which makes it call down to the pin control driver to set up
the pin config.

which would in turn make it eligible to use
the gpiod_set_debounce() callback to push down the debounce
period.

But pinctrl-sunxi.c's sunxi_pconf_set() does *NOT* implement
support for setting up the debounce, because it is (as I understand
it) not part of the pin config hardware, but part of the interrupt
generator hardware, correct?

In that case I think we the gpiochip .set_config() callback should
be modified something like this (pseudo code):

sunxi_pinctrl_gpio_set_config()
{
    if (irq_is_in_use && param_is_debounce) {
        modify_irq_debounce_according_to_param()
        return 0;
    }
    gpiochip_generic_config()
}

pctl->chip->set_config =3D sunxi_pinctrl_gpio_set_config()

Maybe the debounce can also be set even if the line is not used
for IRQ? I'm not sure.

In either case the latter would give the GPIO driver a handle
on the debounce, which is good because the irqchip
generally does not.

There is a way it is possible to use the interrupt with desired debounce
setting by first getting the GPIO descriptor and modify the debounce
setting and then getting the interrupt from the GPIO descriptor:

struct gpio_desc *g;
int irq;

g =3D gpiod_get(dev, "dataready", GPIOD_IN);
gpiod_set_debounce(g, 1);
irq =3D gpiod_to_irq(g);
...request irq...

Here I assume the line out from the sensor is named "dataready"
the actual component likely has a name like that for the line.

This requires changes in the device tree as well, so that a GPIO
line is assigned to the sensor instead of "just" an interrupt:

sensor {
  dataready-gpios =3D <&gpio 14>;
  ...
};

instead of:

sensor {
  interrupt-parent =3D <&gpio>;
  interrupts =3D <14 IRQ_TYPE_EDGE_RISING>;
};

Unfortunately this is one of the areas where DT bindings are
a bit ambiguous. Some just assign the GPIO line as an interrupt
as both APIs are available, sometimes a proper GPIO line is
preferred for the above reasons.

Yours,
Linus Walleij

