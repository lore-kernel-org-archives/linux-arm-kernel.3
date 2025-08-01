Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 78AEAC87FCA
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  1 Aug 2025 20:11:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=SWVba2QF+FAtEBq/LMZ5p4fhMnOvaZzmetuOniYwx8g=; b=nSRzOl97xQOkfvFN6J/yufskWp
	MuOl8hP51ncK9HXpcMVmZHn4VSt+At2LKle7ln1wHmeeDacY2rTt35VSJjKwJsM/taXsiHFeLXd8x
	4d01UAykxaRhzvNgiuNA76odWZCLUnWU3kPtQRsVDBKWZarr1HjIU84OQscNicC+ZI1FVwPRjPHdJ
	dnT1BNHW8n//qdYv8T3sYcidTbuxBguV4kkD0vO9K+rOkmyKBOtFtRVA/BzkL6r2kkDNODRa/ut69
	biapAk95DSsma/ayXI0FLg0Gm8nIzzkqRWzmoO+wOyjJDnii5MgFWTzRxvGLcpFSxDOqPq7aBUmtu
	lJxjLOIQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uhw6S-00000006jUv-1lHx;
	Fri, 01 Aug 2025 20:11:44 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uhw3s-00000006jGe-0Eno
	for linux-arm-kernel@lists.infradead.org;
	Fri, 01 Aug 2025 20:09:04 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 728E36112D;
	Fri,  1 Aug 2025 20:09:02 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 014BFC4CEF4;
	Fri,  1 Aug 2025 20:09:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1754078942;
	bh=fw8F8QiVkdM8Joh95+oEe6ERIlYYV1zFhGgB51zRycI=;
	h=From:To:Cc:Subject:Date:From;
	b=WJSufQXFoUAEZZCjWBC9UGKH+EmX5KsBppVj8N0wgJiZIlj2c0SE/B6ot+wXAzjfR
	 8c0FBs/P7OcD/RPqQVyOpmiaKgupLYB+rcf0dm4tRYo6chPIoNZzaM34Ho1yr1ojw0
	 6L6DO6oO5rZrvRV1fWzWiHWjhZ8iy/bv02S3qKSNwSsh/Pa4Q2Qg0E/b0zTOJEMZwr
	 Z6St/MYc0GkSJ/xhl1I+OPaIqFcdBBzbKKybMWRi2xo4UuWN4vHtLJWL92wJM9qUcS
	 9IRHeazBA/b2/wTc3pkdJw4SqdCMkWaez/8bTr4PIKWjFC56K6F9N38t09MjTNd2Jz
	 utKIeLrGDySuw==
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Lorenzo Pieralisi <lpieralisi@kernel.org>,
	=?UTF-8?q?Krzysztof=20Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
	Manivannan Sadhasivam <mani@kernel.org>,
	Bjorn Helgaas <bhelgaas@google.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Ray Jui <rjui@broadcom.com>,
	Scott Branden <sbranden@broadcom.com>,
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
	=?UTF-8?q?Pali=20Roh=C3=A1r?= <pali@kernel.org>,
	Kunihiko Hayashi <hayashi.kunihiko@socionext.com>,
	Masami Hiramatsu <mhiramat@kernel.org>,
	Kishon Vijay Abraham I <kishon@kernel.org>
Cc: Ray Jui <ray.jui@broadcom.com>,
	Scott Branden <scott.branden@broadcom.com>,
	linux-pci@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] dt-bindings: PCI: Add missing "#address-cells" to interrupt controllers
Date: Fri,  1 Aug 2025 15:07:27 -0500
Message-ID: <20250801200728.3252036-2-robh@kernel.org>
X-Mailer: git-send-email 2.47.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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

An interrupt-controller node which is the parent provider for
"interrupt-map" needs an "#address-cells" property. This fixes
"interrupt_map" warnings in new dtc.

Signed-off-by: Rob Herring (Arm) <robh@kernel.org>
---
PCI maintainers, Please ack, I'll take this with the dtc update for 
6.18.

 Documentation/devicetree/bindings/pci/brcm,iproc-pcie.yaml    | 1 +
 .../devicetree/bindings/pci/marvell,armada-3700-pcie.yaml     | 4 ++++
 .../devicetree/bindings/pci/marvell,kirkwood-pcie.yaml        | 3 +++
 .../devicetree/bindings/pci/socionext,uniphier-pcie.yaml      | 4 ++++
 Documentation/devicetree/bindings/pci/ti,j721e-pci-host.yaml  | 3 +++
 5 files changed, 15 insertions(+)

