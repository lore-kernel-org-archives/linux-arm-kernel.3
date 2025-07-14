Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 300B0C83F2D
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 14 Jul 2025 15:08:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=2L71jw77VC8loJmQAT8DPywfUlO2NWcswTW0Ue92rdk=; b=Hg/aLiVpwiLFEArAgFb2t/cxc6
	zmM/ldu+uNei1FeUbTPywag1r7BWOBMuGYm+3TgjYfV/XHzPFIaTO8d+rc2DzbS7pkUhzkV8nGYPI
	msM1O4lrBkASV2LVL1dwGkREQhqpXZD/1UWzNvkhcySUahoSEVraYz0IxH+tN+9LJP1yl3rNdi+h2
	elfDaQrLphq2sCn44smATQHee6sBrNTuLfpGhVyE7VGaWrTzvyVj1/Voi70IiB2c683NzVZI5VtAq
	TQk+cFUrDvjP5CHwq+V9AJbj8htD/C/qI+ZNe4yBrkv8AXTFXnaZkgGdcLu0EjNzGGAVFOXAQ5vwz
	2ZDuJ1Lg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ubKnI-00000002ZcO-3i7z;
	Mon, 14 Jul 2025 15:08:40 +0000
Received: from mail.fris.de ([116.203.77.234])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ubK2p-00000002SNt-0RNf
	for linux-arm-kernel@lists.infradead.org;
	Mon, 14 Jul 2025 14:20:40 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 2F934C753B;
	Mon, 14 Jul 2025 16:20:37 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fris.de; s=dkim;
	t=1752502837; h=from:subject:date:message-id:to:cc:mime-version:
	 content-transfer-encoding:in-reply-to:references;
	bh=2L71jw77VC8loJmQAT8DPywfUlO2NWcswTW0Ue92rdk=;
	b=la5P6Ds1FJ43gszmyuZX8M8JY0fLf+me5+WTHRnIQCWNyGbK/ARmYkjFHxtcB1mKk7oxnE
	VuRBY78r+FJ/NXY0PCke3sQlQBIiZ19XK7pWf5znUr9tHzipyt3X0mGEARBXAeIPR4PNCM
	tjjnpEGVp/FDWW6XiB9WtJ0Fzsx6AUQNRlnEAXdwqyG14jK0YzMzxJAwy7N0fcjQSgnQ/E
	fCjVUDEpL8mNpqxyk3vhq7/44IbeKuxaRXB37p/HJDFt4ru9lGKxB+ImHfdZAYLamFqUr7
	rt++oMSyEvO+Wrww2oDS41fMTtyHMKFSLUFcM6Stzbd0jzPIh44qXlSJzNGYqg==
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
Subject: [PATCH 10/12] arm64: dts: imx93-kontron: Add RTC interrupt signal
Date: Mon, 14 Jul 2025 16:17:36 +0200
Message-ID: <20250714141852.116455-11-frieder@fris.de>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20250714141852.116455-1-frieder@fris.de>
References: <20250714141852.116455-1-frieder@fris.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250714_072039_283790_31CCE6D1 
X-CRM114-Status: UNSURE (   9.58  )
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

The RTC EVI ouptut is connected to a GPIO. Add the interrupt
so it can be used by the RTC driver.

Signed-off-by: Frieder Schrempf <frieder.schrempf@kontron.de>
---
 arch/arm64/boot/dts/freescale/imx93-kontron-osm-s.dtsi | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/arch/arm64/boot/dts/freescale/imx93-kontron-osm-s.dtsi b/arch/arm64/boot/dts/freescale/imx93-kontron-osm-s.dtsi
index 119a162070596..c79b1df339db1 100644
--- a/arch/arm64/boot/dts/freescale/imx93-kontron-osm-s.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx93-kontron-osm-s.dtsi
@@ -205,6 +205,9 @@ eeprom@50 {
 	rv3028: rtc@52 {
 		compatible = "microcrystal,rv3028";
 		reg = <0x52>;
+		pinctrl-names = "default";
+		pinctrl-0 = <&pinctrl_rtc>;
+		interrupts-extended = <&gpio3 19 IRQ_TYPE_LEVEL_LOW>;
 	};
 };
 
@@ -468,6 +471,12 @@ MX93_PAD_CCM_CLKO4__GPIO4_IO29			0x31e /* CARRIER_PWR_EN */
 		>;
 	};
 
+	pinctrl_rtc: rtcgrp {
+		fsl,pins = <
+			MX93_PAD_SD2_VSELECT__GPIO3_IO19		0x31e
+		>;
+	};
+
 	pinctrl_sai3: sai3grp {
 		fsl,pins = <
 			MX93_PAD_GPIO_IO20__SAI3_RX_DATA00		0x31e /* I2S_A_DATA_IN */
-- 
2.50.1


