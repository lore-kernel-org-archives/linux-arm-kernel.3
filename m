Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B6480CA5FB1
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 30 Sep 2026 09:31:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=iwsd3VHJyRhcMowJUNusIU8IeEyoPUjTK1f1biewTUk=; b=ak9Xh/0u8wezg+P4LfmZ0GuE6/
	1TTj/EwHZ4iH58R6j8WqGVUJOmfUxDTTQksWe02ofOpZb7hQkUbkTHMT4Cl0OF7kCtgSOp/ZbqR/Z
	OSK/cdx86EsotjMtPHsJXrGe6uYUItovmNRVPNmEkJb6YQcM+1cQRAehKHiGLRE7c0aBjjao4mjCr
	nJ0b2Y5/7mZVS+VPeEOGKfTXmGhdvdnYcYHIUSNHv8GAeJ8jFwJncvO1NNsJITHlyHsEW5PmMZtYm
	HApk0+9hKEMXQlpXZx04g7CBLVPtqoYatgNIyISQz6qNjC1GrZbAuOkrKB8K9dMgdbNfy2mWEb/x5
	7NNN7aGg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBqej-00000005Znt-2iJB;
	Wed, 30 Sep 2026 09:31:17 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBqeV-00000005ZeN-0Ru1
	for linux-arm-kernel@bombadil.infradead.org;
	Wed, 30 Sep 2026 09:31:03 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=iwsd3VHJyRhcMowJUNusIU8IeEyoPUjTK1f1biewTUk=; b=DSo65THqw4YQoJce2i3c9omSWC
	FDknn5o0Fg4eUd7HCeO4qHE5jgGntxnltzbu8UxZ6Pm2A2g7ELiAcZBv7IzU6XwV3oN08j3CO462M
	yOOpe9RhyXOzwUEYPtDuO/N+iJQFUrGJwh4nhqnACazIrdo9WciRADK9hcs2oR2tsAms2o6xOq+2L
	z/uX/uhbXyCEUeg8akS9+3q2z6LIkclUZspyE/wYP7bgsCB/cHtqD6Y3nAjLGh8E+WZler1mg2Y3d
	nwjXIbQKYoHHUZyK4bdJWJFFgg48Iz2qCy7vWwpkvrDd/XUpIGznTp43TKrtwoR/MIn2qAvnGFZJj
	CRlMhgyQ==;
