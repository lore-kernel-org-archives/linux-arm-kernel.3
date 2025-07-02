Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7E02EC83F04
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  2 Jul 2025 15:23:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Ldaj61ICtdAuZIBPqJMGQlr4qlRCiLzbz1jlBOmZ3zU=; b=qGMNz4ti0EBPfqf3HavChqhlPF
	kYGe1bXVvhUhCtYjw2kfuCXFTyhoMfOX4ciwubEm9Ea9s2RsOzlUAKb9s4WvT+x4Eoi2nyjlOHnwd
	Gfn+JmyrStWHGtRpE1VlWSWP10LbJFyHVp3jvWbWp8tCMkt8rTPAk33AwjbJpX5snLdnnmtr/FEYW
	zk/BiTVCXoJ1pehiczXEv88QYG5iRYsTWyR2t6mu0V3Cn1vpkDnp1kUUSojrOTncU8PMN/yU9n/HD
	SfVKdcOIV0EK8udS76OFB8NS8wY3qd2xQD/a6gKfDr0ShXurYXfmFYzhpoi4A7/8Ln26V3wt2ra9a
	h7Ai5ApA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uWzJ7-00000008m8k-0sc3;
	Wed, 02 Jul 2025 15:23:33 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uWyMs-00000008cWy-2rz9
	for linux-arm-kernel@lists.infradead.org;
	Wed, 02 Jul 2025 14:23:23 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 1B69F43A32;
	Wed,  2 Jul 2025 14:23:22 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C58D3C4CEE7;
	Wed,  2 Jul 2025 14:23:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1751466202;
	bh=5xTRH5PYEaVJDARbqaeq3IhfaSjFqnrZPJsVGBRmnt4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=pArD1O/UwmfYrZAe86RreErEXF52+qIoEnoLQU+hhAnMWuOcAdFOjloPWrEtrBCQp
	 zZFb4YLZgiZ0Vq61POcF7jZO5M6NOYR09ft1QIklWZ2Lt9V/ArhZvehN6kUlEkmG/e
	 FqQPia48H7N82vy/1DxdNXZxxWYBRHLtT+ugmfLObCSkX4GNgdFEtI2goRT+d33D1Y
	 s+DZwh25hMpiMJLY4JkPC2tolt/w8gZ70iPpusFawKxfxyMYk+tIUeLwla7k/0LmiH
	 1OQnMwqguOdfdJ2pJ12fatyR0PxKX6u06jUN493EpHj0sFho/EPhpN/tdLK8SpZlaD
	 xmlA1VGo+dBag==
Date: Wed, 2 Jul 2025 09:23:21 -0500
From: Rob Herring <robh@kernel.org>
To: Albert Yang <yangzh0906@thundersoft.com>
Cc: krzk+dt@kernel.org, krzk@kernel.org, conor+dt@kernel.org,
	gordon.ge@bst.ai, catalin.marinas@arm.com,
	geert.uytterhoeven@gmail.com, will@kernel.org,
	ulf.hansson@linaro.org, adrian.hunter@intel.com, arnd@arndb.de,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org, linux-mmc@vger.kernel.org,
	soc@lists.linux.dev, bst-upstream@bstai.top,
	neil.armstrong@linaro.org, jonathan.cameron@huawei.com,
	bigfoot@classfun.cn, kever.yang@rock-chips.com, mani@kernel.org,
	geert+renesas@glider.be, andersson@kernel.org, nm@ti.com,
	nfraprado@collabora.com, quic_tdas@quicinc.com, ebiggers@google.com,
	victor.shih@genesyslogic.com.tw, shanchun1218@gmail.com,
	ben.chuang@genesyslogic.com.tw
Subject: Re: [PATCH v2 4/8] dt-bindings: mmc: add binding for BST DWCMSHC
 SDHCI controller
