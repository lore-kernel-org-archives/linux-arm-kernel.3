Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C7860D3ABCC
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 11 Nov 2024 16:28:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=gw53oWEi9nvsXEro79kN+57LAYK+q6czmjjY24kbJcw=; b=2ONiRyEpnVXa7ev9D2GItxnDde
	yWWOXJk/uYix9Lp+0lkY9qQ2CDD+iRr8kXyA16r0u0x3w9ltJDsDz9PXbBWITcSY+qkXBjBBy4g49
	S1Ws5gjEKaT4jdIekkpXzejcwDW/h8/AVxk0i41mLkwsqziw/VwZgYNH1B1D0XhBoQSgofRgC81YS
	rpvrQ9ldOz5/h2Gq21InPU71YSRKkrPgCZwKEZRQjlFaxkueBYDi2KIKzbTzCj3VdnPoI1oskhiKv
	AjbkyhlrOuTI2zOfzyj4nWXo2pzq26fFFP87udEdwRbJ5MWra/MmWDqDE39fdIoM4QS7n+5M1AFgm
	bJZm8jwQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tAXGa-00000000Zmw-0CQU;
	Mon, 11 Nov 2024 16:27:52 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tAXA0-00000000Ypx-2uGu
	for linux-arm-kernel@lists.infradead.org;
	Mon, 11 Nov 2024 16:21:05 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 030625C5B66
	for <linux-arm-kernel@lists.infradead.org>; Mon, 11 Nov 2024 16:20:19 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B07E5C4CEE5
	for <linux-arm-kernel@lists.infradead.org>; Mon, 11 Nov 2024 16:21:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1731342062;
	bh=GfqOZHoPyLMOe3TrvjRQ3VBO9c4vBbSeNCUI7N4diTo=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=hPH7cBOpV/0WSzgdkLacMc9djqKB799vXFOejt+DVzx4KyX0VGM8WDsX5Vz9xBG2I
	 nqKki6CBmvBY7hxgqyW5ByFY0/CxRg9Usyhd+730U4gUtbdCalPKuJX/DyIdiGA37f
	 plWo84v7RYNXS5ihGc7+zqQfai5laAsCzxngyZnU4lkFadbCyLnOTeRAOKBzrVm3FM
	 taVFt5DEMApruTmKPSaH+G3dIUOT1qdk+jeUBv5WD9jdxBsgVVo7ZaA4uHjJ8EaJF0
	 GyKlMuTYJ/sFPIe3wCIyuB/xSXjPobMjKiJ4V2UONynvsoHTvnaceNDZta7KRYS4nM
	 OPcJRHFMMasGw==
Received: by mail-yw1-f170.google.com with SMTP id 00721157ae682-6e33c65d104so38191567b3.3
        for <linux-arm-kernel@lists.infradead.org>; Mon, 11 Nov 2024 08:21:02 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCUeBsdxJ0o7F4qawSmwqRXIiONQSWS/o8pWaMdkOfBG8gzepZAKt1hcmVdNqopJM3YtnxAzOaoai/K8Z8Kl2ah6@lists.infradead.org
X-Gm-Message-State: AOJu0Yyjfm2MCxaE8kW4JVct4xqvbfm4fRizzYOvX+KnxAesdXXodur7
	IW/I3NSX6qXdiAz2XMsPb5r0nSZCfOlwOrrk4coPEmkE6XDqgNbEjD7f0PYKVw1zdRRZaktT5PD
	aVu+lhob4HhR5f3Z0JHAJp9DYjQ==
X-Google-Smtp-Source: AGHT+IFkAuK1RKHBxdF4ybGePBRZX8TGIGcGLxePtSshvEbTc34Fms21ng8jvbLerdOHzgIff9cxTqOeul3GUAOFeRE=
X-Received: by 2002:a05:690c:7441:b0:6e2:aceb:fb34 with SMTP id
 00721157ae682-6eaddd72ec1mr118266547b3.1.1731342061623; Mon, 11 Nov 2024
 08:21:01 -0800 (PST)
