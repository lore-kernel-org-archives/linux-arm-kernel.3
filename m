Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6F51FC88E56
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 12 Sep 2026 20:13:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=UE5bH0ObBqaZ7dEveSGaGgFsPOY86iRhftTZrAJaBUk=; b=Pa5B6zMKLuvAuCbWAruwZy7FO4
	X7Niv+US1Vk46W252QY3Zabgc620HHbAsUo3sGMUZE6hnpf8qtc2HcAzNsLk6gvZ3i9lsWWoZGqw1
	Tcgowwbjz93pFmc35nsSmBeYxDPlYJmUpzhm6t/oT8IK1s/K/KChoNFeGanGdZp2F1/AgEgHXfN5i
	GgvYrJUDVTAccTxAFu0asopEpmwzo245aQ0g7XF+MsxfW8LoyFfYyvyy0RBZgDX74Lmei/KD/NrW4
	Y15PilhwVrnpL1U30JrMF/QXtVt9jlNoYeXD6/EVF+NZk6HaMKPAU/mjVdtI9pYo9n1FgBSyA5Kum
	4Fs74eiw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x5U6g-000000018mF-1K8B;
	Sat, 12 Sep 2026 20:13:50 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x5U6I-000000018eV-3yKx;
	Sat, 12 Sep 2026 20:13:27 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id DF10B6020C;
	Sat, 12 Sep 2026 20:13:25 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C95771F00898;
	Sat, 12 Sep 2026 20:13:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789244005;
	bh=UE5bH0ObBqaZ7dEveSGaGgFsPOY86iRhftTZrAJaBUk=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=PEdrAyl0Fiw6f57sLkmOmjJjZpMDwFTzgy+EEFxO39KnWzow38fijHh0TTb7PPOa0
	 Dvsujffa6QeqsXE89Zae82JPOQ8l00jtH69WUIlr5VJdnonH8iJ0rZTG0PzBDryxyf
	 BCIttDAYUsdj8rSj97V4CxbhNVg89gwi7ZW6581LHBoE0kVs4RaO9i6DVzhOgTMW2a
	 fnTkXmyoESiS2vsbW2NeAye5D/AS/2O3efjwGcAdapOo0buHOwUq9qKNH+DnYYuIA/
	 oHhDh2s318bOoOSi2dpaEy5ilh/Gn2oC1SQpPaDaJZHGk5sJdvWv/HivWThIWgWVYK
	 nBCikZJkxUvPg==
From: Jakub Kicinski <kuba@kernel.org>
To: coiaprant@gmail.com
Cc: Jakub Kicinski <kuba@kernel.org>,
	andrew+netdev@lunn.ch,
	davem@davemloft.net,
	edumazet@google.com,
	pabeni@redhat.com,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	heiko@sntech.de,
	vkoul@kernel.org,
	maxime.chevallier@bootlin.com,
	mcoquelin.stm32@gmail.com,
	alexandre.torgue@foss.st.com,
	prabhakar.mahadev-lad.rj@bp.renesas.com,
	romain.gantois@bootlin.com,
	hkallweit1@gmail.com,
	neil.armstrong@linaro.org,
	linux@armlinux.org.uk,
	shawn.lin@rock-chips.com,
	david@ixit.cz,
	netdev@vger.kernel.org,
	linux-rockchip@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-phy@lists.infradead.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH net-next v4 04/10] dt-bindings: net: pcs: add rockchip,rk3568-xpcs support
Date: Sat, 12 Sep 2026 13:13:24 -0700
Message-ID: <20260912201324.126973-1-kuba@kernel.org>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260907153713.2572547-6-coiaprant@gmail.com>
References: <20260907153713.2572547-6-coiaprant@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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

This is an AI-generated review of your patch. The human sending this
email has considered the AI review valid, or at least plausible.
---
dt-bindings: net: pcs: add rockchip,rk3568-xpcs support

