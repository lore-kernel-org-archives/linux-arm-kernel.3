Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B682DC9830E
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 23 Sep 2026 15:24:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ozMsbDX9PM7NmdNq22axboQ2GO4zjike6CEQPX9ud3M=; b=M5LQ7t+MdYnxqHU4uoRi8mheMA
	8dX2TMvU9q5sU+qZjimCBbm9n6rg6+oBz/D8q3VrfgVDwh1yFZCI65qeh987swwvMl0jZoVgthGdE
	8jeXrfekf6nFvQ6UDkB3aBLHrfN+KMMzB+8b0X0EhOOf7HWrak94PeboQmElepMVOj+XD3tG1Ev6O
	nXeoWr6z3wUDxf/p2jTdK39jmyzR3X55CN4FCfnVwnfi0AIu06rjPRXW7mSRiRHvpIJo5tD5w4eq3
	BgdlD61DfzKzwb+qGw9FJ/ZZh6i94aJdnZaXFF55zCT5Q642ldkcUI8gaz6kC78puyVwEvgLVmDC2
	ncFVeR6A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9Oq3-00000008jGL-0Vug;
	Wed, 23 Sep 2026 15:24:51 +0000
Received: from mail-wm2-x11.google.com ([2a00:1450:4864:31::11])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9Opv-00000008jCz-29Wl
	for linux-arm-kernel@lists.infradead.org;
	Wed, 23 Sep 2026 15:24:44 +0000
Received: by mail-wm2-x11.google.com with SMTP id 5b1f17b1804b1-49b965f447cso8289835e9.3
        for <linux-arm-kernel@lists.infradead.org>; Wed, 23 Sep 2026 08:24:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google; t=1790177082; x=1790781882; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ozMsbDX9PM7NmdNq22axboQ2GO4zjike6CEQPX9ud3M=;
        b=DYhyR5offt5Gi9lB9lIitqETufc9URDgUYwh4UOqtNn+b5d+MOM7/Nln1aOOrGrL0O
         amdU6CmA2PDAH8qIfj5RqKb/rWZ8z0xZFkdWqU5H/k35+URFjIrCd/KiIgvrn6LnpVVs
         vSyJOHRiZCE3d6h46u5BnkW/FkZrCIVqCImJY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790177082; x=1790781882;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=ozMsbDX9PM7NmdNq22axboQ2GO4zjike6CEQPX9ud3M=;
        b=mmU2L0bsu5j0B6shsFqWMzvaEaajlOKchgzL5JkUrXGHBVGrgVAuQ8g+j8tC6SMW+V
         V8dxow0jls47TvdWq119zKCmnfNnRvUxfmpuK29K3kTC0jmjVOD/rVdOg0dWzdCFZmZr
         wch2QanUW6Uf2KBhn/Vy0SL3xiq8jsYMPa7kCBsBB5Dia9+AiYQThHtN9fP7Yc8fPQtP
         dEeNgkJUsQykui42xjieu0+Vi36cV5lCQzIVzH1oESADrAxzDtLuGdJuRLlUYlx4K776
         py265tscAbe3Wr7QiRJXiwqu6VncBkI0BrBtvFyjepeoude+09f7uAQSEjlHBCdiHLrs
         bV1g==
X-Forwarded-Encrypted: i=1; AKwUvBzXghbS2yTUFd8IT1L307ctMsZBLruAHhca9P7Rdf0NP5cFIb4lLxCb6BFvKDRazeIba5lnGTXGOMMnm4uXKuzo@lists.infradead.org
X-Gm-Message-State: AFuF++macDgZc5ORIKM/y22wK5Rn2K0CUEP0O4SE2FeypomJh9vaKVX+
	4HdtFEMYJE46KTBs8lvMtDUJbctpQDEwn54UTNCCP/AREa+lWzFuUKU+z94xWb5483g=
X-Gm-Gg: AYBFou07VFABJ2zcdc7ovP+yVlpbwG7yKjrY6oNhTpUopPwIg+7lC80vwQI1WQdgKK3
	eoYcpid2j83XiITjs4SsrxL0rysy7cnh9JegUTHN/cIa9Kz7+zrzs9SfxEczIQwDDhMBbubz4WM
	DXnDlex2S1sZnSKns8tqKsJwOof4d6BQMW9TwTe5BASLgdqGj1soPn38opsFMMbKjX69Ux2h9r2
	rPMLetbKxkkHlRqyeF2ZOjzW/PDqsOkWdcl4EGrPHTJkyZTAuu6VVH+I5OfF2WLKAipMTNGl8zd
	C1qIQp+4TTLlZoD1KngaAcqbp2g9YMlKht+DogF/aykXLczKRMeEe3JSk2YrI7ow3iWsm8qEkC1
	uaEU1u6Tbf1tYbBPhcC25RhhRY7niBa/tqYzbMR7X5+Xh18He9WTtpemAS+ryM1l2RNoilH7O84
	30EZvDLyorMBkVUSnHVUPGlVeccu2CwpAVblDEKEEJJy0ipBOl08jhZaSLcw86iRFMq+4Dq+dYa
	/gl3zEf8ITGeBkWZzm03/3OHkoEleLj89mqojlXAsGMYm54+hNrmTPVKi0mkcTZNgo=
