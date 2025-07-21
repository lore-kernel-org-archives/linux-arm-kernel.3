Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 30D74C83F1A
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 21 Jul 2025 03:38:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=5GJULZkEl8j6az+Nmf6Q9IdIMazJkldN2OlkYV3zqRI=; b=gwkTFJSLJUCAhOgNypaEK9oOWw
	CmwC4A7YkruQpxbpUHAwnksDtuxYlP94mzRjmR97/xXkRTkHo+5CS01+IQQJPmiFL7UiBeVAVHt7q
	RemrsZ+Oi3vju/8yQdrFyqypcALTyZN3s9H+pewxh9yB43nI1NaDB5uzEnWEQOLbUBJfbegdjViVK
	2gtr3TRaTD1vz4U59vlYwFnDWxWTp2gnUqeWjVbrqVpJDiSPn6UnkicPu/Hic+YktR/XtWWkjgt60
	6V3gpiT9mRhs0V5fBiJA8dfQkdJOK1Pt5TD0WZqcW9GjUaMQ27gMXiDF44Iyk5pju4Y6P//aKNfKp
	BFLcH6lg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1udhLx-0000000G6sb-3qOI;
	Mon, 21 Jul 2025 03:38:13 +0000
Received: from mail-io1-xd2c.google.com ([2607:f8b0:4864:20::d2c])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1udhBJ-0000000G5gu-149k
	for linux-arm-kernel@lists.infradead.org;
	Mon, 21 Jul 2025 03:27:14 +0000
Received: by mail-io1-xd2c.google.com with SMTP id ca18e2360f4ac-879c49e8ac3so286276939f.1
        for <linux-arm-kernel@lists.infradead.org>; Sun, 20 Jul 2025 20:27:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1753068432; x=1753673232; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5GJULZkEl8j6az+Nmf6Q9IdIMazJkldN2OlkYV3zqRI=;
        b=X57LZ51pz3tCnadpjH/B8yMjDqoK+fLHDOMmcPgLbqBGS8BpFDF0t1WAmywGZR8TsN
         c3LQFFlhlmYfASvFgsFQXHdGJQcv2+O6eeoO6f74ROMBb8MIqwHAITDy2UtP5biKjBsO
         7qS48qqFTugNOQiNhCZj4+vtWEcF82qCgEpoiGRB4tdKWiJl/IGkAP2tlB55iYozr6HL
         lUbfSX9j6OLTjGrnY1i+dWgz2ZWqBfhReplFRJi7y+ZeuS+sxNQ1w/fdDjhCFym4q70g
         04IK5fV4zCONRTQuha9Z/VObbhQj8fEhzmJk4jSpn2/WHolxU4FRrL8MogT/EGWLVf49
         yAjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753068432; x=1753673232;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=5GJULZkEl8j6az+Nmf6Q9IdIMazJkldN2OlkYV3zqRI=;
        b=QlLNKp+RNPcT7t/PxIQ5XHoAeTspRfSRuRdn/1v1KxrqmfbWNE2PrwXIh0Fj/0gwTl
         hNOpFup7G7BgH6DEh5wwIDhgyXF8q9Vh6u+C3wA/698qkj5na0adPKOcmGZ7XJQ/PS5W
         Kcp1sPDFhVu3hDcE/p/wMysmIvn9oZjiAmVvNfi/dlXvfIRjgACoKEEVASBh+AWuHju8
         J/FoEjtqpBmG6s3moO0JhWGLH+juuoCrd/5bBaKsDZx9BTD2pxavXhxxgA56GoIimKqV
         RzAF8lYqdy8RYU1VYhI7B6GjGToTKI8u1BG92MamStZUgdBB5Q1O1OnvXLDTOqp/wEtR
         ZLJg==
X-Forwarded-Encrypted: i=1; AJvYcCWhwKJVDfeluszv/13M10KFUfpuSiHLCysl/YDi11QwR5/7nX/PJC2iWgN7Ocx8oTKztteaEOQ1iynLoty1rWad@lists.infradead.org
X-Gm-Message-State: AOJu0YzlY/TCC0PkKVCfoVPifPOEpqXvinB5H1zHAMIftHhVNSLGWlt1
	fbeglI98m7mqngokcCPH3WEG1f77yT9173QcMVPRAMGH27iWG9SAZtfLIDlK4zoN4zQH9WhBgw5
	zf8GpxgpqEmt3MIHRkngUDOGWu3yMGakxUXe6
