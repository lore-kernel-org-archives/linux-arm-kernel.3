Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C2758C02192
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  5 Feb 2025 05:49:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:CC:To:In-Reply-To:References
	:Message-ID:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=UtRtc9QE6VHNnYx7rlSKmQ8iQtqI2EGPKQFLoa0Crsw=; b=f4EF4r1Gon/WudMTlPKtYpoBd0
	Z9dC57XPlozaM7+k+X+vaURTQ/d5t2YIB3fsMvq2gWX1AJP/foM2yVMC7aJ3ysA8WtalTuet58JXu
	33vP9iByEXcgpGM/Hd3KaFx7lDAqFd4jd7c6GhCLAmzsR293YBdYSc9VvzhGeyUbpKAW28ZVXYGYC
	NC4s06xVSgFlLKhxHHTh0SP4oPuZYQP56xxsfPOa9Y+mngP8yCjSoYpsN8fdAmlyAsWvMNfVDIJEi
	0muIY7IXXfipT34G/R0n2mWTJi9eLcLs0wJfBmxr7WKX6fHXWm2BD6CNjCUBjBgHCpTfJ9aYo99BN
	ZK56zqeQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tfYHR-00000002MZv-1ANu;
	Wed, 05 Feb 2025 05:48:57 +0000
Received: from esa.microchip.iphmx.com ([68.232.154.123])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tfYG4-00000002MQL-0cph
	for linux-arm-kernel@lists.infradead.org;
	Wed, 05 Feb 2025 05:47:33 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1738734452; x=1770270452;
  h=from:date:subject:mime-version:content-transfer-encoding:
   message-id:references:in-reply-to:to:cc;
  bh=r2mmTyCNz3+P1wCHtQKeE98SelrFptg10dUNqwfPqts=;
  b=eYVwd5/H48msORy/xBUPO2fUB4SyQEzD9pwQsRHR+ZRpuGao74NEywzW
   uLuYcynPMVer/4kKvEg3jygxFG3cqd6ipEdEVWsB0tkqrNm2nBraPx3D6
   BN5DVT46DmHjNDKipd2U4c049Rco5GRXFp9S73yfT26aMv831WY7shqf4
   WVe6FqhURAmLE6YaflaPF2Seq6ls6ucwCS49+YS1+5gH/eh2kq3ry65/B
   dPoy+DPvOa2NLO3cbMw6LZTyzVLXis0KAa6/n4oDjK1I3enRDcqnKsZwR
   jRW/rA1r2riuqQIeCTKPS8dl6UvMUyTR9fHGbFsHQMVt5UW+Xm4V4As44
   w==;
X-CSE-ConnectionGUID: Q6N8fxKkRWuAjntzGu5PRA==
X-CSE-MsgGUID: 8sK76KAKTMK9+hz0uV0F6Q==
X-IronPort-AV: E=Sophos;i="6.13,260,1732604400"; 
   d="scan'208";a="36898072"
X-Amp-Result: SKIPPED(no attachment in message)
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa4.microchip.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256; 04 Feb 2025 22:47:28 -0700
Received: from chn-vm-ex02.mchp-main.com (10.10.85.144) by
 chn-vm-ex04.mchp-main.com (10.10.85.152) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Tue, 4 Feb 2025 22:47:23 -0700
Received: from [127.0.0.1] (10.10.85.11) by chn-vm-ex02.mchp-main.com
 (10.10.85.144) with Microsoft SMTP Server id 15.1.2507.35 via Frontend
 Transport; Tue, 4 Feb 2025 22:47:17 -0700
