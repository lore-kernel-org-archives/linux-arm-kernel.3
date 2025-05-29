Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7E642C54FB3
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 29 May 2025 12:01:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=56qRrAtL/a6koU+ClmQ0T5MnkBdpWG/sJANgtbap56g=; b=VBC+6lt2cxx60O7a3cgUOqcl77
	6W/sF+WrVTQa4aFlLoFoC3P6aIr86lR/+76+FtkXBkbRKZ6aZNU9WLdWaRKtylGyMxfIjYI+C0ddN
	NBsBjuR0q908KnLT1Df/PpFYVT5uHdP5PVDq2I8vpg6yiUZBfJ4+EwGqSVQWaHFs4b0A+YY9WDlBK
	7AK/Ps9SGzVJ4/plumXAEJFmc3MLGJgWw5v0y3bZaQ3lVHeR3CC7UujanOlm5C0UkGumA7/YYOWJc
	vtEDCsIhu217wR4spK15dtp314x14D+Q/sQbvVZ0xSOKdM1SIHyvXM9zA2LO786ez0FzTQX0GHskk
	XWMTjajw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uKbx8-0000000FhKK-0ZEj;
	Thu, 29 May 2025 12:01:42 +0000
Received: from lelvem-ot01.ext.ti.com ([198.47.23.234])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uKbNN-0000000FblW-0X3d;
	Thu, 29 May 2025 11:24:48 +0000
Received: from fllvem-sh03.itg.ti.com ([10.64.41.86])
	by lelvem-ot01.ext.ti.com (8.15.2/8.15.2) with ESMTP id 54TBOPh03504642;
	Thu, 29 May 2025 06:24:25 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1748517865;
	bh=56qRrAtL/a6koU+ClmQ0T5MnkBdpWG/sJANgtbap56g=;
	h=From:To:CC:Subject:Date;
	b=luI5Snan38kNQ+vphh1lKji9/YO3x7//X4p4oebHZ8lkEjIF2yvQsciBH8yUkuK9k
	 AMLL08bddYOX598TBZijLKU8dGX1Ixll7VZVftQHBWHRij2nORFQbFkhkLBTXk31NU
	 siM9pFG3dXuCOKZx68YdFvsYdlscM/r5n1TufYYc=
Received: from DFLE107.ent.ti.com (dfle107.ent.ti.com [10.64.6.28])
	by fllvem-sh03.itg.ti.com (8.18.1/8.18.1) with ESMTPS id 54TBOPT2061510
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA256 bits=128 verify=FAIL);
	Thu, 29 May 2025 06:24:25 -0500
