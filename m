Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E4A48FC9EC8
	for <linux-arm-kernel@archiver.kernel.org>; Sun,  8 Mar 2026 14:07:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ybwlFGWJ/llnHtSifoqw116w/8nVUP+Gp/FI5y61+oA=; b=fjQqNVz3OYA0he
	P7AVQIRLHEn94FF20WXcYu2gnIRh9KYk6t9nn1w6DGPldbUdW/4bphc0W/t5YvvQffkzNuMQRUXbj
	+bMZWcPnry21WEIvKHeLjmJ72la+I7EBk6LKq1x7w2GIe79gii8p62pzC5CYo3ltYghfZw1GJdgsV
	BBcUCvRuo6SvwLrUbAc1ZiwQcjWImTWTOwuThGK0QdYjBxtunaZjzKhFxcnyM0t3GPMDXiI0L9xwl
	qQce3DkqtjQQY6hPFe7tgCdJ+orcWGL29YYswG8dY9huC9JX/UfHBn8veay8vMMuLt4mw5KaCQ7Gu
	eSSAXJPDQTVQmmTtUEEg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vzEmb-00000006556-1gw1;
	Sun, 08 Mar 2026 14:07:01 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vzEmY-0000000654d-0OPg
	for linux-arm-kernel@lists.infradead.org;
	Sun, 08 Mar 2026 14:06:59 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id D5C0E444EF
	for <linux-arm-kernel@lists.infradead.org>; Sun,  8 Mar 2026 14:06:54 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A6839C2BCB8
	for <linux-arm-kernel@lists.infradead.org>; Sun,  8 Mar 2026 14:06:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772978814;
	bh=1w83uARMWyGYvc/JmuNnyMOi7ETtApPzlejCC63kRgI=;
	h=References:In-Reply-To:Reply-To:From:Date:Subject:To:Cc:From;
	b=UalE9LU/eZgvrRqA+FuYt5n9XFHboNIf9MT5oyXSZp4P1qumjycdbefhOxZtLm3DG
	 z2QrLCRWoUMsG29GtKFgoImaQUQoIn7uWJKy3oC1KJhpe1Nvh4mcKG9E+eONPTJw1x
	 kY+kY1/ojnUF3odnJ+bYsiOErkNb5TaObkOH7wiQ/Yptz+haYYv8lok0BwOAwq//bW
	 SjtjwfK64JWRT/zXHJ/CO66AoOZOgrlymTFYC+KQR8GIDhRb16bxhIhaRLtIs67QUU
	 +C0MKojQyMYwkBuyD6aDOWcbnUHlXTXRmsK4FWgkocXMquqpM2P5E3avJ15hx9cG7D
	 bgPRiYTiu13NQ==
Received: by mail-lj1-f178.google.com with SMTP id 38308e7fff4ca-38a3066b68bso48274141fa.3
        for <linux-arm-kernel@lists.infradead.org>; Sun, 08 Mar 2026 07:06:54 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCXqp1iOJTmSbEyzMB6jVNUfwMetK0GI4G9z7mV/hV/uENmqOqMzVXNXpfRO+8lplp3Ysx0araD8UXel/U6bvIBt@lists.infradead.org
X-Gm-Message-State: AOJu0Yyb5JlqPQQ4iDa81gzvdhvW6xrZtgaJP+YVUafQsqkYmaflY8JY
	W+iixpoz31NoNgA9wSAPg7aaUuT1rRvGuJ+k0BpUtdX9z8DhnQ18BW3LIguGy02sIyG4sV1NkbW
	pKnc55us95F5ZrjS36ODbgVXgNFu8cAA=
X-Received: by 2002:a05:651c:12c8:b0:387:1c06:f742 with SMTP id
 38308e7fff4ca-38a40db0c27mr30556971fa.38.1772978812861; Sun, 08 Mar 2026
 07:06:52 -0700 (PDT)
MIME-Version: 1.0
References: <20260308-rc2-boot-hang-v2-1-516fdb820953@mmpsystems.pl>
In-Reply-To: <20260308-rc2-boot-hang-v2-1-516fdb820953@mmpsystems.pl>
From: Chen-Yu Tsai <wens@kernel.org>
Date: Sun, 8 Mar 2026 22:06:42 +0800
X-Gmail-Original-Message-ID: <CAGb2v67FO1bt3yee2SXn1LTt7O10z1EHHw7F0xQ0bKbpUqch4w@mail.gmail.com>
X-Gm-Features: AaiRm53PKegPTzYpVROQgRjOlGoQDyf6kO6816n6Q7tMTIhfOGBvZddqUzGRf9w
Message-ID: <CAGb2v67FO1bt3yee2SXn1LTt7O10z1EHHw7F0xQ0bKbpUqch4w@mail.gmail.com>
Subject: Re: [PATCH v2] pinctrl: sunxi: fix gpiochip_lock_as_irq() failure
 when pinmux is unknown
