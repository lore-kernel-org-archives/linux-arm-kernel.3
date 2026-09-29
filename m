Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E2EF2CA5FA5
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 29 Sep 2026 12:36:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=9w0aozm5qgJf30Vwj4KT6E+5pKgTpxivdQWFVHn3Ht8=; b=XsMK2iUXuuG2wE4IehxIGwm9go
	cLNxIDwOuknNSJCYbXuRQSx+4eiamSMA/s+wY7r02ciwU1e8oKMlf8jghqV5BEDk6JDJgFmEXaAPl
	CkAqSTNvWdU6ryQIzSG/OFM/II5JrH+WRm2sKwgQTFu0MsPYr4Jgwk9EOYJjgyqtivdIz6zithwwr
	QoQMZXqmTBeNX6BZ+GSR9EGZ55WUQ2n4J2Xmc3Z1X+4forsFCt4UjGDr015baAvwCBfZrwtzU52nm
	CbfkHxC3kThxt2IYUvmmFSisYNx/7KAzTOUmE25Nh6Qb6XhFlSjdo2wnxTHKCNDNoVB1HtbP3S3GB
	kxbhyvPw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBX4G-00000003YXb-3ytJ;
	Tue, 29 Sep 2026 12:36:20 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBX4F-00000003YX5-47NN
	for linux-arm-kernel@lists.infradead.org;
	Tue, 29 Sep 2026 12:36:20 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id B21B840B0B;
	Tue, 29 Sep 2026 12:36:19 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2218A1F000FF;
	Tue, 29 Sep 2026 12:36:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790685379;
	bh=9w0aozm5qgJf30Vwj4KT6E+5pKgTpxivdQWFVHn3Ht8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=Cd3O9qHJmxwUhi4i+7IR55ITy66r8GNziuOt0YGVH+g0ZSRY9QdNSGBvAG8dh64MV
	 RzsRA+51SPSdlGW9t5ISeeNEcoERS2oyZEf39T/Bo7v/Kj9qHIwAHeOTEO1h5ajYUU
	 1zDxeoIkTfvjUKVI3rzkzhHcM6TsR3EskifPlnMi/32tVuRABqpSFKlx/yC68M688k
	 BzvHELFMDg2SNcCvlK8Ihk9THHsiZM3FGNNs4maZCEovZ3nwwFVKdbCAc9Dg21VgEe
	 0jf6ka1Ka71GnYoZ8zgRT6wVUE4vPeH8p4w8z9+Rl8Y/hDdFYYIwHCV+Dp3cxO6VXq
	 99/Im2stE6WgA==
Date: Tue, 29 Sep 2026 14:36:16 +0200
From: Maxime Ripard <mripard@kernel.org>
To: Luca Ceresoli <luca.ceresoli@bootlin.com>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
	Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, 
	Simona Vetter <simona@ffwll.ch>, Frank Li <Frank.Li@nxp.com>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>, 
	Fabio Estevam <festevam@gmail.com>, Icenowy Zheng <zhengxingda@iscas.ac.cn>, 
	Andrzej Hajda <andrzej.hajda@intel.com>, Neil Armstrong <neil.armstrong@linaro.org>, 
	Robert Foss <rfoss@kernel.org>, Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
	Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
	Dave Stevenson <dave.stevenson@raspberrypi.com>, =?utf-8?B?TWHDrXJh?= Canal <mcanal@igalia.com>, 
	Raspberry Pi Kernel Maintenance <kernel-list@raspberrypi.com>, Geert Uytterhoeven <geert+renesas@glider.be>, 
	Arnd Bergmann <arnd@kernel.org>, Doug Anderson <dianders@chromium.org>, 
	Hui Pu <Hui.Pu@gehealthcare.com>, Ian Ray <ian.ray@gehealthcare.com>, 
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>, dri-devel@lists.freedesktop.org, imx@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH 6/7] drm/vc4: dsi: stop using deprecated
 drmm_of_get_bridge()
Message-ID: <aruwsj4TFCUaLDjJ@houat>
References: <20260929-drm-fix-of_get_bridge-build-regression-v1-0-ccb7e602daad@bootlin.com>
 <20260929-drm-fix-of_get_bridge-build-regression-v1-6-ccb7e602daad@bootlin.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha384;
	protocol="application/pgp-signature"; boundary="366bc25sjkfcvxjo"
Content-Disposition: inline
In-Reply-To: <20260929-drm-fix-of_get_bridge-build-regression-v1-6-ccb7e602daad@bootlin.com>
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


--366bc25sjkfcvxjo
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH 6/7] drm/vc4: dsi: stop using deprecated
 drmm_of_get_bridge()
MIME-Version: 1.0

On Tue, Sep 29, 2026 at 12:36:38PM +0200, Luca Ceresoli wrote:
> devm_drm_of_get_bridge() is deprecated, switch to
> of_drm_get_bridge_by_endpoint(). As of_drm_get_bridge_by_endpoint() retur=
ns
> a refcounted bridge, ensure it is put by using bridge.next_bridge.
>=20
> drm_panel.h becomes unused, drop the include.
>=20
> Signed-off-by: Luca Ceresoli <luca.ceresoli@bootlin.com>

Same comment than on patch 5

Maxime

--366bc25sjkfcvxjo
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iJUEABMJAB0WIQTkHFbLp4ejekA/qfgnX84Zoj2+dgUCaruwwAAKCRAnX84Zoj2+
doCqAXwNORdzZPIAJhdGeMgzrt1jcoq6TB7Jj3M8ttuR805L87IJPshdr7ufUQDv
IwKfw/kBgNC2oDbRHWOcpJS92jCEDiGBBVlZSAuiKbn409qXb4YYDU6BxQ3XDhMo
+dWCOdA5mw==
=9j5F
-----END PGP SIGNATURE-----

--366bc25sjkfcvxjo--

