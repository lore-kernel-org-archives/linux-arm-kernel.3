Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 33A59EB7ED5
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  4 Mar 2026 11:05:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:
	References:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:
	Subject:Date:From:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=toVpdsQVQjp7phThMtAf691KC2Z3Lv3zTeS5avG3ZrM=; b=dioMlTTJ4d80t1X2+AjqWzfm55
	/Oca1NpO85gd/iTOVCu7F2YPLzSdWLQK/o/zvfP1whdxreYIz9CXhTH7dhh/pmZwegUYLdn9Hy6fL
	WGwuZW3KB53C5txdyEfBlVHN7epF73RjEI+fe+69jhhuWfe+hSwO+KJ2zDozXzpD4wNJF21WBaSsL
	3l5NeeEBHoCZys5sano/0U1+CMpG6hiITyKnrpc6Ps1rI5I6jgIv3k95ChkuuuixdoigcP14IUKgI
	JBvhBXkgRgFrV+kBCka1FkQmtiCagbMFVuBDj2QCT+z+/LS3Z910fu0CCGj5DHTQ/1lfQk/v5YMDB
	rOT2RE+g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vxk2t-0000000H2jB-1J1g;
	Wed, 04 Mar 2026 11:05:39 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vxk2n-0000000H2eE-0ojf;
	Wed, 04 Mar 2026 11:05:35 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id A14EE4454A;
	Wed,  4 Mar 2026 11:05:32 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 7A9D9C2BCAF;
	Wed,  4 Mar 2026 11:05:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772622332;
	bh=oNtScFnsv11UDaKYBOINzknnrX3eHJJSbkK3kyF8YPc=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=oipMk5D+9lLUo32zwOPvNoN/bRHaLXrYrBHpDNCLQz5X89WKFynj7dWphOYvbXvhb
	 rq7UKe3ASJX8168EOQ0qh7dlfKrdykAZNEnLQnkIfvfzgFuw69Sqj1sj0h8ruBIeJS
	 elTDE1gILSQNKFoRzJV0pZZeGchsXPRQCWyvEn5HWDo3ZzHHqv84J2smFZHTZ2UwKc
	 LrhwNbrGBO1emqY1Xry1dge6/xVdY0eeFEk1pRf4t269j9zi6FFKW1McMjhlkraBK+
	 Rtclpvl29d2RthLjYZoGoOdkbi4CuFlL+c1JFXg7qrr7aJuyCtL7mwyrid0BKy94Tz
	 4XjEMb8xEZFNg==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 722A5EB7ECA;
	Wed,  4 Mar 2026 11:05:32 +0000 (UTC)
From: David Heidelberg via B4 Relay <devnull+david.ixit.cz@kernel.org>
Date: Wed, 04 Mar 2026 12:05:29 +0100
Subject: [PATCH v4 3/4] arm64: dts: rockchip: Use reference PCIe clock
 generator for BPI-R2-Pro
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260304-rk3568-bri-r2-pro-fix-pcie-v4-3-37abd7ba29d0@ixit.cz>
References: <20260304-rk3568-bri-r2-pro-fix-pcie-v4-0-37abd7ba29d0@ixit.cz>
In-Reply-To: <20260304-rk3568-bri-r2-pro-fix-pcie-v4-0-37abd7ba29d0@ixit.cz>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>, 
 Frank Wunderlich <frank-w@public-files.de>
