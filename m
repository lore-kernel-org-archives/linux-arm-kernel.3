Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 25CECC7EE2A
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 30 Jun 2025 03:27:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Arx/vh/1p7726lfU61ekP8LCF9/XaIuNl/Y+OL2yoTY=; b=1JVd49iQF5AMzL180u+jQjwt1x
	XmTUccYmvSAjm/47yGc/n6g1mmyLs3Jonv4CplrcmGYu6zxbmqSZr9s4twZa2qY4Z30MwA5pkva5p
	evNLWXKL3MRSBU/YO9KWQN3JGs7bSHRlmRurRZhhy63bvGtEVaUpPkYQ1tWW4jFBvV/wRQ2UhBbLS
	wUxA+g+EKoQWHHE+EZ8TCRtTptdv8yG1PLn+3ClSL83abwQcBY7bM/Qe5A/tsmrA6lllpSEqHyvPP
	SdDizWyXxYdxPuBGt//STS3Zl1Kf4o358qE5HVFQi0sYkNuOlr6F5+eJTXr/h9PM5DO7CZ6mRiM2n
	QH41W0Bg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uW5BC-000000017Bc-0bjJ;
	Mon, 30 Jun 2025 03:27:38 +0000
Received: from mail-lf1-x12f.google.com ([2a00:1450:4864:20::12f])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uW58r-000000016xg-2IZC
	for linux-arm-kernel@lists.infradead.org;
	Mon, 30 Jun 2025 03:25:15 +0000
Received: by mail-lf1-x12f.google.com with SMTP id 2adb3069b0e04-553bcf41440so4002527e87.3
        for <linux-arm-kernel@lists.infradead.org>; Sun, 29 Jun 2025 20:25:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1751253911; x=1751858711; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Arx/vh/1p7726lfU61ekP8LCF9/XaIuNl/Y+OL2yoTY=;
        b=LN4k17CxV1wZyy9Ee3PeNdrNMSpFZ1g6nvm/UTYBzB2uveTE/WrmDmSeCcO/D9tC5I
         uDjPdzcwdwHyaa9ZQn1wqi9Xnifs9vvk0/vQtpBLxRi9GxWrZrubJOVl8SrZm8kmmLHs
         Kb+kjDf0JuApczidlhBRGx87qzp2dGbuEN/og=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751253911; x=1751858711;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Arx/vh/1p7726lfU61ekP8LCF9/XaIuNl/Y+OL2yoTY=;
        b=WaXw3vadb2slWPs1E7ZG1j7WthwkegH91shg7ytJK012wl4TzgE428yQAmQ9ufmMPR
         WCWhNKmf35NFDMVUQlD3DI3W0clvT9LN8AeWn6QkphIYIlKbV0mrTbx3Q0RI3+9isHNK
         NoFxLaotvtpzvQfnhjFwk2XdU9uEaCfzUtp9NtzwFMJGJCp4ZrjGD4P6ud5Ip1Lbu2N4
         FU9+sIjifuA/UkztJ+EP+4ve6hdEjuT8R0Lfrf5mYDQe1cvyFZ8RcfglHn006F+NWL0d
         6P5BHiZE2ES7yaGcduJwUpca+d4XoA3dtlWjFNRcjpw4XVDyp7062FcX0FKQm/wWAezF
         J7VA==
X-Forwarded-Encrypted: i=1; AJvYcCUaH+7GTRxLo6Kk2LnWTaih65QC6rwQhn/0DOLeX6nKvWyfyMwC7hfZC1/wtfEf0QM8fnZFtx6B/YV5PbCVmyjH@lists.infradead.org
X-Gm-Message-State: AOJu0YwC8BpjqyFFPtedkAGmWVaBU6g4ZIL0GjmEKBaiL2uRFK60G6pq
	XyKkOc01oSpp2ChKvZiwsOdNEptDpu3cOGG5NLboxY/ebJhT/NNp2pzt6hC6nYrBcT8JOYwoI1T
	NGP1sj+0vmk4vwLiPB5sBg2466CUOTUto2EcE7QGS
X-Gm-Gg: ASbGncs+fZ82/GKsvrE0u7evcXF0sI4KpfIPHYf3XAfqOROHQJpFxf8JR5jumpTwV4w
	60aNA7sNcLcYN0YxMdQtgXNGQhO8qknW8ZygQ/A46rZ32/PHjzkF1fUFgbgXrXdEBjLkOB3cVGx
	bg9C9Qo/VE/xk4r9GEH17cw/YxuxXBHafZTwKQkjVnxW6H7NN61SBiAsRJZWWqbrJUw1dOPUcZg
	26m9II=
X-Google-Smtp-Source: AGHT+IG9cnl6ModTYi6p2CiPzEyX+jlxQEfwAMhFMxkNl7fS/RoRC0YYR5H1zSIeP2ag3GvJxVUZnK/m4syzOJSkQKo=
X-Received: by 2002:a05:6512:3041:b0:553:addb:ef51 with SMTP id
 2adb3069b0e04-5550b886294mr3126600e87.18.1751253911120; Sun, 29 Jun 2025
 20:25:11 -0700 (PDT)
