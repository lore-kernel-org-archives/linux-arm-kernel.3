Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6A548C87FCF
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  7 Aug 2025 06:51:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=7Sx8JUyM3/4H7bRCB9wNV/IluDw2UIz1vKgHRy/QEVw=; b=MfQaNmwJ6qq7HEH7DTg2sSQZC+
	qb/wQBZegP2d17OFcs9ERZvObRTk1FMX11t+4nVW9WvFNVqrnk6t1m4pMjz1w8TzghrYTTLFkjnvc
	SQicprHaxws8tTsScUwaed0HaIYGQ6RFw+2xOgeWw9Tb8JJ+WaEAiUcjGnw273SUTxXXhwQ8S9R5I
	4NQdTq37oVwZPdWX/FncPF34bCeDRvs3RfSPIQq0RgGMG/ZvtGjRL2iofdzOGmslP6yr4QCv3yMRe
	HlTTex3dUYHC8eXhEm9hILcLGm1BTgmz9tpBgm0afuQMiHLFY1ySuq6dbx3IItkeHyZZUejFgNrNw
	dq8AqhKA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ujuTS-0000000HOlP-0z2M;
	Thu, 07 Aug 2025 06:51:38 +0000
Received: from mx1.tq-group.com ([93.104.207.81])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ujuQt-0000000HOSP-3zp9
	for linux-arm-kernel@lists.infradead.org;
	Thu, 07 Aug 2025 06:49:02 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
  t=1754549340; x=1786085340;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=7Sx8JUyM3/4H7bRCB9wNV/IluDw2UIz1vKgHRy/QEVw=;
  b=qF35v6uNpYb1eYQhwxY126WMDaqOUqx5CBTFCmw9hC0BZ1LdWAFJwVtM
   r1n5eG6lwnlkQldhIug+z42mMmY83UBKjl9VJbxAKE/L5sTT+RVK9VjGq
   pB28a677lqC/xc3j4oCnZCvJZcDLZU8etihKKwQXpM/xf3w9XSPt67FX8
   jw9UwvP76bwf/mXqy8wDegrpOW3uJYobTdZr1kpDIEQllCH7gVRZYKiyu
   9e0sjvUmSiFQcPQy3nRlSLELPFb04wENKZv0gJgH/+Hfo9Ip8/L/L2xbN
   9nXsrIbNLYDBD48DXWUPMKObXFjAjwoHs3vubskGWM+L/zEMQxUOKwiPu
   Q==;
X-CSE-ConnectionGUID: I2PmyxDYScSuTRFw+H5RPw==
X-CSE-MsgGUID: XDJruS2UTWOZejcJYgaFyQ==
X-IronPort-AV: E=Sophos;i="6.17,271,1747692000"; 
   d="scan'208";a="45628058"
Received: from vmailcow01.tq-net.de ([10.150.86.48])
  by mx1.tq-group.com with ESMTP; 07 Aug 2025 08:48:51 +0200
X-CheckPoint: {68944C53-3-299FBAB0-EF52EDE7}
X-MAIL-CPID: 9B87D54F7B707BEEAED780E1C71972C8_5
X-Control-Analysis: str=0001.0A002116.68944C87.0028,ss=1,re=0.000,recu=0.000,reip=0.000,cl=1,cld=1,fgs=0
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 509341613DA;
	Thu,  7 Aug 2025 08:48:36 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ew.tq-group.com;
	s=dkim; t=1754549326;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=7Sx8JUyM3/4H7bRCB9wNV/IluDw2UIz1vKgHRy/QEVw=;
	b=mrGZMwTtVtjo5kHwbg35IQX/P5TNnTWBQcIxNa9iUC7uSo7rTQLbuzsOAR0XdkbAgHVYVL
	jhBCsFQ9GwQKTzxzFPGU93q2evcLKB7X2GV5sLvGVSMBpjyhMaVcnVV/rYGDshvdUVR1aY
	2Yr7vXdhMvML4A8B1d0fq+SM2JIoHoGGPg5LifurXToqn06YRqsdSb21SAOEInEIwqMk0B
	FooH5azD929SoI3ZX6geUNC3FRIAAorL18g5SBmBcTIs88LaVBmxpepG81KTLhjPbZWHHe
	v6eTmkjeBRyGiFoqWRFob27/ZWAQLxM6SzAIhAMo6/mr1j/iTjRKpAZKOAuMnA==
