Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 82E99CD98F2
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 19 Jun 2026 21:08:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=FMSWI+gloufB0h0HTiPPqBp7P4ZIS2lTWu/Igajet9s=; b=S4U1wAYsta4b4cBBHs2Lmd17JL
	1Lz6OpWi1yb9Tm0BlGwRqBRi25YnJ/dEyzOuzqljET4zawe8oUounwRAp2lm+kF74D7RA995lrXZU
	o1z5lkx0aXxZFStcOkcbYqTOjBziHwLpMvlyCadA8RoQCLDh9J+HxFZ0/HAcm1+wjQ/HypcYkTXvH
	i8ue0/49EbIGZyZZISfpi3KC6hMnekiOoZFTmuY03eh/I0ZHb8SH65EtUtCMPyInjj3zLThlOROb+
	b3OmBw0jPernt3w9yEsh+gPDtczJ8MCSGabnUPHPcH55ow90MrjkQOnbTkr1FOGuZI2OZTKj0oBp0
	ZMUaiPWA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wagSF-000000032bZ-0DaY;
	Fri, 19 Jun 2026 21:08:47 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wagSD-000000032bO-3I7L
	for linux-arm-kernel@lists.infradead.org;
	Fri, 19 Jun 2026 21:08:45 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 8C88A445D8
	for <linux-arm-kernel@lists.infradead.org>; Fri, 19 Jun 2026 21:08:44 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5E9C01F0155A
	for <linux-arm-kernel@lists.infradead.org>; Fri, 19 Jun 2026 21:08:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781903324;
	bh=FMSWI+gloufB0h0HTiPPqBp7P4ZIS2lTWu/Igajet9s=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=cMmbUbYfwQO5CI8iSeh+6t2SUNKHya5glLSJCb8DV6CntMMsxIktcwYeUmvlKQvmO
	 ybB8ISM0w+kC9HyTbwLa3hR8N8oPyCXMMxYGJGAiV7pG7cRvGlNmk/oM+gZQ0C7IqG
	 VFgAGvVR0MMXgLVZKqm2tfLtf7KYNqnzBOd6lNvphwkuSLkrZuKbfwzhVKfDWh8Jin
	 +qFWl5S01GulWeCaSveSolV7YyO8Mm4k8Zqag5H1SPHluISqIep7t8/+5DRRKL5u8R
	 HD0uaF/HZibyqylXS6ZVwDwDuUOnQSO+bUVjQvD+rNyE50XfyOX95o1K9oWDnB4LpI
	 ZAwBSrYj+sajw==
Received: by mail-lf1-f44.google.com with SMTP id 2adb3069b0e04-5ad58351784so947252e87.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 19 Jun 2026 14:08:44 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ9jovqfWqImt2pA+cRjS3iWRd9c216UsAfPIzsu2OFtSxdNfg2UJ2BQqmCrsffmozcLWKmwJT2WW6sOU1i5laDF@lists.infradead.org
X-Gm-Message-State: AOJu0Ywaw9CqjOAJyP7aO6oDpinxqrd4wdEh+Ux6q9uzexKgJgTNZvRU
	Z29XovC5PQ2FzwHRtxYbP/7866AdcFHPTxTxm9G1+h/Q9hTkh8CfG36waGiBRFFE0KhjtZsBJZn
	/0itYnFuksmDKHomJ6znat7rqsJgLNTg=
X-Received: by 2002:a05:6512:239d:b0:5ad:4eac:f6d2 with SMTP id
 2adb3069b0e04-5ad58f3506amr1312078e87.23.1781903323139; Fri, 19 Jun 2026
 14:08:43 -0700 (PDT)
MIME-Version: 1.0
References: <20260512033317.1602537-1-eleanor.lin@realtek.com>
 <20260512033317.1602537-3-eleanor.lin@realtek.com> <agMM9soiqpG-TRSb@ashevche-desk.local>
 <adff3a2d21a64d3ea3b408d62157ee1e@realtek.com> <ah92oEavMu4QRn8y@ashevche-desk.local>
 <CAMRc=MdA24z-tB_D8CTw68Di8e4OVQJ1QH4+rDskFzq=xjJ5BQ@mail.gmail.com> <DJ3QVMZ6XLW9.1M9W541O92QWJ@kernel.org>
