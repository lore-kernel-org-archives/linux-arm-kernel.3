Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5F23FD42BAA
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 12 Nov 2024 16:34:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=UquK6XLNUwFafkFAKsgJB95GDRY9sNski5ZAMvr/D/U=; b=fuHdGK0D1lqge6udNxj1MQshbV
	8Yqd/Eebx4gSKhrNxKPT2EfEkl8Y1+ssCtQXNDIvZB085FtA8Ls6+QgxYzMEWU8pyjPaGg+pqiWHf
	7am3bzUSiF304Sp25tMVCG7LFmoxG9WsDP1pfFalNfSpLtmGvFW8x0Er8anGy6aGIkl4de6t1JNgB
	d6hhSW0loGfKT0lslcE02OhzDGFjZwP3niti+GRF6FA+MTuhh9fjjaIaAcSUutqJY2Qya2dNm0DZ6
	JBpapf2siwJkMgsQ+zliWzlCNUmp/Dg+LnYWjI6cjCP0Qvht+9gmDClQaMjF6YBH14wtFrHI/VA9D
	8cUIO6Uw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tAtq8-00000004ACK-2dqM;
	Tue, 12 Nov 2024 16:34:04 +0000
Received: from mx07-00178001.pphosted.com ([185.132.182.106])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tAtk8-000000048iu-05ig
	for linux-arm-kernel@lists.infradead.org;
	Tue, 12 Nov 2024 16:27:54 +0000
Received: from pps.filterd (m0369458.ppops.net [127.0.0.1])
	by mx07-00178001.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4ACBuauL028527;
	Tue, 12 Nov 2024 17:24:42 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=selector1; bh=
	UquK6XLNUwFafkFAKsgJB95GDRY9sNski5ZAMvr/D/U=; b=brqAkqnnUPkgSGz7
	mZjejOiNK4Kzsx85GzFyhmzi2szqDsVyTDk70IIQk7QCtMi6OqG93HpivP8dAKl3
	8banIemQ8O/hIJYQ14I+mgj2dLVV35k1wl4lrtb5n44DfzmLU2LyyNRrWkTR7MVz
	6gB2Ke/vF6aD1lNRy0TFH99xMkWS/7z8pqnbEpKfrclb22I/NTdBhZCfFxkFh3JU
	oXQx6Nz4uJ9UigCfZhbExc5mAAqrX76El3YtVh495kcJ3Gnevt2GoXsJuQw8rq1J
	GhAbLMyE+bY2Z8Dg6ZHelV495tvcnBmpZ0Q8D7qShpQ7kJgPQxY1n7hI0w7IBeLt
	gZBilA==
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
	by mx07-00178001.pphosted.com (PPS) with ESMTPS id 42tj64354u-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 12 Nov 2024 17:24:42 +0100 (CET)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
	by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id C8B1F40044;
	Tue, 12 Nov 2024 17:23:17 +0100 (CET)
Received: from Webmail-eu.st.com (shfdag1node3.st.com [10.75.129.71])
	by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 5295C2A2795;
	Tue, 12 Nov 2024 17:20:17 +0100 (CET)
Received: from localhost (10.129.178.212) by SHFDAG1NODE3.st.com
 (10.75.129.71) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.37; Tue, 12 Nov
 2024 17:20:17 +0100
From: Christian Bruel <christian.bruel@foss.st.com>
To: <lpieralisi@kernel.org>, <kw@linux.com>,
        <manivannan.sadhasivam@linaro.org>, <robh@kernel.org>,
        <bhelgaas@google.com>, <krzk+dt@kernel.org>, <conor+dt@kernel.org>,
        <mcoquelin.stm32@gmail.com>, <alexandre.torgue@foss.st.com>,
        <p.zabel@pengutronix.de>, <cassel@kernel.org>,
        <quic_schintav@quicinc.com>, <fabrice.gasnier@foss.st.com>
CC: <linux-pci@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-stm32@st-md-mailman.stormreply.com>,
        <linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
        Christian Bruel <christian.bruel@foss.st.com>
