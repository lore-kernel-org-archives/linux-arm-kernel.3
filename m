Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2743EC54ED1
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 27 May 2025 18:20:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=3CsvI9OTgZssZojEzUng3q3UpXAvPiHsj/3GXqU+umw=; b=rorGfxoFpgeO6Dif+8+98NNr85
	QTo3migju400kNnsaHFwxJ6ORUEArUuKTDWA4SmzNwYp46kGo9iofCxn7RqvPopQi7nQBuDqva1+1
	6idiu8M9B6i5SGs45Lr+djNtHjHIpy1THS1rGd6ws8auZg7qXkNL9R3S8Y5hibfqNxz10HYMjDBLe
	tzvuWT/K/d/sYSCGd/Ehuy5Ulqu5SAOad05HgdsoHQB9MuiP/kQQica96L2bAHrRy0HnNWWCO2oH2
	SOMxzOc+0ousVvdQGdfGjkx2CqId8wwIr1+HoVM4/4aykfCHwdEymoXpdbHXHyFaYVqR5nXqihBI1
	CsImA3xw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uJyuR-0000000BLUG-47bp;
	Tue, 27 May 2025 18:20:19 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uJysI-0000000BLGZ-47r3
	for linux-arm-kernel@lists.infradead.org;
	Tue, 27 May 2025 18:18:07 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 26BA26135E;
	Tue, 27 May 2025 18:18:06 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 972CAC4CEEB;
	Tue, 27 May 2025 18:18:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1748369885;
	bh=u2Q2XMni/0JmEMXMetOaDQk6KPODTqKODiQyRO8bX4I=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=bW1PwfHaYmYSR7STkMPVjnVHcc/CIOquE5UXw42KaVlkKFGa4BDM2RgY139NhHr+k
	 CN+59yCKhEyVqDMl5VuxGK/CGr+kfILSwlFaCe7UCovsFg0o7AzrG6ajZrt942K4JQ
	 ivtLd6lxuPd+52rHCsrHuW7NY0LTCEQatXo/AtN6BdMbnkhhbzFK5cPDI5vKEdZdQx
	 gHxZ/gy2TgkYrfiNGFIWf5dY/WTshP3WZ6VD4V6f1ZYOKjTJJ3UjfSun+Q9WPvkZk0
	 tLKq2TzKR7yF0n47fyEuRAsnvZp3fRq5qXNydeBoc8ERIEPmz+6ARmH//zFXhJkO0n
	 0HDNUqWRSyU0g==
Date: Tue, 27 May 2025 13:18:03 -0500
From: Rob Herring <robh@kernel.org>
To: Frank Li <Frank.Li@nxp.com>
Cc: Linus Walleij <linus.walleij@linaro.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Dong Aisheng <aisheng.dong@nxp.com>, Jacky Bai <ping.bai@nxp.com>,
	NXP S32 Linux Team <s32@nxp.com>,
	"open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
	"open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>,
	"open list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE" <imx@lists.linux.dev>,
	"moderated list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE" <linux-arm-kernel@lists.infradead.org>,
	open list <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH 1/1] dt-bindings: gpio: Move fsl,mxs-pinctrl.txt into
 gpio-mxs.yaml
Message-ID: <20250527181803.GA877374-robh@kernel.org>
References: <20250523203159.570982-1-Frank.Li@nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250523203159.570982-1-Frank.Li@nxp.com>
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

On Fri, May 23, 2025 at 04:31:57PM -0400, Frank Li wrote:
> Move mxs-pinctrl part into gpio-mxs.yaml and add pinctrl examples to fix
> below CHECK_DTB warning:
> 
> arch/arm/boot/dts/nxp/mxs/imx28-xea.dtb: pinctrl@80018000 (fsl,imx28-pinctrl):
>    'auart0-2pins@0', 'auart0@0',  ... 'usb1@1' do not match any of the regexes: 'gpio@[0-9]+$', 'pinctrl-[0-9]+'
> 
> Signed-off-by: Frank Li <Frank.Li@nxp.com>
> ---
>  .../devicetree/bindings/gpio/gpio-mxs.yaml    |  73 +++++++++-
>  .../bindings/pinctrl/fsl,mxs-pinctrl.txt      | 127 ------------------
>  2 files changed, 69 insertions(+), 131 deletions(-)
>  delete mode 100644 Documentation/devicetree/bindings/pinctrl/fsl,mxs-pinctrl.txt
> 
> diff --git a/Documentation/devicetree/bindings/gpio/gpio-mxs.yaml b/Documentation/devicetree/bindings/gpio/gpio-mxs.yaml
> index b58e08c8ecd8a..b3cf4682be3fd 100644
> --- a/Documentation/devicetree/bindings/gpio/gpio-mxs.yaml
> +++ b/Documentation/devicetree/bindings/gpio/gpio-mxs.yaml
> @@ -18,9 +18,11 @@ description: |
>  
>  properties:
>    compatible:
> -    enum:
> -      - fsl,imx23-pinctrl
> -      - fsl,imx28-pinctrl
> +    items:
> +      - enum:
> +          - fsl,imx23-pinctrl
> +          - fsl,imx28-pinctrl
> +      - const: simple-bus

