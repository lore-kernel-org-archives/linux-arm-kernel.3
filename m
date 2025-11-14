Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 28BD8CE8D49
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 14 Nov 2025 15:47:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Date:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:
	Subject:Cc:To:From:Reply-To:Content-Type:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=QQbIfX/e7L2Hjji4hrnqJhqqQ8Tj+/C9kUGfqZBFGkc=; b=J6p6oyjij+RjS1
	/DpCX6ofIyMq37VL7QUWathp4TKk8nlMGt3jzJoVPryKVh262lwQeRfkWlDGxBkmeK4KM3nZ2eBqw
	GiF1pox6KHwVAt4+3kVYKIb60C5tq9V5yP948J/4MJ/wlgD4JnKnPK/1b7PvkWgFoECgmUmc6RUMx
	SdeDEa85l8jOqnYxnpkfr6CfR2coCwJjC5vOblP02IPz9VKl9uYdm1IjrTZ0LtyiW1veFM+8T3cwJ
	nxjAOoCmljNcvzXzncRyzLG2pJ+6NX0pjsg9Fycp2iDfGANem7o+4r4Y3A221OICaU151/kM/sVc5
	gWdM1+SlROiJCS8Ywj2g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vJw0u-0000000Cbis-31k8;
	Fri, 14 Nov 2025 15:47:04 +0000
Received: from crocodile.ash.relay.mailchannels.net ([23.83.222.45])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vJw0s-0000000Cbh7-2ITH;
	Fri, 14 Nov 2025 15:47:04 +0000
X-Sender-Id: hostingeremail|x-authuser|michael.opdenacker@rootcommit.com
Received: from relay.mailchannels.net (localhost [127.0.0.1])
	by relay.mailchannels.net (Postfix) with ESMTP id DE3BC582ADA;
	Fri, 14 Nov 2025 15:47:00 +0000 (UTC)
Received: from de-fra-smtpout10.hostinger.io (100-98-43-111.trex-nlb.outbound.svc.cluster.local [100.98.43.111])
	(Authenticated sender: hostingeremail)
	by relay.mailchannels.net (Postfix) with ESMTPA id 9CF505812A4;
	Fri, 14 Nov 2025 15:46:58 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; d=mailchannels.net; s=arc-2022; cv=none;
	t=1763135220;
	b=ZgJKE2sWqSNEcF3/Mm6uxKy5g63h6XWg5l2CM5/XtwYkOMbpcDkjvjEXHGjPPulZLISmx/
	ZM7wi4jKRHhG0uiQDD+2i55NWpAqaa58eqT9eU0ZLWtU+nEimTuZgaU5q+cdoWiP68Nh2q
	aOaXC+moz6iUI+LfhejrsTFTtDxPBU/XzWre1TCfV3xTavW3ObYFTADnLHg0oTwRTdPprj
	ZgQjy3IukSfz2AYdx3+z2eaYNPndyAcg6uwArXXbChPpwQUuTgJL+vNgolAFU/EWiOv5r5
	/SueyM7zuCA68C4g5dCJWzhgy3KgpMEAE4dVNS83Hqpxb0IfhpUW71i+IiSLsw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mailchannels.net;
	s=arc-2022; t=1763135220;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:dkim-signature;
	bh=QQbIfX/e7L2Hjji4hrnqJhqqQ8Tj+/C9kUGfqZBFGkc=;
	b=hSu2BVY73EwPt0oYjHh4cnf/wRpAd102VHuKAg1ucGbYAn/efrPSOvc0fl9BaErvZSZ4gT
	NtuFum3vPJNFgg7V92FDM1pU0YP8AKa67rNjzeqqUk9NDs5+a+/z4tigiVK/O1WmLgXbgn
	WWeSWFwIfWGLSkv99TBG4XNXu7CQFtg/1wNit8KxfE8Oa+AbkhBt2u5HIr5ScaLWfOtZ2q
	vr9m3oo86QkX+tZ5ox000IVhKiqcJzk3LjMsoAtRb88eiUfI9+OAr8mtdKG2lUCNcYbxkH
	ges6NaV1DXamfT1K5oQZL0IJAlSIKumwy3YG9jKpTo/vHRseXCJfRlg/hatPsQ==
