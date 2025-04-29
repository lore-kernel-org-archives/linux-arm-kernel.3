Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D87A3C369DC
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 29 Apr 2025 11:37:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=WGtQcFOkR3P6lXc8Dxo93r1W4pTAA0FrpNH5NilciEc=; b=ja+bQAJqYNhFCbeGiEoyjfJB0X
	R9qnKdec/WeP9kVm07TcpIFvT57Vu5o6xEiebU5NJ/ZfHC+ASFXqvFfek+yqtdoMQYSg31GyacyQh
	RECJDACUcdQK8DmOmR6PqrUhkZGozg+hLO1CUvvpLe4rj0qHD6F/QsaPvvceSyt6LCESFY2jY74Gm
	ZrmxjKbWHSqb1koVF5P1pq0pEbneEOUqJcbUCnyAUYOIQn+AZIIurUBzLJGqUxSlTERaoNGnxKEB5
	DDdS7M/vrJlVhzY+1tMl2H+bRnaHwlxuvIcHFBo9lIylGK+zpLziZRAe8SOskEstlKvDJclqQE6HL
	Nm67RIIA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u9jHJ-00000009UEC-2bDJ;
	Tue, 29 Apr 2025 11:37:33 +0000
Received: from mail11.truemail.it ([2001:4b7e:0:8::81])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u9jBX-00000009SHY-13wU
	for linux-arm-kernel@lists.infradead.org;
	Tue, 29 Apr 2025 11:31:38 +0000
Received: from francesco-nb.pivistrello.it (93-49-2-63.ip317.fastwebnet.it [93.49.2.63])
	by mail11.truemail.it (Postfix) with ESMTPA id B2B391F9C7;
	Tue, 29 Apr 2025 13:31:29 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=dolcini.it;
	s=default; t=1745926290;
	bh=WGtQcFOkR3P6lXc8Dxo93r1W4pTAA0FrpNH5NilciEc=; h=From:To:Subject;
	b=L1/KTm31msK5qiUquI9I+shB1t7o6QMWrV5Fu2FgrsZusPXh5DQPdMHG+b9jBgolj
	 C6NqR+o4q50BAH3yBKSjo6JDEFAlUZ2mnh6KVI51xX72EtibBnGYo3Zv6gzCK/MnQ4
	 5MxSjxn+Dk99q/XYc6/ZFDpb1DM5uSK0fCiwof+Vooffavp+vdwAchpf2pzxSAiW2y
	 l0hRbeploNUGE5/1QUpDpy2+HiK6gv0FZTUJ2FgDgK5b5u5J+0jasK0U7uXbLgIyc5
	 /rpScbXN+4Qtc6sCHLtoWxBB6b/NMYK2nKjMpPMsbzXg2dIYxwqDfxGM2KPERBDSPD
	 W31miQThzMYgQ==
From: Francesco Dolcini <francesco@dolcini.it>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>
Cc: Emanuele Ghidoli <emanuele.ghidoli@toradex.com>,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Francesco Dolcini <francesco.dolcini@toradex.com>
Subject: [PATCH v1 3/4] arm64: dts: freescale: imx8mp-toradex-smarc: add gpio expander
Date: Tue, 29 Apr 2025 13:31:18 +0200
Message-Id: <20250429113119.124427-4-francesco@dolcini.it>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250429113119.124427-1-francesco@dolcini.it>
References: <20250429113119.124427-1-francesco@dolcini.it>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250429_043136_322797_C314EFA6 
X-CRM114-Status: UNSURE (   8.17  )
X-CRM114-Notice: Please train this message.
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

From: Emanuele Ghidoli <emanuele.ghidoli@toradex.com>

Add gpio expander node to the device tree and the related nodes.

Signed-off-by: Emanuele Ghidoli <emanuele.ghidoli@toradex.com>
Signed-off-by: Francesco Dolcini <francesco.dolcini@toradex.com>
---
 .../dts/freescale/imx8mp-toradex-smarc.dtsi   | 25 +++++++++++++++++++
 1 file changed, 25 insertions(+)

diff --git a/arch/arm64/boot/dts/freescale/imx8mp-toradex-smarc.dtsi b/arch/arm64/boot/dts/freescale/imx8mp-toradex-smarc.dtsi
index c4ca01ce60d0..de84e7e52efd 100644
--- a/arch/arm64/boot/dts/freescale/imx8mp-toradex-smarc.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx8mp-toradex-smarc.dtsi
@@ -54,6 +54,13 @@ smarc_key_sleep: key-sleep {
 			wakeup-source;
 			linux,code = <KEY_SLEEP>;
 		};
+
+		smarc_switch_lid: switch-lid {
+			gpios = <&som_ec_gpio_expander 2 GPIO_ACTIVE_LOW>;
+			label = "SMARC_LID#";
+			linux,code = <SW_LID>;
+			linux,input-type = <EV_SW>;
+		};
 	};
 
 	reg_usb0_vbus: regulator-usb0-vbus {
@@ -539,6 +546,24 @@ embedded-controller@28 {
 		reg = <0x28>;
 	};
 
+	som_ec_gpio_expander: gpio-expander@29 {
+		compatible = "toradex,ecgpiol16", "nxp,pcal6416";
+		reg = <0x29>;
+		pinctrl-names = "default";
+		pinctrl-0 = <&pinctrl_mcu_int>;
+		#interrupt-cells = <2>;
+		interrupt-controller;
+		interrupt-parent = <&gpio3>;
+		interrupts = <8 IRQ_TYPE_LEVEL_LOW>;
+		#gpio-cells = <2>;
+		gpio-controller;
+		gpio-line-names =
+			"SMARC_CHARGER_PRSNT#",
+			"SMARC_CHARGING#",
+			"SMARC_LID#",
+			"SMARC_BATLOW#";
+	};
+
 	rtc_i2c: rtc@32 {
 		compatible = "epson,rx8130";
 		reg = <0x32>;
-- 
2.39.5


