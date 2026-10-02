Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8D34BCA5FE2
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  2 Oct 2026 07:56:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=f/Cg6o9DtnqlwtjSVeTL4+21Uz6Jsufxp1o0HTptmTg=; b=4cIYifTapKTNvifW3EislrMQl2
	Dy8zEHE31btj0WjQgkRVEKu/C/oG0ewbcSLJ8fgyNCdc5tcY6gFbccsivIvxdlf2lX1iNoP3NWYXy
	j1SrKZpPb3Hpv5p/JzLG1lrebOkLOJzRU4BWR+F+8a6dHFWKINCCmDQEjz2cSnU8h+51r8M+ugOQF
	FnSL9B/807FjldbHp388qvmpvzfM2Rwwc/qL32WAA1iM+L/xmZifeagH6iAI4ws8psOu2sTE5/rFI
	FGPBz6RUw7UqdHhGBeRWiqFcuWdHWZEauSeD/Nf1g4coMfVv9ryUNAGazsPan+3Sc8ZLexkdN1bfo
	fZ4gnzNw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xCY8T-0000000Av9a-1nVz;
	Fri, 02 Oct 2026 07:56:53 +0000
Received: from mail-wm2-x10.google.com ([2a00:1450:4864:31::10])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xCY8P-0000000Av5A-1xVW
	for linux-arm-kernel@lists.infradead.org;
	Fri, 02 Oct 2026 07:56:50 +0000
Received: by mail-wm2-x10.google.com with SMTP id 5b1f17b1804b1-49b912e4b11so44390485e9.3
        for <linux-arm-kernel@lists.infradead.org>; Fri, 02 Oct 2026 00:56:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790927807; x=1791532607; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=f/Cg6o9DtnqlwtjSVeTL4+21Uz6Jsufxp1o0HTptmTg=;
        b=sXMmKOgUg5RbkqR0ssWiB8rIHCBoQMdtSKbQUkI3889qtAtRavVzxKLE/cAoPuuELS
         GsPYQp2Zek8pIaQrliN/HhzCbVaA/kYB90DWb76pSi1dGeutvdKLwSNRebGYCmF8Aot3
         HZRTIfXLp+vbrccRfM8CrF+qbOVu6o4pT9qXGKuYue/XnpkQoWAMZR0jsmL1FoY+XW/6
         d1idmtJl/T0adSOHdTlKRws1pzSYyFvlEDdYZHELyOIXtS0FLExhL+Y5yfBdw6Q0JL9S
         V/YuWCFukAg4ZIw0vgmPYRr+BDJGHSMI02xK8q3VWxs1wAiBxUPzIGAB+RbLF7jUBz0G
         cYNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790927807; x=1791532607;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=f/Cg6o9DtnqlwtjSVeTL4+21Uz6Jsufxp1o0HTptmTg=;
        b=NXSIVM1T/csMtdwOq+KFoM/BoWCnwdKH4d6Z3IxKjbMDPR8Bnc/eKRs0J2usVGPWnk
         NMrqDz/rKcW4RL6sf+lQ/x5fZc/ZBs1menw7SevU7t6QrZqD9hB3lzh58HfO5F5NbcHh
         XgPOz+SxhjUhxReUCQViELWv4d+YZcg5YDE1Rj7Gxk9Ja8pZm/339WTDyFOyluBQUgIk
         CLRCh60s2JjCvOIsck49BArf7CSZMBtMezzVTbk4KTOvNzRtKhO2Z9WhukKtk2mQuadd
         AkSmF2v4aeIVTlCK5qLmJ8POZ8BT37iZaBP5G8Y9kxQuE8tTYYZQqFnUhxZ9tpgSxtSD
         Ettw==
X-Forwarded-Encrypted: i=1; AKwUvByseLyoaVnBR9QU0pS5vv5AVe7VUh2bBr1RzQBpE+hLdvBXbnzS+RAf9QqH8uA5ZYf4GodRh1SUPGI6rXQxnpvR@lists.infradead.org
X-Gm-Message-State: AFuF++nw0hM/bBwq+4uR1Y+mBpwv3yV1axNP2kRVWhp7VthDZ2S/IBUd
	PzNiEPg+wXm5OLrM5mj35LCt1nQxpWnwZ3NXwlkqZSqkf7U8LmXWkg8t
