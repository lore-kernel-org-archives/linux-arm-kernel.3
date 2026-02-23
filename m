Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1509DEC111E
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 23 Feb 2026 18:43:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=GwS/rcTv7xHIQ8xE3NgjkxTV2Y6Bi4SIJCueSxpXaPU=; b=lQZpPUzh+KeXSQTaX0lsX7mHTV
	InaZlDmjqeId+vqQ5+CnKGHK7YExMX5qUp6ENR/yCSA74Rf150isNMRpvTsTEAKLvUpQkn2aX+XCL
	eJjqYFfnCgX1sbHQPxCtTnBM3CaS5MUOFBcNjMo+Kbtfs6uqyHRCjS2wNQ9lHsDI0+xwjgKCmYmCD
	cJpyddLfy2KY6LZhHsH0tSzNDPgnlSwoMUNxElfGrSE0F5FJOeJA6ctPCOBWQzOFr2ay2ovK//9ob
	wSl+QILrVcwiv2jxOtGNX8Jbq3459jXoXz75xjqVXhgF2axB9d/SWkrsQOf7VibX1YuRs/trbzN2p
	mBWIq+mw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vuatU-00000000sz2-0tC3;
	Mon, 23 Feb 2026 18:42:56 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vuatS-00000000sys-3sH7
	for linux-arm-kernel@lists.infradead.org;
	Mon, 23 Feb 2026 18:42:55 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 0E41360180;
	Mon, 23 Feb 2026 18:42:54 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 99A51C116D0;
	Mon, 23 Feb 2026 18:42:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1771872173;
	bh=cT3H/BWva655wpPwCwjSPUa7i99cwIZsZq5v7UNpNiU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=j5T9CLQIi4r6hjxZV/gWPZoUAq+M2qHc2cQ30X6BEjIQJ32c5mIYOsAY5cuZil7Mo
	 M7dMeymlrDMI1HefKWJQqkm5rMng83DMY1FxzER0jiUMNsBVc6B5DoDQFDL6YmZIa3
	 hkdZhvsJ6H9hbFhKvcwFYqHUqPKfONQAxYLmc6Fz8ZMtGd4fpw/lZ1hmWJGZdXyIUW
	 tWWssGb9LG5WYJOcApICbz5LOP6lSgc1Tm2CrJOOSjl6bZ9kABrpE8cDS+3QsX0SF0
	 Bv4uBEz0VpF6rDwar1v/Erda7b1Fb3Mv16yc9hbaP48im+EpH3AHMYPvEqdzIuzJ4p
	 QnOdV5X1bfTNw==
Date: Mon, 23 Feb 2026 12:42:52 -0600
From: Rob Herring <robh@kernel.org>
To: Frank Li <Frank.Li@nxp.com>
Cc: Peter Rosin <peda@axentia.se>, Linus Walleij <linusw@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	=?utf-8?B?UmFmYcWCIE1pxYJlY2tp?= <rafal@milecki.pl>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>, linux-kernel@vger.kernel.org,
	linux-gpio@vger.kernel.org, devicetree@vger.kernel.org,
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH 2/5] dt-bindings: pinctrl: Add generic pinctrl for
 board-level mux chips
Message-ID: <20260223184252.GA132202-robh@kernel.org>
References: <20260219-pinctrl-mux-v1-0-678d21637788@nxp.com>
 <20260219-pinctrl-mux-v1-2-678d21637788@nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260219-pinctrl-mux-v1-2-678d21637788@nxp.com>
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

