Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2D901D3942E
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  2 Apr 2026 14:28:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=CCOVnNSdC1ddrjtgt4UaI6BEDPw3G5/w0hM6qUTn1Lk=; b=Jc6pOPY+DIk9THB59sQTEREtTB
	mc3+vrJABpKC7ggUrmIL9fmXfqLQcVd/rI7nZPr/148FmbB1+X/XivNoTe5KKj9AFTY9egrFAXUNy
	WppvlA6BZ+5Zfw6ILfPlVR1pe/Nax5tyB05+Yrif/vfWVtx6zhalLY6i26AFKDZac+2n9cNC54nRY
	z30Hk8q9epUqMPuos/Wa0ZFSzqAnapay1IiUh6qvrAnigwJu2F3T+v8siLMCvgDJ9Vph10yFlM2Fp
	+DOgf9CT1HTUZjN8hAU0D5MOJPSwtxYllZDHhFV30JL/wdMVl/o4l8LCCpmxojnvlDX8BeSGx2TrF
	g0CLZm3Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w8J1l-00000000L6b-2oVq;
	Thu, 02 Apr 2026 14:28:09 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w8J1h-00000000L0H-0ImH
	for linux-arm-kernel@bombadil.infradead.org;
	Thu, 02 Apr 2026 14:28:07 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=CCOVnNSdC1ddrjtgt4UaI6BEDPw3G5/w0hM6qUTn1Lk=; b=fq06MQsTetRqBh8BnukmPM7yIT
	FMAHGU6hLeOAXf87r+n2+CZktVUbUSsotG5Y7H+tZ+SuS2MWwybDpOVBaZuAANn82USwNxlEDSHCT
	caA40R76b0updQ4FK/JbPXAbqezvBOeHrjFIZMTg8sCGjJLCRE4PPN7yykL4epyQCg+Top2xdG0QO
	pPJj2XX9DjIUz7ShpFDAcG7T+bt/8A1g2q+k8asEWclHKV48Cxu7wtO4ePiY1RFDbEOvWF5GoIWmO
	g54+hdAdlTLhFyMPHG5yR+5dgaDVR2uSX7xQPP3UhTvEnsyIkp5Y7EDCLKxoQAc+D84vxlRv5T4Mm
	0U5n6gpg==;
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w8J1d-00000002gEx-3S5d
	for linux-arm-kernel@lists.infradead.org;
	Thu, 02 Apr 2026 14:28:03 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 0E63043C57;
	Thu,  2 Apr 2026 14:27:58 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 46B4EC2BCB3;
	Thu,  2 Apr 2026 14:27:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1775140077;
	bh=NAByKfU/ZjEewVQnAkmCy1V2fy4PZYtDqNWOg10g8F4=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=Np8hZNYtGt5gbuN6MvaRAeCqJ3F1oqjeR011UgZKWdilMm1NWwEoLJsrop9vEKEKJ
	 CayjbD65CgAq6kxmTN8/ZMRp6UbYRXHlvyQOrz43iT1i9DhBkbE6llfzKbHqVGbHqF
	 dsl60/acNLsak+orkqezhAvI3XmmvonG/75gxEvZG1O2auyx6FUxOJM7Vty8iOE2kI
	 +21b6K4dPmLpZGAKuwA2BVZ0XHXDUr6qAf6eXd18c8zJtGEZocRpqAI+pDz1Wpvh4w
	 Ank1UlBk7SRIQT8kGQQsNqqE0Z42e2gjIlq4NqcgLJQkmzABy5cDqtHaNKQxYaML1Q
	 7ur41gY0vsfyQ==
From: Thierry Reding <thierry.reding@kernel.org>
Date: Thu, 02 Apr 2026 16:27:35 +0200
Subject: [PATCH v4 1/4] dt-bindings: pci: Document the NVIDIA Tegra264 PCIe
 controller
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260402-tegra264-pcie-v4-1-21e2e19987e8@nvidia.com>
References: <20260402-tegra264-pcie-v4-0-21e2e19987e8@nvidia.com>
In-Reply-To: <20260402-tegra264-pcie-v4-0-21e2e19987e8@nvidia.com>
To: Bjorn Helgaas <bhelgaas@google.com>, 
 Lorenzo Pieralisi <lpieralisi@kernel.org>, 
 =?utf-8?q?Krzysztof_Wilczy=C5=84ski?= <kwilczynski@kernel.org>, 
 Manivannan Sadhasivam <mani@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Thierry Reding <thierry.reding@gmail.com>, 
 Jonathan Hunter <jonathanh@nvidia.com>, 
 Karthikeyan Mitran <m.karthikeyan@mobiveil.co.in>, 
 Hou Zhiqiang <Zhiqiang.Hou@nxp.com>, 
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 =?utf-8?q?Pali_Roh=C3=A1r?= <pali@kernel.org>, 
 Michal Simek <michal.simek@amd.com>, Kevin Xie <kevin.xie@starfivetech.com>
