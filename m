Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A637DCCF9E0
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 28 Oct 2025 09:52:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:
	References:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:
	Subject:Date:From:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=60xh9Ohl/uRMIqkpz1M8SfLdCotH1+jJz5M285yYGwo=; b=3HL7/i1za3tERdLfWJ50ypAF70
	PRTdmEKomLCqNeY4oapo92Y9PDM2A5tyl3pKuiaGVoREUC99hC61BlTlSFX0Q6NHs5JzHTdADEZ55
	LuHXF4dVU6UheLkjceSntX9aDhUti44Bko95K3pCFc2QeiKA6RFXEeNtC6API0TZkRZs6oCv8fYAJ
	hKqoKCMlu4TDLNwTCHx/rAE0SyuiG8dbRJpGwNZaRsaPyOk/CiItqYwHkzfoXnSfyd/KBeK03eumt
	mWgc+JSbY8Fo79YosdZdpYjeXOv+vbm4O9lNzRs7FyKHbzAG8Xtc3gZxKsWyZprQ11E22nMBZbIFb
	Mv8U6NGw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vDgNb-0000000Fg2K-0jW9;
	Tue, 28 Oct 2025 09:52:39 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vDgNY-0000000Ffzr-2Lv1;
	Tue, 28 Oct 2025 09:52:36 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id BB5EB61EAA;
	Tue, 28 Oct 2025 09:52:35 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 61DFDC4CEFF;
	Tue, 28 Oct 2025 09:52:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1761645155;
	bh=VfRvfxHkNp+Sx+cA5Lh/JvVKeKMC87cBbA7bDyKqd3Y=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=r4MBzcHOfN4fHMAjBgnHdHtQGntVBrCrN1y/hjO2Gagl2OlIYbVYDVZz0D2z6Clla
	 ANM96AMBm3TMv2aV01XyCVEg0mpjXZR5Fy55Kc9lp3kpZIg6CbeB9xu+Wz6eaRMD38
	 lEbr7EE+N54F24tzWGa05p1Dw5YbfzFbr29yeCBxX1c6BwNg1cdr6mz/mZ9f17sCmb
	 mzOUinZ4sxd5hBedPnmTkqzI+dVyW4FqXgsIb8+W9zzM8kWKh7IC/XXiLgmMtkbpTf
	 jnvBpKCqEhjeZ0F2Qzr8Tqq+9UyVU8wc3nwleuB/HqdwLHWygeo9H8wjlaxRBA68vw
	 c1Bw7M/Nk/9Ow==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 52F92CCF9EC;
	Tue, 28 Oct 2025 09:52:35 +0000 (UTC)
From: Chuan Liu via B4 Relay <devnull+chuan.liu.amlogic.com@kernel.org>
Date: Tue, 28 Oct 2025 17:52:27 +0800
Subject: [PATCH v4 1/8] dt-bindings: clock: Add Amlogic A5 SCMI clock
 controller support
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251028-a5-clk-v4-1-e62ca0aae243@amlogic.com>
References: <20251028-a5-clk-v4-0-e62ca0aae243@amlogic.com>
In-Reply-To: <20251028-a5-clk-v4-0-e62ca0aae243@amlogic.com>
To: Chuan Liu <chuan.liu@amlogic.com>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Jerome Brunet <jbrunet@baylibre.com>, 
 Xianwei Zhao <xianwei.zhao@amlogic.com>, 
 Kevin Hilman <khilman@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Cc: linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-amlogic@lists.infradead.org, 
 linux-arm-kernel@lists.infradead.org
X-Mailer: b4 0.14.1
X-Developer-Signature: v=1; a=ed25519-sha256; t=1761645153; l=1990;
 i=chuan.liu@amlogic.com; s=20240902; h=from:subject:message-id;
 bh=/evrNULktsLWoHm1La7NcTjiKAzAj7ZoYCN/eHSFMb0=;
 b=x0fJIqnE6UIZ1KQ+DPirABxLtqiE+c1UpAv+g5p/TLsd1Ne0UQWD5L7rzaLzDHb0WI61uWdWk
 +jZnMER5OZ+A1aCZTDmL8PeG0OY1vt/32+V8Qn4vwiYQ+KFXAihoZL7
