Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 436BEE6FE24
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 23 Dec 2025 18:02:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Q1J+cnXklS0GGt9yd+2S+ustp9tZDyTJ4kC+BJLuVY8=; b=TVYc7WwgWcYbmCgpQBWiQtdUZB
	4yakrkuJLVL3M3H5JWjEzlL9f2JN/i8CiKY5AMK9QOZK51FKNzDGosB06dp0pq4rqPOwMyKp1SrmE
	9E+G5hoBE+c6OpTPH5biG+v6ySVW6q/a+EcRPxIacslbcIxyaN8nPcM7AO4s4AHlzlRCrB0SC01ow
	t0p6nfylIk28jPBqTWNZkPR+TFSz6LvwyfVzF0wDl3ZK97DkPgA2zEQQqPYtUoMZa3uXxY0oQSy6Z
	/uXEAEcJD4gLirF2HQiVzDZrtyR2MUKVeEvL7ynQpT6BXcSgbRGLW3j2vJbXECF7EZGV+rI3qu5Vt
	k+o6WMVg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vY6id-0000000FtRc-3jqJ;
	Tue, 23 Dec 2025 18:02:47 +0000
Received: from sender4-pp-f112.zoho.com ([136.143.188.112])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vY6ib-0000000FtOT-0Z8u;
	Tue, 23 Dec 2025 18:02:46 +0000
ARC-Seal: i=1; a=rsa-sha256; t=1766512954; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=euCcqtJpfgm86+21LV9sc46ZqYyxaVf+7jnkrGIAQgjdtK2DZNIejLZpckblv9IHqbkMGw4QFhAf5YKU17JjLCZmrVr4WbXRXpdBkqiW18YadLiP515z/KQBc681lpV+avcNTLB1Xl36f6iQnZwc+qZ9ft9pxYmJFX3ZrerAYvw=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1766512954; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=Q1J+cnXklS0GGt9yd+2S+ustp9tZDyTJ4kC+BJLuVY8=; 
	b=VWCJp7CC+KbN4ifG0l9/ffZ+2NBXZvUnHa73C/PzJEAD/N6avc22mJjLOpOMQJ7blOsevIO1oX4swHUcpfXMTXp4xAdHJac05ZO6nmRccmVEggCrZ0cExf6ORxksJ5v0aWt4ngb9k9MAE/5HEOT5Smnj0WLI7DqYEXsQk+GQsxs=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=ariel.dalessandro@collabora.com;
	dmarc=pass header.from=<ariel.dalessandro@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1766512954;
	s=zohomail; d=collabora.com; i=ariel.dalessandro@collabora.com;
	h=From:From:Date:Date:Subject:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:Message-Id:References:In-Reply-To:To:To:Cc:Cc:Reply-To;
	bh=Q1J+cnXklS0GGt9yd+2S+ustp9tZDyTJ4kC+BJLuVY8=;
	b=kSN//B67z30nSRhVdMJQEz/BTBDJoTswcGRZUfiyfAmtDxk0IPXeukzuBf0BzTWL
	uAPnp/N9ra3aFOzknDcNQ3tBLj5ELRwyqMTvhkQUb3xuSKc6v8sCf1UtJYW16XfKDd3
	NqsaV2NrED477QwxEjjAUY5OVr60PHZ8Tb8imL2M=
Received: by mx.zohomail.com with SMTPS id 1766512953114807.0800549115687;
	Tue, 23 Dec 2025 10:02:33 -0800 (PST)
