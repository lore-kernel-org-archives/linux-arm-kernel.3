Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CB0F8CA5FA5
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 29 Sep 2026 12:35:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=SVS98uBuKLlulEgGUf4CF5N23plwVuHF1+58y7MeRw0=; b=Xph8bAeypMOBhKHpBVi7Qj5Pum
	wf1KRcFal2xizJ2UhszyoMkX0USSeaZi8KumY9ucCAhbtG7NjM2M/csYUH/Jrwva86yzJlHRXEGF6
	kVq/mVMx7sZTI7Sm9dIi3TJo66HqzMneKOyChmGEyf/0VUS93VUE544bCWssvf0Znrj+7yQ1eOOiq
	UPrO+8KrrtrVdSD5YvYYA+LkECd3lTBm0cF70VrukNsxqWimm0fRvHe+fuicLyi8N/+RsJf3lHjDs
	07q9S1KebVUXpfTu4uJ8IWW8o6GmpkHfqENK65y6OlvxF+FdzjUkWhtLPXAqFNl0Rw9jsR8RnEI2X
	QFwub+9A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBX3m-00000003YP5-3NkQ;
	Tue, 29 Sep 2026 12:35:50 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBX3l-00000003YOY-0YtV
	for linux-arm-kernel@lists.infradead.org;
	Tue, 29 Sep 2026 12:35:49 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 9A7B24149F;
	Tue, 29 Sep 2026 12:35:48 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 073811F000FF;
	Tue, 29 Sep 2026 12:35:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790685348;
	bh=SVS98uBuKLlulEgGUf4CF5N23plwVuHF1+58y7MeRw0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=kSao9Y6ZyIhIEhOL8deNeZES2JKLRtgBYjdkfGFmqEGINTsooFvBefZrTFwp3Wcm7
	 4380RM7ANERkudKmY9eMTcgvAKLzXUn/XtVJoklDsD2kbLyo1qLjSaXibrh3cfN/Cl
	 HADtSYF+ATgTwSmGVUyhxPlFXAVXBmoW719SBZoV9dTETNxDD3VMbb9mxCqvg/DBlC
	 L++cXq5zwu7FfVBlBTXpgCvhhpacZDSjpxJrbPxqCtDBRb891vI2ZvV6PT6Zpm1cMn
	 NPodJv18zgr3QM93urQuh9gXXsSlEQTWIMLkFGI5yJ5tBcEJ2Zwf0qxT+M5VH8xVbH
	 qGuvwvMxsQixQ==
Date: Tue, 29 Sep 2026 14:35:45 +0200
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
Subject: Re: [PATCH 5/7] drm/vc4: dpi: stop using deprecated
 drmm_of_get_bridge()
Message-ID: <aruwg3rk97RuI75G@houat>
References: <20260929-drm-fix-of_get_bridge-build-regression-v1-0-ccb7e602daad@bootlin.com>
 <20260929-drm-fix-of_get_bridge-build-regression-v1-5-ccb7e602daad@bootlin.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha384;
	protocol="application/pgp-signature"; boundary="gu4ry47i36m6y6ya"
Content-Disposition: inline
In-Reply-To: <20260929-drm-fix-of_get_bridge-build-regression-v1-5-ccb7e602daad@bootlin.com>
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


--gu4ry47i36m6y6ya
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Subject: Re: [PATCH 5/7] drm/vc4: dpi: stop using deprecated
 drmm_of_get_bridge()
MIME-Version: 1.0

On Tue, Sep 29, 2026 at 12:36:37PM +0200, Luca Ceresoli wrote:
> devm_drm_of_get_bridge() is deprecated, switch to
> of_drm_get_bridge_by_endpoint(). As of_drm_get_bridge_by_endpoint() returns
> a refcounted bridge, ensure it is put.

You didn't remove devm_drm_of_get_bridge but drmm_drm_of_get_bridge here

Maxime

--gu4ry47i36m6y6ya
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iJUEABMJAB0WIQTkHFbLp4ejekA/qfgnX84Zoj2+dgUCaruwoQAKCRAnX84Zoj2+
dhXFAX9+KeIOq/xb4GCdjfaVk97PHMNyuDv+YPaRJjRr9ci7wa6Mnd1jmeH173OC
EBavZnwBgJ6Vgs3vD6hzIFe0v11EyR4LeqnaRde5Ku4D5Zkir/3MpOhKIAxjopqG
7th5dz2hCA==
=7NDu
-----END PGP SIGNATURE-----

--gu4ry47i36m6y6ya--

