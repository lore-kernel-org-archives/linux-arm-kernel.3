Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E82D9C44511
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 16 Jul 2026 17:07:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=d8keb7Vf5mcDOWQ8qaY4y+UDfw6ta0RP32gTRI58mxc=; b=MySzksjsYp5+y/nr89VKENt35R
	WUDEK5ypMZs4AGUmHejv72HpAYJpDLGTAzAgL0sNJWz4WttKJQBRAmiOnziByTVLIYxp8TwUyAAwK
	MHgKPR+Tf9jyf4zUc5qBL4Hk1w1e/6mkyvnyqdZI5aIghpPMryx9jRKsClFc/G2pGmpzuUvx5PRb8
	ta9kb+l5/CT8V1karOI9OmWKxyyjYiJlpNbNotseOaVlzbArlG70caeNwHxKIT1KJiH5UG9EghKwV
	y8ndbhPXinCaJteNc/BKvsKwVrt0aQ4FjfxoBNCmFLSjID7cWSMsHqYmz8YNCAwTxs7KLhsGguJ8G
	U6HBHzqw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wkPYh-00000000E0W-04QO;
	Thu, 16 Jul 2026 17:07:39 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wkPYc-00000000Dzm-3vBC
	for linux-arm-kernel@lists.infradead.org;
	Thu, 16 Jul 2026 17:07:34 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 54A1441B48;
	Thu, 16 Jul 2026 17:07:34 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A99731F00A3A;
	Thu, 16 Jul 2026 17:07:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784221654;
	bh=d8keb7Vf5mcDOWQ8qaY4y+UDfw6ta0RP32gTRI58mxc=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=ikMp6gCia4sI8zJ5UktScFnaCBko744+wuW1338qA4GsddBGYwU3s+ViYAODyvPqv
	 vKmeyGGfhr3KcdaxeS+q1siNKOdTUUvZ0SwFaQy4aaUkIUSVeMZlZZ8UwObJ0WIGkK
	 q3eRK3914mQyqNjJ8Y+o8RIWF+pya9aRjmBGrS8NBaGK7/oIK/S4Y3d2YSCYgadAeW
	 JVIEBiyube3Mt0UPtbqBMuXldIg0zfIkQpe78HkIZxy4FgbH1rjzmZYpDMJm9iFEth
	 vFqUyLzCDknDqta4GI3fX2qRCuQbUccrQ8KJgpeVhUPVOOPaRWIHCU2shTaTGXJgrN
	 CQWlSMUPy2O3w==
From: Thierry Reding <thierry.reding@kernel.org>
Date: Thu, 16 Jul 2026 19:07:12 +0200
Subject: [PATCH v8 1/6] dt-bindings: pci: tegra264: Strictly distinguish C0
 from C1-C5
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260716-tegra264-pcie-v8-1-23e51589229b@nvidia.com>
References: <20260716-tegra264-pcie-v8-0-23e51589229b@nvidia.com>
In-Reply-To: <20260716-tegra264-pcie-v8-0-23e51589229b@nvidia.com>
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
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=5710; i=treding@nvidia.com;
 h=from:subject:message-id; bh=gA/SKuXPQwDidcW7rDgkqxu6NGKwUPEXWt8YBaFws+g=;
 b=owEBbQKS/ZANAwAKAd0jrNd/PrOhAcsmYgBqWQ/Q0rpOfRZUKOhMpUqiigHzGrTS/ciHfOMMz
 xnRfTN2ST6JAjMEAAEKAB0WIQSI6sMIAUnM98CNyJ/dI6zXfz6zoQUCalkP0AAKCRDdI6zXfz6z
 oaP1EACRL0w6KEF/FRhEl9JLftSPZaQROJVJLGsiN2ODs8cQxUiwVHZ85J0/8Q9mBySoxT6YjN6
 52P9OoRoQdM+SJrpLU4qHUVRxbCQFGCzzFxSxcJVAUzsab3RY1l4A5MhJzh7WLjadX5evCakEvu
 RJGXD5HO0Za7eiFJuKHptVpvefOqq5E4nODDdM92oqFmPgtnOydMREqM4iqfddIPD1f8gwsNJq6
 38kGxVvYzh8Wit7ri563UsRoKWjVaQelIXKx6sTVat0OsepzsHG5aEXugVRD5hjlOC5dXZo/Tph
 UGdfvMhvoUt4XmlyANvCxx3cMGpMGuFu4PrV7oB/QzIXmm5kC5G+9folMzzy8PauluOqn0Ktw99
 G4d0DgsQdjhB/RYk3k9b7f5WF2VYwLE6vAlDtQ2Xjzqe2VFr7U+kdvU1jVuV2Ert75SgbfB84g2
 Xjmu6IMT/Tj/wRZLflrmq6esdRJbQCYYObX6ac8kuaOAko55C2pcxm0lC6il16zRiYub5MFLlZx
 F8WL6xp3Flgx2sNObzXK9zxEqVx1BOma2oQZKw4KemP2UDRaAxdJ/4N20b9VMGCgqMcw0Jwm7+/
 LE0p448Tt7L3CQYfF/znAYYFZvLYA8E3Ssz5bFhn2eHnutGpZLdycB7WC9Vdy0We+XgI45U4suJ
 6uFSzjL+lV8r6aQ==
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

Reviewed-by: Rob Herring (Arm) <robh@kernel.org>
Signed-off-by: Thierry Reding <treding@nvidia.com>
---
Changes in v7:
- undo changes suggested by Sashiko, should've trust the dedicated tool
  rather than the AI

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
 .../bindings/pci/nvidia,tegra264-pcie.yaml         | 75 ++++++++++++++--------
 1 file changed, 50 insertions(+), 25 deletions(-)

diff --git a/Documentation/devicetree/bindings/pci/nvidia,tegra264-pcie.yaml b/Documentation/devicetree/bindings/pci/nvidia,tegra264-pcie.yaml
index dc4f8725c9f5..acb677d477fb 100644
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
@@ -70,6 +61,40 @@ required:
 
 allOf:
   - $ref: /schemas/pci/pci-host-bridge.yaml#
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
 
 unevaluatedProperties: false
 
@@ -81,11 +106,11 @@ examples:
 
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
@@ -118,12 +143,12 @@ examples:
 
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
2.54.0


