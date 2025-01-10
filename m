Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E574AE77188
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 10 Jan 2025 14:12:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=bXqVeapMhTwwMxHw1epq/5QLIlurPqqrqA54jwg2zo8=; b=mpaDQkaQFho37d299vIS5sRvod
	8SUTvj3Dgl69KPA2PTJqUclBz4HMe05UGkP1QiY6w/y+Ey8uykCgA2clL8oxsEA+7xkKfVT2x+aho
	MOemvqkj4rRiUhRUQ0HUa9f6FasTN//l46g9B71DMH2ydDLi06tOmExaC+sylYpnYyUmfpl9bBJEP
	TiMFUWdgOojEHztNljlQQUWgEUCJJ5C6rWZKpsx1Z0+4QlPQOw8RkajEipwrqSWki+RmpxuS1UR/3
	cT3tb4qzTY3M2xF849zTMQMTUK5J8SP2oE9BKVcClJs/K0K3jQyi6GFpqnMlbSRPxlxqUVKz1DgIM
	F6sXc1PA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tWFkA-0000000FbGu-29Gf;
	Fri, 10 Jan 2025 14:12:10 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tWFg7-0000000FaTu-3lMh;
	Fri, 10 Jan 2025 14:08:00 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=bXqVeapMhTwwMxHw1epq/5QLIlurPqqrqA54jwg2zo8=; b=VPvRtCS23zcJBcYkSFrKMxjHUw
	Bx09Fwst/AQG1lXu2X3y8qKAal12XaBnWcjtF1HT3SRldyum1SgdXptIeylaVUGlWj+u6IE6OpiOT
	wv/VAcYx7IXhXcLgBMy6USLQNTvgMVbYSTs580e/R3ACTtpFT/43lbS7de7cBvFSwPinC2o7+23iC
	rgMA/5YwQskdJ4pmm2lZp3QT/EZh1ooDZDGmGcfTZCyPLkTqrrC4t2w9XXJiLsEBQxnjAF8KQFUCO
	tgGHSZRiTn15kMI+H9lZ0SSDF5bttZYCc6YlT6yyWRDyM1DXod034hMBgD3LFJAu67SX66Zx5gIB9
	dBaYtzIQ==;
Received: from nyc.source.kernel.org ([147.75.193.91])
	by desiato.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tWFg4-00000009nGO-2wnM;
	Fri, 10 Jan 2025 14:07:58 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id D541BA41F1A;
	Fri, 10 Jan 2025 14:06:06 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D0C22C4CED6;
	Fri, 10 Jan 2025 14:07:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1736518075;
	bh=h9vJfhia9FmB8R5nTZlXxWCBnbQiNP0ULKa3jelu3Mo=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=WEF1V2wIfvpYmlT8ARjrLpEw6oA780J0eYY6cAF6KgVTLp8LXHg13IJMIaFU95ZFF
	 TUeQdwoBeQca86kVSJubqRbg5hljQiorFFBrvZ3+oiqUrC5D39wEhb9shcvpWR2cLj
	 Cqj/qXrwr0j8gJvCF+1pntKS0f5ONM0e9DAVUQhqmuxOvGKiES3HPdiyKy+h8xtHMY
	 VGDUXU0/R6csjmO+/WRUNoqHr6ZOGR6Zha6Q2JqL8ajgCcXlgFYIXcXmac+r5tT6Hk
	 4lfzeqGP6QHqBdpjbkVO7BpkuUfeAOgn9atFTqxJihAKZ1mLSyUp7caO50WBwJxwC9
	 GNH3XkuZuu4Sw==
Message-ID: <4dd4fade-1ea4-48aa-bc89-4299c70bdb86@kernel.org>
Date: Fri, 10 Jan 2025 15:07:47 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 02/11] dt-bindings: display: meson-vpu: Add compatible for
 S4 display controller
To: ao.xu@amlogic.com, Neil Armstrong <neil.armstrong@linaro.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Kevin Hilman <khilman@baylibre.com>,
 Jerome Brunet <jbrunet@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Cc: dri-devel@lists.freedesktop.org, linux-amlogic@lists.infradead.org,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org
References: <20250110-drm-s4-v1-0-cbc2d5edaae8@amlogic.com>
 <20250110-drm-s4-v1-2-cbc2d5edaae8@amlogic.com>
From: Krzysztof Kozlowski <krzk@kernel.org>
Content-Language: en-US
Autocrypt: addr=krzk@kernel.org; keydata=
 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 fv0=
In-Reply-To: <20250110-drm-s4-v1-2-cbc2d5edaae8@amlogic.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250110_140757_062162_2630F918 
X-CRM114-Status: GOOD (  12.90  )
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

On 10/01/2025 06:39, Ao Xu via B4 Relay wrote:
> From: Ao Xu <ao.xu@amlogic.com>
> 
> Add devicetree document for S4 VPU
> 
> Signed-off-by: Ao Xu <ao.xu@amlogic.com>
> ---
>  .../bindings/display/amlogic,meson-vpu.yaml        | 48 ++++++++++++++++++++--
>  1 file changed, 44 insertions(+), 4 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/display/amlogic,meson-vpu.yaml b/Documentation/devicetree/bindings/display/amlogic,meson-vpu.yaml
> index cb0a90f0232190031430c08f936b8f0d3b217601..3d7eceb3724e81d9c911039507df072d332a028f 100644
> --- a/Documentation/devicetree/bindings/display/amlogic,meson-vpu.yaml
> +++ b/Documentation/devicetree/bindings/display/amlogic,meson-vpu.yaml
> @@ -66,14 +66,13 @@ properties:
>            - const: amlogic,meson-gx-vpu
>        - enum:
>            - amlogic,meson-g12a-vpu # G12A (S905X2, S905Y2, S905D2)
> +          - amlogic,meson-s4-vpu # S4 (S905Y4)
>  
>    reg:
> -    maxItems: 2
> +    minItems: 2

Missing maxItems

>  
>    reg-names:
> -    items:
> -      - const: vpu
> -      - const: hhi
> +    minItems: 2

Just grow the list here with minItems

>  
>    interrupts:
>      maxItems: 1
> @@ -117,6 +116,47 @@ required:
>    - "#size-cells"
>    - amlogic,canvas
>  
> +allOf:
> +  - if:
> +      properties:
> +        compatible:
> +          contains:
> +            const: amlogic,meson-s4-vpu
> +    then:
> +      properties:
> +        reg:
> +          items:
> +            - description: vcbus registers
> +            - description: hhi registers
> +            - description: clkctrl registers
> +            - description: power control registers
> +            - description: sysctrl registers
> +        reg-names:
> +          items:
> +            - const: vpu
> +            - const: hhi
> +            - const: clkctrl
> +            - const: pwctrl
> +            - const: sysctrl

and here min/maxItems

> +        clocks:
> +          items:
> +            - description: vpu clock
> +            - description: vapb clock
> +        clock-names:
> +          items:
> +            - const: vpu
> +            - const: vapb

All properties must be defined in top-level. Just disallow it :false for
other variants.

> +    else:
> +      properties:
> +        reg:
> +          items:
> +            - description: vcbus registers
> +            - description: hhi registers
> +        reg-names:
> +          items:
> +            - const: vpu
> +            - const: hhi

maxItems: 2


Look how other bindings are doing it for lists with common parts.

Best regards,
Krzysztof

