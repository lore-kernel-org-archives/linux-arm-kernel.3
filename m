Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 465C1CCFA03
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  6 Nov 2025 08:54:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=FFBdt9C4gI7HHhth+9l6zVhImR8cz8//vGI97WJnQ4w=; b=Btanmcaxn/r7qsYwk3rwwtr90h
	ck6Wmf66vExEK4AG8tJDTrrq4hGNQIH/HmmjRQ+Vix0qmAyrtG9qmEH+WPNCtn8UqCKObI0arnnPk
	ZejOJP6u3njfmKaU7gEd5d8SOnJxkTB9aZnjzt0ZZlp74SxcjE1CfKWfCAscTP420BkK3fiZiJ3PU
	2riCwL5y1gW745aTciLWh+T58WZrwaYCxw7+vixoiy9oO/BvHKxh8MJt8kEUINBKST7YgFGfjP8s6
	jEs+Ss02k5sDlXw0Gc2iV3TN4Y42l3zEofj4Hf9nfmpPiMntc2BDCYSz73Jtpgo8R5E3Bqo8fKav+
	5BDqI/Qw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vGvlT-0000000F5YL-22I0;
	Thu, 06 Nov 2025 08:54:43 +0000
Received: from uho.ysoft.cz ([81.19.3.130])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vGvlQ-0000000F5Xe-02x4
	for linux-arm-kernel@lists.infradead.org;
	Thu, 06 Nov 2025 08:54:41 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ysoft.com;
	s=20160406-ysoft-com; t=1762419277;
	bh=FFBdt9C4gI7HHhth+9l6zVhImR8cz8//vGI97WJnQ4w=;
	h=From:To:Cc:Subject:Date:From;
	b=DitawZXXMH7KHrl2vz58RM8KK2y+K7Sf6x49hBCtUYd40lQcfTgUV/NGOAbLgM5hw
	 xUGP++tc9XEZch5fJMJ+Dc1EE0krAP+Teu2y4rA+CvIwkdPSfygsqS84Cm9t+npdwG
	 rgxLln3Ndgpyph70SzGlVZlRQvzJkcIrFuMaKjQE=
Received: from vokac-nb.ysoft.local (unknown [10.1.8.111])
	by uho.ysoft.cz (Postfix) with ESMTP id CF800A03F0;
	Thu,  6 Nov 2025 09:54:37 +0100 (CET)
From: =?UTF-8?q?Michal=20Vok=C3=A1=C4=8D?= <michal.vokac@ysoft.com>
To: Shawn Guo <shawnguo@kernel.org>
Cc: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	=?UTF-8?q?Michal=20Vok=C3=A1=C4=8D?= <michal.vokac@ysoft.com>
Subject: [PATCH v2 1/2] ARM: dts: imx6dl-yapp43: Enable pwm-beeper on boards with speaker
Date: Thu,  6 Nov 2025 09:54:28 +0100
Message-ID: <20251106085429.2067699-1-michal.vokac@ysoft.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251106_005440_676305_BE484D59 
X-CRM114-Status: GOOD (  10.72  )
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

Lynx, Pegasus and Pegasus+ boards have a speaker connected to the PWM3.
Enable a pwm-beeper on these boards so the system can produce simple
sounds.

Signed-off-by: Michal Vokáč <michal.vokac@ysoft.com>
---
changes in v2: none

 .../boot/dts/nxp/imx/imx6dl-yapp4-lynx.dts    |  8 ++++++++
 .../dts/nxp/imx/imx6dl-yapp43-common.dtsi     | 19 +++++++++++++++++++
 .../boot/dts/nxp/imx/imx6q-yapp4-pegasus.dts  |  8 ++++++++
 .../dts/nxp/imx/imx6qp-yapp4-pegasus-plus.dts |  8 ++++++++
 4 files changed, 43 insertions(+)

diff --git a/arch/arm/boot/dts/nxp/imx/imx6dl-yapp4-lynx.dts b/arch/arm/boot/dts/nxp/imx/imx6dl-yapp4-lynx.dts
index 5c2cd517589b..0a6b668428a3 100644
--- a/arch/arm/boot/dts/nxp/imx/imx6dl-yapp4-lynx.dts
+++ b/arch/arm/boot/dts/nxp/imx/imx6dl-yapp4-lynx.dts
@@ -21,6 +21,10 @@ &backlight {
 	status = "okay";
 };
 
