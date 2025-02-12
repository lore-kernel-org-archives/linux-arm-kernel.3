Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6AC52C02198
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 12 Feb 2025 22:07:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=AyeS31oOn+dyoHdEWwNg/btCvozuEbvtdJVbwfowCPI=; b=nrka90e/Deig0mpkYSD7ZUHkMu
	y0mH9MGvtlHUurfUYR0nIxtFT6k9YMd0/+7Wzh8IfnNGvfftIj6cOdn1ulj44Ujl3uXiBNzjC/ReU
	FiGNEwOkP/MYtTruld2AcDEkMyqh4hvWSk0Ikha/C8xIjsnlBVdPgrg3xM494z390Z0nuJYE844bs
	zTREOT0ineETciTiPstm/UDUR0L7o1Z4RZuzXkrxQ5xO3l1ejBswHAZr9q2ahHK+CHAxacLCu9tPo
	dDk3Cz8nVKXvVjrNKEpG/2r6GgkRZztWaK9k6pO+5mSesYATHG88GcK9/Qwr2swWdiPEKPgP6/9cU
	SNLWqfJw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tiKtF-00000008z6B-2eet;
	Wed, 12 Feb 2025 22:07:29 +0000
Received: from mail-lj1-x22d.google.com ([2a00:1450:4864:20::22d])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tiKrd-00000008yfj-3uqA
	for linux-arm-kernel@lists.infradead.org;
	Wed, 12 Feb 2025 22:05:51 +0000
Received: by mail-lj1-x22d.google.com with SMTP id 38308e7fff4ca-30613802a59so2439551fa.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 12 Feb 2025 14:05:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1739397948; x=1740002748; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=AyeS31oOn+dyoHdEWwNg/btCvozuEbvtdJVbwfowCPI=;
        b=xso6LEbzPFxSSbHcr0LxOCGrlVXAaCduwcSuVZNPtKkwfJrecIe4x2RtdpbCc41oBl
         Gd4xJzSz5RYlZRmHO7TUQBCLC297JU/hN2XM/DyYcv1vR82hLvEWOUysZjsMaSvZmZxo
         DSh/CNlO2keX4Kcmylj9OC6Kbo+CyDcfkJNJAu0/DsGxXE4Q4kJE0+LI5g5fYic2FYvV
         JD/DrJuW2DxSxWSb+AzkBF2MjN+rtskgVCgHVgrZTDnOpdcwDfUeng3bVYodVnidReZG
         fTK1Dkjf3AwgYOnHuKPf2DQRDePwT4K6FI7oZw4cfJfGYjPzhdrYJ3Vkes9Jq2iWqpLa
         9VPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739397948; x=1740002748;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=AyeS31oOn+dyoHdEWwNg/btCvozuEbvtdJVbwfowCPI=;
        b=k48t/Zg/EGBCtoJvgOFzvSl5Oyb174k9OQwJejI5Wu6dg5qppN81zWIw5RtTQqrxLE
         uMLlbe7+jYbu+7mV3QxpzVuN6aZqbIxDf0omW5NzrfZoQGFdqnOmxJg7zzgJfJeqgU50
         3cDV5uF3aMom0tDyzX9op0yT/TMfaeZ8nxAEUHA1sh3wzccCDcZCF8oJzfuShW0ef2OH
         stzQ951Hs41YQlOQwUBVTwBvzI6Ytjf0NuW5Z7dAxUt5HGXw9sNGYE0rSGWSprhFpoOH
         aIglppTdLQGOc0ScvEEK/eo2BV6VqBCk1Je6MrhXUAv0eDzEcgvyuFwQDUntKUEILM3/
         9FAA==
