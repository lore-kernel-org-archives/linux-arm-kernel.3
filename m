Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BBC0DC83F1A
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 24 Jul 2025 13:52:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=0+meAXBdOYjti/xHVnSu9+/vlo6BxGcgq1eAbTOjxvs=; b=YLle/QslJoCsm/zCOHpF0B2K4M
	JdshoH7EzgGZ8ajRVw95iOJTKrqshBvaoGf7msNy1F5eqUw6jUwfRXcWSCqn1EdW8mzJoZjkXI1BN
	BftJWFugJj5YPtppDafvH60zMHG7I7yVpOOW4kbS9bS73LL3OeaLtVY7j42oebVLjZNb/tB7mQ3dA
	2xSeQxHWdulcO+yLRvui+O1J7fTonjy5+lsm3pwxOLfQgeYCEkRx9ceO63Z/ILTDPLVhKV10fqLFH
	e9fe7cOzN9h/F0eAfwXCVnIOKxw1gV9RMTND6Be/gIIEsoh6JkyP0l2K3IOEraXpm/slZpM0Y9sjX
	U80R/clg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uewMw-00000007Ytd-3xYw;
	Thu, 24 Jul 2025 13:52:22 +0000
Received: from mail-io1-xd2e.google.com ([2607:f8b0:4864:20::d2e])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uesu8-00000007Ai3-21mz
	for linux-arm-kernel@lists.infradead.org;
	Thu, 24 Jul 2025 10:10:26 +0000
Received: by mail-io1-xd2e.google.com with SMTP id ca18e2360f4ac-87c3e35b3cbso61356139f.2
        for <linux-arm-kernel@lists.infradead.org>; Thu, 24 Jul 2025 03:10:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1753351823; x=1753956623; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0+meAXBdOYjti/xHVnSu9+/vlo6BxGcgq1eAbTOjxvs=;
        b=eUS8LtkFBg539X1/Mwed5TgHmvddPB5Xx0cYWoGx9W3mEHW4Nlqor8ib1kOZpevOG8
         kfvIlDJX2/R5Zw+u6IxfZRvjTizpCF07eu8VBg2SaDNo5p//o/0bkrr3YiKVrcvapGNA
         QBIGiQTSBNk9+w+q4HuYhUJbYhMmu1k5C/4HdATYmXArgS+FR1TliHhkTt+f5rHUhXub
         7dQlxZ2tx78Z4ypP3odeVhTJk3QXkWKFg42Hjty4imY0FbogikQK/oFjp3hI0EsjGnn9
         NMKMwnKI2jZeH/yVj4Wn+M0Vp69P8j1JeyyMMVJTJ6GTRqjqbR8OVt2+NEl4tbET59a1
         IBsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753351823; x=1753956623;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=0+meAXBdOYjti/xHVnSu9+/vlo6BxGcgq1eAbTOjxvs=;
        b=Wu9+o8vdmvsO+mmbB5SlUt0+0Bwbih2vDIDVBi5rsAO0Idmk+cGj/Oz6VMeM8d/JLx
         /2KktHPTcD8XwF60zAFqpPLQG4Baf9gHmM52lkURdI95zxCKCX8VQcMLoLbrFjAWnl3J
         LAGD1eR0ZZ3FHv9eE/dcuec2xCDOYNu/6p1RaygFb1IOGS0LAxgu6oO25fs+l2fyBBPs
         3tSwZPS076gi8A/X+SRin5WzntcPx40R0xSX4hRJCxDfC3g1IH1ZvdrDMGLDc21J618F
         Ksv6qM2frBml+gc8Q/ilKpaOXm4ZYQ7JcgDcg4GTW9pfZBHGD1D49HpIwMyFcZZy+xJX
         iuag==
X-Forwarded-Encrypted: i=1; AJvYcCV9heIJ2HXD9vh3ue/Ohoh61e7mkVTCW96SfLGAW9uw8aNVHZ2+fcJgQNSvVGQ6wmDNUjsPJURmwznTbiSIznIE@lists.infradead.org
X-Gm-Message-State: AOJu0Yxjydzm2W40nHSzd37bCHLtvjEZDEy3zqgkPCNkEk15glXNkMgv
	dEzHBJ1GibXyETj6/XYaRaD9xSvIKNbGSK6+MGg2o1JavKZGY4BdpKWU2KX580RkT4xwNq2wWvf
	jCFBDLduRY61M1wSxjN7co6PHAnyODEc=
X-Gm-Gg: ASbGncucIwZb9a6tg4+IsREZ6ALRw053yc4oxpEneUkMsXk6+hgGlYapC7BHlllEndb
	hhKOD/59pvAFYob6cmDwLZEmtYiIqmq7QzNhVqopmzxCo++NHLxgi0j/hyQxTSN2eAaySVfTPRU
	I6ykMugtr2Ur2vNcK14h0WlIO1aqG3bh8jBoLr0kjvJnAUUCUawddJzSgpyna7pplquI72gDQ7A
	6Fawog=
X-Google-Smtp-Source: AGHT+IF7M0baFlK3062K6BXEoa8kOdw9KDdHsQbjFyV5neQ+2sKDdzPXmbuSGlkwEtGraleUJvxc24KLjX8I3/Jqb8w=
X-Received: by 2002:a92:cd8d:0:b0:3dd:d321:79ab with SMTP id
 e9e14a558f8ab-3e335535dc5mr117038895ab.18.1753351822074; Thu, 24 Jul 2025
 03:10:22 -0700 (PDT)
