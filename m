Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4DE7FC87FCA
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 21 Jul 2025 11:39:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=lWX7emWvsoLQvVEGUyiq/66hqtEyres4Se1xfJrpZWU=; b=u76ZGiOyAWvoe3CgL8wRL4aF6w
	TK7R+2+E1LpP9m/hvnKSgErK0/NSjXcndUX5kyEQpa1F6caLjbF6uLa/lpsHUd8ClahMk9TQk4Ivw
	lvWQLIYSY2u7vBMC/A2TYCiCY5rpGcOk2QwCDqIGxzEFXRqvJKnK1czvVc6FHh0wSvaBPUfhUa96X
	4a8g3hHLlEFSLr6YQ3t/jo+Hk4tBvhuf0feGLYSw8Tseag6d1AjlwBACKsojWZ12F35NTIj8N+LaU
	TD1h4SYtTUUjKgeOZUFrsuhx73x7TfnmGytLZ+mqL96hT8sWY42V7aUWOYmtqEmrJ42g81DuRKp4F
	6sWb+edQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1udorV-0000000H7L8-26un;
	Mon, 21 Jul 2025 11:39:17 +0000
Received: from mail.fris.de ([2a01:4f8:c2c:390b::1])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1udnS4-0000000Gux0-2XNv
	for linux-arm-kernel@lists.infradead.org;
	Mon, 21 Jul 2025 10:08:57 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 93724C75F6;
	Mon, 21 Jul 2025 12:08:54 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fris.de; s=dkim;
	t=1753092534; h=from:subject:date:message-id:to:cc:mime-version:
	 content-transfer-encoding:in-reply-to:references;
	bh=lWX7emWvsoLQvVEGUyiq/66hqtEyres4Se1xfJrpZWU=;
	b=cUvVoj80eV+T+Jb/vSetVLXY5mOU2DluY/o+Sfcugq3DUhaYuAgJuajO8EoPgHlQWf8z9C
	tmN6AC5VZczkx6lXr+BboWOZa49p4Ka/6PFK2fkHhItt9VrRGuibztPhQ44uedAO9m/WVS
	kXH3tGE2oQXD/BtlSoUKICQfOwIEHkUS9jn9+b5VpbOKfKnlaFWFpUCqjEPk6E9OScC2cu
	jIWHhaRgUG/wvpTzDYRISRlgqO4VCRrGJ0YsNxEVcBEH8yfFU9OKuG+BhXOPCvANG4d32v
	82jlg9KOMXswXbk7Gc2qfLGNaGei7v1vz3dHbQYIVAA7yfRh9wAKQSk9HIQpUQ==
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
Subject: [PATCH v2 10/12] arm64: dts: imx93-kontron: Add RTC interrupt signal
Date: Mon, 21 Jul 2025 12:05:44 +0200
Message-ID: <20250721100701.115548-11-frieder@fris.de>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20250721100701.115548-1-frieder@fris.de>
References: <20250721100701.115548-1-frieder@fris.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250721_030856_796836_995B6E0A 
X-CRM114-Status: UNSURE (   9.85  )
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

The RTC INT ouptut is connected to a GPIO. Add the interrupt
so it can be used by the RTC driver.

Signed-off-by: Frieder Schrempf <frieder.schrempf@kontron.de>
---
Changes for v2:
* fix commit message (thanks Primoz!)
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


