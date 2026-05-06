Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 763F3CD343B
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  6 May 2026 14:34:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=zqAP6HoJp4PDzUAz6DYhX+6+R5thQEEp6vdxh3M2Ufs=; b=Y8w9QHZPnyIZ1yPGHbh1JlCYx0
	Kv0bkppT7H8oI6HWI1KRS+Cx0dhGZ3gGfe0kAPBaYlegVI71KhGfsh3HJpuppbK6IligJvKrpmmCa
	fopTakps4VESUMg4CLmyoRAFw8pKycvE2qSFIn/7TDDcJLno2vdxusVpi/UUhlfgPyTKSPr1Yko1f
	IBr6SSAzQHSmqQmz4ZyKH0ujXkpcrep0ApD0SiGsVbeJn5bbvj1RWHOkpbp/XUqvVMyBL8QaFX+b2
	A+Iq4pPspUmdB0QJOhZxAgOvUqzM2smr6BgnitXcInCES86Sp6jW+OXG5i4bOUHp4fTDQRnQQHknY
	mIAjBhCA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wKdKi-000000016md-1vnu;
	Wed, 06 May 2026 14:34:40 +0000
Received: from mail-wm1-x32a.google.com ([2a00:1450:4864:20::32a])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wKdKg-000000016lP-2YQp
	for linux-arm-kernel@lists.infradead.org;
	Wed, 06 May 2026 14:34:38 +0000
Received: by mail-wm1-x32a.google.com with SMTP id 5b1f17b1804b1-48e56c1bf5dso3555065e9.3
        for <linux-arm-kernel@lists.infradead.org>; Wed, 06 May 2026 07:34:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778078076; x=1778682876; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=zqAP6HoJp4PDzUAz6DYhX+6+R5thQEEp6vdxh3M2Ufs=;
        b=BHlR32YzwBTpxiSV7EjAJIQKkrrjt6n1K1SwVpolR0f5Z4Ii7qDVESYCEm7KZOyWzv
         ++x0By9rm/wjAidEdkDXcIRDtOIYpT9+8ucPo6sZRpWWd0OL5fh9lMfPd5E6QFfYkgEw
         l4y0qZSYA9Vqu3zjdh5BF4ewZJw9xmMuqUKrhSqEj+bkZYcb5RGuO+nzTjEnG6lPkJB2
         qglPi9A+pozFua4/4odvuc/LyqVnyOsGuKU+A3oKQk+aUCgvvEZ3hFtmw0OV/NIS9xAk
         5e4Oy8o4Av5bD9mh25CTJ7UzPev/RFMYBClTksI6KpzlW0rGtsdPbXLCEc9DpJ/2JHkK
         ApjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778078076; x=1778682876;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zqAP6HoJp4PDzUAz6DYhX+6+R5thQEEp6vdxh3M2Ufs=;
        b=Zmt8XBqe6eHR0D0nmHQvOlJ+jABS6Ks5Xuf+Aca1tia/qbYYmZhWWIH+76CXC5CIa5
         kvKio+5jpCOuQEPvsSDmv2XeY8wWwL+g+yxBlTGN37qxvJPm0F/Jm1K8CzKQYUGVQITD
         5c/mojOHx5+CvpyEx7ICJSjV9PpuV5KzTyY5CePJnMYz7IjO9nviuizG6NjdSPaebX3u
         T8nKofPsoKvctN3ZMh3muLmLkdBsTXKesToKZlXQ3OfyTqmfr4nDdd7Yo0WeN0OpjlDN
         gj2UDJXF6VXZNq9hwD+PGX1e9nWoNVinDWYsdi/htqZDiPXAvv/VG7HIUT78EgX/chZU
         RDPw==
X-Forwarded-Encrypted: i=1; AFNElJ+KZqi1Vng3v9n3Yyjbz8dJp2yIKZQbgl8uEBeNtQQM+9DeMj3f7vc5P+BYHo2DQLMCfUrsPAwikNU/6npgOeb7@lists.infradead.org
X-Gm-Message-State: AOJu0YxGNiXUAbRrfPiBYk9Z8f7Sv/DZhiWDXU5kLIOois4Xfj58C4hF
	+WKy9BtS1LUwtvRsdIIhMgTDQHgkOV+RzXgK30wfrBmGog+cR9OVYVxA
