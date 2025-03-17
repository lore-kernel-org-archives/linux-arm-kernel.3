Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B1014C282EC
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 17 Mar 2025 14:46:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=tc5fmW49DrIEHDEe+iWLNAYvhS+sEljANBQpTnG0J8I=; b=CpF9xWur3TSgaI3z1R0gsUY6hC
	L9PmvCJlyYsE8y+uM+CE6P5b8JIgbfPRK7hQi7YRkogrISqy2FDyrcxPdhWnJGlBU6oHZ34D0DD+S
	9yJcqrCsPQ8fyfvUXI//aU2drPEYJoQkP6htDMpvDGsB0HyEaKHKPeyHw4+61HaTY6VrjT1y6ZivM
	4JSypE5xxq/K0KNtj1Qz9LvZMe/nZPjvQyAfw1HjNeuWFpMkkyy1I9yMjPOPXxq4XO9G6gkvaiOMP
	v9vO6P8x9n91qtj39ytMz+c0epcND7ifZ8ecX8LeaeXAVAQUr4TlaVyCUxCn722h00HyjPtMclb9n
	2GVSGkSA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tuBj2-000000031Cp-3OCM;
	Mon, 17 Mar 2025 14:45:56 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tuBSF-00000002wsH-1sb8;
	Mon, 17 Mar 2025 14:28:36 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 07D7FA4419F;
	Mon, 17 Mar 2025 14:23:05 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 13C08C4CEE3;
	Mon, 17 Mar 2025 14:28:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1742221714;
	bh=icj7nB3bxRTzLn+Ln71aWFZgRw7kuWe4zA5Mo+qp1Wg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=M67Ms5tRtJqZNjr4HpbUvBavc5Q4oDs6jmFypIre7oRXBHxSlAr+Ij/96AkfPIy/k
	 x3XKqTWIt5StT89G2yFALXMp5n0Dc2R9d1XGVmIYjb8obSfGtSL9i5zA8rIbfwo86j
	 Hn3twjfJj7Lw4RRZyu7iC4/sPmt8VFW26lvCec+S3Qqy+DafKkfinjfO+E6iAXte1H
	 w+06FBgdTb+o42RcpsUV2/jVRV3RE0mvvBIqVls1VFsRXhpIzNwBW/qbSuE4pyUyf1
	 OEd6vE30XljVHM23pWPS1rZpl/UJpX8OyVtdeiP0tZHCPLt0oC6A1AMkT5ogO+2g/D
	 kFhsg8FMePZbA==
Date: Mon, 17 Mar 2025 09:28:32 -0500
From: Rob Herring <robh@kernel.org>
To: Christian Marangi <ansuelsmth@gmail.com>
Cc: Lee Jones <lee@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Vladimir Oltean <olteanv@gmail.com>,
	Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
	Heiner Kallweit <hkallweit1@gmail.com>,
	Russell King <linux@armlinux.org.uk>,
	Maxime Chevallier <maxime.chevallier@bootlin.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org, netdev@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	upstream@airoha.com
Subject: Re: [net-next PATCH v13 05/14] dt-bindings: mfd: Document support
 for Airoha AN8855 Switch SoC
Message-ID: <20250317142832.GA4116523-robh@kernel.org>
References: <20250315154407.26304-1-ansuelsmth@gmail.com>
 <20250315154407.26304-6-ansuelsmth@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250315154407.26304-6-ansuelsmth@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250317_072835_624544_EB41CF98 
X-CRM114-Status: GOOD (  20.25  )
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

On Sat, Mar 15, 2025 at 04:43:45PM +0100, Christian Marangi wrote:
> Document support for Airoha AN8855 Switch SoC. This SoC expose various
> peripherals like an Ethernet Switch, a NVMEM provider and Ethernet PHYs.
> 
> It does also support i2c and timers but those are not currently
> supported/used.
> 
> Signed-off-by: Christian Marangi <ansuelsmth@gmail.com>
> ---
>  .../bindings/mfd/airoha,an8855.yaml           | 182 ++++++++++++++++++
>  MAINTAINERS                                   |   1 +
>  2 files changed, 183 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/mfd/airoha,an8855.yaml
> 
> diff --git a/Documentation/devicetree/bindings/mfd/airoha,an8855.yaml b/Documentation/devicetree/bindings/mfd/airoha,an8855.yaml
> new file mode 100644
> index 000000000000..a59a23056b3a
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/mfd/airoha,an8855.yaml
> @@ -0,0 +1,182 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/mfd/airoha,an8855.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Airoha AN8855 Switch SoC
> +
> +maintainers:
> +  - Christian Marangi <ansuelsmth@gmail.com>
> +
> +description: >
> +  Airoha AN8855 Switch is a SoC that expose various peripherals like an
> +  Ethernet Switch, a NVMEM provider and Ethernet PHYs.
> +
> +  It does also support i2c and timers but those are not currently
> +  supported/used.
> +
> +properties:
> +  compatible:
> +    const: airoha,an8855
> +
> +  reg:
> +    maxItems: 1
> +
> +  reset-gpios: true
> +
> +  efuse:
> +    type: object
> +    $ref: /schemas/nvmem/airoha,an8855-efuse.yaml
> +    description:
> +      EFUSE exposed by the Airoha AN8855 Switch. This child node definition
> +      should follow the bindings specified in
> +      Documentation/devicetree/bindings/nvmem/airoha,an8855-efuse.yaml

No need to list the schema twice. Drop the 2nd sentence.

