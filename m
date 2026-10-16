Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D9C0ACCF2C0
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 16 Oct 2026 10:31:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=lQKLRUdMlLSBUekzZJpinIZOOSjB4LUAvJOk+PTbgrU=; b=YcLIi5/jXcJpXI2Mru8yiYgvOW
	kyBfapOGj2KodIMzbAkpOZ9730wbrSQECH84AkKUTUMq/EOPQGJyr/6HddLSXNog0voAn9IbMm66H
	l6RumejfdHJqLDGvaDUvof++axIhH+EOivs95uBPEieGYYPYJuXK3WrJ89srxI1Lzxc4lxXabi9sb
	13V8/pTA936WDrbwmHpVBH3mWJrz4tSpimPeIHM56E7HeZuOShmSoHTDhS/XtFUJ0BAxIYC+t9AXF
	/ZYBZjeiYGQQj2NnGN+lcozrdsnQ0dHqc+yYu7WV2TyxyrFYwEkTIViHtM47LtyHDkUNmw2ZCF8o1
	gw5HTcwA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xHfDD-00000002d1I-1yNW;
	Fri, 16 Oct 2026 10:30:55 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xHfD9-00000002cuU-0srO
	for linux-arm-kernel@bombadil.infradead.org;
	Fri, 16 Oct 2026 10:30:51 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=Cc:To:In-Reply-To:References:Message-Id
	:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:Sender
	:Reply-To:Content-ID:Content-Description;
	bh=lQKLRUdMlLSBUekzZJpinIZOOSjB4LUAvJOk+PTbgrU=; b=Nq5c5NaRi1jfXHN0shT6S6ddTB
	BLO/s+lJ3ptsaCZQBaJYVUVfAB5tddd4Wc+GiTKmpUYqjrXzakkeqObEcU0UsPMUXi2bLZS7t7zwY
	WEw8cRI6P7IGUPisYaijz/o2BtnCiTM3FplvH1iBIL7R8ZZr5aoINe2hOKQzj6Ses+HePYShsfbki
	6SZXeUZJz5CFNCkzvkN44pyHALZFKcckQ/88M7owYst57ARpJaKrBI69AQay+aJ75J2YwILO6sf1Z
	NgxBfxSOpH8BYlNBbvS3iB5N5of0+t1znWH5DlQhhi91f0/jXD0g4+XhuLI2oW0/lmzkE7POuum+l
	ETAjUb6A==;
Received: from mail-ed1-x52c.google.com ([2a00:1450:4864:20::52c])
	by casper.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xHfD4-00000002sD8-1mHt
	for linux-arm-kernel@lists.infradead.org;
	Fri, 16 Oct 2026 10:30:50 +0000
Received: by mail-ed1-x52c.google.com with SMTP id 4fb4d7f45d1cf-6afafc89b48so318207a12.2
        for <linux-arm-kernel@lists.infradead.org>; Fri, 16 Oct 2026 03:30:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792146644; x=1792751444; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=lQKLRUdMlLSBUekzZJpinIZOOSjB4LUAvJOk+PTbgrU=;
        b=byg4maIuQREKXKhDYLTpGSQ25N0oaIT26ZVTny1pBofTDTBM53YsuqoOHEPn4yhdJy
         fIatwIVQY3ARGGXsKIDWJQ7ASjus/5j/P1kORwngy0QB3P/x6qmIs2CMuvUCof1kRl+9
         Y4NZsTT6AaykFchBZYwFdcAEnqNkwG7AwxnDI+PYR7tiUnzUPJeqDaCn4kHhnJWKD7EG
         w5LNnWGblvvU3uT6FPLZ6ufQlVeJsZaX1oiQ7UsGpIFDWN5v2+Oxjc9/F8k7CZrHagxa
         g4uS0P76BcCgqKzepFX+Yx+0n7ogiaTO660V1BjvjJ+DdEOM+DedM3unOJxUeU1He5cP
         0zOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792146644; x=1792751444;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=lQKLRUdMlLSBUekzZJpinIZOOSjB4LUAvJOk+PTbgrU=;
        b=AYp/ihqxpU0MRHLsa21GFPUfEs0mxfwdHSveUP4CiTiV8OLGUAooqWA2MUecJMzsUI
         EXrCGHOZKJvaVIB+BQpRptIldtXfG3o4jduxAPTzoRIw8/rVHTjUyhJ1f5bKFaneTc/e
         XBJ4epJTA3+5kBifAJ/P1Xyj9aAXD6J+QFoKhim1El6RyaUyXBLP8neG23SLXUwAa+Yx
         7rRhpn6TG0ue8QaYI806wRmJR5gTxSnQfeuhTVsMhdfEEX9laNZv9KwoIQ8dII0dNfyn
         iZ6k33Hs65VOzpbpL7Q4G56HeESYbIVm7JL0bOgD2Wqu6e+0Rh/eUl5qafkKtxc+gQ82
         O8kw==