X-Gm-Gg: AeBDieuVBgo60pBhwEZP+jbWtUrA4v42wdnVpPZM+lP2sj7ByeZBb8LldM9/IBSAWAU
	VI/sqTaZSzw1Qko8vKC97vidQGG+NwJrbl7R/8OIc5Rtu9V243h/HlW/SpaI/CE7GF7sSONLo2z
	KS99t40ZZVajoolbagypClK1UaNz/J+fqUYinNG49nZIZMoBY6t2CxrGdTTXGTKM1duD9S5rYkY
	vBFWHFWiSBK26B4yq+PEIPZXiVSJ+M6vqeU5wyztfLvbwIFKRdcQZOSH9j1GawvLSFkkMkOvpsb
	HKv7BbmtdwmmHIpesbuax+SZkild5Re7gX6EBk/aZ9b3B0KPsDP2xE+a4fUZBBuWJ152brGqAsC
	yCo9hqZ5/Resw7inrxkNqVon/mgh4n8piOp8UiGnyF953j5m9DV6PeUKRuNoG3YdMmM0V60Af/o
	FINobzMBPKGHdY/4+zQgR6ob7TCiPH8MTviazT8+pA522+g4QZaDBF
X-Received: by 2002:a05:600c:1d18:b0:489:1f97:6b1d with SMTP id 5b1f17b1804b1-48e51f4844emr64680535e9.28.1778078075891;
        Wed, 06 May 2026 07:34:35 -0700 (PDT)
Received: from vitor-nb (dsl-113-208.bl27.telepac.pt. [176.79.113.208])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48e530d8691sm42893115e9.2.2026.05.06.07.34.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 06 May 2026 07:34:35 -0700 (PDT)
From: Vitor Soares <ivitro@gmail.com>
To: Nishanth Menon <nm@ti.com>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	Tero Kristo <kristo@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Francesco Dolcini <francesco@dolcini.it>
Cc: Vitor Soares <vitor.soares@toradex.com>,
	linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v1] arm64: dts: ti: k3-am62-verdin: Add DSI to HDMI adapter overlay
Date: Wed,  6 May 2026 15:34:26 +0100
Message-ID: <20260506143427.348806-2-ivitro@gmail.com>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260506_073438_708760_2BF77E7E 
X-CRM114-Status: GOOD (  15.08  )
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

From: Vitor Soares <vitor.soares@toradex.com>

Add a device-tree overlay for the Toradex DSI to HDMI Adapter, an
accessory that connects to the Verdin DSI_1 interface and provides a
full-size HDMI Type-A output. The adapter is based on the Lontium
LT8912B DSI-to-HDMI bridge.

The overlay is also combined with the Verdin AM62 carrier board device
trees to provide ready-to-use DTBs for the Dahlia and Development Board
carriers, in both WiFi and non-WiFi SoM variants.

Link: https://developer.toradex.com/hardware/accessories/add-ons/dsi-hdmi-adapter
Signed-off-by: Vitor Soares <vitor.soares@toradex.com>
---
 arch/arm64/boot/dts/ti/Makefile               | 13 +++
 .../dts/ti/k3-am625-verdin-dsi-to-hdmi.dtso   | 94 +++++++++++++++++++
 2 files changed, 107 insertions(+)
 create mode 100644 arch/arm64/boot/dts/ti/k3-am625-verdin-dsi-to-hdmi.dtso

diff --git a/arch/arm64/boot/dts/ti/Makefile b/arch/arm64/boot/dts/ti/Makefile
index 7642c06ca834..21db60cd19de 100644
--- a/arch/arm64/boot/dts/ti/Makefile
+++ b/arch/arm64/boot/dts/ti/Makefile
@@ -9,19 +9,32 @@
 # alphabetically.
 
 # Boards with AM62x SoC
+k3-am625-verdin-nonwifi-dahlia-dsi-to-hdmi-dtbs := k3-am625-verdin-nonwifi-dahlia.dtb \
+	k3-am625-verdin-dsi-to-hdmi.dtbo
+k3-am625-verdin-nonwifi-dev-dsi-to-hdmi-dtbs := k3-am625-verdin-nonwifi-dev.dtb \
+	k3-am625-verdin-dsi-to-hdmi.dtbo
+k3-am625-verdin-wifi-dahlia-dsi-to-hdmi-dtbs := k3-am625-verdin-wifi-dahlia.dtb \
+	k3-am625-verdin-dsi-to-hdmi.dtbo
+k3-am625-verdin-wifi-dev-dsi-to-hdmi-dtbs := k3-am625-verdin-wifi-dev.dtb \
+	k3-am625-verdin-dsi-to-hdmi.dtbo
 dtb-$(CONFIG_ARCH_K3) += k3-am625-beagleplay.dtb
 dtb-$(CONFIG_ARCH_K3) += k3-am625-beagleplay-csi2-ov5640.dtbo
 dtb-$(CONFIG_ARCH_K3) += k3-am625-beagleplay-csi2-tevi-ov5640.dtbo
 dtb-$(CONFIG_ARCH_K3) += k3-am625-phyboard-lyra-rdk.dtb
 dtb-$(CONFIG_ARCH_K3) += k3-am625-sk.dtb
 dtb-$(CONFIG_ARCH_K3) += k3-am625-tqma62xx-mba62xx.dtb
