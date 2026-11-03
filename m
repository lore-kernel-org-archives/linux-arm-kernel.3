Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 28387606A831
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  3 Nov 2026 10:13:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=1NjLh7mn;
	dkim=pass (2048-bit key, unprotected) header.d=collabora.com header.i=@collabora.com header.a=rsa-sha256 header.s=mail header.b=VkGdETdc
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=rmU0lOMI73VyRNzdBu44GHmLmeTwCCxZpA5Js0VgXVc=; b=1NjLh7mnPKb8CA
	0GzJ4prSTa84IzgERdk5uj8OykPjDMwGGEOD2q4TWGX2oB7an13QqGsqIue9cdewdl+9TjmY3nIE0
	a1lsE5ODnKK0A9va9RdgS7du+V0eeQ+ErmXwzZj73w6wGj51zf9/Ax/Cp+yy9YZloEnk3Ft5nE8Wy
	yQPK4oLFrExbjCQMxcFOkTDeGkJLkjqVMU/w3v6eZV9XWP1pr+mKyKsHTWS+vaDVUSvVoJO8TnHEt
	ub8HRW2qKiL+hZYXPDhxB1fgndGgVy5WwptFgrzT/6O1jcoENBYC+QXGD2vQtZAjbgEH6D5rno6SK
	IqTIM3TGRAj0oyGuY6bw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOBVd-00000001tmC-3QAy;
	Tue, 03 Nov 2026 10:12:53 +0000
Received: from bali.collaboradmins.com ([148.251.105.195])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOBVR-00000001tZx-1HJv;
	Tue, 03 Nov 2026 10:12:42 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1793700759;
	bh=DGyuH1RLL2NLAi4E9FC+VwwNK0cWsuaQH1J59ikPRVg=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=VkGdETdckJt4qpdcHprsdCiU5V0T1sNFT0X4WAMQz21ca/6fPT+DFefRGwoJrV8yg
	 xjgM/MBwy46LdqK4wwoJizqRQdeb0LbFz4Av+7rfDAt72JLbfGo51lyX69tXUtKnFh
	 WbJnKD7RwZUBebclY1Xu8YrJ/tKmJW6f/UqTyvkTucLqD004Y39p92bvf1lvCiiLwo
	 opcJqTmy0/oiA8iXX4tgyHR3m1DFHPlyacY/o5Ovp1lJkZAWsXyLQxC4DvIlkOZpRq
	 DD5WPlme74dEj96isZEEkUIXGgFuktyrrWngnEn9w1xflThqx/Tla3Zm6zkKpPH6CZ
	 koKR0PsMiU9oA==
