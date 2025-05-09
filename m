Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8DBCCC3ABBC
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  9 May 2025 13:33:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=wnIutrqgp/730meJXqnExUugfDBuXd3SUC7bTU9HmFk=; b=MOwZaME3l9bk+IQACwKv7Kzn99
	rfgfJaRQbdXSGF2hdRAKLY62S+bJ7xn9c2SzuElRiVnrgQCi3nuqsus1dq/p0lm+MjL1XYNMNKhKA
	p3RsQce7nqw+NTOcjvD9S47k7nGGqUHQWsB0/W0KK2pX3jLnK/REo+aZKxaJHPXLDcdcPxeJKPptb
	I/b7sL3XfMuIfvcYC3AC98+HiXPyiFwCli7g/C0hVgd1QvZQyiBUjkXXDr0Mr7lZmbfZeoHeXrAgg
	N5pasZx8eCgV2TmGc6uWeTdANUf4m12l/ws3lfTor3aEg8SBV6oAqzuFXx+M6F8/CFUVXH63z2NJB
	6JKftZKQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uDNrD-00000003mdY-3Zpa;
	Fri, 09 May 2025 13:33:43 +0000
Received: from sender3-pp-f112.zoho.com ([136.143.184.112])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uDMu2-00000003bM7-0ui4;
	Fri, 09 May 2025 12:32:35 +0000
ARC-Seal: i=1; a=rsa-sha256; t=1746793941; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=c7VXHe948DTKp7d2H26qPUXEhomzSFxR9cRa8Y6nx8TM6VFsXLkkU2Nu4fkrl+Km6TGHr6RlYPhQhCLjnmyau2Z/e9plPyVFWlcq7cDB7ZbafK3tQUqhJ2N/b092CGTcAK/HG1ctb6gdqVPid0mUt7ySRv+Gj9rVQeHYE77vUKM=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1746793941; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=wnIutrqgp/730meJXqnExUugfDBuXd3SUC7bTU9HmFk=; 
	b=WKu6rt4vLK9C1qfDjFYzZf8uKsVUvtxQwfLh+fm0w1JYj3IuiCcr08UyrkB2bWVd27GfJeWKXMq8fVKg/Os3vzYOaLeEa1BMwERwN7AbPAFDfc+bhlcgsL4PAhgNxdW9XsotaVgNSQNjAUb010DzyupXBr3zKjLmueUzJ0HyW5w=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=nicolas.frattaroli@collabora.com;
	dmarc=pass header.from=<nicolas.frattaroli@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1746793941;
	s=zohomail; d=collabora.com; i=nicolas.frattaroli@collabora.com;
	h=From:From:Date:Date:Subject:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:Message-Id:References:In-Reply-To:To:To:Cc:Cc:Reply-To;
	bh=wnIutrqgp/730meJXqnExUugfDBuXd3SUC7bTU9HmFk=;
	b=We3Wo5GmSp/9cX4H6r0+SHvNk3PeAtKI1Vwj2iQjSCOWi4pwZR373XpI2LRQK4Vv
	c6ENe1EMasRh5d/A9ZzfiZY5eRxIKN2e92qNhpLrripH4D0CQcVepnquSUjYOTAq7A+
	QXn0fsirYt58AQ9hwZp0MrQvGxz6cNt3fWgLHG3I=
Received: by mx.zohomail.com with SMTPS id 1746793940560889.20581442018;
	Fri, 9 May 2025 05:32:20 -0700 (PDT)
From: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
Date: Fri, 09 May 2025 14:31:43 +0200
Subject: [PATCH 3/3] arm64: dts: rockchip: add ROCK 5T device tree
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250509-add-rock5t-v1-3-cff1de74eced@collabora.com>
References: <20250509-add-rock5t-v1-0-cff1de74eced@collabora.com>
In-Reply-To: <20250509-add-rock5t-v1-0-cff1de74eced@collabora.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>, 
 Sebastian Reichel <sebastian.reichel@collabora.com>
Cc: kernel@collabora.com, devicetree@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, 
 linux-kernel@vger.kernel.org, 
 Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
X-Mailer: b4 0.14.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250509_053234_305640_263D7586 
X-CRM114-Status: GOOD (  12.83  )
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
index 7a05bd885d5ecb96c3decbd3f483a6c58b81e0ab..eee0b27ca9f6a330baae8b50ca6aaed5de56227f 100644
--- a/arch/arm64/boot/dts/rockchip/Makefile
+++ b/arch/arm64/boot/dts/rockchip/Makefile
@@ -166,6 +166,7 @@ dtb-$(CONFIG_ARCH_ROCKCHIP) += rk3588-rock-5b.dtb
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


