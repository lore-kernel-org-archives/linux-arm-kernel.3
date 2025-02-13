Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E1190C0219D
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 13 Feb 2025 10:07:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=5ET9GwN+uLjDsvjU0KoNteKFJwQHfNy0LS4Dkz43P3s=; b=vqhylfLpd1XtB+smXvx5nGkTU5
	jzBBbvDCNSDlkn5RgzM1fu0Ex1HNAVrzVwC88BpC3jt87URX7PHUQP1MTheTzQZk+NLWsWVuzAe1j
	cmkMBN86qTlPnUlnuVdauGjYtvZT8V1JDEPWywheXDAeiM/WEukkd3Pr5gETy+Oaj+1TERePza4kc
	eFA986jSTGoKqy4xwn9ufqFtZQ4pVnjRe7CKG3cpieHi1ohrgACKiMjjEPE1f/BqaHBRZMWRk4mlC
	2VXX339lx61jDV+4wFYDiUpGfNJlrq6Vs/7DucqOB7C0IgD2vX5LihmOTzAYwaC786hHmzIzXirjn
	91SrXNkw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tiW8J-0000000Aaf1-0gz5;
	Thu, 13 Feb 2025 10:07:47 +0000
Received: from mail-vk1-f170.google.com ([209.85.221.170])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tiW6r-0000000AaJC-45um
	for linux-arm-kernel@lists.infradead.org;
	Thu, 13 Feb 2025 10:06:19 +0000
Received: by mail-vk1-f170.google.com with SMTP id 71dfb90a1353d-520602fc185so215540e0c.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 13 Feb 2025 02:06:17 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739441175; x=1740045975;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=5ET9GwN+uLjDsvjU0KoNteKFJwQHfNy0LS4Dkz43P3s=;
        b=AyUgzg89ay7v2yi6D1exIUXoGcywp2SAiJe/RkHqUsVqByQFFY716Tl4T3+r/pEbFO
         TEOjd10sqMI0d9/+Paaq2CXetfw2rDIhiqo21hQTJUn9khdt8HnswwqFW2c8lwCx4Cyi
         5iuRnRM2FuFv4bz1r7SRR2kqVlN/1BEy1G6PxHvYl1u8JcB/xUSxv2ZqfKr1u7figOZj
         v0RcBAs2vzLldg0UMLoudnLP46szImC4YDRzX5z8rCagM0hgYtJ6dBlDq2IFY6JXVZxI
         WqXDRJ0uFpV+GUaroLURTVeegUuOP7OWELORp02uR5GDEgmI89wLS/XKWK+Pj6ORI4F4
         HBPQ==
X-Forwarded-Encrypted: i=1; AJvYcCW9bbooM6wSiEPZb8BQQ6BVSOisJWfnV9k2edGtNoQqUDKCYOWT5l/BvgM1TWX4rXoxkzgBnFBzjxbtaRp/C++y@lists.infradead.org
X-Gm-Message-State: AOJu0YwdkOlarTQU1PPoB9kRCqajw/I5wvWXF0XNPDJl4FO75HInJAMA
	sOpA/BnvBwUF5V1eDA7hvF35x0ogm6ndRDSRg3K9yiHJMXlk7X4ukzjsG9sqCBw=
X-Gm-Gg: ASbGnctVjm/lcdCg22L2+jfL5BgBXwBaF4M1yhNrSNLlF+cJ1YI6ZPeznxQu8u3+PTC
	NqrYzerea22S3QUzVXvm8MoQbsMhA52QM8AV6mtfsP7EPJY1GaAFeCzl73vMmtniIP6JS8/u7KV
	RcgY4iWCR+Tf/2FF1BPqx7KrXccjTP2fHL1a5qMHMY1g0u3SCdx5B40c0nK1YWuCbhn9dvV3nyW
	fO3B8beVNlLG8DAQWtxnOKbWdch3elVqV4kW6B9mSri5tizZub5/tFA0xmhMRwhE6CmZrKjz/8d
	l8fcTSSC1GeH/rmYNPqv5O4nz7wuJDjSgxqG9CMCGN+pO0zQKdgEkA==
X-Google-Smtp-Source: AGHT+IHQKtl3xMfmKH/GRYRJocog69IbYuqLaMjAYiaY6cJnu3SPhgXXYNiVUKM0klHocdZ/IGZR5w==
X-Received: by 2002:a05:6122:a15:b0:520:51a4:b81c with SMTP id 71dfb90a1353d-52067d47144mr6356555e0c.6.1739441175576;
        Thu, 13 Feb 2025 02:06:15 -0800 (PST)
