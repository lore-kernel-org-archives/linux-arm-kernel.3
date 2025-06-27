Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 53821C7EE2A
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 27 Jun 2025 22:00:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=oJbY3eHjLiF2WlGFoHs9FvJ6YwnMx+E2OC/qZe2uYUo=; b=iKMRf2jVYiPhTkdN5UBfN4gksu
	XOLLnPnWR1iLxmxjYBmf+kjAiw68YYEsi6wHTmEanyKh7EaLNEUOPiI1rl0sSph9NMbpfgdeLYw57
	JDLqqsyBBpfoVeA6qPNAxUD2x+v8ASsS+mGMYjxyyOs/9fJ/PoM6C1aSXrz1kDa2gfXEjfV++vFjq
	X7u8P+TUZ8OzjqxvSRX1m0Vate9e80kDCiHlCDNrBAspNCc27exT0Ia1G8JOsh2U1SuSvav+ItEps
	YAtoMJdTW9cpAqOtgZbgSCdj41j2kOKyQKgldo7LC4JBYXghnDtgMWF3cIJr+3e9B9lz/YPphIxvj
	A+5zboMw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uVH7O-0000000FuIK-3MZw;
	Fri, 27 Jun 2025 22:00:22 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uVGvo-0000000Ft3r-1DvU;
	Fri, 27 Jun 2025 21:48:25 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id D272F5C4638;
	Fri, 27 Jun 2025 21:48:22 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5FBDAC4CEE3;
	Fri, 27 Jun 2025 21:48:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1751060902;
	bh=YHqgPMpv3lbWQeN0ahS3Aj9hJ6fjkJUfFUhz0ULMu7A=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=r0BXBCTmzuRvWVnE7dxBQGa3Co6tx7KvAwnAhhiYVSX2/D/E+FJFebyvI9k9NYUJz
	 gdf9K4aKDNQb15RrHtY60rJqhLFvKegk3BV4qPqDJtuPLRduzxHOApkqUneiWv7DNS
	 xhc+QwFW6vRblmxDPS/2WdkVphzzIeoRflCbu7yMX/MX0gEjQSpPB92CVvoyAl1LRb
	 jEIfbQJHecV4BSUPukdJvB6y6Fmdn++G6c1RRPrNR43cnv4lawKW+rYi49XXmwj4BV
	 Yme2khNgG9Fiv9Fz/s3cCLOuDB+ftj+BSHLrFpJkxk2TipiC6SqeKKc6WvbBS9C4y/
	 hhOq+ufF43bkA==
Date: Fri, 27 Jun 2025 16:48:21 -0500
From: Rob Herring <robh@kernel.org>
To: Christian Marangi <ansuelsmth@gmail.com>
Cc: Lee Jones <lee@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Vladimir Oltean <olteanv@gmail.com>,
	Srinivas Kandagatla <srini@kernel.org>,
	Heiner Kallweit <hkallweit1@gmail.com>,
	Russell King <linux@armlinux.org.uk>,
	"Chester A. Unal" <chester.a.unal@arinc9.com>,
	Daniel Golle <daniel@makrotopia.org>,
	DENG Qingfang <dqfext@gmail.com>,
	Sean Wang <sean.wang@mediatek.com>, Simon Horman <horms@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org, netdev@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [net-next PATCH v15 05/12] dt-bindings: mfd: Document support
 for Airoha AN8855 Switch SoC
Message-ID: <20250627214821.GA195510-robh@kernel.org>
References: <20250626212321.28114-1-ansuelsmth@gmail.com>
 <20250626212321.28114-6-ansuelsmth@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250626212321.28114-6-ansuelsmth@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250627_144824_412535_4BCC2B46 
X-CRM114-Status: GOOD (  17.72  )
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

On Thu, Jun 26, 2025 at 11:23:04PM +0200, Christian Marangi wrote:
> Document support for Airoha AN8855 Switch SoC. This SoC expose various
> peripherals like an Ethernet Switch, a NVMEM provider and Ethernet PHYs.
> 
> It does also support i2c and timers but those are not currently
> supported/used.
> 
> Signed-off-by: Christian Marangi <ansuelsmth@gmail.com>
> ---
>  .../bindings/mfd/airoha,an8855.yaml           | 175 ++++++++++++++++++
>  1 file changed, 175 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/mfd/airoha,an8855.yaml
> 
> diff --git a/Documentation/devicetree/bindings/mfd/airoha,an8855.yaml b/Documentation/devicetree/bindings/mfd/airoha,an8855.yaml
> new file mode 100644
> index 000000000000..a683db4f41d1
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/mfd/airoha,an8855.yaml
> @@ -0,0 +1,175 @@
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
> +    description: EFUSE exposed by the Airoha AN8855 SoC
> +
> +  ethernet-switch:
> +    type: object
> +    $ref: /schemas/net/dsa/airoha,an8855-switch.yaml
> +    description: Switch exposed by the Airoha AN8855 SoC
> +
> +  mdio:
> +    type: object
> +    $ref: /schemas/net/airoha,an8855-mdio.yaml
> +    description: MDIO exposed by the Airoha AN8855 SoC
> +
> +required:
> +  - compatible
> +  - reg
> +  - mdio
> +  - ethernet-switch
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

Same comment here.

Why do we need 2 examples of the same thing? Isn't this 1 complete 
example here enough?

Reviewed-by: Rob Herring (Arm) <robh@kernel.org>

Rob

