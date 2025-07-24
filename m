Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B7ABAC83F26
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 24 Jul 2025 15:25:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=2yUnl4vidy4gJvXblFDoJuJNs7hErSWbP5rsO2C/gB0=; b=qRP+cWSOB9yQyvNM+4Zv879NV+
	IwzAamP7ZQUVL1dposNEUOaakhaFOcfiV3jI7C9lV3OBQTf7L/zyiBwsUio7xU4/DKnFvf81HELOw
	osUCOuHoReJuTC11LmAb/IY2QJaRIl3q0ZxbA9/AxmOUwTS9oWKC6+ox8ppamsqVwYCWmFhgPI7uv
	3UD3Mk9Z7fHtItlwdqaN7o9gYaB2cvNEQNyrVvvLaalDQwcBMZID4JWPBB8bmJBP284NqjJio04m5
	YlDQm6Giy18Bu6JQNR9I+HXCSOJTumqZEqZRzHtgDMbCTe2JerESH7L3VbE7wrbdQ4Ni+xEgwnu+z
	lIR/+INQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uexpB-00000007qJI-0H4O;
	Thu, 24 Jul 2025 15:25:37 +0000
Received: from gloria.sntech.de ([185.11.138.130])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uevZj-00000007TJN-29Kh;
	Thu, 24 Jul 2025 13:01:32 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de;
	s=gloria202408; h=Content-Type:Content-Transfer-Encoding:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Reply-To;
	bh=2yUnl4vidy4gJvXblFDoJuJNs7hErSWbP5rsO2C/gB0=; b=rqRYTOatipp8MXoMnYvt0IchBY
	K6HjCQAtpimPUnQtSi/BNo/rhID2z3ZpYzeCo5d0nTA+EqsZqo5uResfrEERmPBEJ/EvesXgJL+pL
	pMg1t4i0xSPMpGxNrZGdHKYQyXoWWsKrJZ36Exq8A3t6QCpWaxm8fQ3uFqFrLs7xHNTLDUcU8t3zu
	ftz79uNn1goGeo7w3A2F+6RfZEXvpOjuNQJwC8wLypwf58/4o3AM8LoNA/PuO+GY/lg5qVStosIgY
	GBPCcmPrkXmSbj22AvKy1UkHkeNInX+DT7hZLGIfaYV/Av2EIf/fzaSOnYT2v99DqxboLboE5UWBp
	DGrJ3CaA==;
Received: from i53875a38.versanet.de ([83.135.90.56] helo=diego.localnet)
	by gloria.sntech.de with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <heiko@sntech.de>)
	id 1uevZ5-0005kZ-4F; Thu, 24 Jul 2025 15:00:51 +0200
From: Heiko =?UTF-8?B?U3TDvGJuZXI=?= <heiko@sntech.de>
To: andrzej.hajda@intel.com, neil.armstrong@linaro.org, rfoss@kernel.org,
 Damon Ding <damon.ding@rock-chips.com>
Cc: Laurent.pinchart@ideasonboard.com, jonas@kwiboo.se,
 jernej.skrabec@gmail.com, maarten.lankhorst@linux.intel.com,
 mripard@kernel.org, tzimmermann@suse.de, airlied@gmail.com, simona@ffwll.ch,
 jingoohan1@gmail.com, inki.dae@samsung.com, sw0312.kim@samsung.com,
 kyungmin.park@samsung.com, krzk@kernel.org, alim.akhtar@samsung.com,
 hjc@rock-chips.com, andy.yan@rock-chips.com,
 dmitry.baryshkov@oss.qualcomm.com, l.stach@pengutronix.de,
 dianders@chromium.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-samsung-soc@vger.kernel.org, linux-rockchip@lists.infradead.org,
 Damon Ding <damon.ding@rock-chips.com>
Subject: Re: [PATCH v3 08/14] drm/bridge: analogix_dp: Apply drm_bridge_connector
 helper
Date: Thu, 24 Jul 2025 15:00:49 +0200
Message-ID: <10694296.nUPlyArG6x@diego>
In-Reply-To: <20250724080304.3572457-9-damon.ding@rock-chips.com>
References: <20250724080304.3572457-1-damon.ding@rock-chips.com>
 <20250724080304.3572457-9-damon.ding@rock-chips.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250724_060131_578592_B2164838 
X-CRM114-Status: GOOD (  12.34  )
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

Hi Damon,

Am Donnerstag, 24. Juli 2025, 10:02:58 Mitteleurop=C3=A4ische Sommerzeit sc=
hrieb Damon Ding:
> Apply drm_bridge_connector helper for Analogix DP driver.
>=20
> The following changes have been made:
> - Apply drm_bridge_connector helper to get rid of &drm_connector_funcs
>   and &drm_connector_helper_funcs.
> - Remove unnecessary parameter struct drm_connector* for callback
>   &analogix_dp_plat_data.attach.
> - Remove &analogix_dp_device.connector.
> - Convert analogix_dp_atomic_check()/analogix_dp_detect() to
>   &drm_bridge_funcs.atomic_check()/&drm_bridge_funcs.detect().
> - Split analogix_dp_get_modes() into &drm_bridge_funcs.get_modes() and
>   &drm_bridge_funcs.edid_read().
>=20
> Signed-off-by: Damon Ding <damon.ding@rock-chips.com>

>  static enum drm_connector_status
> -analogix_dp_detect(struct drm_connector *connector, bool force)
> +analogix_dp_bridge_detect(struct drm_bridge *bridge)
>  {
> -	struct analogix_dp_device *dp =3D to_dp(connector);
> +	struct analogix_dp_device *dp =3D to_dp(bridge);
>  	enum drm_connector_status status =3D connector_status_disconnected;
> =20
>  	if (dp->plat_data->panel)

this needs an update to

 static enum drm_connector_status
=2Danalogix_dp_bridge_detect(struct drm_bridge *bridge)
+analogix_dp_bridge_detect(struct drm_bridge *bridge, struct drm_connector =
*connector)

to follow Andy's patch [0] that got already applied to drm-misc-next

Heiko


[0] https://gitlab.freedesktop.org/drm/misc/kernel/-/commit/5d156a9c3d5ea3d=
bec192121259dee2c2f938fa1