X-Forwarded-Encrypted: i=1; AKwUvBwA+Ttmqc51BbmvYcwA7DSX9gXKxeTwdBpZYS+ycen1Rldfc62NLKeUeH2NO6LwXVZbolNRRDvnuY9JWTpeEsjP@lists.infradead.org
X-Gm-Message-State: AFq9FYIoAubiLc/yFAYPQr3N8zy2hAHpqZVpdipQwf6TybDVHeUthjQf
	Zr74y7apnyCIbZuLSdcJx77cAicoo0dbdqkh+xamC3ICDln3H1RNJOlc
X-Gm-Gg: AYBFou0HX5IbpJqoxoYszQuZ/boa1B2E9Htd4lRplL9woJCVGn6k04LeFJcHVjVdSD8
	D4sACOtl6Sq+qMWLX2oOhHQtV5sGtwxfxG2sseXpLieFtlt8CupSmQtQHA61oj3XvoNlw5L92BW
	yRWcib9GbwHcqVgeRZU2tnMfBuA34qzTf3NG4vsDhrNHf68qitvk5AgCeN4O+eXOyVCwO/gQAI9
	KvHs16tvV4RzG5xiQl0gaMQ8t3vH3otwmd7le7ysHjQ2utcQKFXqdsPVLi5/O0MsjoDMeHvaGMU
	l8M9SpdstYohSxF96OMKlRWIFsqxnr23XncxOGfkuBzYVZ2X/wUwaJXE9K0PoOUay8k7ORjDqRr
	yqD91+Wv6tIQ3fx7rFeJ6pRMLG77HZBR7EYjShiDv6TpTMGuUuunja199NHB49+k1Zb961fLaxM
	yMwQBs/Yc2xRGTh7wDx/ssyEuD5NvjCtZ6xNv3ZxozM51WrCcwXU+mBgP/hWIsova2k1WgTD+IO
	+vlAD2PdySm3KpBQIhxQXI=
X-Received: by 2002:a17:907:a4ca:b0:c29:f5d8:9c82 with SMTP id a640c23a62f3a-c31aa0dc185mr1999601666b.49.1792146644128;
        Fri, 16 Oct 2026 03:30:44 -0700 (PDT)
Received: from localhost.localdomain ([193.107.16.241])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c40912ce133sm60613866b.31.2026.10.16.03.30.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 16 Oct 2026 03:30:43 -0700 (PDT)
From: Dmitry Yashin <dmt.yashin@gmail.com>
Date: Fri, 16 Oct 2026 15:29:36 +0500
Subject: [PATCH v2 4/5] arm64: dts: rockchip: add Forlinx OK3568-C
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261016-ok3568-c-v2-4-068d68430e6d@gmail.com>
References: <20261016-ok3568-c-v2-0-068d68430e6d@gmail.com>
In-Reply-To: <20261016-ok3568-c-v2-0-068d68430e6d@gmail.com>
To: Andrew Lunn <andrew+netdev@lunn.ch>, 
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Johannes Berg <johannes@sipsolutions.net>, 
 Philipp Zabel <p.zabel@pengutronix.de>, Heiko Stuebner <heiko@sntech.de>
Cc: netdev@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-rockchip@lists.infradead.org, Dmitry Yashin <dmt.yashin@gmail.com>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1792146625; l=15237;
 i=dmt.yashin@gmail.com; s=20260930; h=from:subject:message-id;
 bh=G4VSqVe1DypmfEvCezrBpXLylcDmqXTCY/nLWX1ELto=;
 b=wZ/EkHjBx/pNx4oryQA83uZ1yXWIxu65caIIxuqvkmTrETtJPoIrE1nvixO7FLNi3D0kEgYit
 OGMmR8WoL6aBG7ZguObCjsH39WadC8VJeV7oF2FybweNbrywsBoH8iU
