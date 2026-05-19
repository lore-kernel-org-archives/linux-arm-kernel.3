Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6BD5FCD4851
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 19 May 2026 10:41:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=rgVp93a1hHl6rSGJFgiMk/ReFa5XUVMfUAt1b53bH5w=; b=Rzhh72GAly4IGxqzGaHDw3lQKY
	VQjEr5MWq3Pt4JXobthyEgYivPlD7+f8RN6aCI4CVmUDAy755BOK7YRSld0uTlK/+V0qKagkLuxcJ
	eN69rbiAi0gUWa6gETCcZXAfYt+kvw0A84VfX0Cbl+dyGjwDHZtqrG2fNjKE7VLuh/hWeHAGYGbXe
	hgDcClMsQ9Yg0wfZoucehq89K6yZfP6K4BTIIGSd3vzIc5fgBffsHvBxA+DCQAWwJQlGT/2WmpD5E
	VBfNVgJCsX67iAm2iQ34dakfEz+86VjI38XT79BLwnNnb7skxaa5wZARvtY/7wA6+vgOarbffBj63
	l8d5/qpA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wPHsw-00000001ASX-1rHt;
	Tue, 19 May 2026 10:41:14 +0000
Received: from smtpout-04.galae.net ([185.171.202.116])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wPHsP-000000019uf-17jW
	for linux-arm-kernel@lists.infradead.org;
	Tue, 19 May 2026 10:40:46 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id 6FB0EC2B9E9;
	Tue, 19 May 2026 10:41:32 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 457F5606E9;
	Tue, 19 May 2026 10:40:39 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 0FFE3107E8AF0;
	Tue, 19 May 2026 12:40:33 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1779187237; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=rgVp93a1hHl6rSGJFgiMk/ReFa5XUVMfUAt1b53bH5w=;
	b=Ca/rGiQg938bz1xHEi3N1mdoEG0gO/+dhsaW5WudwhKrLxZKtdJeh/FP46bPv06UUzPkZS
	vw6+d5tFKyw+v3v+BIuKiT6sWzeiR0caRTTKjlTPQar7QH7O90q4l1MSNyR9RdSnwQqkQv
	4rjQB5aiqIWEb8loCgfKmXpxFV58zO0eMmlE0E2VZuKq3/LzS9qV50ID3fnfpBVMnFqyLl
	52CdMOKuiEVQiKOmVLjMoiBvaFte2B0PvLDFy5sVb/8jknXtYuG68CefLmo+aAbnJrHSKo
	qCVuAq2tQVQfvX/Jcm5qdqgcAvInfOU3+zhviS4FEGDwJ5lw7bst0GD43jsSyg==
From: Luca Ceresoli <luca.ceresoli@bootlin.com>
Date: Tue, 19 May 2026 12:37:52 +0200
Subject: [PATCH 35/37] drm/bridge: drm_bridge_attach(): don't fail on
 -EPROBE_DEFER
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260519-drm-bridge-hotplug-v1-35-45e2bdb3dfb4@bootlin.com>
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
X-CRM114-CacheID: sfid-20260519_034041_516354_020D6995 
X-CRM114-Status: GOOD (  11.90  )
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

With bridge hotplug support, when a bridge attach func returns
-EPROBE_DEFER it means the following bridge is not yet connected, but it
could be later on. In this case don't fail the entire attach operation, so
the card can probe (without a connector) and be ready to handle a future
hotplug that completes the pipeline.

Signed-off-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
---
 drivers/gpu/drm/drm_bridge.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/drm_bridge.c b/drivers/gpu/drm/drm_bridge.c
index 2b539c9749a6..05702ece77c9 100644
--- a/drivers/gpu/drm/drm_bridge.c
+++ b/drivers/gpu/drm/drm_bridge.c
@@ -593,7 +593,7 @@ int drm_bridge_attach(struct drm_encoder *encoder, struct drm_bridge *bridge,
 
 	if (bridge->funcs->attach) {
 		ret = bridge->funcs->attach(bridge, encoder, flags);
-		if (ret < 0)
+		if (ret < 0 && ret != -EPROBE_DEFER)
 			goto err_reset_bridge;
 	}
 

-- 
2.54.0


