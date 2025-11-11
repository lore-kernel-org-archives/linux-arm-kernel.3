Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AA0E2CCFA18
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 11 Nov 2025 16:16:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=A2+s1FHOZw4Ri8Ohjl+xRw5jU5dG/3MTNz/II7imxzc=; b=ZKD30ut4+Nn6Yq9HWauaVponbY
	IwbHrGJITS7r7clLeGz4aOUJYbBN1MdOyHGUBGV1DWcgFfSn5y5GYu8Jo8tKEdQt9QioLrDrKybG1
	XY3JrPR9TLdrF8nc7hbHOnn4fAmAxUVeL2yMiUaRJYMtF/AFQovLkGQ+2JkGXrXmi1X51dN9ohig5
	W/IgDjvQ364H/QbgarPdsyGKlHzSGaIE9aZmxceUwOhZg/BIWMNwh1+oqaZ/Wyb/DMUMGa/tx5hg2
	l7Z/iSHgbrQdMJbNhXQ5AEHlh1O5qBAo6WWVGCYVacwqkpWO+8tchiJYjJWU4RInd1/GTnDrsemem
	YqOUIQMQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vIr2V-00000007RPI-2tZF;
	Tue, 11 Nov 2025 16:16:15 +0000
Received: from perceval.ideasonboard.com ([213.167.242.64])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vIr2S-00000007RLu-18lw
	for linux-arm-kernel@lists.infradead.org;
	Tue, 11 Nov 2025 16:16:13 +0000
Received: from [127.0.1.1] (cpc141996-chfd3-2-0-cust928.12-3.cable.virginm.net [86.13.91.161])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id A9C741E57;
	Tue, 11 Nov 2025 17:14:10 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1762877651;
	bh=tE8WCOlL7CASqNt+gdBxjdYciZO4wvF/n7iWNDe25ng=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=tiE641VKNxl+jY62isaoS1PToJL4ChORAPU/MMQ5VphNaXOtKaDd4QGbDGk16nk6W
	 CuTKaKlKkk9fGnEk0rf0cRYagtFAZiTDQ2gXnfcKQHsdEQd9yCQQq6RF5tiLVUHLCP
	 bywdKxKf71Jt2ax08j/N3XNyqwSfxLXJ5JgSBBu0=
From: Daniel Scally <dan.scally@ideasonboard.com>
Date: Tue, 11 Nov 2025 16:15:48 +0000
Subject: [PATCH v13 04/15] media: uapi: Add controls for Mali-C55 ISP
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251111-c55-v13-4-3dc581355e3a@ideasonboard.com>
References: <20251111-c55-v13-0-3dc581355e3a@ideasonboard.com>
In-Reply-To: <20251111-c55-v13-0-3dc581355e3a@ideasonboard.com>
To: linux-media@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org
Cc: Anthony.McGivern@arm.com, jacopo.mondi@ideasonboard.com, 
 nayden.kanchev@arm.com, robh+dt@kernel.org, mchehab@kernel.org, 
 krzysztof.kozlowski+dt@linaro.org, conor+dt@kernel.org, 
 jerome.forissier@linaro.org, kieran.bingham@ideasonboard.com, 
 laurent.pinchart@ideasonboard.com, dan.scally@ideasonboard.com, 
 Sakari Ailus <sakari.ailus@linux.intel.com>, 
 Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=5847;
 i=dan.scally@ideasonboard.com; h=from:subject:message-id;
 bh=tE8WCOlL7CASqNt+gdBxjdYciZO4wvF/n7iWNDe25ng=;
 b=owEBbQKS/ZANAwAKAchJV3psRXUyAcsmYgBpE2FCdMRCwPgImuHk0lwO3JnHH67hgQaS+0tUB
 QJugXbcliyJAjMEAAEKAB0WIQQqyuwyDnZdb+mxmm/ISVd6bEV1MgUCaRNhQgAKCRDISVd6bEV1
 MghyEACVdr+KM7m1OSSqWG5P0cEgXuGq2FuXSxKj7qwh3MjYfE/rWwtWbJuBmD1p7jrFLBBGLCM
 6YJIXT267OuxY55fbcNAXYHjIH+8WUYHNIc0Rl86cUKJic3WWwxIsxDJ6M3GUwQ84HymSqcXPOT
 l/aygA67OjeQfCAZpkFu+LfFlaLn0TAB04peYxV1RJcgnU6kXmFeSDVlab4KqaD8hyxh06GZ0TG
 KdCn+zxmfygPyOQT5if6kMrlCZ9wWaWzWel0uZRjBd7Im5twb3gQVhq7hBziVH663+t+rEckzaa
 hDRvftNuXzU39+VJRVJaOhlIMTh6hvNelZFVGHApaWT7ZH2U//rjSAzbQX0LnSR/K7qZCSlyWAI
 ltuF+JCiHYn0wxg8xglvQsI6tZm60JEXArdq4k6OKg+pL6AF39sKiR05rzUf4PW3CSfFr0S8cjP
 cplE/LDSWgLVO7yJzMCkFUirPkPLjMs3oe9mDHSzbGan2gh5nUbp29IEZy4zAI69DHks9waiPz/
 +7sTOmPSbWwjZHHzLR4Q+Gf938IiqdPJiBZYfs7rcNBhzkvdha2W7Q6/etYPlDY7+R+6Lt9+fay
 fu8T4bkxmzACgFEeZHI8FJGfsPoBLck82gI6B5p73ZutKrmANZut8yUB1krtIumxdxTsAZTyHJQ
 ZpV6X1JwDGoD/qg==
