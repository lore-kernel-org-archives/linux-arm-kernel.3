Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7B9AAC369B2
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 17 Apr 2025 06:52:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=dhOBMdnj48blKw6YV7gc/9oneYA+xqS2pjcS4PzI4lw=; b=ghUbUzT/Tau3J1pBZ3ZcHD6e+p
	Uqw4JvJsGIDblDIjr/2AAOqHlWi/iIrW3TO1XbgWmgG+CGWVD28IJ+BTRT1xCftq0fkBcajGYdFLL
	2EH1LZIz1XjgAD+fpkdrbE5VAzxQIUPKKMX9F1+sYq0QHxojTc2W1KiJ2Egt4sjc7Yy3xpiouk4aT
	Gyt6kXHorlk17ibFyRjdwNxWXcx9rAvQ6N2fsMc/fI6igB0pHMn/gBL71liWWPUMkrfoLx09b7dT9
	couISxBAKU1ZdrlYpBQ14G/hC+iAPedHA/gqNsZHtgCa25i2se0Q4iCIFk2HcXb4pG9iZt8Qdqb2A
	jdYu9h0Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u5J6q-0000000BxgF-3cUW;
	Thu, 17 Apr 2025 06:52:28 +0000
Received: from mail-ej1-x635.google.com ([2a00:1450:4864:20::635])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u5Iwz-0000000BwGP-3r9a
	for linux-arm-kernel@lists.infradead.org;
	Thu, 17 Apr 2025 06:42:19 +0000
Received: by mail-ej1-x635.google.com with SMTP id a640c23a62f3a-acb415dd8faso59070666b.2
        for <linux-arm-kernel@lists.infradead.org>; Wed, 16 Apr 2025 23:42:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1744872136; x=1745476936; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=dhOBMdnj48blKw6YV7gc/9oneYA+xqS2pjcS4PzI4lw=;
        b=iLkvKM1FbOYZo+OPz7npspl32e9ni3DDGqAPC4qo+A93FYnw+TqhSNg8qzPMXZv9+8
         BrbSQgOZgOKA1KUjNGaXve4N8ourYhR9eYsj21SExO0uIReruw+KstBVm+r+E8PgJTkM
         Oyo73fk41ARwi6DI+DWCoCtUIuCf9v2Tbz4/4BHeGlsW/ZMhLgDn97xFp07S/q2ejjDa
         3zupc6WnKQXvotqXvA4jseqWavcHvCm/Xc4sa1qZxkXRjgRcOkfroBEO389InyQtNFi7
         2jG6fIXgw/TwGWEkhkDRZyXMyOQ6MqkwYVyl0qLhymSJsFZn4VLgo7DbQ8vDPixBE4fV
         6r9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744872136; x=1745476936;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=dhOBMdnj48blKw6YV7gc/9oneYA+xqS2pjcS4PzI4lw=;
        b=jPyg6m1jotXpJmqmUD+gLLvokQlKdLMeSY3y3j/qrvSBQP6yAWR6idajb7mBtzSxuB
         6tBI1OsSSQi7d23PiG17CJ6lCgvqBHSfNsNvOISKY7rBydVKXVACGJdQ/sMYaoRkOLEk
         FRTLXM0/t1hFnKtnxW3EbaPLWJI3a96EbKOicjjEbe0S0cwApVz7IxXGZSTYpxSfNMLt
         3XmPE1H/1+tPfSmrKv4MPPUoSb/+FYK4yV+ukQuWS+lYGFz4QZPrEchfaryb6SHSdmDT
         K/kZh85Et0+nIeYpqgktccJVgTi279ru5ewQtvkU8KCYbtTDFT59dPW0nzDKNnn79LvP
         zKmw==
X-Forwarded-Encrypted: i=1; AJvYcCV7fSN4hzOh2YYjn3VzXnclHOox6yVoVQYSU1RVTlD2jmctIXGrrnLfkUf36bKsh0WO2YvFXNENM5bHkkuBF7LG@lists.infradead.org
X-Gm-Message-State: AOJu0YwxNQzU+WbmGvUSvZNSa63fuKOFbn3x94hvW7ACNQ71xYXXi9gU
	mwXa6HkBq8S4/SiKG2su2nuVkeQuzT5CTc9MF6g4zIOHhWSsOuPyxr1ikZYQczAQO1tFd2gScrk
	m9AhEG608cfT+Hgg9spYkDsMMXASPnm543N4bRA==
X-Gm-Gg: ASbGnctCPLW7gJ6YghP67Us40gy7CGbatAvPjIOdzENtjJGK41vI/W3ttGE0Hpa5WFu
	d/YjfB+JwMrCOvygv1FlLIzz3UEAzsW/x4nvZ5M/Sy0TLtnbu2v9LQ2bxnBlpf0I46WszcUDp9t
	DC9bsee7G4QSLI/oOBASGnsFVk2HSEgAXd2owN2RV8BNSUrW+t4gt13g==
