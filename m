Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 02627C3ABCC
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 12 May 2025 16:55:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=DkRgW7e0QdD7J6wFeWQPqFYapV51VCgMtlZzL5iTo6o=; b=cqn45k7Ep5ouz9d6WNTYwS19lN
	U8cjJHwuuAq+D5R+3043IxWaxxv9xxsXeMKvIPqv1OUMHBRkzlKNXTk+vKnmYHgiEqa07tPuMPcz8
	Poi04gDKaNOjuydYnzSuTMY2cvuOu2/T3JfaYcK/4aaSoFiyjySgbwSQJ9fI+cAW3pDlMTj3c+pIU
	Mh6sWp773Xil9XZ5ACoq1XI7KlV99LOZ2IPni83uUOE7giey0OeyB3qyLxDTswQCueSZZJUoEP9Z9
	dfYo+P33sJroAijJfixaRrNLWtUNKycdMgmht/J5hU+9lK+7zMdQBknkiI8C7topL278YXm4v0K4x
	7DDcWgJA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uEWR3-0000000A8B8-2sS4;
	Mon, 12 May 2025 16:55:25 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uEWCa-0000000A533-1Xpk
	for linux-arm-kernel@lists.infradead.org;
	Mon, 12 May 2025 16:40:28 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id C1437629D1;
	Mon, 12 May 2025 16:40:27 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3A356C4CEE7;
	Mon, 12 May 2025 16:40:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1747068027;
	bh=6tcoJxQNycyS+g+UuadukNx5hqQX0eM1s0P5TP7QSpU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=NmyYf+UTzTUMyJDclwm9Ra8k0Vriwlze7yPBcvq/W4d4jQNjgwbz6C6z9RkxsfCct
	 owjG9TO+GLMSpIeCLcCmV5Zv5ZCJFcmB8PE7TDHxqW4ZVr5wo8S6dE8qzqPb9sFptK
	 RLk0YrbmJYZWjicM8Kcoqc91EyxrN5VD2JNu9xsCgPapu9zpMl4Pio9E/2DYKNKNfo
	 wwdjaMZteB5o1I7hWPGDWKiH2U1KpdMr0pFZSERvdhxoKDGcfj6KLsZS371rnAIPRS
	 ayFTAgV5wRwtR9wwHybcCqKU+X92fGrR4/tFFU6ICJbZczo0ypwXUKk7QKECwJNNrT
	 vbsMPzcjNGWCw==
Date: Mon, 12 May 2025 11:40:25 -0500
From: Rob Herring <robh@kernel.org>
To: Lukasz Majewski <lukma@denx.de>
Cc: Andrew Lunn <andrew+netdev@lunn.ch>, davem@davemloft.net,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Richard Cochran <richardcochran@gmail.com>, netdev@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	Stefan Wahren <wahrenst@gmx.net>, Simon Horman <horms@kernel.org>
Subject: Re: [net-next v11 1/7] dt-bindings: net: Add MTIP L2 switch
 description
Message-ID: <20250512164025.GA3454904-robh@kernel.org>
References: <20250504145538.3881294-1-lukma@denx.de>
 <20250504145538.3881294-2-lukma@denx.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250504145538.3881294-2-lukma@denx.de>
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