This adds a new standalone schema describing the Synopsys DesignWare XPCS
as integrated on the Rockchip RK3568, with a CSR window, csr/eee clocks, a
Naneng Combo SerDes phy, a power domain and four MII child ports.  A few
questions about the property set and the file naming below.

> diff --git a/Documentation/devicetree/bindings/net/pcs/rockchip-dwxpcs.yaml b/Documentation/devicetree/bindings/net/pcs/rockchip-dwxpcs.yaml
> new file mode 100644
> index 0000000000000..0852d0bcb66a2
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/net/pcs/rockchip-dwxpcs.yaml
> @@ -0,0 +1,110 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/net/pcs/rockchip-dwxpcs.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#

[Severity: Low]

This isn't a bug, but should the file be named after the documented
compatible, i.e. rockchip,rk3568-xpcs.yaml?  The other schemas in
Documentation/devicetree/bindings/net/pcs/ all use that form:
snps,dw-xpcs.yaml, fsl,lynx-pcs.yaml, mediatek,sgmiisys.yaml,
renesas,rzn1-miic.yaml.

A rename would also have to update the $id line above, since it encodes the
same name.

Related: the example at the bottom uses pcs@fda00000 and pcs-mii@0, while
the sibling PCS binding uses the generic ethernet-pcs@... node name, and no
$nodename constraint is added here.  The SoC dtsi added later in the series
copies the pcs@/pcs-mii@ names verbatim.

> +
> +title: Rockchip RK3568 Synopsys DesignWare Ethernet PCS

[ ... ]

> +properties:
> +  compatible:
> +    const: rockchip,rk3568-xpcs

[Severity: Low]

This isn't a bug, but would a set of SoC-specific if/then blocks in
Documentation/devicetree/bindings/net/pcs/snps,dw-xpcs.yaml be preferred
over a second schema for the same IP?

To be clear, a snps,dw-xpcs fallback compatible or a $ref to that schema
would be wrong here.  The glue driver added later in the series builds CSR
addresses with only a 3-bit MMD field:

	return FIELD_PREP(0x70000, dev) | FIELD_PREP(0xffff, reg);

and remaps the vendor MMDs in xpcs_rk_mdio_read_remapping() /
xpcs_rk_mdio_write_remapping(), so the generic direct mapping described in
snps,dw-xpcs.yaml would compute different offsets.

So the only question is where the description should live, not whether the
compatible should be shared.

> +
> +  reg:
> +    maxItems: 1

[Severity: Low]

Should the sbd_intr_o output be described as an optional interrupts
property?  With additionalProperties: false at the end of the file, a
conforming device tree cannot carry it, although adding it later stays
backward compatible.

The single unnamed 2 MiB window itself does match the driver:
xpcs_rk_init_res() uses platform_get_resource(pdev, IORESOURCE_MEM, 0) and
requires resource_size(res) >= SZ_2M, and the largest computed offset
0x7FFFF << 2 = 0x1FFFFC still falls inside 0x200000, so reg-names and
reg-io-width are not needed.

> +
> +  "#address-cells":
> +    const: 1
> +
> +  "#size-cells":
> +    const: 0
> +
> +  clocks:
> +    items:
> +      - description: APB3 bus interface clock (clk_csr_i), required for register access
> +      - description: EEE clock (clk_eee_i), required for Energy Efficient Ethernet operation
> +
> +  clock-names:
> +    items:
> +      - const: csr
> +      - const: eee
> +
> +  phys:
> +    maxItems: 1
> +
> +  phy-names:
> +    const: serdes
> +
> +  power-domains:
> +    maxItems: 1

[Severity: Low]

Should resets/reset-names be described here too?  The RK3568 CRU exposes
four dedicated reset lines for this block in
include/dt-bindings/clock/rk3568-cru.h:

	#define SRST_XPCS		150
	#define SRST_XPCS_TX_DIV10	151
	#define SRST_XPCS_RX_DIV10	152
	#define SRST_XPCS_XGXS_RX	153

