Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ED635D5E369
	for <linux-arm-kernel@archiver.kernel.org>; Sat,  9 Nov 2024 12:59:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=59tEYZAbxZv4QLtXinFrkb5WBvn6BEbQem6S6TXlOJw=; b=2xiugcm/qJSVrNoLPOD7TgxnAs
	b5s9jGlOXoGrQ1/I0p2eaX5C5uUd7oSRG3Yf4f5OKbKknfG6RpitAmqcSueTI7XBeKprRIJUmZo6q
	i/i+ZfGOvk94w9ZbTAQj+7jplRMMZ+ZqUiEssnsf90jJBh1tqpcBzFCc+yZ1BsNqAPRld7nmTXD74
	nN3AX6ZzQMcaJ6buk69ozSNbHFgwRZaTwCa6iEtWFK5qYDrqGd0NYD1uhzakH7wMV1H/xwp3Hwlr1
	nqeCWumrrqhAAtPEl7opH1JGdkuvJVlH3KSx0TYHPb4xXkJN0QIkHJBoVV9p/YtYve72ZnuTlmb/K
	LCZMEL5g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t9l3A-0000000DMF3-1cKx;
	Sat, 09 Nov 2024 12:58:48 +0000
Received: from mail-ed1-x52c.google.com ([2a00:1450:4864:20::52c])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t9kph-0000000DKVi-3BRG
	for linux-arm-kernel@lists.infradead.org;
	Sat, 09 Nov 2024 12:44:55 +0000
Received: by mail-ed1-x52c.google.com with SMTP id 4fb4d7f45d1cf-5cedea84d77so4139344a12.1
        for <linux-arm-kernel@lists.infradead.org>; Sat, 09 Nov 2024 04:44:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1731156292; x=1731761092; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=59tEYZAbxZv4QLtXinFrkb5WBvn6BEbQem6S6TXlOJw=;
        b=CwmgLbf0GjwUCT9k6G7lg7Eg7w0UkjoAN63DGXE5KQWgbscEVqstvJcW6dGeE7pVaJ
         B1oO6A5anRgWHiI80C90xh/POV7GqkiUKaJQDrjQTeMqzcvPQEIbdoydxpH/s0VECNjO
         YYM6iwTy0MCKRNFNm59ITiEu848M9mTq1jwucQKFVzkB1Ir7KPqwA1nojMEjANqRJ6/L
         uEe3M99hzj39uC6EZHoDV1bK1Lp5XPkjWMe4wRSoE9ugOZ3S1vjutULMGJtPjMktgPgJ
         7R/y/Q0i+hOIsgL0Er2f3axAywgOjW0doBHgZTM3oAipuPDxXFF47NIG9UAiAmOAX0Rj
         LGKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731156292; x=1731761092;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=59tEYZAbxZv4QLtXinFrkb5WBvn6BEbQem6S6TXlOJw=;
        b=IiXdTxftkskYnG/XRSLc8t4pMLYE9gUjr3uFCxAUMChM4TyGHmt/+YdK+1d1jB8P+g
         E0Lhrqw0WF0kOFJthX/oJRgy9UVBFluSnsYPHJeM0TwtRhN1G7ItuDRNP0fFHd5GZPVx
         cH/g3sd2yuDs32eWJLQLI4X32Gq73T1qLS6JYMGuayTstIIip5iYBKgxG4uQtxwRN9OX
         aXnMjcalZflEShkqa15ANaGmjonVmVBSttuFD1I27W3crsLT5CdqABu30QzpKie+1p7C
         Nbmh8R13s6Zl55D66XSnkaxtCTA4zPbg7lk3dELWZ3Y06BL+b0mn96COL5uBqPQZn2Q0
         HSuw==
X-Forwarded-Encrypted: i=1; AJvYcCXXcVrD7Y+LFJiNx25oQJJJsL3hDIFzyt5bOuDIFItA/D7ZibdR340TgMPve7JPBDUXLkZsnAqShwObpxFT61uf@lists.infradead.org
X-Gm-Message-State: AOJu0YwdNB91jk+5WMnyaNv3f8OcQfp6Vg2JrA0TJwMekciG8SMHK4YQ
	4U733deWBmbeLFtLzLsRI50zkW5PNAghXleK+FXLUGJ1dXkHJ5Ar
X-Google-Smtp-Source: AGHT+IHsmH3XqpW0E30HnDtDXqrPkaKiznFfyNU3gMMTiByURLm3AmURnfa20tdQ+1DxMfZF6+oL9w==
X-Received: by 2002:a05:6402:3507:b0:5ce:d6b0:85c0 with SMTP id 4fb4d7f45d1cf-5cf0a444283mr4838208a12.22.1731156291637;
        Sat, 09 Nov 2024 04:44:51 -0800 (PST)
Received: from [127.0.1.1] (leased-line-46-53-189-50.telecom.by. [46.53.189.50])
        by smtp.googlemail.com with ESMTPSA id 4fb4d7f45d1cf-5cf03b5d793sm2940166a12.17.2024.11.09.04.44.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 09 Nov 2024 04:44:50 -0800 (PST)
