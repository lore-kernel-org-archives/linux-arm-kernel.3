Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E624EC88E75
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 18 Sep 2026 07:15:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=yGXP8T1zvW5Ml5ZoTKLO3915Guu8fl2jGwWEp0ekuH8=; b=VDh1cBlLa9+ExjVdRai+OJdJ5s
	MZvd2kJTBxcAbqBHYMeh+ko4OgV2btSbw0r9oUgzbocepYHwqyURLDEOgtVHXIOMFsv8Nyau90Bz0
	DYBrWqc+JyDKUkN09FALMta/9JVR4l/SFBS5GRwQM+zGzSAkc5b5BXHEpXMeh7zx9Sa9lB1TwL9ad
	d5B5CwDvsHH/XE7R6WlKxB+Quy1TbLvpZKm9pRo+Xu14DFvlMcaXvWe22zZUYk/AOu4PynthiJULQ
	eEnNqStVsgIgOMnStUi/LzeDry4d6cx9csHcXkuPcwVZqIKiT9x8FaBOx0fK7rkywx5/Pv4zfd8ba
	uicLd7YA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x7Soi-0000000DfZm-1rM3;
	Fri, 18 Sep 2026 07:15:28 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x7Sog-0000000DfZP-2P6R
	for linux-arm-kernel@lists.infradead.org;
	Fri, 18 Sep 2026 07:15:26 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id B45356053E;
	Fri, 18 Sep 2026 07:15:25 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 559BC1F00893;
	Fri, 18 Sep 2026 07:15:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789715725;
	bh=yGXP8T1zvW5Ml5ZoTKLO3915Guu8fl2jGwWEp0ekuH8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=hhrdEkJPsCM1e0xAT8nx+2dL6Mk346k4lOVF4xldrlPrjN5pRcKLlC36i5umsgAEX
	 Mp9h8oSRLYPkXnX0ofmhNPnYdlFaaDlt75luOA2LPxQMGglwZYxE8YneYoFFIrm9VI
	 BlQBv75lqp6fBDi3G2QcfvUEtdAqHwbvPo2DdlOaS6Q4KNMSO4H/eGby5OJ08w8Jj5
	 Rqe5dl6AsQrb2fKQkEJpUbf3d2BeXzwkYnUjSNr6T93S99i6Iv352HA7tpVBA4Q3UO
	 Lgv9HZaeycMuaLOLue3xeMnw41S7U8WqPV4QoW/jUnIAui9ss1pj6XqDza7wqdaL1k
	 YsEo9YjVPbeIw==
Date: Fri, 18 Sep 2026 09:15:21 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Long Zhao <longzhao@ambarella.com>
Cc: Arnd Bergmann <arnd@arndb.de>, 
	Alexandre Belloni <alexandre.belloni@bootlin.com>, soc@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Michael Turquette <mturquette@baylibre.com>, 
	Stephen Boyd <sboyd@kernel.org>, Jerome Brunet <jbrunet@baylibre.com>, 
	Linus Walleij <linusw@kernel.org>, Bartosz Golaszewski <brgl@kernel.org>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Jiri Slaby <jirislaby@kernel.org>, 
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>, Ilpo =?utf-8?B?SsOkcnZpbmVu?= <ilpo.jarvinen@linux.intel.com>, 
	Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, Long Zhao <zl020895@163.com>, 
	Lee Jones <lee@kernel.org>, mfd@lists.linux.dev, devicetree@vger.kernel.org, 
	linux-clk@vger.kernel.org, linux-gpio@vger.kernel.org, linux-serial@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v7 05/15] dt-bindings: gpio: pl061: add Ambarella CV75
 variant
Message-ID: <20260918-affable-aardvark-of-superiority-6a5ed2@quoll>
References: <20260915-cv75-v5-v7-0-3297d3fbc9c0@ambarella.com>
 <20260915-cv75-v5-v7-5-3297d3fbc9c0@ambarella.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260915-cv75-v5-v7-5-3297d3fbc9c0@ambarella.com>
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

On Tue, Sep 15, 2026 at 07:15:35PM +0800, Long Zhao wrote:
> Add ambarella,cv75-gpio as a PrimeCell-compatible PL061 variant, with
> arm,primecell-periphid and gpio-ranges required. Reference

You just described the diff, but this should explain why you do these
changes. Why a fixed periphid is needed? Isn't it implied by compatible?

> primecell.yaml and use unevaluatedProperties.
> 
> Signed-off-by: Long Zhao <longzhao@ambarella.com>
> ---
>  .../devicetree/bindings/gpio/pl061-gpio.yaml       | 25 +++++++++++++++++++---
>  1 file changed, 22 insertions(+), 3 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/gpio/pl061-gpio.yaml b/Documentation/devicetree/bindings/gpio/pl061-gpio.yaml
> index 4d970e55104b..00d0d8ddd2c9 100644
> --- a/Documentation/devicetree/bindings/gpio/pl061-gpio.yaml
> +++ b/Documentation/devicetree/bindings/gpio/pl061-gpio.yaml
> @@ -15,17 +15,36 @@ select:
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
> +allOf:

allOf should be placed after "required:" block.

> +  - $ref: /schemas/arm/primecell.yaml#
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
>  properties:
>    $nodename:
>      pattern: "^gpio@[0-9a-f]+$"
>  
>    compatible:
>      items:
> -      - const: arm,pl061
> +      - enum:
> +          - ambarella,cv75-gpio
> +          - arm,pl061

So a PrimeCell-compatible PL061 variant which is not compatible with
PL061? You have entire commit msg to explain that and say something
non-obvious about the hardware.

>        - const: arm,primecell
>  

Best regards,
Krzysztof