I don't think the use of simple-bus is correct here. The addresses are 
not MMIO (there's no size), and I would guess the child nodes are 
dependent on the parent.

>  
>    '#address-cells':
>      const: 1
> @@ -31,6 +33,61 @@ properties:
>      maxItems: 1
>  
>  patternProperties:
> +  "^(?!gpio).*@[0-9]+$":

Unit-address should be hex? If not, then another reason this is not a 
simple-bus.

> +    type: object
> +    properties:
> +      fsl,pinmux-ids:
> +        $ref: /schemas/types.yaml#/definitions/uint32-array
> +        description: |
> +          An integer array.  Each integer in the array specify a pin
> +          with given mux function, with bank, pin and mux packed as below.
> +
> +          [15..12] : bank number
> +          [11..4]  : pin number
> +          [3..0]   : mux selection
> +
> +          This integer with mux selection packed is used as an entity by both group
> +          and config nodes to identify a pin.  The mux selection in the integer takes
> +          effects only on group node, and will get ignored by driver with config node,
> +          since config node is only meant to set up pin configurations.
> +
> +          Valid values for these integers are listed below.
> +
> +      reg:
> +        maxItems: 1

Would be good to say what 'reg' represents here.

> +
> +      fsl,drive-strength:
> +        $ref: /schemas/types.yaml#/definitions/uint32
> +        enum: [0, 1, 2, 3]
> +        description: |
> +          0: MXS_DRIVE_4mA
> +          1: MXS_DRIVE_8mA
> +          2: MXS_DRIVE_12mA
> +          3: MXS_DRIVE_16mA
> +
> +      fsl,voltage:
> +        $ref: /schemas/types.yaml#/definitions/uint32
> +        enum: [0, 1]
> +        description: |
> +          0: MXS_VOLTAGE_LOW  - 1.8 V
> +          1: MXS_VOLTAGE_HIGH - 3.3 V
> +
> +      fsl,pull-up:
> +        $ref: /schemas/types.yaml#/definitions/uint32
> +        enum: [0, 1]
> +        description: |
> +          0: MXS_PULL_DISABLE - Disable the internal pull-up
> +          1: MXS_PULL_ENABLE  - Enable the internal pull-up
> +
> +          Note that when enabling the pull-up, the internal pad keeper gets disabled.
> +          Also, some pins doesn't have a pull up, in that case, setting the fsl,pull-up
> +          will only disable the internal pad keeper.
> +
> +    required:
> +      - fsl,pinmux-ids
> +
> +    additionalProperties: false
> +
>    "gpio@[0-9]+$":
>      type: object
>      properties:
> @@ -80,7 +137,7 @@ examples:
>      pinctrl@80018000 {
>          #address-cells = <1>;
>          #size-cells = <0>;
> -        compatible = "fsl,imx28-pinctrl";
> +        compatible = "fsl,imx28-pinctrl", "simple-bus";
>          reg = <0x80018000 0x2000>;
>  
>          gpio@0 {
> @@ -132,4 +189,12 @@ examples:
>              interrupt-controller;
>              #interrupt-cells = <2>;
>          };
> +
> +        lcdif-apx4@5 {
> +            reg = <5>;
> +            fsl,pinmux-ids = <0x1181 0x1191>;
> +            fsl,drive-strength = <0>;
> +            fsl,voltage = <0>;
> +            fsl,pull-up = <0>;
> +        };
>      };

