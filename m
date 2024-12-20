Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8B21AE77188
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 20 Dec 2024 21:14:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=4CmR2R4wXwiJN4NX+JwFSRuv7Hsn79Inc2BWA7zEjPk=; b=JRtDhtBsFNd189aFIakrvw3J0p
	XNeLPf7giGaOREfPxYNd6oBIxIYpa7xwyQT2ndChouB5j4DNA84m+MQGyWazAMx5S2xpDpVq8lMQe
	/Hj5Dk1Afu2CPyHwzBM2re+HTUdKBqHlYrAHnPjtfgmAERobz/rD2jzSwmcGNZ2+YQaONH/guA3YH
	/7ucEjD8WAiter/Qyljd9pWXqs6s6UI6kRJmnfUJcIUqc+/6fNKHC5/QlxIlqsXQw4ga2jKAF4wNL
	HY4W+O+23eeCMqvO3qn55lQh9W+e+n3qZDZquz/IEa9MWJ2LRAumRhVaOtBiN33a3W4ybKYICbpeT
	T/xPbSFQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tOkJk-000000065Cc-0pFX;
	Fri, 20 Dec 2024 21:13:52 +0000
Received: from esa.microchip.iphmx.com ([68.232.154.123])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tOkFE-000000064PQ-3gu8
	for linux-arm-kernel@lists.infradead.org;
	Fri, 20 Dec 2024 21:09:14 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1734728952; x=1766264952;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=+dtBRZeHFyP3XZQ1AAiTs38oeMsV33YqGXeuMNNfu7Q=;
  b=GWefRCtDVDTk8aziEsIq/3Vj2tPJBvmT7D0Mf+9RxsEjbKhbCgxz5oeF
   KUYOBXho5+XMyAwRvCYJZnw5rJog+sUD9fZ197BNA9XDn9oH9hG94gQ3Q
   MwW38W5PNwpOw5IBbTokMaKdIPQ0xTPdT8ZZ5WDeDJQ2zu0Aye+rbtWJb
   jJvUKO53gyaSVmP+C82K6yBIToz1jZnl5cmGM+szc8puDcwyWtx/fHdEz
   YqG0NwWRZlPIAi6LES5FLyaoNOWYfjhTbmSixamLVnZwqA86tjXJq0fIE
   kzNJ2NwStIAKHRCFSO314I8nA5ZyRD9n7XgjcWSW2b/dwrMHLgqX2CbNs
   w==;
X-CSE-ConnectionGUID: 6Xn2bQedQHqhtDmL7ky2MQ==
X-CSE-MsgGUID: S6aaqUoKRfCZPf7fVqHNVA==
X-IronPort-AV: E=Sophos;i="6.12,251,1728975600"; 
   d="scan'208";a="203274641"
X-Amp-Result: SKIPPED(no attachment in message)
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa6.microchip.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256; 20 Dec 2024 14:09:07 -0700
Received: from chn-vm-ex04.mchp-main.com (10.10.85.152) by
 chn-vm-ex02.mchp-main.com (10.10.85.144) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Fri, 20 Dec 2024 14:08:42 -0700
Received: from ryan-Precision-3630-Tower.microchip.com (10.10.85.11) by
 chn-vm-ex04.mchp-main.com (10.10.85.152) with Microsoft SMTP Server id
 15.1.2507.35 via Frontend Transport; Fri, 20 Dec 2024 14:08:42 -0700
From: <Ryan.Wanner@microchip.com>
To: <robh@kernel.org>, <krzk+dt@kernel.org>, <conor+dt@kernel.org>,
	<nicolas.ferre@microchip.com>, <alexandre.belloni@bootlin.com>,
	<claudiu.beznea@tuxon.dev>, <mturquette@baylibre.com>, <sboyd@kernel.org>,
	<arnd@arndb.de>
CC: <dharma.b@microchip.com>, <mihai.sain@microchip.com>,
	<romain.sioen@microchip.com>, <varshini.rajendran@microchip.com>,
	<devicetree@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>, <linux-clk@vger.kernel.org>,
	<linux-mmc@vger.kernel.org>, <linux-gpio@vger.kernel.org>,
	<linux-spi@vger.kernel.org>, <linux-serial@vger.kernel.org>
Subject: [PATCH v4 03/13] dt-bindings: atmel-sysreg: add sama7d65 RAM and PIT
Date: Fri, 20 Dec 2024 14:07:04 -0700
Message-ID: <c1b5b4a13f31bd465b69547f29e3ed6f616b2e76.1734723585.git.Ryan.Wanner@microchip.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1734723585.git.Ryan.Wanner@microchip.com>
References: <cover.1734723585.git.Ryan.Wanner@microchip.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241220_130912_983214_0C6862BC 
X-CRM114-Status: UNSURE (   8.03  )
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

From: Dharma Balasubiramani <dharma.b@microchip.com>

Add SAMA7D65 RAM controller, PIT64 DT bindings.

Signed-off-by: Dharma Balasubiramani <dharma.b@microchip.com>
Signed-off-by: Ryan Wanner <Ryan.Wanner@microchip.com>
Reviewed-by: Claudiu Beznea <claudiu.beznea@tuxon.dev>
Acked-by: Rob Herring (Arm) <robh@kernel.org>
---
 .../devicetree/bindings/arm/atmel-sysregs.txt      | 14 ++++++++------
 1 file changed, 8 insertions(+), 6 deletions(-)

diff --git a/Documentation/devicetree/bindings/arm/atmel-sysregs.txt b/Documentation/devicetree/bindings/arm/atmel-sysregs.txt
index 76e2b7978250..1a173e92bb13 100644
--- a/Documentation/devicetree/bindings/arm/atmel-sysregs.txt
+++ b/Documentation/devicetree/bindings/arm/atmel-sysregs.txt
@@ -13,6 +13,7 @@ PIT Timer required properties:
 PIT64B Timer required properties:
 - compatible: Should be "microchip,sam9x60-pit64b" or
 			"microchip,sam9x7-pit64b", "microchip,sam9x60-pit64b"
+			"microchip,sama7d65-pit64b", "microchip,sam9x60-pit64b"
 - reg: Should contain registers location and length
 - interrupts: Should contain interrupt for PIT64B timer
 - clocks: Should contain the available clock sources for PIT64B timer.
@@ -27,12 +28,13 @@ Its subnodes can be:
 - watchdog: compatible should be "atmel,at91rm9200-wdt"
 
 RAMC SDRAM/DDR Controller required properties:
-- compatible: Should be "atmel,at91rm9200-sdramc", "syscon"
-			"atmel,at91sam9260-sdramc",
-			"atmel,at91sam9g45-ddramc",
-			"atmel,sama5d3-ddramc",
-			"microchip,sam9x60-ddramc",
-			"microchip,sama7g5-uddrc",
+- compatible: Should be "atmel,at91rm9200-sdramc", "syscon" or
+			"atmel,at91sam9260-sdramc" or
+			"atmel,at91sam9g45-ddramc" or
+			"atmel,sama5d3-ddramc" or
+			"microchip,sam9x60-ddramc" or
+			"microchip,sama7g5-uddrc" or
+			"microchip,sama7d65-uddrc", "microchip,sama7g5-uddrc" or
 			"microchip,sam9x7-ddramc", "atmel,sama5d3-ddramc".
 - reg: Should contain registers location and length
 
-- 
2.43.0


