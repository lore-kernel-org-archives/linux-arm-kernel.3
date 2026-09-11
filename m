Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 814FDC88E4D
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 11 Sep 2026 22:54:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:To:From:Reply-To:
	Cc:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=mBJHZiui6LC0ZFroetycbP9gbMZ7hcwLvF2peu3oVkk=; b=cDVJUlMsiBlaBqSdZOyrxmu+tK
	vtr6d5uYdlKKjT8nHJ5WpjkRklSeFJAaeDd5/zwmyzHKsherLkeHZ9otcoLma3nBiK0x2COrLXhHl
	IHIloq3swhHPrS23se1HyfzfWV1e/LPu/DUzYM5C3B+L7Q9O8V4x1RgFVszUD7HnybUfFuJtrFbMk
	9Ig9PShGnW01HL44YQ+Q4xJBNGz3sZtWafBxetJJzBLLt+DQQKvvyWXgq7fB/swrOpF1E0W/hFnmc
	bLYimGPZcMMXTM0ZD62BIrpG7YHpwe9i1dLsoomTaXISaYWGmq9JwdVjzQl7qgrvtVcNudXaCB+Fl
	g8mWu5HQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x5A8l-00000000Iuz-2xze;
	Fri, 11 Sep 2026 22:54:39 +0000
Received: from mail-wm2-x10.google.com ([2a00:1450:4864:31::10])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x5A8h-00000000IqJ-2uUu
	for linux-arm-kernel@lists.infradead.org;
	Fri, 11 Sep 2026 22:54:37 +0000
Received: by mail-wm2-x10.google.com with SMTP id 5b1f17b1804b1-49b912d37b5so2328725e9.2
        for <linux-arm-kernel@lists.infradead.org>; Fri, 11 Sep 2026 15:54:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789167274; x=1789772074; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=mBJHZiui6LC0ZFroetycbP9gbMZ7hcwLvF2peu3oVkk=;
        b=Xiilg/swU3KenjdgN/xPbUxg7oWTd8RV0/eyol1Cu6wIf6X1XLZEbKUReVLce2SlxY
         KPoDNoUwz49JCh4HDH2qFYMMr2p/jYdzL6vO7IkdH/nbzHLS2n24KrK/7fMB76JcC5uV
         p5DNv1vxx4P7PRYrTwH2haDHi2vhdGfiKor5x+TYlrHrCIkm69bv7rzuSA0ex80fuFKm
         FoDTgLTD95HySuNAi6ZKwrvZ/iOaWNAYAGwlN2HKDpdToTe7e/1uY1AeTQGDSeGQmQyz
         tMAT9LHGqveFuZXOWU+lvaXskGBsYjtnSP3hbytPPDhi6gGl68DoRjGHi40gg5d/mIZq
         EmEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789167274; x=1789772074;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=mBJHZiui6LC0ZFroetycbP9gbMZ7hcwLvF2peu3oVkk=;
        b=sRYQYBRiapAUKpXjAxrHAtTzCgZT1g8yOn7YiG5NE68XXnm0Q3ICtit6ioKMhD6Ryp
         ZdWXBsJf+RqKWI+KeFnLMQR+3JZs1ZEX3UYkUNDzKHfopoPrFDP1B+rF4cIxCLWByrMk
         2F+zCm0nL4av/m1NKS1v87qjoglG2zT/PGnfnBpPuQcoHWJCdeRo8mLMx6ckXRbsCUu3
         nT0eAT7xqVg5BAk5q5sryVKES7xeTuqY4r3n6qLK5Hmza0uGjEAZV0y09+dP7yMsWVAH
         XG3GZemD55KVyXWXdfdDbrBQsqDmOZg4P3AQYDpGSuiUW75H9fEGjEk1+JMozvy4T6w7
         WS2Q==
X-Forwarded-Encrypted: i=1; AKwUvBx3ODeCYU1eW1xpbJRvduaK2Cu5oeEu4DomjKVn5KI/TYVDMryU2APFSp7+DVZeg+7zO6wRSVgqce5iZP3c76x9@lists.infradead.org
X-Gm-Message-State: AFuF++mDW8spJd7J1rK3qv7snqhtVYZ+xyYy3a+iNm5Ny8XvpQAPq8Mv
	2CUboi2753a7TvajHrZ6RG24QDCkNNBGxBKkuZMOb3Hq+WSpikI9Q0WN
X-Gm-Gg: AYBFou1Jfb6/GpmwcPaH0yBjqLA9oG2kxgvsm3S04BmpUoS36UHcsw6jVqF1uupAecD
	WyqDhMZo6pZDCPduWrclb9hu57YfVTUr0JjsCihGwBCQ+qyRURZt5vNcqyw+IBsRb3Q5l8X8enX
	xypPjaHc5QQdse/ue97UN5DfJzKBN+E33fTgh56EdKfIAJkxBkxf4SB6S2owp31UM1pouYUxURr
	MRqLbEwtDURQ6IWIwcLyyWD6KSLjXvS6C1c8JHkzh3rTaIzEQyyL2JrlZJ9kt2BE0505GV79ibE
	AGfFlSIQuIm5bDxIRd7d3lcAZvU+gwGfjsI7uobrH7na15F4Xoz/Xm+xIxdFtzGRJXeSc3lUJ/J
	lgVBKP7YoqEQDn7RAWYRo2pqccx3fUshOqNLDjXOYXT1A3Fyr11P4JG58dBXuM8vpVElY6x65SK
	pPzCBlymXsyfyN8ApemwkTOByR+Ib128xgpCJqzF7uzF/hT/nbwIOUb6SxVk+AGX1XARG6BvbS8
	LUcfxCqcUKTHY/S848kl9JlE/A3rapZ2IfRRsIZ2ujykWVjOBzPr20ZYrCn5jA=
X-Received: by 2002:a05:600c:3494:b0:49c:e3c3:5efd with SMTP id 5b1f17b1804b1-49e619aab42mr168024575e9.9.1789167274003;
        Fri, 11 Sep 2026 15:54:34 -0700 (PDT)
Received: from Ansuel-XPS24.localdomain (host-79-26-252-140.retail.telecomitalia.it. [79.26.252.140])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-49e6221ffb0sm77593685e9.3.2026.09.11.15.54.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 11 Sep 2026 15:54:33 -0700 (PDT)
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
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	"Chester A. Unal" <chester.a.unal@arinc9.com>,
	Daniel Golle <daniel@makrotopia.org>,
	Heiner Kallweit <hkallweit1@gmail.com>,
	Russell King <linux@armlinux.org.uk>,
	Simon Horman <horms@kernel.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	netdev@vger.kernel.org,
	mfd@lists.linux.dev,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH net-next v21 2/9] dt-bindings: net: Document support for AN8855 Switch Internal PHY
Date: Sat, 12 Sep 2026 00:53:26 +0200
Message-ID: <20260911225414.225980-3-ansuelsmth@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260911225414.225980-1-ansuelsmth@gmail.com>
References: <20260911225414.225980-1-ansuelsmth@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260911_155435_803699_AF0E4F14 
X-CRM114-Status: GOOD (  16.52  )
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
2.53.0


