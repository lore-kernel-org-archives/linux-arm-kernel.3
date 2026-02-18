Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4711AE9A049
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 18 Feb 2026 13:23:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=8Zcx4Gwsq0t5HYafz2dIuwiCTKeT7XB0utiZMiUPk6Y=; b=GEFNiE0OV59UWIzXxmFdN9viM1
	4IAcIrTjmT6BqdW2nooNAsAhK5dt3KPgh2NXkfWO57sy+dG3cWXWdlrhfipZq2m4fCWDTO+puEyuD
	2BXYlA0STk35B/QhTL8Djd/ody5p9dd6FpwI1zsi3de04X964lTiEgNLtj1omkroO/j+tmfX4q5vK
	A1Oy1THhjotY/NHKqN0QjopgaMB00NyzouZ4AaZ34BptbKqFcSU2oExDzmA1vAmtiD4WhdgGfq0F5
	LQVUqE9/J7tKc8u+DeR+r3+I/eaFUeYxQXQixtDiHe/ulgvksxEjBdH6ae/RX+/K835X8yOednQqm
	btfowfmA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vshWx-00000009r3y-0YS5;
	Wed, 18 Feb 2026 13:23:51 +0000
Received: from mx-relay49-hz3.antispameurope.com ([94.100.134.238])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vshWr-00000009r1U-2ra8
	for linux-arm-kernel@lists.infradead.org;
	Wed, 18 Feb 2026 13:23:47 +0000
ARC-Authentication-Results: i=1; mx-gate49-hz3.hornetsecurity.com 1; spf=pass
 reason=mailfrom (ip=94.100.132.6, headerfrom=ew.tq-group.com)
 smtp.mailfrom=ew.tq-group.com
 smtp.helo=hmail-p-smtp01-out03-hz1.hornetsecurity.com; dmarc=pass
 header.from=ew.tq-group.com orig.disposition=pass
ARC-Message-Signature: a=rsa-sha256;
 bh=8Zcx4Gwsq0t5HYafz2dIuwiCTKeT7XB0utiZMiUPk6Y=; c=relaxed/relaxed;
 d=hornetsecurity.com; h=from:to:date:subject:mime-version:; i=1; s=hse1;
 t=1771421012;
 b=g8hSi/yQc7WC0oNXD0m3ObgJG6X1ZmdH0r0yLP0Dt3WxyI1y6TmURp43jDKrrh+E0r4LK5wE
 PQrpdQAlAKb/RiwvYvwYTihaqKobsbXRePkdaTZ+zYpDIt+VCCrTAJchYqv8I4/qMpOSdhyF6lS
 0yNS/KBBfavS7DqkawhBRfDRM7irgVsgTrsNzHibFnaACCvZ6LCz3wUupx0TzyNSaciVOrWS45Z
 dLCcXQTNb2V3tt0XQfd25imzgj7QFtWa9Uwsz9Lsqo+G0pm9cMbUfJYXdglmWMbMmWKeuw2s8p6
 9HazAKvtpeJzlgF1Tx3bgAfw94cciSBo1hPCv2a5dKcYQ==
ARC-Seal: a=rsa-sha256; cv=none; d=hornetsecurity.com; i=1; s=hse1;
 t=1771421012;
 b=D3NxXVwU7c5Zr0k4E4jiNXE246pH3DXX9d6/05Art6+48mN/44OHbNw0MwqOA60O9xiY679w
 EQMOCoVUTssglN1ba+2O+EvW6ssbv7ArI3sse9Hnx49tsnGGUQSHLC5gPewZbYmNXp3/zrAIQCc
 Ep2K8+IbE4PrJcprEmKwiE7a6oBh+sr9oVUebhgQK7dnXHiQLZkKu1TU88BRO1eiM9hiPsheWE6
 MlbWiXpHQ4JeXJGED84GhQ+3BMEnM4TkLgYRtghOb0w7E1hrlGq0z0hpTWk4qnoMBPg0Lww+nha
 Ntf4izx6ajV7uuvi26QCFFJjhCkH3YMRUOigzti/7ccVw==
Received: from he-nlb01-hz1.hornetsecurity.com ([94.100.132.6]) by mx-relay49-hz3.antispameurope.com;
 Wed, 18 Feb 2026 14:23:32 +0100
