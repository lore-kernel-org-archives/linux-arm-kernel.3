Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BC71DC55184
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  4 Aug 2026 18:20:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=g08EIf41pC8GEK9juMB6Ku4OixyItou7ZrSB0SvDB9s=; b=y4188Cz4NrA+VxiqvdiPLW6PQL
	lJxjLF8e46jGFYBW7Zl2bcGpO6CggHg1YzKU7vXVjggsymlWvNBIXALJUJ460IubiFNb/nISOwhNO
	HygLZ9OIakBcA13ERjTvqWRIJ8+IWfyD2kihWkdvDm/+7k+eh0vG8zxb/XY61fFHzCDswNR9WmWgD
	mut6jBuq7NhEsnEojvrBc3xCazGxWcVC2ZbPEEJV0OK8UjSav83E7pRJFQA8gPpWtK/Q6mJjvPRlq
	i0ilWx/2Na6TqH8D7sCUOc1ao8glhj6acFBRghf/FWZorr9dItqObK1kzvmou+mSN06AYPl4ptzw8
	o5qZ991w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wrJk0-00000002bSM-1z9X;
	Tue, 04 Aug 2026 18:19:52 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wrJjz-00000002bS0-0ywZ
	for linux-arm-kernel@lists.infradead.org;
	Tue, 04 Aug 2026 18:19:51 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 060FB44FD7
	for <linux-arm-kernel@lists.infradead.org>; Tue,  4 Aug 2026 18:19:51 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E1B231F00A3D
	for <linux-arm-kernel@lists.infradead.org>; Tue,  4 Aug 2026 18:19:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785867590;
	bh=g08EIf41pC8GEK9juMB6Ku4OixyItou7ZrSB0SvDB9s=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=kr8iHNeJzCoBt8T5H1O+CsSYeURejmgFk0XvAfR/2ONMKEAFnb6CjQqNUvOMVSPRA
	 ZL/Xrc7myD6X+jqx+rcLPhlIFPdB65yiJEAifRCHWYZHfj6BePng4G6AtrxfdIEwqX
	 F2tDKhsXa6GF1mk8MMrYhi++cKPMaoLvphgiRbuvt+8cTRDZqYcPD4ngwu0lWxC6uw
	 bHqAtt3rA9z78B5LygutAIV1fzRfUPNEC471W1eq3uH1Ofm6cp5xEE1j94KafFS0s7
	 7CpT1a8z4HmUP9mNa0wZ6x0PfM1hDGMC3c6T0EslehRErWUkL6QZcHXunGBmH9Pytj
	 uLp9fVs88Gygg==
Received: by mail-ed1-f46.google.com with SMTP id 4fb4d7f45d1cf-6a0a4aa99bdso125213a12.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 04 Aug 2026 11:19:50 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AHgh+RrnQGRpViVxIlQxYlxRh1Jjw7F8Y61G1fpl1ZYY9RAPDakw4E8bYV8HAPA1pFK5CtqIPXWosoyKOW1/u6lZFxmG@lists.infradead.org
X-Gm-Message-State: AOJu0Yy9v9T8I7xFiWq3VVeT1IkL9XpnO7gGukyYsujT/S9k9qsuZBq9
	2cJ3Kly432PgpZGWcbsnAZuZdfRpUqbcSCk6yXgoL3A7txSjnHrjhDUPUf09j0Iw6LbtdZLv9Na
	W46yaHwSo/9nWcHPDm/okt/tmHf/siA==
X-Received: by 2002:a17:907:1c86:b0:c16:b05c:b9cf with SMTP id
 a640c23a62f3a-c2039cdc721mr25942266b.26.1785867589418; Tue, 04 Aug 2026
 11:19:49 -0700 (PDT)
MIME-Version: 1.0
References: <20260714114414.184512-1-angelogioacchino.delregno@collabora.com>
 <20260714114414.184512-43-angelogioacchino.delregno@collabora.com>
 <CAL_JsqJXpY8jHEgSHcHz4QZTFEZe8PLbO6vbpxWH4qobs0MPyA@mail.gmail.com> <f3837531-2949-4741-a23e-387317485c02@collabora.com>
