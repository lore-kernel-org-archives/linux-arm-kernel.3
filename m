Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 53BF8D13590
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 29 Oct 2024 07:33:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=wiDUUIxC7H3JG8Oc4GeiWrF2Noa6Fke+xpwLLt/EC2U=; b=PKT0bZP27h2tcqtXZMERAHPAf2
	66Ne7OwRb1IuCvz203x5hde5m2qWkDBtN7FqsQv5/OwzoBaCRque/76PKfxX8N3Y5YMwD1XLiPol0
	nMoMQXp9IDIKkeV2RLaR3McsWIizEaSTkjlDtYEhk5KMl+4UY3JTBTPLuvAs6hGQOzvFSmnjJmcCt
	50sinkiHYl4NxMGSyDirTE7MKa3cyDKr7GmydUFKQK05/xo4evpGkE/tI3dBkgfDkOrJZCJY5WC3D
	xDtpqxgLWl43RkGSzP7ymyxOkN2dY17uNI0COr92udZC2fm+eF6qfgzdM2wv6rq1df79o3S6JTQql
	UyIqA+yg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t5gjO-0000000DW0R-2xKk;
	Tue, 29 Oct 2024 07:33:34 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t5gcu-0000000DV1c-1HPj;
	Tue, 29 Oct 2024 07:26:53 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 2AE0DA416D7;
	Tue, 29 Oct 2024 07:24:55 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0C6EAC4CEE7;
	Tue, 29 Oct 2024 07:26:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1730186810;
	bh=OfDy3pu7lk5H7BVJLspV4tRTcIWQiqXeWKLmXffr99s=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=fpEzVPO+fGFz1o7Vs7hWwLW001fSFaUmtVqLscRnWiot5CiFdlMexcLiWb+iAA6gZ
	 oDRIgjitMnHux1JGrNYlDqGUOX4yJ1OyJXAPoy8zFmjHlMBveqimfzVNjmA0jjXquE
	 m3o4S4RPq3aagvWQl93cGXvtsytwUiD0H1pwFHNheeBukbzcxJzKMN8nFH3DkhCNLx
	 sbq+/ci1hqDbPsBaarw2bBfK2LC5u7fWMK11+5oWOQaPtA5z2ykWBeAeU9tyPQURm1
	 Y7CzoAUrlkfrTDYWgO2T8yOL86WyuMt2e2N0opMCxKVSX95lw78C5/41tYOWdQTJrr
	 7/ROJ5aaSAQew==
Date: Tue, 29 Oct 2024 08:26:47 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Andrea della Porta <andrea.porta@suse.com>
Cc: Michael Turquette <mturquette@baylibre.com>, 
	Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Florian Fainelli <florian.fainelli@broadcom.com>, 
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, Lorenzo Pieralisi <lpieralisi@kernel.org>, 
	Krzysztof Wilczynski <kw@linux.com>, Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>, 
	Bjorn Helgaas <bhelgaas@google.com>, Linus Walleij <linus.walleij@linaro.org>, 
	Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
	Bartosz Golaszewski <brgl@bgdev.pl>, Derek Kiernan <derek.kiernan@amd.com>, 
	Dragan Cvetic <dragan.cvetic@amd.com>, Arnd Bergmann <arnd@arndb.de>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Saravana Kannan <saravanak@google.com>, 
	linux-clk@vger.kernel.org, devicetree@vger.kernel.org, linux-rpi-kernel@lists.infradead.org, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, linux-pci@vger.kernel.org, 
	linux-gpio@vger.kernel.org, Masahiro Yamada <masahiroy@kernel.org>, 
	Stefan Wahren <wahrenst@gmx.net>, Herve Codina <herve.codina@bootlin.com>, 
	Luca Ceresoli <luca.ceresoli@bootlin.com>, Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
	Andrew Lunn <andrew@lunn.ch>
Subject: Re: [PATCH v3 02/12] dt-bindings: pinctrl: Add RaspberryPi RP1
 gpio/pinctrl/pinmux bindings
