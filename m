Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AE0F4E77173
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  6 Dec 2024 20:13:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ar5cjjJj/SW4jb4a/jgf7eyFC7/UPWIuLCMDPahqeNQ=; b=ZDJRWLN5zSZ1BinnLu6sm5/wqL
	B2zDaHCDqr/UuycUpfEZlmtwxxTXPlFK6sKxD2/Osiu7j5Li/+Yp7ly0teLVQdIYQq6jUF8nxC+MM
	VBHNW2TJL1oNH3UMjDPfAPIiF+l6GJX8iyNxDv/RdEK0oeaJApZawi7Dc/Tl6QQIRgzdNNDca7itW
	pxPO7lwGU5+LvlT/ndiRoMxtDOvSCTnih8GZNcx00nxyVnClThXpX96A697/jMPcBK1+pKbb0ySqN
	qoNDNacjLnJ36/g04iC5FVejKFVVuv5H8bp1WpdIaPNx5WgtgY77c/V02/5k71BY153tjCxb9trtv
	YaJwXyCA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tJehx-00000002f7O-0fEI;
	Fri, 06 Dec 2024 20:13:49 +0000
Received: from esa.microchip.iphmx.com ([68.232.153.233])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tJeWO-00000002cm1-1DGc
	for linux-arm-kernel@lists.infradead.org;
	Fri, 06 Dec 2024 20:01:53 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1733515313; x=1765051313;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=rba2clRshpQ9VkACsIE74OOQZKCmryDBJCOgqbeMYAM=;
  b=cfCk7qPlFCmIR0I9qWS2FyQTOA6Slw13CQ9DQfEfMUplMxjJJ5rO8fZS
   qW74UI/X8XaGDgLrXIeHLGXZTk9DiImWUcCGk2MvJNMhxbMHEQZVrNi0Q
   Z44xqHBShSmmvPKJbO4eCCZLKSEwL94hJJEPiw0M0JGJXtXBkNbimKGdl
   xxa8bk9W5afRwGoAt8SbdxLv/pV08JjZTD9FbnXj5b1/lkqje5z4r/pTc
   W9dI6n+CR2NrOceyVLTA3i+WGaoxL709S6TIC12F4iSvRu7GsxCr8GEGj
   s3aeqnHqgJH81Ale+N859ivVgGVswOhyDczejOxIUC9UZrH8TaDzEY324
   A==;
X-CSE-ConnectionGUID: /C8EJBR2STyJIMNyJN3YNw==
X-CSE-MsgGUID: CrAWL9axQ4ytAyVzz1wMAA==
X-IronPort-AV: E=Sophos;i="6.12,214,1728975600"; 
   d="scan'208";a="266436387"
X-Amp-Result: SKIPPED(no attachment in message)
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa5.microchip.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256; 06 Dec 2024 13:01:51 -0700
Received: from chn-vm-ex04.mchp-main.com (10.10.85.152) by
 chn-vm-ex04.mchp-main.com (10.10.85.152) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Fri, 6 Dec 2024 13:01:10 -0700
Received: from ryan-Precision-3630-Tower.microchip.com (10.10.85.11) by
 chn-vm-ex04.mchp-main.com (10.10.85.152) with Microsoft SMTP Server id
 15.1.2507.35 via Frontend Transport; Fri, 6 Dec 2024 13:01:10 -0700
From: <Ryan.Wanner@microchip.com>
To: <robh@kernel.org>, <krzk+dt@kernel.org>, <conor+dt@kernel.org>,
	<nicolas.ferre@microchip.com>, <alexandre.belloni@bootlin.com>,
	<claudiu.beznea@tuxon.dev>, <mturquette@baylibre.com>, <sboyd@kernel.org>,
	<arnd@arndb.de>
CC: <dharma.b@microchip.com>, <mihai.sain@microchip.com>,
	<romain.sioen@microchip.com>, <varshini.rajendran@microchip.com>,
	<devicetree@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>, <linux-clk@vger.kernel.org>,
	<linux-gpio@vger.kernel.org>, <linux-spi@vger.kernel.org>,
	<linux-serial@vger.kernel.org>
Subject: [PATCH v3 07/13] dt-bindings: clock: Add SAMA7D65 PMC compatible string
Date: Fri, 6 Dec 2024 12:59:52 -0700
Message-ID: <5252a28531deaee67af1edd8e72d45ca57783464.1733505542.git.Ryan.Wanner@microchip.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1733505542.git.Ryan.Wanner@microchip.com>
References: <cover.1733505542.git.Ryan.Wanner@microchip.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241206_120152_333752_1239BA91 
X-CRM114-Status: UNSURE (   9.13  )
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

Add the `microchip,sama7d65-pmc` compatible string to the existing binding,
since the SAMA7D65 PMC shares the same properties and clock requirements
as the SAMA7G5.

Export MCK3 and MCK5 to be accessed and referenced in DT to assign to
the clocks property for sama7d65 SoC.

Signed-off-by: Dharma Balasubiramani <dharma.b@microchip.com>
Signed-off-by: Ryan Wanner <Ryan.Wanner@microchip.com>
---
 .../devicetree/bindings/clock/atmel,at91rm9200-pmc.yaml       | 2 ++
 include/dt-bindings/clock/at91.h                              | 4 ++++
 2 files changed, 6 insertions(+)

diff --git a/Documentation/devicetree/bindings/clock/atmel,at91rm9200-pmc.yaml b/Documentation/devicetree/bindings/clock/atmel,at91rm9200-pmc.yaml
index c9eb60776b4d..885d47dd5724 100644
--- a/Documentation/devicetree/bindings/clock/atmel,at91rm9200-pmc.yaml
+++ b/Documentation/devicetree/bindings/clock/atmel,at91rm9200-pmc.yaml
@@ -43,6 +43,7 @@ properties:
               - atmel,sama5d4-pmc
               - microchip,sam9x60-pmc
               - microchip,sam9x7-pmc
+              - microchip,sama7d65-pmc
               - microchip,sama7g5-pmc
           - const: syscon
 
@@ -90,6 +91,7 @@ allOf:
             enum:
               - microchip,sam9x60-pmc
               - microchip,sam9x7-pmc
+              - microchip,sama7d65-pmc
               - microchip,sama7g5-pmc
     then:
       properties:
diff --git a/include/dt-bindings/clock/at91.h b/include/dt-bindings/clock/at91.h
index 6ede88c3992d..e37f1b9cdabf 100644
--- a/include/dt-bindings/clock/at91.h
+++ b/include/dt-bindings/clock/at91.h
@@ -42,6 +42,10 @@
 #define PMC_PLLADIV2		(PMC_MAIN + 11)
 #define PMC_LVDSPLL		(PMC_MAIN + 12)
 
+/* SAMA7D65 */
+#define PMC_MCK3               (PMC_MAIN + 13)
+#define PMC_MCK5               (PMC_MAIN + 14)
+
 #ifndef AT91_PMC_MOSCS
 #define AT91_PMC_MOSCS		0		/* MOSCS Flag */
 #define AT91_PMC_LOCKA		1		/* PLLA Lock */
-- 
2.43.0


