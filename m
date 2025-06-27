Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5EE54C83013
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 27 Jun 2025 15:54:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=IvcxkrvBiBUkVTTSTfgCGQwPzHmN5OZ3q178klwKd4g=; b=eRYSjyjrW/ilppT4qPUKML6V28
	Nac03RrdkpGSy2/sDVlDzMiTsg1eBntckaWgHHykdgb6xQdfE1dDT5ckFGyuflfyPqHFaQd3ukMqS
	AjjAbwZnWP2tC46tBZVL5rxPBwRbAgjXOcNVvTzvGbyyHtsiA9sJ3csPkwfuEFr9IqGk7C8qNIbt1
	wmh7zvEQP7Rt/yaxT3mEuZgySugFpRX9gNCPopQuLTm06CRbl6EJa0KiBLe6vcMsyDtBIuuqCz8QR
	eo+y6nRTI7FE6vrTKXJaov/LuCd5rdOm9LXiP6CCbKwoHdae/F0rUl40baMM4YerOTzGM5h/s9VY9
	eiaAUiQA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uVBOz-0000000FBDR-1H2v;
	Fri, 27 Jun 2025 15:54:09 +0000
Received: from out-174.mta0.migadu.com ([2001:41d0:1004:224b::ae])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uVAyt-0000000F66e-12eB
	for linux-arm-kernel@lists.infradead.org;
	Fri, 27 Jun 2025 15:27:12 +0000
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cknow.org; s=key1;
	t=1751038029;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=IvcxkrvBiBUkVTTSTfgCGQwPzHmN5OZ3q178klwKd4g=;
	b=AIoHMfXxYuQewBtQ1iiyF+ABi0Xj3b9khQOMIergAB2mRQZ/+1xwoBr8y5pemFTMgZR39Z
	+JA+u4WUUS4/4S6n9Lo+1EjwWN5yQYHUJ20ds82aGtgZ2Te0G3bGFYW0z63svQ1T1axVFC
	kOXtYGOMTbXsypYd/vY8bNePXOpDnyYeym4SMabwxbLD2H+4SUsAj+4Ld31ErEPl54QWBB
	pWqk+hw+Sq/VSddKLaNMEzb8UByOtsY3pXuXd1gIf1yGP5OEU+aVgbuQRlTJjbvWIgYFS2
	siUelEdBXyjSQLac4PKcUeL0KBZ7YIB6dfhVrLYp8eEUFksCXYSEHiJmmlycnA==
From: Diederik de Haas <didi.debian@cknow.org>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Heiko Stuebner <heiko@sntech.de>
Cc: Dragan Simic <dsimic@manjaro.org>,
	Quentin Schulz <quentin.schulz@cherry.de>,
	Johan Jonker <jbx6244@gmail.com>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Diederik de Haas <didi.debian@cknow.org>
Subject: [PATCH 2/8] arm64: dts: rockchip: Refactor DSI nodes on rk3399 boards
Date: Fri, 27 Jun 2025 17:16:21 +0200
Message-ID: <20250627152645.740981-3-didi.debian@cknow.org>
In-Reply-To: <20250627152645.740981-1-didi.debian@cknow.org>
References: <20250627152645.740981-1-didi.debian@cknow.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250627_082711_570744_268E4BB6 
X-CRM114-Status: GOOD (  13.27  )
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

The #address-cells and #size-cells properties are not useful on the DSI
controller nodes; they are only useful/required on ports and panel(s).
So remove them from the controller node and add them where actually
needed on the various rk3399 based boards.

Next to that, there were several (exact) redefinitions of nodes which
are already present in rk3399-base.dtsi to add a mipi_out endpoint.
Simplify that by referencing the mipi_out phandle and add the endpoint
to that, which allows the removeal of the ports redefinition.

And fix 1 instance where the mipi_out referenced node was not sorted
correctly.

This fixes the following DTB validation warnings:

  unnecessary #address-cells/#size-cells without "ranges",
  "dma-ranges" or child "reg" property

Signed-off-by: Diederik de Haas <didi.debian@cknow.org>
---
 arch/arm64/boot/dts/rockchip/rk3399-base.dtsi |  4 ---
 .../boot/dts/rockchip/rk3399-gru-scarlet.dtsi | 30 ++++++++-----------
 .../dts/rockchip/rk3399-pinephone-pro.dts     |  2 ++
 .../rk3399-puma-haikou-video-demo.dtso        | 12 ++++----
 .../dts/rockchip/rk3399-rockpro64-screen.dtso | 21 ++++---------
 5 files changed, 26 insertions(+), 43 deletions(-)