Cc: Martin Filla <freebsd@sysctl.cz>, 
 Charalampos Mitrodimas <charmitro@posteo.net>, devicetree@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, 
 linux-kernel@vger.kernel.org, David Heidelberg <david@ixit.cz>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=3580; i=david@ixit.cz;
 h=from:subject:message-id;
 bh=qow4qUP3UIWSB18kpm/RoKVGt1Pe1atZ2k7LXtc2JZw=;
 b=owEBbQKS/ZANAwAIAWACP8TTSSByAcsmYgBpqBH5dQ3gPB87fst4g5zWYK+0nDYlwyVSNYcd3
 5c8TJrFEriJAjMEAAEIAB0WIQTXegnP7twrvVOnBHRgAj/E00kgcgUCaagR+QAKCRBgAj/E00kg
 ciYRD/0cu8MG+uMTfJQKXS9CYcxXuoAF+bdGfSLBMYoi6k7r+KLtuehwdjtD5rUyZ4szLNmotBl
 fwm/APb57O22uzO27eeKTmiQpDh03qBRpZBFJuLxb/yKXXVWbpWVbegd0LJx94rDPuqGlT3/O9S
 o/a7wzBBIVf1Kp9/so1mph7eSu2OCQMpNRfLe26OISEGzKUihQJ7CJWoixXS54J0r6gAuqSqk3h
 4hat6TxNtmgwJgCrnEjM2woKGO+XtWTAlavduRSIGPPbYct2XZbkqtxA75llV3gk0t/uRBTDMzj
 du1HJD20ucSpv67qsEQmrsUQgJw+ekvTY4Mb1dzyDSdEUkoIu0mqU5wRUcyOQx9YfG2Bv1CoKPn
 FNsCjlYHwj8jDpB7OKqEhW0O3vwp481StztCFTMqu7MzFUe68rGGFAO3o9wcbtOUsfMN3fIUqmA
 tHUbxLBgFXmeKmZljklNkFgEjC3uyADbHQIpl1Qz60O8MSMWyCDh6hqvI+OEmZt70R8gdue73Fo
 P70nNqz5gtpKS8gMn2l6NEJ/EeigCi4Xg/0mzosVrj4laqUIS20yGl0vYGVzfpieTO27Fk12Nte
 MLi2+AK5CUEVT1VDIeDh57O7fFZqabX1h1TLt3KpQXQs8vxwEgHFmAPXpTp8IwsztQvKr77Ttph
 lSPn72tzpw6o2nA==
X-Developer-Key: i=david@ixit.cz; a=openpgp;
 fpr=D77A09CFEEDC2BBD53A7047460023FC4D3492072
X-Endpoint-Received: by B4 Relay for david@ixit.cz/default with auth_id=355
X-Original-From: David Heidelberg <david@ixit.cz>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260304_030533_287249_512922BD 
X-CRM114-Status: GOOD (  12.19  )
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
Reply-To: david@ixit.cz
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

From: David Heidelberg <david@ixit.cz>

Describe properly PCIe clock, which allow us correct the
topology (removing the vcc3v3-{minipcie,ngff} dependency on pi6c as
supply) and adding the clock dependency in the PCIe nodes.

Suggested-by: Heiko Stuebner <heiko@sntech.de>
Tested-by: Martin Filla <freebsd@sysctl.cz>
Signed-off-by: David Heidelberg <david@ixit.cz>
---
 arch/arm64/boot/dts/rockchip/rk3568-bpi-r2-pro.dts | 47 +++++++++++++++-------
 1 file changed, 33 insertions(+), 14 deletions(-)

diff --git a/arch/arm64/boot/dts/rockchip/rk3568-bpi-r2-pro.dts b/arch/arm64/boot/dts/rockchip/rk3568-bpi-r2-pro.dts
index d02b82c5f979a..3cdea9456a28c 100644
--- a/arch/arm64/boot/dts/rockchip/rk3568-bpi-r2-pro.dts
+++ b/arch/arm64/boot/dts/rockchip/rk3568-bpi-r2-pro.dts
@@ -120,18 +120,13 @@ pcie_refclk_gen: pcie-refclk-gen-clock {
 		clock-frequency = <100000000>;
 	};
 
