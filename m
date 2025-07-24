Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1AB84C83F26
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 24 Jul 2025 08:01:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=fnlDCWYHfPKrH3rayzgJ2Tpv0SxEpSkzNBVJVqaZHVE=; b=WBT/BbOhLAY3xgfUIJ2VN2AZ7K
	lOFdgcXTFC1rTDdsvtcwaH1oa9pzTuG7mtozTCA/236By97aiK8zCTEqx89+uBvMDOfeJ4Wcwpc9/
	mB0P60ZoOmwgEQKcDum+aOqlaqQBufbEGdPkMscorMMBza4g4PJWLJMPTJWan88U/inMdrxvpndDn
	CQP2oiIyfeKReofQCFnLvuxW051VjgW9gpq5Dr2X5ocpoh3dNeu8QXuykzdWIlCIFSCB0oIRyfQ09
	UCiLVhwL/TvT81F0LxTaPvU3Z7se8FBnY1uUcXB+BHXCkRoMCzGU+7SrpIkxvWR0H2bgjzuPxIj0L
	RIvuHIpw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ueqte-00000006mOH-09a1;
	Thu, 24 Jul 2025 08:01:46 +0000
Received: from metis.whiteo.stw.pengutronix.de ([2a0a:edc0:2:b01:1d::104])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ueqZm-00000006ja9-3SGx
	for linux-arm-kernel@lists.infradead.org;
	Thu, 24 Jul 2025 07:41:16 +0000
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.whiteo.stw.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <mkl@pengutronix.de>)
	id 1ueqZC-0004mm-Cq; Thu, 24 Jul 2025 09:40:38 +0200
Received: from moin.white.stw.pengutronix.de ([2a0a:edc0:0:b01:1d::7b] helo=bjornoya.blackshift.org)
	by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <mkl@pengutronix.de>)
	id 1ueqZ9-00A1Dn-32;
	Thu, 24 Jul 2025 09:40:35 +0200
Received: from pengutronix.de (p5b1645f7.dip0.t-ipconnect.de [91.22.69.247])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	(Authenticated sender: mkl-all@blackshift.org)
	by smtp.blackshift.org (Postfix) with ESMTPSA id 5B108447D62;
	Thu, 24 Jul 2025 07:40:35 +0000 (UTC)
Date: Thu, 24 Jul 2025 09:40:34 +0200
From: Marc Kleine-Budde <mkl@pengutronix.de>
To: Takashi Iwai <tiwai@suse.de>
Cc: Shengjiu Wang <shengjiu.wang@nxp.com>, imx@lists.linux.dev, 
	dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, Laurent.pinchart@ideasonboard.com, 
	andrzej.hajda@intel.com, festevam@gmail.com, simona@ffwll.ch, robh@kernel.org, 
	shengjiu.wang@gmail.com, rfoss@kernel.org, airlied@gmail.com, tiwai@suse.com, 
	jernej.skrabec@gmail.com, p.zabel@pengutronix.de, luca.ceresoli@bootlin.com, 
	devicetree@vger.kernel.org, conor+dt@kernel.org, tzimmermann@suse.de, jonas@kwiboo.se, 
	victor.liu@nxp.com, s.hauer@pengutronix.de, maarten.lankhorst@linux.intel.com, 
	mripard@kernel.org, linux-sound@vger.kernel.org, perex@perex.cz, 
	linux-arm-kernel@lists.infradead.org, neil.armstrong@linaro.org, lumag@kernel.org, 
	dianders@chromium.org, kernel@pengutronix.de, cristian.ciocaltea@collabora.com, 
	krzk+dt@kernel.org, shawnguo@kernel.org, l.stach@pengutronix.de
Subject: Re: [PATCH v2 2/6] ALSA: Add definitions for the bits in IEC958
 subframe
Message-ID: <20250724-fair-sheep-of-success-e02586-mkl@pengutronix.de>
References: <20250724072248.1517569-1-shengjiu.wang@nxp.com>
 <20250724072248.1517569-3-shengjiu.wang@nxp.com>
 <87jz3ykpju.wl-tiwai@suse.de>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="vpabkhcgtahxjd2o"
