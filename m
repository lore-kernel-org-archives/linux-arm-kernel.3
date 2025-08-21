Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B4D07CA0EDC
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 21 Aug 2025 07:04:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Zr1ClKYb90yrQwVrgN/bVVgL9u31pYqFjhU2JA5XXNQ=; b=nl06kAc/xam42Ya69amyGuMMkx
	puRYT34HfM98uUK8mTT/rHAiBOpdN8JfLOcNS6Cjh6i/OgYx10YcFsVC4kvRnw9JhXFzJ8l6r6xho
	Alvv3OT2KRaOrBm0R3dxBIx9FJy6NBJhZ+9uWpdC+8kIMapEGfxrBKNM8JN0lsrYR5opMuT4XPH30
	FqCXkZHJtoAl33MY/1EI7MfJK+uadBVD3t84swe3jXgvwdqnQk1doWzYATVtK9UOCfNk3SxW4lnuI
	MNC/e3/GJndLKDQIdKEnxRNbkHNuFkBnLDN4H/k9/aJ7dpro6U1s7gQD4Z+oGR0x+qZWgHHQEWGP7
	S4Gard+g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uozLA-0000000G309-37At;
	Thu, 21 Aug 2025 07:04:04 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uoz3y-0000000FzYF-3Ce4;
	Thu, 21 Aug 2025 06:46:18 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 28592601E9;
	Thu, 21 Aug 2025 06:46:18 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 44E33C4CEED;
	Thu, 21 Aug 2025 06:46:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1755758777;
	bh=i+n/4B/MiYix4PhRatm6mvUq8Z++Ah+iaPndzC5npow=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=qWVE8Im28bcNByDb4nmbii+MVUYW1gsPh1TPxiVjMbVj3iGap2s3VVKOPiLVFPKnd
	 4Eu+45zODx7dsxT4FLsoLUe0zDJrLe5xa06Y4lRzGAeJkKV+7Q3eT3SmSmt7R0F38z
	 ra0pegJVHDO71R+XeH/4/xx8U4aL3pNN3wGmeUw2uRh0CQ0qpXe4RFtix1Xr1djnbJ
	 MJGnBfQGKhAyz67jrXPCbdi1Q5DUERLN2mJz5bq4a9VH+9MpAN986KJJnQD3D9pdrV
	 POjph9k+6aZgMrrQ5ZAoMjAy48TcKN2O+H2a4/6p5ClojOr7JIlJnE6/E4UsYZ4wFd
	 c5wAQG7EG7dcg==
Date: Thu, 21 Aug 2025 08:46:15 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Ariel D'Alessandro <ariel.dalessandro@collabora.com>
Cc: airlied@gmail.com, amergnat@baylibre.com, andrew+netdev@lunn.ch, 
	andrew-ct.chen@mediatek.com, angelogioacchino.delregno@collabora.com, broonie@kernel.org, 
	chunkuang.hu@kernel.org, ck.hu@mediatek.com, conor+dt@kernel.org, davem@davemloft.net, 
	dmitry.torokhov@gmail.com, edumazet@google.com, flora.fu@mediatek.com, 
	houlong.wei@mediatek.com, jeesw@melfas.com, jmassot@collabora.com, kernel@collabora.com, 
	krzk+dt@kernel.org, kuba@kernel.org, kyrie.wu@mediatek.corp-partner.google.com, 
	lgirdwood@gmail.com, linus.walleij@linaro.org, louisalexis.eyraud@collabora.com, 
	maarten.lankhorst@linux.intel.com, matthias.bgg@gmail.com, mchehab@kernel.org, 
	minghsiu.tsai@mediatek.com, mripard@kernel.org, p.zabel@pengutronix.de, pabeni@redhat.com, 
	robh@kernel.org, sean.wang@kernel.org, simona@ffwll.ch, 
	support.opensource@diasemi.com, tiffany.lin@mediatek.com, tzimmermann@suse.de, 
	yunfei.dong@mediatek.com, devicetree@vger.kernel.org, dri-devel@lists.freedesktop.org, 
	linux-arm-kernel@lists.infradead.org, linux-clk@vger.kernel.org, linux-gpio@vger.kernel.org, 
	linux-input@vger.kernel.org, linux-kernel@vger.kernel.org, linux-media@vger.kernel.org, 
	linux-mediatek@lists.infradead.org, linux-sound@vger.kernel.org, netdev@vger.kernel.org
Subject: Re: [PATCH v1 01/14] media: dt-bindings: Convert MediaTek mt8173-mdp
 bindings to YAML
Message-ID: <20250821-silky-slug-of-novelty-e4bb64@kuoka>
References: <20250820171302.324142-1-ariel.dalessandro@collabora.com>
 <20250820171302.324142-2-ariel.dalessandro@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250820171302.324142-2-ariel.dalessandro@collabora.com>
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

