Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B2272E7719C
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 10 Jan 2025 11:12:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:Message-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=lsaqDGLgq3FpBwdxK7jjD5A86PMJqRlSRSiGJFRnRYk=; b=w9Pf+AhCr4uHSxVMH/WGej/IrJ
	bjhgk0LBLlzFKiyMUb2VWizMToveqkbXcO1XWMLrXY8tgoISbwqzB6/w1pnT3iG++0qKiVdLdE95O
	30kyr6a1S+79GZBF4KTrZ17RnT4+mEobvWmA2v836HT6ZbDvIH5YPrugGw67BWe5uZO/upCWI7imx
	xoYp5ZN0A5J7BiCgLy67HwFOCCn4OcUdNhfweoMa/sY/fVw2VlAHjLu3gyjDopWKkl6W/oT5M2h6Y
	+/PmfGjf8VHFWXqPNSjNoSmWUn75IxQFAAdbc+GlZf6cs/B/AE7FZ4PCMVokP5d6m5AnI9GwPwZ5w
	fazTZCPQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tWCw3-0000000F4JI-0pRv;
	Fri, 10 Jan 2025 11:12:15 +0000
Received: from mail-wm1-x335.google.com ([2a00:1450:4864:20::335])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tWCuo-0000000F4BK-3Md6
	for linux-arm-kernel@lists.infradead.org;
	Fri, 10 Jan 2025 11:11:00 +0000
Received: by mail-wm1-x335.google.com with SMTP id 5b1f17b1804b1-436345cc17bso14562255e9.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 10 Jan 2025 03:10:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1736507457; x=1737112257; darn=lists.infradead.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=lsaqDGLgq3FpBwdxK7jjD5A86PMJqRlSRSiGJFRnRYk=;
        b=ZZp8ItvgwQlSmPk0HQxtfBzdLfzz23M/HHDRE8njEbpd8cn/Xmp2KgLvUfa29hr1+v
         xUOa3l5AXMRbruuQt1hsDtpVlvPS1PgZaWxXO0trNnEbtgon2flLf8ATnVAkzBa9SE/c
         4UBVS4FXdGb8m0buRqHDAVqQzDZi3C6vCzuULFyMjsCvAMkc9dHkHhZP00ApUML7bVaI
         bFcusxzu5oJgbdLTcb0WD42K2FH4Kx+l86VshuOAnBiuh+NGx+tdH4/cXRkZsj9+/yXt
         ztKG9JdGV5r2ROdEOqPgSONOXO7ETUJtiVS0/1f7Bjo9inYZfMGulP78F42ifkhack6B
         KRPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736507457; x=1737112257;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=lsaqDGLgq3FpBwdxK7jjD5A86PMJqRlSRSiGJFRnRYk=;
        b=IZECQslTvBeP4+EyuKMtF2M9kNWYvGWWSZ1q8rL0OVjRzimxO1mo32HSgzdbMOxo++
         TMbAIBg8vnFJDT1hmUatYGXtL9bD9eSikonEddkeCjBKSHtU8xbjvT6IMO+5vqSh362Z
         Gy2kbA+AGkDAz/UW1doVTXqOyHCwJ4IxiztI/wYtWcBbyuHhRD0jsM8fE6xvHWheJaU0
         m6Eu14SJfAwVoh0837P+VJO1BTjCvH69DwpeQr/c+iU5XoY8RWLXDrNQSALuoMn2Uw7I
         QNArLCWxbteV6OcW1RP/uV7ARAMPqqvF226PWJyZzZnY2SAUwSSEaxTxNFQ9eLFmRpYy
         snsQ==
X-Forwarded-Encrypted: i=1; AJvYcCUgwE2z7rtvLpW4t+Nsa4kwYnY0zH5nzOl4ARsIg7Cc2waFMBTjM4m33JJqJDsKL0QUYzyJtWG+RZen3psD7eK7@lists.infradead.org
X-Gm-Message-State: AOJu0Yz2GNNOrlw/XATfPRGCloztunSxPiS8d0cXbc0oboPlcmyUS3Ib
	PDylcUBeOlC/DF7lGHOzlRY1JyxCD90MVMMoxQ+syEh2F8K9UDC/0aSMm5wFYNg=
