Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 29126C77B7C
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 23 Jun 2025 06:11:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:To:From:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=CwR8jsXYkYl2vgRdqMccLX0UelyZDh3YW75PbHZ+xJg=; b=RzvKKj0UDOIzdPJGjiZ55FlBxc
	YFbchSyOieAqUnOfbZtKxYYAg9K1TiY+siEWI7oluohiZXJeZV+I3gXDFnLRmrvANyWH3n+vj1XEP
	ynQHHtVVMKq3K8k0R8QWxxVjBzQSKZ3rFHpBVta6RZqWVmxeyuvHQJCtd6ExexVmfPYA0INLS83V2
	17oY1bT6LOZgTBGQ3L4aXOtU5U0BYIoebTkAMzSxO7+0RrXPhaFLFsPGpKKxaGJ3LUnemKyaT0JQa
	rAVv+qmJ6zaMbVAIfkAYlzYRbi9n7ty6tJKWXEKf1EpJt6KasnU/1Xk8yLoeyU1FDgCXAOLdDyaRR
	HUfTm3rQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uTaON-00000001h39-2I9M;
	Mon, 23 Jun 2025 06:10:55 +0000
Received: from lelvem-ot01.ext.ti.com ([198.47.23.234])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uTZtH-00000001dY7-0SaK
	for linux-arm-kernel@lists.infradead.org;
	Mon, 23 Jun 2025 05:38:48 +0000
Received: from fllvem-sh03.itg.ti.com ([10.64.41.86])
	by lelvem-ot01.ext.ti.com (8.15.2/8.15.2) with ESMTP id 55N5ciAU795498;
	Mon, 23 Jun 2025 00:38:44 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1750657124;
	bh=CwR8jsXYkYl2vgRdqMccLX0UelyZDh3YW75PbHZ+xJg=;
	h=From:To:Subject:Date:In-Reply-To:References;
	b=oT1aWS3sinAKEODqP0jZwUFcmuSg8L00TK0y1PqZCY6cf+bJ55h2ekM98N2tgB+k5
	 6gYAQyf+Tx+NhuZ+vFC5IBqTbc0Z2ivvVgZyA7OOUVoASZL9zDiALQDiWscOjCdbyV
	 gfd1Sg1YUM1Ohva5QGbJ8/x903qrgpzdy+HUmMZ8=
Received: from DLEE104.ent.ti.com (dlee104.ent.ti.com [157.170.170.34])
	by fllvem-sh03.itg.ti.com (8.18.1/8.18.1) with ESMTPS id 55N5ciYA2931956
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA256 bits=128 verify=FAIL);
	Mon, 23 Jun 2025 00:38:44 -0500
Received: from DLEE101.ent.ti.com (157.170.170.31) by DLEE104.ent.ti.com
 (157.170.170.34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55; Mon, 23
 Jun 2025 00:38:43 -0500
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DLEE101.ent.ti.com
 (157.170.170.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55 via
 Frontend Transport; Mon, 23 Jun 2025 00:38:43 -0500
Received: from uda0498651.dhcp.ti.com (uda0498651.dhcp.ti.com [172.24.227.7])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 55N5bSqc3428603;
	Mon, 23 Jun 2025 00:38:38 -0500
From: Sai Sree Kartheek Adivi <s-adivi@ti.com>
To: Peter Ujfalusi <peter.ujfalusi@gmail.com>, Vinod Koul <vkoul@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Nishanth Menon <nm@ti.com>,
        Santosh
 Shilimkar <ssantosh@kernel.org>,
        Sai Sree Kartheek Adivi <s-adivi@ti.com>, <dmaengine@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>, <praneeth@ti.com>,
        <vigneshr@ti.com>, <u-kumar1@ti.com>, <a-chavda@ti.com>,
        <p-mantena@ti.com>
Subject: [PATCH v3 13/17] dt-bindings: dma: ti: Add K3 PKTDMA V2
Date: Mon, 23 Jun 2025 11:07:12 +0530
Message-ID: <20250623053716.1493974-14-s-adivi@ti.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250623053716.1493974-1-s-adivi@ti.com>
References: <20250623053716.1493974-1-s-adivi@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250622_223847_245263_7F85B19F 
X-CRM114-Status: GOOD (  13.71  )
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

New binding document for
Texas Instruments K3 Packet DMA (PKTDMA) V2.

PKTDMA V2 is introduced as part of AM62L.

Signed-off-by: Sai Sree Kartheek Adivi <s-adivi@ti.com>
---
 .../bindings/dma/ti/k3-pktdma-v2.yaml         | 72 +++++++++++++++++++
 1 file changed, 72 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/dma/ti/k3-pktdma-v2.yaml

diff --git a/Documentation/devicetree/bindings/dma/ti/k3-pktdma-v2.yaml b/Documentation/devicetree/bindings/dma/ti/k3-pktdma-v2.yaml
new file mode 100644
index 0000000000000..9c2410888d95b
--- /dev/null
+++ b/Documentation/devicetree/bindings/dma/ti/k3-pktdma-v2.yaml
@@ -0,0 +1,72 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+# Copyright (C) 2024-2025 Texas Instruments Incorporated
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/dma/ti/k3-pktdma-v2.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Texas Instruments K3 DMSS PKTDMA V2
+
+maintainers:
+  - Sai Sree Kartheek Adivi <s-adivi@ti.com>
+
+description: |
+  The PKTDMA V2 is intended to perform similar functions as the packet mode
+  channels of K3 UDMA-P. PKTDMA V2 only includes Split channels to service
+  PSI-L based peripherals.
+
+  The peripherals can be PSI-L native or legacy, non PSI-L native peripherals
+  with PDMAs. PDMA is tasked to act as a bridge between the PSI-L fabric and the
+  legacy peripheral.
+
+allOf:
+  - $ref: /schemas/dma/dma-controller.yaml#
+
+properties:
+  compatible:
+    const: ti,am62l-dmss-pktdma
+
+  reg:
+    items:
+      - description: Packet DMA Control /Status
+      - description: Channel Realtime
+      - description: Ring Realtime
+
+  reg-names:
+    items:
+      - const: gcfg
+      - const: chanrt
+      - const: ringrt
+
+  "#dma-cells":
+    const: 2
+    description: |
+      cell 1: Channel number for the peripheral
+
+        Please refer to the device documentation for the channel map.
+
+      cell 2: ASEL value for the channel
+
+required:
+  - compatible
+  - reg
+  - reg-names
+  - "#dma-cells"
+
+unevaluatedProperties: false
+
+examples:
+  - |
+    main {
+        #address-cells = <2>;
+        #size-cells = <2>;
+
+        dma-controller@485c0000 {
+            compatible = "ti,am62l-dmss-pktdma";
+            reg = <0x00 0x485c0000 0x00 0x4000>,
+                  <0x00 0x48900000 0x00 0x80000>,
+                  <0x00 0x47200000 0x00 0x100000>;
+            reg-names = "gcfg", "chanrt", "ringrt";
+            #dma-cells = <2>;
+        };
+    };
-- 
2.34.1