+&beeper {
+	status = "okay";
+};
+
 &lcd_display {
 	status = "okay";
 };
@@ -37,6 +41,10 @@ &pwm1 {
 	status = "okay";
 };
 
+&pwm3 {
+	status = "okay";
+};
+
 &reg_usb_h1_vbus {
 	status = "okay";
 };
diff --git a/arch/arm/boot/dts/nxp/imx/imx6dl-yapp43-common.dtsi b/arch/arm/boot/dts/nxp/imx/imx6dl-yapp43-common.dtsi
index 2f42c56c21f6..6f9bd163ffbe 100644
--- a/arch/arm/boot/dts/nxp/imx/imx6dl-yapp43-common.dtsi
+++ b/arch/arm/boot/dts/nxp/imx/imx6dl-yapp43-common.dtsi
@@ -26,6 +26,12 @@ backlight: backlight {
 		status = "disabled";
 	};
 
+	beeper: beeper {
+		compatible = "pwm-beeper";
+		pwms = <&pwm3 0 500000 0>;
+		status = "disabled";
+	};
+
 	gpio_keys: gpio-keys {
 		compatible = "gpio-keys";
 		pinctrl-names = "default";
@@ -466,6 +472,13 @@ MX6QDL_PAD_GPIO_9__PWM1_OUT	0x8
 		>;
 	};
 
+	pinctrl_sound: soundgrp {
+		fsl,pins = <
+			MX6QDL_PAD_SD1_DAT0__GPIO1_IO16	0x1b0b0
+			MX6QDL_PAD_SD1_DAT1__PWM3_OUT	0x8
+		>;
+	};
+
 	pinctrl_touch: touchgrp {
 		fsl,pins = <
 			MX6QDL_PAD_GPIO_19__GPIO4_IO05	0x1b098
@@ -551,6 +564,12 @@ &pwm1 {
 	status = "disabled";
 };
 
+&pwm3 {
+	pinctrl-names = "default";
+	pinctrl-0 = <&pinctrl_sound>;
+	status = "disabled";
+};
+
 &uart1 {
 	pinctrl-names = "default";
 	pinctrl-0 = <&pinctrl_uart1>;
diff --git a/arch/arm/boot/dts/nxp/imx/imx6q-yapp4-pegasus.dts b/arch/arm/boot/dts/nxp/imx/imx6q-yapp4-pegasus.dts
index ec6651ba4ba2..7332f2718982 100644
--- a/arch/arm/boot/dts/nxp/imx/imx6q-yapp4-pegasus.dts
+++ b/arch/arm/boot/dts/nxp/imx/imx6q-yapp4-pegasus.dts
@@ -17,6 +17,10 @@ memory@10000000 {
 	};
 };
 
+&beeper {
+	status = "okay";
+};
+
 &gpio_oled {
 	status = "okay";
 };
@@ -37,6 +41,10 @@ &oled_1309 {
 	status = "okay";
 };
 
+&pwm3 {
+	status = "okay";
+};
+
 &reg_pu {
 	regulator-always-on;
 };
diff --git a/arch/arm/boot/dts/nxp/imx/imx6qp-yapp4-pegasus-plus.dts b/arch/arm/boot/dts/nxp/imx/imx6qp-yapp4-pegasus-plus.dts
index 4a961a33bf2d..770a85e0561c 100644
--- a/arch/arm/boot/dts/nxp/imx/imx6qp-yapp4-pegasus-plus.dts
+++ b/arch/arm/boot/dts/nxp/imx/imx6qp-yapp4-pegasus-plus.dts
@@ -17,6 +17,10 @@ memory@10000000 {
 	};
 };
 
+&beeper {
+	status = "okay";
+};
+
 &gpio_oled {
 	status = "okay";
 };
@@ -37,6 +41,10 @@ &oled_1309 {
 	status = "okay";
 };
 
+&pwm3 {
+	status = "okay";
+};
+
 &reg_pu {
 	regulator-always-on;
 };
-- 
2.43.0