X-Gm-Gg: ASbGncuwm4Bt/sLqlKF8C1EEBtLm4LHV1cInrT99d1U7xToneqv8TqQSrfxZTWg5BUW
	+XrcauAz8AakSn6tGzXxDjbExqdJrzZWKi+Wr0kyDfh2ZJLUbuREBBp8Tr2cjbEu/DkJjwmkXR7
	TVlF8XMqXiIw2plRpxcFr4TQg1LmOsBKCTZ5SLnQxANzNrRFMf38H4l9Loqb6TBk9IE92LLOJX2
	xpIllRALrdVhurnkYUY/q0AOh3q2UOkB8R5e1uYq03u6A7fx3M2ErvMvWIY
X-Google-Smtp-Source: AGHT+IF0mB+wjHcXUCtZvjAkIwwZ+lCuWna5//dGlNJreuZoiAf3DMNyafyopVYrRkuOu/Fi+TNmGg==
X-Received: by 2002:a05:600c:1d07:b0:434:9934:575 with SMTP id 5b1f17b1804b1-436e26a8f4dmr108353855e9.16.1736507457222;
        Fri, 10 Jan 2025 03:10:57 -0800 (PST)
Received: from [127.0.1.1] ([2a01:e0a:5ee:79d0:2555:edac:4d05:947d])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-38a8e38ef6asm4363463f8f.60.2025.01.10.03.10.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 10 Jan 2025 03:10:56 -0800 (PST)
From: Alexandre Mergnat <amergnat@baylibre.com>
Date: Fri, 10 Jan 2025 12:10:46 +0100
Subject: [PATCH] arm64: dts: mediatek: add mmc2 support for mt8365-evk
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250109-mmc2-support-v1-1-9b9d1b1ae35d@baylibre.com>
X-B4-Tracking: v=1; b=H4sIADYAgWcC/x2N0QrCMAwAf2Xk2UBbWXH+ivjQ1swFtq4kToSxf
 zfs8Q6O20FJmBTu3Q5CX1Zeq4G/dFCmVN+E/DKG4ELvvBtwWUpA3Vpb5YNDzFdKvY/+FsGSnJQ
 wS6plsqhu82yyCY38Ox+P53H8AY2Xdz9zAAAA
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=3770; i=amergnat@baylibre.com;
 h=from:subject:message-id; bh=nu1CaLU4FwPi8KmGxZNKa3FBcBUfFSrg7ePK7lPL20s=;
 b=owEBbQKS/ZANAwAKAStGSZ1+MdRFAcsmYgBngQBAWEL2uuWIHepsCFdpenZ0Y9BCJFm8n1x6SK+d
 WNkXNr2JAjMEAAEKAB0WIQQjG17X8+qqcA5g/osrRkmdfjHURQUCZ4EAQAAKCRArRkmdfjHURUXAD/
 9xCQfkKXbv4ITr507PfOZMAzOBPIFU+1EKpaA6yOT0uYG5y9eHqMJwoJiGUNrKFO15FcuXk0hmh1lh
 93djOEDHM77SqfksLf5TvEGs8XRcrhnocO9DwHLHPpiDpkq2rGeTozAN0XlHN1TpH7fgfjypXrQTVa
 fFmOa+irEKsQoGVyELew3nHgKYqtdIxPQWcqk3PhFnQRONXhES/4dbOJd3Ki3/Au/4ZZsy71MNkU+Z
 KL/iKAgMNPb/9jQeGXG8+c1UP5eAyI64cdmPPSw2KZEIEWUkdRB2Hilhjwluf/DCfgeKV4lNIuyvf6
 dAyZCXlZUyERSbsasGZ26HPnagcEovwi9lvSkrhkp3eehmQInIyCp21hIoqbaiPBP9L4Qmylofpgp6
 4PaI2hOY0oFANeIOes8cLDHt0UOJdpwBjtm5UFxA/tTTdURKHl3Blc9WHj4WgfidfsBKU4RbC3E3Z5
 hYvtrBJAFJ1Y6x/s8aO2kfqc56BB83dDlgsx8kPh3MXu6OFvhCImXnBy8gzz9syRKDqN72l3Zg7Ehj
 yTLcUrzNHJ6pAVhzzJREg5x1M3d4aMWYBqx7rP/XzLd3k3l4mSgNuPeE0+ZHj5qZcxPp966zKbYEoc
 s/hasqA/hzMDaeliPgoYTH3fywZDVOSe3ug5m69360z7u7i73rsPg331qp8w==
