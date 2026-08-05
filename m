Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 83C92C55174
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  5 Aug 2026 03:48:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=j/NmALyDnaea82VN1dJT9y4h9uKdhWB1U02N76kyw3U=; b=Q2n103LDevtzBYNE5R3XOP3RmG
	zzL+HZxXtcqg/CNNhfQ/pPqABtoPA+aoQiCRLaN4YOZSIc9GH9ax8HBAyOjwPVhYqeqZvG2YxvGd3
	38jwhnf59kehItyt99TSroOHBosoGPsM5nAO6feAQNsbNdaqZTWYwusAyVcKrVjPanBNMYNa3ZNsX
	rclQIWvuGxjVdkCkM1/gX3vFoV2SSm1HN3Rxra9vFvgW6exiX9D0gp9yhVbSEKsMMYPGx0Qq7w5nW
	7Z6RdNxMkj6AqLqbo4uuJoZho5WZfNIk9O4uAi+4hL5wCWUbVDkHWzvlnCY4fbu81ULez2crTXBU7
	rcpPY3tw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wrScQ-00000003Bk0-0Nft;
	Wed, 05 Aug 2026 03:48:38 +0000
Received: from mail-yw1-x1136.google.com ([2607:f8b0:4864:20::1136])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wrScN-00000003BiH-0opl
	for linux-arm-kernel@lists.infradead.org;
	Wed, 05 Aug 2026 03:48:36 +0000
Received: by mail-yw1-x1136.google.com with SMTP id 00721157ae682-7dbcb505578so5426377b3.3
        for <linux-arm-kernel@lists.infradead.org>; Tue, 04 Aug 2026 20:48:33 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1785901713; cv=none;
        d=google.com; s=arc-20260327;
        b=n2NMOchUxuDIDNNjnZ5ty3J3AFIPjdvJQT6ewPi8Mw9a2htGzDTBtYaS6JwNa0uZzA
         woDE1KJZxOA9AbsYkbIMAbAsXg1W+RnQqtxVcWYNR0ytBEZI4+obfu8gfcV5PjUyQLCr
         cWFclpAkKu/RMKH09jvA8AbcBaaRuM6c6DU5EEbrSH4DqQaJz4Bd3cFVOcnrr3dhhuof
         fCoEL6LMiAUWFgJXE8zom5f7iCt3C5GAEbtDzxxzn5OTLqfLtiwI82tD76q/cGWxSb6r
         fjBNXre0/w+meOhBqJaUYgfB1bNoQ/93hr6mCe+f4Pm+YrjnWROMqw9RtxLg0UkbEs7O
         4C0A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=j/NmALyDnaea82VN1dJT9y4h9uKdhWB1U02N76kyw3U=;
        fh=JSmPkNmh9eHyz8BV3jZBK/voGGOhZbByCa0d5jUH+zo=;
        b=YYVix4GYW/J82qIhhKxPTRA7A9rGleHjlUI3wkII2M7eu9cNpRt0FPdcQd28cUx3uV
         8ZqkWai+Ldirst0bgVsBS7VdR4aL2N9opRAIC9UBCfVRfpoCyGSLaY+bBSSZalu4Zbrw
         eECmeresKU0ZcgeTvza5UakDKk6YJh5TaLQEFdELHRbDTeksW362Rq13y0kHHV8vRqDt
         x5YRMCT3dct/zXwap6c3vo9tRgXpv1RLq0QoX90BQY5Rz1dEHEd/wetHJ4rO6LGU/ohI
         HEYJ+hiqjBFQNTiyAoVTCuFJzulvAOYujHRDBFPZOgzEJjSvkv1/PikeBFzWVLIgnmrS
         keZQ==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1785901713; x=1786506513; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=j/NmALyDnaea82VN1dJT9y4h9uKdhWB1U02N76kyw3U=;
        b=N8uAkXPz0J97Vlj2S6yDIsUFNFYBR0F0DMY+wjAUHHXUAKKitHvBWRTjmO+Ea8UDiI
         i3SahlAFRJZBQIa1cXC2ckVxSOKpvliF7CceUJ4sfr9akHyMwsGeqzx7TVQNrhQYAmQ7
         oddY9ecjd1i543qfYj2u5AhRM5Z7zboVsBTzk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785901713; x=1786506513;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=j/NmALyDnaea82VN1dJT9y4h9uKdhWB1U02N76kyw3U=;
        b=PiblY8o3nL4fOHNZKcR2PO769O/jvr/AzyK2QytfYOus2NEGTPB3JXm8h6hNaioVhp
         Ppmx8PeaHWE4J9IuMHGYjv1jfTU9sPSZqksW7ZtD+mszI0UMp1Zsr8hSlagBQQcDD5Xf
         acxQqt0eVVaEu92NPqQlO6MNKe+QNwo5pDe+1Y81aJR6pj8+JhwTlgkkZ3ZgH3SKoJRj
         /ac5Q/4GV5dUUnR5A+Y+IitLkD0oVpln2A1VEdHBjv4Um3oO+gmOF6W4sVFPZ8PBKihZ
         B3adAsi/iqzAcOHauwuOFJQbvTxFo/ECFrOUIIxpSFbqj/ufpmEUyIajICO7tk0qHCat
         +mHw==
