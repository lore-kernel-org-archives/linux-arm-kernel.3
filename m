Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A5144CD8C9D
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  8 Jun 2026 11:58:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+0xzfXSHX2hdCkKNzJTDZp7i9BrsG509qQpWeW5OEvo=; b=LJGDDwsVqb/juCUBEINpfKmRfQ
	GKVTN3V+hqbXtlUS+st7oXw5IwBunHPlFZEFXJIqpcIAeDYniQgFqCqbyd7eAKH5PG2Jz+AA8MMfI
	glc9gpAaCz1tcX33ccCftcqq9iV0Qn2kTDY8DfXvk9vrnzOybaujqZBn0d8lWz7ifyOvzKKNQDwU6
	Bg17JdwR8b7ojBKB3KFoZhioCwth6rQSiWS6yi+gOzlok7DB1CTsoe+MNM0XsPdGlXEOFDCDnuUgK
	/HWD4SOAgBm8Xe2oYwUevGa2EJuPdcRMN7blaPUdjVUDArEBcPY55JhjDuftqlI2XX3HvUuMNu3IC
	KhmMxtBg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wWYch-00000003TPc-1SRY;
	Mon, 08 Jun 2026 11:58:31 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wWYcg-00000003TPS-0NXR
	for linux-arm-kernel@lists.infradead.org;
	Mon, 08 Jun 2026 11:58:30 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 7AB8F42DA1;
	Mon,  8 Jun 2026 11:58:29 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E0CB31F00893;
	Mon,  8 Jun 2026 11:58:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780919909;
	bh=+0xzfXSHX2hdCkKNzJTDZp7i9BrsG509qQpWeW5OEvo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=aDYQlrpcGFobcKIUJiaIWSI7GgV6ZwBP9VMIiVGLqAXMgpBFM/wDuMA56rF+pqpwB
	 UUkOAn+tKT+sMWP2fsXkqxHfaCA3GBPGXDaaMqqn7bLpPdKhNKOTWOgzmtIdl5IO6z
	 Zu1fi+gxh6etnvlsd8Ynmxt6nmKmfCIxl/tgnsm449z4C9dMTD9dYSGCEQruS4pIx0
	 7G/eryQ5r/Wojf+90+OtjnKw36ukjwmwpSVlzYu50/IVfGLgoY4qTVV0jfpOGIfkGt
	 i6VNaB8LHTDptdmCbca6bFcO1Wlx6esyraR+/GS+cldnacLpPgOyAXs/K9jcgEPsaB
	 Q+IzWS2rnXSFg==
Date: Mon, 8 Jun 2026 13:58:27 +0200
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
Subject: Re: [PATCH 19/37] drm/bridge: samsung-dsim: move drm_bridge_add()
 call to probe
Message-ID: <20260608-mellow-weasel-of-politeness-a56172@houat>
References: <20260519-drm-bridge-hotplug-v1-0-45e2bdb3dfb4@bootlin.com>
 <20260519-drm-bridge-hotplug-v1-19-45e2bdb3dfb4@bootlin.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha384;
	protocol="application/pgp-signature"; boundary="jujnlpdemf3itkb7"
Content-Disposition: inline
In-Reply-To: <20260519-drm-bridge-hotplug-v1-19-45e2bdb3dfb4@bootlin.com>
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


--jujnlpdemf3itkb7
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH 19/37] drm/bridge: samsung-dsim: move drm_bridge_add()
 call to probe
MIME-Version: 1.0

On Tue, May 19, 2026 at 12:37:36PM +0200, Luca Ceresoli wrote:
> This bridge driver calls drm_bridge_add() in the DSI host .attach callback
> instead of in the probe function.
>=20
> This works for current use cases but is problematic for supporting hotplug
> of DRM bridges. The problematic case is when this DSI host is always
> present while its DSI device is hot-pluggable. In such case with the
> current code the DRM card will not be populated until after the DSI device
> attaches to the host, which could happen a very long time after booting, =
or
> even not happen at all.
>=20
> The reason is that the previous pipeline component (the encoder in this
> case) when probing cannot find the samsung-dsim bridge. What happens is:
>=20
>  [1 and 2 can happen in any order, same result]
>  1) samsung-dsim probes (does not drm_bridge_add() itself)
>  2) The lcdif starts probing multiple times, but
>     lcdif_probe
>     -> lcdif_load
>        -> lcdif_attach_bridge
>           -> devm_drm_of_get_bridge() returns -EPROBE_DEFER because
>              the samsung-dsim is not in the global bridge_list
>              (deferred probe pending: imx-lcdif: Cannot connect bridge)
>=20
> The samsung-dsim will not drm_bridge_add() itself until a DSI device will
> try to mipi_dsi_attach() to the DSI Host, which can happen arbitratily la=
te
> on hot-pluggable hardware.
>=20
> As a preliminary step to supporting hotplug move drm_bridge_add() at probe
> time, so that the samsung-dsim DSI host bridge is available during boot,
> even without a connected DSI device. This results in:
>=20
>  1) samsung-dsim probes (and adds to drm_bridge_add() itself)
>  2) The lcdif starts probing multiple times, but
>     lcdif_probe
>     -> lcdif_load
>        -> lcdif_attach_bridge
>           -> devm_drm_of_get_bridge() --> OK, returns samsung-dsim ptr
>=20
> Signed-off-by: Luca Ceresoli <luca.ceresoli@bootlin.com>

We should probably amend
https://www.kernel.org/doc/html/latest/gpu/drm-kms-helpers.html#special-car=
e-with-mipi-dsi-bridges

To mention this use case here

Maxime

--jujnlpdemf3itkb7
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iJUEABMJAB0WIQTkHFbLp4ejekA/qfgnX84Zoj2+dgUCaiauYgAKCRAnX84Zoj2+
duwQAYD6rpNKQLtVMjc9E/imbAZsWo++IjphqgU5DZIVqU3hkZzlEIwB45cAN7I4
97jNSiQBf0ZHBdJnO+5AbFv2QNHwL3tfCc1fF7wkOQBoYYjrgK9MzVhOAevUADgP
mIe4JqQvww==
=0a06
-----END PGP SIGNATURE-----

--jujnlpdemf3itkb7--

