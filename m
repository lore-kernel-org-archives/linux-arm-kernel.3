Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EEB76F47CA9
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  5 Mar 2026 18:09:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Subject:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Cc:To:From:Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=TDgZtL5zOaqdsqkTCX9U+amNxwj0tG+Q14UisOg5Udk=; b=fZafN9ArE0+aX2wq8BxUr9+8Bd
	qAmlhrmNZC3iOIUiGlxfJoP6886mDLQB/WPqFlJDnzLwaVQuVkkEpnYV8V+NswyRCYOnVNCganeU0
	q2m+hp8FYbfM7hutfk2FpnTKZKjfyNoJ34XsazhL3gsv2TLBC6nfr39oan+KAGRoZJuv8WXka7jn1
	6LYZXpGtjeS8j3i9gatUKMPUvpCOXeGgpZ/ZbyHJZ9GghfhuWuxZLRj/SPhQ7oiWO0pKQBpxGY2RH
	MIL/1bBEyuTRE4sOGR2H3lZzaFlcBmWl7Io8b/vms7HgWsdgzSjmBpPMqFRlvyR7JDef5WJdK7lHg
	QCXbQkpA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vyD8J-00000002Lvr-45Sw;
	Thu, 05 Mar 2026 18:09:12 +0000
Received: from mail.hugovil.com ([162.243.120.170])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vyD8G-00000002Lq3-10Un
	for linux-arm-kernel@lists.infradead.org;
	Thu, 05 Mar 2026 18:09:10 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=hugovil.com
	; s=x; h=Subject:Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Cc:To
	:From:subject:date:message-id:reply-to;
	bh=TDgZtL5zOaqdsqkTCX9U+amNxwj0tG+Q14UisOg5Udk=; b=0LMCNqfx48ls7B2auvFHuMsZfl
	1jxYy6s/oekobL2FNKhTU4O86l3ENyXEJrxIP3sD8zC3Pp5yPmbsxWhLaiYpKVA4PQ1pSn8kpDXoO
	jS/go7J5nSfTnU+xZrWfGencBKW4Bx5zMtQc6V71qKJsTGhbTCIwrucCwHInihnZc2Qk=;
Received: from modemcable168.174-80-70.mc.videotron.ca ([70.80.174.168]:37706 helo=pettiford.lan)
	by mail.hugovil.com with esmtpa (Exim 4.92)
	(envelope-from <hugo@hugovil.com>)
	id 1vyD83-0002aR-VY; Thu, 05 Mar 2026 13:08:56 -0500
From: Hugo Villeneuve <hugo@hugovil.com>
To: robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	andrzej.hajda@intel.com,
	neil.armstrong@linaro.org,
	rfoss@kernel.org,
	Laurent.pinchart@ideasonboard.com,
	jonas@kwiboo.se,
	jernej.skrabec@gmail.com,
	maarten.lankhorst@linux.intel.com,
	mripard@kernel.org,
	tzimmermann@suse.de,
	airlied@gmail.com,
	simona@ffwll.ch,
	Frank.Li@nxp.com,
	s.hauer@pengutronix.de,
	kernel@pengutronix.de,
	festevam@gmail.com,
	shawnguo@kernel.org,
	laurent.pinchart+renesas@ideasonboard.com,
	antonin.godard@bootlin.com
Cc: devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	dri-devel@lists.freedesktop.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	hugo@hugovil.com,
	Hugo Villeneuve <hvilleneuve@dimonoff.com>
Date: Thu,  5 Mar 2026 13:06:28 -0500
Message-ID: <20260305180651.1827087-14-hugo@hugovil.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260305180651.1827087-1-hugo@hugovil.com>
References: <20260305180651.1827087-1-hugo@hugovil.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 70.80.174.168
X-SA-Exim-Mail-From: hugo@hugovil.com
Subject: [PATCH v2 13/15] ARM: dts: imx6ul-var-som: factor out audio support
X-SA-Exim-Version: 4.2.1 (built Wed, 08 May 2019 21:11:16 +0000)
X-SA-Exim-Scanned: Yes (on mail.hugovil.com)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260305_100908_301326_80F2D045 
X-CRM114-Status: GOOD (  16.80  )
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

