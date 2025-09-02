Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BB7EFCA100D
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  2 Sep 2025 19:11:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=XIirHbmhMXtXJvBragEAoA34vDbeRH+sFU2CxhY0avI=; b=ftxn5LgkNM60KvcTvDtG0p/52K
	a/pccfNE7AgXmUh3lUQf7eryxQDoA6DNiODOqI4VMZs+guR/p8u433vplT/tAfhHp2jP37lG2pMFV
	gnbALqVyaiSJHk21CWWAbLpmyj6O3G/PVUa4AN4IfGxbYFAVaM+IAd4HhmHQ3tDi9dYJQQCdiKFiw
	WXHpWY0jViuOKcvujGhsYy+EJ4q6bmB325bC+ysRXO9IYpI+PG/Az9RwZYUHvyw0tJILOJ6AdgRTY
	wnLlllLj+OubsdKjdmKAj4SJqNe5LclHBbTqVeD6iqLm8+iUwqN7Z4XY5ZeHq2qJehq91aKDP3F13
	bDF7/Mig==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1utWPJ-00000001brJ-2rve;
	Tue, 02 Sep 2025 19:11:05 +0000
Received: from smtpout-02.galae.net ([185.246.84.56])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1utR1L-0000000028k-3MOX
	for linux-arm-kernel@lists.infradead.org;
	Tue, 02 Sep 2025 13:26:01 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 68B1F1A0C84;
	Tue,  2 Sep 2025 13:25:58 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 3DFDD60695;
	Tue,  2 Sep 2025 13:25:58 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id B57261C22DE7E;
	Tue,  2 Sep 2025 15:25:31 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1756819557; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=XIirHbmhMXtXJvBragEAoA34vDbeRH+sFU2CxhY0avI=;
	b=p4oO/dYZqsjHaBWF2R21vdndofK8Rwq2ahC4NHgNBN6Na34iwePjcKiBJwIUyHrNgRN+jZ
	1/B9jHrL65yqpQ/iP6EkjTGV/X41XIZsFeLBAaLFx5RNpIFrysU+q8fYB6V7pZGgPrVheY
	8dsnqTVDZbE9WWVK070d8TJQ1C7t5msZwr4cK3f7GP4m5ruaNVvbepKHzW1+aGJ4u73Ds9
	rwaCTOnmgd+upmN8gFf+BZrb1xdC+UCYzMtJRiJm3QkrsiHVHs3H4UlSV/Ruykes0wEIJf
	Pa9eNBLaJSw7zNfTU2C+gQPjfR+vh7f7icL1DrcbR+E4LAk2cO0Ujjp3WLW+Tw==
From: Luca Ceresoli <luca.ceresoli@bootlin.com>
To: Andrzej Hajda <andrzej.hajda@intel.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, 
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Liu Ying <victor.liu@nxp.com>, Shawn Guo <shawnguo@kernel.org>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, 
 Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>, 
 Philipp Zabel <p.zabel@pengutronix.de>, 
 Luca Ceresoli <luca.ceresoli@bootlin.com>
Cc: Hui Pu <Hui.Pu@gehealthcare.com>, 
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>, 
 Andrew Morton <akpm@linux-foundation.org>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Zijun Hu <zijun.hu@oss.qualcomm.com>
In-Reply-To: <20250801-drm-bridge-alloc-getput-drm_bridge_get_next_bridge-v2-0-888912b0be13@bootlin.com>
References: <20250801-drm-bridge-alloc-getput-drm_bridge_get_next_bridge-v2-0-888912b0be13@bootlin.com>
Subject: Re: (subset) [PATCH v2 0/9] drm/bridge: get/put the bridge
 returned by drm_bridge_get_next_bridge()
Message-Id: <175681953112.353165.466531296795467773.b4-ty@bootlin.com>
Date: Tue, 02 Sep 2025 15:25:31 +0200
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.2
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250902_062559_981291_D740BF75 
X-CRM114-Status: UNSURE (   7.82  )
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


On Fri, 01 Aug 2025 19:05:22 +0200, Luca Ceresoli wrote:
> Note: the cover in v1 was mentioning by mistake
> drm_bridge_get_last_bridge() instead of drm_bridge_get_next_bridge().
>                ^^^^
> 
> This series adds drm_bridge_get/put() calls for DRM bridges returned by
> drm_bridge_get_next_bridge().
> 
> [...]

Applied, thanks!

[1/9] list: add list_last_entry_or_null()
      commit: cb86408b1fc2e3f6fe45ebe8509a5404060e01e0
[2/9] drm/bridge: add drm_bridge_chain_get_last_bridge()
      commit: d77ad5178e90f5aa4ce6085510b3b2f742abc5f0
[3/9] drm/bridge: imx93-mipi-dsi: use drm_bridge_chain_get_last_bridge()
      commit: 5849eff7f06709c98baa7989806165fe30bd0cbe
[4/9] drm/omapdrm: use drm_bridge_chain_get_last_bridge()
      commit: c3183f71c3f1f004a0ca0b84c45c40d8b84dce3d
[5/9] drm/bridge: add drm_bridge_is_last()
      commit: e4cedfd4f0fc839bb3c783d7e827e9755e1af5cf
[6/9] drm/display: bridge_connector: use drm_bridge_is_last()
      commit: 306734a1c76ce35fa613ea823a31ddbcdbf1eef5

Best regards,
-- 
Luca Ceresoli <luca.ceresoli@bootlin.com>


