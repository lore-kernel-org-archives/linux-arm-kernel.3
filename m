Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 02E98C87FD2
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  7 Aug 2025 07:50:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=5Yib2PCEaqNp1Pj8TAlHvoEegTED9u37QcVhIiDH6gc=; b=Rtol7FDebbF09uQZ5QTjoBEKoS
	g7kxocd6vzEXAVko4xTVNs+ryh2oFSeC9U5eTk0U8vmY4LxZ0g7wwvrYQsqFGtH31qBe5HhX7FG1Q
	g56EaoY1h3zRC79MlvmZUgOfihuU3XZMlWYIbudqVwdDWL7GuN4Cy/1DipK9gMPnJWLREq/T2u+vO
	+zkzORdN1hGzQESw8YO9XLjx2oLMTYfyxjFBVhfXbf7w/TIg0X4QUzGTKotyGMUS7EqKa5yBEhDgg
	Xxsg6195pUW4fPimLfuUHmZuQ4/AC2QrrXMiQjQZjvG6F+WCFsmwSPhAY3T0wy7ZFQ/svUryNT3OK
	XbyIX7tg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ujvNw-0000000HVcF-1wFk;
	Thu, 07 Aug 2025 07:50:00 +0000
Received: from mail-il1-x12f.google.com ([2607:f8b0:4864:20::12f])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ujvH4-0000000HUiU-0rhv
	for linux-arm-kernel@lists.infradead.org;
	Thu, 07 Aug 2025 07:42:55 +0000
Received: by mail-il1-x12f.google.com with SMTP id e9e14a558f8ab-3e513686d5fso1797515ab.3
        for <linux-arm-kernel@lists.infradead.org>; Thu, 07 Aug 2025 00:42:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1754552573; x=1755157373; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5Yib2PCEaqNp1Pj8TAlHvoEegTED9u37QcVhIiDH6gc=;
        b=LFXQYs39K1tPlC+VTbqPPMXGXJSSybxgb2bYkOnZOrLZZsHlPlP6wkJdMdcyP9jBJQ
         iugYogKcMjwKqN/t8ewpSUzxBW8QEnmd6J9IPHeO851yD/gkzEvrhv2Q2LmuDWuJIx8S
         gdzubMAh47lV9JP5HW9N4IQb47bfpvxv/i685iCSwk1uc6N3PLROXrPOMAREG5luk4fn
         BWcBcp+iZZa7AzUg422xBuviesQqpeVM5P/HghJazOGhl5C7fzzEF0vTAoJNvGlwRdAv
         EBIBY0TS57IXQqTzEuMpqnqy/nKTu8drJUYbGd1SF+WSLAnD4XOEglFX6BogeOaN0+2+
         ul+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754552573; x=1755157373;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=5Yib2PCEaqNp1Pj8TAlHvoEegTED9u37QcVhIiDH6gc=;
        b=jFZtWzBEHtDDOCs525CRssN8RDf/ms0E7GBgeBLHIogL9SN3ULXgtLCtx1bGifxpob
         l0dysMU8u3gVMC2b6uL0m18hw+525jZ4awHFq1sdBszkq5m4Wf7TTd2n5UNJfa3CiGcl
         E3bKlGI56/8nZBRCtVImPj+VFpp7tmLg3hDHkXjQleGoL2DC2jhxYRKrGpoBTs6wOLpc
         dqKS/2j6g8BUlOyNpfL1OeNIch8yH0hSWSXraNZ/qT2iKBq78S4HnkCfpGsST/4TxPrz
         7BPKHzTnZzphegi40682A8I929zHXeRr6jW2lSLz6rB9Ae5/mpZPX1dIwxfKhFfhrXiH
         3GQA==
X-Forwarded-Encrypted: i=1; AJvYcCUBiHCqly4RNzkfKr/ORCUPOGmlSLqPPBAOj2SBiIP+Y2rZotTZJ0QhlxyVE/b8PD66gSF+9ziGq3gP0+Ly6Vpo@lists.infradead.org
X-Gm-Message-State: AOJu0YzCd3yJXE2GcGH3leHnUl2Ou2CjtciBQrgt5YXueskqKMQgHLqh
	0IrzcH4l3iSZY4B2ftOdj2HoNLSzbqJkQlqBViWQDotlPKVvW2QgSoHuNaLbN4n3IZOPRWLftcw
	dklarU+iqcmG2NX98VfZ3/SrkyP5GMrg=
X-Gm-Gg: ASbGncugnl1//ut3qkA/oRuV1RzY7au8bMIPKQGAz7XclJZgXByeueKWf+58ThNmGrC
	vrR1ukInxD6YSHEqLxyI9+9I9NEydczwgyKuV3EcU5D4JqIvccLJnGHvXp5a0me4+CckV+mGSow
	KuWrmIvJ3NED/nkgz3jt26eTBSwZSgAMbe0HRDMvh5Zy2DRixfu2ZDSG4EIw8NYD6ca9LxLULkC
	NujHaI=
