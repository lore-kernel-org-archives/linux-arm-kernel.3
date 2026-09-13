Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C43CDC88E63
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 13 Sep 2026 19:01:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=IUBpSQaA91JU4u4hSD0CHnRFwoDOkNzew04B1AEq+dc=; b=1PcahAAfIVwGcuE3zo1GVDm2ai
	gKPxvx0zop86itk+8S+PNX1QblhiY+3ejR2A+yKMiU8XobjXsQoE3kzhz7ffYJcniz8MTeBzfKl4W
	7f5lY5f7JEmkcmWMOW0n/fBy2hQz48O4AVLR9Xz0fzuuNMkjMG7TFWXctMMM7HfmUTZNbgonr97iX
	5j4oSIewMl0RM+vIhVTQwd44nE8bVCMz7ifOaw0EzdHqiVme2gKFXrDTwp0uySRGNBhpnffOn75Bc
	oatEiuInQAC9M/Yp0H4b76uk0RBtC6ryoepPxl6IMzn2/Nuwg6Gi0BsiVG5aUvurs3vJfBJwDCmU+
	GnChOapw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x5pS1-00000001y3o-2QlD;
	Sun, 13 Sep 2026 19:01:17 +0000
Received: from mail-pj2-x01.google.com ([2607:f8b0:4864:39::1])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x5pRx-00000001xz9-0GHw
	for linux-arm-kernel@lists.infradead.org;
	Sun, 13 Sep 2026 19:01:16 +0000
Received: by mail-pj2-x01.google.com with SMTP id d9443c01a7336-2dae660f31bso18547965ad.1
        for <linux-arm-kernel@lists.infradead.org>; Sun, 13 Sep 2026 12:01:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789326072; x=1789930872; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=IUBpSQaA91JU4u4hSD0CHnRFwoDOkNzew04B1AEq+dc=;
        b=O37c14BBitRmcVnUmaQC3GQe88X1lxfODOTUcl8Mwr50yRHp+NsurkpZTXxiE4T0H9
         y6I0blY6gzTP8+dWv4tZtqfxm8DocgqiPHwpuxRGRYvUhMf3Fpl5DukHETkuJz+wOy3I
         TYiDZSye8B9vGtICe6ST+kHc1tOkZLwmmMe2WIyUjxVkTiqTAbe3rkBtpXFZ5KmI+WIG
         KYTmw5hdW/p8FVm/1e4SA7i6sdJDcldnQLGGkApe3Fnx62BcsvAEWOOyrpvTTbxOgTXz
         +rrWLe/YA2X2lkYQDE/BnJr4NBmJ69Af28NVhpUiIpr6A2N0rvddgPZJxzp8xRlPPD90
         POIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789326072; x=1789930872;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=IUBpSQaA91JU4u4hSD0CHnRFwoDOkNzew04B1AEq+dc=;
        b=pbelWTTHlkXjXDUZju2IODKXTCQ1IAucQ70Kx59s/4E0XGz6XqWnL0r3TQaFt7+BxW
         J2704Gov2ZfQjeQ4vX+mHgYW4FrzinP6Zlk3YXEVa6oMYR9ewCIBCmpNU2aD/XfTChBk
         6+K3/643Gy2SEym5VX4Hni1iRLWf2Ou8QhIrnd5TldC9m8IOUOjEP0GoM6MIDFRJUxLS
         rWpNUYv2k/JJpgEuXkejQ6NaeIyQcsB1BfbxujWWfN6XAMEzdkdZYATGmM+I9690sWE9
         9wlFyyDHRPf2i0/8SWHZEI3zW8P4RVAIgGuS/gu0JA7/7llU1RlDDHcdkvu4NCfS5FPB
         rlAg==
X-Forwarded-Encrypted: i=1; AKwUvBxco7Bhat32LsbCk86dNNylt3wzdhEhK1/uD7SrjDJFSgTdclYBQrr3FQ36xw+RCGfv8Mb6yWskbuoTH5fAaygI@lists.infradead.org
X-Gm-Message-State: AFuF++nQNPmHUnr/g31sZxleikdzK8oT/prRqazF3RMSC2IoXX4y56wn
	ZV3LKKi2EkRHI5iBL5Wd4dfVlRAbB+PWp3Qw1R9GFC2MUpulQR8J0bys
X-Gm-Gg: AYBFou3bpkMmfBSR/OcVF4Yp+GlaQqucwJfHAY8zc0xwOAuBSIi4Fr07zzBfSH0NaxT
	aIZP+0Hw0yLmIOvqOneu5x3aNxuhp9OtNojwcC84GqmsRpXsVOEGTqXS/w2ADqbnxmolE7FEscC
	n17T1T008NnVzD9SYRyqX4BiyNir4hmbw1NQFh0UwZlC6OZpVaYRg1NsLmgEQs0B3chLw8znhxG
	dLdTsl/bDyf50VEmo9iguEQqxUGD1N/xbNwxfoRUuxJ3mi/xh5xol82oSyApplV+WONIMvVPhGt
	o+qCFycsT+kf5H2G1E6ovgpzwM+oVTB8mSJm5J19HxdwGxqpIIJQhShOQ8/vHN8YesqvUKeMGY+
	ShyM/Xmw5XMHpX7wm2NpPejJCoxI8jTo3tuOvM24FN1a7qIZVCtCZfdrEufAvf2pWfuhYr+wiyJ
	NGXHG2luQGYZagadBj+MlriFJoK0DHi78Yg68T7HTEz+a8akGgW4wPzj5fUbYJXQSuSSTx0Q==
X-Received: by 2002:a17:903:298f:b0:2d9:43f5:b462 with SMTP id d9443c01a7336-2dd2a1ce8d4mr275603645ad.5.1789326072035;
        Sun, 13 Sep 2026 12:01:12 -0700 (PDT)
Received: from server.lan ([168.138.199.194])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2dd2cca6b7bsm36808655ad.3.2026.09.13.12.01.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 13 Sep 2026 12:01:11 -0700 (PDT)
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
Subject: [PATCH net-next v5 10/11] arm64: dts: rockchip: rk3568-photonicat: enable SGMII LAN port
Date: Mon, 14 Sep 2026 02:58:45 +0800
Message-ID: <20260913185849.907479-11-coiaprant@gmail.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260913185849.907479-1-coiaprant@gmail.com>
References: <20260913185849.907479-1-coiaprant@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260913_120113_168159_BC644B44 
X-CRM114-Status: GOOD (  13.94  )
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


