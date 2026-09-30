Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 461B2CA5FC1
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 30 Sep 2026 07:42:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:CC:To:In-Reply-To:References
	:Message-ID:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=tCnC9y32ACX//JDPXdBN4Rcze8igdbe7INojLa5JDJ4=; b=UtGPwI4R6Ceta7WwYjGP6AIBzK
	mPnYm8kQAXEoYD+6uNU+Iq7WhVst0zTw77lIK4Y5RjiHh/KeRo5xTJzKWsuX1l9pOZiuOK088twbs
	8ZSwbLbbou9BXfW9qvxGMEMtz/cJk081Wvme7aK9/bvLpKrhHmfO35rRagmc2m3912FqxypOmE8Po
	ANrm6fVw50NsnrPrFsG0SI8USLg/k+5ZGAF9T4r2PQ7GKOf/w+6Cd01bBQOqYszw2O6sI8zhzVIUv
	VlG9hZHQZHAbLtXg0bx4vNfO3SSkAAVUaBlI2Ilyom0FNir0sjB+HFy6OW5E77sgeuoxVwnxYAZFc
	89rT40kg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBowz-00000005IhN-0Ap7;
	Wed, 30 Sep 2026 07:42:01 +0000
Received: from mail-northeuropeazlp170110003.outbound.protection.outlook.com ([2a01:111:f403:c200::3] helo=DU2PR03CU002.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBowv-00000005IgC-1cZn
	for linux-arm-kernel@lists.infradead.org;
	Wed, 30 Sep 2026 07:41:58 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=kTYO6WRusOBfqE/y+Gt+r+f3WzjFoeb3hCJ+6jrrgZX5kK6Lw1D/4TmzXbZu1rSo0RGTVgvmAT3SZKafcjFvmOw2u9Z/NsFEr4/YniyODd7I81td94igw64NZYu5WsXjodmKMrw6ZN0IOrlzzF5YntjegkYg4IDfWl70CEheYo+IU54BUa0VmPg3xNCiu/aXTPg+yW6AQk4XdPHauuAFWwRmFSmOBvHU8f7ACLtr3qBMnrwsUamMKX6/NMJEkV1Q9Ho6apD/jiheMd3O9tCBpF7F5Y0OdsFu719LUnOxjqE4SYFxhbDUwydjm5g8e6Rh1rZMy9UiM0XYp0oaS5dMcA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=tCnC9y32ACX//JDPXdBN4Rcze8igdbe7INojLa5JDJ4=;
 b=nObfICAcQf9zwMYsy1gzB81clh57rp1pGFr4iDK53qmqrcdTJRtGf9dgpGWT4YgE0JiKSCVLtmh5gL40ngbmeuiAVDkFuisTIQPUq4e+pTpB4g2cWLGpVDfz965wLMCGDotw3ZsK0RXl41BSnCJ8T274WasupThcOOKfBEKfRTHhM2ozfYBgYiUCV0FEiypnLa1taW9pazZfjTcc8I3Um2UU66cZaVhSodAEF0TJt2sMF2AlxyAL5H5OfFHiMvRpgZdFm5ckkfWkIxuN+MosvHrLLq8+knSSIJj4rhMMlj1WC1dlu1XsTWvN78BfRr6BIvfZFQIyBKNkW/X4ZkAUMg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 164.130.1.60) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=foss.st.com;
 dmarc=fail (p=none sp=none pct=100) action=none header.from=foss.st.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tCnC9y32ACX//JDPXdBN4Rcze8igdbe7INojLa5JDJ4=;
 b=MNTH36Bfy/lpkEKeyViWVwIiyMiWlEAbGW4Z/GsYQ6b1VPcVohgmdmhC3prn5VOZ4kw1eGzECQqHPujdDhSTsyNtNfRb4hUwwUlldar+RNda4710hGrTuZhEmOvgBbNVHYlR1teHgEmNG4G/KHL/Q4rtDOJrfjkoBpMqjnOrE40OPNrPPCD+fHRZaw41lOIHjYxZnUfRlHh+NiLk6QOIsNeDiXNFS1MnJvzVYLQC8ViKOEnHbwkFZq9Ub9qn79Q6S8FvvHqvwC5/AXngw9a8pcuQv+FlG14GgBXkjwSKHDGvriXy3Ui09RFgQej41aZ59IprYswhN3Z58Yqx3R0G8g==
Received: from AS8PR04CA0185.eurprd04.prod.outlook.com (2603:10a6:20b:2f3::10)
 by AS2PR10MB7575.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:20b:546::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.451.24; Wed, 30 Sep
 2026 07:41:45 +0000
Received: from DU6PEPF0000A7DD.eurprd02.prod.outlook.com
 (2603:10a6:20b:2f3:cafe::55) by AS8PR04CA0185.outlook.office365.com
 (2603:10a6:20b:2f3::10) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.472.15 via Frontend Transport; Wed,
 30 Sep 2026 07:41:45 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=fail (sender IP
 is 164.130.1.60) smtp.mailfrom=foss.st.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=none header.from=foss.st.com;
