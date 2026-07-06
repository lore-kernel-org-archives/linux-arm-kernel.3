Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BE2B5C44500
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  6 Jul 2026 06:53:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=GqJKu5gWDZ/UYtVOCDNuBOQs8FjclaKQ1yPzLTbmJLE=; b=PUHOyPv0Zrfy4fBX4D7o0+oIa3
	+0rHjg33A3mwZDbvnFebggvCyii/IpSJsXeSSLh9tRunXU9NfaozsLDG7Bcs2AasvMA2kTOE9Vx+n
	SaUTYaTXUl3E+OO9VIaBtUJRpzolztaRq5dOGKF1+2raNZrSWoBq0S6U7r/2o0/Kkf3Cwy06bidbd
	cdD/+lW1W31KEAm3ZM3P+r3vERYIkx2fWw1DG1Uo+4ZIiplrPBkzCN+A9XInBwY8BGb8QY8gg74bL
	FnW2sDtU3yJAD5lF1KLJVjMoYvAy9J5b0oZ1rOrRy02+w/jVaUrP8h9foyjOPTf0S+6eYj7+USMyU
	1c7Qm6Sw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wgdCL-0000000BfGL-0XLR;
	Mon, 06 Jul 2026 06:52:57 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wgdCK-0000000BfFz-00H3
	for linux-arm-kernel@lists.infradead.org;
	Mon, 06 Jul 2026 06:52:56 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 6CBB940A84;
	Mon,  6 Jul 2026 06:52:55 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 582EF1F000E9;
	Mon,  6 Jul 2026 06:52:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783320775;
	bh=GqJKu5gWDZ/UYtVOCDNuBOQs8FjclaKQ1yPzLTbmJLE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=N61PiGho+yEliRWsdlEhUA25Ntfh+uCc1l0dS/x9FiocKW8k7ng0kBwMbOXn88W9A
	 nauN7Kc/AXHmucbexSQC9Cdm6cfQmVBZvikh0Jn65YTcc4ulUnoyHjNtW1j+IWO6xL
	 spxeTlhsJKkFM9eYz3S6v2cMowYtG1NyJ9F6knEpRhxo6JR8cdilsWDIjiPclLL14O
	 aLkyqI54Hl9n5bRKhkW5f4EDNJDvLI/wJiaUgiZUZU0vYpEvuI5uuZDY5JM48EimW2
	 NKWsN15efn4K30evc46ELHNSqCtUAXAEDHJc3wC0I7jxp76SOOTCnD+Vndl+sWzwnn
	 lVXILi6CroXzQ==
Date: Mon, 6 Jul 2026 08:52:51 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Paul Louvel <paul.louvel@bootlin.com>
Cc: Qiang Zhao <qiang.zhao@nxp.com>, 
	"Christophe Leroy (CS GROUP)" <chleroy@kernel.org>, Thomas Gleixner <tglx@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Linus Walleij <linusw@kernel.org>, Bartosz Golaszewski <brgl@kernel.org>, 
	Madhavan Srinivasan <maddy@linux.ibm.com>, Michael Ellerman <mpe@ellerman.id.au>, 
	Nicholas Piggin <npiggin@gmail.com>, linuxppc-dev@lists.ozlabs.org, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-gpio@vger.kernel.org, Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Subject: Re: [PATCH 04/12] dt-bindings: soc: fsl: qe: Add support of IRQ in
 QE GPIO
Message-ID: <20260706-elfish-cornflower-bullfinch-604e0a@quoll>
References: <20260703-qe-pic-gpios-v1-0-6c3e706e27dc@bootlin.com>
 <20260703-qe-pic-gpios-v1-4-6c3e706e27dc@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260703-qe-pic-gpios-v1-4-6c3e706e27dc@bootlin.com>
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

On Fri, Jul 03, 2026 at 03:30:12PM +0200, Paul Louvel wrote:
> Some QE GPIO pins have an associated interrupt line in the QE PIC to
> signal state changes on the pin.  Add the corresponding
> interrupt-controller / nexus properties to the QE GPIO binding.
> 
> Because the GPIO controller does not perform any interrupt handling
> itself, a nexus node (interrupt-map) is used to map each GPIO line
> supporting IRQ to the parent QE PIC interrupt domain.
> 
> As the QE PIC can be configured to generate an interrupt on either a
> high-to-low transition or any change in signal state, three
> interrupt-map entries are needed per GPIO pin that can yield an
> interrupt (falling, both, and the "none" case which defaults to both in
> QE PIC).  This overhead is necessary because the interrupt-map-pass-thru
> property is not part of the DT specification.
> 
> The interrupt-map property is optional: it is not required for GPIO
> banks that have no interrupt capable GPIO line (e.g. port D on MPC8323),
> or when interrupt functionality is not used.
> 
> Update the example to show a scenario where each bank supports a
> different numbers of IRQs, or no IRQs at all.
> 
> Signed-off-by: Paul Louvel <paul.louvel@bootlin.com>
> ---
>  .../bindings/gpio/fsl,mpc8323-qe-pario-bank.yaml   | 69 +++++++++++++++++++++-
>  1 file changed, 66 insertions(+), 3 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/gpio/fsl,mpc8323-qe-pario-bank.yaml b/Documentation/devicetree/bindings/gpio/fsl,mpc8323-qe-pario-bank.yaml
> index 1af99339ff40..0c849a5698f4 100644
> --- a/Documentation/devicetree/bindings/gpio/fsl,mpc8323-qe-pario-bank.yaml
> +++ b/Documentation/devicetree/bindings/gpio/fsl,mpc8323-qe-pario-bank.yaml
> @@ -27,6 +27,17 @@ properties:
>    "#gpio-cells":
>      const: 2
>  
> +  "#address-cells":
> +    const: 0
> +
> +  "#interrupt-cells":
> +    const: 2
> +