MIME-Version: 1.0
References: <20241109233821.8619-1-rosenp@gmail.com>
In-Reply-To: <20241109233821.8619-1-rosenp@gmail.com>
From: Rob Herring <robh@kernel.org>
Date: Mon, 11 Nov 2024 10:20:50 -0600
X-Gmail-Original-Message-ID: <CAL_JsqJeYS12OCVeMHze01631NOtj=uaLcEZRiWKPRZLQpSkUA@mail.gmail.com>
Message-ID: <CAL_JsqJeYS12OCVeMHze01631NOtj=uaLcEZRiWKPRZLQpSkUA@mail.gmail.com>
Subject: Re: [PATCH net-next] net: use pdev instead of OF funcs
To: Rosen Penev <rosenp@gmail.com>
Cc: netdev@vger.kernel.org, Marc Kleine-Budde <mkl@pengutronix.de>, 
	Vincent Mailhol <mailhol.vincent@wanadoo.fr>, Andrew Lunn <andrew+netdev@lunn.ch>, 
	"David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
	Florian Fainelli <florian.fainelli@broadcom.com>, Vladimir Oltean <olteanv@gmail.com>, 
	Chen-Yu Tsai <wens@csie.org>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
	Samuel Holland <samuel@sholland.org>, Pantelis Antoniou <pantelis.antoniou@gmail.com>, 
	Marcin Wojtas <marcin.s.wojtas@gmail.com>, Byungho An <bh74.an@samsung.com>, 
	Kevin Brace <kevinbrace@bracecomputerlab.com>, Francois Romieu <romieu@fr.zoreil.com>, 
	Michal Simek <michal.simek@amd.com>, Heiner Kallweit <hkallweit1@gmail.com>, 
	Russell King <linux@armlinux.org.uk>, Zhao Qiang <qiang.zhao@nxp.com>, 
	"open list:CAN NETWORK DRIVERS" <linux-can@vger.kernel.org>, open list <linux-kernel@vger.kernel.org>, 
	"moderated list:ARM/Allwinner sunXi SoC support" <linux-arm-kernel@lists.infradead.org>, 
	"open list:ARM/Allwinner sunXi SoC support" <linux-sunxi@lists.linux.dev>, 
	"open list:FREESCALE SOC FS_ENET DRIVER" <linuxppc-dev@lists.ozlabs.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241111_082104_853326_D92A3582 
X-CRM114-Status: GOOD (  22.74  )
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

On Sat, Nov 9, 2024 at 5:40=E2=80=AFPM Rosen Penev <rosenp@gmail.com> wrote=
:
>
> np here is ofdev->dev.of_node. Better to use the proper functions as
> there's no use of children or anything else.

Your commit message needs some work.

