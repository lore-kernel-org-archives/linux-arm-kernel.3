Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4276FD5E369
	for <linux-arm-kernel@archiver.kernel.org>; Sat,  9 Nov 2024 12:57:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=CQ9NSVxNmU2bLIFXUwQFB7anXf5+cHYcjGaMIkMwGmQ=; b=wD5idtIMpyKpz/lcb40I8R7kCU
	83aS/huY/4DdCGouk8T65QblA0J+dFqpeOD/woRmKwR1Rh4Dq/SAJwXOKA84qFlR6RmYwx+fKDHl9
	9GJdFyYQ3kZiYYrf7CFtvNm+311AKLt2clr/Ydow9maGHb8LjEVS/64BuNf9I5uGlqeNa5cXLYR7L
	xQquLyuzD/p20RBVYcfElFTeyRJtKRgfU+Id1yh6WVrL8Ne7Hl/+IpBETnPyLdGCCKL4jUAj8xxXH
	gLou9djWV57VqFj/zFmN/YsDhCchBbz3eW6IN8ENW1LU7jdxxRQrzi8otJiXYohx5j5HAAhjUsUSv
	N2D3ebnA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t9l1R-0000000DM7G-3Cv0;
	Sat, 09 Nov 2024 12:57:01 +0000
Received: from mail-ed1-x535.google.com ([2a00:1450:4864:20::535])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t9kpe-0000000DKUl-2nQC
	for linux-arm-kernel@lists.infradead.org;
	Sat, 09 Nov 2024 12:44:51 +0000
Received: by mail-ed1-x535.google.com with SMTP id 4fb4d7f45d1cf-5cb6ca2a776so4442256a12.0
        for <linux-arm-kernel@lists.infradead.org>; Sat, 09 Nov 2024 04:44:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1731156289; x=1731761089; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=CQ9NSVxNmU2bLIFXUwQFB7anXf5+cHYcjGaMIkMwGmQ=;
        b=LQMX9Io9PKbARiY2dezEJqkWhgDQSkgBcG7DD58irUG1eU44N5emKGzxkh6Aw83OO6
         5lio4pEBr9timD70+Hn2M2rPJT3XtLM0aW1x5QhNV2xxfrd54AnWsYEmfzyM9CNsu3VN
         QEED1qUbAXxWmVuILlSQSOajH1HechazAO5lRXVw+33eQWexBGRXwryyMX9v7sM59QaI
         wSmf3Wh6na5M5mMeMBqp340rR6s6Pf6JwrG+EmYzD21lZZ14kY8m/SDzcksb32xsSFnF
         Hy6NloKAdafen9ENc6T2woSYeQQH10L0Oy29y6MhPeXTySSYdgNAejsA3vMoGcHNt0R8
         NDNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731156289; x=1731761089;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=CQ9NSVxNmU2bLIFXUwQFB7anXf5+cHYcjGaMIkMwGmQ=;
        b=pFg8NeLQOLvdhWF6CeD8uprw1vCfwFiHWrGMK9thDHlt1hg+KKUzUSktos1YDt9mEF
         CdvUPvG4idQNpvxuCW0xLdHbJfWyEGPFgQMAvQUIkK+8e56CBP1MxL+3cFrhaTu4Sb9O
         yAD8vR2UH+oSxjTdP32E2aLOZL8y8Ozbo4RNr9fWYYqV83Ab+HNwT66xt65oWtzyBbwF
         6UsbdOQIDtztyAfWT7RPHkrZ01jYpAtNN0CxQziGuowMT/02HmCZpW7FuNrNsEnUqFTG
         wXkqWe7OtysH2ri5JUeXDpjylTghPtGeBMb4UiQ0SgegiRTE6ek6IvHsDLz0e/WPwHYX
         pTJQ==
X-Forwarded-Encrypted: i=1; AJvYcCW6Ngzbc2AVYR8Nlp+K7/2mEN9yjrOCZZl8X4Raynp1eOU0pp3f+AfmGOmfkkD2FbEJeZppl+Qa3TdgezBZDyOC@lists.infradead.org
X-Gm-Message-State: AOJu0YyymaWX1TphWJa7+Rc9MUQ95CrLRK4A0bX03uk2SQRhEMik65ga
	BKPRFkdCnCr1BGcnLMy7NMUSX4ZNnDW6stigyLfELScIjLNu2lkr
