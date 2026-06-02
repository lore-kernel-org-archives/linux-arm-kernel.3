Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 55005CD6E5D
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  2 Jun 2026 11:34:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=RLfxs01fqKZzYY1ngMrn68+8Jv6wxEviPtfKxnQaO5Y=; b=KMtN500THr1TXUhpl/7QIANGEH
	ReiA2lXWIo1B3eF7gOiWRxj+3TXEkoLGFeMeWykZEPz8dG43jMxW7v4JZeUo7+RIzkEEJUo0gDDHc
	LyrWkbEPLqBBxQLaL68ROhnL9zmGaJ1fBRGEEISbrYyxD+G6dOGgf9hbOOcPFBfFply7SabhRw6G+
	olGHjxpgrBjvjg37X1am4dBK6fP8ZwayYVRRLzzF8/hk4P7WCwPom7SX93NFFiqXwfbj7CRojLPuF
	+ZNFfC2XvjTYavDfpkwiwRjTJr65cQeDcCwYlIwS2WHIkgvaD5oafjJsL0BYMlB3Wrthht8q+LWVO
	p1aAuDtQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wUNNa-0000000CszT-0MNR;
	Tue, 02 Jun 2026 11:33:54 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wUNNZ-0000000Csz0-0y6y
	for linux-arm-kernel@lists.infradead.org;
	Tue, 02 Jun 2026 11:33:53 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 79F2760142;
	Tue,  2 Jun 2026 11:33:52 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A7CAF1F00898;
	Tue,  2 Jun 2026 11:33:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780400032;
	bh=RLfxs01fqKZzYY1ngMrn68+8Jv6wxEviPtfKxnQaO5Y=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=b8Fpy61x/hOy3qij/A5QVYDB4F/lw7SzYFmWjgO617bmxIwFSBU6KakH1cPUwmHt5
	 vYKnWUd0eOmFOmjIA2XlvuxBdYybqFe6TFyI/TkGz880RvFYKQfqSVl7hgVj3ixLrd
	 UY+nlGZZQeibqqnYeqgH+3MVYzC3T599RmgUTO0iI0++3giQn/jTXy00ra9kQ7t0hQ
	 BOID7TAzgONPkMVXVN/N6HbBZ+UBVqzMXpgWpAPMX1pgbFNeH22ktpr4pHY+dWXI8X
	 ++GA5UmEUf9SsKUifTVwV/I1eXxkS0Fa2Ya37Vr4TyHnGXE180z38B8Vlo+DUK2UFu
	 NNtnBwdo7C0MA==
From: Thierry Reding <thierry.reding@kernel.org>
Date: Tue, 02 Jun 2026 13:33:23 +0200
Subject: [PATCH v6 1/4] dt-bindings: pci: Strictly distinguish C0 from
 C1-C5
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260602-tegra264-pcie-v6-1-edbcfa7a78fe@nvidia.com>
References: <20260602-tegra264-pcie-v6-0-edbcfa7a78fe@nvidia.com>
In-Reply-To: <20260602-tegra264-pcie-v6-0-edbcfa7a78fe@nvidia.com>
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
 Michal Simek <michal.simek@amd.com>, Kevin Xie <kevin.xie@starfivetech.com>, 
 Thierry Reding <thierry.reding@kernel.org>, Aksh Garg <a-garg7@ti.com>
Cc: linux-pci@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, Thierry Reding <treding@nvidia.com>
X-Mailer: b4 0.15.1
X-Developer-Signature: v=1; a=openpgp-sha256; l=5651; i=treding@nvidia.com;
 h=from:subject:message-id; bh=HQ73QRmbMw9xf+0TO/GJWDfzCo4ksyEEyLTFp+NJTiA=;
 b=owEBbQKS/ZANAwAKAd0jrNd/PrOhAcsmYgBqHr+alRnFbX4JzLWJh4aEItFMtdZm6QSj2NRbv
 AN+N8S+JY2JAjMEAAEKAB0WIQSI6sMIAUnM98CNyJ/dI6zXfz6zoQUCah6/mgAKCRDdI6zXfz6z
 oVVyEACXeRlOORZ+YQ0nsKIXAUE/v1O4Tys/dFxTQpuS3N+1YLT8hWsXlqVBE6NOq3ROho/tO6z
 Y1fL+F3jZoBLaDw9KzMLkYOQzWobx3DR+Ljka53Qlgtdjss0zsrjTcegzWGLCl7aruXe+Z8hrx0
 WCXmTH5jOwxjhOMXq+BZ4H6TtJR71lUFEpnQa2miQvG8A+NJb/n/9qXwsyZN34A8RinTw6ojz9H
 EQxdFW15CK9H0f3qwaGh2QW04b3oN9idf0RgtWpY1rD4HtOjh85EFtfXjqlFTfjKT3poLW1YixL
 6H8QjXOTXxWZSvm+AX8bqE0TMKgPnkLRWDw5jtabXTieBqpt4jcNbHK+MWJBdUh5MtGm4oMzA06
 Fno/YEBjagNLBE5SOVj0oWllUnE9a+GZe2vvT955Za9kjngloxDKpYSu5FH3yyl8il/V6x6ZqtN
 3oWOjqh0QMnq/ZaZemM/aulU6bzbZxCB3sSiJ8eY1IW7MVGNSY3G+eQvpnVEqSF8Q8CgYDNtSUJ
 J+7P8yrrNNcs70rLgvZWUM18cw6+yPzFhasKUWh8mWNgJ2gYNuYPpQgWT78rdt/QqAlitQxw9yM
 t4n1Qh1ayTrpwhscYzyBjyhiUHqtl4e0gvCoar9YA+iA2aj6GwWf5hJKeG7VWgjlmcxq2oG3kxU
 vKUrqS8qM1M3qdQ==
