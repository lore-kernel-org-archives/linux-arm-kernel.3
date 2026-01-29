Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C910AD46BF0
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 29 Jan 2026 02:29:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Jyw7q0/YQsMTgrYvASBDoKvdAbxjjEM7hz6Ka6xcckU=; b=E3E73ph6PU2giYvh1P9unfvQzl
	okUSn13QvQeUBpV4zbWhtM5o0OvsSS4afK7oPv+mvSjcuGOafhj4ZMd2FVHbW9/sM/D6zdwjBECXN
	jXqREhj7diCDw6Buq8Y5FgxkF6GRIdyr3wNd5g9HtzK2uU9+CoKxHmrVByh5Rs4I34nZdW0vFYSR4
	j7vCdhLs5FWDJsV21mFQAgoTINSXXZ4HzcE13ypVEOFRkFATdzLZyx+rVr5eKWGBrk/IV+Bt8Y5Hq
	cQEkm/c9YS/7XsFIHlSv3ewxsArwBUMBw3z2K9lDn0hroylDGFKC0fizEon7/nz7jKIY/edmiZUvS
	g8EQEKXg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vlHmi-0000000H87g-2rqf;
	Thu, 29 Jan 2026 02:29:28 +0000
Received: from mail-pj1-x102d.google.com ([2607:f8b0:4864:20::102d])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vlHme-0000000H86l-0l0l
	for linux-arm-kernel@lists.infradead.org;
	Thu, 29 Jan 2026 02:29:25 +0000
Received: by mail-pj1-x102d.google.com with SMTP id 98e67ed59e1d1-3532aa9a77eso201881a91.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 28 Jan 2026 18:29:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1769653763; x=1770258563; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Jyw7q0/YQsMTgrYvASBDoKvdAbxjjEM7hz6Ka6xcckU=;
        b=VUDKUzBAJ2/5YndjhUKyiStDzw0hi/7oSPh1WEXLilLQ+UXl8f0enVbVUSCR3tS47W
         OQ3rNmX/e9itpCbma852Juf8VEjwYiFPjZ1A1BaAEsglUx4x402ufAVR45DxWUxcSryV
         pEFkUIh8xd7RfeerplrgYHvKyzq5MXKRMimTkQWAoKgzSnhvNkHnOXIbj0yyP9dM73yo
         0avEw+tM4KWb4MQNNyPCRJw4XIF0ufMoGioPq1cQUHv8Bwgj/6WgyX9Kp6ZKsvDTyG6B
         HFDB8yHFO67dLl/1Vz6O+K4PD5XED/LyLLINihKcQqteN4xZ+UdZro196VAkeUhJGyjD
         4I6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769653763; x=1770258563;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Jyw7q0/YQsMTgrYvASBDoKvdAbxjjEM7hz6Ka6xcckU=;
        b=iBbHS9hBHRl7ooeZNXLox65ueaXZ7gH/KFNFspnyD+HIYQMwZg19yfkMvhpJVwBvKo
         us4Npogs1K8xvNv8nBLhe3SkdPlb4gIl56ymJ3UmCjFKSSbll7s30anoBDzwW0WyQHZx
         vbB4f79dcArDZvnDavFQDDvH0aHdFoPR2igrUf+hIiuSC0gEbRxPQMc4rWVcK58iprL+
         3b+AsjjkivW5qISEQ0klcsusZv6b4fdqJWN1BzrJsR3c/5TzlDAp+QgJl92VWQmtQtsH
         wiLfFK7t9i4jN8lySk6dByWKBzfkzYOaoCDrX88/Q1bWn5etrH9bHxdeJ3amrnzI/Mjq
         jOVg==
