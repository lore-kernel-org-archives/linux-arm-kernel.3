Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 602A2D46947
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 21 Jan 2026 15:21:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=NYVYtvhdP/LXnCwfJ2g5hY80BiefCPprix89WSj4U2c=; b=q7m3ckLJq2r81BoCGiqxuPR0I1
	anuCY85arUlXaybnoaDENxM0sdZcpbiN/9GVy0Mf78J/9NckY6OpduZ65IDWP1DHAjDLFqWIQMzWd
	XZWGzekwPcYBSbd8cQbtRllqbdv0X7YY8fnZS8IctvWF8gFwGGuH508Eyk2BEWJDNTe5QRMAqTSk7
	eBHkX3UZBWJPVRVESWg3it6kVQu/K8CBzdkwrHWzVlPNBQNkSxTHxzw+w502YlrpR+dOJXHBAG3BN
	LNdxOQARgj1eqwHpcI0/VJgzxLQKhzIC7C2QIP3tLncW8+iAI8kDFvXA+PQvAViQe0849btRHIQsf
	fH2iOMqQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1via1R-00000005i35-2WVD;
	Wed, 21 Jan 2026 15:21:29 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1via1O-00000005i2W-3JlN
	for linux-arm-kernel@lists.infradead.org;
	Wed, 21 Jan 2026 15:21:28 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 0D3AC43D50;
	Wed, 21 Jan 2026 15:21:26 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C50F2C4CEF1;
	Wed, 21 Jan 2026 15:21:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1769008885;
	bh=L9QnTSalVdaocEzIxFlwNpJxuLWUieZvADC7B/XVsmI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=dlPOVgmAQL1Y8YIv7RMBVbBMLYq3hBniGba1bc2IbnBR/Hk7L/Jcn0hDwLB2RDcFK
	 7jU/KKFJvhfMSEFh+qPuG2hTytqVt8IN4OMovEGVS7wD6Om/EiK09GFW3xvuZfFXAs
	 ruLkpeMhVP8wCNQM1Wx4f/7ylOYluz8sqDWNKLLLdBln7gvJqY3WkNC5L3wisN2SPh
	 rf6g/yrraiPiKEgtDOsWgajeENFKWg/B4BcP9bjHzqf2JWmEL9oim61rUFtfGMYX3V
	 ILiqiQ2KqoWkm7XyRq+hXm8wu6NpjDN6RB5AuUw+vx0eOTi2a17VaditwevoGqSoqv
	 pThQymOXNrnFg==
Date: Wed, 21 Jan 2026 09:21:24 -0600
From: Rob Herring <robh@kernel.org>
To: Gatien Chevallier <gatien.chevallier@foss.st.com>
Cc: Suzuki K Poulose <suzuki.poulose@arm.com>,
	Mike Leach <mike.leach@linaro.org>,
	James Clark <james.clark@linaro.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Mathieu Poirier <mathieu.poirier@linaro.org>,
	Leo Yan <leo.yan@linux.dev>,
	=?iso-8859-1?Q?Cl=E9ment?= Le Goffic <legoffic.clement@gmail.com>,
	Linus Walleij <linusw@kernel.org>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	jens.wiklander@linaro.org, coresight@lists.linaro.org,
	linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com
Subject: Re: [PATCH v3 03/12] dt-bindings: bus: document the stm32 debug bus
Message-ID: <20260121152124.GA3179930-robh@kernel.org>
References: <20260121-debug_bus-v3-0-4d32451180d0@foss.st.com>
 <20260121-debug_bus-v3-3-4d32451180d0@foss.st.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260121-debug_bus-v3-3-4d32451180d0@foss.st.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260121_072126_864410_0C128FC9 
X-CRM114-Status: GOOD (  18.78  )
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

On Wed, Jan 21, 2026 at 01:34:37PM +0100, Gatien Chevallier wrote:
> Document the stm32 debug bus. The debug bus is responsible for
> checking the debug sub-system accessibility before probing any related
> drivers.
> 
> Signed-off-by: Gatien Chevallier <gatien.chevallier@foss.st.com>
> ---
>  .../bindings/bus/st,stm32mp131-dbg-bus.yaml        | 79 ++++++++++++++++++++++
>  1 file changed, 79 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/bus/st,stm32mp131-dbg-bus.yaml b/Documentation/devicetree/bindings/bus/st,stm32mp131-dbg-bus.yaml
> new file mode 100644
> index 000000000000..2db35e41e76c
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/bus/st,stm32mp131-dbg-bus.yaml
> @@ -0,0 +1,79 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/bus/st,stm32mp131-dbg-bus.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: STM32 Coresight bus
> +
> +maintainers:
> +  - Gatien Chevallier <gatien.chevallier@foss.st.com>
> +
> +description:
> +  The STM32 debug bus is in charge of checking the debug configuration
> +  of the platform before probing the peripheral drivers that rely on the debug
> +  domain.
> +
> +properties:
> +  compatible:
> +    items:
> +      - enum:
> +          - st,stm32mp131-dbg-bus
> +          - st,stm32mp151-dbg-bus
> +
> +  "#address-cells":
> +    const: 1
> +
> +  "#size-cells":
> +    const: 1
> +
> +  ranges: true
> +
> +  reg:
> +    maxItems: 1
> +
> +  "#access-controller-cells":
> +    const: 1
> +    description:
> +      Contains the debug profile necessary to access the peripheral.
> +
> +patternProperties:
> +  "^.*@[0-9a-f]+$":
> +    description: Debug related peripherals
> +    type: object
> +
> +    additionalProperties: true
> +
> +    required:
> +      - access-controllers
> +
> +required:
> +  - "#access-controller-cells"
> +  - "#address-cells"
> +  - "#size-cells"
> +  - compatible
> +  - ranges
> +  - reg
> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    #include <dt-bindings/clock/stm32mp1-clks.h>
> +
> +    dbg_bus: bus@50080000 {
> +      compatible = "st,stm32mp131-dbg-bus";
> +      reg = <0x50080000 0x3f80000>;

That's a lot of registers... Yet the bus driver doesn't access any. 
Looks to me like this belongs in ranges instead if there aren't any bus 
registers. Or its size should be just the registers and then the whole 
region size goes in ranges.

> +      #address-cells = <1>;
> +      #size-cells = <1>;
> +      #access-controller-cells = <1>;
> +      ranges;
> +
> +      cs_cti_trace: cti@50094000 {
> +        compatible = "arm,coresight-cti", "arm,primecell";
> +        reg = <0x50094000 0x1000>;
> +        clocks = <&rcc CK_DBG>;
> +        clock-names = "apb_pclk";
> +        access-controllers = <&dbg_bus 0>;
> +      };
> +    };
> 
> -- 
> 2.43.0
> 