X-Developer-Key: i=treding@nvidia.com; a=openpgp;
 fpr=88EAC3080149CCF7C08DC89FDD23ACD77F3EB3A1
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

Instead of using the ECAM registers as the first entry, strictly make a
distinction between C0 and C1-C5. This is needed because otherwise the
unit address doesn't match the first "reg" entry. We also cannot change
the ordering of these nodes to follow the ECAM addresses because that
would put them outside of their "control bus" hierarchy since the ECAM
address space is a global one outside of any of the control busses.

Signed-off-by: Thierry Reding <treding@nvidia.com>
---
Changes in v6:
- add maxItems as suggested by Sashiko

Changes in v5:
- rebase on top of v7.1-rc1, make it into a fix

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
 .../bindings/pci/nvidia,tegra264-pcie.yaml         | 79 +++++++++++++++-------
 1 file changed, 54 insertions(+), 25 deletions(-)

diff --git a/Documentation/devicetree/bindings/pci/nvidia,tegra264-pcie.yaml b/Documentation/devicetree/bindings/pci/nvidia,tegra264-pcie.yaml
index dc4f8725c9f5..4e1f219e8695 100644
--- a/Documentation/devicetree/bindings/pci/nvidia,tegra264-pcie.yaml
+++ b/Documentation/devicetree/bindings/pci/nvidia,tegra264-pcie.yaml
@@ -10,32 +10,23 @@ maintainers:
   - Thierry Reding <thierry.reding@gmail.com>
   - Jon Hunter <jonathanh@nvidia.com>
 
+description: |
+  Of the six PCIe controllers found on Tegra264, one (C0) is used for the
+  internal GPU and the other five (C1-C5) are routed to connectors such as
+  PCI or M.2 slots. Therefore the UPHY registers (XPL) exist only for C1
+  through C5, but not for C0.
+
 properties:
   compatible:
     const: nvidia,tegra264-pcie
 
   reg:
-    description: |
-      Of the six PCIe controllers found on Tegra264, one (C0) is used for the
-      internal GPU and the other five (C1-C5) are routed to connectors such as
-      PCI or M.2 slots. Therefore the UPHY registers (XPL) exist only for C1
-      through C5, but not for C0.
     minItems: 4
-    items:
-      - description: ECAM-compatible configuration space
-      - description: application layer registers
-      - description: transaction layer registers
-      - description: privileged transaction layer registers
-      - description: data link/physical layer registers (not available on C0)
+    maxItems: 5
 
   reg-names:
     minItems: 4
-    items:
-      - const: ecam
-      - const: xal
-      - const: xtl
-      - const: xtl-pri
-      - const: xpl
+    maxItems: 5
 
   interrupts:
     minItems: 1
@@ -70,6 +61,44 @@ required:
 
 allOf:
   - $ref: /schemas/pci/pci-host-bridge.yaml#
+  - oneOf:
+      - description: C0 controller (no UPHY)
+        properties:
+          reg:
+            maxItems: 4
+            items:
+              - description: application layer registers
+              - description: transaction layer registers
+              - description: privileged transaction layer registers
+              - description: ECAM compatible configuration space
+
+          reg-names:
+            maxItems: 4
+            items:
+              - const: xal
+              - const: xtl
+              - const: xtl-pri
+              - const: ecam
+
+      - description: C1-C5 controllers (with UPHY)
+        properties:
+          reg:
+            maxItems: 5
+            items:
+              - description: application layer registers
+              - description: transaction layer registers
+              - description: privileged transaction layer registers
+              - description: data link/physical layer registers
+              - description: ECAM compatible configuration space
+
+          reg-names:
+            maxItems: 5
+            items:
+              - const: xal
+              - const: xtl
+              - const: xtl-pri
+              - const: xpl
+              - const: ecam
 
 unevaluatedProperties: false
 
@@ -81,11 +110,11 @@ examples:
 
       pci@c000000 {
         compatible = "nvidia,tegra264-pcie";
-        reg = <0xd0 0xb0000000 0x0 0x10000000>,
-              <0x00 0x0c000000 0x0 0x00004000>,
+        reg = <0x00 0x0c000000 0x0 0x00004000>,
               <0x00 0x0c004000 0x0 0x00001000>,
-              <0x00 0x0c005000 0x0 0x00001000>;
-        reg-names = "ecam", "xal", "xtl", "xtl-pri";
+              <0x00 0x0c005000 0x0 0x00001000>,
+              <0xd0 0xb0000000 0x0 0x10000000>;
+        reg-names = "xal", "xtl", "xtl-pri", "ecam";
         #address-cells = <3>;
         #size-cells = <2>;
         device_type = "pci";
@@ -118,12 +147,12 @@ examples:
 
       pci@8400000 {
         compatible = "nvidia,tegra264-pcie";
-        reg = <0xa8 0xb0000000 0x0 0x10000000>,
-              <0x00 0x08400000 0x0 0x00004000>,
+        reg = <0x00 0x08400000 0x0 0x00004000>,
               <0x00 0x08404000 0x0 0x00001000>,
               <0x00 0x08405000 0x0 0x00001000>,
-              <0x00 0x08410000 0x0 0x00010000>;
-        reg-names = "ecam", "xal", "xtl", "xtl-pri", "xpl";
+              <0x00 0x08410000 0x0 0x00010000>,
+              <0xa8 0xb0000000 0x0 0x10000000>;
+        reg-names = "xal", "xtl", "xtl-pri", "xpl", "ecam";
         #address-cells = <3>;
         #size-cells = <2>;
         device_type = "pci";

-- 
2.52.0


