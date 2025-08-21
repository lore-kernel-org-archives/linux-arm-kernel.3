Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DB3D6CA0EE6
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 21 Aug 2025 03:38:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=3oHLV6hWd8rqqo6hRqGJ9+xnWq3M5YWLY8rCL7yfgPw=; b=dKbJaEMcpn+//9GMYC85z7F8cN
	KGm0yCekary3WnGJzPKllbprvy+ON1TTIP8KvoFwK+gKCUu4J72hXfppha0a5ouCnTW3+GWcObH7z
	ei1uzWZ723yK1STktVOoHA+KN7VUjLwuaMm93agYPd2lDouzmxtvEcUzHxrI+DULq8aFbvHzL8IKF
	ufo87giHHpTQ2lG0a7CShUqnIYN6fwisf5N6h7toPWh9bFrkBMjNFVz7IpOpvXK0IpvnT7yYVg2Le
	rajwgCj8GhYrTpoS1Ic0QJzZ5BrDMpI9rdbDQHq59nhUaMzJssOzZw7bbxv+0dToCTLMM0i3pKapd
	3E3TJAqA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uow7w-0000000Fe7y-2fn2;
	Thu, 21 Aug 2025 03:38:12 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uotRF-0000000FKYy-0Fs5
	for linux-arm-kernel@lists.infradead.org;
	Thu, 21 Aug 2025 00:45:58 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 69EA212FC;
	Wed, 20 Aug 2025 17:45:48 -0700 (PDT)
Received: from localhost.localdomain (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id A981A3F63F;
	Wed, 20 Aug 2025 17:45:54 -0700 (PDT)
From: Andre Przywara <andre.przywara@arm.com>
To: Linus Walleij <linus.walleij@linaro.org>,
	Chen-Yu Tsai <wens@csie.org>,
	Samuel Holland <samuel@sholland.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>
Cc: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Yixun Lan <dlan@gentoo.org>,
	linux-gpio@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev
Subject: [RFC PATCH 7/9] dt-bindings: pinctrl: add compatible for Allwinner A733
Date: Thu, 21 Aug 2025 01:42:30 +0100
Message-ID: <20250821004232.8134-8-andre.przywara@arm.com>
X-Mailer: git-send-email 2.46.3
In-Reply-To: <20250821004232.8134-1-andre.przywara@arm.com>
References: <20250821004232.8134-1-andre.przywara@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250820_174557_136819_E94435B6 
X-CRM114-Status: GOOD (  12.54  )
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

The A733 contains a pin controller similar to previous SoCs, although
with a change in the MMIO register frame layout.
This SoC uses the new style of DT binding, where the pinmux values for
each pin group are stored in the new "allwinner,pinmux" property in the
DT node.

Add the new compatible to the existing A523 binding, since they share a
lot of features, including the number of banks and clocks.

Signed-off-by: Andre Przywara <andre.przywara@arm.com>
---
 .../bindings/pinctrl/allwinner,sun55i-a523-pinctrl.yaml     | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/pinctrl/allwinner,sun55i-a523-pinctrl.yaml b/Documentation/devicetree/bindings/pinctrl/allwinner,sun55i-a523-pinctrl.yaml
index 154e03da8ce98..c04b04acf6e45 100644
--- a/Documentation/devicetree/bindings/pinctrl/allwinner,sun55i-a523-pinctrl.yaml
+++ b/Documentation/devicetree/bindings/pinctrl/allwinner,sun55i-a523-pinctrl.yaml
@@ -4,7 +4,7 @@
 $id: http://devicetree.org/schemas/pinctrl/allwinner,sun55i-a523-pinctrl.yaml#
 $schema: http://devicetree.org/meta-schemas/core.yaml#
 
-title: Allwinner A523 Pin Controller
+title: Allwinner A523 & A733 Pin Controller
 
 maintainers:
   - Andre Przywara <andre.przywara@arm.com>
@@ -28,6 +28,8 @@ properties:
     enum:
       - allwinner,sun55i-a523-pinctrl
       - allwinner,sun55i-a523-r-pinctrl
+      - allwinner,sun60i-a733-pinctrl
+      - allwinner,sun60i-a733-r-pinctrl
 
   reg:
     maxItems: 1
@@ -126,6 +128,7 @@ allOf:
         compatible:
           enum:
             - allwinner,sun55i-a523-pinctrl
+            - allwinner,sun60i-a733-pinctrl
 
     then:
       properties:
@@ -138,6 +141,7 @@ allOf:
         compatible:
           enum:
             - allwinner,sun55i-a523-r-pinctrl
+            - allwinner,sun60i-a733-r-pinctrl
 
     then:
       properties:
-- 
2.46.3


