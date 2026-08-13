Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E5DEEC5B572
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 13 Aug 2026 16:11:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=pnq03KAWqgH6HH5nirP52bCCrm4Fj5p/TfEHastox6U=; b=vZX1GK1UiY+IRMZywbMdJUGgpb
	NsRpqnpQr0C3vaJvHQ7lGb+iexxr40deBzs8WxX5Pi/vtYbhqsNBbMAGu+5GcdEyDS0BZaRT2d5k9
	0CdKrS/aywPMZCqDSK8PyFqtFSEhaTjjEqDeHfp0GINJ6l1Ix+B9xQgI70fQIbEvpq4t0Geq196r8
	RbyX57xul2OUrOnVk1vVBkuh0NBV3xx2oMOPDU3zuVVm+AeZE8WU7mRt16WwkrquOh6COs2aB87qr
	hcSjHUijaFArP4tk3Zrgh6iwdYH2bjXVpBH01MMnf3tak+awTJBEwEyQcotu4PiJ+Axz79khKsnJY
	POQp8uoQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wuY1X-000000017fa-1JPX;
	Thu, 13 Aug 2026 16:11:19 +0000
Received: from mail-wm1-x334.google.com ([2a00:1450:4864:20::334])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wuY1M-000000017Yo-3myK
	for linux-arm-kernel@lists.infradead.org;
	Thu, 13 Aug 2026 16:11:10 +0000
Received: by mail-wm1-x334.google.com with SMTP id 5b1f17b1804b1-49554ebb87dso782945e9.3
        for <linux-arm-kernel@lists.infradead.org>; Thu, 13 Aug 2026 09:11:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786637467; x=1787242267; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=pnq03KAWqgH6HH5nirP52bCCrm4Fj5p/TfEHastox6U=;
        b=shvES0mLceg4mtUjWxh2Z1ajTWQ03Cmoe2ljBcGG40+jii902SsJKrqx9QazcpbRr7
         q5duWAMWUyAeY7fHkgkc+DWDh+/Z+UsFAYOoMaI180I8WxemxYjRHn7vNv9ysXgn+wUH
         RYQanOA5nmUviIY/wYmlYeESfJWB6fvsLPzFTZ+t8MMdY6tPEHRym7htzBtcK4Ztr8lD
         wVHfcGuzgxSqQ2iaCJKXbkZBc9sMPPvQJVKL5Jygpfi2k6WxcIoJv+03j04lQUzzFEa1
         Xe8clgYDzhhjEcN4lgIzGtVIhKzVkWkZBRqprX0pxhlLYwahi+G3Igd6V6chrpVlQP5U
         qFlg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786637467; x=1787242267;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=pnq03KAWqgH6HH5nirP52bCCrm4Fj5p/TfEHastox6U=;
        b=VIGKZ30z73wNVLgeir0qNxrDTBzRggzla/PZrQ02wkxj7F7KzJth5DX84mAXBjwGh5
         B5csPZPbFyqLF2vEkZrazYylVvi1JWPCd3Ae3zD4zydHUriP+ruzfL4v/jq7j4y72u6U
         ND+XgN48pXKMkoqdFaQO4z2HI0yfz1duD76oMKcr1YEt1MJy752mCMEfNknCSG2L3cTd
         5o0y0QKKKrir5NZ1WpTTFibvFUnX+12ojetJ7VpjcWg8e0m9//0oZ8p83gf/Gx2XZoKR
         4mhnzp/HO24AjIx+UfL1qrssmvhQv3i3QqVtBC+yi/fpTCc6ng5dRzXyKwll9YHs46xF
         tJ/A==
X-Forwarded-Encrypted: i=1; AHgh+Ro5K3WsUxKEdvNGuFZoSSzqZgIUCvBXdG75e5ziTIO7Ja0bL8yClwFIEEEdWumNJ9cthVwpD0Z1qtYQM4xbgwA5@lists.infradead.org
X-Gm-Message-State: AOJu0YwAzrYrGXhv69WM7eTTdcMeqe8pGrCNVhwbHZ4YUTDnGaJJ7pNb
	IvgXl6pRhRd36RV2rId8gIkyZzykaK4LHpGmgfg9sOU/5GRgR3xsQ0kI
