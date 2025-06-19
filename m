Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6CF63C71159
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 19 Jun 2025 06:16:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=BeKhFuW8a8z8HnsNlzPjiV9UXGhduJL1UPZRBcRr5iA=; b=AIP5YLamuaT5lq3oV299rPR2yo
	P4uG9v4/y+azqFwsQ5k1IG1arUTVYB9uiaXXFLNBUEMDTdVroM1mlMqAJT/XLZ9eT7GhersW3lTwg
	r02sbo+wC1SWjiin0/avkeoNIHBtYeqHYAkJ+lgP4ntqDlQg5Xe2j8pMPnlPz9nxMvqunreP84djg
	Cc7Vbm0Xqffd0F8yPcf8KqrW03+oX2N2a74gz3093gizK//c1imiNbddJTgztNsrzpRDDjuXh6+p5
	+MhuMx/K5lERiky9PXIiNd9/snQjV7ssZ9IyfulkBE1ZPornqySWeUKIKSDS5EN3TyPMkZKmI35YU
	ZK8Lhelg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uS8Zq-0000000C8ha-0tFR;
	Thu, 19 Jun 2025 06:16:46 +0000
Received: from mail-lj1-x229.google.com ([2a00:1450:4864:20::229])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uS8AB-0000000C66g-1RUH
	for linux-arm-kernel@lists.infradead.org;
	Thu, 19 Jun 2025 05:50:16 +0000
Received: by mail-lj1-x229.google.com with SMTP id 38308e7fff4ca-32b7113ed6bso3369961fa.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 18 Jun 2025 22:50:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1750312213; x=1750917013; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=BeKhFuW8a8z8HnsNlzPjiV9UXGhduJL1UPZRBcRr5iA=;
        b=AJnDAIEP9FA5iY6NE+pultNcDQ633dzRXuY6uBHeCOlQ9+XKominp0iRbXiwhiSGvy
         IpGivhUWuhLXqqzL+/NSO2QPCG2TO4aYpnO5VQ1rc4e0guES4Wc7j3qZyroVFHXvBHjh
         zP2cL5bnLfk0pOIuXiR9CFm/CAyAvVbm+yT8GxNOpWDwtEcwLcT5of5k0sxJPxkpHN2y
         Q4pA5aExlqtHrCcD6vW+EmuvcWbSqWHAjMOIrQov/5IUqf5qSr/GHx2n3vMalOJ+0H6K
         defFh4PSclUqpgo9fkXkDwxrXumI6kPAO753MP3bYohx7R9AtXLTfDssQiZxtQw+gm4A
         vlig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750312213; x=1750917013;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=BeKhFuW8a8z8HnsNlzPjiV9UXGhduJL1UPZRBcRr5iA=;
        b=VbDLQJZhMrtFksoNHjSMhTBgUG4oYKW+yBTTDoaIEwe9AYrbLrfxuIyTYer6Dm8ywC
         6GJu3B0ep80eHpoVD4/Dpati1WVvOq398qH/HWoWtbjArxXH0a0wrAszzbDBgPixwtdG
         gRSSF0mVzEgEl62cn2pXlyW9wWP+SmEViWp/B1xGn8zJ9otlVCvrEn1DZD9MJL1zCzmU
         dgcl2Cbx5srGTqdTYC/UBXxuz0bPqJRXKXoB+a8gfnre4X7sZvA41ZEZT4wIUZKUHIWi
         kSQmGuvO7hCzUqGjvOVtYN/uApNZnhrZ+afqfWUXc+H6Nj3KojqzGXyO+gvM3lv3ZcAo
         23cg==
X-Forwarded-Encrypted: i=1; AJvYcCVblRdJ/2v1swcbZ5rCQ8MDtyanjsmcDrDTz//GUPV2QH9sRRtybe86WJNevAESuWIz7Bg2ckj3Y4ND/w8guGlB@lists.infradead.org
X-Gm-Message-State: AOJu0YywwW1H//X1acomN7SzlcmmihRd2moY531f/buqdTPF6qMx4MRQ
	2syV5FOM/VOes7cwr5m/RpL6tEW2PA/KZVtIAWOOWXfMywYAnauAE9l/OmemIzUtRJNMlcpbTSi
	c7j5TS5LfD5/2rS/8OcRJo5MalSU2USg=
