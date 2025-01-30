Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D75AAC02193
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 30 Jan 2025 07:47:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=z0pIOz024yVvRmPpSADqakt2/CZ1i2/TTqHHzBkDPHE=; b=gItKj856aReSheZYMk1BD+Qk0H
	q60HumJOc0XEMAnxQlRJQPTih1poMvdpzWPjSkfbWu5PLVD+aSYrRFAyLcOM5nenIbAgZEVEmFOxY
	aMxAHWUha9D+8xBOBwiiVHgZiSz8+7/M/lvUA4MlcZPiM7uO7fRVrysN4UQDyqsSJbS5VD/Xq8JN5
	oLrpAvM/OoMtqYeycTyHqsGoR9UV2PrfC0oxi+1yMHfhDp1s27KxjArzjbqzOJGCST/21khz6ZpMe
	p8uQeA841PYDDlLjZ/OOfOHDwta05JczCnleBMXCeiM8GPue6wQS9e052R1tZl5ggZTAdVEfQg9Vx
	qAQmXhfA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tdPH6-00000008NYJ-3fBs;
	Thu, 30 Jan 2025 07:47:44 +0000
Received: from mail-ej1-x643.google.com ([2a00:1450:4864:20::643])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tdPFk-00000008NT4-3x8t
	for linux-arm-kernel@lists.infradead.org;
	Thu, 30 Jan 2025 07:46:23 +0000
Received: by mail-ej1-x643.google.com with SMTP id a640c23a62f3a-ab698eae2d9so106169066b.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 29 Jan 2025 23:46:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1738223179; x=1738827979; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=z0pIOz024yVvRmPpSADqakt2/CZ1i2/TTqHHzBkDPHE=;
        b=q7hAl7lPtN7q/ENxLX1Qe4uzLm2vguAWxhhiAovy9Dkf6/hYp6ObNpjOlos0D+baIl
         7sCBcfjMFB1c0Z/1RPzMrpX6f3oc2rAsB2f8BZ4ybF8h37JXUpa6RAZ04h9RAMEQ2Xl6
         uOdgfKnrH4o1apWcEZWr5ZFkJ9Pk/O6fYiCA/o+7K7Cal/rEWFa7tXqT90pKEqR8Fy20
         RTgpZmrfGh1fpw4ROxd1/mzDf3McRPXzu9oOSTWXTP5jpoGELoOFyQy8wwgsJUFJpHix
         lYUOBq0+l7P+f4DpHCoNOLtWq00xuEMV5iVTKMEHHmlIkFUXciiMSFe15XLhqFonhDeE
         7Ncw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738223179; x=1738827979;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=z0pIOz024yVvRmPpSADqakt2/CZ1i2/TTqHHzBkDPHE=;
        b=u1wFIod0X51yxSRINnBFS5ivL980EMa8mKvlLBC1KT4DmrQz8R1iZqcnLdK96nceJC
         DHCJA6UvsAM7Jh2tkhfGfmdOezqLGpS+QqxLR745iBWPy6wHMEypUUItsDd0zkA8YnJW
         ni8FiMFNDc5QMMAAhyRyTjrWXqEVjpLVwAOhdf327URGAihKxUS0rDUzXPgC4PmgP4y/
         I/wxu7VQKvHNlFzDHRFGMUt+g2RvJXYBnhMHfm3Bv660g8k2pbyzKX3XcdtgexWZMFtC
         oD/0YfpkZxDEyg3qCwpwjU7kj1YzhKMp3SufKiXF3PqJ25betPMPcEiHK0BFq7WcrM2h
         Kn9Q==
X-Forwarded-Encrypted: i=1; AJvYcCXEFfNWLrjihs6W0iRSG8XuxjVqDHMrvRDfpj4ITxb6jlFqY8y1NsxOVZoVD3VALBrlTCbn7pk4RRghB4ZeAo5v@lists.infradead.org
X-Gm-Message-State: AOJu0YwF4VF9xfr5lLEvUsAZ0AZw1PXHS9WTbqzb5UM/Y+Qc6YEiPAzV
	+KmcFaiizK0NN4xudGH+Lr9kb3QVq0MXGO0pYhOjVpEyrgg2IYoqAyQloeaHhQE=
