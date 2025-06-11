Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6699FC71135
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 11 Jun 2025 23:09:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=hECvCp2144ISjYFuCPwHbO2eSKNwdlu+MMKqmQG6JC0=; b=tE/fheQPWR6iUyjL/F6thVogYt
	RtgFiRe1T1V66d5I5Qwr4xRVBw3V9pJnzAPGHYNbF1d8jZi+RPRIllEnQThy9kzpc2h5yX3+d4oyD
	x70LQSiXHbZtlK/9U1HlfUESLdJrzDXaCySn84+uDywYTgjZQBYPpkoizT2nfOFFqhsWmJnjEMdao
	zhPLFx3R6ECQwilENBECr/pXYM5OuQYsfAtobc4e0//zdrZkPIBRwjKOsx6bew3p0ezRrvHEo0Zgo
	d9XtKBGVqJ5bDLscAOpufNNCd8Ywza+lZRfsmdoUvMOo3Gr8esK4mydXOQCtfVbNmAIh1kmaqtPgK
	H8uqulEg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uPUZP-0000000BdiG-1N1p;
	Wed, 11 Jun 2025 23:09:23 +0000
Received: from mail-pf1-x435.google.com ([2607:f8b0:4864:20::435])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uPTpj-0000000BSpe-0xFa
	for linux-arm-kernel@lists.infradead.org;
	Wed, 11 Jun 2025 22:22:12 +0000
Received: by mail-pf1-x435.google.com with SMTP id d2e1a72fcca58-747ef5996edso437835b3a.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 11 Jun 2025 15:22:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=thingy.jp; s=google; t=1749680530; x=1750285330; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=hECvCp2144ISjYFuCPwHbO2eSKNwdlu+MMKqmQG6JC0=;
        b=AVQt/eb2qo+osQdMKinjBSq6lDeTaq9epgR8Dl9bvhoBnLcwfA0vzN5jHBBJ0RYAqN
         6Cirmx/0o7fNdWhel6I+nHOGf/46w5JEitbcZh5JjXeF8I08XyU6bvzNKqVLxD2P5VQ6
         VwXSOdhwTzrS6aAEanjdqVBe/bg5Ja5XoTm2c=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749680530; x=1750285330;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=hECvCp2144ISjYFuCPwHbO2eSKNwdlu+MMKqmQG6JC0=;
        b=n8g3TMf00NB03V2ZVU02MvomjpIu8xlQ9CRYTdqUE6QJU6HozUP59ZPFWESI5BKRis
         QqtZTqol5hG7xKLzBXfa5XzP5IdON+JDQrc6K9aBTYBTx0wAYYV9oYdVYCzV2ueCGvD6
         gvGtrRy344PRMvKIHSXc2H6X276FXcjZFJRb+FqIkL1O8hNYS1pFhzP03u4JeaYjtVbE
         SSWmrTngmedbLLY3VDtgUyU+0Xlm9cv7utz6gDBHCc13H4ecCYu1cPy48hMOo6OeaSx5
         cSEVEYn/Va+ALhdthI5iHGvTJcaHYHoxNycme38YLE38HimmWtNLnyVAYc7/ltvBoGp0
         T+hA==
X-Forwarded-Encrypted: i=1; AJvYcCUK3EoD3fOCBd6fkWOXT4B0d4k7UAv15oSIvhqq5ZTWGXz8eIaSCaDzlwFYLT16UE9IJIRdXa2aNcGks+YVD5YF@lists.infradead.org
X-Gm-Message-State: AOJu0YxgDQLlwQdY5hN3qNzKYKo1iTRCwuybGmOJC3xVJ4dJUtD5eAhO
	AogGnNH2oC2hI2pwJDb4XB3h+DyTopp7PfoHbjiM89MhROH9WYyRwoaTc6vlcqbzlK/LzFg0UWn
	5FqilB5Jq+nMtfOZGLc69k23OgFujOyicrWjMSiKwYw==
X-Gm-Gg: ASbGnctn+dkR5j0aSlt0ZhsgK8BqvWkpRm2cCHUrFwXyyTyaPTOGw7w1FUpsHlvcU4W
	8DWgTYW63QDj6qqtx0zE/yb1ro0hmn0FF8u4QeCJSVRv+RstdRb2+1nJ3kdcy50seZ2vUHk5LVW
	b494PLTzIS+77o+REHemNhadHRD2GqCVAAnSsje9U+hdL2zt+Z3E4Fn5NNOqkTwz15lkmDwAN4H
	mVg
X-Google-Smtp-Source: AGHT+IE8FknUC40PscBGYY7OPNelZLLkTFE7qxHwumbpWqTQtgyRPt7nCSuQoA+6xvyngwoaYT3v2ByQ5TtYzKrW9d8=
X-Received: by 2002:a17:90b:2892:b0:312:26d9:d5b6 with SMTP id
 98e67ed59e1d1-313bfba12a1mr1389789a91.3.1749680529907; Wed, 11 Jun 2025
 15:22:09 -0700 (PDT)
