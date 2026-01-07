Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 69169CFD640
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  7 Jan 2026 14:09:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:Cc
	:References:In-Reply-To:Subject:To:From:Date:Message-ID:Reply-To:MIME-Version
	:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=PZWDOBLRey6Z9yX+RyF83GqTHUzZPfvvBMqFhTb+pZg=; b=THvd4NzEXmRjupZ9fCS5hDqfSZ
	qgDi39LpOGZBlyzbRby2t3ilaH9DG3paJQZGxYYjmr2CaszoA/HnJhfNJ5CATD2JGYcQ/vJwcuFAw
	Wdpge6DO9DcQQ+TLZNLWwdLiIrqNyJgxKmjanG1HF6kwLWKyhtT8Umimv+0EndwocjuIyqpxO+Kc1
	5raLy4Oxfp4aNfjhVO1HPkf6TEBotJwqfL1ecUdkN477g3gMONsgwBB83LmlOUzixsxhwKieu15Gd
	LSBWVLT2T7kugft+cpEiF8ccLUWcbV9yP4uKCN2yIkPjTuFFrI3BjhTb9n4flN1LJFEPkSPN2L9Q7
	euyGmeAw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vdUDh-0000000F3jy-12M0;
	Wed, 07 Jan 2026 14:09:05 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vdUDg-0000000F3jn-11UB
	for linux-arm-kernel@lists.infradead.org;
	Wed, 07 Jan 2026 14:09:04 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 500DB60018;
	Wed,  7 Jan 2026 14:09:03 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4990DC4CEF1;
	Wed,  7 Jan 2026 14:09:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1767794942;
	bh=PZWDOBLRey6Z9yX+RyF83GqTHUzZPfvvBMqFhTb+pZg=;
	h=Date:From:To:Subject:In-Reply-To:References:Cc:From;
	b=GrPQ+prQOkX4BEgihC3kMMyG17wnhrSstZOLnQqhZ6YxGPgNVxNzO9jWwat+cRVab
	 YGij8q6a7bz/LWjIjWmcwvp6BWxpKKVc9XXYetlswpDBnQb4wbV0L1i7g2HW2ATEBW
	 KuzxcHzluA9oP5Vhbb2SsPp5J1X9cpdarnFrhtHopxt8scZm93r11XFzve7R35Luw8
	 7iSpo71PthPlVmkmcLOo5dQ8mIkp4hToG2zAP7+WoR/LQe2Hl8JX0i40O/AgTdSJH0
	 VYGGgVpsT90VnW0ypGc2ZqLlW5NW/xfnW2dze6eGtP5l5oaxfSJm2xPQK+GI40qTO9
	 8koUD5HgnSc9Q==
Message-ID: <af317ef80c6bf8e670df3d6dbabacdeb@kernel.org>
Date: Wed, 07 Jan 2026 14:09:00 +0000
From: "Maxime Ripard" <mripard@kernel.org>
To: "Luca Ceresoli" <luca.ceresoli@bootlin.com>
Subject: Re: [PATCH 10/12] drm/bridge: samsung-dsim:
 samsung_dsim_host_attach: use a temporary variable for the next bridge
In-Reply-To: <20260107-drm-bridge-alloc-getput-drm_of_find_bridge-2-v1-10-283d7bba061a@bootlin.com>
References: <20260107-drm-bridge-alloc-getput-drm_of_find_bridge-2-v1-10-283d7bba061a@bootlin.com>
Cc: benjamin.gaignard@linaro.org, dri-devel@lists.freedesktop.org, imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, "Adrien
 Grassein" <adrien.grassein@gmail.com>, "Andrzej Hajda" <andrzej.hajda@intel.com>, "David
 Airlie" <airlied@gmail.com>, "Fabio Estevam" <festevam@gmail.com>, "Hui Pu" <Hui.Pu@gehealthcare.com>, "Inki
 Dae" <inki.dae@samsung.com>, "Jagan Teki" <jagan@amarulasolutions.com>, "Jernej
 Skrabec" <jernej.skrabec@gmail.com>, "Jonas Karlman" <jonas@kwiboo.se>, "Laurent
 Pinchart" <Laurent.pinchart@ideasonboard.com>, "Liu Ying" <victor.liu@nxp.com>, "Maarten
 Lankhorst" <maarten.lankhorst@linux.intel.com>, "Marek Szyprowski" <m.szyprowski@samsung.com>, "Maxime
 Ripard" <mripard@kernel.org>, "Neil Armstrong" <neil.armstrong@linaro.org>, "Pengutronix
 Kernel Team" <kernel@pengutronix.de>, "Philippe Cornu" <philippe.cornu@st.com>, "Robert
 Foss" <rfoss@kernel.org>, "Sascha Hauer" <s.hauer@pengutronix.de>, "Shawn
 Guo" <shawnguo@kernel.org>, "Simona Vetter" <simona@ffwll.ch>, "Thomas
 Petazzoni" <thomas.petazzoni@bootlin.com>, "Thomas Zimmermann" <tzimmermann@suse.de>
Content-Transfer-Encoding: quoted-printable
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

On Wed, 7 Jan 2026 14:13:01 +0100, Luca Ceresoli wrote:
> In preparation to handle refcounting of the out_bridge, we need to ensure
> the out_bridge pointer contains either a valid bridge pointer or NULL, not
> an ERR_PTR. Otherwise calls such as drm_bridge_get/put() would try to
> redeference an ERR_PTR.
>=20
>=20
> [ ... ]

Acked-by: Maxime Ripard <mripard@kernel.org>

Thanks!
Maxime

