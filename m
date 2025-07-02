Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6B2F3C8303D
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  2 Jul 2025 02:12:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=DFsPDaYMngNwWXolHsvEUXaarvjsCJ+WaHfejJBcKIg=; b=r7Xf1lQwt7psqf
	GKNtpbgPBxgViZqD2X3gMaZV6ezo2pUVxHQc5vJF6myafvA2DxDim6uswPCKyrFptY6LhQ6WB0N5p
	ci9nIuEnaE25bGcuTB0RVZqinGl+/UIih2Zb0740Hd7Gv27d3VNWQeHc5mYSKpGkVqEgeDmtuYMci
	kc7P5pIJ7mV1hyPu7EW9i0Z9xnJGB/EzRaWhXKERPO618SxgssCPYzx0PLo8xvkKW9wO1iYp/2ZB9
	J9cz2uZxPJhsmotRppjyJ979DZstA8ryUje4kyqD1lZgfQkzQbyiFtHCNjlpzVWmo+CXeYiOgnl/o
	KULyhp7Vs7wtTf0kfGAQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uWmxX-0000000722R-3d32;
	Wed, 02 Jul 2025 02:12:27 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uWmvC-000000071nj-49ph
	for linux-arm-kernel@lists.infradead.org;
	Wed, 02 Jul 2025 02:10:04 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 548F25C6A3B
	for <linux-arm-kernel@lists.infradead.org>; Wed,  2 Jul 2025 02:10:01 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 060B6C4AF0B
	for <linux-arm-kernel@lists.infradead.org>; Wed,  2 Jul 2025 02:10:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1751422201;
	bh=u+eeCAa/SMbfFXGIhPFmHKU00HmZAfkLNYG9xaYS1bc=;
	h=References:In-Reply-To:Reply-To:From:Date:Subject:To:Cc:From;
	b=KqcYeDqDW1mitkomoKfjt8FI7qT9C95jCYcj2ZASJbWl+skMq45qv+qjiwgZmq/Ee
	 +TWtIiLXjpMhl8V+UQVGDCRYY181ruZsYbkF+DSOah6NGxRxbe0YIUsJoXchSBw9tW
	 NBeFDh4V/gkG1WfJUAxwxFSbzXOQt9B90bd/mZHbtYofEFF3eZ7m4EtE65r7qJrA/O
	 hC19xQ43uZkeU/etnY7sRyXX83dBu1UuW6F5bzaXGMTaFBn7NlSWcsueAw5MGdQhr9
	 2juRNQBbf8vA5siWinRaNPA+H7JJLHEWt9eE2VzGyLK58/7PSpZaoSa/EF7V4FrOXM
	 xfT8H1fSENxrQ==
Received: by mail-lf1-f54.google.com with SMTP id 2adb3069b0e04-5535652f42cso7531164e87.2
        for <linux-arm-kernel@lists.infradead.org>; Tue, 01 Jul 2025 19:10:00 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCWFzu7ewdbkBWU1FmiCZGhoa+NcL0HeAWdf00Cc8CqPW5kaojOArWATBhThJodZB3Rmr40Iv+ieeguvnOcEkh7V@lists.infradead.org
X-Gm-Message-State: AOJu0YyBKBYl7Ji0UniDjKPlcPHfBavypX1tshiEDP7gBVOH2WzZWkKo
	kcbZESyOoeaGR1/pNZe6tN8iTuHw6mk6Vw22h38QvjJ8e5uJrOawX8/ANI/YTpoCf7bxpgRqYLn
	ijBMe2UTrSzHCAJ4EM4WSBL1t85c9H48=
X-Google-Smtp-Source: AGHT+IExQsqR+GkLIkcYZVnIhwtqeUxgvDRyCT2rsQLCgxbz7hvEKkOqilsUyV4/3BGqleecD5hg31pOgPJo1qEuhHQ=
X-Received: by 2002:ac2:4bcb:0:b0:553:5148:5b69 with SMTP id
 2adb3069b0e04-5562832ebd7mr288411e87.36.1751422199297; Tue, 01 Jul 2025
 19:09:59 -0700 (PDT)
MIME-Version: 1.0
References: <20250701165756.258356-1-wens@kernel.org> <20250701165756.258356-3-wens@kernel.org>
 <15ba0933-b0c1-40eb-9d3c-d8837d6ee12a@linux.dev>
In-Reply-To: <15ba0933-b0c1-40eb-9d3c-d8837d6ee12a@linux.dev>
From: Chen-Yu Tsai <wens@kernel.org>
Date: Wed, 2 Jul 2025 10:09:45 +0800
X-Gmail-Original-Message-ID: <CAGb2v646pxuT-nrwtDD-wvrA0eoxaee6sq2-mb0WoqUCPzpRjg@mail.gmail.com>
X-Gm-Features: Ac12FXycPpmF1Db6tRvOloPbMgcZjGtgFpDdr0Kf5ejzMWZ9PKuxrVUm___NGNc
Message-ID: <CAGb2v646pxuT-nrwtDD-wvrA0eoxaee6sq2-mb0WoqUCPzpRjg@mail.gmail.com>
Subject: Re: [PATCH RFT net-next 02/10] net: stmmac: Add support for Allwinner
 A523 GMAC200
