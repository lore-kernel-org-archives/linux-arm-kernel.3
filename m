Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3F6B8E77197
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  7 Jan 2025 14:10:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=u+m2gfDVhQV2u3o7sl05GzerTgcPQ9MIYG1lSSy1s58=; b=TgWPWwtP+I9Job3+3wnaB6pm+2
	LdE7x0FgzX+5R6nuRotEfyYRU1Gx3H8E0uBhMPyu3ERQuFr5/B0+Ag6RgMjfU9zii1kCBzrUdvsjM
	ThZYzr5z945TPwIZbcvq4FcroEvlgOXgP4kl79LFaWEkHbof1IR2P/AHE+6p/5iJ9KV9SWuDZJioY
	1EAuYA673fHN+gkDMIRfPqCdpxtefrz/EHaxCGK032ZZdIOH6zwbF1RkW+6rVT6lyDJU/sbEKMco9
	ZNYWxSiRc8BRKYyK1jZD/lSZOhg0mRfrrEQULD9MzzHdU1hz7C5tgGvnVFsN5tXR03cbCrJqOR32u
	lWUBG37Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tVAHD-000000057Xp-0UnU;
	Tue, 07 Jan 2025 14:09:47 +0000
Received: from mx1.tq-group.com ([93.104.207.81])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tVA9V-000000055aa-1ZPx
	for linux-arm-kernel@lists.infradead.org;
	Tue, 07 Jan 2025 14:01:51 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
  t=1736258509; x=1767794509;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=u+m2gfDVhQV2u3o7sl05GzerTgcPQ9MIYG1lSSy1s58=;
  b=LSqihZ5+Pq/0fx/27/A3FYdeezBUvP5f52Msg0/r7v+HsKR5FKXR3HWe
   fYn5vH5G6ecAYh7qyUDALQlPRF6XbwhdFT5Umgx4jPeHDlEbPYJo8f/lP
   V4AuMNPcy/cw3uPocTbTQ+Y4ZP/42eziDrK8dJ9RRNTmMDbD2/nD+jXg7
   egOWIIPTXABPD/xWSO71YyRuNmRe9i69BZNCx3vg1ZINtHOoOsssWyrU4
   VOTUOrwsYB6bMCAoW8EonpBsGaSgkaQfalyKdIyAQoqxJYYV8gHYbAsE5
   hDvFNwPLFDuKlf9zrydlBjx7FhGKlRhRLADOfpQKQrLF6uMnAu8ki0xg7
   w==;
X-CSE-ConnectionGUID: g2Lg8GdfQIuZbOlKyGRR7g==
X-CSE-MsgGUID: YD7ho+dbTQWHox3vQoozww==
X-IronPort-AV: E=Sophos;i="6.12,295,1728943200"; 
   d="scan'208";a="40896230"
Received: from vmailcow01.tq-net.de ([10.150.86.48])
  by mx1.tq-group.com with ESMTP; 07 Jan 2025 15:01:47 +0100
X-CheckPoint: {677D33CB-3C-1CE016C0-E589DA3E}
X-MAIL-CPID: FD2C55157575331A5F84E96D4CD20098_1
X-Control-Analysis: str=0001.0A682F1E.677D33CB.00BC,ss=1,re=0.000,recu=0.000,reip=0.000,cl=1,cld=1,fgs=0
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 8325A164BC3;
	Tue,  7 Jan 2025 15:01:42 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ew.tq-group.com;
	s=dkim; t=1736258503;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=u+m2gfDVhQV2u3o7sl05GzerTgcPQ9MIYG1lSSy1s58=;
	b=HGdfjwK4NDupW3qBR5pTl8OrOgU6T00bOwteSkxdhpojr8EqQ/3V6bV9fO6kb9kn306E48
	VUJzpDOidwafTM0ONOsX3sCTzFiSThWLJ+XwczzL8gZjLIlLQM239CO6SAEK26ibjqGU7I
	YuvT+Z/XAqY5ZHq82SJfvsPTujLJ0J0ZGewFtcOttXR08ZX9C4m0iLGYNRADDmSu6YPY/x
	qiFeQ1s9y2EbxkbFs5oCkmrWa4OKVC+OCTzDoggIU3KxEviAeJV0rnfVNzm2g6VfDutF5k
	EIDW/n5uId3Ibhng+eCWDXF2qN9XlzWCsFpcH7OwG6+tYl1WyhkqnDP4cU71kg==
