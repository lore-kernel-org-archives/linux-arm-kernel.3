Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D8966C55822
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  5 Aug 2026 06:58:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=DS3y93XU+UV4dALPduKnv8HEZ3Qoa8U7PDzyKjP+lKM=; b=leJMCXY549yfW1Ldh6vRfXZJ7p
	EjJKU6e89itpYQhIXIBBb7tsdxmvne7PCtxNrq3xZ8jJ4strSJqd1dHCAwJkjy1Pr8PvT64mZ3Dcq
	/Nu/KrbKGEsxsym242Oo7/u0ybREkN76U5OedAz2guG5/g7A2hsbuvRjwO6vyKUuxZVSw0BQG+I8U
	TtlnOiSkSKMMh1c9oz/fTNHye86hd4B/c9b0nhtd9e6wPpcyxHDe4KeiI2pqYrNaQfc3awZZhIUec
	YIF8N5Yiwmip6yS4LAvLDuz6ow+ms0HxrwUpVboNzupROvh6jSaIHFvgjjqfmrO5LWHMP430RBl7Y
	vWyF+JUQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wrVZw-00000003Lz8-247T;
	Wed, 05 Aug 2026 06:58:16 +0000
Received: from mail-pl1-x630.google.com ([2607:f8b0:4864:20::630])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wrVZu-00000003Lyh-0Uww
	for linux-arm-kernel@lists.infradead.org;
	Wed, 05 Aug 2026 06:58:15 +0000
Received: by mail-pl1-x630.google.com with SMTP id d9443c01a7336-2caea3f742bso10173215ad.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 04 Aug 2026 23:58:13 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1785913093; cv=none;
        d=google.com; s=arc-20260327;
        b=OYQu0VmO4uJYxuzAtCMdqOejuQTV0dbxsN+fsKT6QMmbp4L35lzreYlrdHL0I8qNt3
         i4/Nz/EV59XPwtiN6/e8Yr6ZQf0Bfm9rd/Ya7JdKxvMpU2ahFFu/5LR9MqEvZosG3Moe
         GBj1qKn5uNbMQ3uNt5XmSsR4sPaR4sQvage4RuROSbdnTAkgkMxXQHtEl2nJlvKJMjHG
         BZPj9ed7UZ8tIzxHyJq7KhyEyeEmwmzCsEXK+ZNG9h5VrhBYVBS+xyOT/XJp/GR5K0Sx
         BPUgqOfvam25D/JhjtO/DSmDo6dPcgW8+CZVZh3BvySaLesNEt32U5tYc21ptgXodlte
         Ckfw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=DS3y93XU+UV4dALPduKnv8HEZ3Qoa8U7PDzyKjP+lKM=;
        fh=3Ij2K3qXiLqvMXhj7Oh1HUh2B97NQZI8OF2NUcqDNsQ=;
        b=LQSZOOH+hQiC4zCYq7YJY7RGHep1Nvd79DSapBjQCcS3qAdZY3UIaDXUpkJpSkMUeZ
         o8jv6tImWsU8sJSSNUQ+VaIa0Zdf1uYtjOYIetNYjKyJkbPVDKvvOj4K2ZKtCaUk+cut
         W31s2JTPW1qyMslvHMPDysckmzIG/oh4sE8VJHkuBKRaWnSp/cFRgDlp7bSHj+IJDddx
         NeRxws0M1QEadD/mb08RkJ0aCdlGFaJARZgVCmmr9Q01obVnxqpz0JxeA3QiaT7SmIt3
         vEucM2frzE0Ft2d8Y7Kv7pTtMIC6zNe8CqcNsG0BAkcAzZFbaDLWDNQJv5iOvQ2+Htg5
         ZvCQ==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785913093; x=1786517893; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=DS3y93XU+UV4dALPduKnv8HEZ3Qoa8U7PDzyKjP+lKM=;
        b=Ups5L4fBD/wTXvOuXie8KHSLGBStqFl8v1MlPVhcpoDPq+ZA6F84WKLifwPbKN3CCi
         /MiVlyZ+y96AUB2jX7S3oEdecLTtMa8a0bedj4/Pk8yaEtvGDs4y5uHozoQ3WRC+Smae
         scsNU+nDhU5QqnQx0SK9OVimLCVSq2JUf5mdRlBkPSNzMvxi6jtUjqyb6Af7S/Ybkhkk
         KGSeUh0jQZ0/sG2bBywSqb7li4lloeJ9oMhhotcUmQhPPIw+Crqyfxhef24DUk/vfqo0
         toKNyeUiLhL3pzzzS6Oh+siGisCBk5uE/gkVz8aEvHbZ1EZ67weEDHFdEZFJ2tG3Eeth
         1lAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785913093; x=1786517893;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=DS3y93XU+UV4dALPduKnv8HEZ3Qoa8U7PDzyKjP+lKM=;
        b=f6J02AAOWkoXVP1E3oHQnaRs6K7s+PxgidSSSangEc7OVwgft/BbbR5IFj9udt9J0i
         2LjM5piK6m8zZkJwaLJwgR6zsY+7LVEelldMPxdacLiehlO+SRNVLJrnDE/+KoEmQREU
         2W5Irls4V6oE1IyGGpEksQiu3Ys4ChSKOd4Q2x7w41YEwu2MNtkY/4Ja7EJZTfgnCrFY
         293u7kXW2v3ors4uyDjFD8EUKacCl4BI2qgzLRO28LEsHqU0ZPgoDWrKgd0T1RIEId6A
         ElaYOTNG0LSIROa6GizJgT+u103U19mBVyE4puF4QlfwKQryWmSn+Rt6Oq8Dgxk9lqaa
         Nqog==
