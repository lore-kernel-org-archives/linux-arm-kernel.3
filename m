Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 87EB5E77199
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  8 Jan 2025 16:26:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ZCHTeF6R0fGhSKfSt6MjkqVYus+rrnV1ENn9wfkH0OE=; b=EonNNji3vN285jKf2SbWPweg2X
	0bQtzc+grZJKAwf0iu+oLkxOviqT9wSMbSlc+SHReqOOSXGFoUtQdABYtnNZIsTp7eZHvv5VF1D0w
	+1tOpCLzuBmKkPp7bmb95wg6iKgetzk2NpxuAOPOdJPRA0De2YsmlLFQWCOYsVxTryNqx3Nx6gbN5
	6/XCX9wh2dIZ6j3QrpxMk6do53O88wR0+0Yx8oc7R/OkPZYGGlVmTWTpOPEI362PRjYqq4eIcuaR0
	6tIicgHyo+MOht5P0E5qLfreCjCbJvPE5lYenRybtFSJyogYZHZDlj2DsZVEwDwwAqFuuyr/HFCvI
	u+TITtIw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tVYsR-00000009B2T-3anr;
	Wed, 08 Jan 2025 16:25:51 +0000
Received: from mail-wm1-x331.google.com ([2a00:1450:4864:20::331])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tVYiq-000000098MD-447K
	for linux-arm-kernel@lists.infradead.org;
	Wed, 08 Jan 2025 16:16:03 +0000
Received: by mail-wm1-x331.google.com with SMTP id 5b1f17b1804b1-436ce2ab251so36055e9.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 08 Jan 2025 08:15:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1736352956; x=1736957756; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ZCHTeF6R0fGhSKfSt6MjkqVYus+rrnV1ENn9wfkH0OE=;
        b=R6gI1xPwEjQ7/Sk38jDCoExkA4J5lr8Z7u3Gpk9fK6AkbU3QFYFIr3WN2ONn1V5gio
         lRN4+wQ5mK8ym+PMdOHNVjNVSa6ROkKDlRwhbQXy8qNui6v7Gq6TnrsN3JiGuZP9tfdW
         BVsIC5u/2KZ7rOwPm8Cfcy6WR+7QwF8siDDT0JvMM58jYMdtBcy8PvRqqRLMLtvSo6Da
         /ZhQ/N5wKUUv+YmjMIIraWokjMUPBU6UeauyxN8goTDmY6NCNYSCOxzaPAaVM4WjMQNS
         EbtMWim0ybVkiMkbCIy4EnE2pHQtZs7aT/cxUNNE5zukuZ3uo9cAuCnO1uZLDKy+hCsY
         0LZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736352956; x=1736957756;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ZCHTeF6R0fGhSKfSt6MjkqVYus+rrnV1ENn9wfkH0OE=;
        b=hmVf6sNFbfivsdgdyE2MvPHHM/YVwP8M0m93fc+InQN/Q+K8AVATLJnHnYscZ1q5jN
         i7p2UGDEjiLpGHFzvaDAKDO7cCz74CXXBct83FshNn5qDp9g1IQhlMmT6mrT8+URhaIq
         rhhLA2vsmcaSht6Ynli5UZnnxOG0va6NzFuPawFdDQf/5urfvsw/+p7FjOzCJwsIl60C
         8R7l53pbhYPgy0w/SX5KfCoX5tdaA82Yl1Xh+yzZBEBxvi5YAiKoR1zS9yCkLpuRB0tb
         6oiOxU2xKiI3q+OL+Vcj+E2G4PAftD7Vp8qvoH+oLeYjO80RT/omwj0uPETepDaEejb5
         1kQg==
X-Forwarded-Encrypted: i=1; AJvYcCX7KA/ehz8bUppHxhUo8kg0cGrXwq38rGFyZh/EbcwWeMSVJxInmSM0j1dPMdbwBGel6VcCA6es2iGeram5Hss3@lists.infradead.org
X-Gm-Message-State: AOJu0Yy6PVqitkobaOVrqa2pdZ2ooO28RNuN/oSie2RcMq0EQCREQVPd
	QeXPTf+CNdj61m66n2L9lZkio5zfWFCSU6fGl0J5JGmiVpcfagiYw4Y4ThBCkd0=
