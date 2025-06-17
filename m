Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D3C1AC7115B
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 17 Jun 2025 17:12:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+pGDmcxmLZmMS7/Xi7fQD5Ikq5ZrlRKHQMOKHSaycmM=; b=HyP/S1V4XzJqHGmafdrHtp5VJ+
	a7xGPMy6CWCXGDKKL3CnMfxvo0bp3rXZN5RCcPzKaduJ3JITjjhflkayBG3yqKAKPtdqMV9wKPsXw
	df0VQ8OzVtadMuuLW6MR/M3VN8PXaZgVOMVgNegdQAc9STpuImMmWVvXOrNaqJi93fYRRqrDk3K6j
	wRjWZMplA71KirXg/1BBPCzQlF79jjehD6xtFc66z0ZTKy43Btwon0c+CwA1YL+QPFtk1IcLJR+Jm
	KIHaCRug8yoy3XumB1LDhZFfsyQgsnZofoDmRI2/+xX4MAGc4/l2tpTf+H8jpR3ZeWtOx3RcjUvW9
	t0E6fNNA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uRZrL-00000007zv4-1tpr;
	Tue, 17 Jun 2025 17:12:31 +0000
Received: from esa.microchip.iphmx.com ([68.232.154.123])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uRYrk-00000007py9-3iEB
	for linux-arm-kernel@lists.infradead.org;
	Tue, 17 Jun 2025 16:08:53 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1750176532; x=1781712532;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=4i2WXR/m+DKZimuqrflK/Htmu3/SzQoc8EbGnqOF56c=;
  b=qchgfUm/ifJAUx1aNIZrxpKLkyji7u3TceBdX5YqXl534imitO91uFCA
   wOYGMtB6PfUcw+5tJbk3i0s45vqcGUIo3v4zf/VS3Bg6GCtBy8mqIHsvT
   sIvVaYFTjIupH2HsVGyBaMnrHLySNBfmvY8MbSCEhbYqOylOi4Cth2CUq
   DhjjauyyMDQYudU7LXDm/lvZ8XQycJ6rI9vZg1uvIVyRUUcoxgTTd+/Q4
   bfCrHOCKpUaqiHM3YuxkpEmQZw53vyX/Tp1de4DoSXiC+HCZcA7/9HOKI
   f5rAxfVfNr8h2rkrskjIf/8iBT77p9mruwV+tKAjF3eP29CnZYckwwg8d
   g==;
X-CSE-ConnectionGUID: nTbCTdliQ7eOQ0UC/OTqRA==
X-CSE-MsgGUID: B0b4be4rQZaj37P5HU+uOw==
X-IronPort-AV: E=Sophos;i="6.16,243,1744095600"; 
   d="scan'208";a="210388666"
X-Amp-Result: SKIPPED(no attachment in message)
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa6.microchip.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256; 17 Jun 2025 09:08:47 -0700
Received: from chn-vm-ex02.mchp-main.com (10.10.85.144) by
 chn-vm-ex04.mchp-main.com (10.10.85.152) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Tue, 17 Jun 2025 09:08:24 -0700
Received: from ryan-Precision-3630-Tower.microchip.com (10.10.85.11) by
 chn-vm-ex02.mchp-main.com (10.10.85.144) with Microsoft SMTP Server id
 15.1.2507.44 via Frontend Transport; Tue, 17 Jun 2025 09:08:24 -0700
From: <Ryan.Wanner@microchip.com>
To: <robh@kernel.org>, <krzk+dt@kernel.org>, <conor+dt@kernel.org>,
	<nicolas.ferre@microchip.com>, <alexandre.belloni@bootlin.com>,
	<claudiu.beznea@tuxon.dev>
CC: <devicetree@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>, Ryan Wanner <Ryan.Wanner@microchip.com>
Subject: [PATCH v5 1/3] ARM: dts: microchip: sama7g5: Adjust clock xtal phandle
Date: Tue, 17 Jun 2025 09:08:40 -0700
Message-ID: <8a9ece664958d07b1be73b4b6676a2a2ee397a94.1750175453.git.Ryan.Wanner@microchip.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1750175453.git.Ryan.Wanner@microchip.com>
References: <cover.1750175453.git.Ryan.Wanner@microchip.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250617_090852_989009_AE173527 
X-CRM114-Status: UNSURE (   9.62  )
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

From: Ryan Wanner <Ryan.Wanner@microchip.com>

Adjust clock xtal phandles to match the new xtal phandle formatting.

Signed-off-by: Ryan Wanner <Ryan.Wanner@microchip.com>
---
 arch/arm/boot/dts/microchip/at91-sama7g5ek.dts | 18 ++++++++----------
 arch/arm/boot/dts/microchip/sama7g5.dtsi       |  9 ++++++---
 2 files changed, 14 insertions(+), 13 deletions(-)

diff --git a/arch/arm/boot/dts/microchip/at91-sama7g5ek.dts b/arch/arm/boot/dts/microchip/at91-sama7g5ek.dts
index 2543599013b1..3924f62ff0fb 100644
--- a/arch/arm/boot/dts/microchip/at91-sama7g5ek.dts
+++ b/arch/arm/boot/dts/microchip/at91-sama7g5ek.dts
@@ -35,16 +35,6 @@ aliases {
 		i2c2 = &i2c9;
 	};
 
-	clocks {
-		slow_xtal {
-			clock-frequency = <32768>;
-		};
-
-		main_xtal {
-			clock-frequency = <24000000>;
-		};
-	};
-
 	gpio-keys {
 		compatible = "gpio-keys";
 
@@ -556,6 +546,10 @@ &i2s0 {
 	pinctrl-0 = <&pinctrl_i2s0_default>;
 };
 
+&main_xtal {
+	clock-frequency = <24000000>;
+};
+
 &pdmc0 {
 	#sound-dai-cells = <0>;
 	microchip,mic-pos = <MCHP_PDMC_DS0 MCHP_PDMC_CLK_NEGATIVE>, /* MIC 1 */
@@ -885,6 +879,10 @@ input@0 {
 	};
 };
 
+&slow_xtal {
+	clock-frequency = <32768>;
+};
+
 &spdifrx {
 	pinctrl-names = "default";
 	pinctrl-0 = <&pinctrl_spdifrx_default>;
diff --git a/arch/arm/boot/dts/microchip/sama7g5.dtsi b/arch/arm/boot/dts/microchip/sama7g5.dtsi
index 17bcdcf0cf4a..e128074137e0 100644
--- a/arch/arm/boot/dts/microchip/sama7g5.dtsi
+++ b/arch/arm/boot/dts/microchip/sama7g5.dtsi
@@ -117,19 +117,22 @@ map1 {
 	};
 
 	clocks {
-		slow_xtal: slow_xtal {
+		slow_xtal: clock-slowxtal {
 			compatible = "fixed-clock";
+			clock-output-names = "slow_xtal";
 			#clock-cells = <0>;
 		};
 
-		main_xtal: main_xtal {
+		main_xtal: clock-mainxtal {
 			compatible = "fixed-clock";
+			clock-output-names = "main_xtal";
 			#clock-cells = <0>;
 		};
 
-		usb_clk: usb_clk {
+		usb_clk: clock-usbclk {
 			compatible = "fixed-clock";
 			#clock-cells = <0>;
+			clock-output-names = "usb_clk";
 			clock-frequency = <48000000>;
 		};
 	};
-- 
2.43.0


