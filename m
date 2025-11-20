Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2B7CCCF9C7C
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 20 Nov 2025 17:57:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Uqkn6zhkrlcLOP1KX4uwhO1P+OL6/CVgLQxGoDqtqAw=; b=iosBVd3Kd3adX0xZ0y08+S1IfL
	MWzehtWKuWdkdkeuEvsEhzJ6D4zy6NK1Z7KJbZr22CUaFrlQR/zzmdS3R3G6tnufA6napaEkFGNRt
	krhcyVbbsQMjWBBH1SNJQlvkyWybIOjAFbgx0m1Gy1paF/EW97faSSVu84jZANpB7Eji177H6VxaR
	4wTziEthuT0clDxQjj+bgoyORFTH8CWfusxuCVMummLKEeTQ9RkbW4ReZlczXA5w7tTpFvQPbIjlt
	wQPaiA1/rqebxWBXJ2nochhC2ccM+IEkW43jKSFKSiUVW9d7CqUlbsV6x3xn6ogJymwreT3EXyrHM
	12MKGxHQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vM8uY-00000007Bev-3PjQ;
	Thu, 20 Nov 2025 17:57:38 +0000
Received: from mail-ed1-x535.google.com ([2a00:1450:4864:20::535])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vM8uW-00000007BeW-0aBc
	for linux-arm-kernel@lists.infradead.org;
	Thu, 20 Nov 2025 17:57:37 +0000
Received: by mail-ed1-x535.google.com with SMTP id 4fb4d7f45d1cf-640bd9039fbso1923348a12.2
        for <linux-arm-kernel@lists.infradead.org>; Thu, 20 Nov 2025 09:57:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1763661454; x=1764266254; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Uqkn6zhkrlcLOP1KX4uwhO1P+OL6/CVgLQxGoDqtqAw=;
        b=jQ36XwEVBgPkbfZNvmk+9gOSF/uPcK7g1YraI/1tcVS9mRdG5xZFPtqxQG0f26H7/n
         ly/KwPNO67d/vWMJVJWgT9qz6BcYc8d2PZ/XklVRNitVHnF3h5fspPwkMapVXwu+Bl0k
         +y+gdxCQL5D0YuP70RcDzzFmP3AFdrVHckYj6t2b0uedDCPUN1p3wWb9wULfJwnvw0s/
         7j4Z6vfF+YZtWJAlD/ATUPy3uy5elgeltuZsJRU/C2KKKNBMdHu2SO6jVEB8vpYYuQyM
         BE8Yn2fxIYPFBTpqcY1KKaei2RA25kzJEJQaBJRnwDz7lC80DNJgJVZoG2WHgGZ0mlf5
         H4Yw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763661454; x=1764266254;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Uqkn6zhkrlcLOP1KX4uwhO1P+OL6/CVgLQxGoDqtqAw=;
        b=jOW8NbbOJoeO3rCAVAq5R7Uewp64PhlWXek8k6XlXMAAWtvEDHgBdsrsH9vYlLqzof
         oGgqpoiBuUDUmqeORlM+KZEWTrZSP8r1QHD81/5g1qEX8X52dpTyReG9Yrnpu02EFGjS
         LL81fzymo1FAnwCnFvPCgk9lP0koRpiueXtBtDmnfRrzFQh/v+nTssapYrY7q7mhA6Ik
         JQFkBuAjotzIRVqxT5ih+61Qh3SbyhCoAI4C2WFuQTmVx6rJ9oixKBX47yEwGLQkg2GL
         BqS7b56wsH00Oh/JaiZmbQvDJ5mstQU3WWVkpabSjK2wM7PZVK/bH3PKBOp9nypgAsFE
         G6gg==
X-Forwarded-Encrypted: i=1; AJvYcCUebGS7rvj8rJ8X6PKSTQ+CfCyDL19tH9n7L6ofqq/+93SB2vz0kyXhMobsv0NBLs/jPx4YRY6nQztr3VL0lYW0@lists.infradead.org
X-Gm-Message-State: AOJu0YyoZi3wG7Zl1Y7PKXpX9DDVN4/4iPtpCC6hP6R/Kys7LbhMvNW3
	GNcZpfMAgDSs+5nCTdbZYsT/w1a827HcOxp2COaVtzS4ttN0ISQ6BBmO2B7r4rCHBZ6dbJJ0vzu
	hsZKWl68wN7zpryBHZPZ2F+2BXpxDTweEYKXXuICsyA==
