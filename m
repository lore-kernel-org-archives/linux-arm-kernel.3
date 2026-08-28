Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 22DD8C61DB9
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 28 Aug 2026 11:46:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=1PJdKZT1am+ubfkmchlolAhmvXc7plmfMStau+1vD1o=; b=TR+sKSOXQQnN3j9igTnlrwbJZK
	r9qGqrMB9AI+Ax4kL//9tixGk2MQ1lfsVRO7OLeppdFS+Jcaxt+saP1VEZ6kuuR03tEpeWfEWgq4p
	VClpmNhuLJy84YFKrADZ8ldR03baA4XhrQlTY3l5mMEggIvQgCZ+vVw39Tfl35obppLU09fAq3tbc
	CiPww8g/hEUtmrs/b8TpahlzzAP+QbMN9QBGVaOl6iAeETfYc/gFbr4u9T7T0s67TLzswl97k9OaB
	0PGlymPgbnKTRnvB9Zjb3UUDhD2ywA08NznB5vViAfv+gbTHM2JWeZanOPVZOzyW4XFoSj97I6z4X
	7T4UUkVA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wzv1y-00000005fcc-23yt;
	Fri, 28 Aug 2026 11:45:58 +0000
Received: from out-112.mta1.migadu.com ([2001:41d0:203:375::70] helo=mta1.migadu.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wzv1s-00000005fXI-0gfW
	for linux-arm-kernel@lists.infradead.org;
	Fri, 28 Aug 2026 11:45:55 +0000
X-Envelope-To: linux-arm-kernel@lists.infradead.org
DKIM-Signature: a=rsa-sha256; bh=KJSKVfVDA4BnilE2RrZaUQRN55DrOrdNl6twBREZKDE=;
 c=simple/simple; d=cknow-tech.com;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1787917550; v=1; x=1788522350;
 b=TPXSYFoP/8A/ZLUBCcG3l83HNSxL733EySUyQJOHgcdsOA3xFtxJFQPmegZaWAhRIV/2aX/m
 v33V+nVnUU2H0glHWsPIVuCPhO1ygQvneBTU3s3wwNFenf9Tc40//xkaiCk2fbROvBlklklTxY1
 Yx/PuG8cmDGU0tIg+mk2fjg9RUS4n6Zpalqbelylzy2n+bKUCBN90U8WkkN1nm8QwVn3zTUsehk
 gxsMGOGTzlB66D1NY6qMXS9ytqTGvu2225ggV9kKQU6irYpnijOVZE7QlrRs9lDE5hcHtLfTO2Y
 sS9h4pxUrKnSihqHJipfQvvD3RUZKe9ktvwcW2IaEP8WA==
X-Envelope-To: linux-arm-kernel@lists.infradead.org
Received: by smtp.migadu.com with ESMTPS id 326993ff3a397364;
	Fri, 28 Aug 2026 11:45:50 +0000
X-Mizu-Trace-ID: 326993ff3a397364
X-Migadu-Flow: FLOW_OUT
From: Diederik de Haas <diederik@cknow-tech.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Heiko Stuebner <heiko@sntech.de>
Cc: Ricardo Pardini <ricardo@pardini.net>,
	Marcin Juszkiewicz <marcin@juszkiewicz.com.pl>,
	Daniele Briguglio <hello@superkali.me>,
	Hugh Cole-Baker <sigmaris@gmail.com>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Diederik de Haas <diederik@cknow-tech.com>
Subject: [PATCH 2/7] arm64: dts: rockchip: Fix PCIe 2 pinctrl names and sorting on NanoPC-T6
Date: Fri, 28 Aug 2026 13:43:02 +0200
Message-ID: <20260828114530.1315798-3-diederik@cknow-tech.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260828114530.1315798-1-diederik@cknow-tech.com>
References: <20260828114530.1315798-1-diederik@cknow-tech.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260828_044552_364115_9461C428 
X-CRM114-Status: UNSURE (   8.93  )
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

Use the pinctrl names as used in the schematics and use natural sort order
by property names for the PCIe 2 nodes.

Signed-off-by: Diederik de Haas <diederik@cknow-tech.com>
---
 .../boot/dts/rockchip/rk3588-nanopc-t6.dtsi   | 36 +++++++++----------
 1 file changed, 18 insertions(+), 18 deletions(-)

diff --git a/arch/arm64/boot/dts/rockchip/rk3588-nanopc-t6.dtsi b/arch/arm64/boot/dts/rockchip/rk3588-nanopc-t6.dtsi
index fc49b927ef73..16c35250bacf 100644
--- a/arch/arm64/boot/dts/rockchip/rk3588-nanopc-t6.dtsi
+++ b/arch/arm64/boot/dts/rockchip/rk3588-nanopc-t6.dtsi
@@ -195,8 +195,8 @@ vdd_mpcie_3v3: regulator-vdd-mpcie-3v3 {
 		compatible = "regulator-fixed";
 		enable-active-high;
 		gpio = <&gpio4 RK_PC2 GPIO_ACTIVE_HIGH>;
+		pinctrl-0 = <&pcie_m2_1_pwren_pin>;
 		pinctrl-names = "default";
-		pinctrl-0 = <&pcie_m2_1_pwren>;
 		regulator-name = "vdd_mpcie_3v3";
 		regulator-min-microvolt = <3300000>;
 		regulator-max-microvolt = <3300000>;
@@ -207,8 +207,8 @@ vcc3v3_pcie_m2_0: regulator-vcc3v3-pcie-m2-0 {
 		compatible = "regulator-fixed";
 		enable-active-high;
 		gpios = <&gpio2 RK_PC5 GPIO_ACTIVE_HIGH>;
+		pinctrl-0 = <&pcie_m2_0_pwren_pin>;
 		pinctrl-names = "default";
-		pinctrl-0 = <&pcie_m2_0_pwren>;
 		regulator-name = "vcc3v3_pcie_m2_0";
 		regulator-min-microvolt = <3300000>;
 		regulator-max-microvolt = <3300000>;
@@ -629,26 +629,26 @@ map1 {
 };
 
 &pcie2x1l0 {
+	pinctrl-0 = <&pcie_25glan_perstb_b_pin>;
+	pinctrl-names = "default";
 	reset-gpios = <&gpio4 RK_PB3 GPIO_ACTIVE_HIGH>;
 	vpcie3v3-supply = <&vcc_3v3_s3>;
-	pinctrl-names = "default";
-	pinctrl-0 = <&pcie2_0_rst>;
 	status = "okay";
 };
 
 &pcie2x1l1 {
+	pinctrl-0 = <&pcie_wifi_perstn_pin>;
+	pinctrl-names = "default";
 	reset-gpios = <&gpio4 RK_PA2 GPIO_ACTIVE_HIGH>;
 	vpcie3v3-supply = <&vdd_mpcie_3v3>;
-	pinctrl-names = "default";
-	pinctrl-0 = <&pcie2_1_rst>;
 	status = "okay";
 };
 
 &pcie2x1l2 {
+	pinctrl-0 = <&pcie_25glan_perstb_pin>;
+	pinctrl-names = "default";
 	reset-gpios = <&gpio4 RK_PA4 GPIO_ACTIVE_HIGH>;
 	vpcie3v3-supply = <&vcc_3v3_s3>;
-	pinctrl-names = "default";
-	pinctrl-0 = <&pcie2_2_rst>;
 	status = "okay";
 };
 
@@ -716,25 +716,25 @@ ir_receiver_pin: ir-receiver-pin {
 	};
 
 	pcie {
-		pcie2_0_rst: pcie2-0-rst {
-			rockchip,pins = <4 RK_PB3 RK_FUNC_GPIO &pcfg_pull_none>;
-		};
-
-		pcie2_1_rst: pcie2-1-rst {
-			rockchip,pins = <4 RK_PA2 RK_FUNC_GPIO &pcfg_pull_none>;
+		pcie_25glan_perstb_pin: pcie-25glan-perstb-pin {
+			rockchip,pins = <4 RK_PA4 RK_FUNC_GPIO &pcfg_pull_none>;
 		};
 
-		pcie2_2_rst: pcie2-2-rst {
-			rockchip,pins = <4 RK_PA4 RK_FUNC_GPIO &pcfg_pull_none>;
+		pcie_25glan_perstb_b_pin: pcie-25glan-perstb-b-pin {
+			rockchip,pins = <4 RK_PB3 RK_FUNC_GPIO &pcfg_pull_none>;
 		};
 
-		pcie_m2_0_pwren: pcie-m20-pwren {
+		pcie_m2_0_pwren_pin: pcie-m2-0-pwren-pin {
 			rockchip,pins = <2 RK_PC5 RK_FUNC_GPIO &pcfg_pull_none>;
 		};
 
-		pcie_m2_1_pwren: pcie-m21-pwren {
+		pcie_m2_1_pwren_pin: pcie-m2-1-pwren-pin {
 			rockchip,pins = <4 RK_PC2 RK_FUNC_GPIO &pcfg_pull_none>;
 		};
+
+		pcie_wifi_perstn_pin: pcie-wifi-perstn-pin {
+			rockchip,pins = <4 RK_PA2 RK_FUNC_GPIO &pcfg_pull_none>;
+		};
 	};
 
 	usb {
-- 
2.55.0


