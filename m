Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9D6E0CA101F
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 10 Sep 2025 11:03:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=UYWjKMF523Ekw7Bw98UkIXft7Kwx3TmgLpB7L6tfh5o=; b=LM6iLPK7nDEXoudjjS06gHWCrd
	ZYKJleccBoWhECs5qrWZYOx4a6UWSYfmEwztmdyR78Kd/s0wFQLaBtKEe1KDv4d70nbDoLK6TY7V7
	WbDoJRlHCNtdNQjvdQme+RmIpomaEXYvPXimcdezgZP5UmZbb1mi3sdB9/5i/ND7iTRb7k1B/q2cG
	RSgHGgd0oxrXfNOuMkaBBcigDU0YKyn+Ng6GfMWLdjXUJfW12Y6kwVDqotU7zr8TIwUVR6VPEf48z
	5kezqpD0P2vHVZ/wDgKyhOnpaF9vZR5cqQBChqYeUBch6OwZmhW5IFh4pkr+mJA8boujGxWlD0P3Q
	iwiCbsDQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uwIcC-0000000Dge8-2P4H;
	Wed, 10 Sep 2025 11:03:52 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uwIcB-0000000Dgdc-2cKz;
	Wed, 10 Sep 2025 11:03:51 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id D5200601A8;
	Wed, 10 Sep 2025 11:03:50 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F0E7DC4CEF0;
	Wed, 10 Sep 2025 11:03:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1757502230;
	bh=UYWjKMF523Ekw7Bw98UkIXft7Kwx3TmgLpB7L6tfh5o=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=m63mlDWZ7UyN+YkBriu39v3Ml8OZYHJ3sS5ToGI1uYGEV0tY8Mw311B0m7uz4rSAz
	 Mutosf2rsQjrnV5ZDOBgQIUu+tfNhSiBPAB+Q7vvxX4ETm3mdqOoQHSepfpTgIN2h8
	 zt+OLeR1dqvb/3HJUVjycOW1w3CtW88+vYJxpqvqlFhtr5LO08O71IdfjaF7lylFyb
	 BQsEeUwWcx11sL74qqXz85TbRe/47Qz2+SFz+UVY7RZ9fO2+vjbFXaGP44XfJVZM1n
	 EXkppE0EdiRuuC7kXQv6rxvJVAh2sd31GMdGiMm2lPL3Ee1+B1IH44xysygemd65Rr
	 eyHLSSxTHEr7Q==
Date: Wed, 10 Sep 2025 13:03:47 +0200
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
Subject: Re: [PATCH v4 01/10] drm/connector: let drivers declare infoframes
 as unsupported
Message-ID: <20250910-furry-singing-axolotl-9aceac@houat>
References: <20250909-drm-limit-infoframes-v4-0-53fd0a65a4a2@oss.qualcomm.com>
 <20250909-drm-limit-infoframes-v4-1-53fd0a65a4a2@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha384;
	protocol="application/pgp-signature"; boundary="3kg3zivfcuv2t4hc"
Content-Disposition: inline
In-Reply-To: <20250909-drm-limit-infoframes-v4-1-53fd0a65a4a2@oss.qualcomm.com>
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


--3kg3zivfcuv2t4hc
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH v4 01/10] drm/connector: let drivers declare infoframes
 as unsupported
MIME-Version: 1.0

On Tue, Sep 09, 2025 at 05:51:59PM +0300, Dmitry Baryshkov wrote:
> Currently DRM framework expects that the HDMI connector driver supports
> all infoframe types: it generates the data as required and calls into
> the driver to program all of them, letting the driver to soft-fail if
> the infoframe is unsupported. This has a major drawback on userspace
> API: the framework also registers debugfs files for all Infoframe types,
> possibly surprising the users when infoframe is visible in the debugfs
> file, but it is not visible on the wire. Drivers are also expected to
> return success even for unsuppoted InfoFrame types.
>=20
> Let drivers declare that they support only a subset of infoframes,
> creating a more consistent interface. Make the affected drivers return
> -EOPNOTSUPP if they are asked to program (or clear) InfoFrames which are
> not supported.
>=20
> Acked-by: Liu Ying <victor.liu@nxp.com>
> Acked-by: Daniel Stone <daniels@collabora.com>
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>

Again, I still believe that it's a bad idea, goes against what the spec
states, and the framework was meant to be.

So, no, sorry. That's still a no for me. Please stop sending that patch
unless we have a discussion about it and you convince me that it's
actually something that we'd need.

Maxime

--3kg3zivfcuv2t4hc
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iJUEABMJAB0WIQTkHFbLp4ejekA/qfgnX84Zoj2+dgUCaMFbEwAKCRAnX84Zoj2+
dkRzAYCzQpQA/Ir3LWPQqxuIKthe+HVoEPQaMUjRgX+Ula46AjgZs5sQpXIzARWP
HvEZaiABfRY0fHLOQ/3ITnlioCgiECUTHWtXvwzwkeZPy/td6Zv8anX5A/E13TVJ
iH3N5Vfh4A==
=wXjx
-----END PGP SIGNATURE-----

--3kg3zivfcuv2t4hc--