If this has interrupt-cells, then it is a nexus, thus why isn't this
also a "interrupt-controller"?

> +  interrupt-map:
> +    description: |
> +      Specifies the mapping of GPIO lines to the parent interrupt controller, as the
> +      GPIO controller does not do interrupt handling itself.
> +
>  required:
>    - compatible
>    - reg
> @@ -37,9 +48,61 @@ additionalProperties: false
>  
>  examples:
>    - |
> -    gpio-controller@1400 {
> -        compatible = "fsl,mpc8360-qe-pario-bank", "fsl,mpc8323-qe-pario-bank";
> -        reg = <0x1400 0x18>;

I don't get why you rewrite existing example instead of adding new one.

> +    #include <dt-bindings/interrupt-controller/irq.h>
> +
> +    pic: interrupt-controller {
> +      interrupt-controller;
> +      #address-cells = <0>;
> +      #interrupt-cells = <2>;
> +    };

Drop node, irrelevant.

> +
> +    gpio-controller@1418 {
> +        #gpio-cells = <2>;
> +        #address-cells = <0>;
> +        #interrupt-cells = <2>;
> +        compatible = "fsl,mpc8323-qe-pario-bank";
> +        reg = <0x1418 0x18>;

And now you are not following DTS coding style.

>          gpio-controller;
> +        interrupt-map = <
> +          7 IRQ_TYPE_EDGE_FALLING  &pic 4 IRQ_TYPE_EDGE_FALLING
> +          7 IRQ_TYPE_EDGE_BOTH     &pic 4 IRQ_TYPE_EDGE_BOTH
> +          7 0                      &pic 4 IRQ_TYPE_NONE
> +
> +          9 IRQ_TYPE_EDGE_FALLING  &pic 5 IRQ_TYPE_EDGE_FALLING
> +          9 IRQ_TYPE_EDGE_BOTH     &pic 5 IRQ_TYPE_EDGE_BOTH
> +          9 0                      &pic 5 IRQ_TYPE_NONE
> +
> +          25 IRQ_TYPE_EDGE_FALLING &pic 6 IRQ_TYPE_EDGE_FALLING
> +          25 IRQ_TYPE_EDGE_BOTH    &pic 6 IRQ_TYPE_EDGE_BOTH
> +          25 0                     &pic 6 IRQ_TYPE_NONE
> +
> +          27 IRQ_TYPE_EDGE_FALLING &pic 7 IRQ_TYPE_EDGE_FALLING
> +          27 IRQ_TYPE_EDGE_BOTH    &pic 7 IRQ_TYPE_EDGE_BOTH
> +          27 0                     &pic 7 IRQ_TYPE_NONE
> +        >;
> +    };
> +
> +    gpio-controller@1430 {
>          #gpio-cells = <2>;

So two new examples? But old one was wrong?

> +        #address-cells = <0>;
> +        #interrupt-cells = <2>;
> +        compatible = "fsl,mpc8323-qe-pario-bank";
> +        reg = <0x1430 0x18>;
> +        gpio-controller;
> +        interrupt-map = <
> +          24 IRQ_TYPE_EDGE_FALLING &pic 8 IRQ_TYPE_EDGE_FALLING
> +          24 IRQ_TYPE_EDGE_BOTH    &pic 8 IRQ_TYPE_EDGE_BOTH
> +          24 0                     &pic 8 IRQ_TYPE_NONE
> +
> +          29 IRQ_TYPE_EDGE_FALLING &pic 9 IRQ_TYPE_EDGE_FALLING
> +          29 IRQ_TYPE_EDGE_BOTH    &pic 9 IRQ_TYPE_EDGE_BOTH
> +          29 0                     &pic 9 IRQ_TYPE_NONE
> +        >;
> +    };
> +
> +    gpio-controller@1448 {
> +        #gpio-cells = <2>;
> +        compatible = "fsl,mpc8323-qe-pario-bank";

Wait, three examples? But isn't this the same as previous one?

> +        reg = <0x1448 0x18>;
> +        gpio-controller;
>      };
> 
> -- 
> 2.55.0
> 

