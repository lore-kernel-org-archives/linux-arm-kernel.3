Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B24B8C0218A
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 28 Jan 2025 17:31:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=kAOnfJk8Ll5ALd+bAgw7fUl/0BuZl2jjNY6ByjGEDvQ=; b=ksmna/bXoqOtkVD4WLMbwMpd0m
	6LIvjvaWTljjaJBn2XxYoRTszZ6esztNy9gpJEVrezXJlHWhgyRWvlWz0I1SFvq9s42OUBpCmHQUD
	FXUpbMxomxbFA5ZMhFfN8URie7MO4VtsV8bsOi2vuViUr19Cx/zBfZK7NPxYD/uPR+bWEGIgzzZ26
	DEuT7KBMZVoYbxHMv0D/syZb2eEFClE2kJU/dMG223BIVn1S4dNk2IpEu+/sJmZ5QJwTRlU1kAKCy
	mP0R5awXkw5pr8Qjva5VMPt9tHPurdJm3YIRS9BqSUziwE+SBWvcMX6ZbWYHS6f+tS3iYUozqVhb4
	BVNnChfg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tcpQU-00000005Rjr-054n;
	Tue, 28 Jan 2025 17:31:02 +0000
Received: from mail-wm1-x32a.google.com ([2a00:1450:4864:20::32a])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tcpP7-00000005RWP-2bjO
	for linux-arm-kernel@lists.infradead.org;
	Tue, 28 Jan 2025 17:29:39 +0000
Received: by mail-wm1-x32a.google.com with SMTP id 5b1f17b1804b1-436326dcb1cso40557395e9.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 28 Jan 2025 09:29:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1738085375; x=1738690175; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=kAOnfJk8Ll5ALd+bAgw7fUl/0BuZl2jjNY6ByjGEDvQ=;
        b=WOX1eGqXxctYayM1Ct+5FgaApcVHA+pMV+mQjrZjCsSM7jPTZvJ/Lg++fj6/wk7jAn
         fdNOnA4RzdvlYFMoOUsHG2NcE5+woLJkQdcRRJu9Sw639vDxD3cM6KgK6fMiK3ApMofc
         0pCuJZHliLD1EslKQJBpLjtz2+OEr2DSWcWqnqLFxVb2kBRxgm+HbcVeIwP/NzsxoIZR
         CJ++DmCHJEIe/VWVS67Lsk7pwt6k7tk7bvDdB67zgw1+ivflv4fB6O2D6DJLZrCr+Z1h
         t5NAIVHJ8c7UViJsG48WxkK5iOjDrBVtj6RtNoV49SzBURYHFfpjB21YugLdXPhli1Ed
         Eg5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738085375; x=1738690175;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=kAOnfJk8Ll5ALd+bAgw7fUl/0BuZl2jjNY6ByjGEDvQ=;
        b=YVy2kMqNqGNDnIIC2PkVBtF/pUGb0FzfDnndEdlXep8zQdlaIkYZTfnIPveNlJuA84
         OMtwfIyW+WZoKRLp2oFKJq2JuN+vQ08irCIyOtpMQ40WT0Ka4MToIs45SeUIrcYkpCUW
         /iBUl8DJBqk/ITySN9gp6HeBiq6U5IXGbJcJ3wzx2q0t8RZo50eq3PYVlOjhO1Nlr9zh
         blRE0b5T4uwSyCox+vvtfUB2HHYWxmcKUbYl6TVRgc3IeTHANIjG4N07dy9nsIfo/+xj
         bFV69a6bgoRfL6FHsLpfFfzDBItiqjtuwtUCTovsa0Ftz9AbmXldsc4k1QnR3WS7KHtL
         eMrA==
X-Forwarded-Encrypted: i=1; AJvYcCUIY0FTniHyxiZYV9diKaqnuyxwZ1KxXEKFaGWjOY5CT3Ul3cMdovORFtpMugHSWKsFa3ZtZkHyQUw01XVt09Qs@lists.infradead.org
X-Gm-Message-State: AOJu0YxCD6j3dDFymXaepV9pyXnvWauBPH11DJts6JgCEfB/rkZZs6DE
	SH0MaaODn9z8MznTFnvBmlbnz/tfelXC9tzBZv1YclUdJ7OoOhc/THbzioG/BpEqCrfVyZ0MOqU
	QXcM=
X-Gm-Gg: ASbGncuNmP9RUKTBFFb4Agx88mYG9wVCVzTzBD2dnvYvudeEDlukn408DjJnwLwaRlP
	5VGTdSSezzBINrDUu+d69k0heTGivAIydJHZxTxpHg46FP3jcmDgIHJDp/xqWIuvi59ncfRWywe
	82Pkhbk4uLGB4OD96kAfRSpe0MKYkW9FN7GjVLW4HimuToUAYOD690r5lbWzZ3bWC9fIgZ3KzgR
	P1iswf455zg9zNarX/Kgx2DhOo8MEX4Mo/uAdNcG5cE0enbYWrAwNZF+AqND1+5YLCW/xFZhSWk
	GszkZY54U3LcpRwqm4di7Wk+VrxWa3lbbcT2eSgUalxJH4xCY/c0JXWYMA==