Content-Disposition: inline
In-Reply-To: <87jz3ykpju.wl-tiwai@suse.de>
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: mkl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-arm-kernel@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250724_004114_869834_F520D7E4 
X-CRM114-Status: GOOD (  23.91  )
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


--vpabkhcgtahxjd2o
Content-Type: text/plain; protected-headers=v1; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH v2 2/6] ALSA: Add definitions for the bits in IEC958
 subframe
MIME-Version: 1.0

On 24.07.2025 09:37:09, Takashi Iwai wrote:
> On Thu, 24 Jul 2025 09:22:44 +0200,
> Shengjiu Wang wrote:
> >=20
> > The IEC958 subframe format SNDRV_PCM_FMTBIT_IEC958_SUBFRAME_LE are used
> > in HDMI and DisplayPort to describe the audio stream, but hardware devi=
ce
> > may need to reorder the IEC958 bits for internal transmission, so need
> > these standard bits definitions for IEC958 subframe format.
> >=20
> > Signed-off-by: Shengjiu Wang <shengjiu.wang@nxp.com>
> > ---
> >  include/sound/asoundef.h | 9 +++++++++
> >  1 file changed, 9 insertions(+)
> >=20
> > diff --git a/include/sound/asoundef.h b/include/sound/asoundef.h
> > index 09b2c3dffb30..7efd61568636 100644
> > --- a/include/sound/asoundef.h
> > +++ b/include/sound/asoundef.h
> > @@ -12,6 +12,15 @@
> >   *        Digital audio interface					    *
> >   *                                                                    =
      *
> >   *********************************************************************=
*******/
> > +/* IEC958 subframe format */
> > +#define IEC958_SUBFRAME_PREAMBLE_MASK	(0xf)
> > +#define IEC958_SUBFRAME_AUXILIARY_MASK	(0xf<<4)
> > +#define IEC958_SUBFRAME_SAMPLE_24_MASK	(0xffffff<<4)
> > +#define IEC958_SUBFRAME_SAMPLE_20_MASK	(0xfffff<<8)
> > +#define IEC958_SUBFRAME_VALIDITY	(0x1<<28)
> > +#define IEC958_SUBFRAME_USER_DATA	(0x1<<29)
> > +#define IEC958_SUBFRAME_CHANNEL_STATUS	(0x1<<30)
> > +#define IEC958_SUBFRAME_PARITY		(0x1<<31)
>=20
> I'd use "U" suffix as it can reach to the MSB.
> Also, you can put spaces around the operators to align with the
> standard format, too.  I guess you followed to the other code there,
> but following to the standard coding style would be better.
>=20
> With those addressed, feel free to take my ack for this patch:

Or make use of the BIT() and GEN_MASK() helpers.

Marc

--=20
Pengutronix e.K.                 | Marc Kleine-Budde          |
Embedded Linux                   | https://www.pengutronix.de |
Vertretung N=C3=BCrnberg              | Phone: +49-5121-206917-129 |
Amtsgericht Hildesheim, HRA 2686 | Fax:   +49-5121-206917-9   |

--vpabkhcgtahxjd2o
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEn/sM2K9nqF/8FWzzDHRl3/mQkZwFAmiB428ACgkQDHRl3/mQ
kZw/twgArxwtsVQVLCtwTC1hTu1XO6jfEwAQpaPieSPwdzfilkYMvr5Y9dRXex55
jD6ZICtiqq+5U58pzhF7kpFQn1zBXU35xuvqu4H7EmC8yNPcgPr3gZd7FZOyFv+M
dehm4FgajYh4JhZBpfLNISc5DSTLiKiWA1fMQUPmfsyaHcikhRBPntgFqRp7Qz6Q
rnjazptVZ4MOkFgCL/Gnuzjs+0go1y4H6rLEcDdvFqGx9id/GJiQ+DHUWXEHnmr4
12scaPJb4fWgbwJ3/YtzCDHPUG6wVyoaQ3oek6NRQaXZ8T3Zic0IGem1++odVGZM
b7VK73jGSrhTMmTWcU3DIsNHR5b8mw==
=My/c
-----END PGP SIGNATURE-----

--vpabkhcgtahxjd2o--

