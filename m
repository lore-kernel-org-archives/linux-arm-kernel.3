Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 78553CCD1A5
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 20 Oct 2025 19:56:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=rGDb4j5YD7gzcoOdyZ8DfUuxVA6AmwZO6D17kiLjgUk=; b=y4bR4QFBdbv20JDIj0mOh6nOCZ
	8IiN/+GzjhoYyYicTUMTzNR/U0yPrKmLJakx1KGQyCNrM/3X/2LH1DQBvsPgKbzL4Us6uxm5XbfLO
	aV/HCtKM0DfQ000AekaWp0m/Udgyc7whDgUsudknLHf0GBDf3ogJmlCeqw8Eco3m99sXBaS2mvvrY
	fc3ccIeMwwU3PQ9T31xXfnsAzG6+ASS5Cp8nVZPiSOkWSk5kAosZnNeCsTWcTUaL7euBspYt1AI7K
	sFKSO6f/uq7tN/KPbWAvF8KkzrUbBz6LsbjikQgNgJkvC2ZdhAWbqDVNPf0l4WrwEeaN6QyKBC2XR
	zk5jASOg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vAvzN-0000000Eq6Q-1N0u;
	Mon, 20 Oct 2025 19:56:17 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vAvzM-0000000Eq62-0dmI
	for linux-arm-kernel@bombadil.infradead.org;
	Mon, 20 Oct 2025 19:56:16 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:MIME-Version:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=rGDb4j5YD7gzcoOdyZ8DfUuxVA6AmwZO6D17kiLjgUk=; b=O1cxrV40oO3NufFirXdJMJWM5V
	7XVIRB4EBwK5NEsZhFCFcCChPbOJbCZ6gwVp+qlAgP7463rgZdJL/O+W10Zez06iSmW6upbCAH1w5
	6MDX5I9a5CdcxFwGqYAF4/dnChTldxrohvpVdvZRCnJGezUQgAsW4Dcm00ePIWA8LWnWQf8DI8cSY
	sIuCnE0MCUofwc13C9oYXao+BiMI7Mi/DVcs5QrHvEBlmn01EjoDKZVkG6i/LAG4e+G0MdQK6/yIR
	OjJlEd5M1CE9H3YM9oqcFgzs2TO9I+Y+9ntJxKxtwmqyj/U88O7TXpYYtO+hZH/q51EmpFRzvYef+
	kz39MssA==;
Received: from mail-pl1-x629.google.com ([2607:f8b0:4864:20::629])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vAv7Q-00000000BY4-1rkF
	for linux-arm-kernel@lists.infradead.org;
	Mon, 20 Oct 2025 19:00:42 +0000
Received: by mail-pl1-x629.google.com with SMTP id d9443c01a7336-269af38418aso57419775ad.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 20 Oct 2025 12:55:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1760990155; x=1761594955; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rGDb4j5YD7gzcoOdyZ8DfUuxVA6AmwZO6D17kiLjgUk=;
        b=Ki1iKWBqVbMIPfjQr/3xMEU6Gv/Ak7xI4oGYqTQ/7sUTDpT8CS3sIHHkg8aq2oaB12
         HLnAX+f3Z/sfDn/2rTF9FKaOwe0dugzB0yuNgHG9qB0qOnfxbNsba0746JgOweYk+N7T
         a9qE0EdiZ/XoO4t/+kOXafPW6N9KVO46jawE2HvWnxyEkAtu/zRUsPs4Uk2mvl/PCQSI
         qt5KWF1zsQfSrUO1w2gL8yHTxAQctgM/vHUeWQnskqRTe2l3cfGbkmFwev3PAXx/UQ4L
         HVjMRSx56iw1YfWMDuLSFiXuR/dDKvNmr/Nlp26upinRemd5au/CkCXqDbppBabxlD6t
         4Xvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760990155; x=1761594955;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=rGDb4j5YD7gzcoOdyZ8DfUuxVA6AmwZO6D17kiLjgUk=;
        b=jSPnPbyrhuwiPVRxMjoSAK18L8LUJHuoBTOhT/NR3QRxzeYI2qDR3YkrSlur7qEiIU
         /yKFdZJCx/QBKYkni0Dsnlo7+OZXXvJ1KOycC7P7KW4xXPe6W7PX0B8PdcKnOHPRPbFw
         fZCdQFyxY1wZ60BO0XvO/tQadx4iSIdl7MCBx8md6d/6QLfdLVKF9gjKO8wceuu/8Wie
         tSSH9iowepMH56G3Fr4IO1XM/uMENJ+FnC20NrfbcpCEkyxLVydX5wNx7FmzPSrQeKXC
         0NQwHxlgZPIBzieM0K8W9afajRYRBrQmbcxI09XIJ/GyVnwmJfp7wsyDM1tuC+ECq0f0
         LwQw==
