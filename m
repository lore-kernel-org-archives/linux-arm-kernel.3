Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7BED1E77170
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  4 Dec 2024 14:29:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=SmTxD5NGlujTTute3aKg6mmeA6rFrJXZxHwNZRg8TAI=; b=N7JA8IePzvPH/IUy+9jDlIlWBh
	HPBEEkcUy1Y6KFmQQpZSB2XXtCOBqLqw2zBldlOhzSsknqobsiFOSGlPlMBhoW1Lp/80U69WpiHBa
	Sn7czWrbWllLdMeNX9JZ0Z8+l/elC34oLlImRC4fGjmKOVqu/Vuvff7WYCgm+CU2M7BmqDUa+Bw2P
	3wRxlXlv8lmwDfJMpFTAWI4zOQ7blocdV5JbtmFv31vyizzcoeBlSYhBRlWqI+3bNjpNnQzrH5Yb+
	bv5TJsLT5xKsCiyblrNx8vlNVIhzNI47z2GLU3+T1bqh1oeIeZJGF4qYEuwHWtT22TecZqXPs3BXr
	4Q8b73Yw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tIqN5-0000000Cppx-33pl;
	Wed, 04 Dec 2024 14:28:55 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tIqLk-0000000Cpce-0TcD
	for linux-arm-kernel@bombadil.infradead.org;
	Wed, 04 Dec 2024 14:27:32 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=SmTxD5NGlujTTute3aKg6mmeA6rFrJXZxHwNZRg8TAI=; b=H4snXvExLQNpM8MYjfcZ2Z0+bA
	sMKk0iY/4wgOM1hSOmY8XFxX6KUH3qM1+MLGYNWAPZn6yW6yARvnRXeSDBLdoJgnJ3IWZmdCELvL0
	jwdDixx+XH9Q4TBeDe3bfNR/wXBF3VxpPeJSFWxn73mYu7MfgXuMzWBoY0IizTrCFmDKhwtIFBOuC
	2p0rXh50d9xjCu6ZQqbBBkRn4yzV5KNd0Li0YCGuRKW1I+IhEErI2CDGLXZr9fPJ2Dd8i8FMvxtNg
	/tMU+6rMZQS8Hna/VHSgOA0a7RY5kTIyyO9Pl2XtI1lWNrRsnD0RzyitACWQD8siRZ20ArVx2k/OK
	TPRp2iRA==;
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by desiato.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tIqLg-00000002dVI-3dEF
	for linux-arm-kernel@lists.infradead.org;
	Wed, 04 Dec 2024 14:27:31 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 96E21A41719;
	Wed,  4 Dec 2024 14:25:32 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2F5A6C4CECD;
	Wed,  4 Dec 2024 14:27:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1733322444;
	bh=8kSlC422IeYzzzg01gqSDhhGR5XtczDm7IOevfiFGpg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=BdFpiD9Ehf6NJ3eXKMvlAfMjtslR49WOP1XgUzl8Ck2/Y6xhUo9QDz+XhMIbVjE45
	 eFZCibANpmxxsm8ynWVu518p2aaxX5pvpUjiWwJ3rL50jEhG4+crmF4GqsX+cGlAaF
	 u3q4BVYokvbhtYT0F2HAj2uqIWUtSa/NzF9/pe/iHr7eXhLjT4RL8/r2z3XDX4OJpQ
	 K7iLFPQx5+KMMN2w5WvvSClaxGbQsO9IHAAEIF+2l8VL3TB61Y7/VCkJFWkSfUuFqG
	 JWEd0DwOXxYGfhjwMSg9DBQAKawNzvv6CLepS2tQA0KymkZBGUiOdZlz2DgRb4ULEe
	 JWqZQZUMt6mXg==
Date: Wed, 4 Dec 2024 08:27:22 -0600
From: Rob Herring <robh@kernel.org>
To: Joey Lu <a0987203069@gmail.com>
Cc: andrew+netdev@lunn.ch, davem@davemloft.net, edumazet@google.com,
	kuba@kernel.org, pabeni@redhat.com, krzk+dt@kernel.org,
	conor+dt@kernel.org, mcoquelin.stm32@gmail.com,
	richardcochran@gmail.com, alexandre.torgue@foss.st.com,
	joabreu@synopsys.com, ychuang3@nuvoton.com, schung@nuvoton.com,
	yclu4@nuvoton.com, peppe.cavallaro@st.com,
	linux-arm-kernel@lists.infradead.org, netdev@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	openbmc@lists.ozlabs.org, linux-stm32@st-md-mailman.stormreply.com
Subject: Re: [PATCH v4 1/3] dt-bindings: net: nuvoton: Add schema for Nuvoton
 MA35 family GMAC
Message-ID: <20241204142722.GA177756-robh@kernel.org>
References: <20241202023643.75010-1-a0987203069@gmail.com>
 <20241202023643.75010-2-a0987203069@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241202023643.75010-2-a0987203069@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241204_142729_238037_8DB79E61 
X-CRM114-Status: GOOD (  19.72  )
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

