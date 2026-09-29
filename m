Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 21099CA5FA5
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 29 Sep 2026 12:33:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:Cc
	:References:In-Reply-To:Subject:To:From:Date:Message-ID:Reply-To:MIME-Version
	:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=FD30Hf4tvtRlOhi3ZD/pZkldTc7PRNkVxsM8QYaofPY=; b=38K211zSE5IVWblKwADJEm8qs3
	18uvBQliwMcIJ5VNMOtZZFoeu9wBnydvsUNCRHQDw8yTRBBN7HqUKL+JudfsW9HBCHqkBWY0pOD88
	HTheU2cTtyi1FvzT5IuIxmP6S/B3ZdklVNF1ARqQTX1g6bAYbpiMXs+hkW4Hhp8aQFM/oZGn1baCw
	xIPgzYTDLYyCsZe+eQTdcCuorwbnUtM5mD2lbwYp6JcQxLCX6W7PSCMUB57w5SE0Mwsl8EZn7kf7k
	NtkUJq2mQ+B6i0nAIsd+vkWcknadZp+yOgl87HmLr9lCyqURh0Rv1I//jjTsnFpjqQTR88BS5ZCxB
	WjB1WfRA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBX1m-00000003Xk3-0ZJX;
	Tue, 29 Sep 2026 12:33:46 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBX1k-00000003XjN-1fb3
	for linux-arm-kernel@lists.infradead.org;
	Tue, 29 Sep 2026 12:33:44 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id C9A5B41FD1;
	Tue, 29 Sep 2026 12:33:43 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 38EDF1F000FF;
	Tue, 29 Sep 2026 12:33:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790685223;
	bh=FD30Hf4tvtRlOhi3ZD/pZkldTc7PRNkVxsM8QYaofPY=;
	h=Date:From:To:Subject:In-Reply-To:References:Cc;
	b=LAl7W8CAanvxK2JbnSS59vy/6oHtMRILAYPk2wnD3UBrkiXBNhNX5WN+0y/HWopcz
	 Ek5c5deSqU2SoYhwvpwNXnHvCfi/I9D4zv+BsV0yq5k8JK4bfNhn/+e6yGvdFqsKev
	 0YPaDyARWYLhkZRCQBYavr7LBOHVvvOJVLHngwlfMsZ/i5WiGhXP9YL5y+yvk4apNj
	 i4i6CGdt1sv/YA1bsUAvl9/Awvp0ziQUqrxmj3H+ccHY7NyMuEXUndEYgtEDBKErXk
	 A04iI8d1x7SXFnT42MH5gYjhAURTtecoheQsdKb6aqCAh8gad7rvEaeBebElpB2S7E
	 OuUc65yJLsagQ==
Message-ID: <d6b673647ec1175d4c9ab112a47497b8@kernel.org>
Date: Tue, 29 Sep 2026 12:33:40 +0000
From: "Maxime Ripard" <mripard@kernel.org>
To: "Luca Ceresoli" <luca.ceresoli@bootlin.com>
Subject: Re: [PATCH 2/7] drm: verisilicon: stop using deprecated
 devm_drm_of_get_bridge()
In-Reply-To: <20260929-drm-fix-of_get_bridge-build-regression-v1-2-ccb7e602daad@bootlin.com>
References: <20260929-drm-fix-of_get_bridge-build-regression-v1-2-ccb7e602daad@bootlin.com>
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

On Tue, 29 Sep 2026 12:36:34 +0200, Luca Ceresoli wrote:
> devm_drm_of_get_bridge() is deprecated, switch to
> of_drm_get_bridge_by_endpoint(). As of_drm_get_bridge_by_endpoint() retur=
ns
> a refcounted bridge, ensure it is put by using bridge.next_bridge.
>=20
> Fixes build failure when CONFIG_OF is disabled.
>=20
> [ ... ]

Acked-by: Maxime Ripard <mripard@kernel.org>

Thanks!
Maxime

