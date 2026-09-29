Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4E7D3CA5FA5
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 29 Sep 2026 12:36:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:Cc
	:References:In-Reply-To:Subject:To:From:Date:Message-ID:Reply-To:MIME-Version
	:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=4/DeA+1F0dIAEimi0AL0c99MVeNYvMd6hGnWDw1e/2k=; b=OaXK2g1Xz8pFTiud1R66Br9i61
	fV8CLSsyppl0cC2tT1GJH57GCQS6Y39i1lCok0NZiXrHIRP12KzRUn8Wb7G4us+OfcNTyEfDzum/0
	sZG/LTFLrCO4iSjF8yOTLQg/YqjjztWTCsmlg7KAxoiZQTe3osoXd+iF2b85f6IGeY1VRXS3GY/Wd
	BpqJKBCT5tokCkr+I+g8OlByW8yChHkS+QHj5Orng/we7Hmwe6I05v2uraeCKcbskFL2L35jWK6Ge
	rQuy3QyAkYrA8rF3K787jFLR/Qr0NvklIFkCHfIN4BeAO2Y1uxLFR2s+4M6dZ9fsaNSygYICDL+Ke
	HZVGDoQw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBX4X-00000003Yck-0Fpo;
	Tue, 29 Sep 2026 12:36:37 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBX4V-00000003Ybv-1ps3
	for linux-arm-kernel@lists.infradead.org;
	Tue, 29 Sep 2026 12:36:35 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id B9A02600D1;
	Tue, 29 Sep 2026 12:36:34 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E6B2B1F000FF;
	Tue, 29 Sep 2026 12:36:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790685394;
	bh=4/DeA+1F0dIAEimi0AL0c99MVeNYvMd6hGnWDw1e/2k=;
	h=Date:From:To:Subject:In-Reply-To:References:Cc;
	b=QYlm4a/7EhVMOiLvx7E76uLW9wUY0uqQq4dOcSPIUd8/3U6K1Rx4WymnX4LVZYc0M
	 5o5YdmUdwGBFQfie6KaQNfAYsmF/MerjaVxx+8joZVoC+FUj+FUlwWTHBVK+RZ5p4E
	 w8LQ5UUxLFCueFvyivPlxA0oPJh4mOHA8p+05dATnee7eNdVdTHyejFoAoa2OUfjp8
	 kN82QXLx0Y0NVH0UZZsIxtcTfPyyd9DxwAa1MidFuzRpWlajmjn81s92ve7vL9aeZX
	 0djPqpA/p/j9oTHCTXvagAY/94DKS/lNXjUEjEXvpYPn4dm++niiNeXT/Ji6snuLUo
	 ytAz7Z3evlKew==
Message-ID: <dfdc2f9f96e86d686ada0e826cc57d35@kernel.org>
Date: Tue, 29 Sep 2026 12:36:31 +0000
From: "Maxime Ripard" <mripard@kernel.org>
To: "Luca Ceresoli" <luca.ceresoli@bootlin.com>
Subject: Re: [PATCH 7/7] drm: renesas: shmobile: stop using deprecated
 devm_drm_of_get_bridge()
In-Reply-To: <20260929-drm-fix-of_get_bridge-build-regression-v1-7-ccb7e602daad@bootlin.com>
References: <20260929-drm-fix-of_get_bridge-build-regression-v1-7-ccb7e602daad@bootlin.com>
Cc: dri-devel@lists.freedesktop.org, imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, linux-renesas-soc@vger.kernel.org, "Andrzej
 Hajda" <andrzej.hajda@intel.com>, "Arnd Bergmann" <arnd@kernel.org>, "Dave
 Stevenson" <dave.stevenson@raspberrypi.com>, "David Airlie" <airlied@gmail.com>, "Doug
 Anderson" <dianders@chromium.org>, "Fabio Estevam" <festevam@gmail.com>, "Frank
 Li" <Frank.Li@nxp.com>, "Geert Uytterhoeven" <geert+renesas@glider.be>, "Hui
 Pu" <Hui.Pu@gehealthcare.com>, "Ian Ray" <ian.ray@gehealthcare.com>, "Icenowy
 Zheng" <zhengxingda@iscas.ac.cn>, "Jernej Skrabec" <jernej.skrabec@gmail.com>, "Jonas
 Karlman" <jonas@kwiboo.se>, "Laurent Pinchart" <Laurent.pinchart@ideasonboard.com>, "Maarten
 Lankhorst" <maarten.lankhorst@linux.intel.com>, "Maxime Ripard" <mripard@kernel.org>,
 =?utf-8?b?TWHDrXJhIENhbmFs?= <mcanal@igalia.com>, "Neil Armstrong" <neil.armstrong@linaro.org>, "Pengutronix
 Kernel Team" <kernel@pengutronix.de>, "Raspberry Pi Kernel Maintenance" <kernel-list@raspberrypi.com>, "Robert
 Foss" <rfoss@kernel.org>, "Sascha Hauer" <s.hauer@pengutronix.de>, "Simona
 Vetter" <simona@ffwll.ch>, "Thomas Petazzoni" <thomas.petazzoni@bootlin.com>, "Thomas
 Zimmermann" <tzimmermann@suse.de>
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

On Tue, 29 Sep 2026 12:36:39 +0200, Luca Ceresoli wrote:
> devm_drm_of_get_bridge() is deprecated, switch to
> of_drm_get_bridge_by_endpoint(). As of_drm_get_bridge_by_endpoint() retur=
ns
> a refcounted bridge, ensure it is put.
>=20
> drm_panel.h becomes unused, drop the include.
>=20
> [ ... ]

Acked-by: Maxime Ripard <mripard@kernel.org>

Thanks!
Maxime

