Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 15EC3CD8C9D
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  8 Jun 2026 12:10:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=fbutwAgH34nQ+5CPzr8/espMkFdKyYE8DERk9Y5kQoE=; b=ZJF5+UDovF8SrWvjovjCqfkZHR
	i5tAHM4vtReYJI0Z7MBf0ACFoBDqqIkcjgSy6r+4rROqjZD/XUakZLrstWfcMZzgZ6pdjvPpXakEG
	hnJ0uXKKoV6LDmbCxUrPorWrIqKrpdb7wlvHbmDP95NjbNPqFDi5xgZ2VhtGZBqEt8lZCRcyen3VA
	1/2GeDIasG14wo+AfAZTD5klQtkgqnIRgHvoWFGdy0ElWGBC5z+fFQvMjF3X68Yd5vlpOXpQ9piL1
	okj4SwSG24ZM9peuKSoAgYbLBcxhf7OgVhG1RZoV6WdbNxlRTcCJRrwFHmACfCQPZfYONUWnVnWJi
	/1dwnibg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wWYoJ-00000003UTk-2cpd;
	Mon, 08 Jun 2026 12:10:31 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wWYoH-00000003UTb-2PHt
	for linux-arm-kernel@lists.infradead.org;
	Mon, 08 Jun 2026 12:10:30 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id D438E6001D;
	Mon,  8 Jun 2026 12:10:28 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1B48C1F00893;
	Mon,  8 Jun 2026 12:10:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780920628;
	bh=fbutwAgH34nQ+5CPzr8/espMkFdKyYE8DERk9Y5kQoE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=HeUvyhABLJR5DrF1Q7F+yAuP9T3dy3vUloNx6jrsOC743UEMJI1BEA50B968JnF/8
	 zYldE28Z+IoGijHFx0NThpy0vpxd1fppOpcncMTRPQ57U9nHLVzeYxpAdYOzhWUHQc
	 OcRJmDkT9TP9X2zWVF8fMd94k9JCyLX/HkYg5YlmRyXToPEwTe1rg+WCoA69BP+nA6
	 4I9v0EKU47tmOlDm3v4kulzrQUcFl1e1S1VoOAnrEtcU+9CawpKAfcQiUs7ZzdLBa/
	 7j8EsfnrR9WwKVbh/Jsh1FhV98qYMRL8tu5T0W1okWPoEI+SkMthTqS/vqs6sgXpOG
	 b41REepoFRiDA==
Date: Mon, 8 Jun 2026 14:10:26 +0200
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
Subject: Re: [PATCH 23/37] drm/encoder: add drm_encoder_cleanup_from()
Message-ID: <20260608-mighty-woodlouse-of-reading-162bca@houat>
References: <20260519-drm-bridge-hotplug-v1-0-45e2bdb3dfb4@bootlin.com>
 <20260519-drm-bridge-hotplug-v1-23-45e2bdb3dfb4@bootlin.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha384;
	protocol="application/pgp-signature"; boundary="mlq6rotmaedggjnf"
Content-Disposition: inline
In-Reply-To: <20260519-drm-bridge-hotplug-v1-23-45e2bdb3dfb4@bootlin.com>
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


--mlq6rotmaedggjnf
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH 23/37] drm/encoder: add drm_encoder_cleanup_from()
MIME-Version: 1.0