Received: from merchelm-W2.tq-net.de (host-82-135-125-110.customer.m-online.net [82.135.125.110])
	(Authenticated sender: max.merchel@ew.tq-group.com)
	by hmail-p-smtp01-out03-hz1.hornetsecurity.com (Postfix) with ESMTPSA id 39FA4CC0CC4;
	Wed, 18 Feb 2026 14:23:13 +0100 (CET)
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
Subject: [PATCH 3/4] ARM: dts: imx6qdl-tqma6: add boot phase properties
Date: Wed, 18 Feb 2026 14:22:24 +0100
Message-ID: <20260218132228.32056-4-Max.Merchel@ew.tq-group.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260218132228.32056-1-Max.Merchel@ew.tq-group.com>
References: <20260218132228.32056-1-Max.Merchel@ew.tq-group.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-cloud-security-sender: max.merchel@ew.tq-group.com
X-cloud-security-recipient: linux-arm-kernel@lists.infradead.org
X-cloud-security-crypt: load encryption module
X-cloud-security-Mailarchiv: E-Mail archived for: max.merchel@ew.tq-group.com
X-cloud-security-Mailarchivtype: outbound
X-cloud-security-Virusscan: CLEAN
X-cloud-security-disclaimer: This E-Mail was scanned by E-Mailservice on mx-relay49-hz3.antispameurope.com with 4fGHJP11XQz3yb9j
X-cloud-security-connect: he-nlb01-hz1.hornetsecurity.com[94.100.132.6], TLS=1, IP=94.100.132.6
X-cloud-security-Digest: cf7061861399f4e6f66565e8def3d525
X-cloud-security: scantime:1.925
DKIM-Signature: a=rsa-sha256;
 bh=8Zcx4Gwsq0t5HYafz2dIuwiCTKeT7XB0utiZMiUPk6Y=; c=relaxed/relaxed;
 d=ew.tq-group.com;
 h=content-type:mime-version:subject:from:to:message-id:date; s=hse1;
 t=1771421012; v=1;
 b=n7c1AQlVnMXySUnB9m8y3igxmRzp1RRevAguz0hsPOFOLP21umLnuLB0CreeaT8JZ60WcXjx
 D7J0rdds8l6xPQMDYSgdncIiOwpcq9IAaxkn1l3fzO1kj0JY1bemSLyRGrilT0vSktPJDDG9QF9
 IDxbDrwy9Ry6fPuXnCLD86ZFvA0K6tv71IN7FPOuTWAuC/481dv+KttG1Rb3r40aQhMwYkyrZMC
 9upoBKLdypBSHMu9Pk8o7gnWGluGzALcNmCVvgXivNNOFQFYdrc8lJJTKH1pyo0+gg4/DFSaT/e
 LNB+jbn/llDIixL6ZxpNSPDFGEZbuvu5ytpEBaTRXjEyA==
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260218_052345_865077_8EED11E3 
X-CRM114-Status: GOOD (  11.81  )
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

Add boot phase properties to TQMa6 device trees.

Signed-off-by: Max Merchel <Max.Merchel@ew.tq-group.com>
---
 arch/arm/boot/dts/nxp/imx/imx6qdl-tqma6.dtsi  | 11 +++++++++++
 arch/arm/boot/dts/nxp/imx/imx6qdl-tqma6a.dtsi |  1 +
 arch/arm/boot/dts/nxp/imx/imx6qdl-tqma6b.dtsi |  2 ++
 3 files changed, 14 insertions(+)

