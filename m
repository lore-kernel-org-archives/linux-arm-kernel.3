Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 48366C44507
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 14 Jul 2026 19:14:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=90YVBhfMIaP8zND+DZv16Kjus0az0KSmnbZxqz5Zjos=; b=nVsuao4qYerxEicHGoLEPJgEMJ
	6LsDZovE5LEqpovTCusWygNWE/Ue2thvIp3dngeiB3NVy6NjLSHT3B4+bqK8agM6CXvCVdLDHkX0Q
	ll1SJLAMbvplMjvoOJdUto5iK+3zjBUO+/lcxvG70pSYMXdgRJX8o6hvF5N9ucbXb66G/DV5/YEB1
	Rm+BRfWZs1lf1nU5cly1ClWu2p6+yaRZ9uXQLf4xoQxlpDl+oqlZ0dvK/eyBuQ6/8fZkI+UHh1nzd
	d0N17rnHs2VMX0qCkvZZTOliOWOfxQv47bEpVo4GclBKdaclcV+gL5kPPlzcZSle1fSUT/ZJv6Und
	gSMoieyw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjiae-0000000D0hF-2yXD;
	Tue, 14 Jul 2026 19:14:48 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjiab-0000000D0cG-0J1M
	for linux-arm-kernel@bombadil.infradead.org;
	Tue, 14 Jul 2026 19:14:45 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=90YVBhfMIaP8zND+DZv16Kjus0az0KSmnbZxqz5Zjos=; b=iN7yxcKzmGe2JJU8cuAcpKJf+0
	bMESOhKnFxSEo2PdIzEUwNSudOokNyjpaGT+TvqHachRC7HwbIK+3J9k6kBZsrBpyF0QVWHObJjL3
	uHb8BBtN7LpSYuVced0yiC5auDpMXOxAN2tnsQEAIrUbhuy2X3t4oFEhW8iEMqKcVrlxUV2yt3370
	60ijlgUynn2d8zLMhNR8cZwqnE6SwlhIYby/4q1Up4C+tsI2yen1fSul7m/NdN/+WSF322cQuaHZo
	APp7FIw//2NFPHb0bOX4fjEXKD/8uaKHzXSQjmBhj8Um3JXzmAIOe186Kkk1zhfgpoKxUJtLFmwN3
	iXefSN0Q==;