X-Forwarded-Encrypted: i=1; AHgh+RprmxVj7m7xffF1gRHIOUh3mShxH8xmVZdIBXO0Q6DkOuOUWqmf99zD+FDzhUsghiD8u/XGV9IdjkYeigZrOSHF@lists.infradead.org
X-Gm-Message-State: AOJu0Yzyzpz1nNRA/pf0W6mJjKpNIiAK5wRx+u1ZG26gTNJndleoOnTi
	ixIAlJmlU9hJu+Jn5Rg5EM9eJsPQEvRg5gxbEaDUskYgCaCjGZsOn4dPuRBdBZjfZ7vXaps7YeY
	q5ulDf1mA7LB1VAJjPx44y9/y9c3+viA=
X-Gm-Gg: AR+sD12SZz8SP7IjnZvvxc1KgpEmnSt/03Uj9u8j3qyTelkGvzk5/XUirNFV39W3/qB
	sAv1RVC+YZIhtsip6lgWQ3A60ntNJ96M6BuommG81zGfn0TJ4aWJiKZRD2t4DedsDmA80TwdfQs
	r+DGp5Z//X6+Zpjjwe4xHigDbqvAeWYLobpDsu2AXZQK4Msj4PAcub+f3tBVg/8/H+4iRBhNZU1
	GlUKUctRxKTAffuIwm0+E5SrPvnwZy9+dRi+fn7L1Qjj3q35ziXrV5K79DTjVR0II6QfeJQbxxQ
	I+c+umRlC5xgWS/m0YzbLfTRIgbZSGs4ki6dhbY9F4Vg
X-Received: by 2002:a05:6a21:3a48:b0:3b4:61f:1fec with SMTP id
 adf61e73a8af0-3cb85df12ddmr5759243637.2.1785913093306; Tue, 04 Aug 2026
 23:58:13 -0700 (PDT)
MIME-Version: 1.0
References: <20260804100218.49587-1-shengjiu.wang@oss.nxp.com>
 <20260804100218.49587-2-shengjiu.wang@oss.nxp.com> <anH5i7y3JkB1moee@SMW015318>
In-Reply-To: <anH5i7y3JkB1moee@SMW015318>
From: Shengjiu Wang <shengjiu.wang@gmail.com>
Date: Wed, 5 Aug 2026 14:57:59 +0800
X-Gm-Features: AUfX_mxtqJzMX_WVEhniuKHoKxDYIHB5iQVu-6lJu_NKLxZB1goSegJJZEResBc
Message-ID: <CAA+D8ANCoc5qOUvTQPRNkvrfqAY3n6x_fbfUveP8Sfv+SL1NVw@mail.gmail.com>
Subject: Re: [PATCH v3 1/5] ASoC: dt-bindings: fsl,imx-asrc: update port
 binding to support multiple paths
To: Frank Li <Frank.li@oss.nxp.com>
Cc: shengjiu.wang@oss.nxp.com, lgirdwood@gmail.com, broonie@kernel.org, 
	robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, Frank.Li@nxp.com, 
	s.hauer@pengutronix.de, kernel@pengutronix.de, festevam@gmail.com, 
	shawnguo@kernel.org, linux-sound@vger.kernel.org, devicetree@vger.kernel.org, 
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, Xiubo.Lee@gmail.com, nicoleotsuka@gmail.com, 
	perex@perex.cz, tiwai@suse.com, linuxppc-dev@lists.ozlabs.org, 
	Shengjiu Wang <shengjiu.wang@nxp.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260804_235814_186891_384D08B7 
