Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A71F9CDB466
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 25 Jun 2026 07:53:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=UvJV8PBXNDCIvuMBlcVr9yGKghTFtbTdY/tbnURtOfs=; b=vet3o2kNagIOtk76HFgXEvS+wr
	BFCNAmISuzox7s8BtdyuTyI++8JaRuy4OoFNWU6xIrZO0/+JR0JQVWJiYreH+gTVtvfDwvbtGrCs0
	I+WZcHfGWOXYEKaOwl98eiJSZEN2KvfhJCqo5czp3u8GRmM1YwAH7rYcN6hllcUoWglnrWw+WtRFK
	nPWQVqDwgyBV+IOJpvW4C9MpPmklydEKbbloMhuK2J8rsTEbRiSUR4HiAe01r5Od2Cn0GVFyfq4aq
	0Gpt0/bS6SihUVAW4WtVNdicFTf9ZjOoZReVqXjTzaI7c+wF+uCcQZZhT3roF3DuzQci9Ppq2qJp4
	ELOEOEUw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wcetx-00000008nOt-1k3m;
	Thu, 25 Jun 2026 07:53:33 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wcetw-00000008nOf-0joy;
	Thu, 25 Jun 2026 07:53:32 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 5E9AD40176;
	Thu, 25 Jun 2026 07:53:31 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C3BBB1F000E9;
	Thu, 25 Jun 2026 07:53:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782374011;
	bh=UvJV8PBXNDCIvuMBlcVr9yGKghTFtbTdY/tbnURtOfs=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=HWK8FNr5rCNALZm1hk9LEA8ORjpGEO53UZ0EcgeCWEP8I3DMBY+1PkwIxYTIlA3k9
	 ApKIYH7mi+J6QUJYUmsHijw10o34yv/aog1EOzKpPofKRjIjSu868x7Z/AMy8YvK+n
	 DlOICa7JOeL6UownMRcDKvWDl3KXLw58rxx3c0rTJpu0mGRnexFRP0YQCtSw3zv8Ny
	 8tqj0L9WfMM5GsPfuKN0YE2GoXUEabJ+kHG/Tpfs4ivmP6ngUh329fQPLfOVZI4QPE
	 bIMJoMROpVvOxMKmWMlZMwJjqm6YVPtvPmIou0qwl1FvNA8YyPBTLlClYNfX7aW9+e
	 dxnodR6usHdfg==
Date: Thu, 25 Jun 2026 09:53:27 +0200
From: Maxime Ripard <mripard@kernel.org>
To: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
	Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, 
	Simona Vetter <simona@ffwll.ch>, Andrzej Hajda <andrzej.hajda@intel.com>, 
	Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, 
	Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, Jonas Karlman <jonas@kwiboo.se>, 
	Jernej Skrabec <jernej.skrabec@gmail.com>, Luca Ceresoli <luca.ceresoli@bootlin.com>, 
	Sandy Huang <hjc@rock-chips.com>, Heiko =?utf-8?Q?St=C3=BCbner?= <heiko@sntech.de>, 
	Andy Yan <andy.yan@rock-chips.com>, Daniel Stone <daniels@collabora.com>, 
	Dave Stevenson <dave.stevenson@raspberrypi.com>, =?utf-8?B?TWHDrXJh?= Canal <mcanal@igalia.com>, 
	Raspberry Pi Kernel Maintenance <kernel-list@raspberrypi.com>, kernel@collabora.com, dri-devel@lists.freedesktop.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-rockchip@lists.infradead.org
Subject: Re: [PATCH v7 04/30] drm/display: scdc_helper: Add HDMI 2.0
 scrambling management helpers
Message-ID: <20260625-flashy-squirrel-of-passion-69fe24@houat>
References: <20260602-dw-hdmi-qp-scramb-v7-0-445eb54ee1ed@collabora.com>
 <20260602-dw-hdmi-qp-scramb-v7-4-445eb54ee1ed@collabora.com>
 <20260612-cordial-steadfast-cow-fcaf01@houat>
 <2f5ce8eb-ef47-4238-ad68-ce62981a1845@collabora.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha384;
	protocol="application/pgp-signature"; boundary="ahdp44alrudfmxlz"
Content-Disposition: inline
In-Reply-To: <2f5ce8eb-ef47-4238-ad68-ce62981a1845@collabora.com>
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


--ahdp44alrudfmxlz
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH v7 04/30] drm/display: scdc_helper: Add HDMI 2.0
 scrambling management helpers
MIME-Version: 1.0

