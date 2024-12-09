Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 95A28E77173
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  9 Dec 2024 10:32:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=l8vI+mafQJICnkT4ByBE+HuAejFrqMpigPXyZ+V3gfk=; b=DJ06pQ2CgF1yexFvHXZi0sCdLG
	vDgsTKRUHyWcqjU9vnA2DmY+AlQsTWvPIdnDzPYU1n14huFwBCWSUMrSa2IFwRGUDloI4Yq2laHZ0
	bqyrHgrIsg/68Tfx6p+PuS657RqsKcEqdXqnm0oedrrOZw3/rTepTk3NVbW5jmuPu67fdV4rXJFCZ
	AOSjVCBAtrGpLMkxNGghXQsgER793H+6T5QxiUmEi04dV0SCoQqqkahldrkdv9yMuANrY0snh5umE
	op5DxWGOfSLGqrwgy/fA/zoeAprF01xvqS41XrxzkIh2NTy9eIxfozsESo4KgzNtVHW7JBGTo2u5T
	XtOBK5WQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tKb3V-00000007IVT-1Ris;
	Mon, 09 Dec 2024 10:31:58 +0000
Received: from mail-yb1-xb2b.google.com ([2607:f8b0:4864:20::b2b])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tKang-00000007FDk-1SIb
	for linux-arm-kernel@lists.infradead.org;
	Mon, 09 Dec 2024 10:15:37 +0000
Received: by mail-yb1-xb2b.google.com with SMTP id 3f1490d57ef6-e3988fdb580so3403725276.2
        for <linux-arm-kernel@lists.infradead.org>; Mon, 09 Dec 2024 02:15:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1733739335; x=1734344135; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=l8vI+mafQJICnkT4ByBE+HuAejFrqMpigPXyZ+V3gfk=;
        b=scahdNtQV1hGM5ot0j7XGZo5oe+wv5gtjjmc3x8k6bcEudEjtWRd/hdNSvyjiY+x6X
         Mp3Z75uKjd1VjKgsB+ROrwPBDtU9Xp7DO7qQHhdcqWUZJF6pBIzlsdRNdObLc+exOy30
         qORwaJgvv9BaHjeA9Bwb+Wt6HnV6vQ2xHzwy1YTEZx/eQXfDM7GvK7tPFPZIi3djUtHX
         FqI1VwnsaYiCD5VMRNg5HYAV0lxyxHUOpmCZFoqWdWgFXizCLKAGKGiz/2Z5dR3ltUi3
         3yNei+CUuiTzhsuI2B3NMsEatAwyf2455b5gFkKMRbGGFY7yjatK4rfZpLb1zm2oX/8V
         vgVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733739335; x=1734344135;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=l8vI+mafQJICnkT4ByBE+HuAejFrqMpigPXyZ+V3gfk=;
        b=ciQc64sMYaiqwUWbjhHJgsxPgHXPOlSyvvhXORMHXr+k7NgkU/v3wDXlUFN+dsPjMA
         /5p8JUcujN4a8/A6He19vmZin6W7Eyu5W6cGeqpBzoVAnZmxf04s2HHOtzzVaXyMf89T
         HL/SguxacdkO6bn7lX1udbL7RBxBhducl/3et+yd56gOlWQ353g5gV/t4FHLReDjIfCA
         SoaVjle2oF9qOR+fMnne5H5QmKQxHr720zsD/UAx9N91VzEqVfgo6dk9JlvEcBVQyEVc
         swzMXubvbm6e4EUWzeiw8dEiqW+7+ANinhQXB+SFhXDhwDPKwBjlkAOF2+iWYEgeNSTc
         5nEA==
X-Forwarded-Encrypted: i=1; AJvYcCXkDTsF7vb30Jj5uTKvZl/mz6UDiZ838Rfbh4SlnWM/w06YSKF+HtLFIuVrE9cVkWdoQH91UmHQ0sC7UCG+dF8Q@lists.infradead.org
X-Gm-Message-State: AOJu0Yzuw7gQi+UKL1ddLHGvMAwa1ARg/uMWN+K/5mfOVErEd/SzuYJh
	drDKA7CxYoaX2wKWQZjS+pwaS0/pz0QVveqKiPTubERaUxupFH+ICABKXBih2GUxV+ksQu/Ng7Y
	7/JsaKeBTzNyZwXpCf7HtYWdEY91nv1FXjun8xg==
X-Gm-Gg: ASbGncu/5gGkumZkllbpoSAvdR4TG0zuZtyl23MIlEdLxv71/BHkt8Mop1F9fdgjszw
	B0Ui+GG6BxhdGVTv2iYQdkeGVD9J5Kjo=
X-Google-Smtp-Source: AGHT+IEYOHT/dGfysgHNg+sIyk39rFclVXASjoPiptGYgkI+v6pr5kBeW++F6mbWR9LBKnALmvDk24OJ2+AqS/tovSY=
X-Received: by 2002:a05:6902:727:b0:e3a:4f3f:af41 with SMTP id
 3f1490d57ef6-e3a4f3fb32fmr656889276.17.1733739335239; Mon, 09 Dec 2024
 02:15:35 -0800 (PST)
