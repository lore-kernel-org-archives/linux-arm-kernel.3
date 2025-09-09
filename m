Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9A8E9CAC589
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  9 Sep 2025 07:35:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=YdRQB5+aC/AKmehufYWkM3Qcop62GSO65iYmgIFPuZk=; b=2apqapOKpoYVG/9UUSNOifFVgE
	4W5WFMEp4uCxZVGiiKmzvWjvUTaj9gSU5wWTzjsHTuC5AnNW4BxIeEW8L8Ng0IrnEfgQ93+uv+dPf
	tBN63kJZFqBCLkB/V+3mRuWN3QTp4puxjfNQziXEMGwGxAT2kYT0BRSx0U6gVLvf4KxWFa3JXLAdc
	5eyI3hxwjIMmr4YBGEer4hrneLVkxdehLPDNu6PQDuCHIQlSrnW3iCPfMJN3yV8UhpYXfyr8MZIky
	YP9vlf/Zhbs9FsNjjXMYhgVJxlFF1XCI6d+f3uvlEYfm61b0Roz3EPUAxMVdMN7NZo7DFSynng7/P
	RvO+Ys/Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uvssX-00000005CHc-08ra;
	Tue, 09 Sep 2025 07:35:01 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uvs14-00000004kUQ-1oFa
	for linux-arm-kernel@lists.infradead.org;
	Tue, 09 Sep 2025 06:39:47 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id A62F140053;
	Tue,  9 Sep 2025 06:39:45 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 099AEC4CEF4;
	Tue,  9 Sep 2025 06:39:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1757399985;
	bh=CDGgDx4Nki73aVoqrw4ePQX/fS/RDBiwv6Ilq8gxKAw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=LAZ8R0j3Vu3SejTmZVGa209vyubij2W5+HI0vyLeeCExpyUOTPOl1orGi3DuJl03G
	 JAvPioYpOy2LYqXPwMAv21aqWKEC6Nh1XA+scKx9nNMrjtXDGOOvBohtpxj23ksiTv
	 uewdU44EmAEnqX3/GVfoIfjkLtJMwC0LcrsqZz+k5HjxiW28LUvBtBTNMZKnX+9AkE
	 A6v4lVb/3qw90yJ1dksSZzRr/Emj2pDp5uR8p5MVjCuNu1WMytesAFi1OQxUDUW806
	 ilf+MMcau1yjUaaA/+uuG1sh/DhOVBLZwblzGYU/mSy32BJGo7Mp9Grb9LDluyAIKU
	 UEVEH6bbGcPAw==
Date: Tue, 9 Sep 2025 08:39:42 +0200
From: Maxime Ripard <mripard@kernel.org>
To: Shengjiu Wang <shengjiu.wang@gmail.com>
Cc: Luca Ceresoli <luca.ceresoli@bootlin.com>, 
	Shengjiu Wang <shengjiu.wang@nxp.com>, andrzej.hajda@intel.com, neil.armstrong@linaro.org, 
	rfoss@kernel.org, Laurent.pinchart@ideasonboard.com, jonas@kwiboo.se, 
	jernej.skrabec@gmail.com, maarten.lankhorst@linux.intel.com, tzimmermann@suse.de, 
	airlied@gmail.com, simona@ffwll.ch, lumag@kernel.org, dianders@chromium.org, 
	cristian.ciocaltea@collabora.com, dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
	victor.liu@nxp.com, shawnguo@kernel.org, s.hauer@pengutronix.de, 
	kernel@pengutronix.de, festevam@gmail.com, imx@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, 
	p.zabel@pengutronix.de, devicetree@vger.kernel.org, l.stach@pengutronix.de, 
	perex@perex.cz, tiwai@suse.com, linux-sound@vger.kernel.org
Subject: Re: [PATCH v5 4/7] drm/bridge: dw-hdmi: Add API
 dw_hdmi_set_sample_iec958() for iec958 format
Message-ID: <20250909-omniscient-honeybee-of-development-adca8a@houat>
References: <20250821073131.2550798-1-shengjiu.wang@nxp.com>
 <20250821073131.2550798-5-shengjiu.wang@nxp.com>
 <20250901185208.394cd162@booty>
 <CAA+D8AOCTqb5jLeRapYk4wRGZrsrPiuAR=ow3OA1B0+M9X4k7w@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha384;
	protocol="application/pgp-signature"; boundary="xbvuwjwmyrruqbpw"
Content-Disposition: inline
In-Reply-To: <CAA+D8AOCTqb5jLeRapYk4wRGZrsrPiuAR=ow3OA1B0+M9X4k7w@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250908_233946_512480_49359661 
X-CRM114-Status: GOOD (  18.64  )
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


--xbvuwjwmyrruqbpw
Content-Type: text/plain; protected-headers=v1; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH v5 4/7] drm/bridge: dw-hdmi: Add API
 dw_hdmi_set_sample_iec958() for iec958 format
MIME-Version: 1.0

Hi,

On Wed, Sep 03, 2025 at 06:41:05PM +0800, Shengjiu Wang wrote:
> On Tue, Sep 2, 2025 at 12:52=E2=80=AFAM Luca Ceresoli <luca.ceresoli@boot=
lin.com> wrote:
> >
> > Hello Shengjiu,
> >
> > On Thu, 21 Aug 2025 15:31:28 +0800
> > Shengjiu Wang <shengjiu.wang@nxp.com> wrote:
> >
> > > Add API dw_hdmi_set_sample_iec958() for IEC958 format because audio d=
evice
> > > driver needs IEC958 information to configure this specific setting.
> > >
> > > Signed-off-by: Shengjiu Wang <shengjiu.wang@nxp.com>
> > > Acked-by: Liu Ying <victor.liu@nxp.com>
> >
> > [...]
> >
> > > +void dw_hdmi_set_sample_iec958(struct dw_hdmi *hdmi, unsigned int ie=
c958)
> > > +{
> > > +     mutex_lock(&hdmi->audio_mutex);
> > > +     hdmi->sample_iec958 =3D iec958;
> > > +     mutex_unlock(&hdmi->audio_mutex);
> > > +}
> >
> > Apologies for jumping in the discussion as late as in v5, but I noticed
> > this patch and I was wondering whether this mutex_lock/unlock() is
> > really needed, as you're copying an int.
>=20
> Thanks for your comments.
>=20
> Seems it is not necessary to add mutex here. I just follow the code as
> other similar functions.  I will send a new version to update it.

Let's not be smart about it. Next thing you know, someone will add
another field in there that would absolutely require a mutex and now
you're not race free anymore.

Unless there's a real concern, the mutex must stay.

Maxime

--xbvuwjwmyrruqbpw
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iJUEABMJAB0WIQTkHFbLp4ejekA/qfgnX84Zoj2+dgUCaL/LpQAKCRAnX84Zoj2+
dor3AYCHio4X2egliC/DxGhE69IFjoCB2kz5rTVR9L9w9lm/BGcwlE52ivJCxATo
hyl0oZ4BgJ1LN6fhReyRbAA8/h8WtarRKmetqF8Cuizv58UMifibdOHkCJ59vF5M
4NuXwPWs5A==
=Ylzo
-----END PGP SIGNATURE-----

--xbvuwjwmyrruqbpw--

