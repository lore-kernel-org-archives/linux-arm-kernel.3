Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D89F2D262B1
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 21 Jan 2026 02:19:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=LNPMICkHpK80ZUYDXem9R1s7LZRE5/0Ksubq5DqzJ6M=; b=yY14AstJzCG8jihI23RScxXpmV
	XfgPqoW7Exat6E6U9cpBcORCyk9vAIU0EYEWxux7JPJtFq+15bZTKP3Z6v1pphQhUqIBuBKguUAOV
	oc5WMGYPfh89+KESXub4j2YpOi5rqLBuZRrXhIIJy8yW2rcL55zNK2/JTOF58LYWfyicJceOfYPn8
	nbh7KronBqW5bV7Kw/FvAbtywHveS/+uogQ8fk9dhbchbM9b6MKNbZdu1D/6kboI5xAeCoAuTgnLn
	wy6Sk+ZjKClvdirn5Lpj3Lahkl1Yi9upqu5KTApaez5GyMgNutpy+ZYm4/E8sejcmZY94hCwgV0tz
	qPKVGxlA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1viNoT-00000004mDS-40T6;
	Wed, 21 Jan 2026 02:19:17 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1viNoR-00000004mCl-1VBm
	for linux-arm-kernel@lists.infradead.org;
	Wed, 21 Jan 2026 02:19:16 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 9662643891;
	Wed, 21 Jan 2026 02:19:14 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5345EC16AAE;
	Wed, 21 Jan 2026 02:19:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1768961954;
	bh=yGMEQ4ojmcfspvpRv2qKf7LcLugvHtAKNMYSBdIlZYM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=sgK4DjRvUdDyxCUmm7yH+Hn1hvBJvLmgL4p5/VvbVIgR6NaLgZ0VtZLlP5PEdx1sn
	 W7U4UWBmr/i2f9h0/aKpb6Ix8y7VSxIRx7G0b3JgV8M53LPJIkXPpha2WNI6EGwCAW
	 qgieh6bqsDoQVlhM04xqSEzcjEChC1QFgzbQSyB4N7JY9WuugWz5xLEPaYOjGWK4GB
	 1T+2r3PaLZbWbd7RMaISEZlPtjFRzBnCti6v4b3H1WM5mjCjHzahh95kiqCiOIsaR4
	 gvC4S0WmIy/xkMMe0diUuqfwW9iUac70rJQEbud+6m+Qla5k0oWE8YyNgpCP/jetGh
	 XsuvMODmHH7kA==
Date: Tue, 20 Jan 2026 20:19:13 -0600
From: Rob Herring <robh@kernel.org>
To: Khristine Andreea Barbulescu <khristineandreea.barbulescu@oss.nxp.com>
Cc: Linus Walleij <linus.walleij@linaro.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Chester Lin <chester62515@gmail.com>,
	Matthias Brugger <mbrugger@suse.com>,
	Ghennadi Procopciuc <ghennadi.procopciuc@nxp.com>,
	Larisa Grigore <larisa.grigore@nxp.com>, Lee Jones <lee@kernel.org>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Dong Aisheng <aisheng.dong@nxp.com>, Jacky Bai <ping.bai@nxp.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Alberto Ruiz <aruizrui@redhat.com>,
	Christophe Lizzi <clizzi@redhat.com>, devicetree@vger.kernel.org,
	Enric Balletbo <eballetb@redhat.com>,
	Eric Chanudet <echanude@redhat.com>, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org, NXP S32 Linux Team <s32@nxp.com>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	"Vincent Guittot devicetree @ vger . kernel . org" <vincent.guittot@linaro.org>
Subject: Re: [PATCH v8 01/10] dt-bindings: mfd: add support for the NXP SIUL2
 module
Message-ID: <20260121021913.GA1704619-robh@kernel.org>
References: <20260120115923.3463866-1-khristineandreea.barbulescu@oss.nxp.com>
 <20260120115923.3463866-2-khristineandreea.barbulescu@oss.nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260120115923.3463866-2-khristineandreea.barbulescu@oss.nxp.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260120_181915_438084_E264DA93 
X-CRM114-Status: GOOD (  29.79  )
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

