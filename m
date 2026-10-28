Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 555F3606A31E
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 28 Oct 2026 01:14:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=3jUB/QMH;
	dkim=pass (2048-bit key, unprotected) header.d=cjdns.fr header.i=@cjdns.fr header.a=rsa-sha256 header.s=dkim header.b=GJZYhmSY
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=7mGz9c5j7qfN9eG7dQvgcA1AagbKKPWBpRjHm9HlsGI=; b=3jUB/QMH9pvOx/
	3g9uOb9qTzdT/Xy173RuQQ+58ua95DSfdqN4ZpRRO/v3ulIm6MJ5AFguXoaPgLWI6yheFT7uK9e5I
	VNxGNsbAMbwRZQbtu2iAU+4ZbtMszspatYmT4GHl+wMLVPIT9J+EfMWWwRoWYS+D/73yGsM/SuQOO
	9i22/oiggtB5ndpTqG9GUyN0igNyujOg5oBqqtbG4FILTW01hDTb7zR3V2k4D2PPjG9DQ2X/feuNT
	g/EatWQtxFYcgTP+9lwNNftnefCiSCX6p2/kkNa0wSuKcX/AoA5b8h99DfR/uZ7klTZAhIoPIMLFu
	pC28QJ7iSfUZCdeleq6Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xLsF2-000000061Fu-0QPh;
	Wed, 28 Oct 2026 01:14:12 +0000
Received: from mail.cjdns.fr ([5.135.140.105])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xLsEu-0000000613n-17Ls;
	Wed, 28 Oct 2026 01:14:05 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id A984F149C1A;
	Wed, 28 Oct 2026 02:13:58 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cjdns.fr; s=dkim;
	t=1793150041; h=from:subject:date:message-id:to:cc:mime-version:
	 content-transfer-encoding:in-reply-to:references;
	bh=7mGz9c5j7qfN9eG7dQvgcA1AagbKKPWBpRjHm9HlsGI=;
	b=GJZYhmSYRjjyoGnMF5kdYoVuMhzyOS69YSS0y3gevYYqkdxO+qoOOLsi08Qt2dQNU2CHgR
	AAxR7rSUr6mDNeAdbzOW2CyR+Ag++ccyEpDDahEfQi4reotb8bZX7K5qEMuCK/Y8bkCp16
	HhdPYZg08OOtTxsN9n8zmDRED4uUTtLqLjK89Y5u0n2voNm8LD+69c18D7AXxUEUgVj+BE
	wbv/ijayaz9T2fJwvDa/kIWefmHcNRGyUCNRyEucLIylRHBAnFqFrCUX5yfKHC5XA2OvcT
	hPKUR5zrx1EsbirGzAO5E7cNC+KnewaN9+EMMUto7XIH+ReAFgF3glatWgoSGw==
From: Caleb James DeLisle <cjd@cjdns.fr>
To: netdev@vger.kernel.org
Cc: andrew@lunn.ch,
	olteanv@gmail.com,
	davem@davemloft.net,
	edumazet@google.com,
	kuba@kernel.org,
	pabeni@redhat.com,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	matthias.bgg@gmail.com,
	angelogioacchino.delregno@collabora.com,
	chester.a.unal@arinc9.com,
	daniel@makrotopia.org,
	linux@armlinux.org.uk,
	arinc.unal@arinc9.com,
	Landen.Chao@mediatek.com,
	dqfext@gmail.com,
	sean.wang@mediatek.com,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	naseefkm@gmail.com,
	b.larsson@gmx.com,
	Caleb James DeLisle <cjd@cjdns.fr>
Subject: [PATCH v3 6/7] dt-bindings: net: dsa: mediatek,mt7530: add econet,en751221
Date: Wed, 28 Oct 2026 01:13:16 +0000
Message-Id: <20261028011317.1557238-7-cjd@cjdns.fr>
In-Reply-To: <20261028011317.1557238-1-cjd@cjdns.fr>
References: <20261028011317.1557238-1-cjd@cjdns.fr>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261027_181404_686492_AD262F63 
X-CRM114-Status: GOOD (  13.12  )
X-Spam-Score: -2.1 (--)
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
X-Spam-Status: No, score=-15.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=unavailable
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

