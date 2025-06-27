Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 10017C77B7F
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 27 Jun 2025 22:05:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=6mhjiQn6GRq0F16Od4LazmpamaceA+hEcOOz74SYdOA=; b=G+SGzk8cd7b7f72Z2hs1Ng8M3t
	WX+wzmDA4hTV9MS3CyEY+a0yvafG3hx/PQRLMujfzGHWrdMikVkEUzjsXKUduG0McmU8a0KjbkVVA
	RSX+8Ue8+3TNdJB9gOntbyXuDIDDz20u4oWZXhumR7eAl/cSu31QCkZB7iW13qA1Fwuxs3UbrbR4L
	kofPDfM4GIapxBORMYCxIQp4mIej0BhP5v9gK8B/PASiMbI6JxocoN3EoirA+Ywn0fRyv1Ft4mAxV
	cRm83aTOSCZ27a/qMR7HleejaXkacsa3ARq71jpYOOEouG1emV93vRKxJDD8SaLq0a2pT4pQ2aDxv
	IEJYEqow==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uVHBw-0000000FukZ-2bNr;
	Fri, 27 Jun 2025 22:05:04 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uVH8W-0000000FuT1-14Ph;
	Fri, 27 Jun 2025 22:01:33 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id A45DF43C4D;
	Fri, 27 Jun 2025 22:01:31 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6D49FC4CEE3;
	Fri, 27 Jun 2025 22:01:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1751061691;
	bh=eB+1TBWueBXeFaf0WArLJ2C0zNUBtvNTmMb+w3Q/IcQ=;
	h=From:To:Cc:Subject:Date:From;
	b=Yjj77pvCtBCAgEoimi/bPHlVFa93PfBC+FasYZ+gtRlSoctqCZQh6NEym5xvEnFnA
	 jmDivoMnt6Vud2K2qwegg+uMIqtz3oBZGpcGmqAQ2B2uOoanJJJeaMu5wztObNwpC4
	 VRW60EDmeSIosHlOE6dPMrTgYirK0syvr7ZaSrwMnv1zFy7KR9SbXVecxtBCTAG8+k
	 mr+hGMgdaFOTx3lV+5RGiOc5hh8xv2nKBjRwdOH2cqhLToi7Y0uUaWUrh0CpOjF8AV
	 s6OEw+Z3pRGs5XyLVdx9lvxo4ivFM5wzt3Th+TxWaD4RBxVWOZVhShw2COIkFYEWqV
	 MPAIQ01dU1o1Q==
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Vinod Koul <vkoul@kernel.org>,
	Kishon Vijay Abraham I <kishon@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Ray Jui <rjui@broadcom.com>,
	Scott Branden <sbranden@broadcom.com>,
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>
Cc: linux-phy@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH v2] dt-bindings: phy: Convert brcm,sr-usb-combo-phy to DT schema
Date: Fri, 27 Jun 2025 17:01:25 -0500
Message-ID: <20250627220126.214577-1-robh@kernel.org>
X-Mailer: git-send-email 2.47.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250627_150132_331272_4C37FF0A 
X-CRM114-Status: GOOD (  13.60  )
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

Convert the Broadcom Stingray USB PHY binding to DT schema format. It's
a straight forward conversion.

Signed-off-by: Rob Herring (Arm) <robh@kernel.org>
---
v2:
 - Fix maintainers to Scott and Ray
---
 .../bindings/phy/brcm,sr-usb-combo-phy.yaml   | 65 +++++++++++++++++++
 .../bindings/phy/brcm,stingray-usb-phy.txt    | 32 ---------
 2 files changed, 65 insertions(+), 32 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/phy/brcm,sr-usb-combo-phy.yaml
 delete mode 100644 Documentation/devicetree/bindings/phy/brcm,stingray-usb-phy.txt

diff --git a/Documentation/devicetree/bindings/phy/brcm,sr-usb-combo-phy.yaml b/Documentation/devicetree/bindings/phy/brcm,sr-usb-combo-phy.yaml
new file mode 100644
index 000000000000..6224ba0f2990
--- /dev/null
+++ b/Documentation/devicetree/bindings/phy/brcm,sr-usb-combo-phy.yaml
@@ -0,0 +1,65 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/phy/brcm,sr-usb-combo-phy.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Broadcom Stingray USB PHY
+
+maintainers:
+  - Ray Jui <rjui@broadcom.com>
+  - Scott Branden <sbranden@broadcom.com>
+
+properties:
+  compatible:
+    enum:
+      - brcm,sr-usb-combo-phy
+      - brcm,sr-usb-hs-phy
+
+  reg:
+    maxItems: 1
+
+  '#phy-cells':
+    description: PHY cell count indicating PHY type
+    enum: [ 0, 1 ]
+
+required:
+  - compatible
+  - reg
+  - '#phy-cells'
+
+allOf:
+  - if:
+      properties:
+        compatible:
+          contains:
+            const: brcm,sr-usb-combo-phy
+    then:
+      properties:
+        '#phy-cells':
+          const: 1
+  - if:
+      properties:
+        compatible:
+          contains:
+            const: brcm,sr-usb-hs-phy
+    then:
+      properties:
+        '#phy-cells':
+          const: 0
+
+additionalProperties: false
+
+examples:
+  - |
+    usb-phy@0 {
+        compatible = "brcm,sr-usb-combo-phy";
+        reg = <0x00000000 0x100>;
+        #phy-cells = <1>;
+    };
+  - |
+    usb-phy@20000 {
+        compatible = "brcm,sr-usb-hs-phy";
+        reg = <0x00020000 0x100>;
+        #phy-cells = <0>;
+    };
diff --git a/Documentation/devicetree/bindings/phy/brcm,stingray-usb-phy.txt b/Documentation/devicetree/bindings/phy/brcm,stingray-usb-phy.txt
deleted file mode 100644
index 4ba298966af9..000000000000
--- a/Documentation/devicetree/bindings/phy/brcm,stingray-usb-phy.txt
+++ /dev/null
@@ -1,32 +0,0 @@
-Broadcom Stingray USB PHY
-
-Required properties:
- - compatible : should be one of the listed compatibles
-	- "brcm,sr-usb-combo-phy" is combo PHY has two PHYs, one SS and one HS.
-	- "brcm,sr-usb-hs-phy" is a single HS PHY.
- - reg: offset and length of the PHY blocks registers
- - #phy-cells:
-   - Must be 1 for brcm,sr-usb-combo-phy as it expects one argument to indicate
-     the PHY number of two PHYs. 0 for HS PHY and 1 for SS PHY.
-   - Must be 0 for brcm,sr-usb-hs-phy.
-
-Refer to phy/phy-bindings.txt for the generic PHY binding properties
-
-Example:
-	usbphy0: usb-phy@0 {
-		compatible = "brcm,sr-usb-combo-phy";
-		reg = <0x00000000 0x100>;
-		#phy-cells = <1>;
-	};
-
-	usbphy1: usb-phy@10000 {
-		compatible = "brcm,sr-usb-combo-phy";
-		reg = <0x00010000 0x100>,
-		#phy-cells = <1>;
-	};
-
-	usbphy2: usb-phy@20000 {
-		compatible = "brcm,sr-usb-hs-phy";
-		reg = <0x00020000 0x100>,
-		#phy-cells = <0>;
-	};
-- 
2.47.2


