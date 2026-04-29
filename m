Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 66217FF8864
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 29 Apr 2026 04:15:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=x93/l1w2YfvuQmLZ4l2/nRL+2Tpf+p0vaW0AsgHcapU=; b=hZRY5MBfTam1ArzdjC9scz1Ws+
	sbD5zlLQYs49nffEx5IEg8OpMnJTdfD1cNNiPcsBFltxSkiA4TO1KDVhMsSx9UnAzZQPeiJKWVbou
	5i0EMc9fc5sKM2b9CjOUZapA/bF+Qn42ef/jGLjjqoYW0Ty/tEboAVsz+ol/FljItlQ4Dq/kSKkcV
	WMNj6D5Suablp8jxeFewlQoCgZ+jBHEUbKWQFGmUlxSQWnOp+NLauwIoIUSO4apsuuNkzjFT07sT7
	dVq7ZUi5otg8fVV4x0mB8O+rzVxaTcDhkmWSLBoCLlEPXemRUgqqHXB59abjbEApPwi9QfYpn1UCJ
	qaTyIvoA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wHwKv-00000002uHV-1qk5;
	Wed, 29 Apr 2026 04:15:45 +0000
Received: from mail-oo1-xc63.google.com ([2607:f8b0:4864:20::c63])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wHwKp-00000002uE4-3Axx
	for linux-arm-kernel@lists.infradead.org;
	Wed, 29 Apr 2026 04:15:41 +0000
Received: by mail-oo1-xc63.google.com with SMTP id 006d021491bc7-67e09232daeso7406495eaf.2
        for <linux-arm-kernel@lists.infradead.org>; Tue, 28 Apr 2026 21:15:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ausil.us; s=google; t=1777436138; x=1778040938; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=x93/l1w2YfvuQmLZ4l2/nRL+2Tpf+p0vaW0AsgHcapU=;
        b=YaKjHNHXYxbuCfyi2S502woQIPSQqvHJP5383FXG0EQEQiIaGVclXDnuohwqnV/zZp
         R+G4osOk5R1LLUEedHe+7NhCriOhrPlKxIOVZhhbQ0AD+bN0Ab0+Z7N1ZvMERmVgLfOK
         +Akr9wmo5bdiGEz4H7GHIigWgnvVFMrEs6WXBvwYM/lFAqUGEj7cMj9rcFu4Qdc1I+KQ
         OlQUOylPQAmEG0b5mj7v8V0J4SfruuX/WLIMot0bicuvRG6H3H64pvVMMcYtCIzZe1p3
         wzVcQ1Qn8/72eZJQkyTvwumOcBkYVJZ3lo5lo0Uc6o7cPz5wMKkewFYPpLS/hf40nyzX
         cQgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777436139; x=1778040939;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=x93/l1w2YfvuQmLZ4l2/nRL+2Tpf+p0vaW0AsgHcapU=;
        b=kv+dmsndcFmsUmTGzqskPllqbPsFq/EIZAJOMUGQNQkAII3LGsuZJDvjscqrLkQQiN
         5wh0eC7aqkbMCLZAhr+tfkggIyn+7EcNBceCb9+UXFlXCBfs++NzSxN66QyZ8My0VjcB
         BHd8JE+8zXUnJy+NEBv57D9KL+ji9kagqAp3C2PlBu945tiQrEHtclapRKr/rppNaivA
         3eWqW0ux+udHvzsC9SpGmRUKBWEJeTsayFFFh4/VMV41E2NN/P4IWHlEJzpRE2cMnlYf
         YFonI6hhCk0c1nNtVSli8CeQcwrxqGR1m8+xLUjm//NrSCzWYrJYXWiwq5kbZoyW+I8k
         nf5Q==
X-Forwarded-Encrypted: i=1; AFNElJ8x+G6STR41PNiefLQKUEh3kBx84PYnJaOASLix17o4+WMuqd4RVem136hLAYfTTccbJpTzPiEfjpRmYArQUdf/@lists.infradead.org
X-Gm-Message-State: AOJu0YyctvamaHOpvQXy83HhFjgiza57nrW5JV8V6pSjeK9AiyytFkOl
	cO04RrAot0SZHo+rYa+rNgmOQPay7dD5PKfO/i8n2m+Q8hFuYNBFpROYvjo01aYGsrDKzWIObg7
	O3Omtv6UXEQUg9KZlaXtYC3meavr0LXjBkHSf
