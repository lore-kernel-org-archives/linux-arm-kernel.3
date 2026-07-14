Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2B0FCC4450B
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 14 Jul 2026 19:14:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=puD3SxDRZK2kLUJhdwB2OWJks0pBuRZ5Hw4UZYV+czY=; b=YNiTej8v12oBGrvpjYAk8Q1H7p
	ECLAnr1azyK3Kw7DNKOY/xgT3zH7QHTF9TJQhhtM7MFekXRD3aVXOeSn84yV2RLbxIH8stTcvp9YE
	GsOxAVyGh4jOKR1uNvhhwl6ehCh8UyanAzp5DsqT9xu+QHyCQxsYKSSJr1ymn5fzesz+zyDdCuQcK
	SsvxpyYnj8uAgkmjP5ewbkWeMOpUkfQ4U63kV1+05fxSb78pJ1992c30xVuhYar6uG5LqH/F0n27K
	BUqLev2IABl5gP8WyZHHS6ohHZYQZIFGinkBmnJtGVGRX1PTq/TO2A2rYqDaaUT2HpG9trJLU9XiO
	EUBUbi6g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjia9-0000000D02F-2lLa;
	Tue, 14 Jul 2026 19:14:17 +0000
Received: from mail-pj2-x02.google.com ([2607:f8b0:4864:39::2])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjia6-0000000CzyI-0BbP
	for linux-arm-kernel@lists.infradead.org;
	Tue, 14 Jul 2026 19:14:16 +0000
Received: by mail-pj2-x02.google.com with SMTP id d9443c01a7336-2ccbff2e6a7so31004195ad.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 14 Jul 2026 12:14:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784056453; x=1784661253; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=puD3SxDRZK2kLUJhdwB2OWJks0pBuRZ5Hw4UZYV+czY=;
        b=fyld8ZewK446LqPS1tMvyP4fXMf7kj3RYQnV2AqVyc2QmjHXPeU8YIKSur7nXIV9fR
         o2FAulFSCiM+ZYZgRqU04fon1zbzQyo7Jm0KK3nqQ4sI5Lpn/LJV773Q4YCZ8YGFsrtS
         NFHpif/RHMhN7s87lzOJNylz3XnUeHU9rVfuNQ5DaAF2w4mxeRRxOYTCDySfuo+MVayQ
         HhNnKdJjgKQEveEGnJSjoITtbWvskWTKxp2fmbNaGOHeDwFtVQGMpKr2Wwh2QoR7SLGb
         aN4yQR7N9p5YDH0AEyA6pFLSJoX9cyVV945MFJG/As82uBbjyocaNUM4SFHHDrDr6a1d
         M0wA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784056453; x=1784661253;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=puD3SxDRZK2kLUJhdwB2OWJks0pBuRZ5Hw4UZYV+czY=;
        b=MoxTeiBUa4+XotIN5GDcYBXMOP+FVX97ZEHY45V8jloXCEjQyLkr6BYkrYolRCB6Xn
         BltOX+T8784MuBgzWwcn78SF3dk/P+744MUUazQUTX3zJe2sp5AW2w4OvErElNiIOSRU
         plwqYS3OaifRB0tKF9zfW0RJ6cID/J2onfu1DsMKQ84at0uTDvt/aDabmKWQYIjIiM4V
         RzurYcH8oXv+2BqYaZnmoqaKtZNoKKehmgAKgUkz6VaRek/VA99RZsLbLE8AKF0ATqSY
         cjAz8khEdlbVpk1XKzaWjVkbt8J5KpK1dPInmOI9W8n6+zzl2EWkZDw4qK1vgXoZUFIf
         0tqw==
X-Forwarded-Encrypted: i=1; AHgh+Ro3zzKe0gYORJ76Ip4qTTQI9awG44I+UetA53FD0w28Wg1lyEJDY4QhuuaPyKSjKIAbgnCgwrBoX9DGEasgXwBY@lists.infradead.org
X-Gm-Message-State: AOJu0Yx2gNH7n4gE/xpQFRDF7oeZHOG7jSrPKb5lR1mvffbFuaA4cVgI
	iUiq/CMpPFOMbZUxtDMt6NonyW7uBgyaNE4SR7x7JUQFAm6+QmZTt5mK
X-Gm-Gg: AfdE7cmh+aKEHbkliG2j0hclLDTSmcMeyJbShvwCiY6tFaAyVMYlmyFpe3KSZkUEqL8
	Tw75fDP9d0wO6dYL5HAyIe8ztH7jsjF5rewDPBzIy929Ctf+r7WlivqGN4J3fOSYxoXS5kiNSYK
	fGNt+qnGdr6ExmnbyibO9teX689vTcD34Qz6W9xigxt4NQgEzIM9c9du9am3PMAxtXcVjuN7e+X
	8Pq7NYc9FaJBnh4iUzwtldvNU6jjVMkzKo5bj0TqBAuZ2lXf0EkeiFjo5/oWsNQfUcr+esZTP1j
	O2aPahjs+YZxTjPy9AbthAk5ytGPo1agEK2s9Lr6hjlS7qkCUJwK87ihaVQ8VGfbDdxBRoEnO0+
	tkVwlDfzgO5aVMxPIXP52WI9MRwAwebvVoLn0btlAaYgJf6FAzfAOd/6tvNPhMocPFeER06qbHb
	jr6TQRjjCJP8YZQgalW8Ovdw==
X-Received: by 2002:a17:902:cec9:b0:2c9:d298:6c06 with SMTP id d9443c01a7336-2cef12fc6a4mr40014075ad.25.1784056453327;
        Tue, 14 Jul 2026 12:14:13 -0700 (PDT)