X-Forwarded-Encrypted: i=1; AHgh+Rq0g/KLhwXGjAsSGEk5lWOc7RnJoxjgkBQE2hcuF0uarvag9T41DSfNDTpvwgiT69PgOHFX3g259vxU7Xf5dU9b@lists.infradead.org
X-Gm-Message-State: AOJu0Ywrh9Uhr6nrBMO/6AlDKNgrsz6s249AVhwd2u3PD2Kpg+a/gjNi
	UcpJa/GFEmKHGvEBG493bCysBlkVzXLBbuj2LDmSNLhDsN3wssUksPOteW89bOVDG/lU5VZmNgS
	4wWyil3HpjtPt7nvqfg3AN7yTo2Wtv2hBE8V229J5
X-Gm-Gg: AR+sD12ZFLq4iMAxhCTDcGONxSYYfNXgmrfX57gAzwkenqOXOy6AGsFh2gFsBNI4aG+
	tsNYqwYMl4bOPmO8vQmVDLslrQcZEv/oFQEm5qU+LfVWPZ3MdDUWPogAYmWnOafSLG0wozlzU6N
	fmzn6U6OAI3eqLdzr9NxxStDTCTYOUsh18tlGCrxivVd3isHex4fq/qvp7qo4XFbuAAX8klYc0p
	qZX4k8m5CXoux7lmPEL5BqsrqJtqwKLPyimUKWzbiu+1USiIEMXJCis/DcP5mq8AzkonYCdhCL6
	wwpsgOiu+9XTTZBsUD55O+48YOk7Tj1ePkjioPEA85ZRyN/5Wp/Jql3bbCqQ6hniVI5QBicIMsA
	=
X-Received: by 2002:a05:690c:9a88:b0:81e:4e5d:484a with SMTP id
 00721157ae682-82022294eb4mr22113487b3.2.1785901713089; Tue, 04 Aug 2026
 20:48:33 -0700 (PDT)
MIME-Version: 1.0
References: <20260714114414.184512-1-angelogioacchino.delregno@collabora.com>
 <20260714114414.184512-43-angelogioacchino.delregno@collabora.com>
 <CAL_JsqJXpY8jHEgSHcHz4QZTFEZe8PLbO6vbpxWH4qobs0MPyA@mail.gmail.com>
 <f3837531-2949-4741-a23e-387317485c02@collabora.com> <CAL_JsqLVAQ6uhU0fGK_qnOn1x559ErWSJTKkSjr0z791thwD3w@mail.gmail.com>
In-Reply-To: <CAL_JsqLVAQ6uhU0fGK_qnOn1x559ErWSJTKkSjr0z791thwD3w@mail.gmail.com>
From: Chen-Yu Tsai <wenst@chromium.org>
Date: Wed, 5 Aug 2026 11:48:22 +0800
X-Gm-Features: AUfX_mymFrVaiYOLaCO3AlvD0Um00IkfLaFRQ7IWTs7XOa8ZsYdcyTa8_6zr7HM
Message-ID: <CAGXv+5GeYZ_et3bH9Udf=C3f30-zuM1=Z1meU47RnofG0NL+dQ@mail.gmail.com>
Subject: Re: [PATCH v2 42/46] dt-bindings: display: mediatek: Introduce MT8196
 2D Sharpness Processor