ARC-Authentication-Results: i=1;
	rspamd-dd986fb9b-mrs7n;
	auth=pass smtp.auth=hostingeremail
 smtp.mailfrom=michael.opdenacker@rootcommit.com
X-Sender-Id: hostingeremail|x-authuser|michael.opdenacker@rootcommit.com
X-MC-Relay: Neutral
X-MailChannels-SenderId: hostingeremail|x-authuser|michael.opdenacker@rootcommit.com
X-MailChannels-Auth-Id: hostingeremail
X-Spot-Broad: 55dd3add0bc52cf7_1763135220805_980956327
X-MC-Loop-Signature: 1763135220805:2032842824
X-MC-Ingress-Time: 1763135220805
Received: from de-fra-smtpout10.hostinger.io (de-fra-smtpout10.hostinger.io
 [148.222.55.9])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384)
	by 100.98.43.111 (trex/7.1.3);
	Fri, 14 Nov 2025 15:47:00 +0000
Received: from dell2016.. (unknown [IPv6:2a04:cec0:122b:2b8b:6420:6800:bae7:cb5a])
	(Authenticated sender: michael.opdenacker@rootcommit.com)
	by smtp.hostinger.com (smtp.hostinger.com) with ESMTPSA id 4d7M2S0cLCz3wmT;
	Fri, 14 Nov 2025 15:46:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=rootcommit.com;
	s=hostingermail-a; t=1763135217;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=QQbIfX/e7L2Hjji4hrnqJhqqQ8Tj+/C9kUGfqZBFGkc=;
	b=WrJUGJzn0Vx7KWnqS3KpX4cYIooaz0EFI/lLceQQ7Tmlu2IhED/dBnlXL04uaJ0B8kVRo8
	2JgS1vlH+cXaOSGxd+QiKcCCJxQVW7KHUsGuFnHI/wEDbuKfl1aa92DLNt37EO1AvlRfhn
	QA34A81MHG6A5Jrikrq2AsBIqtI0bBvK49AZvscHisd02kLmJEBjtoHEj626AX+aQVp1u5
	YQRVFcgeXVoz/K8RvCEQ0NNPa/MoWZaGya48ixTFOdvUgyTyjh3KCqcO37+SXHNqbVHkWm
	1KIntLd2G5vEu++n+XTmJnE4KUrhOZ9U2DSHxSYGvKdzP1JYPc+eR+mgkj4NxA==
From: michael.opdenacker@rootcommit.com
To: robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	heiko@sntech.de,
	dsimic@manjaro.org
Cc: devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Michael Opdenacker <michael.opdenacker@rootcommit.com>
Subject: [PATCH v2 2/2] arm64: dts: rockchip: Add Asus Tinker Board 3 and 3S device tree
Message-ID: <20251114154617.69950-3-michael.opdenacker@rootcommit.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251114154617.69950-1-michael.opdenacker@rootcommit.com>
References: <20251114154617.69950-1-michael.opdenacker@rootcommit.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Date: Fri, 14 Nov 2025 15:46:56 +0000 (UTC)
X-CM-Envelope: MS4xfN8CS5sYzq7r8E4i3ACUJTjxxcQCP6oV3/sYP5W0Qx1GIhJ/ZUWFNrdno5Gp+2kb9MqrGomO7ULHFJdLv1c2YzM76PqeFD9ETVBkJIiOw5P/yPiIFttS hfqzzdFdR4qj1LwGvl5QeijWNAWzhEbtLtv4ypNkmy2BNy5dW6mG5dX3RIAAKzuf0uL9Z+uHgy+xYNfV8psAlBLuEHm5kH0PmZc+ZZ3IPmcD4kcQctYGX+ql Ek3zhcLFn9hs2c6siH7gfrKH3m/F54T7vwZd7bJW+yfgLgWxWH4468xhQHRPBmarj9iVyKWte2H1vzxbyefM7byVUVek1Y/BSyszmlOmX1wuF4KGZhJ5VxQw tqwkeUMX1oFXg0CDUOL/VQ/yUnrrsK4yqK3F6lqMLAPiXuR4zXWwS9EYwa6jkTKlN+PZcebwpW4SViMazfsPTHcBz0wClaSoL1+0YXBL2qqQfe0GLcwywoau cPHesTB4Vz9zEzdMVAz9NumMufDonD69u2InR9D2VfS/dofyFjNF79rw05AWIV4nhuVVEH864IqTcTD29uatTgmoXf6iOIBswva7geoopLlh7heMUQ5CMO0O VmaArT0rSbrrPetds+6A/uZp
X-CM-Analysis: v=2.4 cv=Ceda56rl c=1 sm=1 tr=0 ts=69174ef0 a=xg8E7M7z/s+QKb9omSVFuA==:617 a=xqWC_Br6kY4A:10 a=-Yt9tNsTAAAA:8 a=d70CFdQeAAAA:8 a=UExLb9lNAcT1OAPvKMMA:9 a=qPQde0g9OtMA:10 a=HTceBwxjnJgA:10 a=NcxpMcIZDGm-g932nG_k:22
X-AuthUser: michael.opdenacker@rootcommit.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251114_074702_793903_BD6B246B 
X-CRM114-Status: GOOD (  13.23  )
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

