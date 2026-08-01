Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7A6BDC55173
	for <linux-arm-kernel@archiver.kernel.org>; Sat,  1 Aug 2026 14:24:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=90YVBhfMIaP8zND+DZv16Kjus0az0KSmnbZxqz5Zjos=; b=D3x0gEU5xB7tBp2RPdTPFeOuZH
	3A7fsbiawTgbedXNjbCUKJpDk24WQ58eO/prd884k1cFKO93ChRxPd9mtLFelwZ0oqgsRhIqddMpx
	dXcDd1+5OsWHqiH6K0fzv6DKBAZiovdU/5abiA6NC8d13fM6OvfNhmxTWOX3aWXDmd/izaX721uqe
	T9jrUG70ImmmVa86YJXrqR/Yj98rI0f/JgDdXcJHiRbEFEx8FV4Q8bZhEwJZWnhcNZCmwESbC7BMI
	oDwaJ8SPxp0V5zB+3L432ZF2CmRxYxK/iv/RphQ8UKJ/8R+vh47TDr8qqbH+/2N6tmH/3CupChPqk
	ocU14IIQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wqAdN-0000000EjAW-3sbM;
	Sat, 01 Aug 2026 14:24:17 +0000
Received: from mail-pj2-x0b.google.com ([2607:f8b0:4864:39::b])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wqAdK-0000000Ej3v-2Fok
	for linux-arm-kernel@lists.infradead.org;
	Sat, 01 Aug 2026 14:24:15 +0000
Received: by mail-pj2-x0b.google.com with SMTP id d9443c01a7336-2ceb5a39c48so6118595ad.1
        for <linux-arm-kernel@lists.infradead.org>; Sat, 01 Aug 2026 07:24:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785594253; x=1786199053; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=90YVBhfMIaP8zND+DZv16Kjus0az0KSmnbZxqz5Zjos=;
        b=a5deTUSca6k+POILaFZqjFY29qD1M6GvqAn2lMypAoZkLRYLbggHItXkizoxv3lHgs
         jTexPM3D4Yt80sutRHS0YSWf3medldT7+VhQNH7XCCou2i7agOAxYNuVuL1byBY9nLx3
         s3IeMNS7RpKu6uULv69/m16HEtS/0TEZCckfR8xuhxg/2x0FB0lAWSE1cOba6t2VLa2X
         xu6gpqEClxFINZVDIJTmpM/CmNaMJD1qhdKv/Veh2aMsTSkU5sk1yUx5txJ/NwJRH67n
         1gnTDYjuCyuQYRTXElNE+Rbae63ChleYUmPbQPIRTXYlFcJxKhp8Nr2Vt6uKFt9DzwhV
         U2Ug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785594253; x=1786199053;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=90YVBhfMIaP8zND+DZv16Kjus0az0KSmnbZxqz5Zjos=;
        b=dPBNxtXK/so9J2SKYsT7p1Ipr1gPfQBl2gMgSuaXLtxkZMSjE0Q1bTdg2axoLQ8QD8
         y5uWB43TZ/qzDvWlPxuI9s+izTx3mSaiQAG2t1eYZqQnMyPT1pcWwNA/+fhuYTJvI2ru
         JrS2N3//VhdoLZdCoLvkGzaYuEq09XM92YMciG6aOYfE7ehs7ofyk8v7MHuayChIK3cG
         oLNakaSB5FhXe6sWF18OFi4ENw6m1qeJENh8T5PFmlM1/qiR887JeqTM8iVIYZV9it9W
         oLPJmpRP+Ue8k+ApxIfN2iExg9ot1bJS//CyiUesu6wlPPBqOms5HoAwv0hoYXdaBaLj
         3dfQ==
X-Forwarded-Encrypted: i=1; AHgh+RrXjvvjxXcgog4mU/LW8Tvy5ebXUrVXL/n+3F78zG9ODS6MMcEO0mvEGEVWKcgkHBC+Dx3a+XPn6P82qGCl6w3g@lists.infradead.org
X-Gm-Message-State: AOJu0YybQt1XkUKyahMD+YHbYUaSMmXMdWGtxc6AJhvHPpcN6fQXN8rY
	59MLPotaK53PVb3a2SL0aJgwkvx9KkUmBALLyEIGMen/JI8n07zkLl+Y
X-Gm-Gg: AR+sD10+zd38L5bp6YSZktrhdu7ygYG67eoQRE/+MWpUuL7sirHxUbsyRRK+xkMdC/w
	1UGtB0Vg9XAKqYfN5e4XbRpxchA0WkkPL1j1bOHSwvTxGcLTiJ1ZrI/XkuGPIcDw8TezdFlUrEo
	73e7s4wL/sF5Nd5tGqmBUbhU6wyRfW9e9BN3hohlPJeuUzsMWVK2+VZ/qpLRhf5QNtCbIQSaKWw
	9ttkcv/B7pzmiLoN08Ly/+fLKZwnDBIBEIDBg1saqmhDABI82MYbz7EwhLrpvqCxUDdUfR6ne1u
	TXk5wrTH9Y5t2N0Vk2Z/n0M2q/LO7gYi/FNO9vK2PRndVGLhCBOjvz4qjSHkAVdb8AVMgFRJBm5
	SZqP0EGnXyoXFPGzQqz4gU/q6QcKAk+SWEFH99lsLygN9+keckAXXgOxDkhOnHI6NpEti1p0jCF
	rM6IXEserugMna9AVUu5z9Sscm6zobsM1dBOQ5K1dGGqmaN65h9DBeOmw=
X-Received: by 2002:a17:902:da89:b0:2cf:4505:6bcf with SMTP id d9443c01a7336-2d052297a46mr38452135ad.29.1785594253494;
        Sat, 01 Aug 2026 07:24:13 -0700 (PDT)
Received: from server.lan ([103.213.4.16])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2d04ae5ac3dsm18043845ad.23.2026.08.01.07.24.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 01 Aug 2026 07:24:13 -0700 (PDT)
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
Subject: [PATCH v2 09/10] arm64: dts: rockchip: rk3568-photonicat: enable SGMII LAN port
Date: Sat,  1 Aug 2026 22:22:33 +0800
Message-ID: <20260801142244.679437-11-coiaprant@gmail.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260801142244.679437-2-coiaprant@gmail.com>
References: <20260801142244.679437-2-coiaprant@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260801_072414_660265_30D765ED 
X-CRM114-Status: GOOD (  14.43  )
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


