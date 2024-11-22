Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9F102E65D2F
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 22 Nov 2024 08:07:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=0w+H/2Uxz7z1coSeJdUvGKgQ3MYSz5iCd04QrYz3DlQ=; b=NEYP3do1yK+DBkZi3RYEzQm7Rq
	paLgXkdmAwV9KRM2ivV45haRWHQjMB0UOavlSdX/nnhdZJqFJF093R5uztUfwdXpzdn1VU45ec8yB
	b4bPRSgFM/YcozoUfqqCl7zuVOoBaye2Tk8P6FVrQVrtTHpwvw21Bjw6EjO8uHOZw1Zhgz5xNijcQ
	kbGtTJbbpwGQlPNwca/rIuX/KOCz6XSV/t6qzsuWvPZcSgm3FCKE2oCoA+LSzFTXwgNJU7LaTmGMB
	E8316wpqiOtnCziloOJo2emnnqzc12lIx/2ySuej3nJzAc50b7U6G2dl5YjOyGMjNBqPeu8zmv3XI
	TgtHcLvw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tEOhf-00000001t2n-3ZAw;
	Fri, 22 Nov 2024 08:07:47 +0000
Received: from esa.microchip.iphmx.com ([68.232.153.233])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tEOfp-00000001sf2-0XRN
	for linux-arm-kernel@lists.infradead.org;
	Fri, 22 Nov 2024 08:05:54 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1732262754; x=1763798754;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=Q0ovU3OhZyQAKh6JD8vsd/LxmR77/KK30xGFf4W2R0Y=;
  b=Gdt/IWyikzUOkE7kcY3ag8pCF55vnQdr1oBG9S4KHhzliWQV5A+l7NaV
   U2yLUt/qqV86WZkSjFG0iI5qD5GG9bxjK+gewwbNyKCTV4UijLp8JsQxL
   nww/bln2GOvh/SbBo1fXKhIJhyt8dVJ2R0GVW29Qcs6Crsj7Zy3XeLfFT
   qYONsKlrk/khsUh6RWkjrDeSWhdRqdB+9v99UEm9MtXfcDncKU2rBYvbr
   OyeyXGC0WNifSID/HoKQ76kUHb7zFUIJ2hmXjCDy78bXbMAoWhnK6m2ue
   bdKlPN1lMKPI5nWbc/gvSY70igZt8q7KvA8ZmW29CDiOKfddUYjmkvggh
   Q==;
X-CSE-ConnectionGUID: seBZEJAOQsKqub7xMw7SQA==
X-CSE-MsgGUID: 6ch+yPC7SWGGP1PoJryrgg==
X-IronPort-AV: E=Sophos;i="6.12,175,1728975600"; 
   d="scan'208";a="34661813"
X-Amp-Result: SKIPPED(no attachment in message)
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa3.microchip.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256; 22 Nov 2024 01:05:51 -0700
Received: from chn-vm-ex02.mchp-main.com (10.10.87.72) by
 chn-vm-ex02.mchp-main.com (10.10.87.72) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Fri, 22 Nov 2024 01:05:44 -0700
Received: from archlinux.microchip.com (10.10.85.11) by
 chn-vm-ex02.mchp-main.com (10.10.85.144) with Microsoft SMTP Server id
 15.1.2507.35 via Frontend Transport; Fri, 22 Nov 2024 01:05:42 -0700
From: Mihai Sain <mihai.sain@microchip.com>
To: <robh@kernel.org>, <krzk+dt@kernel.org>, <conor+dt@kernel.org>,
	<nicolas.ferre@microchip.com>, <alexandre.belloni@bootlin.com>,
	<claudiu.beznea@tuxon.dev>, <devicetree@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>
CC: Mihai Sain <mihai.sain@microchip.com>
Subject: [PATCH 1/2] ARM: dts: microchip: sam9x7: Move i2c address/size to dtsi
Date: Fri, 22 Nov 2024 10:05:22 +0200
Message-ID: <20241122080523.3941-2-mihai.sain@microchip.com>
X-Mailer: git-send-email 2.47.0
In-Reply-To: <20241122080523.3941-1-mihai.sain@microchip.com>
References: <20241122080523.3941-1-mihai.sain@microchip.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241122_000553_220901_ED28E728 
X-CRM114-Status: GOOD (  10.16  )
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

