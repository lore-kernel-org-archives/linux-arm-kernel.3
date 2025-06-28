Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 72548C7EE32
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 28 Jun 2025 09:06:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Cu4UvP0WhUrIwMsfp2DxE5DkGiBKGgC1AcTaw2pOQM0=; b=eRlWfI3xYCjKNapOhhCwdZbeWB
	4Wnq9x7t9fiOgsESEso2CU+06PZITA6BT7bL4rqCyKWGseIpQpSbpTn6VhLbsY6CxzLBxOFFM+dox
	z4Yv8F9G/NL++bb/cAlR8KBuH9MyPUKKScKezbfVF2Hqa8dFy764s8zULNbGH7BIR2l/XAQvPyak3
	z9OGUeK5KRfJAlJBhjqqG2ct3xnFNRoYWeKabPlD4rYtKpzbeKGXXQxh+L+eDnFVTSgqXru+wS0Y/
	VKpbzSE5sL70A2H48/XghkTk3r/MwGZnbfhIgFEhflWoXA8GyDwXgvMQD8m336xoMgu8zY11Bwpxt
	8tqj9TCw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uVRVe-0000000GasO-1sS4;
	Sat, 28 Jun 2025 09:06:06 +0000
Received: from out-171.mta0.migadu.com ([91.218.175.171])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uVRTJ-0000000GaSa-3a2P
	for linux-arm-kernel@lists.infradead.org;
	Sat, 28 Jun 2025 09:03:43 +0000
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1751101418;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Cu4UvP0WhUrIwMsfp2DxE5DkGiBKGgC1AcTaw2pOQM0=;
	b=DowkgcTzPoMUYXNZ/UUZrHsp1Jr7ligBEq6CeLZW6hI4E4jn0jxj9D70ZfxqJjUpsmdItl
	LodzNBsOmPCpUSnNMvQXNHd9HVmQx6l3g8VGg7hjf4GKCVJfR1Oa0nqgi1c95ghq977hyG
	pvrVmjmMYcCifjyZPGyQ5BVNZ64vgEw=
From: Frank Wunderlich <frank.wunderlich@linux.dev>
To: MyungJoo Ham <myungjoo.ham@samsung.com>,
	Kyungmin Park <kyungmin.park@samsung.com>,
	Chanwoo Choi <cw00.choi@samsung.com>,
	Georgi Djakov <djakov@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Andrew Lunn <andrew@lunn.ch>,
	Vladimir Oltean <olteanv@gmail.com>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: Frank Wunderlich <frank-w@public-files.de>,
	Johnson Wang <johnson.wang@mediatek.com>,
	=?UTF-8?q?Ar=C4=B1n=C3=A7=20=C3=9CNAL?= <arinc.unal@arinc9.com>,
	Landen Chao <Landen.Chao@mediatek.com>,
	DENG Qingfang <dqfext@gmail.com>,
	Sean Wang <sean.wang@mediatek.com>,
	Daniel Golle <daniel@makrotopia.org>,
	Lorenzo Bianconi <lorenzo@kernel.org>,
	Felix Fietkau <nbd@nbd.name>,
	linux-pm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	netdev@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Subject: [PATCH v6 01/15] dt-bindings: net: mediatek,net: update for mt7988
Date: Sat, 28 Jun 2025 11:03:12 +0200
Message-ID: <20250628090330.57264-2-frank.wunderlich@linux.dev>
In-Reply-To: <20250628090330.57264-1-frank.wunderlich@linux.dev>
References: <20250628090330.57264-1-frank.wunderlich@linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250628_020342_167642_6C44BE05 
X-CRM114-Status: GOOD (  13.02  )
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

From: Frank Wunderlich <frank-w@public-files.de>

Update binding for mt7988 which has 3 gmac and a sram for dma
operations.

MT7988 has 4 FE IRQs (currently only 2 are used) and 4 IRQs for use
with RSS/LRO later.
Add interrupt-names to make them accessible by name.

Signed-off-by: Frank Wunderlich <frank-w@public-files.de>
---
v6:
- update irq(name) min count to 4
- move interrupt-names up and limiting for all socs below
- add sram-property and drop second reg entry
- drop minitems as there is only 1 item left now

