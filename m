Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 55FF5CE8E8B
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 24 Oct 2024 15:41:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=W3uQQB7e6vA64fR4D2xbg8mQGZa/M0qxBwIFoh7VKto=; b=QuBDgQdOJxjCS1I3CocwK/0Ocp
	xf82EAsaLLJGUMI9UK44No3qTCf/pENhlIlolP1ixkin47R5teybOdu8GssQUicsFLa9utlHbyzq2
	m8aPEQ7ZCCKZjUlWqSqVs5Dda+O3EyG7mPZw2lSuKiPdNfueEsu4zlX1OJ3hjfqYz9/6zF/sfFQwl
	9Ch1g5GpIVOKcmgFXwSP19apazqilkN3NsbGGIhXe5l7QbhZqzm0mwnKjFFN2FKAJ6hRnaL+mfRpB
	5qC2JWwMSRe3BXoD4L+sZGbgHxtM+Yd61VKK5Ha0uijSNhLm+ovt5gU7GslJRF3x7qeMnZ8FZY3+H
	7W9lqr2w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t3zxp-00000000x4s-2wdX;
	Thu, 24 Oct 2024 15:41:29 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t3zgC-00000000toQ-3v7I;
	Thu, 24 Oct 2024 15:23:17 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=W3uQQB7e6vA64fR4D2xbg8mQGZa/M0qxBwIFoh7VKto=; b=OKkGKIaxXHMDQ1maY3CDc3I0/x
	SY3EjCIsZ2cQZpAWogyhCltY4Wiu81XZ9kQSo8cQRKKx6NulxuWd6keNq27CeBoQEoaos5C9w73FZ
	BDH218OaXSvBEwLzusG25cQkTD5aYb3PoIlgZscdL57p4C3wKiovZf75E045Vql8a3nzrtr28DFMR
	R/3S33UHrEQgJ/d22ff1pSwiZL/3D80TyaAEB1npYqNhuFWVai/0NFZS29Ypisge/R2b/Pc5TTAQ2
	CoTZ84z8/o+ZALMC82tohPYjkymuHFURw7omONjcK635PXxra4/ML+Ymc1NMnZ5B1ARDdUSDB6U+G
	dzkWI/lA==;
Received: from dfw.source.kernel.org ([139.178.84.217])
	by desiato.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t3zg8-00000008hb1-3oSY;
	Thu, 24 Oct 2024 15:23:15 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id D119B5C598E;
	Thu, 24 Oct 2024 15:23:01 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0930FC4CEC7;
	Thu, 24 Oct 2024 15:23:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1729783386;
	bh=xEjMAQfA1uXRN9RJu6qq9b5+SQpN/LVbFyfZ/9OTh98=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=rmOqeuJFEcIDXrWqUn2exb+M6Et8L2ku5O276TBDc7BgtWVRzk1YXHnehvu5y21jb
	 66s9AE6hCn4fzrn+98UZAocCil89+KMtPjMckI2QZ21Vw0faU4kCd8ncZ2f8XA+jt4
	 mfX4UIj3S4frOSw0s6bj/qab7dQvQE2X/CFGZuvG6wNvCgiqk3Md+zwfxnUVZKysEh
	 WhB5AKERRRbJdU/ttIGElyNmaiHQBYxzUpjOqn81BR/xUUM/qic7mRiMepk9jstQc5
	 ytcXhjRjp90+mVtBVH/MlqMiVNoTgCQt5T3hiVWnB52tB/KzLofDB8dK066C5W6x4T
	 VCyNiWmzyrXgg==
Date: Thu, 24 Oct 2024 10:23:05 -0500
From: Rob Herring <robh@kernel.org>
To: Christian Marangi <ansuelsmth@gmail.com>
Cc: Andrew Lunn <andrew@lunn.ch>, Florian Fainelli <f.fainelli@gmail.com>,
	Vladimir Oltean <olteanv@gmail.com>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Heiner Kallweit <hkallweit1@gmail.com>,
	Russell King <linux@armlinux.org.uk>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org, netdev@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [net-next RFC PATCH v2 1/3] dt-bindings: net: dsa: Add Airoha
 AN8855 Gigabit Switch documentation
Message-ID: <20241024152305.GA550738-robh@kernel.org>
References: <20241023161958.12056-1-ansuelsmth@gmail.com>
 <20241023161958.12056-2-ansuelsmth@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241023161958.12056-2-ansuelsmth@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241024_162313_949136_D8209A61 
X-CRM114-Status: GOOD (  27.29  )
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

