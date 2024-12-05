Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ED338E7716D
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  5 Dec 2024 15:40:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=bITlpbaxJZ/ELoBexWwZ37dzybUATEmdzTJTeCJOdUs=; b=GMdlkNTfTF2d5AxVGw6RIpyEP9
	uofyi7ovbTS2J0Ab8H5iBRPEOySVUiFVYKe2umc0fh+/d0e7KN+oXM47Z83EWoVSSXmcuhCgjN//b
	Hf9L9D+6etddUK9xnoyuumz9BzgNFyZNJWfFT0H59vwhQDvT7Hik4sZlJ+x2IDhR1JWxCvjhAQHb9
	gQOPXFQOEw5Q5K/MtMMgmExo+Xj0OikYeQEuEVthG/cyzjJuYj3WGbYQl6AJN6Sls0V0gFE7NoC3e
	DQWRLDun0xF66EkycU4S+/ZvOQbGsvadg25G65g0rqv+AQNSfwURozYdIfpd0dykquwTaWap/64aO
	sDOVlXbA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tJDy8-0000000Gav4-3Nhj;
	Thu, 05 Dec 2024 15:40:44 +0000
Received: from mx1.tq-group.com ([93.104.207.81])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tJDx6-0000000GajZ-16rI
	for linux-arm-kernel@lists.infradead.org;
	Thu, 05 Dec 2024 15:39:42 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
  t=1733413180; x=1764949180;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=bITlpbaxJZ/ELoBexWwZ37dzybUATEmdzTJTeCJOdUs=;
  b=UoqO9PPklD4wNdll1vza8hu2Cawu/GNqhhOoI2CfB+T4+9ctNbBReK/n
   hciYpqUa4LsYcB1ArOtFhmNOi78TFLv0LePrGt8IqYRX8/W3Uo2mG6cmh
   rpmbXQRmWs5IIMC3Pa21OcjkczE8pXX53B0OyLZh1AqfODxLx7k9Pseki
   yOiIXcVF4B+E3SYT+4xaLPeVwM5ltkjU5pzJi72p83CBteAEGWQPGKZQB
   7OKMQT+liX2UIFmrzoWhebJgcAujKn6ixk6lGxQeTYzAvE97f8CDUuR4M
   3dPIsxGzhlrr2emkapTBh9a+1ErWfyP30mZ9wx0YqcdplNOFJn/C4f9tq
   w==;
X-CSE-ConnectionGUID: QIQQHHRvSUCxCFxzGq0uLg==
X-CSE-MsgGUID: lciEpNtRTu+EqC5iYhRfKA==
X-IronPort-AV: E=Sophos;i="6.12,210,1728943200"; 
   d="scan'208";a="40435594"
Received: from vmailcow01.tq-net.de ([10.150.86.48])
  by mx1.tq-group.com with ESMTP; 05 Dec 2024 16:39:37 +0100
X-CheckPoint: {6751C939-10-F5DC7025-F79421CB}
X-MAIL-CPID: D7BACB0F9DFF492E6B3DFE2FE5CB2D96_0
X-Control-Analysis: str=0001.0A682F28.6751C93A.0019,ss=1,re=0.000,recu=0.000,reip=0.000,cl=1,cld=1,fgs=0
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id A1D60160A43;
	Thu,  5 Dec 2024 16:39:30 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ew.tq-group.com;
	s=dkim; t=1733413173;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=bITlpbaxJZ/ELoBexWwZ37dzybUATEmdzTJTeCJOdUs=;
	b=jglWqUKtPxsplmsR67CkjKnm3GPFeNYZ+33ZpbMDegN2VzbsUsSNStUMqWq7f/NAamdhvz
	ys19VGl9kakyogCFGseboz6ZPnonF1lhFtEVpLxcK1SvVLCbhGgVO0i8igUPUJ+gyn7syu
	e5NPqbOjafNf9UroaitX+VbIYEQarWaYOAsDWEWpP2HKsrVKVPf4hjbNLmIHfyRJQ3Z4Dh
	IuVgmLi8a2IN/pI1Us8rRht0xzd+qW4qRKNsslp2X2AVTD/mxk9ADpvGbDpXqGtS7jcfk1
	kKF2ZX8T/aeyLGjQIiTx06a/tlO0O91Lpr64iyLW4glg8fxPkfTBnENVxwdQTA==
From: Alexander Stein <alexander.stein@ew.tq-group.com>
To: Dave Stevenson <dave.stevenson@raspberrypi.com>
Cc: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>, Sakari Ailus <sakari.ailus@linux.intel.com>, Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>, Fabio Estevam <festevam@gmail.com>, Laurent Pinchart <laurent.pinchart@ideasonboard.com>, linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v2 1/4] media: i2c: imx290: Limit analogue gain according to module
Date: Thu, 05 Dec 2024 16:39:30 +0100
Message-ID: <2214258.irdbgypaU6@steina-w>
Organization: TQ-Systems GmbH
In-Reply-To: <CAPY8ntCeYOtBhEKCcygsT-aAHJ8rxo5qP0NdjE9DMJmHCxZzsA@mail.gmail.com>
References: <20241120-media-imx290-imx462-v2-0-7e562cf191d8@raspberrypi.com> <4950196.GXAFRqVoOG@steina-w> <CAPY8ntCeYOtBhEKCcygsT-aAHJ8rxo5qP0NdjE9DMJmHCxZzsA@mail.gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="iso-8859-1"
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241205_073940_802081_C770986C 
X-CRM114-Status: GOOD (  32.29  )
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

Hi Dave,

