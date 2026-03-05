Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A8F2CF47CD0
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  5 Mar 2026 21:03:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=z+oK1HC6mjzut6Jep3O4wnFAo1gcFVDix5BbI9g78wE=; b=MrlFE+MuKh6wJcWpNWvhdY+HTY
	k/seqe2E0Cxye6ngOIvdLFSYzCGCIpHyJZguM3fvgoM9+q2DxrBoSocWVqzsy8zmg2LF7aYQryi/5
	zUVQ5Gqvt16JggVVa7wDtq6Rtd64pZjvymfbc04uun013w75VIQp3jJIKo3HiEH6/EAKGct9xT8kr
	errP7g0pNzeNXA0RgEBIvbwhF57Ga1QSRH3utiWdl6StNv6hTHTKnhUI+t4oGC1AV0UfHMtrkSp9G
	qpQsW5F41fczpk1kpOORxCcBd0CKkHGk964+QU4SSPMnLOIftKbVCEFz6Oqsc81uv4uxaNBhKsypz
	dg/D3JAQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vyFrM-00000002YMo-3CPn;
	Thu, 05 Mar 2026 21:03:52 +0000
Received: from mail-oi1-x235.google.com ([2607:f8b0:4864:20::235])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vyFrK-00000002YKN-1kY8
	for linux-arm-kernel@lists.infradead.org;
	Thu, 05 Mar 2026 21:03:51 +0000
Received: by mail-oi1-x235.google.com with SMTP id 5614622812f47-46391f4c1f9so5341203b6e.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 05 Mar 2026 13:03:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1772744629; x=1773349429; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=z+oK1HC6mjzut6Jep3O4wnFAo1gcFVDix5BbI9g78wE=;
        b=rxujHouObnO9v5pgrx9i+M2MByAbkWl7rFwSCaF1WGgB0RuQxNaPL15Qvmm6Un2VYB
         T3KYwWLw4HIje6/OV1hD52dnHtYYPTYCIaI4H848UZaJgwZcu9/EtJZInPTDWcUzuo7W
         J/FMFgddqm22HafgBPwBWwUh6nw4B5cL6tVd2Je2cm9PAEkYflgQZWiyLw11w8t7X+qF
         S+g0g/c1ewd0LCcG2tWKXcEjyYZdgOK5l1UUQNOeQ0TtiJED/h0KIp6Sza35lSvPGO5Y
         RlxZX3DukhTCfK1tpfzK6eHJlaN7cukItv7MElI7RTGsJyYzKfxWdHG0UvoeFmH8T3dU
         soGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772744629; x=1773349429;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=z+oK1HC6mjzut6Jep3O4wnFAo1gcFVDix5BbI9g78wE=;
        b=aekaZfdoygh2o5V7dBUF1WguYL6jrW3Wldxnt1ojFuHF39mhcEciJ33++xq3LaJPCX
         RF5lmN6NaSSHZQWOpAC55q2EzIZ+u+ptEmBYj2HcvjUK0xO0HB6d/CrJpn+J4Scn+tL7
         vwN+17vTA0S3eaybaS1Mgp9hzV6aRBsUDAOQ0MPxnstLmzrkD7d5mDXtjtvDuqj7qGko
         8CJvBw7jcQZONNG2WuoLX18bvD+GRJGmH2uDNRMesiI+fAjqNBh8KiyogiQq2HE+lZnU
         utWpuX7LdZwJvm9abOvWCuq7aiAVpdYwrgLgdEXv4PA3qYUbr3VjOcW/dZndRwyjCCd4
         jAsA==
X-Forwarded-Encrypted: i=1; AJvYcCVyM2pY1BXt5/geBhpXU9Wc+JCo70DdVxVR9xUhcWnujP92ych9cCatKa8onL+FwJrMrY9L7hLrDI5K2i1QGaG9@lists.infradead.org
X-Gm-Message-State: AOJu0YyVa7sePZUsWOQBbhFJDK0lCmXPpaAu3aqLQPyCYl2LqgMVmNS3
	lGn9QFVhHGXeBTnZ0PV6CxoNuCuBkjrfZQWvYQFl+GUf/XAL2TaNbXRRnPiRFCdWQb8=