X-Gm-Gg: AYBFou1k6hqeLCkcZEnmCxKuF+sV/b7jpiwZRGudEQXdvRLzq/EKLQ1hQz6F0F9HkKF
	fa8epIvNXA31ikHtedrHBmffZ+2Iomf10/E/hulVqpqGBJINO07WdL6TVUAm6WAvO536zmbBP7E
	Kk96SSqebTGcVhElLQXtGfGAxkcqTdICQO+BahYckjxRPIo8pljd5GB0G4FoFuA4FHdkmaTc43R
	QjlmgcSZtA4cpJKjQqGbnmfOlWmzGrDvtOhYj9uxdEIMyfoiuizlXYg/J1THw6AKFnqPbeUeywU
	3b1xri5k64uNeDMa1lYqUNRdZSKJ6XmcizBQiVf9/CvoNHtLZOTNeUcmKSkm8s4gWaDnWVx1TkA
	FsMGa0/7iBXEL6wZIp7ezfZzTK19besHzZ8JaFqVpaM0z0gLk9M84H7/4FtD2a2SPTEbDsIiGM8
	umaS4FBPt1loszlDl53st5s6a7BRb6MjkSEwA0qa7Iud01F+xK/1GBFHG6TtugFBA++Ww/bEvp8
	FITd+LaoiHS76Z390bJdyH/alUuP9YLPjrrt5bAMhfKvl2k8ys/K5ipBrjYf/QnqpAB9JgJeA==
X-Received: by 2002:a05:600c:1908:b0:49f:fc13:18a5 with SMTP id 5b1f17b1804b1-4a0276a1f07mr31109475e9.6.1790927807514;
        Fri, 02 Oct 2026 00:56:47 -0700 (PDT)
Received: from ernest.hoecke-nb (248.201.173.83.static.wline.lns.sme.cust.swisscom.ch. [83.173.201.248])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a0280be5dfsm63635305e9.7.2026.10.02.00.56.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 02 Oct 2026 00:56:47 -0700 (PDT)
From: Ernest Van Hoecke <ernestvanhoecke@gmail.com>
Date: Fri, 02 Oct 2026 09:56:40 +0200
Subject: [PATCH 4/5] arm64: dts: freescale: imx8mp-toradex-smarc: Add
 Toradex Capacitive Touch Display 10.1" LVDS
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261002-smarc-imx8mp-display-submit-v1-4-f578c63fb676@toradex.com>
References: <20261002-smarc-imx8mp-display-submit-v1-0-f578c63fb676@toradex.com>
In-Reply-To: <20261002-smarc-imx8mp-display-submit-v1-0-f578c63fb676@toradex.com>
To: Frank Li <Frank.Li@nxp.com>, Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Ernest Van Hoecke <ernest.vanhoecke@toradex.com>
X-Mailer: b4 0.13.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261002_005649_584077_3D75FA28 
X-CRM114-Status: GOOD (  14.72  )
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

From: Ernest Van Hoecke <ernest.vanhoecke@toradex.com>

Add a device tree overlay for the Toradex Capacitive Touch Display
10.1" on the Toradex SMARC Development Board LVDS0 interface. The panel
is a LogicTechno LT170410-2WHC 10.1" WXGA IPS LCD and the touch input is
provided by an Atmel maXTouch capacitive touch controller.

The overlay is also combined with the SMARC Development Board device
tree to provide a ready-to-use DTB.

Link: https://developer.toradex.com/hardware/accessories/displays/capacitive-touch-display-101inch-lvds
Signed-off-by: Ernest Van Hoecke <ernest.vanhoecke@toradex.com>
---
 arch/arm64/boot/dts/freescale/Makefile             |  4 ++
 ...-toradex-smarc-panel-cap-touch-10inch-lvds.dtso | 80 ++++++++++++++++++++++
 2 files changed, 84 insertions(+)

diff --git a/arch/arm64/boot/dts/freescale/Makefile b/arch/arm64/boot/dts/freescale/Makefile
index df697066e89c..2ec50811ee1a 100644
--- a/arch/arm64/boot/dts/freescale/Makefile
+++ b/arch/arm64/boot/dts/freescale/Makefile
@@ -712,8 +712,10 @@ dtb-$(CONFIG_ARCH_MXC) += imx8mp-skov-revc-jutouch-jt101tm023.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx8mp-toradex-smarc-adapter-panel-cap-touch-10inch-dsi.dtbo
 dtb-$(CONFIG_ARCH_MXC) += imx8mp-toradex-smarc-dev-adapter-panel-cap-touch-10inch-dsi.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx8mp-toradex-smarc-dev-dsi-to-hdmi.dtb
+dtb-$(CONFIG_ARCH_MXC) += imx8mp-toradex-smarc-dev-panel-cap-touch-10inch-lvds.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx8mp-toradex-smarc-dev.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx8mp-toradex-smarc-dsi-to-hdmi.dtbo
+dtb-$(CONFIG_ARCH_MXC) += imx8mp-toradex-smarc-panel-cap-touch-10inch-lvds.dtbo
 dtb-$(CONFIG_ARCH_MXC) += imx8mp-tqma8mpql-mba8mpxl.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx8mp-tqma8mpql-mba8mp-ras314.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx8mp-tqma8mpqs-mb-smarc-2.dtb