From: Alexander Stein <alexander.stein@ew.tq-group.com>
To: Shengjiu Wang <shengjiu.wang@gmail.com>
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
Subject: Re: [PATCH v3 5/6] drm/bridge: imx: add driver for HDMI TX Parallel Audio
 Interface
Date: Thu, 07 Aug 2025 08:48:35 +0200
Message-ID: <3006103.e9J7NaK4W3@steina-w>
Organization: TQ-Systems GmbH
In-Reply-To: <CAA+D8AMqBqfRuR7oGLwH4CUrAdY4q1XGmnPXGQYUGndY0eS=yw@mail.gmail.com>
References: <20250804104722.601440-1-shengjiu.wang@nxp.com> <2380862.ElGaqSPkdT@steina-w>
 <CAA+D8AMqBqfRuR7oGLwH4CUrAdY4q1XGmnPXGQYUGndY0eS=yw@mail.gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="UTF-8"
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250806_234900_486452_F87F5ACD 
X-CRM114-Status: GOOD (  23.93  )
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

Hi,

Am Mittwoch, 6. August 2025, 05:49:13 CEST schrieb Shengjiu Wang:
> On Tue, Aug 5, 2025 at 3:09=E2=80=AFPM Alexander Stein
> <alexander.stein@ew.tq-group.com> wrote:
> [snip]
> > > +static int imx8mp_dw_hdmi_bind(struct device *dev)
> > > +{
> > > +     struct dw_hdmi_plat_data *plat_data;
> > > +     struct imx8mp_hdmi *hdmi;
> > > +     int ret;
> > > +
> > > +     hdmi =3D dev_get_drvdata(dev);
> > > +     plat_data =3D &hdmi->plat_data;
> > > +
> > > +     ret =3D component_bind_all(dev, plat_data);
> >
> > Do you really need plat_data variable?
>=20
> yes,  it is used in imx8mp_hdmi_pai_bind()

Sorry for not being clear. I'm not talking about struct dw_hdmi_plat_data, =
but
the local variable plat_data. You can use

ret =3D component_bind_all(dev, &hdmi->plat_data);

directly.

>=20
> >
> > > +     if (ret)
> > > +             return dev_err_probe(dev, ret, "component_bind_all fail=
ed!\n");
> > > +
> > > +     return 0;
> > > +}
> > > +
> > > +static void imx8mp_dw_hdmi_unbind(struct device *dev)
> > > +{
> > > +     struct dw_hdmi_plat_data *plat_data;
> > > +     struct imx8mp_hdmi *hdmi;
> > > +
> > > +     hdmi =3D dev_get_drvdata(dev);
> > > +     plat_data =3D &hdmi->plat_data;
> > > +
> > > +     component_unbind_all(dev, plat_data);
> >
> > Do you really need plat_data variable?
>=20
> yes,  it is used by imx8mp_hdmi_pai_unbind()

Same as above. Call

component_unbind_all(dev, &hdmi->plat_data)

directly. Also consider assigning struct imx8mp_hdmi *hdmi =3D dev_get_drvd=
ata(dev);
directly.

Best regards,
Alexander

>=20
> >
> > > +}
> > > +
> > > +static const struct component_master_ops imx8mp_dw_hdmi_ops =3D {
> > > +     .bind   =3D imx8mp_dw_hdmi_bind,
> > > +     .unbind =3D imx8mp_dw_hdmi_unbind,
> > > +};
> > > +
> > >  static int imx8mp_dw_hdmi_probe(struct platform_device *pdev)
> > >  {
> > >       struct device *dev =3D &pdev->dev;
> > >       struct dw_hdmi_plat_data *plat_data;
> > > +     struct component_match *match;
> >
> > Set match =3D NULL for drm_of_component_match_add (and subcalls) to all=
ocate memory.
>=20
> Ok.
>=20
> best regards
> Shengjiu wang.
> >
> > Best regards
> > Alexander
> >
> > > +     struct device_node *remote;
> > >       struct imx8mp_hdmi *hdmi;
> > > +     int ret;
> > >
> > >       hdmi =3D devm_kzalloc(dev, sizeof(*hdmi), GFP_KERNEL);
> > >       if (!hdmi)
> > > @@ -108,6 +145,22 @@ static int imx8mp_dw_hdmi_probe(struct platform_=
device *pdev)
> > >
> > >       platform_set_drvdata(pdev, hdmi);
> > >
> > > +     /* port@2 is for hdmi_pai device */
> > > +     remote =3D of_graph_get_remote_node(pdev->dev.of_node, 2, 0);
> > > +     if (remote && of_device_is_available(remote)) {
> > > +             drm_of_component_match_add(dev, &match, component_compa=
re_of, remote);
> > > +
> > > +             of_node_put(remote);
> > > +
> > > +             ret =3D component_master_add_with_match(dev, &imx8mp_dw=
_hdmi_ops, match);
> > > +             if (ret)
> > > +                     dev_warn(dev, "Unable to register aggregate dri=
ver\n");
> > > +             /*
> > > +              * This audio function is optional for avoid blocking d=
isplay.
> > > +              * So just print warning message and no error is return=
ed.
> > > +              */
> > > +     }
> > > +
> > >       return 0;
> > >  }
> > >
> > > @@ -115,6 +168,8 @@ static void imx8mp_dw_hdmi_remove(struct platform=
_device *pdev)
> > >  {
> > >       struct imx8mp_hdmi *hdmi =3D platform_get_drvdata(pdev);
> > >
> > > +     component_master_del(&pdev->dev, &imx8mp_dw_hdmi_ops);
> > > +
> > >       dw_hdmi_remove(hdmi->dw_hdmi);
> > >  }
> > >
> > > diff --git a/include/drm/bridge/dw_hdmi.h b/include/drm/bridge/dw_hdm=
i.h
> > > index 095cdd9b7424..336f062e1f9d 100644
> > > --- a/include/drm/bridge/dw_hdmi.h
> > > +++ b/include/drm/bridge/dw_hdmi.h
> > > @@ -143,6 +143,12 @@ struct dw_hdmi_plat_data {
> > >                                          const struct drm_display_inf=
o *info,
> > >                                          const struct drm_display_mod=
e *mode);
> > >
> > > +     /*
> > > +      * priv_audio is specially used for additional audio device to =
get
> > > +      * driver data through this dw_hdmi_plat_data.
> > > +      */
> > > +     void *priv_audio;
> > > +
> > >       /* Platform-specific audio enable/disable (optional) */
> > >       void (*enable_audio)(struct dw_hdmi *hdmi, int channel,
> > >                            int width, int rate, int non_pcm, int iec9=
58);
> > >
> >
> >
> > --
> > TQ-Systems GmbH | M=C3=BChlstra=C3=9Fe 2, Gut Delling | 82229 Seefeld, =
Germany
> > Amtsgericht M=C3=BCnchen, HRB 105018
> > Gesch=C3=A4ftsf=C3=BChrer: Detlef Schneider, R=C3=BCdiger Stahl, Stefan=
 Schneider
> > http://www.tq-group.com/
> >
> >
>=20


=2D-=20
TQ-Systems GmbH | M=C3=BChlstra=C3=9Fe 2, Gut Delling | 82229 Seefeld, Germ=
any
Amtsgericht M=C3=BCnchen, HRB 105018
Gesch=C3=A4ftsf=C3=BChrer: Detlef Schneider, R=C3=BCdiger Stahl, Stefan Sch=
neider
http://www.tq-group.com/



