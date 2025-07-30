Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 31AFCC87FC9
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 30 Jul 2025 05:42:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=gof4PqYSYinUy8ITNXTTQVgPNSdt3M/x8cSHV6Pt9MQ=; b=tuVzajeogVoHrQmL0bhVzClo7S
	eIxGPUJXPKMwVFeyaTn0GII8XBfdYJqMvuK5oTHWE1R689ohcPkebVHkrWrrx0aFJO/rnAegZhrFW
	J3tSScIc7MkQZQeJFUyIhYfL/PkA0fwAk2t/rLG1Z+s3653lgAWL/M4AmVA325SlsjwTcI6sS7crb
	pyRxTRfRwBaKHUkx0jenic087d86Jn/JV964c2El4M71agBuCZeKtG7xKuLQZIRyN8vs+pkpByyj0
	7wWbKlXOixFHSflB7Rs+VaHFn/xR33+nopN66vUy+++twdr4vesqZIYi8LxC2QzDunCQV2332W/Su
	sy2+DHkA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ugzZd-00000000jVv-3n13;
	Wed, 30 Jul 2025 05:41:57 +0000
Received: from esa.microchip.iphmx.com ([68.232.154.123])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ugzVS-00000000jDJ-0hCI
	for linux-arm-kernel@lists.infradead.org;
	Wed, 30 Jul 2025 05:37:39 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1753853858; x=1785389858;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=rWUE7qFB8LKVOaKtzg/sWlFkmdVQ/vjyCvDn33LZlZY=;
  b=Hj00oGj37MhXt8sxGPjgWUPCfWM04AVHxnWspWoYe57/wwI1y9eQTSoU
   k7XN3Lf05rmmA/uDhHHn+eU2HlxknAv5tUPIV4vjy4ZKsXtO2gO0qSQhc
   Mmhg7EzVqrh/dQdOFXukhuUqqyYqtWOzJpKy2BKu9Zx/byOh63ZrjTLMI
   tHQ0QEOsWFQlKGmFoXkKtWyxgzYduYvIhBd0j8HP8ZBMTG2Hj3HFjrnA0
   n3Syvm8luFWP8wD8WjjGn8U4kLtdeCyipfZGkjlkmecDV1+OLGfec4Sc8
   CTxWnHIF5k0U7XPVDFKgo17U/4/k9kVymz1N1mkS9MI75O7EIFzEFqjFR
   Q==;
X-CSE-ConnectionGUID: s7MsNy9gTXqx+DUz3G6LIg==
X-CSE-MsgGUID: yzQRLX74Ri6H1tniLANesQ==
X-IronPort-AV: E=Sophos;i="6.16,350,1744095600"; 
   d="scan'208";a="45191543"
X-Amp-Result: SKIPPED(no attachment in message)
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa2.microchip.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256; 29 Jul 2025 22:37:36 -0700
Received: from chn-vm-ex04.mchp-main.com (10.10.85.152) by
 chn-vm-ex01.mchp-main.com (10.10.85.143) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Tue, 29 Jul 2025 22:37:30 -0700
Received: from che-lt-i67131.microchip.com (10.10.85.11) by
 chn-vm-ex04.mchp-main.com (10.10.85.152) with Microsoft SMTP Server id
 15.1.2507.44 via Frontend Transport; Tue, 29 Jul 2025 22:37:25 -0700
From: Manikandan Muralidharan <manikandan.m@microchip.com>
To: <broonie@kernel.org>, <robh@kernel.org>, <krzk+dt@kernel.org>,
	<conor+dt@kernel.org>, <nicolas.ferre@microchip.com>,
	<alexandre.belloni@bootlin.com>, <claudiu.beznea@tuxon.dev>,
	<tudor.ambarus@linaro.org>, <linux-spi@vger.kernel.org>,
	<devicetree@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>
CC: Manikandan Muralidharan <manikandan.m@microchip.com>
Subject: [PATCH 2/3] spi: dt-bindings: atmel,at91rm9200-spi: Add support for optional 'spi_gclk' clock
Date: Wed, 30 Jul 2025 11:07:20 +0530
Message-ID: <20250730053720.262118-1-manikandan.m@microchip.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250729_223738_268074_AD014FD9 
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

Update the Atmel SPI DT binding to support an optional programmable
SPI generic clock 'spi_gclk', in addition to the required 'spi_clk'.

Signed-off-by: Manikandan Muralidharan <manikandan.m@microchip.com>
---
 .../devicetree/bindings/spi/atmel,at91rm9200-spi.yaml | 11 ++++++++---
 1 file changed, 8 insertions(+), 3 deletions(-)

diff --git a/Documentation/devicetree/bindings/spi/atmel,at91rm9200-spi.yaml b/Documentation/devicetree/bindings/spi/atmel,at91rm9200-spi.yaml
index d29772994cf5..11885d0cc209 100644
--- a/Documentation/devicetree/bindings/spi/atmel,at91rm9200-spi.yaml
+++ b/Documentation/devicetree/bindings/spi/atmel,at91rm9200-spi.yaml
@@ -31,11 +31,16 @@ properties:
     maxItems: 1
 
   clock-names:
-    contains:
-      const: spi_clk
+    items:
+      - const: spi_clk
+      - const: spi_gclk
+    minItems: 1
 
   clocks:
-    maxItems: 1
+    items:
+      - description: Peripheral Bus clock
+      - description: Programmable Generic clock
+    minItems: 1
 
   dmas:
     items:
-- 
2.25.1