MIME-Version: 1.0
References: <20250624073548.29732-1-angelogioacchino.delregno@collabora.com>
 <20250624073548.29732-4-angelogioacchino.delregno@collabora.com> <20250627-neon-hidden-sheep-ed8dae@krzk-bin>
In-Reply-To: <20250627-neon-hidden-sheep-ed8dae@krzk-bin>
From: Chen-Yu Tsai <wenst@chromium.org>
Date: Mon, 30 Jun 2025 11:25:00 +0800
X-Gm-Features: Ac12FXzEzclUPx2ytH0n81YEF7rV0XFgxUmmA57Z4fo3T5oQBKH_wjXRPSro-S0
Message-ID: <CAGXv+5GLJ7cfAQW_kbTqqe_QO+RfU7KL57n77qenpDiRS5BybA@mail.gmail.com>
Subject: Re: [PATCH v2 3/6] dt-bindings: regulator: Document MediaTek MT6363
 PMIC Regulators
To: Krzysztof Kozlowski <krzk@kernel.org>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: broonie@kernel.org, lgirdwood@gmail.com, robh@kernel.org, 
	krzk+dt@kernel.org, conor+dt@kernel.org, matthias.bgg@gmail.com, 
	linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
	kernel@collabora.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250629_202513_713910_667BDA77 
X-CRM114-Status: GOOD (  26.91  )
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

On Fri, Jun 27, 2025 at 4:24=E2=80=AFPM Krzysztof Kozlowski <krzk@kernel.or=
g> wrote:
>
> On Tue, Jun 24, 2025 at 09:35:45AM +0200, AngeloGioacchino Del Regno wrot=
e:
> > Add bindings for the regulators found in the MediaTek MT6363 PMIC,
> > usually found in board designs using the MT6991 Dimensity 9400 and
> > on MT8196 Kompanio SoC for Chromebooks, along with the MT6316 and
> > MT6373 PMICs.
> >
> > Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@co=
llabora.com>
> > ---
> >  .../regulator/mediatek,mt6363-regulator.yaml  | 123 ++++++++++++++++++
> >  1 file changed, 123 insertions(+)
> >  create mode 100644 Documentation/devicetree/bindings/regulator/mediate=
k,mt6363-regulator.yaml
> >
> > diff --git a/Documentation/devicetree/bindings/regulator/mediatek,mt636=
3-regulator.yaml b/Documentation/devicetree/bindings/regulator/mediatek,mt6=
363-regulator.yaml
> > new file mode 100644
> > index 000000000000..f866c89c56f7
> > --- /dev/null
> > +++ b/Documentation/devicetree/bindings/regulator/mediatek,mt6363-regul=
ator.yaml
> > @@ -0,0 +1,123 @@
> > +# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
> > +%YAML 1.2
> > +---
> > +$id: http://devicetree.org/schemas/regulator/mediatek,mt6363-regulator=
.yaml#
> > +$schema: http://devicetree.org/meta-schemas/core.yaml#
> > +
> > +title: MediaTek MT6363 PMIC Regulators
> > +
> > +maintainers:
> > +  - AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.co=
m>
> > +
> > +description:
> > +  The MT6363 SPMI PMIC provides 10 BUCK and 26 LDO (Low Dropout) regul=
ators
> > +  and can optionally provide overcurrent warnings with one ocp interru=
pt
> > +  for each voltage regulator.
> > +
> > +properties:
> > +  compatible:
> > +    const: mediatek,mt6363-regulator
> > +
> > +  interrupts:
> > +    description: Overcurrent warning interrupts
>
> Are you sure interrupts are physically not connected?

Side note:

I wonder if we really need to describe _all_ the interrupts here.

Looking at the PMIC as a whole, the interrupt tree is something like

SoC <- SPMI inband IRQ - PMIC top level IRQ block <- sub-function IRQ block=
s:

    - BUCK (buck regulator over current)
    - LDO (LDO regulator over current)
    - PSC (key press / system low voltage)
    - MISC (protected registers accessed / SPMI stuff)

And some other blocks that may apply to other MediaTek PMICs:

    - HK (some threshold triggered interrupt)
    - BM (battery management related)

The thing I'm trying to get to is that all these interrupt vectors are
internal to the whole PMIC. Do we really need to spell them out in the
device tree? The top level compatible should already imply how all the
internals are wired up.


ChenYu

> > +    minItems: 1
> > +    maxItems: 36
> > +
> > +  interrupt-names:
> > +    description:
> > +      Names for the overcurrent interrupts are the same as the name
> > +      of a regulator (hence the same as each regulator's node name).
> > +      For example, the interrupt name for regulator vs2 will be "vs2".
>
> You need to define the items or pattern if this is really flexible in
> the hardware (not drivers).
>
> Best regards,
> Krzysztof
>
>

