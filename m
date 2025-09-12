Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 58AFDCAC582
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 12 Sep 2025 14:14:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:To:From:Reply-To:
	Cc:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=rQyCKb+9uJp7SOdagD6pw2vnDQu7jCiCKfd/I4XXgVA=; b=KM2jveTdTwhyOmJnzX8nuHBGaA
	+4NOI3Eqk/m608G0xVIBJC9MWXj/PVfAdRCp9iE2dNnlExaTMg/to6+xLrPWLY5jdRIJ+M3WXnCrz
	8lC2qX3M614aa/703btIRr2RS0tscvj3daEIo/Etl9fW6uF2XqGXk+u5ffOLvRO0NPBCtALzIIaRZ
	DwH7HUXI6fw23gh8rpHpSa+YPOlWQL1E7/DVI5YGzvZRqL6zWcrCNf+BBhznF26JM939/XsXBp9jn
	wVhmN82X6iHdl+psXuM3bs4EaCQaHMuS7lZcuovWHQt2gwZuRlphu/kGcOaJNCXs9yEhdLxK1pwg2
	D7EKoVsg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ux4Y2-00000009msP-1DmT;
	Fri, 12 Sep 2025 14:14:46 +0000
Received: from mail-wm1-x32d.google.com ([2a00:1450:4864:20::32d])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ux4Xw-00000009mod-3mQD
	for linux-arm-kernel@lists.infradead.org;
	Fri, 12 Sep 2025 14:14:42 +0000
Received: by mail-wm1-x32d.google.com with SMTP id 5b1f17b1804b1-45df7ca2955so9778545e9.3
        for <linux-arm-kernel@lists.infradead.org>; Fri, 12 Sep 2025 07:14:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1757686479; x=1758291279; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=rQyCKb+9uJp7SOdagD6pw2vnDQu7jCiCKfd/I4XXgVA=;
        b=ixdqNQPGh28Cb4T9GDIleLBGXtiwAzZHtUq0Gssmk0FYw0ZNhuWTvlT6iSs7+VM3eM
         avLCdZgs17C3TQUAmM/eeEA4UvESuWfrLWpPYTP4F14aiHYh3pIb9kkvIOhSloRULEB0
         zqDRBZeUpuLirGm+p+3OUDLRVuxU6ZQyBL1kkGViRsXF8o/+E7bxlQXN6zYSG0HKMQf/
         mOmozuVwNo4ji3B+7m30v+cD0f4CcY4nk7wg6kdnwtZmLu1Je+9NznS0UzGXsxYivFl8
         X5o/QeIU5JPi95T5u0w64TIQ/9XgsmJ+301osqRove+Yn19LMTiDH0x7zJ5kv4ckimUx
         MJ0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757686479; x=1758291279;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=rQyCKb+9uJp7SOdagD6pw2vnDQu7jCiCKfd/I4XXgVA=;
        b=Ea4ktLfGoZ6CcxhC/fzG2P+ZlaQkid0zNXnL9UFjtcuxutZJ5sM8K7XM8V4I0pj2dV
         GNeLjtFXYxiyXjuNS24cWC6Yxg2EhkznPd0bl9j2ySHhlb+yT/BkulVFSei89eG65Tox
         f761XknVZHPz7Fpk+2YJmoo3y8n/Di6hFxItD2kNeN2+34zUJETf14yXmWV8WmgPydGn
         4XOESk+44LIzJvnywuRe/pkcMk2scXi/XQKVQEbUDh0wcFVmgVJ78TARPpllSSV39/cf
         eelY4ZhpwL6PzQbMIXC28ST+Eh3cLoDUifSCemPcGiwxREHdXkiKg90JSZ/qUUdesCkx
         Zscw==
