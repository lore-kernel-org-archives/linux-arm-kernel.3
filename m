Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 94322C43458
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  6 Jul 2026 20:00:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=0OrIWzKlthBSIE9zhLtGuPFvJioePjr2EjSPr8Ts66c=; b=tmvrdDZgdEEfQD/bGxxgRN42dy
	FDsGOAlnRIwoFmB9T1A7ZboyGn60HmL2ef+SvxRSaYS++cwv7tO+HgboIxFBMGqn69CrSy047zzPN
	a6RYAbYyyTY2gfwOu/BPCkLCByhZuLIeaIqi5uDGWadsOdvuTRmbOj4bYnBtbQLvYDBM8DRCHhb/b
	HWCNVGncH/kj5TRMttkdlOdkCEXJ854/PHLfHPmMAr3KMpovELAY6ajSx6cT4qfOYNuJW9BdmeFWk
	9W4IvvyeZhkDpgOr8XiYUSqQpbAqLhhb3K7+3fIKdZkAbASzpBz8xBQ+igQlqxvbZjX/q0LZASeP5
	vkS0JN3w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wgpTt-0000000DVyI-1bI3;
	Mon, 06 Jul 2026 19:59:53 +0000
Received: from mail-ot1-x330.google.com ([2607:f8b0:4864:20::330])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wgpTh-0000000DVda-2F8g
	for linux-arm-kernel@lists.infradead.org;
	Mon, 06 Jul 2026 19:59:43 +0000
Received: by mail-ot1-x330.google.com with SMTP id 46e09a7af769-7eb34c17b96so2160277a34.2
        for <linux-arm-kernel@lists.infradead.org>; Mon, 06 Jul 2026 12:59:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1783367980; x=1783972780; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0OrIWzKlthBSIE9zhLtGuPFvJioePjr2EjSPr8Ts66c=;
        b=nhqmqw3qdLSECitm6ek/4HdlkHKg7bdML3Q1gzo/4ypq29wYsUzRY/saKDj0wbxFVC
         8t7Ne2kSmEfF3T2mhXnrumE9Qp3f04Rf7YD94ef5M953nOpJO8RmmPZ54uhK+PNjTfgc
         4c7kV02PmXMbLVej6izvL/ZTAPBKLtRlrHVUI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783367980; x=1783972780;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=0OrIWzKlthBSIE9zhLtGuPFvJioePjr2EjSPr8Ts66c=;
        b=JzU3mMd0ApWD3jc0zFtLmPxTNRy2yok3L6nmQUYYTB+Pw5yBnEAS+C/eHUq+BMEYCL
         E2a8/U3dcrzJQGFQ/fHOxVoR57aCb91PRx1K7IsTWqbaPBF3AgpjlvG0qr5K6xmd/A+2
         LUL0tPYpO7KJ04Xlm3Jvuzy/+cKCNGEmrdHrcRlWz/A6drzR4mCaTooP+BNBHmUSlF/Q
         XJLmEmyBmzpv9aNROS9vNq/fT1GDAXvbEa7qn+Zo0Dnp8aaS72ah9yuMzrzYJUy04oFp
         cDNoChJTzL9x+oyN7WvN9gtohBAah0zN8VSI2k+39ToLnYqYefJVgqrRQlS1hqrUAG6I
         l/Jg==
X-Forwarded-Encrypted: i=1; AFNElJ/eu0VwPtHBiHZVdyifadaTQKpa7AHAQnWHBJQjEPqH/uvFMqe5+0bFclvDlxxZ/oLw/TQuVu5Tk63Au3C3k+x+@lists.infradead.org
X-Gm-Message-State: AOJu0YzskI1zzwsc24qleLx4B1XurSCmDEgQEa/rSA/FmLfEaYUxzWm0
	4PZrvnhtdMvtDNAslCZX77V6s04YZt5yAnJcmgcD4Yn3eJqEexKrY47eVg+UVxrFqQ==
X-Gm-Gg: AfdE7clMIJuKxixC8R/LfEEvfvf+V6ap57IbGSRzcL1MJF/vbjU1HUjbdPI3j1R2jgY
	fbHxMeXCFEJ1mkVmDE9ogaex3JwZspJonGk470CAJ39KXVwl2tBlAB/l3oWHhk4rYjOsBLHMoZa
	RkRni5UlC3xATvlyLNZn0Mzbr5LGxHL0YscsyWxdjA5wMET3Qmm7Xr5R11ikey6cnA3dZMQXMaA
	cUQGwabJaZEnsAINdqeHRGnouLAFQxf9hItUIVxsBlllC/gIsYcIZp58V2TcGc5upDTB7cDvmRX
	XyJrr6wSaPPT/+793NRgqI5O7YOl2QUdDjNMVFf4+y1klSbufr4RX/m+MjZYnc5RQZiNeGvCHJq
	zBvdjpfy2oRTpfUUVHPUoeT2leb+dnOUdafCspXj1AeAUM7s1l3WMhC8oOkkWXCArwjPWKpSJUc
	o2c5qQeR4=
