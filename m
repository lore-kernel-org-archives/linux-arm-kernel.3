Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 96F65D2D117
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 13 Jan 2026 15:00:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=a1zyYeMiWcjRTney8c0xcKAWYBVhwvLzew6mamR0yG8=; b=gfdf0VPUELDog/0rWSUmJk0Sny
	8MmlS9gl2AMfXBV/ptubgtve5ELBw3pB8YZLTA21/RtHVrCEa/C4Pbs3ZY4H5MgU9lCufpV2pbiAM
	ZQ8UmURhhAHCpAJsppGINuQ+sUAwD3lslEZWwwfSTUOXHtC/irBmW+iZgpsgvl6zGncm/jpxPTemU
	j2pzmn/iZV0wdiKE7CWwZXOhmHQtExr7xn4bAnYSNg9hmGeBQGMOO0JE14Uzccm8jcchvIdi+Fn6r
	1RLGrYTprnO4fHitUDFDFZPHpNCYn3kTdCpvtxw01BhvxGyikvx9lfE+YiRR9b9X1mlu7St5pi128
	sqbb9Ruw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vffsN-00000007JFU-0nBj;
	Tue, 13 Jan 2026 15:00:07 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vffsL-00000007JEb-3tgC;
	Tue, 13 Jan 2026 15:00:06 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id EB430600AE;
	Tue, 13 Jan 2026 15:00:04 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4BA9DC16AAE;
	Tue, 13 Jan 2026 15:00:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1768316404;
	bh=bHL7bidi4XNXTo34ze3DKqMXsxi+U/ByKg+N3GwzUqA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=LC19LC3rKkCG7NaBTHuROIQfK3vd9yt14mFBDpO9GVerhcLoRodOP1pYD9+hQjfoa
	 PuSVtLA4lDp4Gk5C1voikCx3OAv3Xuml7CDLLnmj6NHqIkMDWO9qkAlV8Rc9LujA6k
	 IRr8UM2tkQtq4IiTc96bdLC3iulmzKFTmKioeTLlt23OW+6qIRvnnlvpJVQgAMH5W3
	 kkYYL91wlQEZgChebVYFplC8DawLk3avajI9Qa22tfMvp5EcyI/8O/xKIUEb2puax4
	 6H0nn2Q8PHhed1nulRBZDySZbSjnCw3bbvJGF+w1ISlrJxXleB+xslY0u45Z+dLLyO
	 Vu1dgcLLAO/qw==
Date: Tue, 13 Jan 2026 16:00:01 +0100
From: Maxime Ripard <mripard@kernel.org>
To: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
Cc: Andrzej Hajda <andrzej.hajda@intel.com>, 
	Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, 
	Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, Jonas Karlman <jonas@kwiboo.se>, 
	Jernej Skrabec <jernej.skrabec@gmail.com>, Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
	Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, 
	Simona Vetter <simona@ffwll.ch>, Sandy Huang <hjc@rock-chips.com>, 
	Heiko =?utf-8?Q?St=C3=BCbner?= <heiko@sntech.de>, Andy Yan <andy.yan@rock-chips.com>, kernel@collabora.com, 
	dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, 
	Diederik de Haas <diederik@cknow-tech.com>, Maud Spierings <maud_spierings@hotmail.com>
Subject: Re: [PATCH v2 3/4] drm/bridge: dw-hdmi-qp: Add high TMDS clock ratio
 and scrambling support
Message-ID: <20260113-unselfish-russet-chicken-80d3c3@houat>
References: <20260113-dw-hdmi-qp-scramb-v2-0-ae7b2c58d24d@collabora.com>
 <20260113-dw-hdmi-qp-scramb-v2-3-ae7b2c58d24d@collabora.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha384;
	protocol="application/pgp-signature"; boundary="obg4uifwe4lk2yjg"
Content-Disposition: inline
In-Reply-To: <20260113-dw-hdmi-qp-scramb-v2-3-ae7b2c58d24d@collabora.com>
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


--obg4uifwe4lk2yjg
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH v2 3/4] drm/bridge: dw-hdmi-qp: Add high TMDS clock ratio
 and scrambling support
MIME-Version: 1.0

