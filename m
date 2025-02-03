Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 536A7C02192
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  3 Feb 2025 21:33:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=b5+dwpuvoXdiUT/tnx/mz/bR+6NGCJYAGJxkQzRFSgg=; b=dCsAI6dMy/+ELZtm13FkQ1tZfD
	AJV6SN+jKTSt8Bpk90SiNVoOrNvsqWz879d/NDEGgCjAIlAvAxKiyShFogPNYTt1lGXDmy/X7k3Su
	d886JskuXcEFBZfbXPh6OoG0mLXHDsq/mwkD4et7dMz2M10rBmhMnR+Q7XqB68E5N3Chw55oZFS/E
	gadupIdqS5r8+bSB9FMSSKE3CX3zH+70ibff2NX8eyvsiXrrF4RfY8oUwhAanO9skzd0tKPCJpiNB
	RalDu44vniiSjGrwVgyIDa/GB6rK0mOqaoZgAYN4qFaUYB7BAFjAmW1+D3E7lEVl0lkeDA+tCyynQ
	IwfYL18Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tf44X-0000000GfuZ-0Mnn;
	Mon, 03 Feb 2025 21:33:37 +0000
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tf40f-0000000GfCI-36UM
	for linux-arm-kernel@lists.infradead.org;
	Mon, 03 Feb 2025 21:29:39 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 890F4A41E06;
	Mon,  3 Feb 2025 21:27:50 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4D761C4CEE4;
	Mon,  3 Feb 2025 21:29:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1738618176;
	bh=cGkVbIvG/XxxfatOLtOOWpw1ze9gCGpJh6mDqiLiBfk=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=JK2NiJkJCMwecG43ZQb8jKCxFNvHo/NgS2l/fqpkYER+gg9Ec6N3MBVfMkIp0OwFM
	 V7YGfb100Rh3pI9kqDbXIZ7h4uc+oGi8guNy/5bNz/AvxJRfdleVcsjRfAASRTpaVt
	 2UdPgqlc1T6inuInp0so9hvmkdJRTk1Zb4hGPoQEZ1dmL9mMVuonD3kheF7KCHVPja
	 sAoG724u6WX9tZDcuNhpxokIJizwebziOxjVsMWuBvUYKR3EyrPmLbUjex2BhuF67+
	 vgOQq6SqITBppXiygN4BrdHfaJrFrAU18c7x/ZxH/bgR5R3sBEvdXF7qLF0dz0J7h8
	 DIe72yGParx7w==
From: "Rob Herring (Arm)" <robh@kernel.org>
Date: Mon, 03 Feb 2025 15:29:14 -0600
Subject: [PATCH 2/4] dt-bindings: memory-controllers: qcom,ebi2: Split out
 child node properties
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250203-dt-lan9115-fix-v1-2-eb35389a7365@kernel.org>
References: <20250203-dt-lan9115-fix-v1-0-eb35389a7365@kernel.org>
In-Reply-To: <20250203-dt-lan9115-fix-v1-0-eb35389a7365@kernel.org>
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Krzysztof Kozlowski <krzk@kernel.org>, 
 Marek Vasut <marex@denx.de>, Alim Akhtar <alim.akhtar@samsung.com>, 
 Andrew Lunn <andrew+netdev@lunn.ch>, 
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
 Shawn Guo <shawnguo@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-samsung-soc@vger.kernel.org, netdev@vger.kernel.org
X-Mailer: b4 0.15-dev
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250203_132937_911980_10D14E1A 
X-CRM114-Status: GOOD (  18.99  )
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

In order to validate devices in child nodes, the device schemas need to
reference any child node properties. In order to do that, the properties
for child nodes need to be included in mc-peripheral-props.yaml.

"reg: { maxItems: 1 }" was also incorrect. It's up to the device schemas
how many reg entries they have.

Signed-off-by: Rob Herring (Arm) <robh@kernel.org>
---
 .../memory-controllers/mc-peripheral-props.yaml    |  1 +
 .../qcom,ebi2-peripheral-props.yaml                | 91 ++++++++++++++++++++++
 .../bindings/memory-controllers/qcom,ebi2.yaml     | 84 --------------------
 3 files changed, 92 insertions(+), 84 deletions(-)

