Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 83D02C3ABBE
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  6 May 2025 08:09:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=IWjI1WdrW4fw1LjYjyn2MNuK0dU9SDM3EHaXeQ0QWpk=; b=N+vyMZuLJLOzdO+2GXPIy805N/
	jpTBv7A8xDgSAcU3Zp2YZxahDynv8i5j7rM87hS7j7JqFGX3qdscVm3mU1DT7pbV0lrz4rexiAqh/
	vLVIIiQAdam4Jo62y1Zefv+J8czqX6YztRvN0TgA8w56Fo+B/wMx/idpwgzy1ENwPg5PoySqiwNrO
	bxAr8REsS5Pu0SpKC43BK0e+DrWaUKmjmkWQ2zhZosEOWC/6Hvh1ddGy5SNMsvdZ2WvWQDyccysnM
	8EOLhgBfO3LG/rcno9qb4MtQpmijVXNkmo0cjMH7v8XO9LwDMAibdTXuYybE4NCdBYTFjZtfbXnU/
	IESPoLew==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uCDMY-0000000B6KV-07OE;
	Tue, 06 May 2025 08:09:14 +0000
Received: from mail-lf1-x136.google.com ([2a00:1450:4864:20::136])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uCDKc-0000000B5xP-034I
	for linux-arm-kernel@lists.infradead.org;
	Tue, 06 May 2025 08:07:15 +0000
Received: by mail-lf1-x136.google.com with SMTP id 2adb3069b0e04-54ea69e9352so6346404e87.2
        for <linux-arm-kernel@lists.infradead.org>; Tue, 06 May 2025 01:07:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1746518832; x=1747123632; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=IWjI1WdrW4fw1LjYjyn2MNuK0dU9SDM3EHaXeQ0QWpk=;
        b=n0yFC6icCHEyUcpGKs5WlIB8d1trIm3uswq/jxk1O63nYdrMtT0/Tqpk5G3TGIJp7F
         dCKoDC+Klm9CGYnb8KePUGfvqdIiUe3yjwrsWJ9szP958/oRPgpRG88HNflLkVmoUwcF
         M+WLUPedEVLJFa5rER2v1jIGZgPCZq3RtdQydPA8zhE8K24u2eqB2IGb9KSQu8nPCB7t
         twYZVvR3DQ/Q8CvtS6g/oictzSSlonY+5LjoDUB/F1kAe4jtcOP1VSt4dATotnT0JTVp
         5sx+9dgIB4tpLiaQKw3hLSUbgub+MqBH2Iljw9sWaPR8MzL4IM4r6usraIHrlFjJjQXQ
         6DTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746518832; x=1747123632;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=IWjI1WdrW4fw1LjYjyn2MNuK0dU9SDM3EHaXeQ0QWpk=;
        b=E4X12y0kn032hzeGI860y/jpmNcELA5pgLwH6BIOV5rK/yeaRNGwueW+Vmv3iJcg1W
         5n/AMiThXIuU7fJrokQ93WO8lZ6ASBqMZgJmeAjpTieAx3m3gCKy14pIwPOmWjaTD6eR
         EMzwmVgnA/eTj52a180uQJMPf4unUxET/e4AAybiNDszU1o5YV9CaH9gIfwP0Hfd2tpl
         W82RXWWi5g1THUs77b9Ro9haDVdYrjfd53oh27iBQ5QLueLS6JHudv9qK/mbpCf1pBNT
         eIyjzE3J5sHnbmY3WI2v4ihDkmXoBtR9rTuhCcSTp497VXaBIUKvI7XtmfcoDZKHqfW/
         ug7g==
X-Forwarded-Encrypted: i=1; AJvYcCVy1jtl+eMR7IstVP5kfXFoig+F4s7QDbtgqUch7KX78deOLKdN0EyFnfQvlcdx9aqKw7kN6YncW6nCxpHN4qFZ@lists.infradead.org
X-Gm-Message-State: AOJu0Yy4vuMtuib0hRIPhTZ2LWZaVuUwK/+MTjMcEyQtYT34j4s9bKwQ
	L1K+j5fIw38IoGE90XedMfc+dWxd8sjo4PMhwCBVtz8uCnAsRWptwFvfFZ6L4TspmURGJSU+7gI
	eQtp5G3ZXcCQ1/uJ8PuNNg2xiqhXG+/MDKKdOkA==
