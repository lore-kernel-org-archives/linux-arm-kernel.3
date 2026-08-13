Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 84DADC5B572
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 13 Aug 2026 13:34:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=6StSRmQ3TXpbzmYjkKhFphWCpJTIb1eQDdlKaP58Ns0=; b=v9qz5mbjfkvz2RgVdrc4nta81s
	ZnpYyWenP06jW/zFqApSc0nyEuSWvBC50PN2l2rdrhpngWl3P5OhSWwMF7zQQ79lKwDKqDYdkeXAR
	8a62Cto0n6VWDHgW4XVlyrprNBqJakxefkQgheb3dI+CiCDH+IXv4Pf1hG1do5kpEHo6oL1mG6qXG
	d4ymlyACqKnhiX8wh0z/171fDJqj5ngfIGmRzwvkzq+y/Mer/rlwh7uI3dYiiWelnzR8zbH73YrB0
	cfPJNKgIEudrQcm3/F+YVfxGgEOHZ24vLwbxlOuC8/QIUNyYc03oCKRaNAdWhU0IodXHi/X1l4EO3
	iFOp4jUw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wuVZx-00000000kkG-1H5a;
	Thu, 13 Aug 2026 13:34:41 +0000
Received: from mail-pj1-x1030.google.com ([2607:f8b0:4864:20::1030])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wuVZv-00000000kjE-2ejx
	for linux-arm-kernel@lists.infradead.org;
	Thu, 13 Aug 2026 13:34:41 +0000
Received: by mail-pj1-x1030.google.com with SMTP id 98e67ed59e1d1-38759bcd877so941807a91.2
        for <linux-arm-kernel@lists.infradead.org>; Thu, 13 Aug 2026 06:34:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786628079; x=1787232879; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=6StSRmQ3TXpbzmYjkKhFphWCpJTIb1eQDdlKaP58Ns0=;
        b=OYV81jiOGy0hkU/KFWPJo9Ay0I1YAEQP9FZAebwobEj/5YXQ3g+0jPSyKUCFBX5RdI
         J58r0cUd31q65UkxkYBGEljvWZtEG7l5Lm8c8rYAlG98+KnoekyvugRAzgtSwWFYRQ4B
         yeRWlSwS/JzLEQEvBnzNLR1+gF0VJf5aOPNlqtOvmYpjV+necFVoTGi9Xw2gLOJq95Zn
         CsEP3NizVq2qVeeBjPqEGINZH7qYq5p4xzY1286QJZNnNBw/EXeXu9U0fsHKoMzyOJpY
         5uwwIXBfClcYiCEI2Gl9o4Svr0l21772z21FKXb5mTaPnPZB55vSI6HMvqXquRRaIFxc
         jcGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786628079; x=1787232879;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=6StSRmQ3TXpbzmYjkKhFphWCpJTIb1eQDdlKaP58Ns0=;
        b=AGlKly1X275QqsndRINb2EJb6Jb73L/8YYRJguuGUuVPSDTHpaWe9Rc/1VpufhHP4Q
         IKMKlF8QimHKim/5gZfxBMbiSiD0Jl1ffWR2YObofrEzDexPZNMVnxvs+PWd984QLaxR
         DXJGcOGa35rdBqivcCahCJ8LsAHg9PtwoMpSpQUWhQP3jaCeX4yX5rEKL+6Y+2pxrfel
         SEZyR5aD4LypeP4uDxJq7+ypk1vsLn5gbuQGz+oTuje/JGOCDQB6fIW9QNbAUS44rOPU
         rJS9u1yczZ3je+YH7afWvvPgzi9NAptw8+WAfRc+bIW6FmvbwBUgcgezmnl+deQPwYWL
         bpfA==
X-Forwarded-Encrypted: i=1; AHgh+RpuNZNqiLqsSWiGfqjJoAXiykE5qd34fDy4Gj1eGFXyNEVS+qRzZDfuZyOM56XeaQlqivwYZ9BeAYM58OQMWwAf@lists.infradead.org
X-Gm-Message-State: AOJu0YwSseuLR35fg5mBjejzDGW8KN1weYOYgib1rRI9tk8cQ951jwPM
	Q7avusnJZxjKJRcURzvEwu0E2Jokd0HadHqMk7RzanNcX9yB0Nv2XRb1fbP+9ID5PnA=
