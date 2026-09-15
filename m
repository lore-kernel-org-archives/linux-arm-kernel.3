Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4411FC88E75
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 15 Sep 2026 12:40:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=IUBpSQaA91JU4u4hSD0CHnRFwoDOkNzew04B1AEq+dc=; b=rAL7dSDiT2lblLaJVYsWyqpFNg
	7fx2I0uGICOzwEyKAVwEk+XMwEkMtQxKtVIrrMF7xU1U2fxwIiPGZEBnTVv1g7u8yKwl9aGE1HcMj
	f6684A+GE0EIDTqMaDNrWH6rsnP1KLfU7Z/u9yB40WEYr0cTULZO5QM2dufXDz0Yy16wm+akhjjsL
	hE2lc4Av71wgsdTtY3xijanhQpqr2gb+1usiPADsk037PrcIpF6U5P/WpxC6QSfcDyYvHqY+1e9An
	ZN8J0/w7qbsOU59CMkdti6kJByrHHZc6AEJXXvM3xJRrFNj4vu5MXXOEq7z1AqY84AZ0Alhdxb/8i
	QPpqpAoQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6SSG-00000006Z5a-0ZNK;
	Tue, 15 Sep 2026 12:40:09 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6SS4-00000006YjD-0eVb
	for linux-arm-kernel@bombadil.infradead.org;
	Tue, 15 Sep 2026 12:39:56 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=IUBpSQaA91JU4u4hSD0CHnRFwoDOkNzew04B1AEq+dc=; b=lxzfSwmBzxrkU+kYrfU+RSQDeF
	MVvCavBwZlWRfjLPjua1zQyhHg6MegJoxc5hLh5Mr3CRtgJ3Y4oJhzqoDWMPQ1AsukCfgfgtk6gmL
	MM3h7MHhdpkK+Llx0LyF8mZT67t06TG2S6KNhDWlUnwadC3k6rOxrmVEo++0sfcV5GIPbWJlXFodf
	pZZucLKs1dICUk6Sp5VGbKX1/kGtIxONUSrfzh4g66Y8PkP90YHaD8c10RLsp84WKH00Y79a/zLGA
	T8dBTNJ2QrkbtUlni91GJy8D7zM0WjyLbuf0FIGltYXC/Q4ukYHeGIjYiGe0yRrfYPBtUHRcaJ0L/
	rHQGmRYw==;