Since these properties are common for all i2c subnodes,
move them to SoC dtsi from board dts.

Signed-off-by: Mihai Sain <mihai.sain@microchip.com>
---
 .../dts/microchip/at91-sam9x75_curiosity.dts  |  2 --
 arch/arm/boot/dts/microchip/sam9x7.dtsi       | 26 +++++++++++++++++++
 2 files changed, 26 insertions(+), 2 deletions(-)

diff --git a/arch/arm/boot/dts/microchip/at91-sam9x75_curiosity.dts b/arch/arm/boot/dts/microchip/at91-sam9x75_curiosity.dts
index 87b6ea97590b..d453800f8e35 100644
--- a/arch/arm/boot/dts/microchip/at91-sam9x75_curiosity.dts
+++ b/arch/arm/boot/dts/microchip/at91-sam9x75_curiosity.dts
@@ -88,8 +88,6 @@ &flx6 {
 };
 
 &i2c6 {
-	#address-cells = <1>;
-	#size-cells = <0>;
 	pinctrl-names = "default";
 	pinctrl-0 = <&pinctrl_flx6_default>;
 	i2c-analog-filter;
diff --git a/arch/arm/boot/dts/microchip/sam9x7.dtsi b/arch/arm/boot/dts/microchip/sam9x7.dtsi
index beb1f34b38d3..aedba0a8318f 100644
--- a/arch/arm/boot/dts/microchip/sam9x7.dtsi
+++ b/arch/arm/boot/dts/microchip/sam9x7.dtsi
@@ -151,6 +151,8 @@ i2c4: i2c@600 {
 				compatible = "microchip,sam9x7-i2c", "microchip,sam9x60-i2c";
 				reg = <0x600 0x200>;
 				interrupts = <13 IRQ_TYPE_LEVEL_HIGH 7>;
+				#address-cells = <1>;
+				#size-cells = <0>;
 				clocks = <&pmc PMC_TYPE_PERIPHERAL 13>;
 				dmas = <&dma0
 					(AT91_XDMAC_DT_MEM_IF(0) |
@@ -220,6 +222,8 @@ i2c5: i2c@600 {
 				compatible = "microchip,sam9x7-i2c", "microchip,sam9x60-i2c";
 				reg = <0x600 0x200>;
 				interrupts = <14 IRQ_TYPE_LEVEL_HIGH 7>;
+				#address-cells = <1>;
+				#size-cells = <0>;
 				clocks = <&pmc PMC_TYPE_PERIPHERAL 14>;
 				dmas = <&dma0
 					(AT91_XDMAC_DT_MEM_IF(0) |
@@ -312,6 +316,8 @@ i2c11: i2c@600 {
 				compatible = "microchip,sam9x7-i2c", "microchip,sam9x60-i2c";
 				reg = <0x600 0x200>;
 				interrupts = <32 IRQ_TYPE_LEVEL_HIGH 7>;
+				#address-cells = <1>;
+				#size-cells = <0>;
 				clocks = <&pmc PMC_TYPE_PERIPHERAL 32>;
 				dmas = <&dma0
 					(AT91_XDMAC_DT_MEM_IF(0) |
@@ -362,6 +368,8 @@ i2c12: i2c@600 {
 				compatible = "microchip,sam9x7-i2c", "microchip,sam9x60-i2c";
 				reg = <0x600 0x200>;
 				interrupts = <33 IRQ_TYPE_LEVEL_HIGH 7>;
+				#address-cells = <1>;
+				#size-cells = <0>;
 				clocks = <&pmc PMC_TYPE_PERIPHERAL 33>;
 				dmas = <&dma0
 					(AT91_XDMAC_DT_MEM_IF(0) |
@@ -533,6 +541,8 @@ i2c6: i2c@600 {
 				compatible = "microchip,sam9x7-i2c", "microchip,sam9x60-i2c";
 				reg = <0x600 0x200>;
 				interrupts = <9 IRQ_TYPE_LEVEL_HIGH 7>;
+				#address-cells = <1>;
+				#size-cells = <0>;
 				clocks = <&pmc PMC_TYPE_PERIPHERAL 9>;
 				dmas = <&dma0
 					(AT91_XDMAC_DT_MEM_IF(0) |
@@ -583,6 +593,8 @@ i2c7: i2c@600 {
 				compatible = "microchip,sam9x7-i2c", "microchip,sam9x60-i2c";
 				reg = <0x600 0x200>;
 				interrupts = <10 IRQ_TYPE_LEVEL_HIGH 7>;
+				#address-cells = <1>;
+				#size-cells = <0>;
 				clocks = <&pmc PMC_TYPE_PERIPHERAL 10>;
 				dmas = <&dma0
 					(AT91_XDMAC_DT_MEM_IF(0) |
@@ -633,6 +645,8 @@ i2c8: i2c@600 {
 				compatible = "microchip,sam9x7-i2c", "microchip,sam9x60-i2c";
 				reg = <0x600 0x200>;
 				interrupts = <11 IRQ_TYPE_LEVEL_HIGH 7>;
+				#address-cells = <1>;
+				#size-cells = <0>;
 				clocks = <&pmc PMC_TYPE_PERIPHERAL 11>;
 				dmas = <&dma0
 					(AT91_XDMAC_DT_MEM_IF(0) |
@@ -702,6 +716,8 @@ i2c0: i2c@600 {
 				compatible = "microchip,sam9x7-i2c", "microchip,sam9x60-i2c";
 				reg = <0x600 0x200>;
 				interrupts = <5 IRQ_TYPE_LEVEL_HIGH 7>;
+				#address-cells = <1>;
+				#size-cells = <0>;
 				clocks = <&pmc PMC_TYPE_PERIPHERAL 5>;
 				dmas = <&dma0
 					(AT91_XDMAC_DT_MEM_IF(0) |
@@ -771,6 +787,8 @@ i2c1: i2c@600 {
 				compatible = "microchip,sam9x7-i2c", "microchip,sam9x60-i2c";
 				reg = <0x600 0x200>;
 				interrupts = <6 IRQ_TYPE_LEVEL_HIGH 7>;
+				#address-cells = <1>;
+				#size-cells = <0>;
 				clocks = <&pmc PMC_TYPE_PERIPHERAL 6>;
 				dmas = <&dma0
 					(AT91_XDMAC_DT_MEM_IF(0) |
@@ -840,6 +858,8 @@ i2c2: i2c@600 {
 				compatible = "microchip,sam9x7-i2c", "microchip,sam9x60-i2c";
 				reg = <0x600 0x200>;
 				interrupts = <7 IRQ_TYPE_LEVEL_HIGH 7>;
+				#address-cells = <1>;
+				#size-cells = <0>;
 				clocks = <&pmc PMC_TYPE_PERIPHERAL 7>;
 				dmas = <&dma0
 					(AT91_XDMAC_DT_MEM_IF(0) |
@@ -909,6 +929,8 @@ i2c3: i2c@600 {
 				compatible = "microchip,sam9x7-i2c", "microchip,sam9x60-i2c";
 				reg = <0x600 0x200>;
 				interrupts = <8 IRQ_TYPE_LEVEL_HIGH 7>;
+				#address-cells = <1>;
+				#size-cells = <0>;
 				clocks = <&pmc PMC_TYPE_PERIPHERAL 8>;
 				dmas = <&dma0
 					(AT91_XDMAC_DT_MEM_IF(0) |
@@ -984,6 +1006,8 @@ i2c9: i2c@600 {
 				compatible = "microchip,sam9x7-i2c", "microchip,sam9x60-i2c";
 				reg = <0x600 0x200>;
 				interrupts = <15 IRQ_TYPE_LEVEL_HIGH 7>;
+				#address-cells = <1>;
+				#size-cells = <0>;
 				clocks = <&pmc PMC_TYPE_PERIPHERAL 15>;
 				dmas = <&dma0
 					(AT91_XDMAC_DT_MEM_IF(0) |
@@ -1034,6 +1058,8 @@ i2c10: i2c@600 {
 				compatible = "microchip,sam9x7-i2c", "microchip,sam9x60-i2c";
 				reg = <0x600 0x200>;
 				interrupts = <16 IRQ_TYPE_LEVEL_HIGH 7>;
+				#address-cells = <1>;
+				#size-cells = <0>;
 				clocks = <&pmc PMC_TYPE_PERIPHERAL 16>;
 				dmas = <&dma0
 					(AT91_XDMAC_DT_MEM_IF(0) |
-- 
2.47.0