Received-SPF: Fail (protection.outlook.com: domain of foss.st.com does not
 designate 164.130.1.60 as permitted sender) receiver=protection.outlook.com;
 client-ip=164.130.1.60; helo=smtpO365.st.com;
Received: from smtpO365.st.com (164.130.1.60) by
 DU6PEPF0000A7DD.mail.protection.outlook.com (10.167.8.37) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.472.14 via Frontend Transport; Wed, 30 Sep 2026 07:41:45 +0000
Received: from STKDAG1NODE1.st.com (10.75.128.132) by smtpO365.st.com
 (10.250.44.72) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.43; Wed, 30 Sep
 2026 09:47:38 +0200
Received: from localhost (10.48.87.93) by STKDAG1NODE1.st.com (10.75.128.132)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.43; Wed, 30 Sep
 2026 09:41:44 +0200
From: Patrice Chotard <patrice.chotard@foss.st.com>
Date: Wed, 30 Sep 2026 09:41:42 +0200
Subject: [PATCH v2 1/3] dt-bindings: nvmem: add STM32MPX TAMP backup
 registers
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20260930-upstream_nvram_reworked-v2-1-cfda749ee0b7@foss.st.com>
References: <20260930-upstream_nvram_reworked-v2-0-cfda749ee0b7@foss.st.com>
In-Reply-To: <20260930-upstream_nvram_reworked-v2-0-cfda749ee0b7@foss.st.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Maxime Coquelin
	<mcoquelin.stm32@gmail.com>, Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Christophe Roullier <christophe.roullier@foss.st.com>, Srinivas Kandagatla
	<srini@kernel.org>
CC: Simeon Marijon <simeon.marijon@foss.st.com>,
	<linux-stm32@st-md-mailman.stormreply.com>, <devicetree@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
	Patrice Chotard <patrice.chotard@foss.st.com>
X-Mailer: b4 0.16.0
X-Originating-IP: [10.48.87.93]
X-ClientProxiedBy: STKCAS1NODE1.st.com (10.75.128.134) To STKDAG1NODE1.st.com
 (10.75.128.132)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU6PEPF0000A7DD:EE_|AS2PR10MB7575:EE_
