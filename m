Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BDBA4CA0EDC
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 12 Aug 2025 16:20:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=j0RfBy0B0ML64kaxdP09fhg7oili9kPFcYcwS1oIMyI=; b=qGOyeMMAsyu7ewERVvjv+PPiUx
	k9SgFDRFcLzVJWn5npv9cQtoa5xB52dYvLDO/7mLwa09cGhFNf7s1ytpp7Boy9Jog412prowJ8/H9
	PF13bB65BFmGaGCdpGw9f/klODk/w4BWO9Fhtt/ZKAIRM0uQQbVAg1w4EY8v753RAi3RjZC7fVYJP
	aDdF5wRJtmAki3Yvbj+qpb+m1lttFaNSZKG+L4Sz1z31Xwi+VoMfGwTeBzhdES+AW4ZWdZB23qhdx
	Mbc6PXgdq5GSTTy+IxEDNliWBgrcIi4c0XRJ47vydbjDZzD2HF7AOTVOAlrge3XMf77HXZBhfHRWL
	93/+lZCA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ulrjz-0000000BKNa-0R8J;
	Tue, 12 Aug 2025 16:20:47 +0000
Received: from pegase2.c-s.fr ([93.17.235.10])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uln3c-0000000Ab88-1WLo
	for linux-arm-kernel@lists.infradead.org;
	Tue, 12 Aug 2025 11:20:45 +0000
Received: from localhost (mailhub4.si.c-s.fr [172.26.127.67])
	by localhost (Postfix) with ESMTP id 4c1TBR4kXzz9sT7;
	Tue, 12 Aug 2025 13:03:11 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from pegase2.c-s.fr ([172.26.127.65])
	by localhost (pegase2.c-s.fr [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 3y8dTxRQA3KN; Tue, 12 Aug 2025 13:03:11 +0200 (CEST)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
	by pegase2.c-s.fr (Postfix) with ESMTP id 4c1TBP5hjWz9sSs;
	Tue, 12 Aug 2025 13:03:09 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id AE0E58B763;
	Tue, 12 Aug 2025 13:03:09 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
	by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
	with ESMTP id Qz7WChCQ-Wh5; Tue, 12 Aug 2025 13:03:09 +0200 (CEST)
Received: from PO20335.idsi0.si.c-s.fr (unknown [192.168.235.99])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id 20F128B764;
	Tue, 12 Aug 2025 13:03:09 +0200 (CEST)
From: Christophe Leroy <christophe.leroy@csgroup.eu>
To: Qiang Zhao <qiang.zhao@nxp.com>,
	Linus Walleij <linus.walleij@linaro.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: Christophe Leroy <christophe.leroy@csgroup.eu>,
	linux-kernel@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org,
	linux-arm-kernel@lists.infradead.org,
	linux-gpio@vger.kernel.org,
	devicetree@vger.kernel.org
Subject: [PATCH 4/4] dt-bindings: soc: fsl: qe: Add an interrupt controller for QUICC Engine Ports
Date: Tue, 12 Aug 2025 13:02:54 +0200
Message-ID: <0b56ef403a7c8d0f8305e847d68959a1037d365e.1754996033.git.christophe.leroy@csgroup.eu>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <cover.1754996033.git.christophe.leroy@csgroup.eu>
References: <cover.1754996033.git.christophe.leroy@csgroup.eu>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1754996575; l=2493; i=christophe.leroy@csgroup.eu; s=20211009; h=from:subject:message-id; bh=sBDv7vR+It1XYOsUbKJGVxht0ECRwLjzMeT3ejRDm/U=; b=BOrAHvPX1MdgLy+6wlTvGbgoypCVvvGj7lfPu6JAC3QbSLnZxuD3Vq6NaU3gedK/5SowU993K yN7/zKYS8O5AWY9thNswXKEYACGBAOQv5dd7OmZYqNex0uG2y6q4nwB
X-Developer-Key: i=christophe.leroy@csgroup.eu; a=ed25519; pk=HIzTzUj91asvincQGOFx6+ZF5AoUuP9GdOtQChs7Mm0=
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250812_042044_575237_FC0EF37C 
X-CRM114-Status: GOOD (  14.05  )
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

The QUICC Engine provides interrupts for a few I/O ports. This is
handled via a separate interrupt ID and managed via a triplet of
dedicated registers hosted by the SoC.

Implement an interrupt driver for it for that those IRQs can then
be linked to the related GPIOs.

Signed-off-by: Christophe Leroy <christophe.leroy@csgroup.eu>
---
 .../soc/fsl/cpm_qe/fsl,qe-ports-ic.yaml       | 63 +++++++++++++++++++
 1 file changed, 63 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/soc/fsl/cpm_qe/fsl,qe-ports-ic.yaml

diff --git a/Documentation/devicetree/bindings/soc/fsl/cpm_qe/fsl,qe-ports-ic.yaml b/Documentation/devicetree/bindings/soc/fsl/cpm_qe/fsl,qe-ports-ic.yaml
new file mode 100644
index 0000000000000..7c98706d03dd1
--- /dev/null
+++ b/Documentation/devicetree/bindings/soc/fsl/cpm_qe/fsl,qe-ports-ic.yaml
@@ -0,0 +1,63 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+
+title: Freescale QUICC Engine I/O Ports Interrupt Controller
+
+maintainers:
+  - name: Christophe Leroy
+    email: christophe.leroy@csgroup.eu
+
+description: |
+  Interrupt controller for the QUICC Engine I/O ports found on some
+  Freescale/NXP PowerQUICC and QorIQ SoCs.
+
+properties:
+  compatible:
+    enum:
+      - fsl,mpc8323-qe-ports-ic
+      - fsl,mpc8360-qe-ports-ic
+      - fsl,mpc8568-qe-ports-ic
+
+  reg:
+    description: Base address and size of the QE I/O Ports Interrupt Controller registers.
+    minItems: 1
+    maxItems: 1
+
+  interrupt-controller:
+    type: boolean
+    description: Indicates this node is an interrupt controller.
+
+  '#address-cells':
+    const: 0
+    description: Must be 0.
+
+  '#interrupt-cells':
+    const: 1
+    description: Number of cells to encode an interrupt specifier.
+
+  interrupts:
+    minItems: 1
+    maxItems: 1
+    description: Interrupt line to which the QE I/O Ports controller is connected.
+
+  interrupt-parent:
+    description: Phandle to the parent interrupt controller.
+
+required:
+  - compatible
+  - reg
+  - interrupt-controller
+  - '#address-cells'
+  - '#interrupt-cells'
+  - interrupts
+  - interrupt-parent
+
+examples:
+  - |
+    interrupt-controller@c00 {
+      interrupt-controller;
+      compatible = "fsl,mpc8323-qe-ports-ic";
+      #address-cells = <0>;
+      #interrupt-cells = <1>;
+      reg = <0xc00 0x18>;
+      interrupts = <74 0x8>;
+      interrupt-parent = <&ipic>;
-- 
2.49.0


