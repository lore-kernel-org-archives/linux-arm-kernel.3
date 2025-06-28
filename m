Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1E49FC7EE39
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 28 Jun 2025 16:57:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Ur7OEb8O6wWAj2JmAIuRdccr+v8pY9TEOfH19t452AE=; b=x1nyIYJDwCqas/cfazXo5xvFNk
	qI7lBzTdpt4nsK+YVxak6JbnXKrtnjrwJzCJ+vF6im4l1n3G1Ixucz/28HDfnaC13dHFxmz4Uvh2N
	aZFIlcT6fmuMWfm3E2rmCB3R6xqJGF5PakfutOsoPmoc5nsJWyAlMEtDG2DSwkH4aOcTuar0Sh277
	yXfBp+qWQurfYwLaCWytOw/0jl64r12jAr1qpd4Bzr0+/V1lJu+Xdj3fR8k7yUvoJXsOdkPUlPl37
	cfmmnLZDi9VQgsP8eTKnn4narxQ8AFZwwgY03GcTy1hwXgxFKmiJpZaPO5bTuFZiDvj8F7U4DMijl
	S53Ut3nw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uVYrq-0000000H3p6-118I;
	Sat, 28 Jun 2025 16:57:30 +0000
Received: from mxout1.routing.net ([2a03:2900:1:a::a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uVYpV-0000000H3Pw-0WMB;
	Sat, 28 Jun 2025 16:55:06 +0000
Received: from mxbulk.masterlogin.de (unknown [192.168.10.85])
	by mxout1.routing.net (Postfix) with ESMTP id C82DF3FF6D;
	Sat, 28 Jun 2025 16:55:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailerdienst.de;
	s=20200217; t=1751129703;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Ur7OEb8O6wWAj2JmAIuRdccr+v8pY9TEOfH19t452AE=;
	b=jIgqKts/5yQVynjSem4QnjH1n4RBm5aaTfnElAcrXqopRAe+28xAL0q1+La+24PHbx4dwM
	Jk0v8GT2xKECfxeRKztZ1PlUn7F3zILjxwcNhOu5m0PJEsCoUU9WqPjFqTtJE1xgkQT6xy
	TcgaaP5f6KctosGot9naubNeIgUEI98=
Received: from frank-u24.. (fttx-pool-217.61.150.139.bambit.de [217.61.150.139])
	by mxbulk.masterlogin.de (Postfix) with ESMTPSA id 6B8D512272D;
	Sat, 28 Jun 2025 16:55:02 +0000 (UTC)
From: Frank Wunderlich <linux@fw-web.de>
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
Subject: [PATCH v7 01/14] dt-bindings: net: mediatek,net: allow irq names
Date: Sat, 28 Jun 2025 18:54:36 +0200
Message-ID: <20250628165451.85884-2-linux@fw-web.de>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250628165451.85884-1-linux@fw-web.de>
References: <20250628165451.85884-1-linux@fw-web.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250628_095505_451224_3F19D61D 
X-CRM114-Status: GOOD (  10.00  )
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

In preparation for MT7988 and RSS/LRO allow the interrupt-names
property. Also increase the maximum IRQ count to 8 (4 FE + 4 RSS),
but set boundaries for all compatibles same as irq count.

Signed-off-by: Frank Wunderlich <frank-w@public-files.de>
---
v7: fixed wrong rebase
v6: new patch splitted from the mt7988 changes
---
 .../devicetree/bindings/net/mediatek,net.yaml | 38 ++++++++++++++++++-
 1 file changed, 37 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/net/mediatek,net.yaml b/Documentation/devicetree/bindings/net/mediatek,net.yaml
index 9e02fd80af83..6672db206b38 100644
--- a/Documentation/devicetree/bindings/net/mediatek,net.yaml
+++ b/Documentation/devicetree/bindings/net/mediatek,net.yaml
@@ -40,7 +40,19 @@ properties:
 
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
@@ -135,6 +147,10 @@ allOf:
           minItems: 3
           maxItems: 3
 
+        interrupt-names:
+          minItems: 3
+          maxItems: 3
+
         clocks:
           minItems: 4
           maxItems: 4
@@ -166,6 +182,9 @@ allOf:
         interrupts:
           maxItems: 1
 
+        interrupt-namess:
+          maxItems: 1
+
         clocks:
           minItems: 2
           maxItems: 2
@@ -192,6 +211,10 @@ allOf:
           minItems: 3
           maxItems: 3
 
+        interrupt-names:
+          minItems: 3
+          maxItems: 3
+
         clocks:
           minItems: 11
           maxItems: 11
@@ -232,6 +255,10 @@ allOf:
           minItems: 3
           maxItems: 3
 
+        interrupt-names:
+          minItems: 3
+          maxItems: 3
+
         clocks:
           minItems: 17
           maxItems: 17
@@ -274,6 +301,9 @@ allOf:
         interrupts:
           minItems: 4
 
+        interrupt-names:
+          minItems: 4
+
         clocks:
           minItems: 15
           maxItems: 15
@@ -312,6 +342,9 @@ allOf:
         interrupts:
           minItems: 4
 
+        interrupt-names:
+          minItems: 4
+
         clocks:
           minItems: 15
           maxItems: 15
@@ -350,6 +383,9 @@ allOf:
         interrupts:
           minItems: 4
 
+        interrupt-names:
+          minItems: 4
+
         clocks:
           minItems: 24
           maxItems: 24
-- 
2.43.0


