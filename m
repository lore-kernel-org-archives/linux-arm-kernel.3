Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DE137CD6E79
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  8 Jun 2026 22:04:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Aij36kGKLQgOKTKFOm0ZH4SZ9YXAanS6oRbQ1zStX6Q=; b=kEKxeCmxlqYVrjKW/PZIhdBVeO
	X0WTyFT+xkBunDVUSQvyvMepwajacwLN1GZLVSX9gu+9IuZfJz3EZsMC+omiDEDtNpkCEIkYEJgKu
	AIvIhhPwVc7j1CO5jgep7/8ylUQ0qru1SxVu2q4/O8fTZZG/35fe6yMl4uWERgVf2rgRHDKPIikQu
	3AzFfs1irr8ha0CqY0O4q2U8SWPoD/3yV5foWQKW/OF6XFDkw1MOVgD+HaK+i+IY6Tqfn6odrczb3
	iPjePwtLA/ERGZhl6irvp32nXhm8XmBGGSeK5zChyOQ2kSjeRjRyjrXwIQxEILSzMFnWXdy7oJrnp
	QO0WaKxQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wWi4b-00000004TJE-227S;
	Mon, 08 Jun 2026 22:03:57 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wWi4a-00000004TJ7-3Cvq
	for linux-arm-kernel@lists.infradead.org;
	Mon, 08 Jun 2026 22:03:56 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 35A0244498
	for <linux-arm-kernel@lists.infradead.org>; Mon,  8 Jun 2026 22:03:56 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1BD351F00893
	for <linux-arm-kernel@lists.infradead.org>; Mon,  8 Jun 2026 22:03:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780956236;
	bh=Aij36kGKLQgOKTKFOm0ZH4SZ9YXAanS6oRbQ1zStX6Q=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=CA15y1NJElmg80HYv5sLM/kfa2jCdjk+qTyxpdOme8OofQZk+zipxPEdBIIInb/ke
	 DVur/hT3xjxpA9aK2+/jI2emXiTgUU0esjLW0xkEhufnGnLEhkgDD5MmVDa2tYACuD
	 lPfjr796FmKbOgwArLNtt/L/o3fhBWHA7A/teDhKLQ4n0RlPbbm/aySxJuA6cLmBsO
	 rQlM9HqoSQ3R+6ZlRZVXXL4Cq8w+a1TflL09poUsMsi8/xecxlvq1t1jA8hOsaG5QA
	 4KT4WynYGyBn4o+8rPXJ4NFJFjZdA5K6REgY0ahGLL9vbCFu39Pbd0XGTDK0xyYVfh
	 Wcag2S1XXVYxg==
Received: by mail-lf1-f50.google.com with SMTP id 2adb3069b0e04-5aa68d9d4a3so5248629e87.2
        for <linux-arm-kernel@lists.infradead.org>; Mon, 08 Jun 2026 15:03:56 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ/yk2qXAn6uKUKyekFar43PvvF4dywFqnEe8t6JtVr/EdsAInO90u+4bSTDEjKzXl+VmN6PlD6VeT1RLSOnhski@lists.infradead.org
X-Gm-Message-State: AOJu0YwOZ2eeCcwaLfQsmFSbzxDdRxmYze2KpUHJezXhxf/u1iZnWCoA
	k2xLdsJjf2gekaYDra+P7h931LDsqk9pSJfN6JsyJh6NenDrp7UFluDUTj4rFxpxKSqNVnKujtv
	7u8IytKQdfWhiEZsAQq5ttJLUEEJmJE0=
X-Received: by 2002:a05:6512:1153:b0:5aa:61ef:2bd8 with SMTP id
 2adb3069b0e04-5aa87b406e4mr6283189e87.4.1780956234723; Mon, 08 Jun 2026
 15:03:54 -0700 (PDT)
MIME-Version: 1.0
References: <20260525144629.498630-1-jerrysteve1101@gmail.com> <20260525144629.498630-3-jerrysteve1101@gmail.com>
In-Reply-To: <20260525144629.498630-3-jerrysteve1101@gmail.com>
From: Linus Walleij <linusw@kernel.org>
Date: Tue, 9 Jun 2026 00:03:42 +0200
X-Gmail-Original-Message-ID: <CAD++jLkyvwnrmBQ+YFo+UDvuMpMM+Z4fXyVOFXUvSNrnrCEsQw@mail.gmail.com>
X-Gm-Features: AVVi8CfrtViog8K60lVsdBejVduUSaoCk-bta_dOARz0lgQKhvxczOmqxd4dt3E
Message-ID: <CAD++jLkyvwnrmBQ+YFo+UDvuMpMM+Z4fXyVOFXUvSNrnrCEsQw@mail.gmail.com>
Subject: Re: [PATCH v2 2/6] leds: is31fl319x: Fix shutdown GPIO initial state
 and remove redundant startup pulse
To: Jun Yan <jerrysteve1101@gmail.com>
Cc: dmitry.baryshkov@oss.qualcomm.com, Lee Jones <lee@kernel.org>, 
	Pavel Machek <pavel@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>, 
	Andrew Lunn <andrew@lunn.ch>, Gregory Clement <gregory.clement@bootlin.com>, 
	Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>, Bartosz Golaszewski <brgl@kernel.org>, 
	Vincent Knecht <vincent.knecht@mailoo.org>, Grant Feng <von81@163.com>, 
	Andre Przywara <andre.przywara@arm.com>, Geert Uytterhoeven <geert+renesas@glider.be>, 
	Viresh Kumar <viresh.kumar@linaro.org>, Florian Fainelli <f.fainelli@gmail.com>, 
	Robert Marko <robert.marko@sartura.hr>, Pavel Machek <pavel@ucw.cz>, 
	Krzysztof Kozlowski <krzk@kernel.org>, Shawn Guo <shawnguo@kernel.org>, 
	Michal Simek <michal.simek@amd.com>, Heiko Stuebner <heiko@sntech.de>, linux-leds@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-msm@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-gpio@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
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

Hi Jun,

thanks for your patch!

On Mon, May 25, 2026 at 4:47=E2=80=AFPM Jun Yan <jerrysteve1101@gmail.com> =
wrote:

> -       is31->shutdown_gpio =3D devm_gpiod_get_optional(dev, "shutdown", =
GPIOD_OUT_HIGH);
> +       /* Driving this GPIO line low (in fact high) takes the chip out o=
f shutdown,
> +        * as it is flagged as GPIO_ACTIVE_LOW in provider (such as the d=
evice tree).
> +        */
> +       is31->shutdown_gpio =3D devm_gpiod_get_optional(dev, "shutdown", =
GPIOD_OUT_LOW);

This is fine but only if you also add a quirk to
drivers/gpio/gpiolib-of.c in of_gpio_try_fixup_polarity()
that will enforce the GPIOD_OUT_LOW property on the line.
Follow the examples.

This solves the API breakage.

It should probably be part of the same patch for bisectability.

Yours,
Linus Walleij

