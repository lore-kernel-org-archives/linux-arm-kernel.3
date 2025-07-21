Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A074FC87FC5
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 21 Jul 2025 11:39:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=madsTv28Rf7JKcd1M7q0kHETPGpzvbAfjoCb2ndJQxU=; b=iCuYL0XOr1lXx1Pz/r8kb9ZxQe
	cLtUpKMXH3BijvysaNBAgkZT0URQ9d5+zRT8AXamLVq41DRNtj6DsNWDN2i5OU4fbqaJQ0sakOjdJ
	0mw5wRptX8dMfGfc3X0I3MJi6P8V7whTvLgnbzrWyyz5peNk7LEc4HLUZgWa8wVWM4zAFNweyg3/1
	/3lEEtkaVU1jTwuyEVkqH0yJ5osI2ExPTiZKtdJH3G97RsSc9RpfEXJ7FR5t/WP3bU9xAQ9jpglIb
	w7tMyHC77dCcKfRymUQ29e+mbaFUmN7SBOfS+fQwlblpcaAhHpdkDHKOc/jaGQ9G+b/Ieep31o4Mh
	WZFWSs2Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1udorS-0000000H7IJ-2aQS;
	Mon, 21 Jul 2025 11:39:14 +0000
Received: from mail.fris.de ([116.203.77.234])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1udnRp-0000000GutT-2MVh
	for linux-arm-kernel@lists.infradead.org;
	Mon, 21 Jul 2025 10:08:42 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id EBD9AC75FD;
	Mon, 21 Jul 2025 12:08:39 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fris.de; s=dkim;
	t=1753092520; h=from:subject:date:message-id:to:cc:mime-version:
	 content-transfer-encoding:in-reply-to:references;
	bh=madsTv28Rf7JKcd1M7q0kHETPGpzvbAfjoCb2ndJQxU=;
	b=l5FFp07w+Y98LdwpBkjMnreNfxY6jRlcWcnW68dtQYYZLx0B+8UA0dRirv+IsEzMX+dBo2
	6xtXUxA2ITUE2TmTwQD/lfPCGSVrGOMbmHPluGqdMgi6ZxaYdvSMP0xJojPyDVt0eZheBj
	aaOz+vHeMgtO6ghEdTzsFpc2pv5lzLGYajbS6CT3OeR/e80m+luD7pjKIcNX8ZGv5iEDZz
	BT5Okix0/xeM4G/Sbv7FEG5xaxGzJOuYKEbJ4nqvn2+lvFx68BtBPCTe1nsX/QbkJmpgxh
	mi5MYrdYbp1Z4ynL4D3/eqLC/i4vPejunhww9MCEq9ssE03wd7a87hNf2FwTHw==
From: Frieder Schrempf <frieder@fris.de>
To: linux-arm-kernel@lists.infradead.org,
	Conor Dooley <conor+dt@kernel.org>,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	linux-kernel@vger.kernel.org,
	Rob Herring <robh@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Shawn Guo <shawnguo@kernel.org>
Cc: Frieder Schrempf <frieder.schrempf@kontron.de>,
	Fabio Estevam <festevam@gmail.com>,
	Pengutronix Kernel Team <kernel@pengutronix.de>
Subject: [PATCH v2 06/12] arm64: dts: imx8mm-kontron: Name USB regulators according to OSM scheme
Date: Mon, 21 Jul 2025 12:05:40 +0200
Message-ID: <20250721100701.115548-7-frieder@fris.de>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20250721100701.115548-1-frieder@fris.de>
References: <20250721100701.115548-1-frieder@fris.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250721_030841_741166_03BA78AE 
X-CRM114-Status: UNSURE (   9.45  )
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

From: Frieder Schrempf <frieder.schrempf@kontron.de>

Use the names from the OSM specification.

Signed-off-by: Frieder Schrempf <frieder.schrempf@kontron.de>
---
 arch/arm64/boot/dts/freescale/imx8mm-kontron-osm-s.dtsi | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/boot/dts/freescale/imx8mm-kontron-osm-s.dtsi b/arch/arm64/boot/dts/freescale/imx8mm-kontron-osm-s.dtsi
index 264553248d5cc..96987910609f1 100644
--- a/arch/arm64/boot/dts/freescale/imx8mm-kontron-osm-s.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx8mm-kontron-osm-s.dtsi
@@ -38,7 +38,7 @@ reg_usb1_vbus: regulator-usb1-vbus {
 		gpio = <&gpio3 25 GPIO_ACTIVE_HIGH>;
 		regulator-min-microvolt = <5000000>;
 		regulator-max-microvolt = <5000000>;
-		regulator-name = "VBUS_USB1";
+		regulator-name = "VBUS_USB_A";
 	};
 
 	reg_usb2_vbus: regulator-usb2-vbus {
@@ -49,7 +49,7 @@ reg_usb2_vbus: regulator-usb2-vbus {
 		gpio = <&gpio3 20 GPIO_ACTIVE_HIGH>;
 		regulator-min-microvolt = <5000000>;
 		regulator-max-microvolt = <5000000>;
-		regulator-name = "VBUS_USB2";
+		regulator-name = "VBUS_USB_B";
 	};
 
 	reg_usdhc2_vcc: regulator-usdhc2-vcc {
-- 
2.50.1