X-Gm-Gg: ASbGnct6TxlCj4s3c+tPxJTMcV1kbmXqOUzxVTee1Uz8x+9p7gEk8UVzTZP72JHqAYs
	dV8PcWLRIGDzsxy9/llvy+XXftD5WbTvEDkBUUOB23tHLyMwc9BZ65vHR+EaiNuooOiDJdsx9CM
	c0o7wzu+lX6ApfTA+Ii0fiMKmUA4vWawewXXr8DReNy3DytdIwkIwi2BI2Nfj5hsGFFeMVRzP8J
	8hgPQBxBaRy9DPxER1LlGEtxRrblO3p5FkZzMewqWdxL9aomrFNdAEgoPd09wbMNoP7O8oeyp0T
	SIAk/EDmPKYP1eMpcXMz
X-Google-Smtp-Source: AGHT+IFcKDDU+wzywvRFXRv+mz37DoGrhLm44oa0UcC/mBtiS0TuHbl73j+4RdNdYVb39gPos/Tqyw==
X-Received: by 2002:a17:907:72c1:b0:aa6:ab70:4a78 with SMTP id a640c23a62f3a-ab6cfda4254mr731869866b.37.1738223178524;
        Wed, 29 Jan 2025 23:46:18 -0800 (PST)
Received: from localhost ([2a02:8071:b783:6940:36f3:9aff:fec2:7e46])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ab6e47a7fc2sm74260466b.37.2025.01.29.23.46.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 Jan 2025 23:46:17 -0800 (PST)
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>
To: Dinh Nguyen <dinguyen@kernel.org>
Cc: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	Andrew Lunn <andrew@lunn.ch>
Subject: [PATCH v2] ARM: dts: socfpga: Add basic support for Terrasic's de10-nano
Date: Thu, 30 Jan 2025 08:45:53 +0100
Message-ID: <20250130074553.92023-2-u.kleine-koenig@baylibre.com>
X-Mailer: git-send-email 2.47.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=4066; i=u.kleine-koenig@baylibre.com; h=from:subject; bh=xlmF6eh30PWWmx8Jnf3W4wGQKgY4ZbGOMbpsInwv5ZU=; b=owEBbQGS/pANAwAKAY+A+1h9Ev5OAcsmYgBnmy4xRbHi1C5/vlWMI5uLfwDmzwS1yXxTbwmPF 2gAGIiwXXqJATMEAAEKAB0WIQQ/gaxpOnoeWYmt/tOPgPtYfRL+TgUCZ5suMQAKCRCPgPtYfRL+ Tij2B/9btUcTBOblVvu0/UTiMNKtXobsN3Gch2FO1mPwSs8y9N2hmGvmIKhxL7zrz9+npfqAAl4 svQqR8zBa41eNWN9L4PvjusFLHC9iZifaI9283HPHAaR1IWETD1GzMt51HBc0pOOsgcy10j1Psk cQGEchXDDVtuMzfcj/+X/ejPbnYrwEP4afgoo2/4pDCRP/+kCqnx2PUd24Q2SOYHIbS3aF8URIH KVBi6vuw6lEKnlbrJeqiLTQqPjJLuAj5FVn2fvBdmyhS7IOE6cEeUpdGAqb52Q92yaieScWNHAe htxgdxH4XlY3YoJypnCe51/ZaX1dcWuyGfCrlvhR+hHoEB+f
X-Developer-Key: i=u.kleine-koenig@baylibre.com; a=openpgp; fpr=0D2511F322BFAB1C1580266BE2DCDD9132669BD6
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250129_234621_246603_6ABD691D 
X-CRM114-Status: GOOD (  22.81  )
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

This dts is enough to make the board boot to Linux with the rootfs on
a micro SD card.

Signed-off-by: Uwe Kleine-König <u.kleine-koenig@baylibre.com>
---
Hello,

changes since (implicit) v1 available at
https://lore.kernel.org/linux-arm-kernel/20250128172917.4565-2-u.kleine-koenig@baylibre.com/:

 - Use rgmii-id for ethernet/mdio. (Andrew Lunn)
 - Add a compatible entry for the machine (only had the SoC before),
   fix compatible for accelerometer and various other small
   improvements, most of them pointed out by the dt checker.
   (Krzysztof Kozlowski)

There are still warnings when the dtb is built, but they all originate
from the SoC dtsi.

Something I forgot to say in v1: The accelerometer fails to probe
(readout of the device ID yields an error). This also doesn't work for
me with the downstream kernel and dtb. I didn't debug that. Is that a
reason to drop it?

