Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 35F16D778B0
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 23 Jan 2026 19:23:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/CGpooU2LDMiXX8LdoN5mSwCKLStr/bwD/OHt3AEqOY=; b=41SCr2p1TT460VKdE5ddx2w4Tn
	zCmgc549JSJHo8ZVmDv9IHCMX2hc8p3tLhKbcTTk2dmegdgfP3GytrfPF/5RHiyro0rJAPZnRTerg
	44nOllh/wjZVfcbCIEfJq+O8UmBF3iyPqkrbwJeV7scLKZ7kp2AF921ZJPa9ZaAXY7ZKdkkG32a/0
	k1RYfN6xP/TQkX3+JsRaWDFxjz8XBK47Vh4aBZKr+EMhxDhn3ruboMC9Be/W3NiEko9lxb/M8r5HT
	k1sHitRS3iRc58xIgCyispiZUIDVZTOmcIvcQlseUvjwyGo21ZUMpGsZl8pkV1K1IIzQ+6twlq19Q
	HFq486lg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vjMkB-00000009PVw-0blO;
	Fri, 23 Jan 2026 19:22:55 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vjMk3-00000009PQD-0TCd;
	Fri, 23 Jan 2026 19:22:48 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id B980A1515;
	Fri, 23 Jan 2026 11:22:39 -0800 (PST)
Received: from 010265703453.arm.com (unknown [10.57.51.35])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 622F03F632;
	Fri, 23 Jan 2026 11:22:44 -0800 (PST)
From: Robin Murphy <robin.murphy@arm.com>
To: heiko@sntech.de,
	neil.armstrong@linaro.org,
	dianders@chromium.org,
	thierry.reding@gmail.com,
	sam@ravnborg.org
Cc: jesszhan0024@gmail.com,
	dri-devel@lists.freedesktop.org,
	linux-rockchip@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	Dragan Simic <dsimic@manjaro.org>
Subject: [PATCH v2 3/4] arm64: dts: rockchip: Move RK3399 eDP pinctrl to boards
Date: Fri, 23 Jan 2026 19:22:22 +0000
Message-Id: <c7d972d07875241805db8659305b26bd694867d4.1769191673.git.robin.murphy@arm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1769191673.git.robin.murphy@arm.com>
References: <cover.1769191673.git.robin.murphy@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260123_112247_188110_6793C3F1 
X-CRM114-Status: GOOD (  10.32  )
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

The EDP_HOTPLUG pin is optional, and muxed with other functions (notably
HDMI CEC), so move its selection from the SoC DTSI to the boards which
apparently want it, namely those which enable eDP without "force-hpd".
By the same token we drop it from Pinebook Pro, which already uses
"force-hpd", and according to the schematics does not have the pin wired
at all.

Reviewed-by: Dragan Simic <dsimic@manjaro.org>
Signed-off-by: Robin Murphy <robin.murphy@arm.com>
---
v2: Add /omit-if-no-ref/ attribute [Dragan]
---
 arch/arm64/boot/dts/rockchip/rk3399-base.dtsi              | 3 +--
 arch/arm64/boot/dts/rockchip/rk3399-gru-chromebook.dtsi    | 2 ++
 arch/arm64/boot/dts/rockchip/rk3399-pinebook-pro.dts       | 2 --
 arch/arm64/boot/dts/rockchip/rk3399-sapphire-excavator.dts | 2 ++
 4 files changed, 5 insertions(+), 4 deletions(-)

diff --git a/arch/arm64/boot/dts/rockchip/rk3399-base.dtsi b/arch/arm64/boot/dts/rockchip/rk3399-base.dtsi
index 4dcceb9136b7..49c68fe65de6 100644
--- a/arch/arm64/boot/dts/rockchip/rk3399-base.dtsi
+++ b/arch/arm64/boot/dts/rockchip/rk3399-base.dtsi
@@ -2145,8 +2145,6 @@ edp: dp@ff970000 {
 		interrupts = <GIC_SPI 10 IRQ_TYPE_LEVEL_HIGH 0>;
 		clocks = <&cru PCLK_EDP>, <&cru PCLK_EDP_CTRL>, <&cru PCLK_VIO_GRF>;
 		clock-names = "dp", "pclk", "grf";
-		pinctrl-names = "default";
-		pinctrl-0 = <&edp_hpd>;
 		power-domains = <&power RK3399_PD_EDP>;
 		resets = <&cru SRST_P_EDP_CTRL>;
 		reset-names = "dp";
@@ -2384,6 +2382,7 @@ cif_clkouta: cif-clkouta {
 		};
 
 		edp {
+			/omit-if-no-ref/
 			edp_hpd: edp-hpd {
 				rockchip,pins =
 					<4 RK_PC7 2 &pcfg_pull_none>;
diff --git a/arch/arm64/boot/dts/rockchip/rk3399-gru-chromebook.dtsi b/arch/arm64/boot/dts/rockchip/rk3399-gru-chromebook.dtsi
index 9d07353df52c..3f3cb0eb5809 100644
--- a/arch/arm64/boot/dts/rockchip/rk3399-gru-chromebook.dtsi
+++ b/arch/arm64/boot/dts/rockchip/rk3399-gru-chromebook.dtsi
@@ -241,6 +241,8 @@ &dmc {
 };
 
 &edp {
+	pinctrl-names = "default";
+	pinctrl-0 = <&edp_hpd>;
 	status = "okay";
 
 	/*
diff --git a/arch/arm64/boot/dts/rockchip/rk3399-pinebook-pro.dts b/arch/arm64/boot/dts/rockchip/rk3399-pinebook-pro.dts
index eaaca08a7601..dcab04863d28 100644
--- a/arch/arm64/boot/dts/rockchip/rk3399-pinebook-pro.dts
+++ b/arch/arm64/boot/dts/rockchip/rk3399-pinebook-pro.dts
@@ -401,8 +401,6 @@ &cpu_l3 {
 
 &edp {
 	force-hpd;
-	pinctrl-names = "default";
-	pinctrl-0 = <&edp_hpd>;
 	status = "okay";
 };
 
diff --git a/arch/arm64/boot/dts/rockchip/rk3399-sapphire-excavator.dts b/arch/arm64/boot/dts/rockchip/rk3399-sapphire-excavator.dts
index a4ceafe6dd7a..80d6ea0eda84 100644
--- a/arch/arm64/boot/dts/rockchip/rk3399-sapphire-excavator.dts
+++ b/arch/arm64/boot/dts/rockchip/rk3399-sapphire-excavator.dts
@@ -141,6 +141,8 @@ sdio_pwrseq: sdio-pwrseq {
 };
 
 &edp {
+	pinctrl-names = "default";
+	pinctrl-0 = <&edp_hpd>;
 	status = "okay";
 };
 
-- 
2.34.1


