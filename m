Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B43ABC3ABD8
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 14 May 2025 20:57:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=aBcQ/7Hdog+YuyJJm6Onp8KYS+RbF4OmP4Tlxvzy6Mk=; b=dqiBcQg/C8DlC/0B+d6t1TIo5v
	RwJA7KVV4zBBkSjFQ4FW2GdDciG684wIjQzAd6GXchbHXa4x85Ys7JRv3+O8IbXBk9RINRNNFWr+Z
	FNUSXdmAOP9Gc+tP9kd+LQLiadusIwXHgFqI4i+FsMfyN9VBMAgXmv8XsA4/RxbAuIPdXYYpgpOIG
	pllmYvklQJF3szfL8RR1Dg8EnAY1KMixNhEh5Wghd4sbpJaBFgAJa1cQOLie/X+5Od18WuKUFXJm4
	nLY3xEPvniwiJaY02snh0kgsUVKOLZVQWL9qeeLkfHGgIhnKVGZTYCUXRL6jre3iDC08OqHDO7AGu
	IZhfM5Fw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uFJA4-0000000GKgD-47kP;
	Wed, 14 May 2025 20:57:08 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uFJ83-0000000GKVq-3tp8
	for linux-arm-kernel@lists.infradead.org;
	Wed, 14 May 2025 20:55:04 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id F1ACD61155;
	Wed, 14 May 2025 20:55:02 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3DB4AC4CEE3;
	Wed, 14 May 2025 20:55:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1747256102;
	bh=WxZ0hu8pwhaWeDuz2BpgcUbSog65VNpAS6OHgv+6y+4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=WO40+DZZZcN5EaXCYFM2I7IBDgFCCxzyphVbVqRnK2ii63t165oYoIC25f9v7nei6
	 u5vsR/ZGPNEEnlhCg/AOS4PdYzVMZaTXWw7oAPidek0hSuqcBZPreSRcoG29ufV3Cn
	 3npxU6Itw1qAeAhQqe/BWpTa28aLMs3gRwblfuyYMrfyaWolUCKpcwuvPhwBLKuLXd
	 y3nNiAMPks2aj+Xbc0Q2ILAdn3XAy4owXCgOJA6gAPEBTSAMQ2mB8MzrYOvM7CcJNS
	 Kq64ahJOq8g2vlGEJ3uGcAE+rwTX5RG2ptYVhThCl5hzoTs9Yd7R8ryxWknIZ1Znea
	 4gnatXnxhjrCA==
Date: Wed, 14 May 2025 15:55:00 -0500
From: Rob Herring <robh@kernel.org>
To: Sven Peter <sven@svenpeter.dev>
Cc: Janne Grunau <j@jannau.net>, Alyssa Rosenzweig <alyssa@rosenzweig.io>,
	Neal Gompa <neal@gompa.dev>, Hector Martin <marcan@marcan.st>,
	Linus Walleij <linus.walleij@linaro.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Sebastian Reichel <sre@kernel.org>, Lee Jones <lee@kernel.org>,
	Marc Zyngier <maz@kernel.org>,
	"Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>,
	asahi@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	linux-gpio@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: Re: [PATCH v5 03/10] dt-bindings: mfd: Add Apple Mac System
 Management Controller
Message-ID: <20250514205500.GA3001472-robh@kernel.org>
References: <20250511-smc-6-15-v5-0-f5980bdb18bd@svenpeter.dev>
 <20250511-smc-6-15-v5-3-f5980bdb18bd@svenpeter.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250511-smc-6-15-v5-3-f5980bdb18bd@svenpeter.dev>
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

On Sun, May 11, 2025 at 08:18:38AM +0000, Sven Peter wrote:
> From: "Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>
> 
> Add a DT binding for the Apple Mac System Management Controller.
> 
> Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>
> Reviewed-by: Linus Walleij <linus.walleij@linaro.org>
> Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> Reviewed-by: Alyssa Rosenzweig <alyssa@rosenzweig.io>
> Signed-off-by: Sven Peter <sven@svenpeter.dev>
> ---
>  .../devicetree/bindings/mfd/apple,smc.yaml         | 71 ++++++++++++++++++++++
>  MAINTAINERS                                        |  1 +
>  2 files changed, 72 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/mfd/apple,smc.yaml b/Documentation/devicetree/bindings/mfd/apple,smc.yaml
> new file mode 100644
> index 0000000000000000000000000000000000000000..9f1058c15bbf62d84f8a72fdaa354909b02e2801
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/mfd/apple,smc.yaml
> @@ -0,0 +1,71 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/mfd/apple,smc.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Apple Mac System Management Controller
> +
> +maintainers:
> +  - Sven Peter <sven@svenpeter.dev>
> +
> +description:
> +  Apple Mac System Management Controller implements various functions
> +  such as GPIO, RTC, power, reboot.
> +
> +properties:
> +  compatible:
> +    items:
> +      - enum:
> +          - apple,t6000-smc
> +          - apple,t8103-smc
> +          - apple,t8112-smc
> +      - const: apple,smc
> +
> +  reg:
> +    items:
> +      - description: SMC area
> +      - description: SRAM area
> +
> +  reg-names:
> +    items:
> +      - const: smc
> +      - const: sram
> +
> +  mboxes:
> +    maxItems: 1
> +
> +  gpio:
> +    $ref: /schemas/gpio/apple,smc-gpio.yaml
> +
> +  reboot:
> +    $ref: /schemas/power/reset/apple,smc-reboot.yaml
> +
> +additionalProperties: false
> +
> +required:
> +  - compatible
> +  - reg
> +  - reg-names
> +  - mboxes
> +
> +examples:
> +  - |
> +    soc {
> +      #address-cells = <2>;
> +      #size-cells = <2>;
> +
> +      smc@23e400000 {
> +        compatible = "apple,t8103-smc", "apple,smc";
> +        reg = <0x2 0x3e400000 0x0 0x4000>,
> +               <0x2 0x3fe00000 0x0 0x100000>;
> +        reg-names = "smc", "sram";
> +        mboxes = <&smc_mbox>;
> +
> +        smc_gpio: gpio {
> +          compatible = "apple,smc-gpio";
> +          gpio-controller;
> +          #gpio-cells = <2>;
> +        };
> +      };

If there's another version, please make the example here complete and 
drop the other incomplete examples in the child bindings.

Rob

