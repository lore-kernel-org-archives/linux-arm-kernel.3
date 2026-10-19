Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 66C23606A321
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 19 Oct 2026 21:24:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=VAPBs6/1;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=cOFZulKP
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=/1AN1ESpWi5jgJPYsy5btghJQVKGbBKJpkxKtYBKunU=; b=VAPBs6/1c4gJGOADpI3MOSSIep
	zaupAbLHtcxcyqhbHMKfWGgR+vDvwh+W9KBXXDAvP7MQkF+6ClGy3DiothNjhRJe3kSG1gVi3BH+o
	SC6VT5JXHLS6E+gksrBDUnD4lvPm7MPEp2bTVn4TL0h6xx3bgby/dfRyOQdFgrUnDXDVKICkBivoN
	0KREQY1en1v/YvebH7EFKwjlUo1VoGAPjqr0wM7KNbbI4wZpagyhD8Mixs/lDZmNsMetNQ8aMPdCD
	2xKgXotdB3CQxeXXyIZRjn5QJTGuMcW2C031/6W4b3JCur6ufTetLy+GGjmlgnr1PyvLAfo2kXbpn
	oauxP38w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xIuqX-00000008NAH-3Pvs;
	Mon, 19 Oct 2026 21:24:41 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xIuqW-00000008NA7-2kdi;
	Mon, 19 Oct 2026 21:24:40 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id CE21C601F6;
	Mon, 19 Oct 2026 21:24:39 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5FA2A1F000C4;
	Mon, 19 Oct 2026 21:24:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792445079;
	bh=/1AN1ESpWi5jgJPYsy5btghJQVKGbBKJpkxKtYBKunU=;
	h=From:To:Cc:Subject:Date;
	b=cOFZulKPhn3MYRu1y0ekb0riZp6D6+qjITek6qm7uSCUrIRhXej4s05s57YMCr+6R
	 l9mBahUFYFhvc7w2ix0N8x9aQ6Mwwu2F2Fg7BBIn7J+mmHjsDFOW0VB/Rn0nYlQER8
	 /S3nqNBneUgY9cILeuTL0YQs6pgKWXClNmMTfW1Yrgzf78mjQLHVC3ZbpFP4ZVRzfR
	 cXc6risAA0iNkB/Iqu2LnGmgTiF8JSbBllRZ7IJtTMQcIB+cgwQioYpPS+6BtmMJ8i
	 P28h/368CrhAldiB29+cQ5YdimVjxuQN6uzqJy+ozUzD2QMOe/rNhSMSaXQY6mUdQy
	 X/XITcVyGGz5Q==
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Tiffany Lin <tiffany.lin@mediatek.com>,
	Andrew-CT Chen <andrew-ct.chen@mediatek.com>,
	Yunfei Dong <yunfei.dong@mediatek.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Hans Verkuil <hverkuil@kernel.org>,
	Chen-Yu Tsai <wenst@chromium.org>,
	Allen-KH Cheng <allen-kh.cheng@mediatek.com>
Cc: Kyrie Wu <kyrie.wu@mediatek.com>,
	linux-media@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Subject: [PATCH] media: dt-bindings: mediatek,vcodec-subdev-decoder: Fix child node if/then schemas
Date: Mon, 19 Oct 2026 16:24:29 -0500
Message-ID: <20261019212431.4109371-1-robh@kernel.org>
X-Mailer: git-send-email 2.53.0
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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
X-Spam-Status: No, score=-19.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

The if/then schemas in mediatek,vcodec-subdev-decoder are all at the
wrong level as they apply to child nodes. The clock-names schemas
applies to the parent node, but the clock-names properties are in the
child nodes. Move the clock-names definitions to the child node
clock-names property. This exposes that the MT8186 clocks are not
documented, so add them as well.

The interrupts if/then schema is never true as the parent compatible
will never match the child compatible. The subschema also belongs in the
child node.

Fixes: 3fbf1eac01b5 ("media: dt-bindings: media: mediatek: vcodec: Adds decoder dt-bindings for lat soc")
Closes: https://sashiko.dev/#/bug/linux-5ab90035-1914-412f-8310-097fb05bda15
Fixes: 355e9472ccb0 ("media: dt-bindings: media: mediatek: vcodec: adapt to the 'clock-names' of different platforms")
Closes: https://sashiko.dev/#/bug/linux-caa6adb1-38de-4889-9517-2beede7c8f96
Signed-off-by: Rob Herring (Arm) <robh@kernel.org>
---
 .../media/mediatek,vcodec-subdev-decoder.yaml | 77 ++++++++-----------
 1 file changed, 31 insertions(+), 46 deletions(-)

diff --git a/Documentation/devicetree/bindings/media/mediatek,vcodec-subdev-decoder.yaml b/Documentation/devicetree/bindings/media/mediatek,vcodec-subdev-decoder.yaml
index d1d209cbbd43..6033ecffd707 100644
--- a/Documentation/devicetree/bindings/media/mediatek,vcodec-subdev-decoder.yaml
+++ b/Documentation/devicetree/bindings/media/mediatek,vcodec-subdev-decoder.yaml
@@ -135,8 +135,26 @@ patternProperties:
         maxItems: 5
 
       clock-names:
-        minItems: 4
-        maxItems: 5
+        oneOf:
+          - description: MT8186 clocks
+            items:
+              - const: vdec-sel
+              - const: vdec-soc-vdec
+              - const: vdec
+              - const: vdec-top
+          - description: MT8192 clocks
+            items:
+              - const: sel
+              - const: soc-vdec
+              - const: soc-lat
+              - const: vdec
+              - const: top
+          - description: MT8195 clocks
+            items:
+              - const: sel
+              - const: vdec
+              - const: lat
+              - const: top
 
       assigned-clocks:
         maxItems: 1
@@ -159,6 +177,17 @@ patternProperties:
 
     additionalProperties: false
 
+    if:
+      properties:
+        compatible:
+          contains:
+            enum:
+              - mediatek,mtk-vcodec-core
+              - mediatek,mtk-vcodec-lat
+    then:
+      required:
+        - interrupts
+
 required:
   - compatible
   - reg
@@ -166,50 +195,6 @@ required:
   - mediatek,scp
   - ranges
 
-if:
-  properties:
-    compatible:
-      contains:
-        enum:
-          - mediatek,mtk-vcodec-core
-          - mediatek,mtk-vcodec-lat
-
-then:
-  required:
-    - interrupts
-
-allOf:
-  - if:
-      properties:
-        compatible:
-          contains:
-            enum:
-              - mediatek,mt8192-vcodec-dec
-    then:
-      properties:
-        clock-names:
-          items:
-            - const: sel
-            - const: soc-vdec
-            - const: soc-lat
-            - const: vdec
-            - const: top
-
-  - if:
-      properties:
-        compatible:
-          contains:
-            enum:
-              - mediatek,mt8195-vcodec-dec
-    then:
-      properties:
-        clock-names:
-          items:
-            - const: sel
-            - const: vdec
-            - const: lat
-            - const: top
-
 additionalProperties: false
 
 examples:
-- 
2.53.0


