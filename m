Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 60371D12D5D
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 11 Nov 2024 01:13:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ncCFqWimlGqPAP4WqS8YPh4bUwwhNgywrkbpybg1Ts8=; b=kkkmjL1OOCfJPzRIAoVL6t4A7T
	YEDIsXTr4veon/xdjfrP7sFI8jnxQghupdvK0xFLpfMwYnshWOawjpAI6FO8SnyybzI3+qvxNYCqy
	s00c0NfJ2SVGOelow5utMv1IyTFTo2slihhLnBsHMAmvcEU9juZzPQ3eb08yGu7oyFLN003x/TUu3
	l0dLaAWPViFjlwUXyhR8Sn4GXeWrytlJHBq+esHnihsGxZ1bfueApHZ1VcrU0KVnCIeOZ1t/HqoEb
	FTLzEKeSrFftax5r6fhZtrrlwqs+dvo5rWYZCk622clPwmxhPc+i/caoO7uPtuSSTKxYscnNI5AHe
	CtYlu6mQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tAIzn-0000000G0Nu-34nJ;
	Mon, 11 Nov 2024 01:13:36 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tAIkr-0000000FyZS-1seC
	for linux-arm-kernel@lists.infradead.org;
	Mon, 11 Nov 2024 00:58:11 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 9406D13D5;
	Sun, 10 Nov 2024 16:58:38 -0800 (PST)
Received: from localhost.localdomain (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 0C02C3F66E;
	Sun, 10 Nov 2024 16:58:06 -0800 (PST)
From: Andre Przywara <andre.przywara@arm.com>
To: Linus Walleij <linus.walleij@linaro.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Chen-Yu Tsai <wens@csie.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>
Cc: linux-gpio@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH 5/7] dt-bindings: pinctrl: add compatible for Allwinner A523/T527
Date: Mon, 11 Nov 2024 00:57:48 +0000
Message-ID: <20241111005750.13071-6-andre.przywara@arm.com>
X-Mailer: git-send-email 2.46.2
In-Reply-To: <20241111005750.13071-1-andre.przywara@arm.com>
References: <20241111005750.13071-1-andre.przywara@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241110_165809_599840_B089812B 
X-CRM114-Status: GOOD (  10.31  )
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

The A523 contains a pin controller similar to previous SoCs, although
using 10 GPIO banks (PortB-PortK), all of them being IRQ capable.
This introduces a new style of binding, where the pinmux values for each
pin group is stored in the new "allwinner,pinmux" property in the DT
node, instead of requiring every driver to store a mapping between the
function names and the required pinmux.

Add the new name to the list of compatible strings, and required it to
have 10 interrupts described. Also add the new pinmux property.

Signed-off-by: Andre Przywara <andre.przywara@arm.com>
---
 .../pinctrl/allwinner,sun4i-a10-pinctrl.yaml  | 23 +++++++++++++++++--
 1 file changed, 21 insertions(+), 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/pinctrl/allwinner,sun4i-a10-pinctrl.yaml b/Documentation/devicetree/bindings/pinctrl/allwinner,sun4i-a10-pinctrl.yaml
index 4502405703145..6fc18e92e1e94 100644
--- a/Documentation/devicetree/bindings/pinctrl/allwinner,sun4i-a10-pinctrl.yaml
+++ b/Documentation/devicetree/bindings/pinctrl/allwinner,sun4i-a10-pinctrl.yaml
@@ -56,6 +56,8 @@ properties:
       - allwinner,sun50i-h6-r-pinctrl
       - allwinner,sun50i-h616-pinctrl
       - allwinner,sun50i-h616-r-pinctrl
+      - allwinner,sun55i-a523-pinctrl
+      - allwinner,sun55i-a523-r-pinctrl
       - allwinner,suniv-f1c100s-pinctrl
       - nextthing,gr8-pinctrl
 
@@ -64,7 +66,7 @@ properties:
 
   interrupts:
     minItems: 1
-    maxItems: 8
+    maxItems: 10
     description:
       One interrupt per external interrupt bank supported on the
       controller, sorted by bank number ascending order.
@@ -119,13 +121,17 @@ patternProperties:
         $ref: /schemas/types.yaml#/definitions/uint32
         enum: [10, 20, 30, 40]
 
+      allwinner,pinmux:
+        $ref: /schemas/types.yaml#/definitions/uint32-array
+        description: pinmux selector for each pin
+
     required:
       - pins
       - function
 
     additionalProperties: false
 
-  "^vcc-p[a-ilm]-supply$":
+  "^vcc-p[a-klm]-supply$":
     description:
       Power supplies for pin banks.
 
@@ -156,6 +162,17 @@ allOf:
         - interrupts
         - interrupt-controller
 
+  - if:
+      properties:
+        compatible:
+          enum:
+            - allwinner,sun55i-a523-pinctrl
+
+    then:
+      properties:
+        interrupts:
+          minItems: 10
+
   - if:
       properties:
         compatible:
@@ -166,6 +183,7 @@ allOf:
       properties:
         interrupts:
           minItems: 8
+          maxItems: 8
 
   - if:
       properties:
@@ -244,6 +262,7 @@ allOf:
             - allwinner,sun8i-v3s-pinctrl
             - allwinner,sun9i-a80-r-pinctrl
             - allwinner,sun50i-h6-r-pinctrl
+            - allwinner,sun55i-a523-r-pinctrl
 
     then:
       properties:
-- 
2.46.2


