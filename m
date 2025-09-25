Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9C01ECAC5B1
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 25 Sep 2025 16:53:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=EyrF0DO1OPDI6Vbc7PenzRdgBPI+mQEhuXLh4wxZG8A=; b=Px8vToUnSvbh5blWPh09j4cuMC
	0MFGgKTRwtSucBHvZ+W8XjBn6N2XiCOhF/xWHG82SC3fi6AdaFUcQi8YjieFpe6RT1wiZBO3CZWeC
	L5lCUSTePYa9X4QClr0MV8Zzbl6jMmBZZitOTEJdDCCva3D/kNFWTTBXcUkqEkXKqolfOLKcWhqWu
	yTTXN/qFoiJUJ/fmk1Aae/maeBVVtGT4TA0t5SNrQzWOFEOlTbD3X2/Nyj0gqaGX60qm6ugLMmkWJ
	kY/tyntZ99gxwujVwbPhb6W0ReU/rpMjU8dsb1bwUQEg4Yw8djv+SE29Cn8HYRYAc8LbhzYVw+iqO
	sNqHRDqA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v1pDW-0000000BIWs-2j1v;
	Thu, 25 Sep 2025 16:53:14 +0000
Received: from mail-pl1-x629.google.com ([2607:f8b0:4864:20::629])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v1pDU-0000000BIVM-0jIS
	for linux-arm-kernel@lists.infradead.org;
	Thu, 25 Sep 2025 16:53:13 +0000
Received: by mail-pl1-x629.google.com with SMTP id d9443c01a7336-269639879c3so11511255ad.2
        for <linux-arm-kernel@lists.infradead.org>; Thu, 25 Sep 2025 09:53:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1758819191; x=1759423991; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=EyrF0DO1OPDI6Vbc7PenzRdgBPI+mQEhuXLh4wxZG8A=;
        b=nU9l7aS2CAqPiYaIex0npmb2AwfG/AyhqgTFsFftJJTdm3U7DYE7vVBct1xWLGNRNx
         kP5girAXBvNaqFhlfC+AUNNaqdYpuurTlK2g27j61DJA+z1bxBq1Ru253cWQoIRhkIE8
         yLqFgHrGWPk9qpNZDLUT9sHojVGhAAcoWAsIyOVpWkRnPNzrfBhi/Cpujj5vuFJP2cfO
         t6q9MQvS0HW5xIKW8JGFKaOuvrmsWwlbfmpN5zG6FWTM5ziJQDtcJWTtAtAVpfFpLgFx
         7EqDkFxqC2nft/QTQtQ2HmI+2b/BrRB3xj/6a/LaGyL4BP7naru6MxFXYL5psfcDhiN3
         nyvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758819191; x=1759423991;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=EyrF0DO1OPDI6Vbc7PenzRdgBPI+mQEhuXLh4wxZG8A=;
        b=rOzi63nib3BlSM8vNsEzZO3FsOw9GTClc9VYrwPHRoGvV6lInI+jI/H4JlkGGfD12b
         VxLbl5bdZuNtDNEXMmIN/skXw/WJ5t3K7HHoDxaxlHPkwZIBMr7uqGEcPXZYHxfN6/nq
         EVFCaLCiAPL0dUp9Kej0h6JeJhXorhWJSAVTOReXeZ0V8xr+TraEH9ceIox6stCDN/P7
         EzvxH1jEtV5BQuH7rXjJNXXWfDF9BmvD9ctmKcWD4sGoaLN5/x6AaYiIQ7hQu3cKdVdG
         DMD/5+E3xZJcB9qkptdDW1xYoHI+ywQomgegkFQzORYk4PA6rnzZgCkG0OZOyiHj4llC
         Q+Qw==
X-Forwarded-Encrypted: i=1; AJvYcCUSYyabrkG9Xgo5BY9ry8CjaaUx9wR4EIEw/z4Ah8h7uE3O4+lALT95IK8uAItOPFBDSRO8YFIf1+Hq3PmwdHks@lists.infradead.org
X-Gm-Message-State: AOJu0YwiaeJUnfWfjk7T+WzW3x2gAGAPzG5SRX0k6LnT/Fn68YbN+TcF
	jbgfwfbNYsMw9bCdEKd7ofckb6zOYq4/va924Sqxwkc0Y3t2mAXLVgBvbwYQb9vJ9n965PjYXHh
	Q8YP5f8BJC/yNGjpQo+6tugikUCPKjJxvnfPBvtJ8RA==
X-Gm-Gg: ASbGncuC+eBexP/AGwcsLiTpUAaZPcvBmkxPNJ5LQxjnt8ZwAiRtXMy4CV6hwmfj3Dx
	5YEjHBVffFCCxSUhQnsHTe7NVCNh0D3U9HnjACkcSKW+9dZUeFW5qy2nYmOHFbwcGJpfeIbqlsN
	BB9clXbRD13VEorJppg4pYsw4MoMKDjcpvks1/xgaY2Z/2CWN1BKNU4LhatyIgMDx6PvGhSQiAu
	DzJ61NK/tlZqevMYahCpAlINOKrGMWrDI7tSylAWHO5HeM=
X-Google-Smtp-Source: AGHT+IHc56Seuxrc0ofx3yfY9fqZFyqckbqlgdkwkk2PS8FTkoXTGeOfh2XaLV6n/Mpoo2QG3+iA1zKk2jDIDEwMVrA=
X-Received: by 2002:a17:903:b8f:b0:276:484c:dc57 with SMTP id
 d9443c01a7336-27ed4a6f05amr50180645ad.49.1758819190680; Thu, 25 Sep 2025
 09:53:10 -0700 (PDT)