From: Alexander Stein <alexander.stein@ew.tq-group.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>
Cc: Alexander Stein <alexander.stein@ew.tq-group.com>,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux@ew.tq-group.com
Subject: [PATCH 5/5] arm64: dts: mba8xx: Add PCIe support
Date: Tue,  7 Jan 2025 15:01:10 +0100
Message-Id: <20250107140110.982215-6-alexander.stein@ew.tq-group.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250107140110.982215-1-alexander.stein@ew.tq-group.com>
References: <20250107140110.982215-1-alexander.stein@ew.tq-group.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250107_060149_722944_01E6C097 
X-CRM114-Status: GOOD (  12.40  )
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

Add PCIe support for TQMa8Xx on MBa8Xx board.

Signed-off-by: Alexander Stein <alexander.stein@ew.tq-group.com>
---
 arch/arm64/boot/dts/freescale/mba8xx.dtsi | 32 +++++++++++++++++++----
 1 file changed, 27 insertions(+), 5 deletions(-)

diff --git a/arch/arm64/boot/dts/freescale/mba8xx.dtsi b/arch/arm64/boot/dts/freescale/mba8xx.dtsi
index 276d1683b03bb..117f657283191 100644
--- a/arch/arm64/boot/dts/freescale/mba8xx.dtsi
+++ b/arch/arm64/boot/dts/freescale/mba8xx.dtsi
@@ -36,6 +36,13 @@ chosen {
 		stdout-path = &lpuart1;
 	};
 
+	/* Non-controllable PCIe reference clock generator */
+	pcie_refclk: clock-pcie-ref {
+		compatible = "fixed-clock";
+		#clock-cells = <0>;
+		clock-frequency = <100000000>;
+	};
+
 	gpio-keys {
 		compatible = "gpio-keys";
 		pinctrl-names = "default";
@@ -208,6 +215,12 @@ &flexcan2 {
 	status = "okay";
 };
 
+&hsio_phy {
+	fsl,hsio-cfg = "pciea-x2-pcieb";
+	fsl,refclk-pad-mode = "input";
+	status = "okay";
+};
+
 &i2c1 {
 	tlv320aic3x04: audio-codec@18 {
 		compatible = "ti,tlv320aic32x4";
@@ -309,7 +322,16 @@ &lsio_gpio3 {
 			  "", "", "", "";
 };
 
-/* TODO: Mini-PCIe */
+&pcieb {
+	phys = <&hsio_phy 0 PHY_TYPE_PCIE 0>;
+	phy-names = "pcie-phy";
+	pinctrl-0 = <&pinctrl_pcieb>;
+	pinctrl-names = "default";
+	reset-gpios = <&lsio_gpio4 0 GPIO_ACTIVE_LOW>;
+	disable-gpio = <&expander 7 GPIO_ACTIVE_LOW>;
+	vpcie-supply = <&reg_pcie_1v5>;
+	status = "okay";
+};
 
 &sai1 {
 	assigned-clocks = <&clk IMX_SC_R_AUDIO_PLL_0 IMX_SC_PM_CLK_PLL>,
@@ -467,10 +489,10 @@ pinctrl_pca9538: pca9538grp {
 		fsl,pins = <IMX8QXP_USDHC1_RESET_B_LSIO_GPIO4_IO19	0x00000020>;
 	};
 
-	pinctrl_pcieb: pcieagrp {
-		fsl,pins = <IMX8QXP_PCIE_CTRL0_PERST_B_LSIO_GPIO4_IO00	0x06000041>,
-			   <IMX8QXP_PCIE_CTRL0_CLKREQ_B_LSIO_GPIO4_IO01	0x06000041>,
-			   <IMX8QXP_PCIE_CTRL0_WAKE_B_LSIO_GPIO4_IO02	0x04000041>;
+	pinctrl_pcieb: pciebgrp {
+		fsl,pins = <IMX8QXP_PCIE_CTRL0_PERST_B_LSIO_GPIO4_IO00		0x06000041>,
+			   <IMX8QXP_PCIE_CTRL0_CLKREQ_B_HSIO_PCIE0_CLKREQ_B	0x06000041>,
+			   <IMX8QXP_PCIE_CTRL0_WAKE_B_LSIO_GPIO4_IO02		0x04000041>;
 	};
 
 	pinctrl_reg_pcie_1v5: regpcie1v5grp {
-- 
2.34.1


