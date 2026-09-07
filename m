Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6B1FAC79FA1
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  7 Sep 2026 15:40:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=2srrqsfvZcRiNitfhUr7DhaIgxeXboMwTknQApvQL7A=; b=N5oSreNZVUaM521YZR1H26o+Cc
	uKmyCkJBrHN+hcCx48SwRS1ZgcfwTXjOBzL++Hh+upc3Cbbl2RJDUywfhwpafIlK5hCtjsIFIJper
	WlQ4uC0yotwTDrhQjajNcrXTRcageCxfJocvaEsKS+3oF4pYRrF6uxHB0S0qbF6bGXTsKupof4jZp
	xtKSNuSV8h/WqI1+4xg0Jk3ILp9l6WhntXZuXximk/EYpD9IvSCompVJu3ArGiPcPFmVM/wdBKXpS
	gfJkqUqBTfEqUsqDbLj+u5ZgOhp9kuWzjVkdJeKX/4294nQ5iuof4TqY223u5MAwebGKEh7Fl/Y9Y
	Yw2NHheA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x3bRq-00000007CxB-0B7s;
	Mon, 07 Sep 2026 15:39:54 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x3bRp-00000007Cv8-052l
	for linux-arm-kernel@bombadil.infradead.org;
	Mon, 07 Sep 2026 15:39:53 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=2srrqsfvZcRiNitfhUr7DhaIgxeXboMwTknQApvQL7A=; b=VSSPYA9fY+Kgzdoeuey+NxQkRz
	Wk/DbZ8E0afk/9FKccd3jV+Q1dvP8l2F3g+YZLeteYeGEANAYXTbPuB5gfy+aH9B+aLno1YHq/g00
	1cYsUJFG8n0/MwHepsw7vUg+mND5Qs8iYn/QKabu/ZPfOVOqQP6pO/tk8Vx+nLS5CoSAGt7XB2t7X
	EAL3ZU4DGU2J4wbln+s3tmd8vcg8TKpF1cSZDyrmxiq1t4p8vkiFm1ls12OkoZSs+uorVnqiLeNV5
	YTnO33w5oBmQKbAjfGNucvs3Y+fxkLOtaWNOiGdje0rNtJmsXMf7q7w625c184lTHF/pTI8QqXNXM
	XkXChN8w==;
