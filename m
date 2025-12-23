Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 97953E6FE24
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 23 Dec 2025 17:54:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=UUSjr7u0rdTFyM631T16fOHf9szF9tSI12okJbnzZg0=; b=HhYybdAHOvigtiSKXrets+RuxQ
	AAkGk4QrORXstJpnuRq2uu2Ga8GkLdmjm2+XcFTU/2L8ebCyQ8Jij/njEbTCZUODre9tndE0bSORL
	xfVj7B61xc6wN4QT0gyGaLmZlMNuO3LGvQGw65TqDMjx18X6zgDEDx0AIhyVRAD9xlYxC/Bw/Xv6C
	Nn89/jNj80rxtmJkMtWKnF6MoiZVrS8g+r3gVnwvkwzBK+4NAKFntiq1Mod6GXVOXxCIgd3GhaKGz
	vkLmZKP8/x9yi5R2KOInGqvSUaZ0LULNTG/GCD1e5uguhANTUZbz25vTsW3jC8JXDFeU13Q4ujh1z
	bAtGjsjQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vY6aN-0000000Fs2x-41xu;
	Tue, 23 Dec 2025 17:54:15 +0000
Received: from mail-pf1-x42e.google.com ([2607:f8b0:4864:20::42e])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vY6aL-0000000Fs25-0NwT
	for linux-arm-kernel@lists.infradead.org;
	Tue, 23 Dec 2025 17:54:14 +0000
Received: by mail-pf1-x42e.google.com with SMTP id d2e1a72fcca58-7ade456b6abso4359954b3a.3
        for <linux-arm-kernel@lists.infradead.org>; Tue, 23 Dec 2025 09:54:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1766512452; x=1767117252; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=UUSjr7u0rdTFyM631T16fOHf9szF9tSI12okJbnzZg0=;
        b=UQUcpRkj26ChNg88htwAvKUc8iQ0gM4eEUNlULRzkACK71HMHA0HHuFMFcyiPciKpK
         27wnKj+KyGQZacoeFxLPCnhIyuBh17Nv2LQmAc5U3Xak47294zb4Ite5HeIqKOukuodO
         HNX1Srt05dv856u+BDJwreM7dbGS24h6Z8K2R43qZoDZXOCBUAxy6rHwbKNPh7k32FUo
         jj/JaYb13Sy30MaZSKcgTzYikDBZRS+tpRONXk2j/O7rd4dcNkBNcvxj1SHXWnj06KLD
         /R6nBB1LeUCIiH7Y23w5u2ovMqUN4qnitdvLGPSx0v7xCpaH2idOx+D24vWgVYvnIC7D
         eW3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766512452; x=1767117252;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=UUSjr7u0rdTFyM631T16fOHf9szF9tSI12okJbnzZg0=;
        b=hK/zyt1GBU5rf/H4OL4Q/+jpe/s+CIXDstw6U4r7+ECp6qWPJ7lVsNqylAN64D9d3L
         Z8hIh0lxelgLiEHQpTrq9NKp/CAgreUULaHjB9TpgpHuExl+PISGbg5FIVVhJZp/oQJV
         4L9DEoggRCF9RJVyPefRU5U8Zg8gv5iK7lKSTk8AIE003XPei4c4j05/nVTURjj4CqeE
         uvFwoZa1izNZKDYuzdYJ6KzHyzS/iEnKSrFxl91ZwI4pHl/WbEKDWsXeDb3Km18sa2hz
         uYOKPYfRdixtTNG60uIEyJ5iTcVsMk6Gxp2ijIV6nVuepwC+y78iobBLLmbDLdhLssfx
         +Txw==
X-Forwarded-Encrypted: i=1; AJvYcCWmSAgexzjbBCu6sS0mDzzn18kPQIuRYJaR25xT5+7gQ5oDPhRmZXtZ/V4yRjfHlLUxoU7+YzAg2j73/WKQTc+D@lists.infradead.org
X-Gm-Message-State: AOJu0YzaOIcT9LYf2GvnQ3PIQaylzn+rpGPxu4+4xu/3de+KfPIarGMT
	+FQtTYkSGHaTepd8eK2ie/yU6Blvd8i1otQUlmyjRqAF1sL5SjuqaD4Qwme+bO/T6ojRmJ0AOI/
	PPwZLQm8bxmOMkQfxX3DTRgmQvSc6MgiWDOxd90maRZd9sZP/9+8xhyouVQA=
