Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 37360C369AB
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 15 Apr 2025 14:03:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=dxTErC+KnB5NGpCTc9/w/rpBQLv25Jj15o+pnsH3W3I=; b=XX1BSSi7eJnKyB+tQ/SIVzXsKi
	5ePmxePvwSUL020vMEvAq5YIElWCkZsYhYRw7dnaw7IaA8HgpI9WOQO0PAmhT5K7U5DcXQx9TjPcS
	7nslsOgzBaJPOjZ4z0Bo8zv9JdtctVg3iflo6zBSiQwNCDV5anRlyeFkMZ6a4GaX+R+KXjmMLGaCt
	Gob5DXtWKkoMUBwX3GJ0pALR1CZ0EN7QxspQtlrbv2dtT3p7f8yGVjIkit7s5LZAIDInhl8hZSNyN
	4r7HBm6n7uhE+lk3OXwtOawobzjeh7BhbO1Nl603/ZcMMp3yix/xOfpridGlMV8weZIW7GSG1VQeY
	LaYt7JOA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u4gt7-000000061gK-1sQW;
	Tue, 15 Apr 2025 14:03:45 +0000
Received: from mail-wr1-x435.google.com ([2a00:1450:4864:20::435])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u4gjx-00000005zYF-47D1
	for linux-arm-kernel@lists.infradead.org;
	Tue, 15 Apr 2025 13:54:19 +0000
Received: by mail-wr1-x435.google.com with SMTP id ffacd0b85a97d-39bf44be22fso3590588f8f.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 15 Apr 2025 06:54:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744725256; x=1745330056; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=dxTErC+KnB5NGpCTc9/w/rpBQLv25Jj15o+pnsH3W3I=;
        b=lf1gGxJsvxf2CTSMhRpupxHNJPg1WGFggDMjoIAbN00nUrwgCG5CdvfO5IiGJ7CoAa
         5yLto0bcwu7kNK6Gw92CO2yXVxD0r+G6W0iAhoFcFvwP7SlRTS5SkA2+p3ZHdHzGfCAW
         kONtcpv63vAx9m3BM8UvBRLEZtfzR5XSqrS+28fBWXLjtRXdNAkgimSb3pcwZl3dhh0b
         PAkcAY2TJQFg/evPKJQuPCPElQFLGVn1x1sGrx/H4bLeazHmTNLCw/hgwprVJMsx05Bp
         M9vjdABaPiHL2EF3EaDfmjkKAOfjlAiooPj6u+JAbzMuqu+Yn55nhuLWaTEWsOg8scsX
         WPoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744725256; x=1745330056;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=dxTErC+KnB5NGpCTc9/w/rpBQLv25Jj15o+pnsH3W3I=;
        b=Yyl2XTcBEoRuoaYFm7iH43XpaWww8ZpwyhzvrfTNpNRJRBXB5ELDp2uDuzDUndHngH
         JyN5xe2xYe4e8J/0khNXLk85+1dKCQZ4GFKTkyd0NA2+31G1AGvr42Cs4cIgdcwEwepf
         3ilwWUWZ4Y4zikfB7y/KDRQXH7QvVLcoNEzY7cJYWnunsa32c/crYEaYT9zaK7u0t2B2
         cRDeIO6trfL2EKytnNe0sdYhueqU+fb+duGY2NaWgb+kzNp9CQcgiyifrE0rqcFWnWNu
         LNqBZhEfYJmud4W/ZK88M408Y4YuDL3VJAiRgFt+Pb8Qv94pclH6fZx1j44Ri4iIFPXB
         fxbQ==
X-Forwarded-Encrypted: i=1; AJvYcCViiNncu4vBcPcwd2Ubk2HSIVHDZAodGo26MUy8WLtkYI9LFEcYvmT9/nMgjiyFvHZASQW5JbU4xchfoqCr7vqa@lists.infradead.org
X-Gm-Message-State: AOJu0Yz3R5+LE58mjNV+JSJ4wSo151DvruJTJCTZvxKHHKxKtfROL09u
	V6IEQzRW0MoWsFqsAlO9iR5cZw+En9dmshHl4m1bOC54UWkvXVtplY2CICjisRqysnG/owZUh08
	2uiEybaWLeK7eeL7kfycCqKY58Kk=
X-Gm-Gg: ASbGnctXXamna32FTSDjjyXphbemqxuHnZeah5CLsOHU+YRDk3KNC+jY8b81ak+adtY
	xuc5gSOnqLo2JPS/QpvF9JxhQxFY9md68UiIqc78kuTz36B7j+iklzz5iaKO+5Zmy2SKhx5Txv1
	N8nB/HjZjWtQYhhX2Rw7Nx2F98Jyyw5T3/tyPDxaIZmZrCU372Ezwi/Q==