X-Received: by 2002:a05:600c:c16d:b0:49c:ff9f:f6b6 with SMTP id 5b1f17b1804b1-49fdee0b7f2mr42436965e9.6.1790177081744;
        Wed, 23 Sep 2026 08:24:41 -0700 (PDT)
Received: from localhost.localdomain ([2001:b07:6474:ebbf:12f8:fcfa:728a:2514])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49fe0c446e1sm55582165e9.2.2026.09.23.08.24.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Sep 2026 08:24:41 -0700 (PDT)
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
To: Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>
Cc: linux-stm32@st-md-mailman.stormreply.com,
	francesco.utel@engicam.com,
	linux-arm-kernel@lists.infradead.org,
	linux-amarula@amarulasolutions.com,
	domenico.acri@engicam.com,
	devicetree@vger.kernel.org,
	Rob Herring <robh@kernel.org>,
	Marek Vasut <marex@nabladev.com>,
	Conor Dooley <conor+dt@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	michael@amarulasolutions.com,
	linux-kernel@vger.kernel.org,
	Dario Binacchi <dario.binacchi@amarulasolutions.com>
Subject: [PATCH 1/2] arm64: dts: st: move Engicam MicroGEA-STM32MP257D-RMM display to an overlay
Date: Wed, 23 Sep 2026 17:23:47 +0200
Message-ID: <20260923152435.563925-2-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260923152435.563925-1-dario.binacchi@amarulasolutions.com>
References: <20260923152435.563925-1-dario.binacchi@amarulasolutions.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260923_082443_578574_C112CFE2 
X-CRM114-Status: GOOD (  16.66  )
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

The board is fitted with different displays depending on the product
variant. Keep in the board dts only what is common to all variants and
move the RK050HR345-CT106A RGB panel and its touchscreen to an overlay.

Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
---

 arch/arm64/boot/dts/st/Makefile               |  6 ++
 ...icrogea-rmm-overlay-rk050hr345-ct106a.dtso | 69 +++++++++++++++++++
 .../st/stm32mp257d-engicam-microgea-rmm.dts   | 49 +------------
 3 files changed, 78 insertions(+), 46 deletions(-)
 create mode 100644 arch/arm64/boot/dts/st/stm32mp257d-engicam-microgea-rmm-overlay-rk050hr345-ct106a.dtso

diff --git a/arch/arm64/boot/dts/st/Makefile b/arch/arm64/boot/dts/st/Makefile
index 6cbccfd50993..218ff7fdf576 100644
--- a/arch/arm64/boot/dts/st/Makefile
+++ b/arch/arm64/boot/dts/st/Makefile
@@ -1,7 +1,13 @@
 # SPDX-License-Identifier: GPL-2.0-only
+stm32mp257d-engicam-microgea-rmm-overlay-rk050hr345-ct106a-dtbs := \
+	stm32mp257d-engicam-microgea-rmm.dtb \
+	stm32mp257d-engicam-microgea-rmm-overlay-rk050hr345-ct106a.dtbo
+
 dtb-$(CONFIG_ARCH_STM32) += \
 	stm32mp215f-dk.dtb \
 	stm32mp235f-dk.dtb \
 	stm32mp257d-engicam-microgea-rmm.dtb \
+	stm32mp257d-engicam-microgea-rmm-overlay-rk050hr345-ct106a.dtb \
+	stm32mp257d-engicam-microgea-rmm-overlay-rk050hr345-ct106a.dtbo \
 	stm32mp257f-dk.dtb \
 	stm32mp257f-ev1.dtb