On Wed, Aug 20, 2025 at 02:12:49PM -0300, Ariel D'Alessandro wrote:
> Convert the existing text-based DT bindings for MediaTek MT8173 Media Data Path
> to a YAML schema.

Please wrap commit message according to Linux coding style / submission
process (neither too early nor over the limit):
https://elixir.bootlin.com/linux/v6.4-rc1/source/Documentation/process/submitting-patches.rst#L597

> 
> Signed-off-by: Ariel D'Alessandro <ariel.dalessandro@collabora.com>
> ---
>  .../bindings/media/mediatek,mt8173-mdp.yaml   | 174 ++++++++++++++++++
>  .../bindings/media/mediatek-mdp.txt           |  95 ----------
>  2 files changed, 174 insertions(+), 95 deletions(-)
>  create mode 100644 Documentation/devicetree/bindings/media/mediatek,mt8173-mdp.yaml
>  delete mode 100644 Documentation/devicetree/bindings/media/mediatek-mdp.txt
> 
> diff --git a/Documentation/devicetree/bindings/media/mediatek,mt8173-mdp.yaml b/Documentation/devicetree/bindings/media/mediatek,mt8173-mdp.yaml
> new file mode 100644
> index 0000000000000..f3a08afc305b1
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/media/mediatek,mt8173-mdp.yaml
> @@ -0,0 +1,174 @@
> +# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/media/mediatek,mt8173-mdp.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: MediaTek MT8173 Media Data Path
> +
> +maintainers:
> +  - Ariel D'Alessandro <ariel.dalessandro@collabora.com>
> +
> +description:
> +  Media Data Path is used for scaling and color space conversion.
> +
> +properties:
> +  compatible:
> +    oneOf:
> +      - items:

Just enum, no items here


> +          - enum:
> +              - mediatek,mt8173-mdp-rdma
> +              - mediatek,mt8173-mdp-rsz
> +              - mediatek,mt8173-mdp-wdma
> +              - mediatek,mt8173-mdp-wrot
> +      - items:
> +          - enum:
> +              - mediatek,mt8173-mdp-rdma
> +              - mediatek,mt8173-mdp-rsz
> +              - mediatek,mt8173-mdp-wdma
> +              - mediatek,mt8173-mdp-wrot
> +          - const: mediatek,mt8173-mdp

This makes no sense. How devices can be compatible and can not be
compatible.

> +
> +  reg:
> +    maxItems: 1
> +
> +  clocks: true

No, there's no such syntax. Look at other bindings.


> +
> +  power-domains:
> +    maxItems: 1
> +
> +  iommus:
> +    description: |

Drop |

> +      This property should point to the respective IOMMU block with master port as argument,
> +      see Documentation/devicetree/bindings/iommu/mediatek,iommu.yaml for details.

Drop entire description, completely redundant. I don't know why my patch
fixing this was not applied, so you keep repeating same mistakes...

> +    maxItems: 1
> +
> +  mediatek,vpu:
> +    $ref: /schemas/types.yaml#/definitions/phandle
> +    description:
> +      Describes point to vpu.

Useless description. We see that from the property name. Explain the
purpose in the hardware.

> +
> +required:
> +  - compatible
> +  - reg
> +  - clocks
> +  - power-domains
> +
> +allOf:
> +  - if:
> +      properties:
> +        compatible:
> +          contains:
> +            const: mediatek,mt8173-mdp-rdma
> +    then:
> +      properties:
> +        clocks:
> +          items:
> +            - description: Main clock
> +            - description: Mutex clock
> +    else:
> +      properties:
> +        clocks:
> +          items:
> +            - description: Main clock
> +
> +  - if:
> +      properties:
> +        compatible:
> +          contains:
> +            enum:
> +              - mediatek,mt8173-mdp-rdma
> +              - mediatek,mt8173-mdp-wdma
> +              - mediatek,mt8173-mdp-wrot
> +    then:
> +      required:
> +        - iommus
> +
> +  - if:
> +      properties:
> +        compatible:
> +          contains:
> +            const: mediatek,mt8173-mdp

This makes no sense either.

> +    then:
> +      required:
> +        - mediatek,vpu
> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    #include <dt-bindings/clock/mt8173-clk.h>
> +    #include <dt-bindings/memory/mt8173-larb-port.h>
> +    #include <dt-bindings/power/mt8173-power.h>
> +
> +    soc {
> +        #address-cells = <2>;
> +        #size-cells = <2>;
> +
> +        mdp_rdma0: rdma@14001000 {

One example is enough. Two could be fine if they differ significantly.

Best regards,
Krzysztof


