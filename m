Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9024FE77173
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  6 Dec 2024 20:07:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=LiTJuFS+dNTgIcQoNx6Hyyy1lnQZAl+DworWwvDmT1o=; b=aLaOanMRjPfNSmSaQJD8n3iTVS
	Ef2u0eqZJD95KiJU5Dh01jB3U7ZEGHocGY7GcMX+HvOjZOEsWsSyTfGgvKV1OwM5Vt6oGubuStC6q
	u9ItKLPuvsGchipIIXGWRO3offY3e3q4FuUGbZu/AP17kR9pglFJyLZ/jdb1bQwy/5kKkMVJ6bthi
	iue+4FAEkIRJzH1t1hXQwg23DVvcft4ws1m78VxUYtPSsKyTU4OjpbpotrTfWA4jRdQTNBp21ovxX
	a4TVxmn4kzGjO3pu0ALD692WOkYYZlZjlPVjRNDpbrWOf8UWUPrBeCFai+c5OACbxBi+BAtfTcIdl
	+PuzKoGg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tJebr-00000002eG6-39we;
	Fri, 06 Dec 2024 20:07:31 +0000
Received: from esa.microchip.iphmx.com ([68.232.154.123])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tJeVw-00000002cY4-370V
	for linux-arm-kernel@lists.infradead.org;
	Fri, 06 Dec 2024 20:01:25 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1733515284; x=1765051284;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=vxSjUj8/rpVfSBDOAIJy4d6AezOyQPahCixPSn8D4y4=;
  b=XPQ323UjMb79Y4qWbR7Fq/MALAjSE255rXGMXODW+fjly+lU+CLoCJm0
   Go8jufnFK5U8zCvsygpFaJ9Wz4SU6Fv5WLv8RAOQLIPeGaXspthc/eELo
   Kjo5ezBIln535cqCIQJTMmxtIYkH8d5JvLfYQyvpMLTXo0yfLjRNBA6db
   TFHQF7PxAbQXw9qft9TR60vlbfxdO41tfJJPLUiX8ML6BbVZIBeUySyJG
   XFlOL5UrJ8pvDYtVl2O06J40FO9T/lkyVaLEXquTan+rwhw3w6dKd3N9C
   B1HFuoGz3PyLYoCIPCz8+Ox2K8NGXDZ64HuLj46uxtb4T+Kec8JuImOc9
   A==;
X-CSE-ConnectionGUID: wHv5dacKTzaP3KMzdbJ8Aw==
X-CSE-MsgGUID: /c8PheexSnqIMADne7aZhg==
X-IronPort-AV: E=Sophos;i="6.12,214,1728975600"; 
   d="scan'208";a="202686983"
X-Amp-Result: SKIPPED(no attachment in message)
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa6.microchip.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256; 06 Dec 2024 13:01:21 -0700
Received: from chn-vm-ex04.mchp-main.com (10.10.85.152) by
 chn-vm-ex02.mchp-main.com (10.10.85.144) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Fri, 6 Dec 2024 13:01:09 -0700
Received: from ryan-Precision-3630-Tower.microchip.com (10.10.85.11) by
 chn-vm-ex04.mchp-main.com (10.10.85.152) with Microsoft SMTP Server id
 15.1.2507.35 via Frontend Transport; Fri, 6 Dec 2024 13:01:09 -0700
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
	<linux-serial@vger.kernel.org>, Conor Dooley <conor.dooley@microchip.com>
Subject: [PATCH v3 01/13] dt-bindings: ARM: at91: Document Microchip SAMA7D65 Curiosity
Date: Fri, 6 Dec 2024 12:59:46 -0700
Message-ID: <d5a22763a2081daa0d2155e2c05b7dc0eb468610.1733505542.git.Ryan.Wanner@microchip.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1733505542.git.Ryan.Wanner@microchip.com>
References: <cover.1733505542.git.Ryan.Wanner@microchip.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241206_120124_881742_F1635891 
X-CRM114-Status: UNSURE (   6.79  )
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

From: Romain Sioen <romain.sioen@microchip.com>

Document device tree binding of the Microchip SAMA7D65 Curiosity board.

Signed-off-by: Romain Sioen <romain.sioen@microchip.com>
Acked-by: Nicolas Ferre <nicolas.ferre@microchip.com>
Signed-off-by: Dharma Balasubiramani <dharma.b@microchip.com>
Signed-off-by: Ryan Wanner <Ryan.Wanner@microchip.com>
Acked-by: Conor Dooley <conor.dooley@microchip.com>
---
 Documentation/devicetree/bindings/arm/atmel-at91.yaml | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/atmel-at91.yaml b/Documentation/devicetree/bindings/arm/atmel-at91.yaml
index 7160ec80ac1b..0ec29366e6c2 100644
--- a/Documentation/devicetree/bindings/arm/atmel-at91.yaml
+++ b/Documentation/devicetree/bindings/arm/atmel-at91.yaml
@@ -180,6 +180,13 @@ properties:
           - const: atmel,sama5d4
           - const: atmel,sama5
 
+      - description: Microchip SAMA7D65 Curiosity Board
+        items:
+          - const: microchip,sama7d65-curiosity
+          - const: microchip,sama7d65
+          - const: microchip,sama7d6
+          - const: microchip,sama7
+
       - items:
           - const: microchip,sama7g5ek # SAMA7G5 Evaluation Kit
           - const: microchip,sama7g5
-- 
2.43.0