X-Gm-Gg: ASbGncs/5g6fwEj+OyhMP/wH4y/dhVahDPCXr2sKibk7hvSysNl+kh6wGVf0YFPuzyy
	fGthuqjP4JaPctnFFWWWpLYH0Ib6iV1P/1diHulDa5dRwjovjPU8CWw0cLd3qp+/1lwdstiiMvz
	nGo8iJ5XyXmEW/O1HYnsuLDFyCVegPnYYOwYQ2XzwUOuFzm/85127v+fuGz4tENB/iss662UiRp
	uus2sf0znU7/8Mo9dqdH9skjH1FZbycMeLW+KVr2DQ9oukr46vBQLFb2AWUN9hOyC1rzgvpA6E6
	IYLrblmFeYfMfyQnrxgdmzY=
X-Google-Smtp-Source: AGHT+IFj0Rl1KS1OB3mzQqOg+H1c3XE+cHubhYUstGEZ/xepTDIQHjG1vw6/BbGnXDgdX5i3V+VpoGd1BY2rU2bf4Bg=
X-Received: by 2002:a05:6402:270c:b0:640:6653:65c1 with SMTP id
 4fb4d7f45d1cf-6453d085090mr2533218a12.5.1763661453991; Thu, 20 Nov 2025
 09:57:33 -0800 (PST)
MIME-Version: 1.0
References: <20251118160238.26265-1-vincent.guittot@linaro.org>
 <20251118160238.26265-4-vincent.guittot@linaro.org> <qvpx4ys2jqqugfbcdwidwvklcatdqiwdxfjumn7ncbh7z6ef5n@sepvjsatmpbd>
 <CAKfTPtDONX3-syavhhza6t6+6U8wowqwCN2Hnv9CHBR6W9RNNQ@mail.gmail.com> <gz67pxlwddob5my62imtkiluwezixvn55gm2dse46njsolb3ct@p3wmu2j6swnc>
In-Reply-To: <gz67pxlwddob5my62imtkiluwezixvn55gm2dse46njsolb3ct@p3wmu2j6swnc>
From: Vincent Guittot <vincent.guittot@linaro.org>
Date: Thu, 20 Nov 2025 18:57:21 +0100
X-Gm-Features: AWmQ_bnT-L9dZpIzwe2wsEnejXBmyqxUslXNLMo6Yb6Ge6ARhPFqi_pzi5hlHvs
Message-ID: <CAKfTPtDXdmB7zPqN9UcZDnCBp5o2Z1mBOvoeZYmmphy0KFH3+w@mail.gmail.com>
Subject: Re: [PATCH 3/4 v5] PCI: s32g: Add initial PCIe support (RC)
To: Manivannan Sadhasivam <mani@kernel.org>
Cc: chester62515@gmail.com, mbrugger@suse.com, ghennadi.procopciuc@oss.nxp.com, 
	s32@nxp.com, bhelgaas@google.com, jingoohan1@gmail.com, lpieralisi@kernel.org, 
	kwilczynski@kernel.org, robh@kernel.org, krzk+dt@kernel.org, 
	conor+dt@kernel.org, Ionut.Vicovan@nxp.com, larisa.grigore@nxp.com, 
	Ghennadi.Procopciuc@nxp.com, ciprianmarian.costea@nxp.com, 
	bogdan.hamciuc@nxp.com, Frank.li@nxp.com, 
	linux-arm-kernel@lists.infradead.org, linux-pci@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, imx@lists.linux.dev, 
	cassel@kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251120_095736_363980_9AA999AC 
X-CRM114-Status: GOOD (  47.27  )
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

