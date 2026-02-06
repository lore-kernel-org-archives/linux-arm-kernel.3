Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AA894EE6B59
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  6 Feb 2026 20:32:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=lOn3TJ8VDiSndOjVHpbjRor/zx6dF6y8oFuDewRL8ck=; b=Yloq1IRXOg80gIKPDJxor2gbiZ
	NTkUCROL2jkp2gPg0qM4ITPYIDaPg3hdIX5gjFPBl99O8uZPcTTPAb9V/xEeBoDV3fMMWPNjrn8wq
	o73WzGD9RYCQ0Dz1PVETHkjAMqc6cA6MKxeseXVPpDaJbgGHZTancyNc1a76UKgQRHJYw+mMUbFrJ
	xrWY6dAvBUD+m0hA+pBqLLynoAYabVxbSZ7vNGIEf2lMO1JMbZquWnYXh/XJSOQdb+QwE60s0LoeB
	K7onwQNt06cRSkuKaE1n2XNaKyrqbZc3gNP7YsTam5qoxhav2jEijPJ94o8g6qiYeSpGOLSARZk7K
	OvZV0p5A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1voSVX-0000000BoN4-2BJL;
	Fri, 06 Feb 2026 20:32:51 +0000
Received: from mail-qv1-xf31.google.com ([2607:f8b0:4864:20::f31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1voSVV-0000000BoMj-1gam
	for linux-arm-kernel@lists.infradead.org;
	Fri, 06 Feb 2026 20:32:50 +0000
Received: by mail-qv1-xf31.google.com with SMTP id 6a1803df08f44-894674a4c4aso18314376d6.3
        for <linux-arm-kernel@lists.infradead.org>; Fri, 06 Feb 2026 12:32:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1770409968; x=1771014768; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=lOn3TJ8VDiSndOjVHpbjRor/zx6dF6y8oFuDewRL8ck=;
        b=Z/bnqgXNnjWHRhzopLAE4C8/AxpTST1K58ncjwQlxanTZfpKuwr/STEGNRNt741rpz
         nCk0+dtQRMVWip2wuoE8OD3E8e0VJX3IEw36DSHuu+mCQPwgHHX3iRMUAfHg+MjX8ecI
         1Tq7ipR9KKahJFP/bCad79GSp3D4iqQN40yTnRqnOMsE1lZcr4voh/sg3RmFGZP+qryb
         xChy0IHZfYAnJWAhxgDj83gH8PtBH5E6LO41LntkgJCzdbKhXKb0aN7D4itcG2pgX7kz
         KTg3kHzTVruaZunCueVy9rMda9EaMUZcevuTRFfJuJtJhYGCZo08MWhAdGDOgP8F4pr4
         T8DA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770409968; x=1771014768;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=lOn3TJ8VDiSndOjVHpbjRor/zx6dF6y8oFuDewRL8ck=;
        b=owRKtDHZcz1qfc5MPl81vSeFhn2BectDxkt2csW1N+lwuYBu/kKbgws2NRSzfBD6UU
         qmZnd7/Mn2rLZerszQi63JfpHtoDA6gILihvqGCmV/2QShYyvevHDIduiF8r7eqNUSBT
         s7wF9gHQ+oSYKZGs7dny938cqw38NNIFks0r0x3gXUP8MvRONtfaHU9iY6V77qO5hmDQ
         1rlkuolN4xB91Q3iScaTQQV49fAkK4bMxAtgSaT15MebirPf56MTEvnGJjqfE+3sTwQl
         vDlBKzOzMpPJi7L6XTBO2Z25/Lz4GrYou14RbSXU/jpTQnhMj0MNEfquPPZH77yqbesc
         op3A==
X-Forwarded-Encrypted: i=1; AJvYcCX85+/FYe7v+jDnxI6OkW49Ejqql2MHoSbdypWyVXfLDJRmEjU667cYbLjURorg4xCdvKsiebWj+exRWjhTYyLm@lists.infradead.org
X-Gm-Message-State: AOJu0Yxg2nhDVI6aR+t3xzhjfid3noRKlWUF/Q3fhammvzoG+mZGaNE2
	Lvcpo2IDqDmtM3z2dWXDsG03+iE6w1tKRJHafKCRPjBUtaV8Bjnmf01+evk7eg==
X-Gm-Gg: AZuq6aLGhigm5cEzdSQ3ld0bFDof4bDJDteq9vNpRW8QH32pBfxrY3CbPW4XKWnbWF1
	UdcQoRkO96KBTRiCuHPXaOP+btZq8bEwF6Wu9vtblm/w9AuprvJ8GaPHlxTaJ0xsIJTc0Zhjpfz
	s3JorX5/kJs/sWKeI4JxRvbGx/a2OCA0feyaB8Hk4HMZl76j3QxrAWZjxh1CiMPXhxgg03p5+hp
	Pd2LrfrpNpJJxqQfFRpa5BWdgLtvF/lKpbiF8T+qhQBV/duQYlfRUTyqGilHMhFAOxc9dvw+RmY
	+pcHV6+KaH02vc30DjLbM7NPRq21O8l0xyBq4ccmk03Ux6Htwgz890yLx2F0Y1ro1VggDF2PBSX
	2YR1jl6wU3oNiITD7X7YB9+5FZ8IbrR0KLzG4+QZYCQHwdTFoLkMj6ZZJa38g/tQusHAAlH3PkP
	dIyLlp4NKTBXdCXeCt+PrYCsA3
X-Received: by 2002:a05:690c:d95:b0:795:1fbd:2cf7 with SMTP id 00721157ae682-7952aaa90b6mr35940217b3.27.1770403066852;
        Fri, 06 Feb 2026 10:37:46 -0800 (PST)
Received: from fabio-Precision-3551.. ([2804:14c:485:4b61:44a3:2bb7:a035:fd7e])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-7952a1d9b38sm28008437b3.27.2026.02.06.10.37.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Feb 2026 10:37:46 -0800 (PST)
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
Date: Fri,  6 Feb 2026 15:37:37 -0300
Message-Id: <20260206183737.2701570-1-festevam@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260206_123249_461611_3AFB4729 
X-CRM114-Status: GOOD (  17.73  )
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


