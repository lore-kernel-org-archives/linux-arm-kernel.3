Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5D72FC369BD
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 16 Apr 2025 11:27:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=UK1qE9wdXLtXZ7bpXZQ96bl6ineBI8nWFsz8yMF/6bs=; b=qC/O5smr5ffAD/kDrZlzWF0pna
	xmtDgdnfCmtTEn2TM6FCVXMTOgsLTTMUl452sx3b5w7a3rKK+doOqfzS7V31wHh8upKxQm5rlNNYi
	yJSk/on+gG+l0AI80VUpW/itqw0/VThRzf/AAkVpxMENYZglv4x6UyUVdCrSAdXTtBn7TnZv1SZ3+
	UtXWEF6jCCmIl627YEDRorkxfRq+HVc1RnHYo//eIOcnaOgQRu9Ahj9WPk3Xdv3kQoNy0FOwFokr9
	rE2JPgzhwwcM1EeVxeLPDeg2bzT6c2OHOaae79dPzqX0OIK4qiUZfmDkZwxiU9m/F/QA2ub0a8TXN
	VBXu8Cig==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u50vA-00000009LD3-18BY;
	Wed, 16 Apr 2025 11:27:12 +0000
Received: from mail-wr1-x42b.google.com ([2a00:1450:4864:20::42b])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u50tI-00000009Kwb-2Kva
	for linux-arm-kernel@lists.infradead.org;
	Wed, 16 Apr 2025 11:25:17 +0000
Received: by mail-wr1-x42b.google.com with SMTP id ffacd0b85a97d-39c2688619bso4319084f8f.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 16 Apr 2025 04:25:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744802715; x=1745407515; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=UK1qE9wdXLtXZ7bpXZQ96bl6ineBI8nWFsz8yMF/6bs=;
        b=gXjLxaLhEWMLCrrsQ+JTLsp27zOr0Wo9JytMVZabtAxrg9DKEcvQhl6WnLpQYOmPAm
         0kwZWx3aZ7K/3a5C3+FF4OSjpTKVCflJExbnv18t3ZAeXwafUy3XDdTTzCBQBomaJ+Ic
         qYEAlHidW7esRAHZQDMN4gMnuYRpxOKl12y96u2P0B6NJKP39TIi22w4pdWCmJZeEACq
         rtc8EiFgAkSxENXNHwVVYARPH2krIbFOXhR826YmpG74nrpQgXRJh5qfxMZt4Fi39WTN
         NLvDIC2hAHWWKjFaabAtQn3ZX1UEW/8Lux9PzurfWLZ5tGZZVhyVosRglgI6+/Kw21E3
         Eapg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744802715; x=1745407515;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=UK1qE9wdXLtXZ7bpXZQ96bl6ineBI8nWFsz8yMF/6bs=;
        b=GYSyhLceDquWNzifwOTzUlwrTyHs67Hjz/JHkEXBOr2hSQsmODWAHkwXL80teGc8x0
         F0eaJa4mN86ay7t2hmS/udTH12Pef+lBiUVEOEiotXDL+ntDywQ4Ahj0z8RW+jvDMBKn
         cWsfGvCItTQPf5OuPYG9jamZJCxhoBeD0PNiCNVHFleNgIxhJgvy+WoyFaxoJdSWnhXL
         tPFdf7pBHfjRZRR9NRGfR0YpBoN2plFOUb8fG6VhLwrfmbWeYMpNNwc5I/RgsLoFE2cZ
         d49ebaRkDDF64DyDBOlk+XdOTg5Wz9gH4d99xkQ22FoNmDS78pfrwtwjBRHNBqrV2IK6
         V3CQ==
X-Forwarded-Encrypted: i=1; AJvYcCXVqPoMKtdPjsBv8n0uXyXDs8JL9hhvr5n0meyz0KPXj+owyT+QZ1buWoz/tARf1cT8pg6xnjj2LLOYRZTSBXlt@lists.infradead.org
X-Gm-Message-State: AOJu0YyUSja8So6ea8akx3tHIbNo5rBgqDUbTcpfBP0flaPssjP5asIp
	S/CycbGau28yRe43Xdj6qzoYHAEu1uPcmRiW39SttrlvIwamwZj/WKq72OQIldiAxOxMkQTVfzN
	BqQX8OMlcqtyH05MBxitSHI1y7Q0=
X-Gm-Gg: ASbGncs9rLvjbAL26oLwBtyhdIcj3Yndiivxr/KEKdaforX/Jqg8ORjjLmzmfx5ZBSr
	XTDJTOxAyn0Co3lE/XijxrsLKJiwpcdTCCKIe8EUPr7yrMQfeH3YFZnSeKAAktOFpVU/wPaCS55
	sksy7/As6/xFikmMIDssSBCS1ZxVflVyzHdGqvHABHQNNdbUNr80MM/vs=
