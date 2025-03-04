Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 95659C282D0
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  4 Mar 2025 10:46:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=GDxLGGq40mrprdt8U26xMTW1xjWdDPFqwzgumK7bnvA=; b=p32DQrYO+Byj+Ci+0ti4Zp8Mg8
	Jx5DSygSlC3yk52c6+N0WDg36QdBT512jcDgkhRyuFgtJNWSME+1bGflQkrIn8ySt7fRTczn8Vxv1
	furWxuP3aC1uFh0Qiu9i47raBrej9rkQPKkc3YsZJ573F4CtSISO53BX48P1RP0SbL2KZ2Wsl22Pm
	9oALkxyulty0+QWmTQa7fmsNhto4WEp4DJA/lvq16Ivj3xFOwPia1v3m2QDyGmO2VNPFJaZTjr5Hh
	IOg/C/ZarUxhB7RqZCZfX9f56GNsJD1gYL4TT1vptXWhmeh3x66iEp9hKKw+b6T/leOoL0UMxXHKf
	FTNEB4rA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tpPnP-00000004FhY-24KF;
	Tue, 04 Mar 2025 10:46:43 +0000
Received: from mail-wm1-x329.google.com ([2a00:1450:4864:20::329])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tpPiv-00000004ERi-42Gk
	for linux-arm-kernel@lists.infradead.org;
	Tue, 04 Mar 2025 10:42:07 +0000
Received: by mail-wm1-x329.google.com with SMTP id 5b1f17b1804b1-43ba8bbeae2so4930805e9.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 04 Mar 2025 02:42:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1741084925; x=1741689725; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=GDxLGGq40mrprdt8U26xMTW1xjWdDPFqwzgumK7bnvA=;
        b=wYc/YPrNwm0DuBPSbqCuBy5ctMkdf774WbLWU4ZkmY0g4wdKDfI9nX969WN+UW5TlT
         dQuY6xcn4QUXkzZDXwTaLN8ZQxT8YJa1lb9pDaUldxsu4oHFelTG5TxPRgxJS+4/hF0i
         qwcgkvcIFhK28DR0jvR6a8x7j+PmE9GFDqvL8asG+1TI6kuH1y4poFDh9EOvwvMToR2n
         AbvvroRwp518V93rOMZzmNeY120KT+KPsUAQimKk1CNvTE5GsppaX4NIn1revhOPJ2/d
         8GYOUXN5EL3F1xrb81lWsyBZuR9kaeyOpZeu7VPZyAj5QRGPOxLLMZvFT/ouQPCmM4i8
         RP+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741084925; x=1741689725;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=GDxLGGq40mrprdt8U26xMTW1xjWdDPFqwzgumK7bnvA=;
        b=v6RO0H7KOsSCoQ5tXgnyFkJSIM1x1vRcOdbDWu18/3tjjLRCuarM9KnN836GWznKqk
         HGImJ1/7cTzIppI3O2ZRdOHjOXqmQgyPO9miXDKpw3eaE3i5D+z8jUSO3373i4El+3Ph
         /u1vlwOREecLfdEw11jnQ2MELletMr2kuO0Ep7dmO7bFmT/3xckvJnXkCDO8bcFwJhoN
         YIMWqOms6hgSiquK+HHERwUc+Xx82MehhZLL4S8lWpf8EvNP4Ce0ayEuGpsqBUbuGQE0
         yUEDhlcN7+0/AKJNNxQh8mJp82M2FxRf2n8ouXjQeBJuwximjY3D/WKGGZIY3rUfjFdO
         E//Q==
X-Forwarded-Encrypted: i=1; AJvYcCXtz6Yt80jxTU3z9SHJDzIEDfFwxBiJXdxFVIKbljrl1pKOZQYvmNXHRGAfr02en3yE/NlRumJoPNmR7hnkpdaT@lists.infradead.org
X-Gm-Message-State: AOJu0Yy2DmDJlCOZPk6Vkkmu5C9ZneiszoUg53WLi43J2QuFjTmgEnqI
	p2DCxU81/+lrjsANdWVjS5J2DmJQ+grXzMriGLUNraMOV45W2F10pi9rCms4YYM=
