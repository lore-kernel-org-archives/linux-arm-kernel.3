Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9135AC5CFCF
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 12 Aug 2026 01:03:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Js4g4d2kZhjNnU26OaWa6DERMam0dZGdTIc+RrtobBM=; b=xg3YKKruJrWTw7AYRoZPhBGhWT
	GnecbaKRFCeFVJ/Ts1wbo2V7GZUpHD0ZyWv8Oe5IR1s930Ltb0UNostSVUQ6GO34PQBRqZVtlPxqQ
	Siip5G7x63ntWcQ+LWLhQy2F8ecJHLM/92GkdFLsqC2QIqVj/o7ThcvnrqOkEFUp0yYF6a1ZZ0fKK
	Pq9XpE6X4biXi6HWJKm2Qb2JKwNaA9vlk66NWLpTDvOAIzW9SPSSA8LxQ7PE4+7b0nvDtyyzGu/n9
	W37+/297kNWKaU03olq2G5pW6NiJsb6CCEAEsmUvbMYqzz782ha7Kj8qoC99h6GQrgowa3J6SLb0j
	OzqxUrvQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wtxND-0000000FAvg-23KW;
	Wed, 12 Aug 2026 01:03:15 +0000
Received: from mx.nabladev.com ([178.251.229.89])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wtxN0-0000000FAnE-3Qmd;
	Wed, 12 Aug 2026 01:03:05 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 207E311A0F7;
	Wed, 12 Aug 2026 03:02:55 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nabladev.com;
	s=dkim; t=1786496576; h=from:subject:date:message-id:to:cc:mime-version:
	 content-transfer-encoding:in-reply-to:references;
	bh=Js4g4d2kZhjNnU26OaWa6DERMam0dZGdTIc+RrtobBM=;
	b=YX6gMBqwNKdgaMaU0zkkQo4QCOs2RRJX2iDSI1uMV+C5tLYzB701mGgnDFWqJSG3KJUczB
	vRhNPc8fO2H2VSzgcTqZVkyYHmkzZSd8oT050KEZ/0s6adq9g3J4FHVwCo/ypeA7EaPwUB
	uOeXB+ttxoL+3Yc+gXS12wXYzwIbPL+Lc7DyGXzaHhnDba8zctdrkl9GXYaik2V31novVC
	vLU2lVRKsYmPaZ+FWAxwUX5IBpdJVdkXX8rV6+qnq6dWD15tU2CDp3Wc9lBaGrjbXJ6qmo
	6uFdHsDlt30U+03CmBOPUuI9cSVRMnZ1LWuP8j7hjSr1rDFobmOPZVtEtWt/xw==
From: Marek Vasut <marex@nabladev.com>
To: linux-usb@vger.kernel.org
Cc: Marek Vasut <marex@nabladev.com>,
	Fabrice Gasnier <fabrice.gasnier@foss.st.com>,
	Pankaj Dev <pankaj.dev@st.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Christian Bruel <christian.bruel@foss.st.com>,
	Conor Dooley <conor+dt@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Rahul Kumar <rahul.kumar05@st.com>,
	Rob Herring <robh@kernel.org>,
	Rosen Penev <rosenp@gmail.com>,
	Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
	Vinod Koul <vkoul@kernel.org>,
	devicetree@vger.kernel.org,
	kernel@dh-electronics.com,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-phy@lists.infradead.org,
	linux-stm32@st-md-mailman.stormreply.com
Subject: [PATCH 5/8] dt-bindings: usb: dwc3: Document ST STM32MP2 DWC3 xHCI USB controller
Date: Wed, 12 Aug 2026 02:55:45 +0200
Message-ID: <20260812010157.1772849-6-marex@nabladev.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260812010157.1772849-1-marex@nabladev.com>
References: <20260812010157.1772849-1-marex@nabladev.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260811_180303_688842_CDCF8F91 
X-CRM114-Status: GOOD (  11.64  )
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

The ST STM32MP2 SoC contains single instance of DWC3 USB controller with
glue logic wrapper around it controlled by syscon. Document the glue
logic and DWC3 controller.

