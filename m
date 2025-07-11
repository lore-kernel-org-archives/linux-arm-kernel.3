Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 89C79C83F1A
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 11 Jul 2025 19:11:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=J9xQxrJzZ2FG3lq6j0/EtsRn/hH/pzSR7fu0DRWqby4=; b=pF9mNzq8+wEgrXrgeF5v/Q87LE
	s+Z2S9tWzUgTWuMu069ctxkK2RL8VcUoQeYpeIkwWk8yTfegtf0+9nlOd5HMRvuAsVR2mq38IPPhe
	sSICWG8/eXlfPtp6wTqUCr8QnHoRwUkZL+5yhSnHjOLs53OgZXddAZT0lvonnbk21Q7hkdCy/TDJm
	uGMpA9OpV+KWHBL3o/h0z922TWRG+c0OiONuFXJfwBDH3nI7pArRETOoebD7nrOmlUtlWuc7vC6tu
	1H2dWkb9oWztPoIjGRmLtVe5RZX/mjCELCagWCDMCEElmpeynDT24ChpEoTOnOrvP+cJRxe1n2mju
	lOvjPoDw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uaJ9b-0000000FcAH-0ckz;
	Fri, 11 Jul 2025 19:11:27 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uaIcu-0000000FXBB-38OL
	for linux-arm-kernel@lists.infradead.org;
	Fri, 11 Jul 2025 18:37:42 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id AE6902682;
	Fri, 11 Jul 2025 11:37:29 -0700 (PDT)
