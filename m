Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 96763C369DC
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 30 Apr 2025 10:12:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=7NIEIJ/FCUKFcAXMy0195R/aYRKztB8r29LUVtuIC4k=; b=5BIoacTHSIRzvr/wNCDp4iBwt0
	nJiDvM1fVbvgEyxHAuFAcx69T9vvz7h0BfKdCfbg7rYEkxMEO5mBMHuwtw5pbbstbQwANT0DsrELY
	FWkzBXCtMeSOZ87PUlPTJ4P/nzKaS8yeLVYe9Qe8cum9zESLk43ROIJPT4d013TjBr2hKRGHFZYZ7
	5NMOUbHTXjG5TEC8B4FNTGUWzcPdLqg3wTbyC5UlTtWOTTI2Y0HJf88/DrQFn66OlhHVhsWHBerCy
	48pbWOd/Jq8j2WV+RO1v/tGd1gbVHQeO+xdRqyh6GelM9cjdXs5QrEd3rAxvui/9X0JHr1v4E9eYg
	T2G8dVRA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uA4Qi-0000000CUHe-0LDr;
	Wed, 30 Apr 2025 10:12:40 +0000
Received: from mail11.truemail.it ([2001:4b7e:0:8::81])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uA3x4-0000000CPJk-0GVc
	for linux-arm-kernel@lists.infradead.org;
	Wed, 30 Apr 2025 09:42:03 +0000
Received: from francesco-nb.pivistrello.it (93-49-2-63.ip317.fastwebnet.it [93.49.2.63])
	by mail11.truemail.it (Postfix) with ESMTPA id 1529B1FC7A;
	Wed, 30 Apr 2025 11:42:00 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=dolcini.it;
	s=default; t=1746006120;
	bh=7NIEIJ/FCUKFcAXMy0195R/aYRKztB8r29LUVtuIC4k=; h=From:To:Subject;
	b=DIgppJclgxz+jRLz+hPnq/w1eBK/hGiuWLT1jcSZNz2IbfcdfjsrB+Y67ZbWjsRNk
	 UYj7mL/pzrEo06n6N55Qzy+HCNoI0Wd/moeM92WeOxN6LyoUoKK2RX0duadI/jhHa5
	 L7rd6jFTt5nwpM6KkoYKHsnkSy6j2A7zEfSOzKSj5gUJXx69ZnpQq/lmO/bktq6X5U
	 MOol6nJ84zmLOAjCRR8b/GT0qn6rD/rFd1Xx/NtC7UG98z3IXSTX63Cr0LHYdgyfhT
	 fDlD2oyHdMn4FQcROxN8GiO4MFXW3guUqyd1aTPIq+S92JCnHBOunWKpcoTDjcu0GE
	 uMvLqAHhVs6xQ==
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
	Peng Fan <peng.fan@nxp.com>,
	Francesco Dolcini <francesco.dolcini@toradex.com>
Subject: [PATCH v2 3/5] arm64: dts: freescale: imx8mp-toradex-smarc: add gpio expander
Date: Wed, 30 Apr 2025 11:41:49 +0200
Message-Id: <20250430094151.98079-4-francesco@dolcini.it>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250430094151.98079-1-francesco@dolcini.it>
References: <20250430094151.98079-1-francesco@dolcini.it>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250430_024202_277422_408F0F27 
X-CRM114-Status: UNSURE (   8.50  )
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

Reviewed-by: Peng Fan <peng.fan@nxp.com>
Signed-off-by: Emanuele Ghidoli <emanuele.ghidoli@toradex.com>
Signed-off-by: Francesco Dolcini <francesco.dolcini@toradex.com>
---
v2: add r-b peng, use generic gpio node name
---
 .../dts/freescale/imx8mp-toradex-smarc.dtsi   | 25 +++++++++++++++++++
 1 file changed, 25 insertions(+)

diff --git a/arch/arm64/boot/dts/freescale/imx8mp-toradex-smarc.dtsi b/arch/arm64/boot/dts/freescale/imx8mp-toradex-smarc.dtsi
index c4ca01ce60d0..0cd04c3c96bb 100644
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
 
+	som_ec_gpio_expander: gpio@29 {
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