From: Ariel D'Alessandro <ariel.dalessandro@collabora.com>
Date: Tue, 23 Dec 2025 15:01:27 -0300
Subject: [PATCH v3 07/21] drm/atomic: Pass crtc_color_pipeline client cap
 to atomic check
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20251223-mtk-post-blend-color-pipeline-v3-7-7d969f9a37a0@collabora.com>
References: <20251223-mtk-post-blend-color-pipeline-v3-0-7d969f9a37a0@collabora.com>
In-Reply-To: <20251223-mtk-post-blend-color-pipeline-v3-0-7d969f9a37a0@collabora.com>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Chun-Kuang Hu <chunkuang.hu@kernel.org>, 
 Philipp Zabel <p.zabel@pengutronix.de>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Louis Chauvet <louis.chauvet@bootlin.com>, 
 Haneen Mohammed <hamohammed.sa@gmail.com>, 
 Melissa Wen <melissa.srw@gmail.com>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
 kernel@collabora.com, 
 =?utf-8?q?N=C3=ADcolas_F=2E_R=2E_A=2E_Prado?= <nfraprado@collabora.com>, 
 Ariel D'Alessandro <ariel.dalessandro@collabora.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1766512902; l=2040;
 i=ariel.dalessandro@collabora.com; s=20251223; h=from:subject:message-id;
 bh=OLvyPmMpO/hEIyRYpfk8eZuodCPCUqC8Rb0bsFvEm94=;
 b=4H6IhsCQfRqK8BX7iIXNdEj6w6+09CG+Er4dh+OOTA/3D9Vx3gJyGM8tr+Ih4Q9RGfT7+El2s
 kAX/rbW99AYApYrR/BQNk1yreWlLmyZzdrNsxonhr8wQjtANryXObPu
X-Developer-Key: i=ariel.dalessandro@collabora.com; a=ed25519;
 pk=QZRL9EsSBV3/FhDHi9L/7ZTz2dwa7iyqgl+y1UYaQXQ=
X-ZohoMailClient: External
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251223_100245_236295_5EC14460 
X-CRM114-Status: UNSURE (   9.39  )
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

From: "Nícolas F. R. A. Prado" <nfraprado@collabora.com>

Pass the state of the CRTC (post-blend) color pipeline client cap to the
atomic state so that drivers can rely on it to enable color pipeline
functionality and ignore the deprecated color management CRTC
properties.

Signed-off-by: Nícolas F. R. A. Prado <nfraprado@collabora.com>
Co-developed-by: Ariel D'Alessandro <ariel.dalessandro@collabora.com>
Signed-off-by: Ariel D'Alessandro <ariel.dalessandro@collabora.com>
Reviewed-by: Louis Chauvet <louis.chauvet@bootlin.com>
---
 drivers/gpu/drm/drm_atomic_uapi.c |  1 +
 include/drm/drm_atomic.h          | 20 ++++++++++++++++++++
 2 files changed, 21 insertions(+)

diff --git a/drivers/gpu/drm/drm_atomic_uapi.c b/drivers/gpu/drm/drm_atomic_uapi.c
index d1bc78b2567a9..03f5a80448d10 100644
--- a/drivers/gpu/drm/drm_atomic_uapi.c
+++ b/drivers/gpu/drm/drm_atomic_uapi.c
@@ -1668,6 +1668,7 @@ int drm_mode_atomic_ioctl(struct drm_device *dev,
 	state->acquire_ctx = &ctx;
 	state->allow_modeset = !!(arg->flags & DRM_MODE_ATOMIC_ALLOW_MODESET);
 	state->plane_color_pipeline = file_priv->plane_color_pipeline;
+	state->crtc_color_pipeline = file_priv->crtc_color_pipeline;
 
 retry:
 	copied_objs = 0;
diff --git a/include/drm/drm_atomic.h b/include/drm/drm_atomic.h
index 74ce26fa8838b..7eb21c0426105 100644
--- a/include/drm/drm_atomic.h
+++ b/include/drm/drm_atomic.h
@@ -560,6 +560,26 @@ struct drm_atomic_state {
 	 */
 	bool plane_color_pipeline : 1;
 
+	/**
+	 * @crtc_color_pipeline:
+	 *
+	 * Indicates whether this atomic state originated with a client that
+	 * set the DRM_CLIENT_CAP_CRTC_COLOR_PIPELINE.
+	 *
+	 * Drivers and helper functions should use this to ignore legacy
+	 * properties that are incompatible with the drm_crtc COLOR_PIPELINE
+	 * behavior, such as:
+	 *
+	 *  - GAMMA_LUT
+	 *  - DEGAMMA_LUT
+	 *  - GAMMA_LUT_SIZE
+	 *  - CTM
+	 *
+	 * or any other driver-specific properties that might affect pixel
+	 * values.
+	 */
+	bool crtc_color_pipeline : 1;
+
 	/**
 	 * @colorops:
 	 *

-- 
2.51.0


