Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6BFB2CA0EDC
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 20 Aug 2025 07:32:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=VUZK2MpAHgOKjVJ19+Bw5dSQafJ8hDSl6PCW3an6dGA=; b=sVrTBHDi6+EzK0fwNN/oiASRrE
	sPPVfDxel5MloI+3BPmzWpcjOl6OAyLSxoZJ8X1OAdUP/qmKZV3w3WjrnSAw3B1azskrk4klM51al
	sLr8w8GC3IO+YwISMEMIv9QgL0EXWzDL0wMDxLsHFBsh3slA1y6Gm0l3x5s/lJ/dEMnjDQ+velM/2
	c8m1l8W5gJG4eHUbUl+yYL0HPICJQaBpkgr8Gm13m/zOW5SwaD/DIO9KlADUF+jQPpIOboHncjZmF
	7lvkuH3ZuHL/hvuTyLYZXMeM5Wha45XzBAYPS+1IXQajHxY+jSylsGV61fWIxMjIsdcHiFAHKEMVR
	Kxzt0dtA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uodJE-0000000Cc5P-3d7Y;
	Wed, 20 Aug 2025 07:32:36 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uod2s-0000000CaHr-03YM;
	Wed, 20 Aug 2025 07:15:43 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 0516444CF2;
	Wed, 20 Aug 2025 07:15:40 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 56AD9C4CEEB;
	Wed, 20 Aug 2025 07:15:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1755674139;
	bh=VUZK2MpAHgOKjVJ19+Bw5dSQafJ8hDSl6PCW3an6dGA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=sx8dB9PeWGSZSptzXrYkdKAPu+omWGi87iV7Xw1hJgw/Wq5qWmFmk8M0JSXuBU50P
	 J7gY9snTH8/n7QZTUoeJCD2SySao8w30ErNueMapvrxBXavnb6r9uTnFkTgk/fzGob
	 jzoq894mOGpg3VKGvLwR26HV4oxvOp9dm0FEr440za8iUcIS53GrDersOBPgHj9N3J
	 s7UEYqcVLvDf5bVAvj8oUq1Sww8fhN+Szx2SaC+TBdqXzCtu6sygVFdGsyoPhu3qVm
	 IhZB81QfYdtuNGdt+6l07jQBL0Pj3+BVEt7yhMmHrsf4e3cUirEcp/++PBl12RCSFc
	 YuBfy7Vnl2Rzg==
Date: Wed, 20 Aug 2025 09:15:36 +0200
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
Subject: Re: [PATCH v2 1/8] drm/connector: let drivers declare infoframes as
 unsupported
Message-ID: <20250820-artichoke-silkworm-of-election-521b5e@houat>
References: <20250819-drm-limit-infoframes-v2-0-7595dda24fbd@oss.qualcomm.com>
 <20250819-drm-limit-infoframes-v2-1-7595dda24fbd@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha384;
	protocol="application/pgp-signature"; boundary="ovoxo52sdrhbbtrx"
Content-Disposition: inline
In-Reply-To: <20250819-drm-limit-infoframes-v2-1-7595dda24fbd@oss.qualcomm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250820_001542_092905_66DD86F4 
X-CRM114-Status: GOOD (  17.82  )
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


--ovoxo52sdrhbbtrx
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH v2 1/8] drm/connector: let drivers declare infoframes as
 unsupported
MIME-Version: 1.0

Hi,

On Tue, Aug 19, 2025 at 09:57:30PM +0300, Dmitry Baryshkov wrote:
> Currently DRM framework expects that the HDMI connector driver supports
> all infoframe types: it generates the data as required and calls into
> the driver to program all of them, letting the driver to soft-fail if
> the infoframe is unsupported. This has a major drawback on userspace
> API: the framework also registers debugfs files for all Infoframe types,
> possibly surprising the users when infoframe is visible in the debugfs
> file, but it is not visible on the wire.
>=20
> Let drivers declare that they support only a subset of infoframes,
> creating a more consistent interface.
>=20
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>

I'm not really convinced. Infoframes aren't really something you should
ignore, AVI is effectively mandatory, HDMI kind of is too, AUDIO is if
audio support is enabled, DRM is mandatory if HDR is used.

SPD is indeed optional though.

So, it's really dynamic in essence, and not really something we should
expect drivers to ignore.

I do acknowledge that a lot of drivers just silently ignore the
infoframes they don't support at the moment, which isn't great either.

Maybe we should standardize and document what drivers should do when
they don't support a given infoframe type?

Something like return EOPNOTSUPP if you don't support it, and we warn in
the core if we get one for a mandatory infoframe?

Maxime

--ovoxo52sdrhbbtrx
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iJUEABMJAB0WIQTkHFbLp4ejekA/qfgnX84Zoj2+dgUCaKV2FAAKCRAnX84Zoj2+
dqXvAX0bvYzEBhvkZZcbwX8EsIm26JAHz/mS0cz6qC9clfhYyvLbKY2RswgLRcH0
zdXoEXIBf1jm8cvKLzdlBWGxds9iQj9mYUOq/VxFsp7UhMYL7asc5mdt46fMCoym
hEIMma0gbA==
=7QRV
-----END PGP SIGNATURE-----

--ovoxo52sdrhbbtrx--