On Tue, Jan 20, 2026 at 01:59:13PM +0200, Khristine Andreea Barbulescu wrote:
> From: Andrei Stefanescu <andrei.stefanescu@oss.nxp.com>
> 
> Add the new dt-bindings for the NXP SIUL2 module which is a multi
> function device. It can export information about the SoC, configure
> the pinmux&pinconf for pins and it is also a GPIO controller with
> interrupt capability.
> 
> The existing SIUL2 pinctrl bindings becomes deprecated because it
> do not correctly describe the hardware. The SIUL2 module also
> offers GPIO control and exposes some registers which contain
> information about the SoC. Adding drivers for these functionalities
> would result in incorrect bindings with a lot of carved out regions
> for registers.
> 
> SIUL2 is a complex module that spans multiple register regions
> and provides several functions: pinmux and pin configuration
> through MSCR and IMCR registers, GPIO control through PGPDO
> and PGPDI registers, interrupt configuration registers,
> and SoC identification registers (MIDR).
> These registers are grouped under two instances, SIUL2_0 and
> SIUL2_1, and share the same functional context. The legacy
> binding models SIUL2 as a standalone pinctrl node, which only
> covers MSCR and IMCR.
> 
> Signed-off-by: Andrei Stefanescu <andrei.stefanescu@oss.nxp.com>
> Signed-off-by: Khristine Andreea Barbulescu <khristineandreea.barbulescu@oss.nxp.com>
> ---
>  .../bindings/mfd/nxp,s32g2-siul2.yaml         | 165 ++++++++++++++++++
>  .../pinctrl/nxp,s32g2-siul2-pinctrl.yaml      |   2 +
>  2 files changed, 167 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/mfd/nxp,s32g2-siul2.yaml

Doesn't look like this was tested...

> 
> diff --git a/Documentation/devicetree/bindings/mfd/nxp,s32g2-siul2.yaml b/Documentation/devicetree/bindings/mfd/nxp,s32g2-siul2.yaml
> new file mode 100644
> index 000000000000..ec743cf5f73e
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/mfd/nxp,s32g2-siul2.yaml
> @@ -0,0 +1,165 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +# Copyright 2024 NXP
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/mfd/nxp,s32g2-siul2.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: NXP S32 System Integration Unit Lite2 (SIUL2)
> +
> +maintainers:
> +  - Andrei Stefanescu <andrei.stefanescu@oss.nxp.com>
> +
> +description: |
> +  SIUL2 is a hardware block which implements pinmuxing,
> +  pinconf, GPIOs (some with interrupt capability) and
> +  registers which contain information about the SoC.
> +  There are generally two SIUL2 modules whose functionality
> +  is grouped together. For example interrupt configuration
> +  registers are part of SIUL2_1 even though interrupts are
> +  also available for SIUL2_0 pins.
> +
> +  The following register types are exported by SIUL2:
> +    - MIDR (MCU ID Register) - information related to the SoC
> +    - interrupt configuration registers
> +    - MSCR (Multiplexed Signal Configuration Register) - pinmuxing and pinconf
> +    - IMCR (Input Multiplexed Signal Configuration Register)- pinmuxing
> +    - PGPDO (Parallel GPIO Pad Data Out Register) - GPIO output value
> +    - PGPDI (Parallel GPIO Pad Data In Register) - GPIO input value
> +
> +  Most registers are 32bit wide with the exception of PGPDO/PGPDI which are
> +  16bit wide.
> +
> +properties:
> +  compatible:
> +    oneOf:
> +      - const: nxp,s32g2-siul2
> +      - items:
> +          - enum:
> +              - nxp,s32g3-siul2
> +          - const: nxp,s32g2-siul2
> +
> +  gpio-controller: true
> +
> +  "#gpio-cells":
> +    const: 2
> +
> +  gpio-ranges:
> +    maxItems: 2
> +
> +  interrupts:
> +    maxItems: 1
> +
> +  interrupt-controller: true
> +
> +  "#interrupt-cells":
> +    const: 2
> +
> +  "#address-cells":
> +    const: 1
> +
> +  "#size-cells":
> +    const: 1
> +
> +  ranges:
> +    description: Address translation ranges for child nodes.
> +
> +
> +patternProperties:
> +  "^siul2_[0-1]$":

