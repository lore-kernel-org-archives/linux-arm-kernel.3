Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 44EA2E7718F
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 27 Dec 2024 21:33:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=P/YsWsOqAMtNvIu897gqcQnKG+shOLRHZK6FrlkT4Sg=; b=wX2SYibPTlVWWr1jGY/t/ax/H6
	3gnNchjeRLbJ4DNyrypfuj9MM0Jxbd7tdixiqby1PGPzmKmOfFbZjVpQ47S/logGx6acPbCTh6GPM
	h+5RlOuJGiOmSUhZwopP0j35al/BoMclM7eJbL5KdcWjaWMUFH5vwRI0r3Hx/+2oBqPYZcW/oZWbH
	KeXvBmiivsqoMVWNNhi/Cf1qyVC2NjvwM8tIz17lYCrjRUk7maL1NgdYIJjQNTshU9vXhgvwpO6RD
	/bvgQzlhbnBxsMpDAWO7i3IPrCQAS0QfI97N0Sfh1IXzjL4UcH78qaSow27Wqwkya8j6QzOgn4NKP
	pvSnmIsA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tRHx4-00000000yvO-24Ll;
	Fri, 27 Dec 2024 21:32:58 +0000
Received: from mail-ed1-x52d.google.com ([2a00:1450:4864:20::52d])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tRHqB-00000000xvq-32uv;
	Fri, 27 Dec 2024 21:25:53 +0000
Received: by mail-ed1-x52d.google.com with SMTP id 4fb4d7f45d1cf-5d3d14336f0so7104373a12.3;
        Fri, 27 Dec 2024 13:25:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlemail.com; s=20230601; t=1735334750; x=1735939550; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=P/YsWsOqAMtNvIu897gqcQnKG+shOLRHZK6FrlkT4Sg=;
        b=mX2P0fiIsNcRhHDNRz0RWyyNJ+JHwBB8ukwU3/hs+OFSoYRHyEJdX42PTB5EgeypQz
         H1kBehhuqFGj0S6pEWHLFfhNIQdoCB9/g+JOlUx6xPux6VewyFbpLOzq8LWOXGmUCAau
         x8OqT+mm56y8o98g0sJ+XwVwSlLDDcNMDooy16XZWaqZTMEpIY2I04v5uxi+HrRVf0rX
         OAbd6CQH+3cwKQKK3ilxfvsoxirYl5XiJ81NNU1V1VVdGzTwzm4kfeRwSCOw71pC3IpN
         17auzfO/wYdLp55X0UeonbFMsg2D45um3ZOTGJAvqhuQuEjtKTXUa2IjcjvViHphZ3KW
         HVyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1735334750; x=1735939550;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=P/YsWsOqAMtNvIu897gqcQnKG+shOLRHZK6FrlkT4Sg=;
        b=Yd7adL7yADRKzTsUiEoK0RbBzqTRvmuZwW18uEk+5wwgVhsbJ1+hpj7eMlsU43Qeix
         Pz6Pt0wyZIQ3KrcD45t+9owqFYxqADFpZuSSXh4pEhCdWRyFmv6+NViNOFdOjLZFZtZO
         WCoAU829PakWscibh04sYyTSyqjdmpukLR/DWT1vTa35E6pupFsTIVeFHwSIPtlCOItj
         kjFq04KjcBkxInlZD4VahPqcAoYtVHTw0h3OmVGTWdtyUId+3SkW/e8VrNQjI2brjqoq
         nJnx8uSz5aq3PQbRo5OCFOS9fvOP9hTYknrSyzfGmcVnfJEfBNbJdr+lGaNycMnYzveg
         Vdvw==
X-Gm-Message-State: AOJu0YwgTuZfdktpdg67pXFNl/lXSMvHk3poBSjQ8kX0rlyCKNYQUlWo
	tyC3fvoQsCN0mIposcIZxOskyeRLsyeEGI5P1aVW4UOparqDUbimWGx09g==