X-Developer-Key: i=dan.scally@ideasonboard.com; a=openpgp;
 fpr=EEC699ACA1B7CB5D31330C0BBD501C2A3546CCF6
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251111_081612_461523_9BB48BEF 
X-CRM114-Status: GOOD (  19.77  )
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

Tested-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Reviewed-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Reviewed-by: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
Signed-off-by: Daniel Scally <dan.scally@ideasonboard.com>
---
Changes in v13:

	- Removed _GPS from the control value names

Changes in v12:

	- Removed _FITTED suffix from control value names
	- Specified bitmask for control name
	- Used (1 << n) instead of BIT(n) in uapi header
	- Updated comment to reserve 16 controls for driver

Changes in v11:

	- None
Changes in v10:

	- None

Changes in v9:

	- New patch
---
 .../userspace-api/media/drivers/index.rst          |  1 +
 .../userspace-api/media/drivers/mali-c55.rst       | 55 ++++++++++++++++++++++
 include/uapi/linux/media/arm/mali-c55-config.h     | 26 ++++++++++
 include/uapi/linux/v4l2-controls.h                 |  6 +++
 4 files changed, 88 insertions(+)

diff --git a/Documentation/userspace-api/media/drivers/index.rst b/Documentation/userspace-api/media/drivers/index.rst
index d706cb47b1122b6e145a02ab826eb3ecc7997c2b..02967c9b18d6e90f414ccc1329c09bffee895e68 100644
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
index 0000000000000000000000000000000000000000..21148b1878566da8a50a3c8e53507bec530652ef
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
+``V4L2_CID_MALI_C55_CAPABILITIES (bitmask)``
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
+          - MALI_C55_PONG
+          - Pong configuration space is fitted in the ISP
+        * - 1
+          - MALI_C55_WDR
+          - WDR Framestitch, offset and gain is fitted in the ISP
+        * - 2
+          - MALI_C55_COMPRESSION
+          - Temper compression is fitted in the ISP
+        * - 3
+          - MALI_C55_TEMPER
+          - Temper is fitted in the ISP
+        * - 4
+          - MALI_C55_SINTER_LITE
+          - Sinter Lite is fitted in the ISP instead of the full Sinter version
+        * - 5
+          - MALI_C55_SINTER
+          - Sinter is fitted in the ISP
+        * - 6
+          - MALI_C55_IRIDIX_LTM
+          - Iridix local tone mappine is fitted in the ISP
+        * - 7
+          - MALI_C55_IRIDIX_GTM
+          - Iridix global tone mapping is fitted in the ISP
+        * - 8
+          - MALI_C55_CNR
+          - Colour noise reduction is fitted in the ISP
+        * - 9
+          - MALI_C55_FRSCALER
+          - The full resolution pipe scaler is fitted in the ISP
+        * - 10
+          - MALI_C55_DS_PIPE
+          - The downscale pipe is fitted in the ISP
+
+    The Mali-C55 ISP can be configured in a number of ways to include or exclude
+    blocks which may not be necessary. This control provides a way for the
+    driver to communicate to userspace which of the blocks are fitted in the
+    design.
\ No newline at end of file
diff --git a/include/uapi/linux/media/arm/mali-c55-config.h b/include/uapi/linux/media/arm/mali-c55-config.h
new file mode 100644
index 0000000000000000000000000000000000000000..7fddece54ada9dadc3c76372d496d9395237a41c
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
+#define V4L2_CID_MALI_C55_CAPABILITIES	(V4L2_CID_USER_MALI_C55_BASE + 0x0)
+#define MALI_C55_GPS_PONG		(1U << 0)
+#define MALI_C55_GPS_WDR		(1U << 1)
+#define MALI_C55_GPS_COMPRESSION	(1U << 2)
+#define MALI_C55_GPS_TEMPER		(1U << 3)
+#define MALI_C55_GPS_SINTER_LITE	(1U << 4)
+#define MALI_C55_GPS_SINTER		(1U << 5)
+#define MALI_C55_GPS_IRIDIX_LTM		(1U << 6)
+#define MALI_C55_GPS_IRIDIX_GTM		(1U << 7)
+#define MALI_C55_GPS_CNR		(1U << 8)
+#define MALI_C55_GPS_FRSCALER		(1U << 9)
+#define MALI_C55_GPS_DS_PIPE		(1U << 10)
+
+#endif /* __UAPI_MALI_C55_CONFIG_H */
diff --git a/include/uapi/linux/v4l2-controls.h b/include/uapi/linux/v4l2-controls.h
index 2d30107e047ee3cf6b149e5b075cc9d4137b7d3f..f84ed133a6c9b2ddc1aedbd582ddf78cb71f34e5 100644
--- a/include/uapi/linux/v4l2-controls.h
+++ b/include/uapi/linux/v4l2-controls.h
@@ -228,6 +228,12 @@ enum v4l2_colorfx {
  */
 #define V4L2_CID_USER_RKISP1_BASE		(V4L2_CID_USER_BASE + 0x1220)
 
+/*
+ * The base for the Arm Mali-C55 ISP driver controls.
+ * We reserve 16 controls for this driver
+ */
+#define V4L2_CID_USER_MALI_C55_BASE		(V4L2_CID_USER_BASE + 0x1230)
+
 /* MPEG-class control IDs */
 /* The MPEG controls are applicable to all codec controls
  * and the 'MPEG' part of the define is historical */

-- 
2.43.0


