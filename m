Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6751CC44525
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 21 Jan 2026 13:10:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=wZQftdk2nD+KUg1koynnm115h0ip7JWIlzvZWrt2KVA=; b=XyWp637K1zoWx6s2QnUzxQHGd+
	4dQF4G4bc7HjVt7UPJaL32USfhTW3/90tCPCdPhvoeoDTbDCRaLEp0yBhFmCLG7XCcBcPr4R17phO
	yK6t/tvEm4xibNnJpN7+sm9PCHpHW3QCROhcVVqbJ4xT98GY9CvcDP3lB18ymkKIq3CUViyPmYUnO
	qLyqBBcebBZ8oZ16nttAWcgjip4c80jzcIAkU5Cr4jZeflUOJDXrj9l7HsTT+HpN1bZg2fj9b2dzp
	ToZ4Mi5LmjfNJlF2lQcMLP0nPApELzYSy0lGwbVCHOxLN+0FkohXmhQfoDs11i8p4iTvlvD47az1C
	Tgzka1JA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1viXy9-00000005TeF-3D7u;
	Wed, 21 Jan 2026 13:09:57 +0000
Received: from smtpout-02.galae.net ([185.246.84.56])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1viXy6-00000005Tcw-1dHP
	for linux-arm-kernel@lists.infradead.org;
	Wed, 21 Jan 2026 13:09:57 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 263A21A2994;
	Wed, 21 Jan 2026 13:09:49 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id E831E6070A;
	Wed, 21 Jan 2026 13:09:48 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id C1864119B12B0;
	Wed, 21 Jan 2026 14:09:35 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1769000986; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=wZQftdk2nD+KUg1koynnm115h0ip7JWIlzvZWrt2KVA=;
	b=y60xwBm3xBqZIT8UiYIEJC1jmdN8HJp50cHs3G3ihI5ZArfnGhhrDedj2MG09NvX+QDlQX
	upp0ldCVvnWrEUjJvZvWNWKylSt1StNKVf4xwz58pIChVXAs1jOd6c9DZKq+W1K34lsE9g
	//T7Ds7Mv74Xu/O+cc4S5vJn1tUFJ/575ztvoEjJm3J2Csz8vdr5SOEk5nawaVwhwzf7m0
	AML5lo5TXHe6QOVd+hlDkDYvp5/oqwOh/TW7bZQcLCwod2zaw5CoFmhRd+I3kB4EJWMDot
	HOA/Lx1NGRnjvTnTln6ZLrP6ZWSsFCJv/uCjkTCWpinzCFD1A7hA1gsnoxcqFQ==
From: Luca Ceresoli <luca.ceresoli@bootlin.com>
To: Andrzej Hajda <andrzej.hajda@intel.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, 
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>, 
 Philipp Zabel <p.zabel@pengutronix.de>, Shawn Guo <shawnguo@kernel.org>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, Chun-Kuang Hu <chunkuang.hu@kernel.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Inki Dae <inki.dae@samsung.com>, Seung-Woo Kim <sw0312.kim@samsung.com>, 
 Kyungmin Park <kyungmin.park@samsung.com>, 
 Krzysztof Kozlowski <krzk@kernel.org>, 
 Alim Akhtar <alim.akhtar@samsung.com>, 
 Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>, 
 Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>, 
 Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>, 
 Geert Uytterhoeven <geert+renesas@glider.be>, 
 Magnus Damm <magnus.damm@gmail.com>, 
 Luca Ceresoli <luca.ceresoli@bootlin.com>
Cc: Marek Szyprowski <m.szyprowski@samsung.com>, 
 Hui Pu <Hui.Pu@gehealthcare.com>, 
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 linux-amlogic@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
 imx@lists.linux.dev, linux-mediatek@lists.infradead.org, 
 linux-samsung-soc@vger.kernel.org, linux-renesas-soc@vger.kernel.org
In-Reply-To: <20260109-drm-bridge-alloc-getput-drm_of_find_bridge-3-v2-0-8d7a3dbacdf4@bootlin.com>
References: <20260109-drm-bridge-alloc-getput-drm_of_find_bridge-3-v2-0-8d7a3dbacdf4@bootlin.com>
Subject: Re: [PATCH v2 0/6] drm/bridge: convert users of
 of_drm_find_bridge(), part 3
Message-Id: <176900097537.2193756.17458623342246187982.b4-ty@bootlin.com>
Date: Wed, 21 Jan 2026 14:09:35 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.3
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260121_050954_779908_0EA851A9 
X-CRM114-Status: UNSURE (   9.23  )
X-CRM114-Notice: Please train this message.
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


On Fri, 09 Jan 2026 11:02:49 +0100, Luca Ceresoli wrote:
> This series converts many DRM drivers from the now deprecated
> of_drm_find_bridge() to its replacement of_drm_find_and_get_bridge() which
> allows correct bridge refcounting. Where applicable it also converts
> per-driver "next_bridge" pointers to the unified drm_bridge::next_bridge
> which puts the reference automatically on bridge deallocation.
> 
> This is part of the work to support hotplug of DRM bridges. The grand plan
> was discussed in [0].
> 
> [...]

Applied, thanks!

[1/6] drm/bridge: dw-hdmi: convert to of_drm_find_and_get_bridge()
      commit: 4e7fd5aa3f3939dfcd8b0578de57f1cc00d6c31c
[2/6] drm/meson/dw-hdmi: convert to of_drm_find_and_get_bridge()
      commit: 9afbf7a9cce584e3ce7b709ea5654f2721b00694
[3/6] drm/imx/dw-hdmi: convert to of_drm_find_and_get_bridge()
      commit: 6dfebeee296cbb3296f06c28f3b2d053ec8374e7
[4/6] drm/mediatek: mtk_hdmi*: convert to of_drm_find_and_get_bridge()
      commit: 4ace6fbcd25f5ef275c91b93424e715f96197e50
[5/6] drm/exynos: hdmi: convert to of_drm_find_and_get_bridge()
      commit: 2db0d298f22d685e0c9f7f66ab6470f12a0255b6
[6/6] drm: rcar-du: lvds: convert to of_drm_find_and_get_bridge()
      commit: 95d628c9e4738c070ba780488efbab894e583646

Best regards,
-- 
Luca Ceresoli <luca.ceresoli@bootlin.com>


