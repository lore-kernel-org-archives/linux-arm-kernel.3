Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 19313D1681D
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  9 Jan 2026 11:48:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=mvHYLWZC0jph1uyRUp6NW6J/DvsGEMAgdUKAOF6vsBE=; b=oExK2C08NFEgvlkdsCXtM7g+27
	tt7Sto7wCkdHraX4p81PnH9246NN237WYYy43XZ3I+A3bNSPY8YuGkTEC0NrRvGQQaPa7rawVPlvG
	X/dTYEgyZe/JP8SC9tTQJVmJihHVQ5CrbqyJuACJG334xTV4ubeJADXhkYnfKE9VwpG7+O+DHE09a
	oJLam3tJuAEQIGLw3BfVgs+TLzj7R/TDmT8uvEo2TTlDL/3ma/KWMt7fE0+oNji4WxD1Wt9Y4ylv2
	7NmTSR6LEiz7+hnistReZ4l7paU9Z2coo9b/9RP5mJRNl25PdEnZX40EddaBQwf/9AE7dnkCBD3vi
	gDf6j4+Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1veAyO-00000002F2F-00K5;
	Fri, 09 Jan 2026 11:48:08 +0000
Received: from bali.collaboradmins.com ([2a01:4f8:201:9162::2])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1veAyG-00000002EtK-0E5x;
	Fri, 09 Jan 2026 11:48:02 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1767959277;
	bh=BoAjm3UAgrVFXIrQANH5uYYVFLDwg61nJrQ4Bg2iHAg=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=gA5Kk1g1eUbAUIswNvVkUrN9Yp2Z4+DY3nk/jwHMssft7ZowfugNNDumQdCwa4EVR
	 7x7ZmI9gGWdRGEeZACZ8pMKQPachBz59lCoHWJmcfOuGXo2B1fStyBo6l7HPgrzKuV
	 KA0h1vQW41yZNrPC2NmQChjkII1CzSuxS/3t5xQV2KzqydImP4ZFxYp0zdtcCLF8nK
	 kPVaeMD+sbgMlykbaUeCaSVGkGCEhrc0ZGhnPb98IDmMlUglTcxTL0brFMbSDFfA/E
	 tdVcnbi06gxLR4db3rNVLvJPwRedlKzoun24lOymDYvxfwILG18LXxNPeYfDU8dcSh
	 xgBCSTAENc3hQ==