On Tue, May 19, 2026 at 12:37:40PM +0200, Luca Ceresoli wrote:
> Supporting hardware whose final part of the DRM pipeline can be physically
> removed requires the ability to detach all bridges from a given point to
> the end of the pipeline.
>=20
> Introduce a variant of drm_encoder_cleanup() for this.
>=20
> Take care to not try detaching non-attached bridges. This is needed becau=
se
> when two or more bridges are removed not in the backwards order,
> drm_encoder_cleanup_from() is called more than once for bridges closer to
> the panel.
>=20
> Signed-off-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
>=20
> ---
>=20
> Note: in theory drm_encoder_cleanup() is now a superset of
> drm_encoder_cleanup_from() and may be simplified to just call
> drm_encoder_cleanup_from() and then do the extra actions. However the
> common code is subtly different in terms of locking and checks, so this
> would complicate the code in this patch and has thus been kept separate f=
or
> the time being to make reviewing sompler. Reimplementing
> drm_encoder_cleanup() by using drm_encoder_cleanup_from() cvacn be done
> later on.
>=20
> A much simpler and now obsolete version of this patch (missing locking and
> checks) previously appeared in
> https://lore.kernel.org/lkml/20250206-hotplug-drm-bridge-v6-13-9d6f2c9c30=
58@bootlin.com/
> ---
>  drivers/gpu/drm/drm_encoder.c | 38 ++++++++++++++++++++++++++++++++++++++
>  include/drm/drm_encoder.h     |  1 +
>  2 files changed, 39 insertions(+)
>=20
> diff --git a/drivers/gpu/drm/drm_encoder.c b/drivers/gpu/drm/drm_encoder.c
> index 0d5dbed06db4..40ece477b302 100644
> --- a/drivers/gpu/drm/drm_encoder.c
> +++ b/drivers/gpu/drm/drm_encoder.c
> @@ -179,6 +179,44 @@ int drm_encoder_init(struct drm_device *dev,
>  }
>  EXPORT_SYMBOL(drm_encoder_init);
> =20
> +/**
> + * drm_encoder_cleanup_from - remove a given bridge and all the following
> + * @encoder: encoder whole list of bridges shall be pruned
> + * @bridge: first bridge to remove
> + *
> + * Removes from an encoder all the bridges starting with a given bridge
> + * and until the end of the chain.
> + *
> + * Does nothing if the bridge is not attached to an encoder chain.
> + *
> + * This should not be used in "normal" DRM pipelines. It is only useful =
for
> + * devices whose final part of the DRM chain can be physically removed a=
nd
> + * later reconnected (possibly with different hardware).
> + */
> +void drm_encoder_cleanup_from(struct drm_encoder *encoder, struct drm_br=
idge *bridge)
> +{
> +	struct drm_bridge *next;
> +	LIST_HEAD(tmplist);
> +
> +	/*
> +	 * We need the bridge_chain_mutex to modify the chain, but
> +	 * drm_bridge_detach() will call DRM_MODESET_LOCK_ALL_BEGIN() (in
> +	 * drm_modeset_lock_fini()), resulting in a possible ABBA circular
> +	 * deadlock. Avoid it by first moving all the bridges to a
> +	 * temporary list holding the lock, and then calling
> +	 * drm_bridge_detach() without the lock.
> +	 */
> +	mutex_lock(&encoder->bridge_chain_mutex);
> +	if (!list_empty(&bridge->chain_node))
> +		list_for_each_entry_safe_from(bridge, next, &encoder->bridge_chain, ch=
ain_node)
> +			list_move_tail(&bridge->chain_node, &tmplist);
> +	mutex_unlock(&encoder->bridge_chain_mutex);
> +
> +	while (!list_empty(&tmplist))
> +		drm_bridge_detach(list_first_entry(&tmplist, struct drm_bridge, chain_=
node));
> +}
> +EXPORT_SYMBOL(drm_encoder_cleanup_from);
> +

The name is super confusing, because it doesn't clean up anything.
drm_encoder_cleanup is called that way because it cleans up the encoder.
This function doesn't.

Unlike what's being documented, it doesn't remove any bridge either. It
just detaches bridge, so let's just call it that way?

Maxime

--mlq6rotmaedggjnf
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iJUEABMJAB0WIQTkHFbLp4ejekA/qfgnX84Zoj2+dgUCaiaxMQAKCRAnX84Zoj2+
dovlAYDHSeYV8vLX5Yg55j6rhisjuD4V7tgfgvUuaKvLMajioZJJKBD7Xw54Rr2o
7LYJvRcBgILYvnRYdQyxSDhd/hJZ+6M81Ar4FO2sxsAOmKhx6+PU3JsOjpXlIXT1
3LiK7BxQ2g==
=Jtaz
-----END PGP SIGNATURE-----

--mlq6rotmaedggjnf--

