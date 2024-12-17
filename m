Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 10DABE7717F
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 17 Dec 2024 09:36:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Vzw3HVGrS3X0rMv2pU+DkL1IXWaKv/Nmla/b6qqUPEw=; b=ddlOhnzK0b1FP1csITEz/zKHyN
	Q8p2LjZp+oGfGdhkcd28YbW/d8zPrPpu3r3Xp/BxMjiQ9LRQZo3bPl64ZH4oYMYUSmcsuj4wIuOBC
	lb05VzFjiSB4UqzJ9iABmU/ahT1z8UKVujNgxlQ2RtgFgTroZ8oSdCTav9N6pXEgRIym3g94Vwk2H
	GyGk5Qz3dU7EgE8FPsgK4nvtV4cg8bEWTwM+1YYY3GWjq78CAl8j94iIN5WLRDraSUtbMIyexv3dl
	POp4g5A3I+SSrStdEVew4j0KdxW47C9v/bcu/u2WLvzw2G+9oo1rlM2e9PGTGx8seB96+Jqs85Gu3
	gbd2wYUg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tNU0F-0000000CwtN-0EOh;
	Tue, 17 Dec 2024 09:36:31 +0000
Received: from mxout2.routing.net ([2a03:2900:1:a::b])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tNTdW-0000000Cr5i-28qW;
	Tue, 17 Dec 2024 09:13:03 +0000
Received: from mxbox2.masterlogin.de (unknown [192.168.10.89])
	by mxout2.routing.net (Postfix) with ESMTP id 3598D60276;
	Tue, 17 Dec 2024 09:13:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailerdienst.de;
	s=20200217; t=1734426781;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Vzw3HVGrS3X0rMv2pU+DkL1IXWaKv/Nmla/b6qqUPEw=;
	b=kxy34DUi5yzajm4SBMbVep7x9q9+DYHuLSCp8Hep+oTrm0YQv2GVATYVUsafLn918a1/z5
	nqLQqMiRx88XhUjhQ5myK7y5BwNBWZzyDccsNUeFCoVNFin2ifW8Tf8KydsPU+OuO9UEre
	lfxpMmZwyusQxsBOMX5maNxJ7INVQJ8=
Received: from frank-u24.. (fttx-pool-217.61.150.187.bambit.de [217.61.150.187])
	by mxbox2.masterlogin.de (Postfix) with ESMTPSA id 41CC5100532;
	Tue, 17 Dec 2024 09:13:00 +0000 (UTC)
From: Frank Wunderlich <linux@fw-web.de>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: Frank Wunderlich <frank-w@public-files.de>,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Subject: [PATCH v3 13/22] arm64: dts: mediatek: mt7988a-bpi-r4: Add dt overlays for sd + emmc
Date: Tue, 17 Dec 2024 10:12:27 +0100
Message-ID: <20241217091238.16032-14-linux@fw-web.de>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20241217091238.16032-1-linux@fw-web.de>
References: <20241217091238.16032-1-linux@fw-web.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mail-ID: 8a752277-9aaa-48fa-ab9e-1a08dbf4967b
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241217_011302_687054_9D773FA7 
X-CRM114-Status: GOOD (  13.71  )
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

Bananapi R4 can use the mmc controller either with sd card or the onboard
emmc. The used device is selected through hardware-switches and probed in
bootloader.
Add devicetree overlays for both mmc configurations.

Signed-off-by: Frank Wunderlich <frank-w@public-files.de>
---
 arch/arm64/boot/dts/mediatek/Makefile         |  3 ++
 .../mt7988a-bananapi-bpi-r4-emmc.dtso         | 33 +++++++++++++++++++
 .../mediatek/mt7988a-bananapi-bpi-r4-sd.dtso  | 31 +++++++++++++++++
 3 files changed, 67 insertions(+)
 create mode 100644 arch/arm64/boot/dts/mediatek/mt7988a-bananapi-bpi-r4-emmc.dtso
 create mode 100644 arch/arm64/boot/dts/mediatek/mt7988a-bananapi-bpi-r4-sd.dtso

diff --git a/arch/arm64/boot/dts/mediatek/Makefile b/arch/arm64/boot/dts/mediatek/Makefile
index 8fd7b2bb7a15..33e244898849 100644
--- a/arch/arm64/boot/dts/mediatek/Makefile
+++ b/arch/arm64/boot/dts/mediatek/Makefile
@@ -21,6 +21,8 @@ dtb-$(CONFIG_ARCH_MEDIATEK) += mt7986a-bananapi-bpi-r3-sd.dtbo
 dtb-$(CONFIG_ARCH_MEDIATEK) += mt7986a-rfb.dtb
 dtb-$(CONFIG_ARCH_MEDIATEK) += mt7986b-rfb.dtb
 dtb-$(CONFIG_ARCH_MEDIATEK) += mt7988a-bananapi-bpi-r4.dtb
+dtb-$(CONFIG_ARCH_MEDIATEK) += mt7988a-bananapi-bpi-r4-emmc.dtbo
+dtb-$(CONFIG_ARCH_MEDIATEK) += mt7988a-bananapi-bpi-r4-sd.dtbo
 dtb-$(CONFIG_ARCH_MEDIATEK) += mt8167-pumpkin.dtb
 dtb-$(CONFIG_ARCH_MEDIATEK) += mt8173-elm.dtb
 dtb-$(CONFIG_ARCH_MEDIATEK) += mt8173-elm-hana.dtb
@@ -90,3 +92,4 @@ dtb-$(CONFIG_ARCH_MEDIATEK) += mt8516-pumpkin.dtb
 # Device tree overlays support
 DTC_FLAGS_mt7986a-bananapi-bpi-r3 := -@
 DTC_FLAGS_mt7986a-bananapi-bpi-r3-mini := -@
+DTC_FLAGS_mt7988a-bananapi-bpi-r4 := -@
diff --git a/arch/arm64/boot/dts/mediatek/mt7988a-bananapi-bpi-r4-emmc.dtso b/arch/arm64/boot/dts/mediatek/mt7988a-bananapi-bpi-r4-emmc.dtso
new file mode 100644
index 000000000000..3e320b2f83d5
--- /dev/null
+++ b/arch/arm64/boot/dts/mediatek/mt7988a-bananapi-bpi-r4-emmc.dtso
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
+	compatible = "bananapi,bpi-r4", "mediatek,mt7988a";
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
diff --git a/arch/arm64/boot/dts/mediatek/mt7988a-bananapi-bpi-r4-sd.dtso b/arch/arm64/boot/dts/mediatek/mt7988a-bananapi-bpi-r4-sd.dtso
new file mode 100644
index 000000000000..663c6345dd31
--- /dev/null
+++ b/arch/arm64/boot/dts/mediatek/mt7988a-bananapi-bpi-r4-sd.dtso
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
+	compatible = "bananapi,bpi-r4", "mediatek,mt7988a";
+};
+
+&{/soc/mmc@11230000} {
+	pinctrl-names = "default", "state_uhs";
+	pinctrl-0 = <&mmc0_pins_sdcard>;
+	pinctrl-1 = <&mmc0_pins_sdcard>;
+	cd-gpios = <&pio 12 GPIO_ACTIVE_LOW>;
+	bus-width = <4>;
+	max-frequency = <52000000>;
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