In-Reply-To: <DJ3QVMZ6XLW9.1M9W541O92QWJ@kernel.org>
From: Linus Walleij <linusw@kernel.org>
Date: Fri, 19 Jun 2026 23:08:30 +0200
X-Gmail-Original-Message-ID: <CAD++jLncD2ZjH3aedOkGNYP3FyZ=i7Pb0OcKKZKuMOPGNjM_nQ@mail.gmail.com>
X-Gm-Features: AVVi8CciIShnYrkvWiar3ZeR88iI32EVeKlpP07bMr3Ga2S3qThBGTGjlcJfumA
Message-ID: <CAD++jLncD2ZjH3aedOkGNYP3FyZ=i7Pb0OcKKZKuMOPGNjM_nQ@mail.gmail.com>
Subject: Re: [PATCH v3 2/7] gpio: regmap: add gpio_regmap_get_gpiochip() accessor
To: Michael Walle <mwalle@kernel.org>
Cc: Bartosz Golaszewski <brgl@kernel.org>, Andy Shevchenko <andriy.shevchenko@intel.com>, 
	"robh@kernel.org" <robh@kernel.org>, "krzk+dt@kernel.org" <krzk+dt@kernel.org>, 
	"conor+dt@kernel.org" <conor+dt@kernel.org>, "afaerber@suse.com" <afaerber@suse.com>, 
	"wbg@kernel.org" <wbg@kernel.org>, 
	"mathieu.dubois-briand@bootlin.com" <mathieu.dubois-briand@bootlin.com>, "lars@metafoo.de" <lars@metafoo.de>, 
	"Michael.Hennerich@analog.com" <Michael.Hennerich@analog.com>, "jic23@kernel.org" <jic23@kernel.org>, 
	"nuno.sa@analog.com" <nuno.sa@analog.com>, "andy@kernel.org" <andy@kernel.org>, 
	"dlechner@baylibre.com" <dlechner@baylibre.com>, =?UTF-8?B?VFlfQ2hhbmdb5by15a2Q6YC4XQ==?= <tychang@realtek.com>, 
	"linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, 
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, 
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, 
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, 
	"linux-realtek-soc@lists.infradead.org" <linux-realtek-soc@lists.infradead.org>, 
	"linux-iio@vger.kernel.org" <linux-iio@vger.kernel.org>, =?UTF-8?B?Q1lfSHVhbmdb6buD6Ymm5pmPXQ==?= <cy.huang@realtek.com>, 
	=?UTF-8?B?U3RhbmxleSBDaGFuZ1vmmIzogrLlvrdd?= <stanley_chang@realtek.com>, 
	=?UTF-8?B?SmFtZXMgVGFpIFvmiLTlv5fls7Bd?= <james.tai@realtek.com>, 
	=?UTF-8?B?WXUtQ2h1biBMaW4gW+ael+elkOWQm10=?= <eleanor.lin@realtek.com>
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

On Mon, Jun 8, 2026 at 4:41=E2=80=AFPM Michael Walle <mwalle@kernel.org> wr=
ote:

> >>> Without an accessor like gpio_regmap_get_gpiochip(), we cannot retrie=
ve the
> >>> gpio_chip instantiated inside gpio-regmap.c to fulfill these requirem=
ents in our
> >>> map() function.
>
> Why is gpiochip_irq_reqres() called in the first place? Isn't that
> only called if the irq handling is set up via gc->irq.chip and not
> via gpiochip_irqchip_add_domain() like in gpio-regmap?

Not really, the gpiochip_irq_reqres() is called to mark that a
GPIO line is used for IRQ, so the gpiolib cannot turn this
GPIO into an output line, gpiod_direction_out() will fail
on lines used for IRQ. So it's a failsafe.

You can live without it of course, but then you don't get
this failsafe.

Yours,
Linus Walleij

