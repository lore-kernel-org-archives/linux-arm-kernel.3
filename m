Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8A953C79F99
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  8 Sep 2026 12:48:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=feEGDyi6VU/sb4agsQYzpOSCawLfSkaWQda6dgDR2p4=; b=TKvCqoGcdXRABi+TUmKZ74dvje
	67LSOMDW1ZB0aMbkO2PXGVANuEepe+mLzEGVPTwxT+tFKdnxE+wfekK6eNeayPrRyfuV+5Hgs7LLD
	2GJOpUsGhD1u6cyJk3AnESqp0BvYYFFZ2A96wQLxQc73/RUfG6G7zLQZhAoXZDv61tLtH11GpgWBb
	5svPXxNpI4uXTE/8wiSxEonWWHDZB3VApZGEW/k29wx/Xvwu5XoVRE5ccF5Dc+yQizm9o2VnhL7VA
	FX1w/I5WY0jlJS5ryFkI5rx/aJCINb1/2Ma8lp/UYFCWGVFv0Yh4jK8xAk0g6Iv4AJeX2wzZC+Nz5
	UnIsY5xg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x3vFG-000000093jg-11RL;
	Tue, 08 Sep 2026 12:48:14 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x3vFF-000000093jN-2n9D;
	Tue, 08 Sep 2026 12:48:13 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id D9C51601FA;
	Tue,  8 Sep 2026 12:48:12 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D14E11F00A3D;
	Tue,  8 Sep 2026 12:48:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788871692;
	bh=feEGDyi6VU/sb4agsQYzpOSCawLfSkaWQda6dgDR2p4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=MksgKu6uyO2Gguiv8Rq3+UUSn2sYyMCbhn4A5JnjyzKXKmkqOedfI2gppAaqvEHVJ
	 rRBAhiB6rGjwR0JoGODhOBOECe7zcNNFUAE05c7DWeacbZyEK8RvbCTIJ4/16HMzEC
	 MAnNAqV2snxIOSOtuDgsFsxtmJKNKBAA9zpkOrukWnWmtp5+S6BDLredgM5cXzEJvd
	 GrZU6s8B9QoHqrr0WyNgI1+Mi+Y/yMljhQDkmq6uaj2bB8HnRD6KR9uUEUDSa+/2fr
	 YZq56+cUDFuTrIXKNi5nF6fbD6tGEDBJbJzecf28OwddCE6o5k8iS0jArCktqp12lv
	 2X7cUZTftHpfQ==
Date: Tue, 8 Sep 2026 14:48:08 +0200
From: Maxime Ripard <mripard@kernel.org>
To: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
	Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, 
	Simona Vetter <simona@ffwll.ch>, Dave Stevenson <dave.stevenson@raspberrypi.com>, 
	Dmitry Baryshkov <lumag@kernel.org>, Andrzej Hajda <andrzej.hajda@intel.com>, 
	Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, 
	Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, Jonas Karlman <jonas@kwiboo.se>, 
	Jernej Skrabec <jernej.skrabec@gmail.com>, Luca Ceresoli <luca.ceresoli@bootlin.com>, 
	Chen-Yu Tsai <wens@kernel.org>, Samuel Holland <samuel@sholland.org>, 
	=?utf-8?B?TWHDrXJh?= Canal <mcanal@igalia.com>, Raspberry Pi Kernel Maintenance <kernel-list@raspberrypi.com>, 
	Raphael Gallais-Pou <rgallaispou@gmail.com>, Sandy Huang <hjc@rock-chips.com>, 
	Heiko =?utf-8?Q?St=C3=BCbner?= <heiko@sntech.de>, Andy Yan <andy.yan@rock-chips.com>, 
	Algea Cao <algea.cao@rock-chips.com>, Daniel Stone <daniels@collabora.com>, 
	Liu Ying <victor.liu@nxp.com>, Phong LE <ple@baylibre.com>, Helge Deller <deller@gmx.de>, 
	kernel@collabora.com, linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, 
	linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev, linux-rockchip@lists.infradead.org, 
	linux-fbdev@vger.kernel.org, Maud Spierings <maud_spierings@hotmail.com>, 
	Diederik de Haas <diederik@cknow-tech.com>
