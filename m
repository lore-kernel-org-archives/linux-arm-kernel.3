Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1C3FDC83F26
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 28 Jul 2025 22:56:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=SK/NDznNF5xIG9UZ2JX6YwAPNtJeRFw1p+CZfhfhdNE=; b=pzGtjzAcmrz0UeZPtZTBAozKlr
	jsJ8698mQug1lyImnVRPUMdJjk4VucfUUy0pV/WCdFjBSr9cXHBGuOJcG6dN8VGhAYmKpz1xKSS7I
	RT4TzE536DSW8QsIpECBuZhZ87VOKSxT4Sqlgsp9maJHYxx2elsERnkGuF5VWw94aqhORThfahpq8
	N4myWEKvkQodstSwJBOtug5cFZAlDKWnVhM+ivcGIcQP86ufzNmVielql2lRo9238/YV/5wIcLzAw
	KjWcOzl2qDxdVK3eervgz616QHuS8B1me+oSlu8HvK55vgXgMZBBmaNuFEHos6nys08+V1bn8MCGW
	+DXZ+4Hw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ugWlD-0000000FYTe-2yYW;
	Mon, 28 Jul 2025 22:55:59 +0000
Received: from woodpecker.gentoo.org ([140.211.166.183] helo=smtp.gentoo.org)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ugWik-0000000FYCZ-3BDO;
	Mon, 28 Jul 2025 22:53:28 +0000
Received: from localhost (unknown [116.232.124.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange secp256r1 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: dlan)
	by smtp.gentoo.org (Postfix) with ESMTPSA id E8D24341F0B;
	Mon, 28 Jul 2025 22:53:23 +0000 (UTC)
Date: Tue, 29 Jul 2025 06:53:19 +0800
From: Yixun Lan <dlan@gentoo.org>
To: Alex Elder <elder@riscstar.com>
Cc: gregkh@linuxfoundation.org, jirislaby@kernel.org, robh@kernel.org,
	krzk+dt@kernel.org, conor+dt@kernel.org, matthias.bgg@gmail.com,
	angelogioacchino.delregno@collabora.com, lkundrak@v3.sk,
	devicetree@vger.kernel.org, linux-serial@vger.kernel.org,
	spacemit@lists.linux.dev, linux-mediatek@lists.infradead.org,
	linux-riscv@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	kernel test robot <lkp@intel.com>
Subject: Re: [PATCH] dt-bindings: serial: 8250: allow "main" and "uart" as
 clock names
Message-ID: <20250728225319-GYA900803@gentoo>
References: <20250728220002.599554-1-elder@riscstar.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250728220002.599554-1-elder@riscstar.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250728_155326_820405_1DB39119 
X-CRM114-Status: GOOD (  20.79  )
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

Hi Alex,

On 17:00 Mon 28 Jul     , Alex Elder wrote:
> There are two compatible strings defined in "8250.yaml" that require
> two clocks to be specified, along with their names:
>   - "spacemit,k1-uart", used in "spacemit/k1.dtsi"
>   - "nxp,lpc1850-uart", used in "lpc/lpc18xx.dtsi"
> 
> When only one clock is used, the name is not required.  However there
> are two places that do specify a name:
>   - In "mediatek/mt7623.dtsi", the clock for the "mediatek,mtk-btif"
>     compatible serial device is named "main"
>   - In "qca/ar9132.dtsi", the clock for the "ns8250" compatible
>     serial device is named "uart"
> 
> In commit d2db0d7815444 ("dt-bindings: serial: 8250: allow clock 'uartclk'
> and 'reg' for nxp,lpc1850-uart"), Frank Li added the restriction that two
> named clocks be used for the NXP platform mentioned above.  Extend that
> so that the two named clocks used by the SpacemiT platform are similarly
> restricted.
> 
> Add "main" and "uart" as allowed names when a single clock is specified.
> 
> Fixes: 2c0594f9f0629 ("dt-bindings: serial: 8250: support an optional second clock")
> Reported-by: kernel test robot <lkp@intel.com>
> Closes: https://lore.kernel.org/oe-kbuild-all/202507160314.wrC51lXX-lkp@intel.com/
> Signed-off-by: Alex Elder <elder@riscstar.com>
> ---
>  .../devicetree/bindings/serial/8250.yaml      | 19 ++++++++++++++-----
>  1 file changed, 14 insertions(+), 5 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/serial/8250.yaml b/Documentation/devicetree/bindings/serial/8250.yaml
> index e46bee8d25bf0..cef52ebd8f7da 100644
> --- a/Documentation/devicetree/bindings/serial/8250.yaml
> +++ b/Documentation/devicetree/bindings/serial/8250.yaml
> @@ -61,11 +61,17 @@ allOf:
>              - const: uartclk
>              - const: reg
..
>      else:
would it be better to drop this 'else', and moving following 'if' block
to the same level with "nxp,lpc1850-uart"?

the reason here would avoid too many indentions if add more constraint in
the future if other SoC uart need different clock-names..

> -      properties:
> -        clock-names:
> -          items:
> -            - const: core
> -            - const: bus
> +      if:
> +        properties:
> +          compatible:
> +            contains:
> +              const: spacemit,k1-uart
> +      then:
> +        properties:
> +          clock-names:
> +            items:
> +              - const: core
> +              - const: bus
>  
>  properties:
>    compatible:
> @@ -162,6 +168,9 @@ properties:
>      minItems: 1
>      maxItems: 2
>      oneOf:
> +      - enum:
> +          - main
> +          - uart
>        - items:
>            - const: core
>            - const: bus
> 
> base-commit: 0b90c3b6d76ea512dc3dac8fb30215e175b0019a
> -- 
> 2.48.1
> 

-- 
Yixun Lan (dlan)