X-Gm-Gg: AR+sD11glrtnO5mAbOBZs+v2WGkkBkyDg7CzhKe+PQUu8tDrq4H2OZxYDmWhFgOBUxZ
	c9eBW4ZQNMLZKDtPd/LMKzwoebM9oDXhzUAAaCpX4/WlDwyP+4kkaVBWUXEETP6eg/H0nsqXlFT
	EN0ui1duFNuKnsw5Ky5eDnj1SckVfmWAJzlQQLYOnqaewbWgPkO9+B6aAclakNM8m/OEuY+rIOe
	2tOQasGz7jRbn1IBtG23ntkIWODIvFO8xSXJkTf8eeJrGhG2v5kHQYWEzIxWQFl/BtXGzu6TRQL
	CeUlk/V4I76o+22/IXLOz9d+CMyJmV1k19U05wfMLf77iFrAIWmG9taqchgR3TDtD/noeURcbKW
	3EBeYjEXQjwMgOguzNrrHPLghpISloAeiXCfgRRc71CqQ6GNO+TFCf0sxzWleTUDSn/GK1TZZzo
	JMhqcG0OjezA7xtgqMrBSvSGPfb89qY6gw0nqYSEMo1MOwG9e4TzXMKUCNXwojjjwfPzVvm4dMT
	/Qo
X-Received: by 2002:a05:600c:8b2f:b0:496:c378:6420 with SMTP id 5b1f17b1804b1-499821a2051mr98698775e9.8.1786637467151;
        Thu, 13 Aug 2026 09:11:07 -0700 (PDT)
Received: from deb05.proceq.com ([213.160.61.66])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4815f21a24esm449409f8f.11.2026.08.13.09.11.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 13 Aug 2026 09:11:06 -0700 (PDT)
From: Mehmet Fide <mehmet.fide@gmail.com>
To: Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>
Cc: Frank Li <Frank.Li@nxp.com>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Stefan Agner <stefan@agner.ch>,
	Fabio Estevam <festevam@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Francesco Dolcini <francesco@dolcini.it>,
	linux-arm-kernel@lists.infradead.org,
	imx@lists.linux.dev,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Mehmet Fide <mehmet.fide@screeningeagle.com>
Subject: [PATCH v4 4/4] ARM: dts: vf: add Iris carrier board support for Colibri VF50 and VF61
Date: Thu, 13 Aug 2026 18:11:01 +0200
Message-ID: <20260813161101.2274327-5-mehmet.fide@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260813161101.2274327-1-mehmet.fide@gmail.com>
References: <20260813161101.2274327-1-mehmet.fide@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260813_091108_980657_79DDE8C2 
X-CRM114-Status: GOOD (  24.82  )
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

From: Mehmet Fide <mehmet.fide@screeningeagle.com>

The Iris is a small off-the-shelf carrier board for the Colibri
family. Describe what the board itself provides: Ethernet, one USB
host and one OTG port, the pin header UARTs, i2c with the carrier
RTC on it, the PWM pins on the X16 header, SPI and the microSD slot.
The host port gets its VBUS through a regulator on SODIMM 129, and
the two GPIOs that turn the RS232 transceivers on, SODIMM 102 and
104, are hogged. The touchscreen is an add-on rather than part of
the board, so it is left out.

This describes an Iris V1.1. A V2.0 carries the same signals on the
same pins; what it adds, and what this does not describe, is the
regulator on SODIMM 100 that can cut power to the uSD slot.

Tested on a Colibri VF50 on an Iris V1.1 running 6.18: Ethernet at
100Mbps/Full, a USB dongle enumerating once the VBUS regulator is in
place, the RTC read back over i2c0, all three UARTs, the SPI
controller registering, both PWM chips registering, the microSD
slot, the EXT_IO pin group still applied next to the carrier hog
group, and both hogs holding their pins.