X-Forwarded-Encrypted: i=1; AJvYcCV3OH5zuGg1U2HivXOONmPS22ZPAbhGkhN8g42UaGrg/plRmw+5Tm21879cPnZXaV9v6SOqJBCBhSZUGGDFe29I@lists.infradead.org
X-Gm-Message-State: AOJu0YxD+jSl812Al3x9EC2OiOL5SlalTon5rDKYsboQ3Fv7y8gwi2zT
	+O68lYxx/iOeZac5VKw5pMWLm/wUcGSw/MHRp6sMH56dc/Cf8kU3RexVwvvJcYRBdMs=
X-Gm-Gg: ASbGnctJS1SO0xW93bvsJNij4RtG4a/PeDoT3QbsTpl62eJGL9T3pw0FICDBsMzzp0B
	4FEiVcqtd2irJW1+a+LtBYmWEK57XfuaQydRw4Qd7bbMrl4p5gYiaba9nLWaO13ICETSLaDkKSC
	hkfx9PHF7keuEFyUrEX9aSsve+KL4BdnYB0m2yl2lpdt+5AbIw5WbUbnMmKE9vn5uLoYpv1F1Bt
	J80z18Uk39j/qUIsVaegQygrC/My/zmfkmBEf1qWG9TTRk7vq4nTwuQ8rXI/FbXmczWq2fqXvik
	MKhEZa5TFVPMr95uXyJVi0cvxZsVu7X9GmXxF/+9KEctQf6hVJtXN4bxYva0svC+USI0T4mBnBk
	Z6tj7fivpO0Y2hdqQUko3S0mYbf+HoS5wcmeWrKIB7w==
X-Google-Smtp-Source: AGHT+IHr9QNx6nq0CgD6or/rsKobvrFcl0bL9J7mn1ygpYIXLnS8oK1XThgJ5+3dtK7jLpCenoLvwQ==
X-Received: by 2002:a05:6000:2584:b0:3e7:5f26:f1d7 with SMTP id ffacd0b85a97d-3e76578976cmr3370545f8f.12.1757686478881;
        Fri, 12 Sep 2025 07:14:38 -0700 (PDT)
Received: from vingu-cube.. ([2a01:e0a:f:6020:40ce:250c:1a13:d1ba])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3e7607cd415sm6680739f8f.30.2025.09.12.07.14.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 12 Sep 2025 07:14:38 -0700 (PDT)
From: Vincent Guittot <vincent.guittot@linaro.org>
To: chester62515@gmail.com,
	mbrugger@suse.com,
	ghennadi.procopciuc@oss.nxp.com,
	s32@nxp.com,
	lpieralisi@kernel.org,
	kwilczynski@kernel.org,
	mani@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	Ionut.Vicovan@nxp.com,
	larisa.grigore@nxp.com,
	Ghennadi.Procopciuc@nxp.com,
	ciprianmarian.costea@nxp.com,
	bogdan.hamciuc@nxp.com,
	linux-arm-kernel@lists.infradead.org,
	linux-pci@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 1/4] dt-bindings: pcie: Add the NXP PCIe controller
Date: Fri, 12 Sep 2025 16:14:33 +0200
Message-ID: <20250912141436.2347852-2-vincent.guittot@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250912141436.2347852-1-vincent.guittot@linaro.org>
References: <20250912141436.2347852-1-vincent.guittot@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250912_071440_978848_8316762F 
X-CRM114-Status: GOOD (  20.13  )
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

Describe the PCIe controller available on the S32G platforms.