X-Developer-Key: i=amergnat@baylibre.com; a=openpgp;
 fpr=231B5ED7F3EAAA700E60FE8B2B46499D7E31D445
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250110_031058_854453_90C1452C 
X-CRM114-Status: GOOD (  11.34  )
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
and kept power during suspend for wireless chip functionality.

Signed-off-by: Alexandre Mergnat <amergnat@baylibre.com>
---
 arch/arm64/boot/dts/mediatek/mt8365-evk.dts | 85 +++++++++++++++++++++++++++++
 1 file changed, 85 insertions(+)

diff --git a/arch/arm64/boot/dts/mediatek/mt8365-evk.dts b/arch/arm64/boot/dts/mediatek/mt8365-evk.dts
index 7d90112a7e27..309dc76322d4 100644
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
@@ -410,6 +441,60 @@ cmd-dat-pins {
 		};
 	};
 
+	mmc2_default_pins: mmc2-default-pins {
+		clk-pins {
+			pinmux = <MT8365_PIN_81_MSDC2_CLK__FUNC_MSDC2_CLK>;
+			drive-strength = <4>;
+			bias-pull-down = <MTK_PUPD_SET_R1R0_10>;
+		};
+
+		cmd-dat-pins {
+			pinmux = <MT8365_PIN_82_MSDC2_DAT0__FUNC_MSDC2_DAT0>,
+				 <MT8365_PIN_83_MSDC2_DAT1__FUNC_MSDC2_DAT1>,
+				 <MT8365_PIN_84_MSDC2_DAT2__FUNC_MSDC2_DAT2>,
+				 <MT8365_PIN_85_MSDC2_DAT3__FUNC_MSDC2_DAT3>,
+				 <MT8365_PIN_80_MSDC2_CMD__FUNC_MSDC2_CMD>;
+			input-enable;
+			drive-strength = <4>;
+			bias-pull-up = <MTK_PUPD_SET_R1R0_01>;
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
+			drive-strength = <8>;
+			bias-pull-down = <MTK_PUPD_SET_R1R0_10>;
+		};
+
+		cmd-dat-pins {
+			pinmux = <MT8365_PIN_82_MSDC2_DAT0__FUNC_MSDC2_DAT0>,
+				 <MT8365_PIN_83_MSDC2_DAT1__FUNC_MSDC2_DAT1>,
+				 <MT8365_PIN_84_MSDC2_DAT2__FUNC_MSDC2_DAT2>,
+				 <MT8365_PIN_85_MSDC2_DAT3__FUNC_MSDC2_DAT3>,
+				 <MT8365_PIN_80_MSDC2_CMD__FUNC_MSDC2_CMD>;
+			input-enable;
+			drive-strength = <8>;
+			bias-pull-up = <MTK_PUPD_SET_R1R0_01>;
+		};
+
+		ds-pins {
+			pinmux = <MT8365_PIN_86_MSDC2_DSL__FUNC_MSDC2_DSL>;
+			drive-strength = <8>;
+			bias-pull-down = <MTK_PUPD_SET_R1R0_10>;
+		};
+
+		sys-en-pins {
+			pinmux = <MT8365_PIN_120_DMIC1_CLK__FUNC_GPIO120>;
+			output-high;
+		};
+	};
+
 	uart0_pins: uart0-pins {
 		pins {
 			pinmux = <MT8365_PIN_35_URXD0__FUNC_URXD0>,

---
base-commit: 9d89551994a430b50c4fffcb1e617a057fa76e20
change-id: 20250109-mmc2-support-96b3ea516186

Best regards,
-- 
Alexandre Mergnat <amergnat@baylibre.com>


