Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 30CD3C021B8
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  4 Mar 2025 17:14:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=JyqufnNntJt7vbpN4qCJdGub3m2IYSpcdFWV0lv7HeY=; b=DZP6Ha7mEp13FC+g5FbBbt3L9U
	0hY5gyNVUhd63+mXpEZfZK+ifetAt/UyVQuoazZGjPDAXtxu3WXm27SqhX43cjIyPEDG81pofhG6H
	4cerC+hcQ1fLnrv/SBr8B5+qxev/GMXZV0KDRuv4u+x6QQnLD3jKLS8bchbJlLFY222L3UO8iEYWS
	kfURa/BaBuQ2JQC7T6tc+J0SDlZwcr8PUng5EyhHSGcO63AC2oKMDQVqFREs/mixhue9PI0b7qfJZ
	TLlbILZETa2FdnHIgvF08S+hL881AkfHA6XHaX1RuwsGTSFKZ1uCnqH1PHNHtlGr3Io5so4Py03eJ
	TadMKXog==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tpVqk-00000005Zw2-2mXX;
	Tue, 04 Mar 2025 17:14:34 +0000
Received: from mx1.tq-group.com ([93.104.207.81])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tpUX3-00000005HyD-070a
	for linux-arm-kernel@lists.infradead.org;
	Tue, 04 Mar 2025 15:50:10 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
  t=1741103409; x=1772639409;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=JyqufnNntJt7vbpN4qCJdGub3m2IYSpcdFWV0lv7HeY=;
  b=TVNFWT5GICWbI0fHfPAJF8LqiqxBiEXrDX4Yh+5lyFMEWW8uIqc6toIl
   1GhzEz35sWoP76LUqBnh4eGj92aeqWsf6oY/oQX8kYOGYLjEfwxMFQa59
   HjJXvO0E8mVfgeNFO40Rc3I6jz6iIvyP1X2/fCXCIPkpl3YSJIn7Pdyzs
   GWALtaGW1l0VFkcEYyz3Y/EeGRbq4IVHfwNTdySO/NJAysxrN7uwQING7
   YzjxuD5OdZ7n7BrA5lyyt2K3ckBjTYXxxOC+oJbn+LzJbAt1rJDaIhpbS
   11t9n6WezQ61uHauVNH7QoiyG1JU1asLKEDDXZ4FlJqy6eg3XpBV3dnlV
   w==;
X-CSE-ConnectionGUID: RnRBH7uAQ5qZK7AQFBu60g==
X-CSE-MsgGUID: BjGsonlfSu+2xRBkhC/lLg==
X-IronPort-AV: E=Sophos;i="6.14,220,1736809200"; 
   d="scan'208";a="42272749"
Received: from vmailcow01.tq-net.de ([10.150.86.48])
  by mx1.tq-group.com with ESMTP; 04 Mar 2025 16:50:08 +0100
X-CheckPoint: {67C72130-E-B1D34AC3-DEA5B19F}
X-MAIL-CPID: 7B5B58FE919B8CF66131755B05686F47_4
X-Control-Analysis: str=0001.0A006366.67C72132.00E1,ss=1,re=0.000,recu=0.000,reip=0.000,cl=1,cld=1,fgs=0
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id D76CC16324C;
	Tue,  4 Mar 2025 16:50:02 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ew.tq-group.com;
	s=dkim; t=1741103403;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=JyqufnNntJt7vbpN4qCJdGub3m2IYSpcdFWV0lv7HeY=;
	b=BnY/7fFuSytrQIWdFQTKARB3cM5OblyxNFwwbEbnhlbdmOdbudFNAdRIIVd4vbYYY7NSuo
	p+rhijLBeYRP6pBQ4namw9g34Pb+Ufzlgy5lfjrJtmGJ3wkASAGUjw5kpXRpVj0ybB1DgZ
	icVWp5m1OkipWdECwUHiwo07Rvx6g0jWcAmCkCvKREnZ1TRy6IWT65vB7eIPtu/uxATEgB
	Qmwm0YejFPIsH69KIpKzmPRXEPgRhpa76IKwZDXMcwbtgIsNXRt4cUo3UYFFMU+jkRPSKs
	E8dWNkPObMQNK9CnG8ztAlC8NZPQ7DLKlnKetCyQ3AYxO+iG5wiiDZFSOaaRjA==
From: Alexander Stein <alexander.stein@ew.tq-group.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Abel Vesa <abelvesa@kernel.org>,
	Peng Fan <peng.fan@nxp.com>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Ulf Hansson <ulf.hansson@linaro.org>
Cc: Alexander Stein <alexander.stein@ew.tq-group.com>,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux@ew.tq-group.com,
	linux-clk@vger.kernel.org,
	linux-pm@vger.kernel.org
Subject: [PATCH v3 5/6] arm64: dts: tqma9352-mba93xxla: Add LVDS overlay
Date: Tue,  4 Mar 2025 16:49:24 +0100
Message-ID: <20250304154929.1785200-6-alexander.stein@ew.tq-group.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250304154929.1785200-1-alexander.stein@ew.tq-group.com>
References: <20250304154929.1785200-1-alexander.stein@ew.tq-group.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250304_075009_360005_2767140B 
X-CRM114-Status: GOOD (  15.89  )
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

