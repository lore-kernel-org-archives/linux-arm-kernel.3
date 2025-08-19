Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D7B11CA0EFD
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 19 Aug 2025 18:13:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=oZZIdP+oBFimapfXAqXLnsiUg0mGHxd7q9JW+Ig3Zqk=; b=EkS4kXUEjWNuPAqdPIH16wUwYf
	GPVW7MEloHzym0WdpYUbJ+z38PYYX5WT0f8sp0bS6gMgbJkoLPy3LUTlCb33d3u5SrX+YRjfomgD4
	HQ0qLyBWBFCOrQSSDcCXDaipa4zWozoRLzW3XvwaCgr5jyATP9XPwijwzOaLiu0bEUYcpH2WgJ8P3
	j3qe+iBHGRR4Hhew7OjqUVTRHNXkBXChYMezcWwRsn/lgwM6L52XUB6Fcoq8WVWRWkTmsdSj9wSLG
	IluACxDnpCncXoM3OE9PJdkpvWunm+g8Qq2TSsi4x2UjRAPMzOLJnxpc6kwAkeTnVSaF/kWxpvm6Q
	oI1MD6nQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uoQpg-0000000BC7l-0AFi;
	Tue, 19 Aug 2025 18:13:16 +0000
Received: from mail-ej1-x62d.google.com ([2a00:1450:4864:20::62d])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uoMCW-0000000AZ5o-2Zrm
	for linux-arm-kernel@lists.infradead.org;
	Tue, 19 Aug 2025 13:16:33 +0000
Received: by mail-ej1-x62d.google.com with SMTP id a640c23a62f3a-afcb79fb221so72395466b.2
        for <linux-arm-kernel@lists.infradead.org>; Tue, 19 Aug 2025 06:16:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1755609391; x=1756214191; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=oZZIdP+oBFimapfXAqXLnsiUg0mGHxd7q9JW+Ig3Zqk=;
        b=toGNskn5MgvTD4FX+/cGS+r8ss3kOS+l+RGnIHD8f9IV1jPz4vr15fab0YP6KPl0uH
         h1GX2LTmSYJzRZyqb202210e0BCPWg01DWCSo16u0MOa9f+q7GOyqrWK3Zuj4yyT5DuR
         7sunZu9HvC1UhSBBqDb/CdzNdZldgt64hJyKjE/nBFGRND69Nab6vMzkqNQNjDLCFZTV
         9sBGEqbgXx8G0Ecd8Mn5DIP5/yNdmAbXclozbRTv70a8arnCFAKtWYvwOnE/+hHQ6Pft
         wAndrAlULgprnenAcutQrummbweklwgNf1qquFPw4pjqaCWN8ZeaaFuXlGcBdWLbabRr
         iD/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755609391; x=1756214191;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=oZZIdP+oBFimapfXAqXLnsiUg0mGHxd7q9JW+Ig3Zqk=;
        b=JPMlTlUdcpPQB0sH9d+Q5SoHtRUvwLEcdYW63RRcJ43qRaCJjZDsyQ4nUe6YiFvaDd
         gntlk/t3i1TWH0CmBFlQsOvbnT3LCUCeuLA8m7KT8STqv1QEDqafZ6KZnL1uR78zK8Xu
         LIZnloarZc9L7rIxhcbAgv/N+XzQe8YKyFUkHqRG0pKW1Ac+h644ncrCir64JOV49qW9
         zG3GCiIp/r+CbgQlMAkInCdZ2fjl0n+Ofy3E5ttpy6OyXRs/Om0zcK4i/O631qIGr+2/
         6wq+JMN6PDpchR76BXhsgkHADAQnrjBcbcj/fRqbkzERJCoY4WR4BKohiGOUyJXFXjLC
         hR9w==
X-Forwarded-Encrypted: i=1; AJvYcCVa9uF4SUpOvrWVm/BkrVgUP/Upo5Zx9bDzHpqYY20yzTRkqm/GfMWCef+zG32Kb1X+UwaIlk88MiOR7S/8rLq4@lists.infradead.org
X-Gm-Message-State: AOJu0Yys4taL7Y+YeKzdIp2u/FIn+1sPhHxENUWUs1wmSP+fL1IKed53
	UVIEtGdJKDMmK3QSOpq72GNXi486bZuv3GBzcZGEoBIlpR7r2QLtQScWgmSbolrYggs=
X-Gm-Gg: ASbGnct17Px23AmlH/MW3IwXQRACWFzbXH5a7l862mt0L2GyL2tUcJo521zggMAP48x
	L5ZH0zfeCVSOUrYlw7cKL88GdpdKVQInCwTHg7o8uobd3fwxsKV3URYAMxbx4lNcC64vMwUxxBq
	jfKskgH3AUribcXivF1OKsMiIS/IJm9gkhsZ2Lkq4H+yQFIZrUHQ53qhr2C8wB2hiR9jspSZfi9
	/BxLWlUUm91Y0/S3Sui3IglAcVnh00piw1i9NKruJOPf3C8LlHkQjj6SAA1BiDC69mBerFDpjsH
	/exCRNfPbmfP5rzCVuMXqBBTe496U3Hcw0dbxrcWwV/Oz4rRjg9FIlC8JE+lsV69A7CwTvLmP0b
	92dj9uehysq32NK0OP7Jc7ZQ9tbSwo/QM/A==
