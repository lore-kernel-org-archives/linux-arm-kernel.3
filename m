Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 23547FC5902
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 26 Feb 2026 14:48:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=r/bj7g2xVbgir6ea9eN+82z6ip7UdFAQ5IC4Yz8wr/Y=; b=2GfloSD/4egOra86wt9icgSdiv
	AJjgJeOaH+HMc9BMVtMRhCDwiPE0PMnPuhYswWaCswkI3QcTDePcLdH+1ShCRdiwAirUjGVKJhVFV
	ruGrblbiYr8xcpy/HEEP0YF2xNZuwNHs9csK8j/dO73QSwUbJD6nUB6VJ9HpALO8NpFFvDuOFfIBn
	qcEtQSPcovM1QTc6tXGT5b2Qyx/wQ+i6PErDjP4goqJTZRkiBnLmmQkJnDX1WAnS32sUXCmaluF7P
	6N6zhlZUELkaLgNTo0kikyAantqWiergSFyBtomVL4ha4hGedSYReuesG2VaMqmYrKiXTu59Dx6MS
	mQbkOBhw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vvcfU-00000006N39-2KpP;
	Thu, 26 Feb 2026 14:48:44 +0000
Received: from mail-pl1-x635.google.com ([2607:f8b0:4864:20::635])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vvcfP-00000006N0Y-2M3e
	for linux-arm-kernel@lists.infradead.org;
	Thu, 26 Feb 2026 14:48:40 +0000
Received: by mail-pl1-x635.google.com with SMTP id d9443c01a7336-2aaf43014d0so7551745ad.2
        for <linux-arm-kernel@lists.infradead.org>; Thu, 26 Feb 2026 06:48:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772117319; x=1772722119; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=r/bj7g2xVbgir6ea9eN+82z6ip7UdFAQ5IC4Yz8wr/Y=;
        b=Wg0LDbqaA0LyUQ5Cs3iPtP1SQBMwmaiA2CysBsgizwca0td4fVuLgmk+XFG9YKHv5D
         fqV+gPWW85yJKDcaFlvDSL9eol78w/pTyvjl9B+Ble+YUX9uiTJqss+xZdDUlEFJAaun
         tUCWmpfpjKsJSm+eT9YvbTGiSQyND+EVFewZEV90n5lAZ49tYiYjFUiSoTa4oBcYCAHc
         4oLUcvfTnUip61OZgCP0lgwyowxxrpDhIltCpbLahozU1z16FPvhKUNkN+407bChzQTL
         t7Z63uM/rxggAX48oZ/S1Hnbdtu84jeJyvzpFTmwlCh+xnquh7Uh5vuPPjMLyvW6jmrb
         xnKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772117319; x=1772722119;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=r/bj7g2xVbgir6ea9eN+82z6ip7UdFAQ5IC4Yz8wr/Y=;
        b=eicWtpXL+PUHT0fYn9iEmtmeZ3o1IGa7iy8TEuZJR/+lFDF5aqTMPV4lGtO1CBsRGj
         XxdTmia4KwD+4j6eFTq6i9apq15aNdbmJK9pgf9fVby1In9uFbYFfsFwmtDGycdRF2Rt
         xuNysUBstGO2V9IECx+kWFV+FR4W7TpDxjdjDWOMcOXKEtVxKj17X95b/XDeLdEOt5Aq
         KUalOnPVEoAfAat4TgQGoqShbr/kkGmLmmIj5Grvrjnx+8fAPUOHsQsrHkx24n/Z8VRa
         4OeVJw+IOiwFNnMmB6hqQl9jE1rV4kWn8vvuvRkaAnHOktJHiogskjRPX7SbN42Utu58
         2UGA==
X-Forwarded-Encrypted: i=1; AJvYcCUgDTdyh256yByM4lndY20RLyFOpNWE8xAV2XCOf1x9bOeEZm29P9DsmFkIrcKL4l0ocAVQveCoD/vy/KTOD3mR@lists.infradead.org
X-Gm-Message-State: AOJu0YwSchAJK2VVJGbOUurrlm4w+aJv8B7KwlUpHBWSykOkmNjWCSLM
	wL6y/gF/ilMmDkC/acsnI0botgO6AN/VSXkB8GazTltF7M9Wp0H/bfeM