diff --git a/Documentation/devicetree/bindings/memory-controllers/mc-peripheral-props.yaml b/Documentation/devicetree/bindings/memory-controllers/mc-peripheral-props.yaml
index 00deeb09f87d..11bc8a33d022 100644
--- a/Documentation/devicetree/bindings/memory-controllers/mc-peripheral-props.yaml
+++ b/Documentation/devicetree/bindings/memory-controllers/mc-peripheral-props.yaml
@@ -36,6 +36,7 @@ allOf:
   - $ref: st,stm32-fmc2-ebi-props.yaml#
   - $ref: ingenic,nemc-peripherals.yaml#
   - $ref: intel,ixp4xx-expansion-peripheral-props.yaml#
+  - $ref: qcom,ebi2-peripheral-props.yaml#
   - $ref: ti,gpmc-child.yaml#
   - $ref: fsl/fsl,imx-weim-peripherals.yaml
 
diff --git a/Documentation/devicetree/bindings/memory-controllers/qcom,ebi2-peripheral-props.yaml b/Documentation/devicetree/bindings/memory-controllers/qcom,ebi2-peripheral-props.yaml
new file mode 100644
index 000000000000..29f8c30e8a88
--- /dev/null
+++ b/Documentation/devicetree/bindings/memory-controllers/qcom,ebi2-peripheral-props.yaml
@@ -0,0 +1,91 @@
+# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/memory-controllers/qcom,ebi2-peripheral-props.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Peripheral Properties for Qualcomm External Bus Interface 2 (EBI2)
+
+maintainers:
+  - Bjorn Andersson <andersson@kernel.org>
+
+properties:
+  # SLOW chip selects
+  qcom,xmem-recovery-cycles:
+    $ref: /schemas/types.yaml#/definitions/uint32
+    description: >
+      The time the memory continues to drive the data bus after OE
+      is de-asserted, in order to avoid contention on the data bus.
+      They are inserted when reading one CS and switching to another
+      CS or read followed by write on the same CS. Minimum value is
+      actually 1, so a value of 0 will still yield 1 recovery cycle.
+    minimum: 0
+    maximum: 15
+
+  qcom,xmem-write-hold-cycles:
+    $ref: /schemas/types.yaml#/definitions/uint32
+    description: >
+      The extra cycles inserted after every write minimum 1. The
+      data out is driven from the time WE is asserted until CS is
+      asserted. With a hold of 1 (value = 0), the CS stays active
+      for 1 extra cycle, etc.
+    minimum: 0
+    maximum: 15
+
+  qcom,xmem-write-delta-cycles:
+    $ref: /schemas/types.yaml#/definitions/uint32
+    description: >
+      The initial latency for write cycles inserted for the first
+      write to a page or burst memory.
+    minimum: 0
+    maximum: 255
+
+  qcom,xmem-read-delta-cycles:
+    $ref: /schemas/types.yaml#/definitions/uint32
+    description: >
+      The initial latency for read cycles inserted for the first
+      read to a page or burst memory.
+    minimum: 0
+    maximum: 255
+
+  qcom,xmem-write-wait-cycles:
+    $ref: /schemas/types.yaml#/definitions/uint32
+    description: >
+      The number of wait cycles for every write access.
+    minimum: 0
+    maximum: 15
+
+  qcom,xmem-read-wait-cycles:
+    $ref: /schemas/types.yaml#/definitions/uint32
+    description: >
+      The number of wait cycles for every read access.
+    minimum: 0
+    maximum: 15
+
+
+  # FAST chip selects
+  qcom,xmem-address-hold-enable:
+    $ref: /schemas/types.yaml#/definitions/uint32
+    description: >
+      Holds the address for an extra cycle to meet hold time
+      requirements with ADV assertion, when set to 1.
+    enum: [ 0, 1 ]
+
+  qcom,xmem-adv-to-oe-recovery-cycles:
+    $ref: /schemas/types.yaml#/definitions/uint32
+    description: >
+      The number of cycles elapsed before an OE assertion, with
+      respect to the cycle where ADV (address valid) is asserted.
+    minimum: 0
+    maximum: 3
+
+  qcom,xmem-read-hold-cycles:
+    $ref: /schemas/types.yaml#/definitions/uint32
+    description: >
+      The length in cycles of the first segment of a read transfer.
+      For a single read transfer this will be the time from CS
+      assertion to OE assertion.
+    minimum: 0
+    maximum: 15
+
+additionalProperties: true
diff --git a/Documentation/devicetree/bindings/memory-controllers/qcom,ebi2.yaml b/Documentation/devicetree/bindings/memory-controllers/qcom,ebi2.yaml
index c782bfd7af92..3e6da1ba460e 100644
--- a/Documentation/devicetree/bindings/memory-controllers/qcom,ebi2.yaml
+++ b/Documentation/devicetree/bindings/memory-controllers/qcom,ebi2.yaml
@@ -105,90 +105,6 @@ patternProperties:
   "^.*@[0-5],[0-9a-f]+$":
     type: object
     additionalProperties: true
