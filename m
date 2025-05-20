Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 41EC5C54E71
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 20 May 2025 19:01:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=9NVX9DGWtltArDSsIhCoLb3HU2s5EyD0+aa+l4lHxvk=; b=E7v10PRO158W50WA88S3xjkFgO
	A4yBLhiIsq2RJR+Gd9IVLxnthGrJ0XwcQHKmz79ROrzcNxSEyRmI0JlG7OExHFwdFII6PjJK0jhfP
	dLdU6jnzycMk1Wpx3pufCaAKfqyBaLgnSwOeWr4WWZAwPvtJECx4gR6jO7hfJaVdkQ+j18EcFzW7V
	Af6pt7RpD4Ss6cDD4G4En+KlX3CDhdrhtWNibsbqQLyUw5uTerXXcZukbhwPH0foISx19ysO26nyj
	1zdsniDSDxpJE93ty9e9GhHFlEw3NI6U01YlQM5r7Ay8QMJZiHAS7RpDV/6Im34Ub7VMX8DUh/EfD
	svqwjFtg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uHSDW-0000000DsZD-102E;
	Tue, 20 May 2025 19:01:34 +0000
Received: from sender4-pp-f112.zoho.com ([136.143.188.112])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uHS35-0000000DrBi-06OC;
	Tue, 20 May 2025 18:50:48 +0000
ARC-Seal: i=1; a=rsa-sha256; t=1747767038; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=RGUw8ODNuHBjEdFA8J69cfIu7ncEa5ht6r/4SOWdZUv6DlbInBKy4gvWpKJh11CddyyuZzrwB9bUq7J/qbmUbicik/mTLlWALIza2VexASRetGnfrudGhRAMHk2oHSxNghAqci2alKUcl/okp4FcFlP+jAbZZCUFLqr67MIRuek=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1747767038; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=9NVX9DGWtltArDSsIhCoLb3HU2s5EyD0+aa+l4lHxvk=; 
	b=JOEy2iXkUISax9rLv4VVTpIofaYNQHZ7d6YqpbGUcDDOPajsGmLLBypb3oSphenGdHeuShguPXU74Sj2qTGlOlLLOfwqHyIL82cBUQlyd4+ocCWJ7fQk0oFSfCBZWYSunnKf5nroIZfEH7OJqS/fmwwRhbHvjhjqpl6BvJ5jeZ8=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=nicolas.frattaroli@collabora.com;
	dmarc=pass header.from=<nicolas.frattaroli@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1747767038;
	s=zohomail; d=collabora.com; i=nicolas.frattaroli@collabora.com;
	h=From:From:Date:Date:Subject:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:Message-Id:References:In-Reply-To:To:To:Cc:Cc:Reply-To;
	bh=9NVX9DGWtltArDSsIhCoLb3HU2s5EyD0+aa+l4lHxvk=;
	b=GvjYfsx+VpE4F/7noSi3CG2q9YkBwTtkhxIvWN9vFHeKaUW79edGpOL88ge1y0RE
	Wcf7xWEAHOEQTpFjFN1bXuqZ6h7eebTMvvapVX7QKPZSnTufiH+vHLFdgVBjaOqNxkD
	no/PBrg1Emos0IuNVneESzlEhWQQ8ZgRmjPzvk4Y=
Received: by mx.zohomail.com with SMTPS id 1747767037706798.1912513861447;
	Tue, 20 May 2025 11:50:37 -0700 (PDT)
From: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
Date: Tue, 20 May 2025 20:50:11 +0200
Subject: [PATCH v2 4/4] arm64: dts: rockchip: add ROCK 5T device tree
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250520-add-rock5t-v2-4-1f1971850a20@collabora.com>
References: <20250520-add-rock5t-v2-0-1f1971850a20@collabora.com>
In-Reply-To: <20250520-add-rock5t-v2-0-1f1971850a20@collabora.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>, 
 Sebastian Reichel <sebastian.reichel@collabora.com>
Cc: kernel@collabora.com, devicetree@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, 
 linux-kernel@vger.kernel.org, 
 Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
X-Mailer: b4 0.14.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250520_115047_110007_3BF7E968 
X-CRM114-Status: GOOD (  12.69  )
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

The RADXA ROCK 5T is a single board computer quite similar to the ROCK
5B+, except it has one more PCIe-to-Ethernet controller (at the expense
of a USB3 port) and a barrel jack for power input instead. Some pins are
shuffled around as well.

Add a device tree for it.

Signed-off-by: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
---
 arch/arm64/boot/dts/rockchip/Makefile           |   1 +
 arch/arm64/boot/dts/rockchip/rk3588-rock-5t.dts | 105 ++++++++++++++++++++++++
 2 files changed, 106 insertions(+)

diff --git a/arch/arm64/boot/dts/rockchip/Makefile b/arch/arm64/boot/dts/rockchip/Makefile
index 4bf84622db473696f64b157ba94560f476d4f52f..3ae12aad3e56db155dd0754dfcc7e6441d5071b4 100644
--- a/arch/arm64/boot/dts/rockchip/Makefile
+++ b/arch/arm64/boot/dts/rockchip/Makefile
@@ -174,6 +174,7 @@ dtb-$(CONFIG_ARCH_ROCKCHIP) += rk3588-rock-5b.dtb
 dtb-$(CONFIG_ARCH_ROCKCHIP) += rk3588-rock-5b-pcie-ep.dtbo
 dtb-$(CONFIG_ARCH_ROCKCHIP) += rk3588-rock-5b-pcie-srns.dtbo
 dtb-$(CONFIG_ARCH_ROCKCHIP) += rk3588-rock-5b-plus.dtb
