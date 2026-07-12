Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B6257C43458
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 12 Jul 2026 03:00:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=4OuezE/moo5Tppqmye8t2PqCkPAk1kmw20Fa1p80Uak=; b=SNGtZy6aVkIzcNyoynpI9US9Y0
	dnBlT3ebFQ9W+/ftRpom87FL2qR0tYHhzLvm9A732/MuXPLZJDIAkqhM5ZSZovnEkto7Eread0qBQ
	6maqYkQqZRKHDt0e8h/HRUUjJ0kECv0ZNjhKKn7hgYxwHgUajC0yFAtfMPm/RNEPGlj4OUO/HKvUc
	DP/omHltAIr1C/bxv34b0aGL8BLlcySdfJjlEgWTHZ8oLNfAqL6mOcioqe3Nwey3BOzv+/10Bdpn6
	Po2RivBCzfg5iVrQ8ELseaBASMlzKODANiL2dRbe3ir+vx5lmM9Y1y1I/Uy8iwoICsd7JlKBPDs/q
	+FBHNmow==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wikQV-000000073IZ-3lex;
	Sun, 12 Jul 2026 03:00:19 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wikQS-000000073Hb-2CBC
	for linux-arm-kernel@lists.infradead.org;
	Sun, 12 Jul 2026 03:00:16 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 7668043A16;
	Sun, 12 Jul 2026 03:00:15 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1097D1F00A3D;
	Sun, 12 Jul 2026 03:00:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783825215;
	bh=4OuezE/moo5Tppqmye8t2PqCkPAk1kmw20Fa1p80Uak=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=M3ViGUJDdOiDRTiVtWE163GhjLsJEZern531YSS1D5os1zFDHYIvLNbuqrR2Ev8PP
	 RAEOpFlhoxoWnZvZWEMGKj1lfMbM+WbhqgfZ8fNpN5kr8mid/ABCNeOCMB+Q5Hb8Mo
	 RFmEW7NRCjPNhVXH3I+Bg4cbGESorTC/GXDFrHMgvG3Y+2Qgmb4yUxkK5URber0DFY
	 F8wT9k0tB0pd5MkP5i3xquo1ZlmzvD9+lRdGfEP06GHHgeyDy/E22GifI17e/BL5yb
	 CKkLrUm9/T1DyQuFvNJyEWnVGrhXyl359afP5EqyeMBwaRYw26d8cgkRMAulPJzgss
	 tlXGLCKPEcCuA==
Received: by wens.tw (Postfix, from userid 1000)
	id E2AB55FE73; Sun, 12 Jul 2026 11:00:12 +0800 (CST)
From: Chen-Yu Tsai <wens@kernel.org>
To: Maxime Ripard <mripard@kernel.org>,
	Paul Kocialkowski <paulk@sys-base.io>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Chen-Yu Tsai <wens@kernel.org>,
	Jernej Skrabec <jernej@kernel.org>,
	Samuel Holland <samuel@sholland.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-media@vger.kernel.org,
	linux-staging@lists.linux.dev,
	devicetree@vger.kernel.org,
	linux-sunxi@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Jernej Skrabec <jernej.skrabec@gmail.com>
Subject: [PATCH v3 2/7] dt-bindings: media: sun4i-a10-video-engine: Fix SRAM count for H6
Date: Sun, 12 Jul 2026 11:00:05 +0800
Message-ID: <20260712030011.3778169-3-wens@kernel.org>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260712030011.3778169-1-wens@kernel.org>
References: <20260712030011.3778169-1-wens@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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

On the H6, the SRAM C region includes an alias of part of the VE SRAM
used by the video engine. This region should also be claimed so that no
access happens through the alias window.

Add a second SRAM region phandle to the video engine for the H6.

Acked-by: Rob Herring (Arm) <robh@kernel.org>
Reviewed-by: Jernej Skrabec <jernej.skrabec@gmail.com>
Signed-off-by: Chen-Yu Tsai <wens@kernel.org>
---
 .../allwinner,sun4i-a10-video-engine.yaml     | 21 ++++++++++++++++++-
 1 file changed, 20 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/media/allwinner,sun4i-a10-video-engine.yaml b/Documentation/devicetree/bindings/media/allwinner,sun4i-a10-video-engine.yaml
index 932043d7f0cc..818d815d4732 100644
--- a/Documentation/devicetree/bindings/media/allwinner,sun4i-a10-video-engine.yaml
+++ b/Documentation/devicetree/bindings/media/allwinner,sun4i-a10-video-engine.yaml
@@ -48,11 +48,15 @@ properties:
 
   allwinner,sram:
     $ref: /schemas/types.yaml#/definitions/phandle-array
+    minItems: 1
     items:
       - items:
           - description: phandle to SRAM
           - description: register value for device
-    description: Phandle to the device SRAM
+      - items:
+          - description: phandle to SRAM alias
+          - description: register value for device
+    description: Phandle to the device SRAM(s)
 
   iommus:
     minItems: 1
@@ -101,6 +105,21 @@ allOf:
         iommus:
           maxItems: 1
 
+  - if:
+      properties:
+        compatible:
+          contains:
+            enum:
+              - allwinner,sun50i-h6-video-engine
+    then:
+      properties:
+        allwinner,sram:
+          minItems: 2
+    else:
+      properties:
+        allwinner,sram:
+          maxItems: 1
+
 additionalProperties: false
 
 examples:
-- 
2.47.3