X-CRM114-Status: GOOD (  24.62  )
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

On Tue, Aug 4, 2026 at 10:39=E2=80=AFPM Frank Li <Frank.li@oss.nxp.com> wro=
te:
>
> On Tue, Aug 04, 2026 at 06:02:14PM +0800, shengjiu.wang@oss.nxp.com wrote=
:
> > From: Shengjiu Wang <shengjiu.wang@nxp.com>
> >
> > The i.MX ASRC hardware supports up to three conversion pairs (A, B, C).
> > The existing binding exposed only a single generic audio-graph port,
> > which cannot represent independent conversion paths when multiple pairs
> > are in use simultaneously.
> >
> > Add a ports container that enumerates up to three sub-ports, each
> > representing an independent conversion path:
> >   port@0 -- conversion path 0
> >   port@1 -- conversion path 1
> >   port@2 -- conversion path 2
> >
> > Each sub-port references audio-graph-port.yaml as before. Hardware pair=
s
> > are allocated dynamically at stream open time; each active stream
> > direction (playback or capture) on a port consumes one hardware pair.
> >
> > For backwards compatibility, keep the old single port property but mark
> > it deprecated. A schema constraint (not: required: [port, ports]) ensur=
es
> > that both forms cannot be used at the same time. The binding example is
> > updated to show the preferred ports form.
> >
> > No existing upstream DTS file for fsl,imx-asrc uses the previously
> > documented single 'port' node, so this change does not break any
> > in-tree device tree.
>
> if no existing upstream DTS file use it, you can direct replace with port=
s

That is to avoid any downstream use of the 'port', so not directly replace =
it.

best regards
Shengjiu Wang

>
> Frank
>
> >
> > Signed-off-by: Shengjiu Wang <shengjiu.wang@nxp.com>
> > ---
> >  .../bindings/sound/fsl,imx-asrc.yaml          | 45 ++++++++++++++++---
> >  1 file changed, 40 insertions(+), 5 deletions(-)
> >
> > diff --git a/Documentation/devicetree/bindings/sound/fsl,imx-asrc.yaml =
b/Documentation/devicetree/bindings/sound/fsl,imx-asrc.yaml
> > index 608defc93c1e..67d2826eef3f 100644
> > --- a/Documentation/devicetree/bindings/sound/fsl,imx-asrc.yaml
> > +++ b/Documentation/devicetree/bindings/sound/fsl,imx-asrc.yaml
> > @@ -78,9 +78,19 @@ properties:
> >    power-domains:
> >      maxItems: 1
> >
> > +  ports:
> > +    $ref: /schemas/graph.yaml#/properties/ports
> > +    patternProperties:
> > +      "^port@[0-2]$":
> > +        $ref: audio-graph-port.yaml#
> > +        unevaluatedProperties: false
> > +        description: port for an independent conversion path
> > +
> >    port:
> >      $ref: audio-graph-port.yaml#
> >      unevaluatedProperties: false
> > +    deprecated: true
> > +    description: deprecated, use ports instead
> >
> >    fsl,asrc-rate:
> >      $ref: /schemas/types.yaml#/definitions/uint32
> > @@ -125,6 +135,10 @@ required:
> >    - fsl,asrc-width
> >
> >  allOf:
> > +  - not:
> > +      required:
> > +        - port
> > +        - ports
> >    - $ref: dai-common.yaml#
> >    - if:
> >        properties:
> > @@ -180,11 +194,32 @@ examples:
> >          fsl,asrc-rate =3D <48000>;
> >          fsl,asrc-width =3D <16>;
> >
> > -        port {
> > -            playback-only;
> > +        ports {
> > +            #address-cells =3D <1>;
> > +            #size-cells =3D <0>;
> > +
> > +            port@0 {
> > +                reg =3D <0>;
> > +                playback-only;
> > +                endpoint {
> > +                    remote-endpoint =3D <&fe00_ep>;
> > +                };
> > +            };
> > +
> > +            port@1 {
> > +                reg =3D <1>;
> > +                capture-only;
> > +                endpoint {
> > +                    remote-endpoint =3D <&fe01_ep>;
> > +                };
> > +            };
> >
> > -            asrc_endpoint: endpoint {
> > -                remote-endpoint =3D <&fe00_ep>;
> > +            port@2 {
> > +                reg =3D <2>;
> > +                capture-only;
> > +                endpoint {
> > +                    remote-endpoint =3D <&fe02_ep>;
> > +                };
> >              };
> > -       };
> > +        };
> >      };
> > --
> > 2.34.1
> >
> >

