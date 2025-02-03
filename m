Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F056DC02192
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  3 Feb 2025 21:58:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=nKhOijkAhJ5opCbgXaSaTL1eqHs8b9sk12sPB0FqAHc=; b=CxcX+bHdF40pTfNgDSVW3Jqd6G
	uENR2t0F/pwclVg+KZmO78IfNsClD2iBAx2M12gmRs2nGpR75NeLpLNSleWDLD7upW0xknp3kYoVL
	KwjMa26VpzCo9KO7YpgCnVOpHVSDn6xJiWaN12NbHxJYxEJEe+ts1GcAeLTQ1HxV171unVAJQ8lTi
	pNZhTudgacUZ7Lmr1y3bnahImPWh8R/uUwSOoFq7eexggbEiP+VNNMmmH59OWNc5rI58iITeuphVk
	zNPTe0AG1j//90kLcUIZXRNzumeF2Gag0HN8qaBKl8i8gF5AZRdMdjdxkbztiiceap83Vv3X02qJi
	D8ttW91Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tf4Sg-0000000GkPu-21Qm;
	Mon, 03 Feb 2025 21:58:34 +0000
Received: from fllvem-ot04.ext.ti.com ([198.47.19.246])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tf4RK-0000000Gk8h-3F1l
	for linux-arm-kernel@lists.infradead.org;
	Mon, 03 Feb 2025 21:57:13 +0000
Received: from fllv0034.itg.ti.com ([10.64.40.246])
	by fllvem-ot04.ext.ti.com (8.15.2/8.15.2) with ESMTPS id 513Lv5v42216422
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 3 Feb 2025 15:57:05 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1738619825;
	bh=nKhOijkAhJ5opCbgXaSaTL1eqHs8b9sk12sPB0FqAHc=;
	h=From:To:CC:Subject:Date;
	b=stTC3xHPs4xUdypH+XDe+ynJgIbWHSZvI+JdkWHqrKUoeXR6cONIYr8heXER1S3Ti
	 ogSPUeIsPff628lMWbWXUy4+JnQdP2hAkJ1t/3w14NJFN8Wi3Ip3yzbj7dV+3mXQ3g
	 yJ8l7GqiBhUqiYBOzOyN+Jla5OpQaW7HprADQYYM=
Received: from DLEE107.ent.ti.com (dlee107.ent.ti.com [157.170.170.37])
	by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 513Lv56d121781
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Mon, 3 Feb 2025 15:57:05 -0600
Received: from DLEE100.ent.ti.com (157.170.170.30) by DLEE107.ent.ti.com
 (157.170.170.37) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Mon, 3
 Feb 2025 15:57:04 -0600
Received: from lelvsmtp6.itg.ti.com (10.180.75.249) by DLEE100.ent.ti.com
 (157.170.170.30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Mon, 3 Feb 2025 15:57:04 -0600
Received: from judy-hp.dhcp.ti.com (judy-hp.dhcp.ti.com [128.247.81.105])
	by lelvsmtp6.itg.ti.com (8.15.2/8.15.2) with ESMTP id 513Lv4ZT062150;
	Mon, 3 Feb 2025 15:57:04 -0600
From: Judith Mendez <jm@ti.com>
To: Nishanth Menon <nm@ti.com>, Vignesh Raghavendra <vigneshr@ti.com>
CC: Tero Kristo <kristo@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof
 Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        <linux-arm-kernel@lists.infradead.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>
Subject: [PATCH] arm64: dts: ti: k3-am62-lp-sk: Add bootph flag to support sd boot
Date: Mon, 3 Feb 2025 15:57:04 -0600
Message-ID: <20250203215704.1333881-1-jm@ti.com>
X-Mailer: git-send-email 2.48.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250203_135710_943250_4F38D2ED 
X-CRM114-Status: GOOD (  10.03  )
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

In order to boot using SD boot, voltage regulator nodes, io-expander
nodes, and gpio nodes need to be present in all stages of boot in
order to do voltage switching, thus add bootph-all flag to these nodes
to not fail SD boot on am62 lp SK board.

Signed-off-by: Judith Mendez <jm@ti.com>
---
 arch/arm64/boot/dts/ti/k3-am62-lp-sk.dts | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/arch/arm64/boot/dts/ti/k3-am62-lp-sk.dts b/arch/arm64/boot/dts/ti/k3-am62-lp-sk.dts
index 8e9fc00a6b3c7..5f6cc3567cba5 100644
--- a/arch/arm64/boot/dts/ti/k3-am62-lp-sk.dts
+++ b/arch/arm64/boot/dts/ti/k3-am62-lp-sk.dts
@@ -58,6 +58,7 @@ vdd_mmc1: regulator-3 {
 	};
 
 	vddshv_sdio: regulator-4 {
+		bootph-all;
 		compatible = "regulator-gpio";
 		regulator-name = "vddshv_sdio";
 		pinctrl-names = "default";
@@ -74,12 +75,14 @@ vddshv_sdio: regulator-4 {
 
 &main_pmx0 {
 	vddshv_sdio_pins_default: vddshv-sdio-default-pins {
+		bootph-all;
 		pinctrl-single,pins = <
 			AM62X_IOPAD(0x07c, PIN_OUTPUT, 7) /* (M19) GPMC0_CLK.GPIO0_31 */
 		>;
 	};
 
 	main_gpio1_ioexp_intr_pins_default: main-gpio1-ioexp-intr-default-pins {
+		bootph-all;
 		pinctrl-single,pins = <
 			AM62X_IOPAD(0x01d4, PIN_INPUT, 7) /* (C13) UART0_RTSn.GPIO1_23 */
 		>;
@@ -94,6 +97,7 @@ AM62X_IOPAD(0x01f4, PIN_INPUT, 0) /* (B16) EXTINTn */
 
 &main_i2c1 {
 	exp1: gpio@22 {
+		bootph-all;
 		compatible = "ti,tca6424";
 		reg = <0x22>;
 		gpio-controller;
@@ -229,6 +233,14 @@ &tlv320aic3106 {
 	DVDD-supply = <&buck2_reg>;
 };
 
+&main_gpio0 {
+	bootph-all;
+};
+
+&main_gpio1 {
+	bootph-all;
+};
+
 &gpmc0 {
 	ranges = <0 0 0x00 0x51000000 0x01000000>; /* CS0 space. Min partition = 16MB */
 };

base-commit: 2014c95afecee3e76ca4a56956a936e23283f05b
-- 
2.48.0