MIME-Version: 1.0
References: <cover.1732627815.git.Sandor.yu@nxp.com> <4ef8252825d7a962b440519fb17fdcd5dd817672.1732627815.git.Sandor.yu@nxp.com>
 <slkpvbemsrz5jv4cafp7k4pdj3smpl575w2dtmjoheoqqrh32j@2wi5564jzawg> <PAXPR04MB94488CEFA54F8AA193DC2BBDF43C2@PAXPR04MB9448.eurprd04.prod.outlook.com>
In-Reply-To: <PAXPR04MB94488CEFA54F8AA193DC2BBDF43C2@PAXPR04MB9448.eurprd04.prod.outlook.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Mon, 9 Dec 2024 12:15:26 +0200
Message-ID: <CAA8EJpoKkOj2pBxi4QcVAVOwzaW=yVAyomOFv7-oAxPYamfa-A@mail.gmail.com>
Subject: Re: [PATCH v19 6/8] phy: freescale: Add DisplayPort/HDMI Combo-PHY
 driver for i.MX8MQ
To: Sandor Yu <sandor.yu@nxp.com>
Cc: "andrzej.hajda@intel.com" <andrzej.hajda@intel.com>, 
	"neil.armstrong@linaro.org" <neil.armstrong@linaro.org>, 
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>, "jonas@kwiboo.se" <jonas@kwiboo.se>, 
	"jernej.skrabec@gmail.com" <jernej.skrabec@gmail.com>, "airlied@gmail.com" <airlied@gmail.com>, 
	"daniel@ffwll.ch" <daniel@ffwll.ch>, "robh+dt@kernel.org" <robh+dt@kernel.org>, 
	"krzysztof.kozlowski+dt@linaro.org" <krzysztof.kozlowski+dt@linaro.org>, 
	"shawnguo@kernel.org" <shawnguo@kernel.org>, "s.hauer@pengutronix.de" <s.hauer@pengutronix.de>, 
	"festevam@gmail.com" <festevam@gmail.com>, "vkoul@kernel.org" <vkoul@kernel.org>, 
	"dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>, 
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, 
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, 
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, 
	"linux-phy@lists.infradead.org" <linux-phy@lists.infradead.org>, "mripard@kernel.org" <mripard@kernel.org>, 
	"kernel@pengutronix.de" <kernel@pengutronix.de>, dl-linux-imx <linux-imx@nxp.com>, 
	Oliver Brown <oliver.brown@nxp.com>, 
	"alexander.stein@ew.tq-group.com" <alexander.stein@ew.tq-group.com>, "sam@ravnborg.org" <sam@ravnborg.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241209_021536_397148_0A737368 
X-CRM114-Status: GOOD (  36.69  )
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

