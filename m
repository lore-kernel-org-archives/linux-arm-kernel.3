Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C5FBEC369D2
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 18 Apr 2025 07:59:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=oH4biYNRIXbUPcZJxbqF385p1W7crfHf3KjlM5z89+Q=; b=duC+SY4ccXlJ3Md1nDZqECpoyO
	VvozAT/Sku4d67f89gkRjpZsFvDVG6pLcef0vZ7rStP8oY1EXp6f6upBcx7BqsRpyDi1uQ4OWz3Tr
	QB56g3QANNJg5xZE97YWFLgiPZfbWPzTY+rwWx7p1vtjeR7fHYfSVmrViq4OmJUQ5c6BIvka2YL8p
	h7D9tb9BF7plrryCidvAbuPIrlTzuQzz6knGzgYZF2TjXUJmiXqb/EVstNEBTuf4bSkXKrAt2sIu9
	/Zup3KZ7GtgbE6GOdT61hfJ4PkajEgCroDI9stkoTf+kguFYivaYfGELgZH3F31cFwKLqzOxYlLfm
	2qKbbPMg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u5gdQ-0000000FXlz-2pZy;
	Fri, 18 Apr 2025 07:59:41 +0000
Received: from mta-65-227.siemens.flowmailer.net ([185.136.65.227])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u5gBb-0000000FTZP-49BA
	for linux-arm-kernel@lists.infradead.org;
	Fri, 18 Apr 2025 07:30:57 +0000
Received: by mta-65-227.siemens.flowmailer.net with ESMTPSA id 20250418073054cb2dfdfa99db0467da
        for <linux-arm-kernel@lists.infradead.org>;
        Fri, 18 Apr 2025 09:30:54 +0200
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm2;
 d=siemens.com; i=huaqian.li@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc:References:In-Reply-To;
 bh=oH4biYNRIXbUPcZJxbqF385p1W7crfHf3KjlM5z89+Q=;
 b=MhmmKpvoP1mPw44HiJ3RiLjiBHPih8+nD719nw0Vzna9NCuV7EelAKVqIMbH+lNlFxORhA
 F8FQfuwx+0RLYO37/Ra8wUhhDiIMx9mpNeiLFlD2vc7MVpXCF5+yGYoV0AsRQE7C2Aaq1ZPN
 mFNr9UvXSxBBfUqWvVTewLklwni0K0z7WnnU+y+MrEdkcJcH0SkOl3+P0B2Vi3gw0Xn+qUv/
 lqc3kS2IG/87OK3rO10HxXHWSPzR4xOkofnUjJLYHECLoJbgVA9UBeKkfthk24spiSKPYYWB
 Qv/Cujl+Dj93idJ186UvK4IxIYV0ChXQzfpKjybyPzU8dyDmy1i+vS3Q==;
From: huaqian.li@siemens.com
To: helgaas@kernel.org,
	m.szyprowski@samsung.com,
	robin.murphy@arm.com
Cc: baocheng.su@siemens.com,
	bhelgaas@google.com,
	conor+dt@kernel.org,
	devicetree@vger.kernel.org,
	diogo.ivo@siemens.com,
	huaqian.li@siemens.com,
	jan.kiszka@siemens.com,
	kristo@kernel.org,
	krzk+dt@kernel.org,
	kw@linux.com,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-pci@vger.kernel.org,
	lpieralisi@kernel.org,
	nm@ti.com,
	robh@kernel.org,
	s-vadapalli@ti.com,
	ssantosh@kernel.org,
	vigneshr@ti.com,
	iommu@lists.linux.dev,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH v7 1/8] dt-bindings: soc: ti: Add AM65 peripheral virtualization unit
Date: Fri, 18 Apr 2025 15:30:19 +0800
Message-Id: <20250418073026.2418728-2-huaqian.li@siemens.com>
In-Reply-To: <20250418073026.2418728-1-huaqian.li@siemens.com>
References: <20241030205703.GA1219329@bhelgaas>
 <20250418073026.2418728-1-huaqian.li@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Flowmailer-Platform: Siemens
Feedback-ID: 519:519-959203:519-21489:flowmailer
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250418_003056_165408_4E8A0AEE 
X-CRM114-Status: GOOD (  10.94  )
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

From: Jan Kiszka <jan.kiszka@siemens.com>

The PVU allows to define a limited set of mappings for incoming DMA
requests to the system memory. It is not a real IOMMU, thus hooked up
under the TI SoC bindings.

Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>
Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Signed-off-by: Li Hua Qian <huaqian.li@siemens.com>
---
 .../bindings/soc/ti/ti,am654-pvu.yaml         | 51 +++++++++++++++++++
 1 file changed, 51 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/soc/ti/ti,am654-pvu.yaml

diff --git a/Documentation/devicetree/bindings/soc/ti/ti,am654-pvu.yaml b/Documentation/devicetree/bindings/soc/ti/ti,am654-pvu.yaml
new file mode 100644
index 000000000000..e4a5fc47d674
--- /dev/null
+++ b/Documentation/devicetree/bindings/soc/ti/ti,am654-pvu.yaml
@@ -0,0 +1,51 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+# Copyright (c) Siemens AG, 2024
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/soc/ti/ti,am654-pvu.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: TI AM654 Peripheral Virtualization Unit
+
+maintainers:
+  - Jan Kiszka <jan.kiszka@siemens.com>
+
+properties:
+  compatible:
+    enum:
+      - ti,am654-pvu
+
+  reg:
+    maxItems: 2
+
+  reg-names:
+    items:
+      - const: cfg
+      - const: tlbif
+
+  interrupts:
+    items:
+      - description: fault interrupt
+
+  interrupt-names:
+    items:
+      - const: pvu
+
+required:
+  - compatible
+  - reg
+  - interrupts
+  - interrupt-names
+
+additionalProperties: false
+
+examples:
+  - |
+    iommu@30f80000 {
+        compatible = "ti,am654-pvu";
+        reg = <0x30f80000 0x1000>,
+              <0x36000000 0x100000>;
+        reg-names = "cfg", "tlbif";
+        interrupts-extended = <&intr_main_navss 390>;
+        interrupt-names = "pvu";
+    };
-- 
2.34.1


