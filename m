Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EB194CA5FC4
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  2 Oct 2026 08:14:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=sG8CQcCWRtaNQErwW9LpzQptko3SCWKSnAzOYEFMvfw=; b=xbvWFEoy8epSy4dOawi/B3a7tW
	+/KAqANLgxAvdl9bnGZCSBBy3nYIxyJsA8NjdGlGpHElSZj6cUdgDWztBffyOcO4FBiTxUhvzN6Tj
	t51vWAhMm+6JgbPZqhyY5XgDsNuD2eWF9SUoKcIRXbvDBaRXW3dXdw3RNE/JTigAGzBG2l5HhL+ul
	cVn+f5IqJAXK8i9N+Mf3p9B8PIvY9Zka1KLdj5w58M45unhxZp7zOE1jl+ThmfGrOTuMplpDyStxK
	JkSsC4GDRP9QV0QWlB69aNEUqX4CZkIekYurOTQOfD5RFMVh+vWmK/GOED07N+j8L7T+lb4NK3U/x
	3AR3hFnA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xCYPe-0000000Ax7w-257i;
	Fri, 02 Oct 2026 08:14:38 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xCYPb-0000000Ax4u-3flD
	for linux-arm-kernel@bombadil.infradead.org;
	Fri, 02 Oct 2026 08:14:36 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=sG8CQcCWRtaNQErwW9LpzQptko3SCWKSnAzOYEFMvfw=; b=MQFmsOFM89qxKbNSv6pseOB5UJ
	eG1wpeWv5xIcec4HixF74ksA9FdWX07PX7bstCVwNbw/7sR+gdPXk5us1lt0U3nOzfQU2aqwt5ebo
	ZJJdmjh+Z65N95jurl79Lo+UdlttnWdiWUC08x930UaysBm2dGYxTrmSmgtesx2DNGjRTHnjo3G16
	S89rBCFW2n9wTtcaD5s1KKaY/xjCIC4YC6NHLtK6PlA/UlZUdDL0MSNFOoJnc7d/A8Mq1RcKbt64x
	YdvMasoPtL6AcoOZNjEo1AXBXPPMRo1AWO3UNV/AGCbZjzkXUr9Di2KqOduR+eG9o/m2icMzBC9iR
	IcZFyBbA==;
Received: from www537.your-server.de ([188.40.3.216])
	by desiato.infradead.org with esmtps (Exim 4.99.2 #2 (Red Hat Linux))
	id 1xCYPW-00000005iKE-2XIs
	for linux-arm-kernel@lists.infradead.org;
	Fri, 02 Oct 2026 08:14:34 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=ew.tq-group.com; s=default2602; h=Content-Transfer-Encoding:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID;
	bh=sG8CQcCWRtaNQErwW9LpzQptko3SCWKSnAzOYEFMvfw=; b=dvHmJ71pvhREuxcYouQCDn+VaW
	TvNUHTJSIzMtwKimeQ6DR7qJSRWTk4IUUhlwLfLS/0mZRYCexwweg8XOJM5wRWFBT474vqeEg3bCr
	rrmXRpAkB1wpCbNjB5VRwbcPn5HMYKQY5u9uFEnbCHZq5b0v/Zfm0pgDCQFYfpWfTS1BMfeV1CBAY
	SLjFZ9RR2Ebe6HJRi7FFSl9vEptUWqA7/4B4efxSW7BvtkvIvwuHzR1MOhecoNBfBgqDXo867R4qi
	/ZyTog9RU34CIeGH3mS7YIlowHHVRUvFbtDjh28HyXV+i7PP2tKssz9lC5pcVSTkIVu0/QsqVLw6P
	aW6iKVzA==;
Received: from sslproxy01.your-server.de ([78.46.139.224])
	by www537.your-server.de with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.96.2)
	(envelope-from <alexander.stein@ew.tq-group.com>)
	id 1xCYPQ-0003O2-0O;
	Fri, 02 Oct 2026 10:14:24 +0200
Received: from localhost ([127.0.0.1])
	by sslproxy01.your-server.de with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <alexander.stein@ew.tq-group.com>)
	id 1xCYPQ-000FgI-05;
	Fri, 02 Oct 2026 10:14:23 +0200