Message-ID: <20250702142321.GA1462423-robh@kernel.org>
References: <20250528085403.481055-1-yangzh0906@thundersoft.com>
 <20250702094444.3523973-1-yangzh0906@thundersoft.com>
 <20250702094444.3523973-5-yangzh0906@thundersoft.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250702094444.3523973-5-yangzh0906@thundersoft.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250702_072322_763392_86F610DD 
X-CRM114-Status: GOOD (  20.85  )
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

On Wed, Jul 02, 2025 at 05:44:40PM +0800, Albert Yang wrote:
> Add device tree binding documentation for the Black Sesame Technologies
> (BST) DWCMSHC SDHCI controller.
> 
> This binding describes the required and optional properties for the
> bst,dwcmshc-sdhci compatible controller, including register layout,
> interrupts, bus width, clock configuration, and other controller-specific
> features.
> 
> ---
> Changes for v2:
> - Simplified description, removed redundant paragraphs
> - Updated $schema to reference mmc-specific scheme
> - Corrected compatible to add soc name
> (bst,c1200-dwcmshc-sdhci)
> - Removed all redundant property descriptions
> - Dropped invalid mmc_crm_base/size properties, use reg for all address
> ranges
> - Cleaned up required properties to only essential entries
> - Standardized example DTS format, fixed reg syntax and property
> ordering
> - Removed additionalProperties: true
> 
> Signed-off-by: Ge Gordon <gordon.ge@bst.ai>
> Signed-off-by: Albert Yang <yangzh0906@thundersoft.com>
> ---
>  .../bindings/mmc/bst,dwcmshc-sdhci.yaml       | 67 +++++++++++++++++++
>  1 file changed, 67 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/mmc/bst,dwcmshc-sdhci.yaml
> 
> diff --git a/Documentation/devicetree/bindings/mmc/bst,dwcmshc-sdhci.yaml b/Documentation/devicetree/bindings/mmc/bst,dwcmshc-sdhci.yaml
> new file mode 100644
> index 000000000000..699dc404caac
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/mmc/bst,dwcmshc-sdhci.yaml
> @@ -0,0 +1,67 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/mmc/bst,dwcmshc-sdhci.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Black Sesame Technologies DWCMSHC SDHCI Controller
> +
> +maintainers:
> +  - Ge Gordon <gordon.ge@bst.ai>
> +
> +allOf:
> +  - $ref: mmc-controller.yaml#
> +
> +properties:
> +  compatible:
> +    const: bst,c1200-dwcmshc-sdhci
> +
> +  reg:
> +    maxItems: 2
> +    description: |
> +      Register base addresses and sizes for the SDHCI controller.
> +      First entry is the core SDHCI registers, second entry is the
> +      CRM registers.

items:
  - description: Core SDHCI registers
  - description: CRM registers

Though what CRM is should be defined.

> +
> +  interrupts:
> +    maxItems: 1
> +
> +  clocks:
> +    maxItems: 1
> +
> +  clock-names:
> +    items:
> +      - const: core
> +
> +  memory-region:
> +    maxItems: 1
> +
> +  dma-coherent: true
> +
> +required:
> +  - compatible
> +  - reg
> +  - interrupts
> +  - clocks
> +  - clock-names
> +
> +unevaluatedProperties: false
> +
> +examples:
> +  - |
> +    #include <dt-bindings/interrupt-controller/arm-gic.h>
> +
> +    mmc@22200000 {
> +        compatible = "bst,c1200-dwcmshc-sdhci";
> +        reg = <0x0 0x22200000 0x0 0x1000>,
> +              <0x0 0x23006000 0x0 0x1000>;
> +        interrupts = <GIC_SPI 144 IRQ_TYPE_LEVEL_HIGH>;
> +        clocks = <&clk_mmc>;
> +        clock-names = "core";
> +        memory-region = <&mmc0_reserved>;
> +        max-frequency = <200000000>;
> +        bus-width = <8>;
> +        non-removable;
> +        dma-coherent;
> +        status = "disabled";

Examples should be enabled. Drop.

> +    };
> -- 
> 2.25.1
> 