Received: from mail-vs1-f47.google.com (mail-vs1-f47.google.com. [209.85.217.47])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-5207aa85ea4sm114232e0c.22.2025.02.13.02.06.14
        for <linux-arm-kernel@lists.infradead.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 13 Feb 2025 02:06:14 -0800 (PST)
Received: by mail-vs1-f47.google.com with SMTP id ada2fe7eead31-4bbf29bad0cso184067137.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 13 Feb 2025 02:06:14 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCV9x0YJ00GyynEmauLRO3SEtKpoyJ7ONiEAbJCbaJZxKOADJOeZVt0EgMVodQIQ+YqSszlsQMR8jLKB44kdMpUj@lists.infradead.org
X-Received: by 2002:a05:6102:3f94:b0:4b6:18b3:a4db with SMTP id
 ada2fe7eead31-4bbf21c8337mr7301506137.8.1739441174414; Thu, 13 Feb 2025
 02:06:14 -0800 (PST)
MIME-Version: 1.0
References: <20250205-clk-ssc-v2-0-fa73083caa92@nxp.com> <20250205-clk-ssc-v2-1-fa73083caa92@nxp.com>
In-Reply-To: <20250205-clk-ssc-v2-1-fa73083caa92@nxp.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 13 Feb 2025 11:06:01 +0100
X-Gmail-Original-Message-ID: <CAMuHMdWn+sKiC1B4MF1vHwS2ArFYQXGzpYi2EcsyERPSCc9bvQ@mail.gmail.com>
X-Gm-Features: AWEUYZlvlExVgKAlPqcQ55dSJRN4GqYY50RVEAwpoHERFHUH_dWoi8JrSM7k46E
Message-ID: <CAMuHMdWn+sKiC1B4MF1vHwS2ArFYQXGzpYi2EcsyERPSCc9bvQ@mail.gmail.com>
Subject: Re: [PATCH v2 1/4] clk: Introduce clk_hw_set_spread_spectrum
To: "Peng Fan (OSS)" <peng.fan@oss.nxp.com>
Cc: Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
	Russell King <linux@armlinux.org.uk>, Sudeep Holla <sudeep.holla@arm.com>, 
	Cristian Marussi <cristian.marussi@arm.com>, Abel Vesa <abelvesa@kernel.org>, 
	linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org, 
	arm-scmi@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk@kernel.org>, 
	Dario Binacchi <dario.binacchi@amarulasolutions.com>, Shawn Guo <shawnguo@kernel.org>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>, 
	Fabio Estevam <festevam@gmail.com>, imx@lists.linux.dev, Peng Fan <peng.fan@nxp.com>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250213_020618_013295_45E1A1B3 
X-CRM114-Status: GOOD (  23.01  )
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

Hi Peng,

On Wed, 5 Feb 2025 at 10:51, Peng Fan (OSS) <peng.fan@oss.nxp.com> wrote:
> From: Peng Fan <peng.fan@nxp.com>
>
> Add clk_hw_set_spread_spectrum to configure a clock to enable spread
> spectrum feature. set_spread_spectrum ops is added for clk drivers to
> have their own hardware specific implementation.
>
> Signed-off-by: Peng Fan <peng.fan@nxp.com>

Thanks for your patch!

> --- a/include/linux/clk-provider.h
> +++ b/include/linux/clk-provider.h
> @@ -84,6 +84,28 @@ struct clk_duty {
>         unsigned int den;
>  };
>
> +/* Aligned with dtschema/schemas/clock/clock.yaml */
> +enum clk_ssc_method {
> +       CLK_SSC_CENTER_SPREAD,
> +       CLK_SSC_UP_SPREAD,
> +       CLK_SSC_DOWN_SPREAD,
> +};
> +
> +/**
> + * struct clk_spread_spectrum - Structure encoding spread spectrum of a clock
> + *
> + * @modfreq:           Modulation frequency
> + * @spreadpercent:     Modulation percent

E.g. Renesas R-Car V4M also supports 0.5%, 1.5%, and 2.5%.

> + * @method:            Modulation method
> + * @enable:            Modulation enable or disable
> + */
> +struct clk_spread_spectrum {
> +       unsigned int modfreq;
> +       unsigned int spreaddepth;
> +       enum clk_ssc_method method;
> +       bool enable;

Do you envision a use case for having a separate enable flag?
The alternative would be to add an extra enum value above:

    CLK_SSC_NO_SPREAD = 0,

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

