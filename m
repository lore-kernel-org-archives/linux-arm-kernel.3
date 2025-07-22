Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B0CF5C83F1A
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 22 Jul 2025 05:27:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=dqDwtUCqJNRnpiOi+aWGhs1F5rEMAyBkONqi7ZgeqbQ=; b=XYXfasddRpx3TphEhC5lOfInvU
	0z4uS1ben/vb5BboduYVxDAEKuxYnbGojrKVKFIKn9ke2Q51t+CtrVK7Xi0BJWfQko23DQ7xMM80e
	t/0o2mraaDZefDP0DJA12pBNOhI+qy6++ItlEPN3INpBl0lDfOPE8fJNswhqBnApukw1cnSz4e4dA
	Zf9vIS0+kOd8Snhszd2UeOnGB/Dh8qBL6rXwff6A72Jojpk6mQR0nP7HXHcQ6yJn9tvJyBI4m0rWF
	DexkIvAKz8Mjl4gUng304rIdNx2Ry2iM4hVKqpLLJENCjeVXub0m801jxIbRRo/HB/YHuonqWfnQC
	H03ys1ww==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ue5Wy-00000001Kh6-2T5v;
	Tue, 22 Jul 2025 05:27:12 +0000
Received: from mail-lj1-x22b.google.com ([2a00:1450:4864:20::22b])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ue5UO-00000001KPX-0GSf
	for linux-arm-kernel@lists.infradead.org;
	Tue, 22 Jul 2025 05:24:34 +0000
Received: by mail-lj1-x22b.google.com with SMTP id 38308e7fff4ca-32b7123edb9so52837241fa.2
        for <linux-arm-kernel@lists.infradead.org>; Mon, 21 Jul 2025 22:24:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1753161870; x=1753766670; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=dqDwtUCqJNRnpiOi+aWGhs1F5rEMAyBkONqi7ZgeqbQ=;
        b=UCNFyafO3jO3bpzpL/qHxkD9mam7SWAwbV8TIkzB+YCAhjyxjAz1DrWs9FryseSV3y
         NGSM7G3dVMFl1zL5ia2mgU+/suMDlyWIaQy0DBY5LbAj6HM8q5+oZIecZpfVwMdbz23J
         PePl9LjV5ARh7hmNDvIEVsP1TXKSeoFshPajU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753161870; x=1753766670;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=dqDwtUCqJNRnpiOi+aWGhs1F5rEMAyBkONqi7ZgeqbQ=;
        b=qo5DFRLspfLhuwy0WIUN424GvKC14BbHVXbjxAubG4oZ8GbJJ6qK0lS80A4ud6rv1W
         86EPXRhDArOUKyhV3b+AdxSaH6LR5JKFhiZe4DZfttdQzL5AVsfz0vnCQWxvJnsRptnd
         EMQnryU7l0s2bAockKYqIGLDOFAo/AL1ivhWzryTiUt9tBz5aos1djw2llhUbzKtnN3i
         pXpnYTMJHVQYJAyCn2DhzvoNXdP7QfIq3bn925RFe4AplxRGTfLyIALQtLXSM/zr8dZA
         dABS/+zc9OXJ36BW2R/1+RZ0Dn1Bg3tTllqxwMhzNMHB1Bgn8BwW0lrAzadmzed1FHwR
         iGKg==
X-Forwarded-Encrypted: i=1; AJvYcCXLDyjifvK7Dh6ep2SxsPtAnWlx9xYwgadYGIlkFU61L3Mvv6+nV0gdnq41T1BRbOw3NF5mY4AXvdJDhtqlFJhp@lists.infradead.org
X-Gm-Message-State: AOJu0YwP/ZZ8ye/9UbIOFu4WsvRKajpm9it7Yu3A7DRjPGM9j8NZeLIZ
	Sqc0gI9moUUuRF9nZ1KRQRtGJelg3Ty2y6bYxHAU7yeXosUwAPHCvGmFVN4oLyxMbF4IDzCmIKI
	Nm6CGaau/X909EdQPJbFn1LkRa8bwd15AmSZyPNQD
X-Gm-Gg: ASbGncvukIiiKEW1Qhp7tix46bgEMsIWyZ4Qd/4gMXs3i6OfGkrOgo+lobfbi7rnii+
	8LMGcdpgV1Ia8okteCZ60fXO6lBooiJAGe733gHpR3AtaqAiej5377zD66VXqRGgGWn0DU088SC
	NvTriyvflHPeB6r0LZFAJf3YVStc9MUKpj65ayrF5pFzrGqImd8UpS9WReb+JkJh2OWjkG0LqAD
	ilBsxYQHej2VSCuQlbyQvED+Zp8UG9RFSGjynpsnIIMLg==
X-Google-Smtp-Source: AGHT+IEdOx5zCqoNPg2UT45LQbL+jHOpKPo6tn9yxf52DBYuUr7UN/c4OmqYmGkjvaYN6I6H6AP02HgZdnn60DMD5bo=
X-Received: by 2002:a05:651c:419b:b0:32f:425b:3278 with SMTP id
 38308e7fff4ca-3308f5df835mr61834191fa.25.1753161870330; Mon, 21 Jul 2025
 22:24:30 -0700 (PDT)
