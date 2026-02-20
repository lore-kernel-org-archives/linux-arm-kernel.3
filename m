Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CA318C56202
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 20 Feb 2026 14:31:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=wqJgdoCqiOdzIhzrfhNSF/MhiuLEn1kACd6MHSSRwJY=; b=oH8ClZgwyDDSo80D6dl0G9YlSB
	RmCDhciIbfVAPnj4B7GPyV4wmPhYv7i+OP+bvqV13q9a1Nog7lAc7bL0J2xxgE31g8IMWqda42P2/
	tmDf0fGSop5W0qVNI3pxcNy058rNMaDbnYrxXMpowu9p9Ml8nKegfJpVRgDyKRlfOjBNBjtSZACcl
	0zOBbMPcj35RTOavpymjzheDfvH0ANN99RqymBKgGHT/yBVeMnGb6+a2LWE5yBJBBmRDp+JWv2Zu8
	LPNTp70aN9mBKQ+scPOqmvPYsFFC74DWftpn+SNTMinX9kum6wkL9lskvJX+WrC8s9uW+dUZBRBfR
	MKOUEP7A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vtRX9-0000000Eok0-2h3j;
	Fri, 20 Feb 2026 14:31:07 +0000
Received: from mx-relay94-hz2.antispameurope.com ([94.100.136.194])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vtRX2-0000000Eof4-2Uca
	for linux-arm-kernel@lists.infradead.org;
	Fri, 20 Feb 2026 14:31:01 +0000
ARC-Authentication-Results: i=1; mx-gate94-hz2.hornetsecurity.com 1; spf=pass
 reason=mailfrom (ip=94.100.132.6, headerfrom=ew.tq-group.com)
 smtp.mailfrom=ew.tq-group.com smtp.helo=smtp-out01-hz1.hornetsecurity.com;
 dmarc=pass header.from=ew.tq-group.com orig.disposition=pass
ARC-Message-Signature: a=rsa-sha256;
 bh=wqJgdoCqiOdzIhzrfhNSF/MhiuLEn1kACd6MHSSRwJY=; c=relaxed/relaxed;
 d=hornetsecurity.com; h=from:to:date:subject:mime-version:; i=1; s=hse1;
 t=1771597847;
 b=AGfSnn5buKm/nnpDNKvdQFUKbVzsCUM+jx7DOJSrQ1/0HDRlloY8YkjiV7Ag1RSlmipUrsHP
 +re3cXDLcA3RdCG/wZyj/ucH6tsQTqLC6SvI+mn5GCHBYZIaoZpx+XkmggFCxhk1sOIjtZ3Se4E
 g6kqoXhaOceie+EYiukcJ6etgOxGlIg+aMa0BOBtQsFTYGRiWnXxOuvCA3gvTrzRfWY4e/b87sL
 i7USWoyyNHgrawjgg2qtEaGWTVPp1pRH5NfWgHWAXlQwma1QAerUiD0lBRukuSJ17S9AisoBe/I
 zlFjRO2uVKQcr9uG5Fk/70i+9WS0K5ZtjpgPMaaMQdpiw==
ARC-Seal: a=rsa-sha256; cv=none; d=hornetsecurity.com; i=1; s=hse1;
 t=1771597847;
 b=Slv8784cifERGGThYFlO2ungVLlwOnyjWe+sh138poHy6QR0jgEavlBpFdxEewd1YGZMGC8k
 2c4MBAPcocdEqLj2+dFMrz/nfAm+7IqlFZ55AailED8ZuvX+pM4uyDStZmMK7RvJ7tFIwWl7kUa
 FEKwhHQpnk/dALMPakK503x2eCtY6iHPojOWb8YdQAIH3CG3PZbRQ0jZTSaTq/hOVbISoWHGqMf
 Xch7Na/lmTcQv7Uum+TSq9I9CUvzFgqcovwpnifVh2xXgmYG7WchHL2U2xTlGwrSg5uz8eK4Yhr
 PKFG0/KietRcBu6RsROT6P6qzXM2rv81C3tLthZaNckGA==
Received: from he-nlb01-hz1.hornetsecurity.com ([94.100.132.6]) by mx-relay94-hz2.antispameurope.com;
 Fri, 20 Feb 2026 15:30:47 +0100
Received: from merchelm-W2.tq-net.de (host-82-135-125-110.customer.m-online.net [82.135.125.110])
	(Authenticated sender: max.merchel@ew.tq-group.com)
	by smtp-out01-hz1.hornetsecurity.com (Postfix) with ESMTPSA id D84CCA41357;
	Fri, 20 Feb 2026 15:30:29 +0100 (CET)
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
Subject: [PATCH v2 3/4] ARM: dts: imx6qdl-tqma6: add boot phase properties
Date: Fri, 20 Feb 2026 15:30:04 +0100
Message-ID: <20260220143008.186851-4-Max.Merchel@ew.tq-group.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260220143008.186851-1-Max.Merchel@ew.tq-group.com>
References: <20260220143008.186851-1-Max.Merchel@ew.tq-group.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-cloud-security-sender: max.merchel@ew.tq-group.com
X-cloud-security-recipient: linux-arm-kernel@lists.infradead.org
X-cloud-security-crypt: load encryption module
X-cloud-security-Mailarchiv: E-Mail archived for: max.merchel@ew.tq-group.com
X-cloud-security-Mailarchivtype: outbound
X-cloud-security-Virusscan: CLEAN
X-cloud-security-disclaimer: This E-Mail was scanned by E-Mailservice on mx-relay94-hz2.antispameurope.com with 4fHXj24CHgz3dG6N
X-cloud-security-connect: he-nlb01-hz1.hornetsecurity.com[94.100.132.6], TLS=1, IP=94.100.132.6
X-cloud-security-Digest: c0a012c4c0204103e9d00e65e5abcb83
X-cloud-security: scantime:2.128
DKIM-Signature: a=rsa-sha256;
 bh=wqJgdoCqiOdzIhzrfhNSF/MhiuLEn1kACd6MHSSRwJY=; c=relaxed/relaxed;
 d=ew.tq-group.com;
 h=content-type:mime-version:subject:from:to:message-id:date; s=hse1;
 t=1771597846; v=1;
 b=ic/+d+4jipfLWmWwJnhTmM4eFEo/QqP4/GMfyWH14WVVJ/Qgi16JDlZidwArIbVNaJuSs0Yx
 CvV74k6OJpPn8qlCf0IsIKLMibbVMXd0pBbcYiM1NrznvoBhBryIlTzx78ZrQKQy/zXqVwikFnt
 CuWiRmf4Uuqpyv1If5Sll78u4HVgXPQkpYh4XX9EVf7DMDk7Afdq6pG13LO5jMgr7YdAzZsVf0H
 t7Xq9GuyV3YNlBd7HcOH4h4aB6cNK1G7ssMbValhz64z5ymvSpyV+70PKqyaNIqUpnICJHj3kcY
 qVML1XxlBDWP9/Mg5g/kRBl9oMxwlZMZsX6/d6SJLrG8A==
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260220_063100_782304_5D372A05 
X-CRM114-Status: GOOD (  11.34  )
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

dtschema/schemas/bootph.yaml describe various node usage during
boot phases with DT.

TQMa6 need eMMC, I2C, GPIO, regulator and QSPI access during
boot process.

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