X-Google-Smtp-Source: AGHT+IHnpSIh7KU+VCphvReRqNWdtBF2d0uF1DAtcKvgsSCXu3zyZ0DubN85Diq5BBxqLd4dY6fFfA==
X-Received: by 2002:a05:600c:1d07:b0:436:488f:50a with SMTP id 5b1f17b1804b1-438913ef4b7mr434270445e9.17.1738085375435;
        Tue, 28 Jan 2025 09:29:35 -0800 (PST)
Received: from localhost (p200300f65f018b0400000000000001b9.dip0.t-ipconnect.de. [2003:f6:5f01:8b04::1b9])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-438bd4d3dbcsm179373075e9.40.2025.01.28.09.29.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 Jan 2025 09:29:35 -0800 (PST)
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>
To: Dinh Nguyen <dinguyen@kernel.org>
Cc: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Subject: [RESEND PATCH] ARM: dts: socfpga: Add basic support for Terrasic's de10-nano
Date: Tue, 28 Jan 2025 18:29:17 +0100
Message-ID: <20250128172917.4565-2-u.kleine-koenig@baylibre.com>
X-Mailer: git-send-email 2.47.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=3277; i=u.kleine-koenig@baylibre.com; h=from:subject; bh=fKuHBkO6gVVCFCdSJFQAmff53FXkCTXexy+1dsxfSo0=; b=owEBbQGS/pANAwAKAY+A+1h9Ev5OAcsmYgBnmRPuX5/KFs5VhMXgFqmSiVVzJ5bVQ6PPqTreF OJZrXZWdRuJATMEAAEKAB0WIQQ/gaxpOnoeWYmt/tOPgPtYfRL+TgUCZ5kT7gAKCRCPgPtYfRL+ Th6LCACXWfB1qMkmQaGWkV0VXqqQa6kJih4Vt2gIq1LZIscv0643PwW/2NSQcz2V9NHDeJTS0sM t88P4qTYZYQnMHWdkE5qkU0v324hMsIZVKyr/Xdid6C4rqCETDUNOSsqNZhLI4qyUWPGWRmBhmO XVk4FVdRS9FBb+Jl3rLItBmSFXisCYzytrtMdK6Bh1Sb97LeHnta6/cZZLNcz3oJ7dOaBz2QdQ7 RZ4fYRFr6pC1o5JsS4h8wRYTJ/6mQJ2XLUXPz4oGV2U+L+U33DxGyBaXpZISbNFeMODQHRuOdVR JxsU1IuH77mmFeCQLAbMHmzw8/qHjN1+EAMLFR0aeGy77Iac
X-Developer-Key: i=u.kleine-koenig@baylibre.com; a=openpgp; fpr=0D2511F322BFAB1C1580266BE2DCDD9132669BD6
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250128_092937_660124_6CE699FE 
X-CRM114-Status: GOOD (  17.71  )
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

in the variant I sent 15 min ago I fatfingered the address of the
linux-arm-kernel list. So here comes a resend with the right address ...

Sorry for the noise
Uwe

 arch/arm/boot/dts/intel/socfpga/Makefile      |  1 +
 .../socfpga/socfpga_cyclone5_de10nano.dts     | 90 +++++++++++++++++++
 2 files changed, 91 insertions(+)
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
index 000000000000..d1f23a57a94d
--- /dev/null
+++ b/arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_de10nano.dts
@@ -0,0 +1,90 @@
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
+	compatible = "altr,socfpga-cyclone5", "altr,socfpga";
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
+		fpga_axi: axi_h2f_lw_bridge@ff200000 {
+			compatible = "simple-bus";
+			reg = <0xff200000 0x00200000>;
+			#address-cells = <1>;
+			#size-cells = <1>;
+			ranges = <0x00000000 0xff200000 0x00200000>;
+		};
+	};
+};
+
+&gmac1 {
+	/* Uses a KSZ9031RNX phy */
+	status = "okay";
+	phy-mode = "rgmii";
+
+	rxd0-skew-ps = <420>;
+	rxd1-skew-ps = <420>;
+	rxd2-skew-ps = <420>;
+	rxd3-skew-ps = <420>;
+	txen-skew-ps = <0>;
+	txc-skew-ps = <1860>;
+	rxdv-skew-ps = <420>;
+	rxc-skew-ps = <1680>;
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
+		compatible = "adi,adxl34x";
+		reg = <0x53>;
+		/* HPS_GSENSOR_INT is routed to UART0_RX/CAN0_RX/SPIM0_SS1/HPS_GPIO61 */
+		interrupt-parent = <&portc>;
+		interrupts = <3 IRQ_TYPE_EDGE_FALLING>;
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
+	 */
+	clock-frequency = <100000000>;
+};

base-commit: 5ffa57f6eecefababb8cbe327222ef171943b183
-- 
2.47.1