X-Forwarded-Encrypted: i=1; AJvYcCVbT81Zi4UMDgCYBzRakH1hHeB2WCB5loB8zGzS6589vxU6/seGArrlbaThfnnnKpAAuxLcoXvxMruccanRpJ44@lists.infradead.org
X-Gm-Message-State: AOJu0YyAicrQoErWOl/N5NmHsRdUFxMfViS0b6mvABJ67QXXzhKHkH/x
	WrZp5Cx7d0ib8Oicds7g55mEoZFc81n3D722VPICc6rougLPfyJ8t40rS0gEF4u1s4rpRhrDPR7
	n/8gZdWGViUh/UWvQy4/Xx9uEQB6Kk12JptE4IQZG
X-Gm-Gg: ASbGncsvhOhAbn1CwBUH0aGc4vsgd8mGXFTpw+HJL87Q8oaiWBqB71laqWOcJnqYnft
	O1d8Wot4cICzoEX2VOj27+0plPV4lkhRgggnUWNhln6TfuH9JE4EG7MBMrz5F++dg00GPI3pDxz
	Nt+DBiGJ4uYaLmaEonyX8YiS0iTlspb7jiXmloz5e8NCky0HqAYMNwH/okpgLSrJOwx8aikvokz
	sdzZ/11GcQpmyvp2GzzvyqZ8exZgDR61IR9ayL/j5A/napLhBRQ/kj5LGt9rdIyp5iV2tqYeSLB
	20Iz0C355V0VOKWNuQ==
X-Google-Smtp-Source: AGHT+IFy7RPLrTjaJAmRvl/up+5yT0Xi35K2QAP5mH7buXJTH15rh6ZR8w+Jx06TkvEyKKVVV9FaRQNwaH2E98irt9s=
X-Received: by 2002:a17:903:1746:b0:24e:95bb:88b1 with SMTP id
 d9443c01a7336-290caf8510cmr156895345ad.34.1760990154949; Mon, 20 Oct 2025
 12:55:54 -0700 (PDT)
MIME-Version: 1.0
References: <20251017235159.2417576-1-royluo@google.com> <20251017235159.2417576-3-royluo@google.com>
 <37daba64-5233-4573-95de-38612c2358f2@gmail.com>
In-Reply-To: <37daba64-5233-4573-95de-38612c2358f2@gmail.com>
From: Roy Luo <royluo@google.com>
Date: Mon, 20 Oct 2025 12:55:18 -0700
X-Gm-Features: AS18NWCgbE77LSFDkUG8Ht5NtPdNWshuYiiufgQjSFfeg5-XcBLfdhlCz7phu9U
Message-ID: <CA+zupgwbmKt8BhHEM-76CLLH_dE_vmyHvKwqpC2WzwED9irEVw@mail.gmail.com>
Subject: Re: [PATCH v4 2/2] phy: Add Google Tensor SoC USB PHY driver
To: Ivaylo Ivanov <ivo.ivanov.ivanov1@gmail.com>
Cc: Vinod Koul <vkoul@kernel.org>, Kishon Vijay Abraham I <kishon@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Philipp Zabel <p.zabel@pengutronix.de>, Peter Griffin <peter.griffin@linaro.org>, 
	=?UTF-8?Q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>, 
	Tudor Ambarus <tudor.ambarus@linaro.org>, Joy Chakraborty <joychakr@google.com>, 
	Naveen Kumar <mnkumar@google.com>, Badhri Jagan Sridharan <badhri@google.com>, linux-phy@lists.infradead.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251020_200039_288299_E988F23A 
X-CRM114-Status: GOOD (  44.25  )
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

