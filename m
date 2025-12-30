Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 87289EE4992
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 30 Dec 2025 17:21:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Lo0jxq/Gs1eJVsVav6/dPs+/WCk7HmreQwdL9vi2dcY=; b=NMRz/JYTonaIh2dchAarUT/5de
	dpSUU5Rn82QvoTv77vpJDs0oTe/ivKtOCnQLMyPUtH/c3WFTek4QhT6JS4JxGUbo3JoeUV+8OSgEl
	eliSj0JlmPcVIDOdY1nviNqaEXGWGQEgifV0zT3duSh5b461jHFx3cpkfMb2PDQZPXvxsArVt2SJT
	mzhS4Ig5qW+J1UtWbcADSwtZl33fl0J0PwhhBn74kFLtwKM37ymmekolx4g3EMTKL8PacfRm3tgS4
	dxrxeiI6fg5ishCtRFMvq22+7nJ8eeyNEO2wrIBP/4mUgewXoHoSikHPmgD2Mrf58lNSh3mD+ynUh
	8CF92j5Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vadP7-000000056rs-0ubV;
	Tue, 30 Dec 2025 17:21:05 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vadOz-000000056pn-3fSL;
	Tue, 30 Dec 2025 17:21:01 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 2A44615A1;
	Tue, 30 Dec 2025 09:20:50 -0800 (PST)
Received: from 010265703453.localdomain (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 384443F63F;
	Tue, 30 Dec 2025 09:20:55 -0800 (PST)
From: Robin Murphy <robin.murphy@arm.com>
To: heiko@sntech.de,
	neil.armstrong@linaro.org,
	dianders@chromium.org,
	thierry.reding@gmail.com,
	sam@ravnborg.org
Cc: jesszhan0024@gmail.com,
	dri-devel@lists.freedesktop.org,
	linux-rockchip@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH 3/4] arm64: dts: rockchip: Move RK3399 eDP pinctrl to boards
Date: Tue, 30 Dec 2025 17:20:33 +0000
Message-Id: <0b9488badb467ef83a0a464eeea921f59e32e6b0.1767111809.git.robin.murphy@arm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1767111804.git.robin.murphy@arm.com>
References: <cover.1767111804.git.robin.murphy@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251230_092058_866360_CD96893F 
X-CRM114-Status: GOOD (  10.01  )
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

Signed-off-by: Robin Murphy <robin.murphy@arm.com>
---
 arch/arm64/boot/dts/rockchip/rk3399-base.dtsi              | 2 --
 arch/arm64/boot/dts/rockchip/rk3399-gru-chromebook.dtsi    | 2 ++
 arch/arm64/boot/dts/rockchip/rk3399-pinebook-pro.dts       | 2 --
 arch/arm64/boot/dts/rockchip/rk3399-sapphire-excavator.dts | 2 ++
 4 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/arch/arm64/boot/dts/rockchip/rk3399-base.dtsi b/arch/arm64/boot/dts/rockchip/rk3399-base.dtsi
index 4dcceb9136b7..19a312baa9f1 100644
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


