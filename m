Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 46759D6554E
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 17 Dec 2025 11:31:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=mdt8NwoCGRgNLynAVx7DXyY0u/WecOiZe9hWfkINzIQ=; b=nphrHB2iuvWn6EY+Z/DhUcbjFo
	fbkYALRKSMTxIAsDbbvv2f9hw24c+w/zX61JRorFh/Frm2g4H4KcJuJ79PMbMgyzTF1xyHRt9XttK
	/fK2KgBCeYTAnfpfFOO04h2osooSZdTEHuOvGY/OGqxROC+ZghiUu3X9BVyD4GkEqbC0GSPfHATS6
	yGQlog4o5DgBURtVJEVAkTTnpPn/sh+dcvXrl97BMgvRRwswhvpoJ1Fac12EtKFoMJBhtUPLUvBL4
	3lEuxW31CXzCDJMsVn1nLmeKTUv5Qzu6xpXF/I3OOa4LOh9A4gG588j8Wx1aqexN7PrJ26xKGc/Ni
	KeO7nalw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vVpkn-00000006jLA-19La;
	Wed, 17 Dec 2025 11:31:37 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vVpkj-00000006jJL-0v9n
	for linux-arm-kernel@lists.infradead.org;
	Wed, 17 Dec 2025 11:31:36 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 446E51691;
	Wed, 17 Dec 2025 03:31:25 -0800 (PST)
Received: from e134710.manchester.arm.com (e134710.arm.com [10.33.10.82])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 8D0C73F73B;
	Wed, 17 Dec 2025 03:31:30 -0800 (PST)
From: Ahmed Tiba <ahmed.tiba@arm.com>
To: linux-acpi@vger.kernel.org,
	devicetree@vger.kernel.org
Cc: tony.luck@intel.com,
	bp@alien8.de,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	catalin.marinas@arm.com,
	will@kernel.org,
	linux-arm-kernel@lists.infradead.org,
	rafael@kernel.org,
	linux-doc@vger.kernel.org,
	Dmitry.Lamerov@arm.com,
	Michael.Zhao2@arm.com,
	ahmed.tiba@arm.com
Subject: [PATCH 10/12] dt-bindings: ras: document estatus provider
Date: Wed, 17 Dec 2025 11:28:43 +0000
Message-ID: <20251217112845.1814119-11-ahmed.tiba@arm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251217112845.1814119-1-ahmed.tiba@arm.com>
References: <20251217112845.1814119-1-ahmed.tiba@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251217_033133_394642_77A62826 
X-CRM114-Status: GOOD (  15.19  )
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

Add a binding for firmware-first CPER providers described via
DeviceTree. It covers the shared status block, optional acknowledgment
registers, interrupt versus polling modes and the SEA notification
flag so non-ACPI platforms can describe their error sources.

Signed-off-by: Ahmed Tiba <ahmed.tiba@arm.com>
---
 .../devicetree/bindings/ras/arm,ras-ffh.yaml  | 95 +++++++++++++++++++
 MAINTAINERS                                   |  1 +
 2 files changed, 96 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/ras/arm,ras-ffh.yaml

diff --git a/Documentation/devicetree/bindings/ras/arm,ras-ffh.yaml b/Documentation/devicetree/bindings/ras/arm,ras-ffh.yaml
new file mode 100644
index 000000000000..0d2acbf8e8a8
--- /dev/null
+++ b/Documentation/devicetree/bindings/ras/arm,ras-ffh.yaml
@@ -0,0 +1,95 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/ras/arm,ras-ffh.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Arm Firmware-First Handler (FFH) CPER provider
+
+maintainers:
+  - Ahmed Tiba <ahmed.tiba@arm.com>
+
+description: |
+  Some Arm platforms describe a firmware-first error handler that exposes a
+  Common Platform Error Record (CPER) buffer directly via DeviceTree. The OS
+  maps the buffer to consume the error records, and firmware signals that a new
+  record is ready either by asserting an interrupt or by relying on a periodic
+  poll. This binding describes the buffer and the associated notification
+  signal. If firmware delivers the error via Synchronous External Abort (SEA),
+  the optional sea-notify flag marks the source accordingly.
+
+properties:
+  compatible:
+    const: arm,ras-ffh
+
+  reg:
+    minItems: 1
+    items:
+      - description: CPER status block exposed by firmware
+      - description:
+          Optional 32- or 64-bit acknowledgment register. Firmware watches this
+          register and expects bit 0 to be written to 1 once the OS consumes the
+          status buffer so it can reuse the record.
+
+  reg-names:
+    items:
+      - const: status
+      - const: ack
+
+  interrupts:
+    maxItems: 1
+    description:
+      Optional interrupt used to signal that a new status record is ready. If
+      omitted, the OS relies on the polling interval property.
+
+  poll-interval:
+    $ref: /schemas/types.yaml#/definitions/uint32
+    minimum: 1
+    description:
+      Optional polling interval, in milliseconds, for platforms that cannot
+      route an interrupt.
+
+  arm,sea-notify:
+    type: boolean
+    description:
+      Set if the platform delivers these errors as Synchronous External Aborts.
+
+required:
+  - compatible
+  - reg
+
+allOf:
+  - if:
+      properties:
+        poll-interval: false
+    then:
+      required:
+        - interrupts
+  - if:
+      properties:
+        interrupts: false
+    then:
+      required:
+        - poll-interval
+  - if:
+      properties:
+        reg:
+          minItems: 2
+    then:
+      required:
+        - reg-names
+
+unevaluatedProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/interrupt-controller/arm-gic.h>
+
+    ras-ffh@fe800000 {
+        compatible = "arm,ras-ffh";
+        reg = <0xfe800000 0x1000>,
+              <0xfe810000 0x4>;
+        reg-names = "status", "ack";
+        interrupts = <0 32 IRQ_TYPE_LEVEL_HIGH>;
+    };
+...
diff --git a/MAINTAINERS b/MAINTAINERS
index 67d79d4e612d..6b2ef2ddc0c7 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -21760,6 +21760,7 @@ F:	drivers/rapidio/
 RAS ERROR STATUS
 M:	Ahmed Tiba <ahmed.tiba@arm.com>
 S:	Maintained
+F:	Documentation/devicetree/bindings/ras/arm,ras-ffh.yaml
 F:	drivers/firmware/efi/estatus.c
 F:	include/linux/estatus.h
 
-- 
2.43.0


