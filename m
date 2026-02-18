Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8AC12E9A02C
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 18 Feb 2026 13:24:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=RDEB7Al8C9dMaYAoYH02KGoF+Zms3cmMuP6jo0DNw98=; b=CP3KG4jA0asEPFXrwbodpxF8z0
	z6p4zVIQa0/r7akBpMft7hxMyMOrjDUC4uN33AN8Y9eJ5+DufP9vOj2v2IiDn9zSg09NjRIDsIF4U
	dY7VvUx7/Q69siz3+I7QQskRV68KySI2xJQeUINxlH+hH/IetMXGZrfyF/vDORGwvDUwzr0tOlrPT
	4OAkCPMrHQXxaRvV3eB4AICy3JXqze6s3Kqwa23+xAPJcD453xzIWPJFExDyX/PBZauC+fHy7exle
	rhY82/PJIjDYjPOD3aJnQsieRR20Pme8nwYzlg9Mk+z0vu8lYkbwRpciNMp8hkH7WpAwNJWTaNREK
	WTRso0Vg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vshXL-00000009rHg-3375;
	Wed, 18 Feb 2026 13:24:15 +0000
Received: from mx-relay48-hz3.antispameurope.com ([94.100.134.237])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vshXI-00000009rDp-0iRz
	for linux-arm-kernel@lists.infradead.org;
	Wed, 18 Feb 2026 13:24:13 +0000
ARC-Authentication-Results: i=1; mx-gate48-hz3.hornetsecurity.com 1; spf=pass
 reason=mailfrom (ip=94.100.132.6, headerfrom=ew.tq-group.com)
 smtp.mailfrom=ew.tq-group.com
 smtp.helo=hmail-p-smtp01-out04-hz1.hornetsecurity.com; dmarc=pass
 header.from=ew.tq-group.com orig.disposition=pass
ARC-Message-Signature: a=rsa-sha256;
 bh=RDEB7Al8C9dMaYAoYH02KGoF+Zms3cmMuP6jo0DNw98=; c=relaxed/relaxed;
 d=hornetsecurity.com; h=from:to:date:subject:mime-version:; i=1; s=hse1;
 t=1771421040;
 b=DIZC5Ey755OUq0JvcB72+LVzDBPlpm6GZR5vBKP3YzyaZmxa4vjD6y8aXsd2WWnPjcbjMc9q
 66dVenKhMRhlnZC1zOHGJgSF61N/MX0EhhVAUFwJeDD49QBW8GJ50iIUe4zKGKM7N6Jim/jQg6e
 QBRDk9LGtyZJFq7bzWWs5d2SHktsuBr5sLtSQ5SPI+BKzCNV4YMWP9XudmOC0kzpQoDutOSFfLR
 LoCPdMY8dsp2Gtf4ckt8o/ep6DHFy0bQzTygQ6Bx/9N3q7nySQhKK0l9CcPB/ZT5tOaFW1L3t1l
 gIdbIDZ8/Zi4ZekiqIdv7zDyTmK1KOEjl5r0E76FnRFeg==
ARC-Seal: a=rsa-sha256; cv=none; d=hornetsecurity.com; i=1; s=hse1;
 t=1771421040;
 b=iOMxXE/Me07WhcxI/aJ9GhwkmbFBWH1QiXIfqLAi11OVMilqQ7+k9hyiQ73Eya9VII2BTrET
 C/JeqWHLB+COUw9K95Zke67TfE9gbWpooKms+u7TxNFf+SSzJHMb9P7/V59Y84E8xKXReUSBqNU
 +UepHxINnRDVxnro6HpaRMHK0ZXVv1wzS9dzPNlYe9dUYXt6yMI7yQuyC3lZH+Pjdy5ZP7X7KcY
 1vOZznI1o3WsdVjiY6d1/dpic1hXN1bHkI/TsRcML4Gf2V/PpryNCmDU1QxjQSWM1IHJF+Bo1JC
 zuAfcWau5UnJjma3/itaY2uPIhLspMIcXg9BHsXAVpMjA==
