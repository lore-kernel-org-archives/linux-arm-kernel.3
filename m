Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0DFADC83038
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  2 Jul 2025 05:03:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=V0rt2nH/TWlCePhqIMfxbMwVAseEB+3Yn8nvDGBHf0Y=; b=KCJsoQzaFYSxUd
	T/OE2AtvI5MwEggO2uXSTqPh1gXf8fuQ1Ny66UwlLW5e2LqnS6nkcXpwgffVvjUozY/p/u3b6Yl85
	xa3YFcreyiUd/iL4khfN2YYxmxRqZX39ofZzCkbw+gATqRDmXHcQr/x3lMHiw6ZzatXt6M6PKEcFU
	ht/X9FDmPBG7jJKOoM71chX5m0vyr1knbZJ7DUxeAyKn7DCa7MpDYqswhQ+iC3F1TLINGAeUf0Y+L
	hmm0U5cY2CH+7CwIt0JjUkWgsCYQoJgDCG0BQkUR5ua/oOQWW68ZRjYp+v0P2icDzsmc8lqc7RWP/
	rkxV+ViQIlvms9Uo1Liw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uWpdN-00000007EJF-3gYF;
	Wed, 02 Jul 2025 05:03:49 +0000
Received: from mail-lf1-f52.google.com ([209.85.167.52])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uWpb2-00000007E4E-43JD
	for linux-arm-kernel@lists.infradead.org;
	Wed, 02 Jul 2025 05:01:26 +0000
Received: by mail-lf1-f52.google.com with SMTP id 2adb3069b0e04-553c31542b1so4644653e87.2
        for <linux-arm-kernel@lists.infradead.org>; Tue, 01 Jul 2025 22:01:24 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751432480; x=1752037280;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :reply-to:in-reply-to:references:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=V0rt2nH/TWlCePhqIMfxbMwVAseEB+3Yn8nvDGBHf0Y=;
        b=PT5dXralgU8JtqRoMcqCqpjhSpPufi0CDWYiB17ScJg2+eTlppnk85HJVkJ6vVhlEQ
         rp7SZYKHehVyOdL6pQHr4z8mcUwJHEpos0qQa5iltQ7S4LMePGF/EjuSRp1K62UxuXq/
         ZKlcbT5LJA+LrT+bqBrgyFHGrmvNTgmUYOUPgFbISsmjsPWxOizn5w2D0i3h1t4V3F1L
         EsopEgOvMv1p6aQw4bcGu7q9/1+/E4B0IjPyjm6WSHVeSgx+3QFBr65Erc15jvajFaMs
         jqK6VA3mHk+KL/oHP4gOILONT+mv2WMqXOOAwFGGA8JONojasAQBxlToIyAYEUIYolqv
         6VmA==
X-Forwarded-Encrypted: i=1; AJvYcCXE08n5QF+FD0WtGmgK32OPgnhPYX3dWpfdZW15kOzLedz9ZqU9rVyTBNI9Yn+YlKC4QNgfSWnj8psAliA32jUB@lists.infradead.org
X-Gm-Message-State: AOJu0YyGTdM4bd1uS6h+AUqxF+Ez3MFurldhv9jK+oSET+cx9Tdy6BBc
	s4Vc9mbmnzGKNVq5R4DyZx1gb6i+Vg+JcHFdRR59LSLRH3aYKMmWfEY6aM2XEPaJ
X-Gm-Gg: ASbGnctI7CTQ+nO8QRWgz6r19RLoelrMVGpd3ZbvBLrs+XVvGoY6F6H+TdZX2jz23Ic
	QavvFe4NDw7qxPxWrVjGgPzcfDOKmMNsedBxUJF6tYh2CcLEs70dUGhnM4IULxWQ0AVYLr4Ie04
	H/PNkAY+Ggn4Vtp8XwuSatSTzLZl0VGsrVweDW8mN4uP13UM/Z41ZDeGlyslId+OUIVfuXkE2by
	0faLCdQ1iKZmRQG7A0G4GHnviNdUyEYjAqle/NO6AIZqOCvT/lWN8kcKTNop0P6QjFdRFadavS7
	TSUqegNx0wiL1XtismxWyU4mlDixAqQfNnUaCaijedgI3PDvvunMkCdcGmVFfMVbaR9oFMeVs65
	PWVkDwHWF68HbW1rRKrI=
X-Google-Smtp-Source: AGHT+IFZSrI3NqbglqhP7PvXodGx2dTr5zwTJQfosSOAwH751mN1SPcyhHCoFTiV4zTtSLqsDFxYpA==
X-Received: by 2002:a05:6512:3d9f:b0:553:3544:2b31 with SMTP id 2adb3069b0e04-5562836d01amr446923e87.40.1751432479281;
        Tue, 01 Jul 2025 22:01:19 -0700 (PDT)