MIME-Version: 1.0
References: <20250715140224.206329-1-angelogioacchino.delregno@collabora.com>
 <20250715140224.206329-4-angelogioacchino.delregno@collabora.com> <20250717152947.GA3411864-robh@kernel.org>
In-Reply-To: <20250717152947.GA3411864-robh@kernel.org>
From: Chen-Yu Tsai <wenst@chromium.org>
Date: Tue, 22 Jul 2025 13:24:19 +0800
X-Gm-Features: Ac12FXzJ2_kEeBPPtFnHpLPdeiuzsl4YpgJm_YvA17xvKg2-LMZYsB2VDzsxF1w
Message-ID: <CAGXv+5Eajtt17rp2qGDDi6-Xvj6cxmhJBHjhp_XLDaX90WiNFg@mail.gmail.com>
Subject: Re: [PATCH v5 3/8] dt-bindings: regulator: Document MediaTek MT6363
 PMIC Regulators
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: Rob Herring <robh@kernel.org>, linux-mediatek@lists.infradead.org, lee@kernel.org, 
	krzk+dt@kernel.org, conor+dt@kernel.org, matthias.bgg@gmail.com, 
	lgirdwood@gmail.com, broonie@kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	kernel@collabora.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250721_222432_133974_F2B6B9B5 
X-CRM114-Status: GOOD (  20.14  )
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

On Thu, Jul 17, 2025 at 11:29=E2=80=AFPM Rob Herring <robh@kernel.org> wrot=
e:
>
> On Tue, Jul 15, 2025 at 04:02:19PM +0200, AngeloGioacchino Del Regno wrot=
e:
> > Add bindings for the regulators found in the MediaTek MT6363 PMIC,
> > usually found in board designs using the MT6991 Dimensity 9400 and
> > on MT8196 Kompanio SoC for Chromebooks, along with the MT6316 and
> > MT6373 PMICs.
> >
> > Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@co=
llabora.com>
> > ---
> >  .../regulator/mediatek,mt6363-regulator.yaml  | 193 ++++++++++++++++++
> >  1 file changed, 193 insertions(+)
> >  create mode 100644 Documentation/devicetree/bindings/regulator/mediate=
k,mt6363-regulator.yaml
> >
> > diff --git a/Documentation/devicetree/bindings/regulator/mediatek,mt636=
3-regulator.yaml b/Documentation/devicetree/bindings/regulator/mediatek,mt6=
363-regulator.yaml
> > new file mode 100644
> > index 000000000000..ea1f6c92cffc
> > --- /dev/null
> > +++ b/Documentation/devicetree/bindings/regulator/mediatek,mt6363-regul=
ator.yaml
> > @@ -0,0 +1,193 @@
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
> > +  The MT6363 SPMI PMIC provides 10 BUCK and 25 LDO (Low DropOut) regul=
ators
> > +  and can optionally provide overcurrent warnings with one ocp interru=
pt
> > +  for each voltage regulator.
> > +
> > +properties:
> > +  compatible:
> > +    const: mediatek,mt6363-regulator
> > +
> > +  reg:
> > +    maxItems: 1
> > +
> > +  vsys-vbuck1-supply:
> > +    description: Input supply for vbuck1
>
> blank line
>
> > +  vsys-vbuck2-supply:
> > +    description: Input supply for vbuck2
>
> blank line, and so on...
>
> > +  vsys-vbuck3-supply:
> > +    description: Input supply for vbuck3
> > +  vsys-vbuck4-supply:
> > +    description: Input supply for vbuck4
> > +  vsys-vbuck5-supply:
> > +    description: Input supply for vbuck5
> > +  vsys-vbuck6-supply:
> > +    description: Input supply for vbuck6
> > +  vsys-vbuck7-supply:
> > +    description: Input supply for vbuck7
> > +  vsys-vs1-supply:
> > +    description: Input supply for vs1
> > +  vsys-vs2-supply:
> > +    description: Input supply for vs2
> > +  vsys-vs3-supply:
> > +    description: Input supply for vs3

You could also merge the ones above with a regex and move it to
patternProperties. Since these are one to one mappings that should
work still.

> > +  vs1-ldo1-supply:
> > +    description: Input supply for va15, vio0p75, vm18, vrf18, vrf-io18
> > +  vs1-ldo2-supply:
> > +    description: Input supply for vcn15, vio18, vufs18
> > +  vs2-ldo1-supply:
> > +    description: Input supply for vsram-cpub, vsram-cpum, vrf12, vrf13=
, vufs12
> > +  vs2-ldo2-supply:
> > +    description: Input supply for va12-1, va12-2, vcn13, vsram-cpul
> > +  vs3-ldo1-supply:
> > +    description: Input supply for vsram-apu, vsram-digrf, vsram-mdfe
> > +  vs3-ldo2-supply:
> > +    description: Input supply for vsram-modem, vrf0p9
> > +  vsys-ldo1-supply:
> > +    description: Input supply for vaux18, vemc, vtref18

For these, I wonder if the description is really needed.

From a device tree writing point of view, the author is likely looking
at the diagram and tracing each of these pins to a supply. They won't
care which LDO it's actually feeding.

From an implementer POV, the author is likely looking at the datasheet
for other details not spelled out here, such as voltage steps and
register offsets. The datasheet also says which supply pin feeds into
which LDOs.

ChenYu