MIME-Version: 1.0
References: <20250610-gpiochip-set-rv-gpio-v1-0-3a9a3c1472ff@linaro.org> <20250610-gpiochip-set-rv-gpio-v1-7-3a9a3c1472ff@linaro.org>
In-Reply-To: <20250610-gpiochip-set-rv-gpio-v1-7-3a9a3c1472ff@linaro.org>
From: Daniel Palmer <daniel@thingy.jp>
Date: Thu, 12 Jun 2025 07:21:56 +0900
X-Gm-Features: AX0GCFuAPMzR2tj8IuIF1_MflSdk31p_mu_qD7qQzgmBFTWEvU6XX8YEN4mo1dI
Message-ID: <CAFr9PXmeYETV5FSAnEacFCo7LiS3cYBpPqraexLC7=MTzshfNg@mail.gmail.com>
Subject: Re: [PATCH 07/12] gpio: msc313: use new GPIO line value setter callbacks
To: Bartosz Golaszewski <brgl@bgdev.pl>
Cc: Linus Walleij <linus.walleij@linaro.org>, =?UTF-8?B?TWFyZWsgQmVow7pu?= <kabel@kernel.org>, 
	Conor Dooley <conor.dooley@microchip.com>, Daire McNamara <daire.mcnamara@microchip.com>, 
	Romain Perier <romain.perier@gmail.com>, Avi Fishman <avifishman70@gmail.com>, 
	Tomer Maimon <tmaimon77@gmail.com>, Tali Perry <tali.perry1@gmail.com>, 
	Patrick Venture <venture@google.com>, Nancy Yuen <yuenn@google.com>, 
	Benjamin Fair <benjaminfair@google.com>, Grygorii Strashko <grygorii.strashko@ti.com>, 
	Santosh Shilimkar <ssantosh@kernel.org>, Kevin Hilman <khilman@kernel.org>, linux-gpio@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org, 
	linux-arm-kernel@lists.infradead.org, openbmc@lists.ozlabs.org, 
	linux-omap@vger.kernel.org, 
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250611_152211_488574_060D5309 
X-CRM114-Status: GOOD (  19.99  )
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

Hi Bartosz,

On Tue, 10 Jun 2025 at 21:33, Bartosz Golaszewski <brgl@bgdev.pl> wrote:
>
> From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
>
> struct gpio_chip now has callbacks for setting line values that return
> an integer, allowing to indicate failures. Convert the driver to using
> them.
>
> Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> ---
>  drivers/gpio/gpio-msc313.c | 6 ++++--
>  1 file changed, 4 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/gpio/gpio-msc313.c b/drivers/gpio/gpio-msc313.c
> index 6db9e469e0dc254e791d497b89a4c6d329d0add4..992339a89d19840fc03ccf849972a83cb86415ae 100644
> --- a/drivers/gpio/gpio-msc313.c
> +++ b/drivers/gpio/gpio-msc313.c
> @@ -486,7 +486,7 @@ struct msc313_gpio {
>         u8 *saved;
>  };
>
> -static void msc313_gpio_set(struct gpio_chip *chip, unsigned int offset, int value)
> +static int msc313_gpio_set(struct gpio_chip *chip, unsigned int offset, int value)
>  {
>         struct msc313_gpio *gpio = gpiochip_get_data(chip);
>         u8 gpioreg = readb_relaxed(gpio->base + gpio->gpio_data->offsets[offset]);
> @@ -497,6 +497,8 @@ static void msc313_gpio_set(struct gpio_chip *chip, unsigned int offset, int val
>                 gpioreg &= ~MSC313_GPIO_OUT;
>
>         writeb_relaxed(gpioreg, gpio->base + gpio->gpio_data->offsets[offset]);
> +
> +       return 0;
>  }
>
>  static int msc313_gpio_get(struct gpio_chip *chip, unsigned int offset)
> @@ -656,7 +658,7 @@ static int msc313_gpio_probe(struct platform_device *pdev)
>         gpiochip->direction_input = msc313_gpio_direction_input;
>         gpiochip->direction_output = msc313_gpio_direction_output;
>         gpiochip->get = msc313_gpio_get;
> -       gpiochip->set = msc313_gpio_set;
> +       gpiochip->set_rv = msc313_gpio_set;
>         gpiochip->base = -1;
>         gpiochip->ngpio = gpio->gpio_data->num;
>         gpiochip->names = gpio->gpio_data->names;
>
> --
> 2.48.1
>

Reviewed-by: Daniel Palmer <daniel@thingy.jp>

Cheers,

Daniel