v5:
- fix v4 logmessage and change description a bit describing how i get
  the irq count.
- update binding for 8 irqs with different names (rx,tx => fe0..fe3)
  including the 2 reserved irqs which can be used later
- change rx-ringX to pdmaX to be closer to hardware documentation

v4:
- increase max interrupts to 6 because of adding RSS/LRO interrupts (4)
  and dropping 2 reserved irqs (0+3) around rx+tx
- dropped Robs RB due to this change
- allow interrupt names
- add interrupt-names without reserved IRQs on mt7988
  this requires mtk driver patch:
  https://patchwork.kernel.org/project/netdevbpf/patch/20250616080738.117993-2-linux@fw-web.de/

v2:
- change reg to list of items
---
 .../devicetree/bindings/net/mediatek,net.yaml | 47 +++++++++++++++++--
 1 file changed, 44 insertions(+), 3 deletions(-)

diff --git a/Documentation/devicetree/bindings/net/mediatek,net.yaml b/Documentation/devicetree/bindings/net/mediatek,net.yaml
index 9e02fd80af83..74a139000f60 100644
--- a/Documentation/devicetree/bindings/net/mediatek,net.yaml
+++ b/Documentation/devicetree/bindings/net/mediatek,net.yaml
@@ -28,7 +28,8 @@ properties:
       - ralink,rt5350-eth
 
   reg:
-    maxItems: 1
+    items:
+      - description: Register for accessing the MACs.
 
   clocks:
     minItems: 2
@@ -40,7 +41,19 @@ properties:
 
   interrupts:
     minItems: 1
-    maxItems: 4
+    maxItems: 8
+
+  interrupt-names:
+    minItems: 1
+    items:
+      - const: fe0
+      - const: fe1
+      - const: fe2
+      - const: fe3
+      - const: pdma0
+      - const: pdma1
+      - const: pdma2
+      - const: pdma3
 
   power-domains:
     maxItems: 1
@@ -54,6 +67,10 @@ properties:
       - const: gmac
       - const: ppe
 
+  sram:
+    $ref: /schemas/types.yaml#/definitions/phandle
+    description: phandle to mmio SRAM
+
   mediatek,ethsys:
     $ref: /schemas/types.yaml#/definitions/phandle
     description:
@@ -135,6 +152,10 @@ allOf:
           minItems: 3
           maxItems: 3
 
+        interrupt-names:
+          minItems: 3
+          maxItems: 3
+
         clocks:
           minItems: 4
           maxItems: 4
@@ -166,6 +187,9 @@ allOf:
         interrupts:
           maxItems: 1
 
+        interrupt-namess:
+          maxItems: 1
+
         clocks:
           minItems: 2
           maxItems: 2
@@ -192,6 +216,10 @@ allOf:
           minItems: 3
           maxItems: 3
 
+        interrupt-names:
+          minItems: 3
+          maxItems: 3
+
         clocks:
           minItems: 11
           maxItems: 11
@@ -232,6 +260,10 @@ allOf:
           minItems: 3
           maxItems: 3
 
+        interrupt-names:
+          minItems: 3
+          maxItems: 3
+
         clocks:
           minItems: 17
           maxItems: 17
@@ -274,6 +306,9 @@ allOf:
         interrupts:
           minItems: 4
 
+        interrupt-names:
+          minItems: 4
+
         clocks:
           minItems: 15
           maxItems: 15
@@ -312,6 +347,9 @@ allOf:
         interrupts:
           minItems: 4
 
+        interrupt-names:
+          minItems: 4
+
         clocks:
           minItems: 15
           maxItems: 15
@@ -350,6 +388,9 @@ allOf:
         interrupts:
           minItems: 4
 
+        interrupt-names:
+          minItems: 4
+
         clocks:
           minItems: 24
           maxItems: 24
@@ -382,7 +423,7 @@ allOf:
             - const: xgp3
 
 patternProperties:
-  "^mac@[0-1]$":
+  "^mac@[0-2]$":
     type: object
     unevaluatedProperties: false
     allOf:
-- 
2.43.0


