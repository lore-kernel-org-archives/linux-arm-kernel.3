Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 322E0CA9ED0
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 12 Oct 2026 09:39:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=84ktSiAc3ep1HGqfqHtaoCm3J0cGPIJTEmmE4bm8YRY=; b=EcxMdxTSbT1Qj77MGrOwCnpTa/
	b5No5GdfXpHwMQ/e0et5RVWGbPkbR1dfsUt2yAdgAO3b3NkC8iJnvjZNhqc1WHGOIXv5L2r8O1PAO
	IaeMB7W/3slF2T35pxgEo8EUacX64KZt/Rtv4gEylXwTO46NfkVNkKhjAcipvlZMRSDuL9zLroGJz
	S5WR2MyUsZL7mhp3mdpPV6TfJ64lZQN9GtHFX+KVI57VPYFNHPJ+schKQs9fbcgtepEbbnGufAlR+
	SiP2bigSo3yS7DhtCr+8TTzVIrNKK5G0GzToMuBD1p6hpdppJo8xyTQk6rt5bGWufWfQEpjW/nZjf
	Xk52OQkQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xGCVJ-0000000A5Au-3w0t;
	Mon, 12 Oct 2026 09:39:33 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xGCVI-0000000A59o-3NHO;
	Mon, 12 Oct 2026 09:39:32 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id BD26C601DB;
	Mon, 12 Oct 2026 09:39:31 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7D1551F0089B;
	Mon, 12 Oct 2026 09:39:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791797971;
	bh=84ktSiAc3ep1HGqfqHtaoCm3J0cGPIJTEmmE4bm8YRY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=LUM1TEOIPbtIKfnhRLU2zF0J+EvVr5t2tr2g9di1kDiTS6gzk+0RymOXmAibyxOzj
	 QQ6FpayATCyqWkUq9/SUyorNLfc3HjSmkdiACWLLjlXxjxO0DHF/UmX+RgQD6u2Brb
	 mvZOQiFapYrVMp/Z0NDIGSdcJFPKIk/Fijg2JxeZHHRHrYTZuDnioPnrj1Ot653bcb
	 l/vUXjWEhfcN64/q418E6ge2geWxgH5t1xUMP157veiS6iegXoOhlJ1m0x8lYWtZPj
	 xc7hxrZR6Wt8MCntJL4WiZfcOeVlK/8TrOvmDRcBJkhq9KTi+ybmoyt7TCiPBMK/6E
	 WHQ1pKYFvdTlA==
Date: Mon, 12 Oct 2026 11:39:27 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Kyrie Wu <kyrie.wu@mediatek.com>
Cc: Tiffany Lin <tiffany.lin@mediatek.com>, 
	Andrew-CT Chen <andrew-ct.chen@mediatek.com>, Yunfei Dong <yunfei.dong@mediatek.com>, 
	Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, Nicolas Dufresne <nicolas.dufresne@collabora.com>, 
	Ricardo Ribalda <ribalda@chromium.org>, Kees Cook <kees@kernel.org>, 
	Hans Verkuil <hverkuil+cisco@kernel.org>, Fei Shao <fshao@chromium.org>, 
	Haoxiang Li <haoxiang_li2024@163.com>, Chen-Yu Tsai <wenst@chromium.org>, 
	Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>, Tomasz Figa <tfiga@chromium.org>, 
	Philipp Zabel <p.zabel@pengutronix.de>, Benjamin Gaignard <benjamin.gaignard@collabora.com>, 
	Qianfeng Rong <rongqianfeng@vivo.com>, Irui Wang <irui.wang@mediatek.com>, 
	Jacopo Mondi <jacopo.mondi@ideasonboard.com>, Fan Wu <fanwu01@zju.edu.cn>, linux-media@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
	Sakari Ailus <sakari.ailus@linux.intel.com>
Subject: Re: [PATCH v8 08/14] dt-bindings: media:
 mediatek,vcodec-subdev-decoder: Add MT8196
Message-ID: <20261012-inquisitive-scallop-of-business-baeb1e@quoll>
References: <cover.1791619742.git.kyrie.wu@mediatek.com>
 <e756699a4be5b530338e373842365e6698ed066b.1791619743.git.kyrie.wu@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <e756699a4be5b530338e373842365e6698ed066b.1791619743.git.kyrie.wu@mediatek.com>
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

On Sat, Oct 10, 2026 at 04:36:07PM +0800, Kyrie Wu wrote:
> Compared to previous ICs, the MT8196 supports a 10-bit decoder
> and has a decoding capability of 4K@120fps. It also supports
> 36-bit DRAM IOVA address and Video Power Control to optimize
> bandwidth and voltage usage.
> 
> Signed-off-by: Kyrie Wu <kyrie.wu@mediatek.com>
> Acked-by: Nicolas Dufresne <nicolas.dufresne@collabora.com>
> ---
>  .../media/mediatek,vcodec-subdev-decoder.yaml | 49 ++++++++++++++++++-
>  1 file changed, 48 insertions(+), 1 deletion(-)


Honestly, I see random approach your patches visible in how
inconsistently you use subject prefixes.

Where did you describe REASON to drop the tag?


> 
> diff --git a/Documentation/devicetree/bindings/media/mediatek,vcodec-subdev-decoder.yaml b/Documentation/devicetree/bindings/media/mediatek,vcodec-subdev-decoder.yaml
> index d1d209cb..d8f25ccd 100644
> --- a/Documentation/devicetree/bindings/media/mediatek,vcodec-subdev-decoder.yaml
> +++ b/Documentation/devicetree/bindings/media/mediatek,vcodec-subdev-decoder.yaml
> @@ -76,6 +76,7 @@ properties:
>        - mediatek,mt8186-vcodec-dec
>        - mediatek,mt8188-vcodec-dec
>        - mediatek,mt8195-vcodec-dec
> +      - mediatek,mt8196-vcodec-dec
>  
>    reg:
>      minItems: 1
> @@ -96,6 +97,11 @@ properties:
>        The node of system control processor (SCP), using
>        the remoteproc & rpmsg framework.
>  
> +  mediatek,vcp:
> +    $ref: /schemas/types.yaml#/definitions/phandle
> +    description: Phandle to the Video Companion Processor (VCP) that runs the
> +      video decoder firmware.
> +
>    "#address-cells":
>      const: 2
>  
> @@ -163,7 +169,6 @@ required:
>    - compatible
>    - reg
>    - iommus
> -  - mediatek,scp
>    - ranges
>  
>  if:
> @@ -179,6 +184,48 @@ then:
>      - interrupts
>  
>  allOf:
> +  - if:
> +      properties:
> +        compatible:
> +          contains:
> +            const: mediatek,mt8196-vcodec-dec
> +
> +    then:
> +      required:
> +        - mediatek,vcp
> +
> +      properties:
> +        mediatek,scp: false
> +
> +      patternProperties:
> +        '^video-codec@[0-9a-f]+$':
> +          properties:
> +            compatible:
> +              enum:
> +                - mediatek,mtk-vcodec-core
> +                - mediatek,mtk-vcodec-lat
> +

Missing constraints for clocks

> +            clock-names:
> +              items:
> +                - const: sel
> +                - const: vdec
> +                - const: lat
> +                - const: top

Best regards,
Krzysztof


