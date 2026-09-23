Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E6E0BC9830B
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 23 Sep 2026 15:53:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Ogzk1zAksC1p2lO2lX+ildRtH5U/X0N5sk/kFhqIelM=; b=AUZgB+Rct0j1THAEH5eWdfiRMM
	fsBtIO/JOKdjnvp7/t7CgF9F5QMmjjZk8ct8Tn+KYoOygzTdjaMs7LRgUClaXAdhJ4YXpCe3a+/Sq
	DgjNN64vghpzoZJBMzTq+ZGHFuje+nsaJDa54eAUJsJ84sY74anxsFTLJgiVkw7bZtFLBBsLEoTKs
	9F7DTPNW2WWq30ISVksSpSHnjP/nGECQojZgH/3FyqmTOpwTfrwOT7sJHgJEgrMyVdbkUT9rE+I7X
	H2+yKRWaE1SDq924OL0/0d0SCg8Gqnmf9fy7bIwwxjdam8Rku8yJ1l3Yk2REPIGCJXZDOsAl8AdHr
	CmwfvHkw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9PI6-00000008oGK-1IW3;
	Wed, 23 Sep 2026 15:53:50 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9PHz-00000008oEv-10lG
	for linux-arm-kernel@bombadil.infradead.org;
	Wed, 23 Sep 2026 15:53:43 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=Ogzk1zAksC1p2lO2lX+ildRtH5U/X0N5sk/kFhqIelM=; b=f/RD/dMdQRdbwBvKTqOTCGRQ/8
	xoWuWzhxJK8mp9D1X9PrRltIblsPZKkEzEea31dWl8eDlHc7z19ueS8i/05TB/NhMbmRkHsxcJrE3
	yDyt3mBOvqY7Ll0aY2Ch53W71DXOlTvXiC+BAWvz3/Rn0QEYIb6Sd9hLJKmm0HGaddJjyVrQgTrsR
	XNjm1WtVDlqYlSFTKrRSRffem1kUtIhV8oi1JwZAhRlY4pBY4e7ElwcixTWHQLRugnfDbUuSHhSmc
	+CPOsV4y4+htxRCju8LZ0rV2FlI3kcFVDNGN2DcXKfSBvodZDFC46iOKTD02m0k+pU/PyMVTa+t6P
	L9CDEPiQ==;
