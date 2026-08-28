Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C5AB9C61DCB
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 28 Aug 2026 15:12:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=nqJvjnSgNcu7LOjhXQ4TcxEYeLL+w8iL+osguagx5CA=; b=Wlz41GH8s6PSk9XWwSLmkmqvMv
	uLNB6UvUnUJpSE+o0Vhzj0x/gdgOjr6+NuwKzDsc7e8kuNKA7RjgVO/0O4tEiWkilbjxZlzvFGqaq
	Q/oEvXa0hOAwd0lCibgYBSRxn7TCjWF2dfEslteRS7bbVBlZ6bLu50tychtVYzs/9OtW5H3GAXfTI
	BggxON37PbRMqhreWcCUfGWg1AXkrtdtE4j/49VKQPy/8u8N2Yyy0j4PCvn8dHe/xe3IIA7y7dHxb
	YwD+VVcjs0FsA7wC8XWucvI9CtZXq5p/a5GW8chgzMu/VGAGKBVJ4fSNS7M81eSxIhpu8Ffkwp6WW
	puQkIajg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wzyFo-000000064FP-2SS1;
	Fri, 28 Aug 2026 15:12:28 +0000
Received: from mx.nabladev.com ([2a00:f820:417:0:178:251:229:89])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wzyFl-000000064Es-1WU7
	for linux-arm-kernel@lists.infradead.org;
	Fri, 28 Aug 2026 15:12:27 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id B22F111C69C;
	Fri, 28 Aug 2026 17:12:18 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nabladev.com;
	s=dkim; t=1787929939; h=from:subject:date:message-id:to:cc:mime-version:
	 content-transfer-encoding; bh=nqJvjnSgNcu7LOjhXQ4TcxEYeLL+w8iL+osguagx5CA=;
	b=KInLMAVEjQgciEXqRPliH/0FpqK0nC5ufVhuheIFlfe1/Rs78/8qh4p4fxvzD2IjjaaGnr
	RjobcgkmNiS1tKzmj2KufS8QLBRFddboboOPT205tixqWpUr4k6fvtAsMyy7rlYnIerQl6
	aWuCuwvERFao2kfPop5hn+EH4IvM+6v6TclwuVsi0a6SmYb4BNyLVaM8BemBM22TfLDffM
	K8yyz1X/LcqRZjMu8LwsW9WNaNcHRANu7WfQomvvzS4HgZ08ePX2yLGJXr8zTszwig9/b5
	jXuIy3VobCQ3qpr5/CadWr59tM4LOSi+nmYPoLa/6/9pJyN7b+rkA+mBmpMfpg==
From: Marek Vasut <marex@nabladev.com>
To: linux-arm-kernel@lists.infradead.org
Cc: Marek Vasut <marex@nabladev.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Christophe Roullier <christophe.roullier@foss.st.com>,
	Conor Dooley <conor+dt@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Raphael Gallais-Pou <raphael.gallais-pou@foss.st.com>,
	Rob Herring <robh@kernel.org>,
	Yannick Fertre <yannick.fertre@foss.st.com>,
	devicetree@vger.kernel.org,
	kernel@dh-electronics.com,
	linux-kernel@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com
Subject: [PATCH v4 1/2] dt-bindings: arm: stm32: Document st,stm32mp23/25-syscfg subnodes and cells
Date: Fri, 28 Aug 2026 17:11:14 +0200
Message-ID: <20260828151216.175020-1-marex@nabladev.com>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260828_081225_723943_499A2FC2 
X-CRM114-Status: GOOD (  10.09  )
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

The st,stm32mp23-syscfg and st,stm32mp25-syscfg can have subnodes, which
represent the USB 2.0 FEMTO-PHY. Document subnodes pattern properties and
address/size cells.

Signed-off-by: Marek Vasut <marex@nabladev.com>
---
Cc: Alexandre Torgue <alexandre.torgue@foss.st.com>
Cc: Christophe Roullier <christophe.roullier@foss.st.com>
Cc: Conor Dooley <conor+dt@kernel.org>
Cc: Krzysztof Kozlowski <krzk+dt@kernel.org>
Cc: Marek Vasut <marex@nabladev.com>
Cc: Maxime Coquelin <mcoquelin.stm32@gmail.com>
Cc: Raphael Gallais-Pou <raphael.gallais-pou@foss.st.com>
Cc: Rob Herring <robh@kernel.org>
Cc: Yannick Fertre <yannick.fertre@foss.st.com>
Cc: devicetree@vger.kernel.org
Cc: kernel@dh-electronics.com
Cc: linux-arm-kernel@lists.infradead.org
Cc: linux-kernel@vger.kernel.org
Cc: linux-stm32@st-md-mailman.stormreply.com
---
V2: New patch
V3: Fix the bindings
V4: - Undo simple-mfd in favor of dedicated SYSCFG SoC driver
    - Update commit message to match, this used to be patch
      dt-bindings: arm: stm32: Switch st,stm32mp23/25-syscfg into simple-mfd
    - Split this from series arm64: dts: phy: st: usb: Add STM32MP2 USB support
      https://lore.kernel.org/all/20260822074816.548662-1-marex@nabladev.com/
---
 .../bindings/arm/stm32/st,stm32-syscon.yaml     | 17 ++++++++++++++++-
 1 file changed, 16 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/arm/stm32/st,stm32-syscon.yaml b/Documentation/devicetree/bindings/arm/stm32/st,stm32-syscon.yaml
index 95d2319afe235..d82afa39960b9 100644
--- a/Documentation/devicetree/bindings/arm/stm32/st,stm32-syscon.yaml
+++ b/Documentation/devicetree/bindings/arm/stm32/st,stm32-syscon.yaml
@@ -39,6 +39,17 @@ properties:
   "#clock-cells":
     const: 0
 
+  "#address-cells":
+    const: 1
+
+  "#size-cells":
+    const: 1
+
+patternProperties:
+  "^phy@[0-9a-f]+$":
+    type: object
+    $ref: /schemas/phy/st,stm32-usb2phy.yaml
+
 required:
   - compatible
   - reg
@@ -57,10 +68,14 @@ allOf:
   - if:
       properties:
         compatible:
-          const: st,stm32mp25-syscfg
+          enum:
+            - st,stm32mp23-syscfg
+            - st,stm32mp25-syscfg
     then:
       required:
         - "#clock-cells"
+        - "#address-cells"
+        - "#size-cells"
 
 additionalProperties: false
 
-- 
2.53.0


