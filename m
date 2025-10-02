Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8AF77CCA471
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  2 Oct 2025 10:18:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=0I5Tbv0BqMjaOapWfJ58Hz18JwAgvctjpADicCfn/iU=; b=MiQ/LYi2U/3ptkucOB04smAD3t
	FATHQ6jRExE+cf1DnuRnwILp1dMaVz+5R8vfV6VxfdzkNSP3NYTn5T0ee8ja9cRRyaYAxQMhW2Rgo
	VJS92wFARu5k1boTOLcz+KBIAkm8nkMj9MobdiD81fVBrnFW+pr4nNFwXF56c38+PtPSTua7TCuzP
	XN+3qk03A+1ga5OxfjRhoqHeBizN04p2nINm5tlJwA1Op1T3VyODXv79nmIsAFhW6XH35/22Y59wD
	X6kuvgRXcbNzGScKb//QeOuw+gO+yDlaVBRwPwgBGczGdRl86TswVBsu6X4CmBhf5ny581F+C2/75
	Lq3Iv18A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v4GOc-0000000AEbZ-3guV;
	Thu, 02 Oct 2025 10:18:46 +0000
Received: from perceval.ideasonboard.com ([213.167.242.64])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v4GOY-0000000AEWs-11ls
	for linux-arm-kernel@lists.infradead.org;
	Thu, 02 Oct 2025 10:18:44 +0000
Received: from [127.0.1.1] (cpc141996-chfd3-2-0-cust928.12-3.cable.virginm.net [86.13.91.161])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 5045C1E59;
	Thu,  2 Oct 2025 12:17:09 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1759400229;
	bh=hPZ0AJoH/jR1k6iZk+FNYPGjpxgJPiBm6Oci16wxyZs=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=Bmc15cesj73q2hR31uQ8f30svLlZZ9srT8NngGDSNfbA77M4uLyADK0XZ/TMQzaAB
	 b4zSvBNqftAqOmBr39vgkiLajK8RxwQDzE2Dkw66D9OPOyhT7RjqsdVmmoIveijFIG
	 8BTOfbr9YPKKfhBLuKJtD/va5+MUZTfxMLVYijwY=
From: Daniel Scally <dan.scally@ideasonboard.com>
Date: Thu, 02 Oct 2025 11:18:23 +0100
Subject: [PATCH v12 04/15] media: uapi: Add controls for Mali-C55 ISP
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251002-c55-v12-4-3eda2dba9554@ideasonboard.com>
References: <20251002-c55-v12-0-3eda2dba9554@ideasonboard.com>
In-Reply-To: <20251002-c55-v12-0-3eda2dba9554@ideasonboard.com>
To: linux-media@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org
Cc: Anthony.McGivern@arm.com, jacopo.mondi@ideasonboard.com, 
 nayden.kanchev@arm.com, robh+dt@kernel.org, mchehab@kernel.org, 
 krzysztof.kozlowski+dt@linaro.org, conor+dt@kernel.org, 
 jerome.forissier@linaro.org, kieran.bingham@ideasonboard.com, 
 laurent.pinchart@ideasonboard.com, dan.scally@ideasonboard.com, 
 Sakari Ailus <sakari.ailus@linux.intel.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=5627;
 i=dan.scally@ideasonboard.com; h=from:subject:message-id;
 bh=hPZ0AJoH/jR1k6iZk+FNYPGjpxgJPiBm6Oci16wxyZs=;
 b=owEBbQKS/ZANAwAKAchJV3psRXUyAcsmYgBo3lF4Xj8InyShpyAIEpB6vcUSZMLA5tdYgdnkX
 ztnXNUEaeeJAjMEAAEKAB0WIQQqyuwyDnZdb+mxmm/ISVd6bEV1MgUCaN5ReAAKCRDISVd6bEV1
 MrN4D/0Wcwq0jpY1dyC8Hrh9sB05TmbrIg/fzYZsWtwBTOu8QTEmGhN4G6s8KN0SAbX8RlBAiD9
 CBZWmZJ7HoEGeRMQuwrE5TNPVtFUhQ3SSJmn8Om6nexSYwq+VW9G5l//2Lugyqp8Ip7T1ru/3o/
 mKTKgli49RMjwHFrTlHd9cgZ6OBbgfYv3h4U8ttV26L5L8KfMkrhRI4cWjQvx58iU9endYvma4h
 si9fXZGhYVtsOeh/bzR9dK9+xvo1GCus8KUJL017RkOscHGBd7iOWRBXmgvtG3qoQvVyiIzcmZJ
 fYtVyC4LxlNlphPU20jZcQcEmjMxOhIgJPkigtpnScojB+sZO1icBWmoIgFe5CHj+40+6i0p1YJ
 dsLGzcu8KlmFagRHekwgFSOkipvgWUAnsJkSu7HgopTZSTWG+RbK/uPG127a9hpndd9lqmyFci5
 Aon4nyHaaac/BY+dyU+6zaXIjda3Mj4+FSjHYfspwnrYkvua3x/rw9wH7Rb1l2PKKs88ZCeoNxs
 4pRpmK50i5rMWWYv8dpzyi0jRoo96Oey89/RR8H3ohOau/QdCmLI6oFVpeAoczjriZyQUZhATzs
 Peod8b7hfWnHlpRqvTvQmDXzEJ7DRZko0w9RYTIuLXA9Pa78m/V3rqsmy/4bVV7BoNEmvbq1zrC
 44SeXZjNk470/Eg==
X-Developer-Key: i=dan.scally@ideasonboard.com; a=openpgp;
 fpr=EEC699ACA1B7CB5D31330C0BBD501C2A3546CCF6
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251002_031842_490189_05CDE295 
X-CRM114-Status: GOOD (  18.24  )
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
index 0000000000000000000000000000000000000000..74f2cdb717e0dddeb11fb1eaba69eeebb2534f95
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
+          - MALI_C55_GPS_PONG
+          - Pong configuration space is fitted in the ISP
+        * - 1
+          - MALI_C55_GPS_WDR
+          - WDR Framestitch, offset and gain is fitted in the ISP
+        * - 2
+          - MALI_C55_GPS_COMPRESSION
+          - Temper compression is fitted in the ISP
+        * - 3
+          - MALI_C55_GPS_TEMPER
+          - Temper is fitted in the ISP
+        * - 4
+          - MALI_C55_GPS_SINTER_LITE
+          - Sinter Lite is fitted in the ISP instead of the full Sinter version
+        * - 5
+          - MALI_C55_GPS_SINTER
+          - Sinter is fitted in the ISP
+        * - 6
+          - MALI_C55_GPS_IRIDIX_LTM
+          - Iridix local tone mappine is fitted in the ISP
+        * - 7
+          - MALI_C55_GPS_IRIDIX_GTM
+          - Iridix global tone mapping is fitted in the ISP
+        * - 8
+          - MALI_C55_GPS_CNR
+          - Colour noise reduction is fitted in the ISP
+        * - 9
+          - MALI_C55_GPS_FRSCALER
+          - The full resolution pipe scaler is fitted in the ISP
+        * - 10
+          - MALI_C55_GPS_DS_PIPE
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


