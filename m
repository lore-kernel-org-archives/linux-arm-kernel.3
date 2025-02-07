Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3EE03C02196
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  7 Feb 2025 11:32:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:Message-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=JR3Vjat4//MGEukixFZKwpNgnByay/aE/Yu8JW2MD0s=; b=o6VSA77K2jHnWaDmJ5yGUNfit8
	uN0tReBHaRYwF82Snt8uKydUGhpCz+BWc4YyMByR8zdFnbt6PShFaTvS0uZnBdfH483NuSOIG9/s+
	f6KdEuB0rRMDmT7PyHiT2IC0M7mWadX43NkRgd4uqIkLtPDDMDktDkrfVAor8UdFB2c9FgMk+A5U1
	/NFoRVHCHXBhUV2RlLM868+NAbJtU/+nEakmB6j1AdE3cs/w3Yk+ecs5t+gWnLXweuSzJTQe2Q/pB
	R9fXXmvZyyAnI9U7qPtZbHMpc1LfAJG5pwSpZty9KGBPwHG2BVe5mL766BG6oUemjT/GUyNfEcCuX
	CKGh5hXg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tgMb9-00000009Mke-23uC;
	Fri, 07 Feb 2025 11:32:39 +0000
Received: from mail-wr1-x436.google.com ([2a00:1450:4864:20::436])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tgMZZ-00000009MDd-0P8X
	for linux-arm-kernel@lists.infradead.org;
	Fri, 07 Feb 2025 11:31:02 +0000
Received: by mail-wr1-x436.google.com with SMTP id ffacd0b85a97d-38dcb7122c1so391968f8f.2
        for <linux-arm-kernel@lists.infradead.org>; Fri, 07 Feb 2025 03:31:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1738927859; x=1739532659; darn=lists.infradead.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=JR3Vjat4//MGEukixFZKwpNgnByay/aE/Yu8JW2MD0s=;
        b=dy2bJRiCQNRJN8EoOjyGNwrdA6rReEfFJkIeRArpRufljtZu0HAZ4EAPMYsCYwX9DB
         njyOT7gqLOAiVG5+rrMHYgSl1oHsKkE4098CFNd/xHbZ3TueQwTn9mCjJNcWyKbA011G
         Bz5gC2VwaOYlYk1m3EwXWWg/8KBTBEUbNljn4RdiX0T3K7oHhc02d6wjxHyC3HFsyYpO
         OPBFUG1TaDmA/DL1m8Ic5+RpkR/3gzOUi0fEBhb7D64Vs6dIj0uxsXbeCO4y7CyPM8IR
         Q7/Y2JsbZPPWSa7s0Eul0Hq4YnWIlLYo5yPJpJDsjeqafDFjxHu6nn8ejHCdTw4Rq1VV
         NFOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738927859; x=1739532659;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=JR3Vjat4//MGEukixFZKwpNgnByay/aE/Yu8JW2MD0s=;
        b=LIp4auoBhy5oakCaLhEvOS4+jaPYt2ZcCY65sgYypZegCaOnObAB/FVXJtm3z7ODlm
         x05vtNC8N58QwylQBuWkdAkINbLJlgagdp7jr38fky35BkGff3n18GJKaKDmdDrqHjzE
         JYdVq6pWgiPGYa7JkKdDY3PeDx7LMAXu058vywz8Jz3+gEnr5I3RWzi/8V4KhqMU3+al
         1fGoCw1OScISu4BGNlBkV9XtVAM0zuH1oTqLu+FLDl4Q5uWKUTfppz3ud7nTybQvEI+X
         YVgG+FVHEVC5RXUE/lwRK0DDweJVY7D3G0SsfdOLPMqJ2XZBU4HgFZrL5u0gCp4e+tPg
         pxsA==