Cc: linux-pci@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, Thierry Reding <treding@nvidia.com>
X-Mailer: b4 0.15.1
X-Developer-Signature: v=1; a=openpgp-sha256; l=6863; i=treding@nvidia.com;
 h=from:subject:message-id; bh=OWl+kwHniIJmn2xT8tkW6mFB/fgovQVw1CKdkoUXhPs=;
 b=owEBbQKS/ZANAwAKAd0jrNd/PrOhAcsmYgBpznznvY0VyUIk/fnSv3MCEw9J6m6PLKgotKsZu
 ORvzT4pPzeJAjMEAAEKAB0WIQSI6sMIAUnM98CNyJ/dI6zXfz6zoQUCac585wAKCRDdI6zXfz6z
 oTzCD/0V1hNnSNbAiKMSLVeNsPoLZy4RnVdQ7bR1WzYlNd042sabyfuzOnLelO99DMyrlbVoNge
 YdmBgNaAuoBJCQcTUxkKLp7IIiNNQlBAxxUNCnnfutVal7IKePDgcf2ZiclzO7Urlyi7tuL+GEB
 jBf6gAP8758J9KRcy7IUTSIsbeicTMhafg5Rvg5YaIISl6oAzNj99creo068Ke43pd+hc5ArT8Z
 GZGpql1IiB5exxe2Y5dsjMKF7kE+ZRiqiNDwFwTc+CenCx/yXUtw6WNvTgXDHF6qbvTzKHAk7G4
 tgYDg7JH7+Tvp8Ii2y5A7hc1EKBNvizKuCTtOoX1RcXn2CXBn/+gWIA+N6zB78liX0Vi9GcWvbn
 9J0NtyC7yyyKnR2pJTdRI2eRBSJAazoGEZv5MtFp8D5s2G56CeUKHw6Nqp9C8W5ntGu5TTM1Sqe
 nhbvFbFHE8cLwJ5AFyVlGv874nEYCpsZbdNwCLfJd4wRUJzDYxbFrlGq8kBRHaTi4xwHiZDBO5G
 S5pM1aYKbrKG6V8SsDuVhPWIGSApZHau1ecXEjmiDCp2lcb6wBAikX0XOMVDpwq7Rv4kJmsgLDA
 k71lZkvIfSmXawWjf72LlCjpsznvyeA/K3ux9QNVqFxvbxm+JxGnlGjJoLhnnb+SsEWB8Q1uo20
 tv/SMhE1jXe5wwg==
X-Developer-Key: i=treding@nvidia.com; a=openpgp;
 fpr=88EAC3080149CCF7C08DC89FDD23ACD77F3EB3A1
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260402_152802_226621_62E52444 
X-CRM114-Status: GOOD (  17.06  )
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

From: Thierry Reding <treding@nvidia.com>

The six PCIe controllers found on Tegra264 are of two types: one is used
for the internal GPU and therefore is not connected to a UPHY and the
remaining five controllers are typically routed to a PCI slot and have
additional controls for the physical link.

While these controllers can be switched into endpoint mode, this binding
describes the root complex mode only.

Signed-off-by: Thierry Reding <treding@nvidia.com>
---
Changes in v4:
- ECAM is outside of the controller's region, so it cannot be the first
  reg entry, otherwise we get warnings because it doesn't match the
  unit-address, so revert back to oneOf construct

Changes in v2:
- move ECAM region first and unify C0 vs. C1-C5
- move unevaluatedProperties to right before the examples
- add description to clarify the two types of controllers
- add examples for C0 and C1-C5
---
 .../bindings/pci/nvidia,tegra264-pcie.yaml         | 174 +++++++++++++++++++++
 1 file changed, 174 insertions(+)

