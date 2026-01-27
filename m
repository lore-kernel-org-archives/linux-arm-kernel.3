Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2C909D25921
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 27 Jan 2026 02:57:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=/DD7IDM1AVvzDLxHdmpY/RwCTTEssQcwyPgw/b+OZhM=; b=yhH3dz6N6qlRdwOd+a+hMIHp/x
	bk1POsV2HUDKOXW+SX8JNfTcqw/CwmsniREJWn+Ym0l8TUdfp7ADu3BG9Ex/l2x0WY0+MaUjSSrxq
	KnjCwHpTwf+5G9KmRRXuyjkT5F5vVbGDbCLct1j/NpgE/51m2YyAIHHkMwo56fMMnhX4TBdFCxo3t
	O963pIh4Cj24T0STKlOemDIcbzS8cZJ9w7kCKSG8ML9lOp4HWOwxHz4fDDAphCGNrWIJWiYHxn1uE
	hLT68GoeGVj9qeZhCtJzVBjltbWuKItt4bl2Y+tRwB5oy5Gfel+qCYSRg12gMl/fRhnuEniJxWwwZ
	8R6tU63Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vkZH6-0000000DXQZ-2Onf;
	Tue, 27 Jan 2026 02:57:52 +0000
Received: from mail-pf1-x42f.google.com ([2607:f8b0:4864:20::42f])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vkZH4-0000000DXQ3-0qlL
	for linux-arm-kernel@lists.infradead.org;
	Tue, 27 Jan 2026 02:57:51 +0000
Received: by mail-pf1-x42f.google.com with SMTP id d2e1a72fcca58-8230c839409so4056549b3a.3
        for <linux-arm-kernel@lists.infradead.org>; Mon, 26 Jan 2026 18:57:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1769482669; x=1770087469; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=/DD7IDM1AVvzDLxHdmpY/RwCTTEssQcwyPgw/b+OZhM=;
        b=mCfTGffeHFvJ2+mnMMRmeVkb7bPvw7yiCYQaI8ULcO4t3fBek9wsu8m22dqTRlfzPK
         zIg8g7aYlXEn4cORrtYujrT4Wxr7RFPM0oUOPyKP68B5Mgi5L3KpjhKyM5Apht1D3b3D
         REi+nY6DQ1Iilbk5/AN6s9uq5kxr8GuffjbzB3IRsKx7v0r0tGWvFAVvieb95DaHyEr+
         s5wKZ6PiHPMlqdA9HrKuV0rZxXRPN7bd0i6SOwI/B9olYhrfGsrnTHZdYWd85CavlBzC
         z31aQVbtj/a7v87JfqpSywLgOG7B0j6kJLMU7gIAsdvwqa5QbVArYgRa3z45Iwn6RuU6
         CYKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769482669; x=1770087469;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/DD7IDM1AVvzDLxHdmpY/RwCTTEssQcwyPgw/b+OZhM=;
        b=e2VPYsiRCikXPUYIe7eCdlp9yJ5YCip/siX+C4VC5fElDHJv/Hu1StGb5XZyRWeB9C
         gG9cRTLipmP0AbTcVpjF5qG3ixGotXiJ75XWrqth4BB3B07L/vxSStTdiQQZLTSiUtKJ
         1XtVX/sTZ6UA7hMtl8AFlxLVefE0eMxnadQX977+LYnZQFOUqfWbt9R3Ztknuaew0V7D
         ImWFbLPrWeAE+neNITauo2woHs0ou23VPypkWVYFZDSYk5fQxYNMQBFkY7GCQeEGF/JC
         K2NKf1qKcfMaVnkwSAWqeKuH8Brw+NjzJksI9jHcmw5OBAs/4OoeQrkVfuYY2zOBv/WX
         fL3g==