X-Google-Smtp-Source: AGHT+IHIlDUG50nBX2u1LH9CaXEXWCjuUqqrtu+RUgth3OiXGHRpRs4KPtJjbrXWad3okXBSN+tXr8a7mC+87EouhWY=
X-Received: by 2002:a05:6000:18af:b0:391:4743:6dc2 with SMTP id
 ffacd0b85a97d-39ea52120e2mr13543818f8f.25.1744725256350; Tue, 15 Apr 2025
 06:54:16 -0700 (PDT)
MIME-Version: 1.0
References: <20250415125642.241427-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20250415125642.241427-4-prabhakar.mahadev-lad.rj@bp.renesas.com> <c9d8f97470c3c5a8c0214af266b9579086460ba1.camel@pengutronix.de>
In-Reply-To: <c9d8f97470c3c5a8c0214af266b9579086460ba1.camel@pengutronix.de>
From: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Date: Tue, 15 Apr 2025 14:53:50 +0100
X-Gm-Features: ATxdqUE9J0buGzHkD1AbdOnLT3zfOWdA_YFucRbFLlm3VKoGvgJwL6K9gejz2HM
Message-ID: <CA+V-a8tr=6ZgKSF5=CmRvrMO8ZSwtfD-cqSpi=5+5WwB-_pj_Q@mail.gmail.com>
Subject: Re: [PATCH net-next v6 3/4] net: stmmac: Add DWMAC glue layer for
 Renesas GBETH
To: Philipp Zabel <p.zabel@pengutronix.de>
Cc: Andrew Lunn <andrew+netdev@lunn.ch>, "David S. Miller" <davem@davemloft.net>, 
	Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Maxime Coquelin <mcoquelin.stm32@gmail.com>, Alexandre Torgue <alexandre.torgue@foss.st.com>, 
	Richard Cochran <richardcochran@gmail.com>, Geert Uytterhoeven <geert+renesas@glider.be>, 
	Magnus Damm <magnus.damm@gmail.com>, 
	"Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>, Giuseppe Cavallaro <peppe.cavallaro@st.com>, 
	Jose Abreu <joabreu@synopsys.com>, netdev@vger.kernel.org, 
	linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com, 
	linux-arm-kernel@lists.infradead.org, Biju Das <biju.das.jz@bp.renesas.com>, 
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250415_065418_022027_93567FCD 
X-CRM114-Status: GOOD (  30.60  )
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

Hi Philipp,

Thank you for the review.