On Thu, 20 Nov 2025 at 11:26, Manivannan Sadhasivam <mani@kernel.org> wrote=
:
>
> On Thu, Nov 20, 2025 at 10:06:53AM +0100, Vincent Guittot wrote:
> > On Thu, 20 Nov 2025 at 09:22, Manivannan Sadhasivam <mani@kernel.org> w=
rote:
> > >
> > > On Tue, Nov 18, 2025 at 05:02:37PM +0100, Vincent Guittot wrote:
> > > > Add initial support of the PCIe controller for S32G Soc family. Onl=
y
> > > > host mode is supported.
> > > >
> > > > Co-developed-by: Ionut Vicovan <Ionut.Vicovan@nxp.com>
> > > > Signed-off-by: Ionut Vicovan <Ionut.Vicovan@nxp.com>
> > > > Co-developed-by: Ciprian Marian Costea <ciprianmarian.costea@nxp.co=
m>
> > > > Signed-off-by: Ciprian Marian Costea <ciprianmarian.costea@nxp.com>
> > > > Co-developed-by: Ghennadi Procopciuc <Ghennadi.Procopciuc@nxp.com>
> > > > Signed-off-by: Ghennadi Procopciuc <Ghennadi.Procopciuc@nxp.com>
> > > > Co-developed-by: Larisa Grigore <larisa.grigore@nxp.com>
> > > > Signed-off-by: Larisa Grigore <larisa.grigore@nxp.com>
> > > > Signed-off-by: Vincent Guittot <vincent.guittot@linaro.org>
> > > > ---
> > > >  drivers/pci/controller/dwc/Kconfig            |  10 +
> > > >  drivers/pci/controller/dwc/Makefile           |   1 +
> > > >  .../pci/controller/dwc/pcie-nxp-s32g-regs.h   |  21 +
> > > >  drivers/pci/controller/dwc/pcie-nxp-s32g.c    | 391 ++++++++++++++=
++++
> > > >  4 files changed, 423 insertions(+)
> > > >  create mode 100644 drivers/pci/controller/dwc/pcie-nxp-s32g-regs.h
> > > >  create mode 100644 drivers/pci/controller/dwc/pcie-nxp-s32g.c
> > > >
> > > > diff --git a/drivers/pci/controller/dwc/Kconfig b/drivers/pci/contr=
oller/dwc/Kconfig
> > > > index 349d4657393c..e276956c3fca 100644
> > > > --- a/drivers/pci/controller/dwc/Kconfig
> > > > +++ b/drivers/pci/controller/dwc/Kconfig
> > > > @@ -256,6 +256,16 @@ config PCIE_TEGRA194_EP
> > > >         in order to enable device-specific features PCIE_TEGRA194_E=
P must be
> > > >         selected. This uses the DesignWare core.
> > > >
> > > > +config PCIE_NXP_S32G
> > > > +     tristate "NXP S32G PCIe controller (host mode)"
> > > > +     depends on ARCH_S32 || COMPILE_TEST
> > > > +     select PCIE_DW_HOST
> > > > +     help
> > > > +       Enable support for the PCIe controller in NXP S32G based bo=
ards to
> > > > +       work in Host mode. The controller is based on DesignWare IP=
 and
