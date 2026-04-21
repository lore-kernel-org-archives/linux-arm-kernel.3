Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2202FF94CA5
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 21 Apr 2026 18:12:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Z7YiSzyV2vyo29e88RBxmoTgT5Kff2B5SeBQwyxlSQI=; b=oRL1NwAnckNz76uBTxSIubuif9
	zPcX72g2PyPMSwpwYtDw8kYgSaWkVGebfWgHN2So4xDkr75/FdiZJ9LGfxmLJvNzoKorOGfjd3ULH
	fIG5HqW/wK1wCIveiZkI1lN74WNxYnob9MXhUs1u0UKWDbHjpk/6dNO4gNUJU7LxfwRhpaSGxrUkQ
	sFnXa6tOu+ATB9EK3mlbcKn8pjlfLcW+Ldc9qubyX0lh0bekFwiH2GXdJ0GEavyB9OYhyPtd/cJPU
	FDCyA3GNcRSrDGECYk7CBoMlPWW2rysvtrdF6NRRKEB3hKsO8xFwsh4sNthE+4tSpxTDGD+to01CV
	YhAApjew==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wFFaY-0000000913P-0SN3;
	Tue, 21 Apr 2026 18:12:46 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wFFaV-0000000911M-3DA4
	for linux-arm-kernel@lists.infradead.org;
	Tue, 21 Apr 2026 18:12:45 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 73324418F9;
	Tue, 21 Apr 2026 18:12:43 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AEC01C2BCB4;
	Tue, 21 Apr 2026 18:12:38 +0000 (UTC)
From: Geert Uytterhoeven <geert+renesas@glider.be>
To: Sudeep Holla <sudeep.holla@kernel.org>,
	Cristian Marussi <cristian.marussi@arm.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Magnus Damm <magnus.damm@gmail.com>,
	Saravana Kannan <saravanak@kernel.org>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Ulf Hansson <ulfh@kernel.org>,
	"Rafael J . Wysocki" <rafael@kernel.org>,
	Kevin Hilman <khilman@baylibre.com>,
	Florian Fainelli <florian.fainelli@broadcom.com>,
	Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Marek Vasut <marek.vasut+renesas@mailbox.org>,
	Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Cc: arm-scmi@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-renesas-soc@vger.kernel.org,
	linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-pm@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH/RFC 09/14] dt-bindings: clock: Document Renesas R-Car X5H Clock Pulse Generator
Date: Tue, 21 Apr 2026 20:11:42 +0200
Message-ID: <f8c98dbf6b32c0d467606d59b071e9c2bfc29dbc.1776793163.git.geert+renesas@glider.be>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1776793163.git.geert+renesas@glider.be>
References: <cover.1776793163.git.geert+renesas@glider.be>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260421_111243_842700_BF07BE3E 
X-CRM114-Status: GOOD (  15.52  )
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

Document support for the Renesas R-Car X5H Clock Pulse Generator,
and add definitions for a very limited and preliminary set of clocks.

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
 .../bindings/clock/renesas,r8a78000-cpg.yaml  | 62 +++++++++++++++++++
 .../dt-bindings/clock/renesas,r8a78000-cpg.h  | 15 +++++
 2 files changed, 77 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/clock/renesas,r8a78000-cpg.yaml
 create mode 100644 include/dt-bindings/clock/renesas,r8a78000-cpg.h

diff --git a/Documentation/devicetree/bindings/clock/renesas,r8a78000-cpg.yaml b/Documentation/devicetree/bindings/clock/renesas,r8a78000-cpg.yaml
new file mode 100644
index 0000000000000000..fc499e7cf52e4f0c
--- /dev/null
+++ b/Documentation/devicetree/bindings/clock/renesas,r8a78000-cpg.yaml
@@ -0,0 +1,62 @@
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
+  firmware:
+    $ref: /schemas/types.yaml#/definitions/phandle
+    description:
+      Reference to the SCMI firmware device node on systems where SCMI must be
+      used instead of direct hardware access.
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
+            firmware = <&scmi>;
+    };
diff --git a/include/dt-bindings/clock/renesas,r8a78000-cpg.h b/include/dt-bindings/clock/renesas,r8a78000-cpg.h
new file mode 100644
index 0000000000000000..8c8bc4d1feac6d26
--- /dev/null
+++ b/include/dt-bindings/clock/renesas,r8a78000-cpg.h
@@ -0,0 +1,15 @@
+/* SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause) */
+/*
+ * Copyright (C) 2026 Glider bv
+ */
+#ifndef __DT_BINDINGS_CLOCK_RENESAS_R8A78000_CPG_H__
+#define __DT_BINDINGS_CLOCK_RENESAS_R8A78000_CPG_H__
+
+/* R-Car X5H CPG Clocks */
+
+// FIXME Preliminary
+#define R8A78000_CPG_SGASYNCD4_PERW_BUS		0
+#define R8A78000_CPG_SGASYNCD16_PERW_BUS	1
+#define R8A78000_CPG_MSOCK_PERW_BUS		2
+
+#endif /* __DT_BINDINGS_CLOCK_RENESAS_R8A78000_CPG_H__ */
-- 
2.43.0