MIME-Version: 1.0
References: <20250919155821.95334-1-vincent.guittot@linaro.org>
 <20250919155821.95334-3-vincent.guittot@linaro.org> <4ee5tqdjv5ogcdtysiebtoxmrvrzhkar4bjcsqi47dxtgwac4c@rezn4waubroh>
In-Reply-To: <4ee5tqdjv5ogcdtysiebtoxmrvrzhkar4bjcsqi47dxtgwac4c@rezn4waubroh>
From: Vincent Guittot <vincent.guittot@linaro.org>
Date: Thu, 25 Sep 2025 18:52:57 +0200
X-Gm-Features: AS18NWD4Y7Sxo-tI3DaCEEKdD4HEzk7W1O_9n4HfBfB_FnaAatMi8ywv2PD-2bU
Message-ID: <CAKfTPtAEkegCV-9_x-dXSWQFOoG6kO5JbJq_LToY9YuuRusoVA@mail.gmail.com>
Subject: Re: [PATCH 2/3 v2] PCI: s32g: Add initial PCIe support (RC)
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
X-CRM114-CacheID: sfid-20250925_095312_256994_A191B03E 
X-CRM114-Status: GOOD (  34.81  )
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

On Mon, 22 Sept 2025 at 09:56, Manivannan Sadhasivam <mani@kernel.org> wrot=
e:
>
> On Fri, Sep 19, 2025 at 05:58:20PM +0200, Vincent Guittot wrote:
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
> >  drivers/pci/controller/dwc/Kconfig           |  11 +
> >  drivers/pci/controller/dwc/Makefile          |   1 +
> >  drivers/pci/controller/dwc/pcie-designware.h |   1 +
> >  drivers/pci/controller/dwc/pcie-s32g-regs.h  |  61 ++
> >  drivers/pci/controller/dwc/pcie-s32g.c       | 578 +++++++++++++++++++
> >  5 files changed, 652 insertions(+)
> >  create mode 100644 drivers/pci/controller/dwc/pcie-s32g-regs.h
> >  create mode 100644 drivers/pci/controller/dwc/pcie-s32g.c
> >
> > diff --git a/drivers/pci/controller/dwc/Kconfig b/drivers/pci/controlle=
r/dwc/Kconfig
> > index ff6b6d9e18ec..d7cee915aedd 100644
> > --- a/drivers/pci/controller/dwc/Kconfig
> > +++ b/drivers/pci/controller/dwc/Kconfig
> > @@ -255,6 +255,17 @@ config PCIE_TEGRA194_EP
> >         in order to enable device-specific features PCIE_TEGRA194_EP mu=
st be
> >         selected. This uses the DesignWare core.
> >
> > +config PCIE_S32G
>
> PCIE_NXP_S32G?

I don't have a  strong opinion on this. I have followed what was done
for other PCIE drivers which only use soc family as well like
PCI_IMX6_HOST
PCIE_KIRIN
PCIE_ARMADA_8K
PCIE_TEGRA194_HOST
PCIE_RCAR_GEN4
PCIE_SPEAR13XX

>
> > +     bool "NXP S32G PCIe controller (host mode)"
> > +     depends on ARCH_S32 || (OF && COMPILE_TEST)
> > +     select PCIE_DW_HOST
> > +     help
> > +       Enable support for the PCIe controller in NXP S32G based boards=
 to
> > +       work in Host mode. The controller is based on DesignWare IP and
> > +       can work either as RC or EP. In order to enable host-specific
> > +       features PCIE_S32G must be selected.
> > +
> > +
> >  config PCIE_DW_PLAT
> >       bool
> >
> > diff --git a/drivers/pci/controller/dwc/Makefile b/drivers/pci/controll=
er/dwc/Makefile
> > index 6919d27798d1..47fbedd57747 100644
> > --- a/drivers/pci/controller/dwc/Makefile
> > +++ b/drivers/pci/controller/dwc/Makefile
> > @@ -14,6 +14,7 @@ obj-$(CONFIG_PCIE_SPEAR13XX) +=3D pcie-spear13xx.o
> >  obj-$(CONFIG_PCI_KEYSTONE) +=3D pci-keystone.o
> >  obj-$(CONFIG_PCI_LAYERSCAPE) +=3D pci-layerscape.o
> >  obj-$(CONFIG_PCI_LAYERSCAPE_EP) +=3D pci-layerscape-ep.o
> > +obj-$(CONFIG_PCIE_S32G) +=3D pcie-s32g.o
>
> pcie-nxp-s32g?

Same as Kconfig, other drivers only use the SoC family.