X-Gm-Gg: ASbGnctTRskMDEhO8uEAzC9ImIUXMrvqtsaIzW5Eect0k+SbzawzKfs/XzipJUnCF/3
	JVltQCVB69tmbn1+g9snzCeKzwcURCzQX+kp0YBBb47FJV3DGQ53Z5hrISmBkfaUkYhSxR4960W
	b3w+ghD8SzKiOVgBpAxqgBnq1vs/0bwqaImOnpGeEr88pbRIRS3ZmLGdZ4s92rerZ2UBD/h4vuf
	HFDPNlkMqjPIVDFK4+wRuszrbQ7JeyV+r/hF1zKUx0Mw2G9Iyp+lTgoNi7LqyGTF7TCiaKpvQpi
	x0b0VTA5qbIH2xnB5kWkb8plW7bZN28SrTXyerQfXwrGBvHjTzDPLYG3r20=
X-Google-Smtp-Source: AGHT+IEBaeeS+ss4bvkyeewcMs2ci2tWe2j9anwRxAUmA/kmrMhdWw1KWJLeZhb3ucTu5owhQtYxHA==
X-Received: by 2002:a05:600c:3b8e:b0:43b:c228:1ee0 with SMTP id 5b1f17b1804b1-43bc2282147mr23743515e9.7.1741084924557;
        Tue, 04 Mar 2025 02:42:04 -0800 (PST)
Received: from krzk-bin.. ([178.197.206.225])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-390e47b792asm17202257f8f.53.2025.03.04.02.42.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 04 Mar 2025 02:42:04 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Heiko Stuebner <heiko@sntech.de>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	linux-kernel@vger.kernel.org
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH 2/2] arm64: dts: rockchip: Add ES8388 audio codec fallback on RK3588 boards
Date: Tue,  4 Mar 2025 11:42:00 +0100
Message-ID: <20250304104200.76178-2-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250304104200.76178-1-krzysztof.kozlowski@linaro.org>
References: <20250304104200.76178-1-krzysztof.kozlowski@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250304_024206_012186_921C4792 
X-CRM114-Status: GOOD (  13.88  )
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

Devicetree bindings for ES8388 audio codec expect the device to be
marked as compatible with ES8328.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

---

Changeset depends on bindings patch being accepted to ASoC:
https://lore.kernel.org/all/20250304103808.75236-1-krzysztof.kozlowski@linaro.org/

Please take it to the same or next merge cycle as above ASoC binding.
---
 arch/arm64/boot/dts/rockchip/rk3588-evb1-v10.dts         | 2 +-
 arch/arm64/boot/dts/rockchip/rk3588-orangepi-5.dtsi      | 2 +-
 arch/arm64/boot/dts/rockchip/rk3588-quartzpro64.dts      | 2 +-
 arch/arm64/boot/dts/rockchip/rk3588s-evb1-v10.dts        | 2 +-
 arch/arm64/boot/dts/rockchip/rk3588s-gameforce-ace.dts   | 2 +-
 arch/arm64/boot/dts/rockchip/rk3588s-indiedroid-nova.dts | 2 +-
 arch/arm64/boot/dts/rockchip/rk3588s-orangepi-5.dtsi     | 2 +-
 7 files changed, 7 insertions(+), 7 deletions(-)

