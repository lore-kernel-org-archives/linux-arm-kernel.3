Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 75F4DD31767
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  5 Nov 2024 16:42:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Wv8RLnV3c8HIlX+kxilB6A7abXGbvOCHWBSKQKuMP1Q=; b=diABsY798CYQj64DhiEYDRVXXX
	BoP1En/GjaokFWClaYLCmkSv8PSUc6UqOU2UzCerlVqi6QTo9zYfIE+H9Mt/ypzcRGiVWpS9YELpU
	eV2bioZbOPDdsr229Nyk8n60heOmUM1G3wrK2YNJToUgR1H4DgT1GlENcLct72Ha8jGfs5T/pu5Rl
	iqruXj4hZnpAHSz+J4+3Z71FvyXdSy7v3QnfU+OYVAToYDABLtB8RIhav22grlJIRTdFrNIYP2xdA
	7ofA76k+EYgIVKr+mJ2o6+aqvier63ni2Fx6/tVqQeerdWCrXJYWGfkXCzzSJGAoMqih19ntBCrc2
	WD8qNTdA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t8MdL-000000005Rf-2pxA;
	Tue, 05 Nov 2024 16:42:23 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t8MBP-0000000007j-0CVL
	for linux-arm-kernel@lists.infradead.org;
	Tue, 05 Nov 2024 16:13:32 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id B6774A42B8F;
	Tue,  5 Nov 2024 16:11:34 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E07BEC4CECF;
	Tue,  5 Nov 2024 16:13:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1730823209;
	bh=eSDIHL9Lx3jVJUWMPjnlix71KpWYWYL873yuyuGqT0w=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=cmUmzpkQx1/Q9DXUjX6qBSgVLuVoYrjwF7maZOnNTP8rntuCaih5cVAODKLgP9Xbx
	 Id6wrA4M1+sJJ2WctqX/t7/5OCTjNwoMHWGoIn1QxU6eeJYjMN4XVSEMLtiLq2o6nB
	 X6CKGQFei6HirQn0NHS0yRf2FTbNpy2rCxLVYnM3Pk+ukAYZnsaUruILjxVCMOxmHL
	 omX9drWCXTUEdVuzq8Zgft3AJdTsXqIguxqAilbQYBkfaIZxF0ZchCJdBGl2814h1Y
	 F+uZ6xxrw3ycJNUY5agKm0WxD883qreG94QfZBKxl7MDtdfTCRSRscfP/QrywxmrOm
	 zr78CgKSUV1Lw==
Date: Tue, 5 Nov 2024 17:13:26 +0100
From: Maxime Ripard <mripard@kernel.org>
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-media@vger.kernel.org, imx@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, Liu Ying <victor.liu@nxp.com>, andrzej.hajda@intel.com, 
	neil.armstrong@linaro.org, rfoss@kernel.org, Laurent.pinchart@ideasonboard.com, 
	jonas@kwiboo.se, jernej.skrabec@gmail.com, maarten.lankhorst@linux.intel.com, 
	tzimmermann@suse.de, airlied@gmail.com, simona@ffwll.ch, robh@kernel.org, 
	krzk+dt@kernel.org, conor+dt@kernel.org, quic_jesszhan@quicinc.com, 
	mchehab@kernel.org, shawnguo@kernel.org, s.hauer@pengutronix.de, 
	kernel@pengutronix.de, festevam@gmail.com, catalin.marinas@arm.com, will@kernel.org, 
	sakari.ailus@linux.intel.com, hverkuil@xs4all.nl, tomi.valkeinen@ideasonboard.com, 
	quic_bjorande@quicinc.com, geert+renesas@glider.be, arnd@arndb.de, nfraprado@collabora.com, 
	thierry.reding@gmail.com, prabhakar.mahadev-lad.rj@bp.renesas.com, sam@ravnborg.org, 
	marex@denx.de, biju.das.jz@bp.renesas.com
Subject: Re: (subset) [PATCH v5 00/13] Add ITE IT6263 LVDS to HDMI converter
 support
Message-ID: <20241105-secret-seriema-of-anger-7acfdf@houat>
References: <20241104032806.611890-1-victor.liu@nxp.com>
 <173080602214.231309.12977765173766280536.b4-ty@linaro.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha384;
	protocol="application/pgp-signature"; boundary="ttos2pb3wymv4mp7"
Content-Disposition: inline
In-Reply-To: <173080602214.231309.12977765173766280536.b4-ty@linaro.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241105_081331_188549_8CBB734D 
X-CRM114-Status: GOOD (  14.91  )
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


--ttos2pb3wymv4mp7
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: (subset) [PATCH v5 00/13] Add ITE IT6263 LVDS to HDMI converter
 support
MIME-Version: 1.0

On Tue, Nov 05, 2024 at 01:28:48PM +0200, Dmitry Baryshkov wrote:
> On Mon, 04 Nov 2024 11:27:53 +0800, Liu Ying wrote:
> > This patch series aims to add ITE IT6263 LVDS to HDMI converter on
> > i.MX8MP EVK.  Combined with LVDS receiver and HDMI 1.4a transmitter,
> > the IT6263 supports LVDS input and HDMI 1.4 output by conversion
> > function.  IT6263 product link can be found at [1].
> >=20
> > Patch 1 is a preparation patch to allow display mode of an existing
> > panel to pass the added mode validation logic in patch 3.
> >=20
> > [...]
>=20
> Applied to drm-misc-next, thanks!
>=20
> [04/13] media: uapi: Add MEDIA_BUS_FMT_RGB101010_1X7X5_{SPWG, JEIDA}
>         commit: 5205b63099507a84458075c3ca7e648407e6c8cc

Where's the immutable branch Laurent asked for?

Maxime

--ttos2pb3wymv4mp7
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iJUEABMJAB0WIQTkHFbLp4ejekA/qfgnX84Zoj2+dgUCZypEJgAKCRAnX84Zoj2+
dpfjAYCXCR61pzRZkuGkWB3Yv+7EqMH0dEZY3hO4ujeNE9k4Yn3LG2W7QlAouHUq
cGDO9t4BgPfRY/sKNRxOUREUKrW7wHa0QyC5uc8aFlYphEWapGbIqlEboX1Y6kAW
ANhpVKTYMw==
=83wB
-----END PGP SIGNATURE-----

--ttos2pb3wymv4mp7--