To: Yanteng Si <si.yanteng@linux.dev>
Cc: Andrew Lunn <andrew+netdev@lunn.ch>, "David S. Miller" <davem@davemloft.net>, 
	Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Jernej Skrabec <jernej@kernel.org>, Samuel Holland <samuel@sholland.org>, netdev@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org, 
	Andre Przywara <andre.przywara@arm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250701_191003_124526_2D16AAD5 
X-CRM114-Status: GOOD (  39.43  )
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
Reply-To: wens@kernel.org
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

On Wed, Jul 2, 2025 at 10:00=E2=80=AFAM Yanteng Si <si.yanteng@linux.dev> w=
rote:
>
> =E5=9C=A8 7/2/25 12:57 AM, Chen-Yu Tsai =E5=86=99=E9=81=93:
> > From: Chen-Yu Tsai <wens@csie.org>
> >
> > The Allwinner A523 SoC family has a second Ethernet controller, called
> > the GMAC200 in the BSP and T527 datasheet, and referred to as GMAC1 for
> > numbering. This controller, according to BSP sources, is fully
> > compatible with a slightly newer version of the Synopsys DWMAC core.
> > The glue layer around the controller is the same as found around older
> > DWMAC cores on Allwinner SoCs. The only slight difference is that since
> > this is the second controller on the SoC, the register for the clock
> > delay controls is at a different offset. Last, the integration includes
> > a dedicated clock gate for the memory bus and the whole thing is put in
> > a separately controllable power domain.
> >
> > Add a new driver for this hardware supporting the integration layer.
> >
> > Signed-off-by: Chen-Yu Tsai <wens@csie.org>
> > ---
> >   drivers/net/ethernet/stmicro/stmmac/Kconfig   |  12 ++
> >   drivers/net/ethernet/stmicro/stmmac/Makefile  |   1 +
> >   .../ethernet/stmicro/stmmac/dwmac-sun55i.c    | 161 +++++++++++++++++=
+
> >   3 files changed, 174 insertions(+)
> >   create mode 100644 drivers/net/ethernet/stmicro/stmmac/dwmac-sun55i.c
> >
> > diff --git a/drivers/net/ethernet/stmicro/stmmac/Kconfig b/drivers/net/=
ethernet/stmicro/stmmac/Kconfig
> > index 67fa879b1e52..38ce9a0cfb5b 100644
> > --- a/drivers/net/ethernet/stmicro/stmmac/Kconfig
> > +++ b/drivers/net/ethernet/stmicro/stmmac/Kconfig
> > @@ -263,6 +263,18 @@ config DWMAC_SUN8I
> >         stmmac device driver. This driver is used for H3/A83T/A64
> >         EMAC ethernet controller.
> >
> > +config DWMAC_SUN55I
> > +     tristate "Allwinner sun55i GMAC200 support"
> > +     default ARCH_SUNXI
> > +     depends on OF && (ARCH_SUNXI || COMPILE_TEST)
> > +     select MDIO_BUS_MUX
> > +     help
> > +       Support for Allwinner A523/T527 GMAC200 ethernet controllers.
> > +
> > +       This selects Allwinner SoC glue layer support for the
> > +       stmmac device driver. This driver is used for A523/T527
> > +       GMAC200 ethernet controller.
> > +
> >   config DWMAC_THEAD
> >       tristate "T-HEAD dwmac support"
> >       depends on OF && (ARCH_THEAD || COMPILE_TEST)
> > diff --git a/drivers/net/ethernet/stmicro/stmmac/Makefile b/drivers/net=
/ethernet/stmicro/stmmac/Makefile
> > index b591d93f8503..51e068e26ce4 100644
> > --- a/drivers/net/ethernet/stmicro/stmmac/Makefile
> > +++ b/drivers/net/ethernet/stmicro/stmmac/Makefile
> > @@ -31,6 +31,7 @@ obj-$(CONFIG_DWMAC_STI)             +=3D dwmac-sti.o
> >   obj-$(CONFIG_DWMAC_STM32)   +=3D dwmac-stm32.o
> >   obj-$(CONFIG_DWMAC_SUNXI)   +=3D dwmac-sunxi.o
> >   obj-$(CONFIG_DWMAC_SUN8I)   +=3D dwmac-sun8i.o
> > +obj-$(CONFIG_DWMAC_SUN55I)   +=3D dwmac-sun55i.o
> >   obj-$(CONFIG_DWMAC_THEAD)   +=3D dwmac-thead.o
> >   obj-$(CONFIG_DWMAC_DWC_QOS_ETH)     +=3D dwmac-dwc-qos-eth.o
> >   obj-$(CONFIG_DWMAC_INTEL_PLAT)      +=3D dwmac-intel-plat.o
> > diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-sun55i.c b/drive=
rs/net/ethernet/stmicro/stmmac/dwmac-sun55i.c
> > new file mode 100644
> > index 000000000000..7fadb90e3098
> > --- /dev/null
> > +++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-sun55i.c
> > @@ -0,0 +1,161 @@
> > +// SPDX-License-Identifier: GPL-2.0-only
> > +/*
> > + * dwmac-sun55i.c - Allwinner sun55i GMAC200 specific glue layer
> > + *
> > + * Copyright (C) 2025 Chen-Yu Tsai <wens@csie.org>
> > + *
> > + * syscon parts taken from dwmac-sun8i.c, which is
> > + *
> > + * Copyright (C) 2017 Corentin Labbe <clabbe.montjoie@gmail.com>
> > + */
> > +
> > +#include <linux/bitfield.h>
> > +#include <linux/bits.h>
> > +#include <linux/mfd/syscon.h>
> > +#include <linux/module.h>
> > +#include <linux/of.h>
> > +#include <linux/phy.h>
> > +#include <linux/platform_device.h>
> > +#include <linux/regmap.h>
> > +#include <linux/regulator/consumer.h>
> > +#include <linux/stmmac.h>
> > +
> > +#include "stmmac.h"
> > +#include "stmmac_platform.h"
> > +
> > +#define SYSCON_REG           0x34
> > +
> > +/* RMII specific bits */
> > +#define SYSCON_RMII_EN               BIT(13) /* 1: enable RMII (overri=
des EPIT) */
> insert a blankline.

