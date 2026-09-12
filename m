Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 36EA2C88E56
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 12 Sep 2026 20:14:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+gErbFmr8l6Csxg/evZTdwlWQQZXDTF+uohyIeq0mWI=; b=3o9JV1YtqPv1NO3XRLpnp8uM2W
	3YXzuQxR+NKYgUFWHS8s+PZa4wYMLAkUgwycNnmVma7sofXguYpgO7Fhu0FDlVAYsSbUVyeUPwefA
	95Dex5zKL9h7fWx7FsplTZsdGNLKVsNH7O+VSZJdtEZEKqC7JpG83d3A3cohqBJOgOzd/QibdVJo9
	3LI9RAjulKGqrOJdr2S99Y9HMgush93E1hGBELQGwIQGO6OkwIo9nfhUakdBFHA5HD34kkaI92a/h
	DxT+mkDw3FJuq3RwPGbpPWoH9lT1/S7fGAaGAC7KPo9rh7Pmnp+UpQoXMShmJAlRi4nH4FAYQXKPB
	GJ6Xu38Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x5U6p-000000018rw-3EsC;
	Sat, 12 Sep 2026 20:13:59 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x5U6K-000000018f1-1rIz;
	Sat, 12 Sep 2026 20:13:28 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 82FE66020A;
	Sat, 12 Sep 2026 20:13:27 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 623F91F00899;
	Sat, 12 Sep 2026 20:13:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789244007;
	bh=+gErbFmr8l6Csxg/evZTdwlWQQZXDTF+uohyIeq0mWI=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=M+472J58SS6FHC26IiUSYLFLWkVTIW77JV+CRWUQX2flhpcz7VZF2AniBUtfzbVTL
	 n3E5bZ3Chlvq0MVIFzMB7EvBRlq5aAMmP0uuecydeyG+dj5i8T2X98yl3ibDpqtZr5
	 YG3E9nRTr22cYyCq0C+oQCLdgwDLY4v7mKctTSvpzzwHzEPnY+YrHjZshVJD7YuF3Z
	 PEWXIgZw9AejtlhBBvDDZIBMylQiRMsG7cFLI9p6B/OTNKY4HJqXOkcxJ81WuYumpl
	 f1IDDYZsXfY77jgxbpBrD7kGEFcpENl7CJH1uOA0FT/r30O4rz07dRyzfGT0VFXE4f
	 DzdzepsJfJmKA==
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
Subject: Re: [PATCH net-next v4 05/10] arm64: dts: rockchip: rk3568: add XPCS and fixed-clock nodes
Date: Sat, 12 Sep 2026 13:13:25 -0700
Message-ID: <20260912201325.127009-1-kuba@kernel.org>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260907153713.2572547-7-coiaprant@gmail.com>
References: <20260907153713.2572547-7-coiaprant@gmail.com>
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
arm64: dts: rockchip: rk3568: add XPCS and fixed-clock nodes

This adds the RK3568 Synopsys DesignWare XPCS node (with four pcs-mii
sub-nodes) plus two 125 MHz fixed-clock nodes used as GMAC reference
clocks.  The XPCS node and its sub-nodes are disabled by default and are
meant to be completed and enabled at the board level.

A couple of questions about the new nodes below.

