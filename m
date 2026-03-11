Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6EB6EFD0651
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 11 Mar 2026 14:33:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=4gKXZt44Ma4GCBaMG/hFnAdxzDG8bWPvFE9vNwevguM=; b=Rq0ME5JgyzvC1roNEEtq4h3IUO
	70omByfC+wJ2TCSU5V8YJWIzsf2pY8USLLXXPTbDADBTx3nZxoWXvwrpcCggLZVsbCY57mJoRYcFi
	6uAPQMwSdxxFVwIJD4hFke85v0JziJuKo35NVvj1ISxkqzo+IAw1NXC2dEiDzAY1lJnwT69pKU5C1
	w7z18g7HQKmQY3E9JB1sh3jyebtna56GwT6PRcEzKk5KzHRUgMhoon5sMD6Ftc8uFg8jkdetbU87D
	PdndWKP0AcAZuT4VLmJRtDoX+Vfq9I0xLOcan489GPY5wfRYGAIoiqM1w48A1trH5LPh+0DP+AtGa
	hZjVxSQw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w0KcK-0000000Bi9U-351y;
	Wed, 11 Mar 2026 14:32:56 +0000
Received: from www537.your-server.de ([188.40.3.216])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w0KcE-0000000Bi6S-1eET
	for linux-arm-kernel@lists.infradead.org;
	Wed, 11 Mar 2026 14:32:51 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=ew.tq-group.com; s=default2602; h=Content-Transfer-Encoding:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID;
	bh=4gKXZt44Ma4GCBaMG/hFnAdxzDG8bWPvFE9vNwevguM=; b=IH92FAr98PmZwaoaBpUpFq08eX
	vVXwRfz7oN3MkPZA9F8x8BqeIWRtkjy2IZlbOMuf1ogiDPfzL55d8+QCsChSqKQVzU/rhxGmiDOXC
	lPhSU/41zIgoeBBEhGpxxtQPdDWb3NiBS9mNm/Zzcc1C2S5IxrxbxLh4O3DH0KPAMj2djDrKEDh+b
	pd3eE8dYMCYOAm8yEa17FHfLTsZVTOU8hVnOHFvA0hgHgeGzqQYOyHUB4F/plE9kSIiqpXFD/7TBD
	ktvmHwbhFkACoIzrKNjfDiu9GWpe40bcXwIYHAm7xa+xj3Zdl5goN68DYUSb+ePvFKYNgbdO5m9gr
	PbWIpGNw==;
Received: from sslproxy03.your-server.de ([88.198.220.132])
	by www537.your-server.de with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.96.2)
	(envelope-from <alexander.stein@ew.tq-group.com>)
	id 1w0KcC-000OuR-2p;
	Wed, 11 Mar 2026 15:32:48 +0100
Received: from localhost ([127.0.0.1])
	by sslproxy03.your-server.de with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <alexander.stein@ew.tq-group.com>)
	id 1w0KcC-000GoI-0i;
	Wed, 11 Mar 2026 15:32:48 +0100
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
Subject: [PATCH 4/6] arm64: dts: imx93-tqma9352-mba91xxca: Add LVDS display overlay
Date: Wed, 11 Mar 2026 15:32:07 +0100
Message-ID: <20260311143217.1700704-5-alexander.stein@ew.tq-group.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260311143217.1700704-1-alexander.stein@ew.tq-group.com>
References: <20260311143217.1700704-1-alexander.stein@ew.tq-group.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Virus-Scanned: Clear (ClamAV 1.4.3/27937/Wed Mar 11 07:24:53 2026)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260311_073250_438096_25C86CEB 
X-CRM114-Status: GOOD (  12.74  )
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
index 0000000000000..02b9afae44c39
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
+
+&dpi_bridge {
+	pinctrl-names = "default";
+	pinctrl-0 = <&pinctrl_rgbdisp>;
+	status = "okay";
+};
-- 
2.43.0


