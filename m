Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B350AC02192
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  3 Feb 2025 16:51:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=L9+03P7z0avApzRxSE8OHdOBfBkTQmNQT3BrMB4Jc2o=; b=2sJqzCW2nVOogQbAhhmWXHCwem
	MTl/ZA+mk2vWRM3xjTj+um1KRPT7EawvYzKYSHBTe7emOLU+43W5+UrnAaTtfotHtm88JUZpRubeX
	E9SEgxKFNfs/2jBOyhRZDp7dE5YMJ2FoQyAGG6OGg5eqa79Z2U0HRpm1O8i1FQvAKFfeRH4LvjpcO
	G6kaFHG2JjzJRR+6gMg25ncPSFVTjg/a8FFf8CC3L4DRu+IV8z9zjRitwk76SwPso+tczdZI4p6dK
	nMkuP2F50IW3l85juRmf0cx7DgpQ9+d21scpNBvzOv5v1T+ZZUKq1CGObMNGgAW41Nmu2y+8VcITw
	S179M1Ig==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tezey-0000000G3Ix-0FWj;
	Mon, 03 Feb 2025 16:50:56 +0000
Received: from mail-ed1-x52d.google.com ([2a00:1450:4864:20::52d])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tezb5-0000000G2mX-0r76
	for linux-arm-kernel@lists.infradead.org;
	Mon, 03 Feb 2025 16:46:56 +0000
Received: by mail-ed1-x52d.google.com with SMTP id 4fb4d7f45d1cf-5dc75f98188so7318059a12.2
        for <linux-arm-kernel@lists.infradead.org>; Mon, 03 Feb 2025 08:46:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1738601213; x=1739206013; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=L9+03P7z0avApzRxSE8OHdOBfBkTQmNQT3BrMB4Jc2o=;
        b=ZXRQNQNNFRCmksCs7uirYYtNeZwmJ97oSE//RAz3j8UXRxdfbpvWpcLYUciQiTTQv2
         cf3BlQSgrbvVkSZazQW3e6vRbVPAdQF7DYG0R0blr3k2T2Wsq8fQJhKCku0LuE6lppCX
         Ij43imWZtM+11O762VVYTjSwVxSQooDDzyZxfHWK4Jl+vvekpkAuoxPJ/fxfwYLuw48f
         psVsAfOoozDXO4XMFG/S1zVYU6LKwRyszHcrbQhzjad4cjihqEoD9QPhCdaBLMihm+Q9
         q6shjFI68n97BBubc6G6JChZZeDpSr/vH3rXTjnijSurWf+puSmIBU1mo0W2vk2rTeXN
         1omw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738601213; x=1739206013;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=L9+03P7z0avApzRxSE8OHdOBfBkTQmNQT3BrMB4Jc2o=;
        b=S3bvtDYKZFdmVgNVNhEjjyrE8Kwy1hAk2xyKQd82IiO6dKfEwR4yiALlg4R04Ba6UJ
         u/0Uu6l4Q1DiXxjRPsIwMlBJ7QxsAoe8QGs0PkD4/HuVsK8QvR+BjEv3a7CZBSFVq93x
         Fp8gRMqHlSkNg3Kc2hy+zUCwcJIfoMQVjag84leVYD7bWGoJ/zVrSDlb3X2eRwLYWvH5
         xa0sg4EdF04XhLdDVRO0/rcDqgzzJXMFFpthUSIrJ3X0zkc21/JNkZLU5agqX2HwHusn
         /Y7hMVZO1S/HC5lCUUEHWv9TmmrinQESK+7cpZZjZi1pmlJGMiHYu5+y2eS52WigesM5
         ji+w==
X-Forwarded-Encrypted: i=1; AJvYcCX0UeAmbXOS4kEpqkW60bJLKmLpi9F8NDQQVFcYnK/YjH6q/Uj4D0ApgH/CMEcDFZpsMbhfCUjU33MCJ5eCTGJc@lists.infradead.org
X-Gm-Message-State: AOJu0YzsEjiO7A26jsHQ2/aNLzKZUlpPsFtvbIanRm4ld+IL2OhzFkVS
	v4vk3+wns+Jbx4DaPnvcL+2SrFAOZa8izZ+oVdnFr+gXXRlHHZVc3yPI3+j9cOU=
