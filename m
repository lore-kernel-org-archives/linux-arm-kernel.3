Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8B380E77188
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 20 Dec 2024 16:34:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=2l7F3pjuoDH3GKZ6bPXFtH3xTXOQ8g8lc//roM40EcA=; b=fFd5oMzvGUe15gLDRA5xw3qBX9
	M4zMT3p2speA87cZUFFUZiMuOHFqnGz+EGzQ7Y0mvSr0u4LngKv4qRD9JFqXkkUGU2BNS2cFfgK5b
	NcfhwnzI3Jiez9esOObysUYgBxPIZBTMRgcnJK4HKiQHVnIETBuBGTWFHZndT7JgBqBZ3Zf//Td/p
	DjyD+gQegDEg1J6SFt/mxeNat2WX0YHlK2WsgwHwGn6mkIjDGlc+K5fBd+LuihG3y2JCyxhXx1GXg
	vzmD6vuRFoq82+ushXJZr5vxya4ee0BY/Lt5IP9PeIkIMg59qc3P2NUvi7mm0p+bFeX2MkBuU7jlA
	xU+IwBww==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tOfwx-00000005Tg5-1eGs;
	Fri, 20 Dec 2024 16:34:03 +0000
Received: from mail-wr1-x42c.google.com ([2a00:1450:4864:20::42c])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tOfvo-00000005Tap-0t73
	for linux-arm-kernel@lists.infradead.org;
	Fri, 20 Dec 2024 16:32:53 +0000
Received: by mail-wr1-x42c.google.com with SMTP id ffacd0b85a97d-385de59c1a0so1389050f8f.2
        for <linux-arm-kernel@lists.infradead.org>; Fri, 20 Dec 2024 08:32:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=9elements.com; s=google; t=1734712370; x=1735317170; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=2l7F3pjuoDH3GKZ6bPXFtH3xTXOQ8g8lc//roM40EcA=;
        b=W49c+bhoQU5NMhmLaqLf/tZ70Ngn/ymE4T0ciOSwJG2QRfeEE7Ly1kS34i7IkbatD3
         xUoZsv7JsbOuJEhPKgc5BBdupYyrdZmF8zWxXyw7VIYFeeyp0pIgm89B9MP03NMoWUC0
         b4Oo7Hd4ega1U3sd5JUou/jFM0q7ZNCQEhVgykcJDYLbJZ+lM/mLNcMpqaL9T1z4jM0A
         q2M/ReeG0Y1v4igqaYKuLZ+jURqEDs5PVe7RP3Y9JaJ5J1W3tf3CDOrI10qvLJdftYRl
         w5dy/WLDeQl0JhKheurspRDiJUrr7VtLk8NOegnTGfaP/DuuTNKd97uL4T7mUFbCuJ8a
         OkUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734712370; x=1735317170;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=2l7F3pjuoDH3GKZ6bPXFtH3xTXOQ8g8lc//roM40EcA=;
        b=NY+5YWBDCaqH3u9YJg1sEIflwNiIS9O4sHmBr0hIzop4FnZNMaTzx5FtwR1ii294Qr
         1f+DaOAicTtAkL55qavWR/0l+7uM0cxKhxLmMwGpFgpVL+ZorCbCVBxtm+6tUx90ShMf
         09Uda6UWCs98cszw1679vS8aXmD5hsMP9+uN2nXs7++BR4neBzui1wC9VPima37BlD6b
         lQpo0fyOz9ok3HYvZjV3vmJiKJaTcSkAs88CQbsCmt3sBTz9QpabRpUwJ/aEq3fy2V5/
         P8rGb0znp1eTXAAuZ9G66BB9uEdpf3A+OJXD7AK8Cgu06AYxqM7jISCT6mlLT4X+ziXB
         SXrA==
