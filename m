Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 696B2C71136
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 12 Jun 2025 07:46:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:To:From:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=E/ftfCS6adtD4tlceeDdFjQ/E7eG8Fd6h6zSsFnKhH0=; b=UlZQ1c0FdafXfzpvpE/+H1UkuF
	6x4RK4hc7fGDRCPZxBnRlx6/EYuOpbmiI6e4Tl+ZqvHkqmJXjGeJ21oOxfkKhUc24GgbA7xWoorE/
	chfPnNuJv885fcFWT5XrkMmA6FC+2ES1tZ3pOHv14DGLhNDqkIsFcboSfMt7Vc49SOilB/rI+or+o
	TkSU6/D6Vi7FWFo+DsrBdq1BxW6qbXq8OXZXD5YiclWrbNuF3URPHrOvDuJSl0t1ghuSGzaxsINjH
	gqobHGe/9YtiLQT/7lZgaP0INndiV+xel4Q7A62PmQ8IG9p51aN0cOlym6U7+vevUih9epn1vV17R
	FH4lrjvg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uPcdL-0000000CUb4-3k0X;
	Thu, 12 Jun 2025 07:45:59 +0000
Received: from fllvem-ot03.ext.ti.com ([198.47.19.245])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uPcB0-0000000CPii-4Ahz
	for linux-arm-kernel@lists.infradead.org;
	Thu, 12 Jun 2025 07:16:44 +0000
Received: from fllvem-sh03.itg.ti.com ([10.64.41.86])
	by fllvem-ot03.ext.ti.com (8.15.2/8.15.2) with ESMTP id 55C7Ge2u2800900;
	Thu, 12 Jun 2025 02:16:40 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1749712600;
	bh=E/ftfCS6adtD4tlceeDdFjQ/E7eG8Fd6h6zSsFnKhH0=;
	h=From:To:Subject:Date:In-Reply-To:References;
	b=Km/3jLgZTHniCR1oE0ArdqgVsFZkDHpizu0+/hnLffV6RYjufy0zo5G1Wl0FL16uQ
	 FRQTNniamgrbM2pEYkCSwx38y5tPbpzoJOhzJ8PLR3OmY5b//qi//njxJvCWWnhZdh
	 owfXfGUbMP6eOobayALMwfcxwIpTjy2FRhOntyhg=
Received: from DFLE105.ent.ti.com (dfle105.ent.ti.com [10.64.6.26])
	by fllvem-sh03.itg.ti.com (8.18.1/8.18.1) with ESMTPS id 55C7Ged01618969
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA256 bits=128 verify=FAIL);
	Thu, 12 Jun 2025 02:16:40 -0500
Received: from DFLE112.ent.ti.com (10.64.6.33) by DFLE105.ent.ti.com
 (10.64.6.26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Thu, 12
 Jun 2025 02:16:39 -0500
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DFLE112.ent.ti.com
 (10.64.6.33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55 via
 Frontend Transport; Thu, 12 Jun 2025 02:16:39 -0500
Received: from uda0498651.dhcp.ti.com (uda0498651.dhcp.ti.com [172.24.227.7])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 55C7FTKZ1608959;
	Thu, 12 Jun 2025 02:16:34 -0500
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
Subject: [PATCH v2 13/17] dt-bindings: dma: ti: Add document for K3 PKTDMA V2
Date: Thu, 12 Jun 2025 12:45:17 +0530
Message-ID: <20250612071521.3116831-14-s-adivi@ti.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250612071521.3116831-1-s-adivi@ti.com>
References: <20250612071521.3116831-1-s-adivi@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250612_001643_124604_F82FEA2F 
X-CRM114-Status: GOOD (  13.82  )
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
 .../bindings/dma/ti/k3-pktdma-v2.yaml         | 73 +++++++++++++++++++
 1 file changed, 73 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/dma/ti/k3-pktdma-v2.yaml

diff --git a/Documentation/devicetree/bindings/dma/ti/k3-pktdma-v2.yaml b/Documentation/devicetree/bindings/dma/ti/k3-pktdma-v2.yaml
new file mode 100644
index 0000000000000..baaf13a299297
--- /dev/null
+++ b/Documentation/devicetree/bindings/dma/ti/k3-pktdma-v2.yaml
@@ -0,0 +1,73 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+# Copyright (C) 2024-2025 Texas Instruments Incorporated
+# Author: Sai Sree Kartheek Adivi <s-adivi@ti.com>
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
+  The PKTDMA V2 is intended to perform similar functions as the packet
+  mode channels of K3 UDMA-P.
+  PKTDMA V2 only includes Split channels to service PSI-L based peripherals.
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
+    cbass_main {
+        #address-cells = <2>;
+        #size-cells = <2>;
+
+        dma-controller@485c0000 {
+            compatible = "ti,dmss-pktdma-v2";
+            reg = <0x00 0x485c0000 0x00 0x4000>,
+                  <0x00 0x48900000 0x00 0x80000>,
+                  <0x00 0x47200000 0x00 0x100000>;
+            reg-names = "gcfg", "chanrt", "ringrt";
+            #dma-cells = <2>;
+        };
+    };
-- 
2.34.1


