Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AE49FD29FEC
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 14 Jan 2026 10:58:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:Message-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=NTbxvXk9ZCcVK0Yjbx8jIbzwKRtMfnnLMgPkZEeFVrk=; b=zVnl/o9VnYImn00/Fgd20CSWPK
	uE8k12DPzAPB0pDBHi9P0qtedXpQDkFZ00uAGa5qtFUiiWQj67g7x68TgFFkRx+KJSMvMFZNUnTxe
	SVs72r7Ka8RqM9/2wGQOy/t1wGicTKLt5QcwlCoyXynTv4sNUny1f1tYHyYCZcKMZBwTCndxZIG6c
	Wn3Crua31Cldz+niLomqJYzySBudtmqyRMqLn4ff7mLpoyIkf/FrxkGKzmXTEcwkVDpiB6njr07Df
	74yI4B89JJSqyLS6hsnxhpvp4jyz5+QbuDAS2+7tpd6m/GfoJbvcnf8mLoyHUT8Ao44njCv64pkFo
	Zh9yRuDw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vfyZd-00000008t1k-0d9T;
	Wed, 14 Jan 2026 10:58:01 +0000
Received: from mail-wm1-x344.google.com ([2a00:1450:4864:20::344])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vfyZY-00000008szx-3r19
	for linux-arm-kernel@lists.infradead.org;
	Wed, 14 Jan 2026 10:57:59 +0000
Received: by mail-wm1-x344.google.com with SMTP id 5b1f17b1804b1-47edd6111b4so13300225e9.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 14 Jan 2026 02:57:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1768388275; x=1768993075; darn=lists.infradead.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=NTbxvXk9ZCcVK0Yjbx8jIbzwKRtMfnnLMgPkZEeFVrk=;
        b=o+ytNL0QzHSVT1/Wr+CtSyaUkZ4MW4iWCg8FfFcVIsrXsILSEmHsGy7egEyqvZuANX
         8ZWkuh2+swWjvYVkavdNAtrpMHv31FV7AXCHX/zYKgoba5vHa+rbZ1Fhxxr01L62JZYH
         d+n1tHG+FicrRzY1reYo99vZOopVMI5HZFw4vQKa0BhKTXJ2akrFPxGvbwKYBj5zSnNt
         adHZClV0iW0iVTMMKbCB4qMjcO5llLwZt3VNJAbMPWjoo9I+WNkgFB7+HckcaHNLUHtf
         /pPcXKADkUxBoLmkIqbuv/G0NImX+u2pwseVLcZwa65BXm2tmxaIhNLwdPUbngnrG86d
         iPzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768388275; x=1768993075;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=NTbxvXk9ZCcVK0Yjbx8jIbzwKRtMfnnLMgPkZEeFVrk=;
        b=Ax4wiEGo7Oewm/Z9wcQUO+4dOXFTfO1XKzkNEOmHDzttQTRBZJKWgoHcNnIIISuWkb
         +apdjk3NZLmObRQ0limxBwAnGzsZqk+1t2ZP9hmxelPkDsHazDVLHMmOKZK+3tOFWl72
         1cj7f7MtEdSnnbthfEWn6PryrhpeK+4qMTTKS3y5AJn5lNxl5zVQXFhteZ6GY/GgnzPl
         iRACasJiwbC4tpij1PGdMUJM+bzAwtglgIyLUghUyGzIJJcFPktQ4BPiXOYYEJvuMxXk
         WXqSZtlVqHdl8dCP790F9aNa0gEQTk91psweeEwi+576J/9ryZ+el3jERX62UrIRsWGv
         cegQ==
X-Forwarded-Encrypted: i=1; AJvYcCXQAkHs4Vjy5VVI+28MSuBwIZTwCzXYMC+GcaZdigv42Z2/faSpNB7xFM3i7EVmYH95vtycz90qSwuxu5IcmSP5@lists.infradead.org
X-Gm-Message-State: AOJu0YwygxMY65P45ySiFszeQV5/44sdG8ebDPpBQ8wGFQVt8/DPN5OF
	j3mqgZ51X/bYFM9WT9QSLWt1/up6h7Ht7DRygbPxPLOFE8CbXoUVH7sw62PiNsoZoyk=
X-Gm-Gg: AY/fxX5YvwMbTvBvuyzLt2MK97QY/f1DM6lZelf7avsiS+ZK7+7jRN7D8ibGRGXiVdH
	GN5nu0suCitMp0eKHNYaEZke32ZCf+0RGYGKtAumOGtUQzck+9COQ1QUp8dYQ3W2amxqk4+ShyZ
	aV2/VeAyWvMy5Xnj6o1E4PpE7/w6fFqHtdn92m4xtX8gSsEl3Lm4oXDtlMm1RT8pGWDQY/aQDF/
	Pidg3B2NeW+pOsRyFADcl/b1ofCnpDXmRNwV4Foej1B9qY/yN6HiNWvf0JJYWZLcHEs4Fs3bTs2
	cgJeX3bU8JJbUuisFQ0D3mK1LA+LO2Y0HtgKQ1yH53UA9kjKEWqvJRV0jBh1DzyPRrXfrVvXPzB
	xGVRBSQQ0QsUQCnb5zcPko7yBss5plIx6Hzh6n60XxvGUyz2u/d6O+3ejSFjIkFsScmQqWK6xsS
	s2oQtO80ZM3g==
X-Received: by 2002:a05:600c:c4a6:b0:47d:3690:7490 with SMTP id 5b1f17b1804b1-47ee47c8db0mr19638695e9.9.1768388274920;
        Wed, 14 Jan 2026 02:57:54 -0800 (PST)
Received: from localhost ([2a01:e0a:3c5:5fb1:f2cc:bd72:2de3:86cd])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-47ee6f59cf4sm6412055e9.12.2026.01.14.02.57.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Jan 2026 02:57:54 -0800 (PST)
From: Jerome Brunet <jbrunet@baylibre.com>
Date: Wed, 14 Jan 2026 11:57:40 +0100
Subject: [PATCH] arm64: dts: amlogic: drop useless assigned-clock-parents
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260114-amlogic-parent-clock-cleanup-v1-1-31078b1e4a2c@baylibre.com>
X-B4-Tracking: v=1; b=H4sIAKN2Z2kC/x3MwQqFIBBA0V+JWTegUgb9SrSQaaqhUtHeI4j+P
 Wlz4WzuDZmTcIa+uiHxX7IEX6DrCmh1fmGUqRiMMlZp3aA79rAIYXSJ/Ym0B9pK2flfxHYmo6a
 WbGc7KIuYeJbr2w/j87zbTJ2XbgAAAA==