X-Gm-Gg: AR+sD13HtoEYp+h1ltOwcnc0SPGluH1/HUjGEgKxzqOX8v+9SOrYzNPdsg1kI9lzI59
	+y+efyQV6fBp0KgbudiXDWV43ZXfFwQx6jspW4zO+yFqfmaZDRQZUhXVrIpH+K6qGikbApMRY3z
	MdlosGIDpXEj/cRucgZ5va0bJKJM30bku7VjCJVEbLDfsGRkEwweYJZfxh8D2l4deAun7rOkUy6
	V8m9jpxQQXnNFnN76gN+DF4mEIvd2GijRM+SntewS00pgkBu5aNjrxHiQXyFJYwB1Gyw2ygZqr4
	J0EA307lT/T9+4Lr6hU4NfLPqYvbtaYqxEE3ACUWmCrGXG5nM06tzf0pcYozT6guzx928aavgEN
	ZdqrUEsLJ996yIF4b71EnBq5zkTlszJ1Z1ANmpWVw88naeYWSVhZQ6oS99KVrJTaR0/Oj7sKAZj
	c8fdQApWLHGs8rGZl9dPu1FkiFwKr8eJEcZp0Lz8oMnKAf5zfehZd+Lk7lFKN5sXMLeUZbh4RV9
	7n8LFA=
X-Received: by 2002:a17:90b:4fcd:b0:38d:eaec:4396 with SMTP id 98e67ed59e1d1-3931e23aa93mr6950170a91.11.1786628078271;
        Thu, 13 Aug 2026 06:34:38 -0700 (PDT)
Received: from leonardoc-nb ([179.160.38.252])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-31ebc75d891sm8447990eec.5.2026.08.13.06.34.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 13 Aug 2026 06:34:37 -0700 (PDT)
From: Leonardo Costa <leoreis.costa@gmail.com>
To: Frank.Li@nxp.com,
	s.hauer@pengutronix.de,
	kernel@pengutronix.de,
	festevam@gmail.com,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org
Cc: imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Leonardo Costa <leonardo.costa@toradex.com>
Subject: [PATCH 1/6] arm64: dts: freescale: imx8mp-verdin: Add Toradex Capacitive Touch Display 10.1" LVDS
Date: Thu, 13 Aug 2026 10:33:30 -0300
Message-ID: <20260813133335.1941580-2-leoreis.costa@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260813133335.1941580-1-leoreis.costa@gmail.com>
References: <20260813133335.1941580-1-leoreis.costa@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260813_063439_684560_A0532A5B 
X-CRM114-Status: GOOD (  14.90  )
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

From: Leonardo Costa <leonardo.costa@toradex.com>

Add a device tree overlay for the Toradex Capacitive Touch Display 10.1"
LVDS connected via Verdin iMX8M Plus LCDIF on carrier boards exposing LVDS
interface (e.g., Mallow). The panel is a LogicTechno LT170410-2WHC 10.1"
WXGA IPS LCD and the touch input is provided by an Atmel MaxTouch
capacitive touch controller.

Link: https://developer.toradex.com/hardware/accessories/displays/capacitive-touch-display-101inch-lvds
Signed-off-by: Leonardo Costa <leonardo.costa@toradex.com>
---
 arch/arm64/boot/dts/freescale/Makefile        |  6 ++
 ...mp-verdin-panel-cap-touch-10inch-lvds.dtso | 95 +++++++++++++++++++
 2 files changed, 101 insertions(+)
 create mode 100644 arch/arm64/boot/dts/freescale/imx8mp-verdin-panel-cap-touch-10inch-lvds.dtso

diff --git a/arch/arm64/boot/dts/freescale/Makefile b/arch/arm64/boot/dts/freescale/Makefile
index 201460ee5669..d643f85baa7f 100644
--- a/arch/arm64/boot/dts/freescale/Makefile
+++ b/arch/arm64/boot/dts/freescale/Makefile
@@ -514,13 +514,19 @@ dtb-$(CONFIG_ARCH_MXC) += imx8mp-verdin-nonwifi-ivy.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx8mp-verdin-nonwifi-mallow.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx8mp-verdin-nonwifi-yavia.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx8mp-verdin-nonwifi-zinnia.dtb
+dtb-$(CONFIG_ARCH_MXC) += imx8mp-verdin-panel-cap-touch-10inch-lvds.dtbo
 dtb-$(CONFIG_ARCH_MXC) += imx8mp-verdin-wifi-dahlia.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx8mp-verdin-wifi-dev.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx8mp-verdin-wifi-ivy.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx8mp-verdin-wifi-mallow.dtb
+dtb-$(CONFIG_ARCH_MXC) += imx8mp-verdin-wifi-mallow-panel-cap-touch-10inch-lvds.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx8mp-verdin-wifi-yavia.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx8mp-verdin-wifi-zinnia.dtb
 
