Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 96C59FF886C
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 28 Apr 2026 08:54:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=YNvSzmo8PxtYDxH+iUZiaWOO2AJ7iRrwNgPX/z2xyYA=; b=2g09p92WN7fQ2dEyvTWeS4rvzB
	ur8Yugn7zl0hO4cu3h3SYIe29oCJ1HtEp1a1/6nKDWaqenhRH6aS0gPJ3wemc6GMmQG2gL75JiCaW
	Njv7/SThFZ2JcyaKMDi0k7oO+Rqa+HgnHw5zEJWz0PMwSfg5ShMMRN65xGWOCu32OoRpxpl/sWnG1
	l9i5jM5uH/fLmfU1yGPcZUiLGyMwyXH/JSi47AIcJ0zWtAHNGQwFzk9nROb2A2WV57vlI6pDNiqcY
	/OHDC9nEIoNWy0Defb82tWoDHrwPWFxQvQEXEe33JhXAn5dblWuY8FATU/9hNWae9xm6lHAe6RVH4
	NI8A/ZOQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wHeCu-00000000weZ-0xhn;
	Tue, 28 Apr 2026 08:54:16 +0000
Received: from mail-westusazon11012019.outbound.protection.outlook.com ([52.101.43.19] helo=SJ2PR03CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wHeCX-00000000wJZ-3dXJ
	for linux-arm-kernel@lists.infradead.org;
	Tue, 28 Apr 2026 08:54:07 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=GUjG8g2ymZTTmNFx3Tn0fmkWxy8Kk5UCuF1aC64odMqvF4J4wc+ZqERBqfzRRsqX2YdCUG/E5NMU0AqWcgfQZmt5IWqobXbY+rwhGDYol23kjj0ihFWFHmqy3A9O59YwaQ0JhgN3gIh+sVk54ra0THPOHLbPHkh+w6Ms0u21Hccf/OI3ezknkAvg+PD8rSByGdU7GytiwP2ljLWDArjvOEsmLH3CbdJH5Cl2JGArz8o/TuR9OqLecv6ed0XNHACCHVvkCvX3fuq0JTi4XAfIJ+wrTszWdmPmmEebqBiGyeQ+YbFyeQ0O22hGDQVFlitGQaPgD+uFo1LNZqTmh28wUA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=YNvSzmo8PxtYDxH+iUZiaWOO2AJ7iRrwNgPX/z2xyYA=;
 b=ySiiljqGm1VUh4UTmOYZa/4Lyf3qk68ke6l87sz3S1K17F1I12UnSgknj/z6C4xJv4iz+HJddeRtESfJ4zsoq1aMcCI5JQ1WngGPU580T+RJPRITtXda8FOHD39HkmeiBIe39WxyngeWC88vTYBVYydSEtLS13cJ7SnLbZF1SOdGSn97gnfQFHTzLB31HN2QMR6S7dUvaK2kQeaggnXq6d33sSjjtirdcqJnWK+OHsXy+Ku0eZPj85rkhuvRj15VOskIWYvgbVkCiUgHCXYSzpWtMlF2j2hilrQOnOw+Ywx2YhFgWdPjaHmSRMRLcUM7aPSh0j9Mg1MGh1PT4nLL8A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.21.195) smtp.rcpttodomain=nxp.com smtp.mailfrom=ti.com; dmarc=pass
 (p=quarantine sp=none pct=100) action=none header.from=ti.com; dkim=none
 (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=YNvSzmo8PxtYDxH+iUZiaWOO2AJ7iRrwNgPX/z2xyYA=;
 b=M52iA5ekDS6qSGpJeNP/JUJJILayNfzMI4RTZIz/0+e+r79t2f9TzvWW5KP39ENYXy7oN0qkk5kRxHyDXHUOthsL9WanDvcLmZ7rZXxRxX1tTTMHzB/z1aXzDdFcjgaHymSUqHrs67kp53w4ib57n9JhmheBhdFw4bJKCkw4kis=
Received: from PH8PR05CA0020.namprd05.prod.outlook.com (2603:10b6:510:2cc::27)
 by DS7PR10MB4959.namprd10.prod.outlook.com (2603:10b6:5:3a0::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9846.26; Tue, 28 Apr
 2026 08:53:50 +0000
Received: from SN1PEPF00036F40.namprd05.prod.outlook.com
 (2603:10b6:510:2cc:cafe::19) by PH8PR05CA0020.outlook.office365.com
 (2603:10b6:510:2cc::27) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9846.27 via Frontend Transport; Tue,
 28 Apr 2026 08:53:49 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.21.195)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.21.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.21.195; helo=flwvzet201.ext.ti.com; pr=C
Received: from flwvzet201.ext.ti.com (198.47.21.195) by
 SN1PEPF00036F40.mail.protection.outlook.com (10.167.248.24) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9846.18 via Frontend Transport; Tue, 28 Apr 2026 08:53:48 +0000
Received: from DFLE206.ent.ti.com (10.64.6.64) by flwvzet201.ext.ti.com
 (10.248.192.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Tue, 28 Apr
 2026 03:53:16 -0500
Received: from DFLE205.ent.ti.com (10.64.6.63) by DFLE206.ent.ti.com
 (10.64.6.64) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Tue, 28 Apr
 2026 03:53:16 -0500
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DFLE205.ent.ti.com
 (10.64.6.63) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Tue, 28 Apr 2026 03:53:16 -0500
Received: from uda0498651.dhcp.ti.com (uda0498651.dhcp.ti.com [172.24.233.239])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 63S8q6MW623293;
	Tue, 28 Apr 2026 03:53:12 -0500
From: Sai Sree Kartheek Adivi <s-adivi@ti.com>
To: <peter.ujfalusi@gmail.com>, <vkoul@kernel.org>, <robh@kernel.org>,
	<krzk+dt@kernel.org>, <conor+dt@kernel.org>, <nm@ti.com>,
	<ssantosh@kernel.org>, <dmaengine@vger.kernel.org>,
	<devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <vigneshr@ti.com>,
	<Frank.li@nxp.com>, <s-adivi@ti.com>
CC: <r-sharma3@ti.com>, <gehariprasath@ti.com>
Subject: [PATCH v6 14/19] dt-bindings: dma: ti: Add K3 PKTDMA V2
Date: Tue, 28 Apr 2026 14:21:43 +0530
Message-ID: <20260428085202.1724548-15-s-adivi@ti.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260428085202.1724548-1-s-adivi@ti.com>
References: <20260428085202.1724548-1-s-adivi@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN1PEPF00036F40:EE_|DS7PR10MB4959:EE_
X-MS-Office365-Filtering-Correlation-Id: e9dcfca8-daf5-4768-e903-08dea503a9b9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|36860700016|1800799024|82310400026|376014|7416014|56012099003|18002099003|22082099003|921020;
X-Microsoft-Antispam-Message-Info: 2qgHDO51QND2SG3RWpQTfZxTW4t1NIcN0jx0L/cXb5AQT5Nd0ROO+tq4gT4ZI/g0OplZ7w176rQymU2SYIccEzKOPiUXh3lIdq1UHkHyR7/RDYfMuI0W5xen2hYmrs2tDzVXJ8+94aBMP114uzevSPzGg+wLFZlcach4M5KOUAmNV9/6m0wc8WSSvc8LfyLT8npSGdsoCGKIhXjSQ8MSMYb1cfUi0NcOPJIIaOL4D8SNs9RMr17vdYrzfJhM/+oylS8ZalOvRbdu4EbJVVZqnmpZtIYuhuGtYbb8gf6UpZKfZSZFmQ1mUo9Gu83Jk2dm41Zw/XpPh7e1djdHw0L09QkfBF46c3I1h+iqjTCmT91ActVsFEhOeLWbBxzJSTtwi5E3exuAf0kgNsxUkprBDp0sp9QiGocZV3Rdayy+hm6uCdKtFVGngQX+5+tu7g36eqdbcqqhWwVSNpbSnAQW/OcBZZq+Ize4ozJTYzkBSWPXEVGKz23WurqAbxvUhnXht5Z45hV2NLUig3qkIiybINmhbH5tTqDpKjpz0Yla75jrJF+o42vvrbUJhAZ5+aqDlxixlc8Mkcjnxaj4GOan9oMF7i+7n9sPdQQHjOMV69NwTohOF0hkOx44amUqKQQazgyuLhitTgMadAdLe5dzeBPq0wOXgH4WWiymt45YdhsBtW1T4d+lTm4DJ81DEz+XSbz8Ys09S6+QiBLP3xgM0JM3AgPm793B6d5ouQS7ZOrWYApz5Tu29U5MordKYufTqJrHi/W9/af0JIcW2yjnHw==
X-Forefront-Antispam-Report: CIP:198.47.21.195;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:flwvzet201.ext.ti.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(36860700016)(1800799024)(82310400026)(376014)(7416014)(56012099003)(18002099003)(22082099003)(921020);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: AOtNrfAKW1KrMFfo9IgiXt6OCVYVzJyIEJthOoKGSyjfpyyHg2fuc4Ar/yu/EVTed7bYTa/aWRLMF0cyucaJcqIyVxWLWynH6EWH0LfhGkrOc4fymQdyPQ/eg4jEG2cX7LZIddiAuzOabFazChza+6LB0Sm5oK8AU326EoQamigQmq2IQIEKDhjGE5O9yrjml4D/hHg0iGY9oJAqKHlGgOHCC5lIBBqN2vqWjW9j4vujpUvaPxysLHhu6LDO5BiXXoEfZvw8kR3SfxxVk6dEmZ7AV/XlxTAnv/BzO1rUZEW+TCYmx+dpMdqhDZNxYBeJuggpypReHtbQ/7PmnbDM3ISHf5HKB0Kzr6/Xk2XZH/RKMbhts3B6WZiXDe3zpFszQXeokDVo5RmUVgSxNIGvSTmAb9mzyU3md3bOfp0VCc7nnDW/vUvj1Tld3ATNXkRr
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Apr 2026 08:53:48.3430
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: e9dcfca8-daf5-4768-e903-08dea503a9b9
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.21.195];Helo=[flwvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: SN1PEPF00036F40.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR10MB4959
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260428_015353_991382_F753AE78 
X-CRM114-Status: GOOD (  14.93  )
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
 .../bindings/dma/ti/ti,am62l-dmss-pktdma.yaml | 101 ++++++++++++++++++
 1 file changed, 101 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/dma/ti/ti,am62l-dmss-pktdma.yaml

diff --git a/Documentation/devicetree/bindings/dma/ti/ti,am62l-dmss-pktdma.yaml b/Documentation/devicetree/bindings/dma/ti/ti,am62l-dmss-pktdma.yaml
new file mode 100644
index 0000000000000..32bcb0ba502c1
--- /dev/null
+++ b/Documentation/devicetree/bindings/dma/ti/ti,am62l-dmss-pktdma.yaml
@@ -0,0 +1,101 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+# Copyright (C) 2024-2025 Texas Instruments Incorporated
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/dma/ti/ti,am62l-dmss-pktdma.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Texas Instruments K3 DMSS PKTDMA V2
+
+maintainers:
+  - Sai Sree Kartheek Adivi <s-adivi@ti.com>
+
+description:
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
+      - description: Packet DMA Control & Status
+      - description: Channel Realtime
+      - description: Ring Realtime
+
+  reg-names:
+    items:
+      - const: gcfg
+      - const: chanrt
+      - const: ringrt
+
+  "#address-cells":
+    const: 0
+
+  "#dma-cells":
+    const: 2
+    description: |
+      cell 1: Channel identification for the peripheral
+        PSI-L thread ID of the remote (to PKTDMA) end.
+        Valid ranges for thread ID depends on the data movement direction:
+        for source thread IDs (rx): 0 - 0x7fff
+        for destination thread IDs (tx): 0x8000 - 0xffff
+
+        Please refer to the device documentation for the PSI-L thread map and
+        also the PSI-L peripheral chapter for the correct thread ID.
+
+      cell 2: ASEL value for the channel
+
+  interrupts:
+    minItems: 1
+    maxItems: 112
+    description:
+      Interrupts for DMA channels.
+
+  interrupt-names:
+    minItems: 1
+    maxItems: 112
+    items:
+      pattern: "^chan[0-9]+$"
+    description:
+      The name of the interrupt corresponding to the DMA channel.
+
+required:
+  - compatible
+  - reg
+  - reg-names
+  - "#address-cells"
+  - "#dma-cells"
+  - interrupts
+  - interrupt-names
+
+unevaluatedProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/interrupt-controller/arm-gic.h>
+    #include <dt-bindings/interrupt-controller/irq.h>
+
+    dma-controller@485c0000 {
+        compatible = "ti,am62l-dmss-pktdma";
+        reg = <0x485c0000 0x4000>,
+              <0x48900000 0x80000>,
+              <0x47200000 0x100000>;
+        reg-names = "gcfg", "chanrt", "ringrt";
+
+        #address-cells = <0>;
+        #dma-cells = <2>;
+
+        interrupts = <GIC_SPI 500 IRQ_TYPE_LEVEL_HIGH>,
+                     <GIC_SPI 501 IRQ_TYPE_LEVEL_HIGH>;
+        interrupt-names = "chan64", "chan65";
+    };
-- 
2.53.0


