Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4E1BBCC6B1D
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 14 Oct 2026 09:49:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=tcGiiC55dy00xKTLBpiR+/aQxZi6UEFK/bgl96+tCFA=; b=GZJ44ILmifz1Hvre4jubuFo1xW
	Up58LnR5KGT8EBTpY6+p5TR61ymjF+83r8wP1tVutx+afn8FQntC3RAMuqZNxDQ6IbvRJZ929fR8d
	yHCudiaujy/ZgzwD1JVl3gnopqcu09wSLidsOW+UpU5RS5xZn/zZpniFY9eNXU4EqlFS+U0JbBW5M
	BFgzAw9CMApOkSRPqhpN3HGAJ1RBmoVzVhF80FGC6t7ATCtt7LPsX7SDFQvvtSsOTo+ngTnJMf8jE
	ZsWzvKD/CH2tETJ7BaLXCkB7T6QeNX+S5ORccNluQDmtboymo9Ujh5gk4VJdj75JgC7AV0p0JzIr1
	jhtjMBLQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xGvbT-0000000F7DN-04Yf;
	Wed, 14 Oct 2026 09:48:55 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xGvbS-0000000F7Cb-00lC
	for linux-arm-kernel@lists.infradead.org;
	Wed, 14 Oct 2026 09:48:54 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id E526E60214;
	Wed, 14 Oct 2026 09:48:52 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 639F41F00893;
	Wed, 14 Oct 2026 09:48:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791971332;
	bh=tcGiiC55dy00xKTLBpiR+/aQxZi6UEFK/bgl96+tCFA=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=mrZgDR3bKa5wwC8zRdim4OtePHdLvnRX1ZGiBqLgT4vRcAM3hMd6DFx7Y7gQZ93Aq
	 4KGxF7vYqBr8PwtV1gPSjCXZC1D04218cScXXZOJqh8MWANOelS+CtlXCUoDoy8/YN
	 meWFRtB5wBRzVBTZW7luwdeHto20xV1ygMoU+2twap7RYE79sBU3tNXTII2z/qiJai
	 Yi2D/Gn3p/jUgDaztsEnma7h4QhFG2g5U9QbS3A7H1JcY/qUE3D8AWyCfWvo+L8rXO
	 48sEpITcEjrv5L6prU5vjgk4/OJqe96JndrqznTS3a2Zf0imT13kqOlJMRX0Wn4Rck
	 yfudjkWa6sSOQ==
From: Linus Walleij <linusw@kernel.org>
Date: Wed, 14 Oct 2026 11:48:43 +0200
Subject: [PATCH RFC 1/5] dt-bindings: mfd: Describe the BCM6846 PMC complex
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261014-xg6846b-bcmbca-xrdp-reset-v1-1-daf5d177e113@kernel.org>
References: <20261014-xg6846b-bcmbca-xrdp-reset-v1-0-daf5d177e113@kernel.org>
In-Reply-To: <20261014-xg6846b-bcmbca-xrdp-reset-v1-0-daf5d177e113@kernel.org>
To: Lee Jones <lee@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 William Zhang <william.zhang@broadcom.com>, 
 Anand Gore <anand.gore@broadcom.com>, 
 Kursad Oney <kursad.oney@broadcom.com>, 
 Florian Fainelli <florian.fainelli@broadcom.com>, 
 =?utf-8?q?Rafa=C5=82_Mi=C5=82ecki?= <rafal@milecki.pl>, 
 Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, 
 Philipp Zabel <p.zabel@pengutronix.de>
Cc: mfd@lists.linux.dev, devicetree@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, Linus Walleij <linusw@kernel.org>
X-Mailer: b4 0.16.0
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

The third generation Platform Management Controller (PMC3) has
different subdevices.

Identify the parent with Broadcom's "brcm,bca-pmc-3-1" compatible
for the version 3.1 complex.

Describe the complex as a simple-mfd with two system-controller children
and a bus child, each owning its register resource.

Assisted-by: LLM
Signed-off-by: Linus Walleij <linusw@kernel.org>
---
 .../devicetree/bindings/mfd/brcm,bcm6846-pmc.yaml  | 98 ++++++++++++++++++++++
 1 file changed, 98 insertions(+)

diff --git a/Documentation/devicetree/bindings/mfd/brcm,bcm6846-pmc.yaml b/Documentation/devicetree/bindings/mfd/brcm,bcm6846-pmc.yaml
new file mode 100644
index 000000000000..7ddf84b561aa
--- /dev/null
+++ b/Documentation/devicetree/bindings/mfd/brcm,bcm6846-pmc.yaml
@@ -0,0 +1,98 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/mfd/brcm,bcm6846-pmc.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Broadcom BCM6846 Platform Management Controller
+
+maintainers:
+  - Linus Walleij <linusw@kernel.org>
+
+description: |
+  The third generation Platform Management Controller (PMC3) contains
+  separate register banks for PMC control and message queues, the
+  Processor Monitor Bus (PMB) interface within Procmon, and the Maestro
+  processor control registers. Each child owns its register bank. The
+  parent provides address translation and does not own a register bank.
+
+properties:
+  compatible:
+    items:
+      - const: brcm,bca-pmc-3-1
+      - const: simple-mfd
+
+  "#address-cells":
+    const: 1
+
+  "#size-cells":
+    const: 1
+
+  ranges:
+    maxItems: 1
+
+patternProperties:
+  '^system-controller@[0-9a-f]+$':
+    type: object
+    additionalProperties: false
+    description:
+      PMC control and message queue registers, or Maestro processor
+      control, status and interrupt registers
+
+    properties:
+      compatible:
+        enum:
+          - brcm,bcm6846-pmc-control
+          - brcm,bcm6846-pmc-maestro
+
+      reg:
+        maxItems: 1
+
+    required:
+      - compatible
+      - reg
+
+  '^bus@[0-9a-f]+$':
+    $ref: /schemas/soc/bcm/brcm,bcm6846-pmb.yaml#
+    description: PMB configuration, keyhole and address mapping registers
+
+required:
+  - compatible
+  - '#address-cells'
+  - '#size-cells'
+  - ranges
+
+additionalProperties: false
+
+examples:
+  - |
+    system-controller@ffb00000 {
+        /* Broadcom BCA Platform Management Complex version 3.1 */
+        compatible = "brcm,bca-pmc-3-1", "simple-mfd";
+        #address-cells = <1>;
+        #size-cells = <1>;
+        ranges = <0x0 0xffb00000 0x21000>;
+
+        /* Called PMC Platform Management Controller in vendor tree */
+        system-controller@1018 {
+            compatible = "brcm,bcm6846-pmc-control";
+            reg = <0x1018 0x5080>;
+        };
+
+        /* Called PMB Processor Monitor Bus in vendor tree */
+        bus@20100 {
+            compatible = "brcm,bcm6846-pmb";
+            reg = <0x20100 0x200>;
+
+            reset-controller {
+                compatible = "brcm,bcm6846-pmb-reset";
+                #reset-cells = <1>;
+            };
+        };
+
+        /* Called Maestro in vendor tree */
+        system-controller@20400 {
+            compatible = "brcm,bcm6846-pmc-maestro";
+            reg = <0x20400 0x5d0>;
+        };
+    };

-- 
2.56.0


