Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0FF37C5AD55
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 10 Aug 2026 14:01:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=w2RxGy/HDr+ZHJEDxF0FWSRtIXjBooh011FJ3fxMxJo=; b=CrE53YMIj1Jn+vuXCfVisVooKv
	AWf4aKT/0Q8+wWJFM/TDg533aJbsG/GLR4RHMO2N8w6q2m9nerAVTDwYuoV+4FRYyvhy0S8p3SX95
	MG0Z5FoD4licLyyWGY8TO3opiXnuYopRAFdMJzf5e5lB7SZyC3oI/fSjhdu4xbJ+cq+jhiCcg7X0H
	4yjtg2lmtm7u2DiTuq6X58u0VAelEqgke4mtI1yaWPa6YSCjtGqX8vQYnwfVc9bRFk6n45nuBmu2O
	boB23GT/sUknHYHu6f4THp+ifAWObVqnmz93veJphYiV9N5hgwNEVJS6piFRQvouvbdT5a2Nz+OFx
	kBucg1Kw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wtQYq-0000000BwO0-2xc7;
	Mon, 10 Aug 2026 14:01:04 +0000
Received: from mail-wm1-x32e.google.com ([2a00:1450:4864:20::32e])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wtQYm-0000000BwL2-1zdu
	for linux-arm-kernel@lists.infradead.org;
	Mon, 10 Aug 2026 14:01:01 +0000
Received: by mail-wm1-x32e.google.com with SMTP id 5b1f17b1804b1-49557167508so15762105e9.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 10 Aug 2026 07:01:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786370459; x=1786975259; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=w2RxGy/HDr+ZHJEDxF0FWSRtIXjBooh011FJ3fxMxJo=;
        b=hGR0r4iSzspdZhrxxMzGnyKBtPfx1vfuSAR7fT6WrIFMEAPfq5n+kY32EMsZfR7TFd
         6/yCaU8T5p7cAxWFJDNVqoG5v9dtB/IrbmekvKFIelbbe3wm2V1YLOL4M8rkiXfFjtj6
         Czp5dEtXWCcMOTpVxGPv3KWfVVVyb62pKYcX4+HMcB8hqC9GN5zSCx/5jypz2bBWT7VE
         6u+Jy97Bl+rfUHs9PAdnRIW7V4kH6VSYEZXqHQJFt51kxKVKiKP8V9o0Wj+GJxEk+mjy
         aQbDN4KWUeaRfqwOJq3oNZj6RdVI+oFjogyIKdQTqqG8OQBBuUAjCDWA5gXvBG0Lw5Tc
         pONQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786370459; x=1786975259;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=w2RxGy/HDr+ZHJEDxF0FWSRtIXjBooh011FJ3fxMxJo=;
        b=Isf2UvksimSpNDVE6zlmer3l1mxaLrp4JqgJpCA2+Gb/OebXWgRsdT0vcCmt+LaSEZ
         sFozsSOKrKHLi5JhyQMp3j/p1osevbGr4pjaAnLv1sR3XSq0AZ4T+YAXlcr9tQJ4T68p
         2EndoUExawU87C7lgy5cT0hb8SpatIQCqr7RZvyDAMe+Z2L3yaW8knpaaKy3rZ1ZbQ5i
         7IbqhFqcrDicmrxEeQUBN0TAXkouzwLcEAOk6ezQWY7wkhP7oN/VuEOZcQld9CzT0QGm
         Eq+hhSY0f/T9bEeKMVf40mnmpyMO28Xv0kbpYcneTGGpKc007WLeeeSlgHP/TZPjHVFN
         MwtA==
X-Forwarded-Encrypted: i=1; AHgh+RoLmaBAinEPzjsMGg+R7DnXC6fFQ7Go4BbOGx5Y+G8aFm7Yk+bQ/fyP2P11UyukUMO7jZVu9+AEZnBI0sXArg+z@lists.infradead.org
X-Gm-Message-State: AOJu0YzApcUrgUh9jk+cioWjAI33zd5mqr8ic0gQMlhFLzs3GOavMRct
	qcz/4N2ymtb3sfNHKdybQ3GI6MPQzZrLujLMtHiB0ZlR+JF7tvcUw6WV
X-Gm-Gg: AR+sD11LVHhgn3TyhJg7UlzCInbSOj1revs2sykMGD12cotOHdU0dQthFtND+aosuJL
	Sl5TLevzmW0ZTF93qSCaHy95FsK9bT/1iabmEhFITMkwLepkUg46iMAQvldhnfgbC2G6SZQStL6
	BorAUY2QH3JNEJn3+n67YVdnyC9aEw2+AXTC9ZlaBDjbM97C5YuVEm9kBUd2Ck66oW/HoFPm1EW
	NoR78Ki4XsiZBAT0jtLhFFlp3FYoM+F8d2YzAxi/XwrN1D5XQI5O0/nuWc7SJW8N6DoJK/tWbxy
	/LJh6C+U55ctrWOrwKpoOlQ6Yo5X5NGyJyamiwFHJloNbfb9FYK3NVWjG4e94AyJ+GDlq3qwqUe
	P0jb2e1CxwRlKdZYUaLnbAAXeKLsMbvz/KFsVDTlHaB2E1EMHZg36aMsVzPmuL72gp5PkWslGOG
	c+WVhj+8IpBaR2jFfbo7T6ajrJUM6dNA+X0YV0uJrC4VhnW3H2qv5DkWAbKqsZz4A+JZA=