X-Gm-Gg: ASbGncvOZgVYUqTv7Aicov+t3CudRr5QCqls4ZZVqnbB4ybJX6HSATy2arw3WTaBl5e
	UksYNYCw3Jls0gXJ029yh59V1LWl/jrCzD15ikVoyS4VHMpBRH1r+yCN1bN/BvXqRd6caRfmlcy
	mpaec931XYA67QWFAy55TPJWeHRW+vg7u0K+8KcestpXozcWaOhDHE4Os=
X-Google-Smtp-Source: AGHT+IEk0wCV2litekKJtCgKUf/bVLVWIXtsnBIXZlbey14EA0xVCtKFOE994VdvXguOsTJDJDzKHTC0HOYQikdby68=
X-Received: by 2002:a2e:a9a6:0:b0:32a:7332:bf7a with SMTP id
 38308e7fff4ca-32b4a2dab37mr55175051fa.13.1750312213374; Wed, 18 Jun 2025
 22:50:13 -0700 (PDT)
MIME-Version: 1.0
References: <aFKXzlno7HkG-cNh@shell.armlinux.org.uk> <E1uRqEE-004c7M-Go@rmk-PC.armlinux.org.uk>
In-Reply-To: <E1uRqEE-004c7M-Go@rmk-PC.armlinux.org.uk>
From: Keguang Zhang <keguang.zhang@gmail.com>
Date: Thu, 19 Jun 2025 13:49:36 +0800
X-Gm-Features: Ac12FXwPd1YGJO7PxhRou6waOopKJzetREi64C09608AmKe9oHFc2z42ZdWqLG4
Message-ID: <CAJhJPsVoz67Yv2pty=WPMHeOq28yqq5u2VBoZwGMhUAtpNbgcg@mail.gmail.com>
Subject: Re: [PATCH net-next 2/2] net: stmmac: loongson1: get ls1b resource
 only once
To: "Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>
Cc: Andrew Lunn <andrew@lunn.ch>, Heiner Kallweit <hkallweit1@gmail.com>, 
	Alexandre Torgue <alexandre.torgue@foss.st.com>, Andrew Lunn <andrew+netdev@lunn.ch>, 
	"David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
	Jakub Kicinski <kuba@kernel.org>, linux-arm-kernel@lists.infradead.org, 
	linux-mips@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com, 
	Maxime Coquelin <mcoquelin.stm32@gmail.com>, netdev@vger.kernel.org, 
	Paolo Abeni <pabeni@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250618_225015_387542_01A7F947 
X-CRM114-Status: GOOD (  28.17  )
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

Reviewed-by: Keguang Zhang <keguang.zhang@gmail.com>
Tested-by: Keguang Zhang <keguang.zhang@gmail.com> # on LS1B & LS1C