OK.

> > +/* Generic system control EMAC_CLK bits */
> > +#define SYSCON_ETXDC_MASK            GENMASK(12, 10)
> > +#define SYSCON_ERXDC_MASK            GENMASK(9, 5)
> ditto.

OK.

> > +/* EMAC PHY Interface Type */
> > +#define SYSCON_EPIT                  BIT(2) /* 1: RGMII, 0: MII */
> > +#define SYSCON_ETCS_MASK             GENMASK(1, 0)
> > +#define SYSCON_ETCS_MII              0x0
> > +#define SYSCON_ETCS_EXT_GMII 0x1
> > +#define SYSCON_ETCS_INT_GMII 0x2
> > +
> > +#define MASK_TO_VAL(mask)   ((mask) >> (__builtin_ffsll(mask) - 1))
> > +
> > +static int sun55i_gmac200_set_syscon(struct device *dev,
> > +                                  struct plat_stmmacenet_data *plat)
> > +{
> > +     struct device_node *node =3D dev->of_node;
> > +     struct regmap *regmap;
> > +     u32 val, reg =3D 0;
> > +
> > +     regmap =3D syscon_regmap_lookup_by_phandle(node, "syscon");
> > +     if (IS_ERR(regmap))
> > +             return dev_err_probe(dev, PTR_ERR(regmap), "Unable to map=
 syscon\n");
> > +
> -----------
> > +     if (!of_property_read_u32(node, "allwinner,tx-delay-ps", &val)) {
> > +             if (val % 100) {
> > +                     dev_err(dev, "tx-delay must be a multiple of 100\=
n");
> > +                     return -EINVAL;
> > +             }
> > +             val /=3D 100;
> > +             dev_dbg(dev, "set tx-delay to %x\n", val);
> > +             if (val > MASK_TO_VAL(SYSCON_ETXDC_MASK))
> > +                     return dev_err_probe(dev, -EINVAL,
> > +                                          "Invalid TX clock delay: %d\=
n",
> > +                                          val);
> > +
> > +             reg |=3D FIELD_PREP(SYSCON_ETXDC_MASK, val);
> > +     }
> > +
> > +     if (!of_property_read_u32(node, "allwinner,rx-delay-ps", &val)) {
> > +             if (val % 100) {
> > +                     dev_err(dev, "rx-delay must be a multiple of 100\=
n");
> > +                     return -EINVAL;
> > +             }
> > +             val /=3D 100;
> > +             dev_dbg(dev, "set rx-delay to %x\n", val);
> > +             if (val > MASK_TO_VAL(SYSCON_ERXDC_MASK))
> > +                     return dev_err_probe(dev, -EINVAL,
> > +                                          "Invalid RX clock delay: %d\=
n",
> > +                                          val);
> > +
> > +             reg |=3D FIELD_PREP(SYSCON_ERXDC_MASK, val);
> > +     }
> ------------
> These two parts of the code are highly similar.
> Can you construct a separate function?

As in, have a function that sets up either TX or RX delay based on
a parameter? That also means constructing the property name on the
fly or using ternary ops. And chopping up the log messages.

I don't think this makes it easier to read. And chopping up the log
message makes it harder to grep.

> > +
> > +     switch (plat->mac_interface) {
>
> > +     case PHY_INTERFACE_MODE_MII:
> > +             /* default */
> > +             break;
> This line of comment seems a bit abrupt here.

Default as in this is the 0 value register default.

OTOH the integration doesn't support MII, so I think I should drop this cas=
e.


Thanks
ChenYu