X-Gm-Gg: AeBDiesItrWiqztaBzD084V9FcpUk8TwJy3ORKa++rtVBU63wv3SfxujBrWe64si7fG
	Z5G7f1nXaJfNsiBIdrYvy25LPXJ6PQBC/jKHz25ts0IHD5PoJaBtnS0iQqIPKsVo8gEyTcX0fKu
	RP4jBIxavlQOOB/7LUQaamkTyFqeMXRcviWJRQB/SOyetq1Q0vwPkxMMomevhuJKtY6CBFxX86v
	EmnO1znQpCadP7tL7+/KFGM7OOS9G3lV/OgSmNoJTbYbuiFhxXVuiqrHmpBAKURt1dOBCzgk6Kq
	yWTZBH9cF1mdByQ8qObB/MXmQKb78JQtcLc9wFgg+u//sAvTd/86E29GGYqIf5tON9sgQnJWtf9
	nzsQr8diXIWM3uotEik3EXqTyemiXQSBSAxu1BvlakSyFnZuGM4Rg34k=
X-Received: by 2002:a05:6820:2908:b0:694:92fe:54f1 with SMTP id 006d021491bc7-6966854819amr1134201eaf.54.1777436138476;
        Tue, 28 Apr 2026 21:15:38 -0700 (PDT)
Received: from ryac.ausil.us (207-179-239-100.mtco.net. [207.179.239.100])
        by smtp-relay.gmail.com with ESMTPS id 006d021491bc7-6966baf952asm41557eaf.9.2026.04.28.21.15.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 Apr 2026 21:15:38 -0700 (PDT)
X-Relaying-Domain: ausil.us
From: Dennis Gilmore <dennis@ausil.us>
To: Andrzej Hajda <andrzej.hajda@intel.com>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Robert Foss <rfoss@kernel.org>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Heiko Stuebner <heiko@sntech.de>
Cc: Alexey Charkov <alchark@gmail.com>,
	dri-devel@lists.freedesktop.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	Peter Robinson <pbrobinson@gmail.com>,
	Jonas Karlman <jonas@kwiboo.se>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
	Dennis Gilmore <dennis@ausil.us>
Subject: [PATCH 3/3] arm64: dts: rockchip: orangepi-5-pro: Add LT8711UXD DP-to-HDMI bridge
Date: Tue, 28 Apr 2026 23:15:28 -0500
Message-ID: <20260429041528.558254-4-dennis@ausil.us>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260429041528.558254-1-dennis@ausil.us>
References: <20260429041528.558254-1-dennis@ausil.us>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260428_211539_804195_80B7877C 
X-CRM114-Status: GOOD (  16.67  )
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

Wire up the second HDMI port on the Orange Pi 5 Pro. It uses a Lontium
LT8711UXD high performance two lane Type-C/DP1.4 to HDMI2.0 converter,
designed to connect a USB Type-C source or a DP1.4 source to an HDMI2.0
sink. The bridge can be controlled via i2c or run as an autonomous device.

The Orange Pi 5 Pro has i2c wired up to i2c6, however there are 10k
resistors left off of R9 and R17 to enable MODE_SEL, and R27 for
I2C_ADDR resulting in MODE_SEL going to GND and the bridge let in
autonomous mode. As shipped I verified that the bridge does not show up
on the i2c bus.

Signed-off-by: Dennis Gilmore <dennis@ausil.us>
---
 .../dts/rockchip/rk3588s-orangepi-5-pro.dts   | 88 ++++++++++++++++++-
 1 file changed, 85 insertions(+), 3 deletions(-)

diff --git a/arch/arm64/boot/dts/rockchip/rk3588s-orangepi-5-pro.dts b/arch/arm64/boot/dts/rockchip/rk3588s-orangepi-5-pro.dts
index 895d954a9f23..67363709c4ca 100644
--- a/arch/arm64/boot/dts/rockchip/rk3588s-orangepi-5-pro.dts
+++ b/arch/arm64/boot/dts/rockchip/rk3588s-orangepi-5-pro.dts
@@ -14,6 +14,44 @@ aliases {
 		mmc2 = &sdio;
 	};
 