X-Received: by 2002:a05:600c:4692:b0:498:162a:dbda with SMTP id 5b1f17b1804b1-4994e714b73mr549213325e9.5.1786370458470;
        Mon, 10 Aug 2026 07:00:58 -0700 (PDT)
Received: from deb05.proceq.com ([213.160.61.66])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4995c7b2b68sm291661565e9.4.2026.08.10.07.00.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 10 Aug 2026 07:00:58 -0700 (PDT)
From: Mehmet Fide <mehmet.fide@gmail.com>
To: Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Stefan Agner <stefan@agner.ch>
Cc: Pengutronix Kernel Team <kernel@pengutronix.de>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Francesco Dolcini <francesco@dolcini.it>,
	Marcel Ziswiler <marcel.ziswiler@toradex.com>,
	linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 3/3] ARM: dts: vf: add Iris carrier board support for Colibri VF50 and VF61
Date: Mon, 10 Aug 2026 16:00:53 +0200
Message-ID: <20260810140053.2793495-4-mehmet.fide@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260810140053.2793495-1-mehmet.fide@gmail.com>
References: <20260810140053.2793495-1-mehmet.fide@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260810_070100_570299_76ED783F 
X-CRM114-Status: GOOD (  25.36  )
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

Mainline carries Iris device trees for every i.MX Colibri but none for the
Vybrid ones, so a VF50 or VF61 on that carrier has nothing to boot with
except the eval board tree, which describes different hardware.

Add the carrier, following the layout of the i.MX Iris trees: a common
dtsi and one dts per module. It enables the microSD slot, the three UARTs,
SPI, Ethernet, USB and the M41T0 clock on the carrier, switches USB host
VBUS through a regulator on SODIMM 129, and hogs the two GPIOs that turn
the RS232 transceivers on, SODIMM 102 and 104. The touchscreen is an
add-on rather than part of the board, so it is left out.

This describes an Iris V1.1. A V2.0 carries the same signals on the same
pins; what it adds, and what this does not describe, is the regulator on
SODIMM 100 that can cut power to the uSD slot.

Tested on a Colibri VF50 on an Iris V1.1 running 6.18: Ethernet at
100Mbps/Full, a USB dongle enumerating once the VBUS regulator is in
place, the RTC read back over i2c0, all three UARTs, the SPI controller
registering, the microSD slot, and both hogs holding their pins.

Signed-off-by: Mehmet Fide <mehmet.fide@screeningeagle.com>
---
 arch/arm/boot/dts/nxp/vf/Makefile             |   2 +
 arch/arm/boot/dts/nxp/vf/vf-colibri-iris.dtsi | 125 ++++++++++++++++++
 .../boot/dts/nxp/vf/vf500-colibri-iris.dts    |  14 ++
 .../boot/dts/nxp/vf/vf610-colibri-iris.dts    |  13 ++
 4 files changed, 154 insertions(+)
 create mode 100644 arch/arm/boot/dts/nxp/vf/vf-colibri-iris.dtsi
 create mode 100644 arch/arm/boot/dts/nxp/vf/vf500-colibri-iris.dts
 create mode 100644 arch/arm/boot/dts/nxp/vf/vf610-colibri-iris.dts

diff --git a/arch/arm/boot/dts/nxp/vf/Makefile b/arch/arm/boot/dts/nxp/vf/Makefile
index 0a4a7f9..47be8bc 100644
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
index 0000000..d0fa107
--- /dev/null
+++ b/arch/arm/boot/dts/nxp/vf/vf-colibri-iris.dtsi
@@ -0,0 +1,125 @@
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
+	reg_5v0: regulator-5v0 {
+		compatible = "regulator-fixed";
+		regulator-name = "5V";
+		regulator-min-microvolt = <5000000>;
+		regulator-max-microvolt = <5000000>;
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
+		vin-supply = <&reg_5v0>;
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
index 0000000..53dd252
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
+	compatible = "toradex,vf500-colibri_vf50-on-iris", "toradex,vf500-colibri_vf50", "fsl,vf500";
+};
+
diff --git a/arch/arm/boot/dts/nxp/vf/vf610-colibri-iris.dts b/arch/arm/boot/dts/nxp/vf/vf610-colibri-iris.dts
new file mode 100644
index 0000000..2882c87
--- /dev/null
+++ b/arch/arm/boot/dts/nxp/vf/vf610-colibri-iris.dts
@@ -0,0 +1,13 @@
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
+	compatible = "toradex,vf610-colibri_vf61-on-iris", "toradex,vf610-colibri_vf61", "fsl,vf610";
+};
-- 
2.54.0


