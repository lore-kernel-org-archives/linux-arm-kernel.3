Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 75A90CEE328
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 18 Nov 2025 16:03:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=p8rPc1Q7Ab5RULv9WRwCkjVSvPd0FRyIZ5xigzgSXKw=; b=BvVKkK5kOG+Xq+XiaUW7r1xO5a
	HrtO3B2qvgyVVAYvGzH2RFg+MWPTkjbX2mufZOgXc6SrIuO4QDLmyV98aPKg/MgICuU1MkkG+//qg
	01srMBUfwxi8sO/xgjPLP6B3H5t2J6W2nbJvSMUUlYk03H0J9T5mFQQAtLPiZ+nueyRa7qrM7RkNf
	MBNjn0e9c/8m3cXvNO3EIC/WvQ8GxxYtuE8FnH93wSE0S0FsZlUlNb5+eq1cKbTwCyfKiI+5DK7k1
	QnPqn/J9k7K6cL9NaY7xd4ulopuLsgFV6PpjE81zYmwh35NS6BvMct8BNvV8vtSGJZ5Dm3lPcMBvt
	fUdJeiew==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vLOAT-00000000g5n-34zz;
	Tue, 18 Nov 2025 16:02:59 +0000
Received: from mail-wm1-x334.google.com ([2a00:1450:4864:20::334])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vLOAQ-00000000g4c-1dSb
	for linux-arm-kernel@lists.infradead.org;
	Tue, 18 Nov 2025 16:02:55 +0000
Received: by mail-wm1-x334.google.com with SMTP id 5b1f17b1804b1-4779aa4f928so36305275e9.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 18 Nov 2025 08:02:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1763481772; x=1764086572; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=p8rPc1Q7Ab5RULv9WRwCkjVSvPd0FRyIZ5xigzgSXKw=;
        b=Bj1sZ0kLgKA4du5sWJjGB+5bY2AlW7DssYQHv2mNYciG3UztA3KVzN4JMocLCN1WgH
         hs5fBwTWM6ICRvVCqW9ALMdZUI/AUVt2ZR98r+YVJZ3X9iWa4l2wZ1t87rUThAaO9hcf
         8DIQcNnx7ruckfClYPVITEFJlszCHtfUpN37Cw4IUIBI6QuZyDNXe5yKtgGla6XlyKJW
         HS03Bzksyt0bv6abCjS/DiBfmrxhLxBwFin/S1Mfrx2rTEKYPA3R3ZcBlREyu7ZkzwnM
         rnrHUjg+x/xvNPX7KNsso14i7A8tHYI8t9+8nyXuPRW3G4tKxyS4etOBQyc9tO9KebRq
         kGuw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763481772; x=1764086572;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=p8rPc1Q7Ab5RULv9WRwCkjVSvPd0FRyIZ5xigzgSXKw=;
        b=BQuvCuJwLTmNzDPdnA9f1tSwllr9LMTYx/Rn9oPvNZMj/MDkncZ7JamD2BBhoGOQ9I
         gSG7RANVedWIXUXgp7ARYDc2RzJ5iRwMAiLhHu+tuqcAP7rNwCK+yu1pmOhsOQyWtF8X
         agicla7FkSb4nZp+xQhxUpWEoBTvX29XwCj4h+f3mOo9OI7QgaxFd6Ir00Pn3yrUD5y9
         KSxOqyTSiBVUPNiTTgQ0/sr9EqGDeufxRdkr0m5yf0cQlIWuvPbWksCOSYP4XBtyNuiv
         UCNnbaejoyi/aZQdVp0J929f5C1pqrTsjyVlEwe1jWUH1q6oZzxwno6JbDdWUWwSOIxG
         ZCSQ==
X-Forwarded-Encrypted: i=1; AJvYcCXCSuDFGP5W9ms7pEOZLYdn6l74EE7+ZqYKsrJad3JxPeigq4ie+l9v1N7RuqEilaLofAP95yVslS95b21mViwu@lists.infradead.org
X-Gm-Message-State: AOJu0Yx6qIw46n9nWvnBvwKOrv4UnFStJTz97bHuhKl6ew39BT6RCqfH
	UTj0nIpiM56VID7ytdY2Hg5FtvqamzAPV2tO0Y1Vmb1tXTPTC9pra0kqVVZngcXLBmI=
