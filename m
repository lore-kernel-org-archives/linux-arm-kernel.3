Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 211D2C5DF70
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 18 Aug 2026 08:16:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+twbnS8x+43vKdzheHsWDwA0dSiFFn5kkCZH2ejJPTw=; b=qX+FF9EvQPpkth29BVwOs+6MEQ
	kcZmmv/HQ6BYwv6Vda/OI4q4jM5CgVJkpPeilUDetDy9b3/kWc/ALA6dO5BGdgYq1OQ/NQccxcc37
	z9d0GUvorhnYnAoa/Y4HnI3+llRAqKgsnZjGt5vy3PUplxkPBOQvr5PU+fkTNgjgHw59ZYrknGkPI
	XbiJieBVTDZ+fW6SlrpQXoGqi5MRYdyxmBqbCzgqAtUq1biQbQBXLxIRZ0rFtX7su3s3AAyPUBTXo
	RwqXxbVfLuguFm/YiimekuH4N7ud6OdSDwxknpHzIoW4kCCwF7al36ATJXVpG5mtsPMYGQcVJqVKU
	jPQFNg4g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wwEzI-00000007VY1-2DPO;
	Tue, 18 Aug 2026 08:16:00 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wwEzH-00000007VXp-3YAR;
	Tue, 18 Aug 2026 08:15:59 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 09702601DE;
	Tue, 18 Aug 2026 08:15:59 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BB55F1F000E9;
	Tue, 18 Aug 2026 08:15:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1787040958;
	bh=+twbnS8x+43vKdzheHsWDwA0dSiFFn5kkCZH2ejJPTw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=Xk/geg+wnd2tgBOy7uUuxvOkOMcY9kU9dbvGJH4QIh+m/DVxet3ogHq1bEIM6OQ2o
	 ThxxXMCpZxPA0xCmYDrkDxQOnT5iGSq2Xo4VPrUhTYpAE/S2721vHfRbqfiMmZ66f4
	 tyf0qMPZn20fZ0G2AnH7OejTOhZUKEeqfVWWJ7xwyiKi0V/pm5WQkToFWiUhdCjnq4
	 6UJp8KF1Pd67RG+OmaPuuL8kIhWdYSZKKs6rmNbPgFF0rVn2PCUdztGEoz3h4wJ34K
	 aFBJ11WBOmloh7LkkTZDdRd3XdA26BUItA3dL97ZUYzHyFVcVpgrX8yyUfYxlLfGrL
	 dON8H0AQAcwGg==
Date: Tue, 18 Aug 2026 10:15:54 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Marek Vasut <marex@nabladev.com>
Cc: linux-usb@vger.kernel.org, Pankaj Dev <pankaj.dev@st.com>, 
	=?utf-8?Q?Cl=C3=A9ment?= Le Goffic <clement.legoffic@foss.st.com>, Gatien Chevallier <gatien.chevallier@foss.st.com>, 
	Alexandre Torgue <alexandre.torgue@foss.st.com>, Christian Bruel <christian.bruel@foss.st.com>, 
	Conor Dooley <conor+dt@kernel.org>, Fabrice Gasnier <fabrice.gasnier@foss.st.com>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Maxime Coquelin <mcoquelin.stm32@gmail.com>, Neil Armstrong <neil.armstrong@linaro.org>, 
	Rahul Kumar <rahul.kumar05@st.com>, Rob Herring <robh@kernel.org>, Rosen Penev <rosenp@gmail.com>, 
	Thinh Nguyen <Thinh.Nguyen@synopsys.com>, Vinod Koul <vkoul@kernel.org>, devicetree@vger.kernel.org, 
	kernel@dh-electronics.com, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, linux-phy@lists.infradead.org, 
	linux-stm32@st-md-mailman.stormreply.com
Subject: Re: [PATCH v2 5/9] dt-bindings: usb: dwc3: Document ST STM32MP2 DWC3
 xHCI USB controller
Message-ID: <20260818-brainy-burgundy-monkey-fc2a0d@quoll>
References: <20260816213849.1044073-1-marex@nabladev.com>
 <20260816213849.1044073-6-marex@nabladev.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260816213849.1044073-6-marex@nabladev.com>
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

On Sun, Aug 16, 2026 at 11:37:07PM +0200, Marek Vasut wrote:
> +properties:
> +  compatible:
> +    const: st,stm32mp25-dwc3
> +
> +  reg:
> +    maxItems: 1
> +
> +  access-controllers:
> +    maxItems: 1
> +
> +  clocks:
> +    minItems: 3
> +    maxItems: 3
> +
> +  clock-names:
> +    items:
> +      - const: ref
> +      - const: bus_early
> +      - const: suspend
> +
> +  dr_mode:
> +    $ref: /schemas/types.yaml#/definitions/string
> +    enum: [host, peripheral, otg]
> +
> +  interrupts:
> +    maxItems: 1
> +
> +  phys:
> +    minItems: 1
> +    maxItems: 2
> +
> +  phy-names:
> +    minItems: 1
> +    items:
> +      - const: usb2-phy
> +      - const: usb3-phy
> +
> +  resets:
> +    minItems: 1

Hm? You keep coming with some odd style, not present in any other files.
Where do you see such code - property followed by minItems alone? This
applies to other places as well.

> +
> +  st,syscfg:
> +    $ref: /schemas/types.yaml#/definitions/phandle-array
> +    description: Phandle to system configuration controller.
> +    items:
> +      - items:
> +          - description: phandle to syscfg
> +          - description: USB3DR control offset within syscfg
> +
> +  st,enable-port-power-control:
> +    type: boolean
> +    description: Enable Host-Mode Port Power Control (bit-3 of capability param HCCPARAMS)

Why wouldn't this be enavled always? Why is this a board-level property?

> +
> +  st,ovrcur-active-low:

Don't re-invent stuff:
st,over-current-active-low

> +    type: boolean
> +    description: Over-Current signal polarity is active-low
> +
> +  st,vbusen-active-low:
> +    type: boolean
> +    description: VBUS-ENABLE signal polarity is active-low
> +
> +required:
> +  - compatible
> +  - reg
> +  - clocks
> +  - clock-names
> +  - interrupts
> +  - phys
> +  - phy-names
> +  - resets
> +  - st,syscfg
> +
> +unevaluatedProperties: false

So where did you reference any other schema - for properties here and
for this unevaluatedProps?

> +
> +examples:
> +  - |
> +    #include <dt-bindings/clock/st,stm32mp25-rcc.h>
> +    #include <dt-bindings/interrupt-controller/arm-gic.h>
> +    #include <dt-bindings/reset/st,stm32mp25-rcc.h>
> +
> +    usb3dr: usb@48300000 {

Drop unused label

> +        compatible = "st,stm32mp25-dwc3";
> +        reg = <0x48300000 0x100000>;
> +        clocks = <&rcc CK_KER_USB2PHY2>, <&rcc CK_BUS_USB3DR>, <&rcc CK_KER_USB2PHY2>;
> +        clock-names = "ref", "bus_early", "suspend";
> +        interrupts = <GIC_SPI 228 IRQ_TYPE_LEVEL_HIGH>;
> +        phys = <&usb2_phy>, <&usb3_phy>;
> +        phy-names = "usb2-phy", "usb3-phy";
> +        resets = <&rcc USB3DR_R>;
> +        st,ovrcur-active-low;
> +        st,syscfg = <&syscfg 0x4800>;
> +        st,vbusen-active-low;
> +    };
> -- 
> 2.53.0
> 