On Tue, Apr 15, 2025 at 2:38=E2=80=AFPM Philipp Zabel <p.zabel@pengutronix.=
de> wrote:
>
> On Di, 2025-04-15 at 13:56 +0100, Prabhakar wrote:
> > From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> >
> > Add the DWMAC glue layer for the GBETH IP found in the Renesas RZ/V2H(P=
)
> > SoC.
> >
> > Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> > ---
> >  drivers/net/ethernet/stmicro/stmmac/Kconfig   |  11 ++
> >  drivers/net/ethernet/stmicro/stmmac/Makefile  |   1 +
> >  .../stmicro/stmmac/dwmac-renesas-gbeth.c      | 148 ++++++++++++++++++
> >  3 files changed, 160 insertions(+)
> >  create mode 100644 drivers/net/ethernet/stmicro/stmmac/dwmac-renesas-g=
beth.c
> >
> > diff --git a/drivers/net/ethernet/stmicro/stmmac/Kconfig b/drivers/net/=
ethernet/stmicro/stmmac/Kconfig
> > index 3c820ef56775..2c99b23f0faa 100644
> > --- a/drivers/net/ethernet/stmicro/stmmac/Kconfig
> > +++ b/drivers/net/ethernet/stmicro/stmmac/Kconfig
> > @@ -131,6 +131,17 @@ config DWMAC_QCOM_ETHQOS
> >         This selects the Qualcomm ETHQOS glue layer support for the
> >         stmmac device driver.
> >
> > +config DWMAC_RENESAS_GBETH
> > +     tristate "Renesas RZ/V2H(P) GBETH support"
> > +     default ARCH_RENESAS
> > +     depends on OF && (ARCH_RENESAS || COMPILE_TEST)
> > +     help
> > +       Support for Gigabit Ethernet Interface (GBETH) on Renesas
> > +       RZ/V2H(P) SoCs.
> > +
> > +       This selects the Renesas RZ/V2H(P) Soc specific glue layer supp=
ort
> > +       for the stmmac device driver.
> > +
> >  config DWMAC_ROCKCHIP
> >       tristate "Rockchip dwmac support"
> >       default ARCH_ROCKCHIP
> > diff --git a/drivers/net/ethernet/stmicro/stmmac/Makefile b/drivers/net=
/ethernet/stmicro/stmmac/Makefile
> > index 594883fb4164..91050215511b 100644
> > --- a/drivers/net/ethernet/stmicro/stmmac/Makefile
> > +++ b/drivers/net/ethernet/stmicro/stmmac/Makefile
> > @@ -20,6 +20,7 @@ obj-$(CONFIG_DWMAC_LPC18XX) +=3D dwmac-lpc18xx.o
> >  obj-$(CONFIG_DWMAC_MEDIATEK) +=3D dwmac-mediatek.o
> >  obj-$(CONFIG_DWMAC_MESON)    +=3D dwmac-meson.o dwmac-meson8b.o
> >  obj-$(CONFIG_DWMAC_QCOM_ETHQOS)      +=3D dwmac-qcom-ethqos.o
> > +obj-$(CONFIG_DWMAC_RENESAS_GBETH) +=3D dwmac-renesas-gbeth.o
> >  obj-$(CONFIG_DWMAC_ROCKCHIP) +=3D dwmac-rk.o
> >  obj-$(CONFIG_DWMAC_RZN1)     +=3D dwmac-rzn1.o
> >  obj-$(CONFIG_DWMAC_S32)              +=3D dwmac-s32.o
> > diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-renesas-gbeth.c =
b/drivers/net/ethernet/stmicro/stmmac/dwmac-renesas-gbeth.c
> > new file mode 100644
> > index 000000000000..8674b7605d83
> > --- /dev/null
> > +++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-renesas-gbeth.c
> > @@ -0,0 +1,148 @@
> > +// SPDX-License-Identifier: GPL-2.0+
> > +/*
> > + * dwmac-renesas-gbeth.c - DWMAC Specific Glue layer for Renesas GBETH
> > + *
> > + * The Rx and Tx clocks are supplied as follows for the GBETH IP.
> > + *
> > + *                         Rx / Tx
> > + *   -------+------------- on / off -------
> > + *          |
> > + *          |            Rx-180 / Tx-180
> > + *          +---- not ---- on / off -------
> > + *
> > + * Copyright (C) 2025 Renesas Electronics Corporation
> > + */
> > +
> > +#include <linux/clk.h>
> > +#include <linux/device.h>
> > +#include <linux/module.h>
> > +#include <linux/platform_device.h>
> > +#include <linux/reset.h>
> > +
> > +#include "stmmac_platform.h"
> > +
> > +struct renesas_gbeth {
> > +     struct plat_stmmacenet_data *plat_dat;
> > +     struct reset_control *rstc;
> > +     struct device *dev;
> > +     void __iomem *regs;
>
> This doesn't seem to be used anywhere.
>
I'll get rid of it.

> > +};
> > +
> > +static const char *const renesas_gbeth_clks[] =3D {
> > +     "tx", "tx-180", "rx", "rx-180",
> > +};
> > +
> > +static int renesas_gbeth_clks_config(struct renesas_gbeth *gbeth, bool=
 enabled)
> > +{
> > +     struct plat_stmmacenet_data *plat_dat;
> > +     int ret;
> > +
> > +     plat_dat =3D gbeth->plat_dat;
> > +     if (enabled) {
> > +             ret =3D reset_control_deassert(gbeth->rstc);
> > +             if (ret) {
> > +                     dev_err(gbeth->dev, "Reset deassert failed\n");
> > +                     return ret;
> > +             }
> > +
> > +             ret =3D clk_bulk_prepare_enable(plat_dat->num_clks,
> > +                                           plat_dat->clks);
> > +             if (ret)
> > +                     reset_control_assert(gbeth->rstc);
> > +     } else {
> > +             clk_bulk_disable_unprepare(plat_dat->num_clks, plat_dat->=
clks);
> > +             ret =3D reset_control_assert(gbeth->rstc);
> > +             if (ret)
> > +                     dev_err(gbeth->dev, "Reset assert failed\n");
> > +     }
> > +
> > +     return ret;
> > +}
>
> Apart from the plat_dat assignment, this function has two completely
> separate paths. I'd fold its contents into renesas_gbeth_init/exit().
>
OK, I'll fix that in v7.

Cheers,
Prabhakar

