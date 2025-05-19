Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B7739C3ABD8
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 19 May 2025 15:12:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=4X7kP3FVh8O86MB41GIv5cMP8zFKx5VBToJcUYyBxl0=; b=E6fUoDmVdMDPdhnOi4NeaA59qP
	+dT8vZRMHQOTWr/etn/Cr7sVWE/VPrABYRGwhWMy0m9nLpgdGGz91Zv0HbpV16jPRBxmgTJJF6lqO
	zn6DJ4CbpwUVUbNazX/yvpXSP8gXfslaYH3Ybb6johRwimJmVD10zhCrfwQGGCqb42FbrEqvUzb/e
	k8ef98VviWJlcyhl010tAEem2Y2W8NIvf48VT9v77QE4QAKFtoipXhjGr6cufZdpM+c+bcYOuqM0r
	nmTkYX5ZdtU10CaSaZMgZJx72kNz5vP7DHjWoQYa+nDas9hTQJrndpbC2KPwxHA0fBemLswhfywUQ
	XiadKl7Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uH29l-00000009Y3k-2OQY;
	Mon, 19 May 2025 15:11:57 +0000
Received: from perceval.ideasonboard.com ([213.167.242.64])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uH1ZU-00000009SO1-2p44
	for linux-arm-kernel@lists.infradead.org;
	Mon, 19 May 2025 14:34:30 +0000
Received: from mail.ideasonboard.com (cpc141996-chfd3-2-0-cust928.12-3.cable.virginm.net [86.13.91.161])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 7CB121890;
	Mon, 19 May 2025 16:34:02 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1747665243;
	bh=COAvt0o4cn/ba/HkYod//IDB//Kfb9fsgYRCp66Jyc0=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=wEaQNsoONw3Jloia29Fk1uTjHEl9DxlG3hmyDAN097dLLhPsLX0sjScR43P3Rpb21
	 BbiVvLLW+kiQcAk6TCxVp85kfifRHBuXTE/KOLME1Knc8hEK3LSCXgishMcWUJbKqr
	 ghT8eXPRWEzcb8rri19BngHsrHEKlaVYF4WMmXtA=
From: Daniel Scally <dan.scally@ideasonboard.com>
To: linux-media@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Cc: Anthony.McGivern@arm.com,
	jacopo.mondi@ideasonboard.com,
	nayden.kanchev@arm.com,
	robh+dt@kernel.org,
	mchehab@kernel.org,
	krzysztof.kozlowski+dt@linaro.org,
	conor+dt@kernel.org,
	jerome.forissier@linaro.org,
	kieran.bingham@ideasonboard.com,
	laurent.pinchart@ideasonboard.com,
	sakari.ailus@iki.fi,
	Daniel Scally <dan.scally@ideasonboard.com>
Subject: [PATCH v9 06/17] media: uapi: Add controls for Mali-C55 ISP
Date: Mon, 19 May 2025 15:33:58 +0100
Message-Id: <20250519143409.451100-7-dan.scally@ideasonboard.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250519143409.451100-1-dan.scally@ideasonboard.com>
References: <20250519143409.451100-1-dan.scally@ideasonboard.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250519_073428_847654_3BF97E6B 
X-CRM114-Status: GOOD (  20.00  )
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

Add definitions and documentation for the custom control that will
be needed by the Mali-C55 ISP driver. This will be a read only
bitmask of the driver's capabilities, informing userspace of which
blocks are fitted and which are absent.

Signed-off-by: Daniel Scally <dan.scally@ideasonboard.com>
---
Changes in v9:

	- New patch

 .../userspace-api/media/drivers/index.rst     |  1 +
 .../userspace-api/media/drivers/mali-c55.rst  | 55 +++++++++++++++++++
 .../uapi/linux/media/arm/mali-c55-config.h    | 26 +++++++++
 include/uapi/linux/v4l2-controls.h            |  6 ++
 4 files changed, 88 insertions(+)
 create mode 100644 Documentation/userspace-api/media/drivers/mali-c55.rst
 create mode 100644 include/uapi/linux/media/arm/mali-c55-config.h

diff --git a/Documentation/userspace-api/media/drivers/index.rst b/Documentation/userspace-api/media/drivers/index.rst
index d706cb47b112..02967c9b18d6 100644
--- a/Documentation/userspace-api/media/drivers/index.rst
+++ b/Documentation/userspace-api/media/drivers/index.rst
@@ -32,6 +32,7 @@ For more details see the file COPYING in the source distribution of Linux.
 	cx2341x-uapi
 	dw100
 	imx-uapi
+	mali-c55
 	max2175
 	npcm-video
 	omap3isp-uapi
