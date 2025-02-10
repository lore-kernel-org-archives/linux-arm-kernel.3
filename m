Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3E745C0219D
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 10 Feb 2025 13:37:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=YNxEfnNluDmAZ9BnyWTBCUGQ5/LGXiIbxdbUqUYLb+0=; b=BmMnPM7LvDjN+ta1dSZxiXxJVJ
	faOFiMR5etd3Z4AK8FuSMZvO64rFFx5aHzHzkb9JEMlWpXoPzmei9Bb4FpTVnTQ1qWqWXisuoD2M5
	prF+baMUcVp7L/2pXUSpaSJPwFwJbtPlgfCvFofjmkZnxuqiQx6hB8Wy5UylyJdSV+AachHHUu/XP
	D1U3A4u2KpPjoj/kSEwN9lBEZ0/L3tL0CYOgQ9AD5LgbL/03RS/frlQ1ELW8sa7LmUBL8NHSZv3Oa
	Jc2O2LyX/FJCC/oDdGNwvtAe88+GLMosi1zk3z3gJCnz24s/L06AxjENcRYU2fP/4WXwJYjsyLZ5o
	Na52g3uw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1thTxy-0000000Ha5Z-2tIa;
	Mon, 10 Feb 2025 13:36:50 +0000
Received: from mx07-00178001.pphosted.com ([185.132.182.106])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1thTix-0000000HWMZ-1xWZ
	for linux-arm-kernel@lists.infradead.org;
	Mon, 10 Feb 2025 13:21:21 +0000
Received: from pps.filterd (m0288072.ppops.net [127.0.0.1])
	by mx07-00178001.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 51AComCp009308;
	Mon, 10 Feb 2025 14:21:07 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=selector1; bh=
	YNxEfnNluDmAZ9BnyWTBCUGQ5/LGXiIbxdbUqUYLb+0=; b=S0Dd4nzImpK4blBN
	TDk/0O3x/8SJfOarCZqlmOs8d6l4p1fp8nAXDj6jN9ZhJaWt7Fli5UGlNSefeWde
	ocnpGlY9SJrk9O5J76i1rqBnn5qVAcPUQdBl2gWV1Yszkf6MCK3yb/BvU1GGzp1t
	ar///vdjEc1wcvp5dNasExKfZ5pP123Ewj15zpWKlFPd282L891z7Qv9WSRcURGy
	cf+SnsimxjTOemrxXhA+b4SbJzm24h/zf7DH501E3HDUeQNJyGV0i6QBX1ZluRnE
	B4DLxl28oBfMd0k0kx2AeKEojmWjYrGa2ICTcLFsyK0A5Sj46bni2HywdMu7Yw2u
	6gF3Kw==
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
	by mx07-00178001.pphosted.com (PPS) with ESMTPS id 44p0pypq6n-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 10 Feb 2025 14:21:06 +0100 (CET)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
	by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id 33B3A40048;
	Mon, 10 Feb 2025 14:19:35 +0100 (CET)
Received: from Webmail-eu.st.com (shfdag1node1.st.com [10.75.129.69])
	by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 6738525BCB9;
	Mon, 10 Feb 2025 14:18:34 +0100 (CET)
Received: from localhost (10.48.87.62) by SHFDAG1NODE1.st.com (10.75.129.69)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Mon, 10 Feb
 2025 14:18:34 +0100
From: <patrice.chotard@foss.st.com>
To: Mark Brown <broonie@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof
 Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Alexandre
 Torgue <alexandre.torgue@foss.st.com>,
        Philipp Zabel
	<p.zabel@pengutronix.de>,
        Maxime Coquelin <mcoquelin.stm32@gmail.com>,
        Greg
 Kroah-Hartman <gregkh@linuxfoundation.org>,
        Arnd Bergmann <arnd@arndb.de>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon <will@kernel.org>
CC: <linux-spi@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-stm32@st-md-mailman.stormreply.com>,
        <linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
        <christophe.kerello@foss.st.com>, <patrice.chotard@foss.st.com>
Subject: [PATCH v3 3/8] dt-bindings: memory-controllers: Add STM32 Octo Memory Manager controller
Date: Mon, 10 Feb 2025 14:18:21 +0100
Message-ID: <20250210131826.220318-4-patrice.chotard@foss.st.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20250210131826.220318-1-patrice.chotard@foss.st.com>
References: <20250210131826.220318-1-patrice.chotard@foss.st.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.48.87.62]
X-ClientProxiedBy: SAFCAS1NODE1.st.com (10.75.90.11) To SHFDAG1NODE1.st.com
 (10.75.129.69)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-02-10_07,2025-02-10_01,2024-11-22_01
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250210_052119_829020_B49C05BC 
X-CRM114-Status: GOOD (  18.08  )
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