X-Forwarded-Encrypted: i=1; AJvYcCVrsrW2NKmPKmWjMh1Cm4fqqFFJ6+44pv3x293L6T0cIN8CSxSOrIsprxgv43cLKD2Cu59JlCfvGKO1INwhdXlf@lists.infradead.org
X-Gm-Message-State: AOJu0YxE1l+Ulp8k0WQFpwW6vIA6PuBYedsyGt7HoUUQEFdgVTSdhU43
	Ty8SRWEWeYGkTJIgLE6UG4Suf9ACBBPxQilOM08bp700XJsvPsDFtrJGeiqoxWY=
X-Gm-Gg: ASbGncsIuS4s3J/BA1WSzjKhbc0TPTw+MxYxR7ZD6mE8ehJ7mROFGLloYAg+B8iO7Xr
	EcBJH/Z0To0nXPryzo0uJPhSkcHnewLansBOJ3Ht9wNWWkttdDR7DwQcbOFKmmmrezktwb++W3L
	g7c+RfxXcakBXW5vlHzYfnuMa2P02TXFgZk0vBSYvn4WqD1Mad/I4qO787yUzB4qrPMFKCStkZS
	nqp2DmJufdnznb5jwcK0w4Sh7Ibh54QqDx2x38c3Litae0rC5OpwcuHrIbFytaucpWP3yXAb0W2
	GqMASuXrCb1z3bJI7Eo=
X-Google-Smtp-Source: AGHT+IHLVbDAU0ivPxRDdiP+UpyYF00dtw+lzFrRq9UIR/rXFPesGkRa2kTN8/QLK8uHm5CRvnYQnw==
X-Received: by 2002:a5d:5f83:0:b0:38d:b448:8ffc with SMTP id ffacd0b85a97d-38dc90eec01mr1724667f8f.27.1738927858852;
        Fri, 07 Feb 2025 03:30:58 -0800 (PST)
Received: from [127.0.1.1] ([2a01:e0a:5ee:79d0:a437:fa6a:2619:f5d8])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-43907f19247sm73323765e9.1.2025.02.07.03.30.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 07 Feb 2025 03:30:58 -0800 (PST)
From: Alexandre Mergnat <amergnat@baylibre.com>
Date: Fri, 07 Feb 2025 12:30:45 +0100
Subject: [PATCH v2] arm64: dts: mediatek: add mmc2 support for mt8365-evk
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250109-mmc2-support-v2-1-8347af6d1a66@baylibre.com>
X-B4-Tracking: v=1; b=H4sIAOTupWcC/3WNQQqDMBBFryJZd4oTUZqueo/iIhOnNaCJTFQq4
 t2buu/yPfj/7SqxeE7qXuxKePXJx5BBXwrlehveDL7LrHSp6xJLA+PoNKRlmqLMYBqq2NbY4K1
 ReUI2MZDY4Po8CsswZDkJv/znbDzbzL1Pc5TtTK74s3/eVwQEQ6ZDQstV3T3IboMn4auLo2qP4
 /gCe0BNrsAAAAA=
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 macpaul.Lin@mediatek.com
Cc: vsatoes@baylibre.com, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-mediatek@lists.infradead.org, 
 Alexandre Mergnat <amergnat@baylibre.com>