Received: from mail-ej1-x636.google.com ([2a00:1450:4864:20::636])
	by desiato.infradead.org with esmtps (Exim 4.99.2 #2 (Red Hat Linux))
	id 1xBqeB-00000003aBQ-1CtB
	for linux-arm-kernel@lists.infradead.org;
	Wed, 30 Sep 2026 09:31:00 +0000
Received: by mail-ej1-x636.google.com with SMTP id a640c23a62f3a-c169ae1cb26so243575466b.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 30 Sep 2026 02:30:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790760641; x=1791365441; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=iwsd3VHJyRhcMowJUNusIU8IeEyoPUjTK1f1biewTUk=;
        b=iyYgOiW9Pvw6FD/NSEl7K0neYQscogGVlBrBibnFmWbIXwN1gzjWSFuxHMyk04MdnP
         mJR2+vk2+qPXFUv30jH15qdEu0xuBTohSNadTM89fG+7AGf2xW/zXKQCVQHj09BwcTbM
         hQCXeRFtQvw9XptmekMM3sQR+Uo7IIqdZnGYHadQiD08XtGSTLy3NWHtJEVd/GWCaYkt
         SBHR9TVtd0FNngXwP/HuAv7l0xq5RebiOtJ9JIhKNnGxW42DLbj8n+XTtQRCOfYCoHGW
         jK/9T3JiII10hCd2rVvetPceoRKMgt21OuAyuLn+C/btll2CuPfjrCX/9276RZRaHa9D
         cn8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790760641; x=1791365441;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=iwsd3VHJyRhcMowJUNusIU8IeEyoPUjTK1f1biewTUk=;
        b=Ez23JwmWhw6DFyp2SHgiguvpixrUQcM1tIhd6cfsj+/BJ8eB5GEwlfum143xgomoqd
         KWH3HjMiLqxvhe/SqarU9qek5m9B9I20vwcv/Kkh8kyTh6ytkG/Q97jIGTL9vH4o7iEI
         +A07mOG6BDPfDRoEAISp9hKwBi46fI7FLexTWSTJUyUlvCwtR1Sjbb6w88mUwXQULxiA
         BqPZ52gO30V6z1Hn5cbdgW7KmIRIDOOqXafmZQKrLeWNPIr/4aZ5udz3GE8Hrkvw0BAw
         fR8MfnkHQfSKVK2R0X24JUp1ldUjQUJup9cjm7xecQyGbLa8BDaD1GWF896VCVodJ/1z
         TPzg==
X-Forwarded-Encrypted: i=1; AKwUvBwXfEvFrzoe+MpTuUxvFrQy5gCxh9ccgRfALcjEBouQKAhUJ6Z+7mAaV/B9D7zfTPdFtOD5DRSGw5t3d7bYGCRF@lists.infradead.org
X-Gm-Message-State: AFuF++nqlGyeGNYagNFfSDpbULJm2JXAy0L+Qi4gZT2BRsOUKlVAoWjE
	6oQjO++qgUY1OcUNCBpfiP0po6A5b0CAwS0QMWq0oiOZiDRi9GHYH8ie
X-Gm-Gg: AYBFou2Z7OQebji02pIn2cjQd/0VsNIdyG5qHe6RMcDCuPTPjFLpx6yguTBJR56wE0q
	3J1CVy9M8uKLf1SkNOS8VkkxMTg25EeEJuGsDpQbhIn7bTn+jxvhBVSYMovYPr3X8tlWGdDh2H+
	C35LaldojJV5/2PSTGWK4IP8IfhqIbnYs0EBIBBB99GvoG3Z1srFfboMuXdXUO0+WiPGokQpEc+
	O0XFdeLS5nhXE1BG+Vq1g3UNY8n1RIEx/MN9rQyyNOhmAuB98mWKXrvLsFA8ERwKNtv5Q1d1bCn
	H0HXUs3+m4zrqU4ch1zaAGh5Ym/FJsVRW0sx+nfQPYAPnBHQslcfxbbHQWOFXnyW1ErS2iUq/yn
	i/1rjdjDcBorDpEdsyzoD+NNA6I5TBiu4Zwuf5RY6/5N5IS7jr8uCJD0P+0RpZI7WF62UnUqkOI
	PfkB3p+KCdtY8wx5cVhK/UlYS/LtJRQ3Lh3x9PEIsRx0VCZ2k9FHXAztQfqB3zcjJKpVQdf7UBp
	IW0+Lk5qqc=
X-Received: by 2002:a17:907:6e94:b0:c2e:7fc:ef51 with SMTP id a640c23a62f3a-c2e23da147amr59271066b.20.1790760641109;
        Wed, 30 Sep 2026 02:30:41 -0700 (PDT)
Received: from localhost.localdomain ([193.107.16.39])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6ae1568e8b2sm485221a12.19.2026.09.30.02.30.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 30 Sep 2026 02:30:40 -0700 (PDT)
From: Dmitry Yashin <dmt.yashin@gmail.com>
Date: Wed, 30 Sep 2026 14:29:06 +0500
Subject: [PATCH 3/4] arm64: dts: rockchip: add Forlinx OK3568-C
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260930-ok3568-c-v1-3-a0ffd55f5c95@gmail.com>
References: <20260930-ok3568-c-v1-0-a0ffd55f5c95@gmail.com>
In-Reply-To: <20260930-ok3568-c-v1-0-a0ffd55f5c95@gmail.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Dmitry Yashin <dmt.yashin@gmail.com>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1790760632; l=15022;
 i=dmt.yashin@gmail.com; s=20260930; h=from:subject:message-id;
 bh=8CIW9SVfhly4d1wjDC8DmgkKtm4pfnq10bCw6NQqcdk=;
 b=uLWsdjgC6GQ2UqQmt/uGffugqzr+EsuyKp5s3zHVffMaGJkuVKxBIp7E4zBqve8MguDP96nC5
 E7iXOayUuekCH5ij1gHUdlxerHXMocgFzxYpz/YHES3rEH/6DRwKbOg
X-Developer-Key: i=dmt.yashin@gmail.com; a=ed25519;
 pk=vBe9jaaOEH5bQEvfzb1tWOlz3AMIcXCu/GL/CdlwJco=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260930_103046_869882_32ED0FA8 
X-CRM114-Status: GOOD (  17.69  )
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

OK3568-C is the carrier board for FET3568-C System on Module.

OK3568-C features:

2x 1GbE Realtek RTL8211F Ethernet
1x HDMI Type A out
1x Edp and LVDS headers
2x USB Type C (2.0 and debug console)
1x USB 3.0 OTG Type A (2.0 part is multiplexed with Type C)
1x USB 3.0 M.2 M Key (4G/5G modem)
2x USB 2.0 Type A
1x PCIE 3.0 PCIe (2 lanes)
1x PCIE 2.1 PCIe (1 lane)
1x TF scard slot
1x MIPI CSI
1x MIPI DSI
2x CAN 2.0
1x RTC
1x earphone output and Speaker output, 1x mic.
50-pin expansion header
ADC keys
onboard WiFi And BT (AW-CM358SM)

Add support for Forlinx OK3568-C board.

Signed-off-by: Dmitry Yashin <dmt.yashin@gmail.com>
---
 arch/arm64/boot/dts/rockchip/Makefile            |   1 +
 arch/arm64/boot/dts/rockchip/rk3568-ok3568-c.dts | 574 +++++++++++++++++++++++
 2 files changed, 575 insertions(+)

diff --git a/arch/arm64/boot/dts/rockchip/Makefile b/arch/arm64/boot/dts/rockchip/Makefile
index e7936a21c118..48c83f79f83b 100644
--- a/arch/arm64/boot/dts/rockchip/Makefile
+++ b/arch/arm64/boot/dts/rockchip/Makefile
@@ -155,6 +155,7 @@ dtb-$(CONFIG_ARCH_ROCKCHIP) += rk3568-mecsbc.dtb
 dtb-$(CONFIG_ARCH_ROCKCHIP) += rk3568-nanopi-r5c.dtb
 dtb-$(CONFIG_ARCH_ROCKCHIP) += rk3568-nanopi-r5s.dtb
 dtb-$(CONFIG_ARCH_ROCKCHIP) += rk3568-odroid-m1.dtb
+dtb-$(CONFIG_ARCH_ROCKCHIP) += rk3568-ok3568-c.dtb
 dtb-$(CONFIG_ARCH_ROCKCHIP) += rk3568-photonicat.dtb
 dtb-$(CONFIG_ARCH_ROCKCHIP) += rk3568-qnap-ts233.dtb
 dtb-$(CONFIG_ARCH_ROCKCHIP) += rk3568-qnap-ts233-pcb-12-11.dtbo
diff --git a/arch/arm64/boot/dts/rockchip/rk3568-ok3568-c.dts b/arch/arm64/boot/dts/rockchip/rk3568-ok3568-c.dts
new file mode 100644
index 000000000000..d292df546d41
--- /dev/null
+++ b/arch/arm64/boot/dts/rockchip/rk3568-ok3568-c.dts
@@ -0,0 +1,574 @@
+// SPDX-License-Identifier: (GPL-2.0+ OR MIT)
+
+/dts-v1/;
+
+#include <dt-bindings/input/input.h>
+#include <dt-bindings/leds/common.h>
+#include <dt-bindings/soc/rockchip,vop2.h>
+#include "rk3568-fet3568-c.dtsi"
+
+/ {
+	model = "Forlinx OK3568-C";
+	compatible = "forlinx,ok3568-c", "forlinx,fet3568-c", "rockchip,rk3568";
+
+	aliases {
+		ethernet0 = &gmac0;
+		ethernet1 = &gmac1;
+		mmc1 = &sdmmc0;
+	};
+
+	adc-keys-0 {
+		compatible = "adc-keys";
+		io-channels = <&saradc 0>;
+		io-channel-names = "buttons";
+		keyup-threshold-microvolt = <1750000>;
+		poll-interval = <100>;
+
+		button-volume-up {
+			label = "V+/Recovery";
+			linux,code = <KEY_VOLUMEUP>;
+			press-threshold-microvolt = <1750>;
+		};
+
+		button-volume-down {
+			label = "V-";
+			linux,code = <KEY_VOLUMEDOWN>;
+			press-threshold-microvolt = <297500>;
+		};
+
+		button-menu {
+			label = "Menu";
+			linux,code = <KEY_MENU>;
+			press-threshold-microvolt = <980000>;
+		};
+
+		button-escape {
+			label = "ESC";
+			linux,code = <KEY_ESC>;
+			press-threshold-microvolt = <1305500>;
+		};
+	};
+
+	hdmi-con {
+		compatible = "hdmi-connector";
+		type = "a";
+
+		port {
+			hdmi_con_in: endpoint {
+				remote-endpoint = <&hdmi_out_con>;
+			};
+		};
+	};
+
+	/* DSC557-0344FI1 clock generator */
+	pcie30_refclk: pcie-clock-generator {
+		compatible = "gated-fixed-clock";
+		#clock-cells = <0>;
+		clock-frequency = <100000000>;
+		clock-output-names = "pcie30_refclk";
+		vdd-supply = <&vcc3v3_pi6c_oe>;
+	};
+
+	rk809-sound {
+		compatible = "simple-audio-card";
+		pinctrl-names = "default";
+		pinctrl-0 = <&hp_detect>;
+		simple-audio-card,name = "Analog RK809";
+		simple-audio-card,format = "i2s";
+		simple-audio-card,hp-det-gpios = <&gpio4 RK_PD2 GPIO_ACTIVE_HIGH>;
+		simple-audio-card,mclk-fs = <256>;
+		simple-audio-card,widgets =
+			"Headphone", "Headphones",
+			"Speaker", "Speaker",
+			"Microphone", "Onboard Microphone",
+			"Microphone", "Headset Microphone";
+		simple-audio-card,routing =
+			"Headphones", "HPOL",
+			"Headphones", "HPOR",
+			"Speaker", "SPKO",
+			"MICL", "Onboard Microphone",
+			"MICR", "Headset Microphone";
+
+		simple-audio-card,cpu {
+			sound-dai = <&i2s1_8ch>;
+		};
+
+		simple-audio-card,codec {
+			sound-dai = <&rk809>;
+		};
+	};
+
+	sdio_pwrseq: sdio-pwrseq {
+		compatible = "mmc-pwrseq-simple";
+		pinctrl-names = "default";
+		pinctrl-0 = <&wifi_reg_on>;
+		post-power-on-delay-ms = <200>;
+		power-off-delay-us = <20000>;
+		reset-gpios = <&gpio3 RK_PD4 GPIO_ACTIVE_LOW>;
+	};
+
+	vcc12v_dcin: regulator-12v-vcc-dcin {
+		compatible = "regulator-fixed";
+		regulator-name = "vcc12v_dcin";
+		regulator-always-on;
+		regulator-boot-on;
+		regulator-min-microvolt = <12000000>;
+		regulator-max-microvolt = <12000000>;
+	};
+
+	vcc1v8: regulator-1v8-vcc {
+		compatible = "regulator-fixed";
+		regulator-name = "vcc1v8";
+		regulator-always-on;
+		regulator-boot-on;
+		regulator-min-microvolt = <1800000>;
+		regulator-max-microvolt = <1800000>;
+		vin-supply = <&vcc3v3>;
+	};
+
+	vcc3v3_pi6c_oe: regulator-3v3-vcc-pi6c-oe {
+		compatible = "regulator-fixed";
+		enable-active-high;
+		gpios = <&gpio0 RK_PA5 GPIO_ACTIVE_HIGH>;
+		pinctrl-names = "default";
+		pinctrl-0 = <&pi6c_oe>;
+		regulator-name = "vcc3v3_pi6c_oe";
+		regulator-min-microvolt = <3300000>;
+		regulator-max-microvolt = <3300000>;
+		startup-delay-us = <5000>;
+	};
+
+	vcc3v3_pcie20: regulator-3v3-vcc-pcie20 {
+		compatible = "regulator-fixed";
+		regulator-name = "vcc3v3_pcie20";
+		regulator-always-on;
+		regulator-boot-on;
+		regulator-min-microvolt = <3300000>;
+		regulator-max-microvolt = <3300000>;
+		vin-supply = <&vcc5v0>;
+	};
+
+	vcc3v3_pcie30: regulator-3v3-vcc-pcie30 {
+		compatible = "regulator-fixed";
+		regulator-name = "vcc3v3_pcie30";
+		regulator-always-on;
+		regulator-boot-on;
+		regulator-min-microvolt = <3300000>;
+		regulator-max-microvolt = <3300000>;
+		vin-supply = <&vcc5v0>;
+	};
+
+	vcc3v3: regulator-3v3-vcc {
+		compatible = "regulator-fixed";
+		regulator-name = "vcc3v3";
+		regulator-always-on;
+		regulator-boot-on;
+		regulator-min-microvolt = <3300000>;
+		regulator-max-microvolt = <3300000>;
+		vin-supply = <&vcc5v0>;
+	};
+
+	vcc4v2_5g: regulator-4v2-vcc-5g {
+		compatible = "regulator-fixed";
+		enable-active-high;
+		gpios = <&gpio1 RK_PB1 GPIO_ACTIVE_HIGH>;
+		pinctrl-names = "default";
+		pinctrl-0 = <&modem_5g_pwr>;
+		regulator-name = "vcc4v2_5g";
+		regulator-min-microvolt = <4200000>;
+		regulator-max-microvolt = <4200000>;
+		startup-delay-us = <50000>;
+		vin-supply = <&vcc5v0>;
+	};
+
+	vcc5v0: regulator-5v0-vcc {
+		compatible = "regulator-fixed";
+		regulator-name = "vcc5v0";
+		regulator-always-on;
+		regulator-boot-on;
+		regulator-min-microvolt = <5000000>;
+		regulator-max-microvolt = <5000000>;
+		vin-supply = <&vcc12v_dcin>;
+	};
+};
+
+&can0 {
+	compatible = "rockchip,rk3568v3-canfd", "rockchip,rk3568v2-canfd";
+	assigned-clocks = <&cru CLK_CAN0>;
+	assigned-clock-rates = <300000000>;
+	pinctrl-names = "default";
+	pinctrl-0 = <&can0m0_pins>;
+	status = "okay";
+};
+
+&can1 {
+	compatible = "rockchip,rk3568v3-canfd", "rockchip,rk3568v2-canfd";
+	assigned-clocks = <&cru CLK_CAN1>;
+	assigned-clock-rates = <300000000>;
+	pinctrl-names = "default";
+	pinctrl-0 = <&can1m1_pins>;
+	status = "okay";
+};
+
+&combphy0 {
+	status = "okay";
+};
+
+&combphy1 {
+	status = "okay";
+};
+
+&combphy2 {
+	status = "okay";
+};
+
+&gmac0 {
+	clock_in_out = "output";
+	phy-handle = <&rgmii_phy0>;
+	/* Use rgmii-rxid mode to disable rx delay inside Soc */
+	phy-mode = "rgmii-rxid";
+	pinctrl-names = "default";
+	pinctrl-0 = <&gmac0_miim
+		     &gmac0_tx_bus2
+		     &gmac0_rx_bus2
+		     &gmac0_rgmii_clk
+		     &gmac0_rgmii_bus
+		     &gmac0_clkinout
+		     &eth0_pins>;
+	tx_delay = <0x36>;
+	status = "okay";
+};
+
+&gmac1 {
+	clock_in_out = "output";
+	phy-handle = <&rgmii_phy1>;
+	/* Use rgmii-rxid mode to disable rx delay inside Soc */
+	phy-mode = "rgmii-rxid";
+	pinctrl-names = "default";
+	pinctrl-0 = <&gmac1m1_miim
+		     &gmac1m1_tx_bus2
+		     &gmac1m1_rx_bus2
+		     &gmac1m1_rgmii_clk
+		     &gmac1m1_rgmii_bus
+		     &gmac1m1_clkinout
+		     &eth1m1_pins>;
+	tx_delay = <0x47>;
+	status = "okay";
+};
+
+&hdmi {
+	avdd-0v9-supply = <&vdda0v9_image>;
+	avdd-1v8-supply = <&vcca1v8_image>;
+	status = "okay";
+};
+
+&hdmi_in {
+	hdmi_in_vp0: endpoint {
+		remote-endpoint = <&vp0_out_hdmi>;
+	};
+};
+
+&hdmi_out {
+	hdmi_out_con: endpoint {
+		remote-endpoint = <&hdmi_con_in>;
+	};
+};
+
+&hdmi_sound {
+	status = "okay";
+};
+
+&i2c3 {
+	status = "okay";
+
+	pcf8563: rtc@51 {
+		compatible = "nxp,pcf8563";
+		reg = <0x51>;
+	};
+};
+
+&i2s0_8ch {
+	status = "okay";
+};
+
+&i2s1_8ch {
+	pinctrl-names = "default";
+	pinctrl-0 = <&i2s1m0_sclktx
+		     &i2s1m0_lrcktx
+		     &i2s1m0_sdi0
+		     &i2s1m0_sdo0>;
+	rockchip,trcm-sync-tx-only;
+	status = "okay";
+};
+
+&mdio0 {
+	rgmii_phy0: ethernet-phy@1 {
+		compatible = "ethernet-phy-id001c.c916";
+		reg = <0x1>;
+		clocks = <&cru CLK_MAC0_OUT>;
+		assigned-clocks = <&cru CLK_MAC0_OUT>;
+		assigned-clock-rates = <25000000>;
+		pinctrl-names = "default";
+		pinctrl-0 = <&rgmii_phy0_rst>;
+		reset-assert-us = <20000>;
+		reset-deassert-us = <100000>;
+		reset-gpios = <&gpio3 RK_PA4 GPIO_ACTIVE_LOW>;
+	};
+};
+
+&mdio1 {
+	rgmii_phy1: ethernet-phy@1 {
+		compatible = "ethernet-phy-id001c.c916";
+		reg = <0x1>;
+		clocks = <&cru CLK_MAC1_OUT>;
+		assigned-clocks = <&cru CLK_MAC1_OUT>;
+		assigned-clock-rates = <25000000>;
+		pinctrl-names = "default";
+		pinctrl-0 = <&rgmii_phy1_rst>;
+		reset-assert-us = <20000>;
+		reset-deassert-us = <100000>;
+		reset-gpios = <&gpio3 RK_PA2 GPIO_ACTIVE_LOW>;
+	};
+};
+
+&pcie2x1 {
+	pinctrl-names = "default";
+	pinctrl-0 = <&pcie20m0_pins>;
+	reset-gpios = <&gpio0 RK_PB6 GPIO_ACTIVE_HIGH>;
+	vpcie3v3-supply = <&vcc3v3_pcie20>;
+	status = "okay";
+};
+
+&pcie30phy {
+	status = "okay";
+};
+
+&pcie3x2 {
+	clocks = <&cru ACLK_PCIE30X2_MST>, <&cru ACLK_PCIE30X2_SLV>,
+		 <&cru ACLK_PCIE30X2_DBI>, <&cru PCLK_PCIE30X2>,
+		 <&cru CLK_PCIE30X2_AUX_NDFT>,
+		 <&cru CLK_PCIE30X2_PIPE_DFT>,
+		 <&pcie30_refclk>;
+	clock-names = "aclk_mst", "aclk_slv",
+		      "aclk_dbi", "pclk", "aux",
+		      "pipe", "ref";
+	pinctrl-names = "default";
+	pinctrl-0 = <&pcie30x2m0_pins>;
+	reset-gpios = <&gpio0 RK_PC6 GPIO_ACTIVE_HIGH>;
+	vpcie3v3-supply = <&vcc3v3_pcie30>;
+	status = "okay";
+};
+
+&pinctrl {
+	bluetooth {
+		bt_reg_on: bt-reg-on {
+			rockchip,pins = <3 RK_PD5 RK_FUNC_GPIO &pcfg_pull_none>;
+		};
+
+		bt_wake_host: bt-wake-host {
+			rockchip,pins = <0 RK_PD3 RK_FUNC_GPIO &pcfg_pull_up>;
+		};
+
+		host_wake_bt: host-wake-bt {
+			rockchip,pins = <0 RK_PD5 RK_FUNC_GPIO &pcfg_pull_none>;
+		};
+	};
+
+	ethernet {
+		rgmii_phy0_rst: rgmii-phy0-rst {
+			rockchip,pins = <3 RK_PA4 RK_FUNC_GPIO &pcfg_pull_none>;
+		};
+
+		rgmii_phy1_rst: rgmii-phy1-rst {
+			rockchip,pins = <3 RK_PA2 RK_FUNC_GPIO &pcfg_pull_none>;
+		};
+	};
+
+	modem {
+		modem_5g_pwr: modem-5g-pwr {
+			rockchip,pins = <1 RK_PB1 RK_FUNC_GPIO &pcfg_pull_none>;
+		};
+
+		modem_5g_reset: modem-5g-reset {
+			rockchip,pins = <1 RK_PB2 RK_FUNC_GPIO &pcfg_pull_none>;
+		};
+	};
+
+	/* Drop pcie20_clkreqnm0 pin. Used as DSC557-0344FI1 enable-gpio instead. */
+	pcie20 {
+		pcie20m0_pins: pcie20m0-pins {
+			rockchip,pins =
+				/* pcie20_perstnm0 */
+				<0 RK_PB6 RK_FUNC_GPIO &pcfg_pull_none>,
+				/* pcie20_wakenm0 */
+				<0 RK_PB5 3 &pcfg_pull_none>;
+		};
+	};
+
+	pcie30x2 {
+		pcie30x2m0_pins: pcie30x2m0-pins {
+			rockchip,pins =
+				/* pcie30x2_clkreqnm0 */
+				<0 RK_PA6 2 &pcfg_pull_none>,
+				/* pcie30x2_perstnm0 */
+				<0 RK_PC6 RK_FUNC_GPIO &pcfg_pull_none>,
+				/* pcie30x2_wakenm0 */
+				<0 RK_PC5 3 &pcfg_pull_none>;
+		};
+
+		pi6c_oe: pi6c-oe {
+			rockchip,pins = <0 RK_PA5 RK_FUNC_GPIO &pcfg_pull_none>;
+		};
+	};
+
+	sound {
+		hp_detect: hp-detect {
+			rockchip,pins = <4 RK_PD2 RK_FUNC_GPIO &pcfg_pull_none>;
+		};
+	};
+
+	wifi {
+		wifi_reg_on: wifi-reg-on {
+			rockchip,pins = <3 RK_PD4 RK_FUNC_GPIO &pcfg_pull_none>;
+		};
+
+		wifi_host_wake: wifi-host-wake {
+			rockchip,pins = <0 RK_PD4 RK_FUNC_GPIO &pcfg_pull_none>;
+		};
+	};
+};
+
+&pmu_io_domains {
+	pmuio1-supply = <&vcc3v3_pmu>;
+	pmuio2-supply = <&vcc3v3_pmu>;
+	vccio1-supply = <&vccio_acodec>;
+	vccio2-supply = <&vcc_1v8>;
+	vccio3-supply = <&vccio_sd>;
+	vccio4-supply = <&vcc_1v8>;
+	vccio5-supply = <&vcc_3v3>;
+	vccio6-supply = <&vcc_1v8>;
+	vccio7-supply = <&vcc_3v3>;
+	status = "okay";
+};
+
+&saradc {
+	vref-supply = <&vcca_1v8>;
+	status = "okay";
+};
+
+&sdmmc0 {
+	bus-width = <4>;
+	cap-sd-highspeed;
+	disable-wp;
+	pinctrl-names = "default";
+	pinctrl-0 = <&sdmmc0_bus4 &sdmmc0_clk &sdmmc0_cmd &sdmmc0_det>;
+	sd-uhs-sdr50;
+	sd-uhs-sdr104;
+	vmmc-supply = <&vcc3v3_sd>;
+	vqmmc-supply = <&vccio_sd>;
+	status = "okay";
+};
+
+/* WiFi part of the AW-CM358SM connected with SDIO */
+&sdmmc2 {
+	bus-width = <4>;
+	cap-sd-highspeed;
+	cap-sdio-irq;
+	keep-power-in-suspend;
+	mmc-pwrseq = <&sdio_pwrseq>;
+	non-removable;
+	pinctrl-names = "default";
+	pinctrl-0 = <&sdmmc2m0_bus4 &sdmmc2m0_clk &sdmmc2m0_cmd>;
+	sd-uhs-sdr104;
+	vmmc-supply = <&vcc3v3>;
+	vqmmc-supply = <&vcc1v8>;
+	status = "okay";
+};
+
+/* BT part of the AW-CM358SM connected with UART */
+&uart8 {
+	dma-names = "tx", "rx";
+	pinctrl-names = "default";
+	pinctrl-0 = <&uart8m0_xfer &uart8m0_ctsn &uart8m0_rtsn>;
+	uart-has-rtscts;
+	status = "okay";
+
+	bluetooth {
+		compatible = "nxp,88w8987-bt";
+		pinctrl-names = "default";
+		pinctrl-0 = <&bt_reg_on &bt_wake_host &host_wake_bt>;
+		vcc-supply = <&vcc1v8>;
+		wakeup-source;
+	};
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
+&usb_host0_xhci {
+	extcon = <&usb2phy0>;
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
+&usb_host1_xhci {
+	dr_mode = "host";
+	status = "okay";
+};
+
+&usb2phy0 {
+	status = "okay";
+};
+
+&usb2phy0_host {
+	phy-supply = <&vcc4v2_5g>;
+	status = "okay";
+};
+
+&usb2phy0_otg {
+	phy-supply = <&vcc5v0>;
+	status = "okay";
+};
+
+&usb2phy1 {
+	status = "okay";
+};
+
+&usb2phy1_host {
+	phy-supply = <&vcc5v0>;
+	status = "okay";
+};
+
+&usb2phy1_otg {
+	phy-supply = <&vcc5v0>;
+	status = "okay";
+};
+
+&vop {
+	assigned-clocks = <&cru DCLK_VOP0>, <&cru DCLK_VOP1>;
+	assigned-clock-parents = <&pmucru PLL_HPLL>, <&cru PLL_VPLL>;
+	status = "okay";
+};
+
+&vop_mmu {
+	status = "okay";
+};
+
+&vp0 {
+	vp0_out_hdmi: endpoint@ROCKCHIP_VOP2_EP_HDMI0 {
+		reg = <ROCKCHIP_VOP2_EP_HDMI0>;
+		remote-endpoint = <&hdmi_in_vp0>;
+	};
+};

-- 
2.55.0


