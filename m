Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D7F9FC28B2F
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 11 Mar 2025 19:27:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=cZeEjkRBUIchrC12RwZ+rU3pBKpusXB6nWtGSbGqMAI=; b=VZhVw2iyciNWCQsLbfmBYPWLdR
	Z+kr0igQ98AUKy88MvnCuGhp5kxdwPixcpZgf3TudBbdkAh9fyIiUufctkEZcMnz3SWt+aNfjUoS7
	e5yyB8kQRWFKMRxAgH4afx2q/OrcbeSfPSItkuPfD6NVM4ZGJadry2ObCdd7acG4fMHtlMBtnjsel
	Dpt6SzOewpAk/wwrJHm56mq02wgxCYjXLqfTWvA9zUm7K4sU6qKDocLspmNkTl6Gq+VQFzzb00Mgh
	+9FsJPC9hNhXplBJRC8Uf1SMNEwDk2poKREMo9LSllao1LjDsRnASldtHGbwhKXDxjsEo2JEXYHkP
	VIkt59lQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1ts5Fk-00000006lmD-2Bl4;
	Tue, 11 Mar 2025 19:27:00 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1ts5E6-00000006laX-2kZQ;
	Tue, 11 Mar 2025 19:25:20 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 3FB855C5606;
	Tue, 11 Mar 2025 19:23:01 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6E9D2C4CEEA;
	Tue, 11 Mar 2025 19:25:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1741721117;
	bh=vD3EacD3StgEcdCEuMUQ5gzplQWLkIqq1FTPEZvPzfg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=mBM4xUAkTUSoMvHUEAgRz6yN/W5RI7I4V2p83akIVmnAM7QsIcAQaLXlHr1vNn+QI
	 5ETwOeuCX4I/89nK2A3vphN/bUIz+tf2148c+5xZ3vXPv6lgLe5v+vHHHDmsBwj3si
	 WoVutHIgmQxZJY4o1F7Csp/tbW73xacT4HqG/1aCzmKtHyOp+KUJ/ZVwun/V1yNyIw
	 QtJygu4ryRR69VbveplcuNR3T4RwYAuI8Eu/J5EIRDoBt1I03+2WF5O2z88ny9J4iB
	 7vKswfiVOdbxC0slpftaFCpGE7eYEI9pqM7AUQtJ86jQsD0xpcSZQ8cvUZiTvbTNGf
	 mGuBLNFZmp07g==
Date: Tue, 11 Mar 2025 14:25:16 -0500
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
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org, netdev@vger.kernel.org,
	upstream@airoha.com
Subject: Re: [net-next PATCH v12 04/13] dt-bindings: net: Document support
 for AN8855 Switch Internal PHY
Message-ID: <20250311192516.GA4115176-robh@kernel.org>
References: <20250309172717.9067-1-ansuelsmth@gmail.com>
 <20250309172717.9067-5-ansuelsmth@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250309172717.9067-5-ansuelsmth@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250311_122518_806159_4A547018 
X-CRM114-Status: GOOD (  20.65  )
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

On Sun, Mar 09, 2025 at 06:26:49PM +0100, Christian Marangi wrote:
> Document support for AN8855 Switch Internal PHY.
> 
> Airoha AN8855 is a 5-port Gigabit Switch that expose the Internal
> PHYs on the MDIO bus.
> 
> Each PHY might need to be calibrated to correctly work with the
> use of the eFUSE provided by the Switch SoC. This can be enabled by
> defining in the PHY node the "airoha,ext-surge" property.
> 
> Signed-off-by: Christian Marangi <ansuelsmth@gmail.com>
> ---
>  .../bindings/net/airoha,an8855-phy.yaml       | 93 +++++++++++++++++++
>  MAINTAINERS                                   |  1 +
>  2 files changed, 94 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/net/airoha,an8855-phy.yaml
> 
> diff --git a/Documentation/devicetree/bindings/net/airoha,an8855-phy.yaml b/Documentation/devicetree/bindings/net/airoha,an8855-phy.yaml
> new file mode 100644
> index 000000000000..301c46f84904
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/net/airoha,an8855-phy.yaml
> @@ -0,0 +1,93 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/net/airoha,an8855-phy.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Airoha AN8855 Switch Internal PHY
> +
> +maintainers:
> +  - Christian Marangi <ansuelsmth@gmail.com>
> +
> +description: >
> +  Airoha AN8855 is a 5-port Gigabit Switch that expose the Internal
> +  PHYs on the MDIO bus.
> +
> +  Each PHY might need to be calibrated to correctly work with the
> +  use of the eFUSE provided by the Switch SoC.
> +
> +allOf:
> +  - $ref: ethernet-phy.yaml#
> +
> +select:
> +  properties:
> +    compatible:
> +      contains:
> +        enum:
> +          - ethernet-phy-idc0ff.0410
> +  required:
> +    - compatible
> +
> +properties:
> +  reg:
> +    maxItems: 1
> +
> +  airoha,ext-surge:
> +    description: enable PHY calibration with the use of SoC eFUSE.

Wouldn't nvmem-cells presence enable this?

> +
> +  nvmem-cells:
> +    items:
> +      - description: phandle to SoC eFUSE tx_a
> +      - description: phandle to SoC eFUSE tx_b
> +      - description: phandle to SoC eFUSE tx_c
> +      - description: phandle to SoC eFUSE tx_d
> +
> +  nvmem-cell-names:
> +    items:
> +      - const: tx_a
> +      - const: tx_b
> +      - const: tx_c
> +      - const: tx_d
> +
> +required:
> +  - compatible
> +  - reg
> +
> +if:
> +  required:
> +    - airoha,ext-surge
> +then:
> +  required:
> +    - nvmem-cells
> +    - nvmem-cell-names

dependentRequired:
  airoha,ext-surge: [ nvmem-cells, nvmem-cell-names ]

> +
> +unevaluatedProperties: false
> +
> +examples:
> +  - |
> +    mdio {
> +        #address-cells = <1>;
> +        #size-cells = <0>;
> +
> +        ethernet-phy@1 {
> +            compatible = "ethernet-phy-idc0ff.0410",
> +                         "ethernet-phy-ieee802.3-c45";
> +
> +            reg = <1>;
> +        };
> +
> +        ethernet-phy@2 {
> +            compatible = "ethernet-phy-idc0ff.0410",
> +                         "ethernet-phy-ieee802.3-c45";
> +
> +            reg = <2>;
> +
> +            airoha,ext-surge;
> +
> +            nvmem-cells = <&shift_sel_port0_tx_a>,
> +                <&shift_sel_port0_tx_b>,
> +                <&shift_sel_port0_tx_c>,
> +                <&shift_sel_port0_tx_d>;
> +            nvmem-cell-names = "tx_a", "tx_b", "tx_c", "tx_d";
> +        };
> +    };
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 696ad8465ea8..45f4bb8deb0d 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -726,6 +726,7 @@ L:	linux-mediatek@lists.infradead.org (moderated for non-subscribers)
>  L:	netdev@vger.kernel.org
>  S:	Maintained
>  F:	Documentation/devicetree/bindings/net/airoha,an8855-mdio.yaml
> +F:	Documentation/devicetree/bindings/net/airoha,an8855-phy.yaml
>  F:	Documentation/devicetree/bindings/net/dsa/airoha,an8855-switch.yaml
>  F:	Documentation/devicetree/bindings/nvmem/airoha,an8855-efuse.yaml
>  
> -- 
> 2.48.1
> 

