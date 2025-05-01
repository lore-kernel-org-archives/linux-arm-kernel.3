Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0C89EC369DC
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  1 May 2025 16:06:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=AHBhDJr9lHxrn2vY9UPMIfGx/gl5O7ayeNtcPr9WFCU=; b=uyCB3Kltm+glSGxCHejBA6ZlyI
	W7Bw+Aw2axm4dqbu9eGPZfAgKXciL75q1BIfhFMa9pKxvTCkLSHzqa+EcC5zT0HBQosKDZrvl4tCA
	/R30As362LA0y0DavHBeiwfEMEbcAYWt6NaID3QCPQfYX3jU3SrNvONkuqZTgQRbcv7ASXhUrnXr6
	FdxdnTNVCdLQt+NxtU6jx2tXhVESX9N+VFxQi23V/LTH6xmigq380f2oQ8G/z32ZH7jebHCLw4MR/
	zEAtJLI43xO5UNFysi4YkFRqmczx6asG/DsaV3IzfmZpbgRk5NHbVJMh262aFHUytUKX9/+Ef5hX8
	a8u3esvA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uAWQN-0000000G9Mp-29E0;
	Thu, 01 May 2025 16:06:11 +0000
Received: from mail-wm1-x330.google.com ([2a00:1450:4864:20::330])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uAWMr-0000000G8qI-1DjB
	for linux-arm-kernel@lists.infradead.org;
	Thu, 01 May 2025 16:02:35 +0000
Received: by mail-wm1-x330.google.com with SMTP id 5b1f17b1804b1-43cf861f936so2046075e9.3
        for <linux-arm-kernel@lists.infradead.org>; Thu, 01 May 2025 09:02:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1746115351; x=1746720151; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=AHBhDJr9lHxrn2vY9UPMIfGx/gl5O7ayeNtcPr9WFCU=;
        b=XSjsRWTqSBWNnX8INpcusnOPgCwUDp6Br0iK5fh1J6aQeiyROpyOSC51c93vb2vSQm
         yY6OG+5e8g/5l6KAntpm+h5XGrJofpOQ8tqWY95ik1Wbf2s3c0sePobZMEU8wh9UfcKi
         Jms7BYgjADJkvUALUId5xur/T6QtK3nNXG3bcAX0wo74BH02xSNs68NvjXoZCFonv9a4
         ZeMLevxHdFjSYXZQ5/9N4m2P+UW1N6osjH8ios2vtUFX1cBiyXyHYtjjC/t08qS02114
         TH7Eg6WoR2hE1pj+A+5pIxY7TPHzRS7piSWeb34OBNQ+4gGysVEk8/gQSMQw2zmR9CQj
         whVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746115351; x=1746720151;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=AHBhDJr9lHxrn2vY9UPMIfGx/gl5O7ayeNtcPr9WFCU=;
        b=GDdQejXU+cLO9EPf7RsHBJ624OQPzsL784Z8FUcU+IhXdhteKcpnsbEq1INIOvHPUX
         XLmK/kMx4P19R5McoVXOiHbbOkG9xnJk7ANb0xtHXaGYi4djMR9yCkOwVcC/V5rEEwBz
         KI8WyvdTMvPusaJQQ6lG21kjgkHp0I9VU9o7c2Hr+/qzHeFuCrzotNvWx5aUIWLhkCcm
         Jk3NgnnNWb+7nHXe7p9rLVqEBtWJtt6G9h3ZjpX5wDnwCl0GZhFbIDLOFJsK48/OqPaq
         IpXoPWHYLNIdOjYxmdRTtphzbC/DrDqkTspv+/DBgbk5pI3VWZ0G2Ei1dZV22j9OIRMa
         vv+g==
X-Forwarded-Encrypted: i=1; AJvYcCXHGHg+mw/l6cqqpZbDV4kKkMxtPeberLNmrsbsMRyiVGYRS/ZwjbJWaoW6P+QhgWPm637K77tDjbYIqpLSJTPH@lists.infradead.org
X-Gm-Message-State: AOJu0Yw65yLJ/4qTZPam8A8qXb/YLZ5erLbdmMpy3FB8k3BaUxUSahC4
	YezIKv8P6ARwjNhJqBK2GFVaYmSLeS+h/8lOVwguMREvfROSbtS1IpWT8RdhlIY=
X-Gm-Gg: ASbGnct5Ft2eF9VySJscbKy/gyqvi8YL3BVjNC4QDHAyiKW+m/v4Ec4vcmBTmb13o8a
	rF8o4osRANS8tjGEVc2zXXI3H09tPRXevh+C9qNJj3KiwOch1t8NZzgP+zDJJHULtg7+wt4ddNw
	xFyKQXxerEHqJ6lFTmKynAza8jhJc7uvHqHxwGe2eGpRv9NhaltKZcxFNisxdVjPH8ZAV2Mvlxy
	c49Yx2+AFp/bvZ4gj4FgThKqSvyvCsF7GObfPpKbK+bRQUVpdSQaFFhfuhs3+nNrHPnZDnIFmA4
	9OtxFSQXboOHJcjDVE0jhJlxNEmTBZjp5SqD/t2k3WXcqTpWqcp0dBmUFVul
