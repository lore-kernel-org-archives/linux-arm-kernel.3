Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 71AABEE6B4D
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  6 Feb 2026 20:20:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=f0zUp2P+g2uFd6hUAI+gJemyvrScR2wFdYRxcOydHJg=; b=Nn0Fz7Pk1INUpZsKGYuKQY2taW
	xN9j3YMZUT94zElxtFzufmbNQ3ov+9odD35RrHjYKApqvXVbqGTzQWPgAgqUzSijGtF+cdgAvY6uo
	2iob7bh5wdbkJylg8omVWij9aAClPDe+xNueR3Z8t8n+jTAsdz6K7rHG9AZ+ZWXVY9key5c9lpaoQ
	P7FgKea9uXZcbYuY+YlvDUMxFaSDwE5m0oyfvrN6M5QXzdNr7Rm0c2RjMDJlz2DcA6IBvguWNSKhe
	FItgnLskbn0TRv/TpdJK/bOZMDA6az6VkKmpthbIVG+Fo8P2oFNh1CM9kkBfVQkhNQwV3OmEucEh1
	kiMF93uQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1voSJo-0000000Bn0q-1DtI;
	Fri, 06 Feb 2026 20:20:44 +0000
Received: from mail-qv1-xf35.google.com ([2607:f8b0:4864:20::f35])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1voSJm-0000000Bn0R-1Zl0
	for linux-arm-kernel@lists.infradead.org;
	Fri, 06 Feb 2026 20:20:43 +0000
Received: by mail-qv1-xf35.google.com with SMTP id 6a1803df08f44-88ffcb14e11so35156126d6.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 06 Feb 2026 12:20:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1770409241; x=1771014041; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=f0zUp2P+g2uFd6hUAI+gJemyvrScR2wFdYRxcOydHJg=;
        b=HgU7SatGe37DLqzfRlC33gekIC7TDTuuDWBxWsM9Pe4eWLabwdAJ77BV3Vpv9o8oKw
         lCngz7wsr6b6ryYphVAgAut1rDEifXTuoU8TiQ+PYx2Vfa8rBEkBx2alkeKYDrr9xX5G
         viFpZ7bwRAW6OqtUbjLkOCV/QjdIa/JFfvC2Yqwtcz67M2GF0cd4CPINlaDaJp1OBr18
         d8XcvMFl7/up6U+zvkOGUMgsrTvCRFXIkJLQKCs1K8nIzDYw41TEDOXobILesN/kbXco
         t84cEFQ962pPAxvzVIyPYQvdQ84vkHUl4rYTbqG6qtaKDpgvsitXD9bRaxKbnGQ2RR7H
         4lnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770409241; x=1771014041;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=f0zUp2P+g2uFd6hUAI+gJemyvrScR2wFdYRxcOydHJg=;
        b=a1KuoS0lSkCVehlEwqjpH966GcPMkDNP/JSxq/s9MeovHW8oR1EDogK/z0NwauHnPM
         Kr6qDpqVDUTyQIEbHX5MUFFDnt+wv/Q+XY5rMFv3ZKAzb0fQT225JSS6vZZo9SlapLnm
         Crehu6PjtCKhWCNHhLkmuOTxtJu+7I1f9QOmjrc+AePm8HDxzAVfG3zqiYQzIAQuHfdU
         WNtSn0/8971qbkXARh+cnTGH8F9/Uw7jTplLHzvRSR4g9wM4vg/0tlKcmP72MvbE2gi3
         yZnnagFBJmQm+6QY7Aaz3NGen1YFK4EbsKTbxkGKKW+Cbf34R95fRNRrW2iHPqFndYPL
         DJgA==
X-Forwarded-Encrypted: i=1; AJvYcCX3Ud4/r805IjzLtVoJcuDtcQo7euBEY7FBpfq8Cq6G3oKTYQPYPVlHrJS2EYjQ7RVBICUwafVNL7M0mHN4yziY@lists.infradead.org
X-Gm-Message-State: AOJu0Yzo1W1uSkEntMvHJlMtr8CQFSIOh/zNnTf4u81XYDjtNH2hOOgs
	GaxDcjfcVEffoPR5/MPgWxT61cmJF99basx/So3OD0KL/uM+bCpIvf1lY/O8dQ==
X-Gm-Gg: AZuq6aLUcUv2bqPwelZHwaP/XNEU/eaeEhNz0zEQq1Udbmnx24y5lwg5xQ2MdeVAkvR
	0lfNgVensz4RVkW7dGkPljHVN+KkkLcXZuCNN1iSLCJ4qz2rifxo1TDfSEuvRK+ooKAop6aM6Ac
	sGrDe2SItsR3pcr3P8PiXljxmfVXrJHWy9jXhuavjNI4rzNoCgqM8x/Y5h6IgfIj47T7KCvxQ1I
	aRb1anwwdHTUTHeHN6ni+0KWfpLtY5dGmRrdcNEzA0y+gbrvsJ6XVoC5hw7edcanxQIuxNc4TeU
	r92hVJ0opZqBXjOywvgU1+SLANHD8w6SVhHYXSzUiaaLBuWDls2eSFa56kR/w4XvSGxgxwRnqsy
	bbJV/o4hfHplRlxc+GGrdB3WnFPcqllA1LGQdVlyQmgmE1Bbcql+k/fXrhEw+kXHtLpV2iolB70
	AQg/pOQ7mz/RRUFAnyoci0dgZz
