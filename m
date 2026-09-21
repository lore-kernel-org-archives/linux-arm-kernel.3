Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7723EC982E1
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 21 Sep 2026 10:35:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:References:MIME-Version:In-Reply-To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=uf7K0+ckYfZ1RE4IQEUJIKlulg/YWQPSFrPzeeWpU08=; b=GW39qYgZfEIZGpvt8fIhnsU4sZ
	wU5x8MEb3Zek2kogs/QZmyji6qq2OypDJptqlMjduBxnFwqRe4UTasVGMUSyzd1BXCqKklDUXO9KE
	ukd6iPJnijMegXfudmBcw/hnzFwza1EfRxtKp/JvcyLwm9I+xyuJsjtnPce1K8SoviJcafnLY8K8S
	Aus1+9kCeYQHYDeOPOxrvG82gdobNTAtz//noCvQloXl9ZO8dU7K5V55r0S+Xf3kgt6lCnImeR3hs
	2Y4RCCylgfr8AqvEsFNxFg5Zi7ZKhaHavap/I9MeaIiZYQGM90HP/l4FCgaXbIVn+JZAcV30BNyd1
	EHQyYVyA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x8bMf-00000001iCC-0tAz;
	Mon, 21 Sep 2026 10:35:13 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x8bMe-00000001iBk-0HrN
	for linux-arm-kernel@lists.infradead.org;
	Mon, 21 Sep 2026 10:35:12 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 773B1436D8
	for <linux-arm-kernel@lists.infradead.org>; Mon, 21 Sep 2026 10:35:11 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5B4CA1F0089B
	for <linux-arm-kernel@lists.infradead.org>; Mon, 21 Sep 2026 10:35:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789986911;
	bh=uf7K0+ckYfZ1RE4IQEUJIKlulg/YWQPSFrPzeeWpU08=;
	h=From:In-Reply-To:References:Date:Subject:To:Cc;
	b=orNUCASLJXrta2jQAt3DZfNJXG64yPkECzsZxCKUcdNrEr8sYKbeFrvYhVt6pvxRn
	 XPaVfFVj0LFVmn5txFq7ujldG6HlnD1PJchdDGytX3zXACi0HoHW8G1xpjuJMcFjpw
	 g5lFmheLNbd2i0jgKrnpoOmOHqlX9qQXBTw+plQvtCN2xAIQ6yXieA8FnmBr2ziQuN
	 o5rtdr/TamlhcRr+eXDKTARMiyUoClUwvTp6zljHDD+uU4/6YMMhcu9AQtD2CmS3nz
	 mxqFNI2wO1mm3TUpmUi6agq2nTJmbuj6wOQ+ND6sa/5ghz8haPxdfrt1ZSAhIvkz3V
	 XBCHb0kNekbZg==
Received: by mail-lf2-f13.google.com with SMTP id 2adb3069b0e04-5b5e4f16cd1so2562442e87.3
        for <linux-arm-kernel@lists.infradead.org>; Mon, 21 Sep 2026 03:35:11 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBzpKyeQR5EgquH2TQjQnBFanToQOocgGkfTctZ9K0+/IdqobCZpg4GHQa4uxyzKPQ1rCNjO24iJqSUTzCZfTTB8@lists.infradead.org
X-Gm-Message-State: AFuF++lKJzC/iRu7/COB8nV99N/bRDUB3BwpvzRtUjcsYY/9QNZZZ3Bb
	sJz8p2b4lCRWh+500e1WrVyC7EbsVpu/4xmOCH5zsuk0xU13BaseGJ0iogkGx8rzTsxyQarT/tq
	nzYun86nMLKXTPkdbHHni97J5FJFqqPmbLzN8yZpNBA==
X-Received: by 2002:a05:6512:3e1a:b0:5b8:b419:b90 with SMTP id
 2adb3069b0e04-5b8c197b251mr2961808e87.67.1789986910027; Mon, 21 Sep 2026
 03:35:10 -0700 (PDT)
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Mon, 21 Sep 2026 06:35:08 -0400
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Mon, 21 Sep 2026 06:35:08 -0400
From: Bartosz Golaszewski <brgl@kernel.org>
In-Reply-To: <20260921-cv75-v5-v8-9-282ff5d98dda@ambarella.com>
MIME-Version: 1.0
References: <20260921-cv75-v5-v8-0-282ff5d98dda@ambarella.com> <20260921-cv75-v5-v8-9-282ff5d98dda@ambarella.com>
Date: Mon, 21 Sep 2026 06:35:08 -0400
X-Gmail-Original-Message-ID: <CAMRc=Mf7dtxvxBUF1fOuKw0mxdhCYPj=J4ckySPZUvcZ7a6cbQ@mail.gmail.com>
X-Gm-Features: AcwNN1VMqVgF7bm9abckTPi2_jaxdRsIFb-CjJ1kvLYDiK7JhcmYHE-hjU9EtD0
Message-ID: <CAMRc=Mf7dtxvxBUF1fOuKw0mxdhCYPj=J4ckySPZUvcZ7a6cbQ@mail.gmail.com>
Subject: Re: [PATCH v8 09/18] gpiolib: regmap: add gpio_regmap_get_chip()
To: longzhao@ambarella.com
Cc: Long Zhao via B4 Relay <devnull+longzhao.ambarella.com@kernel.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
	Jerome Brunet <jbrunet@baylibre.com>, Linus Walleij <linusw@kernel.org>, 
	Bartosz Golaszewski <brgl@kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Jiri Slaby <jirislaby@kernel.org>, Andy Shevchenko <andriy.shevchenko@linux.intel.com>, 
	=?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>, 
	Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, Long Zhao <zl020895@163.com>, 
	Lee Jones <lee@kernel.org>, mfd@lists.linux.dev, devicetree@vger.kernel.org, 
	linux-clk@vger.kernel.org, linux-gpio@vger.kernel.org, 
	linux-serial@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Arnd Bergmann <arnd@arndb.de>, Krzysztof Kozlowski <krzk@kernel.org>, 
	Alexandre Belloni <alexandre.belloni@bootlin.com>, soc@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
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

On Mon, 21 Sep 2026 06:23:28 +0200, Long Zhao via B4 Relay
<devnull+longzhao.ambarella.com@kernel.org> said:
> From: Long Zhao <longzhao@ambarella.com>
>
> Let drivers that implement a custom irqchip retrieve the gpio_chip
> after registration.
>
> Signed-off-by: Long Zhao <longzhao@ambarella.com>
> ---
>  drivers/gpio/gpio-regmap.c  | 6 ++++++
>  include/linux/gpio/regmap.h | 1 +
>  2 files changed, 7 insertions(+)
>
> diff --git a/drivers/gpio/gpio-regmap.c b/drivers/gpio/gpio-regmap.c
> index fbd4c753525a..21e0993b89e2 100644
> --- a/drivers/gpio/gpio-regmap.c
> +++ b/drivers/gpio/gpio-regmap.c
> @@ -295,6 +295,12 @@ void *gpio_regmap_get_drvdata(struct gpio_regmap *gpio)
>  }
>  EXPORT_SYMBOL_GPL(gpio_regmap_get_drvdata);
>
> +struct gpio_chip *gpio_regmap_get_chip(struct gpio_regmap *gpio)
> +{
> +	return &gpio->gpio_chip;
> +}
> +EXPORT_SYMBOL_GPL(gpio_regmap_get_chip);

Please provide a kernel doc for all public APIs. It should explain that this
must not be used outside of a GPIO controller driver context.

Bart

