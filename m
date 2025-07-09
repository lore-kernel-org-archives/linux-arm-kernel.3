Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 808A4C83F03
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  9 Jul 2025 13:47:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=N5yOskSQPOfeXqxzAKp+ra3y71xfGoumsHkxo/gxJUM=; b=RawNeFLMeOIlBUDOackto7gbFh
	zJZxxNe3WiHhe8BU5kD7nvNqAXrsAptAuVbNFtZ+N7qZ4WWpc6aRv0SWMcY/8cR3oK1V91cDa8JKV
	/MzXkk6uOnKBWfnQIDE4HBL6o3idzdY9hLRt1jkjMPvI3Nu7VUgsz250G6ONbKDJ67dwEvUr8HEow
	b1OMHs88W06MYDIa7KZd74J78HILHclNLkiu9Uv8xQY97ijbvxyGF1CHXuuJ22pCDTMwBIlca5XQ/
	ebydy+pBrnGdv7BTlK7WaFKQhnZX4s/m8FwikbusHS/ab4jeuMc74I/+DVoI8aQ/HJdVYRiBA/kfn
	GcyMqSRw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uZV96-00000008pUJ-22yH;
	Wed, 09 Jul 2025 13:47:36 +0000
Received: from mxout2.routing.net ([2a03:2900:1:a::b])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uZSiX-00000008S9p-14Fw;
	Wed, 09 Jul 2025 11:12:04 +0000
Received: from mxbulk.masterlogin.de (unknown [192.168.10.85])
	by mxout2.routing.net (Postfix) with ESMTP id DDE0B603F9;
	Wed,  9 Jul 2025 11:11:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailerdienst.de;
	s=20200217; t=1752059518;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=N5yOskSQPOfeXqxzAKp+ra3y71xfGoumsHkxo/gxJUM=;
	b=RFZxMvmJ/Twz30DHlBhpB9sfybpktL4WYCl7NgYMWsNRwcZuVmxR5ajqPh1IUrsRuw0ygK
	qr5+9Y96dApHHtjMLEqvbZ0oWSUOarZzTdZ+UP/ja1ac1M4sPMB0tC4gy0UeP1Yq+MVE03
	p6jIOaP2TlwfiuMU6e1OlHjYl6FDUi4=
Received: from frank-u24.. (fttx-pool-217.61.157.99.bambit.de [217.61.157.99])
	by mxbulk.masterlogin.de (Postfix) with ESMTPSA id 867901226D4;
	Wed,  9 Jul 2025 11:11:57 +0000 (UTC)
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
Subject: [PATCH v9 04/13] dt-bindings: net: mediatek,net: add sram property
Date: Wed,  9 Jul 2025 13:09:40 +0200
Message-ID: <20250709111147.11843-5-linux@fw-web.de>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250709111147.11843-1-linux@fw-web.de>
References: <20250709111147.11843-1-linux@fw-web.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250709_041201_447170_4CA81395 
X-CRM114-Status: GOOD (  12.35  )
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

Meditak Filogic SoCs (MT798x) have dedicated MMIO-SRAM for dma operations.

MT7981 and MT7986 currently use static offset to ethernet MAC register
which will be changed in separate patch once this way is accepted.

Add "sram" property to map ethernet controller to dedicated mmio-sram node.

Signed-off-by: Frank Wunderlich <frank-w@public-files.de>
Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
---
v9:
- add "sram: false" for non-filogic

v8:
- splitted out mac subnode pattern
- dropped reg naming change
- rephrased description
- drop change of reg-name

v6:
- split out the interrupt-names into separate patch
- update irq(name) min count to 4
- add sram-property
- drop second reg entry and minitems as there is only 1 item left again

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
 .../devicetree/bindings/net/mediatek,net.yaml        | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/Documentation/devicetree/bindings/net/mediatek,net.yaml b/Documentation/devicetree/bindings/net/mediatek,net.yaml
index d2b5461e73bc..b45f67f92e80 100644
--- a/Documentation/devicetree/bindings/net/mediatek,net.yaml
+++ b/Documentation/devicetree/bindings/net/mediatek,net.yaml
@@ -66,6 +66,10 @@ properties:
       - const: gmac
       - const: ppe
 
+  sram:
+    $ref: /schemas/types.yaml#/definitions/phandle
+    description: phandle to mmio SRAM
+
   mediatek,ethsys:
     $ref: /schemas/types.yaml#/definitions/phandle
     description:
@@ -162,6 +166,8 @@ allOf:
             - const: gp1
             - const: gp2
 
+        sram: false
+
         mediatek,infracfg: false
 
         mediatek,wed: false
@@ -194,6 +200,8 @@ allOf:
             - const: ethif
             - const: fe
 
+        sram: false
+
         mediatek,infracfg: false
 
         mediatek,wed: false
@@ -233,6 +241,8 @@ allOf:
             - const: sgmii_ck
             - const: eth2pll
 
+        sram: false
+
         mediatek,infracfg: false
 
         mediatek,sgmiisys:
@@ -283,6 +293,8 @@ allOf:
             - const: sgmii_ck
             - const: eth2pll
 
+        sram: false
+
         mediatek,sgmiisys:
           minItems: 2
           maxItems: 2
-- 
2.43.0


