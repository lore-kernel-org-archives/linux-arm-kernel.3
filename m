Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E8C55CCFA05
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  6 Nov 2025 16:23:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=R8aL6w1TYvGrl1UBIVVUpuAsDW/dJzd3vY+/verHnfg=; b=NXg8NdKUaq5X366Q01RONp3ybN
	lphhdFE/yXjl8E+HkNx/wrfk2DXmTxrx5CYTBWO9/ora9aiGQMqHWz38ado1rMOfOY4y0wZd92Qw8
	3zHaVilgXMRInhXcp2BJqiQ+jMuhZjM7wGFOSZhkEWUI66WH426DrDd+8hYHv/E2rv6y8qfT4H2YW
	mBYeswt3Gys/2A6Kq+k6DCi0OmZY98WBTnlFNuf7j1PS2TmDY3fpi0x5SsNasTCJRaqYE/vgHTJv4
	Oh8u7zUHxMBjfq7VIgntrTUKBWxZcO7UUdTL/DuAT6YOGbXr0CuaDshiE+6LhMyCT52Se610NYK9u
	aOhhaz5w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vH2m6-0000000FuxS-0RMJ;
	Thu, 06 Nov 2025 16:23:50 +0000
Received: from mail-lj1-x22d.google.com ([2a00:1450:4864:20::22d])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vH2m3-0000000FuwR-11Eb
	for linux-arm-kernel@lists.infradead.org;
	Thu, 06 Nov 2025 16:23:48 +0000
Received: by mail-lj1-x22d.google.com with SMTP id 38308e7fff4ca-378e0f355b9so8984701fa.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 06 Nov 2025 08:23:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1762446221; x=1763051021; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=R8aL6w1TYvGrl1UBIVVUpuAsDW/dJzd3vY+/verHnfg=;
        b=UgBfyrzV2PMMu2W63wPKhnnoQKJ1Ucxyv14IKhGFff0c6LmaunVQd0H12fnE6S0R/2
         //v/epPNJxu+qn+iW953zZtZZz3Km7+rp/bJCiK9xYq6fWxDZfLGGaBM7uK67smBZet/
         tRZx5r2sPkc0H9BUNTVBJFwMfrbXp1NdV/R1KqBQSz3En9OJow31A5hWidbJ1M9iQY5A
         4W4xhbXjguWOcTl7BNLSIaby5dMrGLDqnp0GLUWGdH0r2D+IH5FY7a8I8o49HlfhRi6h
         nCNNmPXovyXugvY33WszGaDQgFXgMisQsB5MFrCqAvbkWNMld4gSaKFlhOGSs3uLIKOd
         y8fw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762446221; x=1763051021;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=R8aL6w1TYvGrl1UBIVVUpuAsDW/dJzd3vY+/verHnfg=;
        b=nU6j1ECGV6Fx7hskCHX/5fw0nis5jtAPyDw0CYb4tpZ5QAkQSfMqvYZ5tBObEFFfT7
         LS2cz6oNhySRbwwVWGPGKQxhFkiLuKawKqsXlUJwHviBmN+/WHxP1k/9nwuiJgfc6br8
         oqJbKexjSjT2hwNjWbhxfHNiTsBTvWzP8YN/LO/XIwRmMnlYxtWsNydfatQ6PKkMTOhu
         Ni0GXl2YVwGtviQ9gMNjDMDB4wEKUVb9XFXpHr0xCdNf8bH7aHgl/r/YMkTY0iEpW4jf
         fUCcIVV5wLCoKlJyNCqm6uvq5ynRIXoKf+m6ekcNy2hq/xWOApvA2faoeePnB+8uv7pI
         KgyA==
X-Forwarded-Encrypted: i=1; AJvYcCUIPGdaiT5LzmBElX/NWgrqXX8pMJrYHRSazyqjF7a8Pvrha4nSONEAaXRX+NWxF5oDfZgYATOVQDEKBXar1t8Y@lists.infradead.org
X-Gm-Message-State: AOJu0YzL3ObnUajHrLB23lD8f2conD7S55+6f20TL/Px2qjEjKlAXeGs
	w09Co4ndC6yLPySvtOpTXKXolvHyYUWd78ghOn9+g9mN7aGHg/9wlKkitvRetNgOAQ5tPDSYXh9
	R8BjOme0ISW3FacGDV/7ytzgL72xtE9bMs7oYpDOgmQ==
