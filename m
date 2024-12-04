Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C1276E7716C
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  4 Dec 2024 02:40:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=78THJIZs/MA15yj+ru7yg//2Ko53Pnaq+srDYQqZaEg=; b=NIDu6PoabsICos7geH7zPj0PSp
	9a6xCCueBvpv/57Qa8jVH2TIJjMRaiy94Ii+yOxv1vRbYU5e8OCS/cnSbunlCiTDsX+0Rlm7kp7Ks
	XntVV0s2B7V3RlddbpXNWLSMfY/IUoEM8/ZFNNFDm3KG9hPw09tw6swtioIJho5rifJks6n4N8D73
	H34KYiE3E99wy+HFVX61lK3jC6XwYmMN2rH0BhbGC1TsUo+yzd++9m8Th4t8cw0OveTFypbx+pWlu
	mgFvzu3VQdrfubm5k+cJEG9Woe+s9gU8ISYLX3kgfmXmH1ffvsU+CUHL2oBl7+2FW0QX65YXv1vaH
	80febsJg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tIfIz-0000000BJ0Q-05Z8;
	Wed, 04 Dec 2024 02:39:57 +0000
Received: from mail-lf1-x134.google.com ([2a00:1450:4864:20::134])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tIfHy-0000000BIqW-0IF4
	for linux-arm-kernel@lists.infradead.org;
	Wed, 04 Dec 2024 02:38:55 +0000
Received: by mail-lf1-x134.google.com with SMTP id 2adb3069b0e04-53df80eeeedso6418351e87.2
        for <linux-arm-kernel@lists.infradead.org>; Tue, 03 Dec 2024 18:38:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1733279932; x=1733884732; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=78THJIZs/MA15yj+ru7yg//2Ko53Pnaq+srDYQqZaEg=;
        b=cGGZm8FBFTtwCjgwNuqjMN8WPI+HWvNo7llo8Qp3HTCABZ7YmWLOjtvW/yBxJsOFUk
         41i9eBcXd9RrcPThCvXlkSa9LpsM1lJ920G/GArBDIcFebO41zTuhQRvi/Mr/KgstmL9
         l/yNYnnIndMrlg/Q20FcRazf9kG9sNW+qnKvU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733279932; x=1733884732;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=78THJIZs/MA15yj+ru7yg//2Ko53Pnaq+srDYQqZaEg=;
        b=sN41eJ7ceSU7FN5v/X0sEeTVILj8zptXkS0d0geWLow33XgOsiGxZWlEKCv2L+bEqq
         7ARB1i9Plh2WgEpuDZJVHGSCs2xja3Rosq3WEeWHqYj/luM0T1yNC9v70gxfFBo7rOX1
         ygeKaEE7zAQnUuMoQaTZkValHg/o3KKPszW63fcGr6kjPCpYn+s74VuWO0xRKO2mKvdv
         MBsErBVl7NU3uW7RQE561yN3FQh/VXcAmL68g5Dd7vslaUK2qSDBRNtJ5GMZIUBwsKEf
         Tweuax1zndH5vcKnOPBMfBD4p9YrDxl1sEgWhEYc8yoy4ZYj2x2ahzGv/NZSYIHzG5Ng
         HHSg==
X-Forwarded-Encrypted: i=1; AJvYcCVSMccvTtmckMmWjH7Z5nZYUH3HLhI643yCW1H0AHXVnMnY8ROtyofcHmblfrKHt96sd4ZhoFnSuFS7uu9lDDrT@lists.infradead.org
X-Gm-Message-State: AOJu0YyTdkj+yNAI65JEAI+FzHurVSxQPSAqoprY/5b0wRkzxLJMqaWK
	yv+Vv8zG0Z0NIX71G0pOFG4844OYSRmsurdyvIrm0+WiVpsq/hxEarVnDtpJJmt9we/jz0kIUQC
	hmvQ4Sj36I/H30t9qn5svDTGwXKutu2lwAmAd
X-Gm-Gg: ASbGncv0WE3P9gVBZfpxeg5owHPf+fBj04NtJYLSsxyWRZ2gR30hFVAisA5r5FvRs1H
	b5wUJFe0C5FxG18nWooM1t2+1/ls94NLMvjZ1/kj5JnHT3RHQ0LmTqyybHLg=
X-Google-Smtp-Source: AGHT+IHuw72icjrfxzdu36itc3o804934USQfay4OuNOvOLlQt8ZUuZrboi9UituymewJ75cgmh/8dMhPio3+m/+Hac=
X-Received: by 2002:a05:6512:b19:b0:53d:eec6:4622 with SMTP id
 2adb3069b0e04-53e12a3523fmr2296114e87.48.1733279931341; Tue, 03 Dec 2024
 18:38:51 -0800 (PST)
MIME-Version: 1.0
References: <20241202045757.39244-1-wenst@chromium.org> <20241203172026.GA1988559-robh@kernel.org>
In-Reply-To: <20241203172026.GA1988559-robh@kernel.org>
From: Chen-Yu Tsai <wenst@chromium.org>
Date: Wed, 4 Dec 2024 10:38:40 +0800
Message-ID: <CAGXv+5GPacXtcrxJVHUGuRWOSY+k5tn4kvwgu_nkjdQ6=srayQ@mail.gmail.com>
Subject: Re: [PATCH] dt-bindings: soc: fsl: cpm_qe: Limit matching to nodes
 with "fsl,qe"