X-Gm-Gg: ASbGncsoCSkFx1EO2oaYXaBbOnDfMNUBEbhgw9/6BcYuph+pPP8bm0WD1+IWxdndZ85
	uiFw0DffufxqSFjhZO8YBj3nxMdAvawnCnuGSrL7GPjYyQpJjoza0bhSQ5o4Ml5hfQIjXgUGf94
	UEogB6nu01SwfMNCY1kjOZghJ1Up43IM4DgEYhoUGmwNOPqx/yZy6Quw==
X-Google-Smtp-Source: AGHT+IHqoCICO9862R9K2Lm84ouPAwINr3VP7krJifWUL5WSBoQ4Kvr33P34RfQvhWkjHIDMgMqYGqtI1g5tPyBwgtk=
X-Received: by 2002:a05:6512:1048:b0:545:aa5:d44f with SMTP id
 2adb3069b0e04-54fb4a14406mr712084e87.30.1746518831752; Tue, 06 May 2025
 01:07:11 -0700 (PDT)
MIME-Version: 1.0
References: <20250503-smc-6-15-v4-0-500b9b6546fc@svenpeter.dev> <20250503-smc-6-15-v4-5-500b9b6546fc@svenpeter.dev>
In-Reply-To: <20250503-smc-6-15-v4-5-500b9b6546fc@svenpeter.dev>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Tue, 6 May 2025 10:07:00 +0200
X-Gm-Features: ATxdqUE_9uM4g2e9vDQcwVZ74pJhDseN0shdJbJ2G8cWvYqvkY72EGPX5Nyfbec
Message-ID: <CAMRc=MebFf-DBh_=H0J4ORStaxBYhOnfY+jSk2d4UpdyS=m1LA@mail.gmail.com>
Subject: Re: [PATCH v4 5/9] gpio: Add new gpio-macsmc driver for Apple Macs
To: sven@svenpeter.dev
Cc: Janne Grunau <j@jannau.net>, Alyssa Rosenzweig <alyssa@rosenzweig.io>, Neal Gompa <neal@gompa.dev>, 
	Hector Martin <marcan@marcan.st>, Linus Walleij <linus.walleij@linaro.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Sebastian Reichel <sre@kernel.org>, Lee Jones <lee@kernel.org>, Marc Zyngier <maz@kernel.org>, 
	"Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>, asahi@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, linux-gpio@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-pm@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250506_010714_207175_5A1872F2 
X-CRM114-Status: GOOD (  17.84  )
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

On Sat, May 3, 2025 at 12:07=E2=80=AFPM Sven Peter via B4 Relay
<devnull+sven.svenpeter.dev@kernel.org> wrote:
>
> From: Hector Martin <marcan@marcan.st>
>
> This driver implements the GPIO service on top of the SMC framework
> on Apple Mac machines. In particular, these are the GPIOs present in the
> PMU IC which are used to control power to certain on-board devices.
>
> Although the underlying hardware supports various pin config settings
> (input/output, open drain, etc.), this driver does not implement that
> functionality and leaves it up to the firmware to configure things
> properly. We also don't yet support interrupts/events. This is
> sufficient for device power control, which is the only thing we need to
> support at this point. More features will be implemented when needed.
>
> To our knowledge, only Apple Silicon Macs implement this SMC feature.
>
> Signed-off-by: Hector Martin <marcan@marcan.st>
> Reviewed-by: Bartosz Golaszewski <brgl@bgdev.pl>
> Reviewed-by: Linus Walleij <linus.walleij@linaro.org>
> Reviewed-by: Sven Peter <sven@svenpeter.dev>
> Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>
> Signed-off-by: Sven Peter <sven@svenpeter.dev>
> ---

[snip]

> +
> +       smcgp->gc.label =3D "macsmc-pmu-gpio";
> +       smcgp->gc.owner =3D THIS_MODULE;
> +       smcgp->gc.get =3D macsmc_gpio_get;
> +       smcgp->gc.set =3D macsmc_gpio_set;

I must have given my Reviewed-by under this driver before we started
the conversion to the new GPIO driver setters. Could you please
replace this with set_rv() as the old set() is now deprecated?

> +       smcgp->gc.get_direction =3D macsmc_gpio_get_direction;
> +       smcgp->gc.init_valid_mask =3D macsmc_gpio_init_valid_mask;
> +       smcgp->gc.can_sleep =3D true;
> +       smcgp->gc.ngpio =3D MAX_GPIO;
> +       smcgp->gc.base =3D -1;
> +       smcgp->gc.parent =3D &pdev->dev;
> +

Bart