diff --git a/Documentation/devicetree/bindings/pci/nvidia,tegra264-pcie.yaml b/Documentation/devicetree/bindings/pci/nvidia,tegra264-pcie.yaml
new file mode 100644
index 000000000000..acb677d477fb
--- /dev/null
+++ b/Documentation/devicetree/bindings/pci/nvidia,tegra264-pcie.yaml
@@ -0,0 +1,174 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/pci/nvidia,tegra264-pcie.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: NVIDIA Tegra264 PCIe controller
+
+maintainers:
+  - Thierry Reding <thierry.reding@gmail.com>
+  - Jon Hunter <jonathanh@nvidia.com>
+
+description: |
+  Of the six PCIe controllers found on Tegra264, one (C0) is used for the
+  internal GPU and the other five (C1-C5) are routed to connectors such as
+  PCI or M.2 slots. Therefore the UPHY registers (XPL) exist only for C1
+  through C5, but not for C0.
+
+properties:
+  compatible:
+    const: nvidia,tegra264-pcie
+
+  reg:
+    minItems: 4
+    maxItems: 5
+
+  reg-names:
+    minItems: 4
+    maxItems: 5
+
+  interrupts:
+    minItems: 1
+    maxItems: 4
+
+  dma-coherent: true
+
+  nvidia,bpmp:
+    $ref: /schemas/types.yaml#/definitions/phandle-array
+    description: |
+      Must contain a pair of phandle (to the BPMP controller node) and
+      controller ID. The following are the controller IDs for each controller:
+
+      0: C0
+      1: C1
+      2: C2
+      3: C3
+      4: C4
+      5: C5
+    items:
+      - items:
+          - description: phandle to the BPMP controller node
+          - description: PCIe controller ID
+            maximum: 5
+
+required:
+  - interrupt-map
+  - interrupt-map-mask
+  - iommu-map
+  - msi-map
+  - nvidia,bpmp
+
+allOf:
+  - $ref: /schemas/pci/pci-host-bridge.yaml#
+  - oneOf:
+      - description: C0 controller (no UPHY)
+        properties:
+          reg:
+            items:
+              - description: application layer registers
+              - description: transaction layer registers
+              - description: privileged transaction layer registers
+              - description: ECAM compatible configuration space
+
+          reg-names:
+            items:
+              - const: xal
+              - const: xtl
+              - const: xtl-pri
+              - const: ecam
+
+      - description: C1-C5 controllers (with UPHY)
+        properties:
+          reg:
+            items:
+              - description: application layer registers
+              - description: transaction layer registers
+              - description: privileged transaction layer registers
+              - description: data link/physical layer registers
+              - description: ECAM compatible configuration space
+
+          reg-names:
+            items:
+              - const: xal
+              - const: xtl
+              - const: xtl-pri
+              - const: xpl
+              - const: ecam
+
+unevaluatedProperties: false
+
+examples:
+  - |
+    bus {
+      #address-cells = <2>;
+      #size-cells = <2>;
+
+      pci@c000000 {
+        compatible = "nvidia,tegra264-pcie";
+        reg = <0x00 0x0c000000 0x0 0x00004000>,
+              <0x00 0x0c004000 0x0 0x00001000>,
+              <0x00 0x0c005000 0x0 0x00001000>,
+              <0xd0 0xb0000000 0x0 0x10000000>;
+        reg-names = "xal", "xtl", "xtl-pri", "ecam";
+        #address-cells = <3>;
+        #size-cells = <2>;
+        device_type = "pci";
+        linux,pci-domain = <0x00>;
+        #interrupt-cells = <0x1>;
+
+        interrupt-map-mask = <0x0 0x0 0x0 0x7>;
+        interrupt-map = <0x0 0x0 0x0 0x1 &gic 0x0 0x0 0x0 155 4>,
+                        <0x0 0x0 0x0 0x2 &gic 0x0 0x0 0x0 156 4>,
+                        <0x0 0x0 0x0 0x3 &gic 0x0 0x0 0x0 157 4>,
+                        <0x0 0x0 0x0 0x4 &gic 0x0 0x0 0x0 158 4>;
+
+        iommu-map = <0x0 &smmu2 0x10000 0x10000>;
+        msi-map = <0x0 &its 0x210000 0x10000>;
+        dma-coherent;
+
+        ranges = <0x81000000 0x00 0x84000000 0xd0 0x84000000 0x00 0x00200000>,
+                 <0x82000000 0x00 0x20000000 0x00 0x20000000 0x00 0x08000000>,
+                 <0xc3000000 0xd0 0xc0000000 0xd0 0xc0000000 0x07 0xc0000000>;
+        bus-range = <0x0 0xff>;
+
+        nvidia,bpmp = <&bpmp 0>;
+      };
+    };
+
+  - |
+    bus {
+      #address-cells = <2>;
+      #size-cells = <2>;
+
+      pci@8400000 {
+        compatible = "nvidia,tegra264-pcie";
+        reg = <0x00 0x08400000 0x0 0x00004000>,
+              <0x00 0x08404000 0x0 0x00001000>,
+              <0x00 0x08405000 0x0 0x00001000>,
+              <0x00 0x08410000 0x0 0x00010000>,
+              <0xa8 0xb0000000 0x0 0x10000000>;
+        reg-names = "xal", "xtl", "xtl-pri", "xpl", "ecam";
+        #address-cells = <3>;
+        #size-cells = <2>;
+        device_type = "pci";
+        linux,pci-domain = <0x01>;
+        #interrupt-cells = <1>;
+        interrupt-map-mask = <0x0 0x0 0x0 0x7>;
+        interrupt-map = <0x0 0x0 0x0 0x1 &gic 0x0 0x0 0x0 908 4>,
+                        <0x0 0x0 0x0 0x2 &gic 0x0 0x0 0x0 909 4>,
+                        <0x0 0x0 0x0 0x3 &gic 0x0 0x0 0x0 910 4>,
+                        <0x0 0x0 0x0 0x4 &gic 0x0 0x0 0x0 911 4>;
+
+        iommu-map = <0x0 &smmu1 0x10000 0x10000>;
+        msi-map = <0x0 &its 0x110000 0x10000>;
+        dma-coherent;
+
+        ranges = <0x81000000 0x00 0x84000000 0xa8 0x84000000 0x00 0x00200000>,
+                 <0x82000000 0x00 0x28000000 0x00 0x28000000 0x00 0x08000000>,
+                 <0xc3000000 0xa8 0xc0000000 0xa8 0xc0000000 0x07 0xc0000000>;
+        bus-range = <0x00 0xff>;
+
+        nvidia,bpmp = <&bpmp 1>;
+      };
+    };

-- 
2.52.0