On Thu, Feb 19, 2026 at 05:23:42PM -0500, Frank Li wrote:
> Add a generic pinctrl binding for board-level pinmux chips that are
> controlled through the multiplexer subsystem.
> 
> On some boards, especially development boards, external mux chips are used
> to switch SoC signals between different peripherals (e.g. MMC and UART).
> The mux select lines are often driven by a GPIO expander over I2C,
> as illustrated below:
> 
> 	┌──────┐      ┌─────┐
> 	│ SOC  │      │     │    ┌───────┐
> 	│      │      │     │───►│ MMC   │
> 	│      │      │ MUX │    └───────┘
> 	│      ├─────►│     │    ┌───────┐
> 	│      │      │     │───►│ UART  │
> 	│      │      └─────┘    └───────┘
> 	│      │         ▲
> 	│      │    ┌────┴──────────────┐
> 	│ I2C  ├───►│ GPIO Expander     │
> 	└──────┘    └───────────────────┘
> 
> Traditionally, gpio-hog is used to configure the onboard mux at boot.
> However, the GPIO expander may probe later than consumer devices such as
> MMC. As a result, the MUX might not be configured when the peripheral
> driver probes, leading to initialization failures or data transfer errors.
> 
> Introduce a generic pinctrl binding that models the board-level MUX as a
> pin control provider and builds proper device links between the MUX, its
> GPIO controller, and peripheral devices. This ensures correct probe
> ordering and reliable mux configuration.
> 
> The implementation leverages the standard multiplexer subsystem, which
> provides broad support for onboard mux controllers and avoids the need for
> per-driver custom MUX handling.

Seems reasonable to me.

> 
> Allow pinctrl-* pattern as node name because this pinctrl device have not
> reg property.
> 
> Signed-off-by: Frank Li <Frank.Li@nxp.com>
> ---
>  .../bindings/pinctrl/pinctrl-multiplexer.yaml      | 54 ++++++++++++++++++++++
>  .../devicetree/bindings/pinctrl/pinctrl.yaml       |  2 +-
>  2 files changed, 55 insertions(+), 1 deletion(-)
> 
> diff --git a/Documentation/devicetree/bindings/pinctrl/pinctrl-multiplexer.yaml b/Documentation/devicetree/bindings/pinctrl/pinctrl-multiplexer.yaml
> new file mode 100644
> index 0000000000000000000000000000000000000000..31efffb3167cba724b1afe0d403a0dcae65582ee
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/pinctrl/pinctrl-multiplexer.yaml
> @@ -0,0 +1,54 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/pinctrl/pinctrl-multiplexer.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Generic Pin Control Driver for Board-Level Mux Chips
> +
> +maintainers:
> +  - Frank Li <Frank.Li@nxp.com>
> +
> +description:
> +  This binding describes a generic pinctrl driver that controls on-board

Bindings don't describe drivers.

> +  pinmux chips using the multiplexer subsystem.
> +
> +properties:
> +  compatible:
> +    const: pinctrl-multiplexer
> +
> +patternProperties:
> +  '-grp$':
> +    type: object

       additionalProperties: false

The tools should have caught this, I'll have to check why not...

> +    properties:
> +      mux-states:
> +        maxItems: 1
> +
> +    required:
> +      - mux-states
> +
> +required:
> +  - compatible
> +
> +allOf:
> +  - $ref: pinctrl.yaml#
> +
> +unevaluatedProperties: false
> +
> +examples:
> +  - |
> +    pinctrl-mux {
> +        compatible = "pinctrl-multiplexer";
> +
> +        uart-grp {
> +            mux-states = <&mux 0>;
> +        };
> +
> +        spi-grp {
> +            mux-states = <&mux 1>;
> +        };
> +
> +        i2c-grp {
> +            mux-states = <&mux 2>;
> +        };
> +    };
> diff --git a/Documentation/devicetree/bindings/pinctrl/pinctrl.yaml b/Documentation/devicetree/bindings/pinctrl/pinctrl.yaml
> index 290438826c507ec6725f486d18cf686aa7c35e67..20176bf3074757de30f208e69b968a6bd6125273 100644
> --- a/Documentation/devicetree/bindings/pinctrl/pinctrl.yaml
> +++ b/Documentation/devicetree/bindings/pinctrl/pinctrl.yaml
> @@ -27,7 +27,7 @@ description: |
>  
>  properties:
>    $nodename:
> -    pattern: "^(pinctrl|pinmux)(@[0-9a-f]+)?$"
> +    pattern: "^(pinctrl|pinmux)(@[0-9a-f]+|-[a-z0-9]+)?$"
>  
>    "#pinctrl-cells":
>      description: >
> 
> -- 
> 2.43.0
> 