X-Google-Smtp-Source: AGHT+IEpObl3AXqG5YLwGioik5GupCpWPb0I5hX7zakwD7RPUsahBj7xHDVrUgh2Vb0G+dzv1Jp3Uw==
X-Received: by 2002:a17:907:86a4:b0:ad8:9207:b436 with SMTP id a640c23a62f3a-afddd0c7d0bmr118076766b.5.1755609391064;
        Tue, 19 Aug 2025 06:16:31 -0700 (PDT)
Received: from kuoka.. ([178.197.219.123])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-afcdd010d4csm988721666b.85.2025.08.19.06.16.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 19 Aug 2025 06:16:30 -0700 (PDT)
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
Subject: [PATCH] arm64: dts: mediatek: Minor whitespace cleanup
Date: Tue, 19 Aug 2025 15:16:27 +0200
Message-ID: <20250819131626.86437-2-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.48.1
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=4619; i=krzysztof.kozlowski@linaro.org;
 h=from:subject; bh=y7xStFE0NPIkxi9Pu680sxAPkxq15o/aAJd/KvC53fU=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBopHkqIAFaQMi6BKsdOrJ8UDRbfn4vqnrFDGbrN
 xSLPx67B5aJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCaKR5KgAKCRDBN2bmhouD
 18ZuD/0cgDdl1OlZpiiI58Xe1O/d1MRcs7ODqESE1H53OSKkPjVj+Nvo3yifk8r2Cwr83p0DLHu
 SwlQLCZE/TyxzbWtWec1WsG2peVHMfYpDOJY5HzZmLHOXuB+u8oqWfpg+JBdbymqF98iZDbM7AU
 N3UQTzl81ZmerRBZSsBTv7tb7PIKtu1oSjpl/DB01EfmjdoV/dlb1Kw/P8Rzg69AxooAn2//vLW
 zvQ5+Q91CoYD8D9NU9L0rAuXnzhqLw1z1vL3El1L3T4i4lYvo+gL55yoZTQ11BklEzPmL9MK/or
 Q4f+QbDVhQRrBJJsbv0tw3CniZd3d2FMksMH3Ogxxrd/JBKhYpXNp1YY1U6kFvy6HoPtJTwFOhX
 b5x84gZ0b3HqsY12RyvG0PTzinl4ZtwaQiIhYsiAJ3jH8Upm10jj3MzBm1VH7O0ChZn4EkLGHCu
 lz3+a5YIcbLSHgDCYn9jpMjc5n5lwF5BTG3jZqMLRQKmO4ifFTPf/qJNYLl9C2cQYcU8p760Upa
 iq1Tg9Gh19osc/k8MnQm/F47iuDl8KpUytL9QcK7LG61T4h9ZoFyp5F0QA+ieryGdwOPW+k09Xa
 ARtd+Zx+NOXEKTZlNIUgtOa4Iz5uWYNZGloOeVU/DuFhpuLWP6xt2vEUBXP/TsjP86FCRwEU9Ec smZe34u2DJppFLw==
X-Developer-Key: i=krzysztof.kozlowski@linaro.org; a=openpgp; fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250819_061632_655611_ABA0550B 
X-CRM114-Status: GOOD (  12.87  )
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

The DTS code coding style expects exactly one space around '='
character.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 arch/arm64/boot/dts/mediatek/mt7988a.dtsi                 | 2 +-
 arch/arm64/boot/dts/mediatek/mt8188.dtsi                  | 8 ++++----
 arch/arm64/boot/dts/mediatek/mt8365.dtsi                  | 2 +-
 arch/arm64/boot/dts/mediatek/mt8390-genio-common.dtsi     | 4 ++--
 arch/arm64/boot/dts/mediatek/mt8395-genio-1200-evk.dts    | 2 +-
 .../boot/dts/mediatek/mt8395-kontron-3-5-sbc-i1200.dts    | 2 +-
 6 files changed, 10 insertions(+), 10 deletions(-)

diff --git a/arch/arm64/boot/dts/mediatek/mt7988a.dtsi b/arch/arm64/boot/dts/mediatek/mt7988a.dtsi
index 560ec86dbec0..2e108aad8aec 100644
--- a/arch/arm64/boot/dts/mediatek/mt7988a.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt7988a.dtsi
@@ -253,7 +253,7 @@ mux {
 			uart0_pins: uart0-pins {
 				mux {
 					function = "uart";
-					groups =  "uart0";
+					groups = "uart0";
 				};
 			};
 		};