On Sat, Oct 18, 2025 at 1:13=E2=80=AFAM Ivaylo Ivanov
<ivo.ivanov.ivanov1@gmail.com> wrote:
>
> On 10/18/25 02:51, Roy Luo wrote:
> > Support the USB PHY found on Google Tensor G5. This particular USB PHY
> > supports both high-speed and super-speed operations, and is integrated
> > with the SNPS DWC3 controller that's also on the SoC.
> > This initial patch specifically adds functionality for high-speed.
> >
> > Co-developed-by: Joy Chakraborty <joychakr@google.com>
> > Signed-off-by: Joy Chakraborty <joychakr@google.com>
> > Co-developed-by: Naveen Kumar <mnkumar@google.com>
> > Signed-off-by: Naveen Kumar <mnkumar@google.com>
> > Signed-off-by: Roy Luo <royluo@google.com>
> > ---
> >  drivers/phy/Kconfig          |  13 ++
> >  drivers/phy/Makefile         |   1 +
> >  drivers/phy/phy-google-usb.c | 271 +++++++++++++++++++++++++++++++++++
> >  3 files changed, 285 insertions(+)
> >  create mode 100644 drivers/phy/phy-google-usb.c
> >
> > diff --git a/drivers/phy/Kconfig b/drivers/phy/Kconfig
> > index 58c911e1b2d2..fe32d1356002 100644
> > --- a/drivers/phy/Kconfig
> > +++ b/drivers/phy/Kconfig
> > @@ -101,6 +101,19 @@ config PHY_NXP_PTN3222
> >         schemes. It supports all three USB 2.0 data rates: Low Speed, F=
ull
> >         Speed and High Speed.
> >
> > +config PHY_GOOGLE_USB
> > +     tristate "Google Tensor SoC USB PHY driver"
> > +     depends on HAS_IOMEM
> > +     depends on OF
> > +     depends on TYPEC
> > +     select GENERIC_PHY
> > +     help
> > +       Enable support for the USB PHY on Google Tensor SoCs, starting =
with
> > +       the G5 generation. This driver provides the PHY interfaces to
> > +       interact with the SNPS eUSB2 and USB 3.2/DisplayPort Combo PHY,=
 both
> > +       of which are integrated with the DWC3 USB controller.
>
> So it's more like a DRD controller, since it encapsulates multiple phys?

Yes, it's a DRD controller, I will make it clear in the next version.

>
> > +       This driver currently supports USB high-speed.
> > +
> >  source "drivers/phy/allwinner/Kconfig"
> >  source "drivers/phy/amlogic/Kconfig"
> >  source "drivers/phy/broadcom/Kconfig"
> > diff --git a/drivers/phy/Makefile b/drivers/phy/Makefile
> > index c670a8dac468..1d7a1331bd19 100644
> ...
> > +#include <linux/module.h>
> > +#include <linux/of.h>
> > +#include <linux/phy/phy.h>
> > +#include <linux/platform_device.h>
> > +#include <linux/mutex.h>
> > +#include <linux/cleanup.h>
> > +#include <linux/usb/typec_mux.h>
> > +
> > +#define USBCS_USB2PHY_CFG19_OFFSET 0x0
> > +#define USBCS_USB2PHY_CFG19_PHY_CFG_PLL_FB_DIV GENMASK(19, 8)
>
> I'd suggest implementing the eUSB support in the existing snps-eusb2
> driver for the sake of clarity. That way, you can pass it as a phandle
> to this driver and probe it when drd is probing.

If I understand it correctly, you're referring to the pattern used in
Documentation/devicetree/bindings/phy/samsung,exynos2200-eusb2-phy.yaml and
Documentation/devicetree/bindings/phy/samsung,usb3-drd-phy.yaml.
Please correct me if I'm wrong.

At first glance, this approach seems feasible. Custom logic, such
as vbus valid handling, would need to stay within this driver. Most
of the eUSB block configuration in google_usb2_phy_init() could
be moved to the snps-eusb2 driver by adding one more compatible
for Google's version of the SNSP eUSB IP. However, I'd argue
1. This approach would introduce an extra layer of PHY interface,
    which adds unnecessary complexity.
2. Not much of the code is reused in snps-eusb2 driver: the register
    definition and programming sequence are specific to Google,
    hence the logic in google_usb2_phy_init() would have to be
    moved to snps-eusb2 driver almost word-by-word.

I understand this approach was suggested for the sake of clarity,
but I'm not sure whether that makes for the best trade-off. Since
there is a precedent for this approach, I do not have a strong
objection. It would be helpful if the maintainers could also provide
their input on this specific point.