Received: from he-nlb01-hz1.hornetsecurity.com ([94.100.132.6]) by mx-relay48-hz3.antispameurope.com;
 Wed, 18 Feb 2026 14:24:00 +0100
Received: from merchelm-W2.tq-net.de (host-82-135-125-110.customer.m-online.net [82.135.125.110])
	(Authenticated sender: max.merchel@ew.tq-group.com)
	by hmail-p-smtp01-out04-hz1.hornetsecurity.com (Postfix) with ESMTPSA id 3242B2205F0;
	Wed, 18 Feb 2026 14:23:44 +0100 (CET)
From: Max Merchel <Max.Merchel@ew.tq-group.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Frank Li <Frank.Li@nxp.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>
Cc: Max Merchel <Max.Merchel@ew.tq-group.com>,
	linux@ew.tq-group.com,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 2/4] ARM: dts: imx6ul[l]-tqma6ul[l]: add boot phase properties
Date: Wed, 18 Feb 2026 14:23:35 +0100
Message-ID: <20260218132339.32157-3-Max.Merchel@ew.tq-group.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260218132339.32157-1-Max.Merchel@ew.tq-group.com>
References: <20260218132339.32157-1-Max.Merchel@ew.tq-group.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-cloud-security-sender: max.merchel@ew.tq-group.com
X-cloud-security-recipient: linux-arm-kernel@lists.infradead.org
X-cloud-security-crypt: load encryption module
X-cloud-security-Mailarchiv: E-Mail archived for: max.merchel@ew.tq-group.com
X-cloud-security-Mailarchivtype: outbound
X-cloud-security-Virusscan: CLEAN
X-cloud-security-disclaimer: This E-Mail was scanned by E-Mailservice on mx-relay48-hz3.antispameurope.com with 4fGHJw6VYjz1kPGCB
X-cloud-security-connect: he-nlb01-hz1.hornetsecurity.com[94.100.132.6], TLS=1, IP=94.100.132.6
X-cloud-security-Digest: 24d8cc4ecc148cb0df8ddce9d33b9577
X-cloud-security: scantime:1.977
DKIM-Signature: a=rsa-sha256;
 bh=RDEB7Al8C9dMaYAoYH02KGoF+Zms3cmMuP6jo0DNw98=; c=relaxed/relaxed;
 d=ew.tq-group.com;
 h=content-type:mime-version:subject:from:to:message-id:date; s=hse1;
 t=1771421039; v=1;
 b=Y/cgowjhrEZoYbxnR8nWnkEN5rCxzzFNt9UYB4VTWXCqmiZUWoj5pDzl2dPjsIiuCrpyZlMS
 XYzMWd7nQhNjp6SQlihGzCV1lOaotXyB9v1cOQSxcHloTUM0vPGr/xSPR4BwJi5DNlAG5jFeFNx
 ak+H02UOH7IfN9o6xYaf0I/pjKYQy1kwnz+gNIlUVZQXcJnSN3FMxfSQZPCG2zrl9dugIpwqgGr
 bOCGMAALJqbh9mkCZSGBJX97Hsk/8CFU67kLLO91BqSprlTWPr9RedXUjDpeu0fbA2hllbdZI/y
 58cQqeYt6UXxqrONy9tbky+u7tCIpJUuT9kL6aKktaM9w==
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260218_052412_364131_453B9B6E 
X-CRM114-Status: GOOD (  12.88  )
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

Add boot phase properties for TQMa6UL[L] device tree.

Signed-off-by: Max Merchel <Max.Merchel@ew.tq-group.com>
---
 arch/arm/boot/dts/nxp/imx/imx6ul-tqma6ul-common.dtsi   | 10 ++++++++++
 arch/arm/boot/dts/nxp/imx/imx6ul-tqma6ul2.dtsi         |  1 +
 arch/arm/boot/dts/nxp/imx/imx6ul-tqma6ul2l.dtsi        |  1 +
 arch/arm/boot/dts/nxp/imx/imx6ul-tqma6ulx-common.dtsi  |  1 +
 arch/arm/boot/dts/nxp/imx/imx6ul-tqma6ulxl-common.dtsi |  1 +
 arch/arm/boot/dts/nxp/imx/imx6ull-tqma6ull2.dtsi       |  1 +
 arch/arm/boot/dts/nxp/imx/imx6ull-tqma6ull2l.dtsi      |  1 +
 7 files changed, 16 insertions(+)

