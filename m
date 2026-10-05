Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 00733CA5FCE
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  5 Oct 2026 10:52:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ipPqkob72lwiICznw3iaHl72u9I6k7Y65KFgTyU2QgY=; b=NmG+E3G4n5onEd84Qm9LbR7dXt
	mmwH41mPuQU87wlDIetcvQrPnJjb0tYehqh67j7fwYn3qmNPfM5AfXPlBY2tWKRCGy1RSfXEnIvLg
	tAOvijNqw4Lw83zaAAETdgXl7IB2qFJPe99DFu2S2FLx/zfWfCgbpln6+d2kKw4YLnhLDFfhMW537
	WTvnBG/nt80ZrntgEJ4yCQRGoClHcq1TIaioRHtt3KKMK6IrsDxVRSfdqvLikalqI5IsT9mNTkFqE
	Fo8q7/kSzZ3xvqkkOlSX37TzJ4KWH4I+K788EvleFZqvnVvT1yZRZchyQfQmnGHLJXDnG5U87dZGr
	HQKTPpgw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xDgIj-0000000GEY5-3GU7;
	Mon, 05 Oct 2026 10:52:09 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xDgIi-0000000GEXz-1Foo
	for linux-arm-kernel@lists.infradead.org;
	Mon, 05 Oct 2026 10:52:08 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 67AF2600D4;
	Mon,  5 Oct 2026 10:52:07 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 675E01F000FF;
	Mon,  5 Oct 2026 10:52:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791197527;
	bh=ipPqkob72lwiICznw3iaHl72u9I6k7Y65KFgTyU2QgY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=PTNqbbtHgn2jLjA5N+bUnuG27HQLJUe9z/ekE0529Np6+e3GFepNzzvDRoLdgll4F
	 McV6RhaHn/BhB2+Tq/HSopC0dXf8PS3A2A11a18B/Sum08aGXWO7XPD8Q2Yu1hFGNl
	 vnXk0VkSFT29P1tOfFJ07XJPa4kug53ZnWPiYxgsPKKC5fgY4Sf5pbCr6n9waEQRhj
	 0jx/BaNQ5NoSHLHkCjg97ML4Na5gJF6/PwpJoAKHiSJBp8YhG7jrYd8HNXxL0U+jUL
	 /yllv2twSEXc0l88sIWJpsrAXDXqAdw0Ro+5TRww3Zfb7Ie3Z2AeYuWdiaK8MgxfFM
	 moqiLUI7GuyOw==
Date: Mon, 5 Oct 2026 11:52:00 +0100
From: Conor Dooley <conor@kernel.org>
To: Francesco Dolcini <francesco@dolcini.it>
Cc: Andrzej Hajda <andrzej.hajda@intel.com>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Robert Foss <rfoss@kernel.org>,
	Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
	Jonas Karlman <jonas@kwiboo.se>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Luca Ceresoli <luca.ceresoli@bootlin.com>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Frank Li <Frank.Li@nxp.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Francesco Dolcini <francesco.dolcini@toradex.com>,
	dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v2 1/4] dt-bindings: display: bridge: Add THine
 THC63LVD827
Message-ID: <asOBT9BYUHgtZHSl@squawk>
References: <20261005095006.20290-1-francesco@dolcini.it>
 <20261005095006.20290-2-francesco@dolcini.it>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="of/0ohSULi3F3TqY"
Content-Disposition: inline
In-Reply-To: <20261005095006.20290-2-francesco@dolcini.it>
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

--of/0ohSULi3F3TqY
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Acked-by: Conor Dooley <conor.dooley@microchip.com>
pw-bot: not-applicable

--of/0ohSULi3F3TqY
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iHUEARYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCasOBTwAKCRB4tDGHoIJi
0rwdAQDSpi5tpG2Muex4r3hjnkzBTH62ffvgnRxZL0zgijNWjQD/XndwmNAxYG0X
KdwDCKu4GpfeSUX1Vk+ZZN6d9WCobwc=
=a/zt
-----END PGP SIGNATURE-----

--of/0ohSULi3F3TqY--

