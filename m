Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8136BCEB2EE
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 15 Nov 2025 17:44:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=iS8st6S4NEhfwQi2ADWQ0RHyYWa8wB83L+ih+AMC2co=; b=jhbAOPaJePp/ON
	keT9GZF3LY6mS7Yhsl/MBI8larVc+XNclBWrr25R2VsI3s7PpwNpM1Fmg05rFnsU7MSIZr55u6hPg
	rqGxnL00xSwNOi4lf2JbSm7MdG94t1GcVz8aHhCH2N1YfYxxsOez4GlYXnPrPfqS8TCnkGbLPxxgf
	OMFVwinYDT7ujmpdY4wipNnGQGzbUV92s0f90IWVb6jp0anO+ggH4B4MQ+ibGnkRo3AEK4j+dR81k
	VwJWQmvQB8Oev7pa/e9OQMCq0fjij7RqsL+wAP2lNVGGl+IW3WkTDbDnhcvlFJfNR1/Hc8QZOtiF8
	c3Mxe4+Lvs8m1DBda6Ig==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vKKJa-0000000Dxgy-0IFN;
	Sat, 15 Nov 2025 17:43:58 +0000
Received: from mail-ej1-f41.google.com ([209.85.218.41])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vKKJX-0000000Dxg3-3RzP
	for linux-arm-kernel@lists.infradead.org;
	Sat, 15 Nov 2025 17:43:57 +0000
Received: by mail-ej1-f41.google.com with SMTP id a640c23a62f3a-b737c6c13e1so126454766b.3
        for <linux-arm-kernel@lists.infradead.org>; Sat, 15 Nov 2025 09:43:54 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763228633; x=1763833433;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :reply-to:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=iS8st6S4NEhfwQi2ADWQ0RHyYWa8wB83L+ih+AMC2co=;
        b=Hw+wYH06ledrgl+EdG1ad+PzXYquOwOzBlW2cvSqgiNbQA7JZXsZrnq28aj8Fclo3E
         CwMciMLasDPYPbdRBwEtwWVi3DLgNh4+p/GSPTbST+Nf2vtPYN2YQbky5DMfHQsDIKwg
         B3vcWmCf1gDeesU1djBwORngo2hU8niAzBfxtrmXbAVpDKibwiqTd0hw1DC6ccuZ+X6i
         ia0Se29q/KYKKoPMyNB4wfav7beezYcYZol6yiE1YvN6qVfpEWpDn4kOY8GylRkUXkVl
         VarB3/6b3Lsy0XIwNLw+KEqx9Ct1rr2VyoU4BcaG7Ml+Fzd7Tg3GTETBOrJjOej9w3sW
         zSnQ==
X-Forwarded-Encrypted: i=1; AJvYcCXtTTgxH+JiGw26gpX9PICeY0xS20i37s4dgeiks1EIYF2IJYBdT69CkcwauLD8E9j02HewNTk32LX3CRtUWvAQ@lists.infradead.org
X-Gm-Message-State: AOJu0Yz7VBjbb9UEvYiObJmzx0tA2eAZgmJady7YLPIYZJA9EJvnFDZG
	9WitdEsSPlRW4oWkk1ydx/Dv/x7CopUWAWQdSH7tNkEu6P5kzia1/giUGbmczNRl
X-Gm-Gg: ASbGncsKCTGRRFS8JD42zI12p9j0eXjbsWJL6TMHpIWbAxHT+81RHOVrE7HjEdRP3Iu
	KtluOFJAssFhh0C7oEvma1RiZr5H4lcq/jmH4Bf6TRjLSqQAgykDI5PhRiHKmLuTYW2wCA0J9tI
	KdUm/RiGIMnZ7TAzr2dfNqh1G+XYCaWtwU4H2P9JnLgKAAnt67ZAsnru/MIsyz8AIWpd86lQqui
	DKmesHcuXRw/yQ4ySqk7udu+xrvFz+Y/XoW0LxunXqW2wSZf6gLmY7aZLxp7DSvDdJpBuu7xyxG
	bKjeYfZxFcc3keFTx9PHy9M5CVpXJxqqrba5m+X7XG5JslN6lzQYBZlaJdZgGjxTi8byv/lSVKS
	nmA6mfOW6FgkHNAbSe7D08Pk40B2NuWawjiYVVQrD95YH4rK1AKDml1p39UcyRPOPGas4fH8w5c
	D/JTYrC3XSSa5GHUUFOHWxtSS6WDqg
