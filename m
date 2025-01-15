Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3F7BEC02183
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 15 Jan 2025 09:30:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=R+v8YEDPM9qwCaN40fdrufdPM9Z1gKJlioLogDnlb4Y=; b=bFPgsH0ldwZ0R98U0MI2Wq6daw
	lQBLipgwG6scR/CPJPBzLsm8qCpf94XcBjU2irFjKOH4H7W7h+7y3lIvPghVAVq1my7N/Y0KHq7b0
	wMkiC+7C8VND3pECuo9WCYS8rSsarRgR0ImkXXfyiq6chuNeOtDkwXBuEw6gRVryYwSQhqd8frdDu
	jUFKtfDTguZbvSfgIDARt0Rhsb2gXXDsg2g74wsWVS2vATunQ4rNwbPRA8W6kraq1eeIsSSBSo2kw
	X0UOZx9AyR7qiKuIpiwfoMWT/zR9ZOhigEZGLZ3qaUeH8NRWE0Mz3FTsQ1H9N18/k2ezWK4cKxp7t
	Lx3v1xuQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tXzjQ-0000000BKYF-0Wiy;
	Wed, 15 Jan 2025 09:30:36 +0000
Received: from mx07-00178001.pphosted.com ([185.132.182.106])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tXzeY-0000000BJ7m-3ZMB
	for linux-arm-kernel@lists.infradead.org;
	Wed, 15 Jan 2025 09:25:36 +0000
Received: from pps.filterd (m0369458.ppops.net [127.0.0.1])
	by mx07-00178001.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 50F3vKUp006090;
	Wed, 15 Jan 2025 10:25:22 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=selector1; bh=
	R+v8YEDPM9qwCaN40fdrufdPM9Z1gKJlioLogDnlb4Y=; b=k70vEt5I++WQPKFH
	JTsMbrPO/zB/Oh8J0VrnQgmgvjXSsLlbUSyJSWCL+0jghS78o2PKxi9aSeEOD9zC
	OHNPEatic41NnPF7QGDOJ+brwVz1pahl4sWzXq14MZVb0Zhlrt2hkAaLTOJlwQha
	NmOKzQx9geR3W88Au4D2g18HOVMI/+Gq6muAoheJaO7JLPDQvCeWHEsxATSD81XG
	4fX98K9jILQwrHMhK4mkC7oPS9T+K8ftu8OdnpcowkXJp3UBt51QXzlMvITLVWhz
	timHTbX/JuvZw1WkO1qqOvcMRiu4Z2EwxdHDuCBf2TNl936PKfz9z1Tw9oWpwsEM
	l4TlOA==
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
	by mx07-00178001.pphosted.com (PPS) with ESMTPS id 4465jns5p6-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 15 Jan 2025 10:25:22 +0100 (CET)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
	by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id C916440048;
	Wed, 15 Jan 2025 10:23:53 +0100 (CET)
Received: from Webmail-eu.st.com (shfdag1node3.st.com [10.75.129.71])
	by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 0BE2E246459;
	Wed, 15 Jan 2025 10:22:41 +0100 (CET)
Received: from localhost (10.129.178.212) by SHFDAG1NODE3.st.com
 (10.75.129.71) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Wed, 15 Jan
 2025 10:22:40 +0100
From: Christian Bruel <christian.bruel@foss.st.com>
To: <christian.bruel@foss.st.com>, <bhelgaas@google.com>,
        <lpieralisi@kernel.org>, <kw@linux.com>,
        <manivannan.sadhasivam@linaro.org>, <robh@kernel.org>,
        <krzk+dt@kernel.org>, <conor+dt@kernel.org>,
        <mcoquelin.stm32@gmail.com>, <alexandre.torgue@foss.st.com>,
        <jingoohan1@gmail.com>, <p.zabel@pengutronix.de>,
        <johan+linaro@kernel.org>, <quic_schintav@quicinc.com>,
        <cassel@kernel.org>
CC: <linux-pci@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-stm32@st-md-mailman.stormreply.com>,
        <linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
        <fabrice.gasnier@foss.st.com>
Subject: [PATCH v3 01/10] dt-bindings: PCI: Add STM32MP25 PCIe Root Complex bindings
Date: Wed, 15 Jan 2025 10:21:25 +0100
Message-ID: <20250115092134.2904773-2-christian.bruel@foss.st.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250115092134.2904773-1-christian.bruel@foss.st.com>
References: <20250115092134.2904773-1-christian.bruel@foss.st.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.129.178.212]
X-ClientProxiedBy: SHFCAS1NODE2.st.com (10.75.129.73) To SHFDAG1NODE3.st.com
 (10.75.129.71)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-01-15_03,2025-01-15_02,2024-11-22_01
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250115_012535_199049_71F1383A 
X-CRM114-Status: GOOD (  14.40  )
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

Document the bindings for STM32MP25 PCIe Controller configured in
root complex mode.

Supports 4 INTx and MSI interrupts from the ARM GICv2m controller.

STM32 PCIe may be in a power domain which is the case for the STM32MP25
based boards.

Supports WAKE# from wake-gpios

Signed-off-by: Christian Bruel <christian.bruel@foss.st.com>
---
 .../bindings/pci/st,stm32-pcie-common.yaml    |  43 +++++++
 .../bindings/pci/st,stm32-pcie-host.yaml      | 120 ++++++++++++++++++
 2 files changed, 163 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/pci/st,stm32-pcie-common.yaml
 create mode 100644 Documentation/devicetree/bindings/pci/st,stm32-pcie-host.yaml

