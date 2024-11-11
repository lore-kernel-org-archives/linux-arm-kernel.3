Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C4619D3ABE0
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 11 Nov 2024 18:18:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=HpZAS2bWwt2zOBZ8cYigNTZ+YnuSyLmLc70gMu7hl/I=; b=ey+PMB/oLVy9HdGQH/G26MRMzQ
	if0THWhr+vJv40i5GMmnUe8Uj9OoJ8umEbd+ElKbNrlMFhOfFjcYtD7QW8IUj7Wrfwo6zpixJbVOw
	hMmiTJTgpwUgyjteC690YQG60J4mJFEiuAXv5VQl/cn8AdCDlO67FVF8/2DIQqqSKO0uelh7ise6I
	L0/rz4ZTjEkYA16y6cC3AJIuQNfhHXz/H+hQUekNQaUH1dltZdoA9uFdaaSI7nxFtA2PO6PoDbrBG
	i+O1NzWI3te12LiRT2NmFeTpL6nMfrircCknOc6r4Im6dL27QZLR8T53F8lFb+gOI27q209zScfKI
	UxJzvv1Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tAYzu-00000000svB-3XBI;
	Mon, 11 Nov 2024 18:18:46 +0000
Received: from mail-yw1-x112d.google.com ([2607:f8b0:4864:20::112d])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tAYwb-00000000s5y-33cs
	for linux-arm-kernel@lists.infradead.org;
	Mon, 11 Nov 2024 18:15:22 +0000
Received: by mail-yw1-x112d.google.com with SMTP id 00721157ae682-6eb0c2dda3cso12089627b3.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 11 Nov 2024 10:15:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1731348920; x=1731953720; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=HpZAS2bWwt2zOBZ8cYigNTZ+YnuSyLmLc70gMu7hl/I=;
        b=MdL0rsp5ZuWD9agcZFvR+aZng8Vk0E5iri1hwNqCMVDQl6cKqsZNtLCIUmfHCxqueW
         M73LaBdH48NycP/S/PNBLaLr6Z+EEmCFMFaTGga5bxyzQkcsFj2AkLxoPZH9isJuk27w
         3efm9SwNxguevn3M9CWdxLtcD87zhZPjW3nWl1R3DHUI7XBdwzvvg6ZVBk05pKsUfu8e
         de/AfH83KtbNBCixzZY7XUw0vPwFTfLrgZfvmYVOc4P+lnB7E5ZvzV5r3leSbHFYCXc1
         57hOpHvjF3JPmXaZPKAE7zEM1nrgcmXnY5m32vntgR9mgQEY9BOkCP4Gwv7J1YUbtbjt
         WJuw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731348920; x=1731953720;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=HpZAS2bWwt2zOBZ8cYigNTZ+YnuSyLmLc70gMu7hl/I=;
        b=JMav/H4vLIfLlCfN9vL7UFfMG6NwWwo8g8slwKncFMLx2ND7vH14EbFKwlVqqYsiMe
         HLWluQxBL1foYXop4dK0FfVt3nFOb1PZfWDMV3wwavh58G1CmAPAW7qRE9ws+mv85+z/
         ojeO//9mJUgkN3Ugue/R5GgKq4DM8P+EM3QrHFHgViK40rCrcmKQ4HaYst1cuSnVpCfV
         oH3imPiMnjaX0MaaYPIPwehV03OTcoYXaLuslmt+Fdaa5oVeyuFTgLZmgy7fjNwUZYge
         R0PITMS5gjK4pWFaLP8ThtfkcodOt8X3PkkM1C6t6KjuEjs25dvMYVG968rPRaXFqIRd
         7TBQ==
X-Forwarded-Encrypted: i=1; AJvYcCUlmbZdQntWsCUHVxq0pZcG4AnJKFMIkoUaYT20UtGC03qIX5RU6IPNJo8ElhH22mSB7kVa0ZR3nwxmCL6dzhq9@lists.infradead.org
X-Gm-Message-State: AOJu0YxD4K3qjtQo9j5D4piouI8H00sVxiaoXJm8RwBlHW0dWRLiRtZD
	nP7VPpG5CuKe/BILHDxjZuPOPBgdKUQslXQkzOn/vehQ5o4Ed32zcIpZRYTSMkh0o6MC0zE8pfc
	tl/f13QjR6hsx5oFE09IyZkN59B0=
X-Google-Smtp-Source: AGHT+IGLBSwTKT95wxrHMnOt9Q5Li6BlHC6K+1FHrKgyvNGBGBapWvVwMHYCacWx2xVp0o642B7HukZWBmszb38LcHY=
X-Received: by 2002:a05:690c:b8e:b0:6dd:d119:58dd with SMTP id
 00721157ae682-6eaddda4d5fmr140329177b3.16.1731348920311; Mon, 11 Nov 2024
 10:15:20 -0800 (PST)
