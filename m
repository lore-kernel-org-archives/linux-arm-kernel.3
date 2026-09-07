Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 26B12C79FA0
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  7 Sep 2026 12:24:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=X/D1hOhNROXBH9BkwtZSDinntMCWhn9d0q7WKIVSWZg=; b=UCZ1XBaUFMH1VTqMmwWDWIxrZR
	yNb6Ih4g9Lfgxxrcy7dPu63isiwfpYxCsum7JjfT4qGKmilKPZxeShl3OgCSmvENsWW2vkZNdY82J
	WJ7d449jmIB1tyTF2BMSf8O2Nqzh9/h9j+rolgZfyMr1FojTbZ/NdX2a2jU6U8UDm946yejGzPVJM
	zhSlR5EE/s398Rs3PACiy6Cs3OXN9rU5wicNFUuou9nlwg/KP0mNN/Bfgz0f8EP2j/yJHynTcWSdQ
	jEy5iL2UJNU1QtWDjKaiGG52VToV2R6/YpZSwpRhRNTt3hRypP8pq55a6Wi+Jsr44e3GaQY1LkMPC
	g2FhIdmA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x3YOi-00000006n7q-3URl;
	Mon, 07 Sep 2026 12:24:28 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x3YOd-00000006n3k-48pK
	for linux-arm-kernel@bombadil.infradead.org;
	Mon, 07 Sep 2026 12:24:24 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=X/D1hOhNROXBH9BkwtZSDinntMCWhn9d0q7WKIVSWZg=; b=n4k6wCcVpHUL4g7aE4LTQTUjHw
	vDd62BZeV5NPxFGf688BrLCTc6O7He8wsPObr+Xy6sZL6a9C4jaopnYIXiaQ6LNo+99uevAQ6QvnO
	pGQ6Gz90Mi+nVQ5gEkEffiUf0WAXpXpULdqZFwKZ5Hzr8dd9O0z5qqFBoRmr9DhlSxx/tgua/giqV
	xNqu8RXFptkof09hn0azqZHKPDyqLVpZ2SmYEgS1AKX/7tqGCx7MFLFM5GQO/jbK3Kp2zoDkHsnsU
	yBGdirdMmVh3luCkTvS+pep/eiWsmCfB0iUiRdIAhfUA+Ta33+n0pux4vtvapyykqnYtBlHZtKF8u
	IaICWUPg==;