X-Change-ID: 20260114-amlogic-parent-clock-cleanup-5fc20d5c6767
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Kevin Hilman <khilman@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Jerome Brunet <jbrunet@baylibre.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=32381; i=jbrunet@baylibre.com;
 h=from:subject:message-id; bh=W8u+gzsHZy6ebZql34frIrFbK3qpJg2S4BzsWFuq4nw=;
 b=owEBbQKS/ZANAwAKAeb8Dxw38tqFAcsmYgBpZ3avCADO7t27VTMaJ0eSWe6JlNhXv13AY/cum
 pFw1D65I4GJAjMEAAEKAB0WIQT04VmuGPP1bV8btxvm/A8cN/LahQUCaWd2rwAKCRDm/A8cN/La
 hfmbEACItQDn5r+nJKBqhws6qAKhmstPhWWysdRKK+jqXfjV+5t/5ETIWnSUSToQukBlrH2fIYY
 95TdUhnBNy6Z6WURkPIHuylmr0dV9I+fd05mOhcF7tS5WTsH+vkJjpOBzOnTPNry5gzWQ6BpmIL
 EKnwLI/5fbqir2NL631s5MagxEo/gADx42y2BLS4AWahAQrm89FbiN8dN76xrQv5udbqSiMfzNy
 YCco9ng3h6vjAE1h6YCu420zsJV1+SmRXQo+SgOl17qY/lawZDXBt0sYr5vgY0H5eD+gdDvjWqA
 YbxctTmgOx7zOcLrLVpFQGuvRfCf17ONG1fqYd0HQvSYnxZbwkn27ciJihq0l4Z4HxReEqXlTL2
 /rcdm2kCbMPSOywpf6qz0vNFoWYgYGprDDwkpigHT+aBm+DA843eL2Be+e96m3/Eh/sv+Z48l/x
 RXW8gXlkCmXQIanBJRQueoe7ctPO/3q7c3LXeKn3DuXNueshj/xoqaGlr7DxEqHfxZqqWQO6CZZ
 KT30oka1iK+c/g7+X7/opOz7eZpb8J1Lowja17PYOm6hKwJhrQL3JAz4eoDPQo5h3eo549uQjri
 l25DWy77dkYDlZZrVbCQ+Gesmoc8azG26DzBk0Q1Tu0HkgXRi0mar5SS7TSGfmGXNyDk2aWZ9ly
 FCJ28X7DK2wVIVA==
X-Developer-Key: i=jbrunet@baylibre.com; a=openpgp;
 fpr=F29F26CF27BAE1A9719AE6BDC3C92AAF3E60AED9
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260114_025757_184709_4B68E286 
X-CRM114-Status: UNSURE (   8.41  )
X-CRM114-Notice: Please train this message.
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

Amlogic sound card assigned-clock-parents only have <0> and are useless.
Remove them.

Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>
---
 arch/arm64/boot/dts/amlogic/meson-axg-s400.dts                      | 1 -
 arch/arm64/boot/dts/amlogic/meson-g12a-fbx8am.dts                   | 1 -
 arch/arm64/boot/dts/amlogic/meson-g12a-radxa-zero.dts               | 1 -
 arch/arm64/boot/dts/amlogic/meson-g12a-sei510.dts                   | 1 -
 arch/arm64/boot/dts/amlogic/meson-g12a-u200.dts                     | 1 -
 arch/arm64/boot/dts/amlogic/meson-g12a-x96-max.dts                  | 1 -
 arch/arm64/boot/dts/amlogic/meson-g12b-bananapi-cm4-cm4io.dts       | 1 -
 arch/arm64/boot/dts/amlogic/meson-g12b-bananapi-cm4-mnt-reform2.dts | 1 -
 arch/arm64/boot/dts/amlogic/meson-g12b-bananapi.dtsi                | 1 -
 arch/arm64/boot/dts/amlogic/meson-g12b-dreambox.dtsi                | 1 -
 arch/arm64/boot/dts/amlogic/meson-g12b-gsking-x.dts                 | 1 -
 arch/arm64/boot/dts/amlogic/meson-g12b-gtking-pro.dts               | 1 -
 arch/arm64/boot/dts/amlogic/meson-g12b-gtking.dts                   | 1 -
 arch/arm64/boot/dts/amlogic/meson-g12b-odroid-go-ultra.dts          | 1 -
 arch/arm64/boot/dts/amlogic/meson-g12b-odroid-n2.dtsi               | 1 -
 arch/arm64/boot/dts/amlogic/meson-g12b-odroid-n2l.dts               | 1 -
 arch/arm64/boot/dts/amlogic/meson-g12b-radxa-zero2.dts              | 1 -
 arch/arm64/boot/dts/amlogic/meson-g12b-ugoos-am6.dts                | 1 -
 arch/arm64/boot/dts/amlogic/meson-gx-libretech-pc.dtsi              | 1 -
 arch/arm64/boot/dts/amlogic/meson-gx-p23x-q20x.dtsi                 | 1 -
 arch/arm64/boot/dts/amlogic/meson-gxbb-kii-pro.dts                  | 1 -
 arch/arm64/boot/dts/amlogic/meson-gxbb-nanopi-k2.dts                | 1 -
 arch/arm64/boot/dts/amlogic/meson-gxbb-nexbox-a95x.dts              | 1 -
 arch/arm64/boot/dts/amlogic/meson-gxbb-odroidc2.dts                 | 1 -
 arch/arm64/boot/dts/amlogic/meson-gxbb-p200.dts                     | 1 -
 arch/arm64/boot/dts/amlogic/meson-gxbb-p201.dts                     | 1 -
 arch/arm64/boot/dts/amlogic/meson-gxbb-vega-s95.dtsi                | 1 -
 arch/arm64/boot/dts/amlogic/meson-gxbb-wetek-hub.dts                | 1 -
 arch/arm64/boot/dts/amlogic/meson-gxbb-wetek-play2.dts              | 1 -
 arch/arm64/boot/dts/amlogic/meson-gxl-s805x-libretech-ac.dts        | 1 -
 arch/arm64/boot/dts/amlogic/meson-gxl-s805x-p241.dts                | 1 -
 arch/arm64/boot/dts/amlogic/meson-gxl-s805y-xiaomi-aquaman.dts      | 1 -
 arch/arm64/boot/dts/amlogic/meson-gxl-s905x-khadas-vim.dts          | 1 -
 arch/arm64/boot/dts/amlogic/meson-gxl-s905x-libretech-cc-v2.dts     | 1 -
 arch/arm64/boot/dts/amlogic/meson-gxl-s905x-libretech-cc.dts        | 1 -
 arch/arm64/boot/dts/amlogic/meson-gxl-s905x-p212.dts                | 1 -
 arch/arm64/boot/dts/amlogic/meson-gxl-s905x-vero4k.dts              | 1 -
 arch/arm64/boot/dts/amlogic/meson-gxm-khadas-vim2.dts               | 1 -
 arch/arm64/boot/dts/amlogic/meson-gxm-nexbox-a1.dts                 | 1 -
 arch/arm64/boot/dts/amlogic/meson-gxm-rbox-pro.dts                  | 1 -
 arch/arm64/boot/dts/amlogic/meson-khadas-vim3.dtsi                  | 1 -
 arch/arm64/boot/dts/amlogic/meson-libretech-cottonwood.dtsi         | 1 -
 arch/arm64/boot/dts/amlogic/meson-sm1-a95xf3-air-gbit.dts           | 1 -
 arch/arm64/boot/dts/amlogic/meson-sm1-a95xf3-air.dts                | 1 -
 arch/arm64/boot/dts/amlogic/meson-sm1-bananapi-m2-pro.dts           | 1 -
 arch/arm64/boot/dts/amlogic/meson-sm1-bananapi-m5.dts               | 1 -
 arch/arm64/boot/dts/amlogic/meson-sm1-h96-max.dts                   | 1 -
 arch/arm64/boot/dts/amlogic/meson-sm1-odroid.dtsi                   | 1 -
 arch/arm64/boot/dts/amlogic/meson-sm1-sei610.dts                    | 1 -
 arch/arm64/boot/dts/amlogic/meson-sm1-x96-air-gbit.dts              | 1 -
 arch/arm64/boot/dts/amlogic/meson-sm1-x96-air.dts                   | 1 -
 51 files changed, 51 deletions(-)

