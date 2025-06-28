Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8CB5FC54ED1
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 28 Jun 2025 09:08:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=r/pxDHLdKM59vQwtrSmRPlY+HDheivtQ/80IDfz7MYk=; b=LmR9qAQfsnQgVraoX9C9+OJ70S
	L3B6cZetzuM/CYN5He/EwPije7tbFhLv+/F/0nO1Rth8ytYZ7DkNYXymz6bDxAvQ4KBSyzRnhPzWN
	ZVUCit65BGs1VXwjYLETwO0UAsS/6sSoFR3wwufeWYDyjOEbS62vE6118ZJdnMuq2aHCtDrPEbUzT
	XP/Jozz/fl1eOkfDhZ2d7k62JAwtJKeLC9Z9ZPaNzAXNjjXEH6AquVwAmH2UfvH/xfWvqTCLUpTB9
	h3ei8SHrFAIoq6dwUTLlqNbIOxO1R/zlEIhK7s5Beqqv3mCDBTohtTg/qhdP7oUBfqgp7w047vrHE
	oAc+Mozw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uVRXu-0000000Gb1T-2FTu;
	Sat, 28 Jun 2025 09:08:26 +0000
Received: from out-174.mta0.migadu.com ([2001:41d0:1004:224b::ae])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uVRTL-0000000GaSw-0wky
	for linux-arm-kernel@lists.infradead.org;
	Sat, 28 Jun 2025 09:03:44 +0000
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1751101421;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=r/pxDHLdKM59vQwtrSmRPlY+HDheivtQ/80IDfz7MYk=;
	b=uiKRNm9qcS9nl7TbUPDs9XyqHBP69P8tY6XgbwKXzAUcPGRByiDW8nx7bXlciNWa5y9ezr
	WcLoIo8Uki7XCiPD39P4KrMxBrLxf/sXRstzT4ASxIH7tMp8XKoUGvol+Q2KW26wgJV7oO
	0AOmwxC/N0AIsR0Us1hSjEcwDwzjp6k=
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
Subject: [PATCH v6 02/15] dt-bindings: net: mediatek,net: allow irq names
Date: Sat, 28 Jun 2025 11:03:13 +0200
Message-ID: <20250628090330.57264-3-frank.wunderlich@linux.dev>
In-Reply-To: <20250628090330.57264-1-frank.wunderlich@linux.dev>
References: <20250628090330.57264-1-frank.wunderlich@linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250628_020343_403656_29AB82F5 
X-CRM114-Status: UNSURE (   9.56  )
X-CRM114-Notice: Please train this message.
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
v6: new patch splitted from the mt7988 changes
---
 Documentation/devicetree/bindings/net/mediatek,net.yaml | 9 ++-------
 1 file changed, 2 insertions(+), 7 deletions(-)

diff --git a/Documentation/devicetree/bindings/net/mediatek,net.yaml b/Documentation/devicetree/bindings/net/mediatek,net.yaml
index 74a139000f60..6672db206b38 100644
--- a/Documentation/devicetree/bindings/net/mediatek,net.yaml
+++ b/Documentation/devicetree/bindings/net/mediatek,net.yaml
@@ -28,8 +28,7 @@ properties:
       - ralink,rt5350-eth
 
   reg:
-    items:
-      - description: Register for accessing the MACs.
+    maxItems: 1
 
   clocks:
     minItems: 2
@@ -67,10 +66,6 @@ properties:
       - const: gmac
       - const: ppe
 
-  sram:
-    $ref: /schemas/types.yaml#/definitions/phandle
-    description: phandle to mmio SRAM
-
   mediatek,ethsys:
     $ref: /schemas/types.yaml#/definitions/phandle
     description:
@@ -423,7 +418,7 @@ allOf:
             - const: xgp3
 
 patternProperties:
-  "^mac@[0-2]$":
+  "^mac@[0-1]$":
     type: object
     unevaluatedProperties: false
     allOf:
-- 
2.43.0


