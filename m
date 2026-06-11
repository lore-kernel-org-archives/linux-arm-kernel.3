Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 07F62CD98D2
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 11 Jun 2026 08:41:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=X2WPByO+G8FHiboiB1L4c6R/FhwALJaPpiaRhOBTGss=; b=OwBZqgu0jT7QS+UmAMOYoekQaz
	YGh13F2CdDDSPCFSNCJopV1Kv+KWTazLI8RMjQEUVrmJDe9KWW9DyntdQAHOwMp6Dy6x3DiG8pR5v
	5mOV3tScsaNCj+tnwjkasecGoAiUCP/q52qnlUH7crhP15gJibw6IOLof1rTepUfKT/QvqZ2KYHqb
	Kn6GrJT9r42I607OlLE73OfKRpdXiTIZaa0uNlJXu2AY0xTIKwTc3tnfd5iTMjWBt1bPhr1X/PVcw
	J3J52uwSUZZ6otUrcM5WHgpkxX5Ltp3JSeXlo7MEnt7QP6NOg1Z1557HMoi6pD5TY0o6XadNyo8Vp
	DFFb/vqA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wXay7-000000091rm-1A9E;
	Thu, 11 Jun 2026 08:40:55 +0000
Received: from mail-wr1-x434.google.com ([2a00:1450:4864:20::434])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wXay2-000000091rJ-347s
	for linux-arm-kernel@lists.infradead.org;
	Thu, 11 Jun 2026 08:40:53 +0000
Received: by mail-wr1-x434.google.com with SMTP id ffacd0b85a97d-460662fcb4eso378740f8f.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 11 Jun 2026 01:40:49 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1781167248; cv=none;
        d=google.com; s=arc-20240605;
        b=c3HWl2L7XWClcBKEPonqf9xqF5B9QMQ3PbLf/RS+X9UugV6sAIMdvW52h583N8vsNS
         uxfYzu6c/qIN9UCoJ3OG5YSB6Jj0lkQfhHxq+uaLFMjacyVTR/GfvmTPS7GLTzz5Tfn9
         oejtM3SGYq4mDYVDC19BKVyxxq03a+IcuYFIw5xMGghQ+Ky4H/AWdTtOGKprduGjUrKQ
         7ALn23eZulDpwahxUtClBWIbP/xnqBfbiDUoDLDinQmRr8KYToLN5GAI4fJp/qEUiAl3
         aCldXjZ7YvF7tgFkxOG+76AKfpYrM1fTPZmYx6CjLy6UqccZ7p3dkoD+Pl4i1+/0t/lf
         WGvA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=X2WPByO+G8FHiboiB1L4c6R/FhwALJaPpiaRhOBTGss=;
        fh=qFx24bBF6Q38C3Pp3IybqawHYHxoFFEeBEU9p82svbk=;
        b=KgPtnR3z+4E22bMw4tNxsRAk0fIkF2k60qHXmnQfXbzQK/FLwxD0kb6eurv3OqYXEN
         BDtOsjbX/ItukImBUFdutnTxEIA0ctsHKYRwMOwuNCsgx4y07bkIqFmXXZiw5B7A8O/y
         e9jv/YtiZJnYOCLza056h58zsVwjr0t+Qk5D3Lm9Bg5ZogAejWHgHJJjMthZGpz+zAKZ
         /kF5nj9z3DEvUUEcWEIuN8Nzo1Mauxw22kazhXOB0zlwqlgDNy2zUbn4s1nmECt7Xamc
         fzJ+jegQyYebt7JWEYeQceUiHBXVF0nWmWDGzVW9zyAjwFeWNA2arm1n1aD2LmAZHAxD
         Hk/A==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=9elements.com; s=google; t=1781167248; x=1781772048; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=X2WPByO+G8FHiboiB1L4c6R/FhwALJaPpiaRhOBTGss=;
        b=MWzBWuXBv24SZpMC6FWiGgM5aIo2EzJ2LiKmg0vc4ASddcno915aQaWiBJU9u+RqCk
         q4lOiBw7NsR4EfpySNUic2y06Zlo2Omn18SAwc0hYDxwHx41vK3i/sdREiIKBfnMMK+I
         XgxodMbapvL5bOZuwEzogOT1ayU4DhiH55JTpTjl/JiwXdmMJ/+UaVpRihjG7WwWZpXH
         WcI/YborM0UMSO0c140rFIuL/oYbb+JfYrJEYsY0kaleM8FuwZFw6YqHqPFbdtf0yTi/
         IX619XmDMh7LSb4uPcMSsQc6IWqbQhMI+pO3/I58lNzXEcUvbOTN4H7+ew5EURZCquz5
         4itg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781167248; x=1781772048;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=X2WPByO+G8FHiboiB1L4c6R/FhwALJaPpiaRhOBTGss=;
        b=eW85I+gbetCB5MXKbZh3dWCikGwlgDXVoMqPIS+cQRUtPeCqGw43tRhrTS6VHI9b+8
         lo+NACAIyQhrjFZFPrskPhBOhlY6I/2m2OGWBnt42BlKD7C806wQOxTKE0miHKLwjTJ5
         0j9mFBUCxz1D2V6ESuBInEeFKV/awZBB0iJUgY5oxlBFlH/TBIWlyxstbV5vjX14M7Eh
         pU0I/ZKSBFEeJY/T5W/1daD9eA1Oi6tR3E6SuBhkPhn51z3dSIU3CNluKDnvT9MZbpUD
         TqsKXZX4Rwtsbf/yzHiucB5z7VL88PTeWZs7aiuHddTdgORmZgEBMqvM1FerHBJ4vFd0
         eSZw==