This adds the overlay for the Tianma TM070JVHG33 LVDS display.

Signed-off-by: Alexander Stein <alexander.stein@ew.tq-group.com>
---
 arch/arm64/boot/dts/freescale/Makefile        |  3 ++
 ...3-tqma9352-mba93xxla-lvds-tm070jvhg33.dtso | 40 +++++++++++++++++++
 .../freescale/imx93-tqma9352-mba93xxla.dts    | 27 +++++++++++++
 3 files changed, 70 insertions(+)
 create mode 100644 arch/arm64/boot/dts/freescale/imx93-tqma9352-mba93xxla-lvds-tm070jvhg33.dtso

diff --git a/arch/arm64/boot/dts/freescale/Makefile b/arch/arm64/boot/dts/freescale/Makefile
index be6ef4c56fbf4..ac4f14c69cdd8 100644
--- a/arch/arm64/boot/dts/freescale/Makefile
+++ b/arch/arm64/boot/dts/freescale/Makefile
@@ -300,6 +300,9 @@ dtb-$(CONFIG_ARCH_MXC) += imx93-tqma9352-mba93xxla.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx93-var-som-symphony.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx95-19x19-evk.dtb
 
+imx93-tqma9352-mba93xxla-lvds-tm070jvhg33-dtbs += imx93-tqma9352-mba93xxla.dtb imx93-tqma9352-mba93xxla-lvds-tm070jvhg33.dtbo
+dtb-$(CONFIG_ARCH_MXC) += imx93-tqma9352-mba93xxla-lvds-tm070jvhg33.dtb
+
 imx8mm-kontron-dl-dtbs			:= imx8mm-kontron-bl.dtb imx8mm-kontron-dl.dtbo
 
 dtb-$(CONFIG_ARCH_MXC) += imx8mm-kontron-dl.dtb
diff --git a/arch/arm64/boot/dts/freescale/imx93-tqma9352-mba93xxla-lvds-tm070jvhg33.dtso b/arch/arm64/boot/dts/freescale/imx93-tqma9352-mba93xxla-lvds-tm070jvhg33.dtso
new file mode 100644
index 0000000000000..c723a19f03d63
--- /dev/null
+++ b/arch/arm64/boot/dts/freescale/imx93-tqma9352-mba93xxla-lvds-tm070jvhg33.dtso
@@ -0,0 +1,40 @@
+// SPDX-License-Identifier: (GPL-2.0-or-later OR MIT)
+/*
+ * Copyright (c) 2023 TQ-Systems GmbH <linux@ew.tq-group.com>,
+ * D-82229 Seefeld, Germany.
+ * Author: Alexander Stein
+ */
+
+#include <dt-bindings/clock/imx93-clock.h>
+#include <dt-bindings/gpio/gpio.h>
+
+/dts-v1/;
+/plugin/;
+
+&backlight_lvds {
+	status = "okay";
+};
+
+&display {
+	compatible = "tianma,tm070jvhg33";
+	status = "okay";
+};
+
+&lcdif {
+	assigned-clocks = <&clk IMX93_CLK_VIDEO_PLL>,
+			  <&clk IMX93_CLK_MEDIA_DISP_PIX>;
+	assigned-clock-rates = <477400000>;
+	status = "okay";
+};
+
+&lvds_bridge {
+	status = "okay";
+};
+
+&media_blk_ctrl {
+	status = "okay";
+};
+
+&tpm5 {
+	status = "okay";
+};
diff --git a/arch/arm64/boot/dts/freescale/imx93-tqma9352-mba93xxla.dts b/arch/arm64/boot/dts/freescale/imx93-tqma9352-mba93xxla.dts
index 9e88c42c3d170..4618f836345fc 100644
--- a/arch/arm64/boot/dts/freescale/imx93-tqma9352-mba93xxla.dts
+++ b/arch/arm64/boot/dts/freescale/imx93-tqma9352-mba93xxla.dts
@@ -48,6 +48,23 @@ clk_dp: clk-dp {
 		clock-frequency = <26000000>;
 	};
 
+	display: display {
+		/*
+		 * Display is not fixed, so compatible has to be added from
+		 * DT overlay
+		 */
+		power-supply = <&reg_3v3>;
+		enable-gpios = <&expander2 1 GPIO_ACTIVE_HIGH>;
+		backlight = <&backlight_lvds>;
+		status = "disabled";
+
+		port {
+			panel_in_lvds0: endpoint {
+				remote-endpoint = <&ldb_lvds>;
+			};
+		};
+	};
+
 	gpio-keys {
 		compatible = "gpio-keys";
 		autorepeat;
@@ -509,6 +526,16 @@ &lpuart8 {
 	status = "okay";
 };
 
+&lvds_bridge {
+	ports {
+		port@1 {
+			ldb_lvds: endpoint {
+				remote-endpoint = <&panel_in_lvds0>;
+			};
+		};
+	};
+};
+
 &pcf85063 {
 	/* RTC_EVENT# from SoM is connected on mainboard */
 	pinctrl-names = "default";
-- 
2.43.0