Received: from mail-pj2-x02.google.com ([2607:f8b0:4864:39::2])
	by desiato.infradead.org with esmtps (Exim 4.99.2 #2 (Red Hat Linux))
	id 1wjiaY-0000000Cne4-0BfB
	for linux-arm-kernel@lists.infradead.org;
	Tue, 14 Jul 2026 19:14:43 +0000
Received: by mail-pj2-x02.google.com with SMTP id d9443c01a7336-2ccbff2e6a7so31006135ad.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 14 Jul 2026 12:14:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784056479; x=1784661279; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=90YVBhfMIaP8zND+DZv16Kjus0az0KSmnbZxqz5Zjos=;
        b=RAhCLgkpsIFvJd6rDw5wy00IMZZgv46aCQ7Bop40UQqIFroGfHPNFgy6pcD9vjtSRi
         rspip9XXo5dso7l83GO7NmJF26hJD0rM8men1sVqu2hXJIt+Glq/VDqJP8EEg2g/VXmd
         89BKKdSGQZPN1qzCQ5ye5pPZe3F9+AK4QeSsIdTNkQyELum5VPOdH+lSpDDl7cYXVLye
         HS4MrJiR4gh2HWY6BLlrnS/NmQ8sD63KbP1Rw5b/uq9sBpE7NzcUEwDbJzd6bNuuZt81
         rCuUqmcnBl2Ar4nbnQ92jVC7PR32IHQko7qHLBRzgV2Oop6s9nmav0+TrZEHpoJ7ZriP
         nemw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784056479; x=1784661279;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=90YVBhfMIaP8zND+DZv16Kjus0az0KSmnbZxqz5Zjos=;
        b=l96TjxGweb1Bgviwgq7+mPoJtQ6yXz8ZqzptUBRTXInohhyBmzXATEcMX8bOJLaOd7
         t9Rbbz8g16KcwDMFBppfCeMiTrefr8Mhmu1L4s133/74513ICu9ah69eAlZu2nu2CkT2
         QCU+88XlcWrzfjSVFe9Xuyusu1GxgBllvR0qwS87ZzZRBTzy1CXu1wH17hW+3+LD1H+W
         o8rXfpqJCo7VUj4q2Xq+7B1i98uqIOyMPojDiV6aXYppyLsQPlXeLrEGu5ZcfVshYrLw
         vYmEzJjdf91iouG8O8LAMXKZpwQdz5YL7eC8FMn7meUKxrM+LsQrYSctgrAL4Atl8yWa
         ZA5Q==
X-Forwarded-Encrypted: i=1; AHgh+RqsKKuDoo52VCoUmK1+lmktQKVT+KJKeuhSi22JbrchfGdepx1yM3xj4He2auZwMBhsRI3Ikx1lS93DV0xqeGiv@lists.infradead.org
X-Gm-Message-State: AOJu0YwkEVs/RArFEgWS5cxb8UTtIUpl4TOYrlxjSf08Lltpng+bMBsX
	8nBm6zNNRH3f0nnyCbjqLlDMl5rFCLiZlOA/oR4Fz9XQH5aQ+v9lu8g8
X-Gm-Gg: AfdE7cmB+JUYmaEjJYgn+iXBhwznpb1/cnB3bMKgySDJo+nCQZXzCUnxqz5pg41PI9O
	/4WLQnRv0lBYJ82D1bZ9/kJttzYlFE/1seSDcc/sxUkRhuIJ7wfwxwUntbV0kDI10Tsw7SmB37r
	LoIawQkt34tn5vcT9Lvnjy0OdRZin1MatbI0XRZG++xRlXLzPM1c8Zln/AG6Nv176JwFgVZ/AyX
	HxeF+nfy+Z2vjDWRoZzygSa3S2yTo+943wxobsBbP2bWVM7ZHIPTrUmr+bdM6AvKqCUIANtxth/
	COj+tGl8ghKpVIBa2u1Qa+kWARGrC/lJcjrQvqTJegQoEYbmjDJ8ZHuJQFVg6co63RrgYoSkCIg
	H796mEqbhxtZTEBuzSxGuarbW5OookgdR11yPAgLctgq+ur3GNpJqwpASh+dAyWwuLEP1yJ1dco
	1/8HOWMh+2yMeRzP1IFBmvCA==
X-Received: by 2002:a17:903:2351:b0:2ca:de3:15e1 with SMTP id d9443c01a7336-2cef12fe3b6mr36367455ad.31.1784056479101;
        Tue, 14 Jul 2026 12:14:39 -0700 (PDT)
Received: from server.lan ([150.230.217.250])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ccc9d3d451sm120763245ad.65.2026.07.14.12.14.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Jul 2026 12:14:38 -0700 (PDT)
From: Coia Prant <coiaprant@gmail.com>
To: kuba@kernel.org,
	davem@davemloft.net,
	edumazet@google.com,
	pabeni@redhat.com,
	andrew+netdev@lunn.ch,
	robh@kernel.org,
	krzk+dt@kernel.org,
	heiko@sntech.de
Cc: netdev@vger.kernel.org,
	linux-rockchip@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-phy@lists.infradead.org,
	Coia Prant <coiaprant@gmail.com>
Subject: [RFC PATCH 09/10] arm64: dts: rockchip: rk3568-photonicat: enable SGMII LAN port
Date: Wed, 15 Jul 2026 03:08:37 +0800
Message-ID: <20260714191341.690906-10-coiaprant@gmail.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260714191341.690906-1-coiaprant@gmail.com>
References: <20260714191341.690906-1-coiaprant@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260714_201442_241761_F91E8196 
X-CRM114-Status: GOOD (  12.91  )
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

The Ariaboard Photonicat has a Motorcomm YT8521SC Gigabit Ethernet PHY
connected to GMAC0 via XPCS SGMII.  Enable the necessary nodes to make
this port functional.

Enable combphy2 with rockchip,sgmii-mac-sel = <0> to route the SGMII
interface to GMAC0.  Enable the xpcs node and its port 0 sub-node,
referencing combphy2 as the SerDes PHY.

Add the mdio0 node with the YT8521SC PHY at address 3, including its
reset GPIO and LED configuration.  Also add LED configuration for the
existing RGMII PHY on mdio1 for consistency.

Signed-off-by: Coia Prant <coiaprant@gmail.com>
---
 .../boot/dts/rockchip/rk3568-photonicat.dts   | 77 ++++++++++++++++++-
 1 file changed, 75 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/boot/dts/rockchip/rk3568-photonicat.dts b/arch/arm64/boot/dts/rockchip/rk3568-photonicat.dts
index 58c1052ba8ef3..91c17b624fd17 100644
--- a/arch/arm64/boot/dts/rockchip/rk3568-photonicat.dts
+++ b/arch/arm64/boot/dts/rockchip/rk3568-photonicat.dts
@@ -3,6 +3,7 @@
 /dts-v1/;
 
 #include <dt-bindings/gpio/gpio.h>
+#include <dt-bindings/leds/common.h>
 #include <dt-bindings/pinctrl/rockchip.h>
 #include <dt-bindings/soc/rockchip,vop2.h>
 #include "rk3568.dtsi"
@@ -242,6 +243,7 @@ &combphy1 {
 
 &combphy2 {
 	status = "okay";
+	rockchip,sgmii-mac-sel = <0>;
 };
 
 &cpu0 {
@@ -260,9 +262,18 @@ &cpu3 {
 	cpu-supply = <&vdd_cpu>;
 };
 
-/* Motorcomm YT8521SC LAN port (require SGMII) */
+/* Motorcomm YT8521SC LAN port */
 &gmac0 {
-	status = "disabled";
+	assigned-clocks = <&cru SCLK_GMAC0_RX_TX>;
+	assigned-clock-parents = <&xpcs_gmac0_clk>;
+	pcs-handle = <&xpcs_mii0>;
+	managed = "in-band-status";
+	phy-handle = <&sgmii_phy>;
+	phy-mode = "sgmii";
+	phy-supply = <&vcc_3v3>;
+	pinctrl-names = "default";
+	pinctrl-0 = <&gmac0_miim>;
+	status = "okay";
 };
 
 /* Motorcomm YT8521SC WAN port */
@@ -341,6 +352,39 @@ &i2s0_8ch {
 	status = "okay";
 };
 
+&mdio0 {
+	sgmii_phy: ethernet-phy@3 {
+		compatible = "ethernet-phy-id0000.011a";
+		reg = <0x3>;
+		max-speed = <1000>;
+		eee-broken-10gt;
+		eee-broken-10gkx4;
+		eee-broken-10gkr;
+		reset-assert-us = <20000>;
+		reset-deassert-us = <100000>;
+		reset-gpios = <&gpio3 RK_PC6 GPIO_ACTIVE_LOW>;
+
+		leds {
+			#address-cells = <1>;
+			#size-cells = <0>;
+
+			led@1 {
+				reg = <1>;
+				color = <LED_COLOR_ID_AMBER>;
+				function = LED_FUNCTION_LAN;
+				default-state = "keep";
+			};
+
+			led@2 {
+				reg = <2>;
+				color = <LED_COLOR_ID_GREEN>;
+				function = LED_FUNCTION_LAN;
+				default-state = "keep";
+			};
+		};
+	};
+};
+
 &mdio1 {
 	rgmii_phy: ethernet-phy@3 {
 		compatible = "ethernet-phy-ieee802.3-c22";
@@ -350,6 +394,25 @@ rgmii_phy: ethernet-phy@3 {
 		reset-gpios = <&gpio4 RK_PC0 GPIO_ACTIVE_LOW>;
 		rx-internal-delay-ps = <1500>;
 		tx-internal-delay-ps = <1500>;
+
+		leds {
+			#address-cells = <1>;
+			#size-cells = <0>;
+
+			led@1 {
+				reg = <1>;
+				color = <LED_COLOR_ID_AMBER>;
+				function = LED_FUNCTION_WAN;
+				default-state = "keep";
+			};
+
+			led@2 {
+				reg = <2>;
+				color = <LED_COLOR_ID_GREEN>;
+				function = LED_FUNCTION_WAN;
+				default-state = "keep";
+			};
+		};
 	};
 };
 
@@ -586,3 +649,13 @@ &xin32k {
 	pinctrl-names = "default";
 	pinctrl-0 = <&clk32k_out1>;
 };
+
+&xpcs {
+	status = "okay";
+	phys = <&combphy2 PHY_TYPE_SGMII>;
+	phy-names = "serdes";
+};
+
+&xpcs_mii0 {
+	status = "okay";
+};
-- 
2.47.3


