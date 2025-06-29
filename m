Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4E5CAC7EE39
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 29 Jun 2025 12:43:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+4GMyTXjbEjmIMha8tHAOUDGLgmtdd/71eUMqcDFjFE=; b=Myj6TUNSSyLlBcwOqg1vymvpaV
	g4q40Wau19T2dNl7TJrJz5vYu5+O8N+6hUZHlAQCWcd8HCOwxOhknXZj/TV+XATmHNZYOlYyQHBtA
	61hEml9fOgHSW3iH1GOkow0MbESorS4kh6CE09eJn5Mkd84aMrtUW29R8qnynpvlLFlaOsOiutA2m
	phLxW4bYMMWTaG3cwu6qEQyTNXTBdk8DwqkPMZJVj6QJvA0XznHEE2blHJ+jPLnO3Qd/wawzDgJxi
	AsdO8+GxQ93EnFFL8WVEAl2GdAQMKVEJQhCIkHr0PJI81+5J9aMdQ3DHAXLFV/7cNaCn4GtTGNZ26
	6frbTLqA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uVrNj-00000000EJz-2Qio;
	Sun, 29 Jun 2025 12:43:39 +0000
Received: from out-184.mta0.migadu.com ([91.218.175.184])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uVrJ7-00000000De3-2wGe
	for linux-arm-kernel@lists.infradead.org;
	Sun, 29 Jun 2025 12:38:55 +0000
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cknow.org; s=key1;
	t=1751200731;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=+4GMyTXjbEjmIMha8tHAOUDGLgmtdd/71eUMqcDFjFE=;
	b=Q0DIzeYThy+fdW9iQmoUBCTSCqUmx24vRGoh8EX8fPGSiiwPnG0qT2pcMMaO2oX2teQCGu
	aaAHqds9HBt8nyOgjixllMCLiM4ZUiwsUdRqsJjR1tpL/INgK/Na953BCmZEN6eQLSKcUj
	VmhjawHhiyrPqmYaai/lDSn22VYXR6H5RzgaDj4YNdUE1KypWOMqqiC76C8cgYCsBwKceD
	Km3dOrx8eW1Vw+oJk25Wo3kBVDNZv5pwgj/rrMy8KKkcSRSmpuCF9UKPr7ybnDlxUA8F+g
	tKRvmLA5U528+dtE1j3SWN66ecuFcQQh29Ax1tB4/SdimR1Win1zmO0lH1DDVw==
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
Subject: [PATCH v3 01/10] arm64: dts: rockchip: Move dsi address+size-cells from SoC to px30 boards
Date: Sun, 29 Jun 2025 14:34:42 +0200
Message-ID: <20250629123840.34948-2-didi.debian@cknow.org>
In-Reply-To: <20250629123840.34948-1-didi.debian@cknow.org>
References: <20250629123840.34948-1-didi.debian@cknow.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250629_053853_875287_A4864828 
X-CRM114-Status: UNSURE (   9.90  )
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

The #address-cells and #size-cells properties are not useful on the DSI
controller node; they are only useful/required on ports and panel(s).
So remove them from the controller node and add them where actually
needed on the various px30 based boards, which includes rk3326.

This fixes the following DTB validation warnings:

  unnecessary #address-cells/#size-cells without "ranges",
  "dma-ranges" or child "reg" property