>
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
> > +     struct phy *phy;
> > +     int num_clks;
> > +     struct clk_bulk_data *clks;
> > +     struct reset_control *rsts;
> > +};
> > +
> > +struct google_usb_phy {
> > +     struct device *dev;
> > +     void __iomem *u2phy_cfg_base;
> > +     void __iomem *dp_top_base;
> > +     struct google_usb_phy_instance insts[GOOGLE_USB_PHY_NUM];
> > +     /* serialize phy access */
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
> > +             reg =3D readl(gphy->dp_top_base + USBCS_PHY_CFG1_OFFSET);
> > +             reg &=3D ~USBCS_PHY_CFG1_SYS_VBUSVALID;
> > +             writel(reg, gphy->dp_top_base + USBCS_PHY_CFG1_OFFSET);
> > +     } else {
> > +             reg =3D readl(gphy->dp_top_base + USBCS_PHY_CFG1_OFFSET);
> > +             reg |=3D USBCS_PHY_CFG1_SYS_VBUSVALID;
> > +             writel(reg, gphy->dp_top_base + USBCS_PHY_CFG1_OFFSET);
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
> > +
> > +     dev_dbg(gphy->dev, "initializing usb2 phy\n");
> > +
> > +     guard(mutex)(&gphy->phy_mutex);
> > +
> > +     reg =3D readl(gphy->u2phy_cfg_base + USBCS_USB2PHY_CFG21_OFFSET);
> > +     reg &=3D ~USBCS_USB2PHY_CFG21_PHY_TX_DIG_BYPASS_SEL;
> > +     reg &=3D ~USBCS_USB2PHY_CFG21_REF_FREQ_SEL;
> > +     reg |=3D FIELD_PREP(USBCS_USB2PHY_CFG21_REF_FREQ_SEL, 0);
> > +     writel(reg, gphy->u2phy_cfg_base + USBCS_USB2PHY_CFG21_OFFSET);
> > +
> > +     reg =3D readl(gphy->u2phy_cfg_base + USBCS_USB2PHY_CFG19_OFFSET);
> > +     reg &=3D ~USBCS_USB2PHY_CFG19_PHY_CFG_PLL_FB_DIV;
> > +     reg |=3D FIELD_PREP(USBCS_USB2PHY_CFG19_PHY_CFG_PLL_FB_DIV, 368);
>
> Yeah, it's definitely the eUSB IP, but wired differently.
>
> phy-snps-eusb2.c:
> #define EXYNOS_USB_PHY_CFG_PLLCFG0 (0x8)
> #define PHY_CFG_PLL_FB_DIV_19_8_MASK GENMASK(19, 8)
> #define DIV_19_8_19_2_MHZ_VAL (0x170)
>
> > +     writel(reg, gphy->u2phy_cfg_base + USBCS_USB2PHY_CFG19_OFFSET);
> > +
> > +     set_vbus_valid(gphy);
> > +
> > +     ret =3D clk_bulk_prepare_enable(inst->num_clks, inst->clks);
> > +     if (ret)
> > +             return ret;
> > +
> > +     ret =3D reset_control_deassert(inst->rsts);
> > +     if (ret) {
> > +             clk_bulk_disable_unprepare(inst->num_clks, inst->clks);
> > +             return ret;
> > +     }
> > +
> > +     reg =3D readl(gphy->u2phy_cfg_base + USBCS_USB2PHY_CFG21_OFFSET);
> > +     reg |=3D USBCS_USB2PHY_CFG21_PHY_ENABLE;
> > +     writel(reg, gphy->u2phy_cfg_base + USBCS_USB2PHY_CFG21_OFFSET);
> > +
> > +     return ret;
> > +}
> > +
> ...
> > +
> > +     gphy->sw =3D typec_switch_register(dev, &sw_desc);
> > +     if (IS_ERR(gphy->sw))
> > +             return dev_err_probe(dev, PTR_ERR(gphy->sw),
> > +                                  "failed to register typec switch\n")=
;
> > +
> > +     return 0;
> > +}
> > +
> > +static void google_usb_phy_remove(struct platform_device *pdev)
> > +{
> > +     struct google_usb_phy *gphy =3D dev_get_drvdata(&pdev->dev);
> > +
> > +     typec_switch_unregister(gphy->sw);
> > +     pm_runtime_disable(&pdev->dev);
> > +}
> > +
> > +static const struct of_device_id google_usb_phy_of_match[] =3D {
> > +     {
> > +             .compatible =3D "google,gs5-usb-phy",
>
> Did the naming scheme also change from gs{N}01 to gsN?

Starting from Tensor G5, there's no model number [1], hence
the change. The prefix "gs" is kept as their family name.

[1] https://en.wikipedia.org/wiki/Google_Tensor

>
> > +     },
> > +     { }
> > +};
> > +MODULE_DEVICE_TABLE(of, google_usb_phy_of_match);
> > +
> > +static struct platform_driver google_usb_phy =3D {
> > +     .probe  =3D google_usb_phy_probe,
> > +     .remove =3D google_usb_phy_remove,
> > +     .driver =3D {
> > +             .name           =3D "google-usb-phy",
> > +             .of_match_table =3D google_usb_phy_of_match,
> > +     }
> > +};
> > +
> > +module_platform_driver(google_usb_phy);
> > +MODULE_LICENSE("GPL");
> > +MODULE_DESCRIPTION("Google USB phy driver");
>
> Great work!
>
> Best regards,
> Ivaylo

Thank you for the review!

Regards,
Roy Luo

