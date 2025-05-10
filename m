Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BD5C4C3ABCB
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 10 May 2025 09:14:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:Cc
	:References:In-Reply-To:Subject:To:From:Date:Message-ID:Reply-To:MIME-Version
	:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=qVqQPbhYwA9CnEWX7OYZ4feEjaspab26r13ottr7JkE=; b=4zAbeqo/pfltengKUmn62aCYGw
	fXOzhqvPLwuEFDdjGu//tnjmTmczhNltzfiXtDz4xRJWizPWofjQuLRXuAOUeIcXQlg7QbDtPWAZz
	EXTSX+2lIWkOpYHprn04ZDjtdxudSM5olyxvRgbQ6K4bMW2g+fBrFnm2Vnc99K4Q5qGoYlMc/uSYZ
	iTzBlQq4eFtV/yKhu7Bt5W3oT7dXN4+WNk6lV29MaJu8UZ/fMNZOefPCzEXyl442TJcU52KGTbSqz
	/7Xf1RP/M2z2w5ykPT+zERqQTFvgNRVt7mp0aySRAAGr7NTCRmKlu72zqjPkG0GoPS3RzPctDOlOF
	aOv4bONQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uDgI5-00000005iwB-3d2N;
	Sat, 10 May 2025 09:14:41 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uDg1D-00000005hBf-0yd0;
	Sat, 10 May 2025 08:57:15 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id A70E9614BA;
	Sat, 10 May 2025 08:57:14 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AAA6BC4CEE2;
	Sat, 10 May 2025 08:57:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1746867434;
	bh=qVqQPbhYwA9CnEWX7OYZ4feEjaspab26r13ottr7JkE=;
	h=Date:From:To:Subject:In-Reply-To:References:Cc:From;
	b=rhVEDlov9L+J/r108NFtXKxeB4Pdlq7LP7iEEVZptGdLYzku0Bbmh1m1tvQBo7nEp
	 wDKYBpOeab+wcGAYTRXEb7zypfMas/HEeqG8wIkhUsv8ZM5S35Aa8G18k1eattrowv
	 CtZ0iaNEDT50f7W+bNUjDL54h+N7lX1iCZsqyUb2y6dFLzuWELt+CxYUY/ZUg6lSpf
	 bJ625ZD91408z4uBsWHbe8T4/xEvzVun354YFwfd+Ch4lJfWuCJeonn/JsIEcE5waz
	 xGDNV83Jpuk6dW4Z02RWrtD1RLj/grawNxsIk4mBJylMFNkBXNuHij3Fltg1czl9J1
	 sacUKeF0HCs9A==
Message-ID: <b9d480ecdb95f59b7e9f0af7694800ef@kernel.org>
Date: Sat, 10 May 2025 08:57:11 +0000
From: "Maxime Ripard" <mripard@kernel.org>
To: "Luca Ceresoli" <luca.ceresoli@bootlin.com>
Subject: Re: [PATCH v3 16/22] drm/sti: dvo: convert to
 devm_drm_bridge_alloc() API
In-Reply-To: <20250509-drm-bridge-convert-to-alloc-api-v3-16-b8bc1f16d7aa@bootlin.com>
References: <20250509-drm-bridge-convert-to-alloc-api-v3-16-b8bc1f16d7aa@bootlin.com>
Cc: asahi@lists.linux.dev, chrome-platform@lists.linux.dev, dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org, imx@lists.linux.dev, linux-amlogic@lists.infradead.org, linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org, linux-renesas-soc@vger.kernel.org, linux-samsung-soc@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com, platform-driver-x86@vger.kernel.org, "Alain
 Volmat" <alain.volmat@foss.st.com>, "Andrzej Hajda" <andrzej.hajda@intel.com>, "Anusha
 Srivatsa" <asrivats@redhat.com>, "Chun-Kuang Hu" <chunkuang.hu@kernel.org>, "David
 Airlie" <airlied@gmail.com>, "Dmitry Baryshkov" <lumag@kernel.org>, "Douglas
 Anderson" <dianders@chromium.org>, "Fabio Estevam" <festevam@gmail.com>, "Hui
 Pu" <Hui.Pu@gehealthcare.com>, "Jagan Teki" <jagan@amarulasolutions.com>, "Jernej
 Skrabec" <jernej.skrabec@gmail.com>, "Jonas Karlman" <jonas@kwiboo.se>, "Krzysztof
 Kozlowski" <krzk@kernel.org>, "Laurent Pinchart" <Laurent.pinchart@ideasonboard.com>, "Maarten
 Lankhorst" <maarten.lankhorst@linux.intel.com>, "Maxime Ripard" <mripard@kernel.org>, "Neil
 Armstrong" <neil.armstrong@linaro.org>, "Paul Kocialkowski" <paulk@sys-base.io>, "Pengutronix
 Kernel Team" <kernel@pengutronix.de>, "Raphael Gallais-Pou" <rgallaispou@gmail.com>, "Robert
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

On Fri, 9 May 2025 15:53:42 +0200, Luca Ceresoli wrote:
> This is the new API for allocating DRM bridges.
>=20
> This driver allocates the DRM bridge separately from the main driver
> private struct, which prevents using the new devm_drm_bridge_alloc()
> API. Simplify the code by replacing the struct drm_bridge pointer with an
>=20
> [ ... ]

Acked-by: Maxime Ripard <mripard@kernel.org>

Thanks!
Maxime