X-Gm-Gg: ASbGnctAjntvs2NLsB95zdb00bf8IDHFM3ETk4gklQ0AJGT2/SO1Otdh7qREEkZh7ZW
	ebRNyQCPX63wVdE3QgpI/jydNrKRx87k8B9jyyt+2MupoqJGxEM4o4xLE9t6cUQk2p5vMp3oCLi
	/GsGEA/UfAOqvPWYkNGL1kU0HY8AKPjtQebiIweNcJYV81gsbz+EHZPQF2/EPOyQHI/Roa771oq
	zLvhDJKtRn6XMCo/enA5GywjU2pxreooSo/4T9UBnrUJhaRvCXxi1WQuwqH
X-Google-Smtp-Source: AGHT+IHEILDWRs/8ApjgnIf3rSHJHPFt1S4VS+egmv2pZWmzR8KQn/GFSJiwtiZAUp1S8eGd/C13oA==
X-Received: by 2002:a05:600c:3c85:b0:434:a802:e99a with SMTP id 5b1f17b1804b1-436e267821emr29030295e9.4.1736352955584;
        Wed, 08 Jan 2025 08:15:55 -0800 (PST)
Received: from [127.0.1.1] ([2a01:e0a:5ee:79d0:a6ac:e6d2:88e3:8ea1])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-436dd14dfcasm44378105e9.1.2025.01.08.08.15.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Jan 2025 08:15:55 -0800 (PST)
From: Alexandre Mergnat <amergnat@baylibre.com>
Date: Wed, 08 Jan 2025 17:15:49 +0100
Subject: [PATCH v5 7/7] arm64: dts: mediatek: add display support for
 mt8365-evk
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20231023-display-support-v5-7-3905f1e4b835@baylibre.com>
References: <20231023-display-support-v5-0-3905f1e4b835@baylibre.com>
In-Reply-To: <20231023-display-support-v5-0-3905f1e4b835@baylibre.com>
To: Chun-Kuang Hu <chunkuang.hu@kernel.org>, 
 Philipp Zabel <p.zabel@pengutronix.de>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Jitao Shi <jitao.shi@mediatek.com>, CK Hu <ck.hu@mediatek.com>, 
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
 Simona Vetter <simona@ffwll.ch>, Simona Vetter <simona.vetter@ffwll.ch>
Cc: dri-devel@lists.freedesktop.org, linux-mediatek@lists.infradead.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, 
 Alexandre Mergnat <amergnat@baylibre.com>
X-Mailer: b4 0.12.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=7455; i=amergnat@baylibre.com;
 h=from:subject:message-id; bh=oiBrgFDEH8oR9i80NmibPY4/A6M1F7T8QsUsAz/D+YY=;
 b=owEBbQKS/ZANAwAKAStGSZ1+MdRFAcsmYgBnfqSyi4f+hfO2Xem78DOLGc6XqILcDRe5cULnYQi1
 OgtZHHyJAjMEAAEKAB0WIQQjG17X8+qqcA5g/osrRkmdfjHURQUCZ36ksgAKCRArRkmdfjHURTdREA
 CY4yXPx/AEV2nA/rnJ7EXj25fNHH7L/Agasp+OirSRe0XBZ+UJbRKSKfDGhqRYnOZeE3kVhrT1HxhY
 upyqqZRuRBX2Al677eHWM8gphdCS36bGEJvfGZVF74ZhRB3BJvJ+FYrT08CWQnZ2FW6zonb3lRhfup
 9LX7qmG5B5p7eFtA/i9JDJOhld0c13OzbWboBOdYQMB9VoMs7uzixqb4pvLMy+lTpLiiwWLgLLNmmA
 z7LTKZ8kSFeFjYIr8zNhKagj8xenWPSKU83ffIfOeWMPW0+h5jLUPwwMmJ+m5s0++D5f6FZlU3aGUZ
 XlnSXp2NzaW2576+QSbC1SA+woGOm6pF79Ko+9RttTzNAmq+lCM4oqCLveluu91YTldbC8awX75Dps
 3Z8ZZ2utsumKVPOB00p+pRVLa9NAZvezd1TFtwAdu5CAplw5NfBFDsxhqeprRDB7KqzjQKotmDCWPy
 b1OE/SoJFlA2vYcCQclJslYbVt/uKfFH4QmeslLXBm7bsn75MObUDs9itOmJSUkdYpW/s3pGIk3grx
 X+m48DFDSDx8A+FqrEFc7yVv/NK1pbBxDIUVkUG+2LYrAIPB98I9lPDJkxHUIc7SOkbX56sB+DM77Y
 lu6MbzowJnXAmFOhEs2QxREIslKwiADDCfJNrgMOGGF6qFjffBNDExOpMMIg==