X-Google-Smtp-Source: AGHT+IHdqQFtfjRtDehIGRFADkvBaA4NvCzKMcHYFjCPCJ2UEYMmg8NkMVh8psgCR7M3BrtP7IfXADIqspKMXA8NOUE=
X-Received: by 2002:a05:6e02:3f08:b0:3e3:f1e9:635f with SMTP id
 e9e14a558f8ab-3e51b8985cdmr117142635ab.8.1754552572965; Thu, 07 Aug 2025
 00:42:52 -0700 (PDT)
MIME-Version: 1.0
References: <20250804104722.601440-1-shengjiu.wang@nxp.com>
 <2380862.ElGaqSPkdT@steina-w> <CAA+D8AMqBqfRuR7oGLwH4CUrAdY4q1XGmnPXGQYUGndY0eS=yw@mail.gmail.com>
 <3006103.e9J7NaK4W3@steina-w>
In-Reply-To: <3006103.e9J7NaK4W3@steina-w>
From: Shengjiu Wang <shengjiu.wang@gmail.com>
Date: Thu, 7 Aug 2025 15:42:40 +0800
X-Gm-Features: Ac12FXyRnD4EHNKIjcnFtD3LudiK7-g39dWsOJVNfZbpF_BspGvpp8foyFbcxgc
Message-ID: <CAA+D8ANb_9GQTGCV0c5y517aSbQNnAu4wYvDhc4QPd+RqOhjbQ@mail.gmail.com>
Subject: Re: [PATCH v3 5/6] drm/bridge: imx: add driver for HDMI TX Parallel
 Audio Interface
To: Alexander Stein <alexander.stein@ew.tq-group.com>
Cc: andrzej.hajda@intel.com, neil.armstrong@linaro.org, rfoss@kernel.org, 
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
	linux-sound@vger.kernel.org, Shengjiu Wang <shengjiu.wang@nxp.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250807_004254_245781_5D91F793 
X-CRM114-Status: GOOD (  29.60  )
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

