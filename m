Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 98A41C021B6
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 25 Feb 2025 11:32:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=of1Aj+b2AygxrQL0A6JMIgE22awWJ2bmoSsFSdWAD6k=; b=e/cEoa2P4Ade0Q1schl0x68Y/4
	NEokLF1ldmolAwJLs6wtSIOGZYNbfbiNMAdUMU1IeYny32+al0hcmmyLf5dzgQLbn7k24RL6JZfQ9
	OCKB7UnF2PbX8hEZMDnUb+CZsAe5OcFMrF0lFzC9TJreS/eUOZ+iC4ICNyI/zoiXqps8WvYNNElZ9
	BH+jrfPY38SkS50lKcp+4XfthOrbWE/fUFezgOsJDseNPl6QZqGVNT9g9ri35LEqYw3XBY8rFIcCH
	5lcK0jep95kjvVyy+gGd5+IRuJvg9h5RaBISDmgOGyY02o9q67bUHWp5s/8Z/R/8mfh8aK7TQxlqv
	R4XVKktw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tmtAw-0000000H2nO-3N9Z;
	Tue, 25 Feb 2025 11:32:34 +0000
Received: from mail-ej1-x62f.google.com ([2a00:1450:4864:20::62f])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tms1K-0000000GnF9-3M0b
	for linux-arm-kernel@lists.infradead.org;
	Tue, 25 Feb 2025 10:18:36 +0000
Received: by mail-ej1-x62f.google.com with SMTP id a640c23a62f3a-abb9fac29d8so82113266b.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 25 Feb 2025 02:18:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1740478713; x=1741083513; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=of1Aj+b2AygxrQL0A6JMIgE22awWJ2bmoSsFSdWAD6k=;
        b=yTngpXFaGAWUNT5c7Fx0/GBU60NBz5Q1d0Qy0I+UTAeJLmoHsa/EXYJDKTDFvsKAWA
         sTwsb6XGGoy5lk4UNltBaLtBgucFXozw+Iuerig2cr19pdXWIgmiOKpD5leIpBFzx2RV
         eII28kkqgxuxjz3GkrTuFOh9IEXqtFlf/gP7tQ8ROOADn7K974MOesnNqQguPd81zNY0
         gQuhAHszYOQZwyD/rcDhc0Cj5woXR1H44I0cBqOrGcodOm2sFCjHAPY3TWe8lpMUOr8w
         LNpIslHiJjJth7fpsMAw+3kpZfQJH0lx9ykm32zRqhi4ZqExkUoMl2Dr9tZ6j1+CPP2H
         LHqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740478713; x=1741083513;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=of1Aj+b2AygxrQL0A6JMIgE22awWJ2bmoSsFSdWAD6k=;
        b=GQR/BZHRfbXgwdSa5jtSOgD6q3cwmN5DFbNb21HOYtt2rezH1ZAcrY45eUQhSOMdBV
         MwGg2HanNA4diIKS1LYoO3BMCDlMR+S/JSsCAilWL2i/25Uby1px/G0gVWSxttielkw2
         uuNqjQLXbfTkN3k4bJz2OF11qtl6bDvEczxVNVXSpuini3I5xLMV8GH/QZLzepAGGTJf
         KXiFol965owbvJVEhj05w2wJSls2hfCKBqb3G5Bgi9WeljOMYxZnCDYal5xp+UtzzlEt
         bU4vPPGydw7EbutbO1XYqxqHJ9T1i4+fp1ImsafF2Kc+9j1LkDzmLE+i3tx9HjQR+t7S
         DYYQ==
X-Forwarded-Encrypted: i=1; AJvYcCVKhNt0i4OXLlCBLc4eQ4UgPN0qK1JCWIZvlok+uYCKnG1PoK5adtmJ9t3HRiLDN0Su/Eku+LQ/ohaqoeYScASE@lists.infradead.org
X-Gm-Message-State: AOJu0YzugDsgRcNAYm0RfxOKlNjgh0DrOffw5OSUm9oL7zo8wOmlREfC
	RT8LO3G1K/VCmlwiKprhoI/KQbO10HYJ3yrVJ1UDxqmU9O4q3QG9ci+ELR+YZ+o=
