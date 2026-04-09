Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 91C3EEA3C4E
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  9 Apr 2026 13:18:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=FP0oUVRJTrSUxMu2T07s70jxaRLS0hdrFQ/m0Q/hA+Q=; b=0xAIpZ4kJ4a8GDfsXXJ/MH1RwK
	mQ3vdygRJqIIWF1x1aveSMaUJmJ/4cel7elZtEfDDXkXg57sGvpq7kTaWTc6SrjxlY9fwNFudKHx+
	ovdcUTYaQZOA5B8Tu+JeDQ5Wg2yHpQqOUOZ6IcNDiQ7mhkPSg3M6KYgFbKOxIyhWTzvwOpQYcM+td
	ApNir1EoHFqKGOL9BS0hypwBXUNL+ygGCsd0+SOX0FEOsco1gSsBENFjSN8zDc8b8LxchNX0K/I+P
	aCPcK3B/3K3/ngHE2L48L+lG4D1j3SPLnEi7JIzC+CMXE5y62bbKZxRyGsJyg0LggyQDsQUZximCX
	Xbd+HWKw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wApH6-0000000ATPb-0Zp4;
	Thu, 09 Apr 2026 13:18:42 +0000
Received: from mxout4.routing.net ([2a03:2900:1:a::9])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wApGu-0000000ATIT-144K;
	Thu, 09 Apr 2026 13:18:23 +0000
Received: from mxbulk.masterlogin.de (unknown [192.168.10.85])
	by mxout4.routing.net (Postfix) with ESMTP id C3BA51009C2;
	Thu,  9 Apr 2026 13:18:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailerdienst.de;
	s=routing; t=1775740684;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=FP0oUVRJTrSUxMu2T07s70jxaRLS0hdrFQ/m0Q/hA+Q=;
	b=iV0xX78RKUFysO0SCY6atUDJ50w1E4gjRr9piRQFNNUelEZZqUGIIIELa2i46AHEVAn2vU
	gkCgLa+xTPI1h9nOaky8G/A0ZtyblL13rfo8FFBc0qqm/QXyfm3QK4AUV2kvGKH4WZr26+
	TgAuH5YNtYn8+GP2l9q4FhzKKfMuU+o=
Received: from frank-u24.. (fttx-pool-217.61.155.21.bambit.de [217.61.155.21])
	by mxbulk.masterlogin.de (Postfix) with ESMTPSA id 9B1A5122703;
	Thu,  9 Apr 2026 13:18:04 +0000 (UTC)
From: Frank Wunderlich <linux@fw-web.de>
To: Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: Frank Wunderlich <frank-w@public-files.de>,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	devicetree@vger.kernel.org,
	Daniel Golle <daniel@makrotopia.org>,
	Andrew LaMarche <andrewjlamarche@gmail.com>
Subject: [PATCH v1 3/3] arm64: dts: mediatek: mt7988a-bpi-r4pro: rework pcie gpio-hog handling
Date: Thu,  9 Apr 2026 15:17:51 +0200
Message-ID: <20260409131754.121737-4-linux@fw-web.de>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260409131754.121737-1-linux@fw-web.de>
References: <20260409131754.121737-1-linux@fw-web.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260409_061812_578758_4A1A45BE 
X-CRM114-Status: GOOD (  14.25  )
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

From: Frank Wunderlich <frank-w@public-files.de>

The active-high property in base-dt cannot be overwritten and must be
set in separate overlay.

Fixes: f397471a6a8c ("arm64: dts: mediatek: mt7988: Add devicetree for BananaPi R4 Pro")
Signed-off-by: Frank Wunderlich <frank-w@public-files.de>
---
 arch/arm64/boot/dts/mediatek/Makefile         |  8 ++++++++
 .../mt7988a-bananapi-bpi-r4-pro-cn13.dtso     | 20 +++++++++++++++++++
 .../mt7988a-bananapi-bpi-r4-pro-cn14.dtso     | 20 +++++++++++++++++++
 .../mediatek/mt7988a-bananapi-bpi-r4-pro.dtsi |  2 --
 4 files changed, 48 insertions(+), 2 deletions(-)
 create mode 100644 arch/arm64/boot/dts/mediatek/mt7988a-bananapi-bpi-r4-pro-cn13.dtso
 create mode 100644 arch/arm64/boot/dts/mediatek/mt7988a-bananapi-bpi-r4-pro-cn14.dtso