Co-developed-by: Ionut Vicovan <Ionut.Vicovan@nxp.com>
Signed-off-by: Ionut Vicovan <Ionut.Vicovan@nxp.com>
Co-developed-by: Bogdan-Gabriel Roman <bogdan-gabriel.roman@nxp.com>
Signed-off-by: Bogdan-Gabriel Roman <bogdan-gabriel.roman@nxp.com>
Co-developed-by: Larisa Grigore <larisa.grigore@nxp.com>
Signed-off-by: Larisa Grigore <larisa.grigore@nxp.com>
Co-developed-by: Ghennadi Procopciuc <Ghennadi.Procopciuc@nxp.com>
Signed-off-by: Ghennadi Procopciuc <Ghennadi.Procopciuc@nxp.com>
Co-developed-by: Ciprian Marian Costea <ciprianmarian.costea@nxp.com>
Signed-off-by: Ciprian Marian Costea <ciprianmarian.costea@nxp.com>
Co-developed-by: Bogdan Hamciuc <bogdan.hamciuc@nxp.com>
Signed-off-by: Bogdan Hamciuc <bogdan.hamciuc@nxp.com>
Signed-off-by: Vincent Guittot <vincent.guittot@linaro.org>
---
 .../devicetree/bindings/pci/nxp,s32-pcie.yaml | 169 ++++++++++++++++++
 1 file changed, 169 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/pci/nxp,s32-pcie.yaml

