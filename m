Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 78ADBC369D1
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 24 Apr 2025 09:30:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=I07L8B3Ds4E7gZ4sAboS30rVJP9KR1SNOC0M0BEiQyU=; b=u/9FjgQ2HhnIoeK6VPbvQOL/bC
	EDHWICFGzhyTYDwM49dJuHfv9HqmtnCsSkzH2bABbebgCGVx8Sy3yercyqcV7MEQuOca/r3TknQmu
	XG9RguyBq0MjW0vtrbrNC+PYNz373Poidy0KzNvJRB5BhW/HuLEFn9IZsmHmgcKfgJfGGjX2cdaM+
	vFJHTw5qtHzRl/WoJbHZSNBIdk/R9eIUA5AT2bgFdlEd8ltkAnjUCZkdLh3qGuqrBa4K5ud+S32i1
	9YB7fb3RlqBm4U+NVrlnlBX8nA2FS3URbG/Sd2Nefoal+Y+QQywI1ptEIv3y5c3lIv+Br02EWBsB3
	MM4Y+4qg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u7suR-0000000DVRI-3GBr;
	Thu, 24 Apr 2025 09:30:19 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u7sEl-0000000DOhg-0jur
	for linux-arm-kernel@bombadil.infradead.org;
	Thu, 24 Apr 2025 08:47:15 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
	Content-Description:In-Reply-To:References;
	bh=I07L8B3Ds4E7gZ4sAboS30rVJP9KR1SNOC0M0BEiQyU=; b=CQYqIzLRUsU8GS35iCRDvaukkY
	giNZ7Sq2xgU785gX6iT7m0wwRISsZBLvBBjUkPb7tpiY9ai0SN2lVnuyaSi+nbZWc1W7EYm3C0iNx
	VB74PgJOKElSg7dngF8lcUGwK6zlWf3DefHaR4FWiq3eIFrlYIzxgmczjHdvuhxat2JIsG5zf6/5a
	EzCJGtcvbmziFxXkSbVveUwnYcCDq0YqmzY9dbUT8dyWvXZ8Kmh0vYEFvAE/3Y5y4icxl2486xs/z
	G6RbF2gBjh6+jZco0tqAgyJM2iP8oGBcHHausYPa5NwEiWapCqSmrMZidm0lYgoCLfbguJ5Moyk94
	a3Jd4VnQ==;
Received: from mail-ej1-x62c.google.com ([2a00:1450:4864:20::62c])
	by desiato.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u7sEi-0000000Bdoi-2EHv
	for linux-arm-kernel@lists.infradead.org;
	Thu, 24 Apr 2025 08:47:14 +0000
Received: by mail-ej1-x62c.google.com with SMTP id a640c23a62f3a-acb94bf7897so7812266b.3
        for <linux-arm-kernel@lists.infradead.org>; Thu, 24 Apr 2025 01:47:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1745484430; x=1746089230; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=I07L8B3Ds4E7gZ4sAboS30rVJP9KR1SNOC0M0BEiQyU=;
        b=pGo7NQIEBa971vfiy57l+brIXd5I6FN5wJ0VHWDS0DjGaKHeU14oSUvgTkB1dZ+Usz
         GenCnEtgGm29WU1gPp0gFUOVG56erwEqqu+WjWFH3zYxJGanPSmipDZAMPX2wtmKwkqk
         BDIEkIBay+E6wJvszgOKELziehvBq1tZxN5bM4FgD4+XedfatIXR41CDaIp5rA1GfMQB
         s0bVavwWrWvv7J5R84rBBg9E9NkJ8ja2vg/JzKfImboWcEBTWkz9cQRt2eYySC6QDcHg
         l4rJjCUTiVvKYrgqoNfVC/p9opQfQRB1X1xNq9XmuaLZCputhIeLsMC39tlBIC21c3Ld
         7OmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745484430; x=1746089230;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=I07L8B3Ds4E7gZ4sAboS30rVJP9KR1SNOC0M0BEiQyU=;
        b=UyaKnM9+s2W42siBLpZ381oGyf5vQfGHXIBgpQdoreZL6biZbCQVye/iXmnvTN6jsR
         qUvOK6m57/tnHEMRqU9DsCpmwDllAWgEt+Vg9DeRj1Ks3Bya0zXBal3y1MM25UGH8e1C
         sZk056/B353Z7f6zNaCElb7kS6iCMH1lHAsmy8ntCmk1Vkz5BkDNYr5RLN8O1FKhcuBm
         2LD7HCEhhcn1dPl9jwJaBuoVgB6yVk0HasG6C5lUtrV/TOo+NW5QxxDxCzx9MZVPTgoN
         ZOodwJsKTK6f8oTaalqtytQkk2ejkcEKdfdjmhepRQUQiIm7qpQNmNtQryDn+LjePxlL
         1pNg==
