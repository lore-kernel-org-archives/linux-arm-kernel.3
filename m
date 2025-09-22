Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 45528CA100F
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 22 Sep 2025 18:14:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=a1sZ6Thmp4v+XwdsKntnLF5edZt/lkPddr56xvXsYWY=; b=aSb5rrDdQf8B7MJVd57h/AR4yT
	bANrU/tmUt70sODe3ewHFcYYMZMcBlSlvkkj6yu4cKNfnJzuj6DIuLckb2TQwpD+DwKQqdZH8U0bX
	bivTYlnHJw3SB+OEOMnvW2iROd7x1KJuCevgnZ+rKij349jL0Dohx0wlBXsP4BldHAsSbAcPjIeSf
	ne5G830QkqRC0cG7100q0C51cqzS1AsuxyqbQe3ZmBF4WZ77qoQEaiTJn54W3s3TPC1n+23zbZVSD
	af5Zoepg8FF8Uactl+Xv+zOF6sWWaltrkq0I0KK1ToYVtc75RvA4tONIlpzT03FM/xdBTJ/A7a/fL
	V7o0M2jQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v0l2z-0000000BE6k-1Zqj;
	Mon, 22 Sep 2025 18:13:57 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v0l2x-0000000BE5t-3JRX;
	Mon, 22 Sep 2025 18:13:55 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 355D7601ED;
	Mon, 22 Sep 2025 18:13:25 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id ABED0C4CEF5;
	Mon, 22 Sep 2025 18:13:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1758564804;
	bh=ch3XJR3/J1ZY9eeHVCkTk3w1gXTPD/CTnWH+kKraEHE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Yk6ob/OGAwkGwWAGBkC3qGsL386M31FRg5HYHcF6fPnimFhdojR95nWwH1ZyzM8So
	 h7zcLzQJCGrZUbByHokQiq2rPXoQovFkjUIRLMWjh/C5NUAWvWT7r9jw+e6hVXqknQ
	 v/gyeUsRx5+lyUGTRB4ay78pCyjW8zJsxawdOzJeJ9USmCKNyQChfKIqy54MA59FlL
	 1CL0h2tfxpF4yPwQs6pFiHonmeFZIc1eK8syWFQeya/tghmGe8aRRHgEPqMyyDrhMe
	 97Nhgnd0kWevlM6zF4bWz0Z9Fz4Rql+DkHFKCo/IXy/gL4hzqII5Izi3/JAu1UA1HN
	 2b9fRV2dD7PDw==
Date: Mon, 22 Sep 2025 13:13:23 -0500
From: Rob Herring <robh@kernel.org>
To: Dang Huynh <dang.huynh@mainlining.org>
Cc: Manivannan Sadhasivam <mani@kernel.org>,
	Linus Walleij <linus.walleij@linaro.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>, Vinod Koul <vkoul@kernel.org>,
	Ulf Hansson <ulf.hansson@linaro.org>,
	Philipp Zabel <p.zabel@pengutronix.de>, Kees Cook <kees@kernel.org>,
	"Gustavo A. R. Silva" <gustavoars@kernel.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-unisoc@lists.infradead.org, linux-gpio@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-clk@vger.kernel.org, dmaengine@vger.kernel.org,
	linux-mmc@vger.kernel.org, linux-hardening@vger.kernel.org
Subject: Re: [PATCH 04/10] dt-bindings: mmc: Add RDA SDMMC controller
Message-ID: <20250922181323.GA556259-robh@kernel.org>
References: <20250919-rda8810pl-mmc-v1-0-d4f08a05ba4d@mainlining.org>
 <20250919-rda8810pl-mmc-v1-4-d4f08a05ba4d@mainlining.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250919-rda8810pl-mmc-v1-4-d4f08a05ba4d@mainlining.org>
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

On Fri, Sep 19, 2025 at 01:48:44AM +0700, Dang Huynh wrote:
> Add documentation describing the SD/MMC controller in RDA Micro
> RDA8810PL SoC.
> 
> Signed-off-by: Dang Huynh <dang.huynh@mainlining.org>
> ---
>  Documentation/devicetree/bindings/mmc/rda,mmc.yaml | 92 ++++++++++++++++++++++
>  1 file changed, 92 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/mmc/rda,mmc.yaml b/Documentation/devicetree/bindings/mmc/rda,mmc.yaml
> new file mode 100644
> index 0000000000000000000000000000000000000000..f3cda38abd66023ca9bc94d1c29df5ae9e211e7c
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/mmc/rda,mmc.yaml
> @@ -0,0 +1,92 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/mmc/rda,mmc.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: RDA Micro SD/MMC Controller
> +
> +allOf:
> +  - $ref: mmc-controller.yaml
> +
> +maintainers:
> +  - Dang Huynh <dang.huynh@mainlining.org>
> +
> +properties:
> +  compatible:
> +    items:
> +      - enum:
> +          - rda,8810pl-mmc
> +      - const: rda,mmc

Drop the generic compatible.

> +
> +  reg:
> +    maxItems: 1
> +
> +  interrupts:
> +    maxItems: 1
> +
> +  clocks:
> +    maxItems: 1
> +
> +  clock-names:
> +    const: mclk
> +
> +  resets:
> +    maxItems: 1
> +
> +  dmas:
> +    maxItems: 2
> +
> +  dma-names:
> +    items:
> +      - const: tx
> +      - const: rx
> +
> +  rda,mclk-adj:
> +    $ref: /schemas/types.yaml#/definitions/uint8
> +    description:
> +      Some board need MCLK output to be delayed for the card to work.
> +      If not present, MCLK output is not delayed.
> +    minimum: 0
> +    maximum: 255

You can drop the constraints if they are not less than uint8 range.

What are the units? 

I guess 'adj' means adjust. Just use 'rda,mclk-delay' to be more 
precise.

> +
> +  rda,mclk-inv:
> +    $ref: /schemas/types.yaml#/definitions/flag
> +    description:
> +      Some board need MCLK to be inverted for the card to work.
> +      If not present, MCLK is not inverted.
> +
> +required:
> +  - compatible
> +  - reg
> +  - interrupts
> +  - clocks
> +  - clock-names
> +  - resets
> +  - dmas
> +  - dma-names
> +  - vmmc-supply
> +
> +unevaluatedProperties: false
> +
> +examples:
> +  - |
> +    #include <dt-bindings/interrupt-controller/arm-gic.h>
> +    #include <dt-bindings/interrupt-controller/irq.h>
> +    #include <dt-bindings/clock/rda,8810pl-apclk.h>
> +    #include <dt-bindings/dma/rda-ifc.h>
> +    mmc@20950000 {
> +      compatible = "rda,8810pl-mmc", "rda,mmc";
> +      reg = <0x20950000 0x1000>;
> +      interrupts = <3 IRQ_TYPE_LEVEL_HIGH>;
> +      clocks = <&ap_syscon CLK_APB2>;
> +      clock-names = "mclk";
> +      resets = <&ap_syscon RST_APB2_SDMMC1>;
> +      dmas = <&ifc IFC_SDMMC1_TX>, <&ifc IFC_SDMMC1_RX>;
> +      dma-names = "tx", "rx";
> +      vmmc-supply = <&vdd_sdmmc>;
> +      rda,mclk-adj = /bits/ 8 <1>;
> +      rda,mclk-inv;
> +    };
> +
> +...
> 
> -- 
> 2.51.0
> 