On Wed, Oct 23, 2024 at 06:19:50PM +0200, Christian Marangi wrote:
> Add Airoha AN8855 5 port Gigabit Switch documentation.
> 
> The switch node requires an additional mdio node to describe each internal
> PHY relative offset as the PHY address for the switch match the one for
> the PHY ports. On top of internal PHY address, the switch base PHY address
> is added.
> 
> Also the switch base PHY address can be configured and changed after the
> first initialization. On reset, the switch PHY address is ALWAYS 1.
> This can be configured with the use of "airoha,base_smi_address".
> 
> Calibration values might be stored in switch EFUSE and internal PHY
> might need to be calibrated, in such case, airoha,ext_surge needs to be
> enabled and relative NVMEM cells needs to be defined in nvmem-layout
> node.
> 
> Signed-off-by: Christian Marangi <ansuelsmth@gmail.com>
> ---
>  .../bindings/net/dsa/airoha,an8855.yaml       | 253 ++++++++++++++++++
>  1 file changed, 253 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/net/dsa/airoha,an8855.yaml
> 
> diff --git a/Documentation/devicetree/bindings/net/dsa/airoha,an8855.yaml b/Documentation/devicetree/bindings/net/dsa/airoha,an8855.yaml
> new file mode 100644
> index 000000000000..5982b4c39536
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/net/dsa/airoha,an8855.yaml
> @@ -0,0 +1,253 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/net/dsa/airoha,an8855.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Airoha AN8855 Gigabit switch
> +
> +maintainers:
> +  - Christian Marangi <ansuelsmth@gmail.com>
> +
> +description:

You need '>' to preserve paragraphs.

> +  Airoha AN8855 is a 5-port Gigabit Switch.
> +
> +  The switch node requires an additional mdio node to describe each internal
> +  PHY relative offset as the PHY address for the switch match the one for
> +  the PHY ports. On top of internal PHY address, the switch base PHY address
> +  is added.
> +
> +  Also the switch base PHY address can be configured and changed after the
> +  first initialization. On reset, the switch PHY address is ALWAYS 1.
> +
> +properties:
> +  compatible:
> +    const: airoha,an8855
> +
> +  reg:
> +    maxItems: 1
> +
> +  reset-gpios:
> +    description:
> +      GPIO to be used to reset the whole device
> +    maxItems: 1
> +
> +  airoha,base_smi_address:

s/_/-/

> +    $ref: /schemas/types.yaml#/definitions/uint32
> +    description:
> +      Configure and change the base switch PHY address to a new address on
> +      the bus.
> +      On reset, the switch PHY address is ALWAYS 1.

The paragraphs here won't be maintained without '>' and a blank line in 
between.

Or just move the 2nd sentence up to follow the first one.

> +    default: 1
> +    maximum: 31
> +
> +  airoha,ext_surge:

ditto.