Received: from server.lan ([150.230.217.250])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ccc9d3d451sm120763245ad.65.2026.07.14.12.14.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Jul 2026 12:14:11 -0700 (PDT)
From: Coia Prant <coiaprant@gmail.com>
To: kuba@kernel.org,
	davem@davemloft.net,
	edumazet@google.com,
	pabeni@redhat.com,
	andrew+netdev@lunn.ch,
	robh@kernel.org,
	krzk+dt@kernel.org,
	heiko@sntech.de
Cc: netdev@vger.kernel.org,
	linux-rockchip@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-phy@lists.infradead.org,
	Coia Prant <coiaprant@gmail.com>
Subject: [RFC PATCH 04/10] dt-bindings: net: pcs: add rockchip,rk3568-xpcs binding
Date: Wed, 15 Jul 2026 03:08:32 +0800
Message-ID: <20260714191341.690906-5-coiaprant@gmail.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260714191341.690906-1-coiaprant@gmail.com>
References: <20260714191341.690906-1-coiaprant@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260714_121414_109145_8C818499 
X-CRM114-Status: GOOD (  16.49  )
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

Add device tree binding documentation for the Synopsys DesignWare
XPCS integrated on the Rockchip RK3568 SoC.

The XPCS is accessed over the APB3 bus and internally connected to
a Naneng Combo SerDes PHY.  It supports 1000BASE-X, SGMII, and
QSGMII modes, with four MII ports.

The binding describes:
- Required properties: compatible, reg, clocks, clock-names
- Optional properties: phys, phy-names, power-domains
- pcs-mii sub-nodes for each MII port (reg 0..3)

Signed-off-by: Coia Prant <coiaprant@gmail.com>
---
 .../bindings/net/pcs/rockchip-dwxpcs.yaml     | 126 ++++++++++++++++++
 1 file changed, 126 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/net/pcs/rockchip-dwxpcs.yaml

diff --git a/Documentation/devicetree/bindings/net/pcs/rockchip-dwxpcs.yaml b/Documentation/devicetree/bindings/net/pcs/rockchip-dwxpcs.yaml
new file mode 100644
index 0000000000000..14fadf67c793a
--- /dev/null
+++ b/Documentation/devicetree/bindings/net/pcs/rockchip-dwxpcs.yaml
@@ -0,0 +1,126 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/net/pcs/rockchip-dwxpcs.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Rockchip RK3568 Synopsys DesignWare Ethernet PCS
+
+maintainers:
+  - Coia Prant <coiaprant@gmail.com>
+
+description: |
+  Rockchip RK3568 SoC integrates a Synopsys DesignWare Ethernet Physical
+  Coding Sublayer (XPCS).
+  The PCS provides an interface between the Media Access Control (MAC)
+  and the Physical Medium Attachment (PMA) sublayer through a Media
+  Independent Interface (GMII).
+
+  The XPCS is accessed over the APB3 bus and internally connected to a
+  Naneng Combo SerDes PHY.
+  It supports 1000BASE-X, SGMII and QSGMII modes.
+
+  The block contains four MII ports (pcs-mii@0..3) that can be
+  individually enabled and routed to one of the Ethernet GMAC controllers
+  via the pcs-handle property in the MAC device tree node.
+
+properties:
+  compatible:
+    const: rockchip,rk3568-xpcs
+
+  '#address-cells':
+    const: 1
+
+  '#size-cells':
+    const: 0
+
+  reg:
+    description: |
+      Base address and size of the XPCS register space mapped over the
+      APB3 bus.
+    maxItems: 1
+
+  clocks:
+    description: |
+      Clock sources for the XPCS:
+      - csr: APB3 bus interface clock (clk_csr_i), required for register
+        access.
+      - eee: EEE clock (clk_eee_i), required for Energy Efficient
+        Ethernet (EEE) operation.
+    minItems: 2
+    maxItems: 2
+
+  clock-names:
+    items:
+      - const: csr
+      - const: eee
+
+  phys:
+    description: |
+      The phandle of SerDes PHY (Naneng Combo PHY) that provides
+      the serial lanes for 1000BASE-X / SGMII / QSGMII.
+      The SerDes must be powered on and initialised before any XPCS
+      register access.
+    maxItems: 1
+
+  phy-names:
+    const: serdes
+
+  power-domains:
+    description: |
+      Power domain for the XPCS.
+      On RK3568 this is typically the PD_PIPE power domain, which also
+      supplies the SerDes PHY.
+    maxItems: 1
+
+patternProperties:
+  "^pcs-mii@[0-3]$":
+    type: object
+    description: |
+      One of the four MII ports of the XPCS.
+      The port number is specified by the reg property (0..3).
+      The port is linked to an Ethernet MAC controller via the
+      pcs-handle property in the MAC's device tree node.
+
+    properties:
+      reg:
+        minimum: 0
+        maximum: 3
+        description: |
+          MII port number of PCS.
+
+      status: true
+
+    required:
+      - reg
+
+    additionalProperties: false
+
+required:
+  - compatible
+  - reg
+  - clocks
+  - clock-names
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/clock/rk3568-cru.h>
+    #include <dt-bindings/power/rk3568-power.h>
+
+    pcs@fda00000 {
+      compatible = "rockchip,rk3568-xpcs";
+      #address-cells = <1>;
+      #size-cells = <0>;
+      reg = <0x0 0xfda00000 0x0 0x200000>;
+      clocks = <&cru PCLK_XPCS>, <&cru CLK_XPCS_EEE>;
+      clock-names = "csr", "eee";
+      phys = <&combphy2 PHY_TYPE_SGMII>;
+      phy-names = "serdes";
+      power-domains = <&power RK3568_PD_PIPE>;
+
+      pcs-mii@0 {
+        reg = <0>;
+      };
+    };
-- 
2.47.3