On Wed, Jun 18, 2025 at 6:42=E2=80=AFPM Russell King (Oracle)
<rmk+kernel@armlinux.org.uk> wrote:
>
> ls1b_dwmac_syscon_init() was getting the stmmac iomem resource to detect
> which GMAC block is being used. Move this to a separate setup() function
> that only runs at probe time, so it can sensibly behave with an
> unrecognised resource adress. Use this to set a MAC index (id) which is
> then used in place of testing the base address.
>
> Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>
> ---
>  .../ethernet/stmicro/stmmac/dwmac-loongson1.c | 49 ++++++++++++++-----
>  1 file changed, 37 insertions(+), 12 deletions(-)
>
> diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-loongson1.c b/driv=
ers/net/ethernet/stmicro/stmmac/dwmac-loongson1.c
> index 78d9540be10c..32b5d1492e2e 100644
> --- a/drivers/net/ethernet/stmicro/stmmac/dwmac-loongson1.c
> +++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-loongson1.c
> @@ -44,28 +44,50 @@
>  struct ls1x_dwmac {
>         struct plat_stmmacenet_data *plat_dat;
>         struct regmap *regmap;
> +       unsigned int id;
>  };
>
>  struct ls1x_data {
> +       int (*setup)(struct platform_device *pdev,
> +                    struct plat_stmmacenet_data *plat_dat);
>         int (*init)(struct platform_device *pdev, void *bsp_priv);
>  };
>
> -static int ls1b_dwmac_syscon_init(struct platform_device *pdev, void *pr=
iv)
> +static int ls1b_dwmac_setup(struct platform_device *pdev,
> +                           struct plat_stmmacenet_data *plat_dat)
>  {
> -       struct ls1x_dwmac *dwmac =3D priv;
> -       struct plat_stmmacenet_data *plat =3D dwmac->plat_dat;
> -       struct regmap *regmap =3D dwmac->regmap;
> +       struct ls1x_dwmac *dwmac =3D plat_dat->bsp_priv;
>         struct resource *res;
> -       unsigned long reg_base;
>
>         res =3D platform_get_resource(pdev, IORESOURCE_MEM, 0);
>         if (!res) {
> +               /* This shouldn't fail - stmmac_get_platform_resources()
> +                * already mapped this resource.
> +                */
>                 dev_err(&pdev->dev, "Could not get IO_MEM resources\n");
>                 return -EINVAL;
>         }
> -       reg_base =3D (unsigned long)res->start;
>
> -       if (reg_base =3D=3D LS1B_GMAC0_BASE) {
> +       if (res->start =3D=3D LS1B_GMAC0_BASE) {
> +               dwmac->id =3D 0;
> +       } else if (res->start =3D=3D LS1B_GMAC1_BASE) {
> +               dwmac->id =3D 1;
> +       } else {
> +               dev_err(&pdev->dev, "Invalid Ethernet MAC base address %p=
R",
> +                       res);
> +               return -EINVAL;
> +       }
> +
> +       return 0;
> +}
> +
> +static int ls1b_dwmac_syscon_init(struct platform_device *pdev, void *pr=
iv)
> +{
> +       struct ls1x_dwmac *dwmac =3D priv;
> +       struct plat_stmmacenet_data *plat =3D dwmac->plat_dat;
> +       struct regmap *regmap =3D dwmac->regmap;
> +
> +       if (dwmac->id =3D=3D 0) {
>                 switch (plat->phy_interface) {
>                 case PHY_INTERFACE_MODE_RGMII_ID:
>                         regmap_update_bits(regmap, LS1X_SYSCON0,
> @@ -84,7 +106,7 @@ static int ls1b_dwmac_syscon_init(struct platform_devi=
ce *pdev, void *priv)
>                 }
>
>                 regmap_update_bits(regmap, LS1X_SYSCON0, GMAC0_SHUT, 0);
> -       } else if (reg_base =3D=3D LS1B_GMAC1_BASE) {
> +       } else if (dwmac->id =3D=3D 1) {
>                 regmap_update_bits(regmap, LS1X_SYSCON0,
>                                    GMAC1_USE_UART1 | GMAC1_USE_UART0,
>                                    GMAC1_USE_UART1 | GMAC1_USE_UART0);
> @@ -108,10 +130,6 @@ static int ls1b_dwmac_syscon_init(struct platform_de=
vice *pdev, void *priv)
>                 }
>
>                 regmap_update_bits(regmap, LS1X_SYSCON1, GMAC1_SHUT, 0);
> -       } else {
> -               dev_err(&pdev->dev, "Invalid Ethernet MAC base address %l=
x",
> -                       reg_base);
> -               return -EINVAL;
>         }
>
>         return 0;
> @@ -183,10 +201,17 @@ static int ls1x_dwmac_probe(struct platform_device =
*pdev)
>         dwmac->plat_dat =3D plat_dat;
>         dwmac->regmap =3D regmap;
>
> +       if (data->setup) {
> +               ret =3D data->setup(pdev, plat_dat);
> +               if (ret)
> +                       return ret;
> +       }
> +
>         return devm_stmmac_pltfr_probe(pdev, plat_dat, &stmmac_res);
>  }
>
>  static const struct ls1x_data ls1b_dwmac_data =3D {
> +       .setup =3D ls1b_dwmac_setup,
>         .init =3D ls1b_dwmac_syscon_init,
>  };
>
> --
> 2.30.2
>


--=20
Best regards,

Keguang Zhang

