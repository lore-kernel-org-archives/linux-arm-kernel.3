Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DAAD3E77179
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  6 Dec 2024 20:12:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=fUku1Ef8jw/qAJbGiMKgp9hXiFtwijGjTFNQXSiJgfY=; b=oDsSJfJXM9rU4lUJ5dvWpd+pil
	fF6JDiCjCERYDsihlFf23IMxg75iM5uDgkB/0vu8Tjife+elgIJHqluvb+bzlWxH3w9vNmjDC2UfA
	SPPd/kwonc7gH4mpBfH8zqMp5X+aB7bRQP/8Uu9dnkf/7UUYiIFjVvan+4Vn4IqcutPZacG3Ewj1A
	7uGg6HdReSaxKfu0YOj4wEnbXKbi+G5KoduRlLNW7mRTTLmKGSWkLxtaM2u4QBT1ouWU1MQy39jdw
	55D/diXANV9Ke0jALDKfSagfQaVwTBiOppEJApuHJrigAC+8a5wmHOwpUZTLS4IlZc3MMnDhtGT9r
	DeCL1R+Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tJegv-00000002eum-1w53;
	Fri, 06 Dec 2024 20:12:45 +0000
Received: from esa.microchip.iphmx.com ([68.232.153.233])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tJeWO-00000002clz-1Dr7
	for linux-arm-kernel@lists.infradead.org;
	Fri, 06 Dec 2024 20:01:53 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1733515313; x=1765051313;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=9Q//WdqJFVOuezi3xpmaAB5Yg0z8vN5p/2/SEsI6Gb0=;
  b=a6tfEgONNwYyVj89lv+qJa2d4HKHVWCex8ILHdSj6vYAbmUsRkaGDhFG
   BGQBZrlzUrRNdrBoe+qAZTMmrS7H9XyxpmiIpEPLQHCWsiTIigFHAySMh
   QOx1nNvwVW7vsl76Ju89tjSfOrkYxg15qs1aOG0M/XBHu6rjznPNSrcmp
   oLwN4w6dF97LM2XiCN1XJUJ65qgwN6lOatQDHbC/nAgOB0sOzYJ4Zvgg0
   gtbd6qm9geaJ+2XEtDAtLnsnGfdyrY8tYq6PtMidZbNfDCrkH+tH569NG
   gT9TxKbGGB56v5EGclm0petR/Tb4g/SPEgoMJrJIDbp5E9Wtc0e3PzsfY
   w==;
X-CSE-ConnectionGUID: /C8EJBR2STyJIMNyJN3YNw==
X-CSE-MsgGUID: gZvVWBE4TkKFWHD8QNBD+g==
X-IronPort-AV: E=Sophos;i="6.12,214,1728975600"; 
   d="scan'208";a="266436383"
X-Amp-Result: SKIPPED(no attachment in message)
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa5.microchip.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256; 06 Dec 2024 13:01:50 -0700
Received: from chn-vm-ex04.mchp-main.com (10.10.85.152) by
 chn-vm-ex04.mchp-main.com (10.10.85.152) with Microsoft SMTP Server
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
	<linux-serial@vger.kernel.org>
Subject: [PATCH v3 02/13] dt-bindings: mfd: atmel,sama5d2-flexcom: add microchip,sama7d65-flexcom
Date: Fri, 6 Dec 2024 12:59:47 -0700
Message-ID: <550a6dc244a9955782c5b9d7863df4e15bba8a26.1733505542.git.Ryan.Wanner@microchip.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1733505542.git.Ryan.Wanner@microchip.com>
References: <cover.1733505542.git.Ryan.Wanner@microchip.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241206_120152_334434_EA0CC742 
X-CRM114-Status: UNSURE (   7.49  )
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

Consolidated entries into one enum to match proper coding style.

Signed-off-by: Dharma Balasubiramani <dharma.b@microchip.com>
Signed-off-by: Ryan Wanner <Ryan.Wanner@microchip.com>
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