diff --git a/arch/arm64/boot/dts/rockchip/rk3588-evb1-v10.dts b/arch/arm64/boot/dts/rockchip/rk3588-evb1-v10.dts
index 27a7895595ee..e77a38d726e0 100644
--- a/arch/arm64/boot/dts/rockchip/rk3588-evb1-v10.dts
+++ b/arch/arm64/boot/dts/rockchip/rk3588-evb1-v10.dts
@@ -472,7 +472,7 @@ &i2c7 {
 	status = "okay";
 
 	es8388: audio-codec@11 {
-		compatible = "everest,es8388";
+		compatible = "everest,es8388", "everest,es8328";
 		reg = <0x11>;
 		clocks = <&cru I2S0_8CH_MCLKOUT>;
 		assigned-clocks = <&cru I2S0_8CH_MCLKOUT>;
diff --git a/arch/arm64/boot/dts/rockchip/rk3588-orangepi-5.dtsi b/arch/arm64/boot/dts/rockchip/rk3588-orangepi-5.dtsi
index a98e804a0949..81031b99c9b9 100644
--- a/arch/arm64/boot/dts/rockchip/rk3588-orangepi-5.dtsi
+++ b/arch/arm64/boot/dts/rockchip/rk3588-orangepi-5.dtsi
@@ -276,7 +276,7 @@ &i2c7 {
 
 	/* PLDO2 vcca 1.8V, BUCK8 gated by PLDO2 being enabled */
 	es8388: audio-codec@11 {
-		compatible = "everest,es8388";
+		compatible = "everest,es8388", "everest,es8328";
 		reg = <0x11>;
 		clocks = <&cru I2S0_8CH_MCLKOUT>;
 		AVDD-supply = <&vcc_3v3_s0>;
diff --git a/arch/arm64/boot/dts/rockchip/rk3588-quartzpro64.dts b/arch/arm64/boot/dts/rockchip/rk3588-quartzpro64.dts
index 088cfade6f6f..e07888c9948f 100644
--- a/arch/arm64/boot/dts/rockchip/rk3588-quartzpro64.dts
+++ b/arch/arm64/boot/dts/rockchip/rk3588-quartzpro64.dts
@@ -311,7 +311,7 @@ &i2c7 {
 	status = "okay";
 
 	es8388: audio-codec@11 {
-		compatible = "everest,es8388";
+		compatible = "everest,es8388", "everest,es8328";
 		reg = <0x11>;
 		assigned-clocks = <&cru I2S0_8CH_MCLKOUT>;
 		assigned-clock-rates = <12288000>;
diff --git a/arch/arm64/boot/dts/rockchip/rk3588s-evb1-v10.dts b/arch/arm64/boot/dts/rockchip/rk3588s-evb1-v10.dts
index bc4077575beb..7c948b2653da 100644
--- a/arch/arm64/boot/dts/rockchip/rk3588s-evb1-v10.dts
+++ b/arch/arm64/boot/dts/rockchip/rk3588s-evb1-v10.dts
@@ -242,7 +242,7 @@ &i2c3 {
 	status = "okay";
 
 	es8388: audio-codec@11 {
-		compatible = "everest,es8388";
+		compatible = "everest,es8388", "everest,es8328";
 		reg = <0x11>;
 		clocks = <&cru I2S0_8CH_MCLKOUT>;
 		assigned-clocks = <&cru I2S0_8CH_MCLKOUT>;
diff --git a/arch/arm64/boot/dts/rockchip/rk3588s-gameforce-ace.dts b/arch/arm64/boot/dts/rockchip/rk3588s-gameforce-ace.dts
index 812bba0aef1a..b79ce3ec1186 100644
--- a/arch/arm64/boot/dts/rockchip/rk3588s-gameforce-ace.dts
+++ b/arch/arm64/boot/dts/rockchip/rk3588s-gameforce-ace.dts
@@ -611,7 +611,7 @@ &i2c7 {
 	status = "okay";
 
 	es8388: audio-codec@11 {
-		compatible = "everest,es8388";
+		compatible = "everest,es8388", "everest,es8328";
 		reg = <0x11>;
 		assigned-clock-rates = <12288000>;
 		assigned-clocks = <&cru I2S0_8CH_MCLKOUT>;
diff --git a/arch/arm64/boot/dts/rockchip/rk3588s-indiedroid-nova.dts b/arch/arm64/boot/dts/rockchip/rk3588s-indiedroid-nova.dts
index 74a4f03e05e3..73042e7416bc 100644
--- a/arch/arm64/boot/dts/rockchip/rk3588s-indiedroid-nova.dts
+++ b/arch/arm64/boot/dts/rockchip/rk3588s-indiedroid-nova.dts
@@ -412,7 +412,7 @@ &i2c7 {
 	status = "okay";
 
 	es8388: audio-codec@11 {
-		compatible = "everest,es8388";
+		compatible = "everest,es8388", "everest,es8328";
 		reg = <0x11>;
 		assigned-clock-rates = <12288000>;
 		assigned-clocks = <&cru I2S0_8CH_MCLKOUT>;
diff --git a/arch/arm64/boot/dts/rockchip/rk3588s-orangepi-5.dtsi b/arch/arm64/boot/dts/rockchip/rk3588s-orangepi-5.dtsi
index 9e16960b8705..a48bcb6b6a91 100644
--- a/arch/arm64/boot/dts/rockchip/rk3588s-orangepi-5.dtsi
+++ b/arch/arm64/boot/dts/rockchip/rk3588s-orangepi-5.dtsi
@@ -268,7 +268,7 @@ &i2c6 {
 	status = "okay";
 
 	es8388: audio-codec@10 {
-		compatible = "everest,es8388";
+		compatible = "everest,es8388", "everest,es8328";
 		reg = <0x10>;
 		clocks = <&cru I2S1_8CH_MCLKOUT>;
 		AVDD-supply = <&vcc_3v3_s0>;
-- 
2.43.0