Received: from mail-lj1-f180.google.com (mail-lj1-f180.google.com. [209.85.208.180])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5550b2b95b7sm2005712e87.108.2025.07.01.22.01.17
        for <linux-arm-kernel@lists.infradead.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 01 Jul 2025 22:01:18 -0700 (PDT)
Received: by mail-lj1-f180.google.com with SMTP id 38308e7fff4ca-32b553e33e6so35004751fa.2
        for <linux-arm-kernel@lists.infradead.org>; Tue, 01 Jul 2025 22:01:17 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCUpBUXnq/ZbVmOAdvzXFEVzsie136fnKXomE6HDOSUaqEl8B2EjHxSjkm7oiR8F75uuJW+xTe7D6CFjI6ptNSEu@lists.infradead.org
X-Received: by 2002:a05:651c:e1b:b0:32a:6c63:92a with SMTP id
 38308e7fff4ca-32e0004b940mr3217911fa.22.1751432477399; Tue, 01 Jul 2025
 22:01:17 -0700 (PDT)
MIME-Version: 1.0
References: <20250701165756.258356-1-wens@kernel.org> <20250701165756.258356-5-wens@kernel.org>
In-Reply-To: <20250701165756.258356-5-wens@kernel.org>
From: Chen-Yu Tsai <wens@csie.org>
Date: Wed, 2 Jul 2025 13:01:04 +0800
X-Gmail-Original-Message-ID: <CAGb2v646HvqipGd_C=WJ4LGsumFfF5P9a7XQ7UGO6t1901DDiw@mail.gmail.com>
X-Gm-Features: Ac12FXxOhT5Y9cipxD-0Dp_WlsoVmLL1HMEja_1PgcoQyh6p3ZogoQeQ7CimJkk
Message-ID: <CAGb2v646HvqipGd_C=WJ4LGsumFfF5P9a7XQ7UGO6t1901DDiw@mail.gmail.com>
Subject: Re: [PATCH RFT net-next 04/10] soc: sunxi: sram: register regmap as syscon
To: Andrew Lunn <andrew+netdev@lunn.ch>, "David S. Miller" <davem@davemloft.net>, 
	Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Chen-Yu Tsai <wens@csie.org>, Jernej Skrabec <jernej@kernel.org>, Samuel Holland <samuel@sholland.org>
Cc: netdev@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev, 
	linux-kernel@vger.kernel.org, Andre Przywara <andre.przywara@arm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250701_220125_003750_9C26C4D9 
X-CRM114-Status: GOOD (  20.05  )
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
Reply-To: wens@csie.org
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

On Wed, Jul 2, 2025 at 12:58=E2=80=AFAM Chen-Yu Tsai <wens@kernel.org> wrot=
e:
>
> From: Chen-Yu Tsai <wens@csie.org>
>
> Until now, if the system controller had a ethernet controller glue layer
> control register, a limited access regmap would be registered and tied
> to the system controller struct device for the ethernet driver to use.
>
> Signed-off-by: Chen-Yu Tsai <wens@csie.org>
> ---
>  drivers/soc/sunxi/sunxi_sram.c | 6 ++++++
>  1 file changed, 6 insertions(+)
>
> diff --git a/drivers/soc/sunxi/sunxi_sram.c b/drivers/soc/sunxi/sunxi_sra=
m.c
> index 4f8d510b7e1e..63c23bdffa78 100644
> --- a/drivers/soc/sunxi/sunxi_sram.c
> +++ b/drivers/soc/sunxi/sunxi_sram.c
> @@ -12,6 +12,7 @@
>
>  #include <linux/debugfs.h>
>  #include <linux/io.h>
> +#include <linux/mfd/syscon.h>
>  #include <linux/module.h>
>  #include <linux/of.h>
>  #include <linux/of_address.h>
> @@ -377,6 +378,7 @@ static int __init sunxi_sram_probe(struct platform_de=
vice *pdev)
>         const struct sunxi_sramc_variant *variant;
>         struct device *dev =3D &pdev->dev;
>         struct regmap *regmap;
> +       int ret;
>
>         sram_dev =3D &pdev->dev;
>
> @@ -394,6 +396,10 @@ static int __init sunxi_sram_probe(struct platform_d=
evice *pdev)
>                 regmap =3D devm_regmap_init_mmio(dev, base, &sunxi_sram_r=
egmap_config);
>                 if (IS_ERR(regmap))
>                         return PTR_ERR(regmap);
> +
> +               ret =3D of_syscon_register_regmap(dev->of_node, regmap);
> +               if (IS_ERR(ret))

BroderTuck on IRC pointed out that this gives a compiler warning.
Indeed it is incorrect. It should test `ret` directly.

ChenYu

> +                       return ret;
>         }
>
>         of_platform_populate(dev->of_node, NULL, NULL, dev);
> --
> 2.39.5
>
>

