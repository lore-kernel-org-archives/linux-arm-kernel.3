Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8125AC3ABCC
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  9 May 2025 22:01:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=goA7f43Au1i3ufzZ13UdBQEnO+gTCTERnKj4vtxCJkg=; b=MicXGprEn4pdDodk5zCVXvWZNM
	ZvopvTIx5dEdXRgLpRJ4lmWVZgAtuYeagUgm3KtBKVB8v+jgrx3BOIe67sRIMWp+dxl/XLUC2Dmt0
	r0l1gIMI6cIVX+HIO9NnXoNPwLCnZUDRwxdl5Ktn3EpZ7zCH+HBNCfp1jn3y5bjYI4j8MnmjFMK//
	8vcwZq0IZcUS7CuK5/OvmyZRbOfT/LOfnCeo//J4qNYYIDztyjLWUwCAYwX2G1PwL+rA8skdm9SI/
	8rhmpvKCDo8fn4C4Q+ayXMQ3n/Ou0zkHOiFXlXN7ErWjMVZSjxqDsyIePkacqoyny7XxjlbQHXEGb
	D3sJAOBw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uDVm2-000000051WP-15zk;
	Fri, 09 May 2025 22:00:54 +0000
Received: from relay3-d.mail.gandi.net ([2001:4b98:dc4:8::223])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uDVdJ-000000050dC-1AOc;
	Fri, 09 May 2025 21:51:55 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id 271291FCED;
	Fri,  9 May 2025 21:51:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1746827510;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=goA7f43Au1i3ufzZ13UdBQEnO+gTCTERnKj4vtxCJkg=;
	b=begZ5FMRggDFSSvgYGanslTMbvnJQvRUsaXOSau59Wdsw7xrMkWI/ENhavGTXyR/Z4j8xM
	fuxI8RdpO+9eRUzxsK3c/KEjzkQ4JpVORfrpSzbX8DkFpdMo5tCg5+cTYA0QNvqj/rA0NS
	44ejAjGwDhBnmiv7/p32XVzt3rA2GD+GBidho36IcXCOwi7wop100B/dzSNVhh7PIfUwvb
	9K48mCFeV0TUJQHPsBff5qKQJM4kDOP6o1cmfrhxor6iV9Mbs5L3aXpF2un49JH17oLoJJ
	qpV1KhKysi1e0qKF5x2Cwwq6Kc54K16kRkdLwCkc6fXv2BiGfMCHUIdO+FabgQ==
From: Olivier Benjamin <olivier.benjamin@bootlin.com>
Date: Fri, 09 May 2025 23:51:39 +0200
Subject: [PATCH v3 3/4] arm64: dts: rockchip: describe I2c Bus 1 and IMX258
 world camera on PinePhone Pro
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250509-camera-v3-3-dab2772d229a@bootlin.com>
References: <20250509-camera-v3-0-dab2772d229a@bootlin.com>
In-Reply-To: <20250509-camera-v3-0-dab2772d229a@bootlin.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>, 
 Jacopo Mondi <jacopo.mondi@ideasonboard.com>, 
 Nicholas Roth <nicholas@rothemail.net>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Sakari Ailus <sakari.ailus@linux.intel.com>, 
 Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org, 
 linux-media@vger.kernel.org, Krzysztof Kozlowski <krzk@kernel.org>, 
 imx@lists.linux.dev, Olivier Benjamin <olivier.benjamin@bootlin.com>, 
 Dragan Simic <dsimic@manjaro.org>, Ondrej Jirman <megi@xff.cz>
X-Mailer: b4 0.14.2
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgddvleefjeegucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuifetpfffkfdpucggtfgfnhhsuhgsshgtrhhisggvnecuuegrihhlohhuthemuceftddunecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefhfffugggtgffkfhgjvfevofesthejredtredtjeenucfhrhhomhepqfhlihhvihgvrhcuuegvnhhjrghmihhnuceoohhlihhvihgvrhdrsggvnhhjrghmihhnsegsohhothhlihhnrdgtohhmqeenucggtffrrghtthgvrhhnpeegueegiedvvdevveevvddufeejvefftdeugfffkeeileehheefieehgfelfeeileenucfkphepvdgrtddumegvfeegmegvtgefkeemvdegvgdtmehfhegtvgemfhefgedvmeeiheekjeemfheiheeinecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehinhgvthepvdgrtddumegvfeegmegvtgefkeemvdegvgdtmehfhegtvgemfhefgedvmeeiheekjeemfheiheeipdhhvghloheplgduledvrdduieekrddurddvtdgnpdhmrghilhhfrhhomhepohhlihhvihgvrhdrsggvnhhjrghmihhnsegsohhothhlihhnrdgtohhmpdhnsggprhgtphhtthhopedvfedprhgtphhtthhopehkvghrnhgvlhesphgvnhhguhhtrhhonhhigidruggvpdhrtghpthhtohepihhmgieslhhishhtshdrlhhinhhugidruggvvhdprhgtphhtthhopegtohhnohhrodgutheskhgvrhhnvghlrdhorhhgpdhrt
 ghpthhtohepshdrhhgruhgvrhesphgvnhhguhhtrhhonhhigidruggvpdhrtghpthhtohepfhgvshhtvghvrghmsehgmhgrihhlrdgtohhmpdhrtghpthhtohepkhhriihksehkvghrnhgvlhdrohhrghdprhgtphhtthhopehkrhiikhdoughtsehkvghrnhgvlhdrohhrghdprhgtphhtthhopegushhimhhitgesmhgrnhhjrghrohdrohhrgh