X-Google-Smtp-Source: AGHT+IEava32G9LkepDqhNF98BHoT2kEpMj/WzLFM5B1x5SUXXliyjsQMEGMpaCuJJcC1rJTYXaoqA==
X-Received: by 2002:a05:6402:d0d:b0:5c2:439d:90d4 with SMTP id 4fb4d7f45d1cf-5cf0a45f22bmr4810410a12.30.1731156288669;
        Sat, 09 Nov 2024 04:44:48 -0800 (PST)
Received: from [127.0.1.1] (leased-line-46-53-189-50.telecom.by. [46.53.189.50])
        by smtp.googlemail.com with ESMTPSA id 4fb4d7f45d1cf-5cf03b5d793sm2940166a12.17.2024.11.09.04.44.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 09 Nov 2024 04:44:47 -0800 (PST)
From: Dzmitry Sankouski <dsankouski@gmail.com>
Date: Sat, 09 Nov 2024 15:44:35 +0300
Subject: [PATCH 3/4] power: supply: max17042: use microvolts for voltage
 comparison
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241109-b4-max17042-v1-3-9e2b07e54e76@gmail.com>
References: <20241109-b4-max17042-v1-0-9e2b07e54e76@gmail.com>
In-Reply-To: <20241109-b4-max17042-v1-0-9e2b07e54e76@gmail.com>
To: Hans de Goede <hdegoede@redhat.com>, 
 Krzysztof Kozlowski <krzk@kernel.org>, 
 Marek Szyprowski <m.szyprowski@samsung.com>, 
 Sebastian Krzyszkowiak <sebastian.krzyszkowiak@puri.sm>, 
 Purism Kernel Team <kernel@puri.sm>, Sebastian Reichel <sre@kernel.org>, 
 Rob Herring <robh@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
 Alim Akhtar <alim.akhtar@samsung.com>, Shawn Guo <shawnguo@kernel.org>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-pm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-samsung-soc@vger.kernel.org, imx@lists.linux.dev, 
 linux-arm-msm@vger.kernel.org, Dzmitry Sankouski <dsankouski@gmail.com>
X-Mailer: b4 0.14.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1731156277; l=7169;
 i=dsankouski@gmail.com; s=20240619; h=from:subject:message-id;
 bh=oX98cqsu9ezhoyh3zMCsqzngVH4022JCLrceQnb5H7w=;
 b=fSAus6hdbJoEivY1qvsqsA9L4OfkV3c0pEcQviAyQ4PUq6GytjxonoqhMMGpCSqQMVG158a0S
 DYpghObEXyZBGANGKXeOJNanilreWXaqeQaSScPgTm2cV2w089dJsIP
X-Developer-Key: i=dsankouski@gmail.com; a=ed25519;
 pk=YJcXFcN1EWrzBYuiE2yi5Mn6WLn6L1H71J+f7X8fMag=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241109_044450_746298_0D87016D 
X-CRM114-Status: GOOD (  12.86  )
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

Do not convert VCELL register value from uV to mV to compare
with vmin/vmax. Rather use uV for vim/vmax, since that's a
standard measure unit in power supply drivers.

Convert "maxim,dead-volt" and "maxim,over-volt" to uV.

Signed-off-by: Dzmitry Sankouski <dsankouski@gmail.com>
---
 Documentation/devicetree/bindings/power/supply/maxim,max17042.yaml | 2 +-
 arch/arm/boot/dts/samsung/exynos4210-i9100.dts                     | 2 +-
 arch/arm/boot/dts/samsung/exynos4212-tab3.dtsi                     | 2 +-
 arch/arm/boot/dts/samsung/exynos4412-midas.dtsi                    | 2 +-
 arch/arm/boot/dts/samsung/exynos4412-p4note.dtsi                   | 2 +-
 arch/arm64/boot/dts/freescale/imx8mq-librem5.dtsi                  | 2 +-
 arch/arm64/boot/dts/qcom/msm8916-motorola-harpia.dts               | 4 ++--
 arch/arm64/boot/dts/qcom/msm8916-motorola-osprey.dts               | 4 ++--
 arch/arm64/boot/dts/qcom/msm8916-motorola-surnia.dts               | 4 ++--
 arch/arm64/boot/dts/qcom/msm8916-samsung-gt5-common.dtsi           | 2 +-
 drivers/power/supply/max17042_battery.c                            | 4 ----
 11 files changed, 13 insertions(+), 17 deletions(-)