> diff --git a/arch/arm64/boot/dts/rockchip/rk3568.dtsi b/arch/arm64/boot/dts/rockchip/rk3568.dtsi
> index 3bc653f027f1f..989e164c0eb39 100644
> --- a/arch/arm64/boot/dts/rockchip/rk3568.dtsi
> +++ b/arch/arm64/boot/dts/rockchip/rk3568.dtsi
> @@ -110,6 +110,51 @@ sata0: sata@fc000000 {
>  		status = "disabled";
>  	};
>  
> +	xpcs: pcs@fda00000 {
> +		compatible = "rockchip,rk3568-xpcs";
> +		#address-cells = <1>;
> +		#size-cells = <0>;
> +		reg = <0x0 0xfda00000 0x0 0x200000>;
> +		clocks = <&cru PCLK_XPCS>, <&cru CLK_XPCS_EEE>;
> +		clock-names = "csr", "eee";
> +		power-domains = <&power RK3568_PD_PIPE>;
> +		status = "disabled";

[Severity: Medium]
Does this node validate against the binding added earlier in the same
series?  Documentation/devicetree/bindings/net/pcs/rockchip-dwxpcs.yaml
lists phys and phy-names unconditionally:

required:
  - compatible
  - reg
  - "#address-cells"
  - "#size-cells"
  - clocks
  - clock-names
  - phys
  - phy-names
  - power-domains

The node here supplies neither, and dt-validate does not skip nodes with
status = "disabled", so dtbs_check should report "'phys' is a required
property" and "'phy-names' is a required property" for every rk3568 dtb
that includes this dtsi.

At the tip of the series only rk3568-photonicat.dts fills them in:

&xpcs {
	status = "okay";
	phys = <&combphy2 PHY_TYPE_SGMII>;
	phy-names = "serdes";
};

so rk3568-evb, rk3568-rock-3a, rk3568-roc-pc, rk3568-radxa-cm3j,
rk3568-wolfvision-pf5 and friends would still be missing them.

If which combphy carries SGMII is genuinely a board-level choice, should
phys/phy-names be moved out of the unconditional required: list in the
binding instead, or should the dtsi provide a default?

> +
> +		xpcs_mii0: pcs-mii@0 {
> +			reg = <0>;
> +			status = "disabled";
> +		};

[Severity: Low]
This isn't a bug, just a note for the record: at this commit there is no
in-tree consumer of "rockchip,rk3568-xpcs" or of the pcs-mii sub-nodes.
Both arrive later in the same series - xpcs_rk_of_ids in
drivers/net/pcs/pcs-xpcs-rk.c gains the compatible, and rk_pcs_init() in
drivers/net/ethernet/stmicro/stmmac/dwmac-rk.c parses pcs-handle and
calls xpcs_rk_create().  With the nodes disabled by default the
intermediate state looks harmless, so nothing needs changing here.

> +
> +		xpcs_mii1: pcs-mii@1 {
> +			reg = <1>;
> +			status = "disabled";
> +		};
> +
> +		xpcs_mii2: pcs-mii@2 {
> +			reg = <2>;
> +			status = "disabled";
> +		};
> +
> +		xpcs_mii3: pcs-mii@3 {
> +			reg = <3>;
> +			status = "disabled";
> +		};
> +	};
> +
> +	xpcs_gmac0_clk: xpcs-gmac0-clock {
> +		compatible = "fixed-clock";
> +		clock-frequency = <125000000>;
> +		clock-output-names = "clk_gmac0_xpcs_mii";
> +		#clock-cells = <0>;
> +	};
> +
> +	xpcs_gmac1_clk: xpcs-gmac1-clock {
> +		compatible = "fixed-clock";
> +		clock-frequency = <125000000>;
> +		clock-output-names = "clk_gmac1_xpcs_mii";
> +		#clock-cells = <0>;
> +	};

[Severity: Low]
These two node names take the deprecated branch of the fixed-clock
$nodename schema.  Documentation/devicetree/bindings/clock/fixed-clock.yaml
has:

  $nodename:
    anyOf:
      - description:
          Preferred name is 'clock-<freq>' with <freq> being the output
          frequency as defined in the 'clock-frequency' property.
        pattern: "^clock-([0-9]+|[a-z0-9-]+)$"
      - description: Any name allowed
        deprecated: true

xpcs-gmac0-clock and xpcs-gmac1-clock do not match the preferred
pattern, so they land on the "Any name allowed" branch.  Newer Rockchip
dtsi files use the preferred form already, for example rk3528.dtsi with
xin24m: clock-xin24m and gmac0_clk: clock-gmac50m.

Could these be named clock-xpcs-gmac0 and clock-xpcs-gmac1?  The labels
xpcs_gmac0_clk / xpcs_gmac1_clk and all references would stay the same.

>  	pipe_phy_grf0: syscon@fdc70000 {
>  		compatible = "rockchip,rk3568-pipe-phy-grf", "syscon";
>  		reg = <0x0 0xfdc70000 0x0 0x1000>;