X-GND-Sasl: olivier.benjamin@bootlin.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250509_145153_615997_06E1FE06 
X-CRM114-Status: GOOD (  17.40  )
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

Add the description of the rear/world camera (IMX258) on the PinePhone Pro
to the device dts file.
It receives commands on the I2C Bus 1 at address 0x1a and transmits data
over CSI-MIPI.

The I2C address for IMX258 can be found in the IMX258-0AQH5 Software
Reference Manual, page 24, section 2.3.1: 0b0011010 = 0x1a.
Section 3 indicates the module has 4 pairs of data lines. While 4-lane
mode is nominal, 2-lane mode should also be supported.

The pin muxing info was extracted from the PinePhone Pro schematic v1.0
as well as the RK3399 datasheet revision 1.8.

Table 2-3 in section 2.8 of the RK3399 datasheet contains the mapping
of IO functions for the SoC pins. Page 52 shows GPIO1_A0, page 54 shows
GPIO2_D4.

For I2C power, the PinePhone Pro schematic page 11 quadrants A4 and A5:
RK3399_J.AA8 and RK3399_J.Y8 get power from vcaa1v8_codec, so turn it on

The IMX258 also uses the following regulators, expected by its driver:
 - vana (2.8V analog), called AVDD2V8_DVP on P.18 q.C1 and derived from
   VCC1V8_S3 on P.13 q.B2
 - vdig (1.2V digital core), called DVDD_DVP on P.18 q.C1 and shown on
   P.18 q.D3 to be equivalent to VCC1V2_DVP derived from VCC3V3_SYS on
   P.13 q.B3. Note that this regulator's voltage is inconsistently
   labeled either 1.2V or 1.5V

RK3399_J.AG1 is GPIO4_A1/I2C1_SDA, RK3399_J.Y6 is GPIO4_A2/I2C1_SCL
This is the default pinctrl "i2c1_xfer" for i2c1 from rk3399-base.

For the reset (RESET) signal:
page 11 quadrant D2             | p.18 q.C3-4 | p.18 q.C2
RK3399_E.R25 -> GPIO1_A0 -> Camera_RST -> MIPI_RST0 -> IMX258.12

For the powerdown (PWDN) signal:
page 11 quadrants B4-5          | p.18 q.C2
RK3399_G.AF8 -> GPIO2_D4 -> DVP_PDN1_H -> IMX258.14

Helped-by: Dragan Simic <dsimic@manjaro.org>
Co-developed-by: Ondrej Jirman <megi@xff.cz>
Signed-off-by: Ondrej Jirman <megi@xff.cz>
Signed-off-by: Olivier Benjamin <olivier.benjamin@bootlin.com>
---
 .../boot/dts/rockchip/rk3399-pinephone-pro.dts     | 94 ++++++++++++++++++++++
 1 file changed, 94 insertions(+)

diff --git a/arch/arm64/boot/dts/rockchip/rk3399-pinephone-pro.dts b/arch/arm64/boot/dts/rockchip/rk3399-pinephone-pro.dts
index 04ba4c4565d0a205e2e46d7535c6a3190993621d..588e2d8a049cc649aa227c7a885bd494f23fbdf8 100644
--- a/arch/arm64/boot/dts/rockchip/rk3399-pinephone-pro.dts
+++ b/arch/arm64/boot/dts/rockchip/rk3399-pinephone-pro.dts
@@ -114,6 +114,16 @@ vcc3v3_sys: regulator-vcc3v3-sys {
 		vin-supply = <&vcc_sys>;
 	};
 
