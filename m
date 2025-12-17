Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9ED7AD6552C
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 17 Dec 2025 10:16:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:Cc
	:References:In-Reply-To:Subject:To:From:Date:Message-ID:Reply-To:MIME-Version
	:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=14N7+pYy72kfKgLZ+eBjOCn+SrYbkirrM1jMUhs1cHQ=; b=BM18+4WJ07TlEBjWm6yGddvqWr
	b3useXWbG+xYl+wp1S0K3ppQa+SDXzQp9c1tiPVsHIsRhKGDkzVWNjBMozVYNyOzPxu3y6+xgWxdZ
	xKzr9nUHzfcvznhCJRNYX1lplzMAyaJOsRSz+MRZKZ0v97T0YOvZv7HuRqlXRKWJEwlEIcHGx/k81
	dMxJL2zp2tJPKB6r95r4ddLJ1Cbiup7lEZGfRnwrx+4mnC3fcLhn/ZHQ1Q52pQkzdWcYxeVKP85+a
	AvMJb9g8TClECuS1i81pWj2LUZhFGOhugJL/CyeI3oPajarSqPNntx9xpVwcU4AFaeqPRHlNLIaLD
	SefHYV3A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vVoa1-00000006a2Y-145b;
	Wed, 17 Dec 2025 10:16:25 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vVoZz-00000006a1L-2pol;
	Wed, 17 Dec 2025 10:16:23 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 1BF966055B;
	Wed, 17 Dec 2025 10:16:23 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 45DA0C4CEF5;
	Wed, 17 Dec 2025 10:16:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1765966582;
	bh=14N7+pYy72kfKgLZ+eBjOCn+SrYbkirrM1jMUhs1cHQ=;
	h=Date:From:To:Subject:In-Reply-To:References:Cc:From;
	b=aO4cKOOVeefvLNc7CIcIB6uIcGA3BuF9GQzoKy8YZd8b2Y4g5nJG7VGIYtYX1RgJl
	 JtCo8irlnMdjj//V1tJESEEtgcwreO/bhOOE84u8Ntu9XqZw92P5hPXukEJKxtiLAv
	 oqyivM4O3SUfDmtimYCyNzvkYi/LxQrGOK/Wt4Vl+DOtQGKylSV3oiCYtzz4GU7V1B
	 aHi4qtO8bodJ7FZa7y1cSasyLx7CbX2x6gEmyA0QSXJzandD7d1JdaL5z0LQb+ReSx
	 6iMnJVp+NV9mw+hyfHBdymKVubU/pQ8ljPbc8lS/nTiWokbnOqar3D3bq0e+DMzan4
	 sZwiYbbCTfCCQ==
Message-ID: <bf2654046433c0f580bac440c3e72299@kernel.org>
Date: Wed, 17 Dec 2025 10:16:20 +0000
From: "Maxime Ripard" <mripard@kernel.org>
To: "Luca Ceresoli" <luca.ceresoli@bootlin.com>
Subject: Re: [PATCH v3 04/22] drm/bridge: make of_drm_find_bridge() a
 wrapper of of_drm_find_and_get_bridge()
In-Reply-To: <20251216-drm-bridge-alloc-getput-drm_of_find_bridge-v3-4-b5165fab8058@bootlin.com>
References: <20251216-drm-bridge-alloc-getput-drm_of_find_bridge-v3-4-b5165fab8058@bootlin.com>
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

On Tue, 16 Dec 2025 18:58:37 +0100, Luca Ceresoli wrote:
> of_drm_find_bridge() is identical to of_drm_find_and_get_bridge() except =
it
> does not increment the refcount. Rewrite it as a wrapper and put the brid=
ge
> being returned so the behaviour is still the same.
>=20
> Signed-off-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
>=20
> [ ... ]

Reviewed-by: Maxime Ripard <mripard@kernel.org>

Thanks!
Maxime