X-Gm-Gg: AY/fxX5Or5p1tAe8sUfnGdOBubDPqOgNAx9DKCKeQsTQ6KFN1dLMvbkhiv0aKzzvp+J
	0g3qauXak0GpHF/CHUBNjorjVSJMa88vBsUCL5aSyL8LiBqKQzE+qX2u7BIRWEgNMTwlF63766K
	lCKr7wOH+dbs76QC+epI/fJLUp1dcR+XjPm8+YPc7h8edRNkJKc2qnwx8gthXZeeQNaZfT1j4r+
	nuoMLe58w3FG2MX+RZed4g11ZlRTt0Q0C3yILmwT9401SfdS5LumKW0a/f9FYOp8vaHFcWhd3wn
	jMJQFKjh2nPcHewvaS8VMlQHhmE=
X-Google-Smtp-Source: AGHT+IHUXad6erRF8YvXLu5iHhvQirmWd1KhEP4Ox4XIWY/kSzKSQZoo1NFDc/5LbKt0hxEd/swF2y/0X8zLpqSolLI=
X-Received: by 2002:a05:7022:4288:b0:11b:9386:8256 with SMTP id
 a92af1059eb24-1217230196dmr15756076c88.43.1766512451120; Tue, 23 Dec 2025
 09:54:11 -0800 (PST)
MIME-Version: 1.0
References: <20251222-phyb4-v9-0-82c0b671b070@google.com> <20251222-phyb4-v9-2-82c0b671b070@google.com>
 <aUqhbVFHczpL9qnL@vaman>
In-Reply-To: <aUqhbVFHczpL9qnL@vaman>
From: Roy Luo <royluo@google.com>
Date: Tue, 23 Dec 2025 09:53:34 -0800
X-Gm-Features: AQt7F2qnxlEsNapTtaQcb62clqXsUnCBQRYwKyx76Qz7DAtvcglpofGX9V1VrwU
Message-ID: <CA+zupgxP+_2iRYABhPM1OOJtRdkrcOvrsKH=Sxk45XwsiamzTw@mail.gmail.com>
Subject: Re: [PATCH v9 2/2] phy: Add Google Tensor SoC USB PHY driver
To: Vinod Koul <vkoul@kernel.org>
Cc: Kishon Vijay Abraham I <kishon@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Peter Griffin <peter.griffin@linaro.org>, =?UTF-8?Q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>, 
	Tudor Ambarus <tudor.ambarus@linaro.org>, Philipp Zabel <p.zabel@pengutronix.de>, 
	Neil Armstrong <neil.armstrong@linaro.org>, Badhri Jagan Sridharan <badhri@google.com>, 
	Doug Anderson <dianders@google.com>, linux-phy@lists.infradead.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, 
	Joy Chakraborty <joychakr@google.com>, Naveen Kumar <mnkumar@google.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251223_095413_170557_BC3C46BA 
X-CRM114-Status: GOOD (  37.88  )
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

