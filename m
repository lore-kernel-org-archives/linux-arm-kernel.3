Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F2254C83F17
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 14 Jul 2025 15:55:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=xI5dG4GAWX+o4zPwLBRThoFTcwn5XDt38tt3Uil1DQw=; b=LpSenmAa8qkXqkZMzEkYk1cIMn
	ru5782f87Qhr7adpMqbpLPVNhwofw/qRUrV0y8uLMW9JUbXdCF+hcZ2oOhojPyjKkPISsK1kZ123/
	/FIzqPA9zIyMVE+XJSfBxMlSiNUzJ5wtAelpr2I/6wHx6is5odv59ucyAitnop2O26StAfcOCVKOD
	bo8fiG0Gs+RDzkBIiC+JZRBPHc+23lV1/pZJSCG4cfixqB4wO7nor8CvMUH571C4o8khYu0br/ah6
	VCB+MOb0yGqlMmUvqHSdOZULVPFZGlHADblsRXrhWqUF1oA3qnABly77QkVekkObQMuHIegQY+Njd
	ZQgcsamg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ubLWB-00000002lij-1o4L;
	Mon, 14 Jul 2025 15:55:03 +0000
Received: from perceval.ideasonboard.com ([213.167.242.64])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ubKlX-00000002YuF-1LnG
	for linux-arm-kernel@lists.infradead.org;
	Mon, 14 Jul 2025 15:06:52 +0000
Received: from [127.0.1.1] (cpc141996-chfd3-2-0-cust928.12-3.cable.virginm.net [86.13.91.161])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 0D4405526;
	Mon, 14 Jul 2025 17:06:18 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1752505578;
	bh=O+tDrKhCnlyO3VxdYa8wuDFheNrb39NAnju2xLllwRU=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=ZUE9ig/+TFCT4PKpYqTqAkOgxB5BCjuFWco3VDYQZ0XO9TMJI2YQ39dghj31UMSM7
	 Ts+I7qIABrLTV2l4uKkucg5MGHJhcn77ERXhOT2p/uAAqP9zR3iHjxRK7yVKEj8F1C
	 nXUz4fozrABsouDhCRcKqQ9mTqq9wcsvV2yADKj4=
From: Daniel Scally <dan.scally@ideasonboard.com>
Date: Mon, 14 Jul 2025 16:06:34 +0100
Subject: [PATCH v11 08/19] media: uapi: Add controls for Mali-C55 ISP
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250714-c55-v11-8-bc20e460e42a@ideasonboard.com>
References: <20250714-c55-v11-0-bc20e460e42a@ideasonboard.com>
In-Reply-To: <20250714-c55-v11-0-bc20e460e42a@ideasonboard.com>
To: linux-media@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org
Cc: Anthony.McGivern@arm.com, jacopo.mondi@ideasonboard.com, 
 nayden.kanchev@arm.com, robh+dt@kernel.org, mchehab@kernel.org, 
 krzysztof.kozlowski+dt@linaro.org, conor+dt@kernel.org, 
 jerome.forissier@linaro.org, kieran.bingham@ideasonboard.com, 
 laurent.pinchart@ideasonboard.com, dan.scally@ideasonboard.com, 
 Sakari Ailus <sakari.ailus@linux.intel.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=5569;
 i=dan.scally@ideasonboard.com; h=from:subject:message-id;
 bh=O+tDrKhCnlyO3VxdYa8wuDFheNrb39NAnju2xLllwRU=;
 b=owEBbQKS/ZANAwAKAchJV3psRXUyAcsmYgBodR0AtsLIcDRZBMwXNnEfSHXj0wdSUtNPuLI/j
 LUXz9MXY72JAjMEAAEKAB0WIQQqyuwyDnZdb+mxmm/ISVd6bEV1MgUCaHUdAAAKCRDISVd6bEV1
 MvCMD/0ctD8EYpbSh7JO8S1H0+3lX/Ww9iAwLxuKuR1rGBLtvmYlfcUwzaXE1BuVSXDo0s1zN92
 k8Dx9QZkls8FGJ+6++E2OVOXaGjzt6xcy31SK30TuRglVTyfSot421w7K7LOrmb35MT76p9i7OB
 2YvAB5h/+/3aXvCljA3RkJmjbVnovr3Kj/+Ue+znVgSho55smeUjzP9p/PcD8pqMr50M1y58IZG
 NY3V2O4AAkpDRzKfOoojnjkjptUzEarHF4sRYfLJ9Rsc9821qBg+K7Z7Quz8rdKumYAPN07LxqL
 7aC9S2uTOgUfnieqsb9hbApD7OJTLLVfWIYDPfyKIBx6DyA1sGgam0bz+8bD32/6a89Rx/lDlHS
 v5wybrtZSQ6EUhz5XF4AEOLRvHCrp/d/3L1IzJW4szM7D4Z0HoXcyEpAq2GwXXfU78lufP9bPTF
 tSLdw2Ii/IXoVy2mjHkRHl0V8Lj4dnw/9pq9jGUjw+LCoJeLqe1EyGTmnEjtQqH+U2ksfTaB5N4
 10VrTN/mgZC6ti6OIXU7SwITtbMmrjN1q0Ju887UyCQD+egkBbFYubAW+lF9FEByDpql5mAt2GT
 i9R4+4tQrjjtkF38xNZ7QFqpFTtBJxvPyn4XoZpUqACOuml6oqbZPa+njW9ulw6zWlIGHwLDz93
 dgO41GoHn+3SMoA==
X-Developer-Key: i=dan.scally@ideasonboard.com; a=openpgp;
 fpr=EEC699ACA1B7CB5D31330C0BBD501C2A3546CCF6
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250714_080651_516860_4FE46DB8 
X-CRM114-Status: GOOD (  17.98  )
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
Changes in v11:

	- Reserve 16 controls in line with other drivers

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
index f836512e9debbc65d62a9fe04069b056be42f7b2..9f07d80d7af1dfb347fca6e2c65b25bc2cb86af1 100644
--- a/include/uapi/linux/v4l2-controls.h
+++ b/include/uapi/linux/v4l2-controls.h
@@ -228,6 +228,12 @@ enum v4l2_colorfx {
  */
 #define V4L2_CID_USER_RKISP1_BASE		(V4L2_CID_USER_BASE + 0x1220)
 
+/*
+ * The base for the Arm Mali-C55 ISP driver controls.
+ * We reserve 8 controls for this driver
+ */
+#define V4L2_CID_USER_MALI_C55_BASE		(V4L2_CID_USER_BASE + 0x1230)
+
 /* MPEG-class control IDs */
 /* The MPEG controls are applicable to all codec controls
  * and the 'MPEG' part of the define is historical */

-- 
2.34.1


