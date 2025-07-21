Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 89D7BC83F27
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 21 Jul 2025 03:40:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=UtsiXR0EQZlATD8N1ReRV9zk/lQTOXFRW0wcbXVZLic=; b=0ewO+es1Y8Ty3aEedWHefzqzsQ
	vpdGeBUoNCv0P3XgIQ6nWeNsm7DikhrfFoQiJYU3mvUJ4ut2Xwb+v42wG7OcdsQGKsi4orqVQQJhL
	EimVqX2HCgsNoRCUQEcslftzOY+3BWuYlNs0fM0NML/PG8+5E/EQ5hJU7oEbK5B7DAILo5QwvlVbU
	/vyKAaFolGAJLZ4vDD+oJ5/5kXBAaUkYsBbL0hgRVb7VbELjK7SDjMsjyfYhI59uymU97KzY2QP4p
	r6FxdKHQrvgBEBSlbRi4TbYEMFNzKbXcbMgtBnOcfS82fuFB5Zm0EBZ/uoRP5UzWLWysGcPGJlNl9
	+C4nMbTQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1udhOL-0000000G70b-2fvO;
	Mon, 21 Jul 2025 03:40:41 +0000
Received: from mail-il1-x131.google.com ([2607:f8b0:4864:20::131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1udhD6-0000000G5ot-0bYA
	for linux-arm-kernel@lists.infradead.org;
	Mon, 21 Jul 2025 03:29:05 +0000
Received: by mail-il1-x131.google.com with SMTP id e9e14a558f8ab-3df2ccbb895so36767815ab.3
        for <linux-arm-kernel@lists.infradead.org>; Sun, 20 Jul 2025 20:29:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1753068543; x=1753673343; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=UtsiXR0EQZlATD8N1ReRV9zk/lQTOXFRW0wcbXVZLic=;
        b=BDq9okShYvucdWtDBidz6n6+nrRE/Ambj2B51R4wdjiJwL+Rmt8mj0TBL69rP3fUIy
         lz49OheTkHUyR3tUa6O+W3i1/6DRPx330CdI8BlRMY2lx7ZgYfZfcoTkrwFyEMF2sqsX
         a74TLdbLE5h2fygPe1E83W0BrOHIu/jMkhhGtvjV9SL6E3BcKAqdotRK4aL1oe4DoVwp
         1GZBFrg0lGck1mzN1LwfHhHTKpMW+2l/NBHIsWXUlB57faZk63ge33nOmgAUUQTM6aRI
         BkBIuMiIsvopBF4Tumdsc3Ybe38+GT0iBVxc0Sm8O8MWBvJySHY3srQGG5dhXQ1CgM8Q
         YOdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753068543; x=1753673343;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=UtsiXR0EQZlATD8N1ReRV9zk/lQTOXFRW0wcbXVZLic=;
        b=CCkTXpUy333EMDnkucB6l1NLkFXU//lNSnYaPOHtPPY7pAqHNdrIsAL8zW2h9vjiJL
         K+ZsxGeUk/EM1Ed5ah0z/MSWLM4AV9ELwhRMiRPIF6Tt3zA4B2Alz0qd6MffYUcR1xCO
         4MYEhVwP8jtfotYZJwP3rOzfQWIE0xrvKqEAv4OioN9JZeaEiklFaU1+r40qI8xrT7BQ
         Ry+cuX5d6ct0OCcTA1U5tW7JXH+lR0GEgUFli4iwPJf4c4iGBPGDOiWu9jwbsefASOzs
         e5+rBFiEP1TljdnI97WtwGh2jcqKDbcv1v+Yc58rXjnxGR+vbjM6ytM9azKVQYlmWuEI
         xEBw==
X-Forwarded-Encrypted: i=1; AJvYcCU+gbnQPFkzJAo6eZO6WdHY9nsDP7KV/WwVfEzbYySmpI2jk38aKpNmT+jWPiKiW1i2aMxlts6TgsVPXbRKgYV9@lists.infradead.org
X-Gm-Message-State: AOJu0Yx4hwWzldbstgfvp0p/q1tBGg+nS4zZ69UyQbBqVqurlLNbsB+N
	LLzlDwfemAua+omZVcevTmxYFaXoFdWISOjD+2J0U8QaXV3jAGnlUopGyDs9NnneidZ7YJO2VK9
	TqfQ+vAU9zb3beZV6cA2wICFTAO7//FE=
X-Gm-Gg: ASbGncvHGecPYCqBWJDXbmO5LM9aTDnGKBZwC7e2h/3qgBqVEIg8XNci6soKSuy75OF
	/3yRNXHOuuAZbcvb8ggxD4IT4EDs7WVi+UM8n3Z5xtBkSylW0za8SfMRxpZ/hI9kt3HPMokMwZ/
	pNcCBZCgjFyPt4Dc191wLW8srj9N91W8quT9L188tLkcjfMQl2ZKdoGzx0VnvSFZefr3lz/Do+8
	cemH5SFV5nrwapsgA==
X-Google-Smtp-Source: AGHT+IETEm9xXMr77IDr6KJZdmuLlNFoj+aCrz2mROuJITSXc/2fmarCRzlGXALoW/ZTbwduUUZbV41vvElTnzhtcLQ=
X-Received: by 2002:a05:6e02:1fec:b0:3df:347f:ff3e with SMTP id
 e9e14a558f8ab-3e282d9c846mr214673475ab.7.1753068542942; Sun, 20 Jul 2025
 20:29:02 -0700 (PDT)
MIME-Version: 1.0
References: <20250718101150.3681002-1-shengjiu.wang@nxp.com>
 <20250718101150.3681002-5-shengjiu.wang@nxp.com> <aHp2jxNRPfYGUiUY@lizhi-Precision-Tower-5810>
In-Reply-To: <aHp2jxNRPfYGUiUY@lizhi-Precision-Tower-5810>
From: Shengjiu Wang <shengjiu.wang@gmail.com>
Date: Mon, 21 Jul 2025 11:28:47 +0800
X-Gm-Features: Ac12FXxlzAFWQkaGaWWuP5cmwncPGBSTwpvgKOefFzCXa9uYxNYrdhmd2LNtgq8
Message-ID: <CAA+D8AO4+YRrsFUU3kDB_YU5WbA8Dm=+0v_NOvZ2jqg4vPjRKg@mail.gmail.com>
Subject: Re: [PATCH 4/4] arm64: dts: imx8mp: Add hdmi parallel audio interface node
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
X-CRM114-CacheID: sfid-20250720_202904_192964_3A5B8EE3 
X-CRM114-Status: GOOD (  20.26  )
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

On Sat, Jul 19, 2025 at 12:30=E2=80=AFAM Frank Li <Frank.li@nxp.com> wrote:
>
> On Fri, Jul 18, 2025 at 06:11:50PM +0800, Shengjiu Wang wrote:
> > The HDMI TX Parallel Audio Interface (HTX_PAI) is a digital module that
> > acts as the bridge between the Audio Subsystem to the HDMI TX Controlle=
r.
>
> Remove " a digital module that acts as the" is more straightforward.
>
> >
> > Correct the register map of hdmi_pvi, which is overlapped with the
> > hdmi_pai device.
>
> Shrink register map size of hdmi_pvi to avoid overlapped hdmi_pai device.

Ok, will update them in next version.
>
> >
> > Signed-off-by: Shengjiu Wang <shengjiu.wang@nxp.com>
> > ---
> >  arch/arm64/boot/dts/freescale/imx8mp-evk.dts |  4 +++
> >  arch/arm64/boot/dts/freescale/imx8mp.dtsi    | 26 +++++++++++++++++++-
> >  2 files changed, 29 insertions(+), 1 deletion(-)
> >
> > diff --git a/arch/arm64/boot/dts/freescale/imx8mp-evk.dts b/arch/arm64/=
boot/dts/freescale/imx8mp-evk.dts
> > index c0cc5611048e..cc9351a5bd65 100644
> > --- a/arch/arm64/boot/dts/freescale/imx8mp-evk.dts
> > +++ b/arch/arm64/boot/dts/freescale/imx8mp-evk.dts
> > @@ -442,6 +442,10 @@ &flexcan2 {
> >       status =3D "disabled";/* can2 pin conflict with pdm */
> >  };
> >
> > +&hdmi_pai {
> > +     status =3D "okay";
> > +};
> > +
> >  &hdmi_pvi {
> >       status =3D "okay";
> >  };
> > diff --git a/arch/arm64/boot/dts/freescale/imx8mp.dtsi b/arch/arm64/boo=
t/dts/freescale/imx8mp.dtsi
> > index bb24dba7338e..6e5a41f46309 100644
> > --- a/arch/arm64/boot/dts/freescale/imx8mp.dtsi
> > +++ b/arch/arm64/boot/dts/freescale/imx8mp.dtsi
> > @@ -2063,7 +2063,7 @@ irqsteer_hdmi: interrupt-controller@32fc2000 {
> >
> >                       hdmi_pvi: display-bridge@32fc4000 {
> >                               compatible =3D "fsl,imx8mp-hdmi-pvi";
> > -                             reg =3D <0x32fc4000 0x1000>;
> > +                             reg =3D <0x32fc4000 0x800>;
> >                               interrupt-parent =3D <&irqsteer_hdmi>;
> >                               interrupts =3D <12>;
> >                               power-domains =3D <&hdmi_blk_ctrl IMX8MP_=
HDMIBLK_PD_PVI>;
> > @@ -2089,6 +2089,22 @@ pvi_to_hdmi_tx: endpoint {
> >                               };
> >                       };
> >
> > +                     hdmi_pai: hdmi@32fc4800 {
>
> commit message it is bridge device, maybe audio-bridge is good node name

Ok, will use audio-bridge.

best regards
Shengjiu Wang
>
> Frank
> > +                             compatible =3D "fsl,imx8mp-hdmi-pai";
> > +                             reg =3D <0x32fc4800 0x800>;
> > +                             interrupt-parent =3D <&irqsteer_hdmi>;
> > +                             interrupts =3D <14>;
> > +                             power-domains =3D <&hdmi_blk_ctrl IMX8MP_=
HDMIBLK_PD_PAI>;
> > +                             status =3D "disabled";
> > +
> > +                             port {
> > +
> > +                                     pai_to_hdmi_tx: endpoint {
> > +                                             remote-endpoint =3D <&hdm=
i_tx_from_pai>;
> > +                                     };
> > +                             };
> > +                     };
> > +
> >                       lcdif3: display-controller@32fc6000 {
> >                               compatible =3D "fsl,imx8mp-lcdif";
> >                               reg =3D <0x32fc6000 0x1000>;
> > @@ -2140,6 +2156,14 @@ port@1 {
> >                                               reg =3D <1>;
> >                                               /* Point endpoint to the =
HDMI connector */
> >                                       };
> > +
> > +                                     port@2 {
> > +                                             reg =3D <2>;
> > +
> > +                                             hdmi_tx_from_pai: endpoin=
t {
> > +                                                     remote-endpoint =
=3D <&pai_to_hdmi_tx>;
> > +                                             };
> > +                                     };
> >                               };
> >                       };
> >
> > --
> > 2.34.1
> >

