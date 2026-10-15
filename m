Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7E75BCC6B34
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 15 Oct 2026 14:55:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=8Cc2bLqxi6ii7OXNS6cumR3l3FQgR/dj9D62L9zre70=; b=eZjefQwuLwYEVCax4kLAuJXUx/
	oyZp+D0ikamg3AnRBrgz74FNTmbn9J9d/QidFNOnn8EEf9FFa/1jAC9AWYupEJMwRlrD8ZXH64UDN
	xyBgWa24yLShlqPZrbWixjyE5dtU9i2n5GgYTo6snio90EPwzV2GOvFOn+ShL+G0S56NpKeLoIKC7
	anaQ9ShOLgisDWTPGWPsokVNlXc5cpgy62XWVSOiZeE8faRGVopT6CAnVIr4r9y/XvenclrEJaZ1c
	1CrU0rfnQO7iMdHk5Ez4uioqjxspyUY+gTk+Je2uixt7SeEtVREAyx54/BqMA0wREyehJxASePt9V
	b7Ts3m9g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xHMPZ-00000000MGd-485R;
	Thu, 15 Oct 2026 14:26:25 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xHMPQ-00000000MAb-1WQy
	for linux-arm-kernel@lists.infradead.org;
	Thu, 15 Oct 2026 14:26:17 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 338861477;
	Thu, 15 Oct 2026 07:26:11 -0700 (PDT)
Received: from e125769.cambridge.arm.com (e125769.cambridge.arm.com [10.2.198.107])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 768E33F871;
	Thu, 15 Oct 2026 07:26:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1792074374; bh=G36qdmTqm2rO4jOwRCiQ4XYdFKdwxjAn5cYS9ovRP7s=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=qgIDJeAA47kbre4VMzYXSsz/jRNOmr+Uidx7bY/PipDt4zyVp+pZA20LZyfXfcJkx
	 F94C+169GFWu5+v0tJ09/nbM5ONBNiUi9S89P6lLbYHJjxwTT4u2XVBNDaies8/3//
	 WJ9pQiFVVXSGlz8owk+LSRbBu9aNNelQ4Y2oomY0=
From: Ryan Roberts <ryan.roberts@arm.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Arnd Bergmann <arnd@arndb.de>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Mark Rutland <mark.rutland@arm.com>,
	Marc Zyngier <maz@kernel.org>,
	Oliver Upton <oupton@kernel.org>,
	Alex Williamson <alex@shazbot.org>,
	Jason Gunthorpe <jgg@nvidia.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Jean-Philippe Brucker <jpb@kernel.org>,
	Oded Gabbay <ogabbay@kernel.org>,
	Jonathan Corbet <corbet@lwn.net>
Cc: Ryan Roberts <ryan.roberts@arm.com>,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	kvmarm@lists.linux.dev,
	kvm@vger.kernel.org,
	devicetree@vger.kernel.org,
	dri-devel@lists.freedesktop.org,
	linux-doc@vger.kernel.org
Subject: [RFC PATCH v2 03/15] dt-bindings: misc: Add Arm Core Local Accelerator
Date: Thu, 15 Oct 2026 15:25:37 +0100
Message-ID: <20261015142552.4128028-4-ryan.roberts@arm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261015142552.4128028-1-ryan.roberts@arm.com>
References: <20261015142552.4128028-1-ryan.roberts@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261015_072616_542674_567D56CC 
X-CRM114-Status: GOOD (  19.65  )
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

Arm Core Local Accelerator (CLA) provides a CPU-local interface to
accelerators that access memory through the local CPU's MMU. CLAs whose
accelerators cannot be isolated from each other form an isolation
domain.

Add a binding for arm,cla describing the register range, CPU
association, DMA coherency and isolation domain. Document the
privilege-level register frames, including reduced ranges exposed to
virtual machines, and provide an example of two CLAs sharing a domain.

Signed-off-by: Ryan Roberts <ryan.roberts@arm.com>
---
 .../devicetree/bindings/misc/arm,cla.yaml     | 77 +++++++++++++++++++
 MAINTAINERS                                   |  1 +
 2 files changed, 78 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/misc/arm,cla.yaml

diff --git a/Documentation/devicetree/bindings/misc/arm,cla.yaml b/Documentation/devicetree/bindings/misc/arm,cla.yaml
new file mode 100644
index 000000000000..b86a2befd09a
--- /dev/null
+++ b/Documentation/devicetree/bindings/misc/arm,cla.yaml
@@ -0,0 +1,77 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/misc/arm,cla.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Arm Core Local Accelerator (CLA)
+
+maintainers:
+  - Ryan Roberts <ryan.roberts@arm.com>
+
+description:
+  A Core Local Accelerator (CLA) provides a CPU-local interface to up to eight
+  accelerators. The accelerators access memory through the local CPU's MMU. Each
+  CLA has its own register range, which can only be accessed by its local CPU.
+  Completion is polled through the registers; CLA does not generate interrupts.
+
+properties:
+  compatible:
+    const: arm,cla
+
+  reg:
+    maxItems: 1
+    description:
+      A single contiguous register range starting at the PL0 frame, aligned to
+      256 KiB. Each privilege-level frame occupies 64 KiB, with PL0, PL1, PL2
+      and PL3 at offsets 0, 0x10000, 0x20000 and 0x30000 respectively. The
+      complete range is 256 KiB. Higher-privilege frames may be omitted when
+      unavailable, for example in a virtual machine. The range must include at
+      least PL0 and PL1 when running at EL1 and additionally PL2 when running at
+      EL2.
+
+  cpu:
+    $ref: /schemas/types.yaml#/definitions/phandle
+    description:
+      Phandle to the CPU for which this CLA is local. Only that CPU can access
+      the CLA's registers.
+
+  dma-coherent: true
+
+  arm,domain:
+    $ref: /schemas/types.yaml#/definitions/uint32
+    description:
+      Identifier of the CLA isolation domain. CLAs whose attached accelerators
+      cannot be isolated from each other, for example because they share an
+      inter-accelerator communication bus, must have the same domain ID.
+      Different isolation domains must have different IDs. IDs need not be
+      consecutive. A CLA that can be isolated from all other CLAs has its own
+      domain ID.
+
+required:
+  - compatible
+  - reg
+  - cpu
+  - dma-coherent
+  - arm,domain
+
+additionalProperties: false
+
+examples:
+  - |
+    /* Two CPU-local CLAs in the same isolation domain. */
+    cla@10000000 {
+        compatible = "arm,cla";
+        reg = <0x10000000 0x40000>;
+        cpu = <&cpu0>;
+        dma-coherent;
+        arm,domain = <0>;
+    };
+
+    cla@10040000 {
+        compatible = "arm,cla";
+        reg = <0x10040000 0x40000>;
+        cpu = <&cpu1>;
+        dma-coherent;
+        arm,domain = <0>;
+    };
diff --git a/MAINTAINERS b/MAINTAINERS
index 735f6527f920..98a25b3de9b4 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -2213,6 +2213,7 @@ ARM CORE LOCAL ACCELERATOR (CLA) DRIVER
 M:	Ryan Roberts <ryan.roberts@arm.com>
 L:	linux-arm-kernel@lists.infradead.org (moderated for non-subscribers)
 S:	Supported
+F:	Documentation/devicetree/bindings/misc/arm,cla.yaml
 F:	Documentation/misc-devices/arm-cla.rst
 F:	drivers/misc/arm-cla/
 
-- 
2.43.0


