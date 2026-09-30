Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 145B9CA5FC7
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 30 Sep 2026 15:36:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=wS4LjSmeazs7ipEDl8K4WoxVwnKJqPAAcY7mjsKl19I=; b=zwHLxnwgg32+uxR8Dyva+gILpi
	H3tz3X/vntw/hMs3cUOA2/pQj/inOThlreYnD6+w4sgCtnQ3yTQOrCsec5CgoLreEcU89188JkNoz
	4uAH6vPZ0jD9Yd02rfDNg6WCzIxUWyaomfaY8/czto/xKhBEn5RZ40/H0sSMH1y1dh15TptBKGNj3
	Xl+K+xgpUQ5gMi+WW1Zz+obBBBStSEW4Yjiy3LkaBmxcktBHJkVn6b2Fv7HgPbhtTtNaI+e26dPqX
	1DSNRG7J2kQTDnpDTeqFQxjwdLiHWjOcSlZMptLpW/WysV5zXWawE4K8w/TogLcIH5ssLksXTiky4
	3wo8xrBQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBwLr-00000006XYz-0Edp;
	Wed, 30 Sep 2026 15:36:11 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBwLY-00000006XSI-2VmB;
	Wed, 30 Sep 2026 15:35:52 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id ABF8A60211;
	Wed, 30 Sep 2026 15:35:51 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C2F6C1F0089B;
	Wed, 30 Sep 2026 15:35:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790782551;
	bh=wS4LjSmeazs7ipEDl8K4WoxVwnKJqPAAcY7mjsKl19I=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=ENsxnJqmKcCzQZ8LtzXYoty9iQBgyMbQ5ouiTwV+pPSNRRJa/HzE3uVwu9gdjL2Qu
	 cCcprq6/VuytjCI2cRuOnwFqzy1pvxOZRSh41CRX5PzT/drKE5NCvDjy/p3sTUpM6t
	 dOQ4QNR7D+dfaHgZ7jHN5N8niUKBGd8uSADoEm7ByRsKdm4v1vChc59Q12OrriwIjt
	 o7rJpNBR2QMSvHDhF/XgZqzMQUnDdVx9ThN7t3o+mTjRM8TsengaDQDexOQKMckmES
	 VGYiJRAbQIWfUbpgF2CXcgKYyvvOiD+8IwoTjZfbgAc28SA04z8OYLlOyQQ3kHb12G
	 BMKs34GfPoovg==
Date: Wed, 30 Sep 2026 23:15:48 +0800
From: Jisheng Zhang <jszhang@kernel.org>
To: Conor Dooley <conor@kernel.org>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Stephen Boyd <sboyd@kernel.org>,
	Brian Masney <bmasney+clk@redhat.com>,
	Jerome Brunet <jbrunet+clk@baylibre.com>,
	Andi Shyti <andi.shyti@kernel.org>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Frank Li <Frank.Li@nxp.com>, Lee Jones <lee@kernel.org>,
	Linus Walleij <linusw@kernel.org>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Jiri Slaby <jirislaby@kernel.org>,
	Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-clk@vger.kernel.org, linux-i2c@vger.kernel.org,
	linux-i3c@lists.infradead.org, mfd@lists.linux.dev,
	linux-gpio@vger.kernel.org, linux-serial@vger.kernel.org,
	linux-spi@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH 08/20] dt-bindings: reset: add Synaptics SL261X SoCs
Message-ID: <ar0npPCHX1P5Gjzx@xhacker>
References: <20260929061417.20733-1-jszhang@kernel.org>
 <20260929061417.20733-9-jszhang@kernel.org>
 <20260929-sprang-stir-af07a907ccb2@spud>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260929-sprang-stir-af07a907ccb2@spud>
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

