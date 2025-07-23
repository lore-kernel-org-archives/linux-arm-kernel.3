Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 99569C83F25
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 23 Jul 2025 07:46:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=fbcyqc764F2sEfaCBH+UYC7rWjF6m5+2vt4yx/ptU5M=; b=XyTxcCu6C5qfrb8IH78Hi6eWHw
	CSd5m1aAAXuvBPXBsSE9lsvE2YDPo8cn0+oR3a3v+mE4zgMftZ7HM6KHZzjE15IUi2k/Ff+Mgmmo0
	iM/vvqwa4hk4nd9Vs7O7GS+b3baQ7xvNKqRriSBia1+tzl53LqgGY27/0lLIZ2NEuSN8YH7NKCc+c
	rk5DV36SFzB2RL36MG/9szCfJeCgnNX845QMRNUA0ZW3E7IbMwzyYa19QNR/3UoPdk9t0pyf7svif
	rPGcZOrqHCSxBrvjNLZoLrAZ7QvHhG45ox3aF/hnOkGuDrCBfX4hKACAEQ3nFhpgPm7wZ8M0SVAJs
	hGBdEcIg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ueUB5-00000004HJy-0uFx;
	Wed, 23 Jul 2025 07:46:15 +0000
Received: from mail-il1-x136.google.com ([2607:f8b0:4864:20::136])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ueU5D-00000004GWs-16Ib
	for linux-arm-kernel@lists.infradead.org;
	Wed, 23 Jul 2025 07:40:12 +0000
Received: by mail-il1-x136.google.com with SMTP id e9e14a558f8ab-3e28bf4a350so33456745ab.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 23 Jul 2025 00:40:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1753256410; x=1753861210; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fbcyqc764F2sEfaCBH+UYC7rWjF6m5+2vt4yx/ptU5M=;
        b=cHQPtfJxMEU73uviqWZBjMfiJQl3dmUdwldcCysuFVYgQ8whsXXp8KYNDUQ8MWSoRm
         SjDiZrEabdoofJc2KOS9qdDjN3B24fe37hA9Zu8KJntBdRuRqPzt6cz6TTwFhAyig7Xt
         YW2tKJPkS2DRn/cCfZWigNF1mqJNgUN09LaYmTVuF8RszOGLk27QSwjUcqEwOx1RqgW4
         umYMppyMNo9yPAY73CfBSyknJcJRrJ/cW38NXqLySWHDIut0vLMb4Lvwo4sPaa6KAebx
         7gPiSIj9H4MvdTR8KgUBHrjuSVcKZRiG+pM7q4lkvaHPlWWcLuGwYR6NUF+TEYnQS6uW
         m9Tg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753256410; x=1753861210;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=fbcyqc764F2sEfaCBH+UYC7rWjF6m5+2vt4yx/ptU5M=;
        b=EYt+FCWJ+Fey9lJ1fBad0XN2Z8KoK2Jzxk/05zqqAwgV7YDZx3qwEUHD75dNd2ACQs
         TwIr8zMaB5jm7OIKYWorgU9a4heQae0jZBF6mLAwuMpKWHeZKuB/1+EbuxuPLEBitUlY
         viKAu0FYQJZ8q56H63xV6W/TVUpqbYQBphCTqPOU/+fCNwB5UpUumpWSlsw5+S5b2gH7
         uvRtX64q83rxE5ZZy9bzwvmPmmYBa2gBQ0usKSfeD3pVKnToGTwuKLUoz3xbvZ/S8ui/
         k2Yg0weFkAkgGDunfBzKyo9P2t609UaHFzhWOP9XeZ/AcwiwqSK5XSn4nvgRhZkxZ53R
         wHhg==
X-Forwarded-Encrypted: i=1; AJvYcCUh1D68rKa6id49Q61UApLiGsV1mGo7mMBuY2BaWKKus77m7EF5lpqEQ7zpPhTL6sNYMxTEL5fKaQ/42yXURr37@lists.infradead.org
X-Gm-Message-State: AOJu0YyILGrHyoXLPNgkaCCgBAxtdae7zg+4kiHgq+8Nus88lnMaJikD
	TlPkT5nsb5h4vv7KHoLbqi6hGFYSAMXS4KqmiS0d+BHaxCrfmytcnsl4duBUtuNTcyZMesIBjDB
	wD9D+6nioNg4qXP2s/bfEQpaSeA+CHWM=