X-Gm-Gg: ASbGncvH1vi35NBMS+KqnloqRDGkJYx03ZWb5hAfLtK6r23stDBvFY9Nz4M+28ftE4/
	tPTo1H7aoLXJ99FiyOcRznqsJEacMd3n4tdTvNv1Z6Vz4PDgJzpdahFk0RTIsjdk17kuNZnTncK
	z1Y+SIMUO7/3+r0jtnxWj1qFZDdqIbcBUWpVU3yiJnJYTlGUUqAs/EGFCQH/SpLdAWdwFv1BbUn
	Rp28x2ByHHkmPg4/R6Zs8GNksRqZgkTRXruk0AnNI4ehcDMAl59D0a/xrvZrxvjBIT1oiNotoEU
	IFva3qvkvxD2RgR8sBxS4g1KttvkpYlKiof9Tr1FDjRRPS4nGo3FveWSfRDfyeaDLvaJ0MHBSoW
	cCGUWplo0rQHhwfgt812lfnhRyQ==
X-Google-Smtp-Source: AGHT+IGS35CBFfUkjXBJVTZ2CH8LPXiRMhje99tYL6BMtvITy8TeGIghmB+xfrmEI5V9RHl31jOL2g==
X-Received: by 2002:a05:6402:278c:b0:5d0:214b:9d15 with SMTP id 4fb4d7f45d1cf-5d81dd54620mr22041877a12.5.1735334749863;
        Fri, 27 Dec 2024 13:25:49 -0800 (PST)
Received: from localhost.localdomain (dynamic-2a02-3100-b2be-ba00-1e86-0bff-fe2f-57b7.310.pool.telefonica.de. [2a02:3100:b2be:ba00:1e86:bff:fe2f:57b7])
        by smtp.googlemail.com with ESMTPSA id 4fb4d7f45d1cf-5d806fedbc5sm11627950a12.60.2024.12.27.13.25.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Dec 2024 13:25:48 -0800 (PST)
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
To: linux-amlogic@lists.infradead.org
Cc: linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	jbrunet@baylibre.com,
	neil.armstrong@linaro.org,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Subject: [PATCH 5/5] arm64: dts: amlogic: g12: switch to the new PWM controller binding
Date: Fri, 27 Dec 2024 22:25:14 +0100
Message-ID: <20241227212514.1376682-6-martin.blumenstingl@googlemail.com>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20241227212514.1376682-1-martin.blumenstingl@googlemail.com>
References: <20241227212514.1376682-1-martin.blumenstingl@googlemail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241227_132551_887383_2CBFA8A6 
X-CRM114-Status: GOOD (  12.82  )
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

Use the new PWM controller binding which now relies on passing all
clock inputs available on the SoC (instead of passing the "wanted"
clock input for a given board).

Signed-off-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
---
 .../boot/dts/amlogic/meson-g12-common.dtsi    | 33 ++++++++++++++++---
 .../boot/dts/amlogic/meson-g12a-fbx8am.dts    |  4 ---
 .../dts/amlogic/meson-g12a-radxa-zero.dts     |  4 ---
 .../boot/dts/amlogic/meson-g12a-sei510.dts    |  4 ---
 .../boot/dts/amlogic/meson-g12a-u200.dts      |  2 --
 .../boot/dts/amlogic/meson-g12a-x96-max.dts   |  4 ---
 .../amlogic/meson-g12b-a311d-libretech-cc.dts |  2 --
 .../dts/amlogic/meson-g12b-bananapi-cm4.dtsi  |  4 ---
 .../boot/dts/amlogic/meson-g12b-bananapi.dtsi |  4 ---
 .../dts/amlogic/meson-g12b-khadas-vim3.dtsi   |  4 ---
 .../boot/dts/amlogic/meson-g12b-odroid.dtsi   |  4 ---
 .../dts/amlogic/meson-g12b-radxa-zero2.dts    |  8 -----
 .../boot/dts/amlogic/meson-g12b-w400.dtsi     |  6 ----
 .../amlogic/meson-libretech-cottonwood.dtsi   |  6 ----
 .../boot/dts/amlogic/meson-sm1-ac2xx.dtsi     |  6 ----
 .../boot/dts/amlogic/meson-sm1-bananapi.dtsi  |  2 --
 .../dts/amlogic/meson-sm1-khadas-vim3l.dts    |  2 --
 .../boot/dts/amlogic/meson-sm1-odroid.dtsi    |  2 --
 .../boot/dts/amlogic/meson-sm1-sei610.dts     |  6 ----
 19 files changed, 28 insertions(+), 79 deletions(-)

