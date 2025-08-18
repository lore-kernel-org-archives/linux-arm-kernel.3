Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9EF8DCA0EE4
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 18 Aug 2025 17:31:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=YMsmT8h0+DT9fjYWadJv14KoJwGukly6TmVYhBOPfZo=; b=BofMvFLtY8TwWoIFXLfYZSyPO7
	MoXTfTA2c+u2OJ7ic+dnCacvVvUg0/XaueLKwVz69siX94gcO1CZ76J+OhIQJKGN26u/ixtrAW4rv
	oQNwVHZMXjUOmasiXxlditBrFNbGGlJjuSDopK34dV+RYja90LY/f+SNdlNr368PvU+PprxLCtSKo
	AtSIt0L/LaCOHLG6hxAEpggnz7kEORz39wlXvOhg6fJympso8tWh9QwIA3NeEyzJsYpI390UY9dP7
	QmQIWECbtVoE9+RvEfJSbJEAw4VFIxIh1pafEYMsRKWtgFv0eIt7m45irqavGq+77xWx7ec91lygw
	VElqH+VA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uo3hG-000000088a1-1Nhu;
	Mon, 18 Aug 2025 17:31:02 +0000
Received: from mail-ej1-x62e.google.com ([2a00:1450:4864:20::62e])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uo0zP-00000007m9g-2iFb
	for linux-arm-kernel@lists.infradead.org;
	Mon, 18 Aug 2025 14:37:36 +0000
Received: by mail-ej1-x62e.google.com with SMTP id a640c23a62f3a-afcb7a41b78so55507566b.2
        for <linux-arm-kernel@lists.infradead.org>; Mon, 18 Aug 2025 07:37:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1755527854; x=1756132654; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=YMsmT8h0+DT9fjYWadJv14KoJwGukly6TmVYhBOPfZo=;
        b=lpvDo3oVxuIjqA93uvXISrf10QqOVFMluuMKYEwG9OuD+xfry1wPXaNw96SLk7xrGf
         EXQHGop7lgSQxbReshbxqXo13qSIaVckdlrU9Ka2XDP01pfn9g1N0V00XzgXfHhBFgnu
         a+WMjjnAD9BXFuE+nZIHet52wnkJCKEtB/LzHDMeksiBcPu/H48UNISbbuzt4Aex/8tb
         nUUwh4PqT5vbxGmkA1Pd9TpA2AijvXZEPT7odovZNSp+woYNfjHJ5pTzV8Fnfrrb60+C
         BJnAotibVKnRDizlVJl9cSWBPqhHdaE/5Tdg/PRUl40EIcod9S10KOiUTLttmzXFnVc0
         +Exw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755527854; x=1756132654;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=YMsmT8h0+DT9fjYWadJv14KoJwGukly6TmVYhBOPfZo=;
        b=Jj53SnjcDoJFQdQBN38XadI13LNPwBsHhNkOQRCqefEBWmNmCwfT25rvpNGm461Q1Y
         +77kL+IFfDGh8pPFaIFbBodWcYtcNZTDAmJ7CYUhwWlNdE87UyltgNbob6rGUtQlQsg5
         nt/rdurqdqj9viauWQKXM6Ze9lodD0yApJnflc+XLMbMZWTfFtf27FtzGlm6+bycfwhN
         dLDE+ur9+eru4cIRfF/bBxaIO14Gri6vayh6wk/Gs/SGcQc84IsuLxMDHAGsRAVNkwDS
         MwUkarlBEOcVbYDWzxb1R9ihCKBWS6d+PLPYfY4myR9tE+AoH2fVayN0PPKGTYrSVZ10
         eXWg==
X-Forwarded-Encrypted: i=1; AJvYcCWmRlkG/DOVw/X9zp/UL2H5bYFyNCox1v1HTbPCm74Hk0Gl1WT4T8f5swre0lwJ2UjvGESGA+9EYaJ+N8Tj8tzj@lists.infradead.org
X-Gm-Message-State: AOJu0Yx8WCtzZjwhY/GCw9xqSGlIzyVijjuIfBkY8GQXT4C+rl5LkJ1l
	M3vJaOIo/AALHASP9TRVPXPdSVJHf1qzkxMeidyO+I4KsPmfWT1IvdaM3LtAYQN/whI=
X-Gm-Gg: ASbGnctmBpywC3TAvb6DAnZuPw+mpNJ9IhqQcKXZ0swFxsfnq3BHVlZddfvQlzSfJx/
	yQ0tIMrR5O22KMpA8P+9+zeM+FhRqhdy8e08fkuA5UrL4v3grAxihPfD+iCyASmF9FTQ53Xw+NW
	NDLRK1tuGVZIFY3GG4tn8dSjTt6/Bdhxg0dDn2nsdVKedMjTLt4DMimiFg8HMfz7somh83WRZZb
	Yi6Af+uz1xLlFz3vsU4sCC2rbXlV5J2GGe0ZLKEPtLdqn4Znr8NFeeBmEhBM2ctiUfupH9OTOrm
	Nbl0GMYzmoAGwPvnI5kkQfc1JqJuO9Ggg3vqS79IavTZqOYg6T/ncVfptfxpfV2jeFiV1HEQioQ
	Si+erJ+T6Qle4c+Qa3MGfYJMJvwD23wLtKA==
