Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DE7F0CD6E73
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 13 Nov 2025 14:45:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=m53OXX0FSEdVsD/HzcBlcWiZnahYMqqYD9/Rw82fxP8=; b=hpzSRJR987mbyCLb1cTX8Js7Lk
	RKQMi808P7rr8xcm64Nfo1+KtU/HU63cdAfdmAdfuCnrZZ/m+1ApLX4BMv0xWvurt7JyTozs9OI++
	btoyu6gsMJsckwt78OcvanrnAivb8JoKy/H5T6wWxa7RdMWs+la4mAJwmvwpp+jLbPDvwW5kXto+z
	D0E7gHrJKnEh7rF0du549CfGA5zgiabxAIJK2Cxz/Mw6pZAxQAx+5+BDscU3bZR36tXKpx6JkHDj9
	QJ9Fz108kviVL+uQJP0KrZPJiw3UBsfiGRiqH7cqNvE0gobOBtqGSIPR0HAG8m6Vy21Ai8WANbtuS
	jw9cDtSA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vJYZa-0000000AdVC-2ooI;
	Thu, 13 Nov 2025 14:45:18 +0000
Received: from mail-ed1-x529.google.com ([2a00:1450:4864:20::529])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vJYZW-0000000AdUV-0hZX
	for linux-arm-kernel@lists.infradead.org;
	Thu, 13 Nov 2025 14:45:17 +0000
Received: by mail-ed1-x529.google.com with SMTP id 4fb4d7f45d1cf-6418738efa0so1524329a12.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 13 Nov 2025 06:45:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1763045112; x=1763649912; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=m53OXX0FSEdVsD/HzcBlcWiZnahYMqqYD9/Rw82fxP8=;
        b=b6mr6aGye6U77VYghjDEx47dJJLcbECUe0wOZnsvsi0lAKh2l+rO9upuws5OQc/9ba
         7OPCEW9GRWoAXJ1L0Hd6hhz7AR2nUjGy25ww1Fyri5R0HDvxXUlh6VCLw2HWFD4ZL5X9
         7A7kTm5itTwczWJZlSlANp3pKjsFbQrO9xJ2kJq+NeHJi+0xme7lEtKfdkm8JN7P0J3E
         rQb6ek3JP0+P2KGMA4RCUMy3MajZf7gSAiyYPkMrwkc4/Ulos9Gr8zQyyXOk7fClusGd
         oGnMFfoiulXqh0MQcIgCHMGFV4f3D3Ce6BVoNoPkZOtS0Ong+lmIUPybIVAlJCDhea3b
         hqAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763045112; x=1763649912;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=m53OXX0FSEdVsD/HzcBlcWiZnahYMqqYD9/Rw82fxP8=;
        b=Qm31dGNSsEpB910vZzi9pzS51t+FY7GMbvSdoj0FgwjEREyyijfneIPYOuFToWn2fj
         TMeAiZsQyp4Q996Dp6qMfZmopHQXMaW4LoiVA8tlWfJnjiS4030rkUDa6ywoh9OeeF+8
         cKTbSWoRBkgVlN7zoEGf1F9t0ozHfF3pPHsPPJwwuXkgVdALkalw+X544102i5gEF6pu
         FS4eQL8dsuor2cKnpvTeh5JJOxvL5yf6Ah5OQbA/dA+ru5vFXP5oPv/SkjKIOEj5FlY7
         zTZJzopryFsrrOJdLeie32xWqqQJOkkSe90/UYZanecUTVylmRDxiU7bR+YS+47sNhTJ
         5KFA==
X-Forwarded-Encrypted: i=1; AJvYcCVyAAdbHBnIpyZBg+hdn8zGlq7yEubuEUUeG2NslqiPGk46DUQavblwae5cw14IQutIv4QlKfvxjCkMSHpAC7qr@lists.infradead.org
X-Gm-Message-State: AOJu0Ywtdz3pmlBzdaA7akfJAoRbyAwE3BYFU/rb0eJCfQF1N8UzOFU/
	4UiUKtaB4+jrNJwkP513cekUC+8+IXd1XPntd8YBtNIRw1dam7gfwRn9jmc5iRwPeuiIh+tMnfQ
	UWF462tgDIp/22kxO4zDomt8OPaau1r0gB8J58fhozA==