diff --git a/Documentation/devicetree/bindings/pci/brcm,iproc-pcie.yaml b/Documentation/devicetree/bindings/pci/brcm,iproc-pcie.yaml
index 5434c144d2ec..18e7981241b5 100644
--- a/Documentation/devicetree/bindings/pci/brcm,iproc-pcie.yaml
+++ b/Documentation/devicetree/bindings/pci/brcm,iproc-pcie.yaml
@@ -108,6 +108,7 @@ examples:
     #include <dt-bindings/interrupt-controller/arm-gic.h>
 
     gic: interrupt-controller {
+        #address-cells = <0>;
         interrupt-controller;
         #interrupt-cells = <3>;
     };
diff --git a/Documentation/devicetree/bindings/pci/marvell,armada-3700-pcie.yaml b/Documentation/devicetree/bindings/pci/marvell,armada-3700-pcie.yaml
index 68090b3ca419..8403c79634ed 100644
--- a/Documentation/devicetree/bindings/pci/marvell,armada-3700-pcie.yaml
+++ b/Documentation/devicetree/bindings/pci/marvell,armada-3700-pcie.yaml
@@ -42,6 +42,9 @@ properties:
     additionalProperties: false
 
     properties:
+      '#address-cells':
+        const: 0
+
       interrupt-controller: true
 
       '#interrupt-cells':
@@ -92,6 +95,7 @@ examples:
             reset-gpios = <&gpio1 15 GPIO_ACTIVE_LOW>;
 
             pcie_intc: interrupt-controller {
+                #address-cells = <0>;
                 interrupt-controller;
                 #interrupt-cells = <1>;
             };
diff --git a/Documentation/devicetree/bindings/pci/marvell,kirkwood-pcie.yaml b/Documentation/devicetree/bindings/pci/marvell,kirkwood-pcie.yaml
index 7be695320ddf..3d68bfbe6feb 100644
--- a/Documentation/devicetree/bindings/pci/marvell,kirkwood-pcie.yaml
+++ b/Documentation/devicetree/bindings/pci/marvell,kirkwood-pcie.yaml
@@ -101,6 +101,9 @@ patternProperties:
         additionalProperties: false
 
         properties:
+          '#address-cells':
+            const: 0
+
           interrupt-controller: true
 
           '#interrupt-cells':
diff --git a/Documentation/devicetree/bindings/pci/socionext,uniphier-pcie.yaml b/Documentation/devicetree/bindings/pci/socionext,uniphier-pcie.yaml
index 638b99db0433..c07b0ed51613 100644
--- a/Documentation/devicetree/bindings/pci/socionext,uniphier-pcie.yaml
+++ b/Documentation/devicetree/bindings/pci/socionext,uniphier-pcie.yaml
@@ -56,6 +56,9 @@ properties:
     additionalProperties: false
 
     properties:
+      '#address-cells':
+        const: 0
+
       interrupt-controller: true
 
       '#interrupt-cells':
@@ -109,6 +112,7 @@ examples:
                         <0 0 0  4  &pcie_intc 3>;
 
         pcie_intc: interrupt-controller {
+            #address-cells = <0>;
             interrupt-controller;
             #interrupt-cells = <1>;
             interrupt-parent = <&gic>;
diff --git a/Documentation/devicetree/bindings/pci/ti,j721e-pci-host.yaml b/Documentation/devicetree/bindings/pci/ti,j721e-pci-host.yaml
index 69b499c96c71..c704099f134b 100644
--- a/Documentation/devicetree/bindings/pci/ti,j721e-pci-host.yaml
+++ b/Documentation/devicetree/bindings/pci/ti,j721e-pci-host.yaml
@@ -99,6 +99,9 @@ properties:
     additionalProperties: false
 
     properties:
+      '#address-cells':
+        const: 0
+
       interrupt-controller: true
 
       '#interrupt-cells':
-- 
2.47.2


