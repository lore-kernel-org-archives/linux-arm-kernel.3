Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5026DC369B2
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 14 Apr 2025 14:59:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=BTGfvvmx9uCOlQ7mdVX6yR0ITce+y5QIkRUUepIgMjo=; b=FXmPmErkx52mt7OjQiOItkcyx4
	LR8YkwAqjMIU/CNGRjsH7dAJMiv3HaYhKan/rbXhjMY5wdNDJYeNkxuYPpSWmZwRg6DWmmUapW2Vu
	a7IAZXFNahGtj8AeyWajEyA5kMk+wqTCUAfG5KwMMRERHUHlAnnh76PpcmZ0diDPMdAMb0KvK0xSD
	LtNXjauYSpxYuNzgbboa3lLfQ5fkOf1u6gFe23y8pSfxbhQzMqN858gKk2LaQQIjl+kOqj83RWop8
	STpu07XTCKtO/ndiCLVqAQNM+zBGsSVqx8fjvUyf/jIHqfdeQwMdBMPnsPPtWJIq4tQf8ScW6dQz+
	SNsGFFlQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u4LHO-00000002WRl-2OcN;
	Mon, 14 Apr 2025 14:59:22 +0000
Received: from mail-m1973176.qiye.163.com ([220.197.31.76])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u4L9l-00000002U4q-1lUo;
	Mon, 14 Apr 2025 14:51:31 +0000
Received: from localhost.localdomain (unknown [124.72.37.3])
	by smtp.qiye.163.com (Hmail) with ESMTP id 11d4dc643;
	Mon, 14 Apr 2025 22:51:13 +0800 (GMT+08:00)
From: Kever Yang <kever.yang@rock-chips.com>
To: heiko@sntech.de
Cc: andersson@kernel.org,
	Kever Yang <kever.yang@rock-chips.com>,
	Sebastian Reichel <sebastian.reichel@collabora.com>,
	Rob Herring <robh@kernel.org>,
	Simon Xue <xxm@rock-chips.com>,
	Conor Dooley <conor+dt@kernel.org>,
	Bjorn Helgaas <bhelgaas@google.com>,
	linux-pci@vger.kernel.org,
	=?UTF-8?q?Krzysztof=20Wilczy=C5=84ski?= <kw@linux.com>,
	linux-kernel@vger.kernel.org,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	linux-rockchip@lists.infradead.org,
	devicetree@vger.kernel.org,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Shawn Lin <shawn.lin@rock-chips.com>,
	Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH v9 1/2] dt-bindings: PCI: dw: rockchip: Add rk3576 support
Date: Mon, 14 Apr 2025 22:51:09 +0800
Message-Id: <20250414145110.11275-2-kever.yang@rock-chips.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20250414145110.11275-1-kever.yang@rock-chips.com>
References: <20250414145110.11275-1-kever.yang@rock-chips.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFITzdXWS1ZQUlXWQ8JGhUIEh9ZQVkZTx8YVkpPHx5KT0lCGUhIQ1YVFAkWGhdVEwETFh
	oSFyQUDg9ZV1kYEgtZQVlKSU9VTElVSExVSFlXWRYaDxIVHRRZQVlPS0hVSktJT09PSFVKS0tVSk
	JLS1kG
X-HM-Tid: 0a9634c872e303afkunm11d4dc643
X-HM-MType: 1
X-HM-Sender-Digest: e1kMHhlZQR0aFwgeV1kSHx4VD1lBWUc6OFE6GSo5FTJCDiI2SgtCEksh
	DikKCRlVSlVKTE9PTU9JSUxOSk9DVTMWGhIXVRAeDR4JVQIaFRw7CRQYEFYYExILCFUYFBZFWVdZ
	EgtZQVlKSU9VTElVSExVSFlXWQgBWUFOTE1INwY+
DKIM-Signature: a=rsa-sha256;
	b=cnrrXloX1YP095aIE5OUmRKuSR5Vu121W2IVIRy8DyimtaKTXjq5JVlnHcb7JuWzqOkIGccga8Ul/YnUFJNJfDLtA/JvixHtJ/L8vTUGB9MaQUCkQBITLm4WUhHIpZ+UNSB2ZtZwzD7S5lhyi0X0sB8ywaQJ2fkqC+rMnDIfyfQ=; c=relaxed/relaxed; s=default; d=rock-chips.com; v=1;
	bh=BTGfvvmx9uCOlQ7mdVX6yR0ITce+y5QIkRUUepIgMjo=;
	h=date:mime-version:subject:message-id:from;
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250414_075129_643259_82651E95 
X-CRM114-Status: GOOD (  11.58  )
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

rk3576 is using DWC PCIe controller, with msi interrupt directly to GIC
instead of using GIC ITS, so
- no ITS support is required and the 'msi-map' is not required,
- a new 'msi' interrupt is needed.