The EcoNet EN751221 MIPS SoC integrates an MT7530 switch memory-mapped
in the SoC register space. It is similar to the econet,en7528-switch
except that ports 0..3 are 10/100 only, port 4 has a gigabit PHY, and
port 5 has no PHY, but is in some implementations connected to a
downstream MT7530 multi-chip module via a TRGMII link.

The downstream MT7530 is similar to the MT7621 multi-chip module and
has all gigabit ports.

Add the econet,en751221-switch compatible with the same constraints as
the other built-in switches and also add the econet,en751221-gswitch
multi-chip-module switch whose port 6 is configured as a DSA link port.

Signed-off-by: Caleb James DeLisle <cjd@cjdns.fr>
---
 .../bindings/net/dsa/mediatek,mt7530.yaml     | 43 ++++++++++++++++++-
 1 file changed, 41 insertions(+), 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/net/dsa/mediatek,mt7530.yaml b/Documentation/devicetree/bindings/net/dsa/mediatek,mt7530.yaml
index e29fb8693498..b73732d28d8c 100644
--- a/Documentation/devicetree/bindings/net/dsa/mediatek,mt7530.yaml
+++ b/Documentation/devicetree/bindings/net/dsa/mediatek,mt7530.yaml
@@ -29,6 +29,12 @@ description: |
   and the switch registers are directly mapped into SoC's memory map rather than
   using MDIO. The DSA driver currently doesn't support MT7620 variants.
 
+  EcoNet EN751221 SoCs have a memory mapped MT7530 with 3x 10/100 PHYs and 1x
+  gigabit PHY. Some EN751221 chips such as EN7513G and EN7526G have a multi-chip
+  module implementation of the MT7530 as well as the on-die switch. In these
+  packages, the multi-chip module is connected to port 5 of the on-die switch
+  via a TRGMII link and allows for 5 gigabit ports.
+
   There is only the standalone version of MT7531.
 
   Port 5 on MT7530 supports various configurations:
@@ -111,6 +117,14 @@ properties:
           Built-in switch of the EcoNet EN7528 SoC
         const: econet,en7528-switch
 
+      - description:
+          Built-in switch of EcoNet EN751221 SoC
+        const: econet,en751221-switch
+
+      - description:
+          Multi-chip module gigabit MT7530 in EN751221 SoC
+        const: econet,en751221-gswitch
+
   reg:
     maxItems: 1
 
@@ -160,8 +174,8 @@ properties:
   mediatek,mcm:
     type: boolean
     description:
-      Used for MT7621AT, MT7621DAT, MT7621ST and MT7623AI SoCs which the MT7530
-      switch is a part of the multi-chip module.
+      Used for MT7621AT, MT7621DAT, MT7621ST, MT7623AI and EN751221 SoCs which
+      the MT7530 switch is a part of the multi-chip module.
 
   reset-gpios:
     description: |
@@ -223,6 +237,20 @@ $defs:
                 phy-mode:
                   const: internal
 
+  mt7530-passthrough-dsa-port:
+    patternProperties:
+      "^(ethernet-)?ports$":
+        patternProperties:
+          "^(ethernet-)?port@[0-6]$":
+            if:
+              required: [ link ]
+            then:
+              properties:
+                reg:
+                  const: 6
+                phy-mode:
+                  const: trgmii
+
   mt7530-dsa-port:
     patternProperties:
       "^(ethernet-)?ports$":
@@ -330,6 +358,7 @@ allOf:
             - airoha,en7581-switch
             - airoha,an7583-switch
             - econet,en7528-switch
+            - econet,en751221-switch
     then:
       $ref: "#/$defs/builtin-dsa-port"
       properties:
@@ -337,6 +366,16 @@ allOf:
         mediatek,mcm: false
         reset-names: false
 
+  - if:
+      properties:
+        compatible:
+          enum:
+            - econet,en751221-gswitch
+    then:
+      $ref: "#/$defs/mt7530-passthrough-dsa-port"
+      required:
+        - mediatek,mcm
+
 unevaluatedProperties: false
 
 examples:
-- 
2.39.5