X-Google-Smtp-Source: AGHT+IHGT+waQI/aKIzvWQsr9EQeXqnjGKIfL71F5LworsA3MpgIAD8tgXEs7LBEkqlX0w/kB079Sw==
X-Received: by 2002:a17:907:1b1b:b0:b72:af1f:af7d with SMTP id a640c23a62f3a-b736789cb8dmr742981566b.29.1763228633014;
        Sat, 15 Nov 2025 09:43:53 -0800 (PST)
Received: from mail-ej1-f50.google.com (mail-ej1-f50.google.com. [209.85.218.50])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b734fa81223sm671715466b.4.2025.11.15.09.43.52
        for <linux-arm-kernel@lists.infradead.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 15 Nov 2025 09:43:52 -0800 (PST)
Received: by mail-ej1-f50.google.com with SMTP id a640c23a62f3a-b735e278fa1so407122266b.0
        for <linux-arm-kernel@lists.infradead.org>; Sat, 15 Nov 2025 09:43:52 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCU9DOij0hsHocZ6aEUrRwRUpSgMcIvQ8E+qMJ9+HUDCTbs7aJXewTAdYLHGYyX5SKKgFzPraIAQkdhSnQJGRD9P@lists.infradead.org
X-Received: by 2002:a05:651c:41d5:b0:37a:4c29:3a90 with SMTP id
 38308e7fff4ca-37babac1aa5mr18627811fa.0.1763228257141; Sat, 15 Nov 2025
 09:37:37 -0800 (PST)
MIME-Version: 1.0
References: <20251115141347.13087-1-jernej.skrabec@gmail.com> <20251115141347.13087-4-jernej.skrabec@gmail.com>
In-Reply-To: <20251115141347.13087-4-jernej.skrabec@gmail.com>
From: Chen-Yu Tsai <wens@csie.org>
Date: Sun, 16 Nov 2025 01:37:24 +0800
X-Gmail-Original-Message-ID: <CAGb2v64xOrLzPYNOfFNFfPckR8EUF_U6xY0J_a3G7b0Ymb4OnA@mail.gmail.com>
X-Gm-Features: AWmQ_bmhcY2-o8gJRo_3ltGzVFP1TpTD5csESojSsWw724bLMcf3HNL8i2V4XHQ
Message-ID: <CAGb2v64xOrLzPYNOfFNFfPckR8EUF_U6xY0J_a3G7b0Ymb4OnA@mail.gmail.com>
Subject: Re: [PATCH 3/7] clk: sunxi-ng: de2: Export register regmap for DE33
To: Jernej Skrabec <jernej.skrabec@gmail.com>
Cc: samuel@sholland.org, mripard@kernel.org, maarten.lankhorst@linux.intel.com, 
	tzimmermann@suse.de, airlied@gmail.com, simona@ffwll.ch, robh@kernel.org, 
	krzk+dt@kernel.org, conor+dt@kernel.org, mturquette@baylibre.com, 
	sboyd@kernel.org, dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev, 
	linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251115_094355_885694_EEEB2A22 
X-CRM114-Status: GOOD (  27.11  )
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