+imx8mp-verdin-wifi-mallow-panel-cap-touch-10inch-lvds-dtbs := \
+	imx8mp-verdin-wifi-mallow.dtb \
+	imx8mp-verdin-panel-cap-touch-10inch-lvds.dtbo
+
 imx8mp-evk-lvds0-imx-dlvds-hdmi-channel0-dtbs += imx8mp-evk.dtb imx8mp-evk-lvds0-imx-dlvds-hdmi-channel0.dtbo
 imx8mp-evk-lvds0-imx-lvds-hdmi-dtbs += imx8mp-evk.dtb imx8mp-evk-lvds0-imx-lvds-hdmi.dtbo
 imx8mp-evk-lvds1-imx-dlvds-hdmi-channel0-dtbs += imx8mp-evk.dtb imx8mp-evk-lvds1-imx-dlvds-hdmi-channel0.dtbo
diff --git a/arch/arm64/boot/dts/freescale/imx8mp-verdin-panel-cap-touch-10inch-lvds.dtso b/arch/arm64/boot/dts/freescale/imx8mp-verdin-panel-cap-touch-10inch-lvds.dtso
new file mode 100644
index 000000000000..9079c6284dfa
--- /dev/null
+++ b/arch/arm64/boot/dts/freescale/imx8mp-verdin-panel-cap-touch-10inch-lvds.dtso
@@ -0,0 +1,95 @@
+// SPDX-License-Identifier: GPL-2.0-or-later OR MIT
+/*
+ * Copyright (c) Toradex
+ *
+ * Toradex Capacitive Touch Display 10.1" connected via Verdin iMX8M Plus LCDIF
+ * on carrier boards with a Toradex standard LVDS display connector
+ * (e.g., Mallow).
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
+#include "imx8mp-pinfunc.h"
+
+&{/} {
+	panel-lvds-native {
+		compatible = "logictechno,lt170410-2whc";
+		backlight = <&backlight>;
+		power-supply = <&reg_3p3v>;
+
+		port {
+			panel_lvds_native_in: endpoint {
+				remote-endpoint = <&ldb_lvds_ch0>;
+			};
+		};
+	};
+};
+
+&backlight {
+	/* Verdin PWM_2 (SODIMM 16) */
+	pwms = <&pwm2 0 6666667 PWM_POLARITY_INVERTED>;
+
+	status = "okay";
+};
+
+&iomuxc {
+	pinctrl_i2s_2_d_in_gpio: gpio4io30grp {
+		fsl,pins = <MX8MP_IOMUXC_SAI3_RXD__GPIO4_IO30 0x1c4>;	/* SODIMM 48 */
+	};
+
+	pinctrl_i2s_2_sync_gpio: gpio4io31grp {
+		fsl,pins = <MX8MP_IOMUXC_SAI3_TXFS__GPIO4_IO31 0x184>;	/* SODIMM 44 */
+	};
+};
+
+&atmel_mxt_ts_mezzanine {
+	pinctrl-names = "default";
+	pinctrl-0 = <&pinctrl_i2s_2_d_in_gpio>, <&pinctrl_i2s_2_sync_gpio>;
+	/* Verdin I2S_2_SYNC as GPIO (SODIMM 44) */
+	interrupt-parent = <&gpio4>;
+	interrupts = <31 IRQ_TYPE_EDGE_FALLING>;
+	/* Verdin I2S_2_D_IN as GPIO (SODIMM 48) */
+	reset-gpios = <&gpio4 30 GPIO_ACTIVE_LOW>;
+	vdd-supply = <&reg_3p3v>;
+
+	status = "okay";
+};
+
+&lcdif2 {
+	status = "okay";
+};
+
+&lvds_bridge {
+	assigned-clocks = <&clk IMX8MP_CLK_MEDIA_LDB>,
+			  <&clk IMX8MP_VIDEO_PLL1>;
+	/*
+	 * This display uses 71.1 MHz pixel clock, so IMX8MP_VIDEO_PLL1 needs
+	 * to be 7 times 71.1MHz, or 497.7 MHz as the internal divider will
+	 * always divide the output LVDS clock by 7.
+	 */
+	assigned-clock-rates = <0>, <497700000>;
+
+	status = "okay";
+
+	ports {
+		#address-cells = <1>;
+		#size-cells = <0>;
+
+		port@1 {
+			reg = <1>;
+
+			ldb_lvds_ch0: endpoint {
+				remote-endpoint = <&panel_lvds_native_in>;
+			};
+		};
+	};
+};