X-Gm-Gg: ASbGncuZkBtHK4pSMBOPi2gSpMEiWwVIxKXOVWgYY/hAzXOI/y52gqvZEtdkdvsTiJr
	b5sCy+ZHhb+6N7wVON/w+cnpFjjrtYK7pdx++KECDlNgIfcbcXCk/STR44BqA4kpSLBHMDBma37
	V+DqoI8qEYCPcIy9vTwb9K7ogstgyxXJHe6JoUhpXuIkcVAcRIpeUqyFpP+F0Mnws+e6tNRVeso
	WugAD2xGtXcaYg5hul2us42HWJZxo5VwNcB3CNMf3Lz4G/iLAO750d2+cUy423lgDuUXafdSxcO
	3hWuB4SST8FtLWbDyJ0qX0SgMpf5WdyV8kh+awu+GmtWn4Ffree06k8lGo8J/kgVK9JhJLDoQvB
	Y06YPjQvQu9ApW1LRjcm84ImJCfoZa/sE/6s3Pbo+v4F0ZGepyAyyxkx0wX1o8/MYBpI45guL4G
	Bqdbt/jn5/lfoWzlI7qZ0289ZOlKCPAg==
X-Google-Smtp-Source: AGHT+IGyFoEL3zw1qZUaHUanPoDmy73Ha3AJCkV4FBXZ7E2g6BEcYZMSw2TPVNtzaY+tvbRM02dGsQ==
X-Received: by 2002:a05:600c:3593:b0:477:557b:6917 with SMTP id 5b1f17b1804b1-4778fe4fdecmr170047065e9.18.1763481772373;
        Tue, 18 Nov 2025 08:02:52 -0800 (PST)
Received: from vingu-cube.. ([2a01:e0a:f:6020:76db:cf5c:2806:ec0b])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4779fc42f25sm171954575e9.6.2025.11.18.08.02.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 18 Nov 2025 08:02:48 -0800 (PST)
From: Vincent Guittot <vincent.guittot@linaro.org>
To: chester62515@gmail.com,
	mbrugger@suse.com,
	ghennadi.procopciuc@oss.nxp.com,
	s32@nxp.com,
	bhelgaas@google.com,
	jingoohan1@gmail.com,
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
	Frank.li@nxp.com,
	linux-arm-kernel@lists.infradead.org,
	linux-pci@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	imx@lists.linux.dev
Cc: cassel@kernel.org
Subject: [PATCH 1/4 v5] dt-bindings: PCI: s32g: Add NXP PCIe controller
Date: Tue, 18 Nov 2025 17:02:35 +0100
Message-ID: <20251118160238.26265-2-vincent.guittot@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251118160238.26265-1-vincent.guittot@linaro.org>
References: <20251118160238.26265-1-vincent.guittot@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251118_080254_456054_79E3EC0F 
X-CRM114-Status: GOOD (  14.27  )
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

Describe the PCIe host controller available on the S32G platforms.

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
 .../bindings/pci/nxp,s32g-pcie.yaml           | 130 ++++++++++++++++++
 1 file changed, 130 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/pci/nxp,s32g-pcie.yaml