From: Michael Opdenacker <michael.opdenacker@rootcommit.com>

Add initial device tree support for Asus Tinker Board 3 [1] and 3S [2],
which are SBCs based on the Rockchip 3566 SoC.

The "3S" version ("S" for "storage") just adds a 16 GB eMMC
and a "mask ROM" DIP switch (to mask the eMMC and enter "Mask ROM"
mode for recovery) to the "3" version.

This adds support for:
- Debug UART (/dev/ttyS2)
- SD card (/dev/mmcblk1)
- eMMC (/dev/mmcblk0, only on Tinker Board 3S)
- I2C:
  - i2c0 (internal bus with a PMIC and regulators)
  - i2c2 (internal bus with an at24 eeprom and an RTC device)
- USB 2.0 ports
- 2 GPIO LEDS

[1] https://tinker-board.asus.com/series/tinker-board-3.html
[2] https://tinker-board.asus.com/series/tinker-board-3s.html

Signed-off-by: Michael Opdenacker <michael.opdenacker@rootcommit.com>
---
 arch/arm64/boot/dts/rockchip/Makefile         |   2 +
 .../dts/rockchip/rk3566-tinker-board-3.dts    |  14 +
 .../dts/rockchip/rk3566-tinker-board-3.dtsi   | 280 ++++++++++++++++++
 .../dts/rockchip/rk3566-tinker-board-3s.dts   |  30 ++
 4 files changed, 326 insertions(+)
 create mode 100644 arch/arm64/boot/dts/rockchip/rk3566-tinker-board-3.dts
 create mode 100644 arch/arm64/boot/dts/rockchip/rk3566-tinker-board-3.dtsi
 create mode 100644 arch/arm64/boot/dts/rockchip/rk3566-tinker-board-3s.dts

diff --git a/arch/arm64/boot/dts/rockchip/Makefile b/arch/arm64/boot/dts/rockchip/Makefile
index ad684e3831bc..e0d8b9ed176d 100644
--- a/arch/arm64/boot/dts/rockchip/Makefile
+++ b/arch/arm64/boot/dts/rockchip/Makefile
@@ -130,6 +130,8 @@ dtb-$(CONFIG_ARCH_ROCKCHIP) += rk3566-lubancat-1.dtb
 dtb-$(CONFIG_ARCH_ROCKCHIP) += rk3566-nanopi-r3s.dtb
 dtb-$(CONFIG_ARCH_ROCKCHIP) += rk3566-bigtreetech-cb2-manta.dtb
 dtb-$(CONFIG_ARCH_ROCKCHIP) += rk3566-bigtreetech-pi2.dtb
