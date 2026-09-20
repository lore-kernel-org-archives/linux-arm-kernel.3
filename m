Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C8D90C982DA
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 20 Sep 2026 22:03:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=EazSi67AnEMmbq7ZltUkvWuYuiRsVKn0Z1eUsxsbxC4=; b=JwbLAlQPHhykArIb/0j9WnGe6j
	RoL9yi/3xyVdTJ8DMG3z9wYP0hwH909A84X+EzWRyc1/n8OV5JX8VdNEpw+ES9nrc2EDJTAC/8bvT
	FDBcayXIwBMT4rlpOuDSWfSyZtfoOS2/38vFChQtN+htCq6dCilrFrhBs0YkitD0Xepz6jiobp7Zt
	169Nkg/zxZ3i5XFI5jprZJ9iRPbW3ZlIZULQZ7YNyfwA2w6jO63XRjw3grZSzxnHkxzwNmKVHkadI
	dwWwiHgPk1wJlzQ4u0UEjj3Gb4lPaCLkl5ernOP4FmcXdCbFQnMbHUH/mSNcGYBeaK0lnIg4UZE9s
	0O4WI8xw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x8Pco-00000000V07-2z8k;
	Sun, 20 Sep 2026 22:03:06 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x8Pcn-00000000Uzw-1pmx
	for linux-arm-kernel@lists.infradead.org;
	Sun, 20 Sep 2026 22:03:05 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 37B85447D1
	for <linux-arm-kernel@lists.infradead.org>; Sun, 20 Sep 2026 22:03:03 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 105411F00898
	for <linux-arm-kernel@lists.infradead.org>; Sun, 20 Sep 2026 22:03:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789941783;
	bh=EazSi67AnEMmbq7ZltUkvWuYuiRsVKn0Z1eUsxsbxC4=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=Odb9mBnELzaw24K1UcUT8uXVAHUxcedvTAMwVYAKd8qPcru4vQ8oHv0OcEWZHmuDQ
	 GVyie1fX5aT6tLNj+dKXe7GfGFTCwNODwRUgj6i3fK+0TsyF3SLdn9lsQOKac+xwFY
	 6re2xKuGhSJgdCzW1ApSW9yDpqjldoqq9Mq+jTkKzBdjz0PS4PMRPb8d27C6VmGTLI
	 Z0tABMrvg8ISfrfLCpizMmTICWJf4cW9DU4vU5lxEF/FSiunVuBEqQbDs7nYf8uwyn
	 9zlEOsikWW6GmfvORAEcSXH/RNBtAsVspYiPB12k+AEqJgjFTcryYyt/JPkWYmtOJp
	 yEEEJ7hVjtevA==
Received: by mail-lf2-f13.google.com with SMTP id 2adb3069b0e04-5b5e4f1651bso2094328e87.3
        for <linux-arm-kernel@lists.infradead.org>; Sun, 20 Sep 2026 15:03:02 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBzbL34qCvKVQzoeCsEXhs4ItWQhwWp1uTehTgFoSuUr5R7V6vvzgsAHUljjrvnYeJ8DdzMA9chj2huwe8Z88HdN@lists.infradead.org
X-Gm-Message-State: AFuF++kmk7dKiQZVoxAvx0G+9z0TchLrDcoOwm4EJiurChq0iqTfvYQd
	xMYTlJCMeuH6UbNKXk5NbAvVPWZOVvbe0HaIK1rGlxjgHAtnv55pH/f9mdRgcAR+u1wYWJ+xwNX
	Xz4Rlj9y+VYEkezdaETM9ph8Ls4pGpfQ=
X-Received: by 2002:a05:6512:12cd:b0:5b1:5fb6:5cf6 with SMTP id
 2adb3069b0e04-5b8c17ffa65mr2546885e87.17.1789941781599; Sun, 20 Sep 2026
 15:03:01 -0700 (PDT)
MIME-Version: 1.0
References: <20260915-cv75-v5-v7-0-3297d3fbc9c0@ambarella.com> <20260915-cv75-v5-v7-8-3297d3fbc9c0@ambarella.com>
In-Reply-To: <20260915-cv75-v5-v7-8-3297d3fbc9c0@ambarella.com>
From: Linus Walleij <linusw@kernel.org>
Date: Mon, 21 Sep 2026 00:02:48 +0200
X-Gmail-Original-Message-ID: <CAD++jLkHfgu_V8i_fhE1WQe+qwJ=ictQSONWPq1fPuYYb8tSRA@mail.gmail.com>
X-Gm-Features: AcwNN1V2pdLiyksjZ1x3Z_llNdAeXu21UqDUc6FoZVDqEvbXB8LwaNWdrYSQU-A
Message-ID: <CAD++jLkHfgu_V8i_fhE1WQe+qwJ=ictQSONWPq1fPuYYb8tSRA@mail.gmail.com>
Subject: Re: [PATCH v7 08/15] gpiolib: regmap: add write_data_after_dir quirk
To: longzhao@ambarella.com
Cc: Arnd Bergmann <arnd@arndb.de>, Krzysztof Kozlowski <krzk@kernel.org>, 
	Alexandre Belloni <alexandre.belloni@bootlin.com>, soc@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
	Jerome Brunet <jbrunet@baylibre.com>, Bartosz Golaszewski <brgl@kernel.org>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Jiri Slaby <jirislaby@kernel.org>, 
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>, 
	=?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>, 
	Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, Long Zhao <zl020895@163.com>, 
	Lee Jones <lee@kernel.org>, mfd@lists.linux.dev, devicetree@vger.kernel.org, 
	linux-clk@vger.kernel.org, linux-gpio@vger.kernel.org, 
	linux-serial@vger.kernel.org, linux-kernel@vger.kernel.org
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

Hi Long,

thanks for your patch!

On Tue, Sep 15, 2026 at 1:15=E2=80=AFPM Long Zhao via B4 Relay
<devnull+longzhao.ambarella.com@kernel.org> wrote:


> From: Long Zhao <longzhao@ambarella.com>
>
> Some controllers ignore data-register writes while a line is still an
> input. Optionally write the output value again after switching the
> direction, matching the existing PL061 behaviour.
>
> Signed-off-by: Long Zhao <longzhao@ambarella.com>

OK I see.

(...)


> @@ -271,9 +272,22 @@ static int gpio_regmap_direction_output(struct gpio_=
chip *chip,
>                         return ret;
>         }
>
> -       gpio_regmap_set(chip, offset, value);
> +       ret =3D gpio_regmap_set(chip, offset, value);
> +       if (ret)
> +               return ret;

if (!gpio->write_data_after_dir) {
     ret =3D gpio_regmap_set(chip, offset, value);
     if (ret)
             return ret;
}

There is no point in doing something you know will not
work.

> +       ret =3D gpio_regmap_set_direction(chip, offset, true);
> +       if (ret)
> +               return ret;
>
> -       return gpio_regmap_set_direction(chip, offset, true);
> +       /*
> +        * gpio value is set again, because pl061 doesn't allow to set va=
lue of
> +        * a gpio pin before configuring it in OUT mode.
> +        */
> +       if (gpio->write_data_after_dir)
> +               return gpio_regmap_set(chip, offset, value);

Then there is Andy's comment as well.

The rest looks good.

Yours,
Linus Walleij

