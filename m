Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AF8DDC87FCC
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 27 Jul 2025 18:14:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=EeTBhSz8vgF+IOB9tNLiutH2dTp1nA31ocl9xEGhTRc=; b=R/MYsPlwMNovs7hED0QUEK+8pC
	7twVHHOFzJy+v3INhxl0RoDd/26zzqFcrM67cvN76COjpyVjj79066iQaAu/XwR/TZNI14hFY9pCb
	DmCNJsDfu0TygyAqgPsMmuhazTfEq6g0++c/dVOxXZFLQdVZShCvJhjBdbEe0QSK2oVm1tskOUYP9
	/B8hMa65ZGyqqlp83Wgb9Hckp6AypbOOkRyauSnghb6Gk0MSXWivPbsrELy3lob2j6cb59KgpHH3k
	HuNijUmynBrUkbePGVoj0680wd8E5SfB7lzci2FNKjmF51IrTlZ9cRgOO3zc55s7+goi0J5NfWjv5
	lT78k1tw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ug5sk-0000000D3MD-04Ki;
	Sun, 27 Jul 2025 18:13:58 +0000
Received: from smtp.forwardemail.net ([149.28.215.223])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ug5ij-0000000D2To-3vUM
	for linux-arm-kernel@lists.infradead.org;
	Sun, 27 Jul 2025 18:03:39 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kwiboo.se;
 h=Content-Transfer-Encoding: MIME-Version: References: In-Reply-To:
 Message-ID: Date: Subject: Cc: To: From; q=dns/txt; s=fe-e1b5cab7be;
 t=1753639417; bh=EeTBhSz8vgF+IOB9tNLiutH2dTp1nA31ocl9xEGhTRc=;
 b=qVxk37QdsFmyBwsPmVVVTu+fQV7SbbUF8wKX93RzN9NQQxtJPxLIHUrLdmxynuaGdG9uFy52z
 WQbM9H+U07PPr7/Mx4qXb8bm5QcKbTMnhLWcDXV4w9LzrS9DnyiSuDfAcwSxZ2AQdv7zRnkQlOb
 ht4lQ/LxI6BL6MCoFXYD3VZqflal/nWN9rv+BN9L96o9qQhx/Hq9usfSZpIkc5nibUbABC6RC3E
 b5Dz5HQ7gUgoL2LJk/hMYnHkWYmAs/kpyT2L8F/MOw+ZA6U0gSLrlQ42/tC/YpNHvuao5op5b1r
 8iNiHV3S1/kpoC8yH+CGptcs3JOV3gesLJSZUd347IKQ==
X-Forward-Email-ID: 688669eec509b9ee169cf33b
X-Forward-Email-Sender: rfc822; jonas@kwiboo.se, smtp.forwardemail.net,
 149.28.215.223
X-Forward-Email-Version: 1.1.7
X-Forward-Email-Website: https://forwardemail.net
X-Complaints-To: abuse@forwardemail.net
X-Report-Abuse: abuse@forwardemail.net
X-Report-Abuse-To: abuse@forwardemail.net
From: Jonas Karlman <jonas@kwiboo.se>
To: Linus Walleij <linus.walleij@linaro.org>,
	=?UTF-8?q?Alvin=20=C5=A0ipraga?= <alsi@bang-olufsen.dk>,
	Andrew Lunn <andrew@lunn.ch>,
	Vladimir Oltean <olteanv@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Heiko Stuebner <heiko@sntech.de>
Cc: "David S . Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Yao Zi <ziyao@disroot.org>,
	Chukun Pan <amadeus@jmu.edu.cn>,
	netdev@vger.kernel.org,
	linux-rockchip@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Jonas Karlman <jonas@kwiboo.se>,
	devicetree@vger.kernel.org
Subject: [PATCH 3/3] arm64: dts: rockchip: Add RTL8367RB-VB switch to Radxa E24C
Date: Sun, 27 Jul 2025 18:03:00 +0000
Message-ID: <20250727180305.381483-4-jonas@kwiboo.se>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20250727180305.381483-1-jonas@kwiboo.se>
References: <20250727180305.381483-1-jonas@kwiboo.se>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250727_110338_010974_29CD405A 
X-CRM114-Status: GOOD (  12.74  )
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