> > > > +       can work either as RC or EP. In order to enable host-specif=
ic
> > > > +       features PCIE_NXP_S32G must be selected.
> > > > +
> > > >  config PCIE_DW_PLAT
> > > >       bool
> > > >
> > > > diff --git a/drivers/pci/controller/dwc/Makefile b/drivers/pci/cont=
roller/dwc/Makefile
> > > > index 7ae28f3b0fb3..3301bbbad78c 100644
> > > > --- a/drivers/pci/controller/dwc/Makefile
> > > > +++ b/drivers/pci/controller/dwc/Makefile
> > > > @@ -10,6 +10,7 @@ obj-$(CONFIG_PCI_DRA7XX) +=3D pci-dra7xx.o
> > > >  obj-$(CONFIG_PCI_EXYNOS) +=3D pci-exynos.o
> > > >  obj-$(CONFIG_PCIE_FU740) +=3D pcie-fu740.o
> > > >  obj-$(CONFIG_PCI_IMX6) +=3D pci-imx6.o
> > > > +obj-$(CONFIG_PCIE_NXP_S32G) +=3D pcie-nxp-s32g.o
> > > >  obj-$(CONFIG_PCIE_SPEAR13XX) +=3D pcie-spear13xx.o
> > > >  obj-$(CONFIG_PCI_KEYSTONE) +=3D pci-keystone.o
> > > >  obj-$(CONFIG_PCI_LAYERSCAPE) +=3D pci-layerscape.o
> > > > diff --git a/drivers/pci/controller/dwc/pcie-nxp-s32g-regs.h b/driv=
ers/pci/controller/dwc/pcie-nxp-s32g-regs.h
> > > > new file mode 100644
> > > > index 000000000000..81e35b6227d1
> > > > --- /dev/null
> > > > +++ b/drivers/pci/controller/dwc/pcie-nxp-s32g-regs.h
> > > > @@ -0,0 +1,21 @@
> > > > +/* SPDX-License-Identifier: GPL-2.0+ */
> > > > +/*
> > > > + * Copyright 2015-2016 Freescale Semiconductor, Inc.
> > > > + * Copyright 2016-2023, 2025 NXP
> > > > + */
> > > > +
> > > > +#ifndef PCIE_S32G_REGS_H
> > > > +#define PCIE_S32G_REGS_H
> > > > +
> > > > +/* PCIe controller Sub-System */
> > > > +
> > > > +/* PCIe controller 0 General Control 1 */
> > > > +#define PCIE_S32G_PE0_GEN_CTRL_1             0x50
> > > > +#define DEVICE_TYPE_MASK                     GENMASK(3, 0)
> > > > +#define SRIS_MODE                            BIT(8)
> > > > +
> > > > +/* PCIe controller 0 General Control 3 */
> > > > +#define PCIE_S32G_PE0_GEN_CTRL_3             0x58
> > > > +#define LTSSM_EN                             BIT(0)
> > > > +
> > >
> > > Since this header is not used by other drivers as of now, I'd prefer =
moving
> > > these definitions inside the driver.
> >
> > I would prefer to keep it separate. It makes reg easier to parse and
> > more registers will be added with new coming features
> >
>
> The convention we follow is to mostly add register definitions within the=
 driver
> itself if they are not shared.

It will be shared with EP driver later on but I supposed it can be
merged in the meantime