X-Forwarded-Encrypted: i=1; AJvYcCUcyKKp1QJ2yKAzhTTWVXSGQBHu6qQblhUtJDx1VO6T0VAEiHFFH4mY0WDhP/rpcL/nwVsyLSmS697Uemg+s92F@lists.infradead.org
X-Gm-Message-State: AOJu0YwnfaEm8rmz1P6czR4v8JJU1wR2fgqFpqHttPt2JL8ibwoxc3cZ
	Q9tJwHqc7qoLeKvV65Yz7tjLw6+RNZMwJcsys7eGCgBBaT6aaygJ1BTs
X-Gm-Gg: AZuq6aJX+vEGmWJGR8sN8rUIV2VMzM9fnEpHJlcPqoHnHmwwkRAwL0EcS4tOu/Ob1Mr
	45SL8PNlJ26nPhvJNDOculSmuaMifhEE8iSX+QCs5OmEUwefqBpRTi1lzAIVReEjDhXn6kPEGY3
	L9XNLqTIfSOPV2W3Wo0/7Uqx8jk3bCf5LoEJ/CFEsH6qkkSI8VcjXthhcN2q6qARB3BwH7aLQF+
	UO3qLmQBYanCmeOIODlEwg3IwzH+ZZdUgKeynmbfFIrzL6arBIMu/8WZEA4/jHMYk5h4FytKq0t
	+x8ygZIIKKnSsOvbDA4T9+IcToct4snNal0vHF6ieV6o1Fh7NRTyRkmB5/oUr3C1TpGxzyDnXTB
	KydDyTxFdAbRjxW7GHggbpI1glaUomFL2ng53YaI/NnbGWsA7BZfdeT3vi8NdeQKi3H3kR5DLbn
	k9sy4crk5D8Q2+9gVKdLm1TIV9rYPPgHOz3mZCvzjSR2MW6yO/EFk1BNk=
X-Received: by 2002:a05:6a00:6c84:b0:81f:50ea:5da1 with SMTP id d2e1a72fcca58-82369173d44mr399025b3a.2.1769482668965;
        Mon, 26 Jan 2026 18:57:48 -0800 (PST)
Received: from wig-Precision-3660.. (125-227-154-99.hinet-ip.hinet.net. [125.227.154.99])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-823186467basm10495006b3a.10.2026.01.26.18.57.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Jan 2026 18:57:48 -0800 (PST)
From: Wig Cheng <onlywig@gmail.com>
To: Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>
Cc: Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	zaq14760@gmail.com,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Wig Cheng <onlywig@gmail.com>
Subject: [PATCH] arm64: dts: freescale: add pixpaper display overlay for i.MX93 FRDM
Date: Tue, 27 Jan 2026 10:57:40 +0800
Message-ID: <20260127025740.2601841-1-onlywig@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260126_185750_242916_D5986467 
X-CRM114-Status: GOOD (  15.21  )
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

Add device tree overlay to support the MayQueen PixPaper e-paper display
on the NXP i.MX93 FRDM board. The display is connected via LPSPI3
interface and uses GPIO pins for reset, busy and DC control.

The overlay configures:
    - LPSPI3 pinmux for SPI communication (MOSI, MISO, CLK, CE0)
    - PixPaper display device with proper GPIO assignments
    - SPI frequency set to 5MHz for stable operation

This enables support for the Open-EP Community pixpaper-213-c module on
the NXP i.MX93 platform.

Signed-off-by: Wig Cheng <onlywig@gmail.com>
---
 arch/arm64/boot/dts/freescale/Makefile        |  3 ++
 .../freescale/imx93-11x11-frdm-pixpaper.dtso  | 51 +++++++++++++++++++
 2 files changed, 54 insertions(+)
 create mode 100644 arch/arm64/boot/dts/freescale/imx93-11x11-frdm-pixpaper.dtso