Signed-off-by: Diederik de Haas <didi.debian@cknow.org>
---
 arch/arm64/boot/dts/rockchip/px30-cobra-ltk050h3146w-a2.dts  | 2 ++
 arch/arm64/boot/dts/rockchip/px30-cobra-ltk050h3146w.dts     | 2 ++
 arch/arm64/boot/dts/rockchip/px30-cobra-ltk050h3148w.dts     | 2 ++
 arch/arm64/boot/dts/rockchip/px30-cobra-ltk500hd1829.dts     | 2 ++
 arch/arm64/boot/dts/rockchip/px30-evb.dts                    | 2 ++
 arch/arm64/boot/dts/rockchip/px30-pp1516-ltk050h3146w-a2.dts | 2 ++
 arch/arm64/boot/dts/rockchip/px30-pp1516-ltk050h3148w.dts    | 2 ++
 arch/arm64/boot/dts/rockchip/px30.dtsi                       | 2 --
 arch/arm64/boot/dts/rockchip/rk3326-anbernic-rg351m.dtsi     | 2 ++
 arch/arm64/boot/dts/rockchip/rk3326-gameforce-chi.dts        | 2 ++
 arch/arm64/boot/dts/rockchip/rk3326-odroid-go.dtsi           | 2 ++
 11 files changed, 20 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/boot/dts/rockchip/px30-cobra-ltk050h3146w-a2.dts b/arch/arm64/boot/dts/rockchip/px30-cobra-ltk050h3146w-a2.dts