diff --git a/arch/arm/boot/dts/nxp/imx/imx6qdl-tqma6.dtsi b/arch/arm/boot/dts/nxp/imx/imx6qdl-tqma6.dtsi
index 07492f63a1f8..14676d1d905a 100644
--- a/arch/arm/boot/dts/nxp/imx/imx6qdl-tqma6.dtsi
+++ b/arch/arm/boot/dts/nxp/imx/imx6qdl-tqma6.dtsi
@@ -11,6 +11,7 @@ &ecspi1 {
 	pinctrl-names = "default";
 	pinctrl-0 = <&pinctrl_ecspi1>;
 	cs-gpios = <&gpio3 19 GPIO_ACTIVE_LOW>;
+	bootph-pre-ram;
 	status = "okay";
 
 	m25p80: flash@0 {
@@ -19,6 +20,7 @@ m25p80: flash@0 {
 		spi-max-frequency = <50000000>;
 		vcc-supply = <&sw4_reg>;
 		m25p,fast-read;
+		bootph-pre-ram;
 
 		partitions {
 			compatible = "fixed-partitions";
@@ -28,6 +30,10 @@ partitions {
 	};
 };
 
+&gpio3 {
+	bootph-pre-ram;
+};
+
 &iomuxc {
 	pinctrl_ecspi1: ecspi1grp {
 		fsl,pins = <
@@ -38,6 +44,7 @@ MX6QDL_PAD_EIM_D16__ECSPI1_SCLK 0xb099
 			 /* eCSPI1 SS1 */
 			MX6QDL_PAD_EIM_D19__GPIO3_IO19 0xb099
 		>;
+		bootph-pre-ram;
 	};
 
 	pinctrl_i2c1: i2c1grp {
@@ -45,6 +52,7 @@ pinctrl_i2c1: i2c1grp {
 			MX6QDL_PAD_CSI0_DAT8__I2C1_SDA 0x4001b899
 			MX6QDL_PAD_CSI0_DAT9__I2C1_SCL 0x4001b899
 		>;
+		bootph-pre-ram;
 	};
 
 	pinctrl_i2c1_recovery: i2c1recoverygrp {
@@ -73,6 +81,7 @@ MX6QDL_PAD_SD3_DAT5__SD3_DATA5 0x17059
 			MX6QDL_PAD_SD3_DAT6__SD3_DATA6 0x17059
 			MX6QDL_PAD_SD3_DAT7__SD3_DATA7 0x17059
 		>;
+		bootph-all;
 	};
 };
 
@@ -117,6 +126,7 @@ sw4_reg: sw4 {
 			regulator-min-microvolt = <3300000>;
 			regulator-max-microvolt = <3300000>;
 			regulator-always-on;
+			bootph-pre-ram;
 		};
 
 		reg_5v_600mA: swbst {
@@ -186,6 +196,7 @@ &usdhc3 {
 	bus-width = <8>;
 	#address-cells = <1>;
 	#size-cells = <0>;
+	bootph-all;
 	status = "okay";
 
 	mmccard: mmccard@0 {
diff --git a/arch/arm/boot/dts/nxp/imx/imx6qdl-tqma6a.dtsi b/arch/arm/boot/dts/nxp/imx/imx6qdl-tqma6a.dtsi
index 1251749a8dd0..67f8f59aff5a 100644
--- a/arch/arm/boot/dts/nxp/imx/imx6qdl-tqma6a.dtsi
+++ b/arch/arm/boot/dts/nxp/imx/imx6qdl-tqma6a.dtsi
@@ -20,6 +20,7 @@ &i2c1 {
 	scl-gpios = <&gpio5 27 (GPIO_ACTIVE_HIGH | GPIO_OPEN_DRAIN)>;
 	sda-gpios = <&gpio5 26 (GPIO_ACTIVE_HIGH | GPIO_OPEN_DRAIN)>;
 	clock-frequency = <100000>;
+	bootph-pre-ram;
 	status = "okay";
 
 	pmic: pmic@8 {
diff --git a/arch/arm/boot/dts/nxp/imx/imx6qdl-tqma6b.dtsi b/arch/arm/boot/dts/nxp/imx/imx6qdl-tqma6b.dtsi
index 7f526f39e0f2..db552802554d 100644
--- a/arch/arm/boot/dts/nxp/imx/imx6qdl-tqma6b.dtsi
+++ b/arch/arm/boot/dts/nxp/imx/imx6qdl-tqma6b.dtsi
@@ -13,6 +13,7 @@ &i2c3 {
 	scl-gpios = <&gpio1 5 (GPIO_ACTIVE_HIGH | GPIO_OPEN_DRAIN)>;
 	sda-gpios = <&gpio1 6 (GPIO_ACTIVE_HIGH | GPIO_OPEN_DRAIN)>;
 	clock-frequency = <100000>;
+	bootph-pre-ram;
 	status = "okay";
 
 	pmic: pmic@8 {
@@ -40,6 +41,7 @@ pinctrl_i2c3: i2c3grp {
 			MX6QDL_PAD_GPIO_5__I2C3_SCL 0x4001b899
 			MX6QDL_PAD_GPIO_6__I2C3_SDA 0x4001b899
 		>;
+		bootph-pre-ram;
 	};
 
 	pinctrl_i2c3_recovery: i2c3recoverygrp {
-- 
2.43.0