X-Received: by 2002:a05:6830:6ae8:b0:7e9:b4d0:5399 with SMTP id 46e09a7af769-7ebb239a3femr1194548a34.26.1783367980231;
        Mon, 06 Jul 2026 12:59:40 -0700 (PDT)
Received: from chromium.org ([174.51.25.52])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-7eb542d017csm12161834a34.8.2026.07.06.12.59.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Jul 2026 12:59:39 -0700 (PDT)
From: Simon Glass <sjg@chromium.org>
To: Heiko Stuebner <heiko@sntech.de>
Cc: linux-rockchip@lists.infradead.org,
	devicetree@vger.kernel.org,
	Fabio Estevam <festevam@nabladev.com>,
	linux-arm-kernel@lists.infradead.org,
	Simon Glass <sjg@chromium.org>,
	Albert Aribaud <albert.u.boot@aribaud.net>,
	Conor Dooley <conor+dt@kernel.org>,
	Jeffy Chen <jeffy.chen@rock-chips.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Rob Herring <robh@kernel.org>,
	huang lin <hl@rock-chips.com>,
	linux-kernel@vger.kernel.org
Subject: [PATCH 12/12] ARM: dts: rockchip: Add Luckfox Pico Mini B
Date: Mon,  6 Jul 2026 13:58:08 -0600
Message-ID: <20260706195818.3906949-13-sjg@chromium.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260706195818.3906949-1-sjg@chromium.org>
References: <20260706195818.3906949-1-sjg@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260706_125941_618204_F527D01C 
X-CRM114-Status: GOOD (  16.26  )
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

Add the devicetree for the Luckfox Pico Mini B, a small board using
the Rockchip RV1103 with 64MB of in-package DDR2, a 128MB Winbond SPI
NAND and a microSD slot. The console is on UART2.

Signed-off-by: Simon Glass <sjg@chromium.org>
---

 arch/arm/boot/dts/rockchip/Makefile           |  1 +
 .../rockchip/rv1103-luckfox-pico-mini-b.dts   | 93 +++++++++++++++++++
 2 files changed, 94 insertions(+)
 create mode 100644 arch/arm/boot/dts/rockchip/rv1103-luckfox-pico-mini-b.dts

diff --git a/arch/arm/boot/dts/rockchip/Makefile b/arch/arm/boot/dts/rockchip/Makefile
index d0154fd7ff24..62a2ed96dd9b 100644
--- a/arch/arm/boot/dts/rockchip/Makefile
+++ b/arch/arm/boot/dts/rockchip/Makefile
@@ -1,5 +1,6 @@
 # SPDX-License-Identifier: GPL-2.0
 dtb-$(CONFIG_ARCH_ROCKCHIP) += \
+	rv1103-luckfox-pico-mini-b.dtb \
 	rv1103b-omega4-evb.dtb \
 	rv1108-elgin-r1.dtb \
 	rv1108-evb.dtb \
diff --git a/arch/arm/boot/dts/rockchip/rv1103-luckfox-pico-mini-b.dts b/arch/arm/boot/dts/rockchip/rv1103-luckfox-pico-mini-b.dts
new file mode 100644
index 000000000000..287dbf1307e8
--- /dev/null
+++ b/arch/arm/boot/dts/rockchip/rv1103-luckfox-pico-mini-b.dts
@@ -0,0 +1,93 @@
+// SPDX-License-Identifier: (GPL-2.0+ OR MIT)
+/*
+ * Copyright (c) 2023 Luckfox Electronics Co., Ltd
+ */
+
+/dts-v1/;
+
+#include "rv1103.dtsi"
+
+/ {
+	model = "Luckfox Pico Mini B";
+	compatible = "luckfox,pico-mini-b", "rockchip,rv1103";
+
+	aliases {
+		mmc0 = &sdmmc;
+		serial2 = &uart2;
+	};
+
+	chosen {
+		stdout-path = "serial2:115200n8";
+	};
+
+	memory@0 {
+		device_type = "memory";
+		reg = <0x00000000 0x04000000>;
+	};
+};
+
+&sdmmc {
+	bus-width = <4>;
+	cap-sd-highspeed;
+	disable-wp;
+	pinctrl-names = "default";
+	pinctrl-0 = <&sdmmc0_clk &sdmmc0_cmd &sdmmc0_det &sdmmc0_bus4>;
+	status = "okay";
+};
+
+&sfc {
+	pinctrl-names = "default";
+	pinctrl-0 = <&fspi_pins &fspi_cs0>;
+	status = "okay";
+
+	spi_nand: flash@0 {
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
+				reg = <0x00a40000 0x075c0000>;
+			};
+		};
+	};
+};
+
+&uart2 {
+	pinctrl-names = "default";
+	pinctrl-0 = <&uart2m1_xfer>;
+	status = "okay";
+};
+
+&wdt {
+	status = "okay";
+};
-- 
2.43.0