X-Received: by 2002:a05:7022:51e:b0:124:9f67:6b6f with SMTP id a92af1059eb24-12704025a8amr1636130c88.20.1770403354070;
        Fri, 06 Feb 2026 10:42:34 -0800 (PST)
Received: from fabio-Precision-3551.. ([2804:14c:485:4b61:44a3:2bb7:a035:fd7e])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1270d8e25f1sm576839c88.9.2026.02.06.10.42.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Feb 2026 10:42:33 -0800 (PST)
From: Fabio Estevam <festevam@gmail.com>
To: heiko@sntech.de
Cc: robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	Fabio Estevam <festevam@nabladev.com>
Subject: [PATCH 11/11] ARM: dts: rockchip: Add Onion RV1103B Omega4
Date: Fri,  6 Feb 2026 15:42:27 -0300
Message-Id: <20260206184227.2702488-1-festevam@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260206_122042_446192_AE485312 
X-CRM114-Status: GOOD (  17.62  )
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

From: Fabio Estevam <festevam@nabladev.com>

Onion Omega4 board is a board based on the RV1103B SoC that has:

 - 256 MB of RAM
 - 256 MB of SPI-NAND
 - Ethernet
 - USB OTG
 - Wifi
 - SD card
 - Camera connector

Add the initial support for this board so that it can fully boot into
Linux with the root file system stored in the SPI NAND.

Signed-off-by: Fabio Estevam <festevam@nabladev.com>
---
 arch/arm/boot/dts/rockchip/Makefile           |  1 +
 arch/arm/boot/dts/rockchip/rv1103b-omega4.dts | 92 +++++++++++++++++++
 2 files changed, 93 insertions(+)
 create mode 100644 arch/arm/boot/dts/rockchip/rv1103b-omega4.dts

diff --git a/arch/arm/boot/dts/rockchip/Makefile b/arch/arm/boot/dts/rockchip/Makefile
index 716f5540e438..d8cd5df138cc 100644
--- a/arch/arm/boot/dts/rockchip/Makefile
+++ b/arch/arm/boot/dts/rockchip/Makefile
@@ -1,5 +1,6 @@
 # SPDX-License-Identifier: GPL-2.0
 dtb-$(CONFIG_ARCH_ROCKCHIP) += \
+	rv1103b-omega4.dtb \
 	rv1108-elgin-r1.dtb \
 	rv1108-evb.dtb \
 	rv1109-relfor-saib.dtb \
diff --git a/arch/arm/boot/dts/rockchip/rv1103b-omega4.dts b/arch/arm/boot/dts/rockchip/rv1103b-omega4.dts
new file mode 100644
index 000000000000..512b063bceb1
--- /dev/null
+++ b/arch/arm/boot/dts/rockchip/rv1103b-omega4.dts
@@ -0,0 +1,92 @@
+// SPDX-License-Identifier: (GPL-2.0+ OR MIT)
+/*
+ * Copyright (c) 2022 Rockchip Electronics Co., Ltd.
+ * Copyright (c) 2025 plan44.ch/luz
+ * Copyright (c) 2025 Onion Corporation
+ */
+
+/dts-v1/;
+
+#include "rv1103b.dtsi"
+
+/ {
+	model = "Onion RV1103 Omega4 Board";
+	compatible = "onion,rv1103b-omega4", "rockchip,rv1103b";
+
+	chosen {
+		stdout-path = &uart0;
+	};
+
+	memory@0 {
+		device_type = "memory";
+		reg = <0x0 0x10000000>;
+	};
+
+	leds {
+		compatible = "gpio-leds";
+
+		led-0	{
+			gpios = <&gpio0 RK_PA2 GPIO_ACTIVE_HIGH>;
+			label = "sys";
+			default-state = "on";
+		};
+	};
+};
+
+&fspi0 {
+	bootph-all;
+	status = "okay";
+
+	flash@0 {
+		compatible = "spi-nand";
+		reg = <0>;
+		spi-max-frequency = <75000000>;
+		spi-rx-bus-width = <4>;
+		spi-tx-bus-width = <1>;
+
+		partitions {
+			compatible = "fixed-partitions";
+			#address-cells = <1>;
+			#size-cells = <1>;
+
+			partition@0 {
+				label = "env";
+				reg = <0x00000000 0x00040000>;
+			};
+
+			partition@40000 {
+				label = "idblock";
+				reg = <0x00040000 0x00100000>;
+				read-only;
+			};
+
+			partition@140000 {
+				label = "uboot";
+				reg = <0x00140000 0x00100000>;
+				read-only;
+			};
+
+			partition@240000 {
+				label = "boot";
+				reg = <0x00240000 0x00800000>;
+			};
+
+			partition@a40000 {
+				label = "ubi";
+				reg = <0x00a40000 0x0f5c0000>;
+			};
+		};
+	};
+};
+
+&uart0 {
+	pinctrl-names = "default";
+	pinctrl-0 = <&uart0m0_xfer_pins>;
+	bootph-all;
+	status = "okay";
+};
+
+&wdt {
+	bootph-all;
+	status = "okay";
+};
-- 
2.34.1