diff --git a/arch/arm64/boot/dts/amlogic/meson-axg-s400.dts b/arch/arm64/boot/dts/amlogic/meson-axg-s400.dts
index 9611775b81ee..285c6ac1dd61 100644
--- a/arch/arm64/boot/dts/amlogic/meson-axg-s400.dts
+++ b/arch/arm64/boot/dts/amlogic/meson-axg-s400.dts
@@ -275,7 +275,6 @@ sound {
 		assigned-clocks = <&clkc CLKID_HIFI_PLL>,
 				  <&clkc CLKID_MPLL0>,
 				  <&clkc CLKID_MPLL1>;
-		assigned-clock-parents = <0>, <0>, <0>;
 		assigned-clock-rates = <589824000>,
 				       <270950400>,
 				       <393216000>;
diff --git a/arch/arm64/boot/dts/amlogic/meson-g12a-fbx8am.dts b/arch/arm64/boot/dts/amlogic/meson-g12a-fbx8am.dts
index d0a3b4b9229c..ac6696e7e1df 100644
--- a/arch/arm64/boot/dts/amlogic/meson-g12a-fbx8am.dts
+++ b/arch/arm64/boot/dts/amlogic/meson-g12a-fbx8am.dts
@@ -183,7 +183,6 @@ sound {
 		assigned-clocks = <&clkc CLKID_MPLL2>,
 				  <&clkc CLKID_MPLL0>,
 				  <&clkc CLKID_MPLL1>;
-		assigned-clock-parents = <0>, <0>, <0>;
 		assigned-clock-rates = <294912000>,
 				       <270950400>,
 				       <393216000>;
diff --git a/arch/arm64/boot/dts/amlogic/meson-g12a-radxa-zero.dts b/arch/arm64/boot/dts/amlogic/meson-g12a-radxa-zero.dts
index 4353485c6f26..3d62c67ccc76 100644
--- a/arch/arm64/boot/dts/amlogic/meson-g12a-radxa-zero.dts
+++ b/arch/arm64/boot/dts/amlogic/meson-g12a-radxa-zero.dts
@@ -145,7 +145,6 @@ sound {
 		assigned-clocks = <&clkc CLKID_MPLL2>,
 				  <&clkc CLKID_MPLL0>,
 				  <&clkc CLKID_MPLL1>;
-		assigned-clock-parents = <0>, <0>, <0>;
 		assigned-clock-rates = <294912000>,
 				       <270950400>,
 				       <393216000>;
diff --git a/arch/arm64/boot/dts/amlogic/meson-g12a-sei510.dts b/arch/arm64/boot/dts/amlogic/meson-g12a-sei510.dts
index f39fcabc763f..5bc4d7780f5a 100644
--- a/arch/arm64/boot/dts/amlogic/meson-g12a-sei510.dts
+++ b/arch/arm64/boot/dts/amlogic/meson-g12a-sei510.dts
@@ -208,7 +208,6 @@ sound {
 		assigned-clocks = <&clkc CLKID_MPLL2>,
 				  <&clkc CLKID_MPLL0>,
 				  <&clkc CLKID_MPLL1>;
-		assigned-clock-parents = <0>, <0>, <0>;
 		assigned-clock-rates = <294912000>,
 				       <270950400>,
 				       <393216000>;
diff --git a/arch/arm64/boot/dts/amlogic/meson-g12a-u200.dts b/arch/arm64/boot/dts/amlogic/meson-g12a-u200.dts
index b5bf8ecc91e6..b1f012511d60 100644
--- a/arch/arm64/boot/dts/amlogic/meson-g12a-u200.dts
+++ b/arch/arm64/boot/dts/amlogic/meson-g12a-u200.dts
@@ -245,7 +245,6 @@ sound {
 		assigned-clocks = <&clkc CLKID_MPLL2>,
 				  <&clkc CLKID_MPLL0>,
 				  <&clkc CLKID_MPLL1>;
-		assigned-clock-parents = <0>, <0>, <0>;
 		assigned-clock-rates = <294912000>,
 				       <270950400>,
 				       <393216000>;
diff --git a/arch/arm64/boot/dts/amlogic/meson-g12a-x96-max.dts b/arch/arm64/boot/dts/amlogic/meson-g12a-x96-max.dts
index 5ab460a3e637..a8a57147475f 100644
--- a/arch/arm64/boot/dts/amlogic/meson-g12a-x96-max.dts
+++ b/arch/arm64/boot/dts/amlogic/meson-g12a-x96-max.dts
@@ -165,7 +165,6 @@ sound {
 		assigned-clocks = <&clkc CLKID_MPLL2>,
 				  <&clkc CLKID_MPLL0>,
 				  <&clkc CLKID_MPLL1>;
-		assigned-clock-parents = <0>, <0>, <0>;
 		assigned-clock-rates = <294912000>,
 				       <270950400>,
 				       <393216000>;
diff --git a/arch/arm64/boot/dts/amlogic/meson-g12b-bananapi-cm4-cm4io.dts b/arch/arm64/boot/dts/amlogic/meson-g12b-bananapi-cm4-cm4io.dts
index 2d74456e685d..cdb522f5365a 100644
--- a/arch/arm64/boot/dts/amlogic/meson-g12b-bananapi-cm4-cm4io.dts
+++ b/arch/arm64/boot/dts/amlogic/meson-g12b-bananapi-cm4-cm4io.dts
@@ -77,7 +77,6 @@ sound {
 		assigned-clocks = <&clkc CLKID_MPLL2>,
 				  <&clkc CLKID_MPLL0>,
 				  <&clkc CLKID_MPLL1>;
-		assigned-clock-parents = <0>, <0>, <0>;
 		assigned-clock-rates = <294912000>,
 				       <270950400>,
 				       <393216000>;
diff --git a/arch/arm64/boot/dts/amlogic/meson-g12b-bananapi-cm4-mnt-reform2.dts b/arch/arm64/boot/dts/amlogic/meson-g12b-bananapi-cm4-mnt-reform2.dts
index 0f48c32bec97..2d4071c51f3d 100644
--- a/arch/arm64/boot/dts/amlogic/meson-g12b-bananapi-cm4-mnt-reform2.dts
+++ b/arch/arm64/boot/dts/amlogic/meson-g12b-bananapi-cm4-mnt-reform2.dts
@@ -86,7 +86,6 @@ sound {
 		assigned-clocks = <&clkc CLKID_MPLL2>,
 					<&clkc CLKID_MPLL0>,
 					<&clkc CLKID_MPLL1>;
-		assigned-clock-parents = <0>, <0>, <0>;
 		assigned-clock-rates = <294912000>,
 				       <270950400>,
 				       <393216000>;
diff --git a/arch/arm64/boot/dts/amlogic/meson-g12b-bananapi.dtsi b/arch/arm64/boot/dts/amlogic/meson-g12b-bananapi.dtsi
index 1b08303c4282..10f62f151902 100644
--- a/arch/arm64/boot/dts/amlogic/meson-g12b-bananapi.dtsi
+++ b/arch/arm64/boot/dts/amlogic/meson-g12b-bananapi.dtsi
@@ -201,7 +201,6 @@ sound {
 		assigned-clocks = <&clkc CLKID_MPLL2>,
 				  <&clkc CLKID_MPLL0>,
 				  <&clkc CLKID_MPLL1>;
-		assigned-clock-parents = <0>, <0>, <0>;
 		assigned-clock-rates = <294912000>,
 				       <270950400>,
 				       <393216000>;
diff --git a/arch/arm64/boot/dts/amlogic/meson-g12b-dreambox.dtsi b/arch/arm64/boot/dts/amlogic/meson-g12b-dreambox.dtsi
index 8e3e3354ed67..a69d5531c540 100644
--- a/arch/arm64/boot/dts/amlogic/meson-g12b-dreambox.dtsi
+++ b/arch/arm64/boot/dts/amlogic/meson-g12b-dreambox.dtsi
@@ -47,7 +47,6 @@ sound {
 		assigned-clocks = <&clkc CLKID_MPLL2>,
 				  <&clkc CLKID_MPLL0>,
 				  <&clkc CLKID_MPLL1>;
-		assigned-clock-parents = <0>, <0>, <0>;
 		assigned-clock-rates = <294912000>,
 				       <270950400>,
 				       <393216000>;
diff --git a/arch/arm64/boot/dts/amlogic/meson-g12b-gsking-x.dts b/arch/arm64/boot/dts/amlogic/meson-g12b-gsking-x.dts
index 369c5cf889b6..8758a68136ea 100644
--- a/arch/arm64/boot/dts/amlogic/meson-g12b-gsking-x.dts
+++ b/arch/arm64/boot/dts/amlogic/meson-g12b-gsking-x.dts
@@ -55,7 +55,6 @@ sound {
 		assigned-clocks = <&clkc CLKID_MPLL2>,
 				  <&clkc CLKID_MPLL0>,
 				  <&clkc CLKID_MPLL1>;
-		assigned-clock-parents = <0>, <0>, <0>;
 		assigned-clock-rates = <294912000>,
 				       <270950400>,
 				       <393216000>;
diff --git a/arch/arm64/boot/dts/amlogic/meson-g12b-gtking-pro.dts b/arch/arm64/boot/dts/amlogic/meson-g12b-gtking-pro.dts
index 654449afd3a4..a9478e2cce4d 100644
--- a/arch/arm64/boot/dts/amlogic/meson-g12b-gtking-pro.dts
+++ b/arch/arm64/boot/dts/amlogic/meson-g12b-gtking-pro.dts
@@ -56,7 +56,6 @@ sound {
 		assigned-clocks = <&clkc CLKID_MPLL2>,
 				  <&clkc CLKID_MPLL0>,
 				  <&clkc CLKID_MPLL1>;
-		assigned-clock-parents = <0>, <0>, <0>;
 		assigned-clock-rates = <294912000>,
 				       <270950400>,
 				       <393216000>;
diff --git a/arch/arm64/boot/dts/amlogic/meson-g12b-gtking.dts b/arch/arm64/boot/dts/amlogic/meson-g12b-gtking.dts
index e20311386745..a2ff5040eadf 100644
--- a/arch/arm64/boot/dts/amlogic/meson-g12b-gtking.dts
+++ b/arch/arm64/boot/dts/amlogic/meson-g12b-gtking.dts
@@ -44,7 +44,6 @@ sound {
 		assigned-clocks = <&clkc CLKID_MPLL2>,
 				  <&clkc CLKID_MPLL0>,
 				  <&clkc CLKID_MPLL1>;
-		assigned-clock-parents = <0>, <0>, <0>;
 		assigned-clock-rates = <294912000>,
 				       <270950400>,
 				       <393216000>;
diff --git a/arch/arm64/boot/dts/amlogic/meson-g12b-odroid-go-ultra.dts b/arch/arm64/boot/dts/amlogic/meson-g12b-odroid-go-ultra.dts
index d5938a4a6da3..c3e8083ba08c 100644
--- a/arch/arm64/boot/dts/amlogic/meson-g12b-odroid-go-ultra.dts
+++ b/arch/arm64/boot/dts/amlogic/meson-g12b-odroid-go-ultra.dts
@@ -241,7 +241,6 @@ sound {
 		assigned-clocks = <&clkc CLKID_MPLL2>,
 				  <&clkc CLKID_MPLL0>,
 				  <&clkc CLKID_MPLL1>;
-		assigned-clock-parents = <0>, <0>, <0>;
 		assigned-clock-rates = <294912000>,
 				       <270950400>,
 				       <393216000>;
diff --git a/arch/arm64/boot/dts/amlogic/meson-g12b-odroid-n2.dtsi b/arch/arm64/boot/dts/amlogic/meson-g12b-odroid-n2.dtsi
index 3bca8023638d..edb7ed6b0ec0 100644
--- a/arch/arm64/boot/dts/amlogic/meson-g12b-odroid-n2.dtsi
+++ b/arch/arm64/boot/dts/amlogic/meson-g12b-odroid-n2.dtsi
@@ -102,7 +102,6 @@ sound {
 		assigned-clocks = <&clkc CLKID_MPLL2>,
 				  <&clkc CLKID_MPLL0>,
 				  <&clkc CLKID_MPLL1>;
-		assigned-clock-parents = <0>, <0>, <0>;
 		assigned-clock-rates = <294912000>,
 				       <270950400>,
 				       <393216000>;
diff --git a/arch/arm64/boot/dts/amlogic/meson-g12b-odroid-n2l.dts b/arch/arm64/boot/dts/amlogic/meson-g12b-odroid-n2l.dts
index 1b9097a30251..15795889cb53 100644
--- a/arch/arm64/boot/dts/amlogic/meson-g12b-odroid-n2l.dts
+++ b/arch/arm64/boot/dts/amlogic/meson-g12b-odroid-n2l.dts
@@ -46,7 +46,6 @@ sound {
 		assigned-clocks = <&clkc CLKID_MPLL2>,
 				  <&clkc CLKID_MPLL0>,
 				  <&clkc CLKID_MPLL1>;
-		assigned-clock-parents = <0>, <0>, <0>;
 		assigned-clock-rates = <294912000>,
 				       <270950400>,
 				       <393216000>;
diff --git a/arch/arm64/boot/dts/amlogic/meson-g12b-radxa-zero2.dts b/arch/arm64/boot/dts/amlogic/meson-g12b-radxa-zero2.dts
index 1e5c6f984945..5e0abda613e4 100644
--- a/arch/arm64/boot/dts/amlogic/meson-g12b-radxa-zero2.dts
+++ b/arch/arm64/boot/dts/amlogic/meson-g12b-radxa-zero2.dts
@@ -183,7 +183,6 @@ sound {
 		assigned-clocks = <&clkc CLKID_MPLL2>,
 				  <&clkc CLKID_MPLL0>,
 				  <&clkc CLKID_MPLL1>;
-		assigned-clock-parents = <0>, <0>, <0>;
 		assigned-clock-rates = <294912000>,
 				       <270950400>,
 				       <393216000>;
diff --git a/arch/arm64/boot/dts/amlogic/meson-g12b-ugoos-am6.dts b/arch/arm64/boot/dts/amlogic/meson-g12b-ugoos-am6.dts
index 4c1a75b926ee..dbd72fe0f53f 100644
--- a/arch/arm64/boot/dts/amlogic/meson-g12b-ugoos-am6.dts
+++ b/arch/arm64/boot/dts/amlogic/meson-g12b-ugoos-am6.dts
@@ -39,7 +39,6 @@ sound {
 		assigned-clocks = <&clkc CLKID_MPLL2>,
 				  <&clkc CLKID_MPLL0>,
 				  <&clkc CLKID_MPLL1>;
-		assigned-clock-parents = <0>, <0>, <0>;
 		assigned-clock-rates = <294912000>,
 				       <270950400>,
 				       <393216000>;
diff --git a/arch/arm64/boot/dts/amlogic/meson-gx-libretech-pc.dtsi b/arch/arm64/boot/dts/amlogic/meson-gx-libretech-pc.dtsi
index 2da49cfbde77..c2bf6f4cdfd2 100644
--- a/arch/arm64/boot/dts/amlogic/meson-gx-libretech-pc.dtsi
+++ b/arch/arm64/boot/dts/amlogic/meson-gx-libretech-pc.dtsi
@@ -201,7 +201,6 @@ sound {
 		assigned-clocks = <&clkc CLKID_MPLL0>,
 				  <&clkc CLKID_MPLL1>,
 				  <&clkc CLKID_MPLL2>;
-		assigned-clock-parents = <0>, <0>, <0>;
 		assigned-clock-rates = <294912000>,
 				       <270950400>,
 				       <393216000>;
diff --git a/arch/arm64/boot/dts/amlogic/meson-gx-p23x-q20x.dtsi b/arch/arm64/boot/dts/amlogic/meson-gx-p23x-q20x.dtsi
index b4f88ed6273b..8d216a594d7b 100644
--- a/arch/arm64/boot/dts/amlogic/meson-gx-p23x-q20x.dtsi
+++ b/arch/arm64/boot/dts/amlogic/meson-gx-p23x-q20x.dtsi
@@ -136,7 +136,6 @@ sound {
 		assigned-clocks = <&clkc CLKID_MPLL0>,
 				  <&clkc CLKID_MPLL1>,
 				  <&clkc CLKID_MPLL2>;
-		assigned-clock-parents = <0>, <0>, <0>;
 		assigned-clock-rates = <294912000>,
 				       <270950400>,
 				       <393216000>;
diff --git a/arch/arm64/boot/dts/amlogic/meson-gxbb-kii-pro.dts b/arch/arm64/boot/dts/amlogic/meson-gxbb-kii-pro.dts
index 073b47ce8c3c..ff3ba97872ec 100644
--- a/arch/arm64/boot/dts/amlogic/meson-gxbb-kii-pro.dts
+++ b/arch/arm64/boot/dts/amlogic/meson-gxbb-kii-pro.dts
@@ -52,7 +52,6 @@ sound {
 		assigned-clocks = <&clkc CLKID_MPLL0>,
 				  <&clkc CLKID_MPLL1>,
 				  <&clkc CLKID_MPLL2>;
-		assigned-clock-parents = <0>, <0>, <0>;
 		assigned-clock-rates = <294912000>,
 				       <270950400>,
 				       <393216000>;
diff --git a/arch/arm64/boot/dts/amlogic/meson-gxbb-nanopi-k2.dts b/arch/arm64/boot/dts/amlogic/meson-gxbb-nanopi-k2.dts
index 2ecc6ebd5a43..5d9ddb814164 100644
--- a/arch/arm64/boot/dts/amlogic/meson-gxbb-nanopi-k2.dts
+++ b/arch/arm64/boot/dts/amlogic/meson-gxbb-nanopi-k2.dts
@@ -142,7 +142,6 @@ sound {
 		assigned-clocks = <&clkc CLKID_MPLL0>,
 				  <&clkc CLKID_MPLL1>,
 				  <&clkc CLKID_MPLL2>;
-		assigned-clock-parents = <0>, <0>, <0>;
 		assigned-clock-rates = <294912000>,
 				       <270950400>,
 				       <393216000>;
diff --git a/arch/arm64/boot/dts/amlogic/meson-gxbb-nexbox-a95x.dts b/arch/arm64/boot/dts/amlogic/meson-gxbb-nexbox-a95x.dts
index c09da40ff7b0..ab8e06aa2b32 100644
--- a/arch/arm64/boot/dts/amlogic/meson-gxbb-nexbox-a95x.dts
+++ b/arch/arm64/boot/dts/amlogic/meson-gxbb-nexbox-a95x.dts
@@ -149,7 +149,6 @@ sound {
 		assigned-clocks = <&clkc CLKID_MPLL0>,
 				  <&clkc CLKID_MPLL1>,
 				  <&clkc CLKID_MPLL2>;
-		assigned-clock-parents = <0>, <0>, <0>;
 		assigned-clock-rates = <294912000>,
 				       <270950400>,
 				       <393216000>;
diff --git a/arch/arm64/boot/dts/amlogic/meson-gxbb-odroidc2.dts b/arch/arm64/boot/dts/amlogic/meson-gxbb-odroidc2.dts
index 12e26f99d4f0..5943bc810678 100644
--- a/arch/arm64/boot/dts/amlogic/meson-gxbb-odroidc2.dts
+++ b/arch/arm64/boot/dts/amlogic/meson-gxbb-odroidc2.dts
@@ -184,7 +184,6 @@ sound {
 		assigned-clocks = <&clkc CLKID_MPLL0>,
 				  <&clkc CLKID_MPLL1>,
 				  <&clkc CLKID_MPLL2>;
-		assigned-clock-parents = <0>, <0>, <0>;
 		assigned-clock-rates = <294912000>,
 				       <270950400>,
 				       <393216000>;
diff --git a/arch/arm64/boot/dts/amlogic/meson-gxbb-p200.dts b/arch/arm64/boot/dts/amlogic/meson-gxbb-p200.dts
index bfac00e76ba3..b5981c0b1494 100644
--- a/arch/arm64/boot/dts/amlogic/meson-gxbb-p200.dts
+++ b/arch/arm64/boot/dts/amlogic/meson-gxbb-p200.dts
@@ -75,7 +75,6 @@ sound {
 		assigned-clocks = <&clkc CLKID_MPLL0>,
 				  <&clkc CLKID_MPLL1>,
 				  <&clkc CLKID_MPLL2>;
-		assigned-clock-parents = <0>, <0>, <0>;
 		assigned-clock-rates = <294912000>,
 				       <270950400>,
 				       <393216000>;
diff --git a/arch/arm64/boot/dts/amlogic/meson-gxbb-p201.dts b/arch/arm64/boot/dts/amlogic/meson-gxbb-p201.dts
index c10f66031ecd..602777702984 100644
--- a/arch/arm64/boot/dts/amlogic/meson-gxbb-p201.dts
+++ b/arch/arm64/boot/dts/amlogic/meson-gxbb-p201.dts
@@ -24,7 +24,6 @@ sound {
 		assigned-clocks = <&clkc CLKID_MPLL0>,
 				  <&clkc CLKID_MPLL1>,
 				  <&clkc CLKID_MPLL2>;
-		assigned-clock-parents = <0>, <0>, <0>;
 		assigned-clock-rates = <294912000>,
 				       <270950400>,
 				       <393216000>;
diff --git a/arch/arm64/boot/dts/amlogic/meson-gxbb-vega-s95.dtsi b/arch/arm64/boot/dts/amlogic/meson-gxbb-vega-s95.dtsi
index 6ff567225fee..a4d354cc93a5 100644
--- a/arch/arm64/boot/dts/amlogic/meson-gxbb-vega-s95.dtsi
+++ b/arch/arm64/boot/dts/amlogic/meson-gxbb-vega-s95.dtsi
@@ -115,7 +115,6 @@ sound {
 		assigned-clocks = <&clkc CLKID_MPLL0>,
 				  <&clkc CLKID_MPLL1>,
 				  <&clkc CLKID_MPLL2>;
-		assigned-clock-parents = <0>, <0>, <0>;
 		assigned-clock-rates = <294912000>,
 				       <270950400>,
 				       <393216000>;
diff --git a/arch/arm64/boot/dts/amlogic/meson-gxbb-wetek-hub.dts b/arch/arm64/boot/dts/amlogic/meson-gxbb-wetek-hub.dts
index ec281a9e9e77..a22a8a435427 100644
--- a/arch/arm64/boot/dts/amlogic/meson-gxbb-wetek-hub.dts
+++ b/arch/arm64/boot/dts/amlogic/meson-gxbb-wetek-hub.dts
@@ -23,7 +23,6 @@ sound {
 		assigned-clocks = <&clkc CLKID_MPLL0>,
 				  <&clkc CLKID_MPLL1>,
 				  <&clkc CLKID_MPLL2>;
-		assigned-clock-parents = <0>, <0>, <0>;
 		assigned-clock-rates = <294912000>,
 				       <270950400>,
 				       <393216000>;
diff --git a/arch/arm64/boot/dts/amlogic/meson-gxbb-wetek-play2.dts b/arch/arm64/boot/dts/amlogic/meson-gxbb-wetek-play2.dts
index 924414861b72..6a1b65bf84da 100644
--- a/arch/arm64/boot/dts/amlogic/meson-gxbb-wetek-play2.dts
+++ b/arch/arm64/boot/dts/amlogic/meson-gxbb-wetek-play2.dts
@@ -55,7 +55,6 @@ sound {
 		assigned-clocks = <&clkc CLKID_MPLL0>,
 				  <&clkc CLKID_MPLL1>,
 				  <&clkc CLKID_MPLL2>;
-		assigned-clock-parents = <0>, <0>, <0>;
 		assigned-clock-rates = <294912000>,
 				       <270950400>,
 				       <393216000>;
diff --git a/arch/arm64/boot/dts/amlogic/meson-gxl-s805x-libretech-ac.dts b/arch/arm64/boot/dts/amlogic/meson-gxl-s805x-libretech-ac.dts
index c6132fb71dfc..3a9a801f33d4 100644
--- a/arch/arm64/boot/dts/amlogic/meson-gxl-s805x-libretech-ac.dts
+++ b/arch/arm64/boot/dts/amlogic/meson-gxl-s805x-libretech-ac.dts
@@ -130,7 +130,6 @@ sound {
 		assigned-clocks = <&clkc CLKID_MPLL0>,
 				  <&clkc CLKID_MPLL1>,
 				  <&clkc CLKID_MPLL2>;
-		assigned-clock-parents = <0>, <0>, <0>;
 		assigned-clock-rates = <294912000>,
 				       <270950400>,
 				       <393216000>;
diff --git a/arch/arm64/boot/dts/amlogic/meson-gxl-s805x-p241.dts b/arch/arm64/boot/dts/amlogic/meson-gxl-s805x-p241.dts
index ca7c4e8e7cac..75db2a5c96b3 100644
--- a/arch/arm64/boot/dts/amlogic/meson-gxl-s805x-p241.dts
+++ b/arch/arm64/boot/dts/amlogic/meson-gxl-s805x-p241.dts
@@ -135,7 +135,6 @@ sound {
 		assigned-clocks = <&clkc CLKID_MPLL0>,
 				  <&clkc CLKID_MPLL1>,
 				  <&clkc CLKID_MPLL2>;
-		assigned-clock-parents = <0>, <0>, <0>;
 		assigned-clock-rates = <294912000>,
 				       <270950400>,
 				       <393216000>;
diff --git a/arch/arm64/boot/dts/amlogic/meson-gxl-s805y-xiaomi-aquaman.dts b/arch/arm64/boot/dts/amlogic/meson-gxl-s805y-xiaomi-aquaman.dts
index cac15b89c573..9e571b96bde6 100644
--- a/arch/arm64/boot/dts/amlogic/meson-gxl-s805y-xiaomi-aquaman.dts
+++ b/arch/arm64/boot/dts/amlogic/meson-gxl-s805y-xiaomi-aquaman.dts
@@ -125,7 +125,6 @@ sound {
 		assigned-clocks = <&clkc CLKID_MPLL0>,
 				  <&clkc CLKID_MPLL1>,
 				  <&clkc CLKID_MPLL2>;
-		assigned-clock-parents = <0>, <0>, <0>;
 		assigned-clock-rates = <294912000>,
 				       <270950400>,
 				       <393216000>;
diff --git a/arch/arm64/boot/dts/amlogic/meson-gxl-s905x-khadas-vim.dts b/arch/arm64/boot/dts/amlogic/meson-gxl-s905x-khadas-vim.dts
index 4e89d6f6bb57..0a6664275bcb 100644
--- a/arch/arm64/boot/dts/amlogic/meson-gxl-s905x-khadas-vim.dts
+++ b/arch/arm64/boot/dts/amlogic/meson-gxl-s905x-khadas-vim.dts
@@ -74,7 +74,6 @@ sound {
 		assigned-clocks = <&clkc CLKID_MPLL0>,
 				  <&clkc CLKID_MPLL1>,
 				  <&clkc CLKID_MPLL2>;
-		assigned-clock-parents = <0>, <0>, <0>;
 		assigned-clock-rates = <294912000>,
 				       <270950400>,
 				       <393216000>;
diff --git a/arch/arm64/boot/dts/amlogic/meson-gxl-s905x-libretech-cc-v2.dts b/arch/arm64/boot/dts/amlogic/meson-gxl-s905x-libretech-cc-v2.dts
index 6cbdfde00e12..277fb34981c7 100644
--- a/arch/arm64/boot/dts/amlogic/meson-gxl-s905x-libretech-cc-v2.dts
+++ b/arch/arm64/boot/dts/amlogic/meson-gxl-s905x-libretech-cc-v2.dts
@@ -167,7 +167,6 @@ sound {
 		assigned-clocks = <&clkc CLKID_MPLL0>,
 				  <&clkc CLKID_MPLL1>,
 				  <&clkc CLKID_MPLL2>;
-		assigned-clock-parents = <0>, <0>, <0>;
 		assigned-clock-rates = <294912000>,
 				       <270950400>,
 				       <393216000>;
diff --git a/arch/arm64/boot/dts/amlogic/meson-gxl-s905x-libretech-cc.dts b/arch/arm64/boot/dts/amlogic/meson-gxl-s905x-libretech-cc.dts
index 401064b0428d..fe1df108892c 100644
--- a/arch/arm64/boot/dts/amlogic/meson-gxl-s905x-libretech-cc.dts
+++ b/arch/arm64/boot/dts/amlogic/meson-gxl-s905x-libretech-cc.dts
@@ -149,7 +149,6 @@ sound {
 		assigned-clocks = <&clkc CLKID_MPLL0>,
 				  <&clkc CLKID_MPLL1>,
 				  <&clkc CLKID_MPLL2>;
-		assigned-clock-parents = <0>, <0>, <0>;
 		assigned-clock-rates = <294912000>,
 				       <270950400>,
 				       <393216000>;
diff --git a/arch/arm64/boot/dts/amlogic/meson-gxl-s905x-p212.dts b/arch/arm64/boot/dts/amlogic/meson-gxl-s905x-p212.dts
index 8b41e340f919..9da495cca787 100644
--- a/arch/arm64/boot/dts/amlogic/meson-gxl-s905x-p212.dts
+++ b/arch/arm64/boot/dts/amlogic/meson-gxl-s905x-p212.dts
@@ -57,7 +57,6 @@ sound {
 		assigned-clocks = <&clkc CLKID_MPLL0>,
 				  <&clkc CLKID_MPLL1>,
 				  <&clkc CLKID_MPLL2>;
-		assigned-clock-parents = <0>, <0>, <0>;
 		assigned-clock-rates = <294912000>,
 				       <270950400>,
 				       <393216000>;
diff --git a/arch/arm64/boot/dts/amlogic/meson-gxl-s905x-vero4k.dts b/arch/arm64/boot/dts/amlogic/meson-gxl-s905x-vero4k.dts
index a9c5881c9783..1e4d3fdd0b22 100644
--- a/arch/arm64/boot/dts/amlogic/meson-gxl-s905x-vero4k.dts
+++ b/arch/arm64/boot/dts/amlogic/meson-gxl-s905x-vero4k.dts
@@ -98,7 +98,6 @@ sound {
 		assigned-clocks = <&clkc CLKID_MPLL0>,
 				  <&clkc CLKID_MPLL1>,
 				  <&clkc CLKID_MPLL2>;
-		assigned-clock-parents = <0>, <0>, <0>;
 		assigned-clock-rates = <294912000>,
 				       <270950400>,
 				       <393216000>;
diff --git a/arch/arm64/boot/dts/amlogic/meson-gxm-khadas-vim2.dts b/arch/arm64/boot/dts/amlogic/meson-gxm-khadas-vim2.dts
index 2a09b3d550e2..5b1aafe16d5c 100644
--- a/arch/arm64/boot/dts/amlogic/meson-gxm-khadas-vim2.dts
+++ b/arch/arm64/boot/dts/amlogic/meson-gxm-khadas-vim2.dts
@@ -157,7 +157,6 @@ sound {
 		assigned-clocks = <&clkc CLKID_MPLL0>,
 				  <&clkc CLKID_MPLL1>,
 				  <&clkc CLKID_MPLL2>;
-		assigned-clock-parents = <0>, <0>, <0>;
 		assigned-clock-rates = <294912000>,
 				       <270950400>,
 				       <393216000>;
diff --git a/arch/arm64/boot/dts/amlogic/meson-gxm-nexbox-a1.dts b/arch/arm64/boot/dts/amlogic/meson-gxm-nexbox-a1.dts
index 773107cc47dd..81f5eb3da5dc 100644
--- a/arch/arm64/boot/dts/amlogic/meson-gxm-nexbox-a1.dts
+++ b/arch/arm64/boot/dts/amlogic/meson-gxm-nexbox-a1.dts
@@ -93,7 +93,6 @@ sound {
 		assigned-clocks = <&clkc CLKID_MPLL0>,
 				  <&clkc CLKID_MPLL1>,
 				  <&clkc CLKID_MPLL2>;
-		assigned-clock-parents = <0>, <0>, <0>;
 		assigned-clock-rates = <294912000>,
 				       <270950400>,
 				       <393216000>;
diff --git a/arch/arm64/boot/dts/amlogic/meson-gxm-rbox-pro.dts b/arch/arm64/boot/dts/amlogic/meson-gxm-rbox-pro.dts
index 9d5a481b309f..9626a2621a3d 100644
--- a/arch/arm64/boot/dts/amlogic/meson-gxm-rbox-pro.dts
+++ b/arch/arm64/boot/dts/amlogic/meson-gxm-rbox-pro.dts
@@ -108,7 +108,6 @@ sound {
 		assigned-clocks = <&clkc CLKID_MPLL0>,
 				  <&clkc CLKID_MPLL1>,
 				  <&clkc CLKID_MPLL2>;
-		assigned-clock-parents = <0>, <0>, <0>;
 		assigned-clock-rates = <294912000>,
 				       <270950400>,
 				       <393216000>;
diff --git a/arch/arm64/boot/dts/amlogic/meson-khadas-vim3.dtsi b/arch/arm64/boot/dts/amlogic/meson-khadas-vim3.dtsi
index 7daa9b122d5c..73aa6b5a5de7 100644
--- a/arch/arm64/boot/dts/amlogic/meson-khadas-vim3.dtsi
+++ b/arch/arm64/boot/dts/amlogic/meson-khadas-vim3.dtsi
@@ -189,7 +189,6 @@ sound {
 		assigned-clocks = <&clkc CLKID_MPLL2>,
 				  <&clkc CLKID_MPLL0>,
 				  <&clkc CLKID_MPLL1>;
-		assigned-clock-parents = <0>, <0>, <0>;
 		assigned-clock-rates = <294912000>,
 				       <270950400>,
 				       <393216000>;
diff --git a/arch/arm64/boot/dts/amlogic/meson-libretech-cottonwood.dtsi b/arch/arm64/boot/dts/amlogic/meson-libretech-cottonwood.dtsi
index ac9c4c2673b1..cb8b0f98beb4 100644
--- a/arch/arm64/boot/dts/amlogic/meson-libretech-cottonwood.dtsi
+++ b/arch/arm64/boot/dts/amlogic/meson-libretech-cottonwood.dtsi
@@ -207,7 +207,6 @@ sound {
 		assigned-clocks = <&clkc CLKID_MPLL2>,
 				  <&clkc CLKID_MPLL0>,
 				  <&clkc CLKID_MPLL1>;
-		assigned-clock-parents = <0>, <0>, <0>;
 		assigned-clock-rates = <294912000>,
 				       <270950400>,
 				       <393216000>;
diff --git a/arch/arm64/boot/dts/amlogic/meson-sm1-a95xf3-air-gbit.dts b/arch/arm64/boot/dts/amlogic/meson-sm1-a95xf3-air-gbit.dts
index 3c43d3490e14..7c67e459c602 100644
--- a/arch/arm64/boot/dts/amlogic/meson-sm1-a95xf3-air-gbit.dts
+++ b/arch/arm64/boot/dts/amlogic/meson-sm1-a95xf3-air-gbit.dts
@@ -29,7 +29,6 @@ sound {
 		assigned-clocks = <&clkc CLKID_MPLL2>,
 				  <&clkc CLKID_MPLL0>,
 				  <&clkc CLKID_MPLL1>;
-		assigned-clock-parents = <0>, <0>, <0>;
 		assigned-clock-rates = <294912000>,
 				       <270950400>,
 				       <393216000>;
diff --git a/arch/arm64/boot/dts/amlogic/meson-sm1-a95xf3-air.dts b/arch/arm64/boot/dts/amlogic/meson-sm1-a95xf3-air.dts
index 445c1671ede7..e841c44c69de 100644
--- a/arch/arm64/boot/dts/amlogic/meson-sm1-a95xf3-air.dts
+++ b/arch/arm64/boot/dts/amlogic/meson-sm1-a95xf3-air.dts
@@ -29,7 +29,6 @@ sound {
 		assigned-clocks = <&clkc CLKID_MPLL2>,
 				  <&clkc CLKID_MPLL0>,
 				  <&clkc CLKID_MPLL1>;
-		assigned-clock-parents = <0>, <0>, <0>;
 		assigned-clock-rates = <294912000>,
 				       <270950400>,
 				       <393216000>;
diff --git a/arch/arm64/boot/dts/amlogic/meson-sm1-bananapi-m2-pro.dts b/arch/arm64/boot/dts/amlogic/meson-sm1-bananapi-m2-pro.dts
index eeaff22edade..8d12bd1702d3 100644
--- a/arch/arm64/boot/dts/amlogic/meson-sm1-bananapi-m2-pro.dts
+++ b/arch/arm64/boot/dts/amlogic/meson-sm1-bananapi-m2-pro.dts
@@ -29,7 +29,6 @@ sound {
 		assigned-clocks = <&clkc CLKID_MPLL2>,
 				  <&clkc CLKID_MPLL0>,
 				  <&clkc CLKID_MPLL1>;
-		assigned-clock-parents = <0>, <0>, <0>;
 		assigned-clock-rates = <294912000>,
 				       <270950400>,
 				       <393216000>;
diff --git a/arch/arm64/boot/dts/amlogic/meson-sm1-bananapi-m5.dts b/arch/arm64/boot/dts/amlogic/meson-sm1-bananapi-m5.dts
index 697855fec476..0cd306569312 100644
--- a/arch/arm64/boot/dts/amlogic/meson-sm1-bananapi-m5.dts
+++ b/arch/arm64/boot/dts/amlogic/meson-sm1-bananapi-m5.dts
@@ -64,7 +64,6 @@ sound {
 		assigned-clocks = <&clkc CLKID_MPLL2>,
 				  <&clkc CLKID_MPLL0>,
 				  <&clkc CLKID_MPLL1>;
-		assigned-clock-parents = <0>, <0>, <0>;
 		assigned-clock-rates = <294912000>,
 				       <270950400>,
 				       <393216000>;
diff --git a/arch/arm64/boot/dts/amlogic/meson-sm1-h96-max.dts b/arch/arm64/boot/dts/amlogic/meson-sm1-h96-max.dts
index 7b3a014d4cde..3c671676e453 100644
--- a/arch/arm64/boot/dts/amlogic/meson-sm1-h96-max.dts
+++ b/arch/arm64/boot/dts/amlogic/meson-sm1-h96-max.dts
@@ -29,7 +29,6 @@ sound {
 		assigned-clocks = <&clkc CLKID_MPLL2>,
 				  <&clkc CLKID_MPLL0>,
 				  <&clkc CLKID_MPLL1>;
-		assigned-clock-parents = <0>, <0>, <0>;
 		assigned-clock-rates = <294912000>,
 				       <270950400>,
 				       <393216000>;
diff --git a/arch/arm64/boot/dts/amlogic/meson-sm1-odroid.dtsi b/arch/arm64/boot/dts/amlogic/meson-sm1-odroid.dtsi
index c4524eb4f099..5cd6a2c13eb1 100644
--- a/arch/arm64/boot/dts/amlogic/meson-sm1-odroid.dtsi
+++ b/arch/arm64/boot/dts/amlogic/meson-sm1-odroid.dtsi
@@ -181,7 +181,6 @@ sound {
 		assigned-clocks = <&clkc CLKID_MPLL2>,
 				  <&clkc CLKID_MPLL0>,
 				  <&clkc CLKID_MPLL1>;
-		assigned-clock-parents = <0>, <0>, <0>;
 		assigned-clock-rates = <294912000>,
 				       <270950400>,
 				       <393216000>;
diff --git a/arch/arm64/boot/dts/amlogic/meson-sm1-sei610.dts b/arch/arm64/boot/dts/amlogic/meson-sm1-sei610.dts
index 024d2eb8e6ee..64b4e4b209b8 100644
--- a/arch/arm64/boot/dts/amlogic/meson-sm1-sei610.dts
+++ b/arch/arm64/boot/dts/amlogic/meson-sm1-sei610.dts
@@ -246,7 +246,6 @@ sound {
 		assigned-clocks = <&clkc CLKID_MPLL2>,
 				  <&clkc CLKID_MPLL0>,
 				  <&clkc CLKID_MPLL1>;
-		assigned-clock-parents = <0>, <0>, <0>;
 		assigned-clock-rates = <294912000>,
 				       <270950400>,
 				       <393216000>;
diff --git a/arch/arm64/boot/dts/amlogic/meson-sm1-x96-air-gbit.dts b/arch/arm64/boot/dts/amlogic/meson-sm1-x96-air-gbit.dts
index e4a3a2a8ad06..ecb6aa79302d 100644
--- a/arch/arm64/boot/dts/amlogic/meson-sm1-x96-air-gbit.dts
+++ b/arch/arm64/boot/dts/amlogic/meson-sm1-x96-air-gbit.dts
@@ -29,7 +29,6 @@ sound {
 		assigned-clocks = <&clkc CLKID_MPLL2>,
 				  <&clkc CLKID_MPLL0>,
 				  <&clkc CLKID_MPLL1>;
-		assigned-clock-parents = <0>, <0>, <0>;
 		assigned-clock-rates = <294912000>,
 				       <270950400>,
 				       <393216000>;
diff --git a/arch/arm64/boot/dts/amlogic/meson-sm1-x96-air.dts b/arch/arm64/boot/dts/amlogic/meson-sm1-x96-air.dts
index fff92e0d6dd5..24a6a679b377 100644
--- a/arch/arm64/boot/dts/amlogic/meson-sm1-x96-air.dts
+++ b/arch/arm64/boot/dts/amlogic/meson-sm1-x96-air.dts
@@ -29,7 +29,6 @@ sound {
 		assigned-clocks = <&clkc CLKID_MPLL2>,
 				  <&clkc CLKID_MPLL0>,
 				  <&clkc CLKID_MPLL1>;
-		assigned-clock-parents = <0>, <0>, <0>;
 		assigned-clock-rates = <294912000>,
 				       <270950400>,
 				       <393216000>;

---
base-commit: 8f0b4cce4481fb22653697cced8d0d04027cb1e8
change-id: 20260114-amlogic-parent-clock-cleanup-5fc20d5c6767

Best regards,
-- 
Jerome