Received: from mail-wm2-x10.google.com ([2a00:1450:4864:31::10])
	by desiato.infradead.org with esmtps (Exim 4.99.2 #2 (Red Hat Linux))
	id 1x9PHw-0000000EyTJ-2JqY
	for linux-arm-kernel@lists.infradead.org;
	Wed, 23 Sep 2026 15:53:42 +0000
Received: by mail-wm2-x10.google.com with SMTP id 5b1f17b1804b1-49b912e2406so5463695e9.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 23 Sep 2026 08:53:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google; t=1790178818; x=1790783618; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Ogzk1zAksC1p2lO2lX+ildRtH5U/X0N5sk/kFhqIelM=;
        b=cNyCMNp7wKg0Gfhf0vJl5f+OKMocYwytrtcioKrEnaNId1Ggd3x6rKyLvONZy8ZW+g
         h7k5ZTMNAf8dmkKewCc6PtTQtX8D55GlM2m/cmyonCtkuNsLgh1/WPf6lCOtotcIXkjz
         G2oPKa3Iar9QqB8RJMpGXM9ceMehYNzn4toDY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790178818; x=1790783618;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Ogzk1zAksC1p2lO2lX+ildRtH5U/X0N5sk/kFhqIelM=;
        b=2HO0ApK8+vfOQCRGXIj4lVcO8de8YDAi2KCK2c0wKY5g8eMkwF07k/pREFWGR5PxQi
         c9e1iBVw/D8nNII6c78M7oIwbp2cfg/I3SpNqD8b1RA+GaEGUanSez9TJ42yzPpFUcpF
         46XVjLkqPn6uul3yzrZrsH2cqNdA0mEvPm00NHvp7XQF5af9Me7bT/xMfYY2kHxYLU5r
         rdzh4ABL9w3jgfQiZQZFyu5fk/tyaoMu/YdH0QQJvEa72VZ9RV+jf6ffvcaG8VZhL/DN
         cLNjUc9gZldHHixzeypkPLscgOKEInGCmos49Gt++rQRUi9xM2GCXrlMUwIvxPOraXnF
         FFKA==
X-Forwarded-Encrypted: i=1; AKwUvBzPVroylcXZh9uhGheAF1QHwXE1NtE6eOzAHuCMH3pK3dKIxHrRUjTcScumv55sv9IiJ7+kZy2vOACWid57xj6k@lists.infradead.org
X-Gm-Message-State: AFuF++m6wNMMlA9sfXtg/mRCUznW6DSOzL2LeI2mpKsiHbZWm14Ztlz2
	8FEiIq8NcsL3QHSukJQGz8XkoLZdYQqy2OL+ADGS5RHzCDdf+SWcJiyavVod0XqFm30=
X-Gm-Gg: AYBFou0UMZrDSVQby258DcPfOPM+tutXcmk2M5U/DKNwf9ulnv3SdKVVlNvDK1YqSeL
	Nq9TwMjQUGBYwOSFj0SghpxCVae4xMdqRBBz9FZ+pt96ldRzjQV03LFRhwbiN9LkvVbsPqW4vHd
	O2s/5BNlGzy/Qp3jm4zwHlIB0AuBsr9SQPLPHRl01QmuD04xP02IMq4L/m3VrPW5bJUesFo7y7a
	O0cDUuIUgpSXcPx14HvYoInHaUa1XHafSzK4oHLHiVL3DHybKamD9M22rDDbBzUlbqJ7zeUFooi
	1OeSCleV6l4fXJ2JbmX8AdFlUiGsp6kcpk5pj9C1SUu6sS+XpKRjcN7L7lCOTtQWNzMFkz6UKQG
	edF1khUylmPBx4z/JrcsGgK1DxMtKyOg+H/eVEg4XHrQ0j9j2VY0D6qAEn04tsjjZrm3iSLIPMR
	BczMUI+ZQUYnIyARUbmiYyVcLQbh3GfOEOYyut7LJLkEsJ2g2ccAomMTljtUg+a5Nnnpj8tTAD7
	ufyByB7wpzV9MEazw6CGiYWya8B+4fgW2He7YKIVD6jF56poXRKtUeFvvMJJXvLSPM=
X-Received: by 2002:a05:600c:1988:b0:49b:8f5e:51fb with SMTP id 5b1f17b1804b1-49fdf3571f9mr41898745e9.3.1790178818353;
        Wed, 23 Sep 2026 08:53:38 -0700 (PDT)
Received: from localhost.localdomain ([2001:b07:6474:ebbf:12f8:fcfa:728a:2514])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49fde1d5f10sm81858555e9.8.2026.09.23.08.53.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Sep 2026 08:53:37 -0700 (PDT)
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
To: Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>
Cc: michael@amarulasolutions.com,
	domenico.acri@engicam.com,
	linux-arm-kernel@lists.infradead.org,
	Marek Vasut <marex@nabladev.com>,
	francesco.utel@engicam.com,
	linux-kernel@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com,
	devicetree@vger.kernel.org,
	Conor Dooley <conor+dt@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	linux-amarula@amarulasolutions.com,
	Dario Binacchi <dario.binacchi@amarulasolutions.com>
Subject: [PATCH v2 1/2] arm64: dts: st: move Engicam MicroGEA-STM32MP257D-RMM display to an overlay
Date: Wed, 23 Sep 2026 17:53:09 +0200
Message-ID: <20260923155333.610134-2-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260923155333.610134-1-dario.binacchi@amarulasolutions.com>
References: <20260923155333.610134-1-dario.binacchi@amarulasolutions.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260923_165340_675148_C6168D7E 
X-CRM114-Status: GOOD (  16.53  )
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

Changes in v2:
- Keep the full cs-gpios in the board dts, the overlay only adds the
  panel node. Suggested by Sashiko.

 arch/arm64/boot/dts/st/Makefile               |  6 ++
 ...icrogea-rmm-overlay-rk050hr345-ct106a.dtso | 68 +++++++++++++++++++
 .../st/stm32mp257d-engicam-microgea-rmm.dts   | 46 +------------
 3 files changed, 75 insertions(+), 45 deletions(-)
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
index 000000000000..f89641bdb23b
--- /dev/null
+++ b/arch/arm64/boot/dts/st/stm32mp257d-engicam-microgea-rmm-overlay-rk050hr345-ct106a.dtso
@@ -0,0 +1,68 @@
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
index f5af0913bf1b..faedddc2c914 100644
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
@@ -259,21 +230,6 @@ &spi1 {
 	#size-cells = <0>;
 	cs-gpios = <&gpioh 8 GPIO_ACTIVE_LOW>, <&gpioh 3 GPIO_ACTIVE_HIGH>;
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


