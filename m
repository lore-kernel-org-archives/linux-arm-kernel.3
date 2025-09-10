Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4D7B2CA0FED
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 10 Sep 2025 11:08:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=yITzLzNmSRjTSGw3hMzbNR0618ZmnNFyQAoLOpB0zow=; b=rnFG5GFvrGANGGadez6cQI/mHF
	0BhjtvUVvBCn9TROi1PD5k2LemMyxf3akvScNRT9r8V3brpGRhtd8KeHuPLx3jeTUbQ+oR4187MZb
	Z3ZUbiLZZzESZopLJQato1aC9M4nsfDskGONMHDbhaHl3DrqsQPN53vLGvUHfbJcW1Z6Fa7KAw3fx
	ZQqYRETxDPljA8tujpSkftAisZ7Lp+Pd3ouoEDfNqXnpIoNg/rY/ErQZMrmG204u7R0YGXksiCkcB
	+90+DAFloS0Fq2zPUSTQDdJcPde8MgyzDLjZoOp3H1f3FFP/n9uOGb9awbLcgeOKdxAsNShE00Kbt
	0u6JHXVg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uwIgm-0000000DiK1-18OJ;
	Wed, 10 Sep 2025 11:08:36 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uwIgj-0000000DiHs-2HBP;
	Wed, 10 Sep 2025 11:08:34 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 37C4B43E04;
	Wed, 10 Sep 2025 11:08:33 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8D442C4CEF8;
	Wed, 10 Sep 2025 11:08:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1757502513;
	bh=eT+fM0/l96U9E80CByHY3UpL1VMyoPh2jRe5J041drA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=GZg4a9PzOThwfZJWjmmg1do+BJcK6fKqRVNE1sq+YdWBDlnHaURSjrRlxZ7+9DH4N
	 Db+CuYerpenQhklpoGj+sHRilAxDRpInKvZJFpf3X1NCOLLQCBlcF189fa3pyP4fw4
	 ufx5Lufwft1vqYQ0u4pu16D0r5dE6FepR8/Y2m7Bl1iWB50ud8cl9nr4fE/W1LSLys
	 FYy4EKSZ0zBJNrEh6t7tmcyrIUrM+yDEihmZQ6+XVKFqbhMuCNH5+DEntCodxdQULf
	 ZowH6/I7RWxU+6aGkzICbmkk9ffdQk6E6ckIxF6EdRydu3MVPbheSr9BgPt07IhG8H
	 9PwdxdvRijCMA==
Date: Wed, 10 Sep 2025 13:08:30 +0200
From: Maxime Ripard <mripard@kernel.org>
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Andrzej Hajda <andrzej.hajda@intel.com>, 
	Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, 
	Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, Jonas Karlman <jonas@kwiboo.se>, 
	Jernej Skrabec <jernej.skrabec@gmail.com>, Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
	Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, 
	Simona Vetter <simona@ffwll.ch>, Sandy Huang <hjc@rock-chips.com>, 
	Heiko =?utf-8?Q?St=C3=BCbner?= <heiko@sntech.de>, Andy Yan <andy.yan@rock-chips.com>, Chen-Yu Tsai <wens@csie.org>, 
	Samuel Holland <samuel@sholland.org>, Dave Stevenson <dave.stevenson@raspberrypi.com>, 
	=?utf-8?B?TWHDrXJh?= Canal <mcanal@igalia.com>, Raspberry Pi Kernel Maintenance <kernel-list@raspberrypi.com>, 
	Liu Ying <victor.liu@nxp.com>, Rob Clark <robin.clark@oss.qualcomm.com>, 
	Dmitry Baryshkov <lumag@kernel.org>, Abhinav Kumar <abhinav.kumar@linux.dev>, 
	Jessica Zhang <jessica.zhang@oss.qualcomm.com>, Sean Paul <sean@poorly.run>, 
	Marijn Suijten <marijn.suijten@somainline.org>, dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, linux-sunxi@lists.linux.dev, 
	linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org, 
	Daniel Stone <daniels@collabora.com>
Subject: Re: [PATCH v4 09/10] drm/connector: verify that HDMI connectors
 support necessary InfoFrames
Message-ID: <20250910-courageous-warthog-of-refinement-aced6f@houat>
References: <20250909-drm-limit-infoframes-v4-0-53fd0a65a4a2@oss.qualcomm.com>
 <20250909-drm-limit-infoframes-v4-9-53fd0a65a4a2@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha384;
	protocol="application/pgp-signature"; boundary="xkhodzl7phtwfggk"
Content-Disposition: inline
In-Reply-To: <20250909-drm-limit-infoframes-v4-9-53fd0a65a4a2@oss.qualcomm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250910_040833_874645_6633E21A 
X-CRM114-Status: GOOD (  19.49  )
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


--xkhodzl7phtwfggk
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH v4 09/10] drm/connector: verify that HDMI connectors
 support necessary InfoFrames
MIME-Version: 1.0

On Tue, Sep 09, 2025 at 05:52:07PM +0300, Dmitry Baryshkov wrote:
> Check that connector initialized by drmm_connector_hdmi_init() supports
> AVI InfoFrames and warn if it doesn't support Vendor-Specific
> InfofRames (HDMI InfoFrames are more or less required).
>=20
> Suggested-by: Maxime Ripard <mripard@kernel.org>
> Acked-by: Daniel Stone <daniels@collabora.com>
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> ---
>  drivers/gpu/drm/drm_connector.c | 7 +++++++
>  1 file changed, 7 insertions(+)
>=20
> diff --git a/drivers/gpu/drm/drm_connector.c b/drivers/gpu/drm/drm_connec=
tor.c
> index 92a75684a0f7375d3a94e8c666cb71064ecc8035..222a0ef66d9fdbdb56108ceeb=
40e7f369d810350 100644
> --- a/drivers/gpu/drm/drm_connector.c
> +++ b/drivers/gpu/drm/drm_connector.c
> @@ -602,6 +602,13 @@ int drmm_connector_hdmi_init(struct drm_device *dev,
>  	if (!(max_bpc =3D=3D 8 || max_bpc =3D=3D 10 || max_bpc =3D=3D 12))
>  		return -EINVAL;
> =20
> +	/* AVI is required */
> +	if (!(supported_infoframes & DRM_CONNECTOR_INFOFRAME_AVI))
> +		return -EINVAL;
> +
> +	if (!(supported_infoframes & DRM_CONNECTOR_INFOFRAME_VENDOR))
> +		drm_info(dev, "HDMI connector with no support for Vendor-Specific Info=
Frame\n");
> +

Same remark than on patch 10. It's not something we can check at init
time, and we should check (and document!) that if we expect an infoframe
to be written but the write_infoframe hook doesn't support it, it's an
error.

Maxime

--xkhodzl7phtwfggk
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iJUEABMJAB0WIQTkHFbLp4ejekA/qfgnX84Zoj2+dgUCaMFcLgAKCRAnX84Zoj2+
do1pAXoDY9Dzn6G/ClMn6Qt9h6baw0nSCc1SPEDOnOlKYoD9BSE05V70x5Sqi0rR
wJwIv2ABgME+k6f+wI13qd1Ah1huLB0li8xpIpRZTte9l8GEmuSdXIv2pGQJKmjF
/tLAINKY3g==
=JQzw
-----END PGP SIGNATURE-----

--xkhodzl7phtwfggk--