X-Google-Smtp-Source: AGHT+IGEt3nsu4aHRovyycnvzxGKQTMOhKdYlCUCXv7/JvtZLGn3dwu1jc2cK5FnprCTehHbYLnZyQ==
X-Received: by 2002:a17:906:40cc:b0:afc:ebfd:c285 with SMTP id a640c23a62f3a-afcebfdc45cmr327163366b.1.1755527853856;
        Mon, 18 Aug 2025 07:37:33 -0700 (PDT)
Received: from kuoka.. ([178.197.219.123])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-afcdce53f37sm816752166b.21.2025.08.18.07.37.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 18 Aug 2025 07:37:33 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Christoph Niedermaier <cniedermaier@dh-electronics.com>,
	Marek Vasut <marex@denx.de>,
	devicetree@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	kernel@dh-electronics.com
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH] arm: dts: stm32: Drop redundant status=okay
Date: Mon, 18 Aug 2025 16:37:31 +0200
Message-ID: <20250818143730.244379-2-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.48.1
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=3879; i=krzysztof.kozlowski@linaro.org;
 h=from:subject; bh=yyS1Kqa6YjNQyzYaGdt68e52WccpJuLwtYCRzw/J6gI=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBoozqqlSZHPCX1JVOLnWGeDyGAz2oBjWeBgmsSm
 mPxRUw6D7+JAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCaKM6qgAKCRDBN2bmhouD
 15tTD/4mYTyNavHV0cMsp4HUZQUgzwJDBkUxjibEQCPqdYAlZ3NfPN78IOtHpB+1ICSA7AiHwEH
 XvD146rmBVwaVVI5I6RXrgFaAkImu6dSgjJJWxV/BZThEmkTRymxGhKHyIV2HFnfIV41pFnoh+s
 PA8Upx+IRiWcVcu+qS+sM8S7wrIUCsqNUCvPkkeDottSR2MHnF+ZbvjVFJ3H2NJ0MbDPrHtyZph
 Xc3+G3uZ/SZy5jAcHnsv4K7yenlUZdmNZbgFoyMcMttEnl9X743L7lgSNRe0x2Pj1KhzAaL/0vG
 iLLK2TjN7HUP6sw5ZmGkaM+05WXJuIGilYbNgt893aVnr1/4He9FZbch1b4IRFdeUI9ypSKMl+V
 zfDNDUXI+0OQ5CPRVxTP0g8Ny7YGIWPd3nNN9Ocu8Gr/dprYPv8xUj4kDTb4JZcttvFq/O41ZB7
 ffc/qQ33grySJOHKqJ+nez6upL5iPbi6VnELUc3Std1p/a2IkiEyDQpd4MQ+VNnY9Hz4kHyTz8V
 obVltkt0ZtSDFhwfL+/DIIcF5fJVptbNeOrNqFneWzSXSAlHw00SHLa8mKwXTcvNzHU7Ml18qEb
 +/U7ijgJ90xxbKJD+UJnnXqqr284UWIaqf5j3gBpqLXLyqcEUqrMkh1D7E0nAaoIrFxZ9VSKCPv zKQDgBrudjsJvCw==
X-Developer-Key: i=krzysztof.kozlowski@linaro.org; a=openpgp; fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250818_073735_693841_0AEB6997 
X-CRM114-Status: GOOD (  11.39  )
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

Device nodes are enabled by default, so remove confusing or duplicated
enabling of few nodes.  No practical impact, verified with dtx_diff.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 arch/arm/boot/dts/st/stm32mp157c-dk2.dts          | 2 --
 arch/arm/boot/dts/st/stm32mp157f-dk2.dts          | 2 --
 arch/arm/boot/dts/st/stm32mp15xx-dhcom-drc02.dtsi | 1 -
 arch/arm/boot/dts/st/stm32mp15xx-dhcom-pdk2.dtsi  | 3 ---
 arch/arm/boot/dts/st/stm32mp15xx-dhcom-som.dtsi   | 2 --
 5 files changed, 10 deletions(-)