@@ -721,6 +723,8 @@ dtb-$(CONFIG_ARCH_MXC) += imx8mp-tqma8mpqs-mb-smarc-2.dtb
 imx8mp-toradex-smarc-dev-adapter-panel-cap-touch-10inch-dsi-dtbs := imx8mp-toradex-smarc-dev.dtb \
 	imx8mp-toradex-smarc-adapter-panel-cap-touch-10inch-dsi.dtbo
 imx8mp-toradex-smarc-dev-dsi-to-hdmi-dtbs := imx8mp-toradex-smarc-dev.dtb imx8mp-toradex-smarc-dsi-to-hdmi.dtbo
+imx8mp-toradex-smarc-dev-panel-cap-touch-10inch-lvds-dtbs := imx8mp-toradex-smarc-dev.dtb \
+	imx8mp-toradex-smarc-panel-cap-touch-10inch-lvds.dtbo
 
 imx8mp-tx8p-ml81-moduline-display-106-av101hdt-a10-dtbs += imx8mp-tx8p-ml81-moduline-display-106.dtb \
 	imx8mp-tx8p-ml81-moduline-display-106-av101hdt-a10.dtbo
diff --git a/arch/arm64/boot/dts/freescale/imx8mp-toradex-smarc-panel-cap-touch-10inch-lvds.dtso b/arch/arm64/boot/dts/freescale/imx8mp-toradex-smarc-panel-cap-touch-10inch-lvds.dtso
new file mode 100644
index 000000000000..a177cf61cc38
--- /dev/null
+++ b/arch/arm64/boot/dts/freescale/imx8mp-toradex-smarc-panel-cap-touch-10inch-lvds.dtso
@@ -0,0 +1,80 @@
+// SPDX-License-Identifier: GPL-2.0-only OR MIT
+/*
+ * Copyright (c) Toradex
+ *
+ * Toradex Capacitive Touch Display 10.1" connected via Toradex SMARC
+ * Development Board LVDS0. Connect the panel to J48 and the touch
+ * controller to J49.
+ *
+ * https://developer.toradex.com/hardware/accessories/displays/capacitive-touch-display-101inch-lvds
+ * https://www.toradex.com/accessories/capacitive-touch-display-10.1-inch-lvds
+ */
+
+/dts-v1/;
+/plugin/;
+
+#include <dt-bindings/clock/imx8mp-clock.h>
+#include <dt-bindings/gpio/gpio.h>
+#include <dt-bindings/interrupt-controller/irq.h>
+#include <dt-bindings/pwm/pwm.h>
+
+&{/} {
+	backlight_lcd0: backlight-lcd0 {
+		compatible = "pwm-backlight";
+		brightness-levels = <0 45 63 88 119 158 203 255>;
+		default-brightness-level = <4>;
+		/* SMARC LCD0_BKLT_EN (SMARC S127) */
+		enable-gpios = <&som_gpio_expander 5 GPIO_ACTIVE_HIGH>;
+		/* SMARC LCD0_BKLT_PWM (SMARC S141) */
+		pwms = <&pwm2 0 6666667 PWM_POLARITY_INVERTED>;
+	};
+
+	panel-lvds-native {
+		compatible = "logictechno,lt170410-2whc";
+		backlight = <&backlight_lcd0>;
+		power-supply = <&reg_carrier_3p3v>;
+
+		port {
+			panel_lvds_native_in: endpoint {
+				remote-endpoint = <&ldb_lvds_ch0>;
+			};
+		};
+	};
+};
+
+/* SMARC I2C_LCD */
+&i2c2 {
+	#address-cells = <1>;
+	#size-cells = <0>;
+
+	touchscreen@4a {
+		compatible = "atmel,maxtouch";
+		reg = <0x4a>;
+		/* SMARC GPIO6 (SMARC P114) - LVDS_TOUCH_INT# */
+		interrupt-parent = <&gpio4>;
+		interrupts = <29 IRQ_TYPE_EDGE_FALLING>;
+		/* SMARC GPIO4 (SMARC P112) - LVDS_RST# */
+		reset-gpios = <&gpio4 18 GPIO_ACTIVE_LOW>;
+	};
+};
+
+&lcdif2 {
+	status = "okay";
+};
+
+&ldb_lvds_ch0 {
+	remote-endpoint = <&panel_lvds_native_in>;
+};
+
+&lvds_bridge {
+	assigned-clocks = <&clk IMX8MP_CLK_MEDIA_LDB>,
+			  <&clk IMX8MP_VIDEO_PLL1>;
+	/*
+	 * This display uses 71.1 MHz pixel clock, so IMX8MP_VIDEO_PLL1 needs
+	 * to be 7 times 71.1 MHz, or 497.7 MHz as the internal divider will
+	 * always divide the output LVDS clock by 7.
+	 */
+	assigned-clock-rates = <0>, <497700000>;
+
+	status = "okay";
+};

-- 
2.43.0


