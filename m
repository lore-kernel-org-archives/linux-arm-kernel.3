Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 65322C53200
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 29 Jul 2026 13:37:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=4dAso1O4eZXUPf3B1KNAgO1fZX6/Qptu3e0In9zSoy0=; b=CVe5xcWLluXqVu0xW08EVh7jUI
	/ZTCJkFNKfxeYTTOPhly/78ZWR1Psx3witWx0Q0Vi2x3B+eTqp+ZVgNvLXqMQRfwJ/7TIxUcrl4B6
	pVztEIckuRngJ38gG3A5i8AKvm1vSEpGVozPN6gm1GvYZd++FXMF2MYvu2db4dKSOk0J5IRIVcp4g
	ESA9s1ab87JLAMApYZi8ZzcsFpqvZtIwguys/j7lCJwGbou6AAomGYLknzu+sPiydyEiEKYeJEl81
	+oYJBH2VIQ1WsgupHaPaOSf60UDEQVxznCG1bwCyvnXiY8Wf44G3plVtCSvBuuCk+sxoHUTFYULsm
	5w0pHjLA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wp4T0-000000088B9-2HGn;
	Wed, 29 Jul 2026 13:37:02 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wp4Se-000000087ss-2pTZ
	for linux-arm-kernel@bombadil.infradead.org;
	Wed, 29 Jul 2026 13:36:40 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=4dAso1O4eZXUPf3B1KNAgO1fZX6/Qptu3e0In9zSoy0=; b=FHfc/q7R4mnb+ftWz/zfHuIkee
	nm+mMDs10ibD7VT9CUJ8BnRBDkI6rmDvkz5ZZ7lRlz+O8lZ0mwRcGdhx5V7kCZPImGApKM0GKK97o
	MlSxVNAhsybAhvdcLWzqt3c4Co8hq3p7cnvyLk2kx3MyjhLoN4DWo820GJyjkIJ1vTXzFGwIUjCD3
	MWNg9haqvqJJxLfTJppKwrTWDjU+V50Hr8iN5sVJEi+TkkUqULaNX9T3iGWrExhXu+VlwUtMKrn12
	bMFRzPVdfL5vOS+Tifq6xQ4S7IW0fJ/C44ctZ0LFh4iSqzWl48lvMVbR70kP+lROpiWBBZxSRM8va
	/gvHYWKQ==;
