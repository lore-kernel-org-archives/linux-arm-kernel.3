Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 90E9DFF8873
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 29 Apr 2026 14:00:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=zkHMGFbru1F1j4hL4lCy9897DjU1VkMQQvTQVV2uchM=; b=WhqGdOgiWMFULfpeBz2bpAmT6R
	qC40w76c2wI/DoFhZhF+v45Fs+zrMK+avaGmQ+wIJy+M4Y1FRawM6RlhuJcuL9hAz+5jIOGvkOR8G
	HPIl7OJ3EPEbLzI4iJdGmPDjmg5t/kbnkQDMfL5Otj4WwrBW0sgXuDvZds4D8fHOVUg+HUzXpD4cV
	igYHgtn8VX49mp9tjgKjIp0CjHgwCVO1KO/Kqh1pfgU8wCHgCUePQC98r1mquqvOJbONBBnRX3doR
	h/iKIhcF2hJah1rDItdtXZVjyINpbxx+X1cADhAW5zjC417dM6Hf40vjLMlOY53KOOcXUYgJlH+sm
	i+u7AuqA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wI5Sw-00000003iw7-05by;
	Wed, 29 Apr 2026 14:00:38 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wI5Sp-00000003iu7-3xn2
	for linux-arm-kernel@lists.infradead.org;
	Wed, 29 Apr 2026 14:00:36 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 3A07343EC6;
	Wed, 29 Apr 2026 14:00:31 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A2548C19425;
	Wed, 29 Apr 2026 14:00:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1777471231;
	bh=F3GzEF9HBE73GG0R8Bt2iGJHocP/9FQBL1y46O6CYIk=;
	h=From:To:Cc:Subject:Date:From;
	b=CXh8zcvf0zV5rKnkbZFJjguU4eFmEebyNGs236rdo7v6OuE8LZ9jvreMjYM012inf
	 XhXagHWxywWUI8y4z+obKm248CLEnUa5a65eQmxwmMb/fot5N6pt+nSWYEQD+HDmqz
	 vEranRw7Y7tVUSxuqEiZdpCY5cEWmioYxypsVXbaSwLfQn39OeavhkDsgXjYArSRay
	 yVj4NPKn+AR8fde34ZdoG1O5ijNlzwHbFqJqmJTAtTPzKheEmqnsMxn28NXQrAi9jx
	 x/WOnifdTgnC4HmBqHpZjP+6CGlDLAxDMKRkkKyBqpoB08zWrwrYnQr1VWm/GNf940
	 iFgdaqO8vJVNg==
From: Arnd Bergmann <arnd@kernel.org>
To: Philipp Zabel <p.zabel@pengutronix.de>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Frank Li <Frank.Li@nxp.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Luca Ceresoli <luca.ceresoli@bootlin.com>,
	Damon Ding <damon.ding@rock-chips.com>
Cc: Arnd Bergmann <arnd@arndb.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	dri-devel@lists.freedesktop.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] drm/ipv3: add CONFIG_OF dependency for DRM_OF_DISPLAY_MODE_BRIDGE
Date: Wed, 29 Apr 2026 16:00:11 +0200
Message-Id: <20260429140024.192432-1-arnd@kernel.org>
X-Mailer: git-send-email 2.39.5
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260429_070031_996975_0481A0BD 
X-CRM114-Status: UNSURE (   9.70  )
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

From: Arnd Bergmann <arnd@arndb.de>

Without this, not all dependencies are met here.

  Depends on [n]: HAS_IOMEM [=y] && DRM [=y] && DRM_BRIDGE [=y] && OF [=n]
  Selected by [y]:
  - DRM_IMX_PARALLEL_DISPLAY [=y] && HAS_IOMEM [=y] && DRM [=y] && DRM_IMX [=y]
  - DRM_IMX_LDB [=y] && HAS_IOMEM [=y] && DRM [=y] && DRM_IMX [=y] && COMMON_CLK [=y]

Fixes: ba2db93cf3d5 ("drm/bridge: Move legacy bridge driver out of imx directory for multi-platform use")
Signed-off-by: Arnd Bergmann <arnd@arndb.de>
---
 drivers/gpu/drm/imx/ipuv3/Kconfig | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/gpu/drm/imx/ipuv3/Kconfig b/drivers/gpu/drm/imx/ipuv3/Kconfig
index 351dc65913eb..3ca237515e46 100644
--- a/drivers/gpu/drm/imx/ipuv3/Kconfig
+++ b/drivers/gpu/drm/imx/ipuv3/Kconfig
@@ -13,6 +13,7 @@ config DRM_IMX
 config DRM_IMX_PARALLEL_DISPLAY
 	tristate "Support for parallel displays"
 	depends on DRM_IMX
+	depends on OF
 	select DRM_BRIDGE
 	select DRM_BRIDGE_CONNECTOR
 	select DRM_DISPLAY_HELPER
@@ -33,6 +34,7 @@ config DRM_IMX_LDB
 	tristate "Support for LVDS displays"
 	depends on DRM_IMX
 	depends on COMMON_CLK
+	depends on OF
 	select MFD_SYSCON
 	select DRM_BRIDGE
 	select DRM_BRIDGE_CONNECTOR
-- 
2.39.5


