Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 031E0C9830E
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 24 Sep 2026 09:08:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=YMlQ1E3dLLZbk6ZXS/99g2ymvmTN+w4nDPxXeXxLA8c=; b=Gx2Yi2IwR4wIcd5mSQ2ZWH1odZ
	1SL6uvV59BUt2SvSx4taCm71Fqlsw8D3wFig9nmwS5O52q1Y68jCqE/D8EH5p8gMD1hXfJT2MWbkj
	2yaieTLepFcMZtVuDh6EDBGprAMXMPu1IhuWEEKV6cGgN7XOpKPEgFMEI1YEHeLnDpSyVHt4vT61I
	8pVLP7LGn4DNYQHDt/kICQNizv405WkoUOR6qTsHBypmZw8HPQTQVjAeRvrYHbWRRRdbAL9dgBp/n
	6/21r1vGO3aH5PZjvlnq6LNUd5EwT/cHWM6JlihTtdcl5gg7dh+VxEEhyPnMqVJuHQw9tYnmaeDTV
	iLupqvew==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9fQu-0000000AXXy-0RTb;
	Thu, 24 Sep 2026 09:08:00 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9fQj-0000000AXW9-3mNT
	for linux-arm-kernel@bombadil.infradead.org;
	Thu, 24 Sep 2026 09:07:50 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=YMlQ1E3dLLZbk6ZXS/99g2ymvmTN+w4nDPxXeXxLA8c=; b=bsuA2s5xmorwvOdNwXuv3dcfIa
	BHBuN3NPo10BQ3vseiA+TGOpUalgn79CcAHtM22tBqzTFTR1gAIRvo7hekWzGOv7BSeS4xbuRYXAz
	4vUaSlk0BaUsSdOduoW6ZqzMezjBomkYvIe4AB38XjO/fdsNJwKX8exTGVh5WbM9QMGV0JM++EIRf
	STETejTFIrlgse1QIX8U+dv4YWiHSd4wcR25oxcI+tdQSxyIPJ1n00ywN2RDlnTx+HnDlHSIhQRtg
	om9O8xtvH6AUkyug518ct6MKfJqT8IyeLARuk1txhs7vVU//J10BKr7lgG5FnBWEwdT1HqBWlkBmv
	nbL56vvQ==;