To: Rob Herring <robh@kernel.org>
Cc: Christophe Leroy <christophe.leroy@csgroup.eu>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, linuxppc-dev@lists.ozlabs.org, 
	linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Frank Li <Frank.Li@nxp.com>, stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241203_183854_130286_0442C6BB 
X-CRM114-Status: GOOD (  17.76  )
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

On Wed, Dec 4, 2024 at 1:20=E2=80=AFAM Rob Herring <robh@kernel.org> wrote:
>
> On Mon, Dec 02, 2024 at 12:57:55PM +0800, Chen-Yu Tsai wrote:
> > Otherwise the binding matches against random nodes with "simple-bus"
> > giving out all kinds of invalid warnings:
> >
> >     $ make CHECK_DTBS=3Dy mediatek/mt8188-evb.dtb
> >       SYNC    include/config/auto.conf.cmd
> >       UPD     include/config/kernel.release
> >       SCHEMA  Documentation/devicetree/bindings/processed-schema.json
> >       DTC [C] arch/arm64/boot/dts/mediatek/mt8188-evb.dtb
> >     arch/arm64/boot/dts/mediatek/mt8188-evb.dtb: soc: compatible:0: 'fs=
l,qe' was expected
> >           from schema $id: http://devicetree.org/schemas/soc/fsl/cpm_qe=
/fsl,qe.yaml#
> >     arch/arm64/boot/dts/mediatek/mt8188-evb.dtb: soc: compatible: ['sim=
ple-bus'] is too short
> >           from schema $id: http://devicetree.org/schemas/soc/fsl/cpm_qe=
/fsl,qe.yaml#
> >     arch/arm64/boot/dts/mediatek/mt8188-evb.dtb: soc: interrupt-control=
ler@c000000:compatible:0: 'fsl,qe-ic' was expected
> >           from schema $id: http://devicetree.org/schemas/soc/fsl/cpm_qe=
/fsl,qe.yaml#
> >     arch/arm64/boot/dts/mediatek/mt8188-evb.dtb: soc: interrupt-control=
ler@c000000:reg: [[0, 201326592, 0, 262144], [0, 201588736, 0, 2097152]] is=
 too long
> >           from schema $id: http://devicetree.org/schemas/soc/fsl/cpm_qe=
/fsl,qe.yaml#
> >     arch/arm64/boot/dts/mediatek/mt8188-evb.dtb: soc: interrupt-control=
ler@c000000:#interrupt-cells:0:0: 1 was expected
> >           from schema $id: http://devicetree.org/schemas/soc/fsl/cpm_qe=
/fsl,qe.yaml#
> >     arch/arm64/boot/dts/mediatek/mt8188-evb.dtb: soc: interrupt-control=
ler@c000000: '#redistributor-regions', 'ppi-partitions' do not match any of=
 the regexes: 'pinctrl-[0-9]+'
> >           from schema $id: http://devicetree.org/schemas/soc/fsl/cpm_qe=
/fsl,qe.yaml#
> >     arch/arm64/boot/dts/mediatek/mt8188-evb.dtb: soc: 'reg' is a requir=
ed property
> >           from schema $id: http://devicetree.org/schemas/soc/fsl/cpm_qe=
/fsl,qe.yaml#
> >     arch/arm64/boot/dts/mediatek/mt8188-evb.dtb: soc: 'bus-frequency' i=
s a required property
> >           from schema $id: http://devicetree.org/schemas/soc/fsl/cpm_qe=
/fsl,qe.yaml#
> >
> > Fixes: ecbfc6ff94a2 ("dt-bindings: soc: fsl: cpm_qe: convert to yaml fo=
rmat")
> > Cc: Frank Li <Frank.Li@nxp.com>
> > Cc: <stable@vger.kernel.org> # v6.11+
> > Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>
> > ---
> >  .../devicetree/bindings/soc/fsl/cpm_qe/fsl,qe.yaml        | 8 ++++++++
> >  1 file changed, 8 insertions(+)
> >
> > diff --git a/Documentation/devicetree/bindings/soc/fsl/cpm_qe/fsl,qe.ya=
ml b/Documentation/devicetree/bindings/soc/fsl/cpm_qe/fsl,qe.yaml
> > index 89cdf5e1d0a8..9e07a2c4d05b 100644
> > --- a/Documentation/devicetree/bindings/soc/fsl/cpm_qe/fsl,qe.yaml
> > +++ b/Documentation/devicetree/bindings/soc/fsl/cpm_qe/fsl,qe.yaml
> > @@ -21,6 +21,14 @@ description: |
> >    The description below applies to the qe of MPC8360 and
> >    more nodes and properties would be extended in the future.
> >
> > +select:
> > +  properties:
> > +    compatible:
> > +      contains:
> > +        const: fsl,qe
> > +  required:
> > +    - compatible
>
> Update your dtschema. The select is no longer necessary. dtbs_check will
> also run 5x faster.

That did the trick. Thanks Rob!

And sorry for the noise.


ChenYu

