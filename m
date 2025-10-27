Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BF36CCCF9E5
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 27 Oct 2025 13:28:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=VysT7Mn8NKFGdQhAHI7tG5Xcp6xnNIZ6sTmQJxUySJc=; b=pZF3eGztnJhUBMfSsidIdK5vLU
	pmi65k7i+UuJCGtVpb4rHc5pwxxcTrAWcuETLHf/VbOnfvcKMOkeg7KTigrB5x4tNx8EP0uual0zC
	5Vk9XFmCzpt4Jalu+2RFVEkpTZ6AmibwEKYf1T9Yca7XBGQh5lrKuN8nMhJdvuQt3YeDeBGxDmiBJ
	Cwk/kYTMwllTeD9S6oSrZT2GXTk/R5hFcQ3iigVEcZiViw0fMJR4IaXlCw9TcJr2ofZyb8E6RqMW8
	rTbVP4UXUv8CPuoiGPmrPaUhy3fwdlBIc5llc51iLv/cAfL9PJMq0LvElnD4yvEcY/1PEVx9Ud4Uz
	+H1arQsQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vDNHG-0000000E1DY-2132;
	Mon, 27 Oct 2025 13:28:50 +0000
Received: from mxout1.routing.net ([2a03:2900:1:a::a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vDNGx-0000000E11R-04od;
	Mon, 27 Oct 2025 13:28:33 +0000
Received: from mxbulk.masterlogin.de (unknown [192.168.10.85])
	by mxout1.routing.net (Postfix) with ESMTP id 7A9DD40392;
	Mon, 27 Oct 2025 13:28:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailerdienst.de;
	s=routing; t=1761571707;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=VysT7Mn8NKFGdQhAHI7tG5Xcp6xnNIZ6sTmQJxUySJc=;
	b=WN8hrkiVN5VNPPdh87i8/QAbQJLN/STRD8uRX4U9/s2m8nmlKcYpdsQKsI8JSNRrWx0zRv
	p7E3NsIxvLr9OgTZYgEAZ4rZsE6DLbtxWRtIadDqgUoLwa0iRkJkmxjhNf+CGMJODFwE/J
	qQyT05B1AmdHr2kNUInx5HBXcc8hM0c=
Received: from frank-u24.. (fttx-pool-217.61.159.158.bambit.de [217.61.159.158])
	by mxbulk.masterlogin.de (Postfix) with ESMTPSA id 48BD41226C0;
	Mon, 27 Oct 2025 13:28:27 +0000 (UTC)
From: Frank Wunderlich <linux@fw-web.de>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Linus Walleij <linus.walleij@linaro.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: Frank Wunderlich <frank-w@public-files.de>,
	Sean Wang <sean.wang@mediatek.com>,
	Daniel Golle <daniel@makrotopia.org>,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-gpio@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Subject: [PATCH v1 6/6] arm64: dts: mediatek: mt7988a-bpi-r4pro: Add mmc overlays
Date: Mon, 27 Oct 2025 14:28:16 +0100
Message-ID: <20251027132817.212534-7-linux@fw-web.de>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251027132817.212534-1-linux@fw-web.de>
References: <20251027132817.212534-1-linux@fw-web.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251027_062831_259593_35906331 
X-CRM114-Status: GOOD (  12.99  )
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

Add MMC overlays for BPI-R4 Pro.

Signed-off-by: Frank Wunderlich <frank-w@public-files.de>
---
 arch/arm64/boot/dts/mediatek/Makefile         |  2 ++
 .../mt7988a-bananapi-bpi-r4-pro-emmc.dtso     | 33 +++++++++++++++++++
 .../mt7988a-bananapi-bpi-r4-pro-sd.dtso       | 31 +++++++++++++++++
 3 files changed, 66 insertions(+)
 create mode 100644 arch/arm64/boot/dts/mediatek/mt7988a-bananapi-bpi-r4-pro-emmc.dtso
 create mode 100644 arch/arm64/boot/dts/mediatek/mt7988a-bananapi-bpi-r4-pro-sd.dtso

diff --git a/arch/arm64/boot/dts/mediatek/Makefile b/arch/arm64/boot/dts/mediatek/Makefile
index 8e99f6e33b25..776b9274e8fa 100644
--- a/arch/arm64/boot/dts/mediatek/Makefile
+++ b/arch/arm64/boot/dts/mediatek/Makefile
@@ -28,6 +28,8 @@ dtb-$(CONFIG_ARCH_MEDIATEK) += mt7988a-bananapi-bpi-r4-pro-4e.dtb
 dtb-$(CONFIG_ARCH_MEDIATEK) += mt7988a-bananapi-bpi-r4-pro-8x.dtb
 dtb-$(CONFIG_ARCH_MEDIATEK) += mt7988a-bananapi-bpi-r4-pro-cn15.dtbo
 dtb-$(CONFIG_ARCH_MEDIATEK) += mt7988a-bananapi-bpi-r4-pro-cn18.dtbo
+dtb-$(CONFIG_ARCH_MEDIATEK) += mt7988a-bananapi-bpi-r4-pro-emmc.dtbo
+dtb-$(CONFIG_ARCH_MEDIATEK) += mt7988a-bananapi-bpi-r4-pro-sd.dtbo
 dtb-$(CONFIG_ARCH_MEDIATEK) += mt7988a-bananapi-bpi-r4-sd.dtbo
 dtb-$(CONFIG_ARCH_MEDIATEK) += mt8167-pumpkin.dtb
 dtb-$(CONFIG_ARCH_MEDIATEK) += mt8173-elm.dtb
diff --git a/arch/arm64/boot/dts/mediatek/mt7988a-bananapi-bpi-r4-pro-emmc.dtso b/arch/arm64/boot/dts/mediatek/mt7988a-bananapi-bpi-r4-pro-emmc.dtso
new file mode 100644
index 000000000000..5ed2f0a6bd66
--- /dev/null
+++ b/arch/arm64/boot/dts/mediatek/mt7988a-bananapi-bpi-r4-pro-emmc.dtso
@@ -0,0 +1,33 @@
+// SPDX-License-Identifier: (GPL-2.0 OR MIT)
+/*
+ * Copyright (C) 2021 MediaTek Inc.
+ * Author: Frank Wunderlich <frank-w@public-files.de>
+ */
+
+/dts-v1/;
+/plugin/;
+
+/ {
+	compatible = "bananapi,bpi-r4-pro", "mediatek,mt7988a";
+};
+
+&{/soc/mmc@11230000} {
+	pinctrl-names = "default", "state_uhs";
+	pinctrl-0 = <&mmc0_pins_emmc_51>;
+	pinctrl-1 = <&mmc0_pins_emmc_51>;
+	bus-width = <8>;
+	max-frequency = <200000000>;
+	cap-mmc-highspeed;
+	mmc-hs200-1_8v;
+	mmc-hs400-1_8v;
+	hs400-ds-delay = <0x12814>;
+	vqmmc-supply = <&reg_1p8v>;
+	vmmc-supply = <&reg_3p3v>;
+	non-removable;
+	no-sd;
+	no-sdio;
+	#address-cells = <1>;
+	#size-cells = <0>;
+	status = "okay";
+};
+
diff --git a/arch/arm64/boot/dts/mediatek/mt7988a-bananapi-bpi-r4-pro-sd.dtso b/arch/arm64/boot/dts/mediatek/mt7988a-bananapi-bpi-r4-pro-sd.dtso
new file mode 100644
index 000000000000..1ec1a9fbd8ba
--- /dev/null
+++ b/arch/arm64/boot/dts/mediatek/mt7988a-bananapi-bpi-r4-pro-sd.dtso
@@ -0,0 +1,31 @@
+// SPDX-License-Identifier: (GPL-2.0 OR MIT)
+/*
+ * Copyright (C) 2023 MediaTek Inc.
+ * Author: Frank Wunderlich <frank-w@public-files.de>
+ */
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
+&{/soc/mmc@11230000} {
+	pinctrl-names = "default", "state_uhs";
+	pinctrl-0 = <&mmc0_pins_sdcard>;
+	pinctrl-1 = <&mmc0_pins_sdcard>;
+	cd-gpios = <&pio 12 GPIO_ACTIVE_LOW>;
+	bus-width = <4>;
+	max-frequency = <48000000>;
+	cap-sd-highspeed;
+	vmmc-supply = <&reg_3p3v>;
+	vqmmc-supply = <&reg_3p3v>;
+	no-mmc;
+	#address-cells = <1>;
+	#size-cells = <0>;
+	status = "okay";
+};
+
-- 
2.43.0


