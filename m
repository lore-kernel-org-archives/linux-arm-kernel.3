Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A9118E77188
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 22 Dec 2024 09:10:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=g+SzVktxDB05WNZgU2bzgDj3qvGv7E/lndUr61NmRhc=; b=vtkXV1A3QDAnacbPP34QH/JmEI
	4ciSdfSbfKECQ5NlvwSq648sU/6lke1rvVC5PnyU6uxtaOWLKG6ucv4zsqFaZLnVL9R7hhRVIw9fB
	PH7ELoLvcdCVvFKI7O4vnJTtDowpuaqCqEREOu9XGI7NDUqVgtXW50N7xtlAlQnwWRasn32gIejXP
	P/g2T8Ec7uzBCoHf134Fd4tIh+6SjYuIDiraxvhN/aY3V0K5xKowySQaotlUicVwAn7Hgf8/KJmES
	V89rYjOM2KU6/tOivHU4uz/IMPvM3NctdLj8hJjQHfz2HBKowMMcAXc4hqcknbW1oC+rRienf7BnH
	5zZpvy6Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tPHyc-000000084Bn-1vPw;
	Sun, 22 Dec 2024 09:10:18 +0000
Received: from mail-lj1-x231.google.com ([2a00:1450:4864:20::231])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tPHxQ-0000000844A-0Naq
	for linux-arm-kernel@lists.infradead.org;
	Sun, 22 Dec 2024 09:09:06 +0000
Received: by mail-lj1-x231.google.com with SMTP id 38308e7fff4ca-2ffd6af012eso43802291fa.2
        for <linux-arm-kernel@lists.infradead.org>; Sun, 22 Dec 2024 01:09:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1734858541; x=1735463341; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=g+SzVktxDB05WNZgU2bzgDj3qvGv7E/lndUr61NmRhc=;
        b=DWuf5vhXw7luB1fMlhyKugRwK3jSjUPpts/3WhGkIllFk9ornoIPRxxgxrrNHAGEUq
         CaC0ZkCHtNedYqaQzS3YDv+pm4iAeISU8kBhyrOrH09BLyysVfjzXGhsOGuhJTR79b7J
         PV7Li99+LXRdGSJpW8mcJXEGglChazW7ixQkRPUM9FLXabo1t/MTqKZb8RFfjQGj07r5
         h2c3v3StwphHUkjM2D4cIvr/ptv2grMuG/ZQf0QixqaiUIkrtLUKrDPnclhx3SJgME+k
         0ZQLeGz8+zHlLQY2KYdQ3vu6jXNaHQdFnJGt+V2Tu3KVvEgJXtjt2xFWvl1qV1kGjwHa
         WGzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734858541; x=1735463341;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=g+SzVktxDB05WNZgU2bzgDj3qvGv7E/lndUr61NmRhc=;
        b=LgGgoLWR+BEBMzgBlchn06QN/hYsDjiykrRZBTnOmLVgFuvXxWiban4uGsnqEbZhHd
         XpV+snQpdBPkj1+9xCOeZnSkOhSkzRUrVqH2CeYogERCL/0TaDra6WlWa9zmX61QHVPD
         2/pZAuQOd+M7iEFdOFwpUJPwVpKSjsmk+DV8wWQteCTr4Vecf6DywbF8eGDChBfrRYQL
         Dm3nYZLQqpRZVOOcWLxM10Rg8XD6qtvl34zkqhsG+sa50lVBsWFjKMxor+9eOGtzHMVC
         OF1jfe3OsSEP7jNErLh7u6A3OOekUt1Lf+msy2fS2eMI99D3NZsaqWZxrctDCKpz4sc1
         VPbA==
X-Forwarded-Encrypted: i=1; AJvYcCVdeDGpP5otllxRrW5LYUUnHYLh1P0/UEC6XMO0HAZ/zYLfXh5K3umZoIPZ/u271tXDqLLvS9QrxaUpyGiqaC4K@lists.infradead.org
X-Gm-Message-State: AOJu0Yy5c1D45iMdsrH0tw58nm5UOViXKLbzJ8kGAUEUZ8vle9AC/++F
	cki2KOn0FaKXPDCrp/gaXOFphqrVgWMXTDJ+AbLfU6334zggRMvrgSsSVzMwoRGlHPYQz7lCa10
	JWWp26nQB4UXixTE3ldjhJoY9nKVTo2Wy6vPpLg==
X-Gm-Gg: ASbGncuAsaF+/e/Y8mxr3Jsmmhgu9g+sdyFlFn3swth/e9+G904IUZp4Qr3BQYcALjQ
	Xt6DL1KFJFnq9mv6I0Tzt6VKd6L+kx+tUQQrJ