On Mon, Dec 02, 2024 at 10:36:41AM +0800, Joey Lu wrote:
> Create initial schema for Nuvoton MA35 family Gigabit MAC.
> 
> Signed-off-by: Joey Lu <a0987203069@gmail.com>
> ---
>  .../bindings/net/nuvoton,ma35d1-dwmac.yaml    | 134 ++++++++++++++++++
>  .../devicetree/bindings/net/snps,dwmac.yaml   |   1 +
>  2 files changed, 135 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/net/nuvoton,ma35d1-dwmac.yaml
> 
> diff --git a/Documentation/devicetree/bindings/net/nuvoton,ma35d1-dwmac.yaml b/Documentation/devicetree/bindings/net/nuvoton,ma35d1-dwmac.yaml
> new file mode 100644
> index 000000000000..e44abaf4da3e
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/net/nuvoton,ma35d1-dwmac.yaml
> @@ -0,0 +1,134 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/net/nuvoton,ma35d1-dwmac.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Nuvoton DWMAC glue layer controller
> +
> +maintainers:
> +  - Joey Lu <yclu4@nuvoton.com>
> +
> +description:
> +  Nuvoton 10/100/1000Mbps Gigabit Ethernet MAC Controller is based on
> +  Synopsys DesignWare MAC (version 3.73a).
> +
> +allOf:
> +  - $ref: snps,dwmac.yaml#
> +
> +properties:
> +  compatible:
> +    items:
> +      - enum:
> +          - nuvoton,ma35d1-dwmac
> +
> +  reg:
> +    maxItems: 1
> +    description:
> +      Register range should be one of the GMAC interface.
> +
> +  interrupts:
> +    maxItems: 1
> +
> +  clocks:
> +    items:
> +      - description: MAC clock
> +      - description: PTP clock
> +
> +  clock-names:
> +    items:
> +      - const: stmmaceth
> +      - const: ptp_ref
> +
> +  nuvoton,sys:
> +    $ref: /schemas/types.yaml#/definitions/phandle-array
> +    items:
> +      - items:
> +          - description: phandle to access syscon registers.
> +          - description: GMAC interface ID.
> +            enum:
> +              - 0
> +              - 1
> +    description:
> +      A phandle to the syscon with one argument that configures system registers
> +      for MA35D1's two GMACs. The argument specifies the GMAC interface ID.
> +
> +  resets:
> +    maxItems: 1
> +
> +  reset-names:
> +    items:
> +      - const: stmmaceth
> +
> +  phy-mode:
> +    enum:
> +      - rmii
> +      - rgmii
> +      - rgmii-id
> +      - rgmii-txid
> +      - rgmii-rxid
> +
> +  tx-internal-delay-ps:
> +    default: 0
> +    minimum: 0
> +    maximum: 2000
> +    description:
> +      RGMII TX path delay used only when PHY operates in RGMII mode with
> +      internal delay (phy-mode is 'rgmii-id' or 'rgmii-txid') in pico-seconds.
> +      Allowed values are from 0 to 2000.
> +
> +  rx-internal-delay-ps:
> +    default: 0
> +    minimum: 0
> +    maximum: 2000
> +    description:
> +      RGMII RX path delay used only when PHY operates in RGMII mode with
> +      internal delay (phy-mode is 'rgmii-id' or 'rgmii-rxid') in pico-seconds.
> +      Allowed values are from 0 to 2000.
> +
> +  mdio:
> +    $ref: /schemas/net/mdio.yaml#

Drop. snps,dwmac.yaml already has this.

> +
> +required:
> +  - compatible
> +  - reg
> +  - interrupts
> +  - interrupt-names

Drop all 4. Already required by snps,dwmac.yaml.

> +  - clocks
> +  - clock-names
> +  - nuvoton,sys
> +  - resets
> +  - reset-names
> +  - phy-mode

Drop this one too.

> +
> +unevaluatedProperties: false
> +
> +examples:
> +  - |
> +    #include <dt-bindings/interrupt-controller/arm-gic.h>
> +    #include <dt-bindings/clock/nuvoton,ma35d1-clk.h>
> +    #include <dt-bindings/reset/nuvoton,ma35d1-reset.h>
> +    ethernet@40120000 {
> +        compatible = "nuvoton,ma35d1-dwmac";
> +        reg = <0x40120000 0x10000>;
> +        interrupts = <GIC_SPI 23 IRQ_TYPE_LEVEL_HIGH>;
> +        interrupt-names = "macirq";
> +        clocks = <&clk EMAC0_GATE>, <&clk EPLL_DIV8>;
> +        clock-names = "stmmaceth", "ptp_ref";
> +
> +        nuvoton,sys = <&sys 0>;
> +        resets = <&sys MA35D1_RESET_GMAC0>;
> +        reset-names = "stmmaceth";
> +
> +        phy-mode = "rgmii-id";
> +        phy-handle = <&eth_phy0>;
> +        mdio {
> +            compatible = "snps,dwmac-mdio";
> +            #address-cells = <1>;
> +            #size-cells = <0>;
> +
> +            ethernet-phy@0 {
> +                reg = <0>;
> +            };
> +        };
> +    };
> diff --git a/Documentation/devicetree/bindings/net/snps,dwmac.yaml b/Documentation/devicetree/bindings/net/snps,dwmac.yaml
> index eb1f3ae41ab9..4bf59ab910cc 100644
> --- a/Documentation/devicetree/bindings/net/snps,dwmac.yaml
> +++ b/Documentation/devicetree/bindings/net/snps,dwmac.yaml
> @@ -67,6 +67,7 @@ properties:
>          - ingenic,x2000-mac
>          - loongson,ls2k-dwmac
>          - loongson,ls7a-dwmac
> +        - nuvoton,ma35d1-dwmac
>          - qcom,qcs404-ethqos
>          - qcom,sa8775p-ethqos
>          - qcom,sc8280xp-ethqos
> -- 
> 2.34.1
> 