>
> >  obj-$(CONFIG_PCIE_QCOM_COMMON) +=3D pcie-qcom-common.o
> >  obj-$(CONFIG_PCIE_QCOM) +=3D pcie-qcom.o
> >  obj-$(CONFIG_PCIE_QCOM_EP) +=3D pcie-qcom-ep.o
> > diff --git a/drivers/pci/controller/dwc/pcie-designware.h b/drivers/pci=
/controller/dwc/pcie-designware.h
> > index 00f52d472dcd..2aec011a9dd4 100644
> > --- a/drivers/pci/controller/dwc/pcie-designware.h
> > +++ b/drivers/pci/controller/dwc/pcie-designware.h
> > @@ -119,6 +119,7 @@
> >
> >  #define GEN3_RELATED_OFF                     0x890
> >  #define GEN3_RELATED_OFF_GEN3_ZRXDC_NONCOMPL BIT(0)
> > +#define GEN3_RELATED_OFF_EQ_PHASE_2_3                BIT(9)
> >  #define GEN3_RELATED_OFF_RXEQ_RGRDLESS_RXTS  BIT(13)
> >  #define GEN3_RELATED_OFF_GEN3_EQ_DISABLE     BIT(16)
> >  #define GEN3_RELATED_OFF_RATE_SHADOW_SEL_SHIFT       24
> > diff --git a/drivers/pci/controller/dwc/pcie-s32g-regs.h b/drivers/pci/=
controller/dwc/pcie-s32g-regs.h
> > new file mode 100644
> > index 000000000000..674ea47a525f
> > --- /dev/null
> > +++ b/drivers/pci/controller/dwc/pcie-s32g-regs.h
> > @@ -0,0 +1,61 @@
> > +/* SPDX-License-Identifier: GPL-2.0+ */
> > +/*
> > + * Copyright 2015-2016 Freescale Semiconductor, Inc.
> > + * Copyright 2016-2023, 2025 NXP
> > + */
> > +
> > +#ifndef PCIE_S32G_REGS_H
> > +#define PCIE_S32G_REGS_H
> > +
> > +/* Instance PCIE_SS - CTRL register offsets (ctrl base) */
> > +#define LINK_INT_CTRL_STS                    0x40
>
> Use PCIE_S32G prefix for vendor specific registers.

Okay

>
> > +#define LINK_REQ_RST_NOT_INT_EN                      BIT(1)
> > +#define LINK_REQ_RST_NOT_CLR                 BIT(2)
> > +
> > +/* PCIe controller 0 general control 1 (ctrl base) */
> > +#define PE0_GEN_CTRL_1                               0x50
> > +#define SS_DEVICE_TYPE_MASK                  GENMASK(3, 0)
> > +#define SS_DEVICE_TYPE(x)                    FIELD_PREP(SS_DEVICE_TYPE=
_MASK, x)
> > +#define SRIS_MODE_EN                         BIT(8)
> > +
> > +/* PCIe controller 0 general control 3 (ctrl base) */
> > +#define PE0_GEN_CTRL_3                               0x58
> > +/* LTSSM Enable. Active high. Set it low to hold the LTSSM in Detect s=
tate. */
> > +#define LTSSM_EN                             BIT(0)
> > +
> > +/* PCIe Controller 0 Link Debug 2 (ctrl base) */
> > +#define PCIE_SS_PE0_LINK_DBG_2                       0xB4
> > +#define PCIE_SS_SMLH_LTSSM_STATE_MASK                GENMASK(5, 0)
> > +#define PCIE_SS_SMLH_LINK_UP                 BIT(6)
> > +#define PCIE_SS_RDLH_LINK_UP                 BIT(7)
> > +#define LTSSM_STATE_L0                               0x11U /* L0 state=
 */
> > +#define LTSSM_STATE_L0S                              0x12U /* L0S stat=
e */
> > +#define LTSSM_STATE_L1_IDLE                  0x14U /* L1_IDLE state */
> > +#define LTSSM_STATE_HOT_RESET                        0x1FU /* HOT_RESE=
T state */
> > +
> > +/* PCIe Controller 0  Interrupt Status (ctrl base) */
> > +#define PE0_INT_STS                          0xE8
> > +#define HP_INT_STS                           BIT(6)
> > +
> > +/* Link Control and Status Register. (PCI_EXP_LNKCTL in pci-regs.h) */
> > +#define PCIE_CAP_LINK_TRAINING                       BIT(27)
> > +
> > +/* Instance PCIE_PORT_LOGIC - DBI register offsets */
> > +#define PCIE_PORT_LOGIC_BASE                 0x700
> > +
> > +/* ACE Cache Coherency Control Register 3 */
> > +#define PORT_LOGIC_COHERENCY_CONTROL_1               (PCIE_PORT_LOGIC_=
BASE + 0x1E0)
> > +#define PORT_LOGIC_COHERENCY_CONTROL_2               (PCIE_PORT_LOGIC_=
BASE + 0x1E4)
> > +#define PORT_LOGIC_COHERENCY_CONTROL_3               (PCIE_PORT_LOGIC_=
BASE + 0x1E8)
> > +
> > +/*
> > + * See definition of register "ACE Cache Coherency Control Register 1"
> > + * (COHERENCY_CONTROL_1_OFF) in the SoC RM
> > + */
> > +#define CC_1_MEMTYPE_BOUNDARY_MASK           GENMASK(31, 2)
> > +#define CC_1_MEMTYPE_BOUNDARY(x)             FIELD_PREP(CC_1_MEMTYPE_B=
OUNDARY_MASK, x)
> > +#define CC_1_MEMTYPE_VALUE                   BIT(0)
> > +#define CC_1_MEMTYPE_LOWER_PERIPH            0x0
> > +#define CC_1_MEMTYPE_LOWER_MEM                       0x1
> > +
> > +#endif  /* PCI_S32G_REGS_H */
> > diff --git a/drivers/pci/controller/dwc/pcie-s32g.c b/drivers/pci/contr=
oller/dwc/pcie-s32g.c
> > new file mode 100644
> > index 000000000000..995e4593a13e
> > --- /dev/null
> > +++ b/drivers/pci/controller/dwc/pcie-s32g.c
> > @@ -0,0 +1,578 @@
> > +// SPDX-License-Identifier: GPL-2.0
> > +/*
> > + * PCIe host controller driver for NXP S32G SoCs
> > + *
> > + * Copyright 2019-2025 NXP
> > + */
> > +
> > +#include <linux/interrupt.h>
> > +#include <linux/io.h>
> > +#include <linux/module.h>
> > +#include <linux/of_device.h>
> > +#include <linux/of_address.h>
> > +#include <linux/pci.h>
> > +#include <linux/phy.h>
> > +#include <linux/phy/phy.h>
> > +#include <linux/platform_device.h>
> > +#include <linux/pm_runtime.h>
> > +#include <linux/sizes.h>
> > +#include <linux/types.h>
> > +
> > +#include "pcie-designware.h"
> > +#include "pcie-s32g-regs.h"
> > +
> > +struct s32g_pcie {
> > +     struct dw_pcie  pci;
> > +
> > +     /*
> > +      * We have cfg in struct dw_pcie_rp and
> > +      * dbi in struct dw_pcie, so define only ctrl here
> > +      */
> > +     void __iomem *ctrl_base;
> > +     u64 coherency_base;
> > +
> > +     struct phy *phy;
> > +};
> > +
> > +#define to_s32g_from_dw_pcie(x) \
> > +     container_of(x, struct s32g_pcie, pci)
> > +
> > +static void s32g_pcie_writel_ctrl(struct s32g_pcie *s32g_pp, u32 reg, =
u32 val)
> > +{
> > +     if (dw_pcie_write(s32g_pp->ctrl_base + reg, 0x4, val))
> > +             dev_err(s32g_pp->pci.dev, "Write ctrl address failed\n");
> > +}
>
> Since you are having complete control over the register and the base, you=
 can
