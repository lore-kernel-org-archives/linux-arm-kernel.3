Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 77EB9CD8C9F
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  8 Jun 2026 12:07:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=fzKmRE/c3YW6bME9j/93sSqsxS7lu6l7nbyxWtTfJ8w=; b=QCuCzQwoTPa0OGg0kkCnu3NyVb
	lnS8kJonHMZm8LT/lMNbB3peqkWnQjv7dnUfGk1qQGYuNXxldrfF6eYni54FEN7e9CsfscyUyjU6F
	nL4ujyf2D1EF7heTIBYvOjsmY2h3Fsn6RU0uYetLgDclkrqypqkrz7wQrAzXOJ5GwONovCvMmJu2c
	uBB2xicFXsIE4eGBG9oCJRjlAjhvAIgsP5tkjOYO2vmDL6uSjejICQ+Js5/miGGIYgMQYwGshb+Fa
	irsMB3chzTrHAI6T8wie07T1yA5w8sFSpF4S9lvvcvuy9z7k9K1me/OsrNrzK4JoQRdxM4xDnndfr
	adXsnRZg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wWYlE-00000003UCC-0lJq;
	Mon, 08 Jun 2026 12:07:20 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wWYlD-00000003UBz-1cpx
	for linux-arm-kernel@lists.infradead.org;
	Mon, 08 Jun 2026 12:07:19 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id CB7434063B;
	Mon,  8 Jun 2026 12:07:18 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3D6921F00893;
	Mon,  8 Jun 2026 12:07:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780920438;
	bh=fzKmRE/c3YW6bME9j/93sSqsxS7lu6l7nbyxWtTfJ8w=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=QIhH3DkjuFmZdQJiQwpq3z684KdzevYBZ3FxzsTNbThYX0AQhcPzqB3KTwHEG5Qdn
	 ir9AJIIbef4rlhl9JvHh46kwAoWNhJS8i2+G+GFyHAB9ezdL/Sm1bUWTgM6xAC4HoK
	 JadouGx25hTowYD2ig0NRkQRzORb+h0elb1YPRgqjV8Snrlg7Suhk9/tI00wtigEPi
	 tZZBdYmfA6Wv6gy0E65flr9h5Xctz1ekFWXmI0Da2Tqh240k1/k1uuF6V/xlR50nLc
	 HEAtN4Be53++XNBN3GS7P0CljkTzNz1yIV9OWHFUZvwNLAd0UdnAh1dB0EKUa4Dd8q
	 7C84hvM99oYzQ==
Date: Mon, 8 Jun 2026 14:07:16 +0200
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
Subject: Re: [PATCH 25/37] drm/bridge: shutdown and cleanup on bridge unplug
Message-ID: <20260608-resilient-outgoing-panther-9efc53@houat>
References: <20260519-drm-bridge-hotplug-v1-0-45e2bdb3dfb4@bootlin.com>
 <20260519-drm-bridge-hotplug-v1-25-45e2bdb3dfb4@bootlin.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha384;
	protocol="application/pgp-signature"; boundary="runcsy6vq4746hhd"
Content-Disposition: inline
In-Reply-To: <20260519-drm-bridge-hotplug-v1-25-45e2bdb3dfb4@bootlin.com>
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


--runcsy6vq4746hhd
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH 25/37] drm/bridge: shutdown and cleanup on bridge unplug
MIME-Version: 1.0

Hi,

On Tue, May 19, 2026 at 12:37:42PM +0200, Luca Ceresoli wrote:
> With the upcoming support for DRM bridge hot(un)plugging, bridges can be
> removed at any time withotu tearing down the entire card. When this
> happens, shutdown the pipeline and detach from the encoder chain the brid=
ge
> being removed along with all the following ones.
>=20
> Signed-off-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
> ---
>  drivers/gpu/drm/drm_bridge.c | 8 ++++++++
>  1 file changed, 8 insertions(+)
>=20
> diff --git a/drivers/gpu/drm/drm_bridge.c b/drivers/gpu/drm/drm_bridge.c
> index 7f2d1a81d730..d45fb74ec8c2 100644
> --- a/drivers/gpu/drm/drm_bridge.c
> +++ b/drivers/gpu/drm/drm_bridge.c
> @@ -462,9 +462,17 @@ EXPORT_SYMBOL(devm_drm_bridge_add);
>   * it won't be found by users via of_drm_find_and_get_bridge(), and add =
it
>   * to the lingering bridge list, to keep track of it until its allocated
>   * memory is eventually freed.
> + *
> + * If the bridge is attached, also disable the active output and detach
> + * this bridge and the following ones.
>   */
>  void drm_bridge_remove(struct drm_bridge *bridge)
>  {
> +	if (bridge->encoder) {
> +		drm_atomic_shutdown(bridge->dev);
> +		drm_encoder_cleanup_from(bridge->encoder, bridge);
> +	}
> +
>  	mutex_lock(&bridge_lock);
>  	list_move_tail(&bridge->list, &bridge_lingering_list);
>  	mutex_unlock(&bridge_lock);

I don't think this makes a lot of sense to disable the whole device at
once. The connector, encoder, and the CRTC might, but the whole device
doesn't.

Even then, I'm not sure we should disable anything. How does DP-MST
handles removal?

Maxime

--runcsy6vq4746hhd
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iJUEABMJAB0WIQTkHFbLp4ejekA/qfgnX84Zoj2+dgUCaiawdAAKCRAnX84Zoj2+
dlutAXwLb/lzFiY4Bqaim2RwnNqhbTo/NPoCNzh8V/tQ1zxLugn7ChtaL/weqRTw
httlwgABgNm0m35oh5VFSw6suBNeI5wca6gsWhRHRBjDmIOSoS/q5nAmz4DyindF
FISfGAzktg==
=7d4e
-----END PGP SIGNATURE-----

--runcsy6vq4746hhd--

