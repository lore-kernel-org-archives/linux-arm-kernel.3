Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 35445CAC597
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 15 Sep 2025 10:46:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:To:From:Reply-To:
	Cc:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=S1Rt7Xhagla/1sOuAXTb1PZ0PCjuu0lMg8zPkfBBc8c=; b=1lvoTDimY54/FOMOF/Ux5FEhMD
	Ho5Oy8/+GGXeFq4oEZeQ7qMIzS00USjiUJSo7L6a0mHyj4jx8eDMzC4t/EgcUUzzkm2uZGRLeTFz6
	kPHx4WokyeFjyBW17M5Y9e5TDXxzVHHwEheoSjM6uiTeJHdlgZlQviQSb6N6HPSm3TKvv+kGyQ6mZ
	gl/HdioidZfd6MdNq4H25YuVTmEobUXZoKi8ONEwxh5nb7O0XLyfFHmiIuUAqLaYLh7hvx1bVmhD4
	EI6Iuuvs8ssqDmA+hI+8Q5BlrlBLIBNFWiLKEGPhOCJOXj+YWRh1Fkm8r7c+gnJsKVCnyEVs8T+Xc
	J/8zkAtw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uy6iq-00000003l3R-0JEa;
	Mon, 15 Sep 2025 10:46:12 +0000
Received: from mail-wm1-x333.google.com ([2a00:1450:4864:20::333])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uy6ig-00000003kus-0JeU
	for linux-arm-kernel@lists.infradead.org;
	Mon, 15 Sep 2025 10:46:03 +0000
Received: by mail-wm1-x333.google.com with SMTP id 5b1f17b1804b1-45f2c9799a3so6003735e9.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 15 Sep 2025 03:46:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1757933160; x=1758537960; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=S1Rt7Xhagla/1sOuAXTb1PZ0PCjuu0lMg8zPkfBBc8c=;
        b=hxi7KSnUC5eDTvh3dJtBFCX79yboWUnWi2s1br0FHtZesCon7RCsn+6SrpsZeJ3oIo
         U76vZCXzrQ1WXX1cxcPB9SUKdbjRL3Chl8Z6ZT7RBXZwoCmDS89q3RJS8g0f/oE8c1nY
         t6JJZYF7qjiudT1ijqZtFt8qkax/9VDsvTqXGSN6lg+q1zGBf/WngWDoJL8jEr1xdZ9W
         ZkmIE89200COatYx7kb1OxMFolDJyGNp/9tw8wMSbBycN7v4ufyewzDmH2hjhBOmfdxr
         XcQdtIsEqX3O0oAvnWpATIYfZme9Qu/GYuhevvUICnZggwc1JiPkLGaszT2nl9Tyw9zC
         4Kow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757933160; x=1758537960;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=S1Rt7Xhagla/1sOuAXTb1PZ0PCjuu0lMg8zPkfBBc8c=;
        b=Tq1vc5DQCkdHWnD303BBopU9wbd4oAbd47yLj/tWqfuimObDf2vk4f7vaG3Zson+Vw
         8ZRDi2C9/VDKOqtFvC4IZiaAsb5iqYBQJJtUmQnZyDvJhtrYDeOTyKtKFOgohKLKRjc1
         hxS6WnMvB1lHURHf6k1bc32xcSqPkKm9vU2RYZ6CgCrFwQ3Tl8tXqS/bxG0TYYm6NXyY
         RCVttLMIkGX3OOEJxM92lQV8fiYgRT9PA0CErFxtpm3errw98fF0CIfOGhbCZ1qG7f0Z
         gZMYBi1aLBGbD77MDbqMySxD0PfoGkkFjZJyhOmRHEBIOYpcv7WKfURHotZzswLZvgpx
         s2ow==
X-Forwarded-Encrypted: i=1; AJvYcCVhMQwvvzSGtI1IA9EjxRmX23QyfII9dxR8nsftSZX7vxTjCWzZQb9k/zJJf914qKP/VVMNLeoJH/sQKgPkmgDi@lists.infradead.org
X-Gm-Message-State: AOJu0YwCvJgfeBNLofoEdDFPgsPaUUUf2I2cKv2v4YCgHgQ5SRoo5mfG
	X+CdzyY0YX9IRXeGv/KXDrQqwxH5mGI+mfCLtXrLLhQiuiUvXckwn0ba
X-Gm-Gg: ASbGncspCYX0KS9B0prVV+OhFFcV4R1onksFmBsye+1ajUoIvk9LetIec858gpRcRL2
	tz0EuaWnGt1c9rFHF4ildqA1hyHWGfUWTPnn+ctExyPqkTCOceR0vfXMM/8AkqcIkq0luLYfaBQ
	dYfmysW54nNRnVe+AYpBJTWYpk96HsuP7o/yuYgauu40xSGxnA1MvhNMTe7zETGrxK0dUbfIrqF
	l9twMVKJr1a9b1Ft88/huWyp2DL7+OZxnQXWLAT6zqmZXT69OQZW7AG1C82dDZZCeia2QhxKsjl
	wz2R0W9cpDF8TVYWk3rex1RM11YEh7me+/rluZfOpHJwu9S9i+2JDuzXCYneGqqAt1VnhlzxcgO
	zFsJ7WRM6vFutGtXTvqxaSj5ombkICUtv/tArW44hdw720gicoUFCapO+YepDm9aoYrGdXaOmbD
	FTfd0EWg==