X-Gm-Gg: ASbGncs8UqtGbOkecaHfEjQKAS7ips8Mr/EZug7yl8tN5DKmQeIVYgZ75FylJjxd6i+
	4dAo96UzAiInNtrPR/B+tCLP9fB0BklLCssAQpNfIlPFvHKLWHt0+2Z50zFT2c/J0Yh0Q/jyNvH
	plNtquWLe+6DmmR3ZgT/TCfdy8m3+UQWaWmrA5FN4rcCPKJqYGVTgkfr5cBySKFrNYQSWI4NTwQ
	bwQ0f9LbVYhhswHHg==
X-Google-Smtp-Source: AGHT+IG8vUHFP70UXed9iRLKIptriKCIABWtAWB4NI0eKfx64HKik6dvxbUYvCeLTR40uVNuIWcVYOwlyUyYpDWTz70=
X-Received: by 2002:a05:6e02:2587:b0:3e2:9f78:3783 with SMTP id
 e9e14a558f8ab-3e29f783956mr91962715ab.21.1753068432378; Sun, 20 Jul 2025
 20:27:12 -0700 (PDT)
MIME-Version: 1.0
References: <20250718101150.3681002-1-shengjiu.wang@nxp.com>
 <20250718101150.3681002-4-shengjiu.wang@nxp.com> <aHp1be6omEO8qB8o@lizhi-Precision-Tower-5810>
In-Reply-To: <aHp1be6omEO8qB8o@lizhi-Precision-Tower-5810>
From: Shengjiu Wang <shengjiu.wang@gmail.com>
Date: Mon, 21 Jul 2025 11:26:56 +0800
X-Gm-Features: Ac12FXxLXoN3PdgILVQcoB0Vod44PqH8KIxOUI90ky-y_nERjNH_OhhfrJs7NGk
Message-ID: <CAA+D8AMz4MAn7M40ipTefXapQ0-KZnUT3H6iVzBscO4UmrK6cw@mail.gmail.com>
Subject: Re: [PATCH 3/4] dt-bindings: display: imx: add binding for i.MX8MP
 HDMI PAI
To: Frank Li <Frank.li@nxp.com>
Cc: Shengjiu Wang <shengjiu.wang@nxp.com>, andrzej.hajda@intel.com, 
	neil.armstrong@linaro.org, rfoss@kernel.org, 
	Laurent.pinchart@ideasonboard.com, jonas@kwiboo.se, jernej.skrabec@gmail.com, 
	maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de, 
	airlied@gmail.com, simona@ffwll.ch, lumag@kernel.org, dianders@chromium.org, 
	cristian.ciocaltea@collabora.com, luca.ceresoli@bootlin.com, 
	dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
	victor.liu@nxp.com, shawnguo@kernel.org, s.hauer@pengutronix.de, 
	kernel@pengutronix.de, festevam@gmail.com, imx@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, robh@kernel.org, krzk+dt@kernel.org, 
	conor+dt@kernel.org, p.zabel@pengutronix.de, devicetree@vger.kernel.org, 
	l.stach@pengutronix.de
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250720_202713_295909_75951714 
X-CRM114-Status: GOOD (  22.32  )
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

On Sat, Jul 19, 2025 at 12:25=E2=80=AFAM Frank Li <Frank.li@nxp.com> wrote:
>
> On Fri, Jul 18, 2025 at 06:11:49PM +0800, Shengjiu Wang wrote:
>
> Subject needn't said binding again.
>
> dt-bindings: display: imx: add HDMI PAI for i.MX8MP
>
> > Add binding for the i.MX8MP HDMI parallel Audio interface block.
>
> Need empty line between two paragraph

Ok.
>
> > As this port is linked to imx8mp-hdmi-tx, add port@2 in
> > fsl,imx8mp-hdmi-tx.yaml document.
>
> In fsl,imx8mp-hdmi-tx.yaml, add port@2 that linked to imx8mp-hdmi-tx (
> look like pai_to_hdmi_tx?)