X-Gm-Gg: ASbGncsQTxiuTywEDM+eoJTi1YCzjx6Kt+eNtTvRBJTD7Rsej2MYcW5dmMM2JmYmskK
	BAgf/PSxWbBOHNzxkwoNuck4Vgq+qv2M+j5IsjXmBXcldo4RzOuQfg0xV2wg91ygKFG6dxHgSIO
	BarpPaFEXqKw/JwW9lBvcLDPFM428lBL1Z25DLrFhHLy0K6NDUf+r1hTwF141Z4qnFz9IzYJZu5
	Bor9858989fr0AZbCkMbJA3B6AGLaW3ODDiQmpFlgjjzD/ASNgbijo2WdzM/HQ3/OlLkO/OALfb
	VPYN07dW8mQdqVaRjM/RfJA7QN81NewQSOlrWcTMsPVBb1IJppn4ORjXDW5BODS1GIdTSEYwhe0
	=
X-Google-Smtp-Source: AGHT+IF/O2qgzDlpSiG1lR7ObLbGjnnjV2zONrsTr1vx1NDwvqVNso6CnH5NNmLxDNPJVXo6dnHsfQ==
X-Received: by 2002:a17:907:9713:b0:ab7:5fcd:d4be with SMTP id a640c23a62f3a-abc099c6a2dmr707107666b.1.1740478713100;
        Tue, 25 Feb 2025 02:18:33 -0800 (PST)
Received: from krzk-bin.. (78-11-220-99.static.ip.netia.com.pl. [78.11.220.99])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-abed2016014sm113954566b.112.2025.02.25.02.18.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 25 Feb 2025 02:18:32 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH RFC] arm64: dts: mediatek: mt8183: Switch to undeprecated qcom,calibration-variant
Date: Tue, 25 Feb 2025 11:18:28 +0100
Message-ID: <20250225101828.107509-1-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250225_021834_843064_CE9957BF 
X-CRM114-Status: GOOD (  11.07  )
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

The property qcom,ath10k-calibration-variant was deprecated in favor of
recently introduced generic qcom,calibration-variant, common to all
Qualcomm Atheros WiFi bindings.

Change will affect out of tree users, like other projects, of this DTS.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

---

Dependency/RFC!

RFC, because this should be merged release after driver support is
merged:
https://lore.kernel.org/linux-devicetree/20250225-b-wifi-qcom-calibration-variant-v1-0-3b2aa3f89c53@linaro.org/T/#t
---
 arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-cozmo.dts     | 2 +-
 arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-damu.dts      | 2 +-
 .../boot/dts/mediatek/mt8183-kukui-jacuzzi-fennel-sku1.dts      | 2 +-
 .../boot/dts/mediatek/mt8183-kukui-jacuzzi-fennel-sku6.dts      | 2 +-
 .../boot/dts/mediatek/mt8183-kukui-jacuzzi-fennel-sku7.dts      | 2 +-
 .../boot/dts/mediatek/mt8183-kukui-jacuzzi-fennel14-sku2.dts    | 2 +-
 arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-fennel14.dts  | 2 +-
 arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-juniper.dtsi  | 2 +-
 .../boot/dts/mediatek/mt8183-kukui-jacuzzi-makomo-sku0.dts      | 2 +-
 .../boot/dts/mediatek/mt8183-kukui-jacuzzi-makomo-sku1.dts      | 2 +-
 arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-willow.dtsi   | 2 +-
 arch/arm64/boot/dts/mediatek/mt8183-kukui-kakadu.dtsi           | 2 +-
 arch/arm64/boot/dts/mediatek/mt8183-kukui-katsu-sku32.dts       | 2 +-
 arch/arm64/boot/dts/mediatek/mt8183-kukui-katsu-sku38.dts       | 2 +-
 arch/arm64/boot/dts/mediatek/mt8183-kukui-kodama.dtsi           | 2 +-
 arch/arm64/boot/dts/mediatek/mt8183-kukui-krane.dtsi            | 2 +-
 16 files changed, 16 insertions(+), 16 deletions(-)

