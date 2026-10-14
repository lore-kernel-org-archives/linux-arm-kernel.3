Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F211CCC6B24
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 14 Oct 2026 07:24:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=bGflw6Hieq74yfbfa4F0lEdKuK34IyaMLqXOMrFMFTk=; b=tdPnp6bg0W6r8WnRq2pSW+xtV5
	t7YOV5kyL1g2oMYolq03hEZ4TtoLdAGViBMsKMW58ToWaFAKjkoXUMdhktdlGv3NERJktrFNGE6gS
	tP/chnvGcBq0BgzSTT759DT4f4cAwZT2Q5wwFWnGAIKzZqOu3kSEpHOYqLL4Q6MltG4EpeKKnVNTg
	iSCCyDhcVz1a9dG8I/HBnC79ugEiZWaRMhDU1neBOGpUKgwudQzd9RsnvFP+5RFxzxhQjUTXdD4it
	uJe0O14+MOAZZfNLZxHxSfjUe6STNkpnsPL6FhRrSSUKsPZ+ZttJbK9v+HqC+CbL4YOKnYsGEFShF
	bSE1MTQg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xGtLO-0000000Ejzc-2tOP;
	Wed, 14 Oct 2026 07:24:10 +0000
Received: from mail-wr1-x429.google.com ([2a00:1450:4864:20::429])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xGtKT-0000000EjLs-0QDk
	for linux-arm-kernel@lists.infradead.org;
	Wed, 14 Oct 2026 07:23:14 +0000
Received: by mail-wr1-x429.google.com with SMTP id ffacd0b85a97d-48b060ec084so2417579f8f.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 14 Oct 2026 00:23:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791962591; x=1792567391; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=bGflw6Hieq74yfbfa4F0lEdKuK34IyaMLqXOMrFMFTk=;
        b=WPtDPrRLLbU7BuvAJOAv6JqlPPS3KUSVONI+kN7EeI4xmRwcWAADS/5gfGWmPtA134
         HJutreXzryP2sLzhdnD2vU4MtNirOgCNkf8nEN5VR7jdCG8cYdMLhugjuJOh5iXBEFBV
         Dtxd4fKZWEOSMYvDnK2wIwR4bdO0jQfDwJPfd8f6gJ+QSwCst6GBPRAjxKBtB3c0hfpI
         mTJnEemeb17AR7Q51hMQZgvakQ6c32PwRZ5i78JbWqconMbwZDverkOKvXnqUUFq8Y24
         q3Pb7kOzKP92JFIWXLMVfSwr3IDMcygDCRuedD/yaVixQ2qf2A0w+4xCWfI5AMLF+FS3
         lkxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791962591; x=1792567391;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=bGflw6Hieq74yfbfa4F0lEdKuK34IyaMLqXOMrFMFTk=;
        b=a5uBOYK6DhbDw4RthoI+2CTtof8PpMZYH3SGnTNuAcw84LI3Hma5G63tVIYV6nD31A
         j+d8t3kUuIHTs88aqgbyozwsAKpY6Q3tyRY4VnBKtrjnDRUnUC+esXqjvRZXd61slt6P
         BVt0gNiUHEMLjrgBx+CGUu0s7azm2MlA73kUYnEcSBQuQr9+y41756e7K16x/4FjaRiu
         lI7hZPVV/7YNWVx3OD09Y68iiK5fV1kGzZNrwCgOuJXPaYeTocFohZxMyJ0u5iA2Vb6f
         Po6c+kJxTdL6h0wBxqUqQE8mkBtenLyKileQCW5QZkrb4NGvP1nqtRsr/l7FV7IRD6CA
         JVpg==
X-Gm-Message-State: AFq9FYKY3P1Z9XButmwvpFTDYJqNERwfpXoC1T6x7IjBii18BehGVMlG
	BgJXobLPGjIEHi9qFoRkz1YqeAqb6m3P2qAmEmTpR/lfzprimAcnJpufLPVZo2DnWvXAOw==
X-Gm-Gg: AYBFou2r6+tB3Z2tsvFWp6WIH6ZrftG7wrXIVoS7nPGSJA+SXFjMpqMB8DbQu14NBo/
	8qwja9i314kQrYHir84KWbHSjLyp8DBWX2PDePD8iF5XgxlxQYApa342mR3rUX67w5Y1+qS1Hrp
	Gf49ZwMzCVOx/4kbr1YH0vbsdQvSfkgUxwlfe0/71FLrnox1anSisDT2x35jC0sF7vh+5/mC0bf
	T5JV3Tky+g1kotXlv2+Mb82zyGPRHBEs6os9YyRy83lfaEomt8QE3FwEV/y1dcLU6GME5HkuWFp
	1puRRNVgE3QuTYGwePrs6YWxQ2lSbT7eGKK8bcRAMd1i6xOQGpQx8MHlRbINKwS4GXM8ARz0S/A
	f0vq3ACpLe+p1+wLx340HMC8iJn1lNyHeIIHTEK8M6m1ZFJ0qxMz4wI+08h/+1cBHIkqh/r95jP
	8nETS8uiIg0DC8zkI/zrBBIvAszMo+pBdU25r2MQfYzdV3XYr9yV+jnx0slAz6pXIZgwUNVoEKX
	yPHY9AM05tQIGbRh23IlwbQH8O9yALIESgokBLRzSCjsPHp2+cVf2p3MStRgiQhFfIFzVpvqWEx
	uhCYcMNt7qD+8el/rKmUBrbOfHI7n+E6KQlPtJ0q9vpiFFdCRK3hESf+KZmW6w==