Signed-off-by: Fabrice Gasnier <fabrice.gasnier@foss.st.com>
Signed-off-by: Marek Vasut <marex@nabladev.com>
Signed-off-by: Pankaj Dev <pankaj.dev@st.com>
---
Cc: Alexandre Torgue <alexandre.torgue@foss.st.com>
Cc: Christian Bruel <christian.bruel@foss.st.com>
Cc: Conor Dooley <conor+dt@kernel.org>
Cc: Fabrice Gasnier <fabrice.gasnier@foss.st.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Krzysztof Kozlowski <krzk+dt@kernel.org>
Cc: Maxime Coquelin <mcoquelin.stm32@gmail.com>
Cc: Neil Armstrong <neil.armstrong@linaro.org>
Cc: Pankaj Dev <pankaj.dev@st.com>
Cc: Rahul Kumar <rahul.kumar05@st.com>
Cc: Rob Herring <robh@kernel.org>
Cc: Rosen Penev <rosenp@gmail.com>
Cc: Thinh Nguyen <Thinh.Nguyen@synopsys.com>
Cc: Vinod Koul <vkoul@kernel.org>
Cc: devicetree@vger.kernel.org
Cc: kernel@dh-electronics.com
Cc: linux-arm-kernel@lists.infradead.org
Cc: linux-kernel@vger.kernel.org
Cc: linux-phy@lists.infradead.org
Cc: linux-stm32@st-md-mailman.stormreply.com
Cc: linux-usb@vger.kernel.org
---
 .../bindings/usb/st,stm32mp25-dwc3.yaml       | 108 ++++++++++++++++++
 1 file changed, 108 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/usb/st,stm32mp25-dwc3.yaml

diff --git a/Documentation/devicetree/bindings/usb/st,stm32mp25-dwc3.yaml b/Documentation/devicetree/bindings/usb/st,stm32mp25-dwc3.yaml
new file mode 100644
index 0000000000000..e377efef43503
--- /dev/null
+++ b/Documentation/devicetree/bindings/usb/st,stm32mp25-dwc3.yaml
@@ -0,0 +1,108 @@
+# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/usb/st,stm32mp25-dwc3.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: STMicroelectronics STM32 MPU DWC3 USB SoC controller
+
+description:
+  The STM32 MPU DWC3 USB SoC controller block supports both
+  Host(SS/HS/FS/LS) and Device(SS/HS/FS) mode operation
+
+maintainers:
+  - Fabrice Gasnier <fabrice.gasnier@foss.st.com>
+  - Marek Vasut <marex@nabladev.com>
+
+properties:
+  compatible:
+    const: st,stm32mp25-dwc3
+
+  reg:
+    maxItems: 1
+
+  access-controllers:
+    maxItems: 1
+
+  clocks:
+    minItems: 3
+    maxItems: 3
+
+  clock-names:
+    items:
+      - const: ref
+      - const: bus_early
+      - const: suspend
+
+  dr_mode:
+    $ref: /schemas/types.yaml#/definitions/string
+    enum: [host, peripheral, otg]
+
+  interrupts:
+    maxItems: 1
+
+  phys:
+    minItems: 1
+    maxItems: 2
+
+  phy-names:
+    minItems: 1
+    items:
+      - const: usb2-phy
+      - const: usb3-phy
+
+  resets:
+    minItems: 1
+
+  st,syscfg:
+    $ref: /schemas/types.yaml#/definitions/phandle-array
+    description: Phandle to system configuration controller.
+    items:
+      - items:
+          - description: phandle to syscfg
+          - description: USB3DR control offset within syscfg
+
+  st,enable-port-power-control:
+    type: boolean
+    description: Enable Host-Mode Port Power Control (bit-3 of capability param HCCPARAMS)
+
+  st,ovrcur-active-low:
+    type: boolean
+    description: Over-Current signal polarity is active-low
+
+  st,vbusen-active-low:
+    type: boolean
+    description: VBUS-ENABLE signal polarity is active-low
+
+required:
+  - compatible
+  - reg
+  - clocks
+  - clock-names
+  - interrupts
+  - phys
+  - phy-names
+  - resets
+  - st,syscfg
+
+unevaluatedProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/clock/st,stm32mp25-rcc.h>
+    #include <dt-bindings/interrupt-controller/arm-gic.h>
+    #include <dt-bindings/reset/st,stm32mp25-rcc.h>
+
+    usb3dr: usb@48300000 {
+        compatible = "st,stm32mp25-dwc3";
+        reg = <0x48300000 0x100000>;
+        clocks = <&rcc CK_KER_USB2PHY2>, <&rcc CK_BUS_USB3DR>, <&rcc CK_KER_USB2PHY2>;
+        clock-names = "ref", "bus_early", "suspend";
+        interrupts = <GIC_SPI 228 IRQ_TYPE_LEVEL_HIGH>;
+        phys = <&usb2_phy>, <&usb3_phy>;
+        phy-names = "usb2-phy", "usb3-phy";
+        resets = <&rcc USB3DR_R>;
+        st,ovrcur-active-low;
+        st,syscfg = <&syscfg 0x4800>;
+        st,vbusen-active-low;
+    };
-- 
2.53.0