X-Forwarded-Encrypted: i=1; AFNElJ8yDB9pOwGQ2vmZsfPzJydjSj0pc/jjGgF09t4HefWXZ/dT9IFMddt5evCpUFAcypR3Y5ygZXD+IRHR4u4VNKlN@lists.infradead.org
X-Gm-Message-State: AOJu0YxRsRekntQCo2LUzmA1odlAVirmzqygNxKMJM6L+eW5rz1qDihH
	Qh5336gzcx22OTtiZCn0EZJwsGDZZ6bTP2NpfZSECyEkP4WzU4mvP7x8htDC/G/f8EsI7fKEtS/
	86D7AesuHPVmckxDjjGj/COM58mRzbb0hV0gO1zU2hw==
X-Gm-Gg: Acq92OFjGHOyAVJnfT0/T4T4TgJw9F8sJH5SNqDaVJUl97oFHKJmQLPRdul0HxEbu0y
	I/wQPVWsvtQe4jj3YjIf3Mhv/VBPutqPD7spAJ6RCWqt9+hJwhM57mPoVIsHArPAaArG4UVSkYu
	SJDG1R6tWFWkBVzXBtXeWFmMVaU9+FMnhCMUGI4b9XYaCA7CwwgNC7QorZaLBls2Mqk6/cXIX2s
	+oZl8O3+WhpOIriY/RDN8fZ2YNFICNiUmzb3SQqXWnZytibqM+JhWDO9BIGXMlie0J8iK5GNebN
	pdUqlBzTNWZK4FfM5e0rZPi9CWsCyAnzAPQ6QShscyypfNujBgzcWAvBaFW2pBbeNtSCLfNRU2d
	8a2Y=
X-Received: by 2002:a05:6000:4383:b0:45e:b99d:dad with SMTP id
 ffacd0b85a97d-460677e5777mr2632363f8f.38.1781167247796; Thu, 11 Jun 2026
 01:40:47 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1780929570.git.gregoire.layet@9elements.com>
 <af322e76d34ad504e0bdec470293a017b489cfd7.1780929570.git.gregoire.layet@9elements.com>
 <4839c31f666b612799a795bb47c884901fd2a903.camel@codeconstruct.com.au>
