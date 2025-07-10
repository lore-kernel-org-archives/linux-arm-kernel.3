Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 75F0FC83F17
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 11 Jul 2025 01:19:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=v1y8GyybSubrBjHhQP6QIZwaqjUj/BspSv/RXnn26NY=; b=yV2ak4DGoPC78OnuLz31rz2dWC
	nX3YuyeAXo+/Q9H/szbEXeEK9l/BhHNffvtcOg0YpcPqqVtk/9h5ff8UHdb0JyFngcJydTeBMKN2o
	0BZLt6x8lFWZHUiPuGtzA+/dGX9Wy3ucmLuygCxczHJIfJ5d/NgYcsV6G+jwp6GLZ7rprvPg1ImDu
	f9+N7SUdxwKZKFgTW0XlkL2YEbsJYOhibFYSreY0Bj10gzxHVJjIHm8X4ETshdEUq1joe63n98lvt
	rYPcjexP5M/wOrDed2t90VygpYWCW5rUjB+JXp9e/DOplqCrp7WZucyT3LnZs2MoO25vEFt0sl5S4
	8X6oScEQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ua2Q8-0000000DQ1V-3Slh;
	Fri, 11 Jul 2025 01:19:24 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uZz7I-0000000D5yU-3jJN
	for linux-arm-kernel@lists.infradead.org;
	Thu, 10 Jul 2025 21:47:46 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 66C475C0F77;
	Thu, 10 Jul 2025 21:47:44 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DB9E1C4CEE3;
	Thu, 10 Jul 2025 21:47:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1752184064;
	bh=38qOBtAa0la59Awj3HuO+ZqZhYtdC8Mzp5gPefGF6ME=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=uwehugbXDOU6yJ5ZmM+oDgTJsB44iLXjZMhjebZn2xddJt8rnpRIHszIsQEgU6CO5
	 86/hbFQAmaCMjmIRPMKOTcNyscxwT0rpRI9faF3yw1Pc7+GRxZnNdWUiSt5J5qe39n
	 N73liM7IoJqgczI82biIgSsXVAsK5KY/zac972yLIhoqx6RUSVdztA9mCmglGHgzNm
	 HmJ5A84zVDVfYJyzvNJR4Oe8wRKZKEnGIKjpWHoVS56hLcoaeYOlkUaRaEYixZLAxL
	 5FuYl3cRMtMa1mfX+Ved0n1m9bbqctuHC7so72JUmMwmOy8CzXlVfwdxb6pDTuz6vW
	 xt2tmM3KAL27A==
Date: Thu, 10 Jul 2025 16:47:43 -0500
From: Rob Herring <robh@kernel.org>
To: Duje =?utf-8?Q?Mihanovi=C4=87?= <duje@dujemihanovic.xyz>
Cc: Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Lubomir Rintel <lkundrak@v3.sk>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>, Andrew Lunn <andrew@lunn.ch>,
	Gregory Clement <gregory.clement@bootlin.com>,
	Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>,
	Kees Cook <kees@kernel.org>, Tony Luck <tony.luck@intel.com>,
	"Guilherme G. Piccoli" <gpiccoli@igalia.com>,
	Ulf Hansson <ulf.hansson@linaro.org>,
	David Wronek <david@mainlining.org>, Karel Balej <balejk@matfyz.cz>,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-hardening@vger.kernel.org, phone-devel@vger.kernel.org,
	~postmarketos/upstreaming@lists.sr.ht, soc@lists.linux.dev,
	linux-mmc@vger.kernel.org
Subject: Re: [PATCH v16 1/5] dt-bindings: mmc: sdhci-pxa: restrict pinctrl to
 pxav1
Message-ID: <20250710214743.GA4021364-robh@kernel.org>
References: <20250708-pxa1908-lkml-v16-0-b4392c484180@dujemihanovic.xyz>
 <20250708-pxa1908-lkml-v16-1-b4392c484180@dujemihanovic.xyz>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250708-pxa1908-lkml-v16-1-b4392c484180@dujemihanovic.xyz>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250710_144745_015018_70D0B988 
X-CRM114-Status: GOOD (  15.82  )
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

On Tue, Jul 08, 2025 at 07:09:46PM +0200, Duje Mihanović wrote:
> The current pinctrl properties apply only to the pxav1 controller.
> Adding one default pinctrl node to a pxav3 controller therefore causes
> a schema warning.
> 
> Check the existing properties only on pxav1. pxav2 and pxav3 may add
> their own set of pinctrl properties if and when needed.
> 
> Signed-off-by: Duje Mihanović <duje@dujemihanovic.xyz>
> ---
> Changes in v16:
> - New patch
> ---
>  .../devicetree/bindings/mmc/sdhci-pxa.yaml         | 36 ++++++++++++----------
>  1 file changed, 20 insertions(+), 16 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/mmc/sdhci-pxa.yaml b/Documentation/devicetree/bindings/mmc/sdhci-pxa.yaml
> index 4869ddef36fd89265a1bfe96bb9663b553ac5084..e7c06032048a3a73eb3eb67a887e75db273ffa92 100644
> --- a/Documentation/devicetree/bindings/mmc/sdhci-pxa.yaml
> +++ b/Documentation/devicetree/bindings/mmc/sdhci-pxa.yaml
> @@ -30,6 +30,26 @@ allOf:
>            maxItems: 1
>          reg-names:
>            maxItems: 1
> +  - if:
> +      properties:
> +        compatible:
> +          contains:
> +            const: mrvl,pxav1-mmc
> +    then:
> +      properties:
> +        pinctrl-names:
> +          description:
> +            Optional for supporting PXA168 SDIO IRQ errata to switch CMD pin between
> +            SDIO CMD and GPIO mode.
> +          items:
> +            - const: default
> +            - const: state_cmd_gpio
> +        pinctrl-0:
> +          description:
> +            Should contain default pinctrl.
> +        pinctrl-1:
> +          description:
> +            Should switch CMD pin to GPIO mode as a high output.
>  
>  properties:
>    compatible:
> @@ -62,22 +82,6 @@ properties:
>        - const: io
>        - const: core
>  
> -  pinctrl-names:
> -    description:
> -      Optional for supporting PXA168 SDIO IRQ errata to switch CMD pin between
> -      SDIO CMD and GPIO mode.

       minItems: 1

Won't adding this 1 line here solve your whole problem?

> -    items:
> -      - const: default
> -      - const: state_cmd_gpio
> -
> -  pinctrl-0:
> -    description:
> -      Should contain default pinctrl.
> -
> -  pinctrl-1:
> -    description:
> -      Should switch CMD pin to GPIO mode as a high output.
> -
>    mrvl,clk-delay-cycles:
>      description: Specify a number of cycles to delay for tuning.
>      $ref: /schemas/types.yaml#/definitions/uint32
> 
> -- 
> 2.50.0
> 