X-Mailer: b4 0.12.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=6037; i=amergnat@baylibre.com;
 h=from:subject:message-id; bh=tVdOnKU51B2x4WqhOEirUsHUGpi24fZC4xipg7NMb4A=;
 b=owEBbQKS/ZANAwAKAStGSZ1+MdRFAcsmYgBnpe7xjVViz2dCkEp3rvXIrJpgQ7FrMDhLnOD1i90q
 /WBT5JiJAjMEAAEKAB0WIQQjG17X8+qqcA5g/osrRkmdfjHURQUCZ6Xu8QAKCRArRkmdfjHURTksD/
 99nqDzp7HEBqvTVrbRBbDejfxW/0bhbEEIvuvQDXXg4IZI6gUXbIGTrTxRAolX4HVRO/DR5ny4dyLn
 Q/MrDQn63P16JYKbuR+PuddQinpvC6eTOyCSZYEfhdFPvB2aJw07HaSgyGiApC8YWAhBf24yhAN2sj
 iX83KxU0irHTkBX3yz8BxmYhrQREMoG15VlpMv7xtXZ9qEhlIWaHtAf+ycclleO/U/RF4GU+/4Uid7
 TYvNumN6JMRWA592DStPnKU1oQ3AKh/aXjZHeas6C1ASQkR19vFSaLBeMsAeuNyPJHSU0vA6fVnZcz
 lXekivU50HHu8JMoj5twpNlZUGcfNzRADEG6VnkUWSN3fXHzx0VBLPKQoqWiP2bUUm2Xam7HrmAb+B
 1wGh60XHuygjXmXYt9mlu/0nXuH3SN68VAPRU0rA7BdKhsBX/sP++9pkNHxA6kUKxUrxjV6fBQ1aRk
 nNSWSVlgBucDM4vazVBiGIj74ns4mUvTizCZ6TZ0m9IzIhEB3xehW+ebTXdSuPXi4yhv3/cpOG6TwA
 Eg1pPc3jENIfFcJb0RbbCmoEF4Oelbxy+LThNtUJhxdeINjofpqvQiLuRvswj1KF+D2Wpa4ey7Oly0
 rq2IJ4QgSQuAkD8clsP6k22P3a88accBjHPRgr7XHMucouZtZAxmMglGg73A==
X-Developer-Key: i=amergnat@baylibre.com; a=openpgp;
 fpr=231B5ED7F3EAAA700E60FE8B2B46499D7E31D445
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250207_033101_165916_7CA57DCD 
X-CRM114-Status: GOOD (  12.51  )
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

Adds support for the MMC2 interface on the MT8365 EVK board.
It introduces a fixed regulator for the MMC2 VDD33 supply and configures
the MMC2 node with a 4-bit bus width, high-speed capabilities, UHS
modes, and appropriate power supplies. Enabled SDIO IRQ, wakeup source,
and kept power during suspend (to save firmware module) for wireless
chip functionality.

Signed-off-by: Alexandre Mergnat <amergnat@baylibre.com>
---
Changes in v2:
- Apply alphabetical order to pinctrl property items.
- Improve commit message
- Link to v1: https://lore.kernel.org/r/20250109-mmc2-support-v1-1-9b9d1b1ae35d@baylibre.com
---
 arch/arm64/boot/dts/mediatek/mt8365-evk.dts | 103 +++++++++++++++++++++++++---
 1 file changed, 94 insertions(+), 9 deletions(-)

diff --git a/arch/arm64/boot/dts/mediatek/mt8365-evk.dts b/arch/arm64/boot/dts/mediatek/mt8365-evk.dts
index 7d90112a7e274..a87f1b3ed6500 100644
--- a/arch/arm64/boot/dts/mediatek/mt8365-evk.dts
+++ b/arch/arm64/boot/dts/mediatek/mt8365-evk.dts
@@ -53,6 +53,15 @@ memory@40000000 {
 		reg = <0 0x40000000 0 0xc0000000>;
 	};
 
