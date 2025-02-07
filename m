Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F2AEBC02192
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  7 Feb 2025 08:48:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=VU2LURvpuWlLE+ZwmrPv4Em3qMpL5cubt9yeIQOASOs=; b=L2VVxeSxbdp1y3tu+o7T5OkAj1
	zK1N5PLc0OmCWguxVagc8RcMCQFBwXMaqR1xAXzIlLqZ0Epz1BryXUylLCQpnlyuhmZQjttCm6Na+
	JWjQa/EFKE8Au12aM6akC8ytiLTvlc8TDahHXdMHAgyDuaJkHwRqvGRVQEQ1H23eT6ls1RFcvvJfW
	OOo0C8JfXcSTcBo4qRfk7NGIg7/BFjtSJ+1533KCF2FFoBHxcGX1zL8P5ybTa1Y/wb2iVWM2AeBRU
	bbU4QILAkgGB158O+sAf9p9vjV2iImKsNQMK63Y7AL6dxLF5WBq5eyf4mjAbCGfbcJy75/Bm0n0Gc
	nu0XGQaQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tgK1s-00000008sOB-3ngC;
	Fri, 07 Feb 2025 08:48:05 +0000
Received: from mx1.tq-group.com ([93.104.207.81])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tgJrd-00000008qHX-1txC
	for linux-arm-kernel@lists.infradead.org;
	Fri, 07 Feb 2025 08:37:31 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
  t=1738917450; x=1770453450;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=VU2LURvpuWlLE+ZwmrPv4Em3qMpL5cubt9yeIQOASOs=;
  b=eS0rfjRzSfmHPnjjcR4/auoZTArVAy5pwiM3lwwVxmlfCvJH0finZusy
   jVex8cG5H4pAJGIIENV8Z5CXXNjKlTJrrLDQo5fyJIlDEFr/bFn97kco+
   dVSJ8F30gm0WzXl77hzcBsXPWiTrDLdkVntOtxeGrn7C7ViQXOHMaBG8g
   Ztpykgz5yZq0bPVr7kPdUpeswa6MloW8L++1c1Mm/gaF1LWrZICvyLBYr
   gHEhepYME4sOv+W74Mk90104efrK9e+qd42FZCqFOe2HBPm+sfrU3MUHV
   u3ghfwkRtry1GSvDGCtvba6NiJ2Vjxey6DAgpkBNxl1q+jt4QcGHRmzwk
   Q==;
X-CSE-ConnectionGUID: zhYXy1pMQMaw6xj8EE0t+w==
X-CSE-MsgGUID: qpsPfg0xSFC1EqN34PCUPQ==
X-IronPort-AV: E=Sophos;i="6.13,266,1732575600"; 
   d="scan'208";a="41636110"
Received: from vmailcow01.tq-net.de ([10.150.86.48])
  by mx1.tq-group.com with ESMTP; 07 Feb 2025 09:37:07 +0100
X-CheckPoint: {67A5C632-1F-727D2C21-EE1B71AA}
X-MAIL-CPID: 085FFC876C4E2B2C688DB0CCF2FD4F60_5
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id B26AE168340;
	Fri,  7 Feb 2025 09:37:01 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ew.tq-group.com;
	s=dkim; t=1738917422;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=VU2LURvpuWlLE+ZwmrPv4Em3qMpL5cubt9yeIQOASOs=;
	b=B6UFfvxgpjxaOWt4ibeMzpDJYTFrDEZsULVwacDBAc+fxFfOab2dnCHxhGdfzHF869KLmd
	dKM7OOIrGcC5QTip0wbtBWy6hmW2d2/oJebTigXEC5Js5P/SvTCXywbi/7+6Bs/O6ykUXU
	1noXifBhWs4nAvMvd8eIase8vIZ6VWBSosCmpzhHEjEWZb/9+ICO67vyEcqBKwML0++K5Z
	Swi8J4kvjAkfK92x5F6Qav057rTkqqVQVmTxQ0th18JUk4S8t7lY148MbW3xxLOPoS82PV
	8oS5CdHuJG+/iej8ofv6qf+z5udSJi8/HnFoBFRa2zrsRQvOUUl21j4zcQY4HA==
From: Alexander Stein <alexander.stein@ew.tq-group.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Cc: Alexander Stein <alexander.stein@ew.tq-group.com>,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 07/10] arm64: dts: imx8mm: Add i.MX8M Mini OCOTP disable fuse definitions
Date: Fri,  7 Feb 2025 09:36:12 +0100
Message-Id: <20250207083616.1442887-8-alexander.stein@ew.tq-group.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250207083616.1442887-1-alexander.stein@ew.tq-group.com>
References: <20250207083616.1442887-1-alexander.stein@ew.tq-group.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250207_003729_853868_187AE0A5 
X-CRM114-Status: GOOD (  11.63  )
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

These definitions define the location of corresponding disable bits
in OCOTP peripheral.

Signed-off-by: Alexander Stein <alexander.stein@ew.tq-group.com>
---
 arch/arm64/boot/dts/freescale/imx8mm-ocotp.h | 31 ++++++++++++++++++++
 1 file changed, 31 insertions(+)
 create mode 100644 arch/arm64/boot/dts/freescale/imx8mm-ocotp.h

diff --git a/arch/arm64/boot/dts/freescale/imx8mm-ocotp.h b/arch/arm64/boot/dts/freescale/imx8mm-ocotp.h
new file mode 100644
index 0000000000000..87698e7619262
--- /dev/null
+++ b/arch/arm64/boot/dts/freescale/imx8mm-ocotp.h
@@ -0,0 +1,31 @@
+// SPDX-License-Identifier: (GPL-2.0-or-later OR MIT)
+/*
+ * Copyright (c) 2025 TQ-Systems GmbH <linux@ew.tq-group.com>,
+ * D-82229 Seefeld, Germany.
+ * Author: Alexander Stein
+ */
+
+#ifndef __DTS_IMX8MM_OCOTP_H
+#define __DTS_IMX8MM_OCOTP_H
+
+/*
+ * The OCOTP is a tuple of
+ * <fuse_addr fuse_bit_offset>
+ */
+
+#define IMX8MM_OCOTP_M4_DISABLE		20 8
+#define IMX8MM_OCOTP_M4_MPU_DISABLE	20 9
+#define IMX8MM_OCOTP_M4_FPU_DISABLE	20 10
+#define IMX8MM_OCOTP_USB_OTG1_DISABLE	20 11
+#define IMX8MM_OCOTP_USB_OTG2_DISABLE	20 12
+#define IMX8MM_OCOTP_G1_DISABLE		20 18
+#define IMX8MM_OCOTP_G2_DISABLE		20 19
+#define IMX8MM_OCOTP_H1_DISABLE		20 20
+#define IMX8MM_OCOTP_GPU2D_DISABLE	20 21
+#define IMX8MM_OCOTP_PCIE1_DISABLE	20 22
+#define IMX8MM_OCOTP_GPU3D_DISABLE	20 24
+#define IMX8MM_OCOTP_MIPI_DSI_DISABLE	20 28
+#define IMX8MM_OCOTP_ENET_DISABLE	20 29
+#define IMX8MM_OCOTP_MIPI_CSI_DISABLE	20 30
+
+#endif /* __DTS_IMX8MM_OCOTP_H */
-- 
2.34.1