The Radxa E24C has a Realtek RTL8367RB-VB switch with four usable ports
and is connected using a fixed-link to GMAC1 on the RK3528 SoC.

Add an ethernet-switch node to describe the RTL8367RB-VB switch.

Signed-off-by: Jonas Karlman <jonas@kwiboo.se>
---
Initial testing with iperf3 showed ~930-940 Mbits/sec in one direction
and only around ~1-2 Mbits/sec in the other direction.

The RK3528 hardware design guide recommends that timing between TXCLK
and data is controlled by MAC, and timing between RXCLK and data is
controlled by PHY.

Any mix of MAC (rx/tx delay) and switch (rx/tx internal delay) did not
seem to resolve this speed issue, however dropping snps,tso seems to fix
that issue.

Unsure what is best here, should MAC or switch add the delays? Here I
just followed DT from vendor downstream tree and added rx/tx internal
delay to switch.

Vendor downstream DT also adds 'pause' to the fixed-link nodes, and this
may be something that should be added here. However, during testing flow
control always ended up being disabled so I skipped 'pause' here.

Schematics: https://dl.radxa.com/e/e24c/docs/radxa_e24c_v1200_schematic.pdf
---
 .../boot/dts/rockchip/rk3528-radxa-e24c.dts   | 55 +++++++++++++++++++
 1 file changed, 55 insertions(+)

diff --git a/arch/arm64/boot/dts/rockchip/rk3528-radxa-e24c.dts b/arch/arm64/boot/dts/rockchip/rk3528-radxa-e24c.dts
index 225f2b0c5339..26754ff7f4ef 100644
--- a/arch/arm64/boot/dts/rockchip/rk3528-radxa-e24c.dts
+++ b/arch/arm64/boot/dts/rockchip/rk3528-radxa-e24c.dts
@@ -196,6 +196,7 @@ &cpu3 {
 };
 
 &gmac1 {
+	/delete-property/ snps,tso;
 	clock_in_out = "output";
 	phy-mode = "rgmii-id";
 	phy-supply = <&avdd_rtl8367rb>;
@@ -368,6 +369,60 @@ &mdio1 {
 	reset-delay-us = <25000>;
 	reset-gpios = <&gpio4 RK_PC2 GPIO_ACTIVE_LOW>;
 	reset-post-delay-us = <100000>;
+
+	ethernet-switch@1d {
+		compatible = "realtek,rtl8365mb";
+		reg = <0x1d>;
+		pinctrl-names = "default";
+		pinctrl-0 = <&rtl8367rb_eint>;
+
+		ethernet-ports {
+			#address-cells = <1>;
+			#size-cells = <0>;
+
+			ethernet-port@0 {
+				reg = <0>;
+				label = "wan";
+			};
+
+			ethernet-port@1 {
+				reg = <1>;
+				label = "lan1";
+			};
+
+			ethernet-port@2 {
+				reg = <2>;
+				label = "lan2";
+			};
+
+			ethernet-port@3 {
+				reg = <3>;
+				label = "lan3";
+			};
+
+			ethernet-port@6 {
+				reg = <6>;
+				ethernet = <&gmac1>;
+				label = "cpu";
+				phy-mode = "rgmii-id";
+				rx-internal-delay-ps = <2000>;
+				tx-internal-delay-ps = <2000>;
+
+				fixed-link {
+					speed = <1000>;
+					full-duplex;
+				};
+			};
+		};
+
+		interrupt-controller {
+			interrupt-parent = <&gpio1>;
+			interrupts = <RK_PC2 IRQ_TYPE_LEVEL_LOW>;
+			interrupt-controller;
+			#address-cells = <0>;
+			#interrupt-cells = <1>;
+		};
+	};
 };
 
 &pinctrl {
-- 
2.50.1