X-Google-Smtp-Source: AGHT+IH187CUQCnfRfnFev/oxx361vRPpnGwZKGEC40JgvkudCId/KMDE/KgqulM/xdtkLXQpR7G1mShXSPT7tAyjMQ=
X-Received: by 2002:a05:6512:104c:b0:541:1c48:8bf6 with SMTP id
 2adb3069b0e04-5422956c531mr2677617e87.53.1734858541379; Sun, 22 Dec 2024
 01:09:01 -0800 (PST)
MIME-Version: 1.0
References: <20241211-amlogic-pinctrl-v1-0-410727335119@amlogic.com>
 <20241211-amlogic-pinctrl-v1-2-410727335119@amlogic.com> <CACRpkdbuj-_sPpdfcyg3_QNtzt9r7n-0HBGBKgy-rKUMhvGo4w@mail.gmail.com>
 <23899c54-14ad-4724-9336-2df6fb485fd6@amlogic.com>
In-Reply-To: <23899c54-14ad-4724-9336-2df6fb485fd6@amlogic.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Sun, 22 Dec 2024 10:08:50 +0100
Message-ID: <CACRpkdZn75ks4Gc7rm8jzkKM6y0JeQmUF3qmbJA+O+cEA9r--Q@mail.gmail.com>
Subject: Re: [PATCH RFC 2/3] pinctrl: Add driver support for Amlogic SoCs
To: Xianwei Zhao <xianwei.zhao@amlogic.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>, 
	Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>, 
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>, linux-gpio@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241222_010904_974845_1E1EE1C9 
X-CRM114-Status: GOOD (  29.46  )
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

Hi Xianwei!

On Wed, Dec 18, 2024 at 10:37=E2=80=AFAM Xianwei Zhao <xianwei.zhao@amlogic=
.com> wrote:

> [Me]
> > In any way I recommend:
> >
> > - Renaming drivers/pinctrl/sunxi to drivers/pinctrl/amlogic
> >    so we keep this sorted by actual vendor, sunxi is apparently
> >    yours (AMlogic:s) isn't it?
> >
>
> It isn't. Sunxi is Allwinner SoCs.

My apologies. I mixed it up completely. :(

What do you think of the idea of a separate drivers/pinctrl/amlogic directo=
ry
though? I think there are already quite a few amlogic SoCs that need
to be supported and more will come.

> >> +       ret =3D pinconf_generic_parse_dt_config(np, info->pctl, &grp->=
configs,
> >> +                                             &grp->num_configs);
> >
> > But can't you just move this code around? grp->num_configs give the
> > number of configs, so why do you have to go and look up pinmux
> > above, can't you just use grp->num_configs instead of of_pins
> > and npins above?
> >
> They are different.
> The of_pins(grp->npins) specifies the mux values for pin-mux register
> and pin index in pinctrl. It can include multiple pins in groups.
>
> The grp->configs and grp->num_configs specify the configuration
> information for all pins of this groups(such as bias-pull-up,
> drive-strength-microamp)
>
> uart-d-pins2{
>         pinmux=3D <AML_PINMUX(AMLOGIC_GPIO_T, 7, AF2)>,
>                 <AML_PINMUX(AMLOGIC_GPIO_T, 8, AF2)>,
>                 <AML_PINMUX(AMLOGIC_GPIO_T, 9, AF2)>,
>                 <AML_PINMUX(AMLOGIC_GPIO_T, 10, AF2)>;
>         bias-pull-up;
>         drive-strength-microamp =3D <4000>;
> };

OK I get it ... I think. It's nice that you combine muxing and pin config
into the same node like this, it's very readable.

Think about if you even want to add generic helpers for this in
the generic code.

> >> +static void aml_pctl_dt_child_count(struct aml_pinctrl *info,
> >> +                                   struct device_node *np)
> >> +{
> >> +       struct device_node *child;
> >> +
> >> +       for_each_child_of_node(np, child) {
> >> +               if (of_property_read_bool(child, "gpio-controller")) {
> >> +                       info->nbanks++;
> >> +               } else {
> >> +                       info->nfunctions++;
> >> +                       info->ngroups +=3D of_get_child_count(child);
> >> +               }
> >> +       }
> >> +}
> >
> > This looks like a weird dependency between gpio chips and
> > pins that I don't quite understand. Some comments and
> > references to the bindings will be needed so it is clear
> > what is going on.
> >
>
> A pinctrl device contains two types of nodes. The one named GPIO bank
> which includes "gpio-controller" property. The other one named function
> which includes one or more pin groups.
> The pin group include pinmux property(pin index in pinctrl dev,and mux
> vlaue in mux reg) and pin configuration properties.

OK I  guess the binding patch explains why you need several
separate gpio controller "bank" nodes instead of just the base
node being one for all of the pins (which is the most
common). In a way I like it because it often helps to divide
up GPIOs by bank.

Yours,
Linus Walleij