On Tue, Sep 29, 2026 at 08:44:13PM +0100, Conor Dooley wrote:
> On Tue, Sep 29, 2026 at 02:14:05PM +0800, Jisheng Zhang wrote:
> > Add device tree bindings for the resets on Synaptics SL261X SoCs.
> > 
> > Signed-off-by: Jisheng Zhang <jszhang@kernel.org>
> > ---
> >  .../bindings/reset/syna,sl261x-reset.yaml     | 40 ++++++++++
> >  include/dt-bindings/reset/syna,sl261x-reset.h | 80 +++++++++++++++++++
> >  2 files changed, 120 insertions(+)
> >  create mode 100644 Documentation/devicetree/bindings/reset/syna,sl261x-reset.yaml
> >  create mode 100644 include/dt-bindings/reset/syna,sl261x-reset.h
> > 
> > diff --git a/Documentation/devicetree/bindings/reset/syna,sl261x-reset.yaml b/Documentation/devicetree/bindings/reset/syna,sl261x-reset.yaml
> > new file mode 100644
> > index 000000000000..8cfec17df800
> > --- /dev/null
> > +++ b/Documentation/devicetree/bindings/reset/syna,sl261x-reset.yaml
> > @@ -0,0 +1,40 @@
> > +# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
> > +# Copyright (C) 2026 Synaptics Incorporated
> > +%YAML 1.2
> > +---
> > +$id: http://devicetree.org/schemas/reset/syna,sl261x-reset.yaml#
> > +$schema: http://devicetree.org/meta-schemas/core.yaml#
> > +
> > +title: Synaptics SL261X reset controller
> > +
> > +maintainers:
> > +  - Jisheng Zhang <jszhang@kernel.org>
> > +
> > +description: The reset controller node must be a sub-node of the chip
> > +  controller node on SL261X SoCs.
> > +
> > +properties:
> > +  compatible:
> > +    enum:
> > +      - syna,sl261x-soc-reset
> > +      - syna,sl261x-system-reset
> > +
> > +  "#reset-cells":
> > +    const: 1
> > +
> > +required:
> > +  - compatible
> > +  - "#reset-cells"
> > +
> > +additionalProperties: false
> > +
> > +examples:
> > +  - |
> > +    chip: chip-control@f7e10000 {
> > +        reg = <0xf7e10000 0x1000>;
> > +
> > +        chip_rst: reset {
> > +            compatible = "syna,sl261x-soc-reset";
> > +            #reset-cells = <1>;
> > +        };
> 
> Why can't this just be part of the parent node?

Good question! IMHO, the reasons are:

1. the so called Gbls(Gbl means global) such as mcuGbl and
chip control Gbl contain not only reset, pinctrl and clk/plls
but also some other registers for different purposes, e.g in the
chip control gbl, there are some registers to control eth phy sel(RMII
or RGMII), and TXC 90 degree selection etc. These registers will
be used by the Ethernet driver;

While there's no pinctrl regs in avioGbl and vppGbl. In the vppgbl,
there are some registers for DPHYTX etc.

As can been, in different Gbls, there maybe different purposes registers, no
obvious patterns.

So the question here is why not split the gbl into different register
spaces, and abstract each space for each function group? Two blocking
points make this impossible and ugly: different reg space may not be
aligned at 4KB boundary, e.g reset: 0x350 ~ 0x37c; eth phy sel:0xa18;
some registers which belong to similar functionality, e.g clks, may not be
adjacent.

So the best way is to abstract these GBLs via. "syscon", "simple-mfd", and
put necessary subnodes such as reset, pinctrl and clks under the GBL
node. If the registers in GBL is misc control, pass the syscon phandle
to the main driver, e.g I planed to pass the syscon phandle to GMAC
driver to control the RMII/RGMII selection.

2.follow current bg2 and bg2q style
e.g arch/arm/boot/dts/synaptics/berlin2q.dtsi

IMHO, why bg2 and bg2q dtsi files are implemented as current
style is due to the above point 1.

Kindly let me know if there's a better solution.

> From a quick check of the dts, the node with this subnode didn't also
> have a system-reset node too, so there's no conflict or anything of that
> nature.
> 
> > +    };
> > diff --git a/include/dt-bindings/reset/syna,sl261x-reset.h b/include/dt-bindings/reset/syna,sl261x-reset.h
> > new file mode 100644
> > index 000000000000..7034f58aae5b
> > --- /dev/null
> > +++ b/include/dt-bindings/reset/syna,sl261x-reset.h
> > @@ -0,0 +1,80 @@
> > +/* SPDX-License-Identifier: (GPL-2.0 OR MIT) */
> > +/*
> > + * Copyright (C) 2026 Synaptics Incorporated
> > + *
> > + * Author: Jisheng Zhang <jszhang@kernel.org>
> > + */
> > +
> > +#ifndef _DT_BINDINGS_SL261X_RESET_H
> > +#define _DT_BINDINGS_SL261X_RESET_H
> > +
> > +/* ACPU subsystem */
> > +#define RST_SOC_SDIO0		0
> > +#define RST_SOC_USB0		1
> > +#define RST_SOC_EMMC		2
> > +#define RST_SOC_GETH0		3
> > +#define RST_SOC_SDIO1		4
> > +#define RST_SOC_USB1		5
> > +#define RST_SOC_GETH1		6
> > +#define RST_SOC_USB0PHY		7
> > +#define RST_SOC_USB0CORE	8
> > +#define RST_SOC_USB0MAHB	9
> > +#define RST_SOC_USB1PHY		10
> > +#define RST_SOC_USB1CORE	11
> > +#define RST_SOC_USB1MAHB	12
> > +#define RST_SOC_UART0		13
> > +#define RST_SOC_UART1		14
> > +#define RST_SOC_UART2		15
> > +#define RST_SOC_UART3		16
> > +#define RST_SOC_I2C0		17
> > +#define RST_SOC_I2C1		18
> > +#define RST_SOC_SPI0		19
> > +#define RST_SOC_SPI1		20
> > +#define RST_SOC_SPI2		21
> > +#define RST_SOC_SPI3		22
> > +#define RST_SOC_APBTIMERS	23
> > +#define RST_SOC_APBSYSCNT	24
> > +#define RST_SOC_APBWDT		25
> > +#define RST_SOC_APBGPIO		26
> > +#define RST_SOC_APBDMA		27
> > +#define RST_SOC_GPUCORE		28
> > +#define RST_SOC_NPUCORE		29
> > +#define RST_SOC_AVIOAIOG	30
> > +#define RST_SOC_AVIOVPPG	31
> > +#define RST_SOC_AVIOVIPG	32
> > +
> > +/* system subsystem */
> > +#define RST_SM_ADCCORE		0
> > +#define RST_SM_ADCPRST		1
> > +#define RST_SM_CAN0PRST		2
> > +#define RST_SM_CAN0SRST		3
> > +#define RST_SM_CAN1PRST		4
> > +#define RST_SM_CAN1SRST		5
> > +#define RST_SM_GPIOPRST		6
> > +#define RST_SM_GPIOSRST		7
> > +#define RST_SM_I2CM0PRST	8
> > +#define RST_SM_I2CM0SRST	9
> > +#define RST_SM_I2CM1PRST	10
> > +#define RST_SM_I2CM1SRST	11
> > +#define RST_SM_I3CPRST		12
> > +#define RST_SM_I3CSRST		13
> > +#define RST_SM_PDMPRST		14
> > +#define RST_SM_PDMSRST		15
> > +#define RST_SM_PVTHSRST		16
> > +#define RST_SM_PVTPRST		17
> > +#define RST_SM_PWMPERIRST	18
> > +#define RST_SM_PWMPRST		19
> > +#define RST_SM_SPIMPRST		20
> > +#define RST_SM_SPIMSRST		21
> > +#define RST_SM_SPISPRST		22
> > +#define RST_SM_SPISSRST		23
> > +#define RST_SM_UART0PRST	24
> > +#define RST_SM_UART0SRST	25
> > +#define RST_SM_UART1PRST	26
> > +#define RST_SM_UART1SRST	27
> > +#define RST_SM_UART2PRST	28
> > +#define RST_SM_UART2SRST	29
> > +#define RST_SM_UART3PRST	30
> > +#define RST_SM_UART3SRST	31
> > +
> > +#endif /* _DT_BINDINGS_SL261X_RESET_H */
> > -- 
> > 2.53.0
> > 