> Signed-off-by: Rosen Penev <rosenp@gmail.com>
> ---
>  drivers/net/can/grcan.c                       |  2 +-
>  drivers/net/can/mscan/mpc5xxx_can.c           |  2 +-
>  drivers/net/dsa/bcm_sf2.c                     |  4 ++--
>  drivers/net/ethernet/allwinner/sun4i-emac.c   |  2 +-
>  drivers/net/ethernet/freescale/fec_mpc52xx.c  | 23 ++++++++++---------
>  .../net/ethernet/freescale/fec_mpc52xx_phy.c  | 12 ++++++----
>  .../net/ethernet/freescale/fs_enet/mac-fcc.c  |  2 +-
>  .../net/ethernet/freescale/fs_enet/mac-fec.c  |  2 +-
>  .../net/ethernet/freescale/fs_enet/mac-scc.c  |  2 +-
>  .../net/ethernet/freescale/fs_enet/mii-fec.c  | 12 ++++++----
>  drivers/net/ethernet/freescale/ucc_geth.c     | 12 +++++-----
>  drivers/net/ethernet/marvell/mvneta.c         |  2 +-
>  drivers/net/ethernet/moxa/moxart_ether.c      |  4 ++--
>  .../ethernet/samsung/sxgbe/sxgbe_platform.c   |  8 +++----
>  drivers/net/ethernet/via/via-rhine.c          |  2 +-
>  drivers/net/ethernet/via/via-velocity.c       |  2 +-
>  drivers/net/ethernet/xilinx/ll_temac_mdio.c   |  6 ++---
>  drivers/net/mdio/mdio-mux-mmioreg.c           | 16 +++++++------
>  drivers/net/wan/fsl_ucc_hdlc.c                | 10 ++++----
>  19 files changed, 66 insertions(+), 59 deletions(-)
>
> diff --git a/drivers/net/can/grcan.c b/drivers/net/can/grcan.c
> index cdf0ec9fa7f3..0a2cc0ba219f 100644
> --- a/drivers/net/can/grcan.c
> +++ b/drivers/net/can/grcan.c
> @@ -1673,7 +1673,7 @@ static int grcan_probe(struct platform_device *ofde=
v)
>                 goto exit_error;
>         }
>
> -       irq =3D irq_of_parse_and_map(np, GRCAN_IRQIX_IRQ);
> +       irq =3D platform_get_irq(ofdev, GRCAN_IRQIX_IRQ);
>         if (!irq) {
>                 dev_err(&ofdev->dev, "no irq found\n");
>                 err =3D -ENODEV;
> diff --git a/drivers/net/can/mscan/mpc5xxx_can.c b/drivers/net/can/mscan/=
mpc5xxx_can.c
> index 0080c39ee182..252ad40bdb97 100644
> --- a/drivers/net/can/mscan/mpc5xxx_can.c
> +++ b/drivers/net/can/mscan/mpc5xxx_can.c
> @@ -300,7 +300,7 @@ static int mpc5xxx_can_probe(struct platform_device *=
ofdev)
>         if (!base)
>                 return dev_err_probe(&ofdev->dev, err, "couldn't ioremap\=
n");
>
> -       irq =3D irq_of_parse_and_map(np, 0);
> +       irq =3D platform_get_irq(ofdev, 0);
>         if (!irq) {
>                 dev_err(&ofdev->dev, "no irq found\n");
>                 err =3D -ENODEV;
> diff --git a/drivers/net/dsa/bcm_sf2.c b/drivers/net/dsa/bcm_sf2.c
> index 43bde1f583ff..9229582efd05 100644
> --- a/drivers/net/dsa/bcm_sf2.c
> +++ b/drivers/net/dsa/bcm_sf2.c
> @@ -1443,8 +1443,8 @@ static int bcm_sf2_sw_probe(struct platform_device =
*pdev)
>                 of_node_put(ports);
>         }
>
> -       priv->irq0 =3D irq_of_parse_and_map(dn, 0);
> -       priv->irq1 =3D irq_of_parse_and_map(dn, 1);
> +       priv->irq0 =3D platform_get_irq(pdev, 0);
> +       priv->irq1 =3D platform_get_irq(pdev, 1);
>
>         base =3D &priv->core;
>         for (i =3D 0; i < BCM_SF2_REGS_NUM; i++) {
> diff --git a/drivers/net/ethernet/allwinner/sun4i-emac.c b/drivers/net/et=
hernet/allwinner/sun4i-emac.c
> index 2f516b950f4e..18df8d1d93fd 100644
> --- a/drivers/net/ethernet/allwinner/sun4i-emac.c
> +++ b/drivers/net/ethernet/allwinner/sun4i-emac.c
> @@ -995,7 +995,7 @@ static int emac_probe(struct platform_device *pdev)
>
>         /* fill in parameters for net-dev structure */
>         ndev->base_addr =3D (unsigned long)db->membase;
> -       ndev->irq =3D irq_of_parse_and_map(np, 0);
> +       ndev->irq =3D platform_get_irq(pdev, 0);
>         if (ndev->irq =3D=3D -ENXIO) {
>                 netdev_err(ndev, "No irq resource\n");
>                 ret =3D ndev->irq;
> diff --git a/drivers/net/ethernet/freescale/fec_mpc52xx.c b/drivers/net/e=
thernet/freescale/fec_mpc52xx.c
> index 2bfaf14f65c8..553d33a98c99 100644
> --- a/drivers/net/ethernet/freescale/fec_mpc52xx.c
> +++ b/drivers/net/ethernet/freescale/fec_mpc52xx.c
> @@ -811,7 +811,7 @@ static int mpc52xx_fec_probe(struct platform_device *=
op)
>         int rv;
>         struct net_device *ndev;
>         struct mpc52xx_fec_priv *priv =3D NULL;
> -       struct resource mem;
> +       struct resource *mem;
>         const u32 *prop;
>         int prop_size;
>         struct device_node *np =3D op->dev.of_node;
> @@ -828,20 +828,21 @@ static int mpc52xx_fec_probe(struct platform_device=
 *op)
>         priv->ndev =3D ndev;
>
>         /* Reserve FEC control zone */
> -       rv =3D of_address_to_resource(np, 0, &mem);
> -       if (rv) {
> +       mem =3D platform_get_resource(op, 0, IORESOURCE_MEM);
> +       if (!mem) {
>                 pr_err("Error while parsing device node resource\n");
> +               rv =3D -ENODEV;
>                 goto err_netdev;
>         }
> -       if (resource_size(&mem) < sizeof(struct mpc52xx_fec)) {
> +       if (resource_size(mem) < sizeof(struct mpc52xx_fec)) {
>                 pr_err("invalid resource size (%lx < %x), check mpc52xx_d=
evices.c\n",
> -                      (unsigned long)resource_size(&mem),
> +                      (unsigned long)resource_size(mem),
>                        sizeof(struct mpc52xx_fec));
>                 rv =3D -EINVAL;
>                 goto err_netdev;
>         }
>
> -       if (!request_mem_region(mem.start, sizeof(struct mpc52xx_fec),
> +       if (!request_mem_region(mem->start, sizeof(struct mpc52xx_fec),
>                                 DRIVER_NAME)) {
>                 rv =3D -EBUSY;
>                 goto err_netdev;
> @@ -851,13 +852,13 @@ static int mpc52xx_fec_probe(struct platform_device=
 *op)
>         ndev->netdev_ops        =3D &mpc52xx_fec_netdev_ops;
>         ndev->ethtool_ops       =3D &mpc52xx_fec_ethtool_ops;
>         ndev->watchdog_timeo    =3D FEC_WATCHDOG_TIMEOUT;
> -       ndev->base_addr         =3D mem.start;
> +       ndev->base_addr         =3D mem->start;
>         SET_NETDEV_DEV(ndev, &op->dev);
>
>         spin_lock_init(&priv->lock);
>
>         /* ioremap the zones */
> -       priv->fec =3D ioremap(mem.start, sizeof(struct mpc52xx_fec));
> +       priv->fec =3D ioremap(mem->start, sizeof(struct mpc52xx_fec));

Generally, devm_platform_ioremap_resource(),
devm_platform_get_and_ioremap_resource(), etc. are preferred. So if
we're going to rework things, rework them to use those.

Rob

