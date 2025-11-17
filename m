Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 13DE4CEACEF
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 17 Nov 2025 22:14:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ph7duz5+vCtG80vKmUrpGbgZDiGtquiE1c4YwUv6FxI=; b=MFXaTeYqeTUYwhfEBfD9iAroJ2
	kHRmxoZcmnqUM89WeOOmYZQWorWF6MctQbAKgWRiCVMBGZN62/WbSBcyjv8PQZq9qkOwK7M8rkGpY
	XFEz61teVgqSpOv26bwbsqF7f3cNx+0D3/LNACiPJwv+vS/I8xZ5t1wtibXMbAqxANJvgyiwZYICw
	1AYR3gHu3ATbBak7x9qUXdX7xTPCds7nC0cc4wiV7Jkiw/PMS9+ZHoo3f2u6FOn0x7JwGenRR67/9
	BCQv6vbD7OOlbGpb0XPrnLjMGWgRb8T+mUUq7jjxoQIcdCt1W31nUcun5LHPFKB9qRhE1kbii9Igc
	6cyJgDzA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vL7U2-0000000GvuI-2m5R;
	Mon, 17 Nov 2025 22:14:02 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vL7U1-0000000Gvu9-1Utp;
	Mon, 17 Nov 2025 22:14:01 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 72402601B0;
	Mon, 17 Nov 2025 22:14:00 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 39EEEC4CEFB;
	Mon, 17 Nov 2025 22:13:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1763417640;
	bh=7Xd20imrbtGgnXJ3jPRH56ORSA3mGDUGiu8VDY8+wQg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=lI/pl0lN6EX8s9iMhr6hihgzqMq8MaevBIbaVdxbeBCszr1DXBmtkgy28tbas56y7
	 FBSRgEq9e6GtxUDy0/q80zOBM+kudxzZK60maqj0+HRQ1GPB9It3lIiyJJ2b9nJwWV
	 M86UA5cgtRag0DHuXtiRgN5EMZQ5L4j34Fc+I8fZmQ+PpGh6pPkDXNX5wWGrlKyiAA
	 vGVJC+PBnAv8+iuFUIbFc5rRFKi7wT/U4XA+t4dNdRyCCVHYnnLHU5FRe5CyByxrph
	 Orr77XGG9naWfY2a45e4BdsX/smNf/REhy0VCvYfP+3Y5hLoTA5QlO97a3iIvqKw6c
	 XaRQPx3EfSBvg==
Date: Mon, 17 Nov 2025 16:13:57 -0600
From: Rob Herring <robh@kernel.org>
To: Jacky Chou <jacky_chou@aspeedtech.com>
Cc: Vinod Koul <vkoul@kernel.org>,
	Kishon Vijay Abraham I <kishon@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Joel Stanley <joel@jms.id.au>,
	Andrew Jeffery <andrew@codeconstruct.com.au>,
	Bjorn Helgaas <bhelgaas@google.com>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
	Manivannan Sadhasivam <mani@kernel.org>,
	Linus Walleij <linus.walleij@linaro.org>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	linux-aspeed@lists.ozlabs.org, linux-pci@vger.kernel.org,
	linux-phy@lists.infradead.org, devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	Andrew Jeffery <andrew@aj.id.au>, openbmc@lists.ozlabs.org,
	linux-gpio@vger.kernel.org
Subject: Re: [PATCH v5 2/8] dt-bindings: PCI: Add ASPEED PCIe RC support
Message-ID: <20251117221357.GA806266-robh@kernel.org>
References: <20251117-upstream_pcie_rc-v5-0-b4a198576acf@aspeedtech.com>
 <20251117-upstream_pcie_rc-v5-2-b4a198576acf@aspeedtech.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251117-upstream_pcie_rc-v5-2-b4a198576acf@aspeedtech.com>
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