X-Forwarded-Encrypted: i=1; AJvYcCXItsPMTZsMQ+GHXP5vKyrZVEbP0lELEORQ0pCAOECAw1TOwCWFKjQpzi5iPM0gRKjB6cQ3uB2sAzRxnayIzBE/@lists.infradead.org
X-Gm-Message-State: AOJu0YyGmChMWsjdWisrZwhv6n7uV+ILEsSo0IWltF0AUFEClT6dlaje
	6KtzNJgj5WNmTa3BIFBqRVEBdYIO3KR2d8NiZlCerNhBAEbC/pQIXXE3TaE7r/g=
X-Gm-Gg: ASbGnctWFYDC6fpSNcVYy96TgycLIg1haoGPTHJCyugZ0NlBFHSkv3v1TFh6Vk9BrP4
	tRhYoxQsvVo5pwusYcHvZI0y4aS+yYtnmHeNJa7KiMZF6Hw5lGL84BMbWY5+zV3H3XMC43bp2qY
	XZXpDFrV94V0WSkkU1eKDh5cfRUVeVqM6McWqzz5qO69UZpvJQsgokeoNe4Xl+Tq/SfmYCmd5J1
	9BS6Y40m1odyGw8ODi6BVn0pySlfHfHcsUEjVZPDZHCqNHzzao9O2zDIU2SSXmV+OVU5VJSB0IN
	nDlrmvSC1VSVGwT5TKUUEtgRdEwIjjw9oVcPBBN8v3eRNaSsow==
X-Google-Smtp-Source: AGHT+IG690V/118jVCZXhJGEzeHLok6tjdjixbJjju8hozYkNfl4sz7fKA7GyqSoTyecOpVPS8y/SA==
X-Received: by 2002:a17:907:2d0f:b0:acb:6081:1507 with SMTP id a640c23a62f3a-ace573af8d3mr64249266b.10.1745484430243;
        Thu, 24 Apr 2025 01:47:10 -0700 (PDT)
Received: from kuoka.. ([178.197.207.88])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ace59c22d9asm69948066b.124.2025.04.24.01.47.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Apr 2025 01:47:09 -0700 (PDT)
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
Subject: [PATCH] ARM: dts: st: stm32: Align wifi node name with bindings
Date: Thu, 24 Apr 2025 10:47:06 +0200
Message-ID: <20250424084706.105049-1-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.45.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250424_094712_649790_30618CA5 
X-CRM114-Status: GOOD (  10.87  )
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