X-Google-Smtp-Source: AGHT+IHn4QLGPQ32OnxYflof94cfwBR4YL3okJ8ndlhTf6v4TgxqEb87g0moZGj6t1FQ3d/i+gVHEA==
X-Received: by 2002:a05:600c:4453:b0:459:dde3:1a55 with SMTP id 5b1f17b1804b1-45f211f2fbemr135949525e9.24.1757933160050;
        Mon, 15 Sep 2025 03:46:00 -0700 (PDT)
Received: from Ansuel-XPS24 (host-95-249-236-54.retail.telecomitalia.it. [95.249.236.54])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-45f2acbeee0sm67163365e9.0.2025.09.15.03.45.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 15 Sep 2025 03:45:59 -0700 (PDT)
From: Christian Marangi <ansuelsmth@gmail.com>
To: Christian Marangi <ansuelsmth@gmail.com>,
	Lee Jones <lee@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Vladimir Oltean <olteanv@gmail.com>,
	Heiner Kallweit <hkallweit1@gmail.com>,
	Russell King <linux@armlinux.org.uk>,
	Simon Horman <horms@kernel.org>,
	"Chester A. Unal" <chester.a.unal@arinc9.com>,
	Daniel Golle <daniel@makrotopia.org>,
	DENG Qingfang <dqfext@gmail.com>,
	Sean Wang <sean.wang@mediatek.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	netdev@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [net-next PATCH v18 2/8] dt-bindings: net: Document support for AN8855 Switch Internal PHY
Date: Mon, 15 Sep 2025 12:45:38 +0200
Message-ID: <20250915104545.1742-3-ansuelsmth@gmail.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20250915104545.1742-1-ansuelsmth@gmail.com>
References: <20250915104545.1742-1-ansuelsmth@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250915_034602_171635_6DF19470 
X-CRM114-Status: GOOD (  16.93  )
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

Document support for AN8855 Switch Internal PHY.

Airoha AN8855 is a 5-port Gigabit Switch that expose the Internal
PHYs on the MDIO bus.

Each PHY might need to be calibrated to correctly work with the
use of the eFUSE provided by the Switch SoC. This can be enabled by
defining in the PHY node the NVMEM cell properties.

Signed-off-by: Christian Marangi <ansuelsmth@gmail.com>
Reviewed-by: Rob Herring (Arm) <robh@kernel.org>
---
 .../bindings/net/airoha,an8855-phy.yaml       | 83 +++++++++++++++++++
 1 file changed, 83 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/net/airoha,an8855-phy.yaml

diff --git a/Documentation/devicetree/bindings/net/airoha,an8855-phy.yaml b/Documentation/devicetree/bindings/net/airoha,an8855-phy.yaml
new file mode 100644
index 000000000000..d2f86116badf
--- /dev/null
+++ b/Documentation/devicetree/bindings/net/airoha,an8855-phy.yaml
@@ -0,0 +1,83 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/net/airoha,an8855-phy.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Airoha AN8855 Switch Internal PHY
+
+maintainers:
+  - Christian Marangi <ansuelsmth@gmail.com>
+
+description: >
+  Airoha AN8855 is a 5-port Gigabit Switch that expose the Internal
+  PHYs on the MDIO bus.
+
+  Each PHY might need to be calibrated to correctly work with the
+  use of the eFUSE provided by the Switch SoC.
+
+allOf:
+  - $ref: ethernet-phy.yaml#
+
+select:
+  properties:
+    compatible:
+      contains:
+        enum:
+          - ethernet-phy-idc0ff.0410
+  required:
+    - compatible
+
+properties:
+  reg:
+    maxItems: 1
+
+  nvmem-cells:
+    items:
+      - description: phandle to SoC eFUSE tx_a
+      - description: phandle to SoC eFUSE tx_b
+      - description: phandle to SoC eFUSE tx_c
+      - description: phandle to SoC eFUSE tx_d
+
+  nvmem-cell-names:
+    items:
+      - const: tx_a
+      - const: tx_b
+      - const: tx_c
+      - const: tx_d
+
+required:
+  - compatible
+  - reg
+
+dependentRequired:
+  nvmem-cells: [ nvmem-cell-names ]
+
+unevaluatedProperties: false
+
+examples:
+  - |
+    mdio {
+        #address-cells = <1>;
+        #size-cells = <0>;
+
+        ethernet-phy@1 {
+            compatible = "ethernet-phy-idc0ff.0410",
+                         "ethernet-phy-ieee802.3-c45";
+
+            reg = <1>;
+        };
+
+        ethernet-phy@2 {
+            compatible = "ethernet-phy-idc0ff.0410",
+                         "ethernet-phy-ieee802.3-c45";
+
+            reg = <2>;
+
+            nvmem-cells = <&shift_sel_port0_tx_a>,
+                          <&shift_sel_port0_tx_b>,
+                          <&shift_sel_port0_tx_c>,
+                          <&shift_sel_port0_tx_d>;
+            nvmem-cell-names = "tx_a", "tx_b", "tx_c", "tx_d";
+        };
+    };
-- 
2.51.0