diff --git a/arch/arm64/boot/dts/amlogic/meson-g12-common.dtsi b/arch/arm64/boot/dts/amlogic/meson-g12-common.dtsi
index 49b51c54013f..ab2b3f15ef19 100644
--- a/arch/arm64/boot/dts/amlogic/meson-g12-common.dtsi
+++ b/arch/arm64/boot/dts/amlogic/meson-g12-common.dtsi
@@ -2060,8 +2060,11 @@ cecb_AO: cec@280 {
 			};
 
 			pwm_AO_cd: pwm@2000 {
-				compatible = "amlogic,meson-g12a-ao-pwm-cd";
+				compatible = "amlogic,meson-g12-pwm-v2",
+					     "amlogic,meson8-pwm-v2";
 				reg = <0x0 0x2000 0x0 0x20>;
+				clocks = <&xtal>,
+					 <&clkc_AO CLKID_AO_CLK81>;
 				#pwm-cells = <3>;
 				status = "disabled";
 			};
@@ -2099,8 +2102,13 @@ i2c_AO: i2c@5000 {
 			};
 
 			pwm_AO_ab: pwm@7000 {
-				compatible = "amlogic,meson-g12a-ao-pwm-ab";
+				compatible = "amlogic,meson-g12-pwm-v2",
+					     "amlogic,meson8-pwm-v2";
 				reg = <0x0 0x7000 0x0 0x20>;
+				clocks = <&xtal>,
+					 <&clkc_AO CLKID_AO_CLK81>,
+					 <&clkc CLKID_FCLK_DIV4>,
+					 <&clkc CLKID_FCLK_DIV5>;
 				#pwm-cells = <3>;
 				status = "disabled";
 			};
@@ -2301,22 +2309,37 @@ spifc: spi@14000 {
 			};
 
 			pwm_ef: pwm@19000 {
-				compatible = "amlogic,meson-g12a-ee-pwm";
+				compatible = "amlogic,meson-g12-pwm-v2",
+					     "amlogic,meson8-pwm-v2";
 				reg = <0x0 0x19000 0x0 0x20>;
+				clocks = <&xtal>,
+					 <>, /* unknown/untested, the datasheet calls it "vid_pll" */
+					 <&clkc CLKID_FCLK_DIV4>,
+					 <&clkc CLKID_FCLK_DIV3>;
 				#pwm-cells = <3>;
 				status = "disabled";
 			};
 
 			pwm_cd: pwm@1a000 {
-				compatible = "amlogic,meson-g12a-ee-pwm";
+				compatible = "amlogic,meson-g12-pwm-v2",
+					     "amlogic,meson8-pwm-v2";
 				reg = <0x0 0x1a000 0x0 0x20>;
+				clocks = <&xtal>,
+					 <>, /* unknown/untested, the datasheet calls it "vid_pll" */
+					 <&clkc CLKID_FCLK_DIV4>,
+					 <&clkc CLKID_FCLK_DIV3>;
 				#pwm-cells = <3>;
 				status = "disabled";
 			};
 
 			pwm_ab: pwm@1b000 {
-				compatible = "amlogic,meson-g12a-ee-pwm";
+				compatible = "amlogic,meson-g12-pwm-v2",
+					     "amlogic,meson8-pwm-v2";
 				reg = <0x0 0x1b000 0x0 0x20>;
+				clocks = <&xtal>,
+					 <>, /* unknown/untested, the datasheet calls it "vid_pll" */
+					 <&clkc CLKID_FCLK_DIV4>,
+					 <&clkc CLKID_FCLK_DIV3>;
 				#pwm-cells = <3>;
 				status = "disabled";
 			};