In-Reply-To: <4839c31f666b612799a795bb47c884901fd2a903.camel@codeconstruct.com.au>
From: =?UTF-8?Q?Gr=C3=A9goire_Layet?= <gregoire.layet@9elements.com>
Date: Thu, 11 Jun 2026 10:40:35 +0200
X-Gm-Features: AVVi8CeBOWu4EGURBiKGSA-XqC1fjOjUEZ-adK5473sjjF-Cuy_g9HUqema9G8E
Message-ID: <CAFi2wKYzUDY5Gis9GaHdqeYdv-orHB+gWfLXkJBgbxfbnRgorA@mail.gmail.com>
Subject: Re: [PATCH v2 1/2] soc: aspeed: add BMC-side PCIe BMC device driver
To: Andrew Jeffery <andrew@codeconstruct.com.au>
Cc: joel@jms.id.au, andrew@lunn.ch, jacky_chou@aspeedtech.com, 
	yh_chung@aspeedtech.com, ninad@linux.ibm.com, linux-aspeed@lists.ozlabs.org, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260611_014051_215341_FD6CA1C7 
X-CRM114-Status: GOOD (  53.87  )
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

Hello Andrew,

> It's probably best to use ASPEED's SDK as a source of inspiration for
> fixing obscure bugs, but not send drivers directly extracted from it.

I would like to discuss the different options then.

If we decide to continue on the current path, I'll modify the code accordin=
g
to your remarks.

> We should avoid adding more drivers in drivers/soc/aspeed where we can.
> Is this really necessary?

This driver (for the BMC side) only enables some configuration on the SCU t=
o
make MSI interrupts work. It is a very specific configuration, which is why=
 I
thought it was OK as a separate driver.

Fundamentally, the BMC side driver is not necessary. During my testing,
I successfully made data flow in both directions without the BMC side drive=
r,
but this was using polling mode (IRQ =3D 0), it's not ideal.


It is also possible to put the SCU initialisation on the
8250_aspeed_vuart driver
directly. This could be activated with a specific flag added to VUART nodes
('pcie2vuart' for example) on the DeviceTree.

Putting this configuration in the VUART driver directly would make the setu=
p
on the devicetree easier and more understandable. Because in this series, t=
he
bmc side driver needs a bmc_device node to be loaded. But the bmc_dev node
doesn't hold any meaningful information.
If we decide to take this approach, I think we should also add the
differentiation for the ast2600 compatibility. Currently, the aspeed-g6.dts=
i
uses the "aspeed,ast2500-vuart" compatibility entry for the four VUARTs.

What do you think about this solution ?


Thanks,
Gr=C3=A9goire


On Wed, 10 Jun 2026 at 14:33, Andrew Jeffery
<andrew@codeconstruct.com.au> wrote:
>
> Hello Gr=C3=A9goire,
>
> On Mon, 2026-06-08 at 14:51 +0000, Gr=C3=A9goire Layet wrote:
> > Taken from ASPEED 6.18 Kernel SDK
>
> It's probably best to use ASPEED's SDK as a source of inspiration for
> fixing obscure bugs, but not send drivers directly extracted from it.
>
> >
> > Add support for VUART over PCIe between BMC and host.
> > This add BMC side driver.
> >
> > Signed-off-by: Jacky Chou <jacky_chou@aspeedtech.com>
> > Signed-off-by: aspeedyh <yh_chung@aspeedtech.com>
> > Signed-off-by: Gr=C3=A9goire Layet <gregoire.layet@9elements.com>
> > Tested-by: Gr=C3=A9goire Layet <gregoire.layet@9elements.com>
> > ---
> >  drivers/soc/aspeed/Kconfig          |   7 ++
> >  drivers/soc/aspeed/Makefile         |   1 +
> >  drivers/soc/aspeed/aspeed-bmc-dev.c | 187 ++++++++++++++++++++++++++++
>
> We should avoid adding more drivers in drivers/soc/aspeed where we can.
>
> Is this really necessary?
>
> >  3 files changed, 195 insertions(+)
> >  create mode 100644 drivers/soc/aspeed/aspeed-bmc-dev.c
> >
> > diff --git a/drivers/soc/aspeed/Kconfig b/drivers/soc/aspeed/Kconfig
> > index f579ee0b5afa..3e1fcf3c3268 100644
> > --- a/drivers/soc/aspeed/Kconfig
> > +++ b/drivers/soc/aspeed/Kconfig
> > @@ -4,6 +4,13 @@ if ARCH_ASPEED || COMPILE_TEST
> >
> >  menu "ASPEED SoC drivers"
> >
> > +config ASPEED_BMC_DEV
> > +     tristate "ASPEED BMC Device"
> > +     default n
> > +     help
> > +       Enable support for the ASPEED AST2600 BMC Device.
> > +       This exposes the PCIe-to-LPC bridge of the BMC to the host over=
 PCIe.