X-Developer-Key: i=amergnat@baylibre.com; a=openpgp;
 fpr=231B5ED7F3EAAA700E60FE8B2B46499D7E31D445
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250108_081602_682481_24D42882 
X-CRM114-Status: GOOD (  12.18  )
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

MIPI DSI:
- Add "vsys_lcm_reg" regulator support and setup the "mt6357_vsim1_reg",
to power the pannel plugged to the DSI connector.
- Setup the Display Parallel Interface.
  - Add the startek kd070fhfid015 pannel support.

HDMI:
- Add HDMI connector support.
- Add the "ite,it66121" HDMI bridge support, driven by I2C1.
- Setup the Display Parallel Interface.

Signed-off-by: Alexandre Mergnat <amergnat@baylibre.com>
---
 arch/arm64/boot/dts/mediatek/mt8365-evk.dts | 236 ++++++++++++++++++++++++++++
 1 file changed, 236 insertions(+)

diff --git a/arch/arm64/boot/dts/mediatek/mt8365-evk.dts b/arch/arm64/boot/dts/mediatek/mt8365-evk.dts
index 7d90112a7e27..61a58a1faee1 100644
--- a/arch/arm64/boot/dts/mediatek/mt8365-evk.dts
+++ b/arch/arm64/boot/dts/mediatek/mt8365-evk.dts
@@ -27,6 +27,21 @@ chosen {
 		stdout-path = "serial0:921600n8";
 	};
 