yes, linked to pai_to_hdmi_tx.
>
> >
> > Signed-off-by: Shengjiu Wang <shengjiu.wang@nxp.com>
> > ---
> >  .../display/bridge/fsl,imx8mp-hdmi-tx.yaml    | 13 ++++
> >  .../display/imx/fsl,imx8mp-hdmi-pai.yaml      | 61 +++++++++++++++++++
> >  2 files changed, 74 insertions(+)
> >  create mode 100644 Documentation/devicetree/bindings/display/imx/fsl,i=
mx8mp-hdmi-pai.yaml
> >
> > diff --git a/Documentation/devicetree/bindings/display/bridge/fsl,imx8m=
p-hdmi-tx.yaml b/Documentation/devicetree/bindings/display/bridge/fsl,imx8m=
p-hdmi-tx.yaml
> > index 05442d437755..cf810b277557 100644
> > --- a/Documentation/devicetree/bindings/display/bridge/fsl,imx8mp-hdmi-=
tx.yaml
> > +++ b/Documentation/devicetree/bindings/display/bridge/fsl,imx8mp-hdmi-=
tx.yaml
> > @@ -49,9 +49,14 @@ properties:
> >          $ref: /schemas/graph.yaml#/properties/port
> >          description: HDMI output port
> >
> > +      port@2:
> > +        $ref: /schemas/graph.yaml#/properties/port
> > +        description: Parallel audio input port
> > +
> >      required:
> >        - port@0
> >        - port@1
> > +      - port@2
>
> Are you sure it is required?  It may cause may dtb check warning.

yes, it is required.
>
> >
> >  required:
> >    - compatible
> > @@ -98,5 +103,13 @@ examples:
> >                      remote-endpoint =3D <&hdmi0_con>;
> >                  };
> >              };
> > +
> > +            port@2 {
> > +                reg =3D <2>;
> > +
> > +                endpoint {
> > +                    remote-endpoint =3D <&pai_to_hdmi_tx>;
> > +                };
> > +            };
> >          };
> >      };
> > diff --git a/Documentation/devicetree/bindings/display/imx/fsl,imx8mp-h=
dmi-pai.yaml b/Documentation/devicetree/bindings/display/imx/fsl,imx8mp-hdm=
i-pai.yaml
> > new file mode 100644
> > index 000000000000..d2d723935032
> > --- /dev/null
> > +++ b/Documentation/devicetree/bindings/display/imx/fsl,imx8mp-hdmi-pai=
.yaml
> > @@ -0,0 +1,61 @@
> > +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> > +%YAML 1.2
> > +---
> > +$id: http://devicetree.org/schemas/display/imx/fsl,imx8mp-hdmi-pai.yam=
l#
> > +$schema: http://devicetree.org/meta-schemas/core.yaml#
> > +
> > +title: Freescale i.MX8MP HDMI Parallel Audio Interface
> > +
> > +maintainers:
> > +  - Shengjiu Wang <shengjiu.wang@nxp.com>
> > +
> > +description:
> > +  The HDMI TX Parallel Audio Interface (HTX_PAI) is a digital module t=
hat acts as the
> > +  bridge between the Audio Subsystem to the HDMI TX Controller.
>
> remove "a digital module that acts as the"

Ok, will update it in the next version.

best regards
Shengjiu Wang

>
> Frank
>
> > +
> > +properties:
> > +  compatible:
> > +    const: fsl,imx8mp-hdmi-pai
> > +
> > +  reg:
> > +    maxItems: 1
> > +
> > +  interrupts:
> > +    maxItems: 1
> > +
> > +  power-domains:
> > +    maxItems: 1
> > +
> > +  port:
> > +    $ref: /schemas/graph.yaml#/properties/port
> > +    description: Output to the HDMI TX controller.
> > +    unevaluatedProperties: false
> > +
> > +required:
> > +  - compatible
> > +  - reg
> > +  - interrupts
> > +  - power-domains
> > +  - port
> > +
> > +additionalProperties: false
> > +
> > +examples:
> > +  - |
> > +    #include <dt-bindings/interrupt-controller/irq.h>
> > +    #include <dt-bindings/power/imx8mp-power.h>
> > +
> > +    hdmi@32fc4800 {
> > +        compatible =3D "fsl,imx8mp-hdmi-pai";
> > +        reg =3D <0x32fc4800 0x800>;
> > +        interrupt-parent =3D <&irqsteer_hdmi>;
> > +        interrupts =3D <14>;
> > +        power-domains =3D <&hdmi_blk_ctrl IMX8MP_HDMIBLK_PD_PAI>;
> > +
> > +        port {
> > +
> > +            pai_to_hdmi_tx: endpoint {
> > +                remote-endpoint =3D <&hdmi_tx_from_pai>;
> > +            };
> > +        };
> > +    };
> > --
> > 2.34.1
> >

