Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C05F5C83030
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 30 Jun 2025 23:29:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=zIsKrErJGCMMxHju1pDeaqu0TLvSo1es/xmCquLIB/M=; b=iC4odMLxy5tOX5y72N1pSVRuZL
	GCjIOJbiW34j/nDokA3XTjqEMmkD4m7QXJmgyxUsGk0IOG8Mv44QaRZsI0tzILtDunpYHsVbiVf77
	L4ar2fzLTOz77fdWkPMs65Ov2irx6O1s8sgPAmd0M42mxPoo3Uo2QWScw452vd3KkvLRtS4lp1icm
	bGypqwhFRBBUgyQN9dzgkTqHewcDf0UEWLDpqzv1J9t/zJuzZPVBdYZWIBYBdefqGMR71VwqzWoO4
	x9IgmbghBTgamvn3LcpmEonodtlJhOvNjSS/3AXhXvbjp1/uRB61MB2OIo4N2SkUFP4F9zN0K07/m
	Db/MFcbw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uWNw1-00000003geL-45oU;
	Mon, 30 Jun 2025 23:29:13 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uWNti-00000003gOj-0c00
	for linux-arm-kernel@lists.infradead.org;
	Mon, 30 Jun 2025 23:26:50 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 6462860053;
	Mon, 30 Jun 2025 23:26:49 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 00EDEC4CEE3;
	Mon, 30 Jun 2025 23:26:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1751326009;
	bh=VTv7opCZXxZ4GXzYPfNqPS1L7/gEKWDzBH62J409Juc=;
	h=From:To:Cc:Subject:Date:From;
	b=f3XFDYs7sgcJnbJo1jUQFAKDo6NG28AED9efX0YCBQLSMfkOEQIBJdPfO84ueAFq7
	 GvDQ1xlJW0Oqnne9EbcLqU9mDwhlB0vlZAbs9fTr6YGtt8b2qmYbQIAW2EivwMv3VU
	 //N1FLqQsGHY87gxsWNuxhextTvFpCdakbJ7jwpqw14mONaCeaPj/32+SBdbM6UEjm
	 pbxdQR/nQNoVzExnijzh/14orklJyRdd/8KFZvIWVeoZKFQt7mN/8YfndnVrS99JLq
	 DGXQOntOI5dSjO4lFpDjfK7Sq+ae6oe2rTHqMydA032hdV1qaudbDC5d78Y3wzfYyp
	 Sr8mKJpU6HLhw==
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: Krzysztof Kozlowski <krzk@kernel.org>,
	linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH] dt-bindings: clock: Convert moxa,moxart-clock to DT schema
Date: Mon, 30 Jun 2025 18:26:43 -0500
Message-ID: <20250630232644.3700781-1-robh@kernel.org>
X-Mailer: git-send-email 2.47.2
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

Signed-off-by: Rob Herring (Arm) <robh@kernel.org>
---
 .../bindings/clock/moxa,moxart-clock.txt      | 48 -------------------
 .../bindings/clock/moxa,moxart-clock.yaml     | 38 +++++++++++++++
 MAINTAINERS                                   |  2 +-
 3 files changed, 39 insertions(+), 49 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/clock/moxa,moxart-clock.txt
 create mode 100644 Documentation/devicetree/bindings/clock/moxa,moxart-clock.yaml

diff --git a/Documentation/devicetree/bindings/clock/moxa,moxart-clock.txt b/Documentation/devicetree/bindings/clock/moxa,moxart-clock.txt
deleted file mode 100644
index fedea84314a1..000000000000
--- a/Documentation/devicetree/bindings/clock/moxa,moxart-clock.txt
+++ /dev/null
@@ -1,48 +0,0 @@
-Device Tree Clock bindings for arch-moxart
-
-This binding uses the common clock binding[1].
-
-[1] Documentation/devicetree/bindings/clock/clock-bindings.txt
-
-MOXA ART SoCs allow to determine PLL output and APB frequencies
-by reading registers holding multiplier and divisor information.
-
-
-PLL:
-
-Required properties:
-- compatible : Must be "moxa,moxart-pll-clock"
-- #clock-cells : Should be 0
-- reg : Should contain registers location and length
-- clocks : Should contain phandle + clock-specifier for the parent clock
-
-Optional properties:
-- clock-output-names : Should contain clock name
-
-
-APB:
-
-Required properties:
-- compatible : Must be "moxa,moxart-apb-clock"
-- #clock-cells : Should be 0
-- reg : Should contain registers location and length
-- clocks : Should contain phandle + clock-specifier for the parent clock
-
-Optional properties:
-- clock-output-names : Should contain clock name
-
-
-For example:
-
-	clk_pll: clk_pll@98100000 {
-		compatible = "moxa,moxart-pll-clock";
-		#clock-cells = <0>;
-		reg = <0x98100000 0x34>;
-	};
-
-	clk_apb: clk_apb@98100000 {
-		compatible = "moxa,moxart-apb-clock";
-		#clock-cells = <0>;
-		reg = <0x98100000 0x34>;
-		clocks = <&clk_pll>;
-	};
diff --git a/Documentation/devicetree/bindings/clock/moxa,moxart-clock.yaml b/Documentation/devicetree/bindings/clock/moxa,moxart-clock.yaml
new file mode 100644
index 000000000000..bcf7cc240eba
--- /dev/null
+++ b/Documentation/devicetree/bindings/clock/moxa,moxart-clock.yaml
@@ -0,0 +1,38 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/clock/moxa,moxart-clock.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: MOXA ART Clock Controllers
+
+maintainers:
+  - Krzysztof Kozlowski <krzk@kernel.org>
+
+description:
+  MOXA ART SoCs allow to determine PLL output and APB frequencies by reading
+  registers holding multiplier and divisor information.
+
+properties:
+  compatible:
+    enum:
+      - moxa,moxart-apb-clock
+      - moxa,moxart-pll-clock
+
+  "#clock-cells":
+    const: 0
+
+  reg:
+    maxItems: 1
+
+  clocks:
+    maxItems: 1
+
+  clock-output-names: true
+
+additionalProperties: false
+
+required:
+  - compatible
+  - "#clock-cells"
+  - reg
diff --git a/MAINTAINERS b/MAINTAINERS
index 8a928ae141de..1dcc1b70224f 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -2893,7 +2893,7 @@ M:	Krzysztof Kozlowski <krzk@kernel.org>
 L:	linux-arm-kernel@lists.infradead.org (moderated for non-subscribers)
 S:	Odd Fixes
 F:	Documentation/devicetree/bindings/arm/moxart.yaml
-F:	Documentation/devicetree/bindings/clock/moxa,moxart-clock.txt
+F:	Documentation/devicetree/bindings/clock/moxa,moxart-clock.yaml
 F:	arch/arm/boot/dts/moxa/
 F:	drivers/clk/clk-moxart.c
 
-- 
2.47.2