> > +
> >  config ASPEED_LPC_CTRL
> >       tristate "ASPEED LPC firmware cycle control"
> >       select REGMAP
> > diff --git a/drivers/soc/aspeed/Makefile b/drivers/soc/aspeed/Makefile
> > index b35d74592964..fab0d247df66 100644
> > --- a/drivers/soc/aspeed/Makefile
> > +++ b/drivers/soc/aspeed/Makefile
> > @@ -1,4 +1,5 @@
> >  # SPDX-License-Identifier: GPL-2.0-only
> > +obj-$(CONFIG_ASPEED_BMC_DEV)         +=3D aspeed-bmc-dev.o
> >  obj-$(CONFIG_ASPEED_LPC_CTRL)                +=3D aspeed-lpc-ctrl.o
> >  obj-$(CONFIG_ASPEED_LPC_SNOOP)               +=3D aspeed-lpc-snoop.o
> >  obj-$(CONFIG_ASPEED_UART_ROUTING)    +=3D aspeed-uart-routing.o
> > diff --git a/drivers/soc/aspeed/aspeed-bmc-dev.c b/drivers/soc/aspeed/a=
speed-bmc-dev.c
> > new file mode 100644
> > index 000000000000..7a204b543c97
> > --- /dev/null
> > +++ b/drivers/soc/aspeed/aspeed-bmc-dev.c
> > @@ -0,0 +1,187 @@
> > +// SPDX-License-Identifier: GPL-2.0-or-later
> > +// Copyright (C) ASPEED Technology Inc.
> > +
> > +#include <linux/init.h>
> > +#include <linux/module.h>
> > +#include <linux/kernel.h>
> > +#include <linux/errno.h>
> > +
> > +#include <linux/of_address.h>
> > +#include <linux/platform_device.h>
> > +
> > +#include <linux/regmap.h>
> > +#include <linux/interrupt.h>
> > +#include <linux/mfd/syscon.h>
> > +
> > +#define SCU_TRIGGER_MSI
> > +
> > +/* AST2600 SCU */
> > +#define ASPEED_SCU04                 0x04
> > +#define AST2600A3_SCU04                              0x05030303
> > +#define ASPEED_SCUC20                        0xC20
> > +#define ASPEED_SCUC24                        0xC24
>
> These could all use properly descriptive names.
>
> Pinctrl is an exception because of how the documentation is structured.
>
> > +#define MSI_ROUTING_MASK                     GENMASK(11, 10)
> > +#define PCIDEV1_INTX_MSI_HOST2BMC_EN         BIT(18)
> > +#define MSI_ROUTING_PCIe2LPC_PCIDEV0         (0x1 << 10)
> > +#define MSI_ROUTING_PCIe2LPC_PCIDEV1         (0x2 << 10)
> > +
> > +#define ASPEED_SCU_PCIE_CONF_CTRL    0xC20
> > +#define  SCU_PCIE_CONF_BMC_DEV_EN                     BIT(8)
> > +#define  SCU_PCIE_CONF_BMC_DEV_EN_MMIO                BIT(9)
> > +#define  SCU_PCIE_CONF_BMC_DEV_EN_MSI                 BIT(11)
> > +#define  SCU_PCIE_CONF_BMC_DEV_EN_IRQ                 BIT(13)
> > +#define  SCU_PCIE_CONF_BMC_DEV_EN_DMA                 BIT(14)
> > +#define  SCU_PCIE_CONF_BMC_DEV_EN_E2L                 BIT(15)
> > +#define  SCU_PCIE_CONF_BMC_DEV_EN_LPC_DECODE BIT(21)
> > +
> > +#define ASPEED_SCU_BMC_DEV_CLASS     0xC68
> > +
> > +
> > +struct aspeed_platform {
> > +     int (*init)(struct platform_device *pdev);
> > +};
> > +
> > +struct aspeed_bmc_device {
> > +     struct device *dev;
> > +     int id;
> > +     void __iomem *reg_base;
> > +
> > +     int pcie2lpc;
> > +     int irq;
> > +
> > +     const struct aspeed_platform *platform;
> > +
> > +     struct regmap *scu;
> > +     int pcie_irq;
> > +};
> > +
> > +
> > +static int aspeed_ast2600_init(struct platform_device *pdev)
> > +{
> > +     struct aspeed_bmc_device *bmc_device =3D platform_get_drvdata(pde=
v);
> > +     struct device *dev =3D &pdev->dev;
> > +     u32 pcie_config_ctl =3D SCU_PCIE_CONF_BMC_DEV_EN_IRQ |
> > +                           SCU_PCIE_CONF_BMC_DEV_EN_MMIO | SCU_PCIE_CO=
NF_BMC_DEV_EN;
> > +     u32 scu_id;
> > +
> > +     bmc_device->scu =3D syscon_regmap_lookup_by_phandle(dev->of_node,=
 "aspeed,scu");
>
> We should rather look at auxbus for the SCU.
>
> > +     if (IS_ERR(bmc_device->scu)) {
> > +             dev_err(&pdev->dev, "failed to find SCU regmap\n");
> > +             return PTR_ERR(bmc_device->scu);
> > +     }
> > +
> > +     if (bmc_device->pcie2lpc)
> > +             pcie_config_ctl |=3D SCU_PCIE_CONF_BMC_DEV_EN_E2L |
> > +                                SCU_PCIE_CONF_BMC_DEV_EN_LPC_DECODE;
> > +
> > +     regmap_update_bits(bmc_device->scu, ASPEED_SCU_PCIE_CONF_CTRL,
> > +                        pcie_config_ctl, pcie_config_ctl);
> > +
> > +     /* update class code to others as it is a MFD device */
> > +     regmap_write(bmc_device->scu, ASPEED_SCU_BMC_DEV_CLASS, 0xff00000=
0);
> > +
> > +#ifdef SCU_TRIGGER_MSI
>
> I don't see that this needs to be a CPP test. This could be a C test.
> The construct would be optimised because of the constant and we'd get
> compile time coverage of both sides without additional configuration.
>
> Have you tested both sides?
>
> > +     //SCUC24[17]: Enable PCI device 1 INTx/MSI from SCU560[15]. Will =
be added in next version
> > +     regmap_update_bits(bmc_device->scu, ASPEED_SCUC20, BIT(11) | BIT(=
14), BIT(11) | BIT(14));
>
> These bits need descriptive macros.
>
> > +
> > +     regmap_read(bmc_device->scu, ASPEED_SCU04, &scu_id);
> > +     if (scu_id =3D=3D AST2600A3_SCU04)
> > +             regmap_update_bits(bmc_device->scu, ASPEED_SCUC24,
> > +                                PCIDEV1_INTX_MSI_HOST2BMC_EN | MSI_ROU=
TING_MASK,
> > +                                PCIDEV1_INTX_MSI_HOST2BMC_EN | MSI_ROU=
TING_PCIe2LPC_PCIDEV1);
> > +     else
> > +             regmap_update_bits(bmc_device->scu, ASPEED_SCUC24,
> > +                                BIT(17) | BIT(14) | BIT(11), BIT(17) |=
 BIT(14) | BIT(11));
>
> As do these
>
> > +#else
> > +     //SCUC24[18]: Enable PCI device 1 INTx/MSI from Host-to-BMC contr=
oller.
> > +     regmap_update_bits(bmc_device->scu, 0xc24, BIT(18) | BIT(14), BIT=
(18) | BIT(14));
>
> And these.
>
> > +#endif
> > +
> > +
> > +     return 0;
> > +}
> > +
> > +
> > +static struct aspeed_platform ast2600_plaform =3D {
> > +     .init =3D aspeed_ast2600_init
> > +};
> > +
> > +
> > +static const struct of_device_id aspeed_bmc_device_of_matches[] =3D {
> > +     { .compatible =3D "aspeed,ast2600-bmc-device", .data =3D &ast2600=
_plaform },
>
> This compatible isn't documented in this series and isn't present in
> linux-next at a87737435cfa ("Add linux-next specific files for
> 20260608"). You'll need to address that if it's reasonable to continue
> down this path. I expect you'll want to avoid it, and define any
> necessary properties on the SCU node rather than add further children.
>
> > +     {},
> > +};
> > +MODULE_DEVICE_TABLE(of, aspeed_bmc_device_of_matches);
> > +
> > +static int aspeed_bmc_device_probe(struct platform_device *pdev)
> > +{
> > +     struct aspeed_bmc_device *bmc_device;
> > +     struct device *dev =3D &pdev->dev;
>
> This shortcut is defined but inconsistently used.
>
> > +     const void *md =3D of_device_get_match_data(dev);
>
> I think we can do without this, see below.
>
> > +     int ret =3D 0;
> > +
> > +     if (!md)
> > +             return -ENODEV;
> > +
> > +     bmc_device =3D devm_kzalloc(&pdev->dev, sizeof(struct aspeed_bmc_=
device), GFP_KERNEL);
> > +     if (!bmc_device)
> > +             return -ENOMEM;
> > +     dev_set_drvdata(dev, bmc_device);
> > +
> > +     bmc_device->platform =3D md;
> > +
> > +     bmc_device->id =3D of_alias_get_id(dev->of_node, "bmcdev");
> > +     if (bmc_device->id < 0)
> > +             bmc_device->id =3D 0;
> > +
> > +     bmc_device->dev =3D dev;
> > +     bmc_device->reg_base =3D devm_platform_ioremap_resource(pdev, 0);
> > +     if (IS_ERR(bmc_device->reg_base))
> > +             return PTR_ERR(bmc_device->reg_base);
> > +
> > +     bmc_device->irq =3D platform_get_irq(pdev, 0);
>
> This seems unnecessary.
>
> > +     if (bmc_device->irq < 0) {
> > +             dev_err(&pdev->dev, "platform get of irq[=3D%d] failed!\n=
", bmc_device->irq);
> > +             return bmc_device->irq;
> > +     }
> > +
> > +     if (of_property_read_bool(dev->of_node, "pcie2lpc"))
>
> This property isn't documented.
>
> > +             bmc_device->pcie2lpc =3D 1;
> > +
> > +     ret =3D bmc_device->platform->init(pdev);
>
> The driver only supports one SoC, this indirection seems unnecessary
> right now. We can add that later when there's a need to differentiate.
> I'd rather you call the setup function directly for now.
>
> > +     if (ret) {
> > +             dev_err(dev, "Initialize bmc device failed\n");
> > +             goto out;
> > +     }
> > +
> > +     dev_info(dev, "aspeed bmc device: driver successfully loaded.\n")=
;
> > +
> > +     return 0;
> > +
> > +out:
> > +     dev_warn(dev, "aspeed bmc device: driver init failed (ret=3D%d)!\=
n", ret);
> > +     return ret;
> > +}
> > +
> > +static void aspeed_bmc_device_remove(struct platform_device *pdev)
> > +{
> > +     struct aspeed_bmc_device *bmc_device =3D platform_get_drvdata(pde=
v);
> > +
> > +     devm_free_irq(&pdev->dev, bmc_device->irq, bmc_device);
> > +     devm_kfree(&pdev->dev, bmc_device);
>
> These are unnecessary due to cleanup of devres on release.
>
> Andrew

