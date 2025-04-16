Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 16527C369C7
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 16 Apr 2025 20:13:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=BDn26bD/sVoa5eox1akKF1fG3Cbrhx05GjL11R6LTds=; b=G4mnDBMIHgmlr01NN7tXOd/IlB
	JjRwpKXctS23ZCf5HiuWGbMP1Y+R0bYkjxdvZ+kf4vnNVSyflriSyjDLKB2zI2W1mYBurP2YEQc7v
	tR8UhpL7tiLil26oOPJq441PThBW+iQG2tQCP2xMifg088QF8yE6st2SoS7VU5i9/Dq8X8d97rtgI
	AzHvvzLqT8deeF9ha1yryN5IvDT8rJ90oLqDVhF4E9SUon/wJ8dXr4lPCPRb1sagylsv08KLxsgt4
	hq5D8Opk4EEQmGARWsEmhT6yqp3Ue2XU/9n5W+8UX5kLcdBxqZBbsSTAlRYlythvV+NE5oschgC6f
	K67jv4FA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u598B-0000000AmHY-290T;
	Wed, 16 Apr 2025 20:13:11 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u5964-0000000Am1w-13ly
	for linux-arm-kernel@lists.infradead.org;
	Wed, 16 Apr 2025 20:11:01 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id B467C5C53A3;
	Wed, 16 Apr 2025 20:08:42 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2C191C4CEE2;
	Wed, 16 Apr 2025 20:10:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1744834259;
	bh=SSak+u5jFVfFMUW7Av1ja2Nldu+0bF8pHTXYXRdifBk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=fSmCipViEcJV+5wzo8ibu91cJy8mSWinHenOYUSP3XrBcgNiYzN7aKvzlWIl2bQzR
	 6D6r+lCekEyI1+XiujroVPVDf0Vk1lFlRfcJjUfLQ4KnJapYGxkHYEy7tyMhgX3C4T
	 T5+NMzmiZVdY7RRytwgwu5mxOKduWHl0gEeAP+5BCc153/3UCebfPvDz/1Kn2Z5mjJ
	 5jV04x52lEniGY8jPu/HVU5XcDd1tafOVDSnM6Q5+ZER2StD3fIMzxRPC28fmzHSp6
	 kuM7dgb9X3O1KUeQKZU6GS0B6EzQV3ZRzmAErBVPcLw9WyTQ+GHgrY/fCj0C5uGcrt
	 0D2LXPLBfNeJQ==
Date: Wed, 16 Apr 2025 15:10:57 -0500
From: Rob Herring <robh@kernel.org>
To: Alexey Charkov <alchark@gmail.com>
Cc: Krzysztof Kozlowski <krzk@kernel.org>,
	Andi Shyti <andi.shyti@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Thomas Gleixner <tglx@linutronix.de>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Ulf Hansson <ulf.hansson@linaro.org>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <ukleinek@kernel.org>,
	Daniel Lezcano <daniel.lezcano@linaro.org>,
	linux-arm-kernel@lists.infradead.org, linux-i2c@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-mmc@vger.kernel.org, netdev@vger.kernel.org,
	linux-pwm@vger.kernel.org
Subject: Re: [PATCH 02/13] dt-bindings: interrupt-controller:
 via,vt8500-intc: Convert to YAML
Message-ID: <20250416201057.GB3811555-robh@kernel.org>
References: <20250416-wmt-updates-v1-0-f9af689cdfc2@gmail.com>
 <20250416-wmt-updates-v1-2-f9af689cdfc2@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250416-wmt-updates-v1-2-f9af689cdfc2@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250416_131100_376765_1CE9E00F 
X-CRM114-Status: GOOD (  20.12  )
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

On Wed, Apr 16, 2025 at 12:21:27PM +0400, Alexey Charkov wrote:
> Rewrite the textual description for the VIA/WonderMedia interrupt
> controller as YAML schema.
> 
> Signed-off-by: Alexey Charkov <alchark@gmail.com>
> ---
>  .../interrupt-controller/via,vt8500-intc.txt       | 16 --------
>  .../interrupt-controller/via,vt8500-intc.yaml      | 47 ++++++++++++++++++++++
>  MAINTAINERS                                        |  1 +
>  3 files changed, 48 insertions(+), 16 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/interrupt-controller/via,vt8500-intc.txt b/Documentation/devicetree/bindings/interrupt-controller/via,vt8500-intc.txt
> deleted file mode 100644
> index 0a4ce1051b0252bbbdeef3288b90e9913d3f16f0..0000000000000000000000000000000000000000
> --- a/Documentation/devicetree/bindings/interrupt-controller/via,vt8500-intc.txt
> +++ /dev/null
> @@ -1,16 +0,0 @@
> -VIA/Wondermedia VT8500 Interrupt Controller
> ------------------------------------------------------
> -
> -Required properties:
> -- compatible : "via,vt8500-intc"
> -- reg : Should contain 1 register ranges(address and length)
> -- #interrupt-cells : should be <1>
> -
> -Example:
> -
> -	intc: interrupt-controller@d8140000 {
> -		compatible = "via,vt8500-intc";
> -		interrupt-controller;
> -		reg = <0xd8140000 0x10000>;
> -		#interrupt-cells = <1>;
> -	};
> diff --git a/Documentation/devicetree/bindings/interrupt-controller/via,vt8500-intc.yaml b/Documentation/devicetree/bindings/interrupt-controller/via,vt8500-intc.yaml
> new file mode 100644
> index 0000000000000000000000000000000000000000..a3fbe985db276e6a3b65cc66c7de097ed0719c0c
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/interrupt-controller/via,vt8500-intc.yaml
> @@ -0,0 +1,47 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/interrupt-controller/via,vt8500-intc.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: VIA and WonderMedia SoCs Interrupt Controller
> +
> +maintainers:
> +  - Alexey Charkov <alchark@gmail.com>
> +
> +allOf:
> +  - $ref: /schemas/interrupt-controller.yaml#
> +
> +
> +properties:
> +  compatible:
> +    const: via,vt8500-intc
> +
> +  reg:
> +    maxItems: 1
> +
> +  interrupts:
> +    maxItems: 8

This wasn't in the original binding. Find to add, but note that in 
the commit msg. Here, what each of the 8 entries are must be defined.

> +
> +  interrupt-controller: true
> +
> +  '#interrupt-cells':
> +    const: 1
> +
> +required:
> +  - compatible
> +  - reg
> +  - interrupt-controller
> +  - '#interrupt-cells'
> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    interrupt-controller@d8140000 {
> +        compatible = "via,vt8500-intc";
> +        interrupt-controller;
> +        reg = <0xd8140000 0x10000>;
> +        #interrupt-cells = <1>;
> +    };
> +...
> diff --git a/MAINTAINERS b/MAINTAINERS
> index c5195a98b15a39583d337fb6310b80432b0f6922..2444282096e03b301ed0e3209b4de7a114709764 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -3428,6 +3428,7 @@ M:	Krzysztof Kozlowski <krzk@kernel.org>
>  L:	linux-arm-kernel@lists.infradead.org (moderated for non-subscribers)
>  S:	Odd Fixes
>  F:	Documentation/devicetree/bindings/i2c/wm,wm8505-i2c.yaml
> +F:	Documentation/devicetree/bindings/interrupt-controller/via,vt8500-intc.yaml
>  F:	arch/arm/boot/dts/vt8500/
>  F:	arch/arm/mach-vt8500/
>  F:	drivers/clocksource/timer-vt8500.c
> 
> -- 
> 2.49.0
> 