X-Gm-Gg: ASbGnctZ2zsgFmA8DkHhvI/aQbeJ66URk2piCj1Avc0bbYzdKxXnqsWVtC1a1xeK01W
	9Iof/WgUnckTxrMTdpvt8T9OD1i4qXx8eHkM2Uy+pVOclWdNuosmhL8aDgaJZ7fjIq1x2uZPqcr
	Ut471p/GH/sqtgdDu/6c0eiV3EbtE/P3/RR1p5Zo8PrjWNUziidMCGhCZdLTzQ7ehhqi18J7Puc
	ilGk4e2LAHVX0XhsYfnc3cO605NTSQH5nEUEuIs6A5+d3oH+DBMsz24igH2Kzv4sceZ6Iqy1LQQ
	o36aSjX3B229RG3ywu7tcH/9wbdSek8FZeCSeUG7lyXN2aEz6OmMqQ2RBg==
X-Google-Smtp-Source: AGHT+IGXKowKtyUUoNQsQZKSiRVgsHYNzwy9PBuoWWS5QtZ8kgCfCHy+5XfpxGpFAIktnIAemtNbNw==
X-Received: by 2002:a17:907:2cc2:b0:ab3:a18f:fe7f with SMTP id a640c23a62f3a-ab6cfd08354mr2163573766b.28.1738601213587;
        Mon, 03 Feb 2025 08:46:53 -0800 (PST)
Received: from localhost (p200300f65f018b0400000000000001b9.dip0.t-ipconnect.de. [2003:f6:5f01:8b04::1b9])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ab6e47a7ea7sm774071366b.5.2025.02.03.08.46.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Feb 2025 08:46:53 -0800 (PST)
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>
To: Dinh Nguyen <dinguyen@kernel.org>
Cc: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH v3 2/2] ARM: dts: socfpga: Add basic support for Terrasic's de10-nano
Date: Mon,  3 Feb 2025 17:46:37 +0100
Message-ID: <0cb54b0340ef021e309e49ca0de97809a8c8ee9c.1738600838.git.u.kleine-koenig@baylibre.com>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <cover.1738600838.git.u.kleine-koenig@baylibre.com>
References: <cover.1738600838.git.u.kleine-koenig@baylibre.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=3242; i=u.kleine-koenig@baylibre.com; h=from:subject:message-id; bh=D3N91S8p2QzyAU5S/aUxL5/FSxwbyrZC806jeovc1gw=; b=owEBbQGS/pANAwAKAY+A+1h9Ev5OAcsmYgBnoPLxz8wxH/bB1dnBJcAlNRD4y13WuAOi/ZckD sHSH3mm+A+JATMEAAEKAB0WIQQ/gaxpOnoeWYmt/tOPgPtYfRL+TgUCZ6Dy8QAKCRCPgPtYfRL+ TkA3CACY8JVC3PdpFlmR11opae8Askv6ZtTAXBjNhhKTuPDAO6bWufxfaZvR1WlJh8cB7Codn9y ikRdM0+PIbmxoNvSkCyX9RaehsTU0gjvMigd/FeyF5nv5rgGtpZNmlvOiVDRWKy2P7tHohiqrfd xEpTLnZi9NgEWcY3xcSAmZeNg8xjN4xzEY0I8PfkDOGbhuRbmEFB0h6EH8wUsZwDDXCYCMYWyCQ +dRjnbvRIM8T4t89tF7aqqd1pxYV0Q5E8soi9qhN8iiGhadxuu18onY0mVRJSzHbi/bB1HIaQeY WTc/U1m0F7pY6R7LJSck2N8IrWSP9Z4ktvWWlathNhlXH5rx
X-Developer-Key: i=u.kleine-koenig@baylibre.com; a=openpgp; fpr=0D2511F322BFAB1C1580266BE2DCDD9132669BD6
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250203_084655_241542_D88ACE7F 
X-CRM114-Status: GOOD (  19.09  )
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
-- 
2.47.1


