Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AFC28D72368
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 23 Jan 2026 09:54:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=dt7SFNpRRmwCzfAPdXJL6wTGemkfb+ijvHXnv/nSzY0=; b=COxZUV/U3gYs0sJqxDCw9i2y3v
	GYgFbSgCrHvfppY29WaWhPd0w7ODInO2ItmCKTW5eCShHUK1RhfBFrC23vvUr0JJ+KM6hgKHQP39m
	bp021cTO7lMHJwpp+F9VKWibpXXq19VDuCs4a+JyMZ2QD6gqSnEhO12rC6SuBzd9QQhm/oTJSJk18
	pHWfL16U1KwV8Gm35pbZCS5yj9XuBpwpmWEXx1konzVc15c68cONRsCnpLKekJPChGMHenT0Q5B6x
	QvX8ky3M6DBPU2dlsxyVCbLSi0PmVNxOph4usdTgetA1Vd9Ku2nAQljvfkHKofWiNLu+bRHaii9Ot
	7nUzIhEA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vjDrq-00000008d9D-0H2L;
	Fri, 23 Jan 2026 09:54:14 +0000
Received: from mail-m32121.qiye.163.com ([220.197.32.121])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vjDrb-00000008cuW-0AlS
	for linux-arm-kernel@lists.infradead.org;
	Fri, 23 Jan 2026 09:54:02 +0000
Received: from albert-OptiPlex-7080.. (unknown [112.65.126.162])
	by smtp.qiye.163.com (Hmail) with ESMTP id 31bc9a762;
	Fri, 23 Jan 2026 17:53:51 +0800 (GMT+08:00)
From: Albert Yang <yangzh0906@thundersoft.com>
To: Ulf Hansson <ulf.hansson@linaro.org>,
	Adrian Hunter <adrian.hunter@intel.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Ge Gordon <gordon.ge@bst.ai>,
	Arnd Bergmann <arnd@arndb.de>
Cc: BST Linux Kernel Upstream Group <bst-upstream@bstai.top>,
	linux-mmc@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Albert Yang <yangzh0906@thundersoft.com>,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH v5 1/6] dt-bindings: mmc: add binding for BST DWCMSHC SDHCI controller
Date: Fri, 23 Jan 2026 17:53:37 +0800
Message-ID: <20260123095342.272505-2-yangzh0906@thundersoft.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260123095342.272505-1-yangzh0906@thundersoft.com>
References: <20260123095342.272505-1-yangzh0906@thundersoft.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-HM-Tid: 0a9bea46407509cckunm2b675df11c3d92
X-HM-MType: 1
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFITzdXWS1ZQUlXWQ8JGhUIEh9ZQVlDTU1DVkxLTEsaSxhOSR4ZGFYVFAkWGhdVEwETFh
	oSFyQUDg9ZV1kYEgtZQVlKSklVTU5VSklNVUpNSVlXWRYaDxIVHRRZQVlPS0hVSktJT09PSFVKS0
	tVSkJLS1kG
DKIM-Signature: a=rsa-sha256;
	b=G0Mp+95WLthVROKr3d15RQfSVmDxgMA+rddZtpSIqwfoTEiyB8f5WuTqV1ww8dNuCphKsZh26PEk3K0mqzdYVqJRXpIUe9BVUBXqwXnpvtdDpnT5XMhz+3BGxzl9oHTdBq2CHVbD4hTvvdT4hs5d9nVfUabqxdCIK8ernzoDEQA=; c=relaxed/relaxed; s=default; d=thundersoft.com; v=1;
	bh=dt7SFNpRRmwCzfAPdXJL6wTGemkfb+ijvHXnv/nSzY0=;
	h=date:mime-version:subject:message-id:from;
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260123_015359_497253_D614BE17 
X-CRM114-Status: GOOD (  12.57  )
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

Add device tree bindings for the Black Sesame Technologies
DWCMSHC SDHCI controller used in C1200 SoC.

The binding describes a Synopsys DesignWare Cores Mobile Storage
Host Controller with BST-specific extensions including:
- Two register regions (core SDHCI and CRM registers)
- Optional memory-region for bounce buffer support
- Fixed clock input

Signed-off-by: Ge Gordon <gordon.ge@bst.ai>
Signed-off-by: Albert Yang <yangzh0906@thundersoft.com>
Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

---
Changes for v5:
- Rename file from bst,dwcmshc-sdhci.yaml to bst,c1200-sdhci.yaml
- Fix example compatible string to match property definition
- Split from platform series per Arnd's feedback

Changes for v4:
- Change \$ref to sdhci-common.yaml#
- Change compatible to bst,c1200-sdhci

Changes for v3:
- Switch reg schema to explicit items with descriptions
- Improve example with bus node wrapper

Changes for v2:
- Simplify description, correct compatible string
---
 .../bindings/mmc/bst,c1200-sdhci.yaml         | 70 +++++++++++++++++++
 1 file changed, 70 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/mmc/bst,c1200-sdhci.yaml

diff --git a/Documentation/devicetree/bindings/mmc/bst,c1200-sdhci.yaml b/Documentation/devicetree/bindings/mmc/bst,c1200-sdhci.yaml
new file mode 100644
index 000000000000..8358bb70c333
--- /dev/null
+++ b/Documentation/devicetree/bindings/mmc/bst,c1200-sdhci.yaml
@@ -0,0 +1,70 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/mmc/bst,c1200-sdhci.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Black Sesame Technologies DWCMSHC SDHCI Controller
+
+maintainers:
+  - Ge Gordon <gordon.ge@bst.ai>
+
+allOf:
+  - $ref: sdhci-common.yaml#
+
+properties:
+  compatible:
+    const: bst,c1200-sdhci
+
+  reg:
+    items:
+      - description: Core SDHCI registers
+      - description: CRM registers
+
+  interrupts:
+    maxItems: 1
+
+  clocks:
+    maxItems: 1
+
+  clock-names:
+    items:
+      - const: core
+
+  memory-region:
+    maxItems: 1
+
+  dma-coherent: true
+
+required:
+  - compatible
+  - reg
+  - interrupts
+  - clocks
+  - clock-names
+
+unevaluatedProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/interrupt-controller/arm-gic.h>
+    #include <dt-bindings/interrupt-controller/irq.h>
+
+    bus {
+        #address-cells = <2>;
+        #size-cells = <2>;
+
+        mmc@22200000 {
+            compatible = "bst,c1200-sdhci";
+            reg = <0x0 0x22200000 0x0 0x1000>,
+                  <0x0 0x23006000 0x0 0x1000>;
+            interrupts = <GIC_SPI 144 IRQ_TYPE_LEVEL_HIGH>;
+            clocks = <&clk_mmc>;
+            clock-names = "core";
+            memory-region = <&mmc0_reserved>;
+            max-frequency = <200000000>;
+            bus-width = <8>;
+            non-removable;
+            dma-coherent;
+        };
+    };
-- 
2.43.0


