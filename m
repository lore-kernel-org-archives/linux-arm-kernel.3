Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 06219C4450B
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 14 Jul 2026 19:37:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=4dAso1O4eZXUPf3B1KNAgO1fZX6/Qptu3e0In9zSoy0=; b=Xhw+a8t0BRJnIWs9MKTARLge6x
	sVVibH1rbAavEyEkE9mmhmZGQSK1Mti0qegD5JLjPhiqh0u/irf035gHwkjXXL2cucOTatxUmDsLF
	2mEcFBBfuvHe+uV186XS8rgmDPYw9uo2pe0UyIobnILPS9BIzk5OoZJGRV0URuNUVmzGkaRwLd4E5
	9gRprT3H1cNHE+jnd3Z435KseP9LumCRaWTrjql1mbu74WXtJsIgaZ8G6FosCKSZubFZU3R8ENm4g
	emJLAtdLL6Yuea7IjhDyqi2UwDmZRTBC8LntP/qvx0rTi13n1wtIkVNVRw88QIjYhvdJMw7KtQOlL
	aKKEC4bA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjiwZ-0000000D8Gm-3Cno;
	Tue, 14 Jul 2026 19:37:27 +0000
Received: from mail-ot1-x32b.google.com ([2607:f8b0:4864:20::32b])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjiwS-0000000D87h-3Gtb
	for linux-arm-kernel@lists.infradead.org;
	Tue, 14 Jul 2026 19:37:23 +0000
Received: by mail-ot1-x32b.google.com with SMTP id 46e09a7af769-7e9f1f24cbcso1063069a34.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 14 Jul 2026 12:37:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1784057840; x=1784662640; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=4dAso1O4eZXUPf3B1KNAgO1fZX6/Qptu3e0In9zSoy0=;
        b=javfZ202mGkXqTXB7KAI0UoBDlRiFQHH6EwW/crnj3ir4SbLAhO8SzrbVr3NSnOQYN
         F8zwSygkC77HaGSEugexmBITGj+eQcXajBqbE4GdSm1wRx4enJaVrRqEPm0vCz63qruT
         eY6U6dw5eC0aqyDuwBQrUWP3mAdgpm2J22Q20=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784057840; x=1784662640;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=4dAso1O4eZXUPf3B1KNAgO1fZX6/Qptu3e0In9zSoy0=;
        b=QT9RRgAn+t9cfLAmfnPKj0+mPRgz4mDlJ9Vf25N7Fj85HrKTpKcHFwBQgJfAuko8AU
         RXPADWmUMTjTx9o9HvODOwSdUbbPJzQMPPLRMTlPxD+hs7v7pzMFeXloPLeR3oV6IyOy
         SGfcp4BIunZkaIxL7HbgJuDYc+aJxZy+jzZZ0DeZ0agcj46VDLWA1wXb0hsLoHqYBdkL
         BUagzO+GBPPJ+m+zB0GKzN+Tlw/oetuRzJj7ymV1AhlX2KBvRe9scASqv8eEzo93SGKK
         11u+SagbkbGE2RqmiMVuOVj07nJElBbwCnjBwGcKvDSjDduqebDmoT1zrN7TqATXvzKX
         SdQg==
X-Forwarded-Encrypted: i=1; AFNElJ8Ik0vJYeWYpoeAT03EJkUAu+2DK2Yg6qKcFdZZ1BRNenmJB3BFL0uOMcKon1FlPxCUz/2CQEUfTF47UUpQh0ms@lists.infradead.org
X-Gm-Message-State: AOJu0YzvxfsGtnKacr/Ndfiyd44OHNzzc9T2jmOrdmPlz/GZFANdGGT7
	sMzDaVlG7ufUd1HzdSns6FmfSZkxbxW4uZFYnUzG8BFBfwAXhn1h0U5HXVq9pnDVEwA9ZcBtjiy
	hu7O5jQ==
X-Gm-Gg: AfdE7cmRykxJ2x/v79VmwVu8Ru1wuyW9VKMe7GQKJPoTv2n65RR+dInkkDlYSpbQflm
	wd5rss+lriZi+iaLnp3F8mkPcg4B8+hfkDUQVVpsV1+HKqpa+a2gYNqB4oaD2tQfHzq03MEfeyx
	0erkynDpSvmLlN2RIhGRVUeB4oQu3sQOUaueLUGT7QhO+/j0FOzxzFlLMuWn38DCkiQrtY9xrwv
	LWC+wnOLGJsrmiOkajZJJSe54gncXJmYvHrU+h1uwS41Vc0Z9bceqwTk7GZe6HR2fZxz7jWbR7H
	K+t/zrZ2c/Nb45IQ1dBYcH6wqPB6y96puGj6bhV0H+j8gNUIIKLX3Ztpg5S9tg5DTLMcvjoKJei
	6kJw21EXa2qSviI3t6buFtX71CFkAja6Rr77/3YAJ3mpom4b/79c0kSgnoPUORgqEJXjOruJwTT
	Uy7oiCtlg=
X-Received: by 2002:a05:6830:60dc:10b0:7e9:e9f3:266c with SMTP id 46e09a7af769-7ebf28741f7mr7407329a34.14.1784057839868;
        Tue, 14 Jul 2026 12:37:19 -0700 (PDT)
Received: from chromium.org ([174.51.25.52])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-7ebcaf742e1sm16004026a34.8.2026.07.14.12.37.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Jul 2026 12:37:18 -0700 (PDT)
From: Simon Glass <sjg@chromium.org>
To: Heiko Stuebner <heiko@sntech.de>
Cc: Fabio Estevam <festevam@nabladev.com>,
	devicetree@vger.kernel.org,
	Jonas Karlman <jonas@kwiboo.se>,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	Simon Glass <sjg@chromium.org>,
	Albert Aribaud <albert.u.boot@aribaud.net>,
	Conor Dooley <conor+dt@kernel.org>,
	Jeffy Chen <jeffy.chen@rock-chips.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Rob Herring <robh@kernel.org>,
	huang lin <hl@rock-chips.com>,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 6/6] ARM: dts: rockchip: Add Luckfox Pico Mini B
Date: Tue, 14 Jul 2026 13:36:43 -0600
Message-ID: <20260714193656.2196447-7-sjg@chromium.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260714193656.2196447-1-sjg@chromium.org>
References: <20260714193656.2196447-1-sjg@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260714_123720_824730_6B6F8FF2 
X-CRM114-Status: GOOD (  16.12  )
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