+	avdd2v8_dvp: regulator-avdd2v8-dvp {
+		compatible = "regulator-fixed";
+		regulator-name = "avdd2v8_dvp";
+		regulator-always-on;
+		regulator-boot-on;
+		regulator-min-microvolt = <2800000>;
+		regulator-max-microvolt = <2800000>;
+		vin-supply = <&vcc3v3_sys>;
+	};
+
 	vcca1v8_s3: regulator-vcc1v8-s3 {
 		compatible = "regulator-fixed";
 		regulator-name = "vcca1v8_s3";
@@ -136,6 +146,16 @@ vcc1v8_codec: regulator-vcc1v8-codec {
 		vin-supply = <&vcc3v3_sys>;
 	};
 
+	vcc1v2_dvp: regulator-vcc1v2-dvp {
+		compatible = "regulator-fixed";
+		regulator-name = "vcc1v2_dvp";
+		regulator-always-on;
+		regulator-boot-on;
+		regulator-min-microvolt = <1200000>;
+		regulator-max-microvolt = <1200000>;
+		vin-supply = <&vcca1v8_s3>;
+	};
+
 	wifi_pwrseq: sdio-wifi-pwrseq {
 		compatible = "mmc-pwrseq-simple";
 		clocks = <&rk818 1>;
@@ -312,6 +332,8 @@ vcc3v0_touch: LDO_REG2 {
 
 			vcca1v8_codec: LDO_REG3 {
 				regulator-name = "vcca1v8_codec";
+				regulator-always-on;
+				regulator-boot-on;
 				regulator-min-microvolt = <1800000>;
 				regulator-max-microvolt = <1800000>;
 			};
@@ -420,6 +442,46 @@ regulator-state-mem {
 	};
 };
 
+&i2c1 {
+	clock-frequency = <400000>;
+	pinctrl-0 = <&i2c1_xfer &cif_clkouta>;
+	assigned-clocks = <&cru SCLK_CIF_OUT>;
+	assigned-clock-rates = <24000000>;
+	status = "okay";
+
+	wcam: camera@1a {
+		compatible = "sony,imx258";
+		reg = <0x1a>;
+		clocks = <&cru SCLK_CIF_OUT>; /* MIPI_MCLK0, derived from CIF_CLKO */
+		clock-names = "xvclk";
+		pinctrl-names = "default";
+		pinctrl-0 = <&wcam_rst>;
+		/* Note: both cameras also depend on vcca1v8_codec to power the I2C bus. */
+		vif-supply = <&vcc1v8_dvp>;
+		vana-supply = <&avdd2v8_dvp>;
+		vdig-supply = <&vcc1v2_dvp>; /* DVDD_DVP is the same as VCC1V2_DVP */
+		reset-gpios = <&gpio1 RK_PA0 GPIO_ACTIVE_LOW>;
+		orientation = <1>; /* V4L2_CAMERA_ORIENTATION_BACK */
+		rotation = <270>;
+		lens-focus = <&wcam_lens>;
+
+		port {
+			wcam_out: endpoint {
+				remote-endpoint = <&mipi_in_wcam>;
+				data-lanes = <1 2 3 4>;
+				link-frequencies = /bits/ 64 <636000000>;
+			};
+		};
+	};
+
+	wcam_lens: camera-lens@c {
+		compatible = "dongwoon,dw9714";
+		reg = <0x0c>;
+		/* Same I2c bus as both cameras, depends on vcca1v8_codec for power. */
+		vcc-supply = <&vcc1v8_dvp>;
+	};
+};
+
 &i2c3 {
 	i2c-scl-rising-time-ns = <450>;
 	i2c-scl-falling-time-ns = <15>;
@@ -462,6 +524,28 @@ &io_domains {
 	status = "okay";
 };
 
+&isp1 {
+	status = "okay";
+
+	ports {
+		port@0 {
+			mipi_in_wcam: endpoint@0 {
+				reg = <0>;
+				remote-endpoint = <&wcam_out>;
+				data-lanes = <1 2 3 4>;
+			};
+		};
+	};
+};
+
+&mipi_dphy_rx0 {
+	status = "okay";
+};
+
+&isp1_mmu {
+	status = "okay";
+};
+
 &mipi_dsi {
 	status = "okay";
 	clock-master;
@@ -495,6 +579,10 @@ mipi_in_panel: endpoint {
 	};
 };
 
+&mipi_dsi1 {
+	status = "okay";
+};
+
 &pmu_io_domains {
 	pmu1830-supply = <&vcc_1v8>;
 	status = "okay";
@@ -507,6 +595,12 @@ pwrbtn_pin: pwrbtn-pin {
 		};
 	};
 
+	camera {
+		wcam_rst: wcam-rst {
+			rockchip,pins = <1 RK_PA0 RK_FUNC_GPIO &pcfg_pull_none>;
+		};
+	};
+
 	leds {
 		red_led_pin: red-led-pin {
 			rockchip,pins = <4 RK_PD2 RK_FUNC_GPIO &pcfg_pull_none>;

-- 
2.48.1