+dtb-$(CONFIG_ARCH_ROCKCHIP) += rk3588-rock-5t.dtb
 dtb-$(CONFIG_ARCH_ROCKCHIP) += rk3588-tiger-haikou.dtb
 dtb-$(CONFIG_ARCH_ROCKCHIP) += rk3588-tiger-haikou-video-demo.dtbo
 dtb-$(CONFIG_ARCH_ROCKCHIP) += rk3588-toybrick-x0.dtb
diff --git a/arch/arm64/boot/dts/rockchip/rk3588-rock-5t.dts b/arch/arm64/boot/dts/rockchip/rk3588-rock-5t.dts
new file mode 100644
index 0000000000000000000000000000000000000000..258c7400301d7f77517197ab433946bbfa39cf63
--- /dev/null
+++ b/arch/arm64/boot/dts/rockchip/rk3588-rock-5t.dts
@@ -0,0 +1,105 @@
+// SPDX-License-Identifier: (GPL-2.0+ OR MIT)
+
+/dts-v1/;
+
+#include "rk3588-rock-5b-5bp-5t.dtsi"
+
+/ {
+	model = "Radxa ROCK 5T";
+	compatible = "radxa,rock-5t", "rockchip,rk3588";
+
+	analog-sound {
+		compatible = "audio-graph-card";
+		label = "rk3588-es8316";
+
+		widgets = "Microphone", "Mic Jack",
+		"Headphone", "Headphones";
+
+		routing = "MIC2", "Mic Jack",
+		"Headphones", "HPOL",
+		"Headphones", "HPOR";
+
+		dais = <&i2s0_8ch_p0>;
+		hp-det-gpios = <&gpio4 RK_PC3 GPIO_ACTIVE_HIGH>;
+		pinctrl-names = "default";
+		pinctrl-0 = <&hp_detect>;
+	};
+
+	leds {
+		compatible = "gpio-leds";
+		pinctrl-names = "default";
+		pinctrl-0 = <&led_rgb_b>;
+
+		led_rgb_b {
+			function = LED_FUNCTION_STATUS;
+			color = <LED_COLOR_ID_BLUE>;
+			gpios = <&gpio0 RK_PA0 GPIO_ACTIVE_HIGH>;
+			linux,default-trigger = "heartbeat";
+		};
+	};
+
+	rfkill {
+		compatible = "rfkill-gpio";
+		label = "rfkill-m2-wlan";
+		radio-type = "wlan";
+		shutdown-gpios = <&gpio1 RK_PB0 GPIO_ACTIVE_HIGH>;
+	};
+
+	vcc3v3_pcie2x1l1: regulator-vcc3v3-pcie2x1l2 {
+		compatible = "regulator-fixed";
+		regulator-name = "vcc3v3_pcie2x1l1";
+		regulator-min-microvolt = <3300000>;
+		regulator-max-microvolt = <3300000>;
+		startup-delay-us = <5000>;
+		vin-supply = <&vcc_3v3_s3>;
+	};
+};
+
+&hdmi_receiver {
+	hpd-gpios = <&gpio2 RK_PB7 GPIO_ACTIVE_LOW>;
+	status = "okay";
+};
+
+&pcie2x1l1 {
+	pinctrl-names = "default";
+	pinctrl-0 = <&pcie2_1_rst>;
+	reset-gpios = <&gpio4 RK_PA2 GPIO_ACTIVE_HIGH>;
+	vpcie3v3-supply = <&vcc3v3_pcie2x1l1>;
+	status = "okay";
+};
+
+&pinctrl {
+	hdmirx {
+		hdmirx_hpd: hdmirx-5v-detection {
+			rockchip,pins = <2 RK_PB7 RK_FUNC_GPIO &pcfg_pull_none>;
+		};
+	};
+
+	leds {
+		led_rgb_b: led-rgb-b {
+			rockchip,pins = <0 RK_PA0 RK_FUNC_GPIO &pcfg_pull_none>;
+		};
+	};
+
+	pcie2 {
+		pcie2_1_rst: pcie2-1-rst {
+			rockchip,pins = <4 RK_PA2 RK_FUNC_GPIO &pcfg_pull_none>;
+		};
+		pcie2_0_vcc3v3_en: pcie2-0-vcc-en {
+			rockchip,pins = <2 RK_PC0 RK_FUNC_GPIO &pcfg_pull_none>;
+		};
+	};
+
+	sound {
+		hp_detect: hp-detect {
+			rockchip,pins = <4 RK_PC3 RK_FUNC_GPIO &pcfg_pull_none>;
+		};
+	};
+};
+
+&vcc3v3_pcie2x1l0 {
+	gpios = <&gpio2 RK_PC0 GPIO_ACTIVE_HIGH>;
+	pinctrl-names = "default";
+	pinctrl-0 = <&pcie2_0_vcc3v3_en>;
+	status = "okay";
+};

-- 
2.49.0


