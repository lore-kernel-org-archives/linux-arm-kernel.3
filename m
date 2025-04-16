Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 62C1CC369C5
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 16 Apr 2025 20:16:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=fqFgAZ1PCTkegtItlR/+QnetnGFSuAC4O2NkVdti2kw=; b=CWHQzi5KYvYe7BVDunaFeLmF6F
	3QMH+z/fRs28BSXOdvEWfAghoHGnc1RHWo5qTxGaGFFzTGzPDEcjCS25naOg/wp84kGtA9qMwSoDD
	5zr+eYxYCB+EcNWLyD2NNVnJenN9BsrftqEP75ea3qA3J9fq9hJP0l791pAecBbmwmw+WOj9uYMOL
	lYW1eJD5UosTLvMeuGquXqIN+Ka2TMhZnvRWwliMaR1J7RE0Me7zT2DBCpujaYKNGgwHmSMCLzncW
	EWQ8XTSRvH20PDtEt0VxXLnacshZ7vk3/bteBt8HQJkQ5dE3XQIiWAou6GBvvRqgnynrpqR2uxviv
	GExyZZFA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u59B0-0000000AmoJ-1DnX;
	Wed, 16 Apr 2025 20:16:06 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u5998-0000000AmSu-26Qq
	for linux-arm-kernel@lists.infradead.org;
	Wed, 16 Apr 2025 20:14:12 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id C17325C062D;
	Wed, 16 Apr 2025 20:11:52 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3F3C2C4CEE2;
	Wed, 16 Apr 2025 20:14:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1744834449;
	bh=Hbyp2qYIwULebz/O5rS6U/XZYTxGIC5Vje0hnCXZaSE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=iYXPqZTWE69cli1lV6YFlQpvGFrMMKKucFTo10PJSXWkST2M8/3S+SC1Whvcwc3Vx
	 QlTQDqPmBc0yWRGlf2ivEtWCRS6dha9DvolhgVeyaTEv/qpyGrAZc7dyrchzFNTUzi
	 feYk0JSpEpcXhbYLNOCytilKbAbYM0G2z3byX7zoeGq+IH6fZQO1eldPDQKiLd2EKG
	 FkbKt6Wqe/ctklnx9U6VpLnYLWOvioi0mIDO8wfxQHuvLFKnMaemkuOEnrGGp0t5U7
	 y4rWx9+/dOoZP8dxijEMLOr5HtlJJhxySd6xjztGO48YwEGQEJ9H2pDPb4DwBRz15/
	 V/J8G6QYK6AJw==
Date: Wed, 16 Apr 2025 15:14:07 -0500
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
Subject: Re: [PATCH 03/13] dt-bindings: mmc: vt8500-sdmmc: Convert to YAML
Message-ID: <20250416201407.GC3811555-robh@kernel.org>
References: <20250416-wmt-updates-v1-0-f9af689cdfc2@gmail.com>
 <20250416-wmt-updates-v1-3-f9af689cdfc2@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250416-wmt-updates-v1-3-f9af689cdfc2@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250416_131410_650154_F4838686 
X-CRM114-Status: GOOD (  21.83  )
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