On Mon, Nov 17, 2025 at 08:37:49PM +0800, Jacky Chou wrote:
> ASPEED AST2600 provides one PCIe RC for Gen2 and AST2700 provides three
> PCIe RC for two Gen4 and one Gen2. All of these RCs have just one root
> port to connect to PCIe device. And also have Mem, I/O access, legacy
> interrupt and MSI.
> 
> Signed-off-by: Jacky Chou <jacky_chou@aspeedtech.com>
> ---
>  .../bindings/pci/aspeed,ast2600-pcie.yaml          | 149 +++++++++++++++++++++
>  1 file changed, 149 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/pci/aspeed,ast2600-pcie.yaml b/Documentation/devicetree/bindings/pci/aspeed,ast2600-pcie.yaml
> new file mode 100644
> index 000000000000..459b5c49657a
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/pci/aspeed,ast2600-pcie.yaml
> @@ -0,0 +1,149 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/pci/aspeed,ast2600-pcie.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: ASPEED PCIe Root Complex Controller
> +
> +maintainers:
> +  - Jacky Chou <jacky_chou@aspeedtech.com>
> +
> +description:
> +  The ASPEED PCIe Root Complex controller provides PCI Express Root Complex
> +  functionality for ASPEED SoCs, such as the AST2600 and AST2700.
> +  This controller enables connectivity to PCIe endpoint devices, supporting
> +  memory and I/O windows, MSI and INTx interrupts, and integration with
> +  the SoC's clock, reset, and pinctrl subsystems. On AST2600, the PCIe Root
> +  Port device number is always 8.
> +
> +properties:
> +  compatible:
> +    enum:
> +      - aspeed,ast2600-pcie
> +      - aspeed,ast2700-pcie
> +
> +  reg:
> +    maxItems: 1
> +
> +  ranges:
> +    minItems: 2
> +    maxItems: 2
> +
> +  interrupts:
> +    maxItems: 1
> +    description: INTx and MSI interrupt
> +
> +  resets:
> +    items:
> +      - description: PCIe controller reset
> +
> +  reset-names:
> +    items:
> +      - const: h2x
> +
> +  aspeed,ahbc:
> +    $ref: /schemas/types.yaml#/definitions/phandle
> +    description:
> +      Phandle to the ASPEED AHB Controller (AHBC) syscon node.
> +      This reference is used by the PCIe controller to access
> +      system-level configuration registers related to the AHB bus.
> +      To enable AHB access for the PCIe controller.
> +
> +  aspeed,pciecfg:
> +    $ref: /schemas/types.yaml#/definitions/phandle
> +    description:
> +      Phandle to the ASPEED PCIe configuration syscon node.
> +      This reference allows the PCIe controller to access
> +      SoC-specific PCIe configuration registers. There are the others
> +      functions such PCIe RC and PCIe EP will use this common register
> +      to configure the SoC interfaces.
> +
> +  interrupt-controller: true
> +
> +allOf:
> +  - $ref: /schemas/pci/pci-host-bridge.yaml#
> +  - $ref: /schemas/interrupt-controller/msi-controller.yaml#
> +  - if:
> +      properties:
> +        compatible:
> +          contains:
> +            const: aspeed,ast2600-pcie
> +    then:
> +      required:
> +        - aspeed,ahbc
> +    else:
> +      properties:
> +        aspeed,ahbc: false
> +  - if:
> +      properties:
> +        compatible:
> +          contains:
> +            const: aspeed,ast2700-pcie
> +    then:
> +      required:
> +        - aspeed,pciecfg
> +    else:
> +      properties:
> +        aspeed,pciecfg: false
> +
> +required:
> +  - reg
> +  - interrupts
> +  - bus-range
> +  - ranges
> +  - resets
> +  - reset-names
> +  - msi-controller
> +  - interrupt-controller
> +  - interrupt-map-mask
> +  - interrupt-map
> +
> +unevaluatedProperties: false
> +
> +examples:
> +  - |
> +    #include <dt-bindings/interrupt-controller/arm-gic.h>
> +    #include <dt-bindings/clock/ast2600-clock.h>
> +
> +    pcie0: pcie@1e770000 {
> +      compatible = "aspeed,ast2600-pcie";
> +      device_type = "pci";
> +      reg = <0x1e770000 0x100>;
> +      #address-cells = <3>;
> +      #size-cells = <2>;
> +      interrupts = <GIC_SPI 168 IRQ_TYPE_LEVEL_HIGH>;
> +      bus-range = <0x00 0xff>;
> +
> +      ranges = <0x01000000 0x0 0x00018000 0x00018000 0x0 0x00008000
> +                0x02000000 0x0 0x60000000 0x60000000 0x0 0x20000000>;
> +
> +      resets = <&syscon ASPEED_RESET_H2X>;
> +      reset-names = "h2x";
> +
> +      #interrupt-cells = <1>;
> +      msi-controller;
> +
> +      aspeed,ahbc = <&ahbc>;
> +
> +      interrupt-controller;
> +      interrupt-map-mask = <0 0 0 7>;
> +      interrupt-map = <0 0 0 1 &pcie0 0>,
> +                      <0 0 0 2 &pcie0 1>,
> +                      <0 0 0 3 &pcie0 2>,
> +                      <0 0 0 4 &pcie0 3>;
> +
> +      pcie@8,0 {

This node and the properties need to be in the schema along with a ref 
to pci-pci-bridge.yaml.

> +        reg = <0x804000 0 0 0 0>;

The address should not have the bus number as it is dynamic.

> +        #address-cells = <3>;
> +        #size-cells = <2>;
> +        device_type = "pci";
> +        resets = <&syscon ASPEED_RESET_PCIE_RC_O>;
> +        reset-names = "perst";

Not sure this name is correct. PERST is a signal on the connector going 
downstream to the endpoint.

> +        clocks = <&syscon ASPEED_CLK_GATE_BCLK>;
> +        pinctrl-names = "default";
> +        pinctrl-0 = <&pinctrl_pcierc1_default>;
> +        phys = <&pcie_phy1>;
> +        ranges;
> +      };
> +    };
> 
> -- 
> 2.34.1
> 