Received: from IcarusMOD.eternityproject.eu (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 20B6217E14FA;
	Fri,  9 Jan 2026 12:47:57 +0100 (CET)
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
To: linux-mediatek@lists.infradead.org
Cc: robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	matthias.bgg@gmail.com,
	angelogioacchino.delregno@collabora.com,
	sjoerd@collabora.com,
	hsinyi@chromium.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	kernel@collabora.com
Subject: [PATCH 03/11] arm64: dts: mediatek: mt8183-evb: Fix dtbs_check warnings
Date: Fri,  9 Jan 2026 12:47:39 +0100
Message-ID: <20260109114747.37189-4-angelogioacchino.delregno@collabora.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260109114747.37189-1-angelogioacchino.delregno@collabora.com>
References: <20260109114747.37189-1-angelogioacchino.delregno@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260109_034800_267984_177FC182 
X-CRM114-Status: UNSURE (   9.12  )
X-CRM114-Notice: Please train this message.
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

Change the Murata NCM03WF104 node name from "thermal-sensor" to
"thermistor" (as that's what it is, after all), and change all
of the pinmux main nodes to have a "-pins" suffix to satisfy
devicetree bindings checks.

Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
---
 arch/arm64/boot/dts/mediatek/mt8183-evb.dts | 36 ++++++++++-----------
 1 file changed, 18 insertions(+), 18 deletions(-)

diff --git a/arch/arm64/boot/dts/mediatek/mt8183-evb.dts b/arch/arm64/boot/dts/mediatek/mt8183-evb.dts
index f04baea5d6cb..acfdd5fb041f 100644
--- a/arch/arm64/boot/dts/mediatek/mt8183-evb.dts
+++ b/arch/arm64/boot/dts/mediatek/mt8183-evb.dts
@@ -38,7 +38,7 @@ scp_mem_reserved: memory@50000000 {
 		};
 	};
 
-	thermal-sensor {
+	thermistor {
 		compatible = "murata,ncp03wf104";
 		pullup-uv = <1800000>;
 		pullup-ohm = <390000>;
@@ -155,7 +155,7 @@ &mt6358_vsram_gpu_reg {
 };
 
 &pio {
-	i2c_pins_0: i2c0 {
+	i2c_pins_0: i2c0-pins {
 		pins_i2c {
 			pinmux = <PINMUX_GPIO82__FUNC_SDA0>,
 				 <PINMUX_GPIO83__FUNC_SCL0>;
@@ -163,7 +163,7 @@ pins_i2c {
 		};
 	};
 
-	i2c_pins_1: i2c1 {
+	i2c_pins_1: i2c1-pins {
 		pins_i2c {
 			pinmux = <PINMUX_GPIO81__FUNC_SDA1>,
 				 <PINMUX_GPIO84__FUNC_SCL1>;
@@ -171,7 +171,7 @@ pins_i2c {
 		};
 	};
 
-	i2c_pins_2: i2c2 {
+	i2c_pins_2: i2c2-pins {
 		pins_i2c {
 			pinmux = <PINMUX_GPIO103__FUNC_SCL2>,
 				 <PINMUX_GPIO104__FUNC_SDA2>;
@@ -179,7 +179,7 @@ pins_i2c {
 		};
 	};
 
-	i2c_pins_3: i2c3 {
+	i2c_pins_3: i2c3-pins {
 		pins_i2c {
 			pinmux = <PINMUX_GPIO50__FUNC_SCL3>,
 				 <PINMUX_GPIO51__FUNC_SDA3>;
@@ -187,7 +187,7 @@ pins_i2c {
 		};
 	};
 
-	i2c_pins_4: i2c4 {
+	i2c_pins_4: i2c4-pins {
 		pins_i2c {
 			pinmux = <PINMUX_GPIO105__FUNC_SCL4>,
 				 <PINMUX_GPIO106__FUNC_SDA4>;
@@ -195,7 +195,7 @@ pins_i2c {
 		};
 	};
 
-	i2c_pins_5: i2c5 {
+	i2c_pins_5: i2c5-pins {
 		pins_i2c {
 			pinmux = <PINMUX_GPIO48__FUNC_SCL5>,
 				 <PINMUX_GPIO49__FUNC_SDA5>;
@@ -203,7 +203,7 @@ pins_i2c {
 		};
 	};
 
-	spi_pins_0: spi0 {
+	spi_pins_0: spi0-pins {
 		pins_spi {
 			pinmux = <PINMUX_GPIO85__FUNC_SPI0_MI>,
 				 <PINMUX_GPIO86__FUNC_SPI0_CSB>,
@@ -213,7 +213,7 @@ pins_spi {
 		};
 	};
 
-	mmc0_pins_default: mmc0default {
+	mmc0_pins_default: mmc0-default-pins {
 		pins_cmd_dat {
 			pinmux = <PINMUX_GPIO123__FUNC_MSDC0_DAT0>,
 				 <PINMUX_GPIO128__FUNC_MSDC0_DAT1>,
@@ -239,7 +239,7 @@ pins_rst {
 		};
 	};
 
-	mmc0_pins_uhs: mmc0 {
+	mmc0_pins_uhs: mmc0-uhs-pins {
 		pins_cmd_dat {
 			pinmux = <PINMUX_GPIO123__FUNC_MSDC0_DAT0>,
 				 <PINMUX_GPIO128__FUNC_MSDC0_DAT1>,
@@ -274,7 +274,7 @@ pins_rst {
 		};
 	};
 
-	mmc1_pins_default: mmc1default {
+	mmc1_pins_default: mmc1-default-pins {
 		pins_cmd_dat {
 			pinmux = <PINMUX_GPIO31__FUNC_MSDC1_CMD>,
 				   <PINMUX_GPIO32__FUNC_MSDC1_DAT0>,
@@ -298,7 +298,7 @@ pins_pmu {
 		};
 	};
 
-	mmc1_pins_uhs: mmc1 {
+	mmc1_pins_uhs: mmc1-pins {
 		pins_cmd_dat {
 			pinmux = <PINMUX_GPIO31__FUNC_MSDC1_CMD>,
 				   <PINMUX_GPIO32__FUNC_MSDC1_DAT0>,
@@ -318,7 +318,7 @@ pins_clk {
 		};
 	};
 
-	spi_pins_1: spi1 {
+	spi_pins_1: spi1-pins {
 		pins_spi {
 			pinmux = <PINMUX_GPIO161__FUNC_SPI1_A_MI>,
 				 <PINMUX_GPIO162__FUNC_SPI1_A_CSB>,
@@ -328,7 +328,7 @@ pins_spi {
 		};
 	};
 
-	spi_pins_2: spi2 {
+	spi_pins_2: spi2-pins {
 		pins_spi {
 			pinmux = <PINMUX_GPIO0__FUNC_SPI2_CSB>,
 				 <PINMUX_GPIO1__FUNC_SPI2_MO>,
@@ -338,7 +338,7 @@ pins_spi {
 		};
 	};
 
-	spi_pins_3: spi3 {
+	spi_pins_3: spi3-pins {
 		pins_spi {
 			pinmux = <PINMUX_GPIO21__FUNC_SPI3_MI>,
 				 <PINMUX_GPIO22__FUNC_SPI3_CSB>,
@@ -348,7 +348,7 @@ pins_spi {
 		};
 	};
 
-	spi_pins_4: spi4 {
+	spi_pins_4: spi4-pins {
 		pins_spi {
 			pinmux = <PINMUX_GPIO17__FUNC_SPI4_MI>,
 				 <PINMUX_GPIO18__FUNC_SPI4_CSB>,
@@ -358,7 +358,7 @@ pins_spi {
 		};
 	};
 
-	spi_pins_5: spi5 {
+	spi_pins_5: spi5-pins {
 		pins_spi {
 			pinmux = <PINMUX_GPIO13__FUNC_SPI5_MI>,
 				 <PINMUX_GPIO14__FUNC_SPI5_CSB>,
@@ -368,7 +368,7 @@ pins_spi {
 		};
 	};
 
-	pwm_pins_1: pwm1 {
+	pwm_pins_1: pwm1-pins {
 		pins_pwm {
 			pinmux = <PINMUX_GPIO90__FUNC_PWM_A>;
 		};
-- 
2.52.0