+	hdmi1-con {
+		compatible = "hdmi-connector";
+		label = "HDMI1 OUT";
+		type = "a";
+
+		port {
+			hdmi1_con_in: endpoint {
+				remote-endpoint = <&lt8711uxd_out>;
+			};
+		};
+	};
+
+	hdmi-bridge {
+		compatible = "lontium,lt8711uxd";
+		vdd-supply = <&vcc3v3_dp>;
+
+		ports {
+			#address-cells = <1>;
+			#size-cells = <0>;
+
+			port@0 {
+				reg = <0>;
+
+				lt8711uxd_in: endpoint {
+					remote-endpoint = <&dp0_out_con>;
+				};
+			};
+
+			port@1 {
+				reg = <1>;
+
+				lt8711uxd_out: endpoint {
+					remote-endpoint = <&hdmi1_con_in>;
+				};
+			};
+		};
+	};
+
 	analog-sound {
 		compatible = "simple-audio-card";
 		pinctrl-names = "default";
@@ -72,6 +110,19 @@ fan: pwm-fan {
 		pwms = <&pwm2 0 20000000 0>;
 	};
 
+	vcc3v3_dp: regulator-vcc3v3-dp {
+		compatible = "regulator-fixed";
+		enable-active-high;
+		gpios = <&gpio3 RK_PC2 GPIO_ACTIVE_HIGH>;
+		pinctrl-names = "default";
+		pinctrl-0 = <&dp_bridge_en>;
+		regulator-max-microvolt = <3300000>;
+		regulator-min-microvolt = <3300000>;
+		regulator-name = "vcc3v3_dp";
+		regulator-always-on;
+		vin-supply = <&vcc_3v3_s3>;
+	};
+
 	vcc3v3_eth: regulator-vcc3v3-eth {
 		compatible = "regulator-fixed";
 		enable-active-high;
@@ -116,6 +167,24 @@ typea_con: usb-a-connector {
 	};
 };
 
+&dp0 {
+	pinctrl-names = "default";
+	pinctrl-0 = <&dp0m0_pins>;
+	status = "okay";
+};
+
+&dp0_in {
+	dp0_in_vp1: endpoint {
+		remote-endpoint = <&vp1_out_dp0>;
+	};
+};
+
+&dp0_out {
+	dp0_out_con: endpoint {
+		remote-endpoint = <&lt8711uxd_in>;
+	};
+};
+
 &i2c1 {
 	pinctrl-names = "default";
 	pinctrl-0 = <&i2c1m4_xfer>;
@@ -217,6 +286,12 @@ bt_wake_host_irq: bt-wake-host-irq {
 		};
 	};
 
+	dp {
+		dp_bridge_en: dp-bridge-en {
+			rockchip,pins = <3 RK_PC2 RK_FUNC_GPIO &pcfg_pull_down>;
+		};
+	};
+
 	ethernet {
 		ethernet_en: ethernet-en {
 			rockchip,pins = <3 RK_PB7 RK_FUNC_GPIO &pcfg_pull_down>;
@@ -350,9 +425,16 @@ &usb_host0_xhci {
 
 &usbdp_phy0 {
 	/*
-	 * The USB3 Type-A host connector is wired to PHY lanes 2/3. Lanes 0/1
-	 * are connected to the LT8711UXD DP-to-HDMI bridge on the board.
-	 * dp-lane-mux routes USB3 SuperSpeed to the correct lanes.
+	 * USBDP PHY0 is wired to a USB3 Type-A host connector via lanes 2/3.
+	 * Additionally lanes 0/1 and the aux channel are wired to the
+	 * Lontium LT8711UXD DP-to-HDMI bridge feeding the HDMI1 connector.
 	 */
 	rockchip,dp-lane-mux = <0 1>;
 };
+
+&vp1 {
+	vp1_out_dp0: endpoint@a {
+		reg = <ROCKCHIP_VOP2_EP_DP0>;
+		remote-endpoint = <&dp0_in_vp1>;
+	};
+};
-- 
2.54.0