diff --git a/arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-cozmo.dts b/arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-cozmo.dts
index 83bbcfe62083..f2303d9f125f 100644
--- a/arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-cozmo.dts
+++ b/arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-cozmo.dts
@@ -35,5 +35,5 @@ trackpad@2c {
 };
 
 &qca_wifi {
-	qcom,ath10k-calibration-variant = "GO_COZMO";
+	qcom,calibration-variant = "GO_COZMO";
 };
diff --git a/arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-damu.dts b/arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-damu.dts
index 3935d83a047e..13ec15fa284f 100644
--- a/arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-damu.dts
+++ b/arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-damu.dts
@@ -31,7 +31,7 @@ &mt6358codec {
 };
 
 &qca_wifi {
-	qcom,ath10k-calibration-variant = "GO_DAMU";
+	qcom,calibration-variant = "GO_DAMU";
 };
 
 &i2c2 {
diff --git a/arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-fennel-sku1.dts b/arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-fennel-sku1.dts
index 72852b760038..b576b974cf23 100644
--- a/arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-fennel-sku1.dts
+++ b/arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-fennel-sku1.dts
@@ -40,6 +40,6 @@ &touchscreen {
 };
 
 &qca_wifi {
-	qcom,ath10k-calibration-variant = "GO_FENNEL";
+	qcom,calibration-variant = "GO_FENNEL";
 };
 
diff --git a/arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-fennel-sku6.dts b/arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-fennel-sku6.dts
index 757d0afd14fb..d64581f35d2c 100644
--- a/arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-fennel-sku6.dts
+++ b/arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-fennel-sku6.dts
@@ -28,6 +28,6 @@ &touchscreen {
 
 
 &qca_wifi {
-	qcom,ath10k-calibration-variant = "GO_FENNEL";
+	qcom,calibration-variant = "GO_FENNEL";
 };
 
diff --git a/arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-fennel-sku7.dts b/arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-fennel-sku7.dts
index 6641b087e7c5..d0c98d0aba95 100644
--- a/arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-fennel-sku7.dts
+++ b/arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-fennel-sku7.dts
@@ -28,6 +28,6 @@ &touchscreen {
 
 
 &qca_wifi {
-	qcom,ath10k-calibration-variant = "GO_FENNEL";
+	qcom,calibration-variant = "GO_FENNEL";
 };
 
diff --git a/arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-fennel14-sku2.dts b/arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-fennel14-sku2.dts
index 877256eab262..3a81786084da 100644
--- a/arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-fennel14-sku2.dts
+++ b/arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-fennel14-sku2.dts
@@ -14,5 +14,5 @@ / {
 };
 
 &qca_wifi {
-	qcom,ath10k-calibration-variant = "GO_FENNEL14";
+	qcom,calibration-variant = "GO_FENNEL14";
 };
diff --git a/arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-fennel14.dts b/arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-fennel14.dts
index b981dd31a430..959c4d3d9707 100644
--- a/arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-fennel14.dts
+++ b/arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-fennel14.dts
@@ -14,5 +14,5 @@ / {
 };
 
 &qca_wifi {
-	qcom,ath10k-calibration-variant = "GO_FENNEL14";
+	qcom,calibration-variant = "GO_FENNEL14";
 };
diff --git a/arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-juniper.dtsi b/arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-juniper.dtsi
index 078bc765646f..4788edaeab87 100644
--- a/arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-juniper.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-juniper.dtsi
@@ -22,6 +22,6 @@ trackpad@2c {
 };
 
 &qca_wifi {
-	qcom,ath10k-calibration-variant = "GO_JUNIPER";
+	qcom,calibration-variant = "GO_JUNIPER";
 };
 
diff --git a/arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-makomo-sku0.dts b/arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-makomo-sku0.dts
index ddb993521bbf..01cd59993a7c 100644
--- a/arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-makomo-sku0.dts
+++ b/arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-makomo-sku0.dts
@@ -14,7 +14,7 @@ / {
 };
 
 &qca_wifi {
-	qcom,ath10k-calibration-variant = "GO_FENNEL14";
+	qcom,calibration-variant = "GO_FENNEL14";
 };
 
 &mmc1_pins_uhs {
diff --git a/arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-makomo-sku1.dts b/arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-makomo-sku1.dts
index 10c4f920a7d8..c939ef3965ec 100644
--- a/arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-makomo-sku1.dts
+++ b/arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-makomo-sku1.dts
@@ -14,7 +14,7 @@ / {
 };
 
 &qca_wifi {
-	qcom,ath10k-calibration-variant = "GO_FENNEL14";
+	qcom,calibration-variant = "GO_FENNEL14";
 };
 
 &mmc1_pins_uhs {
diff --git a/arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-willow.dtsi b/arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-willow.dtsi
index c942e461a177..14d03419b92c 100644
--- a/arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-willow.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-willow.dtsi
@@ -37,5 +37,5 @@ trackpad@2c {
 };
 
 &qca_wifi {
-	qcom,ath10k-calibration-variant = "GO_JUNIPER";
+	qcom,calibration-variant = "GO_JUNIPER";
 };
diff --git a/arch/arm64/boot/dts/mediatek/mt8183-kukui-kakadu.dtsi b/arch/arm64/boot/dts/mediatek/mt8183-kukui-kakadu.dtsi
index ff02f63bac29..c4c08c0f715e 100644
--- a/arch/arm64/boot/dts/mediatek/mt8183-kukui-kakadu.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt8183-kukui-kakadu.dtsi
@@ -370,7 +370,7 @@ keyboard-controller {
 };
 
 &qca_wifi {
-	qcom,ath10k-calibration-variant = "GO_KAKADU";
+	qcom,calibration-variant = "GO_KAKADU";
 };
 
 &panel {
diff --git a/arch/arm64/boot/dts/mediatek/mt8183-kukui-katsu-sku32.dts b/arch/arm64/boot/dts/mediatek/mt8183-kukui-katsu-sku32.dts
index 2b5a8d1f900e..7428efec95a0 100644
--- a/arch/arm64/boot/dts/mediatek/mt8183-kukui-katsu-sku32.dts
+++ b/arch/arm64/boot/dts/mediatek/mt8183-kukui-katsu-sku32.dts
@@ -32,5 +32,5 @@ &panel {
 };
 
 &qca_wifi {
-	qcom,ath10k-calibration-variant = "GO_KATSU";
+	qcom,calibration-variant = "GO_KATSU";
 };
diff --git a/arch/arm64/boot/dts/mediatek/mt8183-kukui-katsu-sku38.dts b/arch/arm64/boot/dts/mediatek/mt8183-kukui-katsu-sku38.dts
index 75fadf2c7059..a36b6ddb71f6 100644
--- a/arch/arm64/boot/dts/mediatek/mt8183-kukui-katsu-sku38.dts
+++ b/arch/arm64/boot/dts/mediatek/mt8183-kukui-katsu-sku38.dts
@@ -32,7 +32,7 @@ &panel {
 };
 
 &qca_wifi {
-	qcom,ath10k-calibration-variant = "GO_KATSU";
+	qcom,calibration-variant = "GO_KATSU";
 };
 
 &sound {
diff --git a/arch/arm64/boot/dts/mediatek/mt8183-kukui-kodama.dtsi b/arch/arm64/boot/dts/mediatek/mt8183-kukui-kodama.dtsi
index da6e767b4cee..2b283a55f653 100644
--- a/arch/arm64/boot/dts/mediatek/mt8183-kukui-kodama.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt8183-kukui-kodama.dtsi
@@ -349,7 +349,7 @@ keyboard-controller {
 };
 
 &qca_wifi {
-	qcom,ath10k-calibration-variant = "GO_KODAMA";
+	qcom,calibration-variant = "GO_KODAMA";
 };
 
 &i2c_tunnel {
diff --git a/arch/arm64/boot/dts/mediatek/mt8183-kukui-krane.dtsi b/arch/arm64/boot/dts/mediatek/mt8183-kukui-krane.dtsi
index 8b56b8564ed7..00da50a41574 100644
--- a/arch/arm64/boot/dts/mediatek/mt8183-kukui-krane.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt8183-kukui-krane.dtsi
@@ -353,7 +353,7 @@ keyboard-controller {
 };
 
 &qca_wifi {
-	qcom,ath10k-calibration-variant = "LE_Krane";
+	qcom,calibration-variant = "LE_Krane";
 };
 
 &sound {
-- 
2.43.0