X-Gm-Gg: ATEYQzyxwu6q/qSGqN+WVEHBz9Ks1OM6mKNI7TQJGV762p4owB3SIVthm8fgyn+Jpu/
	pCVHtQXKc3OBU1XPzlfDmVt6lCe+LFzV637tougWGrV9qK3EHV2zccxTWgWo7XM55jUsmRede3r
	OUFRB8o2vhDlYsRwXzOOqmoMnJRt9tjlvN09/LASLaCVtg82mwWDmBtm6obrN1Ye4PYMRqK0byD
	wxMbv627LN/vmI6qW1GpKP8NtBH5AD+aLQ8MsTiFqg8vIhRhnejMhlYOGNc6OaMDrZHFpNbsSqP
	qarFsZDlqViA65DUbGyC88RTupZTgpyCGHLXuqjvPsH+SlL49fBZ9srSUZURWN6dn2M+YVxkGo2
	dIHZHJVXnek2iUkFtyo6pmkpJ9Drd2wVD8pT+bCOoKIMjwDaThChB0J32V4ehppcVsIeoukUhFy
	1wyZY+kWAQgNXgRAvcvb8D06lmTmhu
X-Received: by 2002:a05:6808:1245:b0:45c:83dc:fab with SMTP id 5614622812f47-4651ac9d13emr3575899b6e.40.1772744629200;
        Thu, 05 Mar 2026 13:03:49 -0800 (PST)
Received: from [127.0.1.1] ([2600:8803:e7e4:500:874e:e775:4f67:b3a5])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-464bb5d0a8csm13729227b6e.14.2026.03.05.13.03.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Mar 2026 13:03:48 -0800 (PST)
From: David Lechner <dlechner@baylibre.com>
Date: Thu, 05 Mar 2026 15:03:16 -0600
Subject: [PATCH v2 1/3] arm: dts: mediatek: mt7623: fix pinctrl child node
 names
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260305-mtk-fix-mt7623-pinctl-name-v2-1-a68854a51065@baylibre.com>
References: <20260305-mtk-fix-mt7623-pinctl-name-v2-0-a68854a51065@baylibre.com>
In-Reply-To: <20260305-mtk-fix-mt7623-pinctl-name-v2-0-a68854a51065@baylibre.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
 David Lechner <dlechner@baylibre.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=6122; i=dlechner@baylibre.com;
 h=from:subject:message-id; bh=bGcKPNGpFeozhudmOX3FNcg6vxKf4h+qA1CKaUdGf+U=;
 b=owEBbQGS/pANAwAKAcLMIAH/AY/AAcsmYgBpqe+d7EE4rhdk4vjfQsOiPJGSMVnkLsNCSHlEp
 YFUaYvHIxKJATMEAAEKAB0WIQTsGNmeYg6D1pzYaJjCzCAB/wGPwAUCaanvnQAKCRDCzCAB/wGP
 wASKB/4h28IF0/kyGOSl3y9PbwIuXm2RmgroWH8anCAiU7ebKlnD1eqDy+CS39rt05DKxbvePe8
 0h4Of+toERsemkKi0uzfMg60PnsXSIoN0WTRmcnreybKsPbX/STQXxoP2Zk2xYo/otY95qxiUsQ
 UtMs94iw/pbyPS2cr9RggZY2JUzi/notP92My0Z9R6zvBdGvhJhRpGAkbWMvSvvNhKpjJtTqxYU
 sC8xpeqoXShPsA4MLADbNZASU7O20B/WZL2lnF7i7mfhFvW1V3XWf0kxCv6h8vnCaMSroWJECkG
 bk39848EWFzcJGOZmtjFB0a5EKTzTA/iTfSe6GofdQD6s9bv
X-Developer-Key: i=dlechner@baylibre.com; a=openpgp;
 fpr=8A73D82A6A1F509907F373881F8AF88C82F77C03
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260305_130350_484144_13A734BA 
X-CRM114-Status: GOOD (  11.45  )
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

Fix the pinctrl child node names to adhere to the bindings. The main pin
node is supposed to be named like "something-pins" and the pinmux node
named like "pins-something".

Signed-off-by: David Lechner <dlechner@baylibre.com>
---
 arch/arm/boot/dts/mediatek/mt7623.dtsi | 62 +++++++++++++++++-----------------
 1 file changed, 31 insertions(+), 31 deletions(-)

