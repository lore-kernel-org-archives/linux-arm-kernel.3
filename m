Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C2B48CC6B1A
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 14 Oct 2026 09:49:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=aoG6XZEoB/ISweJKCMFQ1pbFNJP0l8DivugMCR6LHUM=; b=iEnMvG0P697DlVOVLlGwpzWxvw
	VfO3glI4UdGkr6yvE/mZMbZc4+zemvEU0i6OneHlQ9xbBBjqlXoRwCk/R6VhNNf+BjYsmR9LpxpAR
	HwSeUg3JctAKEXo5zCddAu6BPvdYT7AWSOtAiaBxHRUrFP04isJ60qzvxWlZgT6ZOtT+1LaaxjpFt
	aDQnJoSINpO+FnpyUn4h7ww2XftS4n6JR617n+4ZaySV8FyEhZ6YW6tJDFT7Sn7tcFHUtyGAP7Hyd
	KxZ+J4604bPvQvY2+z+WHihKgq9qKNKCVoBe2GvshnBSuaHTbJF1CARIDML0kaEUeqpTSMxRsys+c
	ze1jgZnw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xGvbi-0000000F7I4-170m;
	Wed, 14 Oct 2026 09:49:10 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xGvbV-0000000F7Do-2Vgk
	for linux-arm-kernel@lists.infradead.org;
	Wed, 14 Oct 2026 09:49:01 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id B0B876022A;
	Wed, 14 Oct 2026 09:48:56 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 305351F000FF;
	Wed, 14 Oct 2026 09:48:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791971336;
	bh=aoG6XZEoB/ISweJKCMFQ1pbFNJP0l8DivugMCR6LHUM=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=eu6gZgrcUoabLBD7GonwJZR716smKc11/3i831Rcgs7y+PsuQ0f+kT5ArpXfOlWjO
	 QFDOfFvpIdck/smZkYYqnzjMHqnMTV95G+yEsFNkYleQmFTYudGqEd6bof89rFELFv
	 oB6l7piCmGINDXAniwqHvzGOk9ont22UUc4RybjtgKx6JSXzzvg2HLzrNSaWBCPpdp
	 PCqZVDz/78ByR/CQdx6BL6huLfRccnV3fhlZcWtTH3DddxeS/GUztD8W+KV6rakscC
	 OEik1Gq/FRyOqakigEpunaZGDOVYKAbBclVvgtVxsLNnk0D0X9616J/FQ8ctkzvhrO
	 2Gb5SltmkLsFA==
From: Linus Walleij <linusw@kernel.org>
Date: Wed, 14 Oct 2026 11:48:44 +0200
Subject: [PATCH RFC 2/5] dt-bindings: soc: Describe the BCM6846 Processor
 Monitor Bus
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261014-xg6846b-bcmbca-xrdp-reset-v1-2-daf5d177e113@kernel.org>
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

The third generation Platform Management Controller (PMC3) accesses
SoC block control registers through the Processor Monitor Bus (PMB).
Describe the BCM6846 PMB controller and its shared register bank.

Assisted-by: LLM
Signed-off-by: Linus Walleij <linusw@kernel.org>
---
 .../bindings/soc/bcm/brcm,bcm6846-pmb.yaml         | 51 ++++++++++++++++++++++
 1 file changed, 51 insertions(+)

diff --git a/Documentation/devicetree/bindings/soc/bcm/brcm,bcm6846-pmb.yaml b/Documentation/devicetree/bindings/soc/bcm/brcm,bcm6846-pmb.yaml
new file mode 100644
index 000000000000..85850dc16418
--- /dev/null
+++ b/Documentation/devicetree/bindings/soc/bcm/brcm,bcm6846-pmb.yaml
@@ -0,0 +1,51 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/soc/bcm/brcm,bcm6846-pmb.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Broadcom BCM6846 Processor Monitor Bus
+
+maintainers:
+  - Linus Walleij <linusw@kernel.org>
+
+description: |
+  The Processor Monitor Bus (PMB) connects the third generation Platform
+  Management Controller (PMC3) to the control registers of SoC blocks.
+  The controller provides configuration, arbitration and four keyhole
+  interfaces for indirect register access. Its children share this
+  transport, including serialization of complete register sequences.
+
+  The PMB interface is part of Procmon within the PMC complex and is
+  described by its bus child node. The register bank starts at the
+  PMB configuration register, not at the beginning of Procmon.
+
+properties:
+  compatible:
+    const: brcm,bcm6846-pmb
+
+  reg:
+    maxItems: 1
+    description: PMB configuration, keyhole and address mapping registers
+
+  reset-controller:
+    $ref: /schemas/reset/brcm,bcm6846-pmb-reset.yaml#
+
+required:
+  - compatible
+  - reg
+
+additionalProperties: false
+
+examples:
+  - |
+    /* Called PMB Processor Monitor Bus in vendor tree */
+    bus@ffb20100 {
+        compatible = "brcm,bcm6846-pmb";
+        reg = <0xffb20100 0x200>;
+
+        reset-controller {
+            compatible = "brcm,bcm6846-pmb-reset";
+            #reset-cells = <1>;
+        };
+    };

-- 
2.56.0