diff --git a/Documentation/devicetree/bindings/pci/nxp,s32-pcie.yaml b/Documentation/devicetree/bindings/pci/nxp,s32-pcie.yaml
new file mode 100644
index 000000000000..287596d7162d
--- /dev/null
+++ b/Documentation/devicetree/bindings/pci/nxp,s32-pcie.yaml
@@ -0,0 +1,169 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/pci/nxp,s32-pcie.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: NXP S32G2xx/S32G3xx PCIe controller
+
+maintainers:
+  - Bogdan Hamciuc <bogdan.hamciuc@nxp.com>
+  - Ionut Vicovan <ionut.vicovan@nxp.com>
+
+description:
+  This PCIe controller is based on the Synopsys DesignWare PCIe IP.
+  The S32G SoC family has two PCIe controllers, which can be configured as
+  either Root Complex or End Point.
+
+properties:
+  compatible:
+    oneOf:
+      - enum:
+          - nxp,s32g2-pcie     # S32G2 SoCs RC mode
+      - items:
+          - const: nxp,s32g3-pcie
+          - const: nxp,s32g2-pcie
+
+  reg:
+    minItems: 7
+    maxItems: 7
+
+  reg-names:
+    items:
+      - const: dbi
+      - const: dbi2
+      - const: atu
+      - const: dma
+      - const: ctrl
+      - const: config
+      - const: addr_space
+
+  interrupts:
+    minItems: 8
+    maxItems: 8
+
+  interrupt-names:
+    items:
+      - const: link_req_stat
+      - const: dma
+      - const: msi
+      - const: phy_link_down
+      - const: phy_link_up
+      - const: misc
+      - const: pcs
+      - const: tlp_req_no_comp
+
+  msi-parent:
+    description:
+      Use this option to reference the GIC controller node which will
+      handle the MSIs. This property can be used only in Root Complex mode.
+      The msi-parent node must be declared as "msi-controller" and the list of
+      available SPIs that can be used must be declared using "mbi-ranges".
+      If "msi-parent" is not present in the PCIe node, MSIs will be handled
+      by iMSI-RX -Integrated MSI Receiver [AXI Bridge]-, an integrated
+      MSI reception module in the PCIe controller's AXI Bridge which
+      detects and terminates inbound MSI requests (received on the RX wire).
+      These MSIs no longer appear on the AXI bus, instead a hard-wired
+      interrupt is raised, documented as "DSP AXI MSI Interrupt" in the SoC
+      Reference Manual.
+
+  nxp,phy-mode:
+    $ref: /schemas/types.yaml#/definitions/string
+    description: Select PHY mode for PCIe controller
+    enum:
+      - crns  # Common Reference Clock, No Spread Spectrum
+      - crss  # Common Reference Clock, Spread Spectrum
+      - srns  # Separate reference Clock, No Spread Spectrum
+      - sris  # Separate Reference Clock, Independent Spread Spectrum
+
+  max-link-speed:
+    description:
+      The max link speed is normaly Gen3, but can be enforced to a lower value
+      in case of special limitations.
+    maximum: 3
+
+  num-lanes:
+    description:
+      Max bus width (1 or 2); it is the number of physical lanes
+    minimum: 1
+    maximum: 2
+
+allOf:
+  - $ref: /schemas/pci/snps,dw-pcie-common.yaml#
+
+required:
+  - compatible
+  - reg
+  - reg-names
+  - interrupts
+  - interrupt-names
+  - ranges
+  - nxp,phy-mode
+  - num-lanes
+  - phys
+
+additionalProperties: true
+
+examples:
+  - |
+    #include <dt-bindings/interrupt-controller/arm-gic.h>
+    #include <dt-bindings/phy/phy.h>
+
+    bus {
+        #address-cells = <2>;
+        #size-cells = <2>;
+
+        pcie0: pcie@40400000 {
+            compatible = "nxp,s32g3-pcie",
+                         "nxp,s32g2-pcie";
+            dma-coherent;
+            reg = <0x00 0x40400000 0x0 0x00001000>,   /* dbi registers */
+                  <0x00 0x40420000 0x0 0x00001000>,   /* dbi2 registers */
+                  <0x00 0x40460000 0x0 0x00001000>,   /* atu registers */
+                  <0x00 0x40470000 0x0 0x00001000>,   /* dma registers */
+                  <0x00 0x40481000 0x0 0x000000f8>,   /* ctrl registers */
+                  /* RC configuration space, 4KB each for cfg0 and cfg1
+                   * at the end of the outbound memory map
+                   */
+                  <0x5f 0xffffe000 0x0 0x00002000>,
+                  <0x58 0x00000000 0x0 0x40000000>; /* 1GB EP addr space */
+                  reg-names = "dbi", "dbi2", "atu", "dma", "ctrl",
+                              "config", "addr_space";
+                  #address-cells = <3>;
+                  #size-cells = <2>;
+                  device_type = "pci";
+                  ranges =
+                  /* downstream I/O, 64KB and aligned naturally just
+                   * before the config space to minimize fragmentation
+                   */
+                  <0x81000000 0x0 0x00000000 0x5f 0xfffe0000 0x0 0x00010000>,
+                  /* non-prefetchable memory, with best case size and
+                  * alignment
+                   */
+                  <0x82000000 0x0 0x00000000 0x58 0x00000000 0x7 0xfffe0000>;
+
+                  nxp,phy-mode = "crns";
+                  bus-range = <0x0 0xff>;
+                  interrupts =  <GIC_SPI 124 IRQ_TYPE_LEVEL_HIGH>,
+                                <GIC_SPI 123 IRQ_TYPE_LEVEL_HIGH>,
+                                <GIC_SPI 125 IRQ_TYPE_LEVEL_HIGH>,
+                                <GIC_SPI 126 IRQ_TYPE_LEVEL_HIGH>,
+                                <GIC_SPI 127 IRQ_TYPE_LEVEL_HIGH>,
+                                <GIC_SPI 132 IRQ_TYPE_LEVEL_HIGH>,
+                                <GIC_SPI 133 IRQ_TYPE_LEVEL_HIGH>,
+                                <GIC_SPI 134 IRQ_TYPE_LEVEL_HIGH>;
+                  interrupt-names = "link_req_stat", "dma", "msi",
+                                    "phy_link_down", "phy_link_up", "misc",
+                                    "pcs", "tlp_req_no_comp";
+                  #interrupt-cells = <1>;
+                  interrupt-map-mask = <0 0 0 0x7>;
+                  interrupt-map = <0 0 0 1 &gic 0 0 0 128 4>,
+                                  <0 0 0 2 &gic 0 0 0 129 4>,
+                                  <0 0 0 3 &gic 0 0 0 130 4>,
+                                  <0 0 0 4 &gic 0 0 0 131 4>;
+                  msi-parent = <&gic>;
+
+                  num-lanes = <2>;
+                  phys = <&serdes0 PHY_TYPE_PCIE 0 0>;
+        };
+    };
-- 
2.43.0