diff --git a/arch/arm64/boot/dts/mediatek/mt8188.dtsi b/arch/arm64/boot/dts/mediatek/mt8188.dtsi
index 202478407727..ef18117dc5d6 100644
--- a/arch/arm64/boot/dts/mediatek/mt8188.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt8188.dtsi
@@ -1152,9 +1152,9 @@ power-domain@MT8188_POWER_DOMAIN_CAM_MAIN {
 									 <&camsys CLK_CAM_MAIN_CAM2MM0_GALS>,
 									 <&camsys CLK_CAM_MAIN_CAM2MM1_GALS>,
 									 <&camsys CLK_CAM_MAIN_CAM2SYS_GALS>;
-								clock-names= "ss-cam-l13", "ss-cam-l14",
-									     "ss-cam-mm0", "ss-cam-mm1",
-									     "ss-camsys";
+								clock-names = "ss-cam-l13", "ss-cam-l14",
+									      "ss-cam-mm0", "ss-cam-mm1",
+									      "ss-camsys";
 								mediatek,infracfg = <&infracfg_ao>;
 								#address-cells = <1>;
 								#size-cells = <0>;
@@ -1172,7 +1172,7 @@ power-domain@MT8188_POWER_DOMAIN_CAM_SUBB {
 								};
 
 								power-domain@MT8188_POWER_DOMAIN_CAM_SUBA {
-									reg =<MT8188_POWER_DOMAIN_CAM_SUBA>;
+									reg = <MT8188_POWER_DOMAIN_CAM_SUBA>;
 									clocks = <&camsys CLK_CAM_MAIN_CAM_SUBA>,
 										 <&camsys_rawa CLK_CAM_RAWA_LARBX>,
 										 <&camsys_yuva CLK_CAM_YUVA_LARBX>;
diff --git a/arch/arm64/boot/dts/mediatek/mt8365.dtsi b/arch/arm64/boot/dts/mediatek/mt8365.dtsi
index e6d2b3221a3b..9d6b5ce8c421 100644
--- a/arch/arm64/boot/dts/mediatek/mt8365.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt8365.dtsi
@@ -780,7 +780,7 @@ mmsys_ext: endpoint@1 {
 		};
 
 		mutex: mutex@14001000 {
-			compatible =  "mediatek,mt8365-disp-mutex";
+			compatible = "mediatek,mt8365-disp-mutex";
 			reg = <0 0x14001000 0 0x1000>;
 			interrupts = <GIC_SPI 154 IRQ_TYPE_LEVEL_LOW>;
 			power-domains = <&spm MT8365_POWER_DOMAIN_MM>;
diff --git a/arch/arm64/boot/dts/mediatek/mt8390-genio-common.dtsi b/arch/arm64/boot/dts/mediatek/mt8390-genio-common.dtsi
index a2cdecd2b903..18b2771e7705 100644
--- a/arch/arm64/boot/dts/mediatek/mt8390-genio-common.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt8390-genio-common.dtsi
@@ -414,7 +414,7 @@ connector {
 			data-role = "dual";
 			op-sink-microwatt = <10000000>;
 			power-role = "dual";
-			try-power-role  = "sink";
+			try-power-role = "sink";
 			pd-revision = /bits/ 8 <0x03 0x00 0x01 0x08>;
 
 			sink-pdos = <PDO_FIXED(5000, 2000,
@@ -1130,7 +1130,7 @@ pins-wifi-enable {
 };
 
 &eth {
-	phy-mode ="rgmii-id";
+	phy-mode = "rgmii-id";
 	phy-handle = <&ethernet_phy0>;
 	pinctrl-names = "default", "sleep";
 	pinctrl-0 = <&eth_default_pins>;
diff --git a/arch/arm64/boot/dts/mediatek/mt8395-genio-1200-evk.dts b/arch/arm64/boot/dts/mediatek/mt8395-genio-1200-evk.dts
index cf8cd37f5708..58ce34e7fde8 100644
--- a/arch/arm64/boot/dts/mediatek/mt8395-genio-1200-evk.dts
+++ b/arch/arm64/boot/dts/mediatek/mt8395-genio-1200-evk.dts
@@ -263,7 +263,7 @@ dsi0_out: endpoint {
 };
 
 &eth {
-	phy-mode ="rgmii-rxid";
+	phy-mode = "rgmii-rxid";
 	phy-handle = <&eth_phy0>;
 	snps,reset-gpio = <&pio 93 GPIO_ACTIVE_HIGH>;
 	snps,reset-delays-us = <0 10000 10000>;
diff --git a/arch/arm64/boot/dts/mediatek/mt8395-kontron-3-5-sbc-i1200.dts b/arch/arm64/boot/dts/mediatek/mt8395-kontron-3-5-sbc-i1200.dts
index 4985b65925a9..1a89de14ac3a 100644
--- a/arch/arm64/boot/dts/mediatek/mt8395-kontron-3-5-sbc-i1200.dts
+++ b/arch/arm64/boot/dts/mediatek/mt8395-kontron-3-5-sbc-i1200.dts
@@ -266,7 +266,7 @@ &auxadc {
 };
 
 &eth {
-	phy-mode ="rgmii-id";
+	phy-mode = "rgmii-id";
 	phy-handle = <&ethernet_phy0>;
 	pinctrl-names = "default", "sleep";
 	pinctrl-0 = <&eth_default_pins>;
-- 
2.48.1