diff --git a/arch/arm/boot/dts/st/stm32mp157c-dk2.dts b/arch/arm/boot/dts/st/stm32mp157c-dk2.dts
index 1b34fbe10b4f..78165c7865e1 100644
--- a/arch/arm/boot/dts/st/stm32mp157c-dk2.dts
+++ b/arch/arm/boot/dts/st/stm32mp157c-dk2.dts
@@ -45,7 +45,6 @@ panel@0 {
 		reg = <0>;
 		reset-gpios = <&gpioe 4 GPIO_ACTIVE_LOW>;
 		power-supply = <&v3v3>;
-		status = "okay";
 
 		port {
 			panel_in: endpoint {
@@ -71,7 +70,6 @@ touchscreen@38 {
 		interrupt-parent = <&gpiof>;
 		touchscreen-size-x = <480>;
 		touchscreen-size-y = <800>;
-		status = "okay";
 	};
 };
 
diff --git a/arch/arm/boot/dts/st/stm32mp157f-dk2.dts b/arch/arm/boot/dts/st/stm32mp157f-dk2.dts
index 43375c4d62a3..8fa61e54d026 100644
--- a/arch/arm/boot/dts/st/stm32mp157f-dk2.dts
+++ b/arch/arm/boot/dts/st/stm32mp157f-dk2.dts
@@ -51,7 +51,6 @@ panel@0 {
 		reg = <0>;
 		reset-gpios = <&gpioe 4 GPIO_ACTIVE_LOW>;
 		power-supply = <&scmi_v3v3>;
-		status = "okay";
 
 		port {
 			panel_in: endpoint {
@@ -77,7 +76,6 @@ touchscreen@38 {
 		interrupt-parent = <&gpiof>;
 		touchscreen-size-x = <480>;
 		touchscreen-size-y = <800>;
-		status = "okay";
 	};
 };
 
diff --git a/arch/arm/boot/dts/st/stm32mp15xx-dhcom-drc02.dtsi b/arch/arm/boot/dts/st/stm32mp15xx-dhcom-drc02.dtsi
index abe2dfe70636..52c4e69597a4 100644
--- a/arch/arm/boot/dts/st/stm32mp15xx-dhcom-drc02.dtsi
+++ b/arch/arm/boot/dts/st/stm32mp15xx-dhcom-drc02.dtsi
@@ -62,7 +62,6 @@ &i2c2 {
 	pinctrl-0 = <&i2c2_pins_a>;
 	i2c-scl-rising-time-ns = <185>;
 	i2c-scl-falling-time-ns = <20>;
-	status = "okay";
 	/* spare dmas for other usage */
 	/delete-property/dmas;
 	/delete-property/dma-names;
diff --git a/arch/arm/boot/dts/st/stm32mp15xx-dhcom-pdk2.dtsi b/arch/arm/boot/dts/st/stm32mp15xx-dhcom-pdk2.dtsi
index 0fb4e55843b9..5c77202ee196 100644
--- a/arch/arm/boot/dts/st/stm32mp15xx-dhcom-pdk2.dtsi
+++ b/arch/arm/boot/dts/st/stm32mp15xx-dhcom-pdk2.dtsi
@@ -20,7 +20,6 @@ display_bl: display-bl {
 		default-brightness-level = <8>;
 		enable-gpios = <&gpioi 0 GPIO_ACTIVE_HIGH>;
 		power-supply = <&reg_panel_bl>;
-		status = "okay";
 	};
 
 	gpio-keys-polled {
@@ -135,7 +134,6 @@ sound {
 			  "MIC_IN", "Microphone Jack",
 			  "Microphone Jack", "Mic Bias";
 		dais = <&sai2a_port &sai2b_port>;
-		status = "okay";
 	};
 };
 
@@ -150,7 +148,6 @@ &i2c2 {	/* Header X22 */
 	pinctrl-0 = <&i2c2_pins_a>;
 	i2c-scl-rising-time-ns = <185>;
 	i2c-scl-falling-time-ns = <20>;
-	status = "okay";
 	/* spare dmas for other usage */
 	/delete-property/dmas;
 	/delete-property/dma-names;
diff --git a/arch/arm/boot/dts/st/stm32mp15xx-dhcom-som.dtsi b/arch/arm/boot/dts/st/stm32mp15xx-dhcom-som.dtsi
index 142d4a8731f8..4cc633683c6b 100644
--- a/arch/arm/boot/dts/st/stm32mp15xx-dhcom-som.dtsi
+++ b/arch/arm/boot/dts/st/stm32mp15xx-dhcom-som.dtsi
@@ -269,7 +269,6 @@ pmic: stpmic@33 {
 		interrupts-extended = <&gpioa 0 IRQ_TYPE_EDGE_FALLING>;
 		interrupt-controller;
 		#interrupt-cells = <2>;
-		status = "okay";
 
 		regulators {
 			compatible = "st,stpmic1-regulators";
@@ -388,7 +387,6 @@ onkey {
 			interrupts = <IT_PONKEY_F 0>, <IT_PONKEY_R 0>;
 			interrupt-names = "onkey-falling", "onkey-rising";
 			power-off-time-sec = <10>;
-			status = "okay";
 		};
 
 		watchdog {
-- 
2.48.1