diff --git a/Documentation/devicetree/bindings/pci/st,stm32-pcie-common.yaml b/Documentation/devicetree/bindings/pci/st,stm32-pcie-common.yaml
new file mode 100644
index 000000000000..9ee25bb25aac
--- /dev/null
+++ b/Documentation/devicetree/bindings/pci/st,stm32-pcie-common.yaml
@@ -0,0 +1,43 @@
+# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/pci/st,stm32-pcie-common.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: STM32MP25 PCIe RC/EP controller
+
+maintainers:
+  - Christian Bruel <christian.bruel@foss.st.com>
+
+description:
+  STM32MP25 PCIe RC/EP common properties
+
+properties:
+  clocks:
+    maxItems: 1
+    description: PCIe system clock
+
+  resets:
+    maxItems: 1
+
+  phys:
+    maxItems: 1
+
+  phy-names:
+    const: pcie-phy
+
+  power-domains:
+    maxItems: 1
+
+  access-controllers:
+    maxItems: 1
+
+  reset-gpios:
+    description: GPIO controlled connection to PERST# signal
+    maxItems: 1
+
+required:
+  - clocks
+  - resets
+
+additionalProperties: true
diff --git a/Documentation/devicetree/bindings/pci/st,stm32-pcie-host.yaml b/Documentation/devicetree/bindings/pci/st,stm32-pcie-host.yaml
new file mode 100644
index 000000000000..b5b8c92522e0
--- /dev/null
+++ b/Documentation/devicetree/bindings/pci/st,stm32-pcie-host.yaml
@@ -0,0 +1,120 @@
+# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/pci/st,stm32-pcie-host.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: STMicroelectronics STM32MP25 PCIe Root Complex
+
+maintainers:
+  - Christian Bruel <christian.bruel@foss.st.com>
+
+description:
+  PCIe root complex controller based on the Synopsys DesignWare PCIe core.
+
+allOf:
+  - $ref: /schemas/pci/snps,dw-pcie.yaml#
+  - $ref: /schemas/pci/st,stm32-pcie-common.yaml#
+
+properties:
+  compatible:
+    const: st,stm32mp25-pcie-rc
+
+  reg:
+    items:
+      - description: Data Bus Interface (DBI) registers.
+      - description: PCIe configuration registers.
+
+  reg-names:
+    items:
+      - const: dbi
+      - const: config
+
+  msi-parent:
+    maxItems: 1
+
+  wake-gpios:
+    description: GPIO used as WAKE# input signal
+    maxItems: 1
+
+  wakeup-source: true
+
+dependentRequired:
+  wakeup-source: [ wake-gpios ]
+
+patternProperties:
+  '^pcie@[0-2],0$':
+    type: object
+    $ref: /schemas/pci/pci-pci-bridge.yaml#
+
+    properties:
+      reg:
+        maxItems: 1
+
+      phys:
+        maxItems: 1
+
+      phy-names:
+        const: pcie-phy
+
+    required:
+      - phys
+      - phy-names
+      - ranges
+
+    unevaluatedProperties: false
+
+required:
+  - interrupt-map
+  - interrupt-map-mask
+  - ranges
+  - dma-ranges
+
+unevaluatedProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/clock/st,stm32mp25-rcc.h>
+    #include <dt-bindings/gpio/gpio.h>
+    #include <dt-bindings/interrupt-controller/arm-gic.h>
+    #include <dt-bindings/phy/phy.h>
+    #include <dt-bindings/reset/st,stm32mp25-rcc.h>
+
+    pcie@48400000 {
+        compatible = "st,stm32mp25-pcie-rc";
+        device_type = "pci";
+        reg = <0x48400000 0x400000>,
+              <0x10000000 0x10000>;
+        reg-names = "dbi", "config";
+        #interrupt-cells = <1>;
+        interrupt-map-mask = <0 0 0 7>;
+        interrupt-map = <0 0 0 1 &intc 0 0 GIC_SPI 264 IRQ_TYPE_LEVEL_HIGH>,
+                        <0 0 0 2 &intc 0 0 GIC_SPI 265 IRQ_TYPE_LEVEL_HIGH>,
+                        <0 0 0 3 &intc 0 0 GIC_SPI 266 IRQ_TYPE_LEVEL_HIGH>,
+                        <0 0 0 4 &intc 0 0 GIC_SPI 267 IRQ_TYPE_LEVEL_HIGH>;
+        #address-cells = <3>;
+        #size-cells = <2>;
+        ranges = <0x01000000 0x0 0x00000000 0x10010000 0x0 0x10000>,
+                 <0x02000000 0x0 0x10020000 0x10020000 0x0 0x7fe0000>,
+                 <0x42000000 0x0 0x18000000 0x18000000 0x0 0x8000000>;
+        dma-ranges = <0x42000000 0x0 0x80000000 0x80000000 0x0 0x80000000>;
+        clocks = <&rcc CK_BUS_PCIE>;
+        resets = <&rcc PCIE_R>;
+        msi-parent = <&v2m0>;
+        wakeup-source;
+        wake-gpios = <&gpioh 5 (GPIO_ACTIVE_LOW | GPIO_PULL_UP)>;
+        reset-gpios = <&gpioj 8 GPIO_ACTIVE_LOW>;
+        access-controllers = <&rifsc 68>;
+        power-domains = <&CLUSTER_PD>;
+
+        pcie@0,0 {
+          device_type = "pci";
+          reg = <0x0 0x0 0x0 0x0 0x0>;
+          phys = <&combophy PHY_TYPE_PCIE>;
+          phy-names = "pcie-phy";
+          #address-cells = <3>;
+          #size-cells = <2>;
+          ranges;
+        };
+
+    };
-- 
2.34.1