Received: from mail-pj2-x07.google.com ([2607:f8b0:4864:39::7])
	by desiato.infradead.org with esmtps (Exim 4.99.2 #2 (Red Hat Linux))
	id 1x3bRj-0000000GNyH-3ocx
	for linux-arm-kernel@lists.infradead.org;
	Mon, 07 Sep 2026 15:39:50 +0000
Received: by mail-pj2-x07.google.com with SMTP id 98e67ed59e1d1-398e10200a6so1899841a91.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 07 Sep 2026 08:39:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788795585; x=1789400385; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=2srrqsfvZcRiNitfhUr7DhaIgxeXboMwTknQApvQL7A=;
        b=rRPb7/EITLHYaVHFXg4odwCBoLVfKivZzaz2vkO33AfQ0MhxCW0lJz8Ehr8tnMudcR
         Fhwegnvyl4CdF+D8y9C3SAOz9+FEU9cU0TImmFs4FKAeog8OEHLDa6yK8pf6FXPwVNLQ
         AzedB3erAdjnWNG8TR+nwtZw9diTqxFgbMjFmjfpLRFf6FiNZC81oHgHhZpstANJ/AYg
         uC45VlPcPpawJ2Q/njUr7KUpKTwgXD+J4erapyr6J/dSeTz4xCuOcEFo2mDPxpcb2Om8
         hKnanG+0ik+JgbJE6P3yTCDT62pSN+LjW0QhyEuiMqUkogILjJmNLm1cPA5prbIY9wXY
         vpeA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788795585; x=1789400385;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=2srrqsfvZcRiNitfhUr7DhaIgxeXboMwTknQApvQL7A=;
        b=Y2fFpMe4lxTOf/0+fi5jxofDcN3Monr4bf/rsaLnMh7t4agt8NnPhrxWMTVzyMcEe8
         cBD2q4IW3f7LXOWnko9PWvyv5Moyd7GgxXsIoIT6/9bGAWb6ZTDU1bn3u+eIM1KUPw3g
         Ldz84xG1ceyJWrqcB0q5XaKknuNRq/6NDYA95boO1iGgFjcF3ufvI/Za4xO8t6K3YV5y
         q+bP2i/zilcpHezFv7mEV20j075hbJAAXFKYn/Lvl53xBF71qApJkmyU+iZsxdoEddTk
         mG/J8XFvWsL4djNOWHF/WSxQwN3rBmXGYftpmZK7h4TgG3KJX3WPv/DrG5NsuDett6zn
         ITCQ==
X-Forwarded-Encrypted: i=1; AKwUvBxwrsNs8g1S43Pqg4hO8hiZ6eJTsCVkHQs8Dly6L6rFEb42mm38SIo6z3nmoSKrYN3/vKcnqSLcvnOHNK3gNPGI@lists.infradead.org
X-Gm-Message-State: AFuF++n2YMbyWdd/tOi6OOaw2vs2FfvM93tK/pAKM4APRRwvJvod17Kn
	tpVclgpEYgS5CmHknftist3mXUdeBoHEny13yBzJQdMDQfrhjzVFIMuR
X-Gm-Gg: AYBFou1hxfH6pbI08ZDCLhd9SO5WvKdBF49SxCI6DKGOvWJyTuYqkm1PkQR9lUOw4FS
	EI1FFBPFDysOShmDj1t7/VHUfLWQr5kT8eQ5S3LDVD/5F5Z97JA9ux+9iHq3IEIz6QQG9Edu2Rt
	grctEZUXAd7ugI0dO4SoCrrHl+pk4uLM87fKbwv6Eh6uK7sMkXsSM/5i4l6pXmdxhBe9DzB1l7F
	StQGdNpenjo9AIceRTVV0JWFkcHNdIzUmbFPMflOczUFYVgtxvWwA8GGXiBZg/BdwDu7Ta/jj3h
	Ww/mmJ5D55btcuJI4WJnPtKsWp9cN0coNJZiSvRIrE8TonwEFTwHzasoxtOXCU2YitHXoSC15nt
	R/NxMKcuRayzUGhohm6A4CCJmwTuuUaC18Rd0EnZnKKvqmjC4207XVf5aAFdjhw1Wpp5r5X3zZu
	WhdKMxwWwnN5gCUhs128jaBIEUIJ2QuBV0udLu5kPBFneYzOiUeJdl/fEDLj+r
X-Received: by 2002:a17:90b:3c42:b0:38e:fea2:df53 with SMTP id 98e67ed59e1d1-39b260d2977mr35605265a91.4.1788795584940;
        Mon, 07 Sep 2026 08:39:44 -0700 (PDT)
Received: from server.lan ([150.230.217.250])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39b260fdf9asm21690121a91.9.2026.09.07.08.39.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Sep 2026 08:39:44 -0700 (PDT)
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
Subject: [PATCH net-next v4 09/10] arm64: dts: rockchip: rk3568-photonicat: enable SGMII LAN port
Date: Mon,  7 Sep 2026 23:37:12 +0800
Message-ID: <20260907153713.2572547-11-coiaprant@gmail.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260907153713.2572547-2-coiaprant@gmail.com>
References: <20260907153713.2572547-2-coiaprant@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260907_163948_090897_32FF0ECD 
X-CRM114-Status: GOOD (  14.27  )
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
 .../boot/dts/rockchip/rk3568-photonicat.dts   | 74 ++++++++++++++++++-
 1 file changed, 72 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/boot/dts/rockchip/rk3568-photonicat.dts b/arch/arm64/boot/dts/rockchip/rk3568-photonicat.dts
index 58c1052ba8ef3..25caa44198843 100644
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