X-Forwarded-Encrypted: i=1; AJvYcCV0L729uZmVcFnwr7ORYSq8zPRxJ4tdYS6ZhxVsXLjZTAniZaowX/ZEPr1zOfVqmhCXZ1NPnv/Sf6iVo2wGwUy8@lists.infradead.org
X-Gm-Message-State: AOJu0YxzozrwOYcE0BE18O2/7sbtJe6NGjzKTSJOPYjMW4817mVflKQp
	/wF5UsDKJYi+m6N+B6X8KcEZzEHenXmZF8NhbS1MPxV7o4joQOiA51l6WyJ5rRjklzBOTOFGv+U
	yUYkHOyDU/R/lKKjSHp67GOdS58x5tmDAEf3Rcw==
X-Gm-Gg: ASbGncv+u/x6NREuyzSsrJCIWBWFDLAu1Uig2wy1gw5T+Qfo1S5bty3CGhm768LBXXL
	0EEtwzgT8dBmsLLTMLQRBNHitl5w4elOFW+3lD3pyos77plKNV0XxmqtGM6c8/FAIt2SIIbGJ
X-Google-Smtp-Source: AGHT+IFVaagqh0CMTsKcRkmd3v9fDc83O1leceTlQ3IBKxH8tfOt/VuYKAEwsc8W8nqObHABGLW4nQjjLkytNesf0P0=
X-Received: by 2002:a2e:a9a6:0:b0:301:12:1ef3 with SMTP id 38308e7fff4ca-3090363078fmr16793271fa.4.1739397948015;
 Wed, 12 Feb 2025 14:05:48 -0800 (PST)
MIME-Version: 1.0
References: <20250212-kernel-upstreaming-add_gpio_support-v1-0-080e724a21f3@blaize.com>
 <20250212-kernel-upstreaming-add_gpio_support-v1-3-080e724a21f3@blaize.com>
In-Reply-To: <20250212-kernel-upstreaming-add_gpio_support-v1-3-080e724a21f3@blaize.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Wed, 12 Feb 2025 23:05:36 +0100
X-Gm-Features: AWEUYZlDq7_9jonIwEr0yAB71k3AJVNBKOFS6VlejNFuOFWzLB734tg5VjHuCCs
Message-ID: <CACRpkdaWSgTO=S=L=m4bCXCU5b7aOG-DzN-TLEvPjb-QZGc72A@mail.gmail.com>
Subject: Re: [PATCH 3/5] gpio: vsiapb: Add VeriSilicon APB support
To: Nikolaos Pasaloukos <nikolaos.pasaloukos@blaize.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, James Cowgill <james.cowgill@blaize.com>, 
	Matt Redfearn <matthew.redfearn@blaize.com>, Neil Jones <neil.jones@blaize.com>, 
	Bartosz Golaszewski <brgl@bgdev.pl>, Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, 
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, 
	"linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, 
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250212_140549_973841_60F9E5AE 
X-CRM114-Status: GOOD (  12.30  )
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

Hi Nikolaos,

thanks for your patch!

This driver is really high quality, only nitpicks below.

With these addressed:
Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

On Wed, Feb 12, 2025 at 2:47=E2=80=AFPM Nikolaos Pasaloukos
<nikolaos.pasaloukos@blaize.com> wrote:

> VeriSilicon APB v0.2 is a custom GPIO design provided from VeriSilicon
> Microelectronics. It has 32 input/output ports which can be
> configured as edge or level triggered interrupts. It also provides
> a de-bounce feature.
>
> Signed-off-by: Nikolaos Pasaloukos <nikolaos.pasaloukos@blaize.com>
(...)
> +config GPIO_VSIAPB
> +       tristate "Verisilicon APB GPIO support"
> +       depends on OF_GPIO
> +       select GPIO_GENERIC
> +       select GPIOLIB_IRQCHIP
> +       select IRQ_DOMAIN_HIERARCHY

Are you really using the hierarchical domain?

Not in this driver, right? This is just regular chained IRQ.

> +       /* configure the gpio chip */
> +       gc =3D &chip->gc;
> +       gc->owner =3D THIS_MODULE;

I think the core sets up owner for you so you can drop this assignment?

Yours,
Linus Walleij

