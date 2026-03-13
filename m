Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DB39E106FD87
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 13 Mar 2026 07:08:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=6du/L/MJ4bguBUwZ+xORG09S4c1F+LA/m1LwoB1H6xA=; b=vBPy4aJROalWdfvbWM/B83tUuN
	lEBWvnD6vdx3IccThe6mDL88ZIFi1V6Z0P6UJzpbKc+NkrWnGKsVInlydNN539MHvdRn6Q7yzxI1h
	9eqGd7ZKTJSGVR0e22Vyk3s3XcSzkZA3xclBc9uLioDUkgPVSlV29g+sgq8ZrrhSjCsUV0QtwWrjU
	QpQxfXR1Vo93hLLK00goFnZ9tGp+s/B/WgY/7/74xJ5BulTHpsfPYoBVRASXBkdyneRrECLpQNAci
	mgok2FlwreKGYD78TFB5CRH/tXqpfICFzvK84IOM5nWCoyTFd1MYnoPhOmGxUKR08b1FuBxahl00r
	7z72+w5w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w0wcm-0000000GyKm-0mz0;
	Fri, 13 Mar 2026 07:07:56 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w0wci-0000000GyHZ-0TT4
	for linux-arm-kernel@bombadil.infradead.org;
	Fri, 13 Mar 2026 07:07:52 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=6du/L/MJ4bguBUwZ+xORG09S4c1F+LA/m1LwoB1H6xA=; b=SBYXlSmxEk9XgT6av0wfDGRsJt
	B1QdBn5zfGxNdb/mplYoYcumffTlWb38GG47okf3XwaBNTY0YVY4tCjZIiZJywG+RVfhTz248sBPk
	+swZFbCXT4YyFEX53nkSDmKH7X0K9LmgBCkxGMlYk5BIUWOYZ2vB1drBl9jMtmgJB7NdfU8ysJz8Q
	TRNsdyLNw5eer1FthvmeN3z4PXzmtGxsQiTPaoFlxwXNbQE/wY2wvuxXjhKElkVC/EWwPXCz38V+p
	2njNaXGS87+Hs61zv2n0Jcq4ADDQdrW20yLNPAp7pMoBMrK+DVWXdyS3/Q01YahZlnbKHB7E0/zBR
	fzzg+Jvw==;
Received: from www537.your-server.de ([188.40.3.216])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w0wce-00000002ip4-1fuk
	for linux-arm-kernel@lists.infradead.org;
	Fri, 13 Mar 2026 07:07:50 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=ew.tq-group.com; s=default2602; h=Content-Transfer-Encoding:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID;
	bh=6du/L/MJ4bguBUwZ+xORG09S4c1F+LA/m1LwoB1H6xA=; b=Uv9AjC8SoTBsH9Rfc4sNMue0FM
	WVTvdMWsyN7ez8nvykX8/QikRJTz9k+Ia9O6YgRDqDC2+RAXqrWjF/hbRiMOpnUUZ7Co4Y00N1qkT
	hz/0OkPa0430zjYsNodxMvPdAkj1NYF3j0ZXcNNgcCMw5K753KS39CXCVa/Sd3Z9hgfx1tQwpLN+I
	jCMwKLyD4KH+iG7k7IBZG9l0iZeeF6+6xn8SRuzl0mXnTdzM8uFFUFeSkJsePwA1XpPho0VzB7hzC
	YLciQyms5PTOxfFqF5x+Nx2dbGsh+RXrGEW1VR0hbYqEvkNCgWIr1HF23QZ22StkqD2ws5CWvOzTy
	FdasFWYw==;
Received: from sslproxy07.your-server.de ([78.47.199.104])
	by www537.your-server.de with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.96.2)
	(envelope-from <alexander.stein@ew.tq-group.com>)
	id 1w0wcd-000CWM-30;
	Fri, 13 Mar 2026 08:07:47 +0100
Received: from localhost ([127.0.0.1])
	by sslproxy07.your-server.de with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <alexander.stein@ew.tq-group.com>)
	id 1w0wcd-000IYT-0v;
	Fri, 13 Mar 2026 08:07:47 +0100
From: Alexander Stein <alexander.stein@ew.tq-group.com>
To: Frank Li <Frank.Li@nxp.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Abel Vesa <abelvesa@kernel.org>,
	Peng Fan <peng.fan@nxp.com>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>
Cc: Alexander Stein <alexander.stein@ew.tq-group.com>,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux@ew.tq-group.com,
	linux-clk@vger.kernel.org