On Tue, Jan 13, 2026 at 12:26:20AM +0200, Cristian Ciocaltea wrote:
> @@ -902,13 +981,74 @@ static void dw_hdmi_qp_bridge_atomic_disable(struct=
 drm_bridge *bridge,
> =20
>  	hdmi->tmds_char_rate =3D 0;
> =20
> +	dw_hdmi_qp_disable_scramb(hdmi);
> +
> +	hdmi->curr_conn =3D NULL;
>  	hdmi->phy.ops->disable(hdmi, hdmi->phy.data);
>  }
> =20
> -static enum drm_connector_status
> -dw_hdmi_qp_bridge_detect(struct drm_bridge *bridge, struct drm_connector=
 *connector)
> +static int dw_hdmi_qp_reset_link(struct dw_hdmi_qp *hdmi,
> +				 struct drm_connector *conn,
> +				 struct drm_modeset_acquire_ctx *ctx)
> +{
> +	struct drm_crtc *crtc;
> +	u8 config;
> +	int ret;
> +
> +	if (!conn->state)
> +		return 0;
> +
> +	crtc =3D conn->state->crtc;
> +	if (!crtc)
> +		return 0;
> +
> +retry:
> +	ret =3D drm_modeset_lock(&crtc->mutex, ctx);
> +	if (ret)
> +		goto check_err;
> +
> +	if (!crtc->state->active)
> +		return 0;
> +
> +	if (conn->state->commit &&
> +	    !try_wait_for_completion(&conn->state->commit->hw_done))
> +		return 0;
> +
> +	ret =3D drm_scdc_readb(hdmi->bridge.ddc, SCDC_TMDS_CONFIG, &config);
> +	if (ret < 0) {
> +		dev_err(hdmi->dev, "Failed to read TMDS config: %d\n", ret);
> +		return 0;
> +	}
> +
> +	if (!!(config & SCDC_SCRAMBLING_ENABLE) =3D=3D hdmi->scramb_enabled)
> +		return 0;
> +
> +	dev_dbg(hdmi->dev, "%s resetting crtc\n", __func__);
> +
> +	drm_atomic_helper_connector_hdmi_hotplug(conn, connector_status_connect=
ed);
> +
> +	/*
> +	 * Conform to HDMI 2.0 spec by ensuring scrambled data is not sent
> +	 * before configuring the sink scrambling, as well as suspending any
> +	 * TMDS transmission while changing the TMDS clock rate in the sink.
> +	 */
> +	ret =3D drm_atomic_helper_reset_crtc(crtc, ctx);
> +
> +check_err:
> +	if (ret =3D=3D -EDEADLK) {
> +		drm_modeset_backoff(ctx);
> +		goto retry;
> +	}
> +
> +	return ret;
> +}
> +
> +static int dw_hdmi_qp_bridge_detect(struct drm_bridge *bridge,
> +				    struct drm_connector *connector,
> +				    struct drm_modeset_acquire_ctx *ctx)
>  {
>  	struct dw_hdmi_qp *hdmi =3D bridge->driver_private;
> +	enum drm_connector_status status;
>  	const struct drm_edid *drm_edid;
> =20
>  	if (hdmi->no_hpd) {
> @@ -919,7 +1059,15 @@ dw_hdmi_qp_bridge_detect(struct drm_bridge *bridge,=
 struct drm_connector *connec
>  			return connector_status_disconnected;
>  	}
> =20
> -	return hdmi->phy.ops->read_hpd(hdmi, hdmi->phy.data);
> +	status =3D hdmi->phy.ops->read_hpd(hdmi, hdmi->phy.data);
> +
> +	dev_dbg(hdmi->dev, "%s status=3D%d scramb=3D%d\n", __func__,
> +		status, hdmi->scramb_enabled);
> +
> +	if (status =3D=3D connector_status_connected && hdmi->scramb_enabled)
> +		dw_hdmi_qp_reset_link(hdmi, connector, ctx);
> +
> +	return status;
>  }

We have drm_bridge_helper_reset_crtc() now, any reason you didn't use it?

Maxime

--obg4uifwe4lk2yjg
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iJUEABMJAB0WIQTkHFbLp4ejekA/qfgnX84Zoj2+dgUCaWZd7QAKCRAnX84Zoj2+
dlp0AX4p2V7AchpI5eOf2uSzpRMW8pCKeTOAZ2dNExrrBfMPj660Ltr6w6d8et7J
3KV99wsBgId9h0fMMjulQ3cULU3BgGvzBeZIpYskWi/riKxXPAOnwneatsZU93tf
Xi3Evk4M9w==
=fYIw
-----END PGP SIGNATURE-----

--obg4uifwe4lk2yjg--