>
> > >
> > > > +#endif  /* PCI_S32G_REGS_H */
> > > > diff --git a/drivers/pci/controller/dwc/pcie-nxp-s32g.c b/drivers/p=
ci/controller/dwc/pcie-nxp-s32g.c
> > > > new file mode 100644
> > > > index 000000000000..eaa6b5363afe
> > > > --- /dev/null
> > > > +++ b/drivers/pci/controller/dwc/pcie-nxp-s32g.c
> > > > @@ -0,0 +1,391 @@
> > > > +// SPDX-License-Identifier: GPL-2.0
> > > > +/*
> > > > + * PCIe host controller driver for NXP S32G SoCs
> > > > + *
> > > > + * Copyright 2019-2025 NXP
> > > > + */
> > > > +
> > > > +#include <linux/interrupt.h>
> > > > +#include <linux/io.h>
> > > > +#include <linux/memblock.h>
> > > > +#include <linux/module.h>
> > > > +#include <linux/of_device.h>
> > > > +#include <linux/of_address.h>
> > > > +#include <linux/pci.h>
> > > > +#include <linux/phy/phy.h>
> > > > +#include <linux/platform_device.h>
> > > > +#include <linux/pm_runtime.h>
> > > > +#include <linux/sizes.h>
> > > > +#include <linux/types.h>
> > > > +
> > > > +#include "pcie-designware.h"
> > > > +#include "pcie-nxp-s32g-regs.h"
> > > > +
> > > > +struct s32g_pcie_port {
> > > > +     struct list_head list;
> > > > +     struct phy *phy;
> > > > +};
> > > > +
> > > > +struct s32g_pcie {
> > > > +     struct dw_pcie  pci;
> > > > +     void __iomem *ctrl_base;
> > > > +     struct list_head ports;
> > > > +};
> > > > +
> > > > +#define to_s32g_from_dw_pcie(x) \
> > > > +     container_of(x, struct s32g_pcie, pci)
> > > > +
> > > > +static void s32g_pcie_writel_ctrl(struct s32g_pcie *s32g_pp, u32 r=
eg, u32 val)
> > > > +{
> > > > +     writel(val, s32g_pp->ctrl_base + reg);
> > > > +}
> > > > +
> > > > +static u32 s32g_pcie_readl_ctrl(struct s32g_pcie *s32g_pp, u32 reg=
)
> > > > +{
> > > > +     return readl(s32g_pp->ctrl_base + reg);
> > > > +}
> > > > +
> > > > +static void s32g_pcie_enable_ltssm(struct s32g_pcie *s32g_pp)
> > > > +{
> > > > +     u32 reg;
> > > > +
> > > > +     reg =3D s32g_pcie_readl_ctrl(s32g_pp, PCIE_S32G_PE0_GEN_CTRL_=
3);
> > > > +     reg |=3D LTSSM_EN;
> > > > +     s32g_pcie_writel_ctrl(s32g_pp, PCIE_S32G_PE0_GEN_CTRL_3, reg)=
;
> > > > +}
> > > > +
> > > > +static void s32g_pcie_disable_ltssm(struct s32g_pcie *s32g_pp)
> > > > +{
> > > > +     u32 reg;
> > > > +
> > > > +     reg =3D s32g_pcie_readl_ctrl(s32g_pp, PCIE_S32G_PE0_GEN_CTRL_=
3);
> > > > +     reg &=3D ~LTSSM_EN;
> > > > +     s32g_pcie_writel_ctrl(s32g_pp, PCIE_S32G_PE0_GEN_CTRL_3, reg)=
;
> > > > +}
> > > > +
> > > > +static int s32g_pcie_start_link(struct dw_pcie *pci)
> > > > +{
> > > > +     struct s32g_pcie *s32g_pp =3D to_s32g_from_dw_pcie(pci);
> > > > +
> > > > +     s32g_pcie_enable_ltssm(s32g_pp);
> > > > +
> > > > +     return 0;
> > > > +}
> > > > +
> > > > +static void s32g_pcie_stop_link(struct dw_pcie *pci)
> > > > +{
> > > > +     struct s32g_pcie *s32g_pp =3D to_s32g_from_dw_pcie(pci);
> > > > +
> > > > +     s32g_pcie_disable_ltssm(s32g_pp);
> > > > +}
> > > > +
> > > > +static struct dw_pcie_ops s32g_pcie_ops =3D {
> > > > +     .start_link =3D s32g_pcie_start_link,
> > > > +     .stop_link =3D s32g_pcie_stop_link,
> > > > +};
> > > > +
> > > > +/* Configure the AMBA AXI Coherency Extensions (ACE) interface */
> > > > +static void s32g_pcie_reset_mstr_ace(struct dw_pcie *pci, u64 ddr_=
base_addr)
> > > > +{
> > > > +     u32 ddr_base_low =3D lower_32_bits(ddr_base_addr);
> > > > +     u32 ddr_base_high =3D upper_32_bits(ddr_base_addr);
> > > > +
> > > > +     dw_pcie_dbi_ro_wr_en(pci);
> > > > +     dw_pcie_writel_dbi(pci, COHERENCY_CONTROL_3_OFF, 0x0);
> > > > +
> > > > +     /*
> > > > +      * Ncore is a cache-coherent interconnect module that enables=
 the
> > > > +      * integration of heterogeneous coherent and non-coherent age=
nts in
> > > > +      * the chip. Ncore Transactions to peripheral should be non-c=
oherent
> > > > +      * or it might drop them.
> > > > +      *
> > > > +      * One example where this is needed are PCIe MSIs, which use =
NoSnoop=3D0
> > > > +      * and might end up routed to Ncore.
> > >
> > > I don't think this statement is correct. No Snoop attribute is only a=
pplicable
> > > to MRd/MWr operations and not applicable to MSIs. Also, you've marked=
 the
> >
> > The Ncore makes the bridge between the PCIe and the NoC and can decide
> > to drop some transactions based in this boundary
> >
> > > controller as cache coherent in the binding, but this comment doesn't=
 relate to
> > > it.
> >
> > More details of the issue:
> > PCIe coherent traffic (e.g. MSIs) that targets peripheral space will
> > be dropped by Ncore because peripherals on S32G are not coherent as
> > slaves. We add a hard boundary in the PCIe controller coherency
> > control registers to separate physical memory space from peripheral
> > space.
> >
>
> Ok, this clarifies. Please add it to the comment.
>
> > >
> > > > +      * Define the start of DDR as seen by Linux as the boundary b=
etween
> > > > +      * "memory" and "peripherals", with peripherals being below.
> > >
> > > Please mention what this configuration does and why it is necessary. =
This is not
> > > clearly mentioned in the comment.
> > >
> > > > +      */
> > > > +     dw_pcie_writel_dbi(pci, COHERENCY_CONTROL_1_OFF,
> > > > +                        (ddr_base_low & CFG_MEMTYPE_BOUNDARY_LOW_A=
DDR_MASK));
> > > > +     dw_pcie_writel_dbi(pci, COHERENCY_CONTROL_2_OFF, ddr_base_hig=
h);
> > > > +     dw_pcie_dbi_ro_wr_dis(pci);
> > > > +}
> > > > +
> > > > +static int s32g_init_pcie_controller(struct dw_pcie_rp *pp)
> > > > +{
> > > > +     struct dw_pcie *pci =3D to_dw_pcie_from_pp(pp);
> > > > +     struct s32g_pcie *s32g_pp =3D to_s32g_from_dw_pcie(pci);
> > > > +     u32 val;
> > > > +
> > > > +     /* Set RP mode */
> > > > +     val =3D s32g_pcie_readl_ctrl(s32g_pp, PCIE_S32G_PE0_GEN_CTRL_=
1);
> > > > +     val &=3D ~DEVICE_TYPE_MASK;
> > > > +     val |=3D FIELD_PREP(DEVICE_TYPE_MASK, PCI_EXP_TYPE_ROOT_PORT)=
;
> > > > +
> > > > +     /* Use default CRNS */
> > >
> > > SRNS?
> >
> > it's CRNS
> >
>
> I'm not aware of CRNS, but only SRNS. Care to expand it?

- crns  # Common Reference Clock, No Spread Spectrum
- crss  # Common Reference Clock, Spread Spectrum
- srns  # Separate reference Clock, No Spread Spectrum
- sris  # Separate Reference Clock, Independent Spread Spectrum

s32g  can support all modes but we only use the default crns for now
until there is a generic way to describe this in DT for all platforms.
This will be discussed in a separate thread

https://lore.kernel.org/all/aMp0hNnBUwTV5cbp@ryzen/

>
> > >
> > > > +     val &=3D ~SRIS_MODE;
> > > > +
> > > > +     s32g_pcie_writel_ctrl(s32g_pp, PCIE_S32G_PE0_GEN_CTRL_1, val)=
;
> > > > +
> > > > +     /*
> > > > +      * Make sure we use the coherency defaults (just in case the =
settings
> > > > +      * have been changed from their reset values)
> > > > +      */
> > > > +     s32g_pcie_reset_mstr_ace(pci, memblock_start_of_DRAM());
> > > > +
> > > > +     dw_pcie_dbi_ro_wr_en(pci);
> > > > +
> > > > +     val =3D dw_pcie_readl_dbi(pci, PCIE_PORT_FORCE);
> > > > +     val |=3D PORT_FORCE_DO_DESKEW_FOR_SRIS;
> > > > +     dw_pcie_writel_dbi(pci, PCIE_PORT_FORCE, val);
> > > > +
> > > > +     val =3D dw_pcie_readl_dbi(pci, GEN3_RELATED_OFF);
> > > > +     val |=3D GEN3_RELATED_OFF_EQ_PHASE_2_3;
> > > > +     dw_pcie_writel_dbi(pci, GEN3_RELATED_OFF, val);
> > > > +
> > > > +     dw_pcie_dbi_ro_wr_dis(pci);
> > > > +
> > > > +     return 0;
> > > > +}
> > > > +
> > > > +static const struct dw_pcie_host_ops s32g_pcie_host_ops =3D {
> > > > +     .init =3D s32g_init_pcie_controller,
> > > > +};
> > > > +
> > > > +static int s32g_init_pcie_phy(struct s32g_pcie *s32g_pp)
> > > > +{
> > > > +     struct dw_pcie *pci =3D &s32g_pp->pci;
> > > > +     struct device *dev =3D pci->dev;
> > > > +     struct s32g_pcie_port *port, *tmp;
> > > > +     int ret;
> > > > +
> > > > +     list_for_each_entry(port, &s32g_pp->ports, list) {
> > > > +             ret =3D phy_init(port->phy);
> > > > +             if (ret) {
> > > > +                     dev_err(dev, "Failed to init serdes PHY\n");
> > > > +                     goto err_phy_revert;
> > > > +             }
> > > > +
> > > > +             ret =3D phy_set_mode_ext(port->phy, PHY_MODE_PCIE, 0)=
;
> > > > +             if (ret) {
> > > > +                     dev_err(dev, "Failed to set mode on serdes PH=
Y\n");
> > > > +                     goto err_phy_exit;
> > > > +             }
> > > > +
> > > > +             ret =3D phy_power_on(port->phy);
> > > > +             if (ret) {
> > > > +                     dev_err(dev, "Failed to power on serdes PHY\n=
");
> > > > +                     goto err_phy_exit;
> > > > +             }
> > > > +     }
> > > > +
> > > > +     return 0;
> > > > +
> > > > +err_phy_exit:
> > > > +     phy_exit(port->phy);
> > > > +
> > > > +err_phy_revert:
> > > > +     list_for_each_entry_continue_reverse(port, &s32g_pp->ports, l=
ist) {
> > > > +             phy_power_off(port->phy);
> > > > +             phy_exit(port->phy);
> > > > +     }
> > > > +
> > > > +     list_for_each_entry_safe(port, tmp, &s32g_pp->ports, list)
> > > > +             list_del(&port->list);
> > >
> > > Can't you use list_for_each_entry_safe_reverse() to combine both oper=
ations?
> >
> > No, it goes over all elements of the list whereas I only want to power
> > off and exit only those which have been init and powered on above.
> >
>
> Sorry, I misread the kdoc...
>
> > >
> > > > +
> > > > +     return ret;
> > > > +}
> > > > +
>
> [...]
>
> > > > +static struct platform_driver s32g_pcie_driver =3D {
> > > > +     .driver =3D {
> > > > +             .name   =3D "s32g-pcie",
> > > > +             .of_match_table =3D s32g_pcie_of_match,
> > > > +             .suppress_bind_attrs =3D true,
> > > > +             .pm =3D pm_sleep_ptr(&s32g_pcie_pm_ops),
> > > > +             .probe_type =3D PROBE_PREFER_ASYNCHRONOUS,
> > > > +     },
> > > > +     .probe =3D s32g_pcie_probe,
> > > > +};
> > > > +
> > > > +module_platform_driver(s32g_pcie_driver);
> > >
> > > builtin_platform_driver() since this controller implements MSI contro=
ller.
> >
> > Can you elaborate ?
> >
>
> If a PCI controller is implementing an irqchip, it is not supposed to be =
removed
> during runtime due to IRQ disposal concern. So we encourage the driver to=
 be
> tristate, but use builtin_platform_driver() so that it can be loaded as a
> module, but not removed dynamically.
>
> This limitation comes from the irqchip framework.

okay
Anyway, I just realized that memblock_start_of_DRAM() is not exported
so it can't be a module



>
> - Mani
>
> --
> =E0=AE=AE=E0=AE=A3=E0=AE=BF=E0=AE=B5=E0=AE=A3=E0=AF=8D=E0=AE=A3=E0=AE=A9=
=E0=AF=8D =E0=AE=9A=E0=AE=A4=E0=AE=BE=E0=AE=9A=E0=AE=BF=E0=AE=B5=E0=AE=AE=
=E0=AF=8D