Signed-off-by: Mehmet Fide <mehmet.fide@screeningeagle.com>
---
 arch/arm/boot/dts/nxp/vf/Makefile             |   2 +
 arch/arm/boot/dts/nxp/vf/vf-colibri-iris.dtsi | 126 ++++++++++++++++++
 .../boot/dts/nxp/vf/vf500-colibri-iris.dts    |  14 ++
 .../boot/dts/nxp/vf/vf610-colibri-iris.dts    |  14 ++
 4 files changed, 156 insertions(+)
 create mode 100644 arch/arm/boot/dts/nxp/vf/vf-colibri-iris.dtsi
 create mode 100644 arch/arm/boot/dts/nxp/vf/vf500-colibri-iris.dts
 create mode 100644 arch/arm/boot/dts/nxp/vf/vf610-colibri-iris.dts

diff --git a/arch/arm/boot/dts/nxp/vf/Makefile b/arch/arm/boot/dts/nxp/vf/Makefile
index 0a4a7f9dd43e..47be8bc318e2 100644
--- a/arch/arm/boot/dts/nxp/vf/Makefile
+++ b/arch/arm/boot/dts/nxp/vf/Makefile
@@ -1,8 +1,10 @@
 # SPDX-License-Identifier: GPL-2.0
 dtb-$(CONFIG_SOC_VF610) += \
 	vf500-colibri-eval-v3.dtb \
+	vf500-colibri-iris.dtb \
 	vf610-bk4.dtb \
 	vf610-colibri-eval-v3.dtb \
+	vf610-colibri-iris.dtb \
 	vf610m4-colibri.dtb \
 	vf610-cosmic.dtb \
 	vf610m4-cosmic.dtb \