> +
> +  ethernet-switch:
> +    type: object
> +    $ref: /schemas/net/dsa/airoha,an8855-switch.yaml
> +    description:
> +      Switch exposed by the Airoha AN8855 Switch. This child node definition
> +      should follow the bindings specified in
> +      Documentation/devicetree/bindings/net/dsa/airoha,an8855-switch.yaml

ditto

> +
> +  mdio:
> +    type: object
> +    $ref: /schemas/net/airoha,an8855-mdio.yaml
> +    description:
> +      MDIO exposed by the Airoha AN8855 Switch. This child node definition
> +      should follow the bindings specified in
> +      Documentation/devicetree/bindings/net/airoha,an8855-mdio.yaml

ditto

> +
> +required:
> +  - compatible
> +  - reg

The child nodes are optional?

> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    #include <dt-bindings/gpio/gpio.h>
> +
> +    mdio {
> +        #address-cells = <1>;
> +        #size-cells = <0>;
> +
> +        soc@1 {
> +            compatible = "airoha,an8855";
> +            reg = <1>;
> +
> +            reset-gpios = <&pio 39 0>;
> +
> +            efuse {
> +                compatible = "airoha,an8855-efuse";
> +
> +                #nvmem-cell-cells = <0>;
> +
> +                nvmem-layout {
> +                    compatible = "fixed-layout";
> +                    #address-cells = <1>;
> +                    #size-cells = <1>;
> +
> +                    shift_sel_port0_tx_a: shift-sel-port0-tx-a@c {
> +                       reg = <0xc 0x4>;
> +                    };
> +
> +                    shift_sel_port0_tx_b: shift-sel-port0-tx-b@10 {
> +                        reg = <0x10 0x4>;
> +                    };
> +
> +                    shift_sel_port0_tx_c: shift-sel-port0-tx-c@14 {
> +                        reg = <0x14 0x4>;
> +                    };
> +
> +                    shift_sel_port0_tx_d: shift-sel-port0-tx-d@18 {
> +                       reg = <0x18 0x4>;
> +                    };
> +
> +                    shift_sel_port1_tx_a: shift-sel-port1-tx-a@1c {
> +                        reg = <0x1c 0x4>;
> +                    };
> +
> +                    shift_sel_port1_tx_b: shift-sel-port1-tx-b@20 {
> +                        reg = <0x20 0x4>;
> +                    };
> +
> +                    shift_sel_port1_tx_c: shift-sel-port1-tx-c@24 {
> +                       reg = <0x24 0x4>;
> +                    };
> +
> +                    shift_sel_port1_tx_d: shift-sel-port1-tx-d@28 {
> +                        reg = <0x28 0x4>;
> +                    };
> +                };
> +            };
> +
> +            ethernet-switch {
> +                compatible = "airoha,an8855-switch";
> +
> +                ports {
> +                    #address-cells = <1>;
> +                    #size-cells = <0>;
> +
> +                    port@0 {
> +                        reg = <0>;
> +                        label = "lan1";
> +                        phy-mode = "internal";
> +                        phy-handle = <&internal_phy1>;
> +                    };
> +
> +                    port@1 {
> +                        reg = <1>;
> +                        label = "lan2";
> +                        phy-mode = "internal";
> +                        phy-handle = <&internal_phy2>;
> +                    };
> +
> +                    port@5 {
> +                        reg = <5>;
> +                        label = "cpu";
> +                        ethernet = <&gmac0>;
> +                        phy-mode = "2500base-x";
> +
> +                        fixed-link {
> +                            speed = <2500>;
> +                            full-duplex;
> +                            pause;
> +                        };
> +                    };
> +                };
> +            };
> +
> +            mdio {
> +                compatible = "airoha,an8855-mdio";
> +                #address-cells = <1>;
> +                #size-cells = <0>;
> +
> +                internal_phy1: phy@1 {
> +                  compatible = "ethernet-phy-idc0ff.0410",
> +                               "ethernet-phy-ieee802.3-c45";
> +                  reg = <1>;
> +
> +                  nvmem-cells = <&shift_sel_port0_tx_a>,
> +                      <&shift_sel_port0_tx_b>,
> +                      <&shift_sel_port0_tx_c>,
> +                      <&shift_sel_port0_tx_d>;
> +                  nvmem-cell-names = "tx_a", "tx_b", "tx_c", "tx_d";
> +                };
> +
> +                internal_phy2: phy@2 {
> +                  compatible = "ethernet-phy-idc0ff.0410",
> +                               "ethernet-phy-ieee802.3-c45";
> +                  reg = <2>;
> +
> +                  nvmem-cells = <&shift_sel_port1_tx_a>,
> +                      <&shift_sel_port1_tx_b>,
> +                      <&shift_sel_port1_tx_c>,
> +                      <&shift_sel_port1_tx_d>;
> +                  nvmem-cell-names = "tx_a", "tx_b", "tx_c", "tx_d";
> +                };
> +            };
> +        };
> +    };
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 45f4bb8deb0d..65709e47adc7 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -725,6 +725,7 @@ L:	linux-arm-kernel@lists.infradead.org (moderated for non-subscribers)
>  L:	linux-mediatek@lists.infradead.org (moderated for non-subscribers)
>  L:	netdev@vger.kernel.org
>  S:	Maintained
> +F:	Documentation/devicetree/bindings/mfd/airoha,an8855.yaml
>  F:	Documentation/devicetree/bindings/net/airoha,an8855-mdio.yaml
>  F:	Documentation/devicetree/bindings/net/airoha,an8855-phy.yaml
>  F:	Documentation/devicetree/bindings/net/dsa/airoha,an8855-switch.yaml
> -- 
> 2.48.1
> 

