Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BF4E8D7497B
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 30 Oct 2024 07:07:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=lF1qEJly3xEvubxa1plhNMCfVxpYmwCDO14UJEUO81M=; b=u6To0AXbE6SwS29lLXv0SJnvw8
	3FE3kuS+1SvnwAQ4rACfB3k0rOilr8nZFJIc4EAOhrU+zpqyoLMopnAaqSdHLL6pGpZdV0QbLk5gU
	Ji3m0PkcHTrdZtUZqMGcXg+71a7VE8IotXLz7MN1J/kqUZM6aIUDQq+708swnFQ/NA20cGhavHpJx
	H4CzXQTn52vamB3yPuPW5MdZavrv6vUvYOmLZg+F2CHNhPrjeAegAYdLScvoWu7xe78A742VKv0ER
	Na95U6DuWSRm+3kxydKDM2zMsqvWuBtmrc3YDQmzlni7msYXqLPEukirV0+7e14j83pfb7XMUiB0r
	12OEHmcQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t62nl-0000000H4s0-0yXa;
	Wed, 30 Oct 2024 07:07:33 +0000
Received: from mail-pf1-x42c.google.com ([2607:f8b0:4864:20::42c])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t62iw-0000000H47y-0Pim
	for linux-arm-kernel@lists.infradead.org;
	Wed, 30 Oct 2024 07:02:35 +0000
Received: by mail-pf1-x42c.google.com with SMTP id d2e1a72fcca58-71ea2643545so5158765b3a.3
        for <linux-arm-kernel@lists.infradead.org>; Wed, 30 Oct 2024 00:02:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1730271753; x=1730876553; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=lF1qEJly3xEvubxa1plhNMCfVxpYmwCDO14UJEUO81M=;
        b=JCF9QTSgE8lZn+Pwa4Z2VpnE6qCxaRIQnL3fLpiIeMrdJ7yuTeG9W6mhVyojIlr9JL
         hjrAtzwvZXeirUyMqkWBJEI1yj3I/wNQGEE6usgOdAcX2K3U4W87B8FrIf+sijEVedqE
         zPswSMvvAa37buvGPIFmB0IbSuuCt/1Gw1M6M=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730271753; x=1730876553;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=lF1qEJly3xEvubxa1plhNMCfVxpYmwCDO14UJEUO81M=;
        b=IlkQnNWHjXkF+xR5RPCbGIsEh5/bUdKa1el0CSZejcynyx4Yt5/AjHAA0SHOw8qhRa
         /hfQGJrKmmSCiPR4uT5DpuyFmh1o4t/wyLh7dOGTYcVUvma6GawaimoEiz3ysnIMH+Vd
         ZZgxftutXEXsppK99w5Mjl3DwDmPSUgWg8jaYU6usqCHXro4uWCsyDEdma9+rsaUu45R
         V7GNta52mCu2ky8TTXaTXQTZKkuZEOk7e73iLXbQPp4DIIhSnvKMe2uBxdIaF97WLO9t
         dD3VxRsVNlzjdnATHYJ9H2Zkj+qzKlSBhH0fZrsklYzu2Y+06wMq14QQHfhm6rWZTqmk
         hV8w==
X-Forwarded-Encrypted: i=1; AJvYcCU0UH2IHyMViH0zJ+e5T5MwdwDZvXIhNKetDNtoLt/QGIKoZJZpTWan21C+NeqD6G5wFG0IydlxxxAH+jgT5PE1@lists.infradead.org
X-Gm-Message-State: AOJu0YwjOBEASJNyph8yMyo6qGCniW/AfhsfZCYyUzXm35F649oqxfJI
	KplmZd+zhabHzRrC/CJHcaX2Miz3lt9R1cpHBKrCET7nD1JafRz17hYUko5kl91KXpFHktQIcZw
	=
X-Google-Smtp-Source: AGHT+IFLPfQ/A5eko0pgXITap2wpEZJrJtsvHymtQmufWyNzTU2B5jU7ujsLfLpOT0HBExHRm0TYeA==
X-Received: by 2002:a05:6a00:8cf:b0:71e:587d:f276 with SMTP id d2e1a72fcca58-72063093364mr18860624b3a.25.1730271752832;
        Wed, 30 Oct 2024 00:02:32 -0700 (PDT)
Received: from wenstp920.tpe.corp.google.com ([2401:fa00:1:10:d1f3:aa64:657f:d8a8])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-72057931a94sm8635848b3a.68.2024.10.30.00.02.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 30 Oct 2024 00:02:32 -0700 (PDT)
From: Chen-Yu Tsai <wenst@chromium.org>
To: Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: Chen-Yu Tsai <wenst@chromium.org>,
	devicetree@vger.kernel.org,
	linux-mediatek@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 2/4] arm64: dts: mediatek: mt8183-kukui-jacuzzi: Fix DP bridge supply names
