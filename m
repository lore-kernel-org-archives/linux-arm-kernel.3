Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8D56EC87FC9
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 30 Jul 2025 10:15:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=q7gBdnIJw26Or1FyKSmhC3KeoYmpBFj0HoYoCRoSrxI=; b=nq6ZRG/KPlCWGQ/mPuR3yeB2H4
	pBEhxlrexTwdY50XHaxBx2WdO/IURflUp63aExH33NSukM7CfG4PBfhHfEpFs8wuOlkvBhP73DQZ4
	/fhSZKG2+gzt+85/SS8tYp+gjRm/JB/e7xwyAkbWU96yc1LaC9x/6uwScj7Ssudsp5WgdM3IJDE2l
	9s3e49OC8DY+CH+x9//K77QAA//o2M1V8Mb5PjAXQjovnv0gI8lP6wNxKdgmXXNO+aJTBvtyMjzMd
	oh6zn4yJoWQLN3jteMQaW0tQbOO22MaqpuZfGW1dd1Mdf2/MQ74UboSAMEOIPeI0O0yVeoS3FKcBI
	7aJSqWug==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uh3qg-00000001D5n-0nvM;
	Wed, 30 Jul 2025 10:15:50 +0000
Received: from esa.microchip.iphmx.com ([68.232.153.233])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uh3mB-00000001Cli-23bE
	for linux-arm-kernel@lists.infradead.org;
	Wed, 30 Jul 2025 10:11:12 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1753870271; x=1785406271;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=lM6SLl/d3swseRYR2bai+1H7yO5nP0S+r0BY0IFolmU=;
  b=EVi/K4OKqoJgsZgiC0KJnl7XxCBUFfIlDc6F/KTFxiEPKRHFVORbMnQ5
   YIl/cTwBmxvHPQPV5PgLveXpugRyKpdk6Ufy8kIbs18gC16c7a8EMb7TB
   HaCtdwv3QNP3D8AywCibDcmBAE4iE+5llZFsK/jnCd3DmnyXVS1fxrmGs
   h2ckJi5CrceRy7OY3kCxZ2IdUmWVwF3mThRqM2rzpEtcXjvnlUSS0DOhP
   WFLjqoVxd2i8ZgJ8SWXry4qinh41QOyxZM+OqhbfDS06fIyOrfUwQh4rz
   dRZCRlQLo5xCV4yvf8Axc4AqXhkXB2DH9cazKP/fN43pi84BXxdNiQmBy
   Q==;
X-CSE-ConnectionGUID: zjJ/PdTbTgKvrskxeKL28w==
X-CSE-MsgGUID: GuM9KhUkTWq6wEF9QKR17w==
X-IronPort-AV: E=Sophos;i="6.16,350,1744095600"; 
   d="scan'208";a="49962575"
X-Amp-Result: SKIPPED(no attachment in message)
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa1.microchip.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256; 30 Jul 2025 03:11:10 -0700
Received: from chn-vm-ex04.mchp-main.com (10.10.85.152) by
 chn-vm-ex01.mchp-main.com (10.10.85.143) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Wed, 30 Jul 2025 03:10:34 -0700
Received: from che-lt-i67131.microchip.com (10.10.85.11) by
 chn-vm-ex04.mchp-main.com (10.10.85.152) with Microsoft SMTP Server id
 15.1.2507.44 via Frontend Transport; Wed, 30 Jul 2025 03:10:29 -0700
From: Manikandan Muralidharan <manikandan.m@microchip.com>
To: <broonie@kernel.org>, <robh@kernel.org>, <krzk+dt@kernel.org>,
	<conor+dt@kernel.org>, <nicolas.ferre@microchip.com>,
	<alexandre.belloni@bootlin.com>, <claudiu.beznea@tuxon.dev>,
	<ryan.wanner@microchip.com>, <tudor.ambarus@linaro.org>,
	<linux-spi@vger.kernel.org>, <devicetree@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>
CC: <manikandan.m@microchip.com>
Subject: [PATCH v2 2/3] spi: dt-bindings: atmel,at91rm9200-spi: Add support for optional 'spi_gclk' clock
Date: Wed, 30 Jul 2025 15:40:14 +0530
Message-ID: <20250730101015.323964-2-manikandan.m@microchip.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20250730101015.323964-1-manikandan.m@microchip.com>
References: <20250730101015.323964-1-manikandan.m@microchip.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250730_031111_537715_370F6794 
X-CRM114-Status: UNSURE (   9.96  )
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
changes in v2:
 - Fixed mail threading
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


