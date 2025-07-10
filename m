Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E2A0BC83F1A
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 10 Jul 2025 08:43:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=hdXjeCliRyJZCw75XF5LZkP9DunbKaTwr/NS/YNlOm0=; b=KCTL7dMv+v3P6hGYF724A/wljf
	LdT7j/5Xc1D3fcjpk8ZMCuyRNamXL/GbopSh+fKoAhR7uFsWjjruYJAKMaXfQtgkRnpEI1SDNL6o7
	hrfVh0UuezFPUinwJsk8YBnS9LMwvbpHop91wAT2WZVZjvTh0NAEt9R09kC+kwoEYwUeBfS1Do8G+
	hVAgH58Ik7zfVOyHgZ61Au4foCqzyYT2+unvZSt8UIjOZm6DvLvQ+mGs1D1QVX+0ITmdv6uP0V/Lw
	VF+9Q1JtKZNOClfJTj0safNrl+d/BPowxlz+1DEiXkCr9XsmBalhdvDn79huU9gJFHToqP/X/YRLY
	aLnZKT4Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uZms9-0000000BDcE-06CO;
	Thu, 10 Jul 2025 08:43:17 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uZlhc-0000000B0dC-3UEw
	for linux-arm-kernel@lists.infradead.org;
	Thu, 10 Jul 2025 07:28:20 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 42EF761469;
	Thu, 10 Jul 2025 07:28:20 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 76868C4CEE3;
	Thu, 10 Jul 2025 07:28:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1752132500;
	bh=hdXjeCliRyJZCw75XF5LZkP9DunbKaTwr/NS/YNlOm0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ZeI8/VKQ537VmiYeHP0ZLXzBPqlrlyjylv5W7wUsHSWpYtHGVaIBqg6l6kKPGtv+l
	 WTGESYCudcBEy6Vj4g5+7Mj93flVBEhf2P9CVsPyB6X984Fotx5ddKzOzPe9STOA2y
	 sjbiQqPfX0xGiHit7XfBjif2Gplod4TliLjXUlzwqlhK4G9eQgERHD77DE2fQer7Rz
	 dXYaQtKpEV97iE+ZSNvTrgBwrE689dTDnV8tJb3L+ZpFt0a5Qiv1B95uoD9E6ydZX6
	 50IFww7wcn26Lpv6QZa2FBjdVNxhX4nrBOhE6guCoMQjop8A9ufVZgtOAY95+1IBIe
	 KxTwI2QQLSj6Q==
Date: Thu, 10 Jul 2025 09:28:17 +0200
From: Maxime Ripard <mripard@kernel.org>
To: Luca Ceresoli <luca.ceresoli@bootlin.com>
Cc: Andrzej Hajda <andrzej.hajda@intel.com>, 
	Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, 
	Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, Jonas Karlman <jonas@kwiboo.se>, 
	Jernej Skrabec <jernej.skrabec@gmail.com>, Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
	Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, 
	Simona Vetter <simona@ffwll.ch>, Liu Ying <victor.liu@nxp.com>, Shawn Guo <shawnguo@kernel.org>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>, 
	Fabio Estevam <festevam@gmail.com>, Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>, 
	Philipp Zabel <p.zabel@pengutronix.de>, Hui Pu <Hui.Pu@gehealthcare.com>, 
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>, linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, 
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH 9/9] drm/imx: parallel-display: put the bridge returned
 by drm_bridge_get_next_bridge()
Message-ID: <20250710-dashing-origami-ara-ef9fc1@houat>
References: <20250709-drm-bridge-alloc-getput-drm_bridge_get_next_bridge-v1-0-48920b9cf369@bootlin.com>
 <20250709-drm-bridge-alloc-getput-drm_bridge_get_next_bridge-v1-9-48920b9cf369@bootlin.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha384;
	protocol="application/pgp-signature"; boundary="6tqwawwu3nnorjig"
Content-Disposition: inline
In-Reply-To: <20250709-drm-bridge-alloc-getput-drm_bridge_get_next_bridge-v1-9-48920b9cf369@bootlin.com>
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


--6tqwawwu3nnorjig
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH 9/9] drm/imx: parallel-display: put the bridge returned
 by drm_bridge_get_next_bridge()
MIME-Version: 1.0

On Wed, Jul 09, 2025 at 06:48:08PM +0200, Luca Ceresoli wrote:
> The bridge returned by drm_bridge_get_next_bridge() is refcounted. Put it
> when done.
>=20
> Signed-off-by: Luca Ceresoli <luca.ceresoli@bootlin.com>

Same comments than on the previous patch here.

Maxime

--6tqwawwu3nnorjig
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iJUEABMJAB0WIQTkHFbLp4ejekA/qfgnX84Zoj2+dgUCaG9rkAAKCRAnX84Zoj2+
dnTtAYDyf/Yxt9bmEdmMUGLXyfbD9i2hhDEJkGJ8L01jt7ghkn+L5uWiwnMPQKFR
XgUd/r8BgJt8+q4jJcV+k0qVy9a+O6Na5wzUPuLCVbN5rC+8KA4NNINmo7vDm9ob
Wf/nc0V2xw==
=dhT/
-----END PGP SIGNATURE-----

--6tqwawwu3nnorjig--

