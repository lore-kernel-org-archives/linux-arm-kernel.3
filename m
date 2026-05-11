Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 48BF8CD37AC
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 11 May 2026 09:11:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=x5wiOeBDPwB2ZmHPo+Xf48YhSufI9KGFW2hyKi2AKPw=; b=dCSvolLduhDSAJljMVSTWk01sx
	Wy6tX08i0LHg/BgvHNOSMZWY5SJqPc5poKRGucz4H4vwhXZlPQ4tQlvF4qQeXw0bVT42iz3YgXuWH
	0WU9b3sTNYlndr23Gt6YzL5XCjdcn9l6h092ThUIRPEOy4CF4wNtUikQBtqR+mGa2Y7cEgdPGuE5i
	XLlueGN/+gbqD8bP7gzFjUMaHjFspa8wvkDljbjoA/s9x2tRsvYVPVg0zp/zJ8YqGehxRIrsvRHgX
	a78LovHLtgLUTKi5wEaVi3w7K+WGyLGaf7AjwP7PV+GKK3tv/2KHEYylYWZYcTDE4EFrM+Gw29rTd
	D//8o45g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wMMfR-0000000Cr1N-1aV7;
	Mon, 11 May 2026 09:11:13 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wMMfP-0000000Cr0y-2wAA
	for linux-arm-kernel@lists.infradead.org;
	Mon, 11 May 2026 09:11:11 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id DA6E460120
	for <linux-arm-kernel@lists.infradead.org>; Mon, 11 May 2026 09:11:10 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 93125C2BCF7
	for <linux-arm-kernel@lists.infradead.org>; Mon, 11 May 2026 09:11:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778490670;
	bh=Rq8c6gQubM6Etwr4803ShCbdPyCxzJxyabdtEaWZpKo=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=CYPZc2YKKs3jzaGoP37LTFFB13cweGZWUs7fTQQcc0RJpJPDWuu+kBW55S3Ph/rpT
	 mS0t9sOoEPPXhcoSEX/IaLShoJw7thZNZyI0PnAhNOsr0bojBN/CzSZ+hVZWdkO1sH
	 br3r0WyMoZADRXJdUwwWdNHEh89+JI6nLufe8HZH4+dcHacz7PBAmmIWFrpuaY2J7X
	 0T7PmXSU5pYRSw4ycpxefqigKWePvToGA9AjX6Nbf+6Bdvos5EzUphKI/oxOOPO/Gg
	 DKmy47Fs4hTfkvVtDBRjPPLk7eje5fZjiB7uGJ3fvh1yxAjs2MvDXQEaZbAMmBJQsA
	 GPEfGuB0jvjYA==
Received: by mail-lf1-f45.google.com with SMTP id 2adb3069b0e04-5a525aedb24so4002341e87.2
        for <linux-arm-kernel@lists.infradead.org>; Mon, 11 May 2026 02:11:10 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ/c5yZky77yKA7Xdz+vE35iqdeNFE+GFPllbeYgEM3ir6My42QSyohsiV7eJ/LCbM9GsyUn5DFVsaOdgWpaRd9g@lists.infradead.org
X-Gm-Message-State: AOJu0Yxr0EmdSEhatVEIQvjl1lz6Am6AVAm5YIZ5oEf2xlI2KCmTT6hg
	SL9e2MtzpE2/6ATZRnqzvcAW2Q+zMO7e31Zx67sTtNzD7YVt7eIBO1cUa5sy9yywJwIp6t8WLUz
	uP0yo9H8ymUK5QZv18ioSiubx01KmK8U=
X-Received: by 2002:a05:6512:3b0d:b0:5a8:d3a3:598b with SMTP id
 2adb3069b0e04-5a8d3a35a8cmr588739e87.28.1778490669254; Mon, 11 May 2026
 02:11:09 -0700 (PDT)
MIME-Version: 1.0
References: <20260508152435.21389-1-jerrysteve1101@gmail.com> <20260508152435.21389-3-jerrysteve1101@gmail.com>
In-Reply-To: <20260508152435.21389-3-jerrysteve1101@gmail.com>
From: Linus Walleij <linusw@kernel.org>
Date: Mon, 11 May 2026 11:10:56 +0200
X-Gmail-Original-Message-ID: <CAD++jLk0BrV+MAh4n6+wAqNX+O8BcHcoehbX574F2_Vcm4qvGQ@mail.gmail.com>
X-Gm-Features: AVHnY4I9UpFMxLFtwpAb2IS6AOTYSN3VvmV0ICtP8Qkl_hlv_QQKJow__4PiAoU
Message-ID: <CAD++jLk0BrV+MAh4n6+wAqNX+O8BcHcoehbX574F2_Vcm4qvGQ@mail.gmail.com>
Subject: Re: [PATCH 2/5] leds: is31fl319x: Fix shutdown GPIO initial state and
 remove redundant startup pulse
To: Jun Yan <jerrysteve1101@gmail.com>
Cc: Lee Jones <lee@kernel.org>, Pavel Machek <pavel@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>, 
	Andrew Lunn <andrew@lunn.ch>, Gregory Clement <gregory.clement@bootlin.com>, 
	Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>, 
	Vincent Knecht <vincent.knecht@mailoo.org>, Grant Feng <von81@163.com>, 
	Andre Przywara <andre.przywara@arm.com>, Baruch Siach <baruch@tkos.co.il>, 
	Romain Perier <romain.perier@gmail.com>, Alexandre TORGUE <alexandre.torgue@st.com>, 
	Peter Rosin <peda@axentia.se>, Robert Marko <robert.marko@sartura.hr>, Pavel Machek <pavel@ucw.cz>, 
	Krzysztof Kozlowski <krzk@kernel.org>, Wei Xu <xuwei5@hisilicon.com>, 
	Paul Barker <paul.barker@sancloud.com>, linux-leds@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-msm@vger.kernel.org, linux-arm-kernel@lists.infradead.org
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

On Fri, May 8, 2026 at 5:26=E2=80=AFPM Jun Yan <jerrysteve1101@gmail.com> w=
rote:

> 1. Per IS31FL319x datasheet [1], the hardware shutdown pin (SDB) is
> active-low.

So that means that driving the line low will shut down the hardware.

> -       is31->shutdown_gpio =3D devm_gpiod_get_optional(dev, "shutdown", =
GPIOD_OUT_HIGH);
> +       is31->shutdown_gpio =3D devm_gpiod_get_optional(dev, "shutdown", =
GPIOD_OUT_LOW);

Add a comment here that this will in fact drive the line high,
because the GPIO line will be flagged as GPIO_ACTIVE_LOW
in the provider (such as the device tree).

At least write this in the commit message, it's a missing piece
that helps readers understand what is going on.

Have you checked any existing device trees so you don't
break something here?

If you're breaking platforms you may need a fixup in
drivers/gpio/gpiolib-of.c to force the consumer active
low for legacy device trees.

Yours,
Linus Walleij

Yours,
Linus Walleij