On Thu, Aug 7, 2025 at 2:48=E2=80=AFPM Alexander Stein
<alexander.stein@ew.tq-group.com> wrote:
>
> Hi,
>
> Am Mittwoch, 6. August 2025, 05:49:13 CEST schrieb Shengjiu Wang:
> > On Tue, Aug 5, 2025 at 3:09=E2=80=AFPM Alexander Stein
> > <alexander.stein@ew.tq-group.com> wrote:
> > [snip]
> > > > +static int imx8mp_dw_hdmi_bind(struct device *dev)
> > > > +{
> > > > +     struct dw_hdmi_plat_data *plat_data;
> > > > +     struct imx8mp_hdmi *hdmi;
> > > > +     int ret;
> > > > +
> > > > +     hdmi =3D dev_get_drvdata(dev);
> > > > +     plat_data =3D &hdmi->plat_data;
> > > > +
> > > > +     ret =3D component_bind_all(dev, plat_data);
> > >
> > > Do you really need plat_data variable?
> >
> > yes,  it is used in imx8mp_hdmi_pai_bind()
>
> Sorry for not being clear. I'm not talking about struct dw_hdmi_plat_data=
, but
> the local variable plat_data. You can use
>
> ret =3D component_bind_all(dev, &hdmi->plat_data);
>
> directly.

Ok,  will update the code.

>
> >
> > >
> > > > +     if (ret)
> > > > +             return dev_err_probe(dev, ret, "component_bind_all fa=
iled!\n");
> > > > +
> > > > +     return 0;
> > > > +}
> > > > +
> > > > +static void imx8mp_dw_hdmi_unbind(struct device *dev)
> > > > +{
> > > > +     struct dw_hdmi_plat_data *plat_data;
> > > > +     struct imx8mp_hdmi *hdmi;
> > > > +
> > > > +     hdmi =3D dev_get_drvdata(dev);
> > > > +     plat_data =3D &hdmi->plat_data;
> > > > +
> > > > +     component_unbind_all(dev, plat_data);
> > >
> > > Do you really need plat_data variable?
> >
> > yes,  it is used by imx8mp_hdmi_pai_unbind()
>
> Same as above. Call
>
> component_unbind_all(dev, &hdmi->plat_data)
>
> directly. Also consider assigning struct imx8mp_hdmi *hdmi =3D dev_get_dr=
vdata(dev);
> directly.

Ok,  will update the code. Thanks.

Best regards
Shengjiu Wang
>
> Best regards,
> Alexander
>
> >
> > >
> > > > +}
> > > > +
> > > > +static const struct component_master_ops imx8mp_dw_hdmi_ops =3D {
> > > > +     .bind   =3D imx8mp_dw_hdmi_bind,
> > > > +     .unbind =3D imx8mp_dw_hdmi_unbind,
> > > > +};
> > > > +
> > > >  static int imx8mp_dw_hdmi_probe(struct platform_device *pdev)
> > > >  {
> > > >       struct device *dev =3D &pdev->dev;
> > > >       struct dw_hdmi_plat_data *plat_data;
> > > > +     struct component_match *match;
> > >
> > > Set match =3D NULL for drm_of_component_match_add (and subcalls) to a=
llocate memory.
> >
> > Ok.
> >
> > best regards
> > Shengjiu wang.
> > >
> > > Best regards
> > > Alexander
> > >
> > > > +     struct device_node *remote;
> > > >       struct imx8mp_hdmi *hdmi;
> > > > +     int ret;
> > > >
> > > >       hdmi =3D devm_kzalloc(dev, sizeof(*hdmi), GFP_KERNEL);
> > > >       if (!hdmi)
> > > > @@ -108,6 +145,22 @@ static int imx8mp_dw_hdmi_probe(struct platfor=
m_device *pdev)
> > > >
> > > >       platform_set_drvdata(pdev, hdmi);
> > > >
> > > > +     /* port@2 is for hdmi_pai device */
> > > > +     remote =3D of_graph_get_remote_node(pdev->dev.of_node, 2, 0);
> > > > +     if (remote && of_device_is_available(remote)) {
> > > > +             drm_of_component_match_add(dev, &match, component_com=
pare_of, remote);
> > > > +
> > > > +             of_node_put(remote);
> > > > +
> > > > +             ret =3D component_master_add_with_match(dev, &imx8mp_=
dw_hdmi_ops, match);
> > > > +             if (ret)
> > > > +                     dev_warn(dev, "Unable to register aggregate d=
river\n");
> > > > +             /*
> > > > +              * This audio function is optional for avoid blocking=
 display.
> > > > +              * So just print warning message and no error is retu=
rned.
> > > > +              */
> > > > +     }
> > > > +
> > > >       return 0;
> > > >  }
> > > >
> > > > @@ -115,6 +168,8 @@ static void imx8mp_dw_hdmi_remove(struct platfo=
rm_device *pdev)
> > > >  {
> > > >       struct imx8mp_hdmi *hdmi =3D platform_get_drvdata(pdev);
> > > >
> > > > +     component_master_del(&pdev->dev, &imx8mp_dw_hdmi_ops);
> > > > +
> > > >       dw_hdmi_remove(hdmi->dw_hdmi);
> > > >  }
> > > >
> > > > diff --git a/include/drm/bridge/dw_hdmi.h b/include/drm/bridge/dw_h=
dmi.h
> > > > index 095cdd9b7424..336f062e1f9d 100644
> > > > --- a/include/drm/bridge/dw_hdmi.h
> > > > +++ b/include/drm/bridge/dw_hdmi.h
> > > > @@ -143,6 +143,12 @@ struct dw_hdmi_plat_data {
> > > >                                          const struct drm_display_i=
nfo *info,
> > > >                                          const struct drm_display_m=
ode *mode);
> > > >
> > > > +     /*
> > > > +      * priv_audio is specially used for additional audio device t=
o get
> > > > +      * driver data through this dw_hdmi_plat_data.
> > > > +      */
> > > > +     void *priv_audio;
> > > > +
> > > >       /* Platform-specific audio enable/disable (optional) */
> > > >       void (*enable_audio)(struct dw_hdmi *hdmi, int channel,
> > > >                            int width, int rate, int non_pcm, int ie=
c958);
> > > >
> > >
> > >
> > > --
> > > TQ-Systems GmbH | M=C3=BChlstra=C3=9Fe 2, Gut Delling | 82229 Seefeld=
, Germany
> > > Amtsgericht M=C3=BCnchen, HRB 105018
> > > Gesch=C3=A4ftsf=C3=BChrer: Detlef Schneider, R=C3=BCdiger Stahl, Stef=
an Schneider
> > > http://www.tq-group.com/
> > >
> > >
> >
>
>
> --
> TQ-Systems GmbH | M=C3=BChlstra=C3=9Fe 2, Gut Delling | 82229 Seefeld, Ge=
rmany
> Amtsgericht M=C3=BCnchen, HRB 105018
> Gesch=C3=A4ftsf=C3=BChrer: Detlef Schneider, R=C3=BCdiger Stahl, Stefan S=
chneider
> http://www.tq-group.com/
>
>

