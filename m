Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DB2F4D591A5
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 19 Nov 2024 16:44:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ytIGD57l/qU7ka2HlL/AE1aRNZJi09zvc8h/pN3YoZ0=; b=xKe/3ujcVf0h94dqOPh4Tz7YgK
	gjIQNbtCTi9JVOBkTgnd3jtULe/yQ2oiVJpH6k1pNOm8T5wXF0T7kqOsogmEb1FLa0uqtGXGAo0sd
	O99fCaVA1o/bdUPHrpOCmiqYue0sdEL4vx58QvbszbvzUTBDHTUwCs0HNyRhgEo9iePBkidKJTm3W
	Z0fp7T+RMtWyGeAHsafWBue6TuXZy3UK7h1npu7LF0lRpJrUA0YhFDuUcGDOdey/UrS8M6VX9VWUR
	xHB3gqQxcd5hau8u3C3kxRlaQk7hxpTzNZu3CicL2Fl47cSKJbViyfAKB52UzhQk4oipjHmynUX0h
	JXIBTt4Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tDRLF-0000000D4bR-3RAg;
	Tue, 19 Nov 2024 16:44:41 +0000
Received: from esa.microchip.iphmx.com ([68.232.154.123])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tDRHv-0000000D3dm-0SLd
	for linux-arm-kernel@lists.infradead.org;
	Tue, 19 Nov 2024 16:41:16 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1732034475; x=1763570475;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=MThjkfqzIvdJ/MOCxrc2C9byUTY7JWU+MQRrj67qh1w=;
  b=ZWGDEEaHbgOZc78FO42qSncu8/3a/S1G3fy/CP6G2b3qIkmvWyLC+fcV
   iWl9ZTye50JmmuZb9vMvPuQgLJujtrBkI+OAz1kCjpUI2CqSwlgEPUi9l
   JVDuLTBFffQ7o79hjzKTCg3UB2uKxdbdx8g3Wam/MWYdzVy4I4bSRDXNb
   rcUa89ARINlVUfIjff1NQbAS/F9IzY6+J4SnO600pnVeOy+Eh7ash7bCR
   TZ4ZltsvBYGhGa2noBZ611ZNBlL/MSLHFDHOU8bGfVluJti5OOeBqskLT
   7kijDP+U/HN1tcMolX0gNM1DbA0wF0PjoQY5CoJrxorpSbwqAlu8nzmm0
   g==;
X-CSE-ConnectionGUID: jnnvkeRdTYaD0RwnHEXOug==
X-CSE-MsgGUID: ijX61MEpTlmKU0GPrYl64w==
X-IronPort-AV: E=Sophos;i="6.12,166,1728975600"; 
   d="scan'208";a="35018888"
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
Subject: [PATCH 02/15] dt-bindings: mfd: atmel,sama5d2-flexcom: add microchip,sama7d65-flexcom
Date: Tue, 19 Nov 2024 09:40:08 -0700
Message-ID: <46928aa2d15d05fa3046c270a51a10cd56c2e919.1732030972.git.Ryan.Wanner@microchip.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1732030972.git.Ryan.Wanner@microchip.com>
References: <cover.1732030972.git.Ryan.Wanner@microchip.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241119_084115_203313_0D68E10B 
X-CRM114-Status: UNSURE (   8.61  )
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

Add flexcom binding documentation for sama7d65.

Signed-off-by: Dharma Balasubiramani <dharma.b@microchip.com>
---
 .../devicetree/bindings/mfd/atmel,sama5d2-flexcom.yaml   | 9 ++++-----
 1 file changed, 4 insertions(+), 5 deletions(-)

diff --git a/Documentation/devicetree/bindings/mfd/atmel,sama5d2-flexcom.yaml b/Documentation/devicetree/bindings/mfd/atmel,sama5d2-flexcom.yaml
index 0dc6a40b63f4..c7d6cf96796c 100644
--- a/Documentation/devicetree/bindings/mfd/atmel,sama5d2-flexcom.yaml
+++ b/Documentation/devicetree/bindings/mfd/atmel,sama5d2-flexcom.yaml
@@ -19,12 +19,11 @@ properties:
     oneOf:
       - const: atmel,sama5d2-flexcom
       - items:
-          - const: microchip,sam9x7-flexcom
+          - enum:
+              - microchip,sam9x7-flexcom
+              - microchip,sama7d65-flexcom
+              - microchip,sama7g5-flexcom
           - const: atmel,sama5d2-flexcom
-      - items:
-          - const: microchip,sama7g5-flexcom
-          - const: atmel,sama5d2-flexcom
-
 
   reg:
     maxItems: 1
-- 
2.43.0