MIME-Version: 1.0
References: <20241109233821.8619-1-rosenp@gmail.com> <CAL_JsqJeYS12OCVeMHze01631NOtj=uaLcEZRiWKPRZLQpSkUA@mail.gmail.com>
In-Reply-To: <CAL_JsqJeYS12OCVeMHze01631NOtj=uaLcEZRiWKPRZLQpSkUA@mail.gmail.com>
From: Rosen Penev <rosenp@gmail.com>
Date: Mon, 11 Nov 2024 10:15:09 -0800
Message-ID: <CAKxU2N-yy7tptcQL7GCFDCGq7mHSp34cDLg6vYuU7UB2669TDg@mail.gmail.com>
Subject: Re: [PATCH net-next] net: use pdev instead of OF funcs
To: Rob Herring <robh@kernel.org>
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
X-CRM114-CacheID: sfid-20241111_101521_796239_CB73BF2D 
X-CRM114-Status: GOOD (  24.33  )
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

On Mon, Nov 11, 2024 at 8:21=E2=80=AFAM Rob Herring <robh@kernel.org> wrote=
:
>
> On Sat, Nov 9, 2024 at 5:40=E2=80=AFPM Rosen Penev <rosenp@gmail.com> wro=
te:
> >
> > np here is ofdev->dev.of_node. Better to use the proper functions as
> > there's no use of children or anything else.
>
> Your commit message needs some work.
>
> > Signed-off-by: Rosen Penev <rosenp@gmail.com>
> > ---
> >  drivers/net/can/grcan.c                       |  2 +-
> >  drivers/net/can/mscan/mpc5xxx_can.c           |  2 +-
> >  drivers/net/dsa/bcm_sf2.c                     |  4 ++--
> >  drivers/net/ethernet/allwinner/sun4i-emac.c   |  2 +-
> >  drivers/net/ethernet/freescale/fec_mpc52xx.c  | 23 ++++++++++---------
> >  .../net/ethernet/freescale/fec_mpc52xx_phy.c  | 12 ++++++----
> >  .../net/ethernet/freescale/fs_enet/mac-fcc.c  |  2 +-
> >  .../net/ethernet/freescale/fs_enet/mac-fec.c  |  2 +-
> >  .../net/ethernet/freescale/fs_enet/mac-scc.c  |  2 +-
> >  .../net/ethernet/freescale/fs_enet/mii-fec.c  | 12 ++++++----
> >  drivers/net/ethernet/freescale/ucc_geth.c     | 12 +++++-----
> >  drivers/net/ethernet/marvell/mvneta.c         |  2 +-
> >  drivers/net/ethernet/moxa/moxart_ether.c      |  4 ++--
> >  .../ethernet/samsung/sxgbe/sxgbe_platform.c   |  8 +++----
> >  drivers/net/ethernet/via/via-rhine.c          |  2 +-
> >  drivers/net/ethernet/via/via-velocity.c       |  2 +-
> >  drivers/net/ethernet/xilinx/ll_temac_mdio.c   |  6 ++---
> >  drivers/net/mdio/mdio-mux-mmioreg.c           | 16 +++++++------
> >  drivers/net/wan/fsl_ucc_hdlc.c                | 10 ++++----
> >  19 files changed, 66 insertions(+), 59 deletions(-)
> >
> > diff --git a/drivers/net/can/grcan.c b/drivers/net/can/grcan.c
> > index cdf0ec9fa7f3..0a2cc0ba219f 100644
> > --- a/drivers/net/can/grcan.c
> > +++ b/drivers/net/can/grcan.c
> > @@ -1673,7 +1673,7 @@ static int grcan_probe(struct platform_device *of=
dev)
> >                 goto exit_error;
> >         }
> >
> > -       irq =3D irq_of_parse_and_map(np, GRCAN_IRQIX_IRQ);
> > +       irq =3D platform_get_irq(ofdev, GRCAN_IRQIX_IRQ);
> >         if (!irq) {
> >                 dev_err(&ofdev->dev, "no irq found\n");
> >                 err =3D -ENODEV;
> > diff --git a/drivers/net/can/mscan/mpc5xxx_can.c b/drivers/net/can/msca=
n/mpc5xxx_can.c
> > index 0080c39ee182..252ad40bdb97 100644
> > --- a/drivers/net/can/mscan/mpc5xxx_can.c
> > +++ b/drivers/net/can/mscan/mpc5xxx_can.c
> > @@ -300,7 +300,7 @@ static int mpc5xxx_can_probe(struct platform_device=
 *ofdev)
> >         if (!base)
> >                 return dev_err_probe(&ofdev->dev, err, "couldn't iorema=
p\n");
> >
> > -       irq =3D irq_of_parse_and_map(np, 0);
> > +       irq =3D platform_get_irq(ofdev, 0);
> >         if (!irq) {
> >                 dev_err(&ofdev->dev, "no irq found\n");
> >                 err =3D -ENODEV;
> > diff --git a/drivers/net/dsa/bcm_sf2.c b/drivers/net/dsa/bcm_sf2.c
> > index 43bde1f583ff..9229582efd05 100644
> > --- a/drivers/net/dsa/bcm_sf2.c
> > +++ b/drivers/net/dsa/bcm_sf2.c
> > @@ -1443,8 +1443,8 @@ static int bcm_sf2_sw_probe(struct platform_devic=
e *pdev)
> >                 of_node_put(ports);
> >         }
> >
> > -       priv->irq0 =3D irq_of_parse_and_map(dn, 0);
> > -       priv->irq1 =3D irq_of_parse_and_map(dn, 1);
> > +       priv->irq0 =3D platform_get_irq(pdev, 0);
> > +       priv->irq1 =3D platform_get_irq(pdev, 1);
> >
> >         base =3D &priv->core;
> >         for (i =3D 0; i < BCM_SF2_REGS_NUM; i++) {
> > diff --git a/drivers/net/ethernet/allwinner/sun4i-emac.c b/drivers/net/=
ethernet/allwinner/sun4i-emac.c
> > index 2f516b950f4e..18df8d1d93fd 100644
> > --- a/drivers/net/ethernet/allwinner/sun4i-emac.c
> > +++ b/drivers/net/ethernet/allwinner/sun4i-emac.c
> > @@ -995,7 +995,7 @@ static int emac_probe(struct platform_device *pdev)
> >
> >         /* fill in parameters for net-dev structure */
> >         ndev->base_addr =3D (unsigned long)db->membase;
> > -       ndev->irq =3D irq_of_parse_and_map(np, 0);
> > +       ndev->irq =3D platform_get_irq(pdev, 0);
> >         if (ndev->irq =3D=3D -ENXIO) {
> >                 netdev_err(ndev, "No irq resource\n");
> >                 ret =3D ndev->irq;
> > diff --git a/drivers/net/ethernet/freescale/fec_mpc52xx.c b/drivers/net=
/ethernet/freescale/fec_mpc52xx.c
> > index 2bfaf14f65c8..553d33a98c99 100644
> > --- a/drivers/net/ethernet/freescale/fec_mpc52xx.c
> > +++ b/drivers/net/ethernet/freescale/fec_mpc52xx.c
> > @@ -811,7 +811,7 @@ static int mpc52xx_fec_probe(struct platform_device=
 *op)
> >         int rv;
> >         struct net_device *ndev;
> >         struct mpc52xx_fec_priv *priv =3D NULL;
> > -       struct resource mem;
> > +       struct resource *mem;
> >         const u32 *prop;
> >         int prop_size;
> >         struct device_node *np =3D op->dev.of_node;
> > @@ -828,20 +828,21 @@ static int mpc52xx_fec_probe(struct platform_devi=
ce *op)
> >         priv->ndev =3D ndev;
> >
> >         /* Reserve FEC control zone */
> > -       rv =3D of_address_to_resource(np, 0, &mem);
> > -       if (rv) {
> > +       mem =3D platform_get_resource(op, 0, IORESOURCE_MEM);
> > +       if (!mem) {
> >                 pr_err("Error while parsing device node resource\n");
> > +               rv =3D -ENODEV;
> >                 goto err_netdev;
> >         }
> > -       if (resource_size(&mem) < sizeof(struct mpc52xx_fec)) {
> > +       if (resource_size(mem) < sizeof(struct mpc52xx_fec)) {
> >                 pr_err("invalid resource size (%lx < %x), check mpc52xx=
_devices.c\n",
> > -                      (unsigned long)resource_size(&mem),
> > +                      (unsigned long)resource_size(mem),
> >                        sizeof(struct mpc52xx_fec));
> >                 rv =3D -EINVAL;
> >                 goto err_netdev;
> >         }
> >
> > -       if (!request_mem_region(mem.start, sizeof(struct mpc52xx_fec),
> > +       if (!request_mem_region(mem->start, sizeof(struct mpc52xx_fec),
> >                                 DRIVER_NAME)) {
> >                 rv =3D -EBUSY;
> >                 goto err_netdev;
> > @@ -851,13 +852,13 @@ static int mpc52xx_fec_probe(struct platform_devi=
ce *op)
> >         ndev->netdev_ops        =3D &mpc52xx_fec_netdev_ops;
> >         ndev->ethtool_ops       =3D &mpc52xx_fec_ethtool_ops;
> >         ndev->watchdog_timeo    =3D FEC_WATCHDOG_TIMEOUT;
> > -       ndev->base_addr         =3D mem.start;
> > +       ndev->base_addr         =3D mem->start;
> >         SET_NETDEV_DEV(ndev, &op->dev);
> >
> >         spin_lock_init(&priv->lock);
> >
> >         /* ioremap the zones */
> > -       priv->fec =3D ioremap(mem.start, sizeof(struct mpc52xx_fec));
> > +       priv->fec =3D ioremap(mem->start, sizeof(struct mpc52xx_fec));
>
> Generally, devm_platform_ioremap_resource(),
> devm_platform_get_and_ioremap_resource(), etc. are preferred. So if
> we're going to rework things, rework them to use those.
I'm going to avoid that as I've been constantly getting requests to
test my changes on real hardware. I don't own anything that uses
fec_mpc52xx.c.

Plus, documentation states that netdev isn't too big of a fan of devm.

Oh and this file uses no devm of any kind.
>
> Rob