X-Gm-Gg: ASbGncuYDT1y3mmlVX8MTMlIR9CVOaJTaekYFQQriJOwwyoQqEGTrzvq7l39k7Z4y5C
	MEra44l+APwUlLPDY6xPAMA52VxcM2qZnUWAi9Wla6Osd0Ouq4oAmxR5VYZcL8+ibg1Hgg0uSDh
	ekNCqa7GxQifI+J+cU5XOYs2C/aZ3qtZHG6AXCRi/uAvWOXk2oEW+hUoDlqQMfRWxdhqka7anZa
	Z/UvDz796Dr6GFJTQHN1c0dsQoONZxORdOmF15WPj8z1tnxylHeB9EUZrsdOJq+5NVZL1JNeCbF
	QDCpzA8rLeIDlA==
X-Google-Smtp-Source: AGHT+IH4jj6eVtxRt3wKbnn+UazVGdwbCJoI149sIZw96/aCkUMses1jDosEW0DIlhxtvuCWHuc2IKSjJmxjA9t2HMA=
X-Received: by 2002:a05:6402:42c8:b0:640:fb13:6b8 with SMTP id
 4fb4d7f45d1cf-6431a548655mr6370272a12.22.1763045111775; Thu, 13 Nov 2025
 06:45:11 -0800 (PST)
MIME-Version: 1.0
References: <20251110173334.234303-1-vincent.guittot@linaro.org>
 <20251110173334.234303-4-vincent.guittot@linaro.org> <aRI9T260bl9bok4W@lizhi-Precision-Tower-5810>
In-Reply-To: <aRI9T260bl9bok4W@lizhi-Precision-Tower-5810>
From: Vincent Guittot <vincent.guittot@linaro.org>
Date: Thu, 13 Nov 2025 15:44:58 +0100
X-Gm-Features: AWmQ_bkvZNjQ1Qh_dA2hcZ-2KrSCoqn4Hw9CqqUeyqhk9LfBW4EldGpwJgFMJrs
Message-ID: <CAKfTPtDCysLA6TLxUnP8-vsD4DwvPz2Ri6R5k6YE4ZtQY0uk8Q@mail.gmail.com>
Subject: Re: [PATCH 3/4 v4] PCI: s32g: Add initial PCIe support (RC)
To: Frank Li <Frank.li@nxp.com>
Cc: chester62515@gmail.com, mbrugger@suse.com, ghennadi.procopciuc@oss.nxp.com, 
	s32@nxp.com, bhelgaas@google.com, jingoohan1@gmail.com, lpieralisi@kernel.org, 
	kwilczynski@kernel.org, mani@kernel.org, robh@kernel.org, krzk+dt@kernel.org, 
	conor+dt@kernel.org, Ionut.Vicovan@nxp.com, larisa.grigore@nxp.com, 
	ciprianmarian.costea@nxp.com, bogdan.hamciuc@nxp.com, 
	linux-arm-kernel@lists.infradead.org, linux-pci@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, imx@lists.linux.dev, 
	cassel@kernel.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251113_064516_074630_C1526B8E 
X-CRM114-Status: GOOD (  36.57  )
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