diff --git a/arch/arm/boot/dts/nxp/imx/imx6ul-tqma6ul-common.dtsi b/arch/arm/boot/dts/nxp/imx/imx6ul-tqma6ul-common.dtsi
index 2dd635a615cb..4fa98e6a66d7 100644
--- a/arch/arm/boot/dts/nxp/imx/imx6ul-tqma6ul-common.dtsi
+++ b/arch/arm/boot/dts/nxp/imx/imx6ul-tqma6ul-common.dtsi
@@ -26,6 +26,7 @@ &i2c4 {
 	pinctrl-1 = <&pinctrl_i2c4_recovery>;
 	scl-gpios = <&gpio1 20 (GPIO_ACTIVE_HIGH | GPIO_OPEN_DRAIN)>;
 	sda-gpios = <&gpio1 21 (GPIO_ACTIVE_HIGH | GPIO_OPEN_DRAIN)>;
+	bootph-pre-ram;
 	status = "okay";
 
 	pfuze3000: pmic@8 {
@@ -140,9 +141,14 @@ rtc0: rtc@68 {
 	};
 };
 
+&gpio1 {
+	bootph-pre-ram;
+};
+
 &gpio4 {
 	pinctrl-names = "default";
 	pinctrl-0 = <&pinctrl_pmic>;
+	bootph-pre-ram;
 
 	/*
 	 * PMIC & temperature sensor IRQ
@@ -159,6 +165,7 @@ pmic-int-hog {
 &qspi {
 	pinctrl-names = "default";
 	pinctrl-0 = <&pinctrl_qspi>;
+	bootph-pre-ram;
 	status = "okay";
 
 	flash0: flash@0 {
@@ -168,6 +175,7 @@ flash0: flash@0 {
 		spi-rx-bus-width = <4>;
 		spi-tx-bus-width = <1>;
 		vcc-supply = <&reg_vldo4>;
+		bootph-pre-ram;
 
 		partitions {
 			compatible = "fixed-partitions";
@@ -189,6 +197,7 @@ &usdhc2 {
 	non-removable;
 	no-sdio;
 	no-sd;
+	bootph-all;
 	status = "okay";
 };
 
@@ -212,5 +221,6 @@ pinctrl_pmic: pmicgrp {
 			/* PMIC irq */
 			MX6UL_PAD_CSI_DATA03__GPIO4_IO24	0x1b099
 		>;
+		bootph-pre-ram;
 	};
 };
diff --git a/arch/arm/boot/dts/nxp/imx/imx6ul-tqma6ul2.dtsi b/arch/arm/boot/dts/nxp/imx/imx6ul-tqma6ul2.dtsi
index e2e95dd92263..f81cd09fe0c7 100644
--- a/arch/arm/boot/dts/nxp/imx/imx6ul-tqma6ul2.dtsi
+++ b/arch/arm/boot/dts/nxp/imx/imx6ul-tqma6ul2.dtsi
@@ -33,6 +33,7 @@ MX6UL_PAD_NAND_DATA07__USDHC2_DATA7	0x00017051
 			/* rst */
 			MX6UL_PAD_NAND_ALE__GPIO4_IO10		0x0001b051
 		>;