From: Hugo Villeneuve <hvilleneuve@dimonoff.com>

Not all boards use the audio codec, so factor out this functionality to a
separate dtsi.

Signed-off-by: Hugo Villeneuve <hvilleneuve@dimonoff.com>
---
 .../dts/nxp/imx/imx6ul-var-som-audio.dtsi     | 30 +++++++++++++++++++
 .../dts/nxp/imx/imx6ul-var-som-common.dtsi    | 21 -------------
 .../nxp/imx/imx6ul-var-som-concerto-full.dts  |  1 +
 .../dts/nxp/imx/imx6ul-var-som-concerto.dts   |  1 +
 .../nxp/imx/imx6ull-var-som-concerto-full.dts |  1 +
 .../dts/nxp/imx/imx6ull-var-som-concerto.dts  |  1 +
 6 files changed, 34 insertions(+), 21 deletions(-)
 create mode 100644 arch/arm/boot/dts/nxp/imx/imx6ul-var-som-audio.dtsi

diff --git a/arch/arm/boot/dts/nxp/imx/imx6ul-var-som-audio.dtsi b/arch/arm/boot/dts/nxp/imx/imx6ul-var-som-audio.dtsi
new file mode 100644
index 0000000000000..3c480bc7a6ad8
--- /dev/null
+++ b/arch/arm/boot/dts/nxp/imx/imx6ul-var-som-audio.dtsi
@@ -0,0 +1,30 @@
+// SPDX-License-Identifier: GPL-2.0+
+/*
+ * Audio support for Variscite VAR-SOM-6UL module.
+ *
+ * Copyright 2019-2024 Variscite Ltd.
+ * Copyright 2026 Dimonoff
+ */
+
+&iomuxc {
+	pinctrl_sai2: sai2grp {
+		fsl,pins = <
+			MX6UL_PAD_JTAG_TDI__SAI2_TX_BCLK	0x17088
+			MX6UL_PAD_JTAG_TDO__SAI2_TX_SYNC	0x17088
+			MX6UL_PAD_JTAG_TRST_B__SAI2_TX_DATA	0x11088
+			MX6UL_PAD_JTAG_TCK__SAI2_RX_DATA	0x11088
+			MX6UL_PAD_JTAG_TMS__SAI2_MCLK		0x17088
+		>;
+	};
+};
+
+&sai2 {
+	pinctrl-names = "default";
+	pinctrl-0 = <&pinctrl_sai2>;
+	assigned-clocks = <&clks IMX6UL_CLK_SAI2_SEL>,
+			  <&clks IMX6UL_CLK_SAI2>;
+	assigned-clock-parents = <&clks IMX6UL_CLK_PLL4_AUDIO_DIV>;
+	assigned-clock-rates = <0>, <12288000>;
+	fsl,sai-mclk-direction-output;
+	status = "okay";
+};
diff --git a/arch/arm/boot/dts/nxp/imx/imx6ul-var-som-common.dtsi b/arch/arm/boot/dts/nxp/imx/imx6ul-var-som-common.dtsi
index 70d19eccddb4c..5600eeaa5854d 100644
--- a/arch/arm/boot/dts/nxp/imx/imx6ul-var-som-common.dtsi
+++ b/arch/arm/boot/dts/nxp/imx/imx6ul-var-som-common.dtsi
@@ -52,16 +52,6 @@ MX6UL_PAD_CSI_MCLK__I2C1_SDA		0x4001b8b0
 		>;
 	};
 