+	mmc2_vdd33: mmc2_vdd33-regulator {
+		compatible = "regulator-fixed";
+		regulator-name = "mmc2_vdd33";
+		regulator-min-microvolt = <3300000>;
+		regulator-max-microvolt = <3300000>;
+		gpio = <&pio 121 0>;
+		enable-active-high;
+	};
+
 	usb_otg_vbus: regulator-0 {
 		compatible = "regulator-fixed";
 		regulator-name = "otg_vbus";
@@ -197,6 +206,28 @@ &mmc1 {
 	status = "okay";
 };
 
+&mmc2 {
+	assigned-clock-parents = <&topckgen CLK_TOP_MSDCPLL>;
+	assigned-clocks = <&topckgen CLK_TOP_MSDC50_2_SEL>;
+	bus-width = <4>;
+	cap-sd-highspeed;
+	cap-sdio-irq;
+	hs400-ds-delay = <0x12012>;
+	keep-power-in-suspend;
+	max-frequency = <200000000>;
+	non-removable;
+	pinctrl-0 = <&mmc2_default_pins>;
+	pinctrl-1 = <&mmc2_uhs_pins>;
+	pinctrl-names = "default", "state_uhs";
+	sd-uhs-sdr104;
+	sd-uhs-sdr25;
+	sd-uhs-sdr50;
+	vmmc-supply = <&mmc2_vdd33>;
+	vqmmc-supply = <&mt6357_vcn18_reg>;
+	wakeup-source;
+	status = "okay";
+};
+
 &mt6357_pmic {
 	interrupts-extended = <&pio 145 IRQ_TYPE_LEVEL_HIGH>;
 	interrupt-controller;
@@ -324,8 +355,8 @@ cmd-dat-pins {
 				 <MT8365_PIN_94_MSDC0_DAT6__FUNC_MSDC0_DAT6>,
 				 <MT8365_PIN_93_MSDC0_DAT7__FUNC_MSDC0_DAT7>,
 				 <MT8365_PIN_98_MSDC0_CMD__FUNC_MSDC0_CMD>;
-			input-enable;
 			bias-pull-up;
+			input-enable;
 		};
 
 		rst-pins {
@@ -337,8 +368,8 @@ rst-pins {
 	mmc0_uhs_pins: mmc0-uhs-pins {
 		clk-pins {
 			pinmux = <MT8365_PIN_99_MSDC0_CLK__FUNC_MSDC0_CLK>;
-			drive-strength = <MTK_DRIVE_10mA>;
 			bias-pull-down = <MTK_PUPD_SET_R1R0_10>;
+			drive-strength = <MTK_DRIVE_10mA>;
 		};
 
 		cmd-dat-pins {
@@ -351,21 +382,21 @@ cmd-dat-pins {
 				 <MT8365_PIN_94_MSDC0_DAT6__FUNC_MSDC0_DAT6>,
 				 <MT8365_PIN_93_MSDC0_DAT7__FUNC_MSDC0_DAT7>,
 				 <MT8365_PIN_98_MSDC0_CMD__FUNC_MSDC0_CMD>;
-			input-enable;
-			drive-strength = <MTK_DRIVE_10mA>;
 			bias-pull-up = <MTK_PUPD_SET_R1R0_01>;
+			drive-strength = <MTK_DRIVE_10mA>;
+			input-enable;
 		};
 
 		ds-pins {
 			pinmux = <MT8365_PIN_104_MSDC0_DSL__FUNC_MSDC0_DSL>;
-			drive-strength = <MTK_DRIVE_10mA>;
 			bias-pull-down = <MTK_PUPD_SET_R1R0_10>;
+			drive-strength = <MTK_DRIVE_10mA>;
 		};
 
 		rst-pins {
 			pinmux = <MT8365_PIN_97_MSDC0_RSTB__FUNC_MSDC0_RSTB>;
-			drive-strength = <MTK_DRIVE_10mA>;
 			bias-pull-up;
+			drive-strength = <MTK_DRIVE_10mA>;
 		};
 	};
 
@@ -386,16 +417,16 @@ cmd-dat-pins {
 				 <MT8365_PIN_91_MSDC1_DAT2__FUNC_MSDC1_DAT2>,
 				 <MT8365_PIN_92_MSDC1_DAT3__FUNC_MSDC1_DAT3>,
 				 <MT8365_PIN_87_MSDC1_CMD__FUNC_MSDC1_CMD>;
-			input-enable;
 			bias-pull-up = <MTK_PUPD_SET_R1R0_01>;
+			input-enable;
 		};
 	};
 
 	mmc1_uhs_pins: mmc1-uhs-pins {
 		clk-pins {
 			pinmux = <MT8365_PIN_88_MSDC1_CLK__FUNC_MSDC1_CLK>;
-			drive-strength = <8>;
 			bias-pull-down = <MTK_PUPD_SET_R1R0_10>;
+			drive-strength = <8>;
 		};
 
 		cmd-dat-pins {
@@ -404,9 +435,63 @@ cmd-dat-pins {
 				 <MT8365_PIN_91_MSDC1_DAT2__FUNC_MSDC1_DAT2>,
 				 <MT8365_PIN_92_MSDC1_DAT3__FUNC_MSDC1_DAT3>,
 				 <MT8365_PIN_87_MSDC1_CMD__FUNC_MSDC1_CMD>;
-			input-enable;
+			bias-pull-up = <MTK_PUPD_SET_R1R0_01>;
 			drive-strength = <6>;
+			input-enable;
+		};
+	};
+
+	mmc2_default_pins: mmc2-default-pins {
+		clk-pins {
+			pinmux = <MT8365_PIN_81_MSDC2_CLK__FUNC_MSDC2_CLK>;
+			bias-pull-down = <MTK_PUPD_SET_R1R0_10>;
+			drive-strength = <4>;
+		};
+
+		cmd-dat-pins {
+			pinmux = <MT8365_PIN_82_MSDC2_DAT0__FUNC_MSDC2_DAT0>,
+				 <MT8365_PIN_83_MSDC2_DAT1__FUNC_MSDC2_DAT1>,
+				 <MT8365_PIN_84_MSDC2_DAT2__FUNC_MSDC2_DAT2>,
+				 <MT8365_PIN_85_MSDC2_DAT3__FUNC_MSDC2_DAT3>,
+				 <MT8365_PIN_80_MSDC2_CMD__FUNC_MSDC2_CMD>;
 			bias-pull-up = <MTK_PUPD_SET_R1R0_01>;
+			drive-strength = <4>;
+			input-enable;
+		};
+
+		sys-en-pins {
+			pinmux = <MT8365_PIN_120_DMIC1_CLK__FUNC_GPIO120>;
+			output-low;
+		};
+	};
+
+	mmc2_uhs_pins: mmc2-uhs-pins {
+		clk-pins {
+			pinmux = <MT8365_PIN_81_MSDC2_CLK__FUNC_MSDC2_CLK>;
+			bias-pull-down = <MTK_PUPD_SET_R1R0_10>;
+			drive-strength = <8>;
+		};
+
+		cmd-dat-pins {
+			pinmux = <MT8365_PIN_82_MSDC2_DAT0__FUNC_MSDC2_DAT0>,
+				 <MT8365_PIN_83_MSDC2_DAT1__FUNC_MSDC2_DAT1>,
+				 <MT8365_PIN_84_MSDC2_DAT2__FUNC_MSDC2_DAT2>,
+				 <MT8365_PIN_85_MSDC2_DAT3__FUNC_MSDC2_DAT3>,
+				 <MT8365_PIN_80_MSDC2_CMD__FUNC_MSDC2_CMD>;
+			bias-pull-up = <MTK_PUPD_SET_R1R0_01>;
+			drive-strength = <8>;
+			input-enable;
+		};
+
+		ds-pins {
+			pinmux = <MT8365_PIN_86_MSDC2_DSL__FUNC_MSDC2_DSL>;
+			bias-pull-down = <MTK_PUPD_SET_R1R0_10>;
+			drive-strength = <8>;
+		};
+
+		sys-en-pins {
+			pinmux = <MT8365_PIN_120_DMIC1_CLK__FUNC_GPIO120>;
+			output-high;
 		};
 	};
 

---
base-commit: 9d89551994a430b50c4fffcb1e617a057fa76e20
change-id: 20250109-mmc2-support-96b3ea516186

Best regards,
-- 
Alexandre Mergnat <amergnat@baylibre.com>