X-Gm-Gg: ATEYQzwx4sg8HHT5y6lVvsMiV7SKwGgIVWtfo0Bx4wRFFARXgqPJOH4ViP6kKhULlu9
	hPMiksbWAtT4Om8iGSaAXfaSF18TcQ5m+QMoH8R7AcnP0EnUAZfggl4f/i+5g3xkBRArCSzYQV6
	lOoIopA/VHiKVHApdkR1xb+m5ndfPgVXY8iZDuCoxUgnh5IUgG9dUUCbqcypkemHU3Oa2YeDVgK
	Fj2wEnFV+pUEOp8jzzlFCspnyKCgI0Wv2Rcvj+iX0xsHDJjBrfE7GZS2HSscce3OaPeQvnIrJbk
	iEWNWvyJmgJRBwxukCVp7qH1CCyHpA04oDrA/tRG3WH/+ETt+PXriX5eIma0bgPnIp2TuGCvmlb
	HKGPOTwATFHGPZ7KwrJMYH3pozgH9BGAWEkgDuIzw9MkQF3eZ897GKak5bUjfYHvSt3EQyBpegF
	wm5RWrkMP5mBSG9XlhWqybawcvtSQFWIt9x0Rcr75XoE/wGB6B1y8tK5b3tMDjBwI9FWI=
X-Received: by 2002:a17:902:e785:b0:2ad:c1e1:c286 with SMTP id d9443c01a7336-2adc1e1c458mr70241875ad.24.1772117318539;
        Thu, 26 Feb 2026 06:48:38 -0800 (PST)
Received: from wig-Precision-3660.. (125-227-154-99.hinet-ip.hinet.net. [125.227.154.99])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2adfb69fa65sm27871825ad.58.2026.02.26.06.48.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Feb 2026 06:48:38 -0800 (PST)
From: Wig Cheng <onlywig@gmail.com>
To: shawnguo@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org
Cc: s.hauer@pengutronix.de,
	kernel@pengutronix.de,
	festevam@gmail.com,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	zaq14760@gmail.com,
	Wig Cheng <onlywig@gmail.com>
Subject: [PATCH v5 1/1] arm64: dts: freescale: add pixpaper display overlay for i.MX93 FRDM
Date: Thu, 26 Feb 2026 22:48:19 +0800
Message-ID: <20260226144819.3428730-2-onlywig@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260226144819.3428730-1-onlywig@gmail.com>
References: <20260226144819.3428730-1-onlywig@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260226_064839_607193_EC515FA2 
X-CRM114-Status: GOOD (  14.44  )
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
    - SPI frequency set to 1MHz for stable operation

Enable Open-EP Community pixpaper-213-c support on NXP i.MX93.

Signed-off-by: Wig Cheng <onlywig@gmail.com>
---
 arch/arm64/boot/dts/freescale/Makefile        |  4 ++
 .../freescale/imx93-11x11-frdm-pixpaper.dtso  | 50 +++++++++++++++++++
 2 files changed, 54 insertions(+)
 create mode 100644 arch/arm64/boot/dts/freescale/imx93-11x11-frdm-pixpaper.dtso

diff --git a/arch/arm64/boot/dts/freescale/Makefile b/arch/arm64/boot/dts/freescale/Makefile
index 700bab4d3e60..aa5eb1626c10 100644
--- a/arch/arm64/boot/dts/freescale/Makefile
+++ b/arch/arm64/boot/dts/freescale/Makefile
@@ -417,6 +417,10 @@ dtb-$(CONFIG_ARCH_MXC) += imx93-9x9-qsb-i3c.dtb
 
 dtb-$(CONFIG_ARCH_MXC) += imx93-11x11-evk.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx93-11x11-frdm.dtb
+
+imx93-11x11-frdm-pixpaper-dtbs += imx93-11x11-frdm.dtb imx93-11x11-frdm-pixpaper.dtbo
+dtb-$(CONFIG_ARCH_MXC) += imx93-11x11-frdm-pixpaper.dtb
+
 dtb-$(CONFIG_ARCH_MXC) += imx93-14x14-evk.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx93-kontron-bl-osm-s.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx93-phyboard-nash.dtb
diff --git a/arch/arm64/boot/dts/freescale/imx93-11x11-frdm-pixpaper.dtso b/arch/arm64/boot/dts/freescale/imx93-11x11-frdm-pixpaper.dtso
new file mode 100644
index 000000000000..28aeff9520e2
--- /dev/null
+++ b/arch/arm64/boot/dts/freescale/imx93-11x11-frdm-pixpaper.dtso
@@ -0,0 +1,50 @@
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
+			MX93_PAD_GPIO_IO11__LPSPI3_SCK		0x3fe /* SPI3 CLK */
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
+	pinctrl-names = "default";
+	pinctrl-0 = <&pinctrl_lpspi3>, <&pinctrl_epd_ctrl>;
+	cs-gpios = <&gpio2 8 GPIO_ACTIVE_LOW>;
+	status = "okay";
+
+	display@0 {
+		compatible = "mayqueen,pixpaper";
+		reg = <0>;
+		spi-max-frequency = <1000000>;
+		reset-gpios = <&gpio2 6 GPIO_ACTIVE_HIGH>;
+		dc-gpios = <&gpio2 5 GPIO_ACTIVE_HIGH>;
+		busy-gpios = <&gpio2 26 GPIO_ACTIVE_HIGH>;
+	};
+};
-- 
2.43.0