X-Google-Smtp-Source: AGHT+IFv6+BkJpDpCldaI1QMFxLx2QRvznPegaig/IEHjKtay4AMQqYqpupZvjAUZH9aHFXpPyrmmw==
X-Received: by 2002:a05:6000:310c:b0:3a0:7a00:61e9 with SMTP id ffacd0b85a97d-3a0940033b3mr872751f8f.0.1746115351533;
        Thu, 01 May 2025 09:02:31 -0700 (PDT)
Received: from kuoka.. ([178.197.207.88])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a095a88298sm1163557f8f.62.2025.05.01.09.02.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 01 May 2025 09:02:31 -0700 (PDT)
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
Subject: [PATCH RESEND] arm64: dts: mediatek: mt8183: Switch to undeprecated qcom,calibration-variant
Date: Thu,  1 May 2025 18:02:28 +0200
Message-ID: <20250501160227.96609-2-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.45.2
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=9360; i=krzysztof.kozlowski@linaro.org;
 h=from:subject; bh=QNMj9c7xzZA7s922XwLPN1HkAdbTpiqetXxKdDoDB+U=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBoE5sTib8djgM1Gu0yA8gFWoHk1YSKSWcphXXwG
 H+pTqw6bi+JAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCaBObEwAKCRDBN2bmhouD
 14BqD/0U9iFpl95iwFEjx2lYIrm78gyjk1DvaU4sK6rYr55Ab8wA2q35YGM3znYvpwIg/EigUjQ
 VvSpmVLWCdHF8FoHtnz6p3hD+OsUHYBNC6fvrOF0/u1pJgVKu1K8cRTUGaI8NeoySFPMr0DeRH9
 qmGNjKuzpRJCoUuo/P96jK6Lpc+4zETPiFKjtFz1dDGmrZa30RqHYsGUafrUutJSyqIGwRfUyyv
 Ai+tb+wUr4vslzoW9l4gKwSmfAtUEAm4igL9ocrFuOFulURgfkMMLnqObAK395Q/rirFPNxdUHJ
 avhJJiEEJkUTe1MVESjPnL3Dsfwt0pQcm6W54nIub/LSkBznHyn8gByubGS0CU/bKgCbu/dzgeF
 glrodZj0lJ+RMNJVXnu9I3d9lkWK9Py84Dmt9ks1mfGFPrraOZX9xX6CNMSOJlgteemwqbv2J5r
 UBwoT48Hxkzt43qWOCgueGsCWeiE9tEYWR77FzlphPb73bYYbibQpDwqqxP0vrrg69QfAdDYnf6
 B//1C8maHftbk/GaZwtkexRhnJ+6u+6PQb8X6FeAMMMwWDdSircOCYInf9ysz3FruTSRJwd/8iR
 rmcPPHF4nIkMsDnvwKuvW+Hpx6tFNjVjSknPeMa32cRNlWEnliETQSNCAnFH6ZrzKmqDY+pBhYL 0xsgjkC+wVFkT3w==
X-Developer-Key: i=krzysztof.kozlowski@linaro.org; a=openpgp; fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250501_090233_332170_B394B7DB 
X-CRM114-Status: GOOD (  10.96  )
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

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---

Resending with tag after dependency got merged. This can be applied as
is.
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
index 7bc7c2687d6f..ebcfaa0498f9 100644
--- a/arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-damu.dts
+++ b/arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-damu.dts
@@ -28,7 +28,7 @@ &mt6358codec {
 };
 
 &qca_wifi {
-	qcom,ath10k-calibration-variant = "GO_DAMU";
+	qcom,calibration-variant = "GO_DAMU";
 };
 
 &i2c2 {
diff --git a/arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-fennel-sku1.dts b/arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-fennel-sku1.dts
index 863f3e403de8..21d1a80125ca 100644
--- a/arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-fennel-sku1.dts
+++ b/arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-fennel-sku1.dts
@@ -36,6 +36,6 @@ &touchscreen {
 };
 
 &qca_wifi {
-	qcom,ath10k-calibration-variant = "GO_FENNEL";
+	qcom,calibration-variant = "GO_FENNEL";
 };
 
diff --git a/arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-fennel-sku6.dts b/arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-fennel-sku6.dts
index e0a583ce4a0b..5280ba22b96d 100644
--- a/arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-fennel-sku6.dts
+++ b/arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-fennel-sku6.dts
@@ -24,6 +24,6 @@ &touchscreen {
 
 
 &qca_wifi {
-	qcom,ath10k-calibration-variant = "GO_FENNEL";
+	qcom,calibration-variant = "GO_FENNEL";
 };
 
diff --git a/arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-fennel-sku7.dts b/arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-fennel-sku7.dts
index 7874c9a20e12..f3049f3f51f9 100644
--- a/arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-fennel-sku7.dts
+++ b/arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-fennel-sku7.dts
@@ -24,6 +24,6 @@ &touchscreen {
 
 
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
2.45.2


