Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8AB04CD8C9D
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  8 Jun 2026 14:22:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=AjzJOtlPOWolbocPDPj2Mu/WPgqYCce8DVRroR5vn9c=; b=Fzu8g7X0Mvoq8CM7DOo1/6oTwS
	Zj5g7PrX/QA4e61i+/70uYh4PdFbTJ/xQPHSc0ES8wsuVsF5H5fsG+Gowluf7nTAxNogmsp2VaZJ2
	Si3zxngckitDcMZBi6MShMaaT7xYnc0weScIbYq/oMprmmHArzi57qh5e5CGhkY4tmX3+aZfJ67C+
	NaGxfBhucstmmDX/RjwKG+mVMeaDOLDvR44FnvGWx3vQFeFqQ1bfjWq23DakMTWkjz1eTV12KoOzR
	EWo6jKp6HieYB3ZdBYw+KUwvVZz1MmhWCYU9Ji3GbuU2S3kIC8q2spByG2TnhX1xuo2M9vHLUm9+a
	HV9ZEXDg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wWarS-00000003j4T-17yi;
	Mon, 08 Jun 2026 14:21:54 +0000
Received: from www537.your-server.de ([188.40.3.216])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wWarP-00000003j3C-1DUW
	for linux-arm-kernel@lists.infradead.org;
	Mon, 08 Jun 2026 14:21:53 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=ew.tq-group.com; s=default2602; h=Content-Transfer-Encoding:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID;
	bh=AjzJOtlPOWolbocPDPj2Mu/WPgqYCce8DVRroR5vn9c=; b=ftZixARZc/H2Qog4qO3GgGme0O
	udA+6UEUmOPWiroloDU1XrJJsCPQHefBi9eLtA8zLDSYie5AH5BA86mlU1hCjY6SS73bCVNMrOlln
	U9q7hfvo3ouo1vdX5vd7Yx9MK3EkIXwsVtqqEfdymTswztIrAvG4Pecx8hKifGBh6N5Tht+EWdp6K
	lVkM+rn4eujf40H4ekSQYglBtaOjaEFKT/EEzGUofn++mxkjqnJTExzpyynE4l7IOrxzFTDJ+H6Fo
	j3070PKoZHUDj6sWjpKOGnK3G/kh9wUN8GdTj8rOyaJTxQusZebZYztQ+denizatZx4baZFGDGkAC
	ldYa8PAQ==;
Received: from sslproxy06.your-server.de ([78.46.172.3])
	by www537.your-server.de with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.96.2)
	(envelope-from <alexander.stein@ew.tq-group.com>)
	id 1wWarN-000ITW-0E;
	Mon, 08 Jun 2026 16:21:49 +0200
Received: from localhost ([127.0.0.1])
	by sslproxy06.your-server.de with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <alexander.stein@ew.tq-group.com>)
	id 1wWarL-0008uk-2p;
	Mon, 08 Jun 2026 16:21:48 +0200
From: Alexander Stein <alexander.stein@ew.tq-group.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Frank Li <Frank.Li@nxp.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>,
	Shawn Guo <shawnguo@kernel.org>
Cc: Paul Gerber <paul.gerber@tq-group.com>,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux@ew.tq-group.com,
	linux-renesas-soc@vger.kernel.org,
	Alexander Stein <alexander.stein@ew.tq-group.com>
Subject: [PATCH v5 3/4] arm64: dts: freescale: add LVDS overlays for TQMa8MPxS
Date: Mon,  8 Jun 2026 16:21:32 +0200
Message-ID: <20260608142144.564871-3-alexander.stein@ew.tq-group.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260608142144.564871-1-alexander.stein@ew.tq-group.com>
References: <20260608142144.564871-1-alexander.stein@ew.tq-group.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Virus-Scanned: Clear (ClamAV 1.4.3/28025/Mon Jun  8 08:33:34 2026)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260608_072151_471937_0A32486F 
X-CRM114-Status: GOOD (  14.18  )
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

From: Paul Gerber <paul.gerber@tq-group.com>

This adds overlays for the supported LVDS display tianma tm070jvhg33
for both LVDS channels.

The display timings have to be specified explicitly. Using the typical
pixel clock, the LDB clock can not be configured as the 7-fold of that.
By setting pixel clock to 74.25 MHz, LDB can be configured to exactly
519.75 MHz.

Signed-off-by: Paul Gerber <paul.gerber@tq-group.com>
Signed-off-by: Alexander Stein <alexander.stein@ew.tq-group.com>
---
Changes in v5:
* Reformat commit message.

 arch/arm64/boot/dts/freescale/Makefile        |  5 +++
 ...qma8mpqs-mb-smarc-2-lvds0-tm070jvhg33.dtso | 43 +++++++++++++++++++
 ...qma8mpqs-mb-smarc-2-lvds1-tm070jvhg33.dtso | 43 +++++++++++++++++++
 3 files changed, 91 insertions(+)
 create mode 100644 arch/arm64/boot/dts/freescale/imx8mp-tqma8mpqs-mb-smarc-2-lvds0-tm070jvhg33.dtso
 create mode 100644 arch/arm64/boot/dts/freescale/imx8mp-tqma8mpqs-mb-smarc-2-lvds1-tm070jvhg33.dtso

