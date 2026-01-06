Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7C31ECEFCE4
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  6 Jan 2026 17:44:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=XIaFCPOaQ6EWQyuZhWQAS2J/gIaRsVFGu4wZ6cg0uhQ=; b=PNOP3iXm/+z/RVbHNyD2Mh7ah2
	opBAsCsc7c7+yhOP0ITbbx8CbMbJtHy0zvCsScpIEIStEd9vSXhH8mlWAxNHhKREJU5KjOEplEq+1
	4USGWhq7GR/LRqcgPC59LzBB2uJMYau23mrG0Ecz3I9R0g5q+5oKVTdedUhR2QxX8sSdy/N4Amdco
	GdM7mmHkYGnqgqH7gnCIdZYRDEcVMt3DVqgc/aR6zNi726Wq2ECmujUgF8fwU63XrP17i4d67s8Ex
	YqaHf0wsVISOfXKEhk9cclaEPrl+9sw91ExhgVaKyrrS510mz1nOg6yVHeMFEbxyC/xxWoWPQ2rTl
	2Qbsn2qg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vdB6I-0000000DbbY-0jU6;
	Tue, 06 Jan 2026 17:44:10 +0000
Received: from smtpout-02.galae.net ([185.246.84.56])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vdB6F-0000000DbWj-2oE3
	for linux-arm-kernel@lists.infradead.org;
	Tue, 06 Jan 2026 17:44:09 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 1F2951A26A7;
	Tue,  6 Jan 2026 17:44:06 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id E8A6B60739;
	Tue,  6 Jan 2026 17:44:05 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id D898E103C85AC;
	Tue,  6 Jan 2026 18:44:00 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1767721444; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=XIaFCPOaQ6EWQyuZhWQAS2J/gIaRsVFGu4wZ6cg0uhQ=;
	b=Nm1WG/KWkI8SapQjNn9Oo+YHqX8Z9oVneNBr31Q5duHrM7bQQYOxEtbFKzzy/mtHwUuw7M
	d9sPoU7sdMhcRqRcAUBQPbnxB/M5WFQKliLphnYOnSipLaZq0PTGdiwqIpLhF+LW999E4Q
	2ScifT32ZyLNA/LTEiqsEe6o15QWX/2/fghbZqnkOFUw1BDcsH80Gk1FrrdFUX0diYunnq
	DeNxi8cQ5zYWF72M9hzRHaaJNVHT6eIL0Q/5PKtDTUNZlO3KABs7/X6NYAPfFUANlcdJXi
	2d07SjaGdfJ1JUaG6h1cHlUYjL5HAqy1e7nDkECRrf4oxjYYGAAj613MeC7K3A==
From: "Kory Maincent (TI.com)" <kory.maincent@bootlin.com>
Date: Tue, 06 Jan 2026 18:42:28 +0100
Subject: [PATCH v3 12/22] drm/tilcdc: Rename tilcdc_external to
 tilcdc_encoder
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260106-feature_tilcdc-v3-12-9bad0f742164@bootlin.com>
References: <20260106-feature_tilcdc-v3-0-9bad0f742164@bootlin.com>
In-Reply-To: <20260106-feature_tilcdc-v3-0-9bad0f742164@bootlin.com>
To: Jyri Sarha <jyri.sarha@iki.fi>, 
 Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Russell King <linux@armlinux.org.uk>, 
 Bartosz Golaszewski <brgl@bgdev.pl>, Tony Lindgren <tony@atomide.com>, 
 Andrzej Hajda <andrzej.hajda@intel.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, 
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>
Cc: Markus Schneider-Pargmann <msp@baylibre.com>, 
 Bajjuri Praneeth <praneeth@ti.com>, 
 Luca Ceresoli <luca.ceresoli@bootlin.com>, 
 Louis Chauvet <louis.chauvet@bootlin.com>, 
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 Miguel Gazquez <miguel.gazquez@bootlin.com>, 
 Herve Codina <herve.codina@bootlin.com>, dri-devel@lists.freedesktop.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-omap@vger.kernel.org, 
 "Kory Maincent (TI.com)" <kory.maincent@bootlin.com>
X-Mailer: b4 0.14.3
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260106_094407_878836_4AAD146A 
X-CRM114-Status: GOOD (  12.24  )
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

The tilcdc_external module describes the encoder part of the tilcdc
driver. Rename it to tilcdc_encoder for better clarity and to make
the naming more consistent with DRM subsystem conventions, where
encoder-related files typically use "encoder" in their names.

Reviewed-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
Signed-off-by: Kory Maincent (TI.com) <kory.maincent@bootlin.com>
---
 drivers/gpu/drm/tilcdc/Makefile                                | 2 +-
 drivers/gpu/drm/tilcdc/tilcdc_drv.c                            | 2 +-
 drivers/gpu/drm/tilcdc/{tilcdc_external.c => tilcdc_encoder.c} | 2 +-
 drivers/gpu/drm/tilcdc/{tilcdc_external.h => tilcdc_encoder.h} | 0
 4 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/tilcdc/Makefile b/drivers/gpu/drm/tilcdc/Makefile
index b78204a65ce29..c6b484dad711a 100644
--- a/drivers/gpu/drm/tilcdc/Makefile
+++ b/drivers/gpu/drm/tilcdc/Makefile
@@ -6,7 +6,7 @@ endif
 tilcdc-y := \
 	tilcdc_plane.o \
 	tilcdc_crtc.o \
-	tilcdc_external.o \
+	tilcdc_encoder.o \
 	tilcdc_drv.o
 
 obj-$(CONFIG_DRM_TILCDC)	+= tilcdc.o
diff --git a/drivers/gpu/drm/tilcdc/tilcdc_drv.c b/drivers/gpu/drm/tilcdc/tilcdc_drv.c
index bf6cd763ecd0f..6a08f50762af9 100644
--- a/drivers/gpu/drm/tilcdc/tilcdc_drv.c
+++ b/drivers/gpu/drm/tilcdc/tilcdc_drv.c
@@ -26,7 +26,7 @@
 
 
 #include "tilcdc_drv.h"
-#include "tilcdc_external.h"
+#include "tilcdc_encoder.h"
 #include "tilcdc_regs.h"
 
 enum {
diff --git a/drivers/gpu/drm/tilcdc/tilcdc_external.c b/drivers/gpu/drm/tilcdc/tilcdc_encoder.c
similarity index 98%
rename from drivers/gpu/drm/tilcdc/tilcdc_external.c
rename to drivers/gpu/drm/tilcdc/tilcdc_encoder.c
index 11ac9673ba98a..b1c7b2257df30 100644
--- a/drivers/gpu/drm/tilcdc/tilcdc_external.c
+++ b/drivers/gpu/drm/tilcdc/tilcdc_encoder.c
@@ -12,7 +12,7 @@
 #include <drm/drm_simple_kms_helper.h>
 
 #include "tilcdc_drv.h"
-#include "tilcdc_external.h"
+#include "tilcdc_encoder.h"
 
 static
 struct drm_connector *tilcdc_encoder_find_connector(struct drm_device *ddev,
diff --git a/drivers/gpu/drm/tilcdc/tilcdc_external.h b/drivers/gpu/drm/tilcdc/tilcdc_encoder.h
similarity index 100%
rename from drivers/gpu/drm/tilcdc/tilcdc_external.h
rename to drivers/gpu/drm/tilcdc/tilcdc_encoder.h

-- 
2.43.0