Received: from DFLE111.ent.ti.com (10.64.6.32) by DFLE107.ent.ti.com
 (10.64.6.28) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Thu, 29
 May 2025 06:24:24 -0500
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DFLE111.ent.ti.com
 (10.64.6.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Thu, 29 May 2025 06:24:24 -0500
Received: from localhost (jayesh-hp-z2-tower-g5-workstation.dhcp.ti.com [172.24.227.14])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 54TBONkn1516428;
	Thu, 29 May 2025 06:24:24 -0500
From: Jayesh Choudhary <j-choudhary@ti.com>
To: <robh@kernel.org>, <krzk+dt@kernel.org>, <conor+dt@kernel.org>,
        <neil.armstrong@linaro.org>, <khilman@baylibre.com>,
        <devicetree@vger.kernel.org>
CC: <jbrunet@baylibre.com>, <martin.blumenstingl@googlemail.com>,
        <shawnguo@kernel.org>, <s.hauer@pengutronix.de>,
        <kernel@pengutronix.de>, <festevam@gmail.com>,
        <cros-qcom-dts-watchers@chromium.org>, <andersson@kernel.org>,
        <konradybcio@kernel.org>, <geert+renesas@glider.be>,
        <magnus.damm@gmail.com>, <linux-arm-kernel@lists.infradead.org>,
        <linux-amlogic@lists.infradead.org>, <imx@lists.linux.dev>,
        <linux-arm-msm@vger.kernel.org>, <linux-renesas-soc@vger.kernel.org>,
        <dianders@chromium.org>, <linux-kernel@vger.kernel.org>,
        <max.krummenacher@toradex.com>, <j-choudhary@ti.com>,
        <ernestvanhoecke@gmail.com>
Subject: [PATCH] arm64: dts: Add no-hpd property for all ti-sn65dsi86 bridge consumers
Date: Thu, 29 May 2025 16:54:23 +0530
Message-ID: <20250529112423.484232-1-j-choudhary@ti.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250529_042445_267584_977460EA 
X-CRM114-Status: GOOD (  12.03  )
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

In the SN65DSI86 DSI-2-eDP bridge, HPD is not supported as of now.
But DisplayPort connector_type usecases does need hpd to be enabled.
In order not to break any platform from those driver changes, add
"no-hpd" property to all the existing sn65dsi86 nodes (that don't
have it already) as hpd is not being used there anyways.

Signed-off-by: Jayesh Choudhary <j-choudhary@ti.com>
---

Upcoming driver changes that will break platforms if we do not have this
property in all the existing sn65dsi86 nodes that assumes hpd is disabled:
<https://lore.kernel.org/all/20250529110418.481756-1-j-choudhary@ti.com/>

(sc7180-trogdor-ti-sn65dsi86.dtsi, sdm850-lenovo-yoga-c630.dts and
sdm845-cheza.dtsi already have this property.)

NOTE: Grouping the logical changes together in a single patch even though
we have multiple vendor dts. I hope that is not an issue.

 .../boot/dts/amlogic/meson-g12b-bananapi-cm4-mnt-reform2.dts     | 1 +
 arch/arm64/boot/dts/freescale/imx8mq-mnt-reform2.dts             | 1 +
 arch/arm64/boot/dts/qcom/sc7180-acer-aspire1.dts                 | 1 +
 arch/arm64/boot/dts/renesas/r8a779a0-falcon-cpu.dtsi             | 1 +
 arch/arm64/boot/dts/renesas/r8a779g3-sparrow-hawk.dts            | 1 +
 arch/arm64/boot/dts/renesas/r8a779h0-gray-hawk-single.dts        | 1 +
 arch/arm64/boot/dts/renesas/white-hawk-cpu-common.dtsi           | 1 +
 7 files changed, 7 insertions(+)

diff --git a/arch/arm64/boot/dts/amlogic/meson-g12b-bananapi-cm4-mnt-reform2.dts b/arch/arm64/boot/dts/amlogic/meson-g12b-bananapi-cm4-mnt-reform2.dts
index 0f48c32bec97..6a7d7db3ef8f 100644
--- a/arch/arm64/boot/dts/amlogic/meson-g12b-bananapi-cm4-mnt-reform2.dts
+++ b/arch/arm64/boot/dts/amlogic/meson-g12b-bananapi-cm4-mnt-reform2.dts
@@ -292,6 +292,7 @@ edp_bridge: bridge@2c {
 		vpll-supply = <&reg_main_1v8>;
 		vcca-supply = <&reg_main_1v2>;
 		vcc-supply = <&reg_main_1v2>;
+		no-hpd;
 
 		ports {
 			#address-cells = <1>;
diff --git a/arch/arm64/boot/dts/freescale/imx8mq-mnt-reform2.dts b/arch/arm64/boot/dts/freescale/imx8mq-mnt-reform2.dts
index 3ae3824be027..599a53969326 100644
--- a/arch/arm64/boot/dts/freescale/imx8mq-mnt-reform2.dts
+++ b/arch/arm64/boot/dts/freescale/imx8mq-mnt-reform2.dts
@@ -147,6 +147,7 @@ edp_bridge: bridge@2c {
 		vpll-supply = <&reg_main_1v8>;
 		vcca-supply = <&reg_main_1v2>;
 		vcc-supply = <&reg_main_1v2>;
+		no-hpd;
 
 		ports {
 			#address-cells = <1>;
diff --git a/arch/arm64/boot/dts/qcom/sc7180-acer-aspire1.dts b/arch/arm64/boot/dts/qcom/sc7180-acer-aspire1.dts
index 672ac4c3afa3..8fa18273684f 100644
--- a/arch/arm64/boot/dts/qcom/sc7180-acer-aspire1.dts
+++ b/arch/arm64/boot/dts/qcom/sc7180-acer-aspire1.dts
@@ -384,6 +384,7 @@ sn65dsi86_bridge: bridge@2c {
 
 		clocks = <&rpmhcc RPMH_LN_BB_CLK3>;
 		clock-names = "refclk";
+		no-hpd;
 
 		ports {
 			#address-cells = <1>;
diff --git a/arch/arm64/boot/dts/renesas/r8a779a0-falcon-cpu.dtsi b/arch/arm64/boot/dts/renesas/r8a779a0-falcon-cpu.dtsi
index 0916fd57d1f1..a115e3fc4cb9 100644
--- a/arch/arm64/boot/dts/renesas/r8a779a0-falcon-cpu.dtsi
+++ b/arch/arm64/boot/dts/renesas/r8a779a0-falcon-cpu.dtsi
@@ -214,6 +214,7 @@ bridge@2c {
 		vpll-supply = <&reg_1p8v>;
 		vcca-supply = <&reg_1p2v>;
 		vcc-supply = <&reg_1p2v>;
+		no-hpd;
 
 		ports {
 			#address-cells = <1>;
diff --git a/arch/arm64/boot/dts/renesas/r8a779g3-sparrow-hawk.dts b/arch/arm64/boot/dts/renesas/r8a779g3-sparrow-hawk.dts
index 6955eafd8d6a..fcc2d8edd464 100644
--- a/arch/arm64/boot/dts/renesas/r8a779g3-sparrow-hawk.dts
+++ b/arch/arm64/boot/dts/renesas/r8a779g3-sparrow-hawk.dts
@@ -349,6 +349,7 @@ bridge@2c {
 				vpll-supply = <&reg_1p8v>;
 				vcca-supply = <&reg_1p2v>;
 				vcc-supply = <&reg_1p2v>;
+				no-hpd;
 
 				ports {
 					#address-cells = <1>;
diff --git a/arch/arm64/boot/dts/renesas/r8a779h0-gray-hawk-single.dts b/arch/arm64/boot/dts/renesas/r8a779h0-gray-hawk-single.dts
index 4d890e0617af..8b9592b87366 100644
--- a/arch/arm64/boot/dts/renesas/r8a779h0-gray-hawk-single.dts
+++ b/arch/arm64/boot/dts/renesas/r8a779h0-gray-hawk-single.dts
@@ -460,6 +460,7 @@ bridge@2c {
 		vpll-supply = <&reg_1p8v>;
 		vcca-supply = <&reg_1p2v>;
 		vcc-supply = <&reg_1p2v>;
+		no-hpd;
 
 		ports {
 			#address-cells = <1>;
diff --git a/arch/arm64/boot/dts/renesas/white-hawk-cpu-common.dtsi b/arch/arm64/boot/dts/renesas/white-hawk-cpu-common.dtsi
index b4024e85ae5a..686a37a8680f 100644
--- a/arch/arm64/boot/dts/renesas/white-hawk-cpu-common.dtsi
+++ b/arch/arm64/boot/dts/renesas/white-hawk-cpu-common.dtsi
@@ -256,6 +256,7 @@ bridge@2c {
 		vpll-supply = <&reg_1p8v>;
 		vcca-supply = <&reg_1p2v>;
 		vcc-supply = <&reg_1p2v>;
+		no-hpd;
 
 		ports {
 			#address-cells = <1>;
-- 
2.34.1