From: Alexander Stein <alexander.stein@ew.tq-group.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Frank Li <Frank.Li@nxp.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>
Cc: Alexander Stein <alexander.stein@ew.tq-group.com>,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux@ew.tq-group.com
Subject: [PATCH 5/8] ARM: dts: imx6ul: Add parallel display DT overlay for TQMa6ULx
Date: Fri,  2 Oct 2026 10:14:06 +0200
Message-ID: <20261002081417.2092471-6-alexander.stein@ew.tq-group.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261002081417.2092471-1-alexander.stein@ew.tq-group.com>
References: <20261002081417.2092471-1-alexander.stein@ew.tq-group.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Virus-Scanned: Clear (ClamAV 1.4.3/28141/Fri Oct  2 08:26:12 2026)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261002_091431_441760_435BDC11 
X-CRM114-Status: GOOD (  15.87  )
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

Both displays are attached on X4 and differ only in display settings.
Note: Due to hardware wiring a 24-Bit bus-width has to be used.

Signed-off-by: Alexander Stein <alexander.stein@ew.tq-group.com>
---
 arch/arm/boot/dts/nxp/imx/Makefile            |  4 ++
 .../imx6ul-tqma6ul2-mba6ulx-cdtech-dc44.dtso  | 53 +++++++++++++++++++
 .../imx6ul-tqma6ul2-mba6ulx-cdtech-fc21.dtso  | 53 +++++++++++++++++++
 3 files changed, 110 insertions(+)
 create mode 100644 arch/arm/boot/dts/nxp/imx/imx6ul-tqma6ul2-mba6ulx-cdtech-dc44.dtso
 create mode 100644 arch/arm/boot/dts/nxp/imx/imx6ul-tqma6ul2-mba6ulx-cdtech-fc21.dtso

diff --git a/arch/arm/boot/dts/nxp/imx/Makefile b/arch/arm/boot/dts/nxp/imx/Makefile
index 08d88adce2b7e..3d34af776a5bb 100644
--- a/arch/arm/boot/dts/nxp/imx/Makefile
+++ b/arch/arm/boot/dts/nxp/imx/Makefile
@@ -421,11 +421,15 @@ dtb-$(CONFIG_SOC_IMX6UL) += \
 	imx6ulz-bsh-smm-m2.dtb
 
 imx6ul-tqma6ul2-mba6ulx-lvds-tm070jvhg33-dtbs += imx6ul-tqma6ul2-mba6ulx.dtb imx6ul-tqma6ul2-mba6ulx-lvds-tm070jvhg33.dtbo
+imx6ul-tqma6ul2-mba6ulx-cdtech-dc44-dtbs += imx6ul-tqma6ul2-mba6ulx.dtb imx6ul-tqma6ul2-mba6ulx-cdtech-dc44.dtbo
+imx6ul-tqma6ul2-mba6ulx-cdtech-fc21-dtbs += imx6ul-tqma6ul2-mba6ulx.dtb imx6ul-tqma6ul2-mba6ulx-cdtech-fc21.dtbo
 imx6ul-tqma6ul2l-mba6ulx-lvds-tm070jvhg33-dtbs += imx6ul-tqma6ul2-mba6ulx.dtb imx6ul-tqma6ul2-mba6ulx-lvds-tm070jvhg33.dtbo
 imx6ull-tqma6ull2-mba6ulx-lvds-tm070jvhg33-dtbs += imx6ull-tqma6ull2-mba6ulx.dtb imx6ul-tqma6ul2-mba6ulx-lvds-tm070jvhg33.dtbo
 imx6ull-tqma6ull2l-mba6ulx-lvds-tm070jvhg33-dtbs += imx6ull-tqma6ull2l-mba6ulx.dtb imx6ul-tqma6ul2-mba6ulx-lvds-tm070jvhg33.dtbo
 
 dtb-$(CONFIG_SOC_IMX6UL) += 	imx6ul-tqma6ul2-mba6ulx-lvds-tm070jvhg33.dtb
+dtb-$(CONFIG_SOC_IMX6UL) += 	imx6ul-tqma6ul2-mba6ulx-cdtech-dc44.dtb
+dtb-$(CONFIG_SOC_IMX6UL) += 	imx6ul-tqma6ul2-mba6ulx-cdtech-fc21.dtb
 dtb-$(CONFIG_SOC_IMX6UL) += 	imx6ul-tqma6ul2l-mba6ulx-lvds-tm070jvhg33.dtb
 dtb-$(CONFIG_SOC_IMX6UL) += 	imx6ull-tqma6ull2-mba6ulx-lvds-tm070jvhg33.dtb
 dtb-$(CONFIG_SOC_IMX6UL) += 	imx6ull-tqma6ull2l-mba6ulx-lvds-tm070jvhg33.dtb