Subject: [PATCH 1/5] dt-bindings: PCI: Add STM32MP25 PCIe root complex bindings
Date: Tue, 12 Nov 2024 17:19:21 +0100
Message-ID: <20241112161925.999196-2-christian.bruel@foss.st.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20241112161925.999196-1-christian.bruel@foss.st.com>
References: <20241112161925.999196-1-christian.bruel@foss.st.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.129.178.212]
X-ClientProxiedBy: EQNCAS1NODE4.st.com (10.75.129.82) To SHFDAG1NODE3.st.com
 (10.75.129.71)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241112_082752_518315_D30277C0 
X-CRM114-Status: GOOD (  15.68  )
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
Supports 4 legacy interrupts and MSI interrupts from the ARM
GICv2m controller.

Allow tuning to change payload (default 128B) thanks to the
st,max-payload-size entry.
Can also limit the Maximum Read Request Size on downstream devices to the
minimum possible value between 128B and 256B.

STM32 PCIE may be in a power domain which is the case for the STM32MP25
based boards.
Supports wake# from wake-gpios

Signed-off-by: Christian Bruel <christian.bruel@foss.st.com>
---
 .../bindings/pci/st,stm32-pcie-host.yaml      | 149 ++++++++++++++++++
 1 file changed, 149 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/pci/st,stm32-pcie-host.yaml

diff --git a/Documentation/devicetree/bindings/pci/st,stm32-pcie-host.yaml b/Documentation/devicetree/bindings/pci/st,stm32-pcie-host.yaml
new file mode 100644
index 000000000000..d7d360b63a08
--- /dev/null
+++ b/Documentation/devicetree/bindings/pci/st,stm32-pcie-host.yaml
@@ -0,0 +1,149 @@
+# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/pci/st,stm32-pcie-host.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: STM32MP25 PCIe root complex driver
+
+maintainers:
+  - Christian Bruel <christian.bruel@foss.st.com>
+
+description:
+  PCIe root complex controller based on the Synopsys DesignWare PCIe core.
+
+select:
+  properties:
+    compatible:
+      const: st,stm32mp25-pcie-rc
+  required:
+    - compatible
+
+allOf:
+  - $ref: /schemas/pci/pci-host-bridge.yaml#
+  - $ref: /schemas/pci/snps,dw-pcie-common.yaml#
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
+  resets:
+    maxItems: 1
+
+  reset-names:
+    const: core
+
+  clocks:
+    maxItems: 1
+    description: PCIe system clock
+
+  clock-names:
+    const: core
+
+  phys:
+    maxItems: 1
+
+  phy-names:
+    const: pcie-phy
+
+  num-lanes:
+    const: 1
+
+  msi-parent:
+    maxItems: 1
+
+  reset-gpios:
+    description: GPIO controlled connection to PERST# signal
+    maxItems: 1
+
+  wake-gpios:
+    description: GPIO controlled connection to WAKE# input signal
+    maxItems: 1
+
+  st,limit-mrrs:
+    description: If present limit downstream MRRS to 256B
+    type: boolean
+
+  st,max-payload-size:
+    description: Maximum Payload size to use
+    $ref: /schemas/types.yaml#/definitions/uint32
+    enum: [128, 256]
+    default: 128
+
+  wakeup-source: true
+
+  power-domains:
+    maxItems: 1
+
+  access-controllers:
+    maxItems: 1
+
+if:
+  required:
+    - wakeup-source
+then:
+  required:
+    - wake-gpios
+
+required:
+  - interrupt-map
+  - interrupt-map-mask
+  - ranges
+  - resets
+  - reset-names
+  - clocks
+  - clock-names
+  - phys
+  - phy-names
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
+        num-lanes = <1>;
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
+        ranges = <0x01000000 0 0x10010000 0x10010000 0 0x10000>,
+                 <0x02000000 0 0x10020000 0x10020000 0 0x7fe0000>,
+                 <0x42000000 0 0x18000000 0x18000000 0 0x8000000>;
+        bus-range = <0x00 0xff>;
+        clocks = <&rcc CK_BUS_PCIE>;
+        clock-names = "core";
+        phys = <&combophy PHY_TYPE_PCIE>;
+        phy-names = "pcie-phy";
+        resets = <&rcc PCIE_R>;
+        reset-names = "core";
+        msi-parent = <&v2m0>;
+        wakeup-source;
+        wake-gpios = <&gpioh 5 (GPIO_ACTIVE_LOW | GPIO_PULL_UP)>;
+        access-controllers = <&rifsc 76>;
+        power-domains = <&CLUSTER_PD>;
+    };
-- 
2.34.1


