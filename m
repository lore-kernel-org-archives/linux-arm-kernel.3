Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A7B4BFF886C
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 28 Apr 2026 08:53:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=wTytVa4bNZiYGWAnVQ1DtFr3lqJwt/SysrwGOHCAreg=; b=d8gEFjQ4iOtuc9NU8GbHmEBPcO
	aAZ72Zbd5f7W4Iv9xROmp2TsCIC/6gGwFDE98BaLf+JmYulmP4nj3uILRHlYKXl4P3tKcPmUcilyh
	P9IGGYNYCjjzBKQ1bkXkhw6HrLoYcgffOngq6B5n8XBEO+JA4mSNEjh/dCgLRyTHlAK4zXYhNsITw
	y9NItQSUpZpbE1g9pe5tf4TW+1p/SuJCUxkHAO6FihTFeR9m1oVw9MZgdp4g/N3ioz/KPXClhKBRS
	32Me4iY48+W4cherbewbflxAD24oZZp6t0ukB4ufCCWCYt4OmXZYO1dxB4PZfq6nXgwgdpVkm/eqS
	Yi3LM70w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wHeC2-00000000vlb-3Uxl;
	Tue, 28 Apr 2026 08:53:22 +0000
Received: from mail-eastus2azon11010021.outbound.protection.outlook.com ([52.101.56.21] helo=BN1PR04CU002.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wHeBv-00000000veF-47U6
	for linux-arm-kernel@lists.infradead.org;
	Tue, 28 Apr 2026 08:53:18 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=LVU9J/d+IwuYTk6tWB1uBdf0LD/J78g6+6hMU8oht1ac1HCpDw/aTLCWG4sMKep/eq6zSl2uYRkjk7RYEy4DGohWvupQ3XHRNNY7yGXhJaOihJS3VejH0QpKhDaEflX7DSzOBkv6bhnBarAyMLq1YP9/ARrvdYgsUqA2N2ngi7lzDezT514XDz34F2aGxFhLYZ6r98fOmRG7W/AByYZdGFihE0nTKlu8YArpzTH2PzqRs67gksjqi8lIXvRbtCt8TTQs+0wimZ9AE4Ty6VaUWKHK0H3TeO+soCcVHY4Itm2fP2iNmsN2KfKlkXY7IYDlrRR0sEyCVOQlF8ukL+H2xg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=wTytVa4bNZiYGWAnVQ1DtFr3lqJwt/SysrwGOHCAreg=;
 b=NmUhZvDriR6c+puQ+7qf/26ZuK59hkgcyCGtS5+VXO/ZpZy7eEX3qVxNWMDIbLCq06iPnLDHyNC2GzRWmBgoWmsE4Uvx2OyzcYKH8wJJ++0VIiEhAe+UIfYKB575nmeUh1bn/NEM57JDzBXD8at+kVjprCbyz1yHxi6riRKRkTdqIsb+FtUX2PM0gUw9llbuzdkD5mA5DRxy055SPEKpg1YV9JlBJwVHGb4RFeM3cOaeBAMN4Wlq491j4bwIyfJKBZgAXFHY9/0hpzHKFrMFLigqqT3nwaoeuImZdV+lSRHirdw65lYli/94PwU8orz2DhBAOOx15cfaUEHlJYU1EA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.195) smtp.rcpttodomain=nxp.com smtp.mailfrom=ti.com; dmarc=pass
 (p=quarantine sp=none pct=100) action=none header.from=ti.com; dkim=none
 (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wTytVa4bNZiYGWAnVQ1DtFr3lqJwt/SysrwGOHCAreg=;
 b=v9tsyCg6Hnqru6VNkStx1rXQVuSQoXEq0ws0G6kiJBZ8cNF7hMcZccn9lsBLInn4rK8EvWSIabuaUiHUBUzFUqRor707ZD3EyMOWiw1s+8GRg9iEGbQwdkzy/gtXsYQcIg/9RZYbNZAw/cO+26Zr9biBO5hZC0ZjlXKyqXjmLBw=
Received: from MN2PR08CA0014.namprd08.prod.outlook.com (2603:10b6:208:239::19)
 by IA3PR10MB8590.namprd10.prod.outlook.com (2603:10b6:208:57b::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9846.26; Tue, 28 Apr
 2026 08:53:13 +0000
Received: from BL02EPF00021F6C.namprd02.prod.outlook.com
 (2603:10b6:208:239:cafe::bb) by MN2PR08CA0014.outlook.office365.com
 (2603:10b6:208:239::19) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9846.26 via Frontend Transport; Tue,
 28 Apr 2026 08:53:13 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.23.195)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.23.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.195; helo=lewvzet201.ext.ti.com; pr=C
Received: from lewvzet201.ext.ti.com (198.47.23.195) by
 BL02EPF00021F6C.mail.protection.outlook.com (10.167.249.8) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9846.18 via Frontend Transport; Tue, 28 Apr 2026 08:53:13 +0000
Received: from DLEE203.ent.ti.com (157.170.170.78) by lewvzet201.ext.ti.com
 (10.4.14.104) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Tue, 28 Apr
 2026 03:53:12 -0500
Received: from DLEE214.ent.ti.com (157.170.170.117) by DLEE203.ent.ti.com
 (157.170.170.78) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Tue, 28 Apr
 2026 03:53:11 -0500
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DLEE214.ent.ti.com
 (157.170.170.117) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Tue, 28 Apr 2026 03:53:11 -0500
Received: from uda0498651.dhcp.ti.com (uda0498651.dhcp.ti.com [172.24.233.239])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 63S8q6MV623293;
	Tue, 28 Apr 2026 03:53:07 -0500
From: Sai Sree Kartheek Adivi <s-adivi@ti.com>
To: <peter.ujfalusi@gmail.com>, <vkoul@kernel.org>, <robh@kernel.org>,
	<krzk+dt@kernel.org>, <conor+dt@kernel.org>, <nm@ti.com>,
	<ssantosh@kernel.org>, <dmaengine@vger.kernel.org>,
	<devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <vigneshr@ti.com>,
	<Frank.li@nxp.com>, <s-adivi@ti.com>
CC: <r-sharma3@ti.com>, <gehariprasath@ti.com>
Subject: [PATCH v6 13/19] dt-bindings: dma: ti: Add K3 BCDMA V2
Date: Tue, 28 Apr 2026 14:21:42 +0530
Message-ID: <20260428085202.1724548-14-s-adivi@ti.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260428085202.1724548-1-s-adivi@ti.com>
References: <20260428085202.1724548-1-s-adivi@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL02EPF00021F6C:EE_|IA3PR10MB8590:EE_
X-MS-Office365-Filtering-Correlation-Id: c1d6b2ab-6df3-405f-d25e-08dea50394c6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|36860700016|1800799024|82310400026|376014|7416014|56012099003|18002099003|22082099003|921020;
X-Microsoft-Antispam-Message-Info: k2Vufs1Z22aP0zmmlb9R12OmgPsHy7NgXeygkB/A2cnnwXyhesFipJy2jCkDkHroAfr3e74Fx05hM9NWEIYOS6CN0KqQZDu9qoY3XutZJNBKIufZ4XQpMAWfovA0AtUXdZrQiL5MVuMj+APhXWG1GrFlFJfLoRbwLNJG4Slod1EIy7kjszdSoI9ZZc2Vkzi1Ct3wM6dH3+LyNH0CD12enkh/1xbluZYKPZcpzlXFpZkk9LHLF0DNPJuWOnSYJtP2lCcJgsMvSaQg8c7nyPtT+vKKsC6ge4roA5gP6SERRudlWk0X0F9K0NytlFAUMh7WmmjhLESnDg2zt5IUzOvSIlab7XXKF6q6Mz8I3Y1B3/uoGwv8Nqqha7QqnkLXuBHG797/S/fJ/pZdtnj9SaXT7zlyM1PRmcw5KyHThKkEUuU1iXej+f6NdlTGPixNMKqM7fhG98hydA7pO8VN1s/JGmj31qUhoxjb/xgG6vZ7xGlm1rGkCEl6BgZMue8gPm7LspUptWVx0Hu9DdhKLX0L68gIWg+v1NzG+SiGjrnUP4TqU9WY30m0DM8/vGqhOPmgFi7yAnztHBz8Wzgnnz1e9InDoB5z8wQ7GYvr0zT2HKyMQrnEjBnV29uTiiJCCty6VfBSZA8J6fS1rXAhtjYMjwIhS7+OCKL2mv6KNWWhPKbXNKek0XzShUbKXoylgkxwgVG3h6b02dRJY+8bxs/abJDbYqBFCmOrAO3zX74Kzh0daJiVhNLnxq7y28R1aBRoD4GkNp/yNV34fSOWm2jcdg==
X-Forefront-Antispam-Report: CIP:198.47.23.195;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:lewvzet201.ext.ti.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700016)(1800799024)(82310400026)(376014)(7416014)(56012099003)(18002099003)(22082099003)(921020);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: MH2JnPEoQ+EVpdv51MFx7pSf9qm5yssqVqiB/l3+o4370gzIVOsVj1o5iqdLXgKfMUkNUZzURoGcLw8m/BAD8sqtcN4NJnKTgP8eX/Tdmcb7Mge8XpmgIcd+1OzvvUWHQOPjCVk2PekTbPykIU6rsAeHhtgIqZPVgygxQll0Wuqpk8I9gdT6QJiNxH7UEOnU7BDmuszRafQdzOTenw1YsME3AoAEvW6j2PeQfoP+qg7fhh9f6TCTW598MnDdNjmEEZwVOOh6XiCXuxhMrVfSc9/vqg80KHl8pvdmoEBOdQV6pI0r0uNkpedOAN+FvsYjV6tWbS8JGSVos9FtBY3aUSAzVyseEyZjg0/eERSBpxC8eG9lkEsI8PS20y46R02wG39wMpWGu4jNCuPuc7p//NWq5Mu9a0U517Oy4t/BQuulCMJ4xo1RxYbYpWSfZTjC
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Apr 2026 08:53:13.1550
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: c1d6b2ab-6df3-405f-d25e-08dea50394c6
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.23.195];Helo=[lewvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: BL02EPF00021F6C.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA3PR10MB8590
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260428_015316_083482_6C1A17B9 
X-CRM114-Status: GOOD (  16.00  )
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
Texas Instruments K3 Block Copy DMA (BCDMA) V2.

BCDMA V2 is introduced as part of AM62L.

Signed-off-by: Sai Sree Kartheek Adivi <s-adivi@ti.com>
---
 .../bindings/dma/ti/ti,am62l-dmss-bcdma.yaml  | 121 ++++++++++++++++++
 1 file changed, 121 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/dma/ti/ti,am62l-dmss-bcdma.yaml

diff --git a/Documentation/devicetree/bindings/dma/ti/ti,am62l-dmss-bcdma.yaml b/Documentation/devicetree/bindings/dma/ti/ti,am62l-dmss-bcdma.yaml
new file mode 100644
index 0000000000000..28dcfce5633ce
--- /dev/null
+++ b/Documentation/devicetree/bindings/dma/ti/ti,am62l-dmss-bcdma.yaml
@@ -0,0 +1,121 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+# Copyright (C) 2024-25 Texas Instruments Incorporated
+# Author: Sai Sree Kartheek Adivi <s-adivi@ti.com>
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/dma/ti/ti,am62l-dmss-bcdma.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Texas Instruments K3 DMSS BCDMA V2
+
+maintainers:
+  - Sai Sree Kartheek Adivi <s-adivi@ti.com>
+
+description:
+  The BCDMA V2 is intended to perform similar functions as the TR
+  mode channels of K3 UDMA-P.
+  BCDMA V2 includes block copy channels and Split channels.
+
+  Block copy channels mainly used for memory to memory transfers, but with
+  optional triggers a block copy channel can service peripherals by accessing
+  directly to memory mapped registers or area.
+
+  Split channels can be used to service PSI-L based peripherals.
+  The peripherals can be PSI-L native or legacy, non PSI-L native peripherals
+  with PDMAs. PDMA is tasked to act as a bridge between the PSI-L fabric and the
+  legacy peripheral.
+
+allOf:
+  - $ref: /schemas/dma/dma-controller.yaml#
+
+properties:
+  compatible:
+    const: ti,am62l-dmss-bcdma
+
+  reg:
+    items:
+      - description: BCDMA Control & Status Registers region
+      - description: Block Copy Channel Realtime Registers region
+      - description: Channel Realtime Registers region
+      - description: Ring Realtime Registers region
+
+  reg-names:
+    items:
+      - const: gcfg
+      - const: bchanrt
+      - const: chanrt
+      - const: ringrt
+
+  "#address-cells":
+    const: 0
+
+  "#dma-cells":
+    const: 4
+    description: |
+      cell 1: Trigger type for the channel
+        0 - disable / no trigger
+        1 - internal channel event
+        2 - external signal
+        3 - timer manager event
+
+      cell 2: parameter for the trigger:
+        if cell 1 is 0 (disable / no trigger):
+          Unused, ignored
+        if cell 1 is 1 (internal channel event):
+          channel number whose TR event should trigger the current channel.
+        if cell 1 is 2 or 3 (external signal or timer manager event):
+          index of global interfaces that come into the DMA.
+
+          Please refer to the device documentation for global interface indexes.
+
+      cell 3: Channel number for the peripheral
+
+        Please refer to the device documentation for the channel map.
+
+      cell 4: ASEL value for the channel
+
+  interrupts:
+    minItems: 1
+    maxItems: 144
+    description:
+      Interrupts for DMA channels.
+
+  interrupt-names:
+    minItems: 1
+    maxItems: 144
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
+    dma-controller@485c4000 {
+        compatible = "ti,am62l-dmss-bcdma";
+        reg = <0x485c4000 0x4000>,
+              <0x48880000 0x10000>,
+              <0x48800000 0x80000>,
+              <0x47000000 0x200000>;
+        reg-names = "gcfg", "bchanrt", "chanrt", "ringrt";
+
+        #address-cells = <0>;
+        #dma-cells = <4>;
+
+        interrupts = <GIC_SPI 385 IRQ_TYPE_LEVEL_HIGH>,
+                     <GIC_SPI 386 IRQ_TYPE_LEVEL_HIGH>;
+        interrupt-names = "chan49", "chan50";
+    };
-- 
2.53.0


