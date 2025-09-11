Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 554ECCAC587
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 11 Sep 2025 13:40:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:To:From:Reply-To:
	Cc:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=S1Rt7Xhagla/1sOuAXTb1PZ0PCjuu0lMg8zPkfBBc8c=; b=KW1kwTVk68uwoXJfFNgn3M8i1t
	oNOMoTntbICfj2HnxbT3Ab65BxhVST0i2uCKyISdDZn0CAnf8rb/1he1wwgH1YJ3n4HTmqlK5ibi8
	qiDhpLaJFpO4unJmmBWqIi1bhBZWjx2n+r4a3DglLF7WNNnLT1q2cuXXZohC5GrgkcbMigd7vmziU
	c2iwXckAd+eB99lcXeVPZ/Ix/coCyyT7kc4Vkac+XSavRzQs6yxfPCfHZjs7DlgD+om/+rNsv8dxz
	/rIQLBT1VvKNcegHhHYyXOF64KePaV1qjgWfDM6ld7gX5QbDq1lgxROkcgnX4xjfIHxghot1wLCKm
	Mi+FJ4Iw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uwhWz-00000003HbS-0C8w;
	Thu, 11 Sep 2025 13:40:09 +0000
Received: from mail-wm1-x330.google.com ([2a00:1450:4864:20::330])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uwhWv-00000003HXj-3brs;
	Thu, 11 Sep 2025 13:40:07 +0000
Received: by mail-wm1-x330.google.com with SMTP id 5b1f17b1804b1-45b9a856dc2so4781745e9.0;
        Thu, 11 Sep 2025 06:40:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1757598004; x=1758202804; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=S1Rt7Xhagla/1sOuAXTb1PZ0PCjuu0lMg8zPkfBBc8c=;
        b=gfuj5pWp0RMB2DPATDj5JEEQfZvULFNY6PI0fTX4XKKSvFeu6uzW7HnM3xMJTP+zam
         zoZG6Bj3GDmYbXpu/mEZSeI4jbh12FJt1CQd1XIbN1g587RSZnUSrl+YZucpyGfN4JTj
         WEdpadi3CEFZAQN9DWyqX3V6PwL4xDd2oEFtK8PAAsNl1rN4NPcKW4pepr08ussoQF35
         7Td8ui7vLjbyFRPpdtpd5N829pRlaEGF+JNvknYbJJoQbwd4W8DfPpGdPFAZ/EH46LiD
         vgAZYmZgNiO6/nAkbo9zv31oUUk7jgzhKUMHIiaCoQBQt55xWVtu0h56wiSIn5lP6NoE
         fj0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757598004; x=1758202804;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=S1Rt7Xhagla/1sOuAXTb1PZ0PCjuu0lMg8zPkfBBc8c=;
        b=mLs3RHyMEyRpIn58SnmSXEq81lb4SlzbGNBbXRbzP05uvbeqw4TaPXTKRuzADVdMrr
         ZhJlRiEJauNwRH0n3ZZMbCqjRkT6m+aXGbHlla/vymIqsF0Ys7IDFg6gfKDvkzs25OnJ
         Ft/mA5hbW6DnUdI+KpmMvxRCP1sPIkpgID5bDkB8+HlJMiDl8QpDVkfVj0bbX3jeo6tt
         QugcwYxxMf/CBH11LzTfpvUDJhSvXq+F73WQn0SuUkgD6Io7vz4xlpmBRGYnlDlQzqME
         Vsv5hS7mgFRP7fDnzHVgWgNYg371YM6qAbDCdRt1GQF5dyH5+gbGUehmQK1MxqpQL5RI
         eVPA==
X-Forwarded-Encrypted: i=1; AJvYcCU/7cOiVyWPkwSnmai7Z6bAVy96uWYIi6C35fBqVcGkWC6cdzZbZOE/+Ahu7FhkC75ewI5aAXn5XTGkK6u3R4Y=@lists.infradead.org, AJvYcCUgqbqdrhdOiS8B7A5gPgJBoIiEgeZxRmvCrNQ3IvOoNeSeJQlWLthbFfrYLAX5pqid4NKgr7PpKlr58B/JIx0c@lists.infradead.org
X-Gm-Message-State: AOJu0YwxdMJ/Tp4pDFEYQzeTEaRqAAReq82s7/wvCa7Po/JIBfVjy/9P
	lCxitybjX05sS/dpveKFxl55NmbZPqSQyziBhdeuF407GaiFrUJCzq6L
X-Gm-Gg: ASbGnct3PVxEOUh5P3dfmCJLZIErmF0AVv8cC7iym7hGf7kiQpMITYQwkFq0MscUTDM
	4IYCF2+aO/fg9GcP8sshplExExIaIsQZoYkLx4PDE5xQ60xKHiS7gREJOlZg5TjfJKahCu6q+Ha
	9Yj71nbBLzjEnIuOjTLs1Odv4TEW52TMGLSIG6acTHB9UQfAVHOote1NSXeNwG2GPXFuWeopzjH
	GXbKMDaeLom1aa+Gv7bKsTXFfLRQKZBZVxQgqNVz8sd8+Hy2i2E9Sk+McQx6F5YaFNQX+Rm+ntb
	xOuHaZ+fD82EsRk3Kgw44FnwbAlL33DMwdrnPhQX9AKiPQ6BJmBFtJb0e6usmIZLvvAJZhnvYeh
	Zdg7TaNv14e4k2h4X4nvfOw6Boz8tBctpiK46BM8RmpYnlgyPU4mZdKDqJ1MQJDAm6GlqkXFvfZ
	R+xrVsRg==
X-Google-Smtp-Source: AGHT+IEQnbZAkH72KbH1sWGy7Aob16nrc/vZyq1pJwWibaA0QKysjGacWDJPdgyCWOflwP6r6uEoFA==
X-Received: by 2002:a05:600c:5299:b0:45d:dd47:b45f with SMTP id 5b1f17b1804b1-45dddef7fdamr162292265e9.31.1757598003714;
        Thu, 11 Sep 2025 06:40:03 -0700 (PDT)
Received: from Ansuel-XPS24 (host-95-249-236-54.retail.telecomitalia.it. [95.249.236.54])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-45e037d741asm23413475e9.23.2025.09.11.06.39.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 11 Sep 2025 06:40:03 -0700 (PDT)
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
Subject: [net-next PATCH v17 2/8] dt-bindings: net: Document support for AN8855 Switch Internal PHY
Date: Thu, 11 Sep 2025 15:39:17 +0200
Message-ID: <20250911133929.30874-3-ansuelsmth@gmail.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20250911133929.30874-1-ansuelsmth@gmail.com>
References: <20250911133929.30874-1-ansuelsmth@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250911_064005_933370_4401A8BF 
X-CRM114-Status: GOOD (  15.75  )
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


