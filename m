Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 12F0BC5CFC1
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 14 Aug 2026 15:39:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ezsJClKarQOh1EExGOGVA03VGzcpj4V0a71l4gZZGmg=; b=t/Y948egvp07xSNeK3nsTKK47J
	+7hNeZQAGf1wPUjCthauhyIONI3n35Fhp9ujxk33U0o1eJDJIgAkogxBS/+pH1SZaKeEzgc9CUHhb
	1xKwVVRDTCIrCP7b4e9gFTPLCgFYZh/EKCjeXPRLrmnJMtzjhxmtnrHLGa+BTg0HZPZ28iB/tlC0x
	5iyuO7/aFksFiDfFz0smwdAFEk24513Avw4FdudvsoU0ZSAOLPClS7SxBRG3kuJpR06FTkbQAdZCb
	Hwx6Xi8BkuqRJQC58qDk3dP9AvERCP8MeKF64BwXlRiNux6Ovo7ShrdLGtpPriknuXGDhqwiW3xZA
	VscbYZOw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wutzz-00000002s9k-3NDC;
	Fri, 14 Aug 2026 15:39:11 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wutzw-00000002s90-3nx9
	for linux-arm-kernel@lists.infradead.org;
	Fri, 14 Aug 2026 15:39:09 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 5D46C601DE;
	Fri, 14 Aug 2026 15:39:08 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 818E91F00A3A;
	Fri, 14 Aug 2026 15:39:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786721948;
	bh=ezsJClKarQOh1EExGOGVA03VGzcpj4V0a71l4gZZGmg=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=PKajM6kcJl3I7japc3WCR33RxLEeNgt410sKbgxFTzBgDw20/QopQzAQ94Ky/TH8G
	 eF6iJsRDukSIzAJxcAMT20CSz6ZeAOA4vNi5ry72WC06xEQ3GxySrMRsZ1BeW61BMp
	 0u07f8AkfPgfFQgrDpWdKQpkm/Hs3arwmZjchaCUGKXPdzmKKi0MzTJ1iJxxc4PAfZ
	 duZzggptslHFtDGbDV7xBSUkjsu2SzTl9IBDKr+/h4iYFjVqR4UvcDsZLM69PdC3on
	 1bFpd278h5Hspyv93ERrFMA7gwIjuarXCcJgK1fHI78SDzsO//2BQyLOI7H1J1oMFf
	 epRPmxJjAAZAw==
From: Thierry Reding <thierry.reding@kernel.org>
Date: Fri, 14 Aug 2026 17:38:55 +0200
Subject: [PATCH v10 1/5] dt-bindings: pci: tegra264: Strictly distinguish
 C0 from C1-C5
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260814-tegra264-pcie-v10-1-05d08c592b05@nvidia.com>
References: <20260814-tegra264-pcie-v10-0-05d08c592b05@nvidia.com>
In-Reply-To: <20260814-tegra264-pcie-v10-0-05d08c592b05@nvidia.com>
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
 h=from:subject:message-id; bh=V/CGU66pjhf9XcbdO9F3rm7FTq62By8U5dKmga+Bzyc=;
 b=owEBbQKS/ZANAwAKAd0jrNd/PrOhAcsmYgBqfzaVGjf4VNRRTS2CBGR3r5fyd6Cd+4AJ3Locy
 npfa4At5xGJAjMEAAEKAB0WIQSI6sMIAUnM98CNyJ/dI6zXfz6zoQUCan82lQAKCRDdI6zXfz6z
 oQyUD/9JflgjroQ7fN6CrDfV+fPua4tXi/Z4dHx0aesO2XkO8rKUGmFPxFJQA3fSqXbA8xn3Q8L
 dMXb+IxVNKV6Y06idWtzi71DK+x2HvX5LX+iD+6AOR9we8Sc0lwWunarxF0s2uoJFf/utxylv3Q
 jCoXQAuLxlblqVEor5mNPnVhZF54Or5It9LNM3eFY3ehWvT7+p/Z4bgFNjEohGAKDR+MO+UxLqy
 XaKBjkg4ol6BVjig0RR0ocUxyUei910e2xv4uGxAZKqLjlHIrbccmrJQempIQ4gJ78Uct4kdwz8
 Xll8/VVIZJhDwYrK44dv4UvZnYJt5qsHVwhymHDOOZkvsoEEcBHqlsmUuXrIkLDNtzMVdLvE5Ac
 ikCwR+cbg/VU2io6jepOabs2iPU/xcBSONjzx34xrJom4EhdBcSi7s/eW7uZ00dTmr/bC9hmsya
 tTB7mxbShNa0EnZqf2I7Yzo3XsitbcR0J1f9qwg9ZoxTLGYMBjTu+0VNLwSmq8NAswtv3LxVEa5
 6N1eeXGongPXO6rnNNZuxJmICEQVRpLgFzafCJ42jEV+D6+miWemAVmiioKwEajFQs0S1qy+hzW
 XM6H26JTbNxmGmlbwzIWSI2giPQkKLId92d89WFJPSQdf+chA7RVkRR0ZkXsnjqXG30p9tQ73rC
 jPnb4Y0AvWe/atw==
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
2.55.0