diff --git a/arch/arm/boot/dts/nxp/imx/imx6ul-tqma6ul2-mba6ulx-cdtech-dc44.dtso b/arch/arm/boot/dts/nxp/imx/imx6ul-tqma6ul2-mba6ulx-cdtech-dc44.dtso
new file mode 100644
index 0000000000000..12bafa497067e
--- /dev/null
+++ b/arch/arm/boot/dts/nxp/imx/imx6ul-tqma6ul2-mba6ulx-cdtech-dc44.dtso
@@ -0,0 +1,53 @@
+// SPDX-License-Identifier: (GPL-2.0-or-later OR MIT)
+/*
+ * Copyright 2018-2026 TQ-Systems GmbH <linux@ew.tq-group.com>,
+ * D-82229 Seefeld, Germany.
+ * Author: Markus Niebel
+ * Author: Alexander Stein
+ */
+
+/dts-v1/;
+/plugin/;
+
+#include <dt-bindings/gpio/gpio.h>
+#include <dt-bindings/interrupt-controller/irq.h>
+
+&backlight {
+	pwms = <&pwm2 0 20000 0>;
+	brightness-levels = <0 2 4 8 16 32 64 128 255>;
+	default-brightness-level = <8>;
+	status = "okay";
+};
+
+&display {
+	compatible = "cdtech,s070swv29hg-dc44";
+	power-supply = <&reg_mba6ul_3v3>;
+	status = "okay";
+};
+
+&i2c4 {
+	#address-cells = <1>;
+	#size-cells = <0>;
+
+	touchscreen@38 {
+		compatible = "edt,edt-ft5406";
+		reg = <0x38>;
+		interrupt-parent = <&expander_in0>;
+		interrupts = <3 IRQ_TYPE_EDGE_FALLING>;
+		wake-gpios = <&expander_out0 1 GPIO_ACTIVE_HIGH>;
+		/* reset-gpios is controlled by stk reset */
+		gain = <20>;
+		touchscreen-size-x = <800>;
+		touchscreen-size-y = <480>;
+		iovcc-supply = <&reg_mba6ul_3v3>;
+		vcc-supply = <&reg_mba6ul_3v3>;
+	};
+};
+
+&lcdif {
+	status = "okay";
+};
+
+&lcdif_out {
+	bus-width = <24>;
+};
diff --git a/arch/arm/boot/dts/nxp/imx/imx6ul-tqma6ul2-mba6ulx-cdtech-fc21.dtso b/arch/arm/boot/dts/nxp/imx/imx6ul-tqma6ul2-mba6ulx-cdtech-fc21.dtso
new file mode 100644
index 0000000000000..36a055d34c354
--- /dev/null
+++ b/arch/arm/boot/dts/nxp/imx/imx6ul-tqma6ul2-mba6ulx-cdtech-fc21.dtso
@@ -0,0 +1,53 @@
+// SPDX-License-Identifier: (GPL-2.0-or-later OR MIT)
+/*
+ * Copyright 2018-2026 TQ-Systems GmbH <linux@ew.tq-group.com>,
+ * D-82229 Seefeld, Germany.
+ * Author: Markus Niebel
+ * Author: Alexander Stein
+ */
+
+/dts-v1/;
+/plugin/;
+
+#include <dt-bindings/gpio/gpio.h>
+#include <dt-bindings/interrupt-controller/irq.h>
+
+&backlight {
+	pwms = <&pwm2 0 20000 0>;
+	brightness-levels = <0 2 4 8 16 32 64 128 255>;
+	default-brightness-level = <8>;
+	status = "okay";
+};
+
+&display {
+	compatible = "cdtech,s070pws19hp-fc21";
+	power-supply = <&reg_mba6ul_3v3>;
+	status = "okay";
+};
+
+&i2c4 {
+	#address-cells = <1>;
+	#size-cells = <0>;
+
+	touchscreen@38 {
+		compatible = "edt,edt-ft5406";
+		reg = <0x38>;
+		interrupt-parent = <&expander_in0>;
+		interrupts = <3 IRQ_TYPE_EDGE_FALLING>;
+		wake-gpios = <&expander_out0 1 GPIO_ACTIVE_HIGH>;
+		/* reset-gpios is controlled by stk reset */
+		gain = <20>;
+		touchscreen-size-x = <1024>;
+		touchscreen-size-y = <600>;
+		iovcc-supply = <&reg_mba6ul_3v3>;
+		vcc-supply = <&reg_mba6ul_3v3>;
+	};
+};
+
+&lcdif {
+	status = "okay";
+};
+
+&lcdif_out {
+	bus-width = <24>;
+};
-- 
2.55.0