X-Google-Smtp-Source: AGHT+IG20ioUwmVK8jT1auGEvfYmau6FZT4iN5r9cG0sTpD+CwE5vavkmt0SHhCn9DBrwBdOjgbt0xLoMYoKYshrtUA=
X-Received: by 2002:a05:6000:1867:b0:39e:cbca:922f with SMTP id
 ffacd0b85a97d-39ee5b12f23mr1105841f8f.12.1744802714969; Wed, 16 Apr 2025
 04:25:14 -0700 (PDT)
MIME-Version: 1.0
References: <20250416104015.47788-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20250416104015.47788-4-prabhakar.mahadev-lad.rj@bp.renesas.com> <TY3PR01MB11346266349649D5E69923BAC86BD2@TY3PR01MB11346.jpnprd01.prod.outlook.com>
In-Reply-To: <TY3PR01MB11346266349649D5E69923BAC86BD2@TY3PR01MB11346.jpnprd01.prod.outlook.com>
From: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Date: Wed, 16 Apr 2025 12:24:48 +0100
X-Gm-Features: ATxdqUHUY3qYyUELPpVyGQloNfVvIlHwW8HOxGgTg9mF-SSWoLexEHk-cqLqtZo
Message-ID: <CA+V-a8tu-9gu_Rm3TGeGPjO48tpUVYu+PR7K9FyUU6DORQYQYg@mail.gmail.com>
Subject: Re: [PATCH net-next v7 3/4] net: stmmac: Add DWMAC glue layer for
 Renesas GBETH
To: Biju Das <biju.das.jz@bp.renesas.com>
Cc: Andrew Lunn <andrew+netdev@lunn.ch>, "David S. Miller" <davem@davemloft.net>, 
	Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Maxime Coquelin <mcoquelin.stm32@gmail.com>, Alexandre Torgue <alexandre.torgue@foss.st.com>, 
	Richard Cochran <richardcochran@gmail.com>, Philipp Zabel <p.zabel@pengutronix.de>, 
	Geert Uytterhoeven <geert+renesas@glider.be>, Magnus Damm <magnus.damm@gmail.com>, 
	"Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>, Giuseppe Cavallaro <peppe.cavallaro@st.com>, 
	Jose Abreu <joabreu@synopsys.com>, "netdev@vger.kernel.org" <netdev@vger.kernel.org>, 
	"linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>, 
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, 
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, 
	"linux-stm32@st-md-mailman.stormreply.com" <linux-stm32@st-md-mailman.stormreply.com>, 
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, 
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>, 
	Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250416_042516_601373_A4282583 
X-CRM114-Status: GOOD (  28.62  )
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

Hi Biju,

Thank you for the review.

On Wed, Apr 16, 2025 at 11:44=E2=80=AFAM Biju Das <biju.das.jz@bp.renesas.c=
om> wrote:
>
> Hi Prabhakar,
>
> Thanks for the patch.
>
> > -----Original Message-----
> > From: Prabhakar <prabhakar.csengg@gmail.com>
> > Sent: 16 April 2025 11:40
> > Subject: [PATCH net-next v7 3/4] net: stmmac: Add DWMAC glue layer for =
Renesas GBETH
> >
> > From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> >
> > Add the DWMAC glue layer for the GBETH IP found in the Renesas RZ/V2H(P=
) SoC.
> >
> > Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> > Reviewed-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>
> > ---
> >  drivers/net/ethernet/stmicro/stmmac/Kconfig   |  11 ++
> >  drivers/net/ethernet/stmicro/stmmac/Makefile  |   1 +
> >  .../stmicro/stmmac/dwmac-renesas-gbeth.c      | 146 ++++++++++++++++++
> >  3 files changed, 158 insertions(+)
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
> > diff --git a/drivers/net/ethernet/stmicro/stmmac/Makefile
> > b/drivers/net/ethernet/stmicro/stmmac/Makefile
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
> > diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-renesas-gbeth.c
> > b/drivers/net/ethernet/stmicro/stmmac/dwmac-renesas-gbeth.c
> > new file mode 100644
> > index 000000000000..f34bec7794e2
> > --- /dev/null
> > +++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-renesas-gbeth.c
> > @@ -0,0 +1,146 @@
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
> > + * Copyright (C) 2025 Renesas Electronics Corporation  */
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
> > +};
> > +
> > +static const char *const renesas_gbeth_clks[] =3D {
> > +     "tx", "tx-180", "rx", "rx-180",
> > +};
> > +
> > +static int renesas_gbeth_init(struct platform_device *pdev, void *priv=
)
> > +{
> > +     struct plat_stmmacenet_data *plat_dat;
> > +     struct renesas_gbeth *gbeth =3D priv;
> > +     int ret;
> > +
> > +     plat_dat =3D gbeth->plat_dat;
> > +
> > +     ret =3D reset_control_deassert(gbeth->rstc);
> > +     if (ret) {
> > +             dev_err(gbeth->dev, "Reset deassert failed\n");
> > +             return ret;
> > +     }
> > +
> > +     ret =3D clk_bulk_prepare_enable(plat_dat->num_clks,
> > +                                   plat_dat->clks);
> > +     if (ret)
> > +             reset_control_assert(gbeth->rstc);
> > +
> > +     return 0;
>
>         return ret??
>
Indeed I missed it.

Cheers,
Prabhakar