Received: from foss.arm.com ([217.140.110.172])
	by desiato.infradead.org with esmtp (Exim 4.99.2 #2 (Red Hat Linux))
	id 1x9fQf-0000000Fln2-3SoC
	for linux-arm-kernel@lists.infradead.org;
	Thu, 24 Sep 2026 09:07:48 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 6686B1516;
	Thu, 24 Sep 2026 02:07:40 -0700 (PDT)
Received: from [192.168.178.24] (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 8609B3F86F;
	Thu, 24 Sep 2026 02:07:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1790240863; bh=KCpkwX3n9hDTqSNw48pPQoWBY0FYrWUGqdnZtj2ba/c=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=Lg0Ij3N6WVWS4N+OYN2hfyqo2WvEhy7KK3wQywFVE5UG/R8DywLrfxYuW45vNJY6d
	 pmPerYPn3hSU4jzj0AFR4h3OaxXAhFO0GypCth150WgOVAF2J9ECiv7wyAsOmGv/19
	 8+/thaVS4iiXGenDxi+2mBgVObYURDzgpxm1V9/0=
Message-ID: <30c42b73-204d-4531-bd1a-1ee160a4b000@arm.com>
Date: Thu, 24 Sep 2026 11:07:40 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 03/11] dt-bindings: pinctrl: add Allwinner B288 pin
 controller
To: Pablo Mazzini <pmazzini@gmail.com>, Chen-Yu Tsai <wens@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Jernej Skrabec
 <jernej.skrabec@gmail.com>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Linus Walleij <linusw@kernel.org>, Rob Herring <robh@kernel.org>,
 Samuel Holland <samuel@sholland.org>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-sunxi@lists.linux.dev
References: <20260923201701.43391-1-pmazzini@gmail.com>
 <20260923201701.43391-3-pmazzini@gmail.com>
Content-Language: en-GB
From: Andre Przywara <andre.przywara@arm.com>
In-Reply-To: <20260923201701.43391-3-pmazzini@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260924_100746_616883_052F3FAB 
X-CRM114-Status: GOOD (  16.73  )
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

Hi Pablo,

On 9/23/26 22:16, Pablo Mazzini wrote:
> One controller at 0x01c20800 with four external interrupt banks.
> 
> Signed-off-by: Pablo Mazzini <pmazzini@gmail.com>
> ---
>   .../pinctrl/allwinner,sun8i-b288-pinctrl.yaml | 108 ++++++++++++++++++

Why is this a new file? Can't you just add the new compatible string to 
the existing allwinner,sun4i-a10-pinctrl.yaml binding?

Cheers,
Andre

P.S. Since we have seen this a lot lately: please wait with a new 
version of your series for a few days, to allow other people to comment, 
and to allow discussions to settle down. Not everyone can respond quickly.

>   1 file changed, 108 insertions(+)
>   create mode 100644 Documentation/devicetree/bindings/pinctrl/allwinner,sun8i-b288-pinctrl.yaml
> 
> diff --git a/Documentation/devicetree/bindings/pinctrl/allwinner,sun8i-b288-pinctrl.yaml b/Documentation/devicetree/bindings/pinctrl/allwinner,sun8i-b288-pinctrl.yaml
> new file mode 100644
> index 000000000000..806da97ab708
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/pinctrl/allwinner,sun8i-b288-pinctrl.yaml
> @@ -0,0 +1,108 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/pinctrl/allwinner,sun8i-b288-pinctrl.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Allwinner B288 Pin Controller
> +
> +maintainers:
> +  - Chen-Yu Tsai <wens@csie.org>
> +  - Jernej Skrabec <jernej.skrabec@gmail.com>
> +
> +properties:
> +  compatible:
> +    const: allwinner,sun8i-b288-pinctrl
> +
> +  reg:
> +    maxItems: 1
> +
> +  interrupts:
> +    description:
> +      One interrupt per bank of external interrupt capable pins.
> +    maxItems: 4
> +
> +  clocks:
> +    items:
> +      - description: Bus Clock
> +      - description: High Frequency Oscillator
> +      - description: Low Frequency Oscillator
> +
> +  clock-names:
> +    items:
> +      - const: apb
> +      - const: hosc
> +      - const: losc
> +
> +  gpio-controller: true
> +  interrupt-controller: true
> +  gpio-line-names: true
> +
> +  "#gpio-cells":
> +    const: 3
> +
> +  "#interrupt-cells":
> +    const: 3
> +
> +patternProperties:
> +  "-pins$":
> +    type: object
> +    $ref: /schemas/pinctrl/pincfg-node.yaml#
> +    additionalProperties: false
> +
> +    properties:
> +      pins: true
> +      function: true
> +      bias-pull-up: true
> +      bias-pull-down: true
> +      bias-disable: true
> +      drive-strength:
> +        enum: [10, 20, 30, 40]
> +
> +    required:
> +      - pins
> +      - function
> +
> +  "^vcc-p[bcdfg]-supply$":
> +    description:
> +      Power supplies for pin banks.
> +
> +required:
> +  - compatible
> +  - reg
> +  - interrupts
> +  - clocks
> +  - clock-names
> +  - gpio-controller
> +  - "#gpio-cells"
> +  - interrupt-controller
> +  - "#interrupt-cells"
> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    #include <dt-bindings/interrupt-controller/arm-gic.h>
> +    #include <dt-bindings/clock/sun8i-b288-ccu.h>
> +
> +    pio: pinctrl@1c20800 {
> +        compatible = "allwinner,sun8i-b288-pinctrl";
> +        reg = <0x01c20800 0x400>;
> +        interrupts = <GIC_SPI 15 IRQ_TYPE_LEVEL_HIGH>,
> +                     <GIC_SPI 16 IRQ_TYPE_LEVEL_HIGH>,
> +                     <GIC_SPI 21 IRQ_TYPE_LEVEL_HIGH>,
> +                     <GIC_SPI 17 IRQ_TYPE_LEVEL_HIGH>;
> +        clocks = <&ccu CLK_BUS_PIO>, <&osc24M>, <&osc32k>;
> +        clock-names = "apb", "hosc", "losc";
> +        gpio-controller;
> +        #gpio-cells = <3>;
> +        interrupt-controller;
> +        #interrupt-cells = <3>;
> +
> +        mmc0_pins: mmc0-pins {
> +            pins = "PF0", "PF1", "PF2", "PF3", "PF4", "PF5";
> +            function = "sdc0";
> +            drive-strength = <30>;
> +            bias-pull-up;
> +        };
> +    };


