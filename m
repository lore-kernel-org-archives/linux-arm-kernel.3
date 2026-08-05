Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5C301C55ABA
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  5 Aug 2026 11:57:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=VQuquWybIJt5NPvoYpIJOEYlI5UicxGSp3uv0yTZvu4=; b=JZdoqSKplUlJgf5LCW/tIprWck
	5XOTaCTvntmmvt0aPZtL6RrGfZ5n/ElWvilWky6hUhU9zkUcQSpk+MD6VMybLo1D38OHgq3OkFPVp
	paRnqoqFj97dS0MtxLNP2b8qzxXeZ5eI8EK239iTYR3uuA5qSLul7022zuEqZwaCfiBpo9K4jo1VE
	vW2J4RW3T1fDqLYhMI7YxB2s2O/pPq8Z7XZRbO4ll0U8FHzr55kJph9vaiOlIHtprM0Sj3ufrHWCG
	KfdYy2ND6uyrVRoRsqw2Sryr+e6kc9wOxGFgadJCQxqOAXAJtQlLN8qp9805NMLFbHLN7KemuYrT3
	nirkR4uw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wraFn-00000003qBK-1QqT;
	Wed, 05 Aug 2026 11:57:47 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wraFm-00000003qAp-0Doi
	for linux-arm-kernel@lists.infradead.org;
	Wed, 05 Aug 2026 11:57:46 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 7E76E60AAE;
	Wed,  5 Aug 2026 11:57:45 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C4F6C1F00A3A;
	Wed,  5 Aug 2026 11:57:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785931065;
	bh=VQuquWybIJt5NPvoYpIJOEYlI5UicxGSp3uv0yTZvu4=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=SeJydkvUAjoePMre3ouyJYH/jHyr64G0xW12l/yZvbWrjzfY0SMuRg4MN30HEqShT
	 JRSsaNQZzIUgqygwD5tqp2WH/23n64IwIeSqkTgFLA3IOlhBLNvLokQdaFUYreeLPb
	 gDQhMe5V7u1QgWYNh/wgdRpuRR7h4TaFjLXIrpKJAeUGNlhIpMmc/lWafZ9MKf/96J
	 BngmkotQlgnBcuV0bR4Ybdl9q31N9Onjs3FdBLu9yqucRxHxdg2Eb0Dlwqzzu6YBqc
	 J6fq32VjzeMALDSBjvAZFTvy3eJzB4W9ryhe6O0Au4GahcBfKwFwPVd4glzDX7QZsh
	 hYCXxP6n7TWjg==
From: Thierry Reding <thierry.reding@kernel.org>
Date: Wed, 05 Aug 2026 13:57:21 +0200
Subject: [PATCH v9 2/5] dt-bindings: pci: tegra264: Switch to PCIe root
 port bindings
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260805-tegra264-pcie-v9-2-fa2ed7350ae1@nvidia.com>
References: <20260805-tegra264-pcie-v9-0-fa2ed7350ae1@nvidia.com>
In-Reply-To: <20260805-tegra264-pcie-v9-0-fa2ed7350ae1@nvidia.com>
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
 h=from:subject:message-id; bh=y0cAIDjIfEssDyJ41GlxlCD4kHVl3Su/tkVt6PDr3jQ=;
 b=owEBbQKS/ZANAwAKAd0jrNd/PrOhAcsmYgBqcyUxTZ9hSKbdc1UbF/l93dmE/oGmPkOlFqz77
 N5ExqkfqyCJAjMEAAEKAB0WIQSI6sMIAUnM98CNyJ/dI6zXfz6zoQUCanMlMQAKCRDdI6zXfz6z
 oZwfD/kB73p5Laln1O6TV38jtHT9Rq9H6/PhIVZhGWd8fhtczMzFu3SYGC9o4nSPb9+iM3/u0h0
 ZXG82kdHMR5h3SZbcaiR6L2ZOtJjJu10JikTfXliVtoQvlZoDQe2njabXl0imIEm0eIxdudhI0G
 eckgteHuIpcpjVoi8EmcUNnHjHEwQZaRv9ZT+N/U/DNa8A5eC3npkIk8O7TjGoT5VL4HM/HJKhz
 xIwBXAqXYos0UKEM4LML9b+iSmw7w90esrVomfmyekpUTBS3fqE4rNERmOXpSGik7+QDc+dBH20
 7Yrecq5JgVx8xu6s+ULJ24FbkFj5wvTcIb5CiK5qMIr+re4yUF5HIQQhHL+VUmXAWkGL6AgRLmc
 FSeyyP1i/2mtfBeVbdNqQN1ZZndJtSqbOT7qhds+Bxv4+Xq4ivpbfsZyuFsn++6/BwXTTQl55b6
 PcMvaZa+6WVOxaO1FrN7QOBI+X6BGRhcs8KNzg1c+rrJO2aY8TLW9Yy04c7S+etR1ermb/wSde0
 CX+Fj5cH3ePFKZUK693YnYwyXIFWO31WrtOOUuP7xhjMCPRLv5vnFiYy5RGD5u0k08b5KOB9xku
 gXcWS9voeEP9FGg66HlNV/uU9K6N2XDMNWZcc3l/Gd1ch2BGOFBP7lWWWrVTybgC3geX2fa4YGb
 6ZbI1ohXUV3uTuw==
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
2.54.0


