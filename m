Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0342FC61DD6
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  4 Sep 2026 14:45:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=LHADSBXrcRzI2pjE8Mt5DYoJu2ZeRffm/k2PyoibQUg=; b=VCKvzUrhTWDDKrZDKegwVBkGQg
	GBwDztbDvCGmonGFvY8I2yNmMUECTtEVJIiRWSTW3zZEbuYvB3tDtr6u85vM2s2esXTKJNwMaSBxP
	rbv3Y89/xMkGR95RcyeaDpDzCnp51BkECNRk5Apx69PbN354K1pRfbiAF4LFHWdJ+f9JyY82MPtWg
	yc/f3qD0yQuYdZZh8vykihDNK8XPynZF6N4XWPt+ZhSVk35dD+ZlGlZ6SEuVNWL1dsOaGc3yYE76b
	1aH4uW5shQveQreWunaHmfs2NjRQwuNkccG3PBCpQxKMuMhEhPY1tbijE24+BRZzOSVvah2tP7pRu
	nDCOoGMg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x2VAY-00000002Qj1-10Ee;
	Fri, 04 Sep 2026 14:45:30 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x2VAX-00000002Qif-0GbX
	for linux-arm-kernel@lists.infradead.org;
	Fri, 04 Sep 2026 14:45:29 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id A2BA543593;
	Fri,  4 Sep 2026 14:45:28 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 28B641F00A3D;
	Fri,  4 Sep 2026 14:45:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788533128;
	bh=LHADSBXrcRzI2pjE8Mt5DYoJu2ZeRffm/k2PyoibQUg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=bKKsQRV+2W8er9W9zPMxZVTQT9FXVczm0YCODHPaQKTW6Idf3VqWYDSXczRD4OOP+
	 iNbsQJjqHF9WA2hMn1R71omIQ7U5KN5gUaJr0j8OrEBhC5b4RDCR0pXzcA5rXfLHiD
	 xB5GiekqsUIKLQmk5cG9lWaKNpw3Ggb6kzeEfx3C2YmdiZ1kgrALE0azCLwZZ9raPP
	 LjQpDBvJRUnlaYc+IUUedU+VLlL1uooExGNgzPeQ1mFshbVv41yzzVUeAqg2P8+duB
	 RLx1nIUjLnZrsG75K6fKNuMDaF2jX8T6Jr5DPOLQxtAPaR8f7wLXr++b0JWKfePYeX
	 LcVkugdihZnIQ==
Date: Fri, 4 Sep 2026 09:45:25 -0500
From: Rob Herring <robh@kernel.org>
To: Long Zhao <longzhao@ambarella.com>
Cc: Arnd Bergmann <arnd@arndb.de>, Krzysztof Kozlowski <krzk@kernel.org>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	soc@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>, Linus Walleij <linusw@kernel.org>,
	Bartosz Golaszewski <brgl@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Jiri Slaby <jirislaby@kernel.org>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	Ilpo =?iso-8859-1?Q?J=E4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>, Long Zhao <zl020895@163.com>,
	Lee Jones <lee@kernel.org>, mfd@lists.linux.dev,
	devicetree@vger.kernel.org, linux-clk@vger.kernel.org,
	linux-gpio@vger.kernel.org, linux-serial@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v6 05/13] dt-bindings: gpio: pl061: add Ambarella CV75
 variant
Message-ID: <20260904144525.GA582418-robh@kernel.org>
References: <20260904-cv75-v5-v6-0-e918514cb3b1@ambarella.com>
 <20260904-cv75-v5-v6-5-e918514cb3b1@ambarella.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260904-cv75-v5-v6-5-e918514cb3b1@ambarella.com>
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

On Fri, Sep 04, 2026 at 02:38:12PM +0800, Long Zhao wrote:
> Document the Ambarella CV75 GPIO bank compatible and the synthetic
> arm,primecell-periphid used with the PL061 binding.
> 
> Signed-off-by: Long Zhao <longzhao@ambarella.com>
> ---
>  .../devicetree/bindings/gpio/pl061-gpio.yaml       | 32 +++++++++++++++++++---
>  1 file changed, 28 insertions(+), 4 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/gpio/pl061-gpio.yaml b/Documentation/devicetree/bindings/gpio/pl061-gpio.yaml
> index 4d970e55104b..5a6d95e84df2 100644
> --- a/Documentation/devicetree/bindings/gpio/pl061-gpio.yaml
> +++ b/Documentation/devicetree/bindings/gpio/pl061-gpio.yaml
> @@ -15,7 +15,9 @@ select:
>    properties:
>      compatible:
>        contains:
> -        const: arm,pl061
> +        enum:
> +          - arm,pl061
> +          - ambarella,cv75-gpio
>    required:
>      - compatible
>  
> @@ -24,9 +26,13 @@ properties:
>      pattern: "^gpio@[0-9a-f]+$"
>  
>    compatible:
> -    items:
> -      - const: arm,pl061
> -      - const: arm,primecell
> +    oneOf:
> +      - items:
> +          - const: arm,pl061
> +          - const: arm,primecell
> +      - items:
> +          - const: ambarella,cv75-gpio
> +          - const: arm,primecell

items:
  - enum:
      - ambarella,cv75-gpio
      - arm,pl061
  - const: arm,primecell


>  
>    reg:
>      maxItems: 1
> @@ -46,6 +52,10 @@ properties:
>  
>    clock-names: true
>  
> +  arm,primecell-periphid:
> +    $ref: /schemas/types.yaml#/definitions/uint32
> +    description: Override for the PrimeCell peripheral ID.

Add a $ref to primecell.yaml at the top level and drop this.

> +
>    "#gpio-cells":
>      const: 2
>  
> @@ -64,6 +74,20 @@ required:
>    - "#gpio-cells"
>    - gpio-controller
>  
> +allOf:
> +  - if:
> +      properties:
> +        compatible:
> +          contains:
> +            const: ambarella,cv75-gpio
> +    then:
> +      properties:
> +        arm,primecell-periphid:
> +          const: 0x000e8061
> +      required:
> +        - arm,primecell-periphid
> +        - gpio-ranges
> +
>  additionalProperties: false

And this will need to be unevaluatedProperties.

Rob