> directly use writel/readl without these helpers. They are mostly used to
> read/write the common register space like DBI.

fair enough

>
> > +
> > +static u32 s32g_pcie_readl_ctrl(struct s32g_pcie *s32g_pp, u32 reg)
> > +{
> > +     u32 val =3D 0;
> > +
> > +     if (dw_pcie_read(s32g_pp->ctrl_base + reg, 0x4, &val))
> > +             dev_err(s32g_pp->pci.dev, "Read ctrl address failed\n");
> > +
> > +     return val;
> > +}
> > +
> > +static void s32g_pcie_enable_ltssm(struct s32g_pcie *s32g_pp)
> > +{
> > +     u32 reg;
> > +
> > +     reg =3D s32g_pcie_readl_ctrl(s32g_pp, PE0_GEN_CTRL_3);
> > +     reg |=3D LTSSM_EN;
> > +     s32g_pcie_writel_ctrl(s32g_pp, PE0_GEN_CTRL_3, reg);
> > +}
> > +
> > +static void s32g_pcie_disable_ltssm(struct s32g_pcie *s32g_pp)
> > +{
> > +     u32 reg;
> > +
> > +     reg =3D s32g_pcie_readl_ctrl(s32g_pp, PE0_GEN_CTRL_3);
> > +     reg &=3D ~LTSSM_EN;
> > +     s32g_pcie_writel_ctrl(s32g_pp, PE0_GEN_CTRL_3, reg);
> > +}
> > +
> > +static bool is_s32g_pcie_ltssm_enabled(struct s32g_pcie *s32g_pp)
> > +{
> > +     return (s32g_pcie_readl_ctrl(s32g_pp, PE0_GEN_CTRL_3) & LTSSM_EN)=
;
> > +}
> > +
> > +static enum dw_pcie_ltssm s32g_pcie_get_ltssm(struct dw_pcie *pci)
> > +{
> > +     struct s32g_pcie *s32g_pp =3D to_s32g_from_dw_pcie(pci);
> > +     u32 val =3D s32g_pcie_readl_ctrl(s32g_pp, PCIE_SS_PE0_LINK_DBG_2)=
;
> > +
> > +     return (enum dw_pcie_ltssm)FIELD_GET(PCIE_SS_SMLH_LTSSM_STATE_MAS=
K, val);
> > +}
> > +
> > +#define PCIE_LINKUP  (PCIE_SS_SMLH_LINK_UP | PCIE_SS_RDLH_LINK_UP)
> > +
> > +static bool has_data_phy_link(struct s32g_pcie *s32g_pp)
> > +{
> > +     u32 val =3D s32g_pcie_readl_ctrl(s32g_pp, PCIE_SS_PE0_LINK_DBG_2)=
;
> > +
> > +     if ((val & PCIE_LINKUP) =3D=3D PCIE_LINKUP) {
> > +             switch (val & PCIE_SS_SMLH_LTSSM_STATE_MASK) {
> > +             case LTSSM_STATE_L0:
> > +             case LTSSM_STATE_L0S:
> > +             case LTSSM_STATE_L1_IDLE:
> > +                     return true;
> > +             default:
> > +                     return false;
> > +             }
> > +     }
> > +
> > +     return false;
> > +}
> > +
> > +static bool s32g_pcie_link_up(struct dw_pcie *pci)
> > +{
> > +     struct s32g_pcie *s32g_pp =3D to_s32g_from_dw_pcie(pci);
> > +
> > +     if (!is_s32g_pcie_ltssm_enabled(s32g_pp))
> > +             return false;
> > +
> > +     return has_data_phy_link(s32g_pp);
> > +}
> > +
> > +static int s32g_pcie_start_link(struct dw_pcie *pci)
> > +{
> > +     struct s32g_pcie *s32g_pp =3D to_s32g_from_dw_pcie(pci);
> > +
> > +     s32g_pcie_enable_ltssm(s32g_pp);
> > +
> > +     return 0;
> > +}
> > +
> > +static void s32g_pcie_stop_link(struct dw_pcie *pci)
> > +{
> > +     struct s32g_pcie *s32g_pp =3D to_s32g_from_dw_pcie(pci);
> > +
> > +     s32g_pcie_disable_ltssm(s32g_pp);
> > +}
> > +
> > +struct dw_pcie_ops s32g_pcie_ops =3D {
> > +     .get_ltssm =3D s32g_pcie_get_ltssm,
> > +     .link_up =3D s32g_pcie_link_up,
> > +     .start_link =3D s32g_pcie_start_link,
> > +     .stop_link =3D s32g_pcie_stop_link,
> > +};
> > +
> > +static const struct dw_pcie_host_ops s32g_pcie_host_ops;
> > +
> > +static void disable_equalization(struct dw_pcie *pci)
> > +{
> > +     u32 val;
> > +
> > +     val =3D dw_pcie_readl_dbi(pci, GEN3_EQ_CONTROL_OFF);
> > +     val &=3D ~(GEN3_EQ_CONTROL_OFF_FB_MODE |
> > +              GEN3_EQ_CONTROL_OFF_PSET_REQ_VEC);
> > +     val |=3D FIELD_PREP(GEN3_EQ_CONTROL_OFF_FB_MODE, 1) |
> > +            FIELD_PREP(GEN3_EQ_CONTROL_OFF_PSET_REQ_VEC, 0x84);
>
> FIELD_MODIFY()?

FIELD_PREP() allows  adding multiple fields changes in a single access
instead of having one access per field with FIELD_MODIFY

>
> > +     dw_pcie_dbi_ro_wr_en(pci);
> > +     dw_pcie_writel_dbi(pci, GEN3_EQ_CONTROL_OFF, val);
> > +     dw_pcie_dbi_ro_wr_dis(pci);
> > +}
> > +
> > +static void s32g_pcie_reset_mstr_ace(struct dw_pcie *pci, u64 ddr_base=
_addr)
>
> What does _ace stands for?

