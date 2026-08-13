Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5B44AC5B572
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 13 Aug 2026 14:06:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=gGVXJHdeFlybbXZS8ISeiKQPBePx7KulAfQGxVyoFuI=; b=qTIrBqC53xS0uT7Zd1U4I/X8Km
	gFNS17c8Zz4ESyIIj9JztgUzEmYYCexjc4kinSeAT2LdigR/Mi63wnQoNteIrbM18k96kpLNC0Yum
	O26Ksk5UKolkCQ5te5nntlYZG20YxiSMpPp3rjBUBE8x1bQ0jcqEozR4d6XBWz+Vn+Cf1DkV3rKb4
	sG8c2DwioHUwQsIbVPJGXe7lYbLBIcerR72gdEeZZe7l5N5AH44vMUAbTGZNwXUorZuGLGtaMzL8+
	vwvbaPwHm9PURPX47tIdLB/2f28rRfpdbclEx2YA5id298TYbxp0+tAmSu/CIjaJlDSxNW8WGJqh6
	xwPVJaUA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wuW4S-00000000o3p-2l3v;
	Thu, 13 Aug 2026 14:06:12 +0000
Received: from mail-wr1-x431.google.com ([2a00:1450:4864:20::431])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wuW4N-00000000o0O-3Lql
	for linux-arm-kernel@lists.infradead.org;
	Thu, 13 Aug 2026 14:06:08 +0000
Received: by mail-wr1-x431.google.com with SMTP id ffacd0b85a97d-47fd66a094eso846964f8f.3
        for <linux-arm-kernel@lists.infradead.org>; Thu, 13 Aug 2026 07:06:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786629966; x=1787234766; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=gGVXJHdeFlybbXZS8ISeiKQPBePx7KulAfQGxVyoFuI=;
        b=TSDv4uj6ZA7732MGS/KjaQvzo2SZLSJiulcYGpYt4I8quNNDbieiAqykiwAiP1Luuq
         R2b4cLxwxGV+K3srmuDhlRNQFXq5q72j0lkXRU+rIG18bv1oRVUXFA5vSu13ZpyKM4Nn
         /+51IQlfRihuDHI7qUzXxhi1M+gt+Je7x0ixADtK/B6iRo6tyNsBjN4US8+u7BK4C9bV
         zrNct7NeAOSg70/6zBU6V4d3OIBnKpynWjjn1Gk68nNVBR1Jvf3eUxg2jNvB4SIA6Yiv
         n7mRsM18t9f5N0NPKy5HI27ndfkWi/mNUA7lmYmy/lR+dQn1UCfwXwDUmvkJr0qsqR2D
         5sKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786629966; x=1787234766;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=gGVXJHdeFlybbXZS8ISeiKQPBePx7KulAfQGxVyoFuI=;
        b=YFCMZl6cVej3ebKFRegh2qloiIcKSuM4FUoX1WZEetslt06QJHzfPnfdpAFJQR4rY3
         tgYiao7xH6AIalIkQNdh+lre72A2WOkXJrAo+1E7BoqviQmBA21bOVocFaF/DdFdr1BA
         leLfJWw/h9ch1Ect4Q2vpijTcNwZ0B/x1Z8UeU4cQYLhSTtXvBewUx1VMse1dGG1HQPP
         CvyUyEYNl1zG3NDQQtmljb3LG7efx5CtrWuGNMSp2hxEYAYnbsmGcKa+6Gghh3jJnqS2
         safm4Fe7eAKUQwHasgkEL9bC4vGzoGqY6N3zYlZ4hfE5pecFMqFXgVx5EpTyjMzn9TFx
         L6OA==
X-Forwarded-Encrypted: i=1; AHgh+RrNfkSz/eYSzYSsPln2es6p0SpAx2Ev7H6nkZ6rGFYFRO2yf9Ekv8JfqvWHXx8n6DPAFY1BcKBT50Hu2b43HM1m@lists.infradead.org
X-Gm-Message-State: AOJu0Yy+IpbBXUxqT46KmVyxr59UHPDRdD5D0OluwJlWe1WZtIswBZlW
	B1WVGCK3yN2vSM5zMqbYjD+83ICSG9C6jjdT/oscB2E5R53o2O7SBSQB
