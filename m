Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D012BCD4F3C
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 18 May 2026 11:59:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ZJhB/Cv0riMYNJ5tiqsL0fiC9ANsq04nypP/yOWowaw=; b=1zFq28OjgeLhu+7UrdjDbC7hMA
	EUzKKRDVGO8mL4BEdvFla+I7pwcQGmNmWXHnIe3VwAzSsgcR6M6qrFqwmL/XOJCJi3iUroqUSa9/4
	e/bmSN3G2bjaYOTIgZ2uu7IUi3PVoqYIxj3kqZFuZ7P55bSnNcJyKYX5majPK67/ZIlQqG88Ff8l3
	ZlEaslkIB/X9U3VpBSe9jYIPTxnPrstTo55EKfulIetFDmop7WaynJKm6dbiyQa/cnDUKXXXpwAuV
	AOyuK/LDUm1Lz0D2spFSvCsYBQsoA/c75flXAokuQdQqsvGsZaIhpeUPj3PnckH6uL/uj3mVTKsIU
	yYnuqGLA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wOwct-0000000FXL0-1J0y;
	Mon, 18 May 2026 11:59:15 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wOwco-0000000FXGg-3maz
	for linux-arm-kernel@bombadil.infradead.org;
	Mon, 18 May 2026 11:59:11 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=ZJhB/Cv0riMYNJ5tiqsL0fiC9ANsq04nypP/yOWowaw=; b=eX3LiPM0vchfiwBGSQSHcyRAt9
	Nh9+4YlrE6VxyT0n7b+9x39Z4bfS2o+nf9QZ20mHNCpMw1O1sfwel0YSvB1j8lecmFrMye0fLxrJz
	ujraxXbNQQE2+9dSS6oOjJjjb+PwW52KoLMkNXwtqZxWs1RbacBPldQzJ6iylwJ3338C+CGs9srmJ
	97SS5kfTXeeACxevjMPPpvGHusy991+XDMOyvAUxAw7a34loJQz5KrVH81k0k69WNxhXbfuQuOWr7
	Rpd55Ebx3g+kMB/F4Zu81/cXEZOmYbMptuRdNlL7FjuzT+4NKZs6iJ+NA8Yc96fEqx6+YdlyJAaXb
	ud2I0ZpQ==;
Received: from foss.arm.com ([217.140.110.172])
	by desiato.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wOwcl-0000000B2UL-1Kau
	for linux-arm-kernel@lists.infradead.org;
	Mon, 18 May 2026 11:59:09 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id C9CA44660;
	Mon, 18 May 2026 04:59:00 -0700 (PDT)
Received: from e134710.arm.com (e134710.arm.com [10.33.10.82])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id C60BA3F85F;
	Mon, 18 May 2026 04:59:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1779105546; bh=t7eff0nNKGqGSzC5Dpn2m5cRP7fPVTRKNbLymISWJn0=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=chAQVYzqoAtBk1xmJ0LQA/Yk5bciRaNX2fBV1L04I7oVDXeL5rmVGlnNq0qBS8asx
	 AFFXunfWa8soHrVYBApe1lN00BMcr3Anc0/8KsfTfwVSrnNpzAH+nXhwgMXtlSCCLw
	 B7asKW5o9FNMY5ZE+QWdNjyzy1ZW01TPNCMn0wwU=