MIME-Version: 1.0
References: <20250724072248.1517569-1-shengjiu.wang@nxp.com>
 <20250724072248.1517569-2-shengjiu.wang@nxp.com> <20250724-straight-lorikeet-of-novelty-9124f8@kuoka>
In-Reply-To: <20250724-straight-lorikeet-of-novelty-9124f8@kuoka>
From: Shengjiu Wang <shengjiu.wang@gmail.com>
Date: Thu, 24 Jul 2025 18:10:10 +0800
X-Gm-Features: Ac12FXwoUiu0ZopeKo51pKtd4fVW0e5JyUbFY0Gq7Yw0jp0bxpzJja68FGRxr2Q
Message-ID: <CAA+D8ANV74k1=_m7HfCO2n7nCU7mH=QMrd0CS5eMqGqDHn9HEw@mail.gmail.com>
Subject: Re: [PATCH v2 1/6] dt-bindings: display: imx: add HDMI PAI for i.MX8MP
To: Krzysztof Kozlowski <krzk@kernel.org>
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
	l.stach@pengutronix.de, perex@perex.cz, tiwai@suse.com, 
	linux-sound@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250724_031024_530692_28F07B0F 
X-CRM114-Status: GOOD (  23.26  )
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

On Thu, Jul 24, 2025 at 4:52=E2=80=AFPM Krzysztof Kozlowski <krzk@kernel.or=
g> wrote:
>
> On Thu, Jul 24, 2025 at 03:22:43PM +0800, Shengjiu Wang wrote:
> > Add binding for the i.MX8MP HDMI parallel Audio interface block.
> >
> > In fsl,imx8mp-hdmi-tx.yaml, add port@2 that linked to pai_to_hdmi_tx.
> >
> > Signed-off-by: Shengjiu Wang <shengjiu.wang@nxp.com>
> > ---
> >  .../display/bridge/fsl,imx8mp-hdmi-tx.yaml    | 12 ++++
> >  .../display/imx/fsl,imx8mp-hdmi-pai.yaml      | 69 +++++++++++++++++++
> >  2 files changed, 81 insertions(+)
> >  create mode 100644 Documentation/devicetree/bindings/display/imx/fsl,i=
mx8mp-hdmi-pai.yaml
> >
> > diff --git a/Documentation/devicetree/bindings/display/bridge/fsl,imx8m=
p-hdmi-tx.yaml b/Documentation/devicetree/bindings/display/bridge/fsl,imx8m=
p-hdmi-tx.yaml
> > index 05442d437755..6211ab8bbb0e 100644
> > --- a/Documentation/devicetree/bindings/display/bridge/fsl,imx8mp-hdmi-=
tx.yaml
> > +++ b/Documentation/devicetree/bindings/display/bridge/fsl,imx8mp-hdmi-=
tx.yaml
> > @@ -49,6 +49,10 @@ properties:
> >          $ref: /schemas/graph.yaml#/properties/port
> >          description: HDMI output port
> >
> > +      port@2:
> > +        $ref: /schemas/graph.yaml#/properties/port
> > +        description: Parallel audio input port
>
> Which data path this represents? Feels like you are duplicating ASoC
> dai-links/cells...

Here it means from HDMI PAI to HDMI TX controller. not the ASoC dai link.

On i.MX8MP, for HDMI audio, it is separated into several hardware modules:
1. Aud2HTX
   driver:  sound/soc/fsl/fsl_aud2htx.c
2. HDMI PAI
   driver:  this patch set
3. HDMI TX controller audio part
    driver: drivers/gpu/drm/bridge/synopsys/dw-hdmi-gp-audio.c

Aud2HTX is in the Audio subsystem,  HDMI PAI and HDMI TX are in the
HDMI subsystem. The full data path is
Aud2htx -> HDMI PAI -> HDMI TX controller.

>
>
> > +
> >      required:
> >        - port@0
> >        - port@1
> > @@ -98,5 +102,13 @@ examples:
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
> > index 000000000000..4f99682a308d
> > --- /dev/null
> > +++ b/Documentation/devicetree/bindings/display/imx/fsl,imx8mp-hdmi-pai=
.yaml
> > @@ -0,0 +1,69 @@
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
> > +  The HDMI TX Parallel Audio Interface (HTX_PAI) is a bridge between t=
he
> > +  Audio Subsystem to the HDMI TX Controller.
>
> What is Audio Subsystem? Like Linux Audio or some name matching actual
> hardware?

Audio subsystem is the name for hardware.

>
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
> > +  clocks:
> > +    maxItems: 1
> > +
> > +  clock-names:
> > +    const: apb
> > +
> > +  power-domains:
> > +    maxItems: 1
> > +
> > +  port:
> > +    $ref: /schemas/graph.yaml#/properties/port
> > +    description: Output to the HDMI TX controller.
>
> And how do you plug it into sound card? Where are any DAI links?

The hardware data path is Aud2htx -> HDMI PAI -> HDMI TX controller.

From a software point of view. the path is
Aud2htx -> hdmi_codec  (ALSA sound card)
hdmi_codec -> dw-hdmi-gp-audio -> hdmi_pai

hdmi_codec is registered by dw-hdmi-gp-audio.c,  hdmi_codec will call
the function in dw-hdmi-gp-audio.c, dw-hdmi-gp-audio.c will call the
function in hdmi pai driver.

Aud2htx is cpu dai in ALSA
hdmi-codec.c is the codec dai in ALSA
Above is the dai link for ALSA, they already exist in the kernel.

The HDMI PAI is the bridge, which is covered by this patch set.

Best regards
Shengjiu Wang
>
> Best regards,
> Krzysztof
>

