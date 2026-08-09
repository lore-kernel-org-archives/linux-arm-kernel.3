Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8A7D6C5AD4E
	for <linux-arm-kernel@archiver.kernel.org>; Sun,  9 Aug 2026 08:57:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=oeMwNGweioBYlhboZDR6/HtbbCN8tNUMXg+JwrbLVYk=; b=Eaq5vJd6vlf5Fo7h90cP33H336
	zPvOmH6T0LZuxwMomGi6Y9yau1B7SyFYrzQcxbC5Ll0RfsdbCQHxyll2tripg6IfBUPUK4RLJIoFw
	jfkjlEFi5AVCZnanfOonayweLhUa6Gk5ApdQ6mT4uoxcPxTnQ3nYJMnY7FsgSt5MYRUuToyV9R5T0
	RyAdNtUGq7vlBaugyTxfxaXOv0rBETxd5Rq/hz4y0OSco8pE2hBMERJG/hXHRck0LBBSAclV4diwQ
	b/sDpNd3lPbM9KPnrX7mgLo9oEUbvs/L5UNWSI4n1B+CTCD97QOQV8MCIM1SkoD0ZyUtogvNNp7Ra
	tTON4CAA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wszLI-0000000A7Gb-16b5;
	Sun, 09 Aug 2026 08:57:16 +0000
Received: from layka.disroot.org ([178.21.23.139])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wszLF-0000000A7Fi-2TLx
	for linux-arm-kernel@lists.infradead.org;
	Sun, 09 Aug 2026 08:57:14 +0000
Received: from mail01.layka.lan (localhost [127.0.0.1])
	by disroot.org (Postfix) with ESMTP id E78B642C2F;
	Sun, 09 Aug 2026 10:57:11 +0200 (CEST)
X-Virus-Scanned: SPAM Filter at disroot.org
Received: from layka.disroot.org ([127.0.0.1])
 by localhost (disroot.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id O7Ek0Z2ZZo3d; Sun,  9 Aug 2026 10:57:11 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=disroot.org; s=mail;
	t=1786265831; bh=sSdMlVv4KPv7PSTWKJG/U2qBKfr06yN4H3Mqo+2KEPE=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=lftYWenWAOn2suYR7aHNnjqqaQ2KzoDiknnCEA8FfoxP0/1hPIZDYUXMVXA456hfu
	 68U+eTB8OFFHgViT4ri/ZgYKGwpzKAn67IO4ku+vqPKv439G5O6Jl7vGDV49YOTAJQ
	 axrzQBzeW6jO9txjC+VFA8VlCYtJJ3lp2xmN3uQCg83tvB0V/ILf3JVoy6rmmE9gJM
	 wqFXr9awuEkfm+YJtMaNNwK4bKCWj+AT4Wg+PTg5xceSqfr17sCgNB4hSlp8AERweU
	 fv85F8xxvIakFgPyDjiKafCeMPISVuzzAzwYXaJAyGzVNQLqqwtxm+JvlDfk0NR3HK
	 55tQ+3zMuWwgQ==
From: Kaustabh Chakraborty <kauschluss@disroot.org>
Date: Sun, 09 Aug 2026 14:26:01 +0530
Subject: [PATCH v5 3/3] drm/exynos: remove simplefb nodes before init
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260809-exynos-dsim-fixes-v5-3-6e63dc6c238f@disroot.org>
References: <20260809-exynos-dsim-fixes-v5-0-6e63dc6c238f@disroot.org>
In-Reply-To: <20260809-exynos-dsim-fixes-v5-0-6e63dc6c238f@disroot.org>
To: Inki Dae <inki.dae@samsung.com>, 
 Jagan Teki <jagan@amarulasolutions.com>, 
 Marek Szyprowski <m.szyprowski@samsung.com>, 
 Andrzej Hajda <andrzej.hajda@intel.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, 
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Luca Ceresoli <luca.ceresoli@bootlin.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Seung-Woo Kim <sw0312.kim@samsung.com>, 
 Kyungmin Park <kyungmin.park@samsung.com>, 
 Krzysztof Kozlowski <krzk@kernel.org>, 
 Peter Griffin <peter.griffin@linaro.org>, 
 Alim Akhtar <alim.akhtar@samsung.com>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, 
 Kaustabh Chakraborty <kauschluss@disroot.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260809_015713_772548_EBD2DA4D 
X-CRM114-Status: GOOD (  11.62  )
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

The simple-framebuffer uses the framebuffer region initialized by the
boot loader for display. However, with Linux the DSI and FIMD/DECON
stack is initialized from scratch.

However, both are destined use the same memory region, so both cannot
co-exist. For a seamless display transition during boot, the framebuffer
must be destroyed, which releases the memory region, followed by proper
IP re-initialization. Achieve it using
aperture_remove_all_conflicting_devices(). This is also implemented in
other similar systems such as in Qualcomm's msm_kms driver.

Signed-off-by: Kaustabh Chakraborty <kauschluss@disroot.org>
---
 drivers/gpu/drm/exynos/exynos_drm_drv.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/drivers/gpu/drm/exynos/exynos_drm_drv.c b/drivers/gpu/drm/exynos/exynos_drm_drv.c
index 9ee30086879f..62eeacbc2180 100644
--- a/drivers/gpu/drm/exynos/exynos_drm_drv.c
+++ b/drivers/gpu/drm/exynos/exynos_drm_drv.c
@@ -7,6 +7,7 @@
  *	Seung-Woo Kim <sw0312.kim@samsung.com>
  */
 
+#include <linux/aperture.h>
 #include <linux/component.h>
 #include <linux/dma-mapping.h>
 #include <linux/platform_device.h>
@@ -268,6 +269,11 @@ static int exynos_drm_bind(struct device *dev)
 	list_for_each_entry(encoder, &drm->mode_config.encoder_list, head)
 		encoder->possible_clones = clone_mask;
 
+	/* Remove existing devices which own the framebuffer memory. */
+	ret = aperture_remove_all_conflicting_devices(exynos_drm_driver.name);
+	if (ret)
+		goto err_mode_config_cleanup;
+
 	/* Try to bind all sub drivers. */
 	ret = component_bind_all(drm->dev, drm);
 	if (ret)

-- 
2.54.0