diff --git a/arch/arm64/boot/dts/amlogic/meson-g12a-fbx8am.dts b/arch/arm64/boot/dts/amlogic/meson-g12a-fbx8am.dts
index a457b3f4397b..9aa36f17ffa2 100644
--- a/arch/arm64/boot/dts/amlogic/meson-g12a-fbx8am.dts
+++ b/arch/arm64/boot/dts/amlogic/meson-g12a-fbx8am.dts
@@ -346,8 +346,6 @@ &ir {
 &pwm_AO_cd {
 	pinctrl-0 = <&pwm_ao_d_e_pins>;
 	pinctrl-names = "default";
-	clocks = <&xtal>;
-	clock-names = "clkin1";
 	status = "okay";
 };
 
@@ -355,8 +353,6 @@ &pwm_ef {
 	status = "okay";
 	pinctrl-0 = <&pwm_e_pins>;
 	pinctrl-names = "default";
-	clocks = <&xtal>;
-	clock-names = "clkin0";
 };
 
 &pdm {
diff --git a/arch/arm64/boot/dts/amlogic/meson-g12a-radxa-zero.dts b/arch/arm64/boot/dts/amlogic/meson-g12a-radxa-zero.dts
index c779a5da7d1e..952b8d02e5c2 100644
--- a/arch/arm64/boot/dts/amlogic/meson-g12a-radxa-zero.dts
+++ b/arch/arm64/boot/dts/amlogic/meson-g12a-radxa-zero.dts
@@ -284,8 +284,6 @@ &ir {
 &pwm_AO_cd {
 	pinctrl-0 = <&pwm_ao_d_e_pins>;
 	pinctrl-names = "default";
-	clocks = <&xtal>;
-	clock-names = "clkin1";
 	status = "okay";
 };
 
@@ -293,8 +291,6 @@ &pwm_ef {
 	status = "okay";
 	pinctrl-0 = <&pwm_e_pins>;
 	pinctrl-names = "default";
-	clocks = <&xtal>;
-	clock-names = "clkin0";
 };
 
 &saradc {
diff --git a/arch/arm64/boot/dts/amlogic/meson-g12a-sei510.dts b/arch/arm64/boot/dts/amlogic/meson-g12a-sei510.dts
index ea51341f031b..52fbc5103e45 100644
--- a/arch/arm64/boot/dts/amlogic/meson-g12a-sei510.dts
+++ b/arch/arm64/boot/dts/amlogic/meson-g12a-sei510.dts
@@ -389,8 +389,6 @@ &ir {
 &pwm_AO_cd {
 	pinctrl-0 = <&pwm_ao_d_e_pins>;
 	pinctrl-names = "default";
-	clocks = <&xtal>;
-	clock-names = "clkin1";
 	status = "okay";
 };
 
@@ -398,8 +396,6 @@ &pwm_ef {
 	status = "okay";
 	pinctrl-0 = <&pwm_e_pins>;
 	pinctrl-names = "default";
-	clocks = <&xtal>;
-	clock-names = "clkin0";
 };
 
 &pdm {
diff --git a/arch/arm64/boot/dts/amlogic/meson-g12a-u200.dts b/arch/arm64/boot/dts/amlogic/meson-g12a-u200.dts
index f70a46967e2b..5407049d2647 100644
--- a/arch/arm64/boot/dts/amlogic/meson-g12a-u200.dts
+++ b/arch/arm64/boot/dts/amlogic/meson-g12a-u200.dts
@@ -502,8 +502,6 @@ &i2c3 {
 &pwm_AO_cd {
 	pinctrl-0 = <&pwm_ao_d_e_pins>;
 	pinctrl-names = "default";
-	clocks = <&xtal>;
-	clock-names = "clkin1";
 	status = "okay";
 };
 
diff --git a/arch/arm64/boot/dts/amlogic/meson-g12a-x96-max.dts b/arch/arm64/boot/dts/amlogic/meson-g12a-x96-max.dts
index 32f98a192494..01da83658ae3 100644
--- a/arch/arm64/boot/dts/amlogic/meson-g12a-x96-max.dts
+++ b/arch/arm64/boot/dts/amlogic/meson-g12a-x96-max.dts
@@ -328,8 +328,6 @@ &ir {
 &pwm_AO_cd {
 	pinctrl-0 = <&pwm_ao_d_e_pins>;
 	pinctrl-names = "default";
-	clocks = <&xtal>;
-	clock-names = "clkin1";
 	status = "okay";
 };
 
@@ -363,8 +361,6 @@ &pwm_ef {
 	status = "okay";
 	pinctrl-0 = <&pwm_e_pins>;
 	pinctrl-names = "default";
-	clocks = <&xtal>;
-	clock-names = "clkin0";
 };
 
 &uart_A {
diff --git a/arch/arm64/boot/dts/amlogic/meson-g12b-a311d-libretech-cc.dts b/arch/arm64/boot/dts/amlogic/meson-g12b-a311d-libretech-cc.dts
index 65b963d794cd..adedc1340c78 100644
--- a/arch/arm64/boot/dts/amlogic/meson-g12b-a311d-libretech-cc.dts
+++ b/arch/arm64/boot/dts/amlogic/meson-g12b-a311d-libretech-cc.dts
@@ -116,6 +116,4 @@ &cpu103 {
 
 &pwm_ab {
 	pinctrl-0 = <&pwm_a_e_pins>, <&pwm_b_x7_pins>;
-	clocks = <&xtal>, <&xtal>;
-	clock-names = "clkin0", "clkin1";
 };
diff --git a/arch/arm64/boot/dts/amlogic/meson-g12b-bananapi-cm4.dtsi b/arch/arm64/boot/dts/amlogic/meson-g12b-bananapi-cm4.dtsi
index 08c33ec7e9f1..92e8b26ecccc 100644
--- a/arch/arm64/boot/dts/amlogic/meson-g12b-bananapi-cm4.dtsi
+++ b/arch/arm64/boot/dts/amlogic/meson-g12b-bananapi-cm4.dtsi
@@ -257,8 +257,6 @@ &pcie {
 &pwm_ab {
 	pinctrl-0 = <&pwm_a_e_pins>;
 	pinctrl-names = "default";
-	clocks = <&xtal>;
-	clock-names = "clkin0";
 
 	status = "okay";
 };
@@ -273,8 +271,6 @@ &pwm_ef {
 &pwm_AO_cd {
 	pinctrl-0 = <&pwm_ao_d_e_pins>;
 	pinctrl-names = "default";
-	clocks = <&xtal>;
-	clock-names = "clkin1";
 
 	status = "okay";
 };
diff --git a/arch/arm64/boot/dts/amlogic/meson-g12b-bananapi.dtsi b/arch/arm64/boot/dts/amlogic/meson-g12b-bananapi.dtsi
index d4e1990b5f26..54663c55a20e 100644
--- a/arch/arm64/boot/dts/amlogic/meson-g12b-bananapi.dtsi
+++ b/arch/arm64/boot/dts/amlogic/meson-g12b-bananapi.dtsi
@@ -367,8 +367,6 @@ &pwm_ab {
 	status = "okay";
 	pinctrl-0 = <&pwm_a_e_pins>;
 	pinctrl-names = "default";
-	clocks = <&xtal>;
-	clock-names = "clkin0";
 };
 
 &pwm_ef {
@@ -380,8 +378,6 @@ &pwm_ef {
 &pwm_AO_cd {
 	pinctrl-0 = <&pwm_ao_d_e_pins>;
 	pinctrl-names = "default";
-	clocks = <&xtal>;
-	clock-names = "clkin1";
 	status = "okay";
 };
 
diff --git a/arch/arm64/boot/dts/amlogic/meson-g12b-khadas-vim3.dtsi b/arch/arm64/boot/dts/amlogic/meson-g12b-khadas-vim3.dtsi
index 16dd409051b4..48650bad230d 100644
--- a/arch/arm64/boot/dts/amlogic/meson-g12b-khadas-vim3.dtsi
+++ b/arch/arm64/boot/dts/amlogic/meson-g12b-khadas-vim3.dtsi
@@ -92,16 +92,12 @@ &cpu103 {
 &pwm_ab {
 	pinctrl-0 = <&pwm_a_e_pins>;
 	pinctrl-names = "default";
-	clocks = <&xtal>;
-	clock-names = "clkin0";
 	status = "okay";
 };
 
 &pwm_AO_cd {
 	pinctrl-0 = <&pwm_ao_d_e_pins>;
 	pinctrl-names = "default";
-	clocks = <&xtal>;
-	clock-names = "clkin1";
 	status = "okay";
 };
 
diff --git a/arch/arm64/boot/dts/amlogic/meson-g12b-odroid.dtsi b/arch/arm64/boot/dts/amlogic/meson-g12b-odroid.dtsi
index 09d959aefb18..7e8964bacfce 100644
--- a/arch/arm64/boot/dts/amlogic/meson-g12b-odroid.dtsi
+++ b/arch/arm64/boot/dts/amlogic/meson-g12b-odroid.dtsi
@@ -327,16 +327,12 @@ hdmi_tx_tmds_out: endpoint {
 &pwm_ab {
 	pinctrl-0 = <&pwm_a_e_pins>;
 	pinctrl-names = "default";
-	clocks = <&xtal>;
-	clock-names = "clkin0";
 	status = "okay";
 };
 
 &pwm_AO_cd {
 	pinctrl-0 = <&pwm_ao_d_e_pins>;
 	pinctrl-names = "default";
-	clocks = <&xtal>;
-	clock-names = "clkin1";
 	status = "okay";
 };
 
diff --git a/arch/arm64/boot/dts/amlogic/meson-g12b-radxa-zero2.dts b/arch/arm64/boot/dts/amlogic/meson-g12b-radxa-zero2.dts
index 39feba7f2d08..fc05ecf90714 100644
--- a/arch/arm64/boot/dts/amlogic/meson-g12b-radxa-zero2.dts
+++ b/arch/arm64/boot/dts/amlogic/meson-g12b-radxa-zero2.dts
@@ -379,32 +379,24 @@ &ir {
 &pwm_ab {
 	pinctrl-0 = <&pwm_a_e_pins>;
 	pinctrl-names = "default";
-	clocks = <&xtal>;
-	clock-names = "clkin0";
 	status = "okay";
 };
 
 &pwm_ef {
 	pinctrl-0 = <&pwm_e_pins>;
 	pinctrl-names = "default";
-	clocks = <&xtal>;
-	clock-names = "clkin0";
 	status = "okay";
 };
 
 &pwm_AO_ab {
 	pinctrl-0 = <&pwm_ao_a_pins>;
 	pinctrl-names = "default";
-	clocks = <&xtal>;
-	clock-names = "clkin0";
 	status = "okay";
 };
 
 &pwm_AO_cd {
 	pinctrl-0 = <&pwm_ao_d_e_pins>;
 	pinctrl-names = "default";
-	clocks = <&xtal>;
-	clock-names = "clkin1";
 	status = "okay";
 };
 
diff --git a/arch/arm64/boot/dts/amlogic/meson-g12b-w400.dtsi b/arch/arm64/boot/dts/amlogic/meson-g12b-w400.dtsi
index 4cb6930ffb19..a7a0fc264cdc 100644
--- a/arch/arm64/boot/dts/amlogic/meson-g12b-w400.dtsi
+++ b/arch/arm64/boot/dts/amlogic/meson-g12b-w400.dtsi
@@ -304,24 +304,18 @@ &ir {
 &pwm_ab {
 	pinctrl-0 = <&pwm_a_e_pins>;
 	pinctrl-names = "default";
-	clocks = <&xtal>;
-	clock-names = "clkin0";
 	status = "okay";
 };
 
 &pwm_AO_cd {
 	pinctrl-0 = <&pwm_ao_d_e_pins>;
 	pinctrl-names = "default";
-	clocks = <&xtal>;
-	clock-names = "clkin1";
 	status = "okay";
 };
 
 &pwm_ef {
 	pinctrl-0 = <&pwm_e_pins>;
 	pinctrl-names = "default";
-	clocks = <&xtal>;
-	clock-names = "clkin0";
 	status = "okay";
 };
 
diff --git a/arch/arm64/boot/dts/amlogic/meson-libretech-cottonwood.dtsi b/arch/arm64/boot/dts/amlogic/meson-libretech-cottonwood.dtsi
index 929e4720ae76..ac9c4c2673b1 100644
--- a/arch/arm64/boot/dts/amlogic/meson-libretech-cottonwood.dtsi
+++ b/arch/arm64/boot/dts/amlogic/meson-libretech-cottonwood.dtsi
@@ -458,24 +458,18 @@ &pwm_AO_cd {
 	status = "okay";
 	pinctrl-0 = <&pwm_ao_d_e_pins>;
 	pinctrl-names = "default";
-	clocks = <&xtal>;
-	clock-names = "clkin1";
 };
 
 &pwm_ab {
 	status = "okay";
 	pinctrl-0 = <&pwm_b_x7_pins>;
 	pinctrl-names = "default";
-	clocks = <&xtal>;
-	clock-names = "clkin1";
 };
 
 &pwm_cd {
 	status = "okay";
 	pinctrl-0 = <&pwm_d_x3_pins>;
 	pinctrl-names = "default";
-	clocks = <&xtal>;
-	clock-names = "clkin1";
 };
 
 &saradc {
diff --git a/arch/arm64/boot/dts/amlogic/meson-sm1-ac2xx.dtsi b/arch/arm64/boot/dts/amlogic/meson-sm1-ac2xx.dtsi
index d1fa8b8bf795..a3463149db3d 100644
--- a/arch/arm64/boot/dts/amlogic/meson-sm1-ac2xx.dtsi
+++ b/arch/arm64/boot/dts/amlogic/meson-sm1-ac2xx.dtsi
@@ -199,15 +199,11 @@ &pwm_AO_ab {
 	status = "okay";
 	pinctrl-0 = <&pwm_ao_a_pins>;
 	pinctrl-names = "default";
-	clocks = <&xtal>;
-	clock-names = "clkin0";
 };
 
 &pwm_AO_cd {
 	pinctrl-0 = <&pwm_ao_d_e_pins>;
 	pinctrl-names = "default";
-	clocks = <&xtal>;
-	clock-names = "clkin1";
 	status = "okay";
 };
 
@@ -215,8 +211,6 @@ &pwm_ef {
 	status = "okay";
 	pinctrl-0 = <&pwm_e_pins>;
 	pinctrl-names = "default";
-	clocks = <&xtal>;
-	clock-names = "clkin0";
 };
 
 &saradc {
diff --git a/arch/arm64/boot/dts/amlogic/meson-sm1-bananapi.dtsi b/arch/arm64/boot/dts/amlogic/meson-sm1-bananapi.dtsi
index 81dce862902a..40db95f64636 100644
--- a/arch/arm64/boot/dts/amlogic/meson-sm1-bananapi.dtsi
+++ b/arch/arm64/boot/dts/amlogic/meson-sm1-bananapi.dtsi
@@ -367,8 +367,6 @@ &ir {
 &pwm_AO_cd {
 	pinctrl-0 = <&pwm_ao_d_e_pins>;
 	pinctrl-names = "default";
-	clocks = <&xtal>;
-	clock-names = "clkin1";
 	status = "okay";
 };
 
diff --git a/arch/arm64/boot/dts/amlogic/meson-sm1-khadas-vim3l.dts b/arch/arm64/boot/dts/amlogic/meson-sm1-khadas-vim3l.dts
index 9c0b544e2209..5d75ad3f3e46 100644
--- a/arch/arm64/boot/dts/amlogic/meson-sm1-khadas-vim3l.dts
+++ b/arch/arm64/boot/dts/amlogic/meson-sm1-khadas-vim3l.dts
@@ -78,8 +78,6 @@ &cpu3 {
 &pwm_AO_cd {
 	pinctrl-0 = <&pwm_ao_d_e_pins>;
 	pinctrl-names = "default";
-	clocks = <&xtal>;
-	clock-names = "clkin1";
 	status = "okay";
 };
 
diff --git a/arch/arm64/boot/dts/amlogic/meson-sm1-odroid.dtsi b/arch/arm64/boot/dts/amlogic/meson-sm1-odroid.dtsi
index 7b0e9817a615..ad8d07883760 100644
--- a/arch/arm64/boot/dts/amlogic/meson-sm1-odroid.dtsi
+++ b/arch/arm64/boot/dts/amlogic/meson-sm1-odroid.dtsi
@@ -392,8 +392,6 @@ &ir {
 &pwm_AO_cd {
 	pinctrl-0 = <&pwm_ao_d_e_pins>;
 	pinctrl-names = "default";
-	clocks = <&xtal>;
-	clock-names = "clkin1";
 	status = "okay";
 };
 
diff --git a/arch/arm64/boot/dts/amlogic/meson-sm1-sei610.dts b/arch/arm64/boot/dts/amlogic/meson-sm1-sei610.dts
index 2e3397e55da2..37d7f64b6d5d 100644
--- a/arch/arm64/boot/dts/amlogic/meson-sm1-sei610.dts
+++ b/arch/arm64/boot/dts/amlogic/meson-sm1-sei610.dts
@@ -435,15 +435,11 @@ &pwm_AO_ab {
 	status = "okay";
 	pinctrl-0 = <&pwm_ao_a_pins>;
 	pinctrl-names = "default";
-	clocks = <&xtal>;
-	clock-names = "clkin0";
 };
 
 &pwm_AO_cd {
 	pinctrl-0 = <&pwm_ao_d_e_pins>;
 	pinctrl-names = "default";
-	clocks = <&xtal>;
-	clock-names = "clkin1";
 	status = "okay";
 };
 
@@ -451,8 +447,6 @@ &pwm_ef {
 	status = "okay";
 	pinctrl-0 = <&pwm_e_pins>;
 	pinctrl-names = "default";
-	clocks = <&xtal>;
-	clock-names = "clkin0";
 };
 
 &saradc {
-- 
2.47.1