X-Developer-Key: i=chuan.liu@amlogic.com; a=ed25519;
 pk=fnKDB+81SoWGKW2GJNFkKy/ULvsDmJZRGBE7pR5Xcpo=
X-Endpoint-Received: by B4 Relay for chuan.liu@amlogic.com/20240902 with
 auth_id=203
X-Original-From: Chuan Liu <chuan.liu@amlogic.com>
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
Reply-To: chuan.liu@amlogic.com
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

From: Chuan Liu <chuan.liu@amlogic.com>

Add the SCMI clock controller dt-bindings for the Amlogic A5 SoC
family.

Signed-off-by: Chuan Liu <chuan.liu@amlogic.com>
Reviewed-by: Rob Herring (Arm) <robh@kernel.org>
Signed-off-by: Xianwei Zhao <xianwei.zhao@amlogic.com>
---
 include/dt-bindings/clock/amlogic,a5-scmi-clkc.h | 44 ++++++++++++++++++++++++
 1 file changed, 44 insertions(+)

diff --git a/include/dt-bindings/clock/amlogic,a5-scmi-clkc.h b/include/dt-bindings/clock/amlogic,a5-scmi-clkc.h
new file mode 100644
index 000000000000..1bf027d0110a
--- /dev/null
+++ b/include/dt-bindings/clock/amlogic,a5-scmi-clkc.h
@@ -0,0 +1,44 @@
+/* SPDX-License-Identifier: (GPL-2.0-only OR MIT) */
+/*
+ * Copyright (c) 2024 Amlogic, Inc. All rights reserved.
+ * Author: Chuan Liu <chuan.liu@amlogic.com>
+ */
+
+#ifndef __AMLOGIC_A5_SCMI_CLKC_H
+#define __AMLOGIC_A5_SCMI_CLKC_H
+
+#define CLKID_OSC				0
+#define CLKID_SYS_CLK				1
+#define CLKID_AXI_CLK				2
+#define CLKID_CPU_CLK				3
+#define CLKID_DSU_CLK				4
+#define CLKID_GP1_PLL				5
+#define CLKID_FIXED_PLL_DCO			6
+#define CLKID_FIXED_PLL				7
+#define CLKID_ACLKM				8
+#define CLKID_SYS_PLL_DIV16			9
+#define CLKID_CPU_CLK_DIV16			10
+#define CLKID_FCLK_50M_PREDIV			11
+#define CLKID_FCLK_50M_DIV			12
+#define CLKID_FCLK_50M				13
+#define CLKID_FCLK_DIV2_DIV			14
+#define CLKID_FCLK_DIV2				15
+#define CLKID_FCLK_DIV2P5_DIV			16
+#define CLKID_FCLK_DIV2P5			17
+#define CLKID_FCLK_DIV3_DIV			18
+#define CLKID_FCLK_DIV3				19
+#define CLKID_FCLK_DIV4_DIV			20
+#define CLKID_FCLK_DIV4				21
+#define CLKID_FCLK_DIV5_DIV			22
+#define CLKID_FCLK_DIV5				23
+#define CLKID_FCLK_DIV7_DIV			24
+#define CLKID_FCLK_DIV7				25
+#define CLKID_SYS_MMC_PCLK			26
+#define CLKID_SYS_CPU_CTRL			27
+#define CLKID_SYS_IRQ_CTRL			28
+#define CLKID_SYS_GIC				29
+#define CLKID_SYS_BIG_NIC			30
+#define CLKID_AXI_SYS_NIC			31
+#define CLKID_AXI_CPU_DMC			32
+
+#endif /* __AMLOGIC_A5_SCMI_CLKC_H */

-- 
2.42.0