+	connector {
+		compatible = "hdmi-connector";
+		label = "hdmi";
+		type = "d";
+
+		port {
+			#address-cells = <1>;
+			#size-cells = <0>;
+			hdmi_connector_in: endpoint@0 {
+				reg = <0>;
+				remote-endpoint = <&hdmi_connector_out>;
+			};
+		};
+	};
+
 	firmware {
 		optee {
 			compatible = "linaro,optee-tz";
@@ -104,6 +119,16 @@ sound: sound {
 		pinctrl-5 = <&aud_mosi_on_pins>;
 		mediatek,platform = <&afe>;
 	};
+
+	vsys_lcm_reg: regulator-vsys-lcm {
+		compatible = "regulator-fixed";
+		enable-active-high;
+		gpio = <&pio 129 GPIO_ACTIVE_HIGH>;
+		regulator-max-microvolt = <5000000>;
+		regulator-min-microvolt = <5000000>;
+		regulator-name = "vsys_lcm";
+	};
+
 };
 
 &afe {
@@ -131,6 +156,88 @@ &cpu3 {
 	sram-supply = <&mt6357_vsram_proc_reg>;
 };
 
+&dither0_out {
+	remote-endpoint = <&dsi0_in>;
+};
+
+&dpi0 {
+	pinctrl-0 = <&dpi_default_pins>;
+	pinctrl-1 = <&dpi_idle_pins>;
+	pinctrl-names = "default", "sleep";
+	ports {
+		#address-cells = <1>;
+		#size-cells = <0>;
+
+		port@0 {
+			#address-cells = <1>;
+			#size-cells = <0>;
+			reg = <0>;
+			dpi0_in: endpoint@1 {
+				reg = <1>;
+				remote-endpoint = <&rdma1_out>;
+			};
+		};
+
+		port@1 {
+			#address-cells = <1>;
+			#size-cells = <0>;
+			reg = <1>;
+			dpi0_out: endpoint@1 {
+				reg = <1>;
+				remote-endpoint = <&it66121_in>;
+			};
+		};
+	};
+};
+
+&dsi0 {
+	#address-cells = <1>;
+	#size-cells = <0>;
+	status = "okay";
+
+	panel@0 {
+		compatible = "startek,kd070fhfid015";
+		reg = <0>;
+		enable-gpios = <&pio 67 GPIO_ACTIVE_HIGH>;
+		reset-gpios = <&pio 20 GPIO_ACTIVE_HIGH>;
+		iovcc-supply = <&mt6357_vsim1_reg>;
+		power-supply = <&vsys_lcm_reg>;
+
+		port {
+			#address-cells = <1>;
+			#size-cells = <0>;
+			panel_in: endpoint@0 {
+				reg = <0>;
+				remote-endpoint = <&dsi0_out>;
+			};
+		};
+	};
+	ports {
+		#address-cells = <1>;
+		#size-cells = <0>;
+
+		port@0 {
+			#address-cells = <1>;
+			#size-cells = <0>;
+			reg = <0>;
+			dsi0_in: endpoint@0 {
+				reg = <0>;
+				remote-endpoint = <&dither0_out>;
+			};
+		};
+
+		port@1 {
+			#address-cells = <1>;
+			#size-cells = <0>;
+			reg = <1>;
+			dsi0_out: endpoint@0 {
+				reg = <0>;
+				remote-endpoint = <&panel_in>;
+			};
+		};
+	};
+};
+
 &ethernet {
 	pinctrl-0 = <&ethernet_pins>;
 	pinctrl-names = "default";
@@ -161,6 +268,56 @@ &i2c0 {
 	status = "okay";
 };
 
+&i2c1 {
+	#address-cells = <1>;
+	#size-cells = <0>;
+	clock-div = <2>;
+	clock-frequency = <100000>;
+	pinctrl-0 = <&i2c1_pins>;
+	pinctrl-names = "default";
+	status = "okay";
+
+	it66121_hdmi: hdmi@4c {
+		#sound-dai-cells = <0>;
+		compatible = "ite,it66121";
+		interrupt-parent = <&pio>;
+		interrupts = <68 IRQ_TYPE_LEVEL_LOW>;
+		pinctrl-0 = <&ite_pins>;
+		pinctrl-names = "default";
+		reg = <0x4c>;
+		reset-gpios = <&pio 69 GPIO_ACTIVE_LOW>;
+		vcn18-supply = <&mt6357_vsim2_reg>;
+		vcn33-supply = <&mt6357_vibr_reg>;
+		vrf12-supply = <&mt6357_vrf12_reg>;
+
+		ports {
+			#address-cells = <1>;
+			#size-cells = <0>;
+
+			port@0 {
+				#address-cells = <1>;
+				#size-cells = <0>;
+				reg = <0>;
+				it66121_in: endpoint@0 {
+					reg = <0>;
+					bus-width = <12>;
+					remote-endpoint = <&dpi0_out>;
+				};
+			};
+
+			port@1 {
+				#address-cells = <1>;
+				#size-cells = <0>;
+				reg = <1>;
+				hdmi_connector_out: endpoint@0 {
+					reg = <0>;
+					remote-endpoint = <&hdmi_connector_in>;
+				};
+			};
+		};
+	};
+};
+
 &mmc0 {
 	assigned-clock-parents = <&topckgen CLK_TOP_MSDCPLL>;
 	assigned-clocks = <&topckgen CLK_TOP_MSDC50_0_SEL>;
@@ -205,6 +362,11 @@ &mt6357_pmic {
 	mediatek,micbias1-microvolt = <1700000>;
 };
 
+&mt6357_vsim1_reg {
+	regulator-min-microvolt = <1800000>;
+	regulator-max-microvolt = <1800000>;
+};
+
 &pio {
 	aud_default_pins: audiodefault-pins {
 		clk-dat-pins {
@@ -267,6 +429,49 @@ clk-dat-pins {
 		};
 	};
 
+	dpi_default_pins: dpi-default-pins {
+		pins {
+			pinmux = <MT8365_PIN_0_GPIO0__FUNC_DPI_D0>,
+				 <MT8365_PIN_1_GPIO1__FUNC_DPI_D1>,
+				 <MT8365_PIN_2_GPIO2__FUNC_DPI_D2>,
+				 <MT8365_PIN_3_GPIO3__FUNC_DPI_D3>,
+				 <MT8365_PIN_4_GPIO4__FUNC_DPI_D4>,
+				 <MT8365_PIN_5_GPIO5__FUNC_DPI_D5>,
+				 <MT8365_PIN_6_GPIO6__FUNC_DPI_D6>,
+				 <MT8365_PIN_7_GPIO7__FUNC_DPI_D7>,
+				 <MT8365_PIN_8_GPIO8__FUNC_DPI_D8>,
+				 <MT8365_PIN_9_GPIO9__FUNC_DPI_D9>,
+				 <MT8365_PIN_10_GPIO10__FUNC_DPI_D10>,
+				 <MT8365_PIN_11_GPIO11__FUNC_DPI_D11>,
+				 <MT8365_PIN_12_GPIO12__FUNC_DPI_DE>,
+				 <MT8365_PIN_13_GPIO13__FUNC_DPI_VSYNC>,
+				 <MT8365_PIN_14_GPIO14__FUNC_DPI_CK>,
+				 <MT8365_PIN_15_GPIO15__FUNC_DPI_HSYNC>;
+			drive-strength = <4>;
+		};
+	};
+
+	dpi_idle_pins: dpi-idle-pins {
+		pins {
+			pinmux = <MT8365_PIN_0_GPIO0__FUNC_GPIO0>,
+				 <MT8365_PIN_1_GPIO1__FUNC_GPIO1>,
+				 <MT8365_PIN_2_GPIO2__FUNC_GPIO2>,
+				 <MT8365_PIN_3_GPIO3__FUNC_GPIO3>,
+				 <MT8365_PIN_4_GPIO4__FUNC_GPIO4>,
+				 <MT8365_PIN_5_GPIO5__FUNC_GPIO5>,
+				 <MT8365_PIN_6_GPIO6__FUNC_GPIO6>,
+				 <MT8365_PIN_7_GPIO7__FUNC_GPIO7>,
+				 <MT8365_PIN_8_GPIO8__FUNC_GPIO8>,
+				 <MT8365_PIN_9_GPIO9__FUNC_GPIO9>,
+				 <MT8365_PIN_10_GPIO10__FUNC_GPIO10>,
+				 <MT8365_PIN_11_GPIO11__FUNC_GPIO11>,
+				 <MT8365_PIN_12_GPIO12__FUNC_GPIO12>,
+				 <MT8365_PIN_13_GPIO13__FUNC_GPIO13>,
+				 <MT8365_PIN_14_GPIO14__FUNC_GPIO14>,
+				 <MT8365_PIN_15_GPIO15__FUNC_GPIO15>;
+		};
+	};
+
 	ethernet_pins: ethernet-pins {
 		phy_reset_pins {
 			pinmux = <MT8365_PIN_133_TDM_TX_DATA1__FUNC_GPIO133>;
@@ -308,6 +513,33 @@ pins {
 		};
 	};
 
+	i2c1_pins: i2c1-pins {
+		pins {
+			pinmux = <MT8365_PIN_59_SDA1__FUNC_SDA1_0>,
+				 <MT8365_PIN_60_SCL1__FUNC_SCL1_0>;
+			bias-pull-up;
+		};
+	};
+
+	ite_pins: ite-pins {
+		irq_ite_pins {
+			pinmux = <MT8365_PIN_68_CMDAT0__FUNC_GPIO68>;
+			input-enable;
+			bias-pull-up;
+		};
+
+		pwr_pins {
+			pinmux = <MT8365_PIN_70_CMDAT2__FUNC_GPIO70>,
+				 <MT8365_PIN_71_CMDAT3__FUNC_GPIO71>;
+			output-high;
+		};
+
+		rst_ite_pins {
+			pinmux = <MT8365_PIN_69_CMDAT1__FUNC_GPIO69>;
+			output-high;
+		};
+	};
+
 	mmc0_default_pins: mmc0-default-pins {
 		clk-pins {
 			pinmux = <MT8365_PIN_99_MSDC0_CLK__FUNC_MSDC0_CLK>;
@@ -463,6 +695,10 @@ &pwm {
 	status = "okay";
 };
 
+&rdma1_out {
+	remote-endpoint = <&dpi0_in>;
+};
+
 &ssusb {
 	dr_mode = "otg";
 	maximum-speed = "high-speed";

-- 
2.25.1