On Sat, Nov 15, 2025 at 10:14=E2=80=AFPM Jernej Skrabec
<jernej.skrabec@gmail.com> wrote:
>
> DE33 clock pre-set plane mapping, which is not something that we want
> from clock driver. Export registers instead, so DRM driver can set them
> properly.
>
> Signed-off-by: Jernej Skrabec <jernej.skrabec@gmail.com>
> ---
>  drivers/clk/sunxi-ng/ccu-sun8i-de2.c | 53 ++++++++++++++++++++++++++--
>  1 file changed, 50 insertions(+), 3 deletions(-)
>
> diff --git a/drivers/clk/sunxi-ng/ccu-sun8i-de2.c b/drivers/clk/sunxi-ng/=
ccu-sun8i-de2.c
> index a6cd0f988859..2841ec922025 100644
> --- a/drivers/clk/sunxi-ng/ccu-sun8i-de2.c
> +++ b/drivers/clk/sunxi-ng/ccu-sun8i-de2.c
> @@ -6,9 +6,11 @@
>  #include <linux/clk.h>
>  #include <linux/clk-provider.h>
>  #include <linux/io.h>
> +#include <linux/mfd/syscon.h>
>  #include <linux/module.h>
>  #include <linux/of.h>
>  #include <linux/platform_device.h>
> +#include <linux/regmap.h>
>  #include <linux/reset.h>
>
>  #include "ccu_common.h"
> @@ -250,6 +252,41 @@ static const struct sunxi_ccu_desc sun50i_h616_de33_=
clk_desc =3D {
>         .num_resets     =3D ARRAY_SIZE(sun50i_h5_de2_resets),
>  };
>
> +/*
> + * Add a regmap for the DE33 plane driver to access plane
> + * mapping registers.
> + * Only these registers are allowed to be written, to prevent
> + * overriding clock and reset configuration.
> + */
> +
> +#define SUN50I_DE33_CHN2CORE_REG 0x24
> +#define SUN50I_DE33_PORT02CHN_REG 0x28
> +#define SUN50I_DE33_PORT12CHN_REG 0x2c
> +
> +static bool sun8i_de2_ccu_regmap_accessible_reg(struct device *dev,
> +                                               unsigned int reg)
> +{
> +       switch (reg) {
> +       case SUN50I_DE33_CHN2CORE_REG:
> +       case SUN50I_DE33_PORT02CHN_REG:
> +       case SUN50I_DE33_PORT12CHN_REG:
> +               return true;
> +       default:
> +               return false;
> +       }
> +}

Since the registers are contiguous, I think it makes a bit more sense
to use the .rd_table and .wr_table. A bonus is that the check can be
inlined in the core instead of calling a function pointer.

> +static const struct regmap_config sun8i_de2_ccu_regmap_config =3D {
> +       .reg_bits       =3D 32,
> +       .val_bits       =3D 32,
> +       .reg_stride     =3D 4,
> +       .max_register   =3D 0xe0,

None of the registers past SUN50I_DE33_PORT12CHN_REG are accessible,
so we should probably just put that here.

> +
> +       /* other devices have no business accessing other registers */
> +       .readable_reg   =3D sun8i_de2_ccu_regmap_accessible_reg,
> +       .writeable_reg  =3D sun8i_de2_ccu_regmap_accessible_reg,
> +};
> +
>  static int sunxi_de2_clk_probe(struct platform_device *pdev)
>  {
>         struct clk *bus_clk, *mod_clk;
> @@ -303,13 +340,23 @@ static int sunxi_de2_clk_probe(struct platform_devi=
ce *pdev)
>         }
>
>         /*
> -        * The DE33 requires these additional (unknown) registers set
> +        * The DE33 requires these additional plane mapping registers set
>          * during initialisation.
>          */
>         if (of_device_is_compatible(pdev->dev.of_node,
>                                     "allwinner,sun50i-h616-de33-clk")) {
> -               writel(0, reg + 0x24);
> -               writel(0x0000a980, reg + 0x28);
> +               struct regmap *regmap;
> +
> +               regmap =3D devm_regmap_init_mmio(&pdev->dev, reg,
> +                                              &sun8i_de2_ccu_regmap_conf=
ig);
> +               if (IS_ERR(regmap)) {
> +                       ret =3D PTR_ERR(regmap);
> +                       goto err_assert_reset;
> +               }
> +
> +               ret =3D of_syscon_register_regmap(pdev->dev.of_node, regm=
ap);

dev_of_node(&pdev->dev) instead of directly accessing the member.
IIRC this is the new preferred style.


Thanks
ChenYu

> +               if (ret)
> +                       goto err_assert_reset;
>         }
>
>         ret =3D devm_sunxi_ccu_probe(&pdev->dev, reg, ccu_desc);
> --
> 2.51.2
>
>