diff --git a/arch/arm64/boot/dts/freescale/Makefile b/arch/arm64/boot/dts/freescale/Makefile
index ce8f937c2315..fedd3552b577 100644
--- a/arch/arm64/boot/dts/freescale/Makefile
+++ b/arch/arm64/boot/dts/freescale/Makefile
@@ -403,6 +403,9 @@ dtb-$(CONFIG_ARCH_MXC) += imx93-kontron-bl-osm-s.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx93-phyboard-nash.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx93-phyboard-segin.dtb
 
+imx93-11x11-frdm-pixpaper-dtbs += imx93-11x11-frdm.dtb imx93-11x11-frdm-pixpaper.dtbo
+dtb-$(CONFIG_ARCH_MXC) += imx93-11x11-frdm-pixpaper.dtb
+
 imx93-phyboard-nash-jtag-dtbs += imx93-phyboard-nash.dtb imx93-phyboard-nash-jtag.dtbo
 imx93-phyboard-nash-peb-wlbt-07-dtbs += imx93-phyboard-nash.dtb imx93-phyboard-nash-peb-wlbt-07.dtbo
 imx93-phyboard-nash-pwm-fan-dtbs += imx93-phyboard-nash.dtb imx93-phyboard-nash-pwm-fan.dtbo
diff --git a/arch/arm64/boot/dts/freescale/imx93-11x11-frdm-pixpaper.dtso b/arch/arm64/boot/dts/freescale/imx93-11x11-frdm-pixpaper.dtso
new file mode 100644
index 000000000000..38e0c5dd82f9
--- /dev/null
+++ b/arch/arm64/boot/dts/freescale/imx93-11x11-frdm-pixpaper.dtso
@@ -0,0 +1,51 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Device Tree Overlay for Mayqueen (Open-EP Community) pixpaper display
+ * support on NXP FRDM i.MX 93 Development Board
+ *
+ * Copyright (C) 2026 Wig Cheng <onlywig@gmail.com>
+ */
+
+#include <dt-bindings/gpio/gpio.h>
+#include "imx93-pinfunc.h"
+
+/dts-v1/;
+/plugin/;
+
+&iomuxc {
+	pinctrl_lpspi3: lpspi3grp {
+		fsl,pins = <
+			MX93_PAD_GPIO_IO08__GPIO2_IO08		0x3fe /* SPI3 CE0 */
+			MX93_PAD_GPIO_IO09__LPSPI3_SIN		0x3fe /* SPI3 MISO */
+			MX93_PAD_GPIO_IO10__LPSPI3_SOUT		0x3fe /* SPI3 MOSI */
+			MX93_PAD_GPIO_IO11__LPSPI3_SCK		0x3fe /* SPI3 CLK*/
+		>;
+	};
+
+	pinctrl_epd_ctrl: epdctrlgrp {
+		fsl,pins = <
+			MX93_PAD_GPIO_IO05__GPIO2_IO05		0x31e /* DC pin */
+			MX93_PAD_GPIO_IO06__GPIO2_IO06		0x31e /* RESET pin */
+			MX93_PAD_GPIO_IO26__GPIO2_IO26		0x31e /* BUSY pin */
+		>;
+	};
+};
+
+&lpspi3 {
+	#address-cells = <1>;
+	#size-cells = <0>;
+	fsl,spi-num-chipselects = <1>;
+	pinctrl-names = "default";
+	pinctrl-0 = <&pinctrl_lpspi3>, <&pinctrl_epd_ctrl>;
+	cs-gpios = <&gpio2 8 GPIO_ACTIVE_LOW>;
+	status = "okay";
+
+	display@0 {
+		compatible = "mayqueen,pixpaper";
+		reg = <0>;
+		spi-max-frequency = <5000000>;
+		reset-gpios = <&gpio2 6 GPIO_ACTIVE_HIGH>;
+		dc-gpios = <&gpio2 5 GPIO_ACTIVE_HIGH>;
+		busy-gpios = <&gpio2 26 GPIO_ACTIVE_HIGH>;
+	};
+};
-- 
2.43.0