Message-ID: <mjhopgkrjahaxydn3ckianqnvjn55kxrldulvjkpqivlz72uyi@57l5vhydpzc2>
References: <cover.1730123575.git.andrea.porta@suse.com>
 <9a02498e0fbc135dcbe94adc7fc2d743cf190fac.1730123575.git.andrea.porta@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <9a02498e0fbc135dcbe94adc7fc2d743cf190fac.1730123575.git.andrea.porta@suse.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241029_002652_502396_B90BB4AF 
X-CRM114-Status: GOOD (  21.72  )
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

On Mon, Oct 28, 2024 at 03:07:19PM +0100, Andrea della Porta wrote:
> Add device tree bindings for the gpio/pin/mux controller that is part of
> the RP1 multi function device, and relative entries in MAINTAINERS file.
> 
> Signed-off-by: Andrea della Porta <andrea.porta@suse.com>
> ---
>  .../pinctrl/raspberrypi,rp1-gpio.yaml         | 163 ++++++++++++++++++
>  MAINTAINERS                                   |   2 +
>  2 files changed, 165 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/pinctrl/raspberrypi,rp1-gpio.yaml
> 
> diff --git a/Documentation/devicetree/bindings/pinctrl/raspberrypi,rp1-gpio.yaml b/Documentation/devicetree/bindings/pinctrl/raspberrypi,rp1-gpio.yaml
> new file mode 100644
> index 000000000000..465a53a6d84f
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/pinctrl/raspberrypi,rp1-gpio.yaml
> @@ -0,0 +1,163 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/pinctrl/raspberrypi,rp1-gpio.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: RaspberryPi RP1 GPIO/Pinconf/Pinmux Controller submodule
> +
> +maintainers:
> +  - Andrea della Porta <andrea.porta@suse.com>
> +
> +description:
> +  The RP1 chipset is a Multi Function Device containing, among other sub-peripherals,
> +  a gpio/pinconf/mux controller whose 54 pins are grouped into 3 banks. It works also

Please wrap code according to coding style (checkpatch is not a coding
style description but only a tool).

> +  as an interrupt controller for those gpios.
> +
> +properties:
> +  compatible:
> +    const: raspberrypi,rp1-gpio
> +
> +  reg:
> +    maxItems: 3
> +    description: One reg specifier for each one of the 3 pin banks.
> +
> +  '#gpio-cells':
> +    description: The first cell is the pin number and the second cell is used
> +      to specify the flags (see include/dt-bindings/gpio/gpio.h).
> +    const: 2
> +
> +  gpio-controller: true
> +
> +  gpio-ranges:
> +    maxItems: 1
> +
> +  gpio-line-names:
> +    maxItems: 54
> +
> +  interrupts:
> +    maxItems: 3
> +    description: One interrupt specifier for each one of the 3 pin banks.
> +
> +  '#interrupt-cells':
> +    description:
> +      Specifies the Bank number [0, 1, 2] and Flags as defined in
> +      include/dt-bindings/interrupt-controller/irq.h.
> +    const: 2
> +
> +  interrupt-controller: true
> +
> +additionalProperties:

Not much improved. You are supposed to have here pattern, just like
other bindings. I asked for this last time.

And there are examples using it - almost all or most of pinctrl
bindings, including bindings having subnodes (but you do not use such
case here).

> +  anyOf:
> +    - type: object
> +      additionalProperties: false
> +      allOf:
> +        - $ref: pincfg-node.yaml#
> +        - $ref: pinmux-node.yaml#
> +
> +      description:
> +        Pin controller client devices use pin configuration subnodes (children
> +        and grandchildren) for desired pin configuration.
> +        Client device subnodes use below standard properties.
> +
> +      properties:
> +        pins:
> +          description:
> +            A string (or list of strings) adhering to the pattern 'gpio[0-5][0-9]'
> +        function: true
> +        bias-disable: true
> +        bias-pull-down: true
> +        bias-pull-up: true
> +        slew-rate:
> +          description: 0 is slow slew rate, 1 is fast slew rate
> +          enum: [ 0, 1 ]
> +        drive-strength:
> +          enum: [ 2, 4, 8, 12 ]
> +
> +    - type: object
> +      additionalProperties:
> +        $ref: "#/additionalProperties/anyOf/0"

Your example does not use any subnodes, so this looks not needed.

Best regards,
Krzysztof