X-Gm-Gg: AR+sD10mAUn2sw/eCtFaGhEVUZPpqQyMhzv4cBWRJE7IGGapxJroThte/IpBUhsYeOL
	BB8N+evqpWQdSqrPilvHz2kG40NFaBoA6NYIcoFkXV207d9B86Dun9wxuXLWC2QZxr++Fvb4Yzo
	EWrpHNksF/nb69YR86PQmM/rV8R8J4a4jx6TmGDUEHKxsxGO13ZBOp6W05RpQ0bmmAlbCLXYXtu
	DuRI/nW7NmkcN1GBbToviWkbK+syEmikEClD99E+M8OfxtKJ5XKPeO4qlp18NVLDGmvdbWfiJ7Z
	vc5mW9ulZpBeCnLrPqFDM62gQS9gDdop6ELfgh+pT1cFO5nHXWSgIycon7oF2SfdgyHwXrS5O/k
	8WjUVuITNqlMdBJIBeCxmO7d6adkj4x2zla5F4TCg5nNKvWSaAby7AbXfIPTi6tA/gW7j5a2diV
	msHmyEW8DTDW9Qj6pKB9dnj1pgGto6/THX1xuL6y6cQTxJwfUXltHwkBfE+GN4xFIECJ46D12cG
	GkF
X-Received: by 2002:a05:6000:46cf:b0:47f:9447:62bf with SMTP id ffacd0b85a97d-48159c90a2dmr6604624f8f.2.1786629965802;
        Thu, 13 Aug 2026 07:06:05 -0700 (PDT)
Received: from deb05.proceq.com ([213.160.61.66])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4815a5af191sm6690190f8f.19.2026.08.13.07.06.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 13 Aug 2026 07:06:05 -0700 (PDT)
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
Subject: [PATCH v3 4/4] ARM: dts: vf: add Iris carrier board support for Colibri VF50 and VF61
Date: Thu, 13 Aug 2026 16:06:00 +0200
Message-ID: <20260813140600.1824949-5-mehmet.fide@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260813140600.1824949-1-mehmet.fide@gmail.com>
References: <20260813140600.1824949-1-mehmet.fide@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260813_070607_875774_275B94C7 
X-CRM114-Status: GOOD (  23.49  )
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
RTC on it, PWM, SPI and the microSD slot. The host port gets its
VBUS through a regulator on SODIMM 129, and the two GPIOs that turn
the RS232 transceivers on, SODIMM 102 and 104, are hogged. The
touchscreen is an add-on rather than part of the board, so it is
left out.

This describes an Iris V1.1. A V2.0 carries the same signals on the
same pins; what it adds, and what this does not describe, is the
regulator on SODIMM 100 that can cut power to the uSD slot.

Tested on a Colibri VF50 on an Iris V1.1 running 6.18: Ethernet at
100Mbps/Full, a USB dongle enumerating once the VBUS regulator is in
place, the RTC read back over i2c0, all three UARTs, the SPI
controller registering, the microSD slot, and both hogs holding
their pins.

Signed-off-by: Mehmet Fide <mehmet.fide@screeningeagle.com>
---
 arch/arm/boot/dts/nxp/vf/Makefile             |   2 +
 arch/arm/boot/dts/nxp/vf/vf-colibri-iris.dtsi | 117 ++++++++++++++++++
 .../boot/dts/nxp/vf/vf500-colibri-iris.dts    |  14 +++
 .../boot/dts/nxp/vf/vf610-colibri-iris.dts    |  14 +++
 4 files changed, 147 insertions(+)
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
index 000000000000..bbd0dd76c33c
--- /dev/null
+++ b/arch/arm/boot/dts/nxp/vf/vf-colibri-iris.dtsi
@@ -0,0 +1,117 @@
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
+	pinctrl-0 = <&pinctrl_iris_uart25_tx_on>;
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