From: Dharma Balasubiramani <dharma.b@microchip.com>
Date: Wed, 5 Feb 2025 11:17:03 +0530
Subject: [PATCH 2/2] dt-bindings: dma: at_xdmac: document dma-channels
 property
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20250205-mchp-dma-v1-2-124b639d5afe@microchip.com>
References: <20250205-mchp-dma-v1-0-124b639d5afe@microchip.com>
In-Reply-To: <20250205-mchp-dma-v1-0-124b639d5afe@microchip.com>
To: Ludovic Desroches <ludovic.desroches@microchip.com>, Vinod Koul
	<vkoul@kernel.org>, Rob Herring <robh@kernel.org>, Krzysztof Kozlowski
	<krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Nicolas Ferre
	<nicolas.ferre@microchip.com>, Alexandre Belloni
	<alexandre.belloni@bootlin.com>, Claudiu Beznea <claudiu.beznea@tuxon.dev>,
	Charan Pedumuru <charan.pedumuru@microchip.com>
CC: <linux-arm-kernel@lists.infradead.org>, <dmaengine@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <devicetree@vger.kernel.org>, "Dharma
 Balasubiramani" <dharma.b@microchip.com>, Tony Han <tony.han@microchip.com>,
	Cristian Birsan <cristian.birsan@microchip.com>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1738734425; l=2248;
 i=dharma.b@microchip.com; s=20240209; h=from:subject:message-id;
 bh=r2mmTyCNz3+P1wCHtQKeE98SelrFptg10dUNqwfPqts=;
 b=/Ixn736PYcqjlWrl/ODVpBF7/1gZsuXsfAjG5GQJBTxnvnfleZU+YHVEIdYZIna7OKwzxyOI5
 c9guVdzxrcQAfIZtJIZb15Mv8TkMp07XPE94plLq0k3MrPC93yx85rU
X-Developer-Key: i=dharma.b@microchip.com; a=ed25519;
 pk=kCq31LcpLAe9HDfIz9ZJ1U7T+osjOi7OZSbe0gqtyQ4=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250204_214732_386594_93623024 
X-CRM114-Status: UNSURE (   9.92  )
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

Add document for the property "dma-channels" for XDMA controller.

Also reorder properties to group related items together.

Signed-off-by: Tony Han <tony.han@microchip.com>
Reviewed-by: Cristian Birsan <cristian.birsan@microchip.com>
Signed-off-by: Dharma Balasubiramani <dharma.b@microchip.com>
---
 .../devicetree/bindings/dma/atmel,sama5d4-dma.yaml | 26 ++++++++++++++--------
 1 file changed, 17 insertions(+), 9 deletions(-)

diff --git a/Documentation/devicetree/bindings/dma/atmel,sama5d4-dma.yaml b/Documentation/devicetree/bindings/dma/atmel,sama5d4-dma.yaml
index 9ca1c5d1f00f..b9fda35d2138 100644
--- a/Documentation/devicetree/bindings/dma/atmel,sama5d4-dma.yaml
+++ b/Documentation/devicetree/bindings/dma/atmel,sama5d4-dma.yaml
@@ -33,15 +33,6 @@ properties:
               - microchip,sam9x7-dma
           - const: atmel,sama5d4-dma
 
-  "#dma-cells":
-    description: |
-      Represents the number of integer cells in the `dmas` property of client
-      devices. The single cell specifies the channel configuration register:
-        - bit 13: SIF (Source Interface Identifier) for memory interface.
-        - bit 14: DIF (Destination Interface Identifier) for peripheral interface.
-        - bit 30-24: PERID (Peripheral Identifier).
-    const: 1
-
   reg:
     maxItems: 1
 
@@ -54,6 +45,23 @@ properties:
   clock-names:
     const: dma_clk
 
+  "#dma-cells":
+    description: |
+      Represents the number of integer cells in the `dmas` property of client
+      devices. The single cell specifies the channel configuration register:
+        - bit 13: SIF (Source Interface Identifier) for memory interface.
+        - bit 14: DIF (Destination Interface Identifier) for peripheral interface.
+        - bit 30-24: PERID (Peripheral Identifier).
+    const: 1
+
+  dma-channels:
+    $ref: /schemas/types.yaml#/definitions/uint32
+    description:
+      Represents the number of DMA channels available in XDMA controller. This
+      property is required when the channel count cannot be read from the
+      XDMAC_GTYPE register (which occurs when accessing from non-secure world
+      on certain devices).
+
 required:
   - compatible
   - reg

-- 
2.43.0