Received: from out-216.mta1.migadu.com ([2001:41d0:203:375::d8] helo=mta1.migadu.com)
	by desiato.infradead.org with esmtps (Exim 4.99.2 #2 (Red Hat Linux))
	id 1x3YOX-0000000GD9v-0RLA
	for linux-arm-kernel@lists.infradead.org;
	Mon, 07 Sep 2026 12:24:22 +0000
X-Envelope-To: linux-arm-kernel@lists.infradead.org
DKIM-Signature: a=rsa-sha256; bh=+PfgQR8CEfJqLpNHKcfKZtvUqGtZCAO1W2dqKYJta3w=;
 c=simple/simple; d=cknow-tech.com;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1788783853; v=1; x=1789388653;
 b=QSOdOmIUARYNXUYDLdxRVWljZelC2I9DrUqNn+zdeCsCsannLXu1VydQycsRLLf8x8FNkRWJ
 BuK1vKwkbt/GFtpxe1K3wKPDI+NYbvNYPkr66bM8dsYf05u0lDae4o9YPEaSOX1vbYf15CKW01B
 4jLCTLH/I3w0Id2KjgwsZABUF0aW28JnA4g8gJINDLCJersXkXzKTtSF8dufzJGtH/P1GeyzQdY
 8RfQ5SqjxOKOBKr1/n/tqMuYqaUoWhrg/7UQdqalAqw4h4P+N2TF60fcplbMlcgYjjhdPZHP/RZ
 TXhPQnmsTf/H37zz8X/0nhQV1adU5l/1nc3ln93ebmAFg==
X-Envelope-To: linux-arm-kernel@lists.infradead.org
Received: by smtp.migadu.com with ESMTPS id 377064ef5354ca5b;
	Mon, 07 Sep 2026 12:24:13 +0000
X-Mizu-Trace-ID: 377064ef5354ca5b
X-Migadu-Flow: FLOW_OUT
From: Diederik de Haas <diederik@cknow-tech.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Heiko Stuebner <heiko@sntech.de>
Cc: Joachim Eastwood <joachim.eastwood@gmail.com>,
	Marcin Juszkiewicz <marcin@juszkiewicz.com.pl>,
	Daniele Briguglio <hello@superkali.me>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Diederik de Haas <diederik@cknow-tech.com>
Subject: [PATCH 3/3] arm64: dts: rockchip: Add support for FriendlyElec NanoPC-T6 Plus
Date: Mon,  7 Sep 2026 14:22:45 +0200
Message-ID: <20260907122406.1862398-4-diederik@cknow-tech.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260907122406.1862398-1-diederik@cknow-tech.com>
References: <20260907122406.1862398-1-diederik@cknow-tech.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260907_132418_216710_3EB8498B 
X-CRM114-Status: GOOD (  14.29  )
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

The FriendlyElec NanoPC-T6 Plus is a new board in the NanoPC-T6 series.

The main differences between the NanoPC-T6 Plus and the NanoPC-T6 LTS are:
- use of LPDDR5 RAM
- addition of an M.2 B-key connector for a 4G LTE module and a companion
  NanoSIM card slot.
- 10 pin header with UART and 2x USB 2.0 host got replaced with a 3 pin
  UART header.
- different audio codec (Everest ES8389)

Add basic support for it.

Link: https://wiki.friendlyelec.com/wiki/index.php/NanoPC-T6_Plus
Link: https://wiki.friendlyelec.com/wiki/images/a/ad/NanoPC-T6_Plus_2511_SCH.pdf
Link: http://everest-semi.com/pdf/ES8389%20PB.pdf
Signed-off-by: Diederik de Haas <diederik@cknow-tech.com>
---
 arch/arm64/boot/dts/rockchip/Makefile         |  1 +
 .../dts/rockchip/rk3588-nanopc-t6-plus.dts    | 91 +++++++++++++++++++
 2 files changed, 92 insertions(+)
 create mode 100644 arch/arm64/boot/dts/rockchip/rk3588-nanopc-t6-plus.dts

diff --git a/arch/arm64/boot/dts/rockchip/Makefile b/arch/arm64/boot/dts/rockchip/Makefile
index b677914cd3f1..1bdebf3e30fc 100644
--- a/arch/arm64/boot/dts/rockchip/Makefile
+++ b/arch/arm64/boot/dts/rockchip/Makefile
@@ -204,6 +204,7 @@ dtb-$(CONFIG_ARCH_ROCKCHIP) += rk3588-lubancat-5io.dtb
 dtb-$(CONFIG_ARCH_ROCKCHIP) += rk3588-mnt-reform2.dtb
 dtb-$(CONFIG_ARCH_ROCKCHIP) += rk3588-nanopc-t6.dtb
 dtb-$(CONFIG_ARCH_ROCKCHIP) += rk3588-nanopc-t6-lts.dtb
+dtb-$(CONFIG_ARCH_ROCKCHIP) += rk3588-nanopc-t6-plus.dtb
 dtb-$(CONFIG_ARCH_ROCKCHIP) += rk3588-ok3588-c.dtb
 dtb-$(CONFIG_ARCH_ROCKCHIP) += rk3588-orangepi-5-max.dtb
 dtb-$(CONFIG_ARCH_ROCKCHIP) += rk3588-orangepi-5-plus.dtb
diff --git a/arch/arm64/boot/dts/rockchip/rk3588-nanopc-t6-plus.dts b/arch/arm64/boot/dts/rockchip/rk3588-nanopc-t6-plus.dts
new file mode 100644
index 000000000000..f23ac4bd9f16
--- /dev/null
+++ b/arch/arm64/boot/dts/rockchip/rk3588-nanopc-t6-plus.dts
@@ -0,0 +1,91 @@
+// SPDX-License-Identifier: (GPL-2.0+ OR MIT)
+/*
+ * Copyright (c) 2021 Rockchip Electronics Co., Ltd.
+ * Copyright (c) 2023 Thomas McKahan
+ * Copyright (c) 2024 Linaro Ltd.
+ */
+
+/dts-v1/;
+
+#include "rk3588-nanopc-t6.dtsi"
+
+/ {
+	model = "FriendlyElec NanoPC-T6 Plus";
+	compatible = "friendlyarm,nanopc-t6-plus", "rockchip,rk3588";
+
+	codec_es_3v3: regulator-codec-es-3v3 {
+		compatible = "regulator-fixed";
+		regulator-min-microvolt = <3300000>;
+		regulator-max-microvolt = <3300000>;
+		regulator-name = "codec_es_3v3";
+		vin-supply = <&vcc4v0_sys>;
+	};
+
+	usb2_port_5v: regulator-usb2-port-5v {
+		compatible = "regulator-fixed";
+		enable-active-high;
+		gpio = <&gpio1 RK_PA4 GPIO_ACTIVE_HIGH>;
+		pinctrl-0 = <&usb20_host_pwren_h_pin>;
+		pinctrl-names = "default";
+		regulator-min-microvolt = <5000000>;
+		regulator-max-microvolt = <5000000>;
+		regulator-name = "usb2_port_5v";
+		vin-supply = <&vcc5v0_sys>;
+	};
+};
+
+&analog_sound {
+	compatible = "audio-graph-card";
+	hp-det-gpios = <&gpio1 RK_PC4 GPIO_ACTIVE_LOW>;
+	label = "rk3588-es8389";
+
+	dais = <&i2s0_8ch_p0>;
+	routing = "Headphones", "HPOL",
+		  "Headphones", "HPOR",
+		  "INPUT1", "Microphones Connector",
+		  "INPUT2", "Microphones Connector";
+	widgets = "Headphone", "Headphones",
+		  "Microphone", "Microphones Connector";
+};
+
+&i2c7 {
+	codec@10 {
+		compatible = "everest,es8389";
+		reg = <0x10>;
+		assigned-clocks = <&cru I2S0_8CH_MCLKOUT_TO_IO>;
+		assigned-clock-rates = <12288000>;
+		clocks = <&cru I2S0_8CH_MCLKOUT_TO_IO>;
+		clock-names = "mclk";
+		#sound-dai-cells = <0>;
+		vdda-supply = <&codec_es_3v3>;
+		vddd-supply = <&vcc_1v8_s3>;
+
+		port {
+			es8389_p0_0: endpoint {
+				remote-endpoint = <&i2s0_8ch_p0_0>;
+			};
+		};
+	};
+};
+
+&i2s0_8ch {
+	i2s0_8ch_p0: port {
+		i2s0_8ch_p0_0: endpoint {
+			dai-format = "i2s";
+			mclk-fs = <256>;
+			remote-endpoint = <&es8389_p0_0>;
+		};
+	};
+};
+
+&pinctrl {
+	usb {
+		usb20_host_pwren_h_pin: usb20-host-pwren-h-pin {
+			rockchip,pins = <1 RK_PA4 RK_FUNC_GPIO &pcfg_pull_none>;
+		};
+	};
+};
+
+&u2phy2_host {
+	phy-supply = <&usb2_port_5v>;
+};
-- 
2.55.0