X-Forwarded-Encrypted: i=1; AJvYcCWbKn3YQ0+0nHSgMgSH2A5GfLHaiRkkVIP9gOHYOh84+3Bh2k5TTYH+jEbADcFXFX3ivcVjJzd4GGsjWElh/p5p@lists.infradead.org
X-Gm-Message-State: AOJu0YyLM3biWQNPaj2H/h/Svj+hxuF5IJJeaXut+uyy+22IxgE8byf+
	2qkY7GRNFTk5xf4V3b/STNCNpNmUbmXxRYr2STtlVdRiyeHZVW4JMP1SIU574zI=
X-Gm-Gg: ASbGncunwRLOJvLM7yPNg10NsUsdqI3LCfFr1SOMBVIVgHIHsNwKfUV2QeU/xWJayp5
	SmvwUSShQUvEQs5mse6GIa6n+i0C6RYIbRtajnumsFvKiyiG9NKBgCMUPtD7Bm79/tpP76YZihm
	fsZOGEdY0yodMtSZUFClYaow4T/I3ivEKn25Zb+JDNOi16VRDIEWqgGOUum/VlkatUiD2bz4XEY
	8LCP6NWzsLiqXGbUg0J9Dt3Bg8Dw8SuuSKTgUQUlpmyIeiFz65gvcHYsmNAOmT+8s1uGMjYNrWt
	loKYQTt4Ruhc8i4+oYWzLPa+HEDc8xCmsAPRTeyFmBpzd+ZJwYBJO/+I+g==
X-Google-Smtp-Source: AGHT+IGAt3760Qhq8XM3fVQ4ouCmUKpaz/sP4mtLEw32k0+oB77VuzIh0ce8Xp3r2hz5RJC3cF50Bg==
X-Received: by 2002:a05:6000:1a86:b0:386:3702:d2d8 with SMTP id ffacd0b85a97d-38a22400b0emr3189544f8f.58.1734712370342;
        Fri, 20 Dec 2024 08:32:50 -0800 (PST)
Received: from elemental.sec.9e.network (ip-078-094-000-050.um19.pools.vodafone-ip.de. [78.94.0.50])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-38a1c89e1a1sm4365193f8f.69.2024.12.20.08.32.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Dec 2024 08:32:49 -0800 (PST)
From: Alicja Michalska <alicja.michalska@9elements.com>
To: heiko@sntech.de
Cc: linux-rockchip@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Alicja Michalska <alicja.michalska@9elements.com>
Subject: [PATCH] arm64: dts: rockchip: ROCK3B: Correct clock rates for Ethernet PHYs
Date: Fri, 20 Dec 2024 17:32:27 +0100
Message-ID: <20241220163227.1501912-1-alicja.michalska@9elements.com>
X-Mailer: git-send-email 2.47.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241220_083252_272381_918EC62F 
X-CRM114-Status: GOOD (  10.30  )
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

Built-in ethernet PHYs did not work on mainline kernel:

fe010000.ethernet eth0: Register MEM_TYPE_PAGE_POOL RxQ-0
fe010000.ethernet eth0: __stmmac_open: Cannot attach to PHY

According to the board design, they need to be configured as output with
static TX/RX delay. This patch sets it accordingly.

Signed-off-by: Alicja Michalska <alicja.michalska@9elements.com>
---
 .../boot/dts/rockchip/rk3568-rock-3b.dts      | 68 +++++++++++--------
 1 file changed, 38 insertions(+), 30 deletions(-)