diff --git a/arch/arm/boot/dts/nxp/vf/vf-colibri-iris.dtsi b/arch/arm/boot/dts/nxp/vf/vf-colibri-iris.dtsi
new file mode 100644
index 000000000000..36e34dd766ae
--- /dev/null
+++ b/arch/arm/boot/dts/nxp/vf/vf-colibri-iris.dtsi
@@ -0,0 +1,126 @@
+// SPDX-License-Identifier: GPL-2.0-or-later OR MIT
+/*
+ * Copyright 2026 Mehmet Fide
+ *
+ * Toradex Iris carrier board V1.1, common part for Colibri VF50 and VF61.
+ *
+ * The Colibri modules are pin compatible, so the carrier signals sit on the
+ * same SODIMM pins as they do for the i.MX modules, whose Iris device trees
+ * are already upstream. The two SODIMM pins below are taken from the Colibri
+ * VFxx datasheet (102 -> PTA12 -> PORT0[5], 104 -> PTD28 -> PORT2[2]).
+ *
+ * An Iris V2.0 carries the same signals on the same pins, so everything here
+ * works on it as well. What it adds is a regulator on SODIMM 100 that can cut
+ * power to the uSD slot, which this file does not describe.
+ */
+
+/ {
+	chosen {
+		stdout-path = "serial0:115200n8";
+	};
+
+	reg_usbh_vbus: regulator-usbh-vbus {
+		compatible = "regulator-fixed";
+		pinctrl-names = "default";
+		pinctrl-0 = <&pinctrl_usbh1_reg>;
+		regulator-name = "VCC_USB[1-4]";
+		regulator-min-microvolt = <5000000>;
+		regulator-max-microvolt = <5000000>;
+		gpio = <&gpio2 19 GPIO_ACTIVE_LOW>;	/* SODIMM 129, USBH_PEN */
+	};
+};
+
+&gpio0 {
+	/*
+	 * The RS232 transceivers on the carrier are switched on by these two
+	 * lines. Delete the hog to turn a transceiver off from userspace.
+	 * The pin group belongs to the gpio controller rather than to iomuxc,
+	 * which would depend on its own child and log a dependency cycle.
+	 */
+	pinctrl-names = "default";
+	pinctrl-0 = <&pinctrl_iris_uart1_tx_on>;
+
+	uart1-tx-on-hog {
+		gpio-hog;
+		gpios = <5 GPIO_ACTIVE_HIGH>;	/* SODIMM 102 */
+		output-high;
+	};
+};
+
+&gpio2 {
+	pinctrl-names = "default";
+	/* keep the EXT_IO group from vf-colibri.dtsi alongside ours */
+	pinctrl-0 = <&pinctrl_gpio_ext>, <&pinctrl_iris_uart25_tx_on>;
+
+	uart25-tx-on-hog {
+		gpio-hog;
+		gpios = <2 GPIO_ACTIVE_HIGH>;	/* SODIMM 104 */
+		output-high;
+	};
+};
+
+&iomuxc {
+	pinctrl_iris_uart1_tx_on: irisuart1txongrp {
+		fsl,pins = <
+			VF610_PAD_PTA12__GPIO_5		0x22ef
+		>;
+	};
+
+	pinctrl_iris_uart25_tx_on: irisuart25txongrp {
+		fsl,pins = <
+			VF610_PAD_PTD28__GPIO_66	0x22ef
+		>;
+	};
+};
+
+/* Colibri SSP, on the extension connector */
+&dspi1 {
+	status = "okay";
+};
+
+&esdhc1 {
+	status = "okay";
+};
+
+&fec1 {
+	status = "okay";
+};
+
+&pwm0 {
+	status = "okay";
+};
+
+&pwm1 {
+	status = "okay";
+};
+
+&i2c0 {
+	status = "okay";
+
+	/* M41T0M6 real time clock on the carrier */
+	rtc@68 {
+		compatible = "st,m41t0";
+		reg = <0x68>;
+	};
+};
+
+&uart0 {
+	status = "okay";
+};
+
+&uart1 {
+	status = "okay";
+};
+
+&uart2 {
+	status = "okay";
+};
+
+&usbdev0 {
+	status = "okay";
+};
+
+&usbh1 {
+	vbus-supply = <&reg_usbh_vbus>;
+	status = "okay";
+};
diff --git a/arch/arm/boot/dts/nxp/vf/vf500-colibri-iris.dts b/arch/arm/boot/dts/nxp/vf/vf500-colibri-iris.dts
new file mode 100644
index 000000000000..aa91537cab37
--- /dev/null
+++ b/arch/arm/boot/dts/nxp/vf/vf500-colibri-iris.dts
@@ -0,0 +1,14 @@
+// SPDX-License-Identifier: GPL-2.0-or-later OR MIT
+/*
+ * Copyright 2026 Mehmet Fide
+ */
+
+/dts-v1/;
+#include "vf500-colibri.dtsi"
+#include "vf-colibri-iris.dtsi"
+
+/ {
+	model = "Toradex Colibri VF50 on Iris Carrier Board";
+	compatible = "toradex,vf500-colibri-vf50-on-iris", "toradex,vf500-colibri_vf50",
+		     "fsl,vf500";
+};
diff --git a/arch/arm/boot/dts/nxp/vf/vf610-colibri-iris.dts b/arch/arm/boot/dts/nxp/vf/vf610-colibri-iris.dts
new file mode 100644
index 000000000000..7db5aa490966
--- /dev/null
+++ b/arch/arm/boot/dts/nxp/vf/vf610-colibri-iris.dts
@@ -0,0 +1,14 @@
+// SPDX-License-Identifier: GPL-2.0-or-later OR MIT
+/*
+ * Copyright 2026 Mehmet Fide
+ */
+
+/dts-v1/;
+#include "vf610-colibri.dtsi"
+#include "vf-colibri-iris.dtsi"
+
+/ {
+	model = "Toradex Colibri VF61 on Iris Carrier Board";
+	compatible = "toradex,vf610-colibri-vf61-on-iris", "toradex,vf610-colibri_vf61",
+		     "fsl,vf610";
+};
-- 
2.54.0