diff --git a/arch/arm64/boot/dts/st/stm32mp257d-engicam-microgea-rmm-overlay-rk050hr345-ct106a.dtso b/arch/arm64/boot/dts/st/stm32mp257d-engicam-microgea-rmm-overlay-rk050hr345-ct106a.dtso
new file mode 100644
index 000000000000..e64dd277ff09
--- /dev/null
+++ b/arch/arm64/boot/dts/st/stm32mp257d-engicam-microgea-rmm-overlay-rk050hr345-ct106a.dtso
@@ -0,0 +1,69 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Copyright (C) 2026 Amarula Solutions, Dario Binacchi <dario.binacchi@amarulasolutions.com>
+ * Copyright (C) 2026 Engicam srl
+ *
+ * Rocktech RK050HR345-CT106A 5" 480x854 RGB panel with EDT FT5306
+ * I2C touchscreen controller.
+ */
+
+/dts-v1/;
+/plugin/;
+
+#include <dt-bindings/gpio/gpio.h>
+#include <dt-bindings/interrupt-controller/irq.h>
+
+&i2c1 {
+	pinctrl-names = "default", "sleep";
+	pinctrl-0 = <&i2c1_pins_a>;
+	pinctrl-1 = <&i2c1_sleep_pins_a>;
+	i2c-scl-rising-time-ns = <185>;
+	i2c-scl-falling-time-ns = <20>;
+	#address-cells = <1>;
+	#size-cells = <0>;
+	status = "okay";
+
+	touchscreen@38 {
+		compatible = "edt,edt-ft5306";
+		reg = <0x38>;
+		interrupt-parent = <&gpiob>;
+		interrupts = <0 IRQ_TYPE_EDGE_FALLING>;
+		reset-gpios = <&gpiod 1 GPIO_ACTIVE_LOW>;
+		touchscreen-size-x = <480>;
+		touchscreen-size-y = <854>;
+	};
+};
+
+&ltdc {
+	pinctrl-names = "default", "sleep";
+	pinctrl-0 = <&ltdc_pins_a>;
+	pinctrl-1 = <&ltdc_sleep_pins_a>;
+	status = "okay";
+
+	port {
+		ltdc_out: endpoint {
+			remote-endpoint = <&panel_in>;
+		};
+	};
+};
+
+&spi1 {
+	#address-cells = <1>;
+	#size-cells = <0>;
+	cs-gpios = <&gpioh 8 GPIO_ACTIVE_LOW>, <&gpioh 3 GPIO_ACTIVE_HIGH>;
+
+	display@0 {
+		compatible = "rocktech,rk050hr345-ct106a", "ilitek,ili9806e";
+		reg = <0>;
+		vdd-supply = <&reg_3v3>;
+		spi-max-frequency = <10000000>;
+		reset-gpios = <&gpiob 6 GPIO_ACTIVE_LOW>;
+		backlight = <&backlight>;
+
+		port {
+			panel_in: endpoint {
+				remote-endpoint = <&ltdc_out>;
+			};
+		};
+	};
+};
diff --git a/arch/arm64/boot/dts/st/stm32mp257d-engicam-microgea-rmm.dts b/arch/arm64/boot/dts/st/stm32mp257d-engicam-microgea-rmm.dts
index f5af0913bf1b..4b39b6c482d6 100644
--- a/arch/arm64/boot/dts/st/stm32mp257d-engicam-microgea-rmm.dts
+++ b/arch/arm64/boot/dts/st/stm32mp257d-engicam-microgea-rmm.dts
@@ -116,25 +116,9 @@ &arm_wdt {
 };
 
 &i2c1 {
-	pinctrl-names = "default", "sleep";
-	pinctrl-0 = <&i2c1_pins_a>;
-	pinctrl-1 = <&i2c1_sleep_pins_a>;
-	i2c-scl-rising-time-ns = <185>;
-	i2c-scl-falling-time-ns = <20>;
-	status = "okay";
-	/* spare dmas for other usage */
+	/* dt overlays don't support /delete-property/ */
 	/delete-property/dmas;
 	/delete-property/dma-names;
-
-	touchscreen@38 {
-		compatible = "edt,edt-ft5306";
-		reg = <0x38>;
-		interrupt-parent = <&gpiob>;
-		interrupts = <0 IRQ_TYPE_EDGE_FALLING>;
-		reset-gpios = <&gpiod 1 GPIO_ACTIVE_LOW>;
-		touchscreen-size-x = <480>;
-		touchscreen-size-y = <854>;
-	};
 };
 
 &i2c2 {
@@ -179,19 +163,6 @@ sgtl5000_rx_endpoint: endpoint@1 {
 	};
 };
 
-&ltdc {
-	pinctrl-names = "default", "sleep";
-	pinctrl-0 = <&ltdc_pins_a>;
-	pinctrl-1 = <&ltdc_sleep_pins_a>;
-	status = "okay";
-
-	port {
-		ltdc_out: endpoint {
-			remote-endpoint = <&panel_in>;
-		};
-	};
-};
-
 &m_can1 {
 	pinctrl-names = "default", "sleep";
 	pinctrl-0 = <&m_can1_pins_a>;
@@ -257,23 +228,9 @@ &spi1 {
 	pinctrl-1 = <&spi1_sleep_pins_a>;
 	#address-cells = <1>;
 	#size-cells = <0>;
-	cs-gpios = <&gpioh 8 GPIO_ACTIVE_LOW>, <&gpioh 3 GPIO_ACTIVE_HIGH>;
+	/* CS0 is reserved for the display fitted through overlay */
+	cs-gpios = <0>, <&gpioh 3 GPIO_ACTIVE_HIGH>;
 	status = "okay";
-
-	display: display@0 {
-		compatible = "rocktech,rk050hr345-ct106a", "ilitek,ili9806e";
-		reg = <0>;
-		vdd-supply = <&reg_3v3>;
-		spi-max-frequency = <10000000>;
-		reset-gpios = <&gpiob 6 GPIO_ACTIVE_LOW>;
-		backlight = <&backlight>;
-
-		port {
-			panel_in: endpoint {
-				remote-endpoint = <&ltdc_out>;
-			};
-		};
-	};
 };
 
 &timers2 {
-- 
2.43.0


