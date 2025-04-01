Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4A79DC36010
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  1 Apr 2025 11:50:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=TLGX6SQ0Fayxabbc/NePJCcKcTirZ+RKWJn3EJSTPRQ=; b=zDWW4S+nA/1BBOy219psvTuOc0
	UDZKHY7ewdvOt2cw14aFuaDCenYN14RmTauKgLZpmkpd1KWBcW8s5IR5Yd7/NvWYdDM2BibZKv62g
	M/5fRgQOti6q8EXbZ8VGLIwGA9ZVWzCy8Kx47nfTwNjcFq98i9HiP4EmshPCtKQmSdFwe/UrFJ/vw
	sRVwXgKkf5NkzI/avPCZKPZYAm5LRNp7daklnOtB+aXMJXn2OB8Xj5tCX2tiz/bv8pbk+rWc27WMt
	llTzvKBkeh69YjRsc/o1BgxI2KIWjVel2zTmfrlRlslFgrmMrz5BaFFrHaiEV7+I1sJ3mqv69YVzS
	idq9e8WA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1tza8U-00000002qQN-3XOl;
	Tue, 01 Apr 2025 11:50:30 +0000
Received: from fllvem-ot03.ext.ti.com ([198.47.19.245])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1tzZzq-00000002onk-11UY
	for linux-arm-kernel@lists.infradead.org;
	Tue, 01 Apr 2025 11:41:35 +0000
Received: from lelv0266.itg.ti.com ([10.180.67.225])
	by fllvem-ot03.ext.ti.com (8.15.2/8.15.2) with ESMTPS id 531BfIS42944054
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=NO);
	Tue, 1 Apr 2025 06:41:18 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1743507678;
	bh=TLGX6SQ0Fayxabbc/NePJCcKcTirZ+RKWJn3EJSTPRQ=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=PE5Q8jaGXz7n8XHqsa7IWy2FQUTZ6SGjYvt7NODv0Ww7svX97wxf/Gd/H0tLAIPSq
	 /JXa7KSotGO20Z0dclMCpTwRzUk+7ZvvmObiZbjP/fOCjQ5NHfNF/ykbOUCJf/nJ+O
	 tSL5nH2yuKwcrN+9sbdN6bJ9vqaxd6/P0F+OZhfQ=
Received: from DLEE103.ent.ti.com (dlee103.ent.ti.com [157.170.170.33])
	by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTP id 531BfInt020967;
	Tue, 1 Apr 2025 06:41:18 -0500
Received: from DLEE115.ent.ti.com (157.170.170.26) by DLEE103.ent.ti.com
 (157.170.170.33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Tue, 1
 Apr 2025 06:41:17 -0500
Received: from lelvsmtp6.itg.ti.com (10.180.75.249) by DLEE115.ent.ti.com
 (157.170.170.26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Tue, 1 Apr 2025 06:41:17 -0500
Received: from abhilash-HP.dhcp.ti.com (abhilash-hp.dhcp.ti.com [172.24.227.115])
	by lelvsmtp6.itg.ti.com (8.15.2/8.15.2) with ESMTP id 531Bevm3099961;
	Tue, 1 Apr 2025 06:41:14 -0500
From: Yemike Abhilash Chandra <y-abhilashchandra@ti.com>
To: <nm@ti.com>, <vigneshr@ti.com>
CC: <kristo@kernel.org>, <robh@kernel.org>, <krzk+dt@kernel.org>,
        <conor+dt@kernel.org>, <vaishnav.a@ti.com>, <jai.luthra@linux.dev>,
        <linux-arm-kernel@lists.infradead.org>, <devicetree@vger.kernel.org>,
        <imx@lists.linux.dev>, <linux-kernel@vger.kernel.org>,
        <u-kumar1@ti.com>, <y-abhilashchandra@ti.com>
Subject: [PATCH 3/5] arm64: dts: ti: k3-j721e-sk: Fix dtbs_check warnings in IMX219 overlay
Date: Tue, 1 Apr 2025 17:10:51 +0530
Message-ID: <20250401114053.229534-4-y-abhilashchandra@ti.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250401114053.229534-1-y-abhilashchandra@ti.com>
References: <20250401114053.229534-1-y-abhilashchandra@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250401_044134_373142_BDEE0D99 
X-CRM114-Status: GOOD (  11.02  )
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

The device tree bindings mandate three regulator nodes for the IMX219
sensor: VANA (analog), VDIG (digital core), and VDDL (digital I/O). Add the
necessary regulator nodes in the device tree overlay and also the device
tree bindings do not include a clock-names property. Remove the incorrectly
added clock-names entry to avoid dtbs_check warnings.

Fixes: f767eb918096 ("arm64: dts: ti: k3-j721e-sk: Add overlay for IMX219")
Signed-off-by: Yemike Abhilash Chandra <y-abhilashchandra@ti.com>
---
 .../dts/ti/k3-j721e-sk-csi2-dual-imx219.dtso  | 35 +++++++++++++++++--
 1 file changed, 33 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/boot/dts/ti/k3-j721e-sk-csi2-dual-imx219.dtso b/arch/arm64/boot/dts/ti/k3-j721e-sk-csi2-dual-imx219.dtso
index 47bb5480b5b0..4eb3cffab032 100644
--- a/arch/arm64/boot/dts/ti/k3-j721e-sk-csi2-dual-imx219.dtso
+++ b/arch/arm64/boot/dts/ti/k3-j721e-sk-csi2-dual-imx219.dtso
@@ -19,6 +19,33 @@ clk_imx219_fixed: imx219-xclk {
 		#clock-cells = <0>;
 		clock-frequency = <24000000>;
 	};
+
+	reg_2p8v: regulator-2p8v {
+		compatible = "regulator-fixed";
+		regulator-name = "2P8V";
+		regulator-min-microvolt = <2800000>;
+		regulator-max-microvolt = <2800000>;
+		vin-supply = <&vdd_sd_dv>;
+		regulator-always-on;
+	};
+
+	reg_1p8v: regulator-1p8v {
+		compatible = "regulator-fixed";
+		regulator-name = "1P8V";
+		regulator-min-microvolt = <1800000>;
+		regulator-max-microvolt = <1800000>;
+		vin-supply = <&vdd_sd_dv>;
+		regulator-always-on;
+	};
+
+	reg_1p2v: regulator-1p2v {
+		compatible = "regulator-fixed";
+		regulator-name = "1P2V";
+		regulator-min-microvolt = <1200000>;
+		regulator-max-microvolt = <1200000>;
+		vin-supply = <&vdd_sd_dv>;
+		regulator-always-on;
+	};
 };
 
 &csi_mux {
@@ -34,7 +61,9 @@ imx219_0: imx219-0@10 {
 		reg = <0x10>;
 
 		clocks = <&clk_imx219_fixed>;
-		clock-names = "xclk";
+		VANA-supply = <&reg_2p8v>;
+		VDIG-supply = <&reg_1p8v>;
+		VDDL-supply = <&reg_1p2v>;
 
 		port {
 			csi2_cam0: endpoint {
@@ -56,7 +85,9 @@ imx219_1: imx219-1@10 {
 		reg = <0x10>;
 
 		clocks = <&clk_imx219_fixed>;
-		clock-names = "xclk";
+		VANA-supply = <&reg_2p8v>;
+		VDIG-supply = <&reg_1p8v>;
+		VDDL-supply = <&reg_1p2v>;
 
 		port {
 			csi2_cam1: endpoint {
-- 
2.34.1