On Mon, 10 Nov 2025 at 20:30, Frank Li <Frank.li@nxp.com> wrote:
>
> On Mon, Nov 10, 2025 at 06:33:33PM +0100, Vincent Guittot wrote:
> > Add initial support of the PCIe controller for S32G Soc family. Only
> > host mode is supported.
> >
> > Co-developed-by: Ionut Vicovan <Ionut.Vicovan@nxp.com>
> > Signed-off-by: Ionut Vicovan <Ionut.Vicovan@nxp.com>
> > Co-developed-by: Ciprian Marian Costea <ciprianmarian.costea@nxp.com>
> > Signed-off-by: Ciprian Marian Costea <ciprianmarian.costea@nxp.com>
> > Co-developed-by: Ghennadi Procopciuc <Ghennadi.Procopciuc@nxp.com>
> > Signed-off-by: Ghennadi Procopciuc <Ghennadi.Procopciuc@nxp.com>
> > Co-developed-by: Larisa Grigore <larisa.grigore@nxp.com>
> > Signed-off-by: Larisa Grigore <larisa.grigore@nxp.com>
> > Signed-off-by: Vincent Guittot <vincent.guittot@linaro.org>
> > ---
> >  drivers/pci/controller/dwc/Kconfig            |  10 +
> >  drivers/pci/controller/dwc/Makefile           |   1 +
> >  .../pci/controller/dwc/pcie-nxp-s32g-regs.h   |  27 ++
> >  drivers/pci/controller/dwc/pcie-nxp-s32g.c    | 435 ++++++++++++++++++
> >  4 files changed, 473 insertions(+)
> >  create mode 100644 drivers/pci/controller/dwc/pcie-nxp-s32g-regs.h
> >  create mode 100644 drivers/pci/controller/dwc/pcie-nxp-s32g.c
> >
> > diff --git a/drivers/pci/controller/dwc/Kconfig b/drivers/pci/controller/dwc/Kconfig
> > index 349d4657393c..e276956c3fca 100644
> > --- a/drivers/pci/controller/dwc/Kconfig
> > +++ b/drivers/pci/controller/dwc/Kconfig
> > @@ -256,6 +256,16 @@ config PCIE_TEGRA194_EP
> >         in order to enable device-specific features PCIE_TEGRA194_EP must be
> >         selected. This uses the DesignWare core.
> >
> > +config PCIE_NXP_S32G
> > +     tristate "NXP S32G PCIe controller (host mode)"
> > +     depends on ARCH_S32 || COMPILE_TEST
> > +     select PCIE_DW_HOST
> > +     help
> > +       Enable support for the PCIe controller in NXP S32G based boards to
> > +       work in Host mode. The controller is based on DesignWare IP and
> > +       can work either as RC or EP. In order to enable host-specific
> > +       features PCIE_NXP_S32G must be selected.
> > +
> >  config PCIE_DW_PLAT
> >       bool
> >
> > diff --git a/drivers/pci/controller/dwc/Makefile b/drivers/pci/controller/dwc/Makefile
> > index 7ae28f3b0fb3..3301bbbad78c 100644
> > --- a/drivers/pci/controller/dwc/Makefile
> > +++ b/drivers/pci/controller/dwc/Makefile
> > @@ -10,6 +10,7 @@ obj-$(CONFIG_PCI_DRA7XX) += pci-dra7xx.o
> >  obj-$(CONFIG_PCI_EXYNOS) += pci-exynos.o
> >  obj-$(CONFIG_PCIE_FU740) += pcie-fu740.o
> >  obj-$(CONFIG_PCI_IMX6) += pci-imx6.o
> > +obj-$(CONFIG_PCIE_NXP_S32G) += pcie-nxp-s32g.o
> >  obj-$(CONFIG_PCIE_SPEAR13XX) += pcie-spear13xx.o
> >  obj-$(CONFIG_PCI_KEYSTONE) += pci-keystone.o
> >  obj-$(CONFIG_PCI_LAYERSCAPE) += pci-layerscape.o
> > diff --git a/drivers/pci/controller/dwc/pcie-nxp-s32g-regs.h b/drivers/pci/controller/dwc/pcie-nxp-s32g-regs.h
> > new file mode 100644
> > index 000000000000..c264446a8f21
> > --- /dev/null
> > +++ b/drivers/pci/controller/dwc/pcie-nxp-s32g-regs.h
> > @@ -0,0 +1,27 @@
> > +/* SPDX-License-Identifier: GPL-2.0+ */
> > +/*
> > + * Copyright 2015-2016 Freescale Semiconductor, Inc.
> > + * Copyright 2016-2023, 2025 NXP
> > + */
> > +
> > +#ifndef PCIE_S32G_REGS_H
> > +#define PCIE_S32G_REGS_H
> > +
> > +/* PCIe controller Sub-System */
> > +
> > +/* PCIe controller 0 General Control 1 */
> > +#define PCIE_S32G_PE0_GEN_CTRL_1             0x50
> > +#define DEVICE_TYPE_MASK                     GENMASK(3, 0)
> > +#define SRIS_MODE                            BIT(8)
> > +
> > +/* PCIe controller 0 General Control 3 */
> > +#define PCIE_S32G_PE0_GEN_CTRL_3             0x58
> > +#define LTSSM_EN                             BIT(0)
> > +
> > +/* PCIe Controller 0 Link Debug 2 */
> > +#define PCIE_S32G_PE0_LINK_DBG_2             0xB4
> > +#define SMLH_LTSSM_STATE_MASK                        GENMASK(5, 0)
> > +#define SMLH_LINK_UP                         BIT(6)
> > +#define RDLH_LINK_UP                         BIT(7)
> > +
> > +#endif  /* PCI_S32G_REGS_H */
> > diff --git a/drivers/pci/controller/dwc/pcie-nxp-s32g.c b/drivers/pci/controller/dwc/pcie-nxp-s32g.c
> > new file mode 100644
> > index 000000000000..18bf0fe6f416
> > --- /dev/null
> > +++ b/drivers/pci/controller/dwc/pcie-nxp-s32g.c
> > @@ -0,0 +1,435 @@
> > +// SPDX-License-Identifier: GPL-2.0
> > +/*
> > + * PCIe host controller driver for NXP S32G SoCs
> > + *
> > + * Copyright 2019-2025 NXP
> > + */
> > +
> ...
> > +
> > +#define PCIE_LINKUP  (SMLH_LINK_UP | RDLH_LINK_UP)
> > +
> > +static bool s32g_has_data_phy_link(struct s32g_pcie *s32g_pp)
> > +{
> > +     u32 reg = s32g_pcie_readl_ctrl(s32g_pp, PCIE_S32G_PE0_LINK_DBG_2);
> > +
> > +     if ((reg & PCIE_LINKUP) == PCIE_LINKUP) {
> > +             switch (FIELD_GET(SMLH_LTSSM_STATE_MASK, reg)) {
> > +             case DW_PCIE_LTSSM_L0:
> > +             case DW_PCIE_LTSSM_L0S:
> > +             case DW_PCIE_LTSSM_L1_IDLE:
> > +                     return true;
> > +             default:
> > +                     return false;
>
> Are you sure code can go here? I think IP set flag PCIE_LINKUP of
> PCIE_S32G_PE0_LINK_DBG_2 only after LTSSM in above states. Do you know
> which case PCIE_LINKUP is true, but LTSSM is not other state?

I don't have access to such details but can't we have
DW_PCIE_LTSSM_L123_SEND_EIDLE or other transient state but PCIE_LINKUP
?

>
> I remember I asked if DEBUG0 register work? any conclusion?

I mentioned in the cover letter that I was still waiting feedback from
internal team before switching to DEBUG0 and DEBUG1 and remove
.get_ltssm() and .link_up()

I received the feedback earlier today that I can use DEBUG0 and
DEBUG1, so I don't need to implement .get_ltssm() and .link_up(). I
will remove them in the next version

>
> > +             }
> > +     }
> > +
> > +     return false;
> > +}
> > +
>
> ...
>
> > +
> > +static int s32g_pcie_parse_port(struct s32g_pcie *s32g_pp, struct device_node *node)
> > +{
> > +     struct device *dev = s32g_pp->pci.dev;
> > +     struct s32g_pcie_port *port;
> > +     int num_lanes;
> > +
> > +     port = devm_kzalloc(dev, sizeof(*port), GFP_KERNEL);
> > +     if (!port)
> > +             return -ENOMEM;
> > +
> > +     port->phy = devm_of_phy_get(dev, node, NULL);
> > +     if (IS_ERR(port->phy))
> > +             return dev_err_probe(dev, PTR_ERR(port->phy),
> > +                             "Failed to get serdes PHY\n");
> > +
> > +     INIT_LIST_HEAD(&port->list);
> > +     list_add_tail(&port->list, &s32g_pp->ports);
> > +
> > +     /*
> > +      * The DWC core initialization code cannot parse yet the num-lanes
> > +      * attribute in the Root Port node. The S32G only supports one Root
> > +      * Port for now so its driver can parse the node and set the num_lanes
> > +      * field of struct dwc_pcie before calling dw_pcie_host_init().
> > +      */
> > +     if (!of_property_read_u32(node, "num-lanes", &num_lanes))
> > +             s32g_pp->pci.num_lanes = num_lanes;
>
> Can you add this to dwc core driver?
>
> Frank
>
> > +
> > +     return 0;
> > +}
> > +
> ...
> > --
> > 2.43.0
> >