On Tue, Dec 23, 2025 at 6:04=E2=80=AFAM Vinod Koul <vkoul@kernel.org> wrote=
:
>
> On 22-12-25, 21:31, Roy Luo wrote:
> > Support the USB PHY found on Google Tensor G5 (Laguna). This
> > particular USB PHY supports both high-speed and super-speed
> > operations, and is integrated with the SNPS DWC3 controller that's
> > also on the SoC. This initial patch specifically adds functionality
> > for high-speed.
> >
> > Co-developed-by: Joy Chakraborty <joychakr@google.com>
> > Signed-off-by: Joy Chakraborty <joychakr@google.com>
> > Co-developed-by: Naveen Kumar <mnkumar@google.com>
> > Signed-off-by: Naveen Kumar <mnkumar@google.com>
> > Signed-off-by: Roy Luo <royluo@google.com>
> > ---
> >  MAINTAINERS                  |   1 +
> >  drivers/phy/Kconfig          |  10 ++
> >  drivers/phy/Makefile         |   1 +
> >  drivers/phy/phy-google-usb.c | 295 +++++++++++++++++++++++++++++++++++=
++++++++
> >  4 files changed, 307 insertions(+)
> >
> > diff --git a/MAINTAINERS b/MAINTAINERS
> > index 8a2e94be2f5c5e6e7315bb7bec385798dbd52493..afd0d7484ffe5fa652798c9=
b3c86ae6d83302382 100644
> > --- a/MAINTAINERS
> > +++ b/MAINTAINERS
> > @@ -10725,6 +10725,7 @@ F:    Documentation/devicetree/bindings/phy/goo=
gle,lga-usb-phy.yaml
> >  F:   Documentation/devicetree/bindings/soc/google/google,gs101-pmu-int=
r-gen.yaml
> >  F:   arch/arm64/boot/dts/exynos/google/
> >  F:   drivers/clk/samsung/clk-gs101.c
> > +F:   drivers/phy/phy-google-usb.c
> >  F:   drivers/soc/samsung/gs101-pmu.c
> >  F:   drivers/phy/samsung/phy-gs101-ufs.c
> >  F:   include/dt-bindings/clock/google,gs101*
> > diff --git a/drivers/phy/Kconfig b/drivers/phy/Kconfig
> > index 678dd0452f0aa0597773433f04d2a9ba77474d2a..5a642e04caeeea9d40ac583=
767622cff2ef5e80c 100644
> > --- a/drivers/phy/Kconfig
> > +++ b/drivers/phy/Kconfig
> > @@ -101,6 +101,16 @@ config PHY_NXP_PTN3222
> >         schemes. It supports all three USB 2.0 data rates: Low Speed, F=
ull
> >         Speed and High Speed.
> >
> > +config PHY_GOOGLE_USB
>
> This does not seem sorted!
>
> > +     tristate "Google Tensor SoC USB PHY driver"
> > +     select GENERIC_PHY
> > +     help
> > +       Enable support for the USB PHY on Google Tensor SoCs, starting =
with
> > +       the G5 generation (Laguna). This driver provides the PHY interf=
aces
> > +       to interact with the SNPS eUSB2 and USB 3.2/DisplayPort Combo P=
HY,
> > +       both of which are integrated with the DWC3 USB DRD controller.
> > +       This driver currently supports USB high-speed.
> > +
> >  source "drivers/phy/allwinner/Kconfig"
> >  source "drivers/phy/amlogic/Kconfig"
> >  source "drivers/phy/broadcom/Kconfig"
> > diff --git a/drivers/phy/Makefile b/drivers/phy/Makefile
> > index bfb27fb5a494283d7fd05dd670ebd1b12df8b1a1..aeaaaf988554a24bb572d8b=
34b54638a6a3aed73 100644
> > --- a/drivers/phy/Makefile
> > +++ b/drivers/phy/Makefile
> > @@ -13,6 +13,7 @@ obj-$(CONFIG_PHY_SNPS_EUSB2)                +=3D phy-=
snps-eusb2.o
> >  obj-$(CONFIG_USB_LGM_PHY)            +=3D phy-lgm-usb.o
> >  obj-$(CONFIG_PHY_AIROHA_PCIE)                +=3D phy-airoha-pcie.o
> >  obj-$(CONFIG_PHY_NXP_PTN3222)                +=3D phy-nxp-ptn3222.o
> > +obj-$(CONFIG_PHY_GOOGLE_USB)         +=3D phy-google-usb.o
>
> and here!
>
> >  obj-y                                        +=3D allwinner/   \
> >                                          amlogic/     \
> >                                          broadcom/    \
> > diff --git a/drivers/phy/phy-google-usb.c b/drivers/phy/phy-google-usb.=
c
> > new file mode 100644
> > index 0000000000000000000000000000000000000000..97e345fdab9b3679e7a76f6=
957ae3814ef3420e8
> > --- /dev/null
> > +++ b/drivers/phy/phy-google-usb.c
> > @@ -0,0 +1,295 @@
> > +// SPDX-License-Identifier: GPL-2.0
> > +/*
> > + * phy-google-usb.c - Google USB PHY driver
> > + *
> > + * Copyright (C) 2025, Google LLC
> > + */
> > +
> > +#include <linux/bitfield.h>
> > +#include <linux/cleanup.h>
> > +#include <linux/clk.h>
> > +#include <linux/io.h>
> > +#include <linux/kernel.h>
> > +#include <linux/mfd/syscon.h>
> > +#include <linux/module.h>
> > +#include <linux/mutex.h>
> > +#include <linux/of.h>
> > +#include <linux/phy/phy.h>
> > +#include <linux/platform_device.h>
> > +#include <linux/regmap.h>
> > +#include <linux/reset.h>
> > +#include <linux/usb/typec_mux.h>
> > +
> > +#define USBCS_USB2PHY_CFG19_OFFSET 0x0
> > +#define USBCS_USB2PHY_CFG19_PHY_CFG_PLL_FB_DIV GENMASK(19, 8)
> > +
> > +#define USBCS_USB2PHY_CFG21_OFFSET 0x8
> > +#define USBCS_USB2PHY_CFG21_PHY_ENABLE BIT(12)
> > +#define USBCS_USB2PHY_CFG21_REF_FREQ_SEL GENMASK(15, 13)
> > +#define USBCS_USB2PHY_CFG21_PHY_TX_DIG_BYPASS_SEL BIT(19)
> > +
> > +#define USBCS_PHY_CFG1_OFFSET 0x28
> > +#define USBCS_PHY_CFG1_SYS_VBUSVALID BIT(17)
> > +
> > +enum google_usb_phy_id {
> > +     GOOGLE_USB2_PHY,
> > +     GOOGLE_USB_PHY_NUM,
> > +};
> > +
> > +struct google_usb_phy_instance {
> > +     int index;
>
> maybe use unsigned?
>
> > +     struct phy *phy;
> > +     int num_clks;
>
> here too?
>
> > +     struct clk_bulk_data *clks;
>  +      int num_rsts;
>
> and here?

Ack to all the comments above, will fix them in the next version.

>
> > +     struct reset_control_bulk_data *rsts;
> > +};
> > +
> > +struct google_usb_phy {
> > +     struct device *dev;
> > +     struct regmap *usb_cfg_regmap;
> > +     unsigned int usb2_cfg_offset;
> > +     void __iomem *usbdp_top_base;
> > +     struct google_usb_phy_instance insts[GOOGLE_USB_PHY_NUM];
>
> so you have an array for one phy?

While the current patch only supports usb2, I used an array
to simplify future support for usb3 and DP. I understand this
might seem like over-engineering for now, and we could
certainly wait to implement the array until the second phy
support is added. I=E2=80=99m happy to move away from array if
you=E2=80=99d prefer a simpler approach for this iteration.

>
> > +     /*
> > +      * Protect phy registers from concurrent access, specifically via
> > +      * google_usb_set_orientation callback.
> > +      */
> > +     struct mutex phy_mutex;
> > +     struct typec_switch_dev *sw;
> > +     enum typec_orientation orientation;
> > +};
> > +
> > +static inline struct google_usb_phy *to_google_usb_phy(struct google_u=
sb_phy_instance *inst)
> > +{
> > +     return container_of(inst, struct google_usb_phy, insts[inst->inde=
x]);
> > +}
> > +
> > +static void set_vbus_valid(struct google_usb_phy *gphy)
> > +{
> > +     u32 reg;
> > +
> > +     if (gphy->orientation =3D=3D TYPEC_ORIENTATION_NONE) {
> > +             reg =3D readl(gphy->usbdp_top_base + USBCS_PHY_CFG1_OFFSE=
T);
> > +             reg &=3D ~USBCS_PHY_CFG1_SYS_VBUSVALID;
> > +             writel(reg, gphy->usbdp_top_base + USBCS_PHY_CFG1_OFFSET)=
;
> > +     } else {
> > +             reg =3D readl(gphy->usbdp_top_base + USBCS_PHY_CFG1_OFFSE=
T);
> > +             reg |=3D USBCS_PHY_CFG1_SYS_VBUSVALID;
> > +             writel(reg, gphy->usbdp_top_base + USBCS_PHY_CFG1_OFFSET)=
;
> > +     }
> > +}
> > +
> > +static int google_usb_set_orientation(struct typec_switch_dev *sw,
> > +                                   enum typec_orientation orientation)
> > +{
> > +     struct google_usb_phy *gphy =3D typec_switch_get_drvdata(sw);
> > +
> > +     dev_dbg(gphy->dev, "set orientation %d\n", orientation);
> > +
> > +     gphy->orientation =3D orientation;
> > +
> > +     if (pm_runtime_suspended(gphy->dev))
> > +             return 0;
> > +
> > +     guard(mutex)(&gphy->phy_mutex);
> > +
> > +     set_vbus_valid(gphy);
> > +
> > +     return 0;
> > +}
> > +
> > +static int google_usb2_phy_init(struct phy *_phy)
> > +{
> > +     struct google_usb_phy_instance *inst =3D phy_get_drvdata(_phy);
> > +     struct google_usb_phy *gphy =3D to_google_usb_phy(inst);
> > +     u32 reg;
> > +     int ret =3D 0;
>
> superfluous init

Ack, will fix it in the next version.

>
> > +
> > +     dev_dbg(gphy->dev, "initializing usb2 phy\n");
> > +
> > +     guard(mutex)(&gphy->phy_mutex);
> > +
> > +     regmap_read(gphy->usb_cfg_regmap, gphy->usb2_cfg_offset + USBCS_U=
SB2PHY_CFG21_OFFSET, &reg);
> > +     reg &=3D ~USBCS_USB2PHY_CFG21_PHY_TX_DIG_BYPASS_SEL;
> > +     reg &=3D ~USBCS_USB2PHY_CFG21_REF_FREQ_SEL;
> > +     reg |=3D FIELD_PREP(USBCS_USB2PHY_CFG21_REF_FREQ_SEL, 0);
> > +     regmap_write(gphy->usb_cfg_regmap, gphy->usb2_cfg_offset + USBCS_=
USB2PHY_CFG21_OFFSET, reg);
> > +
> > +     regmap_read(gphy->usb_cfg_regmap, gphy->usb2_cfg_offset + USBCS_U=
SB2PHY_CFG19_OFFSET, &reg);
> > +     reg &=3D ~USBCS_USB2PHY_CFG19_PHY_CFG_PLL_FB_DIV;
> > +     reg |=3D FIELD_PREP(USBCS_USB2PHY_CFG19_PHY_CFG_PLL_FB_DIV, 368);
> > +     regmap_write(gphy->usb_cfg_regmap, gphy->usb2_cfg_offset + USBCS_=
USB2PHY_CFG19_OFFSET, reg);
> > +
> > +     set_vbus_valid(gphy);
> > +
> > +     ret =3D clk_bulk_prepare_enable(inst->num_clks, inst->clks);
> > +     if (ret)
> > +             return ret;
> > +
> > +     ret =3D reset_control_bulk_deassert(inst->num_rsts, inst->rsts);
> > +     if (ret) {
> > +             clk_bulk_disable_unprepare(inst->num_clks, inst->clks);
> > +             return ret;
> > +     }
> > +
> > +     regmap_read(gphy->usb_cfg_regmap, gphy->usb2_cfg_offset + USBCS_U=
SB2PHY_CFG21_OFFSET, &reg);
> > +     reg |=3D USBCS_USB2PHY_CFG21_PHY_ENABLE;
> > +     regmap_write(gphy->usb_cfg_regmap, gphy->usb2_cfg_offset + USBCS_=
USB2PHY_CFG21_OFFSET, reg);
> > +
> > +     return ret;
>
> would it not be return 0 here? can it be any other value

No it cannot be any other value, will change it to "return 0".

>
> > +}
> > +
> > +static int google_usb2_phy_exit(struct phy *_phy)
> > +{
> > +     struct google_usb_phy_instance *inst =3D phy_get_drvdata(_phy);
> > +     struct google_usb_phy *gphy =3D to_google_usb_phy(inst);
> > +     u32 reg;
> > +
> > +     dev_dbg(gphy->dev, "exiting usb2 phy\n");
> > +
> > +     guard(mutex)(&gphy->phy_mutex);
> > +
> > +     regmap_read(gphy->usb_cfg_regmap, gphy->usb2_cfg_offset + USBCS_U=
SB2PHY_CFG21_OFFSET, &reg);
> > +     reg &=3D ~USBCS_USB2PHY_CFG21_PHY_ENABLE;
> > +     regmap_write(gphy->usb_cfg_regmap, gphy->usb2_cfg_offset + USBCS_=
USB2PHY_CFG21_OFFSET, reg);
> > +
> > +     reset_control_bulk_assert(inst->num_rsts, inst->rsts);
> > +     clk_bulk_disable_unprepare(inst->num_clks, inst->clks);
> > +
> > +     return 0;
> > +}
> > +
> > +static const struct phy_ops google_usb2_phy_ops =3D {
> > +     .init           =3D google_usb2_phy_init,
> > +     .exit           =3D google_usb2_phy_exit,
> > +};
>
> Only two ops? I would expect more... No power_on/off or set_mode?
>
> --
> ~Vinod

No, configuring usb2 phy is pretty straightforward. The hardware
does not distinguish between "initialized" and "powered on" states,
it also does not distinguish phy mode.

Thanks,
Roy

