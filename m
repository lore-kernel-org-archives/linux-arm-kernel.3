Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 481A3CF258C
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 19 Nov 2025 09:10:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=E7c7WPNwEopK1NWK2hgjTB604grH4czjuPJM0qF8CeA=; b=jPW4tmy8dD0njIZ0lU7GP5ngn3
	LjYT/q9tKnfqh8OJcXqHnrQkiODGOi2ZqyunBfP9sRyEfh6isAZ11pt/M2VOThxUgmYVJpg099jvJ
	hOtsxKtUZljYrYB4POSnC8YZ+myWmM8mgn9ULl/pJKsaqjIE+uhRgosr5uOC/FJs7aPH/E7KFAbQr
	utFE7CqDB8SRhx4FdF2i3YEnnVqsstwnimTEyv67i95MtYGoqUzGz/kADuFt9HjkTYB4sOQEFYNFx
	QZINhS6EzAztVE6Q2KJSXe3MWbDUGhfQ9plVVBlsgeS5An5zfTrwMDoDoCsY+x6ombh2qwLTpvduU
	8uGcn4hg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vLeCv-00000002qI8-2aes;
	Wed, 19 Nov 2025 09:10:33 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vLeCs-00000002qHW-3GBs;
	Wed, 19 Nov 2025 09:10:31 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id B191640B05;
	Wed, 19 Nov 2025 09:10:29 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B977DC2BC9E;
	Wed, 19 Nov 2025 09:10:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1763543429;
	bh=0ooC3zk40bMIfdzUa/d1KFYHBm62ThIBveVi/NzSqME=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=WYkwxoEoIY0kEfPKwxkhEOyIUknU4PaoqDuimh3ALPGiCRcpCW5HFYuw8iKBHE1Vv
	 180AdCb62rhuKbfWe234uQJOIp5/qWcB6yAsB3sixNgrkOu9jSCKcopJLH8pjraeIC
	 locvCj98kCc1UrD6NTZ6Z0ZRM/JxH0dHkhkJefUzpxY5Go9pAH1/v4bq+/wgEqiHH/
	 zDi2tPuYk6EzRZ5dv0rIDTy+Sssko9WHvNfGBIIfcOgPrz6nd9Pclbj7QAQ844Sjei
	 t0L2dLYM2T36xrEhcVkJHxclpHi8DB7wUjWR39ndJN8LUBzLJMwPZLtWYGqB0LQZWH
	 FSbL9E3053pUg==
Date: Wed, 19 Nov 2025 10:10:26 +0100
From: Maxime Ripard <mripard@kernel.org>
To: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
Cc: Harry Wentland <harry.wentland@amd.com>, Leo Li <sunpeng.li@amd.com>, 
	Rodrigo Siqueira <siqueira@igalia.com>, Alex Deucher <alexander.deucher@amd.com>, 
	Christian =?utf-8?B?S8O2bmln?= <christian.koenig@amd.com>, David Airlie <airlied@gmail.com>, 
	Simona Vetter <simona@ffwll.ch>, Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
	Thomas Zimmermann <tzimmermann@suse.de>, Andrzej Hajda <andrzej.hajda@intel.com>, 
	Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, 
	Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, Jonas Karlman <jonas@kwiboo.se>, 
	Jernej Skrabec <jernej.skrabec@gmail.com>, Sandy Huang <hjc@rock-chips.com>, 
	Heiko =?utf-8?Q?St=C3=BCbner?= <heiko@sntech.de>, Andy Yan <andy.yan@rock-chips.com>, 
	Jani Nikula <jani.nikula@linux.intel.com>, Rodrigo Vivi <rodrigo.vivi@intel.com>, 
	Joonas Lahtinen <joonas.lahtinen@linux.intel.com>, Tvrtko Ursulin <tursulin@ursulin.net>, kernel@collabora.com, 
	amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, 
	intel-gfx@lists.freedesktop.org, intel-xe@lists.freedesktop.org, 
	Derek Foreman <derek.foreman@collabora.com>, Marius Vlad <marius.vlad@collabora.com>
Subject: Re: [PATCH v4 10/10] drm/rockchip: Implement "color format" DRM
 property
Message-ID: <irl64vwqiwdgxwwvim62qm55fc36p6fyduxlnc23zkotsr6726@4zswp4rjdtu4>
References: <20251117-color-format-v4-0-0ded72bd1b00@collabora.com>
 <20251117-color-format-v4-10-0ded72bd1b00@collabora.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha384;
	protocol="application/pgp-signature"; boundary="g3dvg44f3him5ido"
Content-Disposition: inline
In-Reply-To: <20251117-color-format-v4-10-0ded72bd1b00@collabora.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251119_011030_857825_91187E6C 
X-CRM114-Status: GOOD (  16.78  )
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


--g3dvg44f3him5ido
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH v4 10/10] drm/rockchip: Implement "color format" DRM
 property
MIME-Version: 1.0

On Mon, Nov 17, 2025 at 08:11:54PM +0100, Nicolas Frattaroli wrote:
> From: Derek Foreman <derek.foreman@collabora.com>
>=20
> Register the color format property in the dw_hdmi_qp-rockchip driver,
> and act on requested format changes as part of the connector state in
> the vop2 video output driver.
>=20
> Signed-off-by: Derek Foreman <derek.foreman@collabora.com>
> Signed-off-by: Marius Vlad <marius.vlad@collabora.com>
> Signed-off-by: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
> ---
>  drivers/gpu/drm/rockchip/dw_hdmi_qp-rockchip.c |  3 ++
>  drivers/gpu/drm/rockchip/rockchip_drm_vop2.c   | 46 ++++++++++++++++++++=
++++++
>  drivers/gpu/drm/rockchip/rockchip_drm_vop2.h   |  2 ++
>  3 files changed, 51 insertions(+)
>=20
> diff --git a/drivers/gpu/drm/rockchip/dw_hdmi_qp-rockchip.c b/drivers/gpu=
/drm/rockchip/dw_hdmi_qp-rockchip.c
> index 7c294751de19..7028166fdace 100644
> --- a/drivers/gpu/drm/rockchip/dw_hdmi_qp-rockchip.c
> +++ b/drivers/gpu/drm/rockchip/dw_hdmi_qp-rockchip.c
> @@ -635,6 +635,9 @@ static int dw_hdmi_qp_rockchip_bind(struct device *de=
v, struct device *master,
>  		return dev_err_probe(hdmi->dev, PTR_ERR(connector),
>  				     "Failed to init bridge connector\n");
> =20
> +	if (!drm_mode_create_hdmi_color_format_property(connector, supported_co=
lorformats))
> +		drm_connector_attach_color_format_property(connector);
> +

Why shouldn't we register the property in drmm_connector_hdmi_init directly?

Maxime

--g3dvg44f3him5ido
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iJUEABMJAB0WIQTkHFbLp4ejekA/qfgnX84Zoj2+dgUCaR2JgQAKCRAnX84Zoj2+
dmvfAYDCo+PJW5u5/sNK3esukJxyFfwo+aBeX8aZqtnXuZcqKb9iKdX/e3Bpfnj4
tNf3U7gBf0YrO/GhoJ/IYd6OFABbqrfpJOXtt98+CfuhHB+6M0WlyQ3jg6ddDDok
C7UgUczAhA==
=94DU
-----END PGP SIGNATURE-----

--g3dvg44f3him5ido--