diff --git a/Documentation/userspace-api/media/drivers/mali-c55.rst b/Documentation/userspace-api/media/drivers/mali-c55.rst
new file mode 100644
index 000000000000..e8519da77d73
--- /dev/null
+++ b/Documentation/userspace-api/media/drivers/mali-c55.rst
@@ -0,0 +1,55 @@
+.. SPDX-License-Identifier: GPL-2.0-only
+
+Arm Mali-C55 ISP driver
+=======================
+
+The Arm Mali-C55 ISP driver implements a single driver-specific control:
+
+``V4L2_CID_MALI_C55_CAPABILITIES``
+    Detail the capabilities of the ISP by giving detail about the fitted blocks.
+
+    .. flat-table:: Bitmask meaning definitions
+	:header-rows: 1
+	:widths: 2 4 8
+
+	* - Bit
+	  - Macro
+	  - Meaning
+        * - 0
+          - MALI_C55_GPS_PONG_FITTED
+          - Pong configuration space is fitted in the ISP
+        * - 1
+          - MALI_C55_GPS_WDR_FITTED
+          - WDR Framestitch, offset and gain is fitted in the ISP
+        * - 2
+          - MALI_C55_GPS_COMPRESSION_FITTED
+          - Temper compression is fitted in the ISP
+        * - 3
+          - MALI_C55_GPS_TEMPER_FITTED
+          - Temper is fitted in the ISP
+        * - 4
+          - MALI_C55_GPS_SINTER_LITE_FITTED
+          - Sinter Lite is fitted in the ISP instead of the full Sinter version
+        * - 5
+          - MALI_C55_GPS_SINTER_FITTED
+          - Sinter is fitted in the ISP
+        * - 6
+          - MALI_C55_GPS_IRIDIX_LTM_FITTED
+          - Iridix local tone mappine is fitted in the ISP
+        * - 7
+          - MALI_C55_GPS_IRIDIX_GTM_FITTED
+          - Iridix global tone mapping is fitted in the ISP
+        * - 8
+          - MALI_C55_GPS_CNR_FITTED
+          - Colour noise reduction is fitted in the ISP
+        * - 9
+          - MALI_C55_GPS_FRSCALER_FITTED
+          - The full resolution pipe scaler is fitted in the ISP
+        * - 10
+          - MALI_C55_GPS_DS_PIPE_FITTED
+          - The downscale pipe is fitted in the ISP
+
+    The Mali-C55 ISP can be configured in a number of ways to include or exclude
+    blocks which may not be necessary. This control provides a way for the
+    driver to communicate to userspace which of the blocks are fitted in the
+    design.
\ No newline at end of file
diff --git a/include/uapi/linux/media/arm/mali-c55-config.h b/include/uapi/linux/media/arm/mali-c55-config.h
new file mode 100644
index 000000000000..2bd60a0d7878
--- /dev/null
+++ b/include/uapi/linux/media/arm/mali-c55-config.h
@@ -0,0 +1,26 @@
+/* SPDX-License-Identifier: GPL-2.0 WITH Linux-syscall-note */
+/*
+ * ARM Mali-C55 ISP Driver - Userspace API
+ *
+ * Copyright (C) 2023 Ideas on Board Oy
+ */
+
+#ifndef __UAPI_MALI_C55_CONFIG_H
+#define __UAPI_MALI_C55_CONFIG_H
+
+#include <linux/v4l2-controls.h>
+
+#define V4L2_CID_MALI_C55_CAPABILITIES		(V4L2_CID_USER_MALI_C55_BASE + 0x0)
+#define MALI_C55_GPS_PONG_FITTED		BIT(0)
+#define MALI_C55_GPS_WDR_FITTED			BIT(1)
+#define MALI_C55_GPS_COMPRESSION_FITTED		BIT(2)
+#define MALI_C55_GPS_TEMPER_FITTED		BIT(3)
+#define MALI_C55_GPS_SINTER_LITE_FITTED		BIT(4)
+#define MALI_C55_GPS_SINTER_FITTED		BIT(5)
+#define MALI_C55_GPS_IRIDIX_LTM_FITTED		BIT(6)
+#define MALI_C55_GPS_IRIDIX_GTM_FITTED		BIT(7)
+#define MALI_C55_GPS_CNR_FITTED			BIT(8)
+#define MALI_C55_GPS_FRSCALER_FITTED		BIT(9)
+#define MALI_C55_GPS_DS_PIPE_FITTED		BIT(10)
+
+#endif /* __UAPI_MALI_C55_CONFIG_H */
diff --git a/include/uapi/linux/v4l2-controls.h b/include/uapi/linux/v4l2-controls.h
index 72e32814ea83..a31105115410 100644
--- a/include/uapi/linux/v4l2-controls.h
+++ b/include/uapi/linux/v4l2-controls.h
@@ -222,6 +222,12 @@ enum v4l2_colorfx {
  */
 #define V4L2_CID_USER_UVC_BASE			(V4L2_CID_USER_BASE + 0x11e0)
 
+/*
+ * The base for the Arm Mali-C55 ISP driver controls.
+ * We reserve 8 controls for this driver
+ */
+#define V4L2_CID_USER_MALI_C55_BASE		(V4L2_CID_USER_BASE + 0x1220)
+
 /* MPEG-class control IDs */
 /* The MPEG controls are applicable to all codec controls
  * and the 'MPEG' part of the define is historical */
-- 
2.34.1