From: Dzmitry Sankouski <dsankouski@gmail.com>
Date: Sat, 09 Nov 2024 15:44:36 +0300
Subject: [PATCH 4/4] power: supply: max17042: rename maxim,rsns-microohm
 property
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241109-b4-max17042-v1-4-9e2b07e54e76@gmail.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1731156277; l=6311;
 i=dsankouski@gmail.com; s=20240619; h=from:subject:message-id;
 bh=Ll3+VdQ0C3YJ+cNuw/9xWFDuApiijksTxgD0D7LqbW4=;
 b=CgxjsX+bAIDHBkOI0SqP8ZHxW2061yieieg6R6BPSGwA0wkM6muqq3JM+UwOpuN8nMBZE8qH+
 JYXQoELs5oIAJUPqdLaPEzqqmnhBaJeJjCaLjK07S7pPTZRU6D1PucY
X-Developer-Key: i=dsankouski@gmail.com; a=ed25519;
 pk=YJcXFcN1EWrzBYuiE2yi5Mn6WLn6L1H71J+f7X8fMag=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241109_044453_839154_4E90F58A 
X-CRM114-Status: GOOD (  12.99  )
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

Rename maxim,rsns-microohm to common shunt-resistor-micro-ohms.

Signed-off-by: Dzmitry Sankouski <dsankouski@gmail.com>
---
 Documentation/devicetree/bindings/power/supply/maxim,max17042.yaml | 5 ++---
 arch/arm/boot/dts/samsung/exynos4412-p4note.dtsi                   | 2 +-
 arch/arm64/boot/dts/freescale/imx8mq-librem5-r4.dts                | 2 +-
 arch/arm64/boot/dts/freescale/imx8mq-librem5.dtsi                  | 2 +-
 arch/arm64/boot/dts/qcom/msm8916-motorola-harpia.dts               | 2 +-
 arch/arm64/boot/dts/qcom/msm8916-motorola-osprey.dts               | 2 +-
 arch/arm64/boot/dts/qcom/msm8916-motorola-surnia.dts               | 2 +-
 arch/arm64/boot/dts/qcom/msm8916-samsung-gt5-common.dtsi           | 2 +-
 drivers/power/supply/max17042_battery.c                            | 2 +-
 9 files changed, 10 insertions(+), 11 deletions(-)

diff --git a/Documentation/devicetree/bindings/power/supply/maxim,max17042.yaml b/Documentation/devicetree/bindings/power/supply/maxim,max17042.yaml
index d1ad597e0837..754d9ad3d94b 100644
--- a/Documentation/devicetree/bindings/power/supply/maxim,max17042.yaml
+++ b/Documentation/devicetree/bindings/power/supply/maxim,max17042.yaml
@@ -29,8 +29,7 @@ properties:
     description: |
       The ALRT pin, an open-drain interrupt.
 
-  maxim,rsns-microohm:
-    $ref: /schemas/types.yaml#/definitions/uint32
+  shunt-resistor-micro-ohms:
     description: |
       Resistance of rsns resistor in micro Ohms (datasheet-recommended value is 10000).
       Defining this property enables current-sense functionality.
