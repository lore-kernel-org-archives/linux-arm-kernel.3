Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 66B8BC02181
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 22 Jan 2025 14:20:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=fbURmtj1w4Bl6POcF1jfZygaVNDn8sfKJtaT7jz7se4=; b=uabYup6FmuLQR2o08AxUPi2z3O
	W8+GbwVygSCXLgHC77GLAyIk+Cs8mupX+ARikVAyGSkwkuVbRgPzMZVVgdKkffgRILM1/fG14d3IV
	lAPaN42DF/VMPvL6yILC04uJS3Ss3l4kEeOas6jlMdMfC9gQ2pM9+vHfJd4bX4kDIvy8tJFM/Y0PI
	85V2gKXQd7X2sI07bwI+dX2sJmkDXzmeveb/fEPaSCHi4pfU9A7vi6nXxdN6yS67TtYVydX3o0fUI
	1qynmFgaWF5kHe1axehwK3bsON5HdI6es2ykI2q761+SXQm4eMqXwVkY+mA8A1P1SxKvM1DKBqDuY
	HrjgohVg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tabaf-0000000APju-3pQn;
	Wed, 22 Jan 2025 14:20:21 +0000
Received: from mx07-00178001.pphosted.com ([185.132.182.106])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tabTm-0000000AOBD-3WDP
	for linux-arm-kernel@lists.infradead.org;
	Wed, 22 Jan 2025 14:13:16 +0000
Received: from pps.filterd (m0288072.ppops.net [127.0.0.1])
	by mx07-00178001.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 50MDrE8j022425;
	Wed, 22 Jan 2025 15:12:56 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=selector1; bh=
	fbURmtj1w4Bl6POcF1jfZygaVNDn8sfKJtaT7jz7se4=; b=n8DGwPvUTzmgxj+x
	bjxG/lzi5nOm8HC8V/AoMXME5KsstR9V31ZAna/1x7vMaDmcnUewaGTFCTkiVLV2
	tW09RCTmFn60Ec6WotdaueWnMuV7oo6y/IwFwLRBgJiI4UmS6qCcP5a4lYAMHUgk
	EiGl2MfPc+vHYvkkPJ7ynJamTDdSDdJqJVQCAvfZtB+tuh5rBbloUiYyT9RTO8V0
	TM+W49iJkDv/NmllseoWbzSETfNjmcklcOdfggmnz/S/BcJfFQtyvMdg218Bdpyi
	979HvKZwQvzENaYX7PDgxqLJLixni55OUSdKCsY+XwR4XhxPgA4PUN8a0RgkRJFE
	qHlDrA==
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
	by mx07-00178001.pphosted.com (PPS) with ESMTPS id 44awjc17cs-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 22 Jan 2025 15:12:56 +0100 (CET)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
	by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id 81EC540045;
	Wed, 22 Jan 2025 15:11:39 +0100 (CET)
Received: from Webmail-eu.st.com (shfdag1node1.st.com [10.75.129.69])
	by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 2DD2B2945B0;
	Wed, 22 Jan 2025 15:10:40 +0100 (CET)
Received: from localhost (10.48.87.62) by SHFDAG1NODE1.st.com (10.75.129.69)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.37; Wed, 22 Jan
 2025 15:10:39 +0100
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
Subject: [PATCH 1/9] dt-bindings: spi: Add STM32 OSPI controller
Date: Wed, 22 Jan 2025 15:10:29 +0100
Message-ID: <20250122141037.953934-2-patrice.chotard@foss.st.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20250122141037.953934-1-patrice.chotard@foss.st.com>
References: <20250122141037.953934-1-patrice.chotard@foss.st.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.48.87.62]
X-ClientProxiedBy: SAFCAS1NODE2.st.com (10.75.90.13) To SHFDAG1NODE1.st.com
 (10.75.129.69)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-01-22_06,2025-01-22_02,2024-11-22_01
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250122_061315_184895_649AF122 
X-CRM114-Status: GOOD (  15.55  )
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

Add device tree bindings for the STM32 OSPI controller.