Subject: Re: [PATCH v11 30/74] drm/bridge: dw-hdmi-qp: Provide
 dw_hdmi_qp_hpd_notify() helper
Message-ID: <aqAD7Imd8VyYgaYr@houat>
References: <20260901-dw-hdmi-qp-scramb-v11-0-bc12954a0688@collabora.com>
 <20260901-dw-hdmi-qp-scramb-v11-30-bc12954a0688@collabora.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha384;
	protocol="application/pgp-signature"; boundary="7br5rkaa3pyhecrc"
Content-Disposition: inline
In-Reply-To: <20260901-dw-hdmi-qp-scramb-v11-30-bc12954a0688@collabora.com>
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


--7br5rkaa3pyhecrc
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH v11 30/74] drm/bridge: dw-hdmi-qp: Provide
 dw_hdmi_qp_hpd_notify() helper
MIME-Version: 1.0

On Tue, Sep 01, 2026 at 09:50:54PM +0300, Cristian Ciocaltea wrote:
> Export dw_hdmi_qp_hpd_notify() for platform drivers to report hot-plug
> detection events.  Unlike drm_helper_hpd_irq_event() which polls all
> connectors, this helper targets only the affected connector and ensures
> .detect_ctx() is invoked on reconnection events to trigger SCDC state
> recovery.
>=20
> Note that this helper may sleep, so it must only be called from a
> threaded HPD interrupt handler or a work function.
>=20
> Tested-by: Maud Spierings <maud_spierings@hotmail.com>
> Tested-by: Diederik de Haas <diederik@cknow-tech.com>  # NanoPC-T6 LTS, R=
ock 5B
> Signed-off-by: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
> ---
>  drivers/gpu/drm/bridge/synopsys/dw-hdmi-qp.c | 37 ++++++++++++++++++++++=
++++++
>  include/drm/bridge/dw_hdmi_qp.h              |  1 +
>  2 files changed, 38 insertions(+)
>=20
> diff --git a/drivers/gpu/drm/bridge/synopsys/dw-hdmi-qp.c b/drivers/gpu/d=
rm/bridge/synopsys/dw-hdmi-qp.c
> index ee74266b7aa9..a2277531182c 100644
> --- a/drivers/gpu/drm/bridge/synopsys/dw-hdmi-qp.c
> +++ b/drivers/gpu/drm/bridge/synopsys/dw-hdmi-qp.c
> @@ -28,6 +28,7 @@
>  #include <drm/drm_edid.h>
>  #include <drm/drm_modes.h>
>  #include <drm/drm_print.h>
> +#include <drm/drm_probe_helper.h>
> =20
>  #include <media/cec.h>
> =20
> @@ -163,6 +164,8 @@ struct dw_hdmi_qp {
>  	struct regmap *regm;
>  	int main_irq;
> =20
> +	/* Written by the atomic enable/disable hooks, read locklessly by HPD */
> +	struct drm_connector *curr_conn;
>  	unsigned long tmds_char_rate;
>  	bool no_hpd;
>  };
> @@ -785,6 +788,8 @@ static void dw_hdmi_qp_bridge_atomic_enable(struct dr=
m_bridge *bridge,
>  	dw_hdmi_qp_mod(hdmi, op_mode, OPMODE_DVI, LINK_CONFIG0);
> =20
>  	drm_atomic_helper_connector_hdmi_update_infoframes(connector, state);
> +
> +	WRITE_ONCE(hdmi->curr_conn, connector);

You need to take a reference to the connector, and you really should use
a mutex here.

Maxime

--7br5rkaa3pyhecrc
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iJUEABMJAB0WIQTkHFbLp4ejekA/qfgnX84Zoj2+dgUCaqAECAAKCRAnX84Zoj2+
dkkDAYC+AWGm80pVYEp640sKNhCVwlFRg0NA45EvZymN4J4AhE4kXnPASU52wEFN
x6mrzgIBgN7eoUGtFrPVC1JlZqSlVzCPzTRW2tTeI5qXVl4QpF/Mbac11+3SSsJp
N9wlWFp5OQ==
=XLln
-----END PGP SIGNATURE-----

--7br5rkaa3pyhecrc--