diff --git a/Documentation/devicetree/bindings/power/supply/maxim,max17042.yaml b/Documentation/devicetree/bindings/power/supply/maxim,max17042.yaml
index e98ffdad1ec3..d1ad597e0837 100644
--- a/Documentation/devicetree/bindings/power/supply/maxim,max17042.yaml
+++ b/Documentation/devicetree/bindings/power/supply/maxim,max17042.yaml
@@ -83,7 +83,7 @@ examples:
         reg = <0x36>;
         maxim,rsns-microohm = <10000>;
         maxim,over-heat-temp = <600>;
-        maxim,over-volt = <4300>;
+        maxim,over-volt = <4300000>;
         shared-irq;
       };
     };
diff --git a/arch/arm/boot/dts/samsung/exynos4210-i9100.dts b/arch/arm/boot/dts/samsung/exynos4210-i9100.dts
index 0d8495792a70..0ca755160bef 100644
--- a/arch/arm/boot/dts/samsung/exynos4210-i9100.dts
+++ b/arch/arm/boot/dts/samsung/exynos4210-i9100.dts
@@ -150,7 +150,7 @@ battery@36 {
 
 			reg = <0x36>;
 			maxim,over-heat-temp = <700>;
-			maxim,over-volt = <4500>;
+			maxim,over-volt = <4500000>;
 		};
 	};
 
diff --git a/arch/arm/boot/dts/samsung/exynos4212-tab3.dtsi b/arch/arm/boot/dts/samsung/exynos4212-tab3.dtsi
index 9bc05961577d..758bfc10826f 100644
--- a/arch/arm/boot/dts/samsung/exynos4212-tab3.dtsi
+++ b/arch/arm/boot/dts/samsung/exynos4212-tab3.dtsi
@@ -186,7 +186,7 @@ fuel-gauge@36 {
 			pinctrl-0 = <&max77693_fuel_irq>;
 
 			maxim,over-heat-temp = <500>;
-			maxim,over-volt = <4500>;
+			maxim,over-volt = <450000>;
 		};
 	};
 
diff --git a/arch/arm/boot/dts/samsung/exynos4412-midas.dtsi b/arch/arm/boot/dts/samsung/exynos4412-midas.dtsi
index 3d5aace668dc..c744907b7c42 100644
--- a/arch/arm/boot/dts/samsung/exynos4412-midas.dtsi
+++ b/arch/arm/boot/dts/samsung/exynos4412-midas.dtsi
@@ -263,7 +263,7 @@ fuel-gauge@36 {
 			reg = <0x36>;
 
 			maxim,over-heat-temp = <700>;
-			maxim,over-volt = <4500>;
+			maxim,over-volt = <4500000>;
 		};
 	};
 
diff --git a/arch/arm/boot/dts/samsung/exynos4412-p4note.dtsi b/arch/arm/boot/dts/samsung/exynos4412-p4note.dtsi
index 28a605802733..3d52aa25c83c 100644
--- a/arch/arm/boot/dts/samsung/exynos4412-p4note.dtsi
+++ b/arch/arm/boot/dts/samsung/exynos4412-p4note.dtsi
@@ -175,7 +175,7 @@ fuel-gauge@36 {
 			interrupts = <3 IRQ_TYPE_LEVEL_LOW>;
 			maxim,rsns-microohm = <10000>;
 			maxim,over-heat-temp = <600>;
-			maxim,over-volt = <4300>;
+			maxim,over-volt = <4300000>;
 		};
 	};
 
diff --git a/arch/arm64/boot/dts/freescale/imx8mq-librem5.dtsi b/arch/arm64/boot/dts/freescale/imx8mq-librem5.dtsi
index 1b39514d5c12..90beefaa644f 100644
--- a/arch/arm64/boot/dts/freescale/imx8mq-librem5.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx8mq-librem5.dtsi
@@ -1141,7 +1141,7 @@ bat: fuel-gauge@36 {
 		pinctrl-0 = <&pinctrl_gauge>;
 		power-supplies = <&bq25895>;
 		maxim,over-heat-temp = <700>;
-		maxim,over-volt = <4500>;
+		maxim,over-volt = <4500000>;
 		maxim,rsns-microohm = <5000>;
 	};
 