@@ -81,7 +80,7 @@ examples:
       battery@36 {
         compatible = "maxim,max17042";
         reg = <0x36>;
-        maxim,rsns-microohm = <10000>;
+        shunt-resistor-micro-ohms = <10000>;
         maxim,over-heat-temp = <600>;
         maxim,over-volt = <4300000>;
         shared-irq;
diff --git a/arch/arm/boot/dts/samsung/exynos4412-p4note.dtsi b/arch/arm/boot/dts/samsung/exynos4412-p4note.dtsi
index 3d52aa25c83c..0b08d23366d6 100644
--- a/arch/arm/boot/dts/samsung/exynos4412-p4note.dtsi
+++ b/arch/arm/boot/dts/samsung/exynos4412-p4note.dtsi
@@ -173,7 +173,7 @@ fuel-gauge@36 {
 			pinctrl-names = "default";
 			interrupt-parent = <&gpx2>;
 			interrupts = <3 IRQ_TYPE_LEVEL_LOW>;
-			maxim,rsns-microohm = <10000>;
+			shunt-resistor-micro-ohms = <10000>;
 			maxim,over-heat-temp = <600>;
 			maxim,over-volt = <4300000>;
 		};
diff --git a/arch/arm64/boot/dts/freescale/imx8mq-librem5-r4.dts b/arch/arm64/boot/dts/freescale/imx8mq-librem5-r4.dts
index 33f398b48119..99023f302a05 100644
--- a/arch/arm64/boot/dts/freescale/imx8mq-librem5-r4.dts
+++ b/arch/arm64/boot/dts/freescale/imx8mq-librem5-r4.dts
@@ -11,7 +11,7 @@ / {
 };
 
 &bat {
-	maxim,rsns-microohm = <1667>;
+	shunt-resistor-micro-ohms = <1667>;
 };
 
 &led_backlight {
diff --git a/arch/arm64/boot/dts/freescale/imx8mq-librem5.dtsi b/arch/arm64/boot/dts/freescale/imx8mq-librem5.dtsi
index 90beefaa644f..6f6ce14afbdc 100644
--- a/arch/arm64/boot/dts/freescale/imx8mq-librem5.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx8mq-librem5.dtsi
@@ -1142,7 +1142,7 @@ bat: fuel-gauge@36 {
 		power-supplies = <&bq25895>;
 		maxim,over-heat-temp = <700>;
 		maxim,over-volt = <4500000>;
-		maxim,rsns-microohm = <5000>;
+		shunt-resistor-micro-ohms = <5000>;
 	};
 
 	bq25895: charger@6a {
diff --git a/arch/arm64/boot/dts/qcom/msm8916-motorola-harpia.dts b/arch/arm64/boot/dts/qcom/msm8916-motorola-harpia.dts
index a02ece82ff5b..f5d636db33c8 100644
--- a/arch/arm64/boot/dts/qcom/msm8916-motorola-harpia.dts
+++ b/arch/arm64/boot/dts/qcom/msm8916-motorola-harpia.dts
@@ -22,7 +22,7 @@ battery@36 {
 		pinctrl-0 = <&battery_alert_default>;
 		pinctrl-names = "default";
 
-		maxim,rsns-microohm = <10000>;
+		shunt-resistor-micro-ohms = <10000>;
 		maxim,over-heat-temp = <600>;
 		maxim,cold-temp = <(-200)>;
 		maxim,dead-volt = <3200000>;
diff --git a/arch/arm64/boot/dts/qcom/msm8916-motorola-osprey.dts b/arch/arm64/boot/dts/qcom/msm8916-motorola-osprey.dts
index f567b7ffb613..35343b1fd737 100644
--- a/arch/arm64/boot/dts/qcom/msm8916-motorola-osprey.dts
+++ b/arch/arm64/boot/dts/qcom/msm8916-motorola-osprey.dts
@@ -33,7 +33,7 @@ battery@36 {
 		pinctrl-0 = <&battery_alert_default>;
 		pinctrl-names = "default";
 
-		maxim,rsns-microohm = <10000>;
+		shunt-resistor-micro-ohms = <10000>;
 		maxim,over-heat-temp = <600>;
 		maxim,cold-temp = <(-200)>;
 		maxim,dead-volt = <3200000>;
diff --git a/arch/arm64/boot/dts/qcom/msm8916-motorola-surnia.dts b/arch/arm64/boot/dts/qcom/msm8916-motorola-surnia.dts
index 45ddd17243e7..855f8a554a9b 100644
--- a/arch/arm64/boot/dts/qcom/msm8916-motorola-surnia.dts
+++ b/arch/arm64/boot/dts/qcom/msm8916-motorola-surnia.dts
@@ -22,7 +22,7 @@ battery@36 {
 		pinctrl-0 = <&battery_alert_default>;
 		pinctrl-names = "default";
 
-		maxim,rsns-microohm = <10000>;
+		shunt-resistor-micro-ohms = <10000>;
 		maxim,over-heat-temp = <600>;
 		maxim,cold-temp = <(-200)>;
 		maxim,dead-volt = <3200000>;
diff --git a/arch/arm64/boot/dts/qcom/msm8916-samsung-gt5-common.dtsi b/arch/arm64/boot/dts/qcom/msm8916-samsung-gt5-common.dtsi
index 2c387c8b6344..0ab64154dc77 100644
--- a/arch/arm64/boot/dts/qcom/msm8916-samsung-gt5-common.dtsi
+++ b/arch/arm64/boot/dts/qcom/msm8916-samsung-gt5-common.dtsi
@@ -103,7 +103,7 @@ fuelgauge@36 {
 		compatible = "maxim,max77849-battery";
 		reg = <0x36>;
 
-		maxim,rsns-microohm = <10000>;
+		shunt-resistor-micro-ohms = <10000>;
 		maxim,over-heat-temp = <600>;
 		maxim,over-volt = <4400000>;
 
diff --git a/drivers/power/supply/max17042_battery.c b/drivers/power/supply/max17042_battery.c
index ea212cb10360..497cb6f14bd9 100644
--- a/drivers/power/supply/max17042_battery.c
+++ b/drivers/power/supply/max17042_battery.c
@@ -916,7 +916,7 @@ max17042_get_of_pdata(struct max17042_chip *chip)
 	 * Require current sense resistor value to be specified for
 	 * current-sense functionality to be enabled at all.
 	 */
-	if (of_property_read_u32(np, "maxim,rsns-microohm", &prop) == 0) {
+	if (of_property_read_u32(np, "shunt-resistor-micro-ohms", &prop) == 0) {
 		pdata->r_sns = prop;
 		pdata->enable_current_sense = true;
 	}

-- 
2.39.2