+		bootph-all;
 	};
 
 	pinctrl_usdhc2_100mhz: usdhc2-100mhzgrp {
diff --git a/arch/arm/boot/dts/nxp/imx/imx6ul-tqma6ul2l.dtsi b/arch/arm/boot/dts/nxp/imx/imx6ul-tqma6ul2l.dtsi
index 4b87e2dc70dc..11c8f1af4173 100644
--- a/arch/arm/boot/dts/nxp/imx/imx6ul-tqma6ul2l.dtsi
+++ b/arch/arm/boot/dts/nxp/imx/imx6ul-tqma6ul2l.dtsi
@@ -33,6 +33,7 @@ MX6UL_PAD_NAND_DATA07__USDHC2_DATA7	0x00017051
 			/* rst */
 			MX6UL_PAD_NAND_ALE__GPIO4_IO10		0x0001b051
 		>;
+		bootph-all;
 	};
 
 	pinctrl_usdhc2_100mhz: usdhc2-100mhzgrp {
diff --git a/arch/arm/boot/dts/nxp/imx/imx6ul-tqma6ulx-common.dtsi b/arch/arm/boot/dts/nxp/imx/imx6ul-tqma6ulx-common.dtsi
index 5afb9046c202..5c90d0a3ee2e 100644
--- a/arch/arm/boot/dts/nxp/imx/imx6ul-tqma6ulx-common.dtsi
+++ b/arch/arm/boot/dts/nxp/imx/imx6ul-tqma6ulx-common.dtsi
@@ -39,5 +39,6 @@ MX6UL_PAD_NAND_CE1_B__QSPI_A_DATA02   0x70b9
 			MX6UL_PAD_NAND_CLE__QSPI_A_DATA03     0x70b9
 			MX6UL_PAD_NAND_DQS__QSPI_A_SS0_B      0x70a1
 		>;
+		bootph-pre-ram;
 	};
 };
diff --git a/arch/arm/boot/dts/nxp/imx/imx6ul-tqma6ulxl-common.dtsi b/arch/arm/boot/dts/nxp/imx/imx6ul-tqma6ulxl-common.dtsi
index ba84a4f70ebd..133961ee7283 100644
--- a/arch/arm/boot/dts/nxp/imx/imx6ul-tqma6ulxl-common.dtsi
+++ b/arch/arm/boot/dts/nxp/imx/imx6ul-tqma6ulxl-common.dtsi
@@ -44,5 +44,6 @@ MX6UL_PAD_NAND_CE1_B__QSPI_A_DATA02   0x70a9
 			MX6UL_PAD_NAND_CLE__QSPI_A_DATA03     0x70a9
 			MX6UL_PAD_NAND_DQS__QSPI_A_SS0_B      0x70a1
 		>;
+		bootph-pre-ram;
 	};
 };
diff --git a/arch/arm/boot/dts/nxp/imx/imx6ull-tqma6ull2.dtsi b/arch/arm/boot/dts/nxp/imx/imx6ull-tqma6ull2.dtsi
index 8541cb3f3b3e..1224ef132439 100644
--- a/arch/arm/boot/dts/nxp/imx/imx6ull-tqma6ull2.dtsi
+++ b/arch/arm/boot/dts/nxp/imx/imx6ull-tqma6ull2.dtsi
@@ -38,6 +38,7 @@ MX6UL_PAD_NAND_DATA07__USDHC2_DATA7	0x00017039
 			/* rst */
 			MX6UL_PAD_NAND_ALE__GPIO4_IO10		0x0001b051
 		>;
+		bootph-all;
 	};
 
 	pinctrl_usdhc2_100mhz: usdhc2-100mhzgrp {
diff --git a/arch/arm/boot/dts/nxp/imx/imx6ull-tqma6ull2l.dtsi b/arch/arm/boot/dts/nxp/imx/imx6ull-tqma6ull2l.dtsi
index be593d47e3b1..6dd1b359e086 100644
--- a/arch/arm/boot/dts/nxp/imx/imx6ull-tqma6ull2l.dtsi
+++ b/arch/arm/boot/dts/nxp/imx/imx6ull-tqma6ull2l.dtsi
@@ -38,6 +38,7 @@ MX6UL_PAD_NAND_DATA07__USDHC2_DATA7	0x00017039
 			/* rst */
 			MX6UL_PAD_NAND_ALE__GPIO4_IO10		0x0001b051
 		>;
+		bootph-all;
 	};
 
 	pinctrl_usdhc2_100mhz: usdhc2-100mhzgrp {
-- 
2.43.0