Co-developed-by: Sebastian Reichel <sebastian.reichel@collabora.com>
Signed-off-by: Sebastian Reichel <sebastian.reichel@collabora.com>
Signed-off-by: Kever Yang <kever.yang@rock-chips.com>
Reviewed-by: Rob Herring (Arm) <robh@kernel.org>
Reviewed-by: Heiko Stuebner <heiko@sntech.de>
---

Changes in v9:
- Collect review tag

Changes in v8:
- Collect review tag and add Co-developed-by tag.

Changes in v7:
- Move the rk3576 device specific schema out of common.yaml

Changes in v6:
- Fix make dt_binding_check and make CHECK_DTBS=y

Changes in v5:
- Add constraints per device for interrupt-names due to the interrupt is
different from rk3588.

Changes in v4:
- Fix wrong indentation in dt_binding_check report by Rob

Changes in v3:
- Fix dtb check broken on rk3588
- Update commit message

Changes in v2:
- remove required 'msi-map'
- add interrupt name 'msi'

 .../bindings/pci/rockchip-dw-pcie-common.yaml | 10 +++-
 .../bindings/pci/rockchip-dw-pcie.yaml        | 55 +++++++++++++++++--
 2 files changed, 57 insertions(+), 8 deletions(-)

diff --git a/Documentation/devicetree/bindings/pci/rockchip-dw-pcie-common.yaml b/Documentation/devicetree/bindings/pci/rockchip-dw-pcie-common.yaml
index cc9adfc7611c..2150bd8b5fc2 100644
--- a/Documentation/devicetree/bindings/pci/rockchip-dw-pcie-common.yaml
+++ b/Documentation/devicetree/bindings/pci/rockchip-dw-pcie-common.yaml
@@ -65,7 +65,11 @@ properties:
           tx_cpl_timeout, cor_err_sent, nf_err_sent, f_err_sent, cor_err_rx,
           nf_err_rx, f_err_rx, radm_qoverflow
       - description:
-          eDMA write channel 0 interrupt
+          If the matching interrupt name is "msi", then this is the combinded
+          MSI line interrupt, which is to support MSI interrupts output to GIC
+          controller via GIC SPI interrupt instead of GIC its interrupt.
+          If the matching interrupt name is "dma0", then this is the eDMA write
+          channel 0 interrupt.
       - description:
           eDMA write channel 1 interrupt
       - description:
@@ -81,7 +85,9 @@ properties:
       - const: msg
       - const: legacy
       - const: err
-      - const: dma0
+      - enum:
+          - msi
+          - dma0
       - const: dma1
       - const: dma2
       - const: dma3
diff --git a/Documentation/devicetree/bindings/pci/rockchip-dw-pcie.yaml b/Documentation/devicetree/bindings/pci/rockchip-dw-pcie.yaml
index 550d8a684af3..4764a0173ae4 100644
--- a/Documentation/devicetree/bindings/pci/rockchip-dw-pcie.yaml
+++ b/Documentation/devicetree/bindings/pci/rockchip-dw-pcie.yaml
@@ -16,16 +16,13 @@ description: |+
   PCIe IP and thus inherits all the common properties defined in
   snps,dw-pcie.yaml.
 
-allOf:
-  - $ref: /schemas/pci/snps,dw-pcie.yaml#
-  - $ref: /schemas/pci/rockchip-dw-pcie-common.yaml#
-
 properties:
   compatible:
     oneOf:
       - const: rockchip,rk3568-pcie
       - items:
           - enum:
+              - rockchip,rk3576-pcie
               - rockchip,rk3588-pcie
           - const: rockchip,rk3568-pcie
 
@@ -71,8 +68,54 @@ properties:
 
   vpcie3v3-supply: true
 
-required:
-  - msi-map
+allOf:
+  - $ref: /schemas/pci/snps,dw-pcie.yaml#
+  - $ref: /schemas/pci/rockchip-dw-pcie-common.yaml#
+  - if:
+      not:
+        properties:
+          compatible:
+            contains:
+              const: rockchip,rk3576-pcie
+    then:
+      required:
+        - msi-map
+
+  - if:
+      properties:
+        compatible:
+          contains:
+            const: rockchip,rk3576-pcie
+    then:
+      properties:
+        interrupts:
+          minItems: 6
+          maxItems: 6
+        interrupt-names:
+          items:
+            - const: sys
+            - const: pmc
+            - const: msg
+            - const: legacy
+            - const: err
+            - const: msi
+    else:
+      properties:
+        interrupts:
+          minItems: 5
+        interrupt-names:
+          minItems: 5
+          items:
+            - const: sys
+            - const: pmc
+            - const: msg
+            - const: legacy
+            - const: err
+            - const: dma0
+            - const: dma1
+            - const: dma2
+            - const: dma3
+
 
 unevaluatedProperties: false
 
-- 
2.25.1


