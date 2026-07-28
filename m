Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3E5A9C54F51
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 28 Jul 2026 13:41:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=uLE38ZE2Nl64r7ZYfy8C3Gaet0hedSBZyrnSuaM9AOo=; b=mq2F9BPiOpA0HrevMWob0JsBwK
	UDGYIK7t8kCZWbVT8qAR2XMjexjKdOnMQ++U4iGd0F+u5S/p4GGCqoT7AQq/gJO6YGkVMkx+/c1ER
	aobODvOTg8m8yPNm/zjVU2vMdDULbEchQnlryIQeTy8zkEPrkH89HlPx22fEePHZqQvTsKX1owrS8
	ET9SsOIxCWCGz+5m8lDZAyKGGYatYLqpway7Wbfzc4NGZ5Ujh9O7Z8BJLf9ciZVaXhlw7jCg/SLAO
	6XSaD8SUTu4fBI3zeSd2LRt4Cny2kDISGD+O5TPul+G4ATVKZWC8429ODubmdFbLnSSfD63tpLH/V
	G8itkaEw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1woi3K-00000005NKd-0lCo;
	Tue, 28 Jul 2026 13:41:02 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1woi3I-00000005NJw-23iJ
	for linux-arm-kernel@lists.infradead.org;
	Tue, 28 Jul 2026 13:41:00 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id A016A60A9B
	for <linux-arm-kernel@lists.infradead.org>; Tue, 28 Jul 2026 13:40:59 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4A5B01F01559
	for <linux-arm-kernel@lists.infradead.org>; Tue, 28 Jul 2026 13:40:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785246059;
	bh=uLE38ZE2Nl64r7ZYfy8C3Gaet0hedSBZyrnSuaM9AOo=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=VOtQRQ1FNHpJCY6oZv+tRM7rG9KnugRqsOTe8hlqzlQ8jYSSZU6bbWmAZBX4ACMb2
	 ZIHFthXA17nF/SHqFUfiJdgQo7fR3M58h3L3q1iMyesmMYEfxTKk6TWyEUoYD17UJd
	 PvXMB51Shd7xCpfH3wHC1Dr07oxsmEk1+JqJmk9v8cQMBexHzDoJioBoiDI1L+XueJ
	 vkB+e8EyB8QwO/W5b0e6uD9QuwWiQ3FKTW1oKpzszaiMrdlaMkKVi9rEZl7ZWHGPqc
	 /CcrGqfisQMhMqU901n1J5ldGQChP1nfpVTFXZhF/BYETGAEYR69Ji1w5q2Wr3agTO
	 GEm5wH+FwHOLA==
Received: by mail-ej1-f45.google.com with SMTP id a640c23a62f3a-c15cb6f5c12so612728466b.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 28 Jul 2026 06:40:59 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AHgh+RqEaSk8t8qPCl1v2FSNkT1wWVjINeaXN71hbb7VxcbEytgUnwGXk6s7eAICKMYhGn0W8FIHKRrtS2FHYgCJPvXC@lists.infradead.org
X-Gm-Message-State: AOJu0YwBR4ScG3TQGDzAAk1sJcuiOfCkxlKkn3/wn76MWB/pSdPIxeU1
	amlX5J3DgJcsvQgViNMzgFIsnndlrUUBs89Wa7I+s6++a1q5webY2yNzcqQtD303AnZVc8nZ6gs
	q9vh6lPZAqpcguB7JFy/sqzg8LYwL2A==
X-Received: by 2002:a17:906:ee81:b0:c19:6104:e5e4 with SMTP id
 a640c23a62f3a-c1f7209ca5cmr127185766b.20.1785246057830; Tue, 28 Jul 2026
 06:40:57 -0700 (PDT)