Received: from mail-pj2-x0b.google.com ([2607:f8b0:4864:39::b])
	by desiato.infradead.org with esmtps (Exim 4.99.2 #2 (Red Hat Linux))
	id 1x6SS1-00000006kYo-00pR
	for linux-arm-kernel@lists.infradead.org;
	Tue, 15 Sep 2026 12:39:54 +0000
Received: by mail-pj2-x0b.google.com with SMTP id 98e67ed59e1d1-39dba377357so1910363a91.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 15 Sep 2026 05:39:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789475991; x=1790080791; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=IUBpSQaA91JU4u4hSD0CHnRFwoDOkNzew04B1AEq+dc=;
        b=LsxSOM9Jsln5TC2ZX9VGyDS0AOYJ0ll6IIZ5i0rLTqtvR3bZQ4kUGlw2XjewvMpZ7A
         gbX3WYQDtSzu3HzDWZNCduZylSXS/M7TbPGQIDfJHxSF1wr1QfzXVfjNEoXy7DlMMq82
         sZOPefGpoeYHF+dklJQ7Fsa4vuR/CpaB6lddeL9aQ/I3lKf/a2uqY34ZOvS5DRZ+YxGY
         6zrh3cRDYC1g8JQjUhGslIHEttNOA2EEvddQT0eW1sI2XW9QCo3419j4+9Q2TYNEJdIv
         4FJZUghEU/YW4PUd8gkUo39AjWL1QmCsqFG22NJBUIrUCabaXxMRNaHzpH95h1Np8+01
         txtQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789475991; x=1790080791;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=IUBpSQaA91JU4u4hSD0CHnRFwoDOkNzew04B1AEq+dc=;
        b=kU9URYWfs9yQSYEsgE1pxO689F3+j5Lbk0fuZmr6OVftc44OLrOlpoyiy/W4636Ob1
         Uf2/aYhIjGhP7S7wBQ4WU8vmxHd4N5fObrW3HEK8ymQru/DFKCFi0MvLFfnBAdcA9IcX
         gPoaUFfYL/R+YXjPUw+MrANMlK9BA/1QCyy/C6rR01C4OgMfU9pc4Ch5N1AOwCGlejfx
         VuNX/L93Ym3ENdBlAz1MKmOv1PzacZ1pM+CQnaZjEIR3PflhUd1l8naKFgKxyFy87vis
         E8k3hph30xIYbnBE1Vuc0K0xS7BieZ5nCdCCDmhEv6S+bAXoDnPe+TxfdbD9AWm7ipkc
         0+fQ==
X-Forwarded-Encrypted: i=1; AKwUvBw3VDPTfH9gg/f7yMAP1qcOaYxRAdDIhFOHnQnEstCgfdKnURJiQ66frAWv2VueI+chmKwviGYvm/H2W8S/v+ZM@lists.infradead.org
X-Gm-Message-State: AFuF++lFH27TkNcqETzfnp+aFlQdQ3kfTIqJjrH7dQjx2Dw9AK1r//j+
	gobc++6d8iPrNO47CQ46JZeYkTrOYc39RhHjknN9ikAtMa5DIBFk5PG0
X-Gm-Gg: AYBFou3nXpkHuUPcStBjy0+o+IsmZLtUqMWQ0daBjSRwZJCDZtMdeiqZ+X17Y5yJI+I
	8MkPNlifVKT8ObNYXeFCdikFw1FuSxyReGGbOwMwaPV6K1eMplcqa1aE46GVHSYx0iBl75eWXgA
	Y3k75x0HCvhDPMxxt/DkQTO6v//IlNyLLtktr8Fz68b/CYqO3mR0TzU+BUUYPuRDeklrr9ya5Z/
	VJAkS1ihj6/wlOao1i3aIGRDe907GAaO6kT7CxI/PuafgJZ6iOEnyloprjoaBLQgHBXguq8V7ka
	SZoVCR8xXJszk2VGw7mhy+uHC0VzGOFDTZrULa1sbSPqrmPB5khtA4t+jEckJXTwzcsX0CTnSBi
	WC3uI/34Ky/S2BBQVbhcF13m164rDnPmcoLCQKHNLXvVOOY5RQuwUR/llBt8mifIDqpXBJJwRKz
	rQP6hvin0zRfXmsZPCYS+YbATd7P6ezr/zbBavPtL27OT6t/aY+Dpjb2PpbxHqYxvkWb7LUA==
X-Received: by 2002:a17:90b:5887:b0:39e:8d5:fcee with SMTP id 98e67ed59e1d1-39e08d5fe14mr4270765a91.17.1789475991205;
        Tue, 15 Sep 2026 05:39:51 -0700 (PDT)
Received: from server.lan ([168.138.199.194])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39dfdd28acbsm5307259a91.10.2026.09.15.05.39.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Sep 2026 05:39:50 -0700 (PDT)
From: Coia Prant <coiaprant@gmail.com>
To: Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S . Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Heiko Stuebner <heiko@sntech.de>,
	Vinod Koul <vkoul@kernel.org>,
	Maxime Chevallier <maxime.chevallier@bootlin.com>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	Romain Gantois <romain.gantois@bootlin.com>,
	Heiner Kallweit <hkallweit1@gmail.com>,
	Coia Prant <coiaprant@gmail.com>
Cc: Neil Armstrong <neil.armstrong@linaro.org>,
	Russell King <linux@armlinux.org.uk>,
	Shawn Lin <shawn.lin@rock-chips.com>,
	David Heidelberg <david@ixit.cz>,
	netdev@vger.kernel.org,
	linux-rockchip@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-phy@lists.infradead.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-renesas-soc@vger.kernel.org
Subject: [PATCH net-next v6 10/11] arm64: dts: rockchip: rk3568-photonicat: enable SGMII LAN port
Date: Tue, 15 Sep 2026 20:37:59 +0800
Message-ID: <20260915123802.1561724-11-coiaprant@gmail.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260915123802.1561724-1-coiaprant@gmail.com>
References: <20260915123802.1561724-1-coiaprant@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260915_133953_126326_BFCC97D0 
X-CRM114-Status: GOOD (  14.38  )
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

Add rockchip,sgmii-mac-sel = <0> to the already enabled combphy2,
to route the SGMII interface to GMAC0.

Enable the xpcs node and its port 0 sub-node, referencing combphy2
as the SerDes PHY.

Add the mdio0 node with the YT8521SC PHY at address 3, including its
reset GPIO and LED configuration.  Also add LED configuration for the
existing RGMII PHY on mdio1 for consistency.

Signed-off-by: Coia Prant <coiaprant@gmail.com>
---
 .../boot/dts/rockchip/rk3568-photonicat.dts   | 74 ++++++++++++++++++-
 1 file changed, 72 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/boot/dts/rockchip/rk3568-photonicat.dts b/arch/arm64/boot/dts/rockchip/rk3568-photonicat.dts
index 58c1052ba8ef3..fdaa4a2a4328b 100644
--- a/arch/arm64/boot/dts/rockchip/rk3568-photonicat.dts
+++ b/arch/arm64/boot/dts/rockchip/rk3568-photonicat.dts
@@ -3,6 +3,7 @@
 /dts-v1/;
 
 #include <dt-bindings/gpio/gpio.h>
+#include <dt-bindings/leds/common.h>
 #include <dt-bindings/pinctrl/rockchip.h>
 #include <dt-bindings/soc/rockchip,vop2.h>
 #include "rk3568.dtsi"
@@ -241,6 +242,7 @@ &combphy1 {
 };
 
 &combphy2 {
+	rockchip,sgmii-mac-sel = <0>;
 	status = "okay";
 };
 
@@ -260,9 +262,18 @@ &cpu3 {
 	cpu-supply = <&vdd_cpu>;
 };
 
-/* Motorcomm YT8521SC LAN port (require SGMII) */
+/* Motorcomm YT8521SC LAN port */
 &gmac0 {
-	status = "disabled";
+	assigned-clocks = <&cru SCLK_GMAC0_RX_TX>;
+	assigned-clock-parents = <&clk_gmac0_xpcs_mii>;
+	managed = "in-band-status";
+	pcs-handle = <&xpcs_mii0>;
+	phy-handle = <&sgmii_phy>;
+	phy-mode = "sgmii";
+	phy-supply = <&vcc_3v3>;
+	pinctrl-names = "default";
+	pinctrl-0 = <&gmac0_miim>;
+	status = "okay";
 };
 
 /* Motorcomm YT8521SC WAN port */
@@ -341,6 +352,36 @@ &i2s0_8ch {
 	status = "okay";
 };
 
+&mdio0 {
+	sgmii_phy: ethernet-phy@3 {
+		compatible = "ethernet-phy-ieee802.3-c22";
+		reg = <0x3>;
+		max-speed = <1000>;
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
@@ -350,6 +391,25 @@ rgmii_phy: ethernet-phy@3 {
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
 
@@ -586,3 +646,13 @@ &xin32k {
 	pinctrl-names = "default";
 	pinctrl-0 = <&clk32k_out1>;
 };
+
+&xpcs {
+	phys = <&combphy2 PHY_TYPE_SGMII>;
+	phy-names = "serdes";
+	status = "okay";
+};
+
+&xpcs_mii0 {
+	status = "okay";
+};
-- 
2.47.3


