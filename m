Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 37ED4C77B7C
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 24 Jun 2025 10:40:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ugzOJI0YKfyW/A3C8ymnBAkIEzkeea57CtTfAGJMQbY=; b=XtYk+zjYogvEMev5fWU1DGmiYj
	NwI54u5eLYRfGFmGiLtjqfXzjzHtP6Tr/PNXQxYk8HZaj6uFIw1vmS9fS/SmBtG89IAJywXJoDDGs
	orBBG9rGt1sOs7Hv4uIqXuzDcNs4epUmV/yRFjudny9v2gg8liRTPYUk5n+mOG+D+E8zddDGi/a/a
	YHrBXV0JS7RLTECbSKsYdluLRbrAdqGNLbDFCqDgxQX2YDy17gd+qp6GYqU09mpuhfEP4rUFGf0M5
	Mou0H4l4lRVJ2H9ftTypaQIyQZFQt4Jj9gdgcUpi9fSnZHoeBp/g8rRg3YCYkBH0WoIJ1mAcdBl2G
	0ovuJuYg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uU14w-00000005Kna-32qN;
	Tue, 24 Jun 2025 10:40:38 +0000
Received: from perceval.ideasonboard.com ([213.167.242.64])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uU0mb-00000005I0S-0xEO
	for linux-arm-kernel@lists.infradead.org;
	Tue, 24 Jun 2025 10:21:42 +0000
Received: from [127.0.1.1] (cpc141996-chfd3-2-0-cust928.12-3.cable.virginm.net [86.13.91.161])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id A68131838;
	Tue, 24 Jun 2025 12:21:17 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1750760478;
	bh=ckOBFBNFbarv/jw2bNjiwduRQVJMz9MPGCyJ2CBi1iI=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=J65NmTezW60NJKuXUtWBZtMBLk0UfPtW+5V7xL01QEOCck0EI7MH5gXYasW99w0Sl
	 W6I3OMc4F0TepvFOpvw35HOAX3zUGOzJbKuzHdfe5FkTi2WkofQFp5xUxTBbHWZSfo
	 WiVREdBHFynQlF5qSRIWW37DMsMA90Jg0VR+vyok=
From: Daniel Scally <dan.scally@ideasonboard.com>
Date: Tue, 24 Jun 2025 11:21:19 +0100
Subject: [PATCH v10 06/17] media: uapi: Add controls for Mali-C55 ISP
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250624-c55-v10-6-54f3d4196990@ideasonboard.com>
References: <20250624-c55-v10-0-54f3d4196990@ideasonboard.com>
In-Reply-To: <20250624-c55-v10-0-54f3d4196990@ideasonboard.com>
To: linux-media@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org
Cc: Anthony.McGivern@arm.com, jacopo.mondi@ideasonboard.com, 
 nayden.kanchev@arm.com, robh+dt@kernel.org, mchehab@kernel.org, 
 krzysztof.kozlowski+dt@linaro.org, conor+dt@kernel.org, 
 jerome.forissier@linaro.org, kieran.bingham@ideasonboard.com, 
 laurent.pinchart@ideasonboard.com, dan.scally@ideasonboard.com, 
 Sakari Ailus <sakari.ailus@linux.intel.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=5495;
 i=dan.scally@ideasonboard.com; h=from:subject:message-id;
 bh=ckOBFBNFbarv/jw2bNjiwduRQVJMz9MPGCyJ2CBi1iI=;
 b=owEBbQKS/ZANAwAKAchJV3psRXUyAcsmYgBoWnwnaWsx5PRyOvZpc7SyC29IbjVXr8c7rNK9T
 GpAaz5uDSiJAjMEAAEKAB0WIQQqyuwyDnZdb+mxmm/ISVd6bEV1MgUCaFp8JwAKCRDISVd6bEV1
 Mlt6D/9a3cfpOu9777x+p/qvaWHRS9QQpM5CEKlrQzc9xHYIqfNcCJKqNQEtYHYmHrb95Xh5qXk
 u/2d1p/YUoWJkFRM7yo925hG4a1s3PWgVjqzrbRPsBLW++9aJhd3ron4MPDqgOQ+cA2j5iBT/Qa
 pXgguI9z6QusH7qFd3lNXxFqsxnG1Q27+NCg2cl9BgcPAAYLup6d0GMEFa94oxnyOUCRgkuD5Za
 G54AknuVlmxTLkNAFCbi+9flCZvaNOB0xOhOd6GZDsEEhGdGQMBUGDwVJaQEMrCILaPm/rDpKh/
 UPGaYhJaxMA5uWaQEjDUgabWjr4eIy3U/3Q/3p4ac1RO4UIvsk6B54PdbGM0l9SEj8mPFtlWMf2
 6yVSMYMxmg1XOFLpvgTYTxGy41t+OpbZ4w/z4glteSkvADaNYSRY2ALJB3qDlVGadBI+do2JTBR
 oLeWef99Dcq7DW8+7iOQDogbQxKmekBktLKN9uAxMywMGqQoV9j7Zt1PpW2REqFc45QEWzJUXBE
 tOOQbCVVBnx8pRwhaPZgKUo1GQ5cw/YB2Vbr1dXftHSMKsC4GpP7s61wkbOHAJjgHweKHz40Tz8
 gbeUOcfEFwj3cNPJIEmT3Zi82mTmewpjFZ27jOofC7WLV0Nx5eY5c6DpTWLtW1cIFeKQfXXWd0l
 +atsb5rlGaiQwig==
X-Developer-Key: i=dan.scally@ideasonboard.com; a=openpgp;
 fpr=EEC699ACA1B7CB5D31330C0BBD501C2A3546CCF6
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250624_032141_420714_F23B1166 
X-CRM114-Status: GOOD (  18.03  )
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
index 0000000000000000000000000000000000000000..e8519da77d737b91a931bbe47920af707eebf110
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
index 0000000000000000000000000000000000000000..2bd60a0d78786be368c2e51b1a0a63fd2a5f690b
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
index 72e32814ea83dee5f1202c1249eac7cf3b85a22a..a31105115410bd041a3ac492ce86becd93a62d87 100644
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