AMBA AXI Coherency Extensions (ACE)

>
> > +{
> > +     u32 ddr_base_low =3D lower_32_bits(ddr_base_addr);
> > +     u32 ddr_base_high =3D upper_32_bits(ddr_base_addr);
> > +
> > +     dw_pcie_dbi_ro_wr_en(pci);
> > +     dw_pcie_writel_dbi(pci, PORT_LOGIC_COHERENCY_CONTROL_3, 0x0);
> > +
> > +     /*
> > +      * Transactions to peripheral targets should be non-coherent,
>
> What is exactly meant by 'Transactions to peripheral targets'? Is it the =
MMIO
> access to peripherals? If so, all MMIO memory is marked as non-cacheable =
by
> default.

From the ref manual of s32g :
Ncore is a cache-coherent interconnect module. It enables the
integration of heterogeneous coherent agents and non-coherent
agents in a chip. It processes transactions with coherent access
semantics from various fully-coherent and IO-coherent masters,
targeting shared resources.

>
> > +      * or Ncore might drop them.
>
> What is 'Ncore'?
>
> > Define the start of DDR as seen by Linux
> > +      * as the boundary between "memory" and "peripherals", with perip=
herals
> > +      * being below this boundary, and memory addresses being above it=
.
> > +      * One example where this is needed are PCIe MSIs, which use NoSn=
oop=3D0
> > +      * and might end up routed to Ncore.
> > +      */
> > +     dw_pcie_writel_dbi(pci, PORT_LOGIC_COHERENCY_CONTROL_1,
> > +                        (ddr_base_low & CC_1_MEMTYPE_BOUNDARY_MASK) |
> > +                        (CC_1_MEMTYPE_LOWER_PERIPH & CC_1_MEMTYPE_VALU=
E));
> > +     dw_pcie_writel_dbi(pci, PORT_LOGIC_COHERENCY_CONTROL_2, ddr_base_=
high);
> > +     dw_pcie_dbi_ro_wr_dis(pci);
> > +}
> > +
> > +static int init_pcie_controller(struct s32g_pcie *s32g_pp)
> > +{
> > +     struct dw_pcie *pci =3D &s32g_pp->pci;
> > +     u8 offset =3D dw_pcie_find_capability(pci, PCI_CAP_ID_EXP);
> > +     u32 val;
> > +
> > +     /* Set RP mode */
> > +     val =3D s32g_pcie_readl_ctrl(s32g_pp, PE0_GEN_CTRL_1);
> > +     val &=3D ~SS_DEVICE_TYPE_MASK;
> > +     val |=3D SS_DEVICE_TYPE(PCI_EXP_TYPE_ROOT_PORT);
> > +
> > +     /* Use default CRNS */
> > +     val &=3D ~SRIS_MODE_EN;
> > +
> > +     s32g_pcie_writel_ctrl(s32g_pp, PE0_GEN_CTRL_1, val);
> > +
> > +     /* Disable phase 2,3 equalization */
> > +     disable_equalization(pci);
> > +
> > +     /*
> > +      * Make sure we use the coherency defaults (just in case the sett=
ings
> > +      * have been changed from their reset values)
> > +      */
> > +     s32g_pcie_reset_mstr_ace(pci, s32g_pp->coherency_base);
>
> Does this setting depend on the 'dma-coherent' DT property?
>
> > +
> > +     val =3D dw_pcie_readl_dbi(pci, PCIE_PORT_FORCE);
> > +     val |=3D PORT_FORCE_DO_DESKEW_FOR_SRIS;
>
> Add a newline to make it clear that RW mode is getting enabled.

Okay

>
> > +     dw_pcie_dbi_ro_wr_en(pci);
> > +     dw_pcie_writel_dbi(pci, PCIE_PORT_FORCE, val);
> > +
> > +     /*
> > +      * Set max payload supported, 256 bytes and
> > +      * relaxed ordering.
> > +      */
> > +     val =3D dw_pcie_readl_dbi(pci, offset + PCI_EXP_DEVCTL);
> > +     val &=3D ~(PCI_EXP_DEVCTL_RELAX_EN |
> > +              PCI_EXP_DEVCTL_PAYLOAD |
> > +              PCI_EXP_DEVCTL_READRQ);
> > +     val |=3D PCI_EXP_DEVCTL_RELAX_EN |
> > +            PCI_EXP_DEVCTL_PAYLOAD_256B |
> > +            PCI_EXP_DEVCTL_READRQ_256B;
> > +     dw_pcie_writel_dbi(pci, offset + PCI_EXP_DEVCTL, val);
> > +
> > +     /*
> > +      * Enable the IO space, Memory space, Bus master,
> > +      * Parity error, Serr and disable INTx generation
> > +      */
> > +     dw_pcie_writel_dbi(pci, PCI_COMMAND,
> > +                        PCI_COMMAND_SERR | PCI_COMMAND_PARITY |
> > +                        PCI_COMMAND_INTX_DISABLE | PCI_COMMAND_IO |
> > +                        PCI_COMMAND_MEMORY | PCI_COMMAND_MASTER);
>
> These will be overwritten by dw_pcie_host_init()->dw_pcie_setup_rc().

ok, will remove

>
> > +
> > +     /* Enable errors */
> > +     val =3D dw_pcie_readl_dbi(pci, offset + PCI_EXP_DEVCTL);
> > +     val |=3D PCI_EXP_DEVCTL_CERE |
> > +            PCI_EXP_DEVCTL_NFERE |
> > +            PCI_EXP_DEVCTL_FERE |
> > +            PCI_EXP_DEVCTL_URRE;
> > +     dw_pcie_writel_dbi(pci, offset + PCI_EXP_DEVCTL, val);
> > +
> > +     val =3D dw_pcie_readl_dbi(pci, GEN3_RELATED_OFF);
> > +     val |=3D GEN3_RELATED_OFF_EQ_PHASE_2_3;
> > +     dw_pcie_writel_dbi(pci, GEN3_RELATED_OFF, val);
> > +
> > +     /* Disable writing dbi registers */
>
> Remove the comment.

okay

>
> > +     dw_pcie_dbi_ro_wr_dis(pci);
> > +
> > +     return 0;
> > +}
> > +
> > +static int init_pcie_phy(struct s32g_pcie *s32g_pp)
> > +{
> > +     struct dw_pcie *pci =3D &s32g_pp->pci;
> > +     struct device *dev =3D pci->dev;
> > +     int ret;
> > +
> > +     ret =3D phy_init(s32g_pp->phy);
> > +     if (ret) {
> > +             dev_err(dev, "Failed to init serdes PHY\n");
> > +             return ret;
> > +     }
> > +
> > +     ret =3D phy_set_mode_ext(s32g_pp->phy, PHY_MODE_PCIE, 0);
>
> Don't you need to set submode to PHY_MODE_PCIE_RC and do relevant configu=
ration
> in the PHY driver?

The phy doesn't care about RC/EP

>
> > +     if (ret) {
> > +             dev_err(dev, "Failed to set mode on serdes PHY\n");
> > +             goto err_phy_exit;
> > +     }
> > +
> > +     ret =3D phy_power_on(s32g_pp->phy);
> > +     if (ret) {
> > +             dev_err(dev, "Failed to power on serdes PHY\n");
> > +             goto err_phy_exit;
> > +     }
> > +
> > +     return 0;
> > +
> > +err_phy_exit:
> > +     phy_exit(s32g_pp->phy);
> > +     return ret;
> > +}
> > +
> > +static int deinit_pcie_phy(struct s32g_pcie *s32g_pp)
> > +{
> > +     struct dw_pcie *pci =3D &s32g_pp->pci;
> > +     struct device *dev =3D pci->dev;
> > +     int ret;
> > +
> > +     ret =3D phy_power_off(s32g_pp->phy);
> > +     if (ret) {
> > +             dev_err(dev, "Failed to power off serdes PHY\n");
> > +             return ret;
> > +     }
> > +
> > +     ret =3D phy_exit(s32g_pp->phy);
> > +     if (ret) {
> > +             dev_err(dev, "Failed to exit serdes PHY\n");
> > +             return ret;
> > +     }
> > +
> > +     return 0;
> > +}
> > +
> > +static struct pci_bus *s32g_get_child_downstream_bus(struct pci_bus *b=
us)
>
> s32g_get_root_port_bus()