Subject: [PATCH v2 4/6] arm64: dts: imx93-tqma9352-mba91xxca: Add LVDS display overlay
Date: Fri, 13 Mar 2026 08:07:34 +0100
Message-ID: <20260313070740.585043-5-alexander.stein@ew.tq-group.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260313070740.585043-1-alexander.stein@ew.tq-group.com>
References: <20260313070740.585043-1-alexander.stein@ew.tq-group.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Virus-Scanned: Clear (ClamAV 1.4.3/27938/Thu Mar 12 07:24:01 2026)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260313_070748_825881_FAAB9E04 
X-CRM114-Status: GOOD (  12.58  )
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

This adds support for Tianma TM070JVHG33 LVDS display on interface X11/X12
on MBa91xxCA.

Signed-off-by: Alexander Stein <alexander.stein@ew.tq-group.com>
---
Changes in v2:
* Sort nodes

 arch/arm64/boot/dts/freescale/Makefile        |  2 +
 ...3-tqma9352-mba91xxca-lvds-tm070jvhg33.dtso | 56 +++++++++++++++++++
 2 files changed, 58 insertions(+)
 create mode 100644 arch/arm64/boot/dts/freescale/imx93-tqma9352-mba91xxca-lvds-tm070jvhg33.dtso

diff --git a/arch/arm64/boot/dts/freescale/Makefile b/arch/arm64/boot/dts/freescale/Makefile
index 3547f1dd84467..24d5b0c2ddafb 100644
--- a/arch/arm64/boot/dts/freescale/Makefile
+++ b/arch/arm64/boot/dts/freescale/Makefile
@@ -456,7 +456,9 @@ dtb-$(CONFIG_ARCH_MXC) += imx93-tqma9352-mba91xxca.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx93-tqma9352-mba93xxca.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx93-tqma9352-mba93xxla.dtb
 
+imx93-tqma9352-mba91xxca-lvds-tm070jvhg33-dtbs := imx93-tqma9352-mba91xxca.dtb imx93-tqma9352-mba91xxca-lvds-tm070jvhg33.dtbo
 imx93-tqma9352-mba91xxca-rgb-cdtech-dc44-dtbs := imx93-tqma9352-mba91xxca.dtb imx93-tqma9352-mba91xxca-rgb-cdtech-dc44.dtbo
+dtb-$(CONFIG_ARCH_MXC) += imx93-tqma9352-mba91xxca-lvds-tm070jvhg33.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx93-tqma9352-mba91xxca-rgb-cdtech-dc44.dtb
 
 dtb-$(CONFIG_ARCH_MXC) += imx93-var-som-symphony.dtb
diff --git a/arch/arm64/boot/dts/freescale/imx93-tqma9352-mba91xxca-lvds-tm070jvhg33.dtso b/arch/arm64/boot/dts/freescale/imx93-tqma9352-mba91xxca-lvds-tm070jvhg33.dtso
new file mode 100644
index 0000000000000..40a519e9c91e9
--- /dev/null
+++ b/arch/arm64/boot/dts/freescale/imx93-tqma9352-mba91xxca-lvds-tm070jvhg33.dtso
@@ -0,0 +1,56 @@
+// SPDX-License-Identifier: (GPL-2.0-or-later OR MIT)
+/*
+ * Copyright (c) 2023-2026 TQ-Systems GmbH <linux@ew.tq-group.com>,
+ * D-82229 Seefeld, Germany.
+ * Author: Alexander Stein
+ */
+
+#include <dt-bindings/clock/imx93-clock.h>
+
+/dts-v1/;
+/plugin/;
+
+&backlight {
+	status = "okay";
+};
+
+&display {
+	compatible = "tianma,tm070jvhg33";
+	status = "okay";
+};
+
+&dpi_bridge {
+	pinctrl-names = "default";
+	pinctrl-0 = <&pinctrl_rgbdisp>;
+	status = "okay";
+};
+
+&dpi_to_panel {
+	remote-endpoint = <&lvds_encoder_input>;
+};
+
+&lcdif {
+	assigned-clocks = <&clk IMX93_CLK_VIDEO_PLL>;
+	assigned-clock-rates = <477400000>;
+	status = "okay";
+};
+
+&lvds_encoder {
+	status = "okay";
+};
+
+&lvds_encoder_input {
+	remote-endpoint = <&dpi_to_panel>;
+};
+
+&lvds_encoder_output {
+	remote-endpoint = <&panel_in>;
+};
+
+&media_blk_ctrl {
+	status = "okay";
+};
+
+&panel_in {
+	remote-endpoint = <&lvds_encoder_output>;
+};
-- 
2.43.0