From: Patrice Chotard <patrice.chotard@foss.st.com>

Add bindings for STM32 Octo Memory Manager (OMM) controller.

OMM manages:
  - the muxing between 2 OSPI busses and 2 output ports.
    There are 4 possible muxing configurations:
      - direct mode (no multiplexing): OSPI1 output is on port 1 and OSPI2
        output is on port 2
      - OSPI1 and OSPI2 are multiplexed over the same output port 1
      - swapped mode (no multiplexing), OSPI1 output is on port 2,
        OSPI2 output is on port 1
      - OSPI1 and OSPI2 are multiplexed over the same output port 2
  - the split of the memory area shared between the 2 OSPI instances.
  - chip select selection override.
  - the time between 2 transactions in multiplexed mode.

Signed-off-by: Patrice Chotard <patrice.chotard@foss.st.com>
---
 .../memory-controllers/st,stm32mp25-omm.yaml  | 201 ++++++++++++++++++
 1 file changed, 201 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/memory-controllers/st,stm32mp25-omm.yaml

diff --git a/Documentation/devicetree/bindings/memory-controllers/st,stm32mp25-omm.yaml b/Documentation/devicetree/bindings/memory-controllers/st,stm32mp25-omm.yaml
new file mode 100644
index 000000000000..c897e6bf490d
--- /dev/null
+++ b/Documentation/devicetree/bindings/memory-controllers/st,stm32mp25-omm.yaml
@@ -0,0 +1,201 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/memory-controllers/st,stm32mp25-omm.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: STM32 Octo Memory Manager (OMM)
+
+maintainers:
+  - Patrice Chotard <patrice.chotard@foss.st.com>
+
+description: |
+  The STM32 Octo Memory Manager is a low-level interface that enables an
+  efficient OCTOSPI pin assignment with a full I/O matrix (before alternate
+  function map) and multiplex of single/dual/quad/octal SPI interfaces over
+  the same bus. It Supports up to:
+    - Two single/dual/quad/octal SPI interfaces
+    - Two ports for pin assignment
+
+properties:
+  compatible:
+    const: st,stm32mp25-omm
+
+  "#address-cells":
+    const: 2
+
+  "#size-cells":
+    const: 1
+
+  ranges:
+    description: |
+      Reflects the memory layout with four integer values per OSPI instance.
+      Format:
+      <chip-select> 0 <registers base address> <size>
+    minItems: 2
+    maxItems: 2
+
+  reg:
+    items:
+      - description: OMM registers
+      - description: OMM memory map area
+
+  reg-names:
+    items:
+      - const: regs
+      - const: memory_map
+
+  memory-region:
+    description: |
+      Memory region shared between the 2 OCTOSPI instance.
+      One or two phandle to a node describing a memory mapped region
+      depending of child number.
+    minItems: 1
+    maxItems: 2
+
+  memory-region-names:
+    description: |
+      OCTOSPI instance's name to which memory region is associated
+    items:
+      enum: [ospi1, ospi2]
+    minItems: 1
+    maxItems: 2
+
+  clocks:
+    maxItems: 1
+
+  resets:
+    maxItems: 1
+
+  access-controllers:
+    maxItems: 1
+
+  st,syscfg-amcr:
+    $ref: /schemas/types.yaml#/definitions/phandle-array
+    description: |
+      The Address Mapping Control Register (AMCR) is used to split the 256MB
+      memory map area shared between the 2 OSPI instance. The Octo Memory
+      Manager sets the AMCR depending of the memory-region configuration.
+      The memory split bitmask description is:
+        - 000: OCTOSPI1 (256 Mbytes), OCTOSPI2 unmapped
+        - 001: OCTOSPI1 (192 Mbytes), OCTOSPI2 (64 Mbytes)
+        - 010: OCTOSPI1 (128 Mbytes), OCTOSPI2 (128 Mbytes)
+        - 011: OCTOSPI1 (64 Mbytes), OCTOSPI2 (192 Mbytes)
+        - 1xx: OCTOSPI1 unmapped, OCTOSPI2 (256 Mbytes)
+    items:
+      - description: phandle to syscfg
+      - description: register offset within syscfg
+      - description: register bitmask for memory split
+
+  st,omm-req2ack-ns:
+    description: |
+      In multiplexed mode (MUXEN = 1), this field defines the time in
+      nanoseconds between two transactions.
+
+  st,omm-cssel-ovr:
+    $ref: /schemas/types.yaml#/definitions/uint32
+    description: |
+      Configure the chip select selector override for the 2 OCTOSPIs.
+      - 0: OCTOSPI1 chip select send to NCS1 OCTOSPI2 chip select send to NCS1
+      - 1: OCTOSPI1 chip select send to NCS2 OCTOSPI2 chip select send to NCS1
+      - 2: OCTOSPI1 chip select send to NCS1 OCTOSPI2 chip select send to NCS2
+      - 3: OCTOSPI1 chip select send to NCS2 OCTOSPI2 chip select send to NCS2
+    minimum: 0
+    maximum: 3
+
+  st,omm-mux:
+    $ref: /schemas/types.yaml#/definitions/uint32
+    description: |
+      Configure the muxing between the 2 OCTOSPIs busses and the 2 output ports.
+      - 0: direct mode, default
+      - 1: mux OCTOSPI1 and OCTOSPI2 to port 1
+      - 2: swapped mode
+      - 3: mux OCTOSPI1 and OCTOSPI2 to port 2
+    minimum: 0
+    maximum: 3
+
+  power-domains:
+    maxItems: 1
+
+patternProperties:
+  ^spi@[a-f0-9]+$:
+    type: object
+    $ref: /schemas/spi/st,stm32mp25-ospi.yaml#
+    description: Required spi child node
+
+required:
+  - compatible
+  - reg
+  - "#address-cells"
+  - "#size-cells"
+  - clocks
+  - st,syscfg-amcr
+  - ranges
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/clock/st,stm32mp25-rcc.h>
+    #include <dt-bindings/interrupt-controller/arm-gic.h>
+    #include <dt-bindings/reset/st,stm32mp25-rcc.h>
+    ommanager@40500000 {
+      compatible = "st,stm32mp25-omm";
+      reg = <0x40500000 0x400>, <0x60000000 0x10000000>;
+      reg-names = "regs", "memory_map";
+      ranges = <0 0 0x40430000 0x400>,
+               <1 0 0x40440000 0x400>;
+      memory-region = <&mm_ospi1>, <&mm_ospi2>;
+      memory-region-names = "ospi1", "ospi2";
+      pinctrl-0 = <&ospi_port1_clk_pins_a
+                   &ospi_port1_io03_pins_a
+                   &ospi_port1_cs0_pins_a>;
+      pinctrl-1 = <&ospi_port1_clk_sleep_pins_a
+                   &ospi_port1_io03_sleep_pins_a
+                   &ospi_port1_cs0_sleep_pins_a>;
+      pinctrl-names = "default", "sleep";
+      clocks = <&rcc CK_BUS_OSPIIOM>;
+      resets = <&rcc OSPIIOM_R>;
+      access-controllers = <&rifsc 111>;
+      power-domains = <&CLUSTER_PD>;
+      #address-cells = <2>;
+      #size-cells = <1>;
+      st,syscfg-amcr = <&syscfg 0x2c00 0x7>;
+      st,omm-req2ack-ns = <0>;
+      st,omm-mux = <0>;
+      st,omm-cssel-ovr = <0>;
+
+      spi@40430000 {
+        compatible = "st,stm32mp25-ospi";
+        reg = <0 0 0x400>;
+        memory-region = <&mm_ospi1>;
+        interrupts = <GIC_SPI 163 IRQ_TYPE_LEVEL_HIGH>;
+        dmas = <&hpdma 2 0x62 0x00003121 0x0>,
+               <&hpdma 2 0x42 0x00003112 0x0>;
+        dma-names = "tx", "rx";
+        clocks = <&scmi_clk CK_SCMI_OSPI1>;
+        resets = <&scmi_reset RST_SCMI_OSPI1>, <&scmi_reset RST_SCMI_OSPI1DLL>;
+        access-controllers = <&rifsc 74>;
+        power-domains = <&CLUSTER_PD>;
+        #address-cells = <1>;
+        #size-cells = <0>;
+        st,syscfg-dlyb = <&syscfg 0x1000>;
+      };
+
+      spi@40440000 {
+        compatible = "st,stm32mp25-ospi";
+        reg = <1 0 0x400>;
+        memory-region = <&mm_ospi1>;
+        interrupts = <GIC_SPI 164 IRQ_TYPE_LEVEL_HIGH>;
+        dmas = <&hpdma 3 0x62 0x00003121 0x0>,
+               <&hpdma 3 0x42 0x00003112 0x0>;
+        dma-names = "tx", "rx";
+        clocks = <&scmi_clk CK_KER_OSPI2>;
+        resets = <&scmi_reset RST_SCMI_OSPI2>, <&scmi_reset RST_SCMI_OSPI1DLL>;
+        access-controllers = <&rifsc 75>;
+        power-domains = <&CLUSTER_PD>;
+        #address-cells = <1>;
+        #size-cells = <0>;
+        st,syscfg-dlyb = <&syscfg 0x1000>;
+      };
+    };
-- 
2.25.1


