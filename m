Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2C5D0CCD1BF
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 28 Oct 2025 08:16:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=frORlvTL6qtpkzTq4xVUf6zoV8KK29KtPesDuMBI8z4=; b=3aMPbhrd1gDqp0viwJH8yM/qZC
	xLc0gwKnOu97PTKbjArpoIuHb+qD/GxNEaZevpGiNa4ylRldwUI2SVE2ozAaeTO6WIsfLzleKfHkt
	+B0Wx8nYxa37lWuqy/3HVKd1d1urTj5T87ECx7q+Pa+6ahzvSCP/mDXydFrbzIL3HhIREvqcbE5XO
	debsrKx1CG6yFr5uleEa/G1gVScsHGKT2hXoa4jiHmZw13IPP8ATC2vrlERDzd5o62mMuDLWAsoFD
	eCb5DRHssZJJZoeBohWH5jrR1YKTeFSW6ZumyWaMqCdwj4xr8/Ke7k77bAmEHj6Jl5K55sd0QFx3h
	4OHYW5mA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vDesI-0000000FW8j-1TEO;
	Tue, 28 Oct 2025 08:16:14 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vDesE-0000000FW7v-0Q4X
	for linux-arm-kernel@lists.infradead.org;
	Tue, 28 Oct 2025 08:16:12 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 57DDF4325F;
	Tue, 28 Oct 2025 08:16:09 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9F795C4CEE7;
	Tue, 28 Oct 2025 08:16:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1761639369;
	bh=ZAfmU0FpKyd3OOPLc6LD6luNCN153GGX0iR9vaXLeYE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=HWoiZ3Qn5h7Wj7+GlNEaku5DiODphQqYkXj3x7kSib8C3OczC4kdBt20OExXPaCGy
	 nEvr1LCh5A99hln7xzGEDbRznpr7JjpBJDfxauEN0o7/VU5yHbdMxneK7MUUc/kZdy
	 ovkt0Gm220ye/xikz0kX2Mg8XZn5JGKQo+GsifRdzJl4UZIic/+z8W+w5aZ3A5plKU
	 +2YsiRlkl5AHZ1M3IwtsDMARTNoo+oInELCcgFUiaSyN6zNB6PFSzq72oxgCaVBT86
	 40QJbPnkpz5kLUT9Jr2KVjIDamUPnSvxnOo1v81BDGoLSp3+qOam7sLtD/yMzPS9XN
	 Vcm++bCNu8P7Q==
Date: Tue, 28 Oct 2025 09:16:06 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Bartosz Golaszewski <brgl@bgdev.pl>
Cc: Bjorn Andersson <andersson@kernel.org>, 
	Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Richard Cochran <richardcochran@gmail.com>, Andrew Lunn <andrew+netdev@lunn.ch>, 
	"David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
	Maxime Coquelin <mcoquelin.stm32@gmail.com>, Alexandre Torgue <alexandre.torgue@foss.st.com>, 
	Vinod Koul <vkoul@kernel.org>, Giuseppe Cavallaro <peppe.cavallaro@st.com>, 
	Jose Abreu <joabreu@synopsys.com>, linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, netdev@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com, 
	linux-arm-kernel@lists.infradead.org, Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Subject: Re: [PATCH v3 1/8] dt-bindings: net: qcom: document the ethqos
 device for SCMI-based systems
Message-ID: <20251028-wonderful-orchid-emu-25cd02@kuoka>
References: <20251027-qcom-sa8255p-emac-v3-0-75767b9230ab@linaro.org>
 <20251027-qcom-sa8255p-emac-v3-1-75767b9230ab@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20251027-qcom-sa8255p-emac-v3-1-75767b9230ab@linaro.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251028_011610_200085_E20C39BD 
X-CRM114-Status: GOOD (  20.99  )
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

