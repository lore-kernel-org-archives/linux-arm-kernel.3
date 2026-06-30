Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C22D9C43458
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 30 Jun 2026 09:37:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=pf+luVJXN+5Mt1F/LugFNGoO7JFSxApPShAsXbvlFwQ=; b=bjhXJ+oDB/axboNl7NNP6LF7Ne
	l9HxjGeP17OrpyzjPNH+TQeITuetsxBtkJAJ8PT7snyT1fSWSNHGkOjrG+Xztw8RUTUrngC6BhLDc
	n5tsFQiGqJBuSr7ibmZv8p85tc4jjBrsq2Zu0k3pD2gzvQF8plfjhd0Bu5UISHR5mgjpx+qyMg7sh
	74Fm31djvT0kQg9Xe/CHfrTVKK1ouvVTA+s/TvtyeAHYkQfWDF4A29X0xGAqusg3VwrB7kKFawI60
	4oL2qRtMj8PILJUnRE/MWWejWysgTUx+SuUEVeKeuVJHUdkRtI5hFH2cy+J6e+0KIu7O52Qm5pN6S
	ykyUQN/A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1weUuJ-0000000GSdv-3wvr;
	Tue, 30 Jun 2026 09:37:31 +0000
Received: from esa.microchip.iphmx.com ([68.232.154.123])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1weUuH-0000000GScE-2Nub
	for linux-arm-kernel@lists.infradead.org;
	Tue, 30 Jun 2026 09:37:30 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1782812249; x=1814348249;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=bCA8BUnUCacAeM9L4GkNBcOulMHRN3ZMV7gjy96hcXs=;
  b=EPeVVrkxQ7bV++FYjKZeLGCchcbEVAgzn7rVkPyFh0QvMixpL0PtnGT2
   P3FwAqE4oBIujfy9ZOSMgR2dk/fysDbPyLaLOjgfmbEgwWq7EiO66jc4r
   M8mPzeXTQVqR15trIYMrmbLBqUwQrc+pBfcfnmCNHInmcryRok4T6xDSS
   woOZIRZh0obZKFudXumJ7Tz5+bBWim9apCXid4vzcCptJOLKL9Fle6VvP
   NYOnr0MdIwVm5wlmBm1faYKBT3SicEXHGDuxMyIAK+SRp9mJ11R9uz87r
   B4LtiBLqaMwV7cZnKSoXxV5m0jKSycUIHeO00BJohOeWG4mIR8gq/GRd4
   w==;
X-CSE-ConnectionGUID: sN5DjNmgRiOIswaiaE7jxw==
X-CSE-MsgGUID: 5cCVH5nJSvWr1o7IT9ZkwA==
X-IronPort-AV: E=Sophos;i="6.24,233,1774335600"; 
   d="scan'208";a="59032675"
X-Amp-Result: SKIPPED(no attachment in message)
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa4.microchip.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256; 30 Jun 2026 02:37:28 -0700
Received: from chn-vm-ex02.mchp-main.com (10.10.85.144) by
 chn-vm-ex04.mchp-main.com (10.10.85.152) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.58; Tue, 30 Jun 2026 02:37:28 -0700
Received: from che-ll-i67070.microchip.com (10.10.85.11) by
 chn-vm-ex02.mchp-main.com (10.10.85.144) with Microsoft SMTP Server id
 15.1.2507.58 via Frontend Transport; Tue, 30 Jun 2026 02:37:19 -0700
From: Varshini Rajendran <varshini.rajendran@microchip.com>
To: <ehristev@kernel.org>, <jic23@kernel.org>, <dlechner@baylibre.com>,
	<nuno.sa@analog.com>, <andy@kernel.org>, <robh@kernel.org>,
	<krzk+dt@kernel.org>, <conor+dt@kernel.org>, <nicolas.ferre@microchip.com>,
	<alexandre.belloni@bootlin.com>, <claudiu.beznea@tuxon.dev>,
	<srini@kernel.org>, <marcelo.schmitt@analog.com>, <jorge.marques@analog.com>,
	<mazziesaccount@gmail.com>, <Jonathan.Santos@analog.com>,
	<jishnu.prakash@oss.qualcomm.com>, <antoniu.miclaus@analog.com>,
	<duje@dujemihanovic.xyz>, <varshini.rajendran@microchip.com>,
	<linux-iio@vger.kernel.org>, <devicetree@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>
CC: Conor Dooley <conor.dooley@microchip.com>
Subject: [PATCH v3 05/13] dt-bindings: nvmem: microchip,sama7g5-otpc: add sama7d65 and dt node example
Date: Tue, 30 Jun 2026 15:05:55 +0530
Message-ID: <20260630093603.38663-6-varshini.rajendran@microchip.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260630093603.38663-1-varshini.rajendran@microchip.com>
References: <20260630093603.38663-1-varshini.rajendran@microchip.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260630_023729_678851_9F033025 
X-CRM114-Status: GOOD (  10.07  )
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

Add support for sama7d65 and a dt node example that shows tag can be used
to reference a packet stored in the OTP memory.

Signed-off-by: Varshini Rajendran <varshini.rajendran@microchip.com>
Acked-by: Conor Dooley <conor.dooley@microchip.com>
---
 .../nvmem/microchip,sama7g5-otpc.yaml         | 28 +++++++++++++++++--
 1 file changed, 25 insertions(+), 3 deletions(-)

diff --git a/Documentation/devicetree/bindings/nvmem/microchip,sama7g5-otpc.yaml b/Documentation/devicetree/bindings/nvmem/microchip,sama7g5-otpc.yaml
index cc25f2927682..04b44660554e 100644
--- a/Documentation/devicetree/bindings/nvmem/microchip,sama7g5-otpc.yaml
+++ b/Documentation/devicetree/bindings/nvmem/microchip,sama7g5-otpc.yaml
@@ -20,9 +20,15 @@ allOf:
 
 properties:
   compatible:
-    items:
-      - const: microchip,sama7g5-otpc
-      - const: syscon
+    oneOf:
+      - items:
+          - const: microchip,sama7g5-otpc
+          - const: syscon
+      - items:
+          - enum:
+              - microchip,sama7d65-otpc
+          - const: microchip,sama7g5-otpc
+          - const: syscon
 
   reg:
     maxItems: 1
@@ -48,4 +54,20 @@ examples:
         };
     };
 
+  - |
+    efuse@e8c00000 {
+        compatible = "microchip,sama7d65-otpc", "microchip,sama7g5-otpc", "syscon";
+        reg = <0xe8c00000 0x100>;
+
+        nvmem-layout {
+            compatible = "fixed-layout";
+            #address-cells = <1>;
+            #size-cells = <1>;
+
+            calib@41435354 {
+                reg = <0x41435354 0x2c>;    /* Temp calib data packet TAG */
+            };
+        };
+    };
+
 ...
-- 
2.34.1