X-Gm-Gg: ASbGncvMUEYu1wmFzvnhfstj0JXcgVfyhUPeAi+Rdq6ZSjkx1VJ1bM+qavfbvX1ouhI
	4s3cdo865sTPjba1sENMJF5o305xCxOhy81+haX0XAGg995lWEH7Mw48LlU5fZXLdt6ThdHaDQ8
	cm7UjGLXcRjotz5Tudze7Ik5cWC9EUiAlli8ZG9sKQSWh4FNF8jS2239PgryhaMerLycvT9iIuk
	2iuzsSlCEYJgtn+04YEXGcWPRkYOEMdmtM2GE+6U141+EyjqjlUy3caQuUl5DWv7GT2f/YU3Yw8
	naI3XTcDqjRf/nA=
X-Google-Smtp-Source: AGHT+IEE1H2M6E68md2CvbeNASgGUriHWVB9qaOo9QOrW+nmquKWYbcNGDJmBvvG61zzqmoVo8F4qdYMWY0LOpJw9hk=
X-Received: by 2002:a05:6512:10d2:b0:594:35b7:aa7 with SMTP id
 2adb3069b0e04-5943d7ed597mr2555824e87.48.1762446221207; Thu, 06 Nov 2025
 08:23:41 -0800 (PST)
MIME-Version: 1.0
References: <20251106-gpio-of-match-v1-0-50c7115a045e@linaro.org> <20251106-gpio-of-match-v1-2-50c7115a045e@linaro.org>
In-Reply-To: <20251106-gpio-of-match-v1-2-50c7115a045e@linaro.org>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Thu, 6 Nov 2025 17:23:29 +0100
X-Gm-Features: AWmQ_ble_VVUCkQMV6BUnht3lKL4n7LMuzlixMmgduve1Vk6OdDcUVcnzGZ5wm0
Message-ID: <CAMRc=Mchtho0yDsSp+wwBt=yBGg1+3i8ifkUrip1MJaq-uk+0g@mail.gmail.com>
Subject: Re: [PATCH 2/4] gpio: aspeed: Simplify with of_device_get_match_data()
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: Linus Walleij <linus.walleij@linaro.org>, Joel Stanley <joel@jms.id.au>, 
	Andrew Jeffery <andrew@codeconstruct.com.au>, 
	Eugeniy Paltsev <Eugeniy.Paltsev@synopsys.com>, 
	Shubhrajyoti Datta <shubhrajyoti.datta@amd.com>, Srinivas Neeli <srinivas.neeli@amd.com>, 
	Michal Simek <michal.simek@amd.com>, linux-gpio@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-aspeed@lists.ozlabs.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251106_082347_299138_D6205A84 
X-CRM114-Status: GOOD (  17.55  )
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

On Thu, Nov 6, 2025 at 5:16=E2=80=AFPM Krzysztof Kozlowski
<krzysztof.kozlowski@linaro.org> wrote:
>
> Driver's probe function matches against driver's of_device_id table,
> where each entry has non-NULL match data, so of_match_node() can be
> simplified with of_device_get_match_data().
>
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> ---
>  drivers/gpio/gpio-aspeed.c | 7 ++-----
>  1 file changed, 2 insertions(+), 5 deletions(-)
>
> diff --git a/drivers/gpio/gpio-aspeed.c b/drivers/gpio/gpio-aspeed.c
> index 2e0ae953dd99..3d675b63936c 100644
> --- a/drivers/gpio/gpio-aspeed.c
> +++ b/drivers/gpio/gpio-aspeed.c
> @@ -1305,7 +1305,6 @@ MODULE_DEVICE_TABLE(of, aspeed_gpio_of_table);
>
>  static int aspeed_gpio_probe(struct platform_device *pdev)
>  {
> -       const struct of_device_id *gpio_id;
>         struct gpio_irq_chip *girq;
>         struct aspeed_gpio *gpio;
>         int rc, irq, i, banks, err;
> @@ -1323,8 +1322,8 @@ static int aspeed_gpio_probe(struct platform_device=
 *pdev)
>
>         raw_spin_lock_init(&gpio->lock);
>
> -       gpio_id =3D of_match_node(aspeed_gpio_of_table, pdev->dev.of_node=
);
> -       if (!gpio_id)
> +       gpio->config =3D of_device_get_match_data(&pdev->dev);

If you're already doing it, just use device_get_match_data() here and
elsewhere in the series.

Bart

> +       if (!gpio->config)
>                 return -EINVAL;
>
>         gpio->clk =3D devm_clk_get_enabled(&pdev->dev, NULL);
> @@ -1334,8 +1333,6 @@ static int aspeed_gpio_probe(struct platform_device=
 *pdev)
>                 gpio->clk =3D NULL;
>         }
>
> -       gpio->config =3D gpio_id->data;
> -
>         if (!gpio->config->llops->reg_bit_set || !gpio->config->llops->re=
g_bit_get ||
>             !gpio->config->llops->reg_bank_get)
>                 return -EINVAL;
>
> --
> 2.48.1
>

