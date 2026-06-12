Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8F984CD8CA8
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 12 Jun 2026 13:43:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=p/8CtmD9b1H19ZygvRiFJ4cHW08uI2Wy+HwdBYB08uQ=; b=xJpnwQmjYSaD15Nljp6i7gMc3a
	pzdFansrt/Zx4SQDkkrVtJPGQ5F22c1acXZKzRHjoU3mwXCOPdYQQY7mbEtlzSn4RU/x5+IS8QKzx
	GezCJ6CTtIP44tvqwu+yw07kqwwkptBzA1wJ43TtO8NJ/gGm3XOJ6htrB/FZ3g/ejeLvsU5C3IS2P
	w4sRQlamxQ3k718DuwvUZeqsJjtjUTfKlwvkeMPqM4zloP+syJ01blXj0VKeU7c+NMPekzX3qKDiz
	/gRKFmAEkFy74wMKPIzNSFV0Cixpk9qYPbXMoXpW1L1O482Af2+N1QK1G1fjevxwyaBu08UUCK8Kx
	nOizBmhg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wY2AC-0000000Azxq-0r2k;
	Fri, 12 Jun 2026 13:43:12 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wY2AA-0000000AzxM-2uLJ;
	Fri, 12 Jun 2026 13:43:10 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id A2E6460008;
	Fri, 12 Jun 2026 13:43:09 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DD6361F000E9;
	Fri, 12 Jun 2026 13:43:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781271789;
	bh=p/8CtmD9b1H19ZygvRiFJ4cHW08uI2Wy+HwdBYB08uQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=FZ/YZzmt7kU/1ArFPLGhIQSFq6jOlFhIBpHUwLpkPHmBwd+KU5rvmZ6dGkzA0iDhz
	 GJvnztP/FfBcb3jY+cyeyeU+UipKXBVYtei2TA7HQIE5YbjyFk0IGBgRHE2RjdSw8A
	 Yunpt/buhFFE1IgdkjZnGttJVNRWMAOqB+B3y8qYosXpl3jhGN0vVAFzy+0c/1Zlfp
	 HOBTCdT6rW/jTGxa2KxtLSAlAcAoakIurLMMEknZMKb3UjcpfdjrpxzjJtZeatF0mB
	 PUsxE48/qU9aNJfe2zEWD9JZQwtj1j0QGZ7QpaNhhdNBfc3L4jrnUMp4TJ3xQ3hdVE
	 ykgjSR2yQIFow==
Date: Fri, 12 Jun 2026 15:43:06 +0200
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
Message-ID: <20260612-cordial-steadfast-cow-fcaf01@houat>
References: <20260602-dw-hdmi-qp-scramb-v7-0-445eb54ee1ed@collabora.com>
 <20260602-dw-hdmi-qp-scramb-v7-4-445eb54ee1ed@collabora.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha384;
	protocol="application/pgp-signature"; boundary="brdajz4ircx43s3r"
Content-Disposition: inline
In-Reply-To: <20260602-dw-hdmi-qp-scramb-v7-4-445eb54ee1ed@collabora.com>
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


--brdajz4ircx43s3r
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Subject: Re: [PATCH v7 04/30] drm/display: scdc_helper: Add HDMI 2.0
 scrambling management helpers
MIME-Version: 1.0

On Tue, Jun 02, 2026 at 01:44:04AM +0300, Cristian Ciocaltea wrote:
> +/**
> + * drm_scdc_start_scrambling - activate scrambling and monitor SCDC status
> + * @connector: connector
> + *
> + * Enables scrambling and high TMDS clock ratio on both source and sink sides.
> + * Additionally, use a delayed work item to monitor the scrambling status on
> + * the sink side and retry the operation, as some displays refuse to set the
> + * scrambling bit right away.
> + *
> + * Returns:
> + * Zero if scrambling is set successfully, an error code otherwise.
> + */
> +int drm_scdc_start_scrambling(struct drm_connector *connector)
> +{
> +	struct drm_display_info *info = &connector->display_info;
> +	struct drm_connector_hdmi *hdmi = &connector->hdmi;
> +	int ret;
> +	u8 ver;
> +
> +	if (!hdmi->scrambler_supported) {
> +		drm_scdc_dbg(connector, "Scrambler not supported, bailing.\n");
> +		return -EINVAL;
> +	}
> +
> +	if (!info->is_hdmi ||
> +	    !info->hdmi.scdc.supported ||
> +	    !info->hdmi.scdc.scrambling.supported) {
> +		drm_scdc_dbg(connector, "Sink doesn't support scrambling.\n");
> +		return -EINVAL;
> +	}
> +
> +	drm_scdc_dbg(connector, "Enabling scrambling\n");
> +
> +	ret = drm_scdc_readb(connector->ddc, SCDC_SINK_VERSION, &ver);
> +	if (ret) {
> +		drm_scdc_dbg(connector, "Failed to read SCDC_SINK_VERSION: %d\n", ret);
> +		return ret;
> +	}
> +
> +	ret = drm_scdc_writeb(connector->ddc, SCDC_SOURCE_VERSION,
> +			      min_t(u8, ver, SCDC_MAX_SOURCE_VERSION));
> +	if (ret) {
> +		drm_scdc_dbg(connector, "Failed to write SCDC_SOURCE_VERSION: %d\n", ret);
> +		return ret;
> +	}
> +
> +	hdmi->scdc_cb = drm_scdc_monitor_scrambler;
> +	WRITE_ONCE(hdmi->scrambler_enabled, true);
> +
> +	ret = drm_scdc_try_scrambling_setup(connector);
> +	if (!ret)
> +		ret = hdmi->funcs->scrambler_enable(connector);
> +
> +	if (ret) {
> +		WRITE_ONCE(hdmi->scrambler_enabled, false);
> +		cancel_delayed_work_sync(&hdmi->scdc_work);
> +		hdmi->scdc_cb = NULL;
> +
> +		drm_scdc_set_scrambling(connector, false);
> +		drm_scdc_set_high_tmds_clock_ratio(connector, false);
> +	}
> +
> +	return ret;
> +}
> +EXPORT_SYMBOL(drm_scdc_start_scrambling);

This is also pretty significantly different than what vc4 implemented. I
don't necessarily mind, but claiming that it's functionally equivalent
isn't true. I think it would be a much better strategy to turn the vc4
code into helpers as is because it's been merged 4 years ago and we know
it's solid.

Then, if you want to add additional checks and constraints (like the
SCDC_SINK_VERSION) that's fine, but it should come on top, and with its
own explanation.

Maxime

--brdajz4ircx43s3r
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iJUEABMJAB0WIQTkHFbLp4ejekA/qfgnX84Zoj2+dgUCaiwM4AAKCRAnX84Zoj2+
drsqAYCg44ILVaYXrmkSWguKwKZ0rf61WM5w16Gd3nnf1ak+1Ripg6zsXz2SN8CF
cqVRm2cBgM3rf8LNkOajtmtAsPxLazMFX22jugzFFSVhwKCKm/fozOES8Js+s8ud
2ikvX5BRKA==
=Vzl4
-----END PGP SIGNATURE-----

--brdajz4ircx43s3r--

