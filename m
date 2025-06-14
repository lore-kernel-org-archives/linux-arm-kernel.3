Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EA7F9C71135
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 14 Jun 2025 18:26:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=k0Bs6c37/y07phySGIaMXCLcTr8q9NO06Gh+4XGoKB8=; b=aa+xOcpjiVHNO6q1eqEQ1+ZF2M
	8k+IaOCvIGyhEp+C1jZe/js+RxKTwfuVrgP6jA3Dnc2TtDV/TtvW7f1w7aCtjvF+cSNfB26FPWpfe
	0d0cr726NAI2OGJph9wH3BYEXivIm0bdhIpPyps/OO10mM9p0ibkgmGLjIVcP1iXwx71qgiLkLpbL
	WFyFh8uUWORh2R7bGi6NEAII2EnkIFG3QGourzQdwenIZMSwv9vOEXASMfxRz3t5Q5gUDiKw/kzPK
	lw11/vs6Nyvho8PiPeOe71wRKvK7ozfL10zpejU9x37lkM2LOWIAEc/qKs72eutZ1w+b243IngEz1
	cFI3Paeg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uQVa4-00000001f7L-3Riw;
	Sat, 14 Jun 2025 18:26:16 +0000
Received: from mail-wr1-x432.google.com ([2a00:1450:4864:20::432])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uQVPQ-00000001eDd-0QE5;
	Sat, 14 Jun 2025 18:15:17 +0000
Received: by mail-wr1-x432.google.com with SMTP id ffacd0b85a97d-3a3798794d3so2890556f8f.1;
        Sat, 14 Jun 2025 11:15:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1749924914; x=1750529714; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=k0Bs6c37/y07phySGIaMXCLcTr8q9NO06Gh+4XGoKB8=;
        b=cqXtFjZqLypQPX9M2PsrDyAwcwQ3hTJn2w/vyjCYp0h7bbK0dMpVuA931apLnuUuJs
         exarGl0iDIez6kRkBDZoQbJCzAiU8Iqfa/k7teLZ6uFEMspJmM1v/3IeR6WnSaJZ/Pc0
         2Q79TQYN2YCRxJlHM9vKYsb2otS4ZuDKmj3KydjudsO1pfzssPNk50mCDqp2897t+yvd
         6J94onU773OunoiKIh+w5T3oO9KUkxrb0XqI3eoXUpYzGTCThdR3LMAJNSxQA7df6E5c
         uhuKiL0uXm2nUwuUMXm9rWJHqWKJt2NJwkPtY7SN4SGc5uwNLMsONTF7RzTLXTJsso82
         yW+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749924914; x=1750529714;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=k0Bs6c37/y07phySGIaMXCLcTr8q9NO06Gh+4XGoKB8=;
        b=FSPgfcEcSgODb2F3F0k3EIZg+kV+ZBWixI7qw0wrH1/qwczX18asHHfnNio9cjyZG9
         9TbyTSfl/keNqfw/tN3d8mVHjJEeEMNJHTBEWQmxilzlCAJ9fU3nNF1oC757Sh2Mjx/c
         fGVDt7UJawiALwRvIoBogfxBpp7FNsHlNNg4ZwgSCWfS+oSO8bu0YI3WCRhU3a2MdPpE
         ZL6IhuVu/3dc3TIqPFpJ9XuZxIKjMYq7gq+K93rZ9PBl6wiFbWDEiGM3PlaUMhICcFJm
         M2j3aQjZ+x/h7jyicfgVnxrYykBFxMEwFVJ/RWuPEAbrQNj8YkccJZXp5iTUJSlI+bPV
         ToBw==
X-Forwarded-Encrypted: i=1; AJvYcCV43VmV4JjnCWNF/g9NpfGIicFlAH4NSaaqqSYz8TioCqjUK4dpStgb9Lu92Fr0xC/GbCb6CB1YDl61KGOWvoes@lists.infradead.org, AJvYcCV5uBLUPg6sbT/TWJhlhFQu8sD0+AKFVbQaQQ4eHYXpmsMlTnz9fjacWof/S0M0RJXC6zd1YpkEkH6U4Q6leV8=@lists.infradead.org
X-Gm-Message-State: AOJu0Yyv/17TnoSn4rlg5djD/4L7A0C1YJsJPpZApNroObdlRf/OxMGV
	DjYJFT/SCHIXAuks8SAEx4LWOun3ssJ7Gyfjn96zqmxDbdledVJujNe/