On Sat, Jun 13, 2026 at 04:30:02AM +0300, Cristian Ciocaltea wrote:
> On 6/12/26 4:43 PM, Maxime Ripard wrote:
> > On Tue, Jun 02, 2026 at 01:44:04AM +0300, Cristian Ciocaltea wrote:
> >> +/**
> >> + * drm_scdc_start_scrambling - activate scrambling and monitor SCDC s=
tatus
> >> + * @connector: connector
> >> + *
> >> + * Enables scrambling and high TMDS clock ratio on both source and si=
nk sides.
> >> + * Additionally, use a delayed work item to monitor the scrambling st=
atus on
> >> + * the sink side and retry the operation, as some displays refuse to =
set the
> >> + * scrambling bit right away.
> >> + *
> >> + * Returns:
> >> + * Zero if scrambling is set successfully, an error code otherwise.
> >> + */
> >> +int drm_scdc_start_scrambling(struct drm_connector *connector)
> >> +{
> >> +	struct drm_display_info *info =3D &connector->display_info;
> >> +	struct drm_connector_hdmi *hdmi =3D &connector->hdmi;
> >> +	int ret;
> >> +	u8 ver;
> >> +
> >> +	if (!hdmi->scrambler_supported) {
> >> +		drm_scdc_dbg(connector, "Scrambler not supported, bailing.\n");
> >> +		return -EINVAL;
> >> +	}
> >> +
> >> +	if (!info->is_hdmi ||
> >> +	    !info->hdmi.scdc.supported ||
> >> +	    !info->hdmi.scdc.scrambling.supported) {
> >> +		drm_scdc_dbg(connector, "Sink doesn't support scrambling.\n");
> >> +		return -EINVAL;
> >> +	}
> >> +
> >> +	drm_scdc_dbg(connector, "Enabling scrambling\n");
> >> +
> >> +	ret =3D drm_scdc_readb(connector->ddc, SCDC_SINK_VERSION, &ver);
> >> +	if (ret) {
> >> +		drm_scdc_dbg(connector, "Failed to read SCDC_SINK_VERSION: %d\n", r=
et);
> >> +		return ret;
> >> +	}
> >> +
> >> +	ret =3D drm_scdc_writeb(connector->ddc, SCDC_SOURCE_VERSION,
> >> +			      min_t(u8, ver, SCDC_MAX_SOURCE_VERSION));
> >> +	if (ret) {
> >> +		drm_scdc_dbg(connector, "Failed to write SCDC_SOURCE_VERSION: %d\n"=
, ret);
> >> +		return ret;
> >> +	}
> >> +
> >> +	hdmi->scdc_cb =3D drm_scdc_monitor_scrambler;
> >> +	WRITE_ONCE(hdmi->scrambler_enabled, true);
> >> +
> >> +	ret =3D drm_scdc_try_scrambling_setup(connector);
> >> +	if (!ret)
> >> +		ret =3D hdmi->funcs->scrambler_enable(connector);
> >> +
> >> +	if (ret) {
> >> +		WRITE_ONCE(hdmi->scrambler_enabled, false);
> >> +		cancel_delayed_work_sync(&hdmi->scdc_work);
> >> +		hdmi->scdc_cb =3D NULL;
> >> +
> >> +		drm_scdc_set_scrambling(connector, false);
> >> +		drm_scdc_set_high_tmds_clock_ratio(connector, false);
> >> +	}
> >> +
> >> +	return ret;
> >> +}
> >> +EXPORT_SYMBOL(drm_scdc_start_scrambling);
> >=20
> > This is also pretty significantly different than what vc4 implemented. I
> > don't necessarily mind, but claiming that it's functionally equivalent
> > isn't true. I think it would be a much better strategy to turn the vc4
> > code into helpers as is because it's been merged 4 years ago and we know
> > it's solid.
>=20
> As explained in patch 25, I think there's been a slight misunderstanding =
of how
> the CRTC reset logic was actually implemented.

You're absolutely right, let me review it again. sorry.

Maxime

--ahdp44alrudfmxlz
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iJUEABMJAB0WIQTkHFbLp4ejekA/qfgnX84Zoj2+dgUCajzedwAKCRAnX84Zoj2+
dv17AYCp6yoAaSyZqDDYYAQ4cU42Hzp0gT4kBJKa+9MIZTx7xPg8QdAv3RJRZH7W
fD2FPuUBfjxl1WKego2rW1IBW18K+iM6/CdMDsSCQIeEAx1h2MENDa23uc6U8w01
2AHHwCeK0A==
=FFG5
-----END PGP SIGNATURE-----

--ahdp44alrudfmxlz--