To: Michal Piekos <michal.piekos@mmpsystems.pl>
Cc: Linus Walleij <linusw@kernel.org>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
	Samuel Holland <samuel@sholland.org>, linux-gpio@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev, 
	linux-kernel@vger.kernel.org, Andrey Skvortsov <andrej.skvortzov@gmail.com>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Andre Przywara <andre.przywara@arm.com>, devicetree@vger.kernel.org, 
	Bartosz Golaszewski <brgl@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260308_070658_172063_7508BCD3 
X-CRM114-Status: GOOD (  28.55  )
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
Reply-To: wens@kernel.org
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

On Sun, Mar 8, 2026 at 9:42=E2=80=AFPM Michal Piekos
<michal.piekos@mmpsystems.pl> wrote:
>
> Fixes kernel hang during boot due to inability to set up IRQ on AXP313a.
>
> The issue is caused by gpiochip::get_direction() which was returning
> -ENODEV when gpio is in unitialized state.
>
> Instead of failing when the current muxval is at default value, report
> the line as input.

I don't really like this "fix". It's really lying.

Also, this problem only occurs if the interrupt is taken directly using
the DT "interrupts" property, as that mostly bypasses the GPIO subsystem,
especially the gpio request part.

If the consumer does gpiod_request() followed by gpiod_to_irq(), then
the pin is already muxed to either one of the GPIO functions and this
won't error out.

I also found that if the interrupt is taken directly through the device
tree, the pin itself is not locked out (like for GPIOs, on sunxi we also
don't do pinctrl settings for pins used for interrupts).

I think the proper fix would be to somehow be able to request the pin
as GPIO if it hasn't been requested already. And then either
sunxi_pinctrl_irq_request_resources() can use that to request the pin
and mux the pin before calling gpiochip_lock_as_irq().

Hope Linus and Bartosz have some suggestions.


Thanks
ChenYu


> Tested on Orange Pi Zero 3.
>
> Signed-off-by: Michal Piekos <michal.piekos@mmpsystems.pl>
> Suggested-by: Andrey Skvortsov <andrej.skvortzov@gmail.com>
> ---
> This fixes a kernel hang during boot on the Orange Pi Zero 3 caused by
> inability to set up interrupt for the AXP313A PMIC.
>
> The issue is caused by gpiochip::get_direction() which was returning
> -ENODEV when gpio is in unitialized state and its muxval is at default
> value.
>
> Instead of failing, report the line as input.
>
> To: Rob Herring <robh@kernel.org>
> To: Krzysztof Kozlowski <krzk+dt@kernel.org>
> To: Conor Dooley <conor+dt@kernel.org>
> To: Chen-Yu Tsai <wens@kernel.org>
> To: Jernej Skrabec <jernej.skrabec@gmail.com>
> To: Samuel Holland <samuel@sholland.org>
> To: Andre Przywara <andre.przywara@arm.com>
> To: Linus Walleij <linusw@kernel.org>
> Cc: devicetree@vger.kernel.org
> Cc: linux-arm-kernel@lists.infradead.org
> Cc: linux-sunxi@lists.linux.dev
> Cc: linux-kernel@vger.kernel.org
> Cc: linux-gpio@vger.kernel.org
>
> Changes in v2:
> - Dropped the previous faulty solution which was forcing the axp313 to
>   use r_pio as interrupt controller as pointed out by Jernej =C5=A0krabec=
.
> - Implemented suggestion from Andrey Skvortsov to return default
>   direction as input
> - Link to v1: https://lore.kernel.org/r/20260308-rc2-boot-hang-v1-0-d792d=
1a78dfd@mmpsystems.pl
> ---
>  drivers/pinctrl/sunxi/pinctrl-sunxi.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/pinctrl/sunxi/pinctrl-sunxi.c b/drivers/pinctrl/sunx=
i/pinctrl-sunxi.c
> index c990b6118172..e438cf35ff28 100644
> --- a/drivers/pinctrl/sunxi/pinctrl-sunxi.c
> +++ b/drivers/pinctrl/sunxi/pinctrl-sunxi.c
> @@ -971,7 +971,7 @@ static int sunxi_pinctrl_gpio_get_direction(struct gp=
io_chip *chip,
>
>         func =3D sunxi_pinctrl_desc_find_function_by_pin_and_mux(pctl, pi=
n, muxval);
>         if (!func)
> -               return -ENODEV;
> +               return GPIO_LINE_DIRECTION_IN;
>
>         if (!strcmp(func->name, "gpio_out"))
>                 return GPIO_LINE_DIRECTION_OUT;
>
> ---
> base-commit: 4ae12d8bd9a830799db335ee661d6cbc6597f838
> change-id: 20260308-rc2-boot-hang-269e8546635b
>
> Best regards,
> --
> Michal Piekos <michal.piekos@mmpsystems.pl>
>
>

