Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CF04CC83026
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 28 Jun 2025 14:52:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+4GMyTXjbEjmIMha8tHAOUDGLgmtdd/71eUMqcDFjFE=; b=yrI8XdyLv5Mmv66ml1aoDqfrhb
	/hmt2uqWh5Gty67U767OKrvyYDRmFefTex1Ftcv2Yqjzvx20ko1HC38Vx+gNuQEkNKyDyaGmJZcHb
	qtsh08qrnqFuCxU5hftz68qagYhhHywMi3z6bWixA7kD5UPpdV+cjQX3S6V9kmC0tK+2EC6mMH2CQ
	HNCr3bslBCQxBY2g3v8+qtTu5EmVGALQNReggUoQe3+83K80tx00gxn4woEF9C3sNn5N712Gy82NE
	vKtIy+/pVSjoA7ii11Tv6M6qKCp0+cTIasib9CvRJ79b1m+LEPch4XmGQ8qFrfa2cd+V4KlsJLNai
	rtBDkKXw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uVWuJ-0000000GuVT-2HwT;
	Sat, 28 Jun 2025 14:51:55 +0000
Received: from out-185.mta0.migadu.com ([2001:41d0:1004:224b::b9])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uVWry-0000000Gtzp-0CVK
	for linux-arm-kernel@lists.infradead.org;
	Sat, 28 Jun 2025 14:49:31 +0000
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cknow.org; s=key1;
	t=1751122165;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=+4GMyTXjbEjmIMha8tHAOUDGLgmtdd/71eUMqcDFjFE=;
	b=yRzplfGayTSkrKyIb5KIROLK53txh1ddkfXu2FLBTpAeZRBjra80H6IH81seUYy4nien4j
	Io1zsnI54C+2ghWLFlff5IPmyx0TLJA27C8hW6PlGLs1JLBy07R2l4wSw9J/psgx8nqUZE
	b8Xfx7CL+1FK9AQzTQMSiqlsDXaki2AsZLG42k3TkJ97L5Ljvd71q0SldputpRbZMpXMDY
	rKF/1pZ/kPbkZYPCDCZYqyjc3tA+1OBtH9Apcq/8KiGetoDnoEijSJlvwXFtTJ9SkvlR9R
	8mKGndAKgbFVs4bQQ/36hxenNg1o7rWevCRWb7xRVS2nywsS7EKw7H0MjgAHKg==
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
Subject: [PATCH v2 01/10] arm64: dts: rockchip: Move dsi address+size-cells from SoC to px30 boards
Date: Sat, 28 Jun 2025 16:32:35 +0200
Message-ID: <20250628144915.839338-2-didi.debian@cknow.org>
In-Reply-To: <20250628144915.839338-1-didi.debian@cknow.org>
References: <20250628144915.839338-1-didi.debian@cknow.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250628_074930_358735_E359273D 
X-CRM114-Status: UNSURE (   9.95  )
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