diff --git a/arch/arm64/boot/dts/mediatek/Makefile b/arch/arm64/boot/dts/mediatek/Makefile
index 387faa9c2a09..a86fb313b1a9 100644
--- a/arch/arm64/boot/dts/mediatek/Makefile
+++ b/arch/arm64/boot/dts/mediatek/Makefile
@@ -47,6 +47,8 @@ dtb-$(CONFIG_ARCH_MEDIATEK) += mt7988a-bananapi-bpi-r4-2g5.dtb
 dtb-$(CONFIG_ARCH_MEDIATEK) += mt7988a-bananapi-bpi-r4-emmc.dtbo
 dtb-$(CONFIG_ARCH_MEDIATEK) += mt7988a-bananapi-bpi-r4-pro-4e.dtb
 dtb-$(CONFIG_ARCH_MEDIATEK) += mt7988a-bananapi-bpi-r4-pro-8x.dtb
+dtb-$(CONFIG_ARCH_MEDIATEK) += mt7988a-bananapi-bpi-r4-pro-cn13.dtbo
+dtb-$(CONFIG_ARCH_MEDIATEK) += mt7988a-bananapi-bpi-r4-pro-cn14.dtbo
 dtb-$(CONFIG_ARCH_MEDIATEK) += mt7988a-bananapi-bpi-r4-pro-cn15.dtbo
 dtb-$(CONFIG_ARCH_MEDIATEK) += mt7988a-bananapi-bpi-r4-pro-cn18.dtbo
 dtb-$(CONFIG_ARCH_MEDIATEK) += mt7988a-bananapi-bpi-r4-pro-emmc.dtbo
@@ -70,18 +72,24 @@ mt7988a-bananapi-bpi-r4-2g5-sd-dtbs := \
 dtb-$(CONFIG_ARCH_MEDIATEK) += mt7988a-bananapi-bpi-r4-2g5-sd.dtb
 mt7988a-bananapi-bpi-r4-pro-8x-emmc-dtbs := \
 	mt7988a-bananapi-bpi-r4-pro-8x.dtb \
+	mt7988a-bananapi-bpi-r4-pro-cn13.dtbo \
+	mt7988a-bananapi-bpi-r4-pro-cn14.dtbo \
 	mt7988a-bananapi-bpi-r4-pro-emmc.dtbo
 dtb-$(CONFIG_ARCH_MEDIATEK) += mt7988a-bananapi-bpi-r4-pro-8x-emmc.dtb
 mt7988a-bananapi-bpi-r4-pro-8x-sd-dtbs := \
 	mt7988a-bananapi-bpi-r4-pro-8x.dtb \
+	mt7988a-bananapi-bpi-r4-pro-cn13.dtbo \
+	mt7988a-bananapi-bpi-r4-pro-cn14.dtbo \
 	mt7988a-bananapi-bpi-r4-pro-sd.dtbo
 dtb-$(CONFIG_ARCH_MEDIATEK) += mt7988a-bananapi-bpi-r4-pro-8x-sd.dtb
 mt7988a-bananapi-bpi-r4-pro-8x-sd-cn15-dtbs := \
 	mt7988a-bananapi-bpi-r4-pro-8x-sd.dtb \
+	mt7988a-bananapi-bpi-r4-pro-cn14.dtbo \
 	mt7988a-bananapi-bpi-r4-pro-cn15.dtbo
 dtb-$(CONFIG_ARCH_MEDIATEK) += mt7988a-bananapi-bpi-r4-pro-8x-sd-cn15.dtb
 mt7988a-bananapi-bpi-r4-pro-8x-sd-cn18-dtbs := \
 	mt7988a-bananapi-bpi-r4-pro-8x-sd.dtb \
