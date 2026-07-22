Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8846AC44536
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 22 Jul 2026 18:59:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=pVro7coYkA3NC/4KsQPbAl11wHmeU7rcEKz7Jd0EvPw=; b=Ma4/xHE5yxuA9TH4F/6hW+zUqX
	ukdnGnjs/Y8Wi/WkvTcbQ8pVbKQMjjmlRYxWW9Cesg7H65KxTWmKU8oCG/1XvaZrjae1+1JGgarVo
	tegqJcO5Cb2APxdItFdv6GbMy1uh0/xQR0t9bzm15TeyDGmgecrCZcDyk9tYGgaDz901GCiLsJG3N
	BtkIHjZcCXOZ3Lnh3wRfomZdLIfUgW8TrJnh0JIfK1R486mtdPn/31AtMFdUIRX0hAaK+p0tvkCHn
	h7AZY8+4RwzOAf0Q0nYn8wb+Agc4BgrFVSnN73WZpo/j7gFX8Dv8b/EPUheuXatHsVhcexG1YjCOQ
	UbCrky6A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wmcAY-0000000CbMP-10DD;
	Wed, 22 Jul 2026 18:59:50 +0000
Received: from layka.disroot.org ([178.21.23.139])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wmcAT-0000000CbHW-3690
	for linux-arm-kernel@lists.infradead.org;
	Wed, 22 Jul 2026 18:59:48 +0000
Received: from mail01.layka.lan (localhost [127.0.0.1])
	by disroot.org (Postfix) with ESMTP id 509AE83F7A;
	Wed, 22 Jul 2026 20:59:31 +0200 (CEST)
X-Virus-Scanned: SPAM Filter at disroot.org
Received: from layka.disroot.org ([127.0.0.1])
 by localhost (disroot.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id MN0pYQ004ibo; Wed, 22 Jul 2026 20:59:30 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=disroot.org; s=mail;
	t=1784746770; bh=1YohDgTSOkkTpl+65u26bbQhosd/+AGS22C8onQsxPU=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=akPUmchE2iIdGt7B3MdYhifPqGY3yW16Vqxr/8pilsgaFQC4fTNhWFS2WNtzYnwQO
	 CrKrhyDmPgHR2Wnq7BJoF0oB47EFPr/3kRjveb0eFz4hx3EEUC/fGY8naLSXGiXrXt
	 V247SGp06E8Qa4wBijyAF5OCi8qlhlfpWe9OIYgDNvweWwtc7GnbaNbNWMP3HVhRED
	 bQtCugGy+SV5KUplFHQpd4UZPGweK3mYr3hO6HX+V4WYKVicApyC5IO6F1ZMwZrl3I
	 RPEXA4lZgUiFb3/1KZffFLY9ML8IrR1APABc7sJBUpqg7oGHdyEI8Ufir7eZGED6ev
	 mpdKxJWpJO5Sw==
From: Kaustabh Chakraborty <kauschluss@disroot.org>
Date: Thu, 23 Jul 2026 00:28:34 +0530
Subject: [PATCH v3 3/3] drm/exynos: remove simplefb nodes before init
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260723-exynos-dsim-fixes-v3-3-0c31ae1dbecc@disroot.org>
References: <20260723-exynos-dsim-fixes-v3-0-0c31ae1dbecc@disroot.org>
In-Reply-To: <20260723-exynos-dsim-fixes-v3-0-0c31ae1dbecc@disroot.org>
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
X-CRM114-CacheID: sfid-20260722_115945_925133_B0A54844 
X-CRM114-Status: GOOD (  12.16  )
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
index 9ee30086879f..7657f86a9d19 100644
--- a/drivers/gpu/drm/exynos/exynos_drm_drv.c
+++ b/drivers/gpu/drm/exynos/exynos_drm_drv.c
@@ -7,6 +7,7 @@
  *	Seung-Woo Kim <sw0312.kim@samsung.com>
  */
 
+#include <linux/aperture.h>
 #include <linux/component.h>
 #include <linux/dma-mapping.h>
 #include <linux/platform_device.h>
@@ -273,6 +274,11 @@ static int exynos_drm_bind(struct device *dev)
 	if (ret)
 		goto err_mode_config_cleanup;
 
+	/* Remove existing devices which own the framebuffer memory. */
+	ret = aperture_remove_all_conflicting_devices(exynos_drm_driver.name);
+	if (ret)
+		goto err_unbind_all;
+
 	ret = drm_vblank_init(drm, drm->mode_config.num_crtc);
 	if (ret)
 		goto err_unbind_all;

-- 
2.54.0