In-Reply-To: <f3837531-2949-4741-a23e-387317485c02@collabora.com>
From: Rob Herring <robh@kernel.org>
Date: Tue, 4 Aug 2026 13:19:38 -0500
X-Gmail-Original-Message-ID: <CAL_JsqLVAQ6uhU0fGK_qnOn1x559ErWSJTKkSjr0z791thwD3w@mail.gmail.com>
X-Gm-Features: AUfX_myLekSI9jogdlVNQCKmwUBvLh2cfWQ2ZHLsEAU03-4FpLXeKk3q8NZzUt8
Message-ID: <CAL_JsqLVAQ6uhU0fGK_qnOn1x559ErWSJTKkSjr0z791thwD3w@mail.gmail.com>
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

On Tue, Jul 28, 2026 at 8:49=E2=80=AFAM AngeloGioacchino Del Regno
<angelogioacchino.delregno@collabora.com> wrote:
>
> On 7/28/26 15:40, Rob Herring wrote:
> > On Tue, Jul 14, 2026 at 6:45=E2=80=AFAM AngeloGioacchino Del Regno
> > <angelogioacchino.delregno@collabora.com> wrote:
> >>
> >> Add documentation for the Two-Dimension Sharpness Processor, or
> >> "TDSHP", found in many MediaTek SoCs including MT8196 and its
> >> variants.
> >>
> >> Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@c=
ollabora.com>
> >> ---
> >>   .../mediatek/mediatek,mt8196-tdshp.yaml       | 98 +++++++++++++++++=
++
> >>   1 file changed, 98 insertions(+)
> >>   create mode 100644 Documentation/devicetree/bindings/display/mediate=
k/mediatek,mt8196-tdshp.yaml
> >>
> >> diff --git a/Documentation/devicetree/bindings/display/mediatek/mediat=
ek,mt8196-tdshp.yaml b/Documentation/devicetree/bindings/display/mediatek/m=
ediatek,mt8196-tdshp.yaml
> >> new file mode 100644
> >> index 000000000000..ccd6a8443443
> >> --- /dev/null
> >> +++ b/Documentation/devicetree/bindings/display/mediatek/mediatek,mt81=
96-tdshp.yaml
> >> @@ -0,0 +1,98 @@
> >> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> >> +%YAML 1.2
> >> +---
> >> +$id: http://devicetree.org/schemas/display/mediatek/mediatek,mt8196-t=
dshp.yaml#
> >> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> >> +
> >> +title: MediaTek Display Two-Dimension Sharpness Processor (TDSHP)
> >> +
> >> +maintainers:
> >> +  - AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.c=
om>
> >> +
> >> +description:
> >> +  The MediaTek 2D Sharpness Processor (TDSHP) is responsible for perf=
orming
> >> +  image sharpness adjustments/enhancements in a display pipeline.
> >> +  This hardware block supports adjusting the luma and contour 2d hist=
ograms,
> >> +  frequency weighting, luma-chroma gain and others, with adaptive wei=
ghts.
> >> +
> >> +properties:
> >> +  compatible:
> >> +    const: mediatek,mt8196-disp-tdshp
> >> +
> >> +  reg:
> >> +    maxItems: 1
> >> +
> >> +  clocks:
> >> +    maxItems: 1
> >> +
> >> +  power-domains:
> >> +    maxItems: 1
> >> +
> >> +  ports:
> >> +    $ref: /schemas/graph.yaml#/properties/ports
> >> +
> >> +    properties:
> >> +      port@0:
> >> +        $ref: /schemas/graph.yaml#/properties/port
> >> +
> >> +      port@1:
> >> +        $ref: /schemas/graph.yaml#/properties/port
> >> +
> >> +    required:
> >> +      - port@0
> >> +      - port@1
> >> +
> >> +  trigger-sources:
> >> +    maxItems: 1
> >> +
> >> +required:
> >> +  - compatible
> >> +  - reg
> >> +  - clocks
> >> +  - clock-names
> >
> > This causes a warning.
> >
> > Seems this is in linux-next already, but no reviews?
> >
> > Rob
>
> Wow. No idea how clock-names got into the list of required properties: th=
ere is
> only one possible clock, and this doesn't need any clock-names at all.
>
> Same for the resizer binding.
> Sorry for the mistake.

Why is this still in linux-next?

Rob