+dtb-$(CONFIG_ARCH_K3) += k3-am625-verdin-dsi-to-hdmi.dtbo
+dtb-$(CONFIG_ARCH_K3) += k3-am625-verdin-nonwifi-dahlia-dsi-to-hdmi.dtb
 dtb-$(CONFIG_ARCH_K3) += k3-am625-verdin-nonwifi-dahlia.dtb
+dtb-$(CONFIG_ARCH_K3) += k3-am625-verdin-nonwifi-dev-dsi-to-hdmi.dtb
 dtb-$(CONFIG_ARCH_K3) += k3-am625-verdin-nonwifi-dev.dtb
 dtb-$(CONFIG_ARCH_K3) += k3-am625-verdin-nonwifi-ivy.dtb
 dtb-$(CONFIG_ARCH_K3) += k3-am625-verdin-nonwifi-mallow.dtb
 dtb-$(CONFIG_ARCH_K3) += k3-am625-verdin-nonwifi-yavia.dtb
 dtb-$(CONFIG_ARCH_K3) += k3-am625-verdin-nonwifi-zinnia.dtb
+dtb-$(CONFIG_ARCH_K3) += k3-am625-verdin-wifi-dahlia-dsi-to-hdmi.dtb
 dtb-$(CONFIG_ARCH_K3) += k3-am625-verdin-wifi-dahlia.dtb
+dtb-$(CONFIG_ARCH_K3) += k3-am625-verdin-wifi-dev-dsi-to-hdmi.dtb
 dtb-$(CONFIG_ARCH_K3) += k3-am625-verdin-wifi-dev.dtb
 dtb-$(CONFIG_ARCH_K3) += k3-am625-verdin-wifi-ivy.dtb
 dtb-$(CONFIG_ARCH_K3) += k3-am625-verdin-wifi-mallow.dtb
diff --git a/arch/arm64/boot/dts/ti/k3-am625-verdin-dsi-to-hdmi.dtso b/arch/arm64/boot/dts/ti/k3-am625-verdin-dsi-to-hdmi.dtso
new file mode 100644
index 000000000000..a219faf0dcc6
--- /dev/null
+++ b/arch/arm64/boot/dts/ti/k3-am625-verdin-dsi-to-hdmi.dtso
@@ -0,0 +1,94 @@
+// SPDX-License-Identifier: GPL-2.0-or-later OR MIT
+/*
+ * Copyright (c) Toradex
+ *
+ * Toradex DSI to HDMI Adapter on Verdin DSI_1
+ *
+ * https://developer.toradex.com/hardware/accessories/add-ons/dsi-hdmi-adapter
+ */
+
+/dts-v1/;
+/plugin/;
+
+#include <dt-bindings/gpio/gpio.h>
+
+&{/} {
+	hdmi-connector {
+		compatible = "hdmi-connector";
+		pinctrl-names = "default";
+		pinctrl-0 = <&pinctrl_pwm3_dsi_gpio>;
+		ddc-i2c-bus = <&main_i2c2>;
+		/* Verdin PWM_3_DSI (SODIMM 19) */
+		hpd-gpios = <&main_gpio1 17 GPIO_ACTIVE_HIGH>;
+		type = "a";
+
+		port {
+			hdmi_connector_in: endpoint {
+				remote-endpoint = <&dsi_hdmi_bridge_out>;
+			};
+		};
+	};
+};
+
+&dsi_bridge {
+	status = "okay";
+};
+
+&dsi_bridge_ports {
+	#address-cells = <1>;
+	#size-cells = <0>;
+
+	port@1 {
+		reg = <1>;
+
+		dsi_bridge_out: endpoint {
+			remote-endpoint = <&dsi_hdmi_bridge_in>;
+		};
+	};
+};
+
+&dss {
+	status = "okay";
+};
+
+/* Verdin PWM_3_DSI (SODIMM 19) repurposed as HDMI HPD GPIO */
+&epwm1 {
+	status = "disabled";
+};
+
+/* Verdin I2C_1 */
+&main_i2c1 {
+	#address-cells = <1>;
+	#size-cells = <0>;
+
+	hdmi@48 {
+		compatible = "lontium,lt8912b";
+		reg = <0x48>;
+		pinctrl-names = "default";
+		pinctrl-0 = <&pinctrl_dsi1_bkl_en>;
+		/* Verdin GPIO_10_DSI (SODIMM 21) */
+		reset-gpios = <&main_gpio0 30 GPIO_ACTIVE_LOW>;
+
+		ports {
+			#address-cells = <1>;
+			#size-cells = <0>;
+
+			port@0 {
+				reg = <0>;
+
+				dsi_hdmi_bridge_in: endpoint {
+					data-lanes = <1 2 3 4>;
+					remote-endpoint = <&dsi_bridge_out>;
+				};
+			};
+
+			port@1 {
+				reg = <1>;
+
+				dsi_hdmi_bridge_out: endpoint {
+					remote-endpoint = <&hdmi_connector_in>;
+				};
+			};
+		};
+	};
+};
-- 
2.53.0