diff --git a/Documentation/devicetree/bindings/pci/nxp,s32g-pcie.yaml b/Documentation/devicetree/bindings/pci/nxp,s32g-pcie.yaml
new file mode 100644
index 000000000000..da3106dfcf58
--- /dev/null
+++ b/Documentation/devicetree/bindings/pci/nxp,s32g-pcie.yaml
@@ -0,0 +1,130 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/pci/nxp,s32g-pcie.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: NXP S32G2xxx/S32G3xxx PCIe Root Complex controller
+
+maintainers:
+  - Bogdan Hamciuc <bogdan.hamciuc@nxp.com>
+  - Ionut Vicovan <ionut.vicovan@nxp.com>
+
+description:
+  This PCIe controller is based on the Synopsys DesignWare PCIe IP.
+  The S32G SoC family has two PCIe controllers, which can be configured as
+  either Root Complex or Endpoint.
+
+properties:
+  compatible:
+    oneOf:
+      - enum:
+          - nxp,s32g2-pcie
+      - items:
+          - const: nxp,s32g3-pcie
+          - const: nxp,s32g2-pcie
+
+  reg:
+    maxItems: 6
+
+  reg-names:
+    items:
+      - const: dbi
+      - const: dbi2
+      - const: atu
+      - const: dma
+      - const: ctrl
+      - const: config
+
+  interrupts:
+    minItems: 1
+    maxItems: 2
+
+  interrupt-names:
+    items:
+      - const: msi
+      - const: dma
+    minItems: 1
+
+  pcie@0:
+    description:
+      Describe the S32G Root Port.
+    type: object
+    $ref: /schemas/pci/pci-pci-bridge.yaml#
+
+    properties:
+      reg:
+        maxItems: 1
+
+      phys:
+        maxItems: 1
+
+    required:
+      - reg
+      - phys
+
+    unevaluatedProperties: false
+
+required:
+  - compatible
+  - reg
+  - reg-names
+  - interrupts
+  - interrupt-names
+  - ranges
+  - pcie@0
+
+allOf:
+  - $ref: /schemas/pci/snps,dw-pcie.yaml#
+
+unevaluatedProperties: false
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
+        pcie@40400000 {
+            compatible = "nxp,s32g3-pcie", "nxp,s32g2-pcie";
+            reg = <0x00 0x40400000 0x0 0x00001000>,   /* dbi registers */
+                  <0x00 0x40420000 0x0 0x00001000>,   /* dbi2 registers */
+                  <0x00 0x40460000 0x0 0x00001000>,   /* atu registers */
+                  <0x00 0x40470000 0x0 0x00001000>,   /* dma registers */
+                  <0x00 0x40481000 0x0 0x000000f8>,   /* ctrl registers */
+                  <0x5f 0xffffe000 0x0 0x00002000>;   /* config space */
+            reg-names = "dbi", "dbi2", "atu", "dma", "ctrl", "config";
+            dma-coherent;
+            #address-cells = <3>;
+            #size-cells = <2>;
+            device_type = "pci";
+            ranges =
+                     <0x81000000 0x0 0x00000000 0x5f 0xfffe0000 0x0 0x00010000>,
+                     <0x82000000 0x0 0x00000000 0x58 0x00000000 0x0 0x80000000>,
+                     <0x82000000 0x1 0x00000000 0x59 0x00000000 0x6 0xfffe0000>;
+
+            bus-range = <0x0 0xff>;
+            interrupts = <GIC_SPI 125 IRQ_TYPE_LEVEL_HIGH>,
+                         <GIC_SPI 123 IRQ_TYPE_LEVEL_HIGH>;
+            interrupt-names = "msi", "dma";
+            #interrupt-cells = <1>;
+            interrupt-map-mask = <0 0 0 0x7>;
+            interrupt-map = <0 0 0 1 &gic 0 0 GIC_SPI 128 IRQ_TYPE_LEVEL_HIGH>,
+                            <0 0 0 2 &gic 0 0 GIC_SPI 129 IRQ_TYPE_LEVEL_HIGH>,
+                            <0 0 0 3 &gic 0 0 GIC_SPI 130 IRQ_TYPE_LEVEL_HIGH>,
+                            <0 0 0 4 &gic 0 0 GIC_SPI 131 IRQ_TYPE_LEVEL_HIGH>;
+
+            pcie@0 {
+                reg = <0x0 0x0 0x0 0x0 0x0>;
+                #address-cells = <3>;
+                #size-cells = <2>;
+                ranges;
+
+                device_type = "pci";
+                phys = <&serdes0 PHY_TYPE_PCIE 0 0>;
+            };
+        };
+    };
-- 
2.43.0