X-Google-Smtp-Source: AGHT+IHwQmW4uLoxd4O86s85PWQDVE6I5QgHoOdxvS68frFgXriQWYv526JyoVIGGquD0xEBBdrZTykIPd6kRqLVJVs=
X-Received: by 2002:a17:907:2cc4:b0:abf:4bde:51b1 with SMTP id
 a640c23a62f3a-acb4298011emr405993166b.21.1744872136202; Wed, 16 Apr 2025
 23:42:16 -0700 (PDT)
MIME-Version: 1.0
References: <20250408-gpiochip-set-rv-pinctrl-part1-v1-0-c9d521d7c8c7@linaro.org>
 <20250408-gpiochip-set-rv-pinctrl-part1-v1-7-c9d521d7c8c7@linaro.org> <20250416223706.GA3230303@ax162>
In-Reply-To: <20250416223706.GA3230303@ax162>
From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Date: Thu, 17 Apr 2025 08:42:05 +0200
X-Gm-Features: ATxdqUEdk8B4qOm49Z3JjfkRT6lA8RuMaY_llvKtObT7Pr4tgUtNyFqCuqU8FYk
Message-ID: <CACMJSevPHdo9ZGaOyGV8rrhJHTN4+-0UB0+sz=Z5jc_eZybjcA@mail.gmail.com>
Subject: Re: [PATCH 07/10] pinctrl: sx150x: enable building modules with COMPILE_TEST=y
To: Nathan Chancellor <nathan@kernel.org>
Cc: Bartosz Golaszewski <brgl@bgdev.pl>, Ludovic Desroches <ludovic.desroches@microchip.com>, 
	Linus Walleij <linus.walleij@linaro.org>, Nicolas Ferre <nicolas.ferre@microchip.com>, 
	Alexandre Belloni <alexandre.belloni@bootlin.com>, Claudiu Beznea <claudiu.beznea@tuxon.dev>, 
	Neil Armstrong <neil.armstrong@linaro.org>, Kevin Hilman <khilman@baylibre.com>, 
	Jerome Brunet <jbrunet@baylibre.com>, 
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>, 
	Xianwei Zhao <xianwei.zhao@amlogic.com>, Patrick Rudolph <patrick.rudolph@9elements.com>, 
	linux-arm-kernel@lists.infradead.org, linux-gpio@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-amlogic@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250416_234217_988895_B3D9738B 
X-CRM114-Status: GOOD (  21.60  )
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

On Thu, 17 Apr 2025 at 00:37, Nathan Chancellor <nathan@kernel.org> wrote:
>
> Hi Bartosz,
>
> On Tue, Apr 08, 2025 at 09:17:44AM +0200, Bartosz Golaszewski wrote:
> > From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> >
> > Increase the build coverage by enabling the sx150x modules with
> > COMPILE_TEST=y.
> >
> > Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> > ---
> >  drivers/pinctrl/Kconfig | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> >
> > diff --git a/drivers/pinctrl/Kconfig b/drivers/pinctrl/Kconfig
> > index 464cc9aca157..94eb41bb9cf2 100644
> > --- a/drivers/pinctrl/Kconfig
> > +++ b/drivers/pinctrl/Kconfig
> > @@ -541,7 +541,7 @@ config PINCTRL_STMFX
> >
> >  config PINCTRL_SX150X
> >       bool "Semtech SX150x I2C GPIO expander pinctrl driver"
> > -     depends on I2C=y
> > +     depends on I2C=y || COMPILE_TEST
> >       select PINMUX
> >       select PINCONF
> >       select GENERIC_PINCONF
> >
> > --
> > 2.45.2
> >
>
> This appears to break allmodconfig with
>
>   ld.lld: error: undefined symbol: i2c_get_match_data
>   >>> referenced by pinctrl-sx150x.c
>   >>>               drivers/pinctrl/pinctrl-sx150x.o:(sx150x_probe) in archive vmlinux.a
>
>   ld.lld: error: undefined symbol: i2c_smbus_write_byte_data
>   >>> referenced by pinctrl-sx150x.c
>   >>>               drivers/pinctrl/pinctrl-sx150x.o:(sx150x_probe) in archive vmlinux.a
>   >>> referenced by pinctrl-sx150x.c
>   >>>               drivers/pinctrl/pinctrl-sx150x.o:(sx150x_probe) in archive vmlinux.a
>   >>> referenced by pinctrl-sx150x.c
>   >>>               drivers/pinctrl/pinctrl-sx150x.o:(sx150x_regmap_reg_write) in archive vmlinux.a
>
>   ld.lld: error: undefined symbol: i2c_smbus_read_byte_data
>   >>> referenced by pinctrl-sx150x.c
>   >>>               drivers/pinctrl/pinctrl-sx150x.o:(sx150x_regmap_reg_read) in archive vmlinux.a
>
>   ld.lld: error: undefined symbol: i2c_register_driver
>   >>> referenced by pinctrl-sx150x.c
>   >>>               drivers/pinctrl/pinctrl-sx150x.o:(sx150x_init) in archive vmlinux.a
>   make[4]: *** [scripts/Makefile.vmlinux:91: vmlinux] Error 1
>
> I don't think this change makes much sense in light of this error,
> unless the driver was converted to tristate.
>
> Cheers,
> Nathan

Makes sense. Linus: Can you just drop this or do you prefer a formal revert?

Bart

