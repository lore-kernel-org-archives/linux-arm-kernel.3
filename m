Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E8723CD8C9F
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  8 Jun 2026 11:38:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=uDnJszeMpHdvvPPU3R801JdC/j6cKxC3OiP8T8t7XdQ=; b=Cv0VTpDnmJ1f0W7/rJ6+/D9+tR
	sS+slHVvQp0CvqFtyPePxoqwGkseeAYRnqn4hnRUeCW3Ch9to5n9ff3SUB/tTo1OyrejEw31ynGm0
	4qHf+8+Uz7cRhZsfavSJLPgaD8ERkbv7LUX6dt5/hV0QDepUbtHPv4V+1e5ZQ7quKAQZapV5U823h
	f/gU5jn9X4YD0+NGoNP6tmCB7ZGZTNZ0SbqV5si0IPWQI79cHizusfHVbTQu+6RuHayHu8W2d/tkz
	wsrPZDsnFpUPrJGprtxkf+5culhPrcOTFB72WW4tpQu91TSggd3nR1Ly1tKcBBmnWPWoUt1ih+Se+
	LReCfC0A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wWYIp-00000003RGV-0DX5;
	Mon, 08 Jun 2026 11:37:59 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wWYIn-00000003RGM-296I
	for linux-arm-kernel@lists.infradead.org;
	Mon, 08 Jun 2026 11:37:57 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id E598141976;
	Mon,  8 Jun 2026 11:37:56 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 570801F00893;
	Mon,  8 Jun 2026 11:37:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780918676;
	bh=uDnJszeMpHdvvPPU3R801JdC/j6cKxC3OiP8T8t7XdQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=mevlGVYehUQUDoVS07MJ/Nec+me3pE5pN0bY3V9f9HJKwsCgWklGL/lF/0nOCe8+w
	 n43BaopwvETjXNOdDTZhqylU46Y6LvIdYqlL2vpwP06JubjFYvaLU2CBYuBSaRwSGl
	 /IBakOt0u3np59wb5dfhSxkzcc2XTHDDKK2HjUbppqKR2HxOXi6iG7pP0jrSx9SVHV
	 qrBFfnKgd8l6os5wubHUjTl1OKA3j8A+F+k1mkP7tdsUIkAe2zHLVlU8+W70x6j/M7
	 WXS7yo2ujqCwSlKtnB56YyQJFP7pI6wPixaHBmqwWBjLH+Fd00RJp7w5XrvI4t6ogO
	 q0EWTWfG/NZUA==
Date: Mon, 8 Jun 2026 13:37:54 +0200
From: Maxime Ripard <mripard@kernel.org>
To: Luca Ceresoli <luca.ceresoli@bootlin.com>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
	Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, 
	Simona Vetter <simona@ffwll.ch>, Andrzej Hajda <andrzej.hajda@intel.com>, 
	Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, 
	Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, Jonas Karlman <jonas@kwiboo.se>, 
	Jernej Skrabec <jernej.skrabec@gmail.com>, Inki Dae <inki.dae@samsung.com>, 
	Jagan Teki <jagan@amarulasolutions.com>, Marek Szyprowski <m.szyprowski@samsung.com>, 
	Marek Vasut <marex@denx.de>, Stefan Agner <stefan@agner.ch>, Frank Li <Frank.Li@nxp.com>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>, 
	Fabio Estevam <festevam@gmail.com>, Hui Pu <Hui.Pu@gehealthcare.com>, 
	Ian Ray <ian.ray@gehealthcare.com>, Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
	dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, imx@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH 01/37] drm/connector: split drmm_connector_hdmi_init() in
 3 parts
Message-ID: <20260608-brave-private-quokka-f67fb1@houat>
References: <20260519-drm-bridge-hotplug-v1-0-45e2bdb3dfb4@bootlin.com>
 <20260519-drm-bridge-hotplug-v1-1-45e2bdb3dfb4@bootlin.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha384;
	protocol="application/pgp-signature"; boundary="6v4dtzt3jeuv5xzs"
Content-Disposition: inline
In-Reply-To: <20260519-drm-bridge-hotplug-v1-1-45e2bdb3dfb4@bootlin.com>
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


--6v4dtzt3jeuv5xzs
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH 01/37] drm/connector: split drmm_connector_hdmi_init() in
 3 parts
MIME-Version: 1.0

On Tue, May 19, 2026 at 12:37:18PM +0200, Luca Ceresoli wrote:
> In preparation for adding a dynamic variant of drmm_connector_hdmi_init(),
> split reusable parts of the code to subfunctions.
>=20
> drmm_connector_hdmi_init() currently has 3 sections:
>  1. sanity checks
>  2. call drmm_connector_init()
>  3. initialize HDMI-specific fields not initialized at step 2
>=20
> Split 1 and 3 to new functions, reusable independently.
>=20
> No functional changes. Just moving code around.

Explaining what you need later on, and why these three functions help in
particular, would be nice.

Maxime

--6v4dtzt3jeuv5xzs
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iJUEABMJAB0WIQTkHFbLp4ejekA/qfgnX84Zoj2+dgUCaiapkgAKCRAnX84Zoj2+
duf/AYDpipIWLfk+fdFB3ag3RZt6/l4Ldt2Q7sSM0cWR+5PFEIvnVO13qdZZ91HU
87IMGGABgKgJmw/zzJy36JG+OWXkIXlRjNm5occH4w/GMV8y4BCXcOmxyHeuLI3n
vO/GxTh2qw==
=NILv
-----END PGP SIGNATURE-----

--6v4dtzt3jeuv5xzs--