X-MS-Office365-Filtering-Correlation-Id: e63c23de-5f27-4fad-6651-08df1ec64730
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|23010399003|376014|1800799024|36860700016|82310400026|18002099003|22082099003|13003099007|3023799007|10067099003|56012099006|11063799006;
X-Microsoft-Antispam-Message-Info: NQrIpuCfpv5/m1mHrQJv/NS/Z/0tpKpPtTlbQsqfbfuBp2hsnIRT57RZfioPVZPyBS2T+FHExyRKFVFXYREtaEtTnlL0lfvA2/YTMcMkKCPRXpvxubsgFL1sHPVczsW1XLUqLJMCh8AgodskbqfHERs0+Sf/ZiT9xYrUUEFucWaOj/4NurhQhpe1+DiL2jm+zqtLvCc00aiU7l8nrpGndjtOlItbMSBSADVtsiDeSwfp60s0879hv9PAd8ay/AGTvZIUGZNpE9LwqjXcnqQuQlIn+I3oMNeN9UmJ5gSxHw/03i35rrlUWqXOmlvtPplBYjWOK/jIex8P9527a0jX6lGbI6wDOQHpxXt2LkrdBoGTw/HAx4wuzBrKGjmlSaSr2Yg6/174/yyzP8JdXQgjD4rYbFiBhxR83eidxNaj+xwOqRO6XgNqRHLW8ZbFTMl2DdT3lJPrPNH5EW66NTh2Ve99xEQsWs71iYXA5x5aPUUseLznKJhfw+/fcAY1ZshOFBQW92mxXoAuqmbnqAXZGZLQEIVTgwp6t2Rl1E/0/RppCVQqognDwNPMqV0+WMw/uJpOOinNXSZ4paEmjhP2ajTnQ4ymZPCb5twpAa3sRArB1qjblksplErrevQtgMQLzS2qPHAE+UfdhsG2HCcj8w==
X-Forefront-Antispam-Report: CIP:164.130.1.60;CTRY:IT;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:smtpO365.st.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(23010399003)(376014)(1800799024)(36860700016)(82310400026)(18002099003)(22082099003)(13003099007)(3023799007)(10067099003)(56012099006)(11063799006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: wxYr92qkWjWYoXiFHJmxjrCMHis9T5aWDPIM0rniXsYr7cG8huXkbqvt4BjAJ0iMsnslhYTzqIcwGXN4oM7tCBaEXkx3PHsiklcm4gigjb+6MKzfF1C9XR7Ri+Qg38Zm6r7HfgSFhPUpuOmXAF9WuMX/gK8RSeUwcWXvr6+EH/hhqIcT79I9ZWKeHqLndskO3zEe64sfWXRfucHk+WBueVaz+2W4PJ4ztidKMNhi/ul7cTSzotrwad2UDDQQ3L5NT/SSljFt0/CP5R3W/x7m8Kz67UrCUBKc8KkHzQ7svkk/xDPPtU6uzP5F0JjWswuGMjGCIL5B+OyKBl9oRnaUGh/BCpSnJ4C8uKVhBVYWjcqAecYzIuV7JdaeKDojqmqjejP/OvRQ7yIjZn7GQ758yx03pyyo4ks8HvISdtnRtLDrHOVTsIZfegRJ1WZ6Rv5b
X-OriginatorOrg: foss.st.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Sep 2026 07:41:45.5390
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: e63c23de-5f27-4fad-6651-08df1ec64730
X-MS-Exchange-CrossTenant-Id: 75e027c9-20d5-47d5-b82f-77d7cd041e8f
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=75e027c9-20d5-47d5-b82f-77d7cd041e8f;Ip=[164.130.1.60];Helo=[smtpO365.st.com]
X-MS-Exchange-CrossTenant-AuthSource: DU6PEPF0000A7DD.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS2PR10MB7575
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260930_004157_458125_968362FC 
X-CRM114-Status: GOOD (  13.14  )
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

From: Simeon Marijon <simeon.marijon@foss.st.com>

Adds the binding documentation for TAMP backup registers.
The backup registers is a part of the TAMP device of STM32 MPU.

Signed-off-by: Simeon Marijon <simeon.marijon@foss.st.com>
Reviewed-by: Rob Herring (Arm) <robh@kernel.org>
Signed-off-by: Patrice Chotard <patrice.chotard@foss.st.com>
---
 .../bindings/nvmem/st,stm32-tamp-nvram.yaml        | 57 ++++++++++++++++++++++
 MAINTAINERS                                        |  7 +++
 2 files changed, 64 insertions(+)

diff --git a/Documentation/devicetree/bindings/nvmem/st,stm32-tamp-nvram.yaml b/Documentation/devicetree/bindings/nvmem/st,stm32-tamp-nvram.yaml
new file mode 100644
index 000000000000..4af3b88db566
--- /dev/null
+++ b/Documentation/devicetree/bindings/nvmem/st,stm32-tamp-nvram.yaml
@@ -0,0 +1,57 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/nvmem/st,stm32-tamp-nvram.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: STMicroelectronics STM32 backup registers as NVMEM
+
+description: |
+  This represents STM32 backup registers area presented as nvmem cells.
+  This contains various information (e.g. boot mode passed to bootloaders).
+
+maintainers:
+  - Simeon Marijon <simeon.marijon@foss.st.com>
+  - Patrice Chotard <patrice.chotard@foss.st.com>
+
+allOf:
+  - $ref: nvmem.yaml#
+
+properties:
+  compatible:
+    enum:
+      - st,stm32mp15-tamp-nvram
+      - st,stm32mp25-tamp-nvram
+
+  reg:
+    description:
+      TAMP Registers bank location and size.
+    maxItems: 1
+
+required:
+  - compatible
+  - reg
+
+unevaluatedProperties: false
+
+examples:
+  - |
+    nvram: nvram@5c00a100 {
+      reg = <0x5c00a100 0x80>;
+      compatible = "st,stm32mp15-tamp-nvram";
+
+      nvmem-layout {
+        compatible = "fixed-layout";
+        #address-cells = <1>;
+        #size-cells = <1>;
+
+        /* Data cells */
+        wakeup_sec: tamp-bkp@0 {
+            reg = <0x0 0x4>;
+        };
+        boot_mode: tamp-bkp@50 {
+            /*see boot mode selection feature*/
+            reg = <0x50 0x4>;
+        };
+      };
+    };
diff --git a/MAINTAINERS b/MAINTAINERS
index 3a19da74d00c..b634c037c229 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -26261,6 +26261,13 @@ F:	Documentation/arch/arm/stm32/stm32-dma-mdma-chaining.rst
 F:	Documentation/devicetree/bindings/dma/stm32/
 F:	drivers/dma/stm32/
 
+STM32 TAMP DRIVERS
+M:	Simeon Marijon <simeon.marijon@foss.st.com>
+M:	Patrice Chotard <patrice.chotard@foss.st.com>
+L:	linux-stm32@st-md-mailman.stormreply.com (moderated for non-subscribers)
+S:	Maintained
+F:	Documentation/devicetree/bindings/nvmem/st,stm32-tamp-nvram.yaml
+
 STM32 TIMER/LPTIMER DRIVERS
 M:	Fabrice Gasnier <fabrice.gasnier@foss.st.com>
 S:	Maintained

-- 
2.43.0


