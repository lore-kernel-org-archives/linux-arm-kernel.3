Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5E402C83F09
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  9 Jul 2025 13:35:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Q5oYVbNPFfzoohPL6ayLqmjVRgDniDHqGOnI/CRFHHI=; b=x6Jkn4mQaLDK3VYdaSRugoOog9
	7p6ifqWPfs2uUzlyM1IjFT9nYE/Qp4hbO3jDaoDbrTuZMbc59pz4VY9zF8kCAWMcMA4Q23P8bzM5d
	qHZLdt7U3+mf1E7R6fHTGlz3t+lAKqOpDA+R3VTtKHDUa+DIFqsKl5IXw4KnblUKPf5dRwg1lv4VO
	0fPdrsp2kwvSUIB7bHyoIweXVFZhuHNbz/3LWSmjSYgmVJtihoUJHeqMiGjprDX4TWRfvrzd2IYoL
	mBkuykE0botXBxjfDU39ml3HDfAcbD3qQ6zzIgI00Iw+E2Q6wTtP4nnk6IaZvRX9RWAW71cOFJTmW
	RF1+TDhw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uZUxa-00000008nlK-0AOS;
	Wed, 09 Jul 2025 13:35:42 +0000
Received: from mxout3.routing.net ([2a03:2900:1:a::8])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uZSiW-00000008S9m-45D1;
	Wed, 09 Jul 2025 11:12:02 +0000
Received: from mxbulk.masterlogin.de (unknown [192.168.10.85])
	by mxout3.routing.net (Postfix) with ESMTP id 1A15A60FC0;
	Wed,  9 Jul 2025 11:11:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailerdienst.de;
	s=20200217; t=1752059517;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Q5oYVbNPFfzoohPL6ayLqmjVRgDniDHqGOnI/CRFHHI=;
	b=cPzLell4YaPiY1K/gXjudjgwVWJ0gjgm298qVUHPOYxFFxuVjSrq56FO5j7cLj8WdB3eej
	CZ5r8f4/wXoELm1glyIDDlsxJqBu/cQX3WAcse7+JG0fdWW5kd/7oHnf8uah0t67lh172X
	wcEWFD/CEU3oGeI2MTNHxWf0u/0o/tU=
Received: from frank-u24.. (fttx-pool-217.61.157.99.bambit.de [217.61.157.99])
	by mxbulk.masterlogin.de (Postfix) with ESMTPSA id B36511226D4;
	Wed,  9 Jul 2025 11:11:56 +0000 (UTC)
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
Subject: [PATCH v9 02/13] dt-bindings: net: mediatek,net: allow up to 8 IRQs
Date: Wed,  9 Jul 2025 13:09:38 +0200
Message-ID: <20250709111147.11843-3-linux@fw-web.de>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250709111147.11843-1-linux@fw-web.de>
References: <20250709111147.11843-1-linux@fw-web.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250709_041201_175386_422E356E 
X-CRM114-Status: GOOD (  11.66  )
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

Increase the maximum IRQ count to 8 (4 FE + 4 RSS/LRO).

Frame-engine-IRQs (max 4):
MT7621, MT7628: 1 FE-IRQ
MT7622, MT7623: 3 FE-IRQs (only two used by the driver for now)
MT7981, MT7986, MT7988: 4 FE-IRQs (only two used by the driver for now)

Mediatek Filogic SoCs (mt798x) have 4 additional IRQs for RSS and/or
LRO. So MT798x have 8 IRQs in total.

MT7981 does not have a ethernet-node yet.
MT7986 Ethernet node is updated with RSS/LRO IRQs in this series.
MT7988 Ethernet node is added in this series.

Signed-off-by: Frank Wunderlich <frank-w@public-files.de>
---
v9:
- set interrupt minitems to 8 for filogic
  - mt7981 does not have a ethernet node yet, so no ABI break
  - devicetree for mt7986 is updated later in this series, ABI-Break,
    but RSS/LRO should use interrupt names and is simply disabled when
    using older DT
- extend mt7986 example with PDMA-IRQs because minItems now 8
v8: separate irq-count change from interrupt-names patch
---
 .../devicetree/bindings/net/mediatek,net.yaml      | 14 +++++++++-----
 1 file changed, 9 insertions(+), 5 deletions(-)

diff --git a/Documentation/devicetree/bindings/net/mediatek,net.yaml b/Documentation/devicetree/bindings/net/mediatek,net.yaml
index 175d1d011dc6..99dc0401eb9a 100644
--- a/Documentation/devicetree/bindings/net/mediatek,net.yaml
+++ b/Documentation/devicetree/bindings/net/mediatek,net.yaml
@@ -40,7 +40,7 @@ properties:
 
   interrupts:
     minItems: 1
-    maxItems: 4
+    maxItems: 8
 
   power-domains:
     maxItems: 1
@@ -272,7 +272,7 @@ allOf:
     then:
       properties:
         interrupts:
-          minItems: 4
+          minItems: 8
 
         clocks:
           minItems: 15
@@ -310,7 +310,7 @@ allOf:
     then:
       properties:
         interrupts:
-          minItems: 4
+          minItems: 8
 
         clocks:
           minItems: 15
@@ -348,7 +348,7 @@ allOf:
     then:
       properties:
         interrupts:
-          minItems: 4
+          minItems: 8
 
         clocks:
           minItems: 24
@@ -507,7 +507,11 @@ examples:
         interrupts = <GIC_SPI 196 IRQ_TYPE_LEVEL_HIGH>,
                      <GIC_SPI 197 IRQ_TYPE_LEVEL_HIGH>,
                      <GIC_SPI 198 IRQ_TYPE_LEVEL_HIGH>,
-                     <GIC_SPI 199 IRQ_TYPE_LEVEL_HIGH>;
+                     <GIC_SPI 199 IRQ_TYPE_LEVEL_HIGH>,
+                     <GIC_SPI 189 IRQ_TYPE_LEVEL_HIGH>,
+                     <GIC_SPI 190 IRQ_TYPE_LEVEL_HIGH>,
+                     <GIC_SPI 191 IRQ_TYPE_LEVEL_HIGH>,
+                     <GIC_SPI 192 IRQ_TYPE_LEVEL_HIGH>;
         clocks = <&ethsys CLK_ETH_FE_EN>,
                  <&ethsys CLK_ETH_GP2_EN>,
                  <&ethsys CLK_ETH_GP1_EN>,
-- 
2.43.0