> +    $ref: /schemas/types.yaml#/definitions/flag
> +    description:
> +      Calibrate the internal PHY with the calibration values stored in EFUSE
> +      for the r50Ohm values.
> +
> +  '#nvmem-cell-cells':
> +    const: 0
> +
> +  nvmem-layout:
> +    $ref: /schemas/nvmem/layouts/nvmem-layout.yaml
> +    description:
> +      NVMEM Layout for exposed EFUSE. (for example to propagate calibration
> +      value for r50Ohm for internal PHYs)
> +
> +  mdio:
> +    $ref: /schemas/net/mdio.yaml#
> +    unevaluatedProperties: false
> +    description:
> +      Define the relative address of the internal PHY for each port.
> +
> +      Each reg for the PHY is relative to the switch base PHY address.
> +
> +$ref: dsa.yaml#
> +
> +required:
> +  - compatible
> +  - reg
> +
> +unevaluatedProperties: false
> +
> +examples:
> +  - |
> +    #include <dt-bindings/gpio/gpio.h>
> +
> +    mdio {
> +        #address-cells = <1>;
> +        #size-cells = <0>;
> +
> +        switch@1 {
> +            compatible = "airoha,an8855";
> +            reg = <1>;
> +            reset-gpios = <&pio 39 0>;
> +
> +            airoha,ext_surge;
> +
> +            #nvmem-cell-cells = <0>;
> +
> +            nvmem-layout {
> +                compatible = "fixed-layout";
> +                #address-cells = <1>;
> +                #size-cells = <1>;
> +
> +                shift_sel_port0_tx_a: shift-sel-port0-tx-a@c {
> +                    reg = <0xc 0x4>;
> +                };
> +
> +                shift_sel_port0_tx_b: shift-sel-port0-tx-b@10 {
> +                    reg = <0x10 0x4>;
> +                };
> +
> +                shift_sel_port0_tx_c: shift-sel-port0-tx-c@14 {
> +                    reg = <0x14 0x4>;
> +                };
> +
> +                shift_sel_port0_tx_d: shift-sel-port0-tx-d@18 {
> +                    reg = <0x18 0x4>;
> +                };
> +
> +                shift_sel_port1_tx_a: shift-sel-port1-tx-a@1c {
> +                    reg = <0x1c 0x4>;
> +                };
> +
> +                shift_sel_port1_tx_b: shift-sel-port1-tx-b@20 {
> +                    reg = <0x20 0x4>;
> +                };
> +
> +                shift_sel_port1_tx_c: shift-sel-port1-tx-c@24 {
> +                    reg = <0x24 0x4>;
> +                };
> +
> +                shift_sel_port1_tx_d: shift-sel-port1-tx-d@28 {
> +                    reg = <0x28 0x4>;
> +                };
> +
> +                shift_sel_port2_tx_a: shift-sel-port2-tx-a@2c {
> +                    reg = <0x2c 0x4>;
> +                };
> +
> +                shift_sel_port2_tx_b: shift-sel-port2-tx-b@30 {
> +                    reg = <0x30 0x4>;
> +                };
> +
> +                shift_sel_port2_tx_c: shift-sel-port2-tx-c@34 {
> +                    reg = <0x34 0x4>;
> +                };
> +
> +                shift_sel_port2_tx_d: shift-sel-port2-tx-d@38 {
> +                    reg = <0x38 0x4>;
> +                };
> +
> +                shift_sel_port3_tx_a: shift-sel-port3-tx-a@4c {
> +                    reg = <0x4c 0x4>;
> +                };
> +
> +                shift_sel_port3_tx_b: shift-sel-port3-tx-b@50 {
> +                    reg = <0x50 0x4>;
> +                };
> +
> +                shift_sel_port3_tx_c: shift-sel-port3-tx-c@54 {
> +                    reg = <0x54 0x4>;
> +                };
> +
> +                shift_sel_port3_tx_d: shift-sel-port3-tx-d@58 {
> +                    reg = <0x58 0x4>;
> +                };
> +            };
> +
> +            ports {
> +                #address-cells = <1>;
> +                #size-cells = <0>;
> +
> +                port@0 {
> +                    reg = <0>;
> +                    label = "lan1";
> +                    phy-mode = "internal";
> +                    phy-handle = <&internal_phy0>;
> +                };
> +
> +                port@1 {
> +                    reg = <1>;
> +                    label = "lan2";
> +                    phy-mode = "internal";
> +                    phy-handle = <&internal_phy1>;
> +                };
> +
> +                port@2 {
> +                    reg = <2>;
> +                    label = "lan3";
> +                    phy-mode = "internal";
> +                    phy-handle = <&internal_phy2>;
> +                };
> +
> +                port@3 {
> +                    reg = <3>;
> +                    label = "lan4";
> +                    phy-mode = "internal";
> +                    phy-handle = <&internal_phy3>;
> +                };
> +
> +                port@5 {
> +                    reg = <5>;
> +                    label = "cpu";
> +                    ethernet = <&gmac0>;
> +                    phy-mode = "2500base-x";
> +
> +                    fixed-link {
> +                        speed = <2500>;
> +                        full-duplex;
> +                        pause;
> +                    };
> +                };
> +            };
> +
> +            mdio {
> +                #address-cells = <1>;
> +                #size-cells = <0>;
> +
> +                internal_phy0: phy@0 {
> +                    reg = <0>;
> +
> +                    nvmem-cells = <&shift_sel_port0_tx_a>,
> +                                  <&shift_sel_port0_tx_b>,
> +                                  <&shift_sel_port0_tx_c>,
> +                                  <&shift_sel_port0_tx_d>;
> +                    nvmem-cell-names = "tx_a", "tx_b", "tx_c", "tx_d";
> +                };
> +
> +                internal_phy1: phy@1 {
> +                    reg = <1>;
> +
> +                    nvmem-cells = <&shift_sel_port1_tx_a>,
> +                                  <&shift_sel_port1_tx_b>,
> +                                  <&shift_sel_port1_tx_c>,
> +                                  <&shift_sel_port1_tx_d>;
> +                    nvmem-cell-names = "tx_a", "tx_b", "tx_c", "tx_d";
> +                };
> +
> +                internal_phy2: phy@2 {
> +                    reg = <2>;
> +
> +                    nvmem-cells = <&shift_sel_port2_tx_a>,
> +                                  <&shift_sel_port2_tx_b>,
> +                                  <&shift_sel_port2_tx_c>,
> +                                  <&shift_sel_port2_tx_d>;
> +                    nvmem-cell-names = "tx_a", "tx_b", "tx_c", "tx_d";
> +                };
> +
> +                internal_phy3: phy@3 {
> +                    reg = <3>;
> +
> +                    nvmem-cells = <&shift_sel_port3_tx_a>,
> +                                  <&shift_sel_port3_tx_b>,
> +                                  <&shift_sel_port3_tx_c>,
> +                                  <&shift_sel_port3_tx_d>;
> +                    nvmem-cell-names = "tx_a", "tx_b", "tx_c", "tx_d";
> +                };
> +            };
> +        };
> +    };
> -- 
> 2.45.2
> 