Received: from yukiji.home (unknown [100.64.0.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: laeyraud)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 94FFF17E0A80;
	Tue, 03 Nov 2026 11:12:38 +0100 (CET)
From: Louis-Alexis Eyraud <louisalexis.eyraud@collabora.com>
Date: Tue, 03 Nov 2026 11:12:08 +0100
Subject: [PATCH net-next v4 03/10] dt-bindings: net: mediatek-dwmac: add
 support for MT8189 SoC
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261103-dwmac-mediatek-mt8189-v4-3-c86c14fc50f4@collabora.com>
References: <20261103-dwmac-mediatek-mt8189-v4-0-c86c14fc50f4@collabora.com>
In-Reply-To: <20261103-dwmac-mediatek-mt8189-v4-0-c86c14fc50f4@collabora.com>
To: Andrew Lunn <andrew+netdev@lunn.ch>, 
 "David S. Miller" <davem@davemloft.net>, Jakub Kicinski <kuba@kernel.org>, 
 Paolo Abeni <pabeni@redhat.com>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Richard Cochran <richardcochran@gmail.com>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Biao Huang <biao.huang@mediatek.com>, 
 Maxime Chevallier <maxime.chevallier@bootlin.com>, 
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
 Alexandre Torgue <alexandre.torgue@foss.st.com>, 
 Eric Dumazet <edumazet@kernel.org>, Eric Dumazet <edumazet@kernel.org>
Cc: kernel@collabora.com, netdev@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
 linux-stm32@st-md-mailman.stormreply.com, 
 Louis-Alexis Eyraud <louisalexis.eyraud@collabora.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1793700755; l=3237;
 i=louisalexis.eyraud@collabora.com; s=20250113; h=from:subject:message-id;
 bh=DGyuH1RLL2NLAi4E9FC+VwwNK0cWsuaQH1J59ikPRVg=;
 b=dSvGCwOf4kMy9Oa/yUSl/XCo+k8Y/LmjUBZjvxw0skoIVWEHfnllD2sfNBjRX8LZI4/qpP8e7
 4lynl0cl/RYAQ4qzd71Lq6d7y93AeXUrT6KZuSa77YX6ur5Yi9ogP1e
X-Developer-Key: i=louisalexis.eyraud@collabora.com; a=ed25519;
 pk=CHFBDB2Kqh4EHc6JIqFn69GhxJJAzc0Zr4e8QxtumuM=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261103_021241_520308_D7B27FD9 
X-CRM114-Status: GOOD (  12.89  )
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
X-Spam-Status: No, score=-18.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Add new compatible string and clock definitions for the Ethernet MAC
IP found in MT8189 SoC.

Regarding the required clocks, the MT8189 datasheets list in the
paragraph related to this IP clocks the mac main and ptp reference
clocks as the ones to turn on.

No specific peripheral clock for Ethernet MAC is described in the SoC
clock list.  But at the same time, the Ethernet MAC block diagram,
present in the datasheets, shows this IP is interconnected to the rest
of SoC with AXI and APB interfaces (and in MT8188 datasheet too).
There is no APB related clock, that is specific to the IP in MT8189,
contrary to MT8188 or MT8195 that have one. But since it is on an APB
bus (likely shared between multiple IPs), then there is a bus clock for
peripheral access. Describing the IP having it makes sense, same thing
for AXI too, so the clock lists for this compatible are reflecting
that.

Also, don't allow mediatek,rmii-clk-from-mac property for MT8189
compatible.

Signed-off-by: Louis-Alexis Eyraud <louisalexis.eyraud@collabora.com>
---
 .../devicetree/bindings/net/mediatek-dwmac.yaml    | 42 +++++++++++++++++++---
 1 file changed, 37 insertions(+), 5 deletions(-)

diff --git a/Documentation/devicetree/bindings/net/mediatek-dwmac.yaml b/Documentation/devicetree/bindings/net/mediatek-dwmac.yaml
index 956240616638..0fc2eed06646 100644
--- a/Documentation/devicetree/bindings/net/mediatek-dwmac.yaml
+++ b/Documentation/devicetree/bindings/net/mediatek-dwmac.yaml
@@ -20,13 +20,11 @@ select:
         enum:
           - mediatek,mt2712-gmac
           - mediatek,mt8188-gmac
+          - mediatek,mt8189-gmac
           - mediatek,mt8195-gmac
   required:
     - compatible
 
-allOf:
-  - $ref: snps,dwmac.yaml#
-
 properties:
   compatible:
     oneOf:
@@ -36,6 +34,7 @@ properties:
           - const: snps,dwmac-4.20a
       - items:
           - enum:
+              - mediatek,mt8189-gmac
               - mediatek,mt8195-gmac
           - const: snps,dwmac-5.10a
       - items:
@@ -45,7 +44,7 @@ properties:
           - const: snps,dwmac-5.10a
 
   clocks:
-    minItems: 5
+    minItems: 4
     items:
       - description: AXI clock
       - description: APB clock
@@ -55,7 +54,7 @@ properties:
       - description: MAC clock gate
 
   clock-names:
-    minItems: 5
+    minItems: 4
     items:
       - const: axi
       - const: apb
@@ -153,6 +152,39 @@ required:
   - phy-mode
   - mediatek,pericfg
 
+allOf:
+  - $ref: snps,dwmac.yaml#
+  - if:
+      properties:
+        compatible:
+          contains:
+            enum:
+              - mediatek,mt2712-gmac
+              - mediatek,mt8188-gmac
+              - mediatek,mt8195-gmac
+    then:
+      properties:
+        clocks:
+          minItems: 5
+
+        clock-names:
+          minItems: 5
+
+  - if:
+      properties:
+        compatible:
+          contains:
+            enum:
+              - mediatek,mt8189-gmac
+    then:
+      properties:
+        clocks:
+          maxItems: 4
+        clock-names:
+          maxItems: 4
+
+        mediatek,rmii-clk-from-mac: false
+
 unevaluatedProperties: false
 
 examples:

-- 
2.56.0