On Mon, Oct 27, 2025 at 04:44:49PM +0100, Bartosz Golaszewski wrote:
> From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> 
> Describe the firmware-managed variant of the QCom DesignWare MAC. As the
> properties here differ a lot from the HLOS-managed variant, lets put it
> in a separate file.
> 
> Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> ---
>  .../devicetree/bindings/net/qcom,ethqos-scmi.yaml  | 101 +++++++++++++++++++++
>  .../devicetree/bindings/net/snps,dwmac.yaml        |   5 +-
>  MAINTAINERS                                        |   1 +
>  3 files changed, 106 insertions(+), 1 deletion(-)
> 
> diff --git a/Documentation/devicetree/bindings/net/qcom,ethqos-scmi.yaml b/Documentation/devicetree/bindings/net/qcom,ethqos-scmi.yaml
> new file mode 100644
> index 0000000000000000000000000000000000000000..b821299d7b30cdb802d9ee5d9fa17542b8334bd2
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/net/qcom,ethqos-scmi.yaml
> @@ -0,0 +1,101 @@
> +# SPDX-License-Identifier: GPL-2.0 OR BSD-2-Clause
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/net/qcom,ethqos-scmi.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Qualcomm Ethernet ETHQOS device (firmware managed)
> +
> +maintainers:
> +  - Bjorn Andersson <andersson@kernel.org>
> +  - Konrad Dybcio <konradybcio@kernel.org>
> +  - Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> +
> +description:
> +  dwmmac based Qualcomm ethernet devices which support Gigabit
> +  ethernet (version v2.3.0 and onwards) with clocks, interconnects, etc.
> +  managed by firmware
> +
> +allOf:
> +  - $ref: snps,dwmac.yaml#
> +
> +properties:
> +  compatible:
> +    const: qcom,sa8255p-ethqos
> +
> +  reg:
> +    maxItems: 2
> +
> +  reg-names:
> +    items:
> +      - const: stmmaceth
> +      - const: rgmii
> +
> +  interrupts:
> +    items:
> +      - description: Combined signal for various interrupt events
> +      - description: The interrupt that occurs when HW safety error triggered
> +
> +  interrupt-names:
> +    items:
> +      - const: macirq
> +      - const: sfty
> +
> +  power-domains:
> +    minItems: 3

maxItems instead

But the other problem is that it is conflicting with snps,dwmac.yaml
which says max 1 is allowed. You need to fix that, along with
restricting other users of that shared schema to maxItems: 1.

> +
> +  power-domain-names:
> +    items:
> +      - const: core
> +      - const: mdio
> +      - const: serdes
> +
> +  iommus:
> +    maxItems: 1
> +
> +  dma-coherent: true
> +
> +  phys: true

Missing maxItems.

> +
> +  phy-names:
> +    const: serdes
> +
> +required:
> +  - compatible
> +  - reg-names
> +  - power-domains

power-domain-names

Shouldn't phys be required? How device can work sometimes without its
phy?


> +
> +unevaluatedProperties: false
> +
> +examples:
> +  - |
> +    #include <dt-bindings/interrupt-controller/arm-gic.h>
> +
> +    ethernet: ethernet@7a80000 {
> +        compatible = "qcom,sa8255p-ethqos";
> +        reg = <0x23040000 0x10000>,
> +              <0x23056000 0x100>;
> +        reg-names = "stmmaceth", "rgmii";
> +
> +        iommus = <&apps_smmu 0x120 0x7>;
> +
> +        interrupts = <GIC_SPI 946 IRQ_TYPE_LEVEL_HIGH>,
> +                     <GIC_SPI 782 IRQ_TYPE_LEVEL_HIGH>;
> +        interrupt-names = "macirq", "sfty";
> +
> +        dma-coherent;
> +
> +        snps,tso;
> +        snps,pbl = <32>;
> +        rx-fifo-depth = <16384>;
> +        tx-fifo-depth = <16384>;
> +
> +        phy-handle = <&ethernet_phy>;
> +        phy-mode = "2500base-x";

Incomplete example - missing phys.

> +
> +        snps,mtl-rx-config = <&mtl_rx_setup1>;
> +        snps,mtl-tx-config = <&mtl_tx_setup1>;
> +
> +        power-domains = <&scmi8_pd 0>, <&scmi8_pd 1>, <&scmi8_dvfs 0>;
> +        power-domain-names = "core", "mdio","serdes";
> +    };
> diff --git a/Documentation/devicetree/bindings/net/snps,dwmac.yaml b/Documentation/devicetree/bindings/net/snps,dwmac.yaml
> index dd3c72e8363e70d101ed2702e2ea3235ee38e2a0..312d1bbc2ad1051520355039f5587381cbd1e01c 100644
> --- a/Documentation/devicetree/bindings/net/snps,dwmac.yaml
> +++ b/Documentation/devicetree/bindings/net/snps,dwmac.yaml
> @@ -71,6 +71,7 @@ properties:
>          - loongson,ls7a-dwmac
>          - nxp,s32g2-dwmac
>          - qcom,qcs404-ethqos
> +        - qcom,sa8255p-ethqos
>          - qcom,sa8775p-ethqos
>          - qcom,sc8280xp-ethqos
>          - qcom,sm8150-ethqos
> @@ -180,7 +181,8 @@ properties:
>            - const: ahb
>  
>    power-domains:
> -    maxItems: 1
> +    minItems: 1
> +    maxItems: 3

Ah, you did it. But you need to update all other bindings as well.

Best regards,
Krzysztof


