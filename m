Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F0222D591A5
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 19 Nov 2024 16:45:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=v0V0J/E/RjNl0KTISTP+7TTsnJmN+to4bHIFsKZKjDs=; b=vlwq1tVQhUqZcP6B6OGc+ks+P8
	gU1mvvhEGrKsGAyf7beeU4w59sn/+9+/Pb4LlVt661vGchXrGSWjScrlp1MfhbOtPowA6w+nZMSzy
	iTYAegMNgtzCdUNTXm2C9UNNz3hXE8HIn9hXHR8JXWSeNeM2G81kzIq8hwa3hh0hlOp5DL0Wt7CnK
	88YoLOMP7PHWW0VLF/xtzNfEWgMYUDhCdz3lKYCo47wDJOdEv2FA5bxtn7076JXylUdguW/eG0Atn
	MjN3Y8aGUAVe79DKuB25dtBFuPtzwM/NLlmOKvCcT8iUIj9WDR4W8RyJ8AJNr/MPh9QQ9y3nt2lYZ
	ydWBed2w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tDRMA-0000000D53j-23Ej;
	Tue, 19 Nov 2024 16:45:38 +0000
Received: from esa.microchip.iphmx.com ([68.232.154.123])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tDRHv-0000000D3dG-3MY9
	for linux-arm-kernel@lists.infradead.org;
	Tue, 19 Nov 2024 16:41:17 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1732034475; x=1763570475;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=Nomp0y3IWPu5mrhOnyPqc6ct3IesvKLO2yuE2yCdDwU=;
  b=Idupk5nvrijKDlV+22kiDnZp4RETaAIlltzG6VambjMWUhfete56roDF
   IuVfwZf8QLfp9uN9DLQUF2kqLq09/9KNxfCYWVDUT0b2KBL8TRKAC3JyZ
   DmIHVgFCl/ZAKeKaG0TDMSPT0XQ8VtvXiPzrgsIXh9w2gGz4TMDhB7uY0
   G2T/ssNALwhuwrthCs9iNJ5G9srdeHpEq2r3IcJG5rb7BgskXDbfZ3Pqz
   d1nDezPMVREunpzsQCiamDXLxtg+WE3QqR/7GvhLkxQtW34RQY/a46TW5
   krfudMvN2WVJ+5RrnSUZgt1lYGPgSlJkWOwgCSJlENlaSlOtmz90OsPIL
   A==;
X-CSE-ConnectionGUID: jnnvkeRdTYaD0RwnHEXOug==
X-CSE-MsgGUID: 6yPcMWbeTRi68yPOKxbpdQ==
X-IronPort-AV: E=Sophos;i="6.12,166,1728975600"; 
   d="scan'208";a="35018889"
X-Amp-Result: SKIPPED(no attachment in message)
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa2.microchip.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256; 19 Nov 2024 09:41:12 -0700
Received: from chn-vm-ex04.mchp-main.com (10.10.85.152) by
 chn-vm-ex04.mchp-main.com (10.10.85.152) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Tue, 19 Nov 2024 09:40:53 -0700
Received: from ryan-Precision-3630-Tower.microchip.com (10.10.85.11) by
 chn-vm-ex04.mchp-main.com (10.10.85.152) with Microsoft SMTP Server id
 15.1.2507.35 via Frontend Transport; Tue, 19 Nov 2024 09:40:53 -0700
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
Subject: [PATCH 03/15] dt-bindings: atmel-sysreg: add sama7d65 RAM and PIT
Date: Tue, 19 Nov 2024 09:40:09 -0700
Message-ID: <01cf1bbae5949cbceb2768f2044377bc2479986b.1732030972.git.Ryan.Wanner@microchip.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1732030972.git.Ryan.Wanner@microchip.com>
References: <cover.1732030972.git.Ryan.Wanner@microchip.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241119_084115_937002_CF749EAF 
X-CRM114-Status: UNSURE (   8.89  )
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
---
 .../devicetree/bindings/arm/atmel-sysregs.txt      | 14 ++++++++------
 1 file changed, 8 insertions(+), 6 deletions(-)

diff --git a/Documentation/devicetree/bindings/arm/atmel-sysregs.txt b/Documentation/devicetree/bindings/arm/atmel-sysregs.txt
index 76e2b7978250..93c2a5a341f3 100644
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
+			"microchip,sama7d65-uddrc","microchip,sama7g5-uddrc" or
 			"microchip,sam9x7-ddramc", "atmel,sama5d3-ddramc".
 - reg: Should contain registers location and length
 
-- 
2.43.0