diff --git a/arch/arm64/boot/dts/freescale/Makefile b/arch/arm64/boot/dts/freescale/Makefile
index acb73cde76f16..2f4568e7105f4 100644
--- a/arch/arm64/boot/dts/freescale/Makefile
+++ b/arch/arm64/boot/dts/freescale/Makefile
@@ -498,6 +498,11 @@ dtb-$(CONFIG_ARCH_MXC) += imx8mp-tqma8mpql-mba8mp-ras314-imx219.dtbo
 dtb-$(CONFIG_ARCH_MXC) += imx8mp-tqma8mpql-mba8mp-ras314-lvds-tm070jvhg33.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx8mp-tqma8mpql-mba8mp-ras314-lvds-tm070jvhg33-imx219.dtb
 
+imx8mp-tqma8mpqs-mb-smarc-2-lvds0-tm070jvhg33-dtbs += imx8mp-tqma8mpqs-mb-smarc-2.dtb imx8mp-tqma8mpqs-mb-smarc-2-lvds0-tm070jvhg33.dtbo
+imx8mp-tqma8mpqs-mb-smarc-2-lvds1-tm070jvhg33-dtbs += imx8mp-tqma8mpqs-mb-smarc-2.dtb imx8mp-tqma8mpqs-mb-smarc-2-lvds1-tm070jvhg33.dtbo
+dtb-$(CONFIG_ARCH_MXC) += imx8mp-tqma8mpqs-mb-smarc-2-lvds0-tm070jvhg33.dtb
+dtb-$(CONFIG_ARCH_MXC) += imx8mp-tqma8mpqs-mb-smarc-2-lvds1-tm070jvhg33.dtb
+
 dtb-$(CONFIG_ARCH_MXC) += imx8mq-evk.dtb
 imx8mq-evk-pcie1-ep-dtbs += imx8mq-evk.dtb imx-pcie1-ep.dtbo
 dtb-$(CONFIG_ARCH_MXC) += imx8mq-evk-pcie1-ep.dtb
diff --git a/arch/arm64/boot/dts/freescale/imx8mp-tqma8mpqs-mb-smarc-2-lvds0-tm070jvhg33.dtso b/arch/arm64/boot/dts/freescale/imx8mp-tqma8mpqs-mb-smarc-2-lvds0-tm070jvhg33.dtso
new file mode 100644
index 0000000000000..2cf1de8c05b49
--- /dev/null
+++ b/arch/arm64/boot/dts/freescale/imx8mp-tqma8mpqs-mb-smarc-2-lvds0-tm070jvhg33.dtso
@@ -0,0 +1,43 @@
+// SPDX-License-Identifier: (GPL-2.0-or-later OR MIT)
+/*
+ * Copyright (c) 2025-2026 TQ-Systems GmbH <linux@ew.tq-group.com>,
+ * D-82229 Seefeld, Germany.
+ * Author: Paul Gerber
+ */
+
+/dts-v1/;
+/plugin/;
+
+&backlight_lvds0 {
+	status = "okay";
+};
+
+&panel_lvds0{
+	compatible = "tianma,tm070jvhg33";
+	status = "okay";
+
+	panel-timing {
+		clock-frequency = <74250000>;
+		hactive = <1280>;
+		vactive = <800>;
+		hfront-porch = <64>;
+		hback-porch = <5>;
+		hsync-len = <1>;
+		vfront-porch = <40>;
+		vback-porch = <2>;
+		vsync-len = <1>;
+		de-active = <1>;
+	};
+};
+
+&lcdif2 {
+	status = "okay";
+};
+
+&lvds_bridge {
+	status = "okay";
+};
+
+&pwm3 {
+	status = "okay";
+};
diff --git a/arch/arm64/boot/dts/freescale/imx8mp-tqma8mpqs-mb-smarc-2-lvds1-tm070jvhg33.dtso b/arch/arm64/boot/dts/freescale/imx8mp-tqma8mpqs-mb-smarc-2-lvds1-tm070jvhg33.dtso
new file mode 100644
index 0000000000000..cbad0cfab2925
--- /dev/null
+++ b/arch/arm64/boot/dts/freescale/imx8mp-tqma8mpqs-mb-smarc-2-lvds1-tm070jvhg33.dtso
@@ -0,0 +1,43 @@
+// SPDX-License-Identifier: (GPL-2.0-or-later OR MIT)
+/*
+ * Copyright (c) 2025-2026 TQ-Systems GmbH <linux@ew.tq-group.com>,
+ * D-82229 Seefeld, Germany.
+ * Author: Paul Gerber
+ */
+
+/dts-v1/;
+/plugin/;
+
+&backlight_lvds1 {
+	status = "okay";
+};
+
+&panel_lvds1{
+	compatible = "tianma,tm070jvhg33";
+	status = "okay";
+
+	panel-timing {
+		clock-frequency = <74250000>;
+		hactive = <1280>;
+		vactive = <800>;
+		hfront-porch = <64>;
+		hback-porch = <5>;
+		hsync-len = <1>;
+		vfront-porch = <40>;
+		vback-porch = <2>;
+		vsync-len = <1>;
+		de-active = <1>;
+	};
+};
+
+&lcdif2 {
+	status = "okay";
+};
+
+&lvds_bridge {
+	status = "okay";
+};
+
+&pwm2 {
+	status = "okay";
+};
-- 
2.54.0