+dtb-$(CONFIG_ARCH_ROCKCHIP) += rk3566-tinker-board-3.dtb
+dtb-$(CONFIG_ARCH_ROCKCHIP) += rk3566-tinker-board-3s.dtb
 dtb-$(CONFIG_ARCH_ROCKCHIP) += rk3568-bpi-r2-pro.dtb
 dtb-$(CONFIG_ARCH_ROCKCHIP) += rk3568-evb1-v10.dtb
 dtb-$(CONFIG_ARCH_ROCKCHIP) += rk3568-fastrhino-r66s.dtb
diff --git a/arch/arm64/boot/dts/rockchip/rk3566-tinker-board-3.dts b/arch/arm64/boot/dts/rockchip/rk3566-tinker-board-3.dts
new file mode 100644
index 000000000000..af11faff5564
--- /dev/null
+++ b/arch/arm64/boot/dts/rockchip/rk3566-tinker-board-3.dts
@@ -0,0 +1,14 @@
+// SPDX-License-Identifier: (GPL-2.0 OR MIT)
+/*
+ * Copyright (C) 2025 Michael Opdenacker <michael.opdenacker@rootcommit.com>
+ */
+
+/dts-v1/;
+
+#include "rk3566-tinker-board-3.dtsi"
+
+/ {
+	model = "Asus Tinker Board 3";
+	compatible = "asus,rk3566-tinker-board-3", "rockchip,rk3566";
+};
+
diff --git a/arch/arm64/boot/dts/rockchip/rk3566-tinker-board-3.dtsi b/arch/arm64/boot/dts/rockchip/rk3566-tinker-board-3.dtsi
new file mode 100644
index 000000000000..8544d56031f2
--- /dev/null
+++ b/arch/arm64/boot/dts/rockchip/rk3566-tinker-board-3.dtsi
@@ -0,0 +1,280 @@
+// SPDX-License-Identifier: (GPL-2.0 OR MIT)
+/*
+ * Copyright (C) 2025 Michael Opdenacker <michael.opdenacker@rootcommit.com>
+ */
+
+#include <dt-bindings/gpio/gpio.h>
+#include <dt-bindings/leds/common.h>
+#include <dt-bindings/pinctrl/rockchip.h>
+#include <dt-bindings/soc/rockchip,vop2.h>
+#include "rk3566.dtsi"
+
+/ {
+	aliases {
+		i2c0 = &i2c0;
+		i2c2 = &i2c2;
+		mmc1 = &sdmmc0;
+		serial2 = &uart2;
+	};
+
+	chosen {
+		stdout-path = "serial2:1500000n8";
+	};
+
+	gpio_leds: gpio-leds {
+		compatible = "gpio-leds";
+
+		act-led {
+			gpios = <&gpio0 RK_PD4 GPIO_ACTIVE_HIGH>;
+			linux,default-trigger="mmc1";
+		};
+
+		rsv-led {
+			gpios = <&gpio0 RK_PD6 GPIO_ACTIVE_HIGH>;
+			linux,default-trigger="none";
+		};
+	};
+
+	vcc3v3_sys: regulator-3v3-vcc-sys {
+		compatible = "regulator-fixed";
+		regulator-name = "vcc3v3_sys";
+		regulator-always-on;
+		regulator-boot-on;
+		regulator-min-microvolt = <3300000>;
+		regulator-max-microvolt = <3300000>;
+		vin-supply = <&vcc5v0_sys>;
+	};
+
+	vcc5v0_sys: regulator-5v0-vcc-sys {
+		compatible = "regulator-fixed";
+		regulator-name = "vcc5v0_sys";
+		regulator-always-on;
+		regulator-boot-on;
+		regulator-min-microvolt = <5000000>;
+		regulator-max-microvolt = <5000000>;
+	};
+
+	vcc5v0_usb_host: regulator-5v0-vcc-usb-host {
+		compatible = "regulator-fixed";
+		enable-active-high;
+		gpios = <&gpio0 RK_PA6 GPIO_ACTIVE_HIGH>;
+		pinctrl-names = "default";
+		pinctrl-0 = <&usb_host_pwren_h>;
+		regulator-name = "vcc5v0_usb_host";
+		regulator-min-microvolt = <5000000>;
+		regulator-max-microvolt = <5000000>;
+		vin-supply = <&vcc5v0_sys>;
+	};
+};
+
+&cpu0 {
+	cpu-supply = <&vdd_cpu>;
+};
+
+&cpu1 {
+	cpu-supply = <&vdd_cpu>;
+};
+
+&cpu2 {
+	cpu-supply = <&vdd_cpu>;
+};
+
+&cpu3 {
+	cpu-supply = <&vdd_cpu>;
+};
+
+&i2c0 {
+	status = "okay";
+
+	rk809: pmic@20 {
+		compatible = "rockchip,rk809";
+		reg = <0x20>;
+		assigned-clocks = <&cru I2S1_MCLKOUT_TX>;
+		assigned-clock-parents = <&cru CLK_I2S1_8CH_TX>;
+		#clock-cells = <1>;
+		clocks = <&cru I2S1_MCLKOUT_TX>;
+		clock-names = "mclk";
+		clock-output-names = "rk809-clkout1", "rk809-clkout2";
+		interrupt-parent = <&gpio0>;
+		interrupts = <RK_PA3 IRQ_TYPE_LEVEL_LOW>;
+		pinctrl-names = "default";
+		pinctrl-0 = <&pmic_int_l>, <&i2s1m0_mclk>;
+		#sound-dai-cells = <0>;
+		system-power-controller;
+		wakeup-source;
+
+		vcc1-supply = <&vcc3v3_sys>;
+		vcc2-supply = <&vcc3v3_sys>;
+		vcc3-supply = <&vcc3v3_sys>;
+		vcc4-supply = <&vcc3v3_sys>;
+		vcc5-supply = <&vcc3v3_sys>;
+		vcc6-supply = <&vcc3v3_sys>;
+		vcc7-supply = <&vcc3v3_sys>;
+		vcc8-supply = <&vcc3v3_sys>;
+		vcc9-supply = <&vcc3v3_sys>;
+
+		regulators {
+			vcc_1v8: DCDC_REG5 {
+				regulator-name = "vcc_1v8";
+				regulator-always-on;
+				regulator-boot-on;
+				regulator-min-microvolt = <1800000>;
+				regulator-max-microvolt = <1800000>;
+
+				regulator-state-mem {
+					regulator-off-in-suspend;
+				};
+			};
+
+			vcc_3v3: SWITCH_REG1 {
+				regulator-name = "vcc_3v3";
+				regulator-always-on;
+				regulator-boot-on;
+
+				regulator-state-mem {
+					regulator-off-in-suspend;
+				};
+			};
+
+			vcc3v3_sd: SWITCH_REG2 {
+				regulator-name = "vcc3v3_sd";
+				regulator-always-on;
+				regulator-boot-on;
+
+				regulator-state-mem {
+					regulator-off-in-suspend;
+				};
+			};
+
+			vccio_sd: LDO_REG5 {
+				regulator-name = "vccio_sd";
+				regulator-always-on;
+				regulator-boot-on;
+				regulator-min-microvolt = <1800000>;
+				regulator-max-microvolt = <3300000>;
+
+				regulator-state-mem {
+					regulator-off-in-suspend;
+				};
+			};
+		};
+	};
+
+	vdd_cpu: regulator@40 {
+		compatible = "silergy,syr827";
+		reg = <0x40>;
+		fcs,suspend-voltage-selector = <1>;
+		regulator-name = "vdd_cpu";
+		regulator-always-on;
+		regulator-boot-on;
+		regulator-min-microvolt = <830000>;
+		regulator-max-microvolt = <1200000>;
+		regulator-ramp-delay = <2300>;
+		vin-supply = <&vcc3v3_sys>;
+
+		regulator-state-mem {
+			regulator-off-in-suspend;
+		};
+	};
+};
+
+&i2c2 {
+	status = "okay";
+
+	eeprom@50 {
+		compatible = "atmel,24c08";
+		reg = <0x50>;
+		pinctrl-names = "default";
+		pinctrl-0 = <&tb3_eeprom>;
+		status = "okay";
+	};
+
+	rtc_isl1208: rtc@6f {
+		compatible = "isil,isl1208";
+		pinctrl-names = "default";
+		pinctrl-0 = <&pinctrl_externalrtc_reg>;
+		interrupt-names = "irq";
+		interrupts-extended = <&gpio0 RK_PD3 IRQ_TYPE_EDGE_FALLING>;
+		reg = <0x6f>;
+		status = "okay";
+	};
+};
+
+&pinctrl {
+	pmic {
+		pmic_int_l: pmic-int-l {
+			rockchip,pins = <0 RK_PA3 RK_FUNC_GPIO &pcfg_pull_up>;
+		};
+	};
+
+	usb {
+		usb_host_pwren_h: usb-host-pwren-h {
+			rockchip,pins = <0 RK_PA6 RK_FUNC_GPIO &pcfg_pull_none>;
+		};
+
+		usb_otg_pwren_h: usb-otg-pwren-h {
+			rockchip,pins = <0 RK_PA5 RK_FUNC_GPIO &pcfg_pull_none>;
+		};
+	};
+
+	rtc {
+		pinctrl_externalrtc_reg: externalrtcreggrp {
+			rockchip,pins = <0 RK_PD3 RK_FUNC_GPIO &pcfg_pull_up>;
+		};
+	};
+
+	eeprom {
+		tb3_eeprom: tb3-eeprom {
+			rockchip,pins = <3 RK_PC1 RK_FUNC_GPIO &pcfg_pull_up>;
+		};
+	};
+};
+
+&sdmmc0 {
+	bus-width = <4>;
+	cap-sd-highspeed;
+	disable-wp;
+	pinctrl-names = "default";
+	pinctrl-0 = <&sdmmc0_bus4 &sdmmc0_clk &sdmmc0_cmd &sdmmc0_det>;
+	vmmc-supply = <&vcc3v3_sd>;
+	vqmmc-supply = <&vccio_sd>;
+	status = "okay";
+};
+
+&uart2 {
+	status = "okay";
+};
+
+&usb_host0_ehci {
+	status = "okay";
+};
+
+&usb_host0_ohci {
+	status = "okay";
+};
+
+&usb_host1_ehci {
+	status = "okay";
+};
+
+&usb_host1_ohci {
+	status = "okay";
+};
+
+&usb2phy0 {
+	status = "okay";
+};
+
+&usb2phy0_host {
+	phy-supply = <&vcc5v0_usb_host>;
+	status = "okay";
+};
+
+&usb2phy1 {
+	status = "okay";
+};
+
+&usb2phy1_host {
+	phy-supply = <&vcc5v0_usb_host>;
+	status = "okay";
+};
diff --git a/arch/arm64/boot/dts/rockchip/rk3566-tinker-board-3s.dts b/arch/arm64/boot/dts/rockchip/rk3566-tinker-board-3s.dts
new file mode 100644
index 000000000000..7bd1e31fdc57
--- /dev/null
+++ b/arch/arm64/boot/dts/rockchip/rk3566-tinker-board-3s.dts
@@ -0,0 +1,30 @@
+// SPDX-License-Identifier: (GPL-2.0 OR MIT)
+/*
+ * Copyright (C) 2025 Michael Opdenacker <michael.opdenacker@rootcommit.com>
+ */
+
+/dts-v1/;
+
+#include "rk3566-tinker-board-3.dtsi"
+
+/ {
+	model = "Asus Tinker Board 3S";
+	compatible = "asus,rk3566-tinker-board-3s", "asus,rk3566-tinker-board-3", "rockchip,rk3566";
+
+	aliases {
+		mmc0 = &sdhci;
+	};
+};
+
+&sdhci {
+	bus-width = <8>;
+	cap-mmc-highspeed;
+	max-frequency = <200000000>;
+	mmc-hs200-1_8v;
+	non-removable;
+	pinctrl-names = "default";
+	pinctrl-0 = <&emmc_bus8 &emmc_clk &emmc_cmd &emmc_datastrobe>;
+	vmmc-supply = <&vcc_3v3>;
+	vqmmc-supply = <&vcc_1v8>;
+	status = "okay";
+};