diff --git a/arch/arm64/boot/dts/qcom/msm8916-motorola-harpia.dts b/arch/arm64/boot/dts/qcom/msm8916-motorola-harpia.dts
index 8380451ebbf6..a02ece82ff5b 100644
--- a/arch/arm64/boot/dts/qcom/msm8916-motorola-harpia.dts
+++ b/arch/arm64/boot/dts/qcom/msm8916-motorola-harpia.dts
@@ -25,8 +25,8 @@ battery@36 {
 		maxim,rsns-microohm = <10000>;
 		maxim,over-heat-temp = <600>;
 		maxim,cold-temp = <(-200)>;
-		maxim,dead-volt = <3200>;
-		maxim,over-volt = <4500>;
+		maxim,dead-volt = <3200000>;
+		maxim,over-volt = <4500000>;
 	};
 
 	/* charger@6b */
diff --git a/arch/arm64/boot/dts/qcom/msm8916-motorola-osprey.dts b/arch/arm64/boot/dts/qcom/msm8916-motorola-osprey.dts
index ec5589fc69bd..f567b7ffb613 100644
--- a/arch/arm64/boot/dts/qcom/msm8916-motorola-osprey.dts
+++ b/arch/arm64/boot/dts/qcom/msm8916-motorola-osprey.dts
@@ -36,8 +36,8 @@ battery@36 {
 		maxim,rsns-microohm = <10000>;
 		maxim,over-heat-temp = <600>;
 		maxim,cold-temp = <(-200)>;
-		maxim,dead-volt = <3200>;
-		maxim,over-volt = <4500>;
+		maxim,dead-volt = <3200000>;
+		maxim,over-volt = <4500000>;
 
 	};
 };
diff --git a/arch/arm64/boot/dts/qcom/msm8916-motorola-surnia.dts b/arch/arm64/boot/dts/qcom/msm8916-motorola-surnia.dts
index eecf78ba45bb..45ddd17243e7 100644
--- a/arch/arm64/boot/dts/qcom/msm8916-motorola-surnia.dts
+++ b/arch/arm64/boot/dts/qcom/msm8916-motorola-surnia.dts
@@ -25,8 +25,8 @@ battery@36 {
 		maxim,rsns-microohm = <10000>;
 		maxim,over-heat-temp = <600>;
 		maxim,cold-temp = <(-200)>;
-		maxim,dead-volt = <3200>;
-		maxim,over-volt = <4500>;
+		maxim,dead-volt = <3200000>;
+		maxim,over-volt = <4500000>;
 
 	};
 };
diff --git a/arch/arm64/boot/dts/qcom/msm8916-samsung-gt5-common.dtsi b/arch/arm64/boot/dts/qcom/msm8916-samsung-gt5-common.dtsi
index fbd2caf405d5..2c387c8b6344 100644
--- a/arch/arm64/boot/dts/qcom/msm8916-samsung-gt5-common.dtsi
+++ b/arch/arm64/boot/dts/qcom/msm8916-samsung-gt5-common.dtsi
@@ -105,7 +105,7 @@ fuelgauge@36 {
 
 		maxim,rsns-microohm = <10000>;
 		maxim,over-heat-temp = <600>;
-		maxim,over-volt = <4400>;
+		maxim,over-volt = <4400000>;
 
 		interrupt-parent = <&tlmm>;
 		interrupts = <121 IRQ_TYPE_EDGE_FALLING>;
diff --git a/drivers/power/supply/max17042_battery.c b/drivers/power/supply/max17042_battery.c
index f3d89d4d5c42..ea212cb10360 100644
--- a/drivers/power/supply/max17042_battery.c
+++ b/drivers/power/supply/max17042_battery.c
@@ -182,8 +182,6 @@ static int max17042_get_battery_health(struct max17042_chip *chip, int *health)
 
 	/* bits [0-3] unused */
 	vavg = val * 625 / 8;
-	/* Convert to millivolts */
-	vavg /= 1000;
 
 	ret = regmap_read(chip->regmap, MAX17042_VCELL, &val);
 	if (ret < 0)
@@ -191,8 +189,6 @@ static int max17042_get_battery_health(struct max17042_chip *chip, int *health)
 
 	/* bits [0-3] unused */
 	vbatt = val * 625 / 8;
-	/* Convert to millivolts */
-	vbatt /= 1000;
 
 	if (vavg < chip->pdata->vmin) {
 		*health = POWER_SUPPLY_HEALTH_DEAD;

-- 
2.39.2