Received: from merodach.members.linode.com (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 25DE83F694;
	Fri, 11 Jul 2025 11:37:37 -0700 (PDT)
From: James Morse <james.morse@arm.com>
To: linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Cc: Rob Herring <robh@kernel.org>,
	Ben Horgan <ben.horgan@arm.com>,
	Rohit Mathew <rohit.mathew@arm.com>,
	Shanker Donthineni <sdonthineni@nvidia.com>,
	Zeng Heng <zengheng4@huawei.com>,
	Lecopzer Chen <lecopzerc@nvidia.com>,
	Carl Worth <carl@os.amperecomputing.com>,
	shameerali.kolothum.thodi@huawei.com,
	D Scott Phillips OS <scott@os.amperecomputing.com>,
	lcherian@marvell.com,
	bobo.shaobowang@huawei.com,
	tan.shaopeng@fujitsu.com,
	baolin.wang@linux.alibaba.com,
	Jamie Iles <quic_jiles@quicinc.com>,
	Xin Hao <xhao@linux.alibaba.com>,
	peternewman@google.com,
	dfustini@baylibre.com,
	amitsinght@marvell.com,
	David Hildenbrand <david@redhat.com>,
	Rex Nie <rex.nie@jaguarmicro.com>,
	Dave Martin <dave.martin@arm.com>,
	Koba Ko <kobak@nvidia.com>,
	James Morse <james.morse@arm.com>
Subject: [RFC PATCH 11/36] dt-bindings: arm: Add MPAM MSC binding
Date: Fri, 11 Jul 2025 18:36:23 +0000
Message-Id: <20250711183648.30766-12-james.morse@arm.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20250711183648.30766-1-james.morse@arm.com>
References: <20250711183648.30766-1-james.morse@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250711_113740_876508_BBEE27F0 
X-CRM114-Status: GOOD (  18.43  )
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

From: Rob Herring <robh@kernel.org>

The binding is designed around the assumption that an MSC will be a
sub-block of something else such as a memory controller, cache controller,
or IOMMU. However, it's certainly possible a design does not have that
association or has a mixture of both, so the binding illustrates how we can
support that with RIS child nodes.

A key part of MPAM is we need to know about all of the MSCs in the system
before it can be enabled. This drives the need for the genericish
'arm,mpam-msc' compatible. Though we can't assume an MSC is accessible
until a h/w specific driver potentially enables the h/w.

Cc: James Morse <james.morse@arm.com>
Signed-off-by: Rob Herring <robh@kernel.org>
Signed-off-by: James Morse <james.morse@arm.com>
---
 .../devicetree/bindings/arm/arm,mpam-msc.yaml | 227 ++++++++++++++++++
 1 file changed, 227 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/arm/arm,mpam-msc.yaml

diff --git a/Documentation/devicetree/bindings/arm/arm,mpam-msc.yaml b/Documentation/devicetree/bindings/arm/arm,mpam-msc.yaml
new file mode 100644
index 000000000000..9d542ecb1a7d
--- /dev/null
+++ b/Documentation/devicetree/bindings/arm/arm,mpam-msc.yaml
@@ -0,0 +1,227 @@
+# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/arm/arm,mpam-msc.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Arm Memory System Resource Partitioning and Monitoring (MPAM)
+
+description: |
+  The Arm MPAM specification can be found here:
+
+  https://developer.arm.com/documentation/ddi0598/latest
+
+maintainers:
+  - Rob Herring <robh@kernel.org>
+
+properties:
+  compatible:
+    items:
+      - const: arm,mpam-msc                   # Further details are discoverable
+      - const: arm,mpam-memory-controller-msc
+
+  reg:
+    maxItems: 1
+    description: A memory region containing registers as defined in the MPAM
+      specification.
+
+  interrupts:
+    minItems: 1
+    items:
+      - description: error (optional)
+      - description: overflow (optional, only for monitoring)
+
+  interrupt-names:
+    oneOf:
+      - items:
+          - enum: [ error, overflow ]
+      - items:
+          - const: error
+          - const: overflow
+
+  arm,not-ready-us:
+    description: The maximum time in microseconds for monitoring data to be
+      accurate after a settings change. For more information, see the
+      Not-Ready (NRDY) bit description in the MPAM specification.
+
+  numa-node-id: true # see NUMA binding
+
+  '#address-cells':
+    const: 1
+
+  '#size-cells':
+    const: 0
+
+patternProperties:
+  '^ris@[0-9a-f]$':
+    type: object
+    additionalProperties: false
+    description: |
+      RIS nodes for each RIS in an MSC. These nodes are required for each RIS
+      implementing known MPAM controls
+
+    properties:
+      compatible:
+        enum:
+            # Bulk storage for cache
+          - arm,mpam-cache
+            # Memory bandwidth
+          - arm,mpam-memory
+
+      reg:
+        minimum: 0
+        maximum: 0xf
+
+      cpus:
+        $ref: '/schemas/types.yaml#/definitions/phandle-array'
+        description:
+          Phandle(s) to the CPU node(s) this RIS belongs to. By default, the parent
+          device's affinity is used.
+
+      arm,mpam-device:
+        $ref: '/schemas/types.yaml#/definitions/phandle'
+        description:
+          By default, the MPAM enabled device associated with a RIS is the MSC's
+          parent node. It is possible for each RIS to be associated with different
+          devices in which case 'arm,mpam-device' should be used.
+
+    required:
+      - compatible
+      - reg
+
+required:
+  - compatible
+  - reg
+
+dependencies:
+  interrupts: [ interrupt-names ]
+
+additionalProperties: false
+
+examples:
+  - |
+    /*
+    cpus {
+        cpu@0 {
+            next-level-cache = <&L2_0>;
+        };
+        cpu@100 {
+            next-level-cache = <&L2_1>;
+        };
+    };
+    */
+    L2_0: cache-controller-0 {
+        compatible = "cache";
+        cache-level = <2>;
+        cache-unified;
+        next-level-cache = <&L3>;
+
+    };
+
+    L2_1: cache-controller-1 {
+        compatible = "cache";
+        cache-level = <2>;
+        cache-unified;
+        next-level-cache = <&L3>;
+
+    };
+
+    L3: cache-controller@30000000 {
+        compatible = "arm,dsu-l3-cache", "cache";
+        cache-level = <3>;
+        cache-unified;
+
+        ranges = <0x0 0x30000000 0x800000>;
+        #address-cells = <1>;
+        #size-cells = <1>;
+
+        msc@10000 {
+            compatible = "arm,mpam-msc";
+
+            /* CPU affinity implied by parent cache node's  */
+            reg = <0x10000 0x2000>;
+            interrupts = <1>, <2>;
+            interrupt-names = "error", "overflow";
+            arm,not-ready-us = <1>;
+        };
+    };
+
+    mem: memory-controller@20000 {
+        compatible = "foo,a-memory-controller";
+        reg = <0x20000 0x1000>;
+
+        #address-cells = <1>;
+        #size-cells = <1>;
+        ranges;
+
+        msc@21000 {
+            compatible = "arm,mpam-memory-controller-msc", "arm,mpam-msc";
+            reg = <0x21000 0x1000>;
+            interrupts = <3>;
+            interrupt-names = "error";
+            arm,not-ready-us = <1>;
+            numa-node-id = <1>;
+        };
+    };
+
+    iommu@40000 {
+        reg = <0x40000 0x1000>;
+
+        ranges;
+        #address-cells = <1>;
+        #size-cells = <1>;
+
+        msc@41000 {
+            compatible = "arm,mpam-msc";
+            reg = <0 0x1000>;
+            interrupts = <5>, <6>;
+            interrupt-names = "error", "overflow";
+            arm,not-ready-us = <1>;
+
+            #address-cells = <1>;
+            #size-cells = <0>;
+
+            ris@2 {
+                compatible = "arm,mpam-cache";
+                reg = <0>;
+                // TODO: How to map to device(s)?
+            };
+        };
+    };
+
+    msc@80000 {
+        compatible = "foo,a-standalone-msc";
+        reg = <0x80000 0x1000>;
+
+        clocks = <&clks 123>;
+
+        ranges;
+        #address-cells = <1>;
+        #size-cells = <1>;
+
+        msc@10000 {
+            compatible = "arm,mpam-msc";
+
+            reg = <0x10000 0x2000>;
+            interrupts = <7>;
+            interrupt-names = "overflow";
+            arm,not-ready-us = <1>;
+
+            #address-cells = <1>;
+            #size-cells = <0>;
+
+            ris@0 {
+                compatible = "arm,mpam-cache";
+                reg = <0>;
+                arm,mpam-device = <&L2_0>;
+            };
+
+            ris@1 {
+                compatible = "arm,mpam-memory";
+                reg = <1>;
+                arm,mpam-device = <&mem>;
+            };
+        };
+    };
+
+...
-- 
2.39.5