X-Forwarded-Encrypted: i=1; AJvYcCWQYTO+XfCQ/Jv+7XWdb65GEsYi3lxg3r+7mK1QHGbXF/UkqDDa26c7vt6grVQzOq8z9z2mLDm2rzxJKxsWFc6Y@lists.infradead.org
X-Gm-Message-State: AOJu0Yzwsz/mneMtw7bZ28WQusBYzqrEU6WHU81UXzX2GkxqkgBWpp90
	Gp3kFy+12o3nzr8n3dxlQvrfLe+u6aAwCAN97AiqhrP5DLONaLKf1k/Z
X-Gm-Gg: AZuq6aKuHd2yM9d6GfPTUZ7VFJtAtb3LNP37r3wirvGEbpX37AkhA/XBo3/QDoBMIoY
	6XZ8bc0R2je8auAXwXS/N+BRPqmQTW8HvfOmBpzho/jWrfGW//KN/El5e3UvyVO58xj1cV+DYux
	tagiyurC3PTwRL2qyVvcc0EpGhFmb2XiF2FbSg67P721o9AYw/0JrDdUZxiIxBX3uXXZEB+X2uQ
	rJ33AdNu4wA7WJFx9mEReYybGLz1rmLgCjTOwFcTcJcHMRFXI3XY3C5ZAzbeJByBBeiKDfSZvQp
	6ESgl/4kab2lRKvTccqSlDUNLchubCPZOCpTPCBIvaGd+E2hYEiwRFHO2uXAel2tHVnIHo8MCff
	Sm1mbn+E0ibT02Mwr1GtL3E+tXyUWc8tAxCcDRRGxFX+QVybF0KJPClqfSaftrugbIIQriMFMIg
	ToZb0QPuhT4SYQQhJ/abMJ2R/Q6SjfVkRp5qcbdAGDYO1y0ah4+Nywm+A=
X-Received: by 2002:a17:90b:1d48:b0:32e:a8b7:e9c with SMTP id 98e67ed59e1d1-353fed8ac13mr6667239a91.29.1769653763199;
        Wed, 28 Jan 2026 18:29:23 -0800 (PST)
Received: from wig-Precision-3660.. (125-227-154-99.hinet-ip.hinet.net. [125.227.154.99])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3540f2f0283sm4380542a91.5.2026.01.28.18.29.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Jan 2026 18:29:22 -0800 (PST)
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
Subject: [PATCH v4 1/1] arm64: dts: freescale: add pixpaper display overlay for i.MX93 FRDM
Date: Thu, 29 Jan 2026 10:29:10 +0800
Message-ID: <20260129022910.3942028-2-onlywig@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260129022910.3942028-1-onlywig@gmail.com>
References: <20260129022910.3942028-1-onlywig@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260128_182924_243113_6AECAC02 
X-CRM114-Status: GOOD (  14.05  )
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

Enable Open-EP Community pixpaper-213-c support on NXP i.MX93.

Signed-off-by: Wig Cheng <onlywig@gmail.com>
---
 arch/arm64/boot/dts/freescale/Makefile        |  4 ++
 .../freescale/imx93-11x11-frdm-pixpaper.dtso  | 50 +++++++++++++++++++
 2 files changed, 54 insertions(+)
 create mode 100644 arch/arm64/boot/dts/freescale/imx93-11x11-frdm-pixpaper.dtso

diff --git a/arch/arm64/boot/dts/freescale/Makefile b/arch/arm64/boot/dts/freescale/Makefile
index ce8f937c2315..c2727f8061e2 100644
--- a/arch/arm64/boot/dts/freescale/Makefile
+++ b/arch/arm64/boot/dts/freescale/Makefile
@@ -398,6 +398,10 @@ dtb-$(CONFIG_ARCH_MXC) += imx93-9x9-qsb-i3c.dtb
 
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
index 000000000000..5fee27a589b5
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
+		spi-max-frequency = <5000000>;
+		reset-gpios = <&gpio2 6 GPIO_ACTIVE_HIGH>;
+		dc-gpios = <&gpio2 5 GPIO_ACTIVE_HIGH>;
+		busy-gpios = <&gpio2 26 GPIO_ACTIVE_HIGH>;
+	};
+};
-- 
2.43.0


