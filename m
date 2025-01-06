Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3AFBEE77188
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  6 Jan 2025 16:11:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=S4VywW6Q3uhsR76RyLbYuQ6LTme7CpciQBgugDZCDNM=; b=onyczmzxh++DBCwj6aMsSE56rH
	U5cqodhbXYGB4b/r6ts1SMOEv1EnS3PPfGKlOx6BeDinm7sFvYQ/1NroJ2wNxXFJ+6vPjk+mI4SxG
	OEAFj8vhJsTcxHqOBX8Ve2/ie4d5alXMdW0BOA1kyFJusuu2JPhDmWC5uJ28F1Qva752CXOg2wHtA
	OujRtrrCkeu/GQfLMHFQ7g1HLggLMg1oPOFSoQpWGo7oFn5Um0k5abhHVnJiCEfegLKNySCdaR8tC
	H9YXlqkxoO7Kajduw+m4de3CoFgqsjrroP4JMv5++AqCKkPA2/xP7NH8OhDXuqQjXCacHH8/XPSqI
	8/wVYsOA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tUphf-00000001uLP-0xwo;
	Mon, 06 Jan 2025 16:11:43 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tUpdD-00000001tWt-2faA
	for linux-arm-kernel@bombadil.infradead.org;
	Mon, 06 Jan 2025 16:07:07 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=S4VywW6Q3uhsR76RyLbYuQ6LTme7CpciQBgugDZCDNM=; b=bTed8KC5iOpf2OM1iFUAavzNbd
	Fvmu9NfU8JLKuga5JnwGgFip6kWQGaFhnFf96ggF+OIcnN6ESswQrD3UNOpAQWxNd1+dLPCAyB2Cr
	8eRA18U1cnEIPSBtN0fw9+MqHusdQELXiWSTqGLYwrcikDUxo1i7SVBnIhS6WflpXNX+sWiiAaG35
	yTHyowjBI0txF235LRbAZgt9iEKNHP2R8kven9vPRyCgojYMrvWFEo18dLWLsWSpeYE11DX+6Kg14
	i05WpaIgKrBFfVylM7RSr48EbAQ548jfJ1lbspkXoiCjFPwBvSffsurQuUbgx3As/+qswvMEen6KE
	H473Ib7g==;
Received: from metis.whiteo.stw.pengutronix.de ([2a0a:edc0:2:b01:1d::104])
	by desiato.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tUpdA-00000008xpS-2pT7
	for linux-arm-kernel@lists.infradead.org;
	Mon, 06 Jan 2025 16:07:06 +0000
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.whiteo.stw.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <a.fatoum@pengutronix.de>)
	id 1tUpcx-0000C3-KF; Mon, 06 Jan 2025 17:06:51 +0100
Received: from dude05.red.stw.pengutronix.de ([2a0a:edc0:0:1101:1d::54])
	by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <a.fatoum@pengutronix.de>)
	id 1tUpcw-007C9k-0k;
	Mon, 06 Jan 2025 17:06:51 +0100
Received: from localhost ([::1] helo=dude05.red.stw.pengutronix.de)
	by dude05.red.stw.pengutronix.de with esmtp (Exim 4.96)
	(envelope-from <a.fatoum@pengutronix.de>)
	id 1tUpcw-009dVc-32;
	Mon, 06 Jan 2025 17:06:50 +0100
From: Ahmad Fatoum <a.fatoum@pengutronix.de>
Date: Mon, 06 Jan 2025 17:06:36 +0100
Subject: [PATCH v2 01/10] arm64: dts: imx8mp-skov: correct PMIC board
 limits
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250106-skov-dt-updates-v2-1-4504d3f00ecb@pengutronix.de>
References: <20250106-skov-dt-updates-v2-0-4504d3f00ecb@pengutronix.de>
In-Reply-To: <20250106-skov-dt-updates-v2-0-4504d3f00ecb@pengutronix.de>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, 
 Oleksij Rempel <o.rempel@pengutronix.de>
Cc: devicetree@vger.kernel.org, imx@lists.linux.dev, 
 Frank Li <Frank.li@nxp.com>, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org, kernel@pengutronix.de, 
 Ahmad Fatoum <a.fatoum@pengutronix.de>
X-Mailer: b4 0.14.2
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: a.fatoum@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-arm-kernel@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250106_160704_981528_A308CBE3 
X-CRM114-Status: GOOD (  13.20  )
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