+	mt7988a-bananapi-bpi-r4-pro-cn13.dtbo \
 	mt7988a-bananapi-bpi-r4-pro-cn18.dtbo
 dtb-$(CONFIG_ARCH_MEDIATEK) += mt7988a-bananapi-bpi-r4-pro-8x-sd-cn18.dtb
 dtb-$(CONFIG_ARCH_MEDIATEK) += mt8167-pumpkin.dtb
diff --git a/arch/arm64/boot/dts/mediatek/mt7988a-bananapi-bpi-r4-pro-cn13.dtso b/arch/arm64/boot/dts/mediatek/mt7988a-bananapi-bpi-r4-pro-cn13.dtso
new file mode 100644
index 000000000000..973b76ba0cbf
--- /dev/null
+++ b/arch/arm64/boot/dts/mediatek/mt7988a-bananapi-bpi-r4-pro-cn13.dtso
@@ -0,0 +1,20 @@
+// SPDX-License-Identifier: (GPL-2.0 OR MIT)
+/*
+ * Copyright (C) 2025 MediaTek Inc.
+ * Author: Frank Wunderlich <frank-w@public-files.de>
+ */
+
+/* This enables key-m slot CN13 on pcie2(11280000 1L0) on BPI-R4-Pro */
+
+/dts-v1/;
+/plugin/;
+
+#include <dt-bindings/gpio/gpio.h>
+
+/ {
+	compatible = "bananapi,bpi-r4-pro", "mediatek,mt7988a";
+};
+
+&{/soc/pinctrl@1001f000/pcie-2-hog} {
+	output-high;
+};
diff --git a/arch/arm64/boot/dts/mediatek/mt7988a-bananapi-bpi-r4-pro-cn14.dtso b/arch/arm64/boot/dts/mediatek/mt7988a-bananapi-bpi-r4-pro-cn14.dtso
new file mode 100644
index 000000000000..90b2a64459c3
--- /dev/null
+++ b/arch/arm64/boot/dts/mediatek/mt7988a-bananapi-bpi-r4-pro-cn14.dtso
@@ -0,0 +1,20 @@
+// SPDX-License-Identifier: (GPL-2.0 OR MIT)
+/*
+ * Copyright (C) 2025 MediaTek Inc.
+ * Author: Frank Wunderlich <frank-w@public-files.de>
+ */
+
+/* This enables key-m slot CN14 on pcie3(11290000 1L1) on BPI-R4-Pro */
+
+/dts-v1/;
+/plugin/;
+
+#include <dt-bindings/gpio/gpio.h>
+
+/ {
+	compatible = "bananapi,bpi-r4-pro", "mediatek,mt7988a";
+};
+
+&{/soc/pinctrl@1001f000/pcie-3-hog} {
+	output-high;
+};
diff --git a/arch/arm64/boot/dts/mediatek/mt7988a-bananapi-bpi-r4-pro.dtsi b/arch/arm64/boot/dts/mediatek/mt7988a-bananapi-bpi-r4-pro.dtsi
index 7f770a76775a..5c5d4e26aa56 100644
--- a/arch/arm64/boot/dts/mediatek/mt7988a-bananapi-bpi-r4-pro.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt7988a-bananapi-bpi-r4-pro.dtsi
@@ -432,14 +432,12 @@ mux {
 	pcie-2-hog {
 		gpio-hog;
 		gpios = <79 GPIO_ACTIVE_HIGH>;
-		output-high;
 	};
 
 	/* 1L1 0=key-b (CN18), 1=key-m (CN14) */
 	pcie-3-hog {
 		gpio-hog;
 		gpios = <63 GPIO_ACTIVE_HIGH>;
-		output-high;
 	};
 
 	pwm0_pins: pwm0-pins {
-- 
2.43.0


