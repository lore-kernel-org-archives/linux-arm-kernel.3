Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F3B6FCA0EDB
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 12 Aug 2025 20:33:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=BiX6QaLCf+Gee0jFujsaZSJPx86EVrgq8Xqh0dk1RC8=; b=fOJz4SuKTNzKS/N2yLKfPUrd0J
	CZtXbdFxuWzLbYrcHaSda9q3QBgC2Oq8h8bvVg5L0Ym0n9UAY2BdTmYItjoLw/0/AUisRE/I4dUZT
	ZXyGVi9Ib79ep52QTpg70y9iXuty5Jqdf1kcGDkI6vX1h8//qQqXflIElDxp17Iqg9m66DUJgbLjg
	Sm9LQ7wVWVL0ZgahxkCtbwmqLa7y/dypucP1xfYyFFS6T15i9E81SO5U+/rE7Aq0orYdN77q+psrO
	60EGNB5ApLjFR099dRlW+7Vo3ufKk0P3p1PFDEiOxU/X0eYQeiX2dZzvTxCMcJaMIxqD4D83jXmt/
	ByIzutvw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ulvgb-0000000Bx0U-3gxS;
	Tue, 12 Aug 2025 20:33:33 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ultVh-0000000BgwG-3KbN
	for linux-arm-kernel@lists.infradead.org;
	Tue, 12 Aug 2025 18:14:10 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 839F143418;
	Tue, 12 Aug 2025 18:14:09 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 41965C4CEF1;
	Tue, 12 Aug 2025 18:14:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1755022449;
	bh=2HcrAtW1n+j1v5rCttzhJ6ANTPblo/LyGNkzIEeCNj4=;
	h=From:To:Cc:Subject:Date:From;
	b=N4o67IzqOZ/ryfiqkNPCawiGI7IpviogOApP9QbMXTWSl0qVeiJJojDUcbqHZr/Tj
	 pjDeOjwgPF28MqVSq/WELXbLzYyx8RFYAfyF/ZGLun/HD5krkwa2m70LIo6Rqa7frH
	 nHSgsZfur/klpkbnnIv9+0O59+1CmbUXEul1fG2roD3oTd9yb5Ui0sEVXRgAOPi80e
	 S8JOX8CtZCe5YyheNTtBsFswdpmyPCkwVn9eeQUwQat6aYdxshulP4bPEAvOGTkk5h
	 Z7m5oq35QgGmCzEWFuIdceC1x7odgE8OL+4q8Fy9LZC6/UO1/tDFmMZeyD9L1hXk5k
	 7twqdQpddEf5Q==
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Jassi Brar <jassisinghbrar@gmail.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Ray Jui <rjui@broadcom.com>,
	Scott Branden <sbranden@broadcom.com>,
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>
Cc: linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH] dt-bindings: mailbox: Convert brcm,iproc-pdc-mbox to DT schema
Date: Tue, 12 Aug 2025 13:14:04 -0500
Message-ID: <20250812181406.65390-1-robh@kernel.org>
X-Mailer: git-send-email 2.47.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250812_111409_874156_F734827C 
X-CRM114-Status: GOOD (  15.96  )
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

Convert the Broadcom iProc PDC mailbox binding to DT schema format. It's
a straightforward conversion.

Signed-off-by: Rob Herring (Arm) <robh@kernel.org>
---
 .../bindings/mailbox/brcm,iproc-pdc-mbox.txt  | 25 -------
 .../bindings/mailbox/brcm,iproc-pdc-mbox.yaml | 66 +++++++++++++++++++
 2 files changed, 66 insertions(+), 25 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/mailbox/brcm,iproc-pdc-mbox.txt
 create mode 100644 Documentation/devicetree/bindings/mailbox/brcm,iproc-pdc-mbox.yaml

diff --git a/Documentation/devicetree/bindings/mailbox/brcm,iproc-pdc-mbox.txt b/Documentation/devicetree/bindings/mailbox/brcm,iproc-pdc-mbox.txt
deleted file mode 100644
index 9bcdf2087625..000000000000
--- a/Documentation/devicetree/bindings/mailbox/brcm,iproc-pdc-mbox.txt
+++ /dev/null
@@ -1,25 +0,0 @@
-The PDC driver manages data transfer to and from various offload engines
-on some Broadcom SoCs. An SoC may have multiple PDC hardware blocks. There is
-one device tree entry per block.  On some chips, the PDC functionality is
-handled by the FA2 (Northstar Plus).
-
-Required properties:
-- compatible : Should be "brcm,iproc-pdc-mbox" or "brcm,iproc-fa2-mbox" for
-  FA2/Northstar Plus.
-- reg: Should contain PDC registers location and length.
-- interrupts: Should contain the IRQ line for the PDC.
-- #mbox-cells: 1
-- brcm,rx-status-len: Length of metadata preceding received frames, in bytes.
-
-Optional properties:
-- brcm,use-bcm-hdr:  present if a BCM header precedes each frame.
-
-Example:
-	pdc0: iproc-pdc0@612c0000 {
-		compatible = "brcm,iproc-pdc-mbox";
-		reg = <0 0x612c0000 0 0x445>;  /* PDC FS0 regs */
-		interrupts = <GIC_SPI 187 IRQ_TYPE_LEVEL_HIGH>;
-		#mbox-cells = <1>;   /* one cell per mailbox channel */
-		brcm,rx-status-len = <32>;
-		brcm,use-bcm-hdr;
-	};
diff --git a/Documentation/devicetree/bindings/mailbox/brcm,iproc-pdc-mbox.yaml b/Documentation/devicetree/bindings/mailbox/brcm,iproc-pdc-mbox.yaml
new file mode 100644
index 000000000000..5534ae07c9fa
--- /dev/null
+++ b/Documentation/devicetree/bindings/mailbox/brcm,iproc-pdc-mbox.yaml
@@ -0,0 +1,66 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/mailbox/brcm,iproc-pdc-mbox.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Broadcom iProc PDC mailbox
+
+maintainers:
+  - Ray Jui <rjui@broadcom.com>
+  - Scott Branden <sbranden@broadcom.com>
+
+description:
+  The PDC driver manages data transfer to and from various offload engines on
+  some Broadcom SoCs. An SoC may have multiple PDC hardware blocks. There is one
+  device tree entry per block. On some chips, the PDC functionality is handled
+  by the FA2 (Northstar Plus).
+
+properties:
+  compatible:
+    enum:
+      - brcm,iproc-pdc-mbox
+      - brcm,iproc-fa2-mbox
+
+  reg:
+    maxItems: 1
+
+  dma-coherent: true
+
+  interrupts:
+    maxItems: 1
+
+  '#mbox-cells':
+    const: 1
+
+  brcm,rx-status-len:
+    description:
+      Length of metadata preceding received frames, in bytes.
+    $ref: /schemas/types.yaml#/definitions/uint32
+
+  brcm,use-bcm-hdr:
+    type: boolean
+    description:
+      Present if a BCM header precedes each frame.
+
+required:
+  - compatible
+  - reg
+  - interrupts
+  - '#mbox-cells'
+  - brcm,rx-status-len
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/interrupt-controller/arm-gic.h>
+
+    mailbox0@612c0000 {
+        compatible = "brcm,iproc-pdc-mbox";
+        reg = <0x612c0000 0x445>;
+        interrupts = <GIC_SPI 187 IRQ_TYPE_LEVEL_HIGH>;
+        #mbox-cells = <1>;
+        brcm,rx-status-len = <32>;
+        brcm,use-bcm-hdr;
+    };
-- 
2.47.2