Don't use '_'.

> +    type: object
> +    description: SIUL2 hardware instances represented as syscon.
> +    properties:
> +      compatible:
> +        const: syscon

'syscon' alone is not allowed.

> +      reg:
> +        maxItems: 1

You have 'reg' so the node name should have unit-address.

However, there's not any real DT resources in this child node, so you 
should just drop it.

> +    required:
> +      - compatible
> +      - reg
> +
> +  "-hog(-[0-9]+)?$":
> +    required:
> +      - gpio-hog
> +
> +  "-pins$":
> +    type: object
> +    additionalProperties: false
> +
> +    patternProperties:
> +      "-grp[0-9]$":
> +        type: object
> +        allOf:
> +          - $ref: /schemas/pinctrl/pinmux-node.yaml#
> +          - $ref: /schemas/pinctrl/pincfg-node.yaml#
> +        description:
> +          Pinctrl node's client devices specify pin muxes using subnodes,
> +          which in turn use the standard properties below.
> +
> +        properties:
> +          pinmux:
> +            description: |
> +              An integer array for representing pinmux configurations of
> +              a device. Each integer consists of a PIN_ID and a 4-bit
> +              selected signal source(SSS) as IOMUX setting, which is
> +              calculated as: pinmux = (PIN_ID << 4 | SSS)
> +
> +          slew-rate:
> +            description: Supported slew rate based on Fmax values (MHz)
> +            enum: [83, 133, 150, 166, 208]
> +        required:
> +          - pinmux
> +
> +        unevaluatedProperties: false
> +
> +required:
> +  - compatible
> +  - gpio-controller
> +  - "#gpio-cells"
> +  - gpio-ranges
> +  - interrupts
> +  - interrupt-controller
> +  - "#interrupt-cells"
> +  - "#address-cells"
> +  - "#size-cells"
> +  - ranges
> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    #include <dt-bindings/interrupt-controller/arm-gic.h>
> +    #include <dt-bindings/interrupt-controller/irq.h>
> +
> +    pinctrl@4009c000 {
> +      compatible = "nxp,s32g2-siul2";
> +      gpio-controller;
> +      #gpio-cells = <2>;
> +      gpio-ranges = <&siul2 0 0 102>, <&siul2 112 112 79>;
> +      interrupt-controller;
> +      #interrupt-cells = <2>;
> +      interrupts = <GIC_SPI 210 IRQ_TYPE_LEVEL_HIGH>;
> +      #address-cells = <1>;
> +      #size-cells = <1>;
> +      ranges;
> +
> +      siul2_0: siul2_0@4009c000 {
> +        compatible = "syscon";
> +        reg = <0x0 0x4009c000 0x0 0x179c>;
> +      };
> +
> +      siul2_1: siul2_1@44010000 {
> +        compatible = "syscon";
> +        reg = <0x0 0x44010000 0x0 0x17b0>;
> +      };
> +
> +      jtag-pins {
> +        jtag-grp0 {
> +          pinmux = <0x0>;
> +          input-enable;
> +          bias-pull-up;
> +          slew-rate = <166>;
> +        };
> +      };
> +    };
> +...
> diff --git a/Documentation/devicetree/bindings/pinctrl/nxp,s32g2-siul2-pinctrl.yaml b/Documentation/devicetree/bindings/pinctrl/nxp,s32g2-siul2-pinctrl.yaml
> index a24286e4def6..332397a21394 100644
> --- a/Documentation/devicetree/bindings/pinctrl/nxp,s32g2-siul2-pinctrl.yaml
> +++ b/Documentation/devicetree/bindings/pinctrl/nxp,s32g2-siul2-pinctrl.yaml
> @@ -11,6 +11,8 @@ maintainers:
>    - Ghennadi Procopciuc <Ghennadi.Procopciuc@oss.nxp.com>
>    - Chester Lin <chester62515@gmail.com>
>  
> +deprecated: true
> +

I don't really see why you can't just extend this binding with GPIO and 
interrupt provider properties.

Rob