-	vcc3v3_pi6c_05: regulator-vcc3v3-pi6c-05 {
-		compatible = "regulator-fixed";
-		regulator-name = "vcc3v3_pcie";
-		regulator-min-microvolt = <3300000>;
-		regulator-max-microvolt = <3300000>;
-		enable-active-high;
-		gpios = <&gpio0 RK_PD4 GPIO_ACTIVE_HIGH>;
-		startup-delay-us = <200000>;
-		vin-supply = <&vcc5v0_sys>;
+	pcie_refclk: pcie-refclk-clock {
+		compatible = "gpio-gate-clock";
+		clocks = <&pcie_refclk_gen>;
+		#clock-cells = <0>;
+		enable-gpios = <&gpio0 RK_PD4 GPIO_ACTIVE_HIGH>;
 	};
 
-	/* actually fed by vcc3v3_sys, dependent on pi6c clock generator */
 	vcc3v3_minipcie: regulator-vcc3v3-minipcie {
 		compatible = "regulator-fixed";
 		regulator-name = "vcc3v3_minipcie";
@@ -142,10 +137,9 @@ vcc3v3_minipcie: regulator-vcc3v3-minipcie {
 		pinctrl-names = "default";
 		pinctrl-0 = <&minipcie_enable_h>;
 		startup-delay-us = <50000>;
-		vin-supply = <&vcc3v3_pi6c_05>;
+		vin-supply = <&vcc3v3_sys>;
 	};
 
-	/* actually fed by vcc3v3_sys, dependent on pi6c clock generator */
 	vcc3v3_ngff: regulator-vcc3v3-ngff {
 		compatible = "regulator-fixed";
 		regulator-name = "vcc3v3_ngff";
@@ -156,7 +150,7 @@ vcc3v3_ngff: regulator-vcc3v3-ngff {
 		pinctrl-names = "default";
 		pinctrl-0 = <&ngffpcie_enable_h>;
 		startup-delay-us = <50000>;
-		vin-supply = <&vcc3v3_pi6c_05>;
+		vin-supply = <&vcc3v3_sys>;
 	};
 
 	vcc5v0_usb: regulator-vcc5v0-usb {
@@ -586,12 +580,24 @@ rgmii_phy1: ethernet-phy@0 {
 
 &pcie30phy {
 	data-lanes = <1 2>;
-	phy-supply = <&vcc3v3_pi6c_05>;
+
 	status = "okay";
 };
 
 &pcie3x1 {
 	/* M.2 slot */
+	/*
+	 * The board has a gpio-controlled "pcie_refclk" generator,
+	 * so add it to the list of clocks.
+	 */
+	clocks = <&cru ACLK_PCIE30X1_MST>, <&cru ACLK_PCIE30X1_SLV>,
+		 <&cru ACLK_PCIE30X1_DBI>, <&cru PCLK_PCIE30X1>,
+		 <&cru CLK_PCIE30X1_AUX_NDFT>,
+		 <&cru CLK_PCIE30X1_PIPE_DFT>,
+		 <&pcie_refclk>;
+	clock-names = "aclk_mst", "aclk_slv",
+		      "aclk_dbi", "pclk", "aux",
+		      "pipe", "ref";
 	num-lanes = <1>;
 	pinctrl-names = "default";
 	pinctrl-0 = <&ngffpcie_reset_h>;
@@ -602,6 +608,19 @@ &pcie3x1 {
 
 &pcie3x2 {
 	/* mPCIe slot */
+	/*
+	 * The board has a gpio-controlled "pcie_refclk" generator,
+	 * so add it to the list of clocks.
+	 */
+	clocks = <&cru ACLK_PCIE30X2_MST>, <&cru ACLK_PCIE30X2_SLV>,
+		 <&cru ACLK_PCIE30X2_DBI>, <&cru PCLK_PCIE30X2>,
+		 <&cru CLK_PCIE30X2_AUX_NDFT>,
+		 <&cru CLK_PCIE30X2_PIPE_DFT>,
+		 <&pcie_refclk>;
+	clock-names = "aclk_mst", "aclk_slv",
+		      "aclk_dbi", "pclk", "aux",
+		      "pipe", "ref";
+
 	num-lanes = <1>;
 	pinctrl-names = "default";
 	pinctrl-0 = <&minipcie_reset_h>;

-- 
2.53.0