Received: from mail-oo1-xc2f.google.com ([2607:f8b0:4864:20::c2f])
	by desiato.infradead.org with esmtps (Exim 4.99.2 #2 (Red Hat Linux))
	id 1wp4Sb-00000005r8w-3LIc
	for linux-arm-kernel@lists.infradead.org;
	Wed, 29 Jul 2026 13:36:39 +0000
Received: by mail-oo1-xc2f.google.com with SMTP id 006d021491bc7-6aaf2f9ce3dso436178eaf.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 29 Jul 2026 06:36:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1785332196; x=1785936996; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=4dAso1O4eZXUPf3B1KNAgO1fZX6/Qptu3e0In9zSoy0=;
        b=eU2ie0PNLVu7DPRCN7liS5BG4MyVtA5Rtt4HKCbo7NYJfeH5zwFmMGlVVDx4cmhGr9
         nvdeP6eF8D8o8Y0Sk8iZ+L8l/CzqC0zQdlvgki8siJT0WadhOkjVzBtp8ZXIEk7ezFYv
         REx2BXEiaj50gqzAL4JsJv+0N3ICdvQ6UmVd0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785332196; x=1785936996;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=4dAso1O4eZXUPf3B1KNAgO1fZX6/Qptu3e0In9zSoy0=;
        b=lKx36pswVVybFCZ6pu/7pRyj5GyxJ3u3ePIGOnnzsY3YaKtJu3HZUKQbFoxJFM5qyf
         DN7dZ8ZThXCfjiC6t449SDuKdiNjdWvmPoRsUBIV2vW/wENJN9iqwc03T55+ywmXEMQb
         t82y18miOi/IvQHpE9qxepMahr2e8yxl5zzaVWJEhaNv/NOgegfTX2Exn7YxATyTtP5g
         j8j3N3nzeYwj04CB97/ZlWFRtwvqfFGG7xGT/d6iOPexfZM+FMJeNwrBD7gT2Xw3WWJr
         6BYw1vOfGepLMUdQc7Ui+XCSGtlaUPU4pHrCRjnfl3/j7DRZXdWtl/sfUos0ce69vyW9
         93mQ==
X-Forwarded-Encrypted: i=1; AHgh+RrJQuwik9S8f4/vhmSth/XWmhWuonInhor+Xbl1XWsa3kP9vrY+L2Trye2TXDUrx0Qwh+m8ktsvgPMCaJ4qNGNJ@lists.infradead.org
X-Gm-Message-State: AOJu0YwbRD7bfX0HEtUVFuMKUorh4Ea2Qysp+cmjuhHlYUCbnBUT/lnq
	bdJNVbAkGLaVN6ERdRSzyisRiyXH5vLQo6ImSfCSd+QErbcioO5YWCeWJA/qCmCpjQ==
X-Gm-Gg: AR+sD12d2PsunX/3dz9AqaBPAjQiGCLMdkkV+tRiCQfvOaiU5dbERPjS8ozQsQNn4FO
	mkUNL4ZaAT+5v0AIZkFR4ndG1WW2lJ07/Y/SMBVch5qCH+3SwdW3k7VlsBSfFKAweU20Bkexv0r
	fch65G+R9lANxRzMJnmCRdmR/JcTdb4oxadkhDYOqegQ5PeExK0SEt2Y4AmBDLraHj7EkZa/BPs
	BBjE45eW55c5Do8MZlo1yG3OpKCEjLLAtXeiq6HixiwLvsejOyangkinvs2BiqZjEl3OVZsVU1q
	v5dBnjPBmId1I1iRywhcR2L9pGhEQV0UvMA62AQ5DanSBlEUuezaXAM4ZwS6HX9K6L79lnQtY5E
	W0VK0sVy4HGi2U8of1GSGbNc2/S2SYr34IWaYMJaHh0974csZ/mpQWxQ1L4umVG8I7FO5A6KHtj
	Z5KwhThXaelsY+Kne+D/3Ohv/IFhQbCM6olS6RanGqmYCK9XCbn/8pL/c=
X-Received: by 2002:a05:6820:1ca2:b0:6aa:fc67:1b4b with SMTP id 006d021491bc7-6ac9699da00mr3333562eaf.12.1785332196270;
        Wed, 29 Jul 2026 06:36:36 -0700 (PDT)
Received: from chromium.org ([174.51.25.52])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-6aca527fe83sm1956196eaf.6.2026.07.29.06.36.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 Jul 2026 06:36:35 -0700 (PDT)
From: Simon Glass <sjg@chromium.org>
To: Heiko Stuebner <heiko@sntech.de>
Cc: Fabio Estevam <festevam@nabladev.com>,
	linux-rockchip@lists.infradead.org,
	Jonas Karlman <jonas@kwiboo.se>,
	linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org,
	Simon Glass <sjg@chromium.org>,
	Albert Aribaud <albert.u.boot@aribaud.net>,
	Conor Dooley <conor+dt@kernel.org>,
	Jeffy Chen <jeffy.chen@rock-chips.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Rob Herring <robh@kernel.org>,
	huang lin <hl@rock-chips.com>,
	linux-kernel@vger.kernel.org
Subject: [PATCH v3 6/6] ARM: dts: rockchip: Add Luckfox Pico Mini B
Date: Wed, 29 Jul 2026 07:35:53 -0600
Message-ID: <20260729133609.3465563-7-sjg@chromium.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260729133609.3465563-1-sjg@chromium.org>
References: <20260729133609.3465563-1-sjg@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260729_143638_002281_849E1364 
X-CRM114-Status: GOOD (  16.16  )
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

(no changes since v1)

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