Main features of the Octo-SPI controller :
  - support sNOR / sNAND / HyperRAM™ and HyperFlash™ devices.
  - Three functional modes: indirect, automatic-status polling,
    memory-mapped.
  - Up to 4 Gbytes of external memory can be addressed in indirect
    mode (per physical port and per CS), and up to 256 Mbytes in
    memory-mapped mode (combined for both physical ports and per CS).
  - Single-, dual-, quad-, and octal-SPI communication.
  - Dual-quad communication.
  - Single data rate (SDR) and double transfer rate (DTR).
  - Maximum target frequency is 133 MHz for SDR and 133 MHz for DTR.
  - Data strobe support.
  - DMA channel for indirect mode.
  - Double CS mapping that allows two external flash devices to be
    addressed with a single OCTOSPI controller mapped on a single
    OCTOSPI port.

Signed-off-by: Patrice Chotard <patrice.chotard@foss.st.com>
---
 .../bindings/spi/st,stm32-ospi.yaml           | 109 ++++++++++++++++++
 1 file changed, 109 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/spi/st,stm32-ospi.yaml

diff --git a/Documentation/devicetree/bindings/spi/st,stm32-ospi.yaml b/Documentation/devicetree/bindings/spi/st,stm32-ospi.yaml
new file mode 100644
index 000000000000..bf16252f85fa
--- /dev/null
+++ b/Documentation/devicetree/bindings/spi/st,stm32-ospi.yaml
@@ -0,0 +1,109 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/spi/st,stm32-ospi.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: STMicroelectronics STM32 Octal Serial Peripheral Interface (OSPI)
+
+maintainers:
+  - Patrice Chotard <patrice.chotard@foss.st.com>
+
+allOf:
+  - $ref: spi-controller.yaml#
+
+properties:
+  compatible:
+    const: st,stm32mp25-ospi
+
+  reg:
+    description: registers
+
+  "#address-cells":
+    const: 1
+
+  "#size-cells":
+    const: 0
+
+  memory-region:
+    maxItems: 1
+    description: Phandle to a node describing memory-map region to be used
+
+  clocks:
+    maxItems: 1
+
+  interrupts:
+    maxItems: 1
+
+  resets:
+    maxItems: 2
+
+  dmas:
+    items:
+      - description: tx DMA channel
+      - description: rx DMA channel
+
+  dma-names:
+    items:
+      - const: tx
+      - const: rx
+
+  st,syscfg-dlyb:
+    description: |
+      Use to set the OSPI delay block within SYSCFG to:
+        Tune the phase of the RX sampling clock (or DQS) in order
+        to sample the data in their valid window.
+        Tune the phase of the TX launch clock in order to meet setup
+        and hold constraints of TX signals versus the memory clock.
+    $ref: /schemas/types.yaml#/definitions/phandle-array
+    items:
+      minItems: 2
+      maxItems: 2
+
+  access-controllers:
+    minItems: 1
+    maxItems: 2
+
+  power-domains:
+    maxItems: 1
+
+required:
+  - compatible
+  - reg
+  - "#address-cells"
+  - "#size-cells"
+  - clocks
+  - interrupts
+  - st,syscfg-dlyb
+
+unevaluatedProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/clock/st,stm32mp25-rcc.h>
+    #include <dt-bindings/interrupt-controller/arm-gic.h>
+    #include <dt-bindings/reset/st,stm32mp25-rcc.h>
+    spi@40430000 {
+      compatible = "st,stm32mp25-ospi";
+      reg = <0x40430000 0x400>;
+      memory-region = <&mm_ospi1>;
+      interrupts = <GIC_SPI 163 IRQ_TYPE_LEVEL_HIGH>;
+      dmas = <&hpdma 2 0x62 0x00003121 0x0>,
+             <&hpdma 2 0x42 0x00003112 0x0>;
+      dma-names = "tx", "rx";
+      clocks = <&scmi_clk CK_SCMI_OSPI1>;
+      resets = <&scmi_reset RST_SCMI_OSPI1>, <&scmi_reset RST_SCMI_OSPI1DLL>;
+      access-controllers = <&rifsc 74>;
+      power-domains = <&CLUSTER_PD>;
+      st,syscfg-dlyb = <&syscfg 0x1000>;
+
+      #address-cells = <1>;
+      #size-cells = <0>;
+
+      flash@0 {
+        compatible = "jedec,spi-nor";
+        reg = <0>;
+        spi-rx-bus-width = <4>;
+        spi-max-frequency = <108000000>;
+      };
+    };
-- 
2.25.1