MIME-Version: 1.0
References: <20260714114414.184512-1-angelogioacchino.delregno@collabora.com> <20260714114414.184512-43-angelogioacchino.delregno@collabora.com>
In-Reply-To: <20260714114414.184512-43-angelogioacchino.delregno@collabora.com>
From: Rob Herring <robh@kernel.org>
Date: Tue, 28 Jul 2026 08:40:45 -0500
X-Gmail-Original-Message-ID: <CAL_JsqJXpY8jHEgSHcHz4QZTFEZe8PLbO6vbpxWH4qobs0MPyA@mail.gmail.com>
X-Gm-Features: AUfX_mxvmD92NXelgjlyAlofvaufu78xVu0ncLV-YvDBbjclxGqXQU3uLBZ5iYE
Message-ID: <CAL_JsqJXpY8jHEgSHcHz4QZTFEZe8PLbO6vbpxWH4qobs0MPyA@mail.gmail.com>
Subject: Re: [PATCH v2 42/46] dt-bindings: display: mediatek: Introduce MT8196
 2D Sharpness Processor
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: chunkuang.hu@kernel.org, p.zabel@pengutronix.de, airlied@gmail.com, 
	simona@ffwll.ch, maarten.lankhorst@linux.intel.com, mripard@kernel.org, 
	tzimmermann@suse.de, krzk+dt@kernel.org, conor+dt@kernel.org, 
	matthias.bgg@gmail.com, dri-devel@lists.freedesktop.org, 
	linux-mediatek@lists.infradead.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	justin.yeh@mediatek.com, jason-jh.lin@mediatek.com, kernel@collabora.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
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

On Tue, Jul 14, 2026 at 6:45=E2=80=AFAM AngeloGioacchino Del Regno
<angelogioacchino.delregno@collabora.com> wrote:
>
> Add documentation for the Two-Dimension Sharpness Processor, or
> "TDSHP", found in many MediaTek SoCs including MT8196 and its
> variants.
>
> Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@coll=
abora.com>
> ---
>  .../mediatek/mediatek,mt8196-tdshp.yaml       | 98 +++++++++++++++++++
>  1 file changed, 98 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/display/mediatek/me=
diatek,mt8196-tdshp.yaml
>
> diff --git a/Documentation/devicetree/bindings/display/mediatek/mediatek,=
mt8196-tdshp.yaml b/Documentation/devicetree/bindings/display/mediatek/medi=
atek,mt8196-tdshp.yaml
> new file mode 100644
> index 000000000000..ccd6a8443443
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/display/mediatek/mediatek,mt8196-=
tdshp.yaml
> @@ -0,0 +1,98 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/display/mediatek/mediatek,mt8196-tdsh=
p.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: MediaTek Display Two-Dimension Sharpness Processor (TDSHP)
> +
> +maintainers:
> +  - AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
> +
> +description:
> +  The MediaTek 2D Sharpness Processor (TDSHP) is responsible for perform=
ing
> +  image sharpness adjustments/enhancements in a display pipeline.
> +  This hardware block supports adjusting the luma and contour 2d histogr=
ams,
> +  frequency weighting, luma-chroma gain and others, with adaptive weight=
s.
> +
> +properties:
> +  compatible:
> +    const: mediatek,mt8196-disp-tdshp
> +
> +  reg:
> +    maxItems: 1
> +
> +  clocks:
> +    maxItems: 1
> +
> +  power-domains:
> +    maxItems: 1
> +
> +  ports:
> +    $ref: /schemas/graph.yaml#/properties/ports
> +
> +    properties:
> +      port@0:
> +        $ref: /schemas/graph.yaml#/properties/port
> +
> +      port@1:
> +        $ref: /schemas/graph.yaml#/properties/port
> +
> +    required:
> +      - port@0
> +      - port@1
> +
> +  trigger-sources:
> +    maxItems: 1
> +
> +required:
> +  - compatible
> +  - reg
> +  - clocks
> +  - clock-names

This causes a warning.

Seems this is in linux-next already, but no reviews?

Rob

