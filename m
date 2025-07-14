Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 08B0CC83F21
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 14 Jul 2025 15:08:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=BdeLUXBHRqGOhfUv9g/nbTTXLKN+sllf5U2xZtp5pO0=; b=c3CUCDN1I9Dzx9Joz4N/RyfbSq
	IXavKK5VgLlQDZfCXoO5e0tcmwA1dRsEWomBjjS+xs6PHGQl+AHqdprUgtONyPi3WFi2gIfikyxKs
	RTGQ4ytlUNS0L4H0n+OmzgGBN7o7K1MOtQWu+iQeIAYu7o/gNLbmFqyjaOxI6afLGcQ6aJCm+ZlV3
	Qiz3Q7tG72a3DaZYfapA8FcnwqsS4Y9qZcWhlYZwaGh6W2LUXOMrmc3JQ5ogO5paMeOiRCnu/w1hW
	AVBv8Is0ab3IhC6rymCq0Eyn14jyJmEpT9iS6b2v9Ty36TtAvl0Hpws1FV+Bw0ycdKdzeH4jnA8sz
	CV6zRsUg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ubKnH-00000002ZaW-3kFV;
	Mon, 14 Jul 2025 15:08:39 +0000
Received: from mail.fris.de ([2a01:4f8:c2c:390b::1])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ubK2k-00000002SMx-3pwA
	for linux-arm-kernel@lists.infradead.org;
	Mon, 14 Jul 2025 14:20:36 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 5B916C753D;
	Mon, 14 Jul 2025 16:20:32 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fris.de; s=dkim;
	t=1752502832; h=from:subject:date:message-id:to:cc:mime-version:
	 content-transfer-encoding:in-reply-to:references;
	bh=BdeLUXBHRqGOhfUv9g/nbTTXLKN+sllf5U2xZtp5pO0=;
	b=qsI/zJluZDysCLCi4bVjlogYxdJ80Fw1JNWEDiu9oAguFgzkNOEd54ri03LS12Agmy+uJi
	b1arHYsj3jhDyl2e9+dn9s6J3GDdzHdc7FMeseKB67Q9LQ5m86Spq42ig1f7Jg3gnSRsPe
	hhN6MtyyzzvfzVZpWqVeMUU2NFf3vlCrUkroH2tZewTOCSHYcb/tC6XYJqcCWxaIy9wppI
	ikwaYOSVAqAzN5mCpvh9HScAoL1ampnsxQSFRyEzpqxjJrYyfof1+ypweGAs6T8zixLzw0
	mfxTXxqUCL29p7X0Lw3URZcPzLMmR61Z0QjWPB5VxnC4q57A4NvoaO2EDLxNGA==
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
	Annette Kobou <annette.kobou@kontron.de>,
	Fabio Estevam <festevam@gmail.com>,
	Pengutronix Kernel Team <kernel@pengutronix.de>
Subject: [PATCH 09/12] arm64: dts: imx8mp-kontron: Fix USB hub reset
Date: Mon, 14 Jul 2025 16:17:35 +0200
Message-ID: <20250714141852.116455-10-frieder@fris.de>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20250714141852.116455-1-frieder@fris.de>
References: <20250714141852.116455-1-frieder@fris.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250714_072035_105628_5E6C4A63 
X-CRM114-Status: UNSURE (   9.64  )
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

The latest hardware revision uses GPIO_B_2 as reset for
the USB hub. Fix this and remove the pinctrl as we already
have this in the OSM-S devicetree.

Signed-off-by: Frieder Schrempf <frieder.schrempf@kontron.de>
---
 .../boot/dts/freescale/imx8mp-kontron-bl-osm-s.dts     | 10 +---------
 1 file changed, 1 insertion(+), 9 deletions(-)

diff --git a/arch/arm64/boot/dts/freescale/imx8mp-kontron-bl-osm-s.dts b/arch/arm64/boot/dts/freescale/imx8mp-kontron-bl-osm-s.dts
index bbcd76e9e9913..614b4ce330b1c 100644
--- a/arch/arm64/boot/dts/freescale/imx8mp-kontron-bl-osm-s.dts
+++ b/arch/arm64/boot/dts/freescale/imx8mp-kontron-bl-osm-s.dts
@@ -250,8 +250,6 @@ &usb_dwc3_0 {
 };
 
 &usb_dwc3_1 {
-	pinctrl-names = "default";
-	pinctrl-0 = <&pinctrl_usb_hub>;
 	#address-cells = <1>;
 	#size-cells = <0>;
 	dr_mode = "host";
@@ -260,7 +258,7 @@ &usb_dwc3_1 {
 	usb-hub@1 {
 		compatible = "usb424,2514";
 		reg = <1>;
-		reset-gpios = <&gpio3 14 GPIO_ACTIVE_LOW>;
+		reset-gpios = <&gpio4 20 GPIO_ACTIVE_LOW>;
 	};
 };
 
@@ -317,10 +315,4 @@ MX8MP_IOMUXC_ECSPI1_MOSI__GPIO5_IO07		0x46 /* CAN_ADR0 */
 			MX8MP_IOMUXC_ECSPI1_MISO__GPIO5_IO08		0x46 /* CAN_ADR1 */
 		>;
 	};
-
-	pinctrl_usb_hub: usbhubgrp {
-		fsl,pins = <
-			MX8MP_IOMUXC_NAND_DQS__GPIO3_IO14		0x46
-		>;
-	};
 };
-- 
2.50.1