-	pinctrl_sai2: sai2grp {
-		fsl,pins = <
-			MX6UL_PAD_JTAG_TDI__SAI2_TX_BCLK	0x17088
-			MX6UL_PAD_JTAG_TDO__SAI2_TX_SYNC	0x17088
-			MX6UL_PAD_JTAG_TRST_B__SAI2_TX_DATA	0x11088
-			MX6UL_PAD_JTAG_TCK__SAI2_RX_DATA	0x11088
-			MX6UL_PAD_JTAG_TMS__SAI2_MCLK		0x17088
-		>;
-	};
-
 	pinctrl_tsc: tscgrp {
 		fsl,pins = <
 			MX6UL_PAD_GPIO1_IO01__GPIO1_IO01	0xb0
@@ -163,17 +153,6 @@ &pxp {
 	status = "okay";
 };
 
-&sai2 {
-	pinctrl-names = "default";
-	pinctrl-0 = <&pinctrl_sai2>;
-	assigned-clocks = <&clks IMX6UL_CLK_SAI2_SEL>,
-			  <&clks IMX6UL_CLK_SAI2>;
-	assigned-clock-parents = <&clks IMX6UL_CLK_PLL4_AUDIO_DIV>;
-	assigned-clock-rates = <0>, <12288000>;
-	fsl,sai-mclk-direction-output;
-	status = "okay";
-};
-
 &snvs_poweroff {
 	status = "okay";
 };
diff --git a/arch/arm/boot/dts/nxp/imx/imx6ul-var-som-concerto-full.dts b/arch/arm/boot/dts/nxp/imx/imx6ul-var-som-concerto-full.dts
index b5e6a3306e1cd..64a3cbd8b7c38 100644
--- a/arch/arm/boot/dts/nxp/imx/imx6ul-var-som-concerto-full.dts
+++ b/arch/arm/boot/dts/nxp/imx/imx6ul-var-som-concerto-full.dts
@@ -13,6 +13,7 @@
 #include "imx6ul-var-som-wifi.dtsi"
 #include "imx6ul-var-som-enet2.dtsi"
 #include "imx6ul-var-som-enet1.dtsi"
+#include "imx6ul-var-som-audio.dtsi"
 
 / {
 	model = "Variscite VAR-SOM-6UL Concerto Board (6UL CPU)";
diff --git a/arch/arm/boot/dts/nxp/imx/imx6ul-var-som-concerto.dts b/arch/arm/boot/dts/nxp/imx/imx6ul-var-som-concerto.dts
index 7eebb5b4f5e44..9c5cb96beeb17 100644
--- a/arch/arm/boot/dts/nxp/imx/imx6ul-var-som-concerto.dts
+++ b/arch/arm/boot/dts/nxp/imx/imx6ul-var-som-concerto.dts
@@ -13,6 +13,7 @@
 #include "imx6ul-var-som-concerto-common.dtsi"
 #include "imx6ul-var-som-sd.dtsi"
 #include "imx6ul-var-som-enet2.dtsi"
+#include "imx6ul-var-som-audio.dtsi"
 
 / {
 	model = "Variscite VAR-SOM-6UL Concerto Board (6UL CPU)";
diff --git a/arch/arm/boot/dts/nxp/imx/imx6ull-var-som-concerto-full.dts b/arch/arm/boot/dts/nxp/imx/imx6ull-var-som-concerto-full.dts
index 86f558c76fb3e..2e1f75d5f25a6 100644
--- a/arch/arm/boot/dts/nxp/imx/imx6ull-var-som-concerto-full.dts
+++ b/arch/arm/boot/dts/nxp/imx/imx6ull-var-som-concerto-full.dts
@@ -13,6 +13,7 @@
 #include "imx6ul-var-som-wifi.dtsi"
 #include "imx6ul-var-som-enet2.dtsi"
 #include "imx6ul-var-som-enet1.dtsi"
+#include "imx6ul-var-som-audio.dtsi"
 
 / {
 	model = "Variscite VAR-SOM-6UL Concerto Board (6ULL CPU)";
diff --git a/arch/arm/boot/dts/nxp/imx/imx6ull-var-som-concerto.dts b/arch/arm/boot/dts/nxp/imx/imx6ull-var-som-concerto.dts
index 0d3e0d9b0f11d..43a477db652fa 100644
--- a/arch/arm/boot/dts/nxp/imx/imx6ull-var-som-concerto.dts
+++ b/arch/arm/boot/dts/nxp/imx/imx6ull-var-som-concerto.dts
@@ -12,6 +12,7 @@
 #include "imx6ul-var-som-concerto-common.dtsi"
 #include "imx6ul-var-som-sd.dtsi"
 #include "imx6ul-var-som-enet2.dtsi"
+#include "imx6ul-var-som-audio.dtsi"
 
 / {
 	model = "Variscite VAR-SOM-6UL Concerto Board (6ULL CPU)";
-- 
2.47.3