Am Donnerstag, 5. Dezember 2024, 16:37:01 CET schrieb Dave Stevenson:
> Hi Alexander
>=20
> On Thu, 5 Dec 2024 at 15:22, Alexander Stein
> <alexander.stein@ew.tq-group.com> wrote:
> >
> > Hi Dave,
> >
> > Am Mittwoch, 20. November 2024, 20:17:03 CET schrieb Dave Stevenson:
> > > The imx327 only supports up to 29.4dB of analogue gain, vs
> > > the imx290 going up to 30dB. Both are in 0.3dB steps.
> >
> > While I agree for 30dB on imx290, my (maybe outdated) Rev0.2 datasheet =
says
> > up to 27dB in 0.3dB steps.
>=20
> For IMX327, I have revision E17Z06B93 2019/03/25.
>=20
> The revision control section for Rev0.3 lists
> Page 1: "Correction: Max analog gain 27dB - 29.4dB"
> Page 74: "Correction: Max Gain 69dB -> 71.4dB"
>=20
> The graph in "Gain Adjustment Function" (page 74) also shows values
> above 27dB as being purely analogue gain. Certainly 0x62 is red for
> analogue, which would be a gain of 29.4dB. The next dot is 0x64 (30dB)
> and blue, so we have to trust the text for 0x63 being 29.4dB analogue
> and 0.3dB digital gain.
>=20
> So I'm happy that the limit is 29.4dB.

Okay, this is a newer datasheet. So assume this is correct.

Thanks for clarification.
Reviewed-by: Alexander Stein <alexander.stein@ew.tq-group.com>

Best regards,
Alexander


>   Dave
>=20
> > Despite that this change looks good.
> >
> > Best regards,
> > Alexander
> >
> > > As we now have model specific config, fix this mismatch,
> > > and delete the comment referencing it.
> > >
> > > Signed-off-by: Dave Stevenson <dave.stevenson@raspberrypi.com>
> > > Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> > > ---
> > >  drivers/media/i2c/imx290.c | 12 ++++++------
> > >  1 file changed, 6 insertions(+), 6 deletions(-)
> > >
> > > diff --git a/drivers/media/i2c/imx290.c b/drivers/media/i2c/imx290.c
> > > index ee698c99001d..da654deb444a 100644
> > > --- a/drivers/media/i2c/imx290.c
> > > +++ b/drivers/media/i2c/imx290.c
> > > @@ -176,6 +176,7 @@ struct imx290_model_info {
> > >       enum imx290_colour_variant colour_variant;
> > >       const struct cci_reg_sequence *init_regs;
> > >       size_t init_regs_num;
> > > +     unsigned int max_analog_gain;
> > >       const char *name;
> > >  };
> > >
> > > @@ -876,14 +877,10 @@ static int imx290_ctrl_init(struct imx290 *imx2=
90)
> > >        * up to 72.0dB (240) add further digital gain. Limit the range=
 to
> > >        * analog gain only, support for digital gain can be added sepa=
rately
> > >        * if needed.
> > > -      *
> > > -      * The IMX327 and IMX462 are largely compatible with the IMX290=
, but
> > > -      * have an analog gain range of 0.0dB to 29.4dB and 42dB of dig=
ital
> > > -      * gain. When support for those sensors gets added to the drive=
r, the
> > > -      * gain control should be adjusted accordingly.
> > >        */
> > >       v4l2_ctrl_new_std(&imx290->ctrls, &imx290_ctrl_ops,
> > > -                       V4L2_CID_ANALOGUE_GAIN, 0, 100, 1, 0);
> > > +                       V4L2_CID_ANALOGUE_GAIN, 0,
> > > +                       imx290->model->max_analog_gain, 1, 0);
> > >
> > >       /*
> > >        * Correct range will be determined through imx290_ctrl_update =
setting
> > > @@ -1441,18 +1438,21 @@ static const struct imx290_model_info imx290_=
models[] =3D {
> > >               .colour_variant =3D IMX290_VARIANT_COLOUR,
> > >               .init_regs =3D imx290_global_init_settings_290,
> > >               .init_regs_num =3D ARRAY_SIZE(imx290_global_init_settin=
gs_290),
> > > +             .max_analog_gain =3D 100,
> > >               .name =3D "imx290",
> > >       },
> > >       [IMX290_MODEL_IMX290LLR] =3D {
> > >               .colour_variant =3D IMX290_VARIANT_MONO,
> > >               .init_regs =3D imx290_global_init_settings_290,
> > >               .init_regs_num =3D ARRAY_SIZE(imx290_global_init_settin=
gs_290),
> > > +             .max_analog_gain =3D 100,
> > >               .name =3D "imx290",
> > >       },
> > >       [IMX290_MODEL_IMX327LQR] =3D {
> > >               .colour_variant =3D IMX290_VARIANT_COLOUR,
> > >               .init_regs =3D imx290_global_init_settings_327,
> > >               .init_regs_num =3D ARRAY_SIZE(imx290_global_init_settin=
gs_327),
> > > +             .max_analog_gain =3D 98,
> > >               .name =3D "imx327",
> > >       },
> > >  };
> > >
> > >
> >
> >
> > --
> > TQ-Systems GmbH | M=FChlstra=DFe 2, Gut Delling | 82229 Seefeld, Germany
> > Amtsgericht M=FCnchen, HRB 105018
> > Gesch=E4ftsf=FChrer: Detlef Schneider, R=FCdiger Stahl, Stefan Schneider
> > http://www.tq-group.com/
> >
> >
>=20


=2D-=20
TQ-Systems GmbH | M=FChlstra=DFe 2, Gut Delling | 82229 Seefeld, Germany
Amtsgericht M=FCnchen, HRB 105018
Gesch=E4ftsf=FChrer: Detlef Schneider, R=FCdiger Stahl, Stefan Schneider
http://www.tq-group.com/