From: Ahmed Tiba <ahmed.tiba@arm.com>
Date: Mon, 18 May 2026 12:57:52 +0100
Subject: [PATCH v4 09/10] dt-bindings: firmware: add arm,ras-cper
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260518-topics-ahmtib01-ras_ffh_arm_internal_review-v4-9-42698675ba61@arm.com>
References: <20260518-topics-ahmtib01-ras_ffh_arm_internal_review-v4-0-42698675ba61@arm.com>
In-Reply-To: <20260518-topics-ahmtib01-ras_ffh_arm_internal_review-v4-0-42698675ba61@arm.com>
To: rafael@kernel.org, bp@alien8.de, saket.dumbre@intel.com, 
 will@kernel.org, xueshuai@linux.alibaba.com, mchehab@kernel.org, 
 krzk+dt@kernel.org, dave@stgolabs.net, conor+dt@kernel.org, 
 vishal.l.verma@intel.com, jic23@kernel.org, corbet@lwn.net, 
 guohanjun@huawei.com, dave.jiang@intel.com, catalin.marinas@arm.com, 
 lenb@kernel.org, tony.luck@intel.com, skhan@linuxfoundation.org, 
 djbw@kernel.org, alison.schofield@intel.com, ira.weiny@intel.com, 
 robh@kernel.org
Cc: Ahmed Tiba <ahmed.tiba@arm.com>, devicetree@vger.kernel.org, 
 linux-acpi@vger.kernel.org, linux-doc@vger.kernel.org, 
 Dmitry.Lamerov@arm.com, linux-cxl@vger.kernel.org, Michael.Zhao2@arm.com, 
 acpica-devel@lists.linux.dev, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-edac@vger.kernel.org
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1779105490; l=3188;
 i=ahmed.tiba@arm.com; s=20260219; h=from:subject:message-id;
 bh=t7eff0nNKGqGSzC5Dpn2m5cRP7fPVTRKNbLymISWJn0=;
 b=SgWeIgcCxMLYKi3Aq/Hv3NVmCarm1O6TQOTIVwu8Q4qifa5LF03fUyU363y8JGnSRuuIld8Wc
 XwAFkNsII5TDIDl37jyzslr6DElygh2yn7o3VZt2kYLoealFofD+Itr
X-Developer-Key: i=ahmed.tiba@arm.com; a=ed25519;
 pk=xVOtd+Qklh/4tuM3tB+BEZD4jj5a6W59C3KCNX6v7OE=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260518_125908_049211_2B765719 
X-CRM114-Status: GOOD (  13.51  )
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
 .../devicetree/bindings/firmware/arm,ras-cper.yaml | 71 ++++++++++++++++++++++
 MAINTAINERS                                        |  5 ++
 2 files changed, 76 insertions(+)

diff --git a/Documentation/devicetree/bindings/firmware/arm,ras-cper.yaml b/Documentation/devicetree/bindings/firmware/arm,ras-cper.yaml
new file mode 100644
index 000000000000..81dc37390af5
--- /dev/null
+++ b/Documentation/devicetree/bindings/firmware/arm,ras-cper.yaml
@@ -0,0 +1,71 @@
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
+    oneOf:
+      - items:
+          - description:
+              CPER Generic Error Status block exposed by firmware
+      - items:
+          - description:
+              CPER Generic Error Status block exposed by firmware.
+          - description:
+              Optional firmware-owned ack buffer used on platforms
+              where firmware needs an explicit "ack" handshake before overwriting
+              the CPER buffer. Firmware watches bit 0 and expects the OS to set it
+              once the current status block has been consumed.
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
+    reserved-memory {
+      #address-cells = <2>;
+      #size-cells = <2>;
+      ras_cper_buffer: memory@fe800000 {
+        reg = <0x0 0xfe800000 0x0 0x1000>;
+        no-map;
+      };
+
+      ras_cper_ack: memory@fe801000 {
+        reg = <0x0 0xfe801000 0x0 0x1000>;
+        no-map;
+      };
+    };
+
+    error-handler {
+      compatible = "arm,ras-cper";
+      memory-region = <&ras_cper_buffer>, <&ras_cper_ack>;
+      interrupts = <GIC_SPI 32 IRQ_TYPE_LEVEL_HIGH>;
+    };
+...
diff --git a/MAINTAINERS b/MAINTAINERS
index 7492fefa447c..3bbc19589f1a 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -22251,6 +22251,11 @@ M:	Alexandre Bounine <alex.bou9@gmail.com>
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