X-Developer-Key: i=dmt.yashin@gmail.com; a=ed25519;
 pk=vBe9jaaOEH5bQEvfzb1tWOlz3AMIcXCu/GL/CdlwJco=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261016_113046_474924_E537A425 
X-CRM114-Status: GOOD (  15.55  )
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
 arch/arm64/boot/dts/rockchip/rk3568-ok3568-c.dts | 579 +++++++++++++++++++++++
 2 files changed, 580 insertions(+)

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
index 000000000000..24418ea0be86
--- /dev/null
+++ b/arch/arm64/boot/dts/rockchip/rk3568-ok3568-c.dts
@@ -0,0 +1,579 @@
+// SPDX-License-Identifier: (GPL-2.0+ OR MIT)
+
+/dts-v1/;
+
+#include <dt-bindings/input/input.h>
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
+	rfkill-modem {
+		compatible = "rfkill-gpio";
+		label = "M.2 USB Modem";
+		pinctrl-names = "default";
+		pinctrl-0 = <&modem_5g_reset>;
+		radio-type = "wwan";
+		reset-gpios = <&gpio1 RK_PB2 GPIO_ACTIVE_HIGH>;
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
+	vcc12v_dcin: regulator-12v-vcc-dcin {
+		compatible = "regulator-fixed";
+		regulator-name = "vcc12v_dcin";
+		regulator-always-on;
+		regulator-boot-on;
+		regulator-min-microvolt = <12000000>;
+		regulator-max-microvolt = <12000000>;
+	};
+
+	vcc1v8_wifi_bt_reg_on: regulator-1v8-vcc-wifi-bt-reg-on {
+		compatible = "regulator-fixed";
+		enable-active-high;
+		gpios = <&gpio3 RK_PD4 GPIO_ACTIVE_LOW>;
+		pinctrl-names = "default";
+		pinctrl-0 = <&wifi_reg_on>;
+		off-on-delay-us = <20000>;
+		regulator-name = "vcc1v8_wifi_bt_reg_on";
+		regulator-min-microvolt = <1800000>;
+		regulator-max-microvolt = <1800000>;
+		startup-delay-us = <200>;
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
+	phy-mode = "rgmii-id";
+	pinctrl-names = "default";
+	pinctrl-0 = <&gmac0_miim
+		     &gmac0_tx_bus2
+		     &gmac0_rx_bus2
+		     &gmac0_rgmii_clk
+		     &gmac0_rgmii_bus
+		     &gmac0_clkinout
+		     &eth0_pins>;
+	status = "okay";
+};
+
+&gmac1 {
+	clock_in_out = "output";
+	phy-handle = <&rgmii_phy1>;
+	phy-mode = "rgmii-id";
+	pinctrl-names = "default";
+	pinctrl-0 = <&gmac1m1_miim
+		     &gmac1m1_tx_bus2
+		     &gmac1m1_rx_bus2
+		     &gmac1m1_rgmii_clk
+		     &gmac1m1_rgmii_bus
+		     &gmac1m1_clkinout
+		     &eth1m1_pins>;
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
+		bt_wake_host: bt-wake-host {
+			rockchip,pins = <0 RK_PD3 RK_FUNC_GPIO &pcfg_pull_up>;
+		};
+
+		host_wake_bt: host-wake-bt {
+			rockchip,pins = <0 RK_PD5 RK_FUNC_GPIO &pcfg_pull_down>;
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
+	non-removable;
+	pinctrl-names = "default";
+	pinctrl-0 = <&sdmmc2m0_bus4 &sdmmc2m0_clk &sdmmc2m0_cmd>;
+	sd-uhs-sdr104;
+	vmmc-supply = <&vcc3v3>;
+	vqmmc-supply = <&vcc1v8_wifi_bt_reg_on>;
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
+		device-wakeup-gpios = <&gpio0 RK_PD5 GPIO_ACTIVE_LOW>;
+		interrupt-parent = <&gpio0>;
+		interrupts = <RK_PD3 IRQ_TYPE_EDGE_FALLING>;
+		interrupt-names = "wakeup";
+		nxp,wakein-pin = /bits/ 8 <18>;
+		nxp,wakeout-pin = /bits/ 8 <19>;
+		pinctrl-names = "default";
+		pinctrl-0 = <&bt_wake_host &host_wake_bt>;
+		vcc-supply = <&vcc1v8_wifi_bt_reg_on>;
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
2.56.0