diff --git a/arch/arm64/boot/dts/rockchip/rk3399-base.dtsi b/arch/arm64/boot/dts/rockchip/rk3399-base.dtsi
index 9d5f5b083e3c..4dcceb9136b7 100644
--- a/arch/arm64/boot/dts/rockchip/rk3399-base.dtsi
+++ b/arch/arm64/boot/dts/rockchip/rk3399-base.dtsi
@@ -2071,8 +2071,6 @@ mipi_dsi: dsi@ff960000 {
 		resets = <&cru SRST_P_MIPI_DSI0>;
 		reset-names = "apb";
 		rockchip,grf = <&grf>;
-		#address-cells = <1>;
-		#size-cells = <0>;
 		status = "disabled";
 
 		ports {
@@ -2112,8 +2110,6 @@ mipi_dsi1: dsi@ff968000 {
 		resets = <&cru SRST_P_MIPI_DSI1>;
 		reset-names = "apb";
 		rockchip,grf = <&grf>;
-		#address-cells = <1>;
-		#size-cells = <0>;
 		#phy-cells = <0>;
 		status = "disabled";
 
diff --git a/arch/arm64/boot/dts/rockchip/rk3399-gru-scarlet.dtsi b/arch/arm64/boot/dts/rockchip/rk3399-gru-scarlet.dtsi
index 5e068377a0a2..100c22af7265 100644
--- a/arch/arm64/boot/dts/rockchip/rk3399-gru-scarlet.dtsi
+++ b/arch/arm64/boot/dts/rockchip/rk3399-gru-scarlet.dtsi
@@ -627,18 +627,10 @@ &mipi_dphy_rx0 {
 };
 
 &mipi_dsi {
-	status = "okay";
 	clock-master;
-
-	ports {
-		mipi_out: port@1 {
-			reg = <1>;
-
-			mipi_out_panel: endpoint {
-				remote-endpoint = <&mipi_in_panel>;
-			};
-		};
-	};
+	#address-cells = <1>;
+	#size-cells = <0>;
+	status = "okay";
 
 	mipi_panel: panel@0 {
 		/* 2 different panels are used, compatibles are in dts files */
@@ -673,15 +665,17 @@ mipi1_in_panel: endpoint {
 
 &mipi_dsi1 {
 	status = "okay";
+};
 
-	ports {
-		mipi1_out: port@1 {
-			reg = <1>;
+&mipi_out {
+	mipi_out_panel: endpoint {
+		remote-endpoint = <&mipi_in_panel>;
+	};
+};
 
-			mipi1_out_panel: endpoint {
-				remote-endpoint = <&mipi1_in_panel>;
-			};
-		};
+&mipi1_out {
+	mipi1_out_panel: endpoint {
+		remote-endpoint = <&mipi1_in_panel>;
 	};
 };
 
diff --git a/arch/arm64/boot/dts/rockchip/rk3399-pinephone-pro.dts b/arch/arm64/boot/dts/rockchip/rk3399-pinephone-pro.dts
index 909ed14035f7..fe32937a2d16 100644
--- a/arch/arm64/boot/dts/rockchip/rk3399-pinephone-pro.dts
+++ b/arch/arm64/boot/dts/rockchip/rk3399-pinephone-pro.dts
@@ -464,6 +464,8 @@ &io_domains {
 
 &mipi_dsi {
 	clock-master;
+	#address-cells = <1>;
+	#size-cells = <0>;
 	status = "okay";
 
 	panel@0 {
diff --git a/arch/arm64/boot/dts/rockchip/rk3399-puma-haikou-video-demo.dtso b/arch/arm64/boot/dts/rockchip/rk3399-puma-haikou-video-demo.dtso
index 0377ec860d35..d28880b8dd44 100644
--- a/arch/arm64/boot/dts/rockchip/rk3399-puma-haikou-video-demo.dtso
+++ b/arch/arm64/boot/dts/rockchip/rk3399-puma-haikou-video-demo.dtso
@@ -124,12 +124,6 @@ pca9670: gpio@27 {
 	};
 };
 
-&mipi_out {
-	mipi_out_panel: endpoint {
-		remote-endpoint = <&mipi_in_panel>;
-	};
-};
-
 &mipi_dsi {
 	#address-cells = <1>;
 	#size-cells = <0>;
@@ -151,6 +145,12 @@ mipi_in_panel: endpoint {
 	};
 };
 
+&mipi_out {
+	mipi_out_panel: endpoint {
+		remote-endpoint = <&mipi_in_panel>;
+	};
+};
+
 &pinctrl {
 	pca9670 {
 		pca9670_resetn: pca9670-resetn {
diff --git a/arch/arm64/boot/dts/rockchip/rk3399-rockpro64-screen.dtso b/arch/arm64/boot/dts/rockchip/rk3399-rockpro64-screen.dtso
index b1f4ab22b99c..3a68c5f7c5ff 100644
--- a/arch/arm64/boot/dts/rockchip/rk3399-rockpro64-screen.dtso
+++ b/arch/arm64/boot/dts/rockchip/rk3399-rockpro64-screen.dtso
@@ -47,25 +47,11 @@ touch: touchscreen@5d {
 };
 
 &mipi_dsi {
+	clock-master;
 	#address-cells = <1>;
 	#size-cells = <0>;
-
-	clock-master;
 	status = "okay";
 
-	ports {
-		#address-cells = <1>;
-		#size-cells = <0>;
-
-		mipi_out: port@1 {
-			reg = <1>;
-
-			mipi_out_panel: endpoint {
-				remote-endpoint = <&mipi_in_panel>;
-			};
-		};
-	};
-
 	mipi_panel: panel@0 {
 		compatible = "feiyang,fy07024di26a30d";
 		reg = <0>;
@@ -81,6 +67,11 @@ mipi_in_panel: endpoint {
 	};
 };
 
+&mipi_out {
+	mipi_out_panel: endpoint {
+		remote-endpoint = <&mipi_in_panel>;
+	};
+}
 &pwm0 {
 	status = "okay";
 };
-- 
2.50.0