On Sun, May 04, 2025 at 04:55:32PM +0200, Lukasz Majewski wrote:
> This patch provides description of the MTIP L2 switch available in some
> NXP's SOCs - e.g. imx287.
> 
> Signed-off-by: Lukasz Majewski <lukma@denx.de>
> Reviewed-by: Stefan Wahren <wahrenst@gmx.net>
> 
> ---
> Changes for v2:
> - Rename the file to match exactly the compatible
>   (nxp,imx287-mtip-switch)
> 
> Changes for v3:
> - Remove '-' from const:'nxp,imx287-mtip-switch'
> - Use '^port@[12]+$' for port patternProperties
> - Drop status = "okay";
> - Provide proper indentation for 'example' binding (replace 8
>   spaces with 4 spaces)
> - Remove smsc,disable-energy-detect; property
> - Remove interrupt-parent and interrupts properties as not required
> - Remove #address-cells and #size-cells from required properties check
> - remove description from reg:
> - Add $ref: ethernet-switch.yaml#
> 
> Changes for v4:
> - Use $ref: ethernet-switch.yaml#/$defs/ethernet-ports and remove already
>   referenced properties
> - Rename file to nxp,imx28-mtip-switch.yaml
> 
> Changes for v5:
> - Provide proper description for 'ethernet-port' node
> 
> Changes for v6:
> - Proper usage of
>   $ref: ethernet-switch.yaml#/$defs/ethernet-ports/patternProperties
>   when specifying the 'ethernet-ports' property
> - Add description and check for interrupt-names property
> 
> Changes for v7:
> - Change switch interrupt name from 'mtipl2sw' to 'enet_switch'
> 
> Changes for v8:
> - None
> 
> Changes for v9:
> - Add GPIO_ACTIVE_LOW to reset-gpios mdio phandle
> 
> Changes for v10:
> - None
> 
> Changes for v11:
> - None
> ---
>  .../bindings/net/nxp,imx28-mtip-switch.yaml   | 149 ++++++++++++++++++
>  1 file changed, 149 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/net/nxp,imx28-mtip-switch.yaml
> 
> diff --git a/Documentation/devicetree/bindings/net/nxp,imx28-mtip-switch.yaml b/Documentation/devicetree/bindings/net/nxp,imx28-mtip-switch.yaml
> new file mode 100644
> index 000000000000..35f1fe268de7
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/net/nxp,imx28-mtip-switch.yaml
> @@ -0,0 +1,149 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/net/nxp,imx28-mtip-switch.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: NXP SoC Ethernet Switch Controller (L2 MoreThanIP switch)
> +
> +maintainers:
> +  - Lukasz Majewski <lukma@denx.de>
> +
> +description:
> +  The 2-port switch ethernet subsystem provides ethernet packet (L2)
> +  communication and can be configured as an ethernet switch. It provides the
> +  reduced media independent interface (RMII), the management data input
> +  output (MDIO) for physical layer device (PHY) management.
> +
> +properties:
> +  compatible:
> +    const: nxp,imx28-mtip-switch
> +
> +  reg:
> +    maxItems: 1
> +
> +  phy-supply:
> +    description:
> +      Regulator that powers Ethernet PHYs.
> +
> +  clocks:
> +    items:
> +      - description: Register accessing clock
> +      - description: Bus access clock
> +      - description: Output clock for external device - e.g. PHY source clock
> +      - description: IEEE1588 timer clock
> +
> +  clock-names:
> +    items:
> +      - const: ipg
> +      - const: ahb
> +      - const: enet_out
> +      - const: ptp
> +
> +  interrupts:
> +    items:
> +      - description: Switch interrupt
> +      - description: ENET0 interrupt
> +      - description: ENET1 interrupt
> +
> +  interrupt-names:
> +    items:
> +      - const: enet_switch
> +      - const: enet0
> +      - const: enet1
> +
> +  pinctrl-names: true
> +
> +  ethernet-ports:
> +    type: object
> +    $ref: ethernet-switch.yaml#/$defs/ethernet-ports/patternProperties

'patternProperties' is wrong. Drop.

> +    additionalProperties: true

Drop.

> +
> +    patternProperties:
> +      '^ethernet-port@[12]$':
> +        type: object
> +        additionalProperties: true
> +        properties:
> +          reg:
> +            items:
> +              - enum: [1, 2]
> +            description: MTIP L2 switch port number
> +
> +        required:
> +          - reg
> +          - label

'label' shouldn't ever be required because s/w shouldn't care what the 
value is.

> +          - phy-mode
> +          - phy-handle
> +
> +  mdio:
> +    type: object
> +    $ref: mdio.yaml#
> +    unevaluatedProperties: false
> +    description:
> +      Specifies the mdio bus in the switch, used as a container for phy nodes.
> +
> +required:
> +  - compatible
> +  - reg
> +  - clocks
> +  - clock-names
> +  - interrupts
> +  - interrupt-names
> +  - mdio
> +  - ethernet-ports
> +
> +unevaluatedProperties: false
> +
> +examples:
> +  - |
> +    #include<dt-bindings/interrupt-controller/irq.h>
> +    #include<dt-bindings/gpio/gpio.h>
> +    switch@800f0000 {
> +        compatible = "nxp,imx28-mtip-switch";
> +        reg = <0x800f0000 0x20000>;
> +        pinctrl-names = "default";
> +        pinctrl-0 = <&mac0_pins_a>, <&mac1_pins_a>;
> +        phy-supply = <&reg_fec_3v3>;
> +        interrupts = <100>, <101>, <102>;
> +        interrupt-names = "enet_switch", "enet0", "enet1";
> +        clocks = <&clks 57>, <&clks 57>, <&clks 64>, <&clks 35>;
> +        clock-names = "ipg", "ahb", "enet_out", "ptp";
> +
> +        ethernet-ports {
> +            #address-cells = <1>;
> +            #size-cells = <0>;
> +
> +            mtip_port1: ethernet-port@1 {
> +                reg = <1>;
> +                label = "lan0";
> +                local-mac-address = [ 00 00 00 00 00 00 ];
> +                phy-mode = "rmii";
> +                phy-handle = <&ethphy0>;
> +            };
> +
> +            mtip_port2: ethernet-port@2 {
> +                reg = <2>;
> +                label = "lan1";
> +                local-mac-address = [ 00 00 00 00 00 00 ];
> +                phy-mode = "rmii";
> +                phy-handle = <&ethphy1>;
> +            };
> +        };
> +
> +        mdio_sw: mdio {
> +            #address-cells = <1>;
> +            #size-cells = <0>;
> +
> +            reset-gpios = <&gpio2 13 GPIO_ACTIVE_LOW>;
> +            reset-delay-us = <25000>;
> +            reset-post-delay-us = <10000>;
> +
> +            ethphy0: ethernet-phy@0 {
> +                reg = <0>;
> +            };
> +
> +            ethphy1: ethernet-phy@1 {
> +                reg = <1>;
> +            };
> +        };
> +    };
> -- 
> 2.39.5
> 