Since the schema ends with additionalProperties: false, a conforming device
tree cannot express them at all, and the glue driver added later in the
series never requests a reset control, so it depends on those resets already
being de-asserted.

Peer blocks in the same island do describe theirs, e.g. combphy0 with
resets = <&cru SRST_PIPEPHY0> and gmac0 with resets = <&cru SRST_A_GMAC0>.

Note the XPCS core does provide a register-level reset via xpcs_soft_reset()
in drivers/net/pcs/pcs-xpcs.c, so a state-machine restart is possible
without the CRU resets, and an optional resets property can be added later
without breaking the ABI.

> +
> +patternProperties:
> +  "^pcs-mii@[0-3]$":
> +    type: object
> +    description:
> +      One of the four MII ports of the XPCS. The port is linked to an
> +      Ethernet MAC controller via the pcs-handle property in the MAC's
> +      device tree node.
> +
> +    properties:
> +      reg:
> +        description: MII port number.
> +        enum: [0, 1, 2, 3]

[Severity: Low]

This isn't a bug, but is pcs-mii@N the intended name for these per-port
children rather than the generic ethernet-pcs@N?

Resolving a MAC pcs-handle that points at one of these children does work
with the rest of the series: xpcs_rk_create() in
drivers/net/pcs/pcs-xpcs-rk.c reads the child reg, walks up with
of_get_parent() and calls xpcs_create_mdiodev(pxpcs->bus, port), and
rk_pcs_init() in drivers/net/ethernet/stmicro/stmmac/dwmac-rk.c does
of_parse_phandle(np, "pcs-handle", 0).  So the open point is just the node
naming.

> +
> +    required:
> +      - reg
> +
> +    additionalProperties: false
> +
> +required:
> +  - compatible
> +  - reg
> +  - "#address-cells"
> +  - "#size-cells"
> +  - clocks
> +  - clock-names
> +  - phys
> +  - phy-names
> +  - power-domains

[Severity: Medium]

Does requiring phys and phy-names here make dtbs_check fail for the RK3568
boards?  The SoC node added later in the same series omits both, because the
SerDes selection is board specific:

arch/arm64/boot/dts/rockchip/rk3568.dtsi:
	xpcs: pcs@fda00000 {
		compatible = "rockchip,rk3568-xpcs";
		#address-cells = <1>;
		#size-cells = <0>;
		reg = <0x0 0xfda00000 0x0 0x200000>;
		clocks = <&cru PCLK_XPCS>, <&cru CLK_XPCS_EEE>;
		clock-names = "csr", "eee";
		power-domains = <&power RK3568_PD_PIPE>;
		status = "disabled";

and only the board fills them in:

arch/arm64/boot/dts/rockchip/rk3568-photonicat.dts:
	&xpcs {
		status = "okay";
		phys = <&combphy2 PHY_TYPE_SGMII>;
		phy-names = "serdes";
	};

dtschema validates nodes irrespective of status = "disabled", so wouldn't
every rk3568*.dtb apart from the Photonicat report "'phys', 'phy-names' are
required properties"?

Should phys/phy-names be dropped from required (or made conditional), or
should the SoC dtsi carry them instead?

> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    #include <dt-bindings/clock/rk3568-cru.h>
> +    #include <dt-bindings/power/rk3568-power.h>
> +    #include <dt-bindings/phy/phy.h>
> +
> +    pcs@fda00000 {
> +      compatible = "rockchip,rk3568-xpcs";
> +      reg = <0xfda00000 0x200000>;
> +      #address-cells = <1>;
> +      #size-cells = <0>;
> +      clocks = <&cru PCLK_XPCS>, <&cru CLK_XPCS_EEE>;
> +      clock-names = "csr", "eee";
> +      phys = <&combphy2 PHY_TYPE_SGMII>;
> +      phy-names = "serdes";
> +      power-domains = <&power RK3568_PD_PIPE>;
> +
> +      pcs-mii@0 {
> +        reg = <0>;
> +      };
> +    };