X-Received: by 2002:a05:6000:401f:b0:48d:eeaf:d2ec with SMTP id ffacd0b85a97d-48deeafd35amr380402f8f.49.1791962591088;
        Wed, 14 Oct 2026 00:23:11 -0700 (PDT)
Received: from navid-pc ([2a01:4b00:a856:6220::a11])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48de3f7f8b8sm8500933f8f.35.2026.10.14.00.23.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Oct 2026 00:23:10 -0700 (PDT)
From: Navid Ghahremani <ghahramani.navid@gmail.com>
To: linux-arm-kernel@lists.infradead.org
Cc: arnd@arndb.de,
	stefandoesinger@gmail.com,
	krzk@kernel.org,
	Navid Ghahremani <ghahramani.navid@gmail.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	netdev@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 17/24] dt-bindings: net: Add ZTE ZX279128S Ethernet switch
Date: Wed, 14 Oct 2026 08:20:57 +0100
Message-ID: <20261014072109.1759502-18-ghahramani.navid@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261014072109.1759502-1-ghahramani.navid@gmail.com>
References: <20261014072109.1759502-1-ghahramani.navid@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261014_002313_168777_2E51A43E 
X-CRM114-Status: GOOD (  14.34  )
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

Describe the switch, receive interrupt and per-port PHY modes and MAC
addresses.

Signed-off-by: Navid Ghahremani <ghahramani.navid@gmail.com>
---
 .../bindings/net/zte,zx279128s-gmac.yaml      | 125 ++++++++++++++++++
 1 file changed, 125 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/net/zte,zx279128s-gmac.yaml

diff --git a/Documentation/devicetree/bindings/net/zte,zx279128s-gmac.yaml b/Documentation/devicetree/bindings/net/zte,zx279128s-gmac.yaml
new file mode 100644
index 0000000000..fcbdbafa76
--- /dev/null
+++ b/Documentation/devicetree/bindings/net/zte,zx279128s-gmac.yaml
@@ -0,0 +1,125 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/net/zte,zx279128s-gmac.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: ZTE zx279128s Ethernet switch
+
+maintainers:
+  - Navid Ghahremani <ghahramani.navid@gmail.com>
+
+description:
+  The ZTE zx279128s has a five-port gigabit Ethernet switch with a traffic
+  manager, a buffer manager and a DMA engine that connects it to the CPU.
+  Each port is described by a child node of ethernet-ports and becomes its
+  own network interface, with the MAC address given in that node.
+
+properties:
+  compatible:
+    const: zte,zx279128s-gmac
+
+  reg:
+    maxItems: 1
+
+  interrupts:
+    maxItems: 1
+    description: The traffic manager's interrupt, which signals frames
+      received for the CPU.
+
+  ethernet-ports:
+    type: object
+    additionalProperties: false
+
+    properties:
+      '#address-cells':
+        const: 1
+      '#size-cells':
+        const: 0
+
+    patternProperties:
+      "^port@[0-4]$":
+        type: object
+        $ref: /schemas/net/ethernet-controller.yaml#
+        unevaluatedProperties: false
+
+        properties:
+          reg:
+            description: Switch port number
+            maximum: 4
+
+          label: true
+
+          phy-handle: true
+
+          phy-mode:
+            description: internal for the SoC's own PHYs of ports 0-3, gmii
+              for an external PHY.
+            enum: [gmii, internal]
+
+        required:
+          - reg
+          - phy-handle
+          - phy-mode
+
+    required:
+      - '#address-cells'
+      - '#size-cells'
+
+required:
+  - compatible
+  - reg
+  - interrupts
+  - ethernet-ports
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/interrupt-controller/arm-gic.h>
+
+    mdio {
+        #address-cells = <1>;
+        #size-cells = <0>;
+
+        phy8: ethernet-phy@8 {
+            reg = <8>;
+        };
+
+        phy10: ethernet-phy@a {
+            reg = <10>;
+        };
+    };
+
+    macaddr: nvmem {
+        #nvmem-cell-cells = <1>;
+    };
+
+    ethernet@92000000 {
+        compatible = "zte,zx279128s-gmac";
+        reg = <0x92000000 0x400000>;
+        interrupts = <GIC_SPI 36 IRQ_TYPE_LEVEL_HIGH>;
+
+        ethernet-ports {
+            #address-cells = <1>;
+            #size-cells = <0>;
+
+            port@0 {
+                reg = <0>;
+                label = "lan1";
+                phy-handle = <&phy10>;
+                phy-mode = "internal";
+                nvmem-cells = <&macaddr 0>;
+                nvmem-cell-names = "mac-address";
+            };
+
+            port@4 {
+                reg = <4>;
+                label = "wan";
+                phy-handle = <&phy8>;
+                phy-mode = "gmii";
+                nvmem-cells = <&macaddr 1>;
+                nvmem-cell-names = "mac-address";
+            };
+        };
+    };
-- 
2.55.0


