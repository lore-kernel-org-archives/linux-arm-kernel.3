Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 154E5C4452F
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 21 Jul 2026 12:42:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=1JHcUVKCdjggW2V84rHWH09x4Ps/8CZBsAwOVTuMPeE=; b=gN/atgJeEqfNcZI5HR5/N8T1Cv
	LE20bO0al4mbueASwtTun+5LHEQHe+hgP+Y4g7F6z287pQZehg1eQNSfwko5b3V70bwJA72kdjN3g
	NuN40lGC5abwdPZKkd8KazY4NEFywBU8ZS0EaML5Kn64fKzLcL4Zfmis2W9A9i1KYzAsHHNWny8B1
	KkPie0IIDCG4ltx5iAM7XzCUHQwe2aa0RP7zZutRjYEoFI5M4U/7tSl7GIi+FzAm4M/H7w/s1J960
	RTc5oZAebgUXGvpUqXeknugYfGr8aDPLbeMq5RolB/7Jf0kwJb8nnPa251cPIyCGINNrHeTef87m/
	hkDDhnHA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wm9nK-00000009RdL-3ylt;
	Tue, 21 Jul 2026 12:41:58 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wm9n7-00000009RZp-2ZhE
	for linux-arm-kernel@lists.infradead.org;
	Tue, 21 Jul 2026 12:41:45 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 55CA943C5F;
	Tue, 21 Jul 2026 12:41:45 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9AC731F000E9;
	Tue, 21 Jul 2026 12:41:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784637705;
	bh=1JHcUVKCdjggW2V84rHWH09x4Ps/8CZBsAwOVTuMPeE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=O/UWNzA0yWWlF9ZLanaiQNsP6Zm7yDKSGYmj48b5b+4g4LyvtFST9LlYVnYrtO6H+
	 QRFeT1d7B7dmbTk2/g9Gy3PfH0D99jsdBlIhUO7+58g56hWRchl2PtZPwtTQODogjl
	 kD84mcbdn9cwSDzVuNyYhtLCuOYRZJe+PXycP0wXVTKc4RHp+WQvVQD7hm9J8RdciI
	 4OwD+fvjH5aX9k8YN6otXljbhQlgBCCIq4OAlSjnicIC+8Z/qWlB1S2ZWTV7o2634L
	 VDfyRCdAvcr/QYBRURkhYpfw79fdcJNTlVItL1kzuLD6JUkOT8I1z0TuSjE1CQ2OI/
	 X8ou5ameiWTMw==
Date: Tue, 21 Jul 2026 14:41:42 +0200
From: Maxime Ripard <mripard@kernel.org>
To: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
Cc: Jani Nikula <jani.nikula@linux.intel.com>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Thomas Zimmermann <tzimmermann@suse.de>, 
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	Andrzej Hajda <andrzej.hajda@intel.com>, Neil Armstrong <neil.armstrong@linaro.org>, 
	Robert Foss <rfoss@kernel.org>, Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
	Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
	Luca Ceresoli <luca.ceresoli@bootlin.com>, Daniel Stone <daniel@fooishbar.org>, 
	Hans Verkuil <hverkuil+cisco@kernel.org>, Chen-Yu Tsai <wens@kernel.org>, 
	Samuel Holland <samuel@sholland.org>, Dave Stevenson <dave.stevenson@raspberrypi.com>, 
	=?utf-8?B?TWHDrXJh?= Canal <mcanal@igalia.com>, Raspberry Pi Kernel Maintenance <kernel-list@raspberrypi.com>, 
	dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, kernel@collabora.com, 
	linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev
Subject: Re: [PATCH v7 2/5] drm/scdc-helper: Add scdc_status debugfs entry
Message-ID: <20260721-angelic-gay-caiman-26f7ab@houat>
References: <20260721-scdc-link-health-v7-0-92df1b6ad5fc@collabora.com>
 <20260721-scdc-link-health-v7-2-92df1b6ad5fc@collabora.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha384;
	protocol="application/pgp-signature"; boundary="ah7fjvzl6blaxfpq"
Content-Disposition: inline
In-Reply-To: <20260721-scdc-link-health-v7-2-92df1b6ad5fc@collabora.com>
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


--ah7fjvzl6blaxfpq
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Subject: Re: [PATCH v7 2/5] drm/scdc-helper: Add scdc_status debugfs entry
MIME-Version: 1.0

On Tue, Jul 21, 2026 at 10:58:58AM +0200, Nicolas Frattaroli wrote:
> SCDC provides status information on the current display link. At the
> very least, it may be useful to expose this info through debugfs.
>
> Add a debugfs entry for it under the connector, which displays a few
> more details parsed out of the SCDC registers. A new
> drm_scdc_debugfs_init function can be called by the connector
> implementation to initialise the debugfs file.
>
> Signed-off-by: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
> ---
>  drivers/gpu/drm/display/drm_scdc_helper.c | 184 ++++++++++++++++++++++++++++++
>  include/drm/display/drm_scdc_helper.h     |  32 ++++++
>  2 files changed, 216 insertions(+)
>
> diff --git a/drivers/gpu/drm/display/drm_scdc_helper.c b/drivers/gpu/drm/display/drm_scdc_helper.c
> +/**
> + * drm_scdc_debugfs_init - Initialize scdc files in connector debugfs
> + * @connector: pointer to &struct drm_connector to operate on
> + * @root: debugfs &struct dentry for the debugfs root of @connector
> + *
> + * Creates SCDC-related debugfs files for @connector. Must be called after
> + * @root is already created.
> + */
> +void drm_scdc_debugfs_init(struct drm_connector *connector, struct dentry *root)
> +{
> +	struct scdc_debugfs_priv *priv;
> +
> +	if (!root || !connector)
> +		return;
> +
> +	priv = drmm_kzalloc(connector->dev, sizeof(*priv), GFP_KERNEL);
> +	if (!priv)
> +		return;
> +
> +	priv->connector = connector;

You need to take a reference to the connector pointer here with
drm_connector_get()

With this fixed,
Reviewed-by: Maxime Ripard <mripard@kernel.org>

Maxime

--ah7fjvzl6blaxfpq
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iJUEABMJAB0WIQTkHFbLp4ejekA/qfgnX84Zoj2+dgUCal9pBgAKCRAnX84Zoj2+
duQAAX4m1SnGZZ8EMKaEFk9BhMZ/Xe875CrDjdHjh302duMOC5cuJpLPYvEQ9kqh
q+HhmA0BgMrujQdJGYnLIZuz92Uq7vUm+TUXDnAv9rppoVkbLBtCiEhC4riDT7yL
VYFcIdRPLw==
=Vh4j
-----END PGP SIGNATURE-----

--ah7fjvzl6blaxfpq--

