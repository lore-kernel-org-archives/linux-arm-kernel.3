Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6E05FC77B73
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 18 Jun 2025 17:01:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=OYV1fpg6UReX2I3Jxu/O9edCNSz0cWdjDgWHxsBJDOk=; b=mrQMOEurj7xPVTpqNIp/8ZSb3Y
	jpYkhH6Kwbjn8XrNUlW1Yr6TZ7g+2h32gnnErHWlyIh5soAieYYN2LCvGwElNtluRkJlpT0XY4lB0
	iwVRJduZnHCELrjHY4w8suUYzVf6XOljKjxMGKIaYzT7+Ordpea3OwT8TnIX1IKsz8zKdSDUZ6h5s
	2bus3dqPBsNR3RiiwLWMfbly9Wb6uEXlPHtCkcmziWi/toL1n4CG8EYOfSzriRvU8diPD4j/GMsZk
	b5F75iKpaF/cFei9KbrknDYIa0wbSjjIxx59RtO/AUqTvrcim8bG0XZntu+OJui01BizyUpuvX9qj
	yWVoci6Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uRwAa-0000000Ana7-3RMI;
	Wed, 18 Jun 2025 17:01:52 +0000
Received: from bali.collaboradmins.com ([148.251.105.195])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uRtTr-0000000AOS3-3IrO;
	Wed, 18 Jun 2025 14:09:37 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1750255774;
	bh=gAf934q3p4ztJVBWu9FZgouVimm2lufXshc7P1S6iuU=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=ppgQl6+nsWC23/4f9LJacUgFTKJNMahegzF7Y5FvVr4c18gPkvgWewEJCbrg6AOpF
	 XTYxF53I4HkHjm9Q0npO84c40U/hEhjN+qa2DyUoZsCG+zw5lfwF6ENWb1VLuwtimX
	 3GMBVMfLcYE/C+rhKPqV1KlvbnCUnqPaNLtIWezhI0lVOGvd6V+Lzh8UPmzdLk54gT
	 9pd3si11U+l8fb2v84mg14Fw8OF62U57yRz+jGsk+HuxecjFY52N2Dh+SEeoyCGfT5
	 Q9NCBYCXU2gcRhlDhNth5rYhdWq1Pkwq2Qqljr+2o1Xnn/8gfxYG0x/lVs9HwnzXAv
	 5o1rqJL2YVU+Q==
Received: from benjamin-XPS-13-9310.. (unknown [IPv6:2a01:e0a:120:3210:45c6:994a:f902:5c74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: benjamin.gaignard)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 09FF417E10C7;
	Wed, 18 Jun 2025 16:09:34 +0200 (CEST)
From: Benjamin Gaignard <benjamin.gaignard@collabora.com>
To: joro@8bytes.org,
	will@kernel.org,
	robin.murphy@arm.com,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	heiko@sntech.de,
	nicolas.dufresne@collabora.com,
	jgg@ziepe.ca
Cc: iommu@lists.linux.dev,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	kernel@collabora.com,
	Benjamin Gaignard <benjamin.gaignard@collabora.com>
Subject: [PATCH v2 2/5] dt-bindings: iommu: verisilicon: Add binding for VSI IOMMU
Date: Wed, 18 Jun 2025 16:09:11 +0200
Message-ID: <20250618140923.97693-3-benjamin.gaignard@collabora.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250618140923.97693-1-benjamin.gaignard@collabora.com>
References: <20250618140923.97693-1-benjamin.gaignard@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250618_070935_983917_E09EBA5B 
X-CRM114-Status: GOOD (  12.85  )
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

Add a device tree binding for the Verisilicon (VSI) IOMMU.
This IOMMU sits in front of hardware encoder and decoder
blocks on SoCs using Verisilicon IP, such as the Rockchip RK3588.

Signed-off-by: Benjamin Gaignard <benjamin.gaignard@collabora.com>
---
changes in version 2:
- Add a compatible "rockchip,rk3588-av1-iommu"
- Fix clock-names in binding 
- Remove "vsi_mmu" label in binding example.

 .../bindings/iommu/verisilicon,iommu.yaml     | 72 +++++++++++++++++++
 1 file changed, 72 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/iommu/verisilicon,iommu.yaml

diff --git a/Documentation/devicetree/bindings/iommu/verisilicon,iommu.yaml b/Documentation/devicetree/bindings/iommu/verisilicon,iommu.yaml
new file mode 100644
index 000000000000..9ae4a45d76f4
--- /dev/null
+++ b/Documentation/devicetree/bindings/iommu/verisilicon,iommu.yaml
@@ -0,0 +1,72 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/iommu/verisilicon,iommu.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Verisilicon IOMMU
+
+maintainers:
+  - Benjamin Gaignard <benjamin.gaignard@collabora.com>
+
+description: |+
+  A Versilicon iommu translates io virtual addresses to physical addresses for
+  its associated video decoder.
+
+properties:
+  compatible:
+    oneOf:
+      - enum:
+          - verisilicon,iommu
+          - rockchip,rk3588-av1-iommu
+
+  reg:
+    maxItems: 1
+
+  interrupts:
+    maxItems: 1
+
+  clocks:
+    items:
+      - description: Core clock
+      - description: Interface clock
+
+  clock-names:
+    items:
+      - const: core
+      - const: iface
+
+  "#iommu-cells":
+    const: 0
+
+  power-domains:
+    maxItems: 1
+
+required:
+  - compatible
+  - reg
+  - interrupts
+  - clocks
+  - clock-names
+  - "#iommu-cells"
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/clock/rockchip,rk3588-cru.h>
+    #include <dt-bindings/interrupt-controller/arm-gic.h>
+
+    bus {
+      #address-cells = <2>;
+      #size-cells = <2>;
+
+      iommu@fdca0000 {
+        compatible = "verisilicon,iommu";
+        reg = <0x0 0xfdca0000 0x0 0x600>;
+        interrupts = <GIC_SPI 109 IRQ_TYPE_LEVEL_HIGH 0>;
+        clocks = <&cru ACLK_AV1>, <&cru PCLK_AV1>;
+        clock-names = "core", "iface";
+        #iommu-cells = <0>;
+      };
+    };
-- 
2.43.0