To: Rob Herring <robh@kernel.org>
Cc: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, chunkuang.hu@kernel.org, 
	p.zabel@pengutronix.de, airlied@gmail.com, simona@ffwll.ch, 
	maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de, 
	krzk+dt@kernel.org, conor+dt@kernel.org, matthias.bgg@gmail.com, 
	dri-devel@lists.freedesktop.org, linux-mediatek@lists.infradead.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, justin.yeh@mediatek.com, 
	jason-jh.lin@mediatek.com, kernel@collabora.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260804_204835_382084_B6BBEE3A 
X-CRM114-Status: GOOD (  22.57  )
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

On Wed, Aug 5, 2026 at 2:19=E2=80=AFAM Rob Herring <robh@kernel.org> wrote:
>
> On Tue, Jul 28, 2026 at 8:49=E2=80=AFAM AngeloGioacchino Del Regno
> <angelogioacchino.delregno@collabora.com> wrote:
> >
> > On 7/28/26 15:40, Rob Herring wrote:
> > > On Tue, Jul 14, 2026 at 6:45=E2=80=AFAM AngeloGioacchino Del Regno
> > > <angelogioacchino.delregno@collabora.com> wrote:
> > >>
> > >> Add documentation for the Two-Dimension Sharpness Processor, or
> > >> "TDSHP", found in many MediaTek SoCs including MT8196 and its
> > >> variants.
> > >>
> > >> Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno=
@collabora.com>
> > >> ---
> > >>   .../mediatek/mediatek,mt8196-tdshp.yaml       | 98 +++++++++++++++=
++++
> > >>   1 file changed, 98 insertions(+)
> > >>   create mode 100644 Documentation/devicetree/bindings/display/media=
tek/mediatek,mt8196-tdshp.yaml
> > >>
> > >> diff --git a/Documentation/devicetree/bindings/display/mediatek/medi=
atek,mt8196-tdshp.yaml b/Documentation/devicetree/bindings/display/mediatek=
/mediatek,mt8196-tdshp.yaml
> > >> new file mode 100644
> > >> index 000000000000..ccd6a8443443
> > >> --- /dev/null
> > >> +++ b/Documentation/devicetree/bindings/display/mediatek/mediatek,mt=
8196-tdshp.yaml
> > >> @@ -0,0 +1,98 @@
> > >> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> > >> +%YAML 1.2
> > >> +---
> > >> +$id: http://devicetree.org/schemas/display/mediatek/mediatek,mt8196=
-tdshp.yaml#
> > >> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> > >> +
> > >> +title: MediaTek Display Two-Dimension Sharpness Processor (TDSHP)
> > >> +
> > >> +maintainers:
> > >> +  - AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora=
.com>
> > >> +
> > >> +description:
> > >> +  The MediaTek 2D Sharpness Processor (TDSHP) is responsible for pe=
rforming
> > >> +  image sharpness adjustments/enhancements in a display pipeline.
> > >> +  This hardware block supports adjusting the luma and contour 2d hi=
stograms,
> > >> +  frequency weighting, luma-chroma gain and others, with adaptive w=
eights.
> > >> +
> > >> +properties:
> > >> +  compatible:
> > >> +    const: mediatek,mt8196-disp-tdshp
> > >> +
> > >> +  reg:
> > >> +    maxItems: 1
> > >> +
> > >> +  clocks:
> > >> +    maxItems: 1
> > >> +
> > >> +  power-domains:
> > >> +    maxItems: 1
> > >> +
> > >> +  ports:
> > >> +    $ref: /schemas/graph.yaml#/properties/ports
> > >> +
> > >> +    properties:
> > >> +      port@0:
> > >> +        $ref: /schemas/graph.yaml#/properties/port
> > >> +
> > >> +      port@1:
> > >> +        $ref: /schemas/graph.yaml#/properties/port
> > >> +
> > >> +    required:
> > >> +      - port@0
> > >> +      - port@1
> > >> +
> > >> +  trigger-sources:
> > >> +    maxItems: 1
> > >> +
> > >> +required:
> > >> +  - compatible
> > >> +  - reg
> > >> +  - clocks
> > >> +  - clock-names
> > >
> > > This causes a warning.
> > >
> > > Seems this is in linux-next already, but no reviews?
> > >
> > > Rob
> >
> > Wow. No idea how clock-names got into the list of required properties: =
there is
> > only one possible clock, and this doesn't need any clock-names at all.
> >
> > Same for the resizer binding.
> > Sorry for the mistake.
>
> Why is this still in linux-next?

This is in your dt/next branch, applied 13 days ago. Maybe you applied it
by mistake?


ChenYu