Ok

>
> > +{
> > +     struct pci_bus *child, *root_bus =3D NULL;
> > +
> > +     list_for_each_entry(child, &bus->children, node) {
> > +             if (child->parent =3D=3D bus) {
> > +                     root_bus =3D child;
> > +                     break;
> > +             }
> > +     }
> > +
> > +     if (!root_bus)
> > +             return ERR_PTR(-ENODEV);
> > +
> > +     return root_bus;
>
> This is not returning 'Root bus', which is what the passed 'bus' is. This
> function is supposed to find the downstream bus of the Root Port where th=
e
> devices are connected (assuming there is only one Root Port per controlle=
r).
>
> So name it as 'root_port_bus'.

Ok

>
> > +}
> > +
> > +static void s32g_pcie_downstream_dev_to_D0(struct s32g_pcie *s32g_pp)
> > +{
> > +     struct dw_pcie *pci =3D &s32g_pp->pci;
> > +     struct dw_pcie_rp *pp =3D &pci->pp;
> > +     struct pci_bus *root_bus =3D NULL;
> > +     struct pci_dev *pdev;
> > +
> > +     /* Check if we did manage to initialize the host */
> > +     if (!pp->bridge || !pp->bridge->bus)
> > +             return;
> > +
> > +     /*
> > +      * link doesn't go into L2 state with some of the Endpoints
> > +      * if they are not in D0 state. So, we need to make sure that
> > +      * immediate downstream devices are in D0 state before sending
> > +      * PME_TurnOff to put link into L2 state.
> > +      */
> > +
> > +     root_bus =3D s32g_get_child_downstream_bus(pp->bridge->bus);
>
> Same comment as above.
>
> > +     if (IS_ERR(root_bus)) {
> > +             dev_err(pci->dev, "Failed to find downstream devices\n");
>
> 'Failed to find the downstream bus of Root Port */

Ok

>
> > +             return;
> > +     }
> > +
> > +     list_for_each_entry(pdev, &root_bus->devices, bus_list) {
> > +             if (PCI_SLOT(pdev->devfn) =3D=3D 0) {
> > +                     if (pci_set_power_state(pdev, PCI_D0))
> > +                             dev_err(pci->dev,
> > +                                     "Failed to transition %s to D0 st=
ate\n",
> > +                                     dev_name(&pdev->dev));
> > +             }
> > +     }
> > +}
> > +
> > +static u64 s32g_get_coherency_boundary(struct device *dev)
> > +{
> > +     struct device_node *np;
> > +     struct resource res;
> > +
> > +     np =3D of_find_node_by_type(NULL, "memory");
> > +
> > +     if (of_address_to_resource(np, 0, &res)) {
> > +             dev_warn(dev, "Fail to get coherency boundary\n");
> > +             res.start =3D 0;
> > +     }
> > +
> > +     of_node_put(np);
> > +
> > +     return res.start;
> > +}
> > +
> > +static int s32g_pcie_get_resources(struct platform_device *pdev,
> > +                                struct s32g_pcie *s32g_pp)
> > +{
> > +     struct device *dev =3D &pdev->dev;
> > +     struct dw_pcie *pci =3D &s32g_pp->pci;
> > +     struct phy *phy;
> > +
> > +     pci->dev =3D dev;
> > +     pci->ops =3D &s32g_pcie_ops;
> > +
> > +     platform_set_drvdata(pdev, s32g_pp);
> > +
> > +     phy =3D devm_phy_get(dev, NULL);
> > +     if (IS_ERR(phy))
> > +             return dev_err_probe(dev, PTR_ERR(phy),
> > +                             "Failed to get serdes PHY\n");
> > +     s32g_pp->phy =3D phy;
> > +
> > +     pci->dbi_base =3D devm_platform_ioremap_resource_byname(pdev, "db=
i");
> > +     if (IS_ERR(pci->dbi_base))
> > +             return PTR_ERR(pci->dbi_base);
> > +
> > +     s32g_pp->ctrl_base =3D devm_platform_ioremap_resource_byname(pdev=
, "ctrl");
> > +     if (IS_ERR(s32g_pp->ctrl_base))
> > +             return PTR_ERR(s32g_pp->ctrl_base);
> > +
> > +     s32g_pp->coherency_base =3D s32g_get_coherency_boundary(dev);
> > +
> > +     return 0;
> > +}
> > +
> > +static int s32g_pcie_init(struct device *dev,
> > +                       struct s32g_pcie *s32g_pp)
> > +{
> > +     int ret;
> > +
> > +     s32g_pcie_disable_ltssm(s32g_pp);
> > +
> > +     ret =3D init_pcie_phy(s32g_pp);
> > +     if (ret)
> > +             return ret;
> > +
> > +     ret =3D init_pcie_controller(s32g_pp);
> > +     if (ret)
> > +             goto err_deinit_phy;
> > +
> > +     return 0;
> > +
> > +err_deinit_phy:
> > +     deinit_pcie_phy(s32g_pp);
> > +     return ret;
> > +}
> > +
> > +static void s32g_pcie_deinit(struct s32g_pcie *s32g_pp)
> > +{
> > +     s32g_pcie_disable_ltssm(s32g_pp);
> > +     deinit_pcie_phy(s32g_pp);
> > +}
> > +
> > +static int s32g_pcie_host_init(struct device *dev,
> > +                            struct s32g_pcie *s32g_pp)
> > +{
> > +     struct dw_pcie *pci =3D &s32g_pp->pci;
> > +     struct dw_pcie_rp *pp =3D &pci->pp;
> > +     int ret;
> > +
> > +     pp->ops =3D &s32g_pcie_host_ops;
> > +
> > +     ret =3D dw_pcie_host_init(pp);
> > +     if (ret) {
> > +             dev_err(dev, "Failed to initialize host\n");
> > +             goto err_host_deinit;
> > +     }
>
> Can you just call this directly from probe()?

This will include enable hotplug features in the next step

>
> > +
> > +     return 0;
> > +
> > +err_host_deinit:
> > +     dw_pcie_host_deinit(pp);
> > +     return ret;
> > +}
> > +
> > +static int s32g_pcie_probe(struct platform_device *pdev)
> > +{
> > +     struct device *dev =3D &pdev->dev;
> > +     struct s32g_pcie *s32g_pp;
> > +     int ret;
> > +
> > +     s32g_pp =3D devm_kzalloc(dev, sizeof(*s32g_pp), GFP_KERNEL);
> > +     if (!s32g_pp)
> > +             return -ENOMEM;
> > +
> > +     ret =3D s32g_pcie_get_resources(pdev, s32g_pp);
> > +     if (ret)
> > +             return ret;
> > +
> > +     devm_pm_runtime_enable(dev);
> > +     ret =3D pm_runtime_get_sync(dev);
>
> Does this driver rely on any of its parent to enable the resources? Like
> pm-domain, clock, etc... If so, just set pm_runtime_no_callbacks() before

pm_runtime_no_callbacks() is missing.

> devm_pm_runtime_enable(). If not, then do:
>
>         pm_runtime_set_active()
>         pm_runtime_no_callbacks()
>         devm_pm_runtime_enable()
>
> > +     if (ret < 0)
> > +             goto err_pm_runtime_put;
> > +
> > +     ret =3D s32g_pcie_init(dev, s32g_pp);
> > +     if (ret)
> > +             goto err_pm_runtime_put;
> > +
> > +     ret =3D s32g_pcie_host_init(dev, s32g_pp);
> > +     if (ret)
> > +             goto err_deinit_controller;
> > +
> > +     return 0;
> > +
> > +err_deinit_controller:
> > +     s32g_pcie_deinit(s32g_pp);
> > +err_pm_runtime_put:
> > +     pm_runtime_put(dev);
> > +
> > +     return ret;
> > +}
> > +
> > +static int s32g_pcie_suspend(struct device *dev)
> > +{
> > +     struct s32g_pcie *s32g_pp =3D dev_get_drvdata(dev);
> > +     struct dw_pcie *pci =3D &s32g_pp->pci;
> > +     struct dw_pcie_rp *pp =3D &pci->pp;
> > +     struct pci_bus *bus, *root_bus;
> > +
> > +     s32g_pcie_downstream_dev_to_D0(s32g_pp);
> > +
> > +     bus =3D pp->bridge->bus;
> > +     root_bus =3D s32g_get_child_downstream_bus(bus);
> > +     if (!IS_ERR(root_bus))
> > +             pci_walk_bus(root_bus, pci_dev_set_disconnected, NULL);
> > +
> > +     pci_stop_root_bus(bus);
> > +     pci_remove_root_bus(bus);
>
> Why can't you rely on dw_pcie_host_deinit()?

I need to check but mainly because we don't do dw_pcie_host_init() during r=
esume

>
> > +
> > +     s32g_pcie_deinit(s32g_pp);
> > +
> > +     return 0;
> > +}
> > +
> > +static int s32g_pcie_resume(struct device *dev)
> > +{
> > +     struct s32g_pcie *s32g_pp =3D dev_get_drvdata(dev);
> > +     struct dw_pcie *pci =3D &s32g_pp->pci;
> > +     struct dw_pcie_rp *pp =3D &pci->pp;
> > +     int ret =3D 0;
> > +
> > +     ret =3D s32g_pcie_init(dev, s32g_pp);
> > +     if (ret < 0)
> > +             return ret;
> > +
> > +     ret =3D dw_pcie_setup_rc(pp);
> > +     if (ret) {
> > +             dev_err(dev, "Failed to resume DW RC: %d\n", ret);
> > +             goto fail_host_init;
> > +     }
> > +
> > +     ret =3D dw_pcie_start_link(pci);
> > +     if (ret) {
> > +             /*
> > +              * We do not exit with error if link up was unsuccessful
> > +              * Endpoint may not be connected.
> > +              */
> > +             if (dw_pcie_wait_for_link(pci))
> > +                     dev_warn(pci->dev,
> > +                              "Link Up failed, Endpoint may not be con=
nected\n");
> > +
> > +             if (!phy_validate(s32g_pp->phy, PHY_MODE_PCIE, 0, NULL)) =
{
> > +                     dev_err(dev, "Failed to get link up with EP conne=
cted\n");
> > +                     goto fail_host_init;
> > +             }
> > +     }
> > +
> > +     ret =3D pci_host_probe(pp->bridge);
>
> Oh no... Do not call pci_host_probe() directly from glue drivers. Use
> dw_pcie_host_init() to do so. This should simplify suspend and resume fun=
ctions.

dw_pcie_host_init() is doing much more than just init the controller
as it gets resources which we haven't released during suspend.

What we need from dw_pcie_host_init () is the last part :

dw_pcie_setup_rc(pp);

dw_pcie_start_link(pci);

dw_pcie_wait_for_link(pci);

pci_host_probe(pp->bridge);


>
> > +     if (ret)
> > +             goto fail_host_init;
> > +
> > +     return 0;
> > +
> > +fail_host_init:
> > +     s32g_pcie_deinit(s32g_pp);
> > +     return ret;
> > +}
> > +
> > +static const struct dev_pm_ops s32g_pcie_pm_ops =3D {
> > +     SYSTEM_SLEEP_PM_OPS(s32g_pcie_suspend,
> > +                         s32g_pcie_resume)
> > +};
> > +
> > +static const struct of_device_id s32g_pcie_of_match[] =3D {
> > +     { .compatible =3D "nxp,s32g2-pcie"},
> > +     { /* sentinel */ },
> > +};
> > +MODULE_DEVICE_TABLE(of, s32g_pcie_of_match);
> > +
> > +static struct platform_driver s32g_pcie_driver =3D {
> > +     .driver =3D {
> > +             .name   =3D "s32g-pcie",
> > +             .of_match_table =3D s32g_pcie_of_match,
> > +             .suppress_bind_attrs =3D true,
> > +             .pm =3D pm_sleep_ptr(&s32g_pcie_pm_ops),
>
> Use '.probe_type =3D PROBE_PREFER_ASYNCHRONOUS' to speedup the enumeratio=
n and
> save boot time.

okay

>
> > +     },
> > +     .probe =3D s32g_pcie_probe,
> > +};
> > +
> > +module_platform_driver(s32g_pcie_driver);
>
> builtin_platform_driver()

In fact I forgot the tri state for kconfig




>
> - Mani
>
> --
> =E0=AE=AE=E0=AE=A3=E0=AE=BF=E0=AE=B5=E0=AE=A3=E0=AF=8D=E0=AE=A3=E0=AE=A9=
=E0=AF=8D =E0=AE=9A=E0=AE=A4=E0=AE=BE=E0=AE=9A=E0=AE=BF=E0=AE=B5=E0=AE=AE=
=E0=AF=8D