Date: Wed, 30 Oct 2024 15:02:21 +0800
Message-ID: <20241030070224.1006331-3-wenst@chromium.org>
X-Mailer: git-send-email 2.47.0.163.g1226f6d8fa-goog
In-Reply-To: <20241030070224.1006331-1-wenst@chromium.org>
References: <20241030070224.1006331-1-wenst@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241030_000234_179582_BD860C66 
X-CRM114-Status: GOOD (  11.86  )
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

Some of the regulator supplies for the MIPI-DPI-to-DP bridge and their
associated nodes are incorrectly named. In particular, the 1.0V supply
was modeled as a 1.2V supply.

Fix all the incorrect names, and also fix the voltage of the 1.0V
regulator.

Fixes: cabc71b08eb5 ("arm64: dts: mt8183: Add kukui-jacuzzi-damu board")
Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>
---
 .../dts/mediatek/mt8183-kukui-jacuzzi.dtsi    | 26 ++++++++++---------
 1 file changed, 14 insertions(+), 12 deletions(-)

diff --git a/arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi.dtsi b/arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi.dtsi
index 7bbafe926558..f540dcac74ea 100644
--- a/arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi.dtsi
@@ -8,11 +8,13 @@
 #include <arm/cros-ec-keyboard.dtsi>
 
 / {
-	pp1200_mipibrdg: pp1200-mipibrdg {
+	pp1000_mipibrdg: pp1000-mipibrdg {
 		compatible = "regulator-fixed";
-		regulator-name = "pp1200_mipibrdg";
+		regulator-name = "pp1000_mipibrdg";
+		regulator-min-microvolt = <1000000>;
+		regulator-max-microvolt = <1000000>;
 		pinctrl-names = "default";
-		pinctrl-0 = <&pp1200_mipibrdg_en>;
+		pinctrl-0 = <&pp1000_mipibrdg_en>;
 
 		enable-active-high;
 		regulator-boot-on;
@@ -24,7 +26,7 @@ pp1800_mipibrdg: pp1800-mipibrdg {
 		compatible = "regulator-fixed";
 		regulator-name = "pp1800_mipibrdg";
 		pinctrl-names = "default";
-		pinctrl-0 = <&pp1800_lcd_en>;
+		pinctrl-0 = <&pp1800_mipibrdg_en>;
 
 		enable-active-high;
 		regulator-boot-on;
@@ -44,11 +46,11 @@ pp3300_panel: pp3300-panel {
 		gpio = <&pio 35 GPIO_ACTIVE_HIGH>;
 	};
 
-	vddio_mipibrdg: vddio-mipibrdg {
+	pp3300_mipibrdg: pp3300-mipibrdg {
 		compatible = "regulator-fixed";
-		regulator-name = "vddio_mipibrdg";
+		regulator-name = "pp3300_mipibrdg";
 		pinctrl-names = "default";
-		pinctrl-0 = <&vddio_mipibrdg_en>;
+		pinctrl-0 = <&pp3300_mipibrdg_en>;
 
 		enable-active-high;
 		regulator-boot-on;
@@ -144,9 +146,9 @@ anx_bridge: anx7625@58 {
 		pinctrl-0 = <&anx7625_pins>;
 		enable-gpios = <&pio 45 GPIO_ACTIVE_HIGH>;
 		reset-gpios = <&pio 73 GPIO_ACTIVE_HIGH>;
-		vdd10-supply = <&pp1200_mipibrdg>;
+		vdd10-supply = <&pp1000_mipibrdg>;
 		vdd18-supply = <&pp1800_mipibrdg>;
-		vdd33-supply = <&vddio_mipibrdg>;
+		vdd33-supply = <&pp3300_mipibrdg>;
 
 		ports {
 			#address-cells = <1>;
@@ -389,14 +391,14 @@ &pio {
 		"",
 		"";
 
-	pp1200_mipibrdg_en: pp1200-mipibrdg-en {
+	pp1000_mipibrdg_en: pp1000-mipibrdg-en {
 		pins1 {
 			pinmux = <PINMUX_GPIO54__FUNC_GPIO54>;
 			output-low;
 		};
 	};
 
-	pp1800_lcd_en: pp1800-lcd-en {
+	pp1800_mipibrdg_en: pp1800-mipibrdg-en {
 		pins1 {
 			pinmux = <PINMUX_GPIO36__FUNC_GPIO36>;
 			output-low;
@@ -458,7 +460,7 @@ trackpad-int {
 		};
 	};
 
-	vddio_mipibrdg_en: vddio-mipibrdg-en {
+	pp3300_mipibrdg_en: pp3300-mipibrdg-en {
 		pins1 {
 			pinmux = <PINMUX_GPIO37__FUNC_GPIO37>;
 			output-low;
-- 
2.47.0.163.g1226f6d8fa-goog


