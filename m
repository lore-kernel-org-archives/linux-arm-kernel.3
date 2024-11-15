Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 89B88D68BCD
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 15 Nov 2024 16:40:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=aIXwLxG+SpzhPWf3vEsiDDXydvymJ/Yv6GPtBi4V8/Y=; b=LzimMQXzqhwu6h0AhRIA1qJyGG
	wPdix3//xBjPpZ7SMxP1XQYsSVS7tdxJI/fr2K+zI+yv6bO1k1tuCQ3w3AZJUdNBGwy2+bd6K/OJr
	6NJBFjXkwpPP2c/SeoB3sc44WHsus04dPEzeGVdaLlzDR5CEZagKBxMZfp3sLy5nd34FEotoEgwjk
	QUavwVKSsqxcOcj3vwGXubIvAcvl5pAF0zD/2BB35275SRjURQDRt2xPIn7eXEP5kNR6qqPjJoxTe
	RpPrsJOdXCMF7w1NmNs1VlxwdD6KVOtIlsTjxQITEh3VKT4fcQUtva9xOeVFVTm9KAwIZ/cKVtcla
	wJ3BPDsA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tBzNG-00000003P3Z-2WS0;
	Fri, 15 Nov 2024 16:40:46 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tBzMG-00000003OS2-2RWv
	for linux-arm-kernel@lists.infradead.org;
	Fri, 15 Nov 2024 16:39:45 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id C214AA42AD1;
	Fri, 15 Nov 2024 16:37:49 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2EC12C4CECF;
	Fri, 15 Nov 2024 16:39:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1731688783;
	bh=iRr3qC8xf3SocAeyPSOv4BEKnzUJ3YHOuClfGqNnj3o=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=AP/GnWwjAUJLjLFoxgVufPIRcVQsuuCixNyxHBMNXq00d0lDhi+r0CB0ZJyC99XZi
	 sglwDivb/koS7axFD0SOzdC8byWidw6FjVRON36PCqYXjefKXEypjAo1Ut5Tw3b3t1
	 21q5Vn5Rb9IiF+fSp1XkK4qrm1FqkLpuidYcI+JgbOwnIrm9OxK7PxNJCVNfp07vdN
	 0+g/2/cgwY+a8Dck3dFLWhcc4o3yUAGyz9kkLlXx1e/UELEajk5UaqMar2+KG8ZSUy
	 eSKBCwOH2KxJ5A9fhdO0qtf9YW0ajNRR2cBP/vRBSJJyeZwvEaU8jtIcQQz8vSIV6o
	 48KUb5iGtj3gg==
Date: Fri, 15 Nov 2024 10:39:41 -0600
From: Rob Herring <robh@kernel.org>
To: Christian Bruel <christian.bruel@foss.st.com>
Cc: lpieralisi@kernel.org, kw@linux.com, manivannan.sadhasivam@linaro.org,
	bhelgaas@google.com, krzk+dt@kernel.org, conor+dt@kernel.org,
	mcoquelin.stm32@gmail.com, alexandre.torgue@foss.st.com,
	p.zabel@pengutronix.de, cassel@kernel.org,
	quic_schintav@quicinc.com, fabrice.gasnier@foss.st.com,
	linux-pci@vger.kernel.org, devicetree@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 3/5] dt-bindings: PCI: Add STM32MP25 PCIe endpoint
 bindings
Message-ID: <20241115163941.GA3324312-robh@kernel.org>
References: <20241112161925.999196-1-christian.bruel@foss.st.com>
 <20241112161925.999196-4-christian.bruel@foss.st.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241112161925.999196-4-christian.bruel@foss.st.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241115_083944_780163_C6AC3F8C 
X-CRM114-Status: GOOD (  16.86  )
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

On Tue, Nov 12, 2024 at 05:19:23PM +0100, Christian Bruel wrote:
> STM32MP25 PCIe Controller is based on the DesignWare core configured as
> end point mode from the SYSCFG register.
> 
> Signed-off-by: Christian Bruel <christian.bruel@foss.st.com>
> ---
>  .../bindings/pci/st,stm32-pcie-ep.yaml        | 97 +++++++++++++++++++
>  1 file changed, 97 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/pci/st,stm32-pcie-ep.yaml
> 
> diff --git a/Documentation/devicetree/bindings/pci/st,stm32-pcie-ep.yaml b/Documentation/devicetree/bindings/pci/st,stm32-pcie-ep.yaml
> new file mode 100644
> index 000000000000..f0d215982794
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/pci/st,stm32-pcie-ep.yaml
> @@ -0,0 +1,97 @@
> +# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/pci/st,stm32-pcie-ep.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: STM32MP25 PCIe endpoint driver
> +
> +maintainers:
> +  - Christian Bruel <christian.bruel@foss.st.com>
> +
> +description:
> +  PCIe endpoint controller based on the Synopsys DesignWare PCIe core.
> +
> +allOf:
> +  - $ref: /schemas/pci/snps,dw-pcie-common.yaml#

snps,dw-pcie-ep.yaml

> +
> +properties:
> +  compatible:
> +    const: st,stm32mp25-pcie-ep
> +
> +  reg:
> +    items:
> +      - description: Data Bus Interface (DBI) registers.
> +      - description: PCIe configuration registers.
> +
> +  reg-names:
> +    items:
> +      - const: dbi
> +      - const: addr_space
> +
> +  clocks:
> +    maxItems: 1
> +    description: PCIe system clock
> +
> +  clock-names:
> +    const: core
> +
> +  resets:
> +    maxItems: 1
> +
> +  reset-names:
> +    const: core
> +
> +  phys:
> +    maxItems: 1
> +
> +  phy-names:
> +    const: pcie-phy
> +
> +  reset-gpios:
> +    description: GPIO controlled connection to PERST# signal
> +    maxItems: 1
> +
> +  access-controllers:
> +    maxItems: 1
> +
> +  power-domains:
> +    maxItems: 1

All these properties common between RC and EP modes should be in 
a shared schema.

> +
> +required:
> +  - resets
> +  - reset-names
> +  - clocks
> +  - clock-names
> +  - phys
> +  - phy-names
> +  - reset-gpios
> +
> +unevaluatedProperties: false
> +
> +examples:
> +  - |
> +    #include <dt-bindings/clock/st,stm32mp25-rcc.h>
> +    #include <dt-bindings/gpio/gpio.h>
> +    #include <dt-bindings/phy/phy.h>
> +    #include <dt-bindings/reset/st,stm32mp25-rcc.h>
> +
> +    pcie-ep@48400000 {
> +        compatible = "st,stm32mp25-pcie-ep";
> +        num-lanes = <1>;
> +        reg = <0x48400000 0x400000>,
> +              <0x10000000 0x8000000>;
> +        reg-names = "dbi", "addr_space";
> +        clocks = <&rcc CK_BUS_PCIE>;
> +        clock-names = "core";
> +        phys = <&combophy PHY_TYPE_PCIE>;
> +        phy-names = "pcie-phy";
> +        resets = <&rcc PCIE_R>;
> +        reset-names = "core";
> +        pinctrl-names = "default", "init";
> +        pinctrl-0 = <&pcie_pins_a>;
> +        pinctrl-1 = <&pcie_init_pins_a>;
> +        reset-gpios = <&gpioj 8 GPIO_ACTIVE_LOW>;
> +        power-domains = <&CLUSTER_PD>;
> +        access-controllers = <&rifsc 68>;
> +    };
> -- 
> 2.34.1
> 