On Wed, Apr 16, 2025 at 12:21:28PM +0400, Alexey Charkov wrote:
> Rewrite the textual description for the WonderMedia SDMMC controller
> as YAML schema, and switch the filename to follow the compatible
> string.
> 
> Signed-off-by: Alexey Charkov <alchark@gmail.com>
> ---
>  .../devicetree/bindings/mmc/vt8500-sdmmc.txt       | 23 --------
>  .../devicetree/bindings/mmc/wm,wm8505-sdhc.yaml    | 61 ++++++++++++++++++++++
>  MAINTAINERS                                        |  1 +
>  3 files changed, 62 insertions(+), 23 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/mmc/vt8500-sdmmc.txt b/Documentation/devicetree/bindings/mmc/vt8500-sdmmc.txt
> deleted file mode 100644
> index d7fb6abb3eb8c87e698ca4f30270c949878f3cbf..0000000000000000000000000000000000000000
> --- a/Documentation/devicetree/bindings/mmc/vt8500-sdmmc.txt
> +++ /dev/null
> @@ -1,23 +0,0 @@
> -* Wondermedia WM8505/WM8650 SD/MMC Host Controller
> -
> -This file documents differences between the core properties described
> -by mmc.txt and the properties used by the wmt-sdmmc driver.
> -
> -Required properties:
> -- compatible: Should be "wm,wm8505-sdhc".
> -- interrupts: Two interrupts are required - regular irq and dma irq.
> -
> -Optional properties:
> -- sdon-inverted: SD_ON bit is inverted on the controller
> -
> -Examples:
> -
> -sdhc@d800a000 {
> -	compatible = "wm,wm8505-sdhc";
> -	reg = <0xd800a000 0x1000>;
> -	interrupts = <20 21>;
> -	clocks = <&sdhc>;
> -	bus-width = <4>;
> -	sdon-inverted;
> -};
> -
> diff --git a/Documentation/devicetree/bindings/mmc/wm,wm8505-sdhc.yaml b/Documentation/devicetree/bindings/mmc/wm,wm8505-sdhc.yaml
> new file mode 100644
> index 0000000000000000000000000000000000000000..a7d962bc13c7ff70b50448201b0416efc7f787af
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/mmc/wm,wm8505-sdhc.yaml
> @@ -0,0 +1,61 @@
> +# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/mmc/wm,wm8505-sdhc.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: WonderMedia SOC SoC SDHCI Controller
> +
> +maintainers:
> +  - Alexey Charkov <alchark@gmail.com>
> +
> +allOf:
> +  - $ref: mmc-controller.yaml#
> +
> +properties:
> +  compatible:
> +    oneOf:
> +      - const: wm,wm8505-sdhc
> +      - items:
> +          - const: wm,wm8650-sdhc
> +          - const: wm,wm8505-sdhc
> +      - items:
> +          - const: wm,wm8750-sdhc
> +          - const: wm,wm8505-sdhc
> +      - items:
> +          - const: wm,wm8850-sdhc
> +          - const: wm,wm8505-sdhc

Combine the last 3 entries into 1 using 'enum' for the 1st compatible.

> +
> +  reg:
> +    maxItems: 1
> +
> +  clocks:
> +    maxItems: 1
> +
> +  interrupts:
> +    items:
> +      - description: SDMMC controller interrupt
> +      - description: SDMMC controller DMA interrupt
> +
> +  sdon-inverted:
> +    type: boolean
> +    description: SD_ON bit is inverted on the controller

This implies I know what the non-inverted state is. If you know, please 
state that here.

> +
> +required:
> +  - compatible
> +  - reg
> +  - interrupts
> +  - clocks
> +
> +unevaluatedProperties: false
> +
> +examples:
> +  - |
> +    mmc@d800a000 {
> +        compatible = "wm,wm8505-sdhc";
> +        reg = <0xd800a000 0x1000>;
> +        interrupts = <20>, <21>;
> +        clocks = <&sdhc>;
> +        bus-width = <4>;
> +        sdon-inverted;
> +    };
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 2444282096e03b301ed0e3209b4de7a114709764..f106850b9d3d349d82953b672588b967a37ea27b 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -3429,6 +3429,7 @@ L:	linux-arm-kernel@lists.infradead.org (moderated for non-subscribers)
>  S:	Odd Fixes
>  F:	Documentation/devicetree/bindings/i2c/wm,wm8505-i2c.yaml
>  F:	Documentation/devicetree/bindings/interrupt-controller/via,vt8500-intc.yaml
> +F:	Documentation/devicetree/bindings/mmc/wm,wm8505-sdhc.yaml
>  F:	arch/arm/boot/dts/vt8500/
>  F:	arch/arm/mach-vt8500/
>  F:	drivers/clocksource/timer-vt8500.c
> 
> -- 
> 2.49.0
> 