diff --git a/arch/arm64/boot/dts/rockchip/rk3568-rock-3b.dts b/arch/arm64/boot/dts/rockchip/rk3568-rock-3b.dts
index 3d0c1ccfaa79..5350158302e4 100644
--- a/arch/arm64/boot/dts/rockchip/rk3568-rock-3b.dts
+++ b/arch/arm64/boot/dts/rockchip/rk3568-rock-3b.dts
@@ -183,37 +183,65 @@ &cpu3 {
 &gmac0 {
 	assigned-clocks = <&cru SCLK_GMAC0_RX_TX>, <&cru SCLK_GMAC0>;
 	assigned-clock-parents = <&cru SCLK_GMAC0_RGMII_SPEED>, <&cru CLK_MAC0_2TOP>;
-	clock_in_out = "input";
-	phy-handle = <&rgmii_phy0>;
-	phy-mode = "rgmii-id";
+	assigned-clock-rates = <0>, <125000000>;
+	clock_in_out = "output";
 	phy-supply = <&vcc_3v3>;
+	phy-mode = "rgmii";
+	phy-handle = <&rgmii_phy0>;
 	pinctrl-names = "default";
 	pinctrl-0 = <&gmac0_miim
 		     &gmac0_tx_bus2
 		     &gmac0_rx_bus2
 		     &gmac0_rgmii_clk
-		     &gmac0_rgmii_bus
-		     &gmac0_clkinout>;
+		     &gmac0_rgmii_bus>;
+	snps,reset-gpio = <&gpio3 RK_PB7 GPIO_ACTIVE_LOW>;
+	snps,reset-active-low;
+	snps,reset-delays-us = <0 20000 100000>;
+
+	tx_delay = <0x36>;
+	rx_delay = <0x2d>;
+
 	status = "okay";
 };
 
 &gmac1 {
 	assigned-clocks = <&cru SCLK_GMAC1_RX_TX>, <&cru SCLK_GMAC1>;
 	assigned-clock-parents = <&cru SCLK_GMAC1_RGMII_SPEED>, <&cru CLK_MAC1_2TOP>;
-	clock_in_out = "input";
-	phy-handle = <&rgmii_phy1>;
-	phy-mode = "rgmii-id";
+	assigned-clock-rates = <0>, <125000000>;
+	clock_in_out = "output";
 	phy-supply = <&vcc_3v3>;
+	phy-mode = "rgmii";
+	phy-handle = <&rgmii_phy1>;
 	pinctrl-names = "default";
 	pinctrl-0 = <&gmac1m1_miim
 		     &gmac1m1_tx_bus2
 		     &gmac1m1_rx_bus2
 		     &gmac1m1_rgmii_clk
-		     &gmac1m1_rgmii_bus
-		     &gmac1m1_clkinout>;
+		     &gmac1m1_rgmii_bus>;
+	snps,reset-gpio = <&gpio3 RK_PB0 GPIO_ACTIVE_LOW>;
+	snps,reset-active-low;
+	snps,reset-delays-us = <0 50000 150000>;
+
+	tx_delay = <0x47>;
+	rx_delay = <0x28>;
+
 	status = "okay";
 };
 
+&mdio0 {
+	rgmii_phy0: ethernet-phy@0 {
+		compatible = "ethernet-phy-ieee802.3-c22";
+		reg = <0>;
+	};
+};
+
+&mdio1 {
+	rgmii_phy1: ethernet-phy@0 {
+		compatible = "ethernet-phy-ieee802.3-c22";
+		reg = <0>;
+	};
+};
+
 &gpu {
 	mali-supply = <&vdd_gpu>;
 	status = "okay";
@@ -512,26 +540,6 @@ &i2s1m0_sdi0
 	status = "okay";
 };
 
-&mdio0 {
-	rgmii_phy0: ethernet-phy@1 {
-		compatible = "ethernet-phy-ieee802.3-c22";
-		reg = <1>;
-		reset-assert-us = <20000>;
-		reset-deassert-us = <50000>;
-		reset-gpios = <&gpio3 RK_PB7 GPIO_ACTIVE_LOW>;
-	};
-};
-
-&mdio1 {
-	rgmii_phy1: ethernet-phy@1 {
-		compatible = "ethernet-phy-ieee802.3-c22";
-		reg = <1>;
-		reset-assert-us = <20000>;
-		reset-deassert-us = <50000>;
-		reset-gpios = <&gpio3 RK_PB0 GPIO_ACTIVE_LOW>;
-	};
-};
-
 &pcie2x1 {
 	pinctrl-names = "default";
 	pinctrl-0 = <&pcie20m1_pins>;
-- 
2.47.1