Best regards
Uwe

 arch/arm/boot/dts/intel/socfpga/Makefile      |  1 +
 .../socfpga/socfpga_cyclone5_de10nano.dts     | 95 +++++++++++++++++++
 2 files changed, 96 insertions(+)
 create mode 100644 arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_de10nano.dts

diff --git a/arch/arm/boot/dts/intel/socfpga/Makefile b/arch/arm/boot/dts/intel/socfpga/Makefile
index c467828aeb4b..7f69a0355ea5 100644
--- a/arch/arm/boot/dts/intel/socfpga/Makefile
+++ b/arch/arm/boot/dts/intel/socfpga/Makefile
@@ -10,6 +10,7 @@ dtb-$(CONFIG_ARCH_INTEL_SOCFPGA) += \
 	socfpga_cyclone5_mcvevk.dtb \
 	socfpga_cyclone5_socdk.dtb \
 	socfpga_cyclone5_de0_nano_soc.dtb \
+	socfpga_cyclone5_de10nano.dtb \
 	socfpga_cyclone5_sockit.dtb \
 	socfpga_cyclone5_socrates.dtb \
 	socfpga_cyclone5_sodia.dtb \
diff --git a/arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_de10nano.dts b/arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_de10nano.dts
new file mode 100644
index 000000000000..ec25106caacf
--- /dev/null
+++ b/arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_de10nano.dts
@@ -0,0 +1,95 @@
+// SPDX-License-Identifier: GPL-2.0+
+/*
+ * Copyright (C) 2017, Intel Corporation
+ *
+ * based on socfpga_cyclone5_de0_nano_soc.dts
+ */
+/dts-v1/;
+
+#include "socfpga_cyclone5.dtsi"
+#include <dt-bindings/interrupt-controller/irq.h>
+#include <dt-bindings/gpio/gpio.h>
+
+/ {
+	model = "Terasic DE10-Nano";
+	compatible = "terasic,de10-nano", "altr,socfpga-cyclone5", "altr,socfpga";
+
+	chosen {
+		stdout-path = "serial0:115200n8";
+	};
+
+	memory@0 {
+		/* 1 GiB */
+		device_type = "memory";
+		reg = <0x0 0x40000000>;
+	};
+
+	soc {
+		fpga: bus@ff200000 {
+			compatible = "simple-bus";
+			reg = <0xff200000 0x00200000>;
+			ranges = <0x00000000 0xff200000 0x00200000>;
+			#address-cells = <1>;
+			#size-cells = <1>;
+
+			/*
+			 * Here the devices will appear if an FPGA image is
+			 * loaded. Their description is expected to be added
+			 * using a device tree overlay that matches the image.
+			 */
+		};
+	};
+};
+
+&gmac1 {
+	/* Uses a KSZ9031RNX phy */
+	phy-mode = "rgmii-id";
+	rxd0-skew-ps = <420>;
+	rxd1-skew-ps = <420>;
+	rxd2-skew-ps = <420>;
+	rxd3-skew-ps = <420>;
+	txen-skew-ps = <0>;
+	rxdv-skew-ps = <420>;
+	status = "okay";
+};
+
+&gpio0 {
+	status = "okay";
+};
+
+&gpio1 {
+	status = "okay";
+};
+
+&gpio2 {
+	status = "okay";
+};
+
+&i2c0 {
+	clock-frequency = <100000>;
+	status = "okay";
+
+	accelerometer@53 {
+		compatible = "adi,adxl345";
+		reg = <0x53>;
+		/* HPS_GSENSOR_INT is routed to UART0_RX/CAN0_RX/SPIM0_SS1/HPS_GPIO61 */
+		interrupt-parent = <&portc>;
+		interrupts = <3 IRQ_TYPE_LEVEL_HIGH>;
+		interrupt-names = "INT1";
+	};
+};
+
+&mmc0 {
+	/* micro SD card socket J11 */
+	status = "okay";
+};
+
+&uart0 {
+	/*
+	 * Accessible via USB (FT232R) on Mini-USB plug J4
+	 * RX = TRACE_D0/SPIS0_CLK/UART0_RX/HPS_GPIO49
+	 * TX = TRACE_D1/SPIS0_MOSI/UART0_TX/HPS_GPIO50
+	 * no handshaking lines
+	 */
+	clock-frequency = <100000000>;
+};

base-commit: a13f6e0f405ed0d3bcfd37c692c7d7fa3c052154
-- 
2.47.1