index 1d26164be7b8..a31c61c8f148 100644
--- a/arch/arm64/boot/dts/rockchip/px30-cobra-ltk050h3146w-a2.dts
+++ b/arch/arm64/boot/dts/rockchip/px30-cobra-ltk050h3146w-a2.dts
@@ -12,6 +12,8 @@ / {
 };
 
 &dsi {
+	#address-cells = <1>;
+	#size-cells = <0>;
 	status = "okay";
 
 	panel@0 {
diff --git a/arch/arm64/boot/dts/rockchip/px30-cobra-ltk050h3146w.dts b/arch/arm64/boot/dts/rockchip/px30-cobra-ltk050h3146w.dts
index 82c6acdb4fae..a3c6edfdb37c 100644
--- a/arch/arm64/boot/dts/rockchip/px30-cobra-ltk050h3146w.dts
+++ b/arch/arm64/boot/dts/rockchip/px30-cobra-ltk050h3146w.dts
@@ -12,6 +12,8 @@ / {
 };
 
 &dsi {
+	#address-cells = <1>;
+	#size-cells = <0>;
 	status = "okay";
 
 	panel@0 {
diff --git a/arch/arm64/boot/dts/rockchip/px30-cobra-ltk050h3148w.dts b/arch/arm64/boot/dts/rockchip/px30-cobra-ltk050h3148w.dts
index 94449132df38..9b5eff392dfa 100644
--- a/arch/arm64/boot/dts/rockchip/px30-cobra-ltk050h3148w.dts
+++ b/arch/arm64/boot/dts/rockchip/px30-cobra-ltk050h3148w.dts
@@ -12,6 +12,8 @@ / {
 };
 
 &dsi {
+	#address-cells = <1>;
+	#size-cells = <0>;
 	status = "okay";
 
 	panel@0 {
diff --git a/arch/arm64/boot/dts/rockchip/px30-cobra-ltk500hd1829.dts b/arch/arm64/boot/dts/rockchip/px30-cobra-ltk500hd1829.dts
index d7b639e7ccab..36b7cae49e31 100644
--- a/arch/arm64/boot/dts/rockchip/px30-cobra-ltk500hd1829.dts
+++ b/arch/arm64/boot/dts/rockchip/px30-cobra-ltk500hd1829.dts
@@ -16,6 +16,8 @@ aliases {
 };
 
 &dsi {
+	#address-cells = <1>;
+	#size-cells = <0>;
 	status = "okay";
 
 	panel@0 {
diff --git a/arch/arm64/boot/dts/rockchip/px30-evb.dts b/arch/arm64/boot/dts/rockchip/px30-evb.dts
index bfd724b73c9a..85d1642eb9be 100644
--- a/arch/arm64/boot/dts/rockchip/px30-evb.dts
+++ b/arch/arm64/boot/dts/rockchip/px30-evb.dts
@@ -124,6 +124,8 @@ &display_subsystem {
 };
 
 &dsi {
+	#address-cells = <1>;
+	#size-cells = <0>;
 	status = "okay";
 
 	ports {
diff --git a/arch/arm64/boot/dts/rockchip/px30-pp1516-ltk050h3146w-a2.dts b/arch/arm64/boot/dts/rockchip/px30-pp1516-ltk050h3146w-a2.dts
index b71929bcb33e..932721ffd470 100644
--- a/arch/arm64/boot/dts/rockchip/px30-pp1516-ltk050h3146w-a2.dts
+++ b/arch/arm64/boot/dts/rockchip/px30-pp1516-ltk050h3146w-a2.dts
@@ -12,6 +12,8 @@ / {
 };
 
 &dsi {
+	#address-cells = <1>;
+	#size-cells = <0>;
 	status = "okay";
 
 	panel@0 {
diff --git a/arch/arm64/boot/dts/rockchip/px30-pp1516-ltk050h3148w.dts b/arch/arm64/boot/dts/rockchip/px30-pp1516-ltk050h3148w.dts
index a9bd5936c701..70adf091371c 100644
--- a/arch/arm64/boot/dts/rockchip/px30-pp1516-ltk050h3148w.dts
+++ b/arch/arm64/boot/dts/rockchip/px30-pp1516-ltk050h3148w.dts
@@ -12,6 +12,8 @@ / {
 };
 
 &dsi {
+	#address-cells = <1>;
+	#size-cells = <0>;
 	status = "okay";
 
 	panel@0 {
diff --git a/arch/arm64/boot/dts/rockchip/px30.dtsi b/arch/arm64/boot/dts/rockchip/px30.dtsi
index 0cad83c5d5fe..5034ad8019a8 100644
--- a/arch/arm64/boot/dts/rockchip/px30.dtsi
+++ b/arch/arm64/boot/dts/rockchip/px30.dtsi
@@ -1137,8 +1137,6 @@ dsi: dsi@ff450000 {
 		resets = <&cru SRST_MIPIDSI_HOST_P>;
 		reset-names = "apb";
 		rockchip,grf = <&grf>;
-		#address-cells = <1>;
-		#size-cells = <0>;
 		status = "disabled";
 
 		ports {
diff --git a/arch/arm64/boot/dts/rockchip/rk3326-anbernic-rg351m.dtsi b/arch/arm64/boot/dts/rockchip/rk3326-anbernic-rg351m.dtsi
index 150fadcb0b3c..54395a40b087 100644
--- a/arch/arm64/boot/dts/rockchip/rk3326-anbernic-rg351m.dtsi
+++ b/arch/arm64/boot/dts/rockchip/rk3326-anbernic-rg351m.dtsi
@@ -118,6 +118,8 @@ &display_subsystem {
 };
 
 &dsi {
+	#address-cells = <1>;
+	#size-cells = <0>;
 	status = "okay";
 
 	ports {
diff --git a/arch/arm64/boot/dts/rockchip/rk3326-gameforce-chi.dts b/arch/arm64/boot/dts/rockchip/rk3326-gameforce-chi.dts
index 10e6ab724ac4..4d306085646c 100644
--- a/arch/arm64/boot/dts/rockchip/rk3326-gameforce-chi.dts
+++ b/arch/arm64/boot/dts/rockchip/rk3326-gameforce-chi.dts
@@ -322,6 +322,8 @@ &display_subsystem {
 };
 
 &dsi {
+	#address-cells = <1>;
+	#size-cells = <0>;
 	status = "okay";
 
 	internal_display: panel@0 {
diff --git a/arch/arm64/boot/dts/rockchip/rk3326-odroid-go.dtsi b/arch/arm64/boot/dts/rockchip/rk3326-odroid-go.dtsi
index 446a1a6c12e7..bf4554eff47d 100644
--- a/arch/arm64/boot/dts/rockchip/rk3326-odroid-go.dtsi
+++ b/arch/arm64/boot/dts/rockchip/rk3326-odroid-go.dtsi
@@ -220,6 +220,8 @@ &display_subsystem {
 };
 
 &dsi {
+	#address-cells = <1>;
+	#size-cells = <0>;
 	status = "okay";
 
 	ports {
-- 
2.50.0