X-Gm-Gg: ASbGncs/pfZin+nZB6bwpvDRrhF4DSG0sPkCcDsjsNiO5IZxpkWiMOvwBhJVxwcHr4Y
	Ae5i6vJcR0k1m2ir1st88UAutdtO8i90ZTbaglAU5M5N/BaLztDQcE+0tSbWuor+YIo8Q7hpnQy
	NaDQ74d7SsfOJZ0BMV3RMF9R6jzl4s/6VjN9oh/wy/yCx6sgQDD1Yl4Q/mL/gDA8orBFlvA9NX/
	hqJVgwNu0FfJDrBTuHfyvs+2pvB1TCOH37tDV6KgKlOlNCyTuNl9TTaFS/XoCL4zbFQGcd5yv5Z
	HfzktoyRlRHPKXb0ScEtsYFaIgvb50aAOMdlrLlLr6ARany20BpOI74iNIKxPpWL8xkbyeOTMVa
	Oyw==
X-Google-Smtp-Source: AGHT+IG5rFauCOueVdM2iXEQWzdE2SfWJbIG/lvF5F894+FF1XVgY2tgRSBxiioBxzB/96rT9zK44w==
X-Received: by 2002:a05:6000:1881:b0:3a4:e5fa:73f0 with SMTP id ffacd0b85a97d-3a572397846mr3775795f8f.20.1749924914431;
        Sat, 14 Jun 2025 11:15:14 -0700 (PDT)
Received: from alchark-surface.localdomain ([5.194.93.132])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4532de8c50esm88195255e9.4.2025.06.14.11.15.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 14 Jun 2025 11:15:14 -0700 (PDT)
From: Alexey Charkov <alchark@gmail.com>
Date: Sat, 14 Jun 2025 22:14:36 +0400
Subject: [PATCH v2 4/4] arm64: dts: rockchip: add overlay for the WiFi/BT
 module on Sige5 v1.2
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250614-sige5-updates-v2-4-3bb31b02623c@gmail.com>
References: <20250614-sige5-updates-v2-0-3bb31b02623c@gmail.com>
In-Reply-To: <20250614-sige5-updates-v2-0-3bb31b02623c@gmail.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>, 
 Detlev Casanova <detlev.casanova@collabora.com>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Alexey Charkov <alchark@gmail.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1749924902; l=3898;
 i=alchark@gmail.com; s=20250416; h=from:subject:message-id;
 bh=EFL42CJiaQOiXrGt6/pdixsIsoXZFU3sPb2V2UplPlE=;
 b=YfwVvAfQQ0bYQttXHGd+f/0IXgDcOU1tVo0HYaR34VuKkZq7NKdZWXwTmc/z2ybOD877W5oXS
 EjW7JI6YLZYCjDF5xMJJ4cXS3R2+/oITH6nGhdnZRpmiBy5Q6OOoLx5
X-Developer-Key: i=alchark@gmail.com; a=ed25519;
 pk=ltKbQzKLTJPiDgPtcHxdo+dzFthCCMtC3V9qf7+0rkc=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250614_111516_145246_B9C87808 
X-CRM114-Status: GOOD (  15.28  )
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

Add support for the Broadcom based WiFi/Bluetooth module (BW3752-50B1)
found in ArmSoM Sige5 boards version 1.2. This includes SDIO connected
WiFi with OOB interrupt support, as well as UART connected Bluetooth
with its respective interrupts.

PCM support for Bluetooth SCO audio is left out for now. It is connected
to SAI2 in M0 pin mode in case someone needs to enable it.

Note that v1.1 boards used a Realtek based module which is incompatible
with these DT nodes, so v1.1 would need a different overlay.

Signed-off-by: Alexey Charkov <alchark@gmail.com>
---
 arch/arm64/boot/dts/rockchip/Makefile              |  5 +++
 .../rockchip/rk3576-armsom-sige5-v1.2-wifibt.dtso  | 49 ++++++++++++++++++++++
 2 files changed, 54 insertions(+)

diff --git a/arch/arm64/boot/dts/rockchip/Makefile b/arch/arm64/boot/dts/rockchip/Makefile
index 4bf84622db473696f64b157ba94560f476d4f52f..26533be1dd865972b681d133aad6fbbbf4e64bce 100644
--- a/arch/arm64/boot/dts/rockchip/Makefile
+++ b/arch/arm64/boot/dts/rockchip/Makefile
@@ -143,6 +143,7 @@ dtb-$(CONFIG_ARCH_ROCKCHIP) += rk3568-wolfvision-pf5.dtb
 dtb-$(CONFIG_ARCH_ROCKCHIP) += rk3568-wolfvision-pf5-display-vz.dtbo
 dtb-$(CONFIG_ARCH_ROCKCHIP) += rk3568-wolfvision-pf5-io-expander.dtbo
 dtb-$(CONFIG_ARCH_ROCKCHIP) += rk3576-armsom-sige5.dtb
