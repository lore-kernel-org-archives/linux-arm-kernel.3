Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0BD4CCA0FF0
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  1 Sep 2025 07:59:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=X0M56TQQKT66YhMAappWdIDmvOf+0t3XdUIC1iA8FMQ=; b=LBVeCR7tJU99qnoP5mAxdcrODd
	xPoAyNpmm2ur1ZU7j5kHjBrlfneQUIfUuvO9dX04RTbB8GG8XOPSNH7ClrYxfE5kqU6J+wJu0s9HS
	pzEvOKGeqmsaaBjd880swh6eV7KG9HIgtGfW21U4FD1YY5D599GbNBkkXgfg8pH5D3Zd+C3cVyNDL
	iLglwiKmdZYu6wUPJUg8qDgD3kVCRKV6stK59zXUH+jQYI3rFV3rghQNY2scnbM7oayXTy678B7lO
	oZUdGvJeK1NrAqb4H4nufnvs3fEOfWO1eVQZzabOl6iXKud1rKeFmX6qAIKQ+C3m8g7fZc4I7E/tZ
	3VY3og3w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uszS5-0000000BVWf-270r;
	Mon, 01 Sep 2025 07:59:45 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1usyig-0000000BPsD-0jLH;
	Mon, 01 Sep 2025 07:12:51 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 88BDB43627;
	Mon,  1 Sep 2025 07:12:48 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E41B7C4CEF0;
	Mon,  1 Sep 2025 07:12:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1756710768;
	bh=sqbENlpFH5Ccvd/AgXy87AdCw0HQL2r94DTlakLOXkE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=qvRDcRrJ3D2orbIXD7WnuTXHeCCjdEyWTuDs2ehGvhH6g092TdwffObCqw6c3uPLj
	 /LyQnIM2gYrkY8DFOfIK0y8o9dXYqaB/y6NMyGkRxKvMlT3K9spwFFMDYRtxMCKJej
	 1wrFpvr9L++WHzsNl28uYkEvkhaQTo3ziwnt7z0yMtJCHEWdaOMCxn8TX4Jvo9oQPX
	 fYB3jIhQEdxqsmSzY+6qM25gbImIAMBuY2woXO5cFVs9o3SpRem6K0tuRgzRzeu/NI
	 DR/Ca/K5KgS2GLJQRe0egTW1bfKVOFXUd2fX+2D36zBgNZ0ccw7or48CslrIcmF8Or
	 A5QRwxc+l8WBw==
Date: Mon, 1 Sep 2025 09:12:45 +0200
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
	linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org
Subject: Re: [PATCH v3 02/11] drm/bridge: adv7511: declare supported
 infoframes
Message-ID: <20250901-tidy-auburn-tarsier-e7b1e7@houat>
References: <20250830-drm-limit-infoframes-v3-0-32fcbec4634e@oss.qualcomm.com>
 <20250830-drm-limit-infoframes-v3-2-32fcbec4634e@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha384;
	protocol="application/pgp-signature"; boundary="pqxavipok3t73ium"
Content-Disposition: inline
In-Reply-To: <20250830-drm-limit-infoframes-v3-2-32fcbec4634e@oss.qualcomm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250901_001250_257435_EC0BCFD0 
X-CRM114-Status: GOOD (  16.34  )
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


--pqxavipok3t73ium
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH v3 02/11] drm/bridge: adv7511: declare supported
 infoframes
MIME-Version: 1.0

On Sat, Aug 30, 2025 at 03:22:58AM +0300, Dmitry Baryshkov wrote:
> Declare which infoframes are supported via the .hdmi_write_infoframe()
> interface. Audio infoframe is handled separately.
>=20
> Reviewed-by: Liu Ying <victor.liu@nxp.com>
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> ---
>  drivers/gpu/drm/bridge/adv7511/adv7511_drv.c | 10 ++++++++--
>  1 file changed, 8 insertions(+), 2 deletions(-)
>=20
> diff --git a/drivers/gpu/drm/bridge/adv7511/adv7511_drv.c b/drivers/gpu/d=
rm/bridge/adv7511/adv7511_drv.c
> index 26f8ef4824235a9a85b57a9a3a816fe26a59e45c..fe30567b56b4f600683f0545e=
d270665e692b12c 100644
> --- a/drivers/gpu/drm/bridge/adv7511/adv7511_drv.c
> +++ b/drivers/gpu/drm/bridge/adv7511/adv7511_drv.c
> @@ -904,7 +904,7 @@ static int adv7511_bridge_hdmi_clear_infoframe(struct=
 drm_bridge *bridge,
>  		break;
>  	default:
>  		drm_dbg_driver(adv7511->bridge.dev, "Unsupported HDMI InfoFrame %x\n",=
 type);
> -		break;
> +		return -EOPNOTSUPP;
>  	}
> =20
>  	return 0;
> @@ -938,7 +938,7 @@ static int adv7511_bridge_hdmi_write_infoframe(struct=
 drm_bridge *bridge,
>  		break;
>  	default:
>  		drm_dbg_driver(adv7511->bridge.dev, "Unsupported HDMI InfoFrame %x\n",=
 type);
> -		break;
> +		return -EOPNOTSUPP;

We do need to document that it's what drivers must return though.

Maxime

--pqxavipok3t73ium
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iJUEABMJAB0WIQTkHFbLp4ejekA/qfgnX84Zoj2+dgUCaLVHbQAKCRAnX84Zoj2+
dt3KAX0ZWp21D5I1WfwgyhTb7vH2ZBY8xOTpHJNqK0/JL81whZT+fJo0wz4+NRJx
iBLn7D4BfRsIiD6leCOIITTZsJxThT9rcAz5duWccxLZ5gpctOvKi1BZ0t0qCcPY
yc40IvF47Q==
=adUS
-----END PGP SIGNATURE-----

--pqxavipok3t73ium--

