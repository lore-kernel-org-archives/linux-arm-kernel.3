Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 035FAD65526
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 17 Dec 2025 10:15:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:Cc
	:References:In-Reply-To:Subject:To:From:Date:Message-ID:Reply-To:MIME-Version
	:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=skfOYgfAuvLlvVFtYXO0nED04VoALMEVUW5taGZIDUg=; b=0Bu0Rs2CXYriTAPX8FfLAFKiN8
	Yf205gQxHBuhj/otp2BVB+uVVb1EAtWcpuAsUI0tpVI2aubT4aR3cKiJ+8pgvNbQBbsD5hcxK54PO
	yniBoRntGIYMWOOCICvZB5eSFw5gYg8IDiTSvvsZFd7v4rni/GKyQ6yFMc5f/Vv1UhJhM+7napc31
	y/XYK1eAEl2e2ULlioB9kU+pIFfWyAzoEarXHN8Vd6biXXTdYk6I1TJUvBOfgxCe3hADUVo8RVzOh
	LJoQRbI1tTTII3oRO7Yyzo9ui8uu+WYzAjqNZsvCaPXy6Eqg+34aHl3W1wugWIVKI3TTshM1jV4XT
	0nOzEjCw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vVoZF-00000006ZSJ-15Jl;
	Wed, 17 Dec 2025 10:15:37 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vVoZC-00000006ZNz-0eCY;
	Wed, 17 Dec 2025 10:15:34 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 97DF26055A;
	Wed, 17 Dec 2025 10:15:31 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C07F6C4CEF5;
	Wed, 17 Dec 2025 10:15:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1765966531;
	bh=skfOYgfAuvLlvVFtYXO0nED04VoALMEVUW5taGZIDUg=;
	h=Date:From:To:Subject:In-Reply-To:References:Cc:From;
	b=Nz6p3DZzkqG8H4Nvbd2AHyWRx3TWgtrkGHCbG7nJP/yZ7YpQbUQ4sScJ0axpFSM76
	 N3I04sjA4YLG+NMnOi+SoQIqDF1B4dY/9PK8lKk7/0Ac6Kknuhe3HgXPUfh1dMkWaL
	 gGtES1r559SgmtcLu2EFp2cMk2ewcqkb19tBrfbdgplxNfF+Y9Pf1SbaPVem2zSlaP
	 rRBieyJeZ4v6dRrrqHwDQZDFBOJQdzqi9c/tID5E3JhRqWUOg026uwBdbq6QPX5GKc
	 p8HKcRIw2JDAKvrK23Ukl+qpfo+Ew8yzKm60eggM9XvyoV4GM2kJUpBxmyM6Rv6pA2
	 udWFcrUaXyBwg==
Message-ID: <0ba037c65f9cadd51082abf2b7857ba7@kernel.org>
Date: Wed, 17 Dec 2025 10:15:28 +0000
From: "Maxime Ripard" <mripard@kernel.org>
To: "Luca Ceresoli" <luca.ceresoli@bootlin.com>
Subject: Re: [PATCH v3 01/22] drm/bridge: add of_drm_find_and_get_bridge()
In-Reply-To: <20251216-drm-bridge-alloc-getput-drm_of_find_bridge-v3-1-b5165fab8058@bootlin.com>
References: <20251216-drm-bridge-alloc-getput-drm_of_find_bridge-v3-1-b5165fab8058@bootlin.com>
Cc: dri-devel@lists.freedesktop.org, imx@lists.linux.dev, linux-amlogic@lists.infradead.org, linux-arm-kernel@lists.infradead.org, linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, "Alexey
 Brodkin" <abrodkin@synopsys.com>, "Andrzej Hajda" <andrzej.hajda@intel.com>, "David
 Airlie" <airlied@gmail.com>, "Fabio Estevam" <festevam@gmail.com>, "Hui Pu" <Hui.Pu@gehealthcare.com>, "Jernej
 Skrabec" <jernej.skrabec@gmail.com>, "Jerome Brunet" <jbrunet@baylibre.com>, "Jonas
 Karlman" <jonas@kwiboo.se>, "Jonathan Corbet" <corbet@lwn.net>, "Kevin
 Hilman" <khilman@baylibre.com>, "Laurent Pinchart" <Laurent.pinchart@ideasonboard.com>, "Liu
 Ying" <victor.liu@nxp.com>, "Maarten Lankhorst" <maarten.lankhorst@linux.intel.com>, "Martin
 Blumenstingl" <martin.blumenstingl@googlemail.com>, "Maxime Ripard" <mripard@kernel.org>, "Neil
 Armstrong" <neil.armstrong@linaro.org>, "Pengutronix Kernel Team" <kernel@pengutronix.de>, "Phong
 LE" <ple@baylibre.com>, "Robert Foss" <rfoss@kernel.org>, "Sascha Hauer" <s.hauer@pengutronix.de>, "Shawn
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

On Tue, 16 Dec 2025 18:58:34 +0100, Luca Ceresoli wrote:
> of_drm_find_bridge() does not increment the refcount for the returned
> bridge, but that is required now. However converting it and all its users
> is not realistically doable at once given the large amount of (direct and
> indirect) callers and the complexity of some.
>=20
>=20
> [ ... ]

Reviewed-by: Maxime Ripard <mripard@kernel.org>

Thanks!
Maxime

