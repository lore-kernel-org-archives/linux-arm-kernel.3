Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0C75DC5CFCF
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 14 Aug 2026 15:39:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=EPr4wZRyfVeBp/ECZGrk2k/IiWtBziYaIFZZVuqI5SE=; b=YaiwLLOW72s4TlLrIDZcXuRWQF
	BXoKevEoJLAa/YQB3QbHf3RnToAne6t2KcUkvuVdVGsGDR5QSW9Vjo8FHORLYmz6GKLmnS7vhJJih
	DbB/HcSyf9AdisNWu0j5LTYTxGST3FqTdQS1rAvYphnsZj0Fm4mpTLE8xmQ6cK/g1luGblG8IJ+pl
	/94pzt7WcXbyQa6pymZWGfYUGjTsOImBQeOhbW672CcwI8dIi7j9nRzLDXO+z4T+e+rh+OnAccqZV
	QioyjQ2OjWGaXlOWfBR7LdxZlDnSiCOblSc5dzXGm00eqeybEPXvuE2U0TLlPqPIaeSJEMgthjCqa
	gCVEUPXw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wuu03-00000002sAN-3zwb;
	Fri, 14 Aug 2026 15:39:15 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wutzz-00000002s9i-3FLF
	for linux-arm-kernel@lists.infradead.org;
	Fri, 14 Aug 2026 15:39:11 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 3B30360A6C;
	Fri, 14 Aug 2026 15:39:11 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 606351F000E9;
	Fri, 14 Aug 2026 15:39:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786721950;
	bh=EPr4wZRyfVeBp/ECZGrk2k/IiWtBziYaIFZZVuqI5SE=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=HXOp9H8Rxt3iMFkuUnoSHJbphLg+xlUwIKk5m+s6PmeExYwOTDRWvRBV7iUcgOdvF
	 FlVfbEJHEZKRRYL49kW7Gy2MTcofLzRutf6el3FpHdQW7/53UcVSiNDWJWQDgKk7LJ
	 exGQxwpSS/PibjmPfFgLS3ueTYDTs4JdfDWP7Z9aMlhbwNSqwgcFR4c73WNXUdDiD1
	 MdKCGpiXA7BSn1ghsxnDMSSl5621txqPtZaPnH8Z03KxbTHPGrb9FA9E1fUGmQxJL3
	 0N0x36IM6MJ/HP1Fh9gVFWduLQwEy/QRV4nkIs/guNi7h3F+4j8Q0n3vEo3BFbVEhI
	 5bL1DKj4GWaqg==
From: Thierry Reding <thierry.reding@kernel.org>
Date: Fri, 14 Aug 2026 17:38:56 +0200
Subject: [PATCH v10 2/5] dt-bindings: pci: tegra264: Switch to PCIe root
 port bindings
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260814-tegra264-pcie-v10-2-05d08c592b05@nvidia.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=2568; i=treding@nvidia.com;
 h=from:subject:message-id; bh=1BWs+HLmBC1XfIce8W+1QZG1x6oT7cno/PFzg2n+ylw=;
 b=owEBbQKS/ZANAwAKAd0jrNd/PrOhAcsmYgBqfzaVlZvE1dtQtLMoXuQgz5liU0M9u5ehlF94O
 jzwxJ/Q1s6JAjMEAAEKAB0WIQSI6sMIAUnM98CNyJ/dI6zXfz6zoQUCan82lQAKCRDdI6zXfz6z
 oXw1D/90cWOkWJ4qrK+jn+292oA7vclTTC4GmrJC296lsRR8YHCRXi+ykPtv/MnrFNIGcZo7XgI
 OdM9hRQB3xmy0LFREaS5t3Zq3BV/xcRhVw+QDXtDoMOgJJKhB9wyTzl4XiAZbWRjW185uqOBUpU
 wvMxqJTL+3y7ub3Kl9zmjgnFTZIW3QQYi3aKZ18FzEIG4OHjsGyJgBWVZI9/3jTJT5HElMmg0Uc
 WchM2F6EFs75TrPRzHj7Y3YUNPduHeBRW4kPMLQVYLpnkn+dH1+F4zKkLpPJaNW/Zg2nY+l29h1
 LP8OuoLCvNabPRIbtl1W+9B8TJuvgncznGJ4cRgGo+x+tf5t/rNmvVX5hrOuLbTfznlG2yhVxzu
 hoU2eezhcGSYwymyZ9UAkBzwwNI05ET6Sk/xyJE3Z3IpnJYWtUEzhVYVv9Q0P+/SEnsDCDRPYPE
 arKYg4sh1O9Ebu1lZNqK8t7YyES67G22McjdIMNjc6VCtJDM90vHr1knCd7d9ZNQObUrJBFyo1y
 3p+5eTa+1LMdoP8vxabvXFQ3okE9aUFLR4OvLboNS/N4M5wqfLobN9qspQDgffOU0NTO6dhW/Np
 ICdMGvYpvL7737E9nE5OGoMn+BBYjQXXh9OaPgkfGUaNiHY7Nc8Rw3mEcSjECjBJI3kjiDxLfOX
 fjkonTq3KXsHSZQ==
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

