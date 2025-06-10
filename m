Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0EF3BC61DB2
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 10 Jun 2025 06:53:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=TYyJ9sW0v0423gZ2xIjO7JVY9I32sl9gpeZo3bacq7c=; b=q57ONy02Uk25lbr7FBVlu4QShE
	Smcr3FJ3wia+eZFNRPSJQYFGeDF62m6gquQ5HSjvZcIeLCb6VfjemNv8ldi5zJAUDuH39FxQ6TFaq
	sluEvIPCUOUJA4af1z4pLirMqnxsbcH682UJ3/VcPBhTlCV3PzEZavRnbySJTjbAJl/pEDCGBGvpM
	f+Pzsyc3ikr4+NrVogLeIjxSli1iLnlnfobhYH5xJMHQGLvEfxd+TfOsBhuGy1uZi7gbQ/XblbFDG
	MWZ3Ru2b82dG3xJ22ZUb94JPcFAiqgdBWSmcG88XDbiNQHPdzoKp7n3T+IimSHB6jmGhpkGbMUnBt
	L5pqSpVQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uOsr4-00000005xz0-4A5e;
	Tue, 10 Jun 2025 06:53:06 +0000
Received: from esa.microchip.iphmx.com ([68.232.153.233])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uOsov-00000005xnP-2MWO
	for linux-arm-kernel@lists.infradead.org;
	Tue, 10 Jun 2025 06:50:55 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1749538253; x=1781074253;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=soyPmKOiyPuF13kTyA1g1EHVtL0HTpl2yGsgbJZwClc=;
  b=oiPQHOfTIWBwLlj5i6W+X9yuexHJDe7KXZAsYSJD8rr2mK5hSjOxpL/9
   u+Ns5CuHy1rNGDFP0AMP16KHDg2GW/uE3BiNuvHaKUpc3SdCpO3PbV915
   ipU/rII9aFdOc9iIDB88krgXiLVoZJ3RZ7iP53d6iZkuz7FiHXnSsqjkM
   X3OQSfGfT+fdqg4hBeAOWSkij44Kq669qO907WyoYJfpOE4wIrOH0Y3kK
   22DqGLWGIOxHS2XXDYJELHkCS5OZsEmNNS1NdsThTDzqAcIJzAW48j5KW
   7yh8kqnII0NEdUdtidDGQTIGvQ9SZIhOCEaLY5JZzrmAT/P3U3GkA1Pp7
   Q==;
X-CSE-ConnectionGUID: o/k/Usq3QdaIxjSukshv+w==
X-CSE-MsgGUID: NibftaXXSSmHn/JY2WykbA==
X-IronPort-AV: E=Sophos;i="6.16,224,1744095600"; 
   d="scan'208";a="47577425"
X-Amp-Result: SKIPPED(no attachment in message)
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa1.microchip.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256; 09 Jun 2025 23:50:52 -0700
Received: from chn-vm-ex04.mchp-main.com (10.10.85.152) by
 chn-vm-ex04.mchp-main.com (10.10.85.152) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Mon, 9 Jun 2025 23:50:21 -0700
Received: from che-lt-i67070.microchip.com (10.10.85.11) by
 chn-vm-ex04.mchp-main.com (10.10.85.152) with Microsoft SMTP Server id
 15.1.2507.44 via Frontend Transport; Mon, 9 Jun 2025 23:50:16 -0700
From: Varshini Rajendran <varshini.rajendran@microchip.com>
To: <claudiu.beznea@tuxon.dev>, <andrei.simion@microchip.com>,
	<lgirdwood@gmail.com>, <broonie@kernel.org>, <robh@kernel.org>,
	<krzk+dt@kernel.org>, <conor+dt@kernel.org>, <nicolas.ferre@microchip.com>,
	<alexandre.belloni@bootlin.com>, <linux-arm-kernel@lists.infradead.org>,
	<linux-sound@vger.kernel.org>, <devicetree@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>
CC: <varshini.rajendran@microchip.com>
Subject: [PATCH] ASoC: dt-bindings: atmel,at91-ssc: add microchip,sam9x7-ssc
Date: Tue, 10 Jun 2025 12:20:05 +0530
Message-ID: <20250610065005.64070-1-varshini.rajendran@microchip.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250609_235053_818917_4C37287C 
X-CRM114-Status: UNSURE (   8.75  )
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

Add microchip,sam9x7-ssc to DT bindings documentation.

Signed-off-by: Varshini Rajendran <varshini.rajendran@microchip.com>
---

This patch is a rework (adapting to the newly converted yaml file) of the
leftout patch sent [1] as a part of the series adding support for sam9x7 SoC
and sam9x75 curiosity board.

[1] https://lore.kernel.org/lkml/20241010120345.92844-1-varshini.rajendran@microchip.com/

---
 .../devicetree/bindings/sound/atmel,at91-ssc.yaml     | 11 ++++++++---
 1 file changed, 8 insertions(+), 3 deletions(-)

diff --git a/Documentation/devicetree/bindings/sound/atmel,at91-ssc.yaml b/Documentation/devicetree/bindings/sound/atmel,at91-ssc.yaml
index a05e61431824..ce99c2d8c35d 100644
--- a/Documentation/devicetree/bindings/sound/atmel,at91-ssc.yaml
+++ b/Documentation/devicetree/bindings/sound/atmel,at91-ssc.yaml
@@ -16,9 +16,14 @@ description:
 
 properties:
   compatible:
-    enum:
-      - atmel,at91rm9200-ssc
-      - atmel,at91sam9g45-ssc
+    oneOf:
+      - enum:
+          - atmel,at91rm9200-ssc
+          - atmel,at91sam9g45-ssc
+      - items:
+          - enum:
+              - microchip,sam9x7-ssc
+          - const: atmel,at91sam9g45-ssc
 
   reg:
     maxItems: 1
-- 
2.45.2