The PMIC voltage constraints in the device tree currently describe the
permissible range of the PMIC. This is unnecessary as this information
already exists in the driver and wrong as it doesn't account for
board-specific constraints, e.g. a 2.1V on VDD_SOC would fry the SoC and
a maximum voltage of 3.4V on the VDD_3V3 rail may be unexpected across
the board.

Fix this by adjusting constraints to reflect the board limits.

Fixes: 6d382d51d979 ("arm64: dts: freescale: Add SKOV IMX8MP CPU revB board")
Signed-off-by: Ahmad Fatoum <a.fatoum@pengutronix.de>
---
v1 -> v2:
  - no change
---
 .../arm64/boot/dts/freescale/imx8mp-skov-reva.dtsi | 24 +++++++++++-----------
 1 file changed, 12 insertions(+), 12 deletions(-)

diff --git a/arch/arm64/boot/dts/freescale/imx8mp-skov-reva.dtsi b/arch/arm64/boot/dts/freescale/imx8mp-skov-reva.dtsi
index 59813ef8e2bb3a3d5672ba1c5776cf0e45fb6862..ae82166b5c266a96441809958c56b6c8a7ef5e3d 100644
--- a/arch/arm64/boot/dts/freescale/imx8mp-skov-reva.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx8mp-skov-reva.dtsi
@@ -247,8 +247,8 @@ reg_vdd_soc: BUCK1 {
 
 			reg_vdd_arm: BUCK2 {
 				regulator-name = "VDD_ARM";
-				regulator-min-microvolt = <600000>;
-				regulator-max-microvolt = <2187500>;
+				regulator-min-microvolt = <850000>;
+				regulator-max-microvolt = <1000000>;
 				vin-supply = <&reg_5v_p>;
 				regulator-boot-on;
 				regulator-always-on;
@@ -259,8 +259,8 @@ reg_vdd_arm: BUCK2 {
 
 			reg_vdd_3v3: BUCK4 {
 				regulator-name = "VDD_3V3";
-				regulator-min-microvolt = <600000>;
-				regulator-max-microvolt = <3400000>;
+				regulator-min-microvolt = <3300000>;
+				regulator-max-microvolt = <3300000>;
 				vin-supply = <&reg_5v_p>;
 				regulator-boot-on;
 				regulator-always-on;
@@ -268,8 +268,8 @@ reg_vdd_3v3: BUCK4 {
 
 			reg_vdd_1v8: BUCK5 {
 				regulator-name = "VDD_1V8";
-				regulator-min-microvolt = <600000>;
-				regulator-max-microvolt = <3400000>;
+				regulator-min-microvolt = <1800000>;
+				regulator-max-microvolt = <1800000>;
 				vin-supply = <&reg_5v_p>;
 				regulator-boot-on;
 				regulator-always-on;
@@ -277,8 +277,8 @@ reg_vdd_1v8: BUCK5 {
 
 			reg_nvcc_dram_1v1: BUCK6 {
 				regulator-name = "NVCC_DRAM_1V1";
-				regulator-min-microvolt = <600000>;
-				regulator-max-microvolt = <3400000>;
+				regulator-min-microvolt = <1100000>;
+				regulator-max-microvolt = <1100000>;
 				vin-supply = <&reg_5v_p>;
 				regulator-boot-on;
 				regulator-always-on;
@@ -286,8 +286,8 @@ reg_nvcc_dram_1v1: BUCK6 {
 
 			reg_nvcc_snvs_1v8: LDO1 {
 				regulator-name = "NVCC_SNVS_1V8";
-				regulator-min-microvolt = <1600000>;
-				regulator-max-microvolt = <3300000>;
+				regulator-min-microvolt = <1800000>;
+				regulator-max-microvolt = <1800000>;
 				vin-supply = <&reg_5v_p>;
 				regulator-boot-on;
 				regulator-always-on;
@@ -295,8 +295,8 @@ reg_nvcc_snvs_1v8: LDO1 {
 
 			reg_vdda_1v8: LDO3 {
 				regulator-name = "VDDA_1V8";
-				regulator-min-microvolt = <800000>;
-				regulator-max-microvolt = <3300000>;
+				regulator-min-microvolt = <1800000>;
+				regulator-max-microvolt = <1800000>;
 				vin-supply = <&reg_5v_p>;
 				regulator-boot-on;
 				regulator-always-on;

-- 
2.39.5


