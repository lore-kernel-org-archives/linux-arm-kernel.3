Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7EA99C83F03
	for <linux-arm-kernel@archiver.kernel.org>; Sun,  6 Jul 2025 13:29:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=71EqQ6Np0u0pAiJm9Ys2o5R9RiJdK+KyILbtVMDBcO0=; b=v0FktdZz8HPYFz4mLSa5i/HgL/
	drNfVcxvKtzwXi1UdzwsLyo3dx/s561d/7G/ovl50QCr/Q6buwCec1PeP7eDh1kNdr2AOZ9EQwial
	6QZIW+aMYBxSmlRg8m4y3qrLk/an4tCZZEdUK70elNkaujlj7UTQR26DOo0Dyr9FBVS65VpsdUzP+
	AyU6I+CTbP9BgG5rq7vNmLrth2kMQ5XAGito6VVRxCHY5pO1L3g6Af442Dmd3DjMME9mesXllIt/4
	Kh6lgMK00kS8m6b5RDWZSZhjx7zgor/KbYAxPLqtPJJ7xlOiU8o+qc6co1Jtmv1W5/f+hW0c2nF++
	qs0ylHFg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uYPRB-00000000Ipx-2sao;
	Sun, 06 Jul 2025 13:29:45 +0000
Received: from mxout4.routing.net ([2a03:2900:1:a::9])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uYPKC-00000000Hjc-0tzc;
	Sun, 06 Jul 2025 13:22:34 +0000
Received: from mxbulk.masterlogin.de (unknown [192.168.10.85])
	by mxout4.routing.net (Postfix) with ESMTP id 2FABD100813;
	Sun,  6 Jul 2025 13:22:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailerdienst.de;
	s=20200217; t=1751808148;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=71EqQ6Np0u0pAiJm9Ys2o5R9RiJdK+KyILbtVMDBcO0=;
	b=d7WKfi7xOy9dRKe30aW0RihUiYxjU3MrC1XaYr0/tT8J6vYKj/UBt84kkBGaknzIVqSyTb
	3HPTIyhYkM9e9GstWQrAS+nKatQyc0njUiqilY8nnhKg8/OHa3fxyxc0NdgZEzKT7K9m4E
	zZArF2M7VlVKH7nZIJosywqrr6O7Cp8=
Received: from frank-u24.. (fttx-pool-194.15.86.111.bambit.de [194.15.86.111])
	by mxbulk.masterlogin.de (Postfix) with ESMTPSA id CBFBB1226F8;
	Sun,  6 Jul 2025 13:22:27 +0000 (UTC)
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
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Johnson Wang <johnson.wang@mediatek.com>,
	=?UTF-8?q?Ar=C4=B1n=C3=A7=20=C3=9CNAL?= <arinc.unal@arinc9.com>,
	Landen Chao <Landen.Chao@mediatek.com>,
	DENG Qingfang <dqfext@gmail.com>,
	Sean Wang <sean.wang@mediatek.com>,
	Daniel Golle <daniel@makrotopia.org>,
	Lorenzo Bianconi <lorenzo@kernel.org>,
	Felix Fietkau <nbd@nbd.name>
Cc: Frank Wunderlich <frank-w@public-files.de>,
	linux-pm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	netdev@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Subject: [PATCH v8 03/16] dt-bindings: net: mediatek,net: allow irq names
Date: Sun,  6 Jul 2025 15:21:58 +0200
Message-ID: <20250706132213.20412-4-linux@fw-web.de>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250706132213.20412-1-linux@fw-web.de>
References: <20250706132213.20412-1-linux@fw-web.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250706_062232_396422_E8B45DE8 
X-CRM114-Status: GOOD (  11.78  )
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
property.
In this way driver can request the interrupts by name which is much
more readable in the driver code and SoC's dtsi than relying on a
specific order.

Frame-engine-IRQs (fe0..3):
MT7621, MT7628: 1 IRQ
MT7622, MT7623: 3 IRQs (only two used by the driver for now)
MT7981, MT7986: 4 IRQs (only two used by the driver for now)

RSS/LRO IRQs (pdma0..3) only on Filogic (MT798x) with count of 4.

Set boundaries for all compatibles same as irq count.

Signed-off-by: Frank Wunderlich <frank-w@public-files.de>
---
v8:
  - fixed typo in mt7621 section "interrupt-namess"
  - separated interrupt count from interrupt-names
  - rephrased description a bit to explain the "why"
v7: fixed wrong rebase
v6: new patch splitted from the mt7988 changes
---
 .../devicetree/bindings/net/mediatek,net.yaml | 36 +++++++++++++++++++
 1 file changed, 36 insertions(+)

diff --git a/Documentation/devicetree/bindings/net/mediatek,net.yaml b/Documentation/devicetree/bindings/net/mediatek,net.yaml
index 766224e4ed86..da7bda20786a 100644
--- a/Documentation/devicetree/bindings/net/mediatek,net.yaml
+++ b/Documentation/devicetree/bindings/net/mediatek,net.yaml
@@ -42,6 +42,18 @@ properties:
     minItems: 1
     maxItems: 8
 
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
+
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
 
+        interrupt-names:
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