+dtb-$(CONFIG_ARCH_ROCKCHIP) += rk3576-armsom-sige5-v1.2-wifibt.dtbo
 dtb-$(CONFIG_ARCH_ROCKCHIP) += rk3576-evb1-v10.dtb
 dtb-$(CONFIG_ARCH_ROCKCHIP) += rk3576-roc-pc.dtb
 dtb-$(CONFIG_ARCH_ROCKCHIP) += rk3576-rock-4d.dtb
@@ -225,6 +226,10 @@ rk3568-wolfvision-pf5-vz-2-uhd-dtbs := rk3568-wolfvision-pf5.dtb \
 	rk3568-wolfvision-pf5-display-vz.dtbo \
 	rk3568-wolfvision-pf5-io-expander.dtbo
 
+dtb-$(CONFIG_ARCH_ROCKCHIP) += rk3576-armsom-sige5-v1.2-wifibt.dtb
+rk3576-armsom-sige5-v1.2-wifibt-dtbs := rk3576-armsom-sige5.dtb \
+	rk3576-armsom-sige5-v1.2-wifibt.dtbo
+
 dtb-$(CONFIG_ARCH_ROCKCHIP) += rk3588-edgeble-neu6a-wifi.dtb
 rk3588-edgeble-neu6a-wifi-dtbs := rk3588-edgeble-neu6a-io.dtb \
 	rk3588-edgeble-neu6a-wifi.dtbo
diff --git a/arch/arm64/boot/dts/rockchip/rk3576-armsom-sige5-v1.2-wifibt.dtso b/arch/arm64/boot/dts/rockchip/rk3576-armsom-sige5-v1.2-wifibt.dtso
new file mode 100644
index 0000000000000000000000000000000000000000..6985c3b22ebe4efcc7e7b7370f527838a557cf2b
--- /dev/null
+++ b/arch/arm64/boot/dts/rockchip/rk3576-armsom-sige5-v1.2-wifibt.dtso
@@ -0,0 +1,49 @@
+// SPDX-License-Identifier: (GPL-2.0+ OR MIT)
+/*
+ * DT-overlay to enable the onboard WiFi and Bluetooth module present in v1.2
+ * boards. Note that v1.1 boards use a different module, so this probably won't
+ * work there.
+ */
+
+/dts-v1/;
+/plugin/;
+
+#include <dt-bindings/gpio/gpio.h>
+#include <dt-bindings/interrupt-controller/irq.h>
+#include <dt-bindings/pinctrl/rockchip.h>
+
+&sdio {
+	#address-cells = <1>;
+	#size-cells = <0>;
+
+        wifi@1 {
+                compatible = "brcm,bcm4329-fmac";
+                reg = <1>;
+                clock-names = "lpo";
+                clocks = <&hym8563>;
+                interrupt-names = "host-wake";
+                interrupt-parent = <&gpio0>;
+                interrupts = <RK_PB0 IRQ_TYPE_LEVEL_HIGH>;
+                pinctrl-0 = <&wifi_wake_host>;
+                pinctrl-names = "default";
+        };
+};
+
+&uart4 {
+	status = "okay";
+
+	bluetooth {
+		compatible = "brcm,bcm43438-bt";
+		clock-names = "lpo";
+		clocks = <&hym8563>;
+		device-wakeup-gpios = <&gpio1 RK_PD7 GPIO_ACTIVE_HIGH>;
+		interrupt-names = "host-wakeup";
+		interrupt-parent = <&gpio0>;
+		interrupts = <RK_PB1 IRQ_TYPE_LEVEL_HIGH>;
+		pinctrl-0 = <&bt_reg_on>, <&bt_wake_host>, <&host_wake_bt>;
+		pinctrl-names = "default";
+		shutdown-gpios = <&gpio0 RK_PC6 GPIO_ACTIVE_HIGH>;
+		vbat-supply = <&vcc_3v3_s3>;
+		vddio-supply = <&vcc_1v8_s3>;
+	};
+};

-- 
2.49.0


