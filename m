Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5A7B7C021A4
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 24 Feb 2025 15:59:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=qGD73/6Hfje+CHtFjpnoM4cVHsKMuplCC1K3yOtX1GM=; b=J6EhjXUxZJXIUGKFt7Sk5teytl
	JoK0QWdhnW8atmrMU4T538nZQm68P5ZPq5nnwjSkxkkO67Yzl7TkJ+aU5Q2AFW9rQPHlVFq2TUvkD
	/AYaPAgD3TdLlyu0X355j+4v+mMHdrfkEECwM4/LE0uWJ57NIlOpm+uKh5+ztBFmN7yYyYUBz8ay3
	yTNhXlJGHmNNlmvP+TjAesa1ncwUbl7NCMkxC2mQjlvKfp/n3E51ooJI5xFZlwznBny62bZ3Z5gTI
	r+UDG/DYnK19Wr+5UeDSkC2+BD8Je6BGs/GQF1/Z4bJmI7nxvLTqWvO0Sg24fH2rXiia9STo8mhgi
	z2Zm4/2g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tmarn-0000000ENeX-1ukc;
	Mon, 24 Feb 2025 15:59:35 +0000
Received: from mx07-00178001.pphosted.com ([185.132.182.106])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tmaa0-0000000EK3m-1mwF
	for linux-arm-kernel@lists.infradead.org;
	Mon, 24 Feb 2025 15:41:14 +0000
Received: from pps.filterd (m0369458.ppops.net [127.0.0.1])
	by mx07-00178001.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 51OBmmff006971;
	Mon, 24 Feb 2025 16:41:00 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=selector1; bh=
	qGD73/6Hfje+CHtFjpnoM4cVHsKMuplCC1K3yOtX1GM=; b=zExIzboDG8htA5Ac
	UTn2MdezQEdiUgh0gZ/dRHHNAM0IidelkQafWQk29jCd7sXXWaFm3M3BW9i+PTwV
	jP4W70ZeKmcIf/Sg5V+rJ/Jwpw5NmZpMo+HO9d2w76PsKxXWeciNB0wupaMiWlq+
	3WtRjsMWW/R+rSaPrYDdU72YJnqrrF7xaZzQmV38bqYMLO1N924cwP3O0ZwahDDm
	uPmo5Xc2WtrdsyEE1sDpkiE66QX2n6+gRti3Y5/dKdar5jSPs9mieZeyO39+xAcg
	x1oZHn0FnN1xzQlp1aNxb1bmDTU8lpzltKmRt1uPCtG+F8vP7GnZjesxmZwp2KkG
	jV3Lcw==
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
	by mx07-00178001.pphosted.com (PPS) with ESMTPS id 44ys145ysq-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 24 Feb 2025 16:41:00 +0100 (CET)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
	by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id DE1CE40046;
	Mon, 24 Feb 2025 16:39:35 +0100 (CET)
Received: from Webmail-eu.st.com (shfdag1node3.st.com [10.75.129.71])
	by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id E14805248D1;
	Mon, 24 Feb 2025 16:33:40 +0100 (CET)
Received: from localhost (10.129.178.212) by SHFDAG1NODE3.st.com
 (10.75.129.71) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Mon, 24 Feb
 2025 16:33:40 +0100
From: Christian Bruel <christian.bruel@foss.st.com>
To: <christian.bruel@foss.st.com>, <lpieralisi@kernel.org>, <kw@linux.com>,
        <manivannan.sadhasivam@linaro.org>, <robh@kernel.org>,
        <bhelgaas@google.com>, <krzk+dt@kernel.org>, <conor+dt@kernel.org>,
        <mcoquelin.stm32@gmail.com>, <alexandre.torgue@foss.st.com>,
        <p.zabel@pengutronix.de>, <johan+linaro@kernel.org>,
        <cassel@kernel.org>, <quic_schintav@quicinc.com>
CC: <fabrice.gasnier@foss.st.com>, <linux-pci@vger.kernel.org>,
        <devicetree@vger.kernel.org>,
        <linux-stm32@st-md-mailman.stormreply.com>,
        <linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>
Subject: [PATCH v5 1/9] dt-bindings: PCI: Add STM32MP25 PCIe Root Complex bindings
Date: Mon, 24 Feb 2025 16:33:05 +0100
Message-ID: <20250224153313.3416318-2-christian.bruel@foss.st.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250224153313.3416318-1-christian.bruel@foss.st.com>
References: <20250224153313.3416318-1-christian.bruel@foss.st.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.129.178.212]
X-ClientProxiedBy: EQNCAS1NODE4.st.com (10.75.129.82) To SHFDAG1NODE3.st.com
 (10.75.129.71)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-02-24_06,2025-02-24_02,2024-11-22_01
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250224_074112_773879_2F6127B1 
X-CRM114-Status: GOOD (  14.02  )
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
root complex mode with one root port.

Supports 4 INTx and MSI interrupts from the ARM GICv2m controller.

STM32 PCIe may be in a power domain which is the case for the STM32MP25
based boards.

Supports WAKE# from wake-gpios

Signed-off-by: Christian Bruel <christian.bruel@foss.st.com>
Reviewed-by: Rob Herring (Arm) <robh@kernel.org>
---
 .../bindings/pci/st,stm32-pcie-common.yaml    |  33 ++++++
 .../bindings/pci/st,stm32-pcie-host.yaml      | 112 ++++++++++++++++++
 2 files changed, 145 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/pci/st,stm32-pcie-common.yaml
 create mode 100644 Documentation/devicetree/bindings/pci/st,stm32-pcie-host.yaml

diff --git a/Documentation/devicetree/bindings/pci/st,stm32-pcie-common.yaml b/Documentation/devicetree/bindings/pci/st,stm32-pcie-common.yaml
new file mode 100644
index 000000000000..5adbff259204
--- /dev/null
+++ b/Documentation/devicetree/bindings/pci/st,stm32-pcie-common.yaml
@@ -0,0 +1,33 @@
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
+  power-domains:
+    maxItems: 1
+
+  access-controllers:
+    maxItems: 1
+
+required:
+  - clocks
+  - resets
+
+additionalProperties: true
diff --git a/Documentation/devicetree/bindings/pci/st,stm32-pcie-host.yaml b/Documentation/devicetree/bindings/pci/st,stm32-pcie-host.yaml
new file mode 100644
index 000000000000..26f852e6f5b7
--- /dev/null
+++ b/Documentation/devicetree/bindings/pci/st,stm32-pcie-host.yaml
@@ -0,0 +1,112 @@
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
+      reset-gpios:
+        description: GPIO controlled connection to PERST# signal
+        maxItems: 1
+
+      wake-gpios:
+        description: GPIO used as WAKE# input signal
+        maxItems: 1
+
+    required:
+      - phys
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
+        access-controllers = <&rifsc 68>;
+        power-domains = <&CLUSTER_PD>;
+
+        pcie@0,0 {
+          device_type = "pci";
+          reg = <0x0 0x0 0x0 0x0 0x0>;
+          phys = <&combophy PHY_TYPE_PCIE>;
+          wake-gpios = <&gpioh 5 (GPIO_ACTIVE_LOW | GPIO_PULL_UP)>;
+          reset-gpios = <&gpioj 8 GPIO_ACTIVE_LOW>;
+          #address-cells = <3>;
+          #size-cells = <2>;
+          ranges;
+        };
+    };
-- 
2.34.1