Switch to using the PCIe root port bindings in preparation for using the
standard WAKE# handling.

Signed-off-by: Thierry Reding <treding@nvidia.com>
---
 .../bindings/pci/nvidia,tegra264-pcie.yaml         | 40 +++++++++++++++++-----
 1 file changed, 32 insertions(+), 8 deletions(-)

diff --git a/Documentation/devicetree/bindings/pci/nvidia,tegra264-pcie.yaml b/Documentation/devicetree/bindings/pci/nvidia,tegra264-pcie.yaml
index acb677d477fb..f0114defc04e 100644
--- a/Documentation/devicetree/bindings/pci/nvidia,tegra264-pcie.yaml
+++ b/Documentation/devicetree/bindings/pci/nvidia,tegra264-pcie.yaml
@@ -52,12 +52,11 @@ properties:
           - description: PCIe controller ID
             maximum: 5
 
-required:
-  - interrupt-map
-  - interrupt-map-mask
-  - iommu-map
-  - msi-map
-  - nvidia,bpmp
+patternProperties:
+  '^pcie@':
+    type: object
+    $ref: /schemas/pci/pci-pci-bridge.yaml#
+    unevaluatedProperties: false
 
 allOf:
   - $ref: /schemas/pci/pci-host-bridge.yaml#
@@ -96,6 +95,13 @@ allOf:
               - const: xpl
               - const: ecam
 
+required:
+  - interrupt-map
+  - interrupt-map-mask
+  - iommu-map
+  - msi-map
+  - nvidia,bpmp
+
 unevaluatedProperties: false
 
 examples:
@@ -130,9 +136,18 @@ examples:
         ranges = <0x81000000 0x00 0x84000000 0xd0 0x84000000 0x00 0x00200000>,
                  <0x82000000 0x00 0x20000000 0x00 0x20000000 0x00 0x08000000>,
                  <0xc3000000 0xd0 0xc0000000 0xd0 0xc0000000 0x07 0xc0000000>;
-        bus-range = <0x0 0xff>;
 
         nvidia,bpmp = <&bpmp 0>;
+
+        pcie@0 {
+          device_type = "pci";
+          compatible = "pciclass,0604";
+          reg = <0x0 0x0 0x0 0x0 0x0>;
+          bus-range = <0x01 0xff>;
+          #address-cells = <3>;
+          #size-cells = <2>;
+          ranges;
+        };
       };
     };
 
@@ -167,8 +182,17 @@ examples:
         ranges = <0x81000000 0x00 0x84000000 0xa8 0x84000000 0x00 0x00200000>,
                  <0x82000000 0x00 0x28000000 0x00 0x28000000 0x00 0x08000000>,
                  <0xc3000000 0xa8 0xc0000000 0xa8 0xc0000000 0x07 0xc0000000>;
-        bus-range = <0x00 0xff>;
 
         nvidia,bpmp = <&bpmp 1>;
+
+        pcie@0 {
+          device_type = "pci";
+          compatible = "pciclass,0604";
+          reg = <0x0 0x0 0x0 0x0 0x0>;
+          bus-range = <0x01 0xff>;
+          #address-cells = <3>;
+          #size-cells = <2>;
+          ranges;
+        };
       };
     };

-- 
2.55.0