-    properties:
-      reg:
-        maxItems: 1
-
-      # SLOW chip selects
-      qcom,xmem-recovery-cycles:
-        $ref: /schemas/types.yaml#/definitions/uint32
-        description: >
-          The time the memory continues to drive the data bus after OE
-          is de-asserted, in order to avoid contention on the data bus.
-          They are inserted when reading one CS and switching to another
-          CS or read followed by write on the same CS. Minimum value is
-          actually 1, so a value of 0 will still yield 1 recovery cycle.
-        minimum: 0
-        maximum: 15
-
-      qcom,xmem-write-hold-cycles:
-        $ref: /schemas/types.yaml#/definitions/uint32
-        description: >
-          The extra cycles inserted after every write minimum 1. The
-          data out is driven from the time WE is asserted until CS is
-          asserted. With a hold of 1 (value = 0), the CS stays active
-          for 1 extra cycle, etc.
-        minimum: 0
-        maximum: 15
-
-      qcom,xmem-write-delta-cycles:
-        $ref: /schemas/types.yaml#/definitions/uint32
-        description: >
-          The initial latency for write cycles inserted for the first
-          write to a page or burst memory.
-        minimum: 0
-        maximum: 255
-
-      qcom,xmem-read-delta-cycles:
-        $ref: /schemas/types.yaml#/definitions/uint32
-        description: >
-          The initial latency for read cycles inserted for the first
-          read to a page or burst memory.
-        minimum: 0
-        maximum: 255
-
-      qcom,xmem-write-wait-cycles:
-        $ref: /schemas/types.yaml#/definitions/uint32
-        description: >
-          The number of wait cycles for every write access.
-        minimum: 0
-        maximum: 15
-
-      qcom,xmem-read-wait-cycles:
-        $ref: /schemas/types.yaml#/definitions/uint32
-        description: >
-          The number of wait cycles for every read access.
-        minimum: 0
-        maximum: 15
-
-
-      # FAST chip selects
-      qcom,xmem-address-hold-enable:
-        $ref: /schemas/types.yaml#/definitions/uint32
-        description: >
-          Holds the address for an extra cycle to meet hold time
-          requirements with ADV assertion, when set to 1.
-        enum: [ 0, 1 ]
-
-      qcom,xmem-adv-to-oe-recovery-cycles:
-        $ref: /schemas/types.yaml#/definitions/uint32
-        description: >
-          The number of cycles elapsed before an OE assertion, with
-          respect to the cycle where ADV (address valid) is asserted.
-        minimum: 0
-        maximum: 3
-
-      qcom,xmem-read-hold-cycles:
-        $ref: /schemas/types.yaml#/definitions/uint32
-        description: >
-          The length in cycles of the first segment of a read transfer.
-          For a single read transfer this will be the time from CS
-          assertion to OE assertion.
-        minimum: 0
-        maximum: 15
-
-    required:
-      - reg
 
 additionalProperties: false
 

-- 
2.47.2


