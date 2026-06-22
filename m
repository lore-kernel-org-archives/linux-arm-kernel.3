Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EC555CDB46F
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 22 Jun 2026 09:38:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Id1aDwPwK65QrmbSsCVlm+KO6gNxO+F+f3OzjJRBAxo=; b=N1nyE+x8vAIxOrwaYgplq9ommc
	MlxlMn7RVx0U5Ywd88aPeUtRf60/pJOuazlXGZgDuE3Tlnh6AnD2xh8YUOuW/9htkTiUB3CR/iOSU
	hF9R9z1cqTHBqESilPsaqLLyOfpKduPea9Rg3e0XHkGexjZRNxtI17lVCXpWIJjefbO/Oya2vUdKF
	L2zRE6Q2AnwJLEqxMcxrV1a+uZixqcDguqmvc6+00hsG7UpDByMEtgTjYRi84AZyR5hDqRi1LWzx3
	E+uEv8fdVeR4rj2t0/mhdcXCJVWRecxeIwwLYMeoaaOvpWYzJFjsGl/vI9z0cBT0e+6uo2284QTU9
	0GjKYhwA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wbb6m-00000004lub-2Od3;
	Mon, 22 Jun 2026 09:38:24 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wbb6k-00000004luR-48J9
	for linux-arm-kernel@lists.infradead.org;
	Mon, 22 Jun 2026 09:38:23 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 2248460051;
	Mon, 22 Jun 2026 09:38:22 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5DE1E1F000E9;
	Mon, 22 Jun 2026 09:38:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782121101;
	bh=Id1aDwPwK65QrmbSsCVlm+KO6gNxO+F+f3OzjJRBAxo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=UivVNvOI86fO3Vaefe/GUWz88xuXnRdNYaaWQLdEsoNSFypwCKYXuNJVcagOuDOx9
	 TSV6S3lGifHWeD0qo9ZmWqPwQSmjcQxg7qqd6NLdWFjY5b/0WY0XbkCuwC0UyKKp/q
	 KoAIaHbIR66kyUVpbt6nEcZaGjpUrfjALA2lB8pbW/QfSh8RnXlqXJsasmbB238gso
	 Zs5bMkElZKP8UrdYZzKIhFDXxBrks5EiLX81hgtSFpbHRrXe6Pr5LVmh5rxc1X3StG
	 pWiXgpm+/xRigUqHnic1l3JxDJMkUQUs4oTL3SkBZBOA4hrL6tP3ad1EF1kZAvKu4Z
	 TwF8kY1u/Ac6g==
Date: Mon, 22 Jun 2026 11:38:19 +0200
From: Maxime Ripard <mripard@kernel.org>
To: Liu Ying <victor.liu@nxp.com>
Cc: Luca Ceresoli <luca.ceresoli@bootlin.com>, 
	Andrzej Hajda <andrzej.hajda@intel.com>, Neil Armstrong <neil.armstrong@linaro.org>, 
	Robert Foss <rfoss@kernel.org>, Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
	Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Thomas Zimmermann <tzimmermann@suse.de>, 
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, Frank Li <Frank.Li@nxp.com>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>, 
	Fabio Estevam <festevam@gmail.com>, Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>, 
	dri-devel@lists.freedesktop.org, imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3] drm/bridge: imx93-mipi-dsi: Fix mode validation
Message-ID: <20260622-strong-messy-hare-2372cd@houat>
References: <20260515-imx93-mipi-dsi-fix-mode-validation-v3-1-91f7d22b2fe4@nxp.com>
 <DJD6I8NMLN3W.3LVT4L17HT5TU@bootlin.com>
 <ajjpuroFPI_U2Fw6@raspi>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha384;
	protocol="application/pgp-signature"; boundary="4lki2wyprf2do7cs"
Content-Disposition: inline
In-Reply-To: <ajjpuroFPI_U2Fw6@raspi>
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


--4lki2wyprf2do7cs
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH v3] drm/bridge: imx93-mipi-dsi: Fix mode validation
MIME-Version: 1.0

On Mon, Jun 22, 2026 at 03:52:26PM +0800, Liu Ying wrote:
> > Finally, out of my utter ignorance on the subject, is the VESA +/-0.5%
> > margin generic enough that this driver can always rely on it?
>=20
> I see several upstream drivers rely on it, see "git grep '0.5%' drivers/g=
pu/"
> output.  And every display mode allows -/+ 0.5% pixel clock rate deviation
> according to VESA Display Monitor Timing Standard [1], though [1] is a fo=
und
> by a random Google search.

Yes, it's what we've been using for some time now. Is there any
particular concern about it?

Maxime

--4lki2wyprf2do7cs
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iJUEABMJAB0WIQTkHFbLp4ejekA/qfgnX84Zoj2+dgUCajkCiwAKCRAnX84Zoj2+
dn2NAYCjusnaBSXQclXmwY3AEMzqqxTj1CmUJL+6wWsRE+k9k0v5r5ASO8HI/G/s
MkWnjsQBf0BXjCandzhPC/6y7PGfq8bZ3ikevTtkM3UEjBFpirFQ9TqRTn+EDC0T
FJqJLbn8zg==
=h4Vk
-----END PGP SIGNATURE-----

--4lki2wyprf2do7cs--

