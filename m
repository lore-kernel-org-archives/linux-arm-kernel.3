Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E1C11C83F17
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 23 Jul 2025 04:00:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=oH4biYNRIXbUPcZJxbqF385p1W7crfHf3KjlM5z89+Q=; b=FbdZCV0lJxFOnZBpkuPJvPTwrs
	nL+rilVNXYIMg2YMgPptkNnowZDSpnJloglhlk9wgTVTx4Bg3o4vD/uHYVJpJwiGsWmONa7khd61A
	y/YVeDdElxKCiRhTMR5NWde3p/PH5DLcQjx8Q77qeb/DquS6VIsUtJgQBETq9jYGZ5Cgr85laSGDB
	qjBjSy7du61y86J2iJ9RQAmgXJMvtkpl7lCRwxgD+4PgJ8SHnEfAb56Dp1wFprvFYny9IBL6c3FB7
	9u3aXoUnngrCvef8u8QbGmKeYflBnuxX13yUP1OIGPV8olupsTQCLYhsUcS8BtxmEkdZIfotaAb1E
	H9T3+ERg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ueQet-00000003xHx-0z4o;
	Wed, 23 Jul 2025 04:00:47 +0000
Received: from mta-65-227.siemens.flowmailer.net ([185.136.65.227])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ueQQK-00000003vg3-1cVe
	for linux-arm-kernel@lists.infradead.org;
	Wed, 23 Jul 2025 03:45:45 +0000
Received: by mta-65-227.siemens.flowmailer.net with ESMTPSA id 20250723034541976a327ba270dcefdb
        for <linux-arm-kernel@lists.infradead.org>;
        Wed, 23 Jul 2025 05:45:41 +0200
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm1;
 d=siemens.com; i=huaqian.li@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc:References:In-Reply-To;
 bh=oH4biYNRIXbUPcZJxbqF385p1W7crfHf3KjlM5z89+Q=;
 b=CWJjoRR5Q28TwSjnNhKITDRmrI/v4u193rEyZBlkoQnpEKePMrDCt6VKjba8IrnB+ULYr8
 vvCYIprbZzOfyDQfOLKwDrvNVz0ugQbAWQlHuSScjgWoMq/mrUpLzCRG0kF/IwxXyLreMO5O
 JPYZA2iwCZhmudS/RbfrQeYmbBjvLY60oJL6isMFk+zGpG0ckfw/OvG16P6BlhkOrPNNbMda
 Nqu7NmKjqCgtH3b0uueUTIsLKz9dfIxBkdNhcS2sSAmFScgR5J1VU4U1D9Bw8qysMIfGv6Dj
 /djwDC+kM8UQM7vnEsPyh0ophX7yjdLxh/ceXUwXf65hgg4ueqk1S7ng==;
From: huaqian.li@siemens.com
To: christophe.jaillet@wanadoo.fr
Cc: baocheng.su@siemens.com,
	bhelgaas@google.com,
	conor+dt@kernel.org,
	devicetree@vger.kernel.org,
	diogo.ivo@siemens.com,
	helgaas@kernel.org,
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
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH v11 1/7] dt-bindings: soc: ti: Add AM65 peripheral virtualization unit
Date: Wed, 23 Jul 2025 11:45:15 +0800
Message-Id: <20250723034521.138695-2-huaqian.li@siemens.com>
In-Reply-To: <20250723034521.138695-1-huaqian.li@siemens.com>
References: <20250723034521.138695-1-huaqian.li@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Flowmailer-Platform: Siemens
Feedback-ID: 519:519-959203:519-21489:flowmailer
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250722_204544_560340_460DCBDE 
X-CRM114-Status: GOOD (  11.16  )
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


