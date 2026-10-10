Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0E86ACA6017
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 10 Oct 2026 13:01:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=GoroDu6xICaIQCB3Y6XVwmspeLrCWXpr98G9YRTCm5U=; b=1zlPxk5LZ6EXyRhbUYT+EdLw+V
	Ayq1OJ7JXyDGOOFVUKx2dJ+IZL0E1+13f8k9ITMC07ft5NkKqsiiBqqCTIxqKs6D/5+K4F2+mjw/j
	8gsKWuU/YouQN+gS8n4eyVnIwwnPb1GaNT7km7w7oyAmHiAUVu0EEwQajJSLikxKob+L0L91Ob/97
	9fG38u0ugo+nTXi+UzFXBAp5RehUUBkzEvThLGVgDj80UrHNmdBQx6q0yAp+QCe+nca+Jd8mkvsmJ
	Fr1M7jKp719Oap2zjlKdlbTB/k2gxVdDqA4DVTiqr7i9NwZJ+AnR6zD5k4twN4b0227jr9dwOf4V/
	Gf2lFyfw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xFWhd-00000008456-2670;
	Sat, 10 Oct 2026 13:01:29 +0000
Received: from mail-wm1-x32a.google.com ([2a00:1450:4864:20::32a])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xFWgx-000000083Lk-1ird
	for linux-arm-kernel@lists.infradead.org;
	Sat, 10 Oct 2026 13:00:51 +0000
Received: by mail-wm1-x32a.google.com with SMTP id 5b1f17b1804b1-4998b5a63e2so7087765e9.1
        for <linux-arm-kernel@lists.infradead.org>; Sat, 10 Oct 2026 06:00:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791637245; x=1792242045; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=GoroDu6xICaIQCB3Y6XVwmspeLrCWXpr98G9YRTCm5U=;
        b=c8TRM2jja74flv7QgAagr0rvRLuB4HPEI5sFdUHHZyUBQHtXkQRe+Ij0H8LKAFe0bh
         4UrMg6ONR8iBkB0nhSdFATZLqz5l+spO4da86TEQVCwgBdwk3jUpd9q0w+Tl3H2QpMfA
         cswVSAxb244Fg8OFCT/80/4jrUeS8hb7zPNM5SjRwCo1kpxmQE92MnHM5hdyMEYANsMO
         A48qNSIXFzkAG6mgAFq5tY7m3pbbdMtG1/GtWLgF+y0sfNOm9RzpbiktkGdf6T6mknPG
         RgCf/Q51pHgaEyX72Zy6h4etPkyafT5FblkkxwdA7bfSyRgJlyKu2I004KidQLHTvPhA
         KrWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791637245; x=1792242045;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=GoroDu6xICaIQCB3Y6XVwmspeLrCWXpr98G9YRTCm5U=;
        b=lfqLTbPv3WYVTejgytUIj/lKn4n4QqZEi2rvogIDfaJ04SCTAWdpKiiWHB90RNhT6R
         mSCUq0TCfPqjMjw6pLdMzs45PyHE/25UXXC6Pa2SjNVDHFTIubXIuXJoeKPNHXPXkKrQ
         D2cOxi11vHjxAGFavORyBNuy0yVS5EvqkeENZ0ywN8GKzscmETWvvdzROeY9elg+gIX8
         BLeDcgFMUpyE9wi//E1RxjadxywS4eYX1XMuGlmE2zxi3aT1JaAtQOfveuQtndyVV0BH
         wGnW3XbiZFamRueqUxPRt0GViLhQB+qT03bfXXArJLRK6RoTFbyTXVXuhr0sW3LiX1Ar
         XOEA==
X-Gm-Message-State: AFq9FYL+5TjPgbNcDMQ3WUj5qcAcnFB4WSr84cSzF2XLfKnj+0dwvMNe
	2CXeGAXd5U/zXVeY9etYMKhapbx7lqme8DVParLuiLrBH4vbOo5/IQaX/uTPsf52GrN6rA==
X-Gm-Gg: AYBFou1hgemuy0WyfGrAYcjW4Pfx/3oaUbNjfOI4pHKnW92/yqr4iAk3t8RhrcCJ6XS
	OkcwbQPNfXOz/vrrvA8MU/E/KWCwLj7pR+LtK+yEM67jyK6hO4Pdx5wSK8aHNSnPwhM80jzSHqA
	roYNVGbDTUPtF2N7s1P84iJS7Tn8EyTHJamWs0uzNc9zbLcbcVVDUufG1VS6TfZiySVVl7upCiP
	8fkpGOStrdlolkEm9tSrKdkGFgZZdD+QRhoRZDtpzRCHieDZpMVooli9dOYW/xSP3/ldVpoKKjD
	T3JcJ1zM8HPBMICQBfsK4EbhLiZaeuFIKr70u+W5fFedQzBAKreuW12pn3z5WzzWhiO95065nzn
	E52fj1LmGFu1nAO/ZTBTDvRELb0WY+PNXJt4HKaV71OZ8OfPR4d0kd64+LwLSuoli4D2lv/GPKU
	HBks5ZjJIezX7turdQpvb2fDocoBzXNnRWgD3/Gqn0rTl9ZVazdjk4UR3C+OH6bWYuNd7y7DiGM
	O/O5iUcCevBs1+LGVffVVvil7QvtWL32je+ulas7E0YZVUf7qyxOs0anbwAdel8Z+NrHk9NQOPe
	u3EyHq/IoQM5LEgDW9oj3b52HlYoOfjRciOx/EJYQCZZoSjx9lcLdSeagjIhsg==
X-Received: by 2002:a05:600c:8b06:b0:4a1:7ce1:2eaf with SMTP id 5b1f17b1804b1-4a18e4e0963mr91375015e9.34.1791637245361;
        Sat, 10 Oct 2026 06:00:45 -0700 (PDT)
Received: from navid-pc ([2a01:4b00:a856:6220::a11])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a190c49d5csm162309975e9.3.2026.10.10.06.00.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 10 Oct 2026 06:00:44 -0700 (PDT)
From: Navid Ghahremani <ghahramani.navid@gmail.com>
To: linux-arm-kernel@lists.infradead.org
Cc: devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	arnd@arndb.de,
	linux@armlinux.org.uk,
	stefandoesinger@gmail.com,
	robh@kernel.org,
	krzk@kernel.org,
	Navid Ghahremani <ghahramani.navid@gmail.com>
Subject: [PATCH 17/24] dt-bindings: net: Add ZTE ZX279128S Ethernet switch
Date: Sat, 10 Oct 2026 13:59:55 +0100
Message-ID: <20261010130024.177503-18-ghahramani.navid@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261010130024.177503-1-ghahramani.navid@gmail.com>
References: <20261010130024.177503-1-ghahramani.navid@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261010_060047_570877_FB22D2E5 
X-CRM114-Status: GOOD (  13.70  )
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

Assisted-by: LLM
Signed-off-by: Navid Ghahremani <ghahramani.navid@gmail.com>
---
 .../bindings/net/zte,zx279128s-gmac.yaml      | 108 ++++++++++++++++++
 1 file changed, 108 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/net/zte,zx279128s-gmac.yaml

diff --git a/Documentation/devicetree/bindings/net/zte,zx279128s-gmac.yaml b/Documentation/devicetree/bindings/net/zte,zx279128s-gmac.yaml
new file mode 100644
index 0000000000..56c81aa6e7
--- /dev/null
+++ b/Documentation/devicetree/bindings/net/zte,zx279128s-gmac.yaml
@@ -0,0 +1,108 @@
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


