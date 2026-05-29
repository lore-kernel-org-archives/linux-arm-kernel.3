Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4F3B2CD6E4C
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 29 May 2026 09:52:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=shURB4JhlgOtqqsxoE+Zb7hU+UYakJXHpKlTuOPqwKA=; b=YKoWUHo0fUQjGbsGV2xgoQAPh2
	Z3gvep1QscEUmUapyaol/0FxiIlEfgkZBUs5oEWrfd/Ulzqx799OA/JVfpQr2fZkhbmBw4xVseXak
	HEuLI8UNTYfdzMaHxV0y8e6UuWFTGaOGd+Y+zDc9EfPiQ3+Nf479ylFent7dbo+cS+2gT6uYdYabq
	9t7YKQj6yq/pT16fP9KLl8w6mhNQOOxBVwrnmEhosaNCvBCd3NaGu4X1o33x49K8/vYXuI42boG6+
	lqLau9eWOfmVr5SPBF5AJAWBbTOjOqPirEc7WqtxmeLEruCbYiGKUkgWmWOEbOQ8E7QJZAEREUoVF
	sNXn58cQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wStsn-000000076t3-3OyA;
	Fri, 29 May 2026 09:52:01 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wStsj-000000076pY-2koq
	for linux-arm-kernel@lists.infradead.org;
	Fri, 29 May 2026 09:51:59 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id B913422D7;
	Fri, 29 May 2026 02:51:51 -0700 (PDT)
Received: from e134710.arm.com (e134710.arm.com [10.33.10.82])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 5B4AE3F905;
	Fri, 29 May 2026 02:51:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1780048316; bh=G1ftAdKNVg9HYWt6/7QhaAQawKb5RYu0DeFnL5fEvGQ=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=l098FqpO1fiETy/PtHT1VY75tQtwkAoOGNUItobgKu8uMq+/fOGXZe6ks1JsDmhnq
	 ozj3xwjuCol0qwfvZwqZknHvXKm0TGTTEKgadBYMLv3FiMnnvk0mKGC1cBz0INc3/j
	 4ZPPPW85NyTMKTlBLysWhmxEun0qdMHrs0zCRTkc=
From: Ahmed Tiba <ahmed.tiba@arm.com>
Date: Fri, 29 May 2026 10:50:49 +0100
Subject: [PATCH v5 09/10] dt-bindings: firmware: add arm,ras-cper
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260529-topics-ahmtib01-ras_ffh_arm_internal_review-v5-9-2e0500d42642@arm.com>
References: <20260529-topics-ahmtib01-ras_ffh_arm_internal_review-v5-0-2e0500d42642@arm.com>
In-Reply-To: <20260529-topics-ahmtib01-ras_ffh_arm_internal_review-v5-0-2e0500d42642@arm.com>
To: will@kernel.org, jic23@kernel.org, xueshuai@linux.alibaba.com, 
 saket.dumbre@intel.com, mchehab@kernel.org, dave@stgolabs.net, 
 djbw@kernel.org, bp@alien8.de, tony.luck@intel.com, guohanjun@huawei.com, 
 lenb@kernel.org, skhan@linuxfoundation.org, vishal.l.verma@intel.com, 
 rafael@kernel.org, corbet@lwn.net, ira.weiny@intel.com, 
 dave.jiang@intel.com, krzk+dt@kernel.org, robh@kernel.org, 
 catalin.marinas@arm.com, alison.schofield@intel.com, conor+dt@kernel.org
Cc: Ahmed Tiba <ahmed.tiba@arm.com>, linux-arm-kernel@lists.infradead.org, 
 Michael.Zhao2@arm.com, linux-doc@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-cxl@vger.kernel.org, 
 Dmitry.Lamerov@arm.com, devicetree@vger.kernel.org, 
 linux-acpi@vger.kernel.org, linux-edac@vger.kernel.org, 
 acpica-devel@lists.linux.dev
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1780048269; l=2722;
 i=ahmed.tiba@arm.com; s=20260219; h=from:subject:message-id;
 bh=G1ftAdKNVg9HYWt6/7QhaAQawKb5RYu0DeFnL5fEvGQ=;
 b=yJnoEaUmwzQl3GmFCFEwHXg6/dKhep2MRU6opjCH8f3XDi0ulkMs3PFg4YBVOvW+ORW4wPgae
 Bw8FEWluc2uBIJBsJ+h84yM6yMvTO5SjzAEE7UjUgq1CLVikSYAZoDA
X-Developer-Key: i=ahmed.tiba@arm.com; a=ed25519;
 pk=xVOtd+Qklh/4tuM3tB+BEZD4jj5a6W59C3KCNX6v7OE=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260529_025157_793035_5066E023 
X-CRM114-Status: GOOD (  13.39  )
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

Describe the DeviceTree node that exposes the Arm firmware-first
CPER provider and hook the file into MAINTAINERS so the
binding has an owner.

Signed-off-by: Ahmed Tiba <ahmed.tiba@arm.com>
---
 .../devicetree/bindings/firmware/arm,ras-cper.yaml | 54 ++++++++++++++++++++++
 MAINTAINERS                                        |  5 ++
 2 files changed, 59 insertions(+)

diff --git a/Documentation/devicetree/bindings/firmware/arm,ras-cper.yaml b/Documentation/devicetree/bindings/firmware/arm,ras-cper.yaml
new file mode 100644
index 000000000000..3d4de096093f
--- /dev/null
+++ b/Documentation/devicetree/bindings/firmware/arm,ras-cper.yaml
@@ -0,0 +1,54 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/firmware/arm,ras-cper.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Arm RAS CPER provider
+
+maintainers:
+  - Ahmed Tiba <ahmed.tiba@arm.com>
+
+description:
+  Arm Reliability, Availability and Serviceability (RAS) firmware can expose
+  a firmware-first CPER error source directly via DeviceTree. Firmware
+  provides the CPER Generic Error Status block and notifies the OS through
+  an interrupt.
+
+properties:
+  compatible:
+    const: arm,ras-cper
+
+  memory-region:
+    minItems: 1
+    items:
+      - description:
+          CPER Generic Error Status block exposed by firmware.
+      - description:
+          Optional firmware-owned ack buffer used on platforms
+          where firmware needs an explicit "ack" handshake before overwriting
+          the CPER buffer. Firmware watches bit 0 and expects the OS to set it
+          once the current status block has been consumed.
+
+  interrupts:
+    maxItems: 1
+    description:
+      Interrupt used to signal that a new status record is ready.
+
+required:
+  - compatible
+  - memory-region
+  - interrupts
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/interrupt-controller/arm-gic.h>
+
+    error-handler {
+      compatible = "arm,ras-cper";
+      memory-region = <&ras_cper_buffer>, <&ras_cper_ack>;
+      interrupts = <GIC_SPI 32 IRQ_TYPE_LEVEL_HIGH>;
+    };
+...
diff --git a/MAINTAINERS b/MAINTAINERS
index 461a3eed6129..8a9714603a7d 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -22261,6 +22261,11 @@ M:	Alexandre Bounine <alex.bou9@gmail.com>
 S:	Maintained
 F:	drivers/rapidio/
 
+RAS ERROR STATUS
+M:	Ahmed Tiba <ahmed.tiba@arm.com>
+S:	Maintained
+F:	Documentation/devicetree/bindings/firmware/arm,ras-cper.yaml
+
 RAS INFRASTRUCTURE
 M:	Tony Luck <tony.luck@intel.com>
 M:	Borislav Petkov <bp@alien8.de>

-- 
2.43.0


