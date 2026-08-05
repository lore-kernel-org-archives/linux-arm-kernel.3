Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 98397C55ABA
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  5 Aug 2026 15:21:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/mB4Ti+Oo6yYFT0n8GAruuQFRvjrgnk+7RiLPcKqRr0=; b=KkKUIGznghNQ42+YXmxWqNulUB
	8gPMHwy0m0F8wk0vc+ZLW7MTjqIBCySLtyjSy8jLoIradTXRdVzBE5TS2uBMlaKKeZgCGc/BC6n2S
	GvySceMhWVc0xiAYAREKrPHhk4Kz3SkkJuFTYwxxg83AffQQFpe410PVXwf4uKwvDxm1IEIban/KG
	Z1+dArBZrI5GEyx+ym7mh5DEk1xrBJGxqV2TkB4nOnpI4BTMZkx5s8mIBbVPNThBSg3/BEtXxo2/3
	bww4PAHQZTaAuCa4H2LxBl3nQGeS/pidc0Nm3cU20LcpVH8eyGQjxAvGv+1HAQeuoEcCxpF2EfLn4
	W9AYOGaQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wrdQc-00000004AQN-2x6a;
	Wed, 05 Aug 2026 15:21:10 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wrdQb-00000004APZ-1nhz
	for linux-arm-kernel@lists.infradead.org;
	Wed, 05 Aug 2026 15:21:09 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id DDD79409D4;
	Wed,  5 Aug 2026 15:21:08 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0A1D41F00A3A;
	Wed,  5 Aug 2026 15:21:04 +0000 (UTC)
From: Geert Uytterhoeven <geert+renesas@glider.be>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Brian Masney <bmasney@redhat.com>,
	Ulf Hansson <ulfh@kernel.org>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Marek Vasut <marek.vasut+renesas@mailbox.org>,
	Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Cc: devicetree@vger.kernel.org,
	linux-clk@vger.kernel.org,
	linux-pm@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Conor Dooley <conor.dooley@microchip.com>
Subject: [PATCH v3 1/6] dt-bindings: clock: Document Renesas R-Car X5H Clock Pulse Generator
Date: Wed,  5 Aug 2026 17:20:49 +0200
Message-ID: <7a33c99816c850faeec5c17532811faf78959a1d.1785941595.git.geert+renesas@glider.be>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1785941595.git.geert+renesas@glider.be>
References: <cover.1785941595.git.geert+renesas@glider.be>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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

Document support for the Renesas R-Car X5H Clock Pulse Generator, and
add binding definitions for a limited initial set of clocks.

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
Reviewed-by: Marek Vasut <marek.vasut+renesas@mailbox.org>
Tested-by: Marek Vasut <marek.vasut+renesas@mailbox.org>
Acked-by: Conor Dooley <conor.dooley@microchip.com>
---
v3:
  - Add Acked-by,

v2:
  - Add Reviewed-by, Tested-by,
  - Drop preliminary,
  - Expand CPG acronym,
  - Drop R8A78000_CPG_MSOCK_PERW_BUS,
  - Add R8A78000_CPG_SGASYNCD8_PERW_BUS, to avoid holes in the
    SGASYNCDn_PERW_BUS sequence,
  - Drop firmware property.
---
 .../bindings/clock/renesas,r8a78000-cpg.yaml  | 55 +++++++++++++++++++
 .../dt-bindings/clock/renesas,r8a78000-cpg.h  | 14 +++++
 2 files changed, 69 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/clock/renesas,r8a78000-cpg.yaml
 create mode 100644 include/dt-bindings/clock/renesas,r8a78000-cpg.h

diff --git a/Documentation/devicetree/bindings/clock/renesas,r8a78000-cpg.yaml b/Documentation/devicetree/bindings/clock/renesas,r8a78000-cpg.yaml
new file mode 100644
index 0000000000000000..4e23bba334382346
--- /dev/null
+++ b/Documentation/devicetree/bindings/clock/renesas,r8a78000-cpg.yaml
@@ -0,0 +1,55 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/clock/renesas,r8a78000-cpg.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Renesas R-Car X5H Clock Pulse Generator
+
+maintainers:
+  - Geert Uytterhoeven <geert+renesas@glider.be>
+
+description:
+  The R-Car X5H Clock Pulse Generator (CLK CONTROL) consists of oscillators,
+  PLL circuits, clock dividers and clock control circuits.  It provides various
+  clocks for other modules.
+
+properties:
+  compatible:
+    const: renesas,r8a78000-cpg
+
+  reg:
+    maxItems: 1
+
+  clocks:
+    maxItems: 2
+
+  clock-names:
+    items:
+      - const: extal
+      - const: extalr
+
+  '#clock-cells':
+    description:
+      The single clock specifier cell must be the clock number, as defined in
+      <dt-bindings/clock/renesas,r8a78000-cpg.h>.
+    const: 1
+
+required:
+  - compatible
+  - reg
+  - clocks
+  - clock-names
+  - '#clock-cells'
+
+additionalProperties: false
+
+examples:
+  - |
+    clock-controller@c1320000 {
+            compatible = "renesas,r8a78000-cpg";
+            reg = <0xc1320000 0x10000>;
+            clocks = <&extal_clk>, <&extalr_clk>;
+            clock-names = "extal", "extalr";
+            #clock-cells = <1>;
+    };
diff --git a/include/dt-bindings/clock/renesas,r8a78000-cpg.h b/include/dt-bindings/clock/renesas,r8a78000-cpg.h
new file mode 100644
index 0000000000000000..7fd09a3fb353d952
--- /dev/null
+++ b/include/dt-bindings/clock/renesas,r8a78000-cpg.h
@@ -0,0 +1,14 @@
+/* SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause) */
+/*
+ * Copyright (C) 2026 Glider bv
+ */
+#ifndef __DT_BINDINGS_CLOCK_RENESAS_R8A78000_CPG_H__
+#define __DT_BINDINGS_CLOCK_RENESAS_R8A78000_CPG_H__
+
+/* R-Car X5H Clock Pulse Generator Clocks */
+
+#define R8A78000_CPG_SGASYNCD4_PERW_BUS		0
+#define R8A78000_CPG_SGASYNCD8_PERW_BUS		1
+#define R8A78000_CPG_SGASYNCD16_PERW_BUS	2
+
+#endif /* __DT_BINDINGS_CLOCK_RENESAS_R8A78000_CPG_H__ */
-- 
2.43.0