X-Gm-Gg: ASbGnctuu80CjwX5QwJpXq12H2DR+RXmhFX7JwLiPBLkjdMQSgH1nsGTSr3At6Jd8QO
	Hvy3NhQmZTqkh4Sn1X0EPg5SXrDjgt7RxWaBvtYZSZTdXd2O6za45sqRI7eVto8GeelGhI49rqL
	fmnGBiUYM0l7iNNWtzF38Aaf4u4QXP+s8Zb20Tin1m+oqX3k3pK0rAjuohQqpbRXA/FHRnOCl1n
	gw163g=
X-Google-Smtp-Source: AGHT+IHOQzFpAKaWouHfVtjkvOSjGIpAMkfJ0fzLv3wWAksIErfPgEwi7A4hu+IQvIt5kc5elxr2GeZinpnDwDpuoiI=
X-Received: by 2002:a05:6e02:2483:b0:3e2:99f3:9c5f with SMTP id
 e9e14a558f8ab-3e32fc0705bmr33701305ab.9.1753256410269; Wed, 23 Jul 2025
 00:40:10 -0700 (PDT)
MIME-Version: 1.0
References: <20250718101150.3681002-1-shengjiu.wang@nxp.com>
 <20250718101150.3681002-4-shengjiu.wang@nxp.com> <a5621775-5032-4422-80bb-5f8f60351dbe@nxp.com>
In-Reply-To: <a5621775-5032-4422-80bb-5f8f60351dbe@nxp.com>
From: Shengjiu Wang <shengjiu.wang@gmail.com>
Date: Wed, 23 Jul 2025 15:39:56 +0800
X-Gm-Features: Ac12FXzRGVFmJEyGYLyQXwRt2VBDjuGoJJq-BPWCprf56oset2phf0Q2wkTdTTc
Message-ID: <CAA+D8ANb7kZETxO_CQazoz6-DiNCOGivLhJVwhw9p78ynP1ntQ@mail.gmail.com>
Subject: Re: [PATCH 3/4] dt-bindings: display: imx: add binding for i.MX8MP
 HDMI PAI
To: Liu Ying <victor.liu@nxp.com>
Cc: Shengjiu Wang <shengjiu.wang@nxp.com>, andrzej.hajda@intel.com, 
	neil.armstrong@linaro.org, rfoss@kernel.org, 
	Laurent.pinchart@ideasonboard.com, jonas@kwiboo.se, jernej.skrabec@gmail.com, 
	maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de, 
	airlied@gmail.com, simona@ffwll.ch, lumag@kernel.org, dianders@chromium.org, 
	cristian.ciocaltea@collabora.com, luca.ceresoli@bootlin.com, 
	dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
	shawnguo@kernel.org, s.hauer@pengutronix.de, kernel@pengutronix.de, 
	festevam@gmail.com, imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
	robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, 
	p.zabel@pengutronix.de, devicetree@vger.kernel.org, l.stach@pengutronix.de
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250723_004011_305912_B25C79F3 
X-CRM114-Status: GOOD (  24.24  )
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

On Tue, Jul 22, 2025 at 3:16=E2=80=AFPM Liu Ying <victor.liu@nxp.com> wrote=
:
>
> Hi Shengjiu,
>
> On 07/18/2025, Shengjiu Wang wrote:
> > Add binding for the i.MX8MP HDMI parallel Audio interface block.
> > As this port is linked to imx8mp-hdmi-tx, add port@2 in
> > fsl,imx8mp-hdmi-tx.yaml document.
> >
> > Signed-off-by: Shengjiu Wang <shengjiu.wang@nxp.com>
> > ---
> >  .../display/bridge/fsl,imx8mp-hdmi-tx.yaml    | 13 ++++
> >  .../display/imx/fsl,imx8mp-hdmi-pai.yaml      | 61 +++++++++++++++++++
> >  2 files changed, 74 insertions(+)
> >  create mode 100644 Documentation/devicetree/bindings/display/imx/fsl,i=
mx8mp-hdmi-pai.yaml
>
> Usually, to add a new driver, a DT binding patch comes first.

ok, will move it to first patch

>
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
> Can port@2 be optional?
> Note that video output can work with only port@0 and port@1.

yes, it can be optional

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
> > +
> > +properties:
>
> In i.MX8MP TRM, HTX_PAI block diagram mentions an APB interface.
> Does it mean a clock is needed?

The APB clock is bound with the power domain, so no need to add it here.

>
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
>
> Why do you need this line?

per my understanding, this line can be added or removed.

>
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
>
> Unused. Drop.

Ok.
>
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
>
> Drop this blank line.

Ok.

Best regards
Shengjiu Wang
>
> > +            pai_to_hdmi_tx: endpoint {
> > +                remote-endpoint =3D <&hdmi_tx_from_pai>;
> > +            };
> > +        };
> > +    };
>
> --
> Regards,
> Liu Ying

