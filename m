Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2E1FFCD5BA6
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 19 May 2026 10:39:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=X+JiQ9ah3Zg0b42ga8MWBRYlO8NHJoM8q4bf6PzICZs=; b=MZBngNBCT/+F8/OnpznL2LozmL
	qiNxArjiFdvbohpQtJ6fJumIyDQxTXABBIlibzI+gjA1uB68aT5ygvHKh43SxTr7D8DEawK3qUJqg
	mSmNZ9U86kpnjQ1+BBST87/oBST/4tDr2BawltaYRC73WhlDTSsSMJfOyuFX+9WNJTCKC9jGHVjqp
	nilrjfzNPAlcRT5pjUc/k9xI9e5VXbAYsTogp0b5vTabxs7y4vviA+LDbyH7Z3jkEiC12QorPGsAj
	2Txz/cVBu2bqutoWadXefH5lWcinJ9/rFsgfrnoMRHjVwvPFQfpefsJ3+1hkZjcf9vyPcd5mCuSgR
	jprZYSkQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wPHrU-000000018mW-2U6K;
	Tue, 19 May 2026 10:39:44 +0000
Received: from smtpout-02.galae.net ([185.246.84.56])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wPHrK-000000018Zk-2mj6
	for linux-arm-kernel@lists.infradead.org;
	Tue, 19 May 2026 10:39:36 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 482381A3628;
	Tue, 19 May 2026 10:39:33 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 1B9D4606E9;
	Tue, 19 May 2026 10:39:33 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id E1F01107E8AE5;
	Tue, 19 May 2026 12:39:27 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1779187171; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=X+JiQ9ah3Zg0b42ga8MWBRYlO8NHJoM8q4bf6PzICZs=;
	b=ViIgPYrOdMaIUxl4rsKNrq8C+yslUUqrVKwjWnKL2ohmjs+1qBBlpZl2gzAKMY9GcKoCrm
	jP//QcpyRsQDZHyFNRiwjAn+7nIRRnvPYWGLlz+0auQ4bh2z/FTrY2943moaikGI+FGIuA
	Lz+qmrdRIBvZbN4Jf8WGuWadl65302xV1NR6+fHDwxgGwy06B0r1VG9H+vflq9oxZfW8WH
	2HDF3kw3WtXvoYtyG+WiSLj9myhaxrBzHXXsjz9rOvI9pjZIeZmUy3W+49mlXfMHv5lZVa
	LIlKglv0v+lO5V4pkypRNrb6UyeMfbYAnaAP5IroqO3guOkc1rFtatTIx2R1zQ==
From: Luca Ceresoli <luca.ceresoli@bootlin.com>
Date: Tue, 19 May 2026 12:37:37 +0200
Subject: [PATCH 20/37] drm/bridge: samsung-dsim: attach: return
 -EPROBE_DEFER is next bridge not yet available
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260519-drm-bridge-hotplug-v1-20-45e2bdb3dfb4@bootlin.com>
References: <20260519-drm-bridge-hotplug-v1-0-45e2bdb3dfb4@bootlin.com>
In-Reply-To: <20260519-drm-bridge-hotplug-v1-0-45e2bdb3dfb4@bootlin.com>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Andrzej Hajda <andrzej.hajda@intel.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, 
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Inki Dae <inki.dae@samsung.com>, Jagan Teki <jagan@amarulasolutions.com>, 
 Marek Szyprowski <m.szyprowski@samsung.com>, Marek Vasut <marex@denx.de>, 
 Stefan Agner <stefan@agner.ch>, Frank Li <Frank.Li@nxp.com>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>
Cc: Hui Pu <Hui.Pu@gehealthcare.com>, Ian Ray <ian.ray@gehealthcare.com>, 
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
 Luca Ceresoli <luca.ceresoli@bootlin.com>
X-Mailer: b4 0.15.2
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260519_033934_864867_1F9A6298 
X-CRM114-Status: GOOD (  11.75  )
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

When samsung_dsim_attach() is called but the next_bridge is not (yet)
known, it calls drm_bridge_attach() unconditionally. In turn
drm_bridge_attach() will return -EINVAL because the bridge pointer in
NULL. -EINVAL is propagated transparently to the caller, resulting in the
whole attach operation to fail.

This is fine for current use cases, but not when introducing for bridge
hotplug, which implies the next bridge could be hot-plugged later on.

In preparation to support bridge hotplug, consider the absence of a
next_bridge an -EPROBE_DEFER, not a hard error.

Signed-off-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
---
 drivers/gpu/drm/bridge/samsung-dsim.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/gpu/drm/bridge/samsung-dsim.c b/drivers/gpu/drm/bridge/samsung-dsim.c
index cefb20ec68ad..3c70a45c5dce 100644
--- a/drivers/gpu/drm/bridge/samsung-dsim.c
+++ b/drivers/gpu/drm/bridge/samsung-dsim.c
@@ -1828,6 +1828,9 @@ static int samsung_dsim_attach(struct drm_bridge *bridge,
 {
 	struct samsung_dsim *dsi = bridge_to_dsi(bridge);
 
+	if (!dsi->bridge.next_bridge)
+		return -EPROBE_DEFER;
+
 	return drm_bridge_attach(encoder, dsi->bridge.next_bridge, bridge,
 				 flags);
 }

-- 
2.54.0