Since commit 3c3606793f7e ("dt-bindings: wireless: bcm4329-fmac: Use
wireless-controller.yaml schema"), bindings expect 'wifi' as node name:

  stm32h750i-art-pi.dtb: bcrmf@1: $nodename:0: 'bcrmf@1' does not match '^wifi(@.*)?$'

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 arch/arm/boot/dts/st/stm32h750i-art-pi.dts            | 2 +-
 arch/arm/boot/dts/st/stm32mp135f-dk.dts               | 2 +-
 arch/arm/boot/dts/st/stm32mp13xx-dhcor-som.dtsi       | 2 +-
 arch/arm/boot/dts/st/stm32mp157a-iot-box.dts          | 2 +-
 arch/arm/boot/dts/st/stm32mp157c-dk2.dts              | 2 +-
 arch/arm/boot/dts/st/stm32mp15xx-dhcor-avenger96.dtsi | 2 +-
 6 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/arch/arm/boot/dts/st/stm32h750i-art-pi.dts b/arch/arm/boot/dts/st/stm32h750i-art-pi.dts
index 44c307f8b09c..65975ca10695 100644
--- a/arch/arm/boot/dts/st/stm32h750i-art-pi.dts
+++ b/arch/arm/boot/dts/st/stm32h750i-art-pi.dts
@@ -167,7 +167,7 @@ &sdmmc2 {
 
 	#address-cells = <1>;
 	#size-cells = <0>;
-	brcmf: bcrmf@1 {
+	brcmf: wifi@1 {
 		reg = <1>;
 		compatible = "brcm,bcm4329-fmac";
 	};
diff --git a/arch/arm/boot/dts/st/stm32mp135f-dk.dts b/arch/arm/boot/dts/st/stm32mp135f-dk.dts
index 19a32f7d4d7d..9764a6bfa5b4 100644
--- a/arch/arm/boot/dts/st/stm32mp135f-dk.dts
+++ b/arch/arm/boot/dts/st/stm32mp135f-dk.dts
@@ -421,7 +421,7 @@ &sdmmc2 {
 	#size-cells = <0>;
 	status = "okay";
 
-	brcmf: bcrmf@1 {
+	brcmf: wifi@1 {
 		reg = <1>;
 		compatible = "brcm,bcm4329-fmac";
 		pinctrl-names = "default";
diff --git a/arch/arm/boot/dts/st/stm32mp13xx-dhcor-som.dtsi b/arch/arm/boot/dts/st/stm32mp13xx-dhcor-som.dtsi
index 6236ce2a6968..c18156807027 100644
--- a/arch/arm/boot/dts/st/stm32mp13xx-dhcor-som.dtsi
+++ b/arch/arm/boot/dts/st/stm32mp13xx-dhcor-som.dtsi
@@ -287,7 +287,7 @@ &sdmmc1 {
 	#address-cells = <1>;
 	#size-cells = <0>;
 
-	brcmf: bcrmf@1 {	/* muRata 1YN */
+	brcmf: wifi@1 {	/* muRata 1YN */
 		reg = <1>;
 		compatible = "infineon,cyw43439-fmac", "brcm,bcm4329-fmac";
 		interrupt-parent = <&gpioe>;
diff --git a/arch/arm/boot/dts/st/stm32mp157a-iot-box.dts b/arch/arm/boot/dts/st/stm32mp157a-iot-box.dts
index 6a5a4af25bd9..84497026a106 100644
--- a/arch/arm/boot/dts/st/stm32mp157a-iot-box.dts
+++ b/arch/arm/boot/dts/st/stm32mp157a-iot-box.dts
@@ -46,7 +46,7 @@ &sdmmc2 {
 
 	#address-cells = <1>;
 	#size-cells = <0>;
-	brcmf: bcrmf@1 {
+	brcmf: wifi@1 {
 		reg = <1>;
 		compatible = "brcm,bcm4329-fmac";
 	};
diff --git a/arch/arm/boot/dts/st/stm32mp157c-dk2.dts b/arch/arm/boot/dts/st/stm32mp157c-dk2.dts
index 324f7bb988d1..1b34fbe10b4f 100644
--- a/arch/arm/boot/dts/st/stm32mp157c-dk2.dts
+++ b/arch/arm/boot/dts/st/stm32mp157c-dk2.dts
@@ -115,7 +115,7 @@ &sdmmc2 {
 	#size-cells = <0>;
 	status = "okay";
 
-	brcmf: bcrmf@1 {
+	brcmf: wifi@1 {
 		reg = <1>;
 		compatible = "brcm,bcm4329-fmac";
 		pinctrl-names = "default";
diff --git a/arch/arm/boot/dts/st/stm32mp15xx-dhcor-avenger96.dtsi b/arch/arm/boot/dts/st/stm32mp15xx-dhcor-avenger96.dtsi
index 343a4613dfca..aceeff6c38ba 100644
--- a/arch/arm/boot/dts/st/stm32mp15xx-dhcor-avenger96.dtsi
+++ b/arch/arm/boot/dts/st/stm32mp15xx-dhcor-avenger96.dtsi
@@ -435,7 +435,7 @@ &sdmmc3 {
 
 	#address-cells = <1>;
 	#size-cells = <0>;
-	brcmf: bcrmf@1 {
+	brcmf: wifi@1 {
 		reg = <1>;
 		compatible = "brcm,bcm4329-fmac";
 	};
-- 
2.45.2