diff --git a/arch/arm/boot/dts/mediatek/mt7623.dtsi b/arch/arm/boot/dts/mediatek/mt7623.dtsi
index 71ac2b94c6ba..f34f60cde594 100644
--- a/arch/arm/boot/dts/mediatek/mt7623.dtsi
+++ b/arch/arm/boot/dts/mediatek/mt7623.dtsi
@@ -1017,14 +1017,14 @@ bdpsys: syscon@1c000000 {
 };
 
 &pio {
-	cir_pins_a:cir-default {
+	cir_pins_a: cir-default-pins {
 		pins-cir {
 			pinmux = <MT7623_PIN_46_IR_FUNC_IR>;
 			bias-disable;
 		};
 	};
 
-	i2c0_pins_a: i2c0-default {
+	i2c0_pins_a: i2c0-default-pins {
 		pins-i2c0 {
 			pinmux = <MT7623_PIN_75_SDA0_FUNC_SDA0>,
 				 <MT7623_PIN_76_SCL0_FUNC_SCL0>;
@@ -1032,40 +1032,40 @@ pins-i2c0 {
 		};
 	};
 
-	i2c1_pins_a: i2c1-default {
-		pin-i2c1 {
+	i2c1_pins_a: i2c1-default-pins {
+		pins-i2c1 {
 			pinmux = <MT7623_PIN_57_SDA1_FUNC_SDA1>,
 				 <MT7623_PIN_58_SCL1_FUNC_SCL1>;
 			bias-disable;
 		};
 	};
 
-	i2c1_pins_b: i2c1-alt {
-		pin-i2c1 {
+	i2c1_pins_b: i2c1-alt-pins {
+		pins-i2c1 {
 			pinmux = <MT7623_PIN_242_URTS2_FUNC_SCL1>,
 				 <MT7623_PIN_243_UCTS2_FUNC_SDA1>;
 			bias-disable;
 		};
 	};
 
-	i2c2_pins_a: i2c2-default {
-		pin-i2c2 {
+	i2c2_pins_a: i2c2-default-pins {
+		pins-i2c2 {
 			pinmux = <MT7623_PIN_77_SDA2_FUNC_SDA2>,
 				 <MT7623_PIN_78_SCL2_FUNC_SCL2>;
 			bias-disable;
 		};
 	};
 
-	i2c2_pins_b: i2c2-alt {
-		pin-i2c2 {
+	i2c2_pins_b: i2c2-alt-pins {
+		pins-i2c2 {
 			pinmux = <MT7623_PIN_122_GPIO122_FUNC_SDA2>,
 				 <MT7623_PIN_123_HTPLG_FUNC_SCL2>;
 			bias-disable;
 		};
 	};
 
-	i2s0_pins_a: i2s0-default {
-		pin-i2s0 {
+	i2s0_pins_a: i2s0-default-pins {
+		pins-i2s0 {
 			pinmux = <MT7623_PIN_49_I2S0_DATA_FUNC_I2S0_DATA>,
 				 <MT7623_PIN_72_I2S0_DATA_IN_FUNC_I2S0_DATA_IN>,
 				 <MT7623_PIN_73_I2S0_LRCK_FUNC_I2S0_LRCK>,
@@ -1076,8 +1076,8 @@ pin-i2s0 {
 		};
 	};
 
-	i2s1_pins_a: i2s1-default {
-		pin-i2s1 {
+	i2s1_pins_a: i2s1-default-pins {
+		pins-i2s1 {
 			pinmux = <MT7623_PIN_33_I2S1_DATA_FUNC_I2S1_DATA>,
 				 <MT7623_PIN_34_I2S1_DATA_IN_FUNC_I2S1_DATA_IN>,
 				 <MT7623_PIN_35_I2S1_BCK_FUNC_I2S1_BCK>,
@@ -1088,7 +1088,7 @@ pin-i2s1 {
 		};
 	};
 
-	key_pins_a: keys-alt {
+	key_pins_a: keys-alt-pins {
 		pins-keys {
 			pinmux = <MT7623_PIN_256_GPIO256_FUNC_GPIO256>,
 				 <MT7623_PIN_257_GPIO257_FUNC_GPIO257> ;
@@ -1096,7 +1096,7 @@ pins-keys {
 		};
 	};
 
-	led_pins_a: leds-alt {
+	led_pins_a: leds-alt-pins {
 		pins-leds {
 			pinmux = <MT7623_PIN_239_EXT_SDIO0_FUNC_GPIO239>,
 				 <MT7623_PIN_240_EXT_XCS_FUNC_GPIO240>,
@@ -1104,7 +1104,7 @@ pins-leds {
 		};
 	};
 
-	mmc0_pins_default: mmc0default {
+	mmc0_pins_default: mmc0-default-pins {
 		pins-cmd-dat {
 			pinmux = <MT7623_PIN_111_MSDC0_DAT7_FUNC_MSDC0_DAT7>,
 				 <MT7623_PIN_112_MSDC0_DAT6_FUNC_MSDC0_DAT6>,
@@ -1130,7 +1130,7 @@ pins-rst {
 		};
 	};
 
-	mmc0_pins_uhs: mmc0 {
+	mmc0_pins_uhs: mmc0-uhs-pins {
 		pins-cmd-dat {
 			pinmux = <MT7623_PIN_111_MSDC0_DAT7_FUNC_MSDC0_DAT7>,
 				 <MT7623_PIN_112_MSDC0_DAT6_FUNC_MSDC0_DAT6>,
@@ -1158,7 +1158,7 @@ pins-rst {
 		};
 	};
 
-	mmc1_pins_default: mmc1default {
+	mmc1_pins_default: mmc1-default-pins {
 		pins-cmd-dat {
 			pinmux = <MT7623_PIN_107_MSDC1_DAT0_FUNC_MSDC1_DAT0>,
 				 <MT7623_PIN_108_MSDC1_DAT1_FUNC_MSDC1_DAT1>,
@@ -1188,7 +1188,7 @@ pins-insert {
 		};
 	};
 
-	mmc1_pins_uhs: mmc1 {
+	mmc1_pins_uhs: mmc1-uhs-pins {
 		pins-cmd-dat {
 			pinmux = <MT7623_PIN_107_MSDC1_DAT0_FUNC_MSDC1_DAT0>,
 				 <MT7623_PIN_108_MSDC1_DAT1_FUNC_MSDC1_DAT1>,
@@ -1207,7 +1207,7 @@ pins-clk {
 		};
 	};
 
-	nand_pins_default: nanddefault {
+	nand_pins_default: nand-default-pins {
 		pins-ale {
 			pinmux = <MT7623_PIN_116_MSDC0_CMD_FUNC_NALE>;
 			drive-strength = <8>;
@@ -1236,15 +1236,15 @@ pins-we {
 		};
 	};
 
-	pcie_default: pcie_pin_default {
-		pins_cmd_dat {
+	pcie_default: pcie-default-pins {
+		pins-cmd-dat {
 			pinmux = <MT7623_PIN_208_AUD_EXT_CK1_FUNC_PCIE0_PERST_N>,
 				 <MT7623_PIN_209_AUD_EXT_CK2_FUNC_PCIE1_PERST_N>;
 			bias-disable;
 		};
 	};
 
-	pwm_pins_a: pwm-default {
+	pwm_pins_a: pwm-default-pins {
 		pins-pwm {
 			pinmux = <MT7623_PIN_203_PWM0_FUNC_PWM0>,
 				 <MT7623_PIN_204_PWM1_FUNC_PWM1>,
@@ -1254,7 +1254,7 @@ pins-pwm {
 		};
 	};
 
-	spi0_pins_a: spi0-default {
+	spi0_pins_a: spi0-default-pins {
 		pins-spi {
 			pinmux = <MT7623_PIN_53_SPI0_CSN_FUNC_SPI0_CS>,
 				<MT7623_PIN_54_SPI0_CK_FUNC_SPI0_CK>,
@@ -1264,7 +1264,7 @@ pins-spi {
 		};
 	};
 
-	spi1_pins_a: spi1-default {
+	spi1_pins_a: spi1-default-pins {
 		pins-spi {
 			pinmux = <MT7623_PIN_7_SPI1_CSN_FUNC_SPI1_CS>,
 				<MT7623_PIN_199_SPI1_CK_FUNC_SPI1_CK>,
@@ -1273,7 +1273,7 @@ pins-spi {
 		};
 	};
 
-	spi2_pins_a: spi2-default {
+	spi2_pins_a: spi2-default-pins {
 		pins-spi {
 			pinmux = <MT7623_PIN_101_SPI2_CSN_FUNC_SPI2_CS>,
 				 <MT7623_PIN_104_SPI2_CK_FUNC_SPI2_CK>,
@@ -1282,28 +1282,28 @@ pins-spi {
 		};
 	};
 
-	uart0_pins_a: uart0-default {
+	uart0_pins_a: uart0-default-pins {
 		pins-dat {
 			pinmux = <MT7623_PIN_79_URXD0_FUNC_URXD0>,
 				 <MT7623_PIN_80_UTXD0_FUNC_UTXD0>;
 		};
 	};
 
-	uart1_pins_a: uart1-default {
+	uart1_pins_a: uart1-default-pins {
 		pins-dat {
 			pinmux = <MT7623_PIN_81_URXD1_FUNC_URXD1>,
 				 <MT7623_PIN_82_UTXD1_FUNC_UTXD1>;
 		};
 	};
 
-	uart2_pins_a: uart2-default {
+	uart2_pins_a: uart2-default-pins {
 		pins-dat {
 			pinmux = <MT7623_PIN_14_GPIO14_FUNC_URXD2>,
 				 <MT7623_PIN_15_GPIO15_FUNC_UTXD2>;
 		};
 	};
 
-	uart2_pins_b: uart2-alt {
+	uart2_pins_b: uart2-alt-pins {
 		pins-dat {
 			pinmux = <MT7623_PIN_200_URXD2_FUNC_URXD2>,
 				 <MT7623_PIN_201_UTXD2_FUNC_UTXD2>;

-- 
2.43.0