On Mon, 9 Dec 2024 at 10:38, Sandor Yu <sandor.yu@nxp.com> wrote:
>
>
>
> > -----Original Message-----
> > From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> > Sent: 2024=E5=B9=B411=E6=9C=8826=E6=97=A5 22:43
> > To: Sandor Yu <sandor.yu@nxp.com>
> > Cc: andrzej.hajda@intel.com; neil.armstrong@linaro.org; Laurent Pinchar=
t
> > <laurent.pinchart@ideasonboard.com>; jonas@kwiboo.se;
> > jernej.skrabec@gmail.com; airlied@gmail.com; daniel@ffwll.ch;
> > robh+dt@kernel.org; krzysztof.kozlowski+dt@linaro.org;
> > shawnguo@kernel.org; s.hauer@pengutronix.de; festevam@gmail.com;
> > vkoul@kernel.org; dri-devel@lists.freedesktop.org;
> > devicetree@vger.kernel.org; linux-arm-kernel@lists.infradead.org;
> > linux-kernel@vger.kernel.org; linux-phy@lists.infradead.org;
> > mripard@kernel.org; kernel@pengutronix.de; dl-linux-imx
> > <linux-imx@nxp.com>; Oliver Brown <oliver.brown@nxp.com>;
> > alexander.stein@ew.tq-group.com; sam@ravnborg.org
> > Subject: [EXT] Re: [PATCH v19 6/8] phy: freescale: Add DisplayPort/HDMI
> > Combo-PHY driver for i.MX8MQ
> >
> > Caution: This is an external email. Please take care when clicking link=
s or
> > opening attachments. When in doubt, report the message using the 'Repor=
t
> > this email' button
> >
> >
> > On Tue, Nov 26, 2024 at 10:11:51PM +0800, Sandor Yu wrote:
> > > Add Cadence HDP-TX DisplayPort and HDMI PHY driver for i.MX8MQ.
> > >
> > > Cadence HDP-TX PHY could be put in either DP mode or
> > > HDMI mode base on the configuration chosen.
> > > DisplayPort or HDMI PHY mode is configured in the driver.
> > >
> > > Signed-off-by: Sandor Yu <Sandor.yu@nxp.com>
> > > Signed-off-by: Alexander Stein <alexander.stein@ew.tq-group.com>
> > > ---
> > > v18->v19:
> > > - Simplify the PLL tables by removing unused and constant data
> > > - Remove PHY power management, controller driver will handle them.
> > > - Remove enum dp_link_rate
> > > - Introduce read_pll_timeout.
> > > - Update clock management as devm_clk_get_enabled() introduced.
> > > - Remove cdns_hdptx_phy_init() and cdns_hdptx_phy_remove().
> > >
> > > v17->v18:
> > > - fix build error as code rebase to latest kernel version.
> > >
> > >  drivers/phy/freescale/Kconfig                |   10 +
> > >  drivers/phy/freescale/Makefile               |    1 +
> > >  drivers/phy/freescale/phy-fsl-imx8mq-hdptx.c | 1237
> > ++++++++++++++++++
> > >  3 files changed, 1248 insertions(+)
> > >  create mode 100644 drivers/phy/freescale/phy-fsl-imx8mq-hdptx.c
> > >
> > > diff --git a/drivers/phy/freescale/Kconfig b/drivers/phy/freescale/Kc=
onfig
> > > index dcd9acff6d01a..bbd17e9556cc3 100644
> > > --- a/drivers/phy/freescale/Kconfig
> > > +++ b/drivers/phy/freescale/Kconfig
> > > @@ -35,6 +35,16 @@ config PHY_FSL_IMX8M_PCIE
> > >         Enable this to add support for the PCIE PHY as found on
> > >         i.MX8M family of SOCs.
> > >
> > > +config PHY_FSL_IMX8MQ_HDPTX
> > > +     tristate "Freescale i.MX8MQ DP/HDMI PHY support"
> > > +     depends on OF && HAS_IOMEM
> > > +     depends on COMMON_CLK
> > > +     depends on CDNS_MHDP_HELPER
> >
> > You should not be depending on the symbol that can not be selected by
> > the user.
>
> OK.
>
> >
> > > +     select GENERIC_PHY
> > > +     help
> > > +       Enable this to support the Cadence HDPTX DP/HDMI PHY driver
> > > +       on i.MX8MQ SOC.
> > > +
> > >  config PHY_FSL_IMX8QM_HSIO
> > >       tristate "Freescale i.MX8QM HSIO PHY"
> > >       depends on OF && HAS_IOMEM
> > > diff --git a/drivers/phy/freescale/Makefile b/drivers/phy/freescale/M=
akefile
> > > index 658eac7d0a622..a946b87905498 100644
> > > --- a/drivers/phy/freescale/Makefile
> > > +++ b/drivers/phy/freescale/Makefile
> > > @@ -1,4 +1,5 @@
> > >  # SPDX-License-Identifier: GPL-2.0-only
> > > +obj-$(CONFIG_PHY_FSL_IMX8MQ_HDPTX)   +=3D phy-fsl-imx8mq-hdptx.o
> > >  obj-$(CONFIG_PHY_FSL_IMX8MQ_USB)     +=3D phy-fsl-imx8mq-usb.o
> > >  obj-$(CONFIG_PHY_MIXEL_LVDS_PHY)     +=3D
> > phy-fsl-imx8qm-lvds-phy.o
> > >  obj-$(CONFIG_PHY_MIXEL_MIPI_DPHY)    +=3D phy-fsl-imx8-mipi-dphy.o
> > > diff --git a/drivers/phy/freescale/phy-fsl-imx8mq-hdptx.c
> > b/drivers/phy/freescale/phy-fsl-imx8mq-hdptx.c
> > > new file mode 100644
> > > index 0000000000000..e99487622d43c
> > > --- /dev/null
> > > +++ b/drivers/phy/freescale/phy-fsl-imx8mq-hdptx.c
> > > @@ -0,0 +1,1237 @@
> > > +// SPDX-License-Identifier: GPL-2.0-only
> > > +/*
> > > + * Cadence DP/HDMI PHY driver
> > > + *
> > > + * Copyright (C) 2022-2024 NXP Semiconductor, Inc.
> > > + */
> > > +#include <drm/bridge/cdns-mhdp-helper.h>
> >
> > Still, I'd ask for drivers/soc instead.
>
> If put it in drivers/soc, should I create a new directory called drivers/=
soc/cadence or put it in drivers/soc/imx?
>
> The mhdp helpers will share code between cdns-mhdp8501 and cdns-mhdp8546.
> I prefer creating a new directory, drivers/soc/cadence, but the problem i=
s that cadence not a real SoC.

I think drivers/soc/cadence is fine. Please explain your decision in
the cover letter and in the commit message, this will help other
maintainers to understand you.

--=20
With best wishes
Dmitry

