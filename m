Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8FE0F606D814
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  6 Nov 2026 07:13:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=dfu6ImrU;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Tj4eP/rS
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Cc:To:In-Reply-To:References:Message-Id:
	Content-Type:MIME-Version:Subject:Date:From:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=z/ZZ/v2ozrIFzFDjrSLFseMeWg/94kHqZgMwNJDg2q4=; b=dfu6ImrU/uWeybr/+y7a6ZdVfI
	bQaGQ92OIimnamyZXNwkdna9Lwlw2JpGk9LyRdC5dz3sgvnZmygeefdciWzFWvPbFuBOwXRxY015W
	RVf0No9Y/+12Ek05G1LUT8X76jQjHj/aewKETWF/sPGbR2nlIQvgd7WsmIjk+puMh1Bv1US2zo4oD
	EgZkY5i5eWXN3RBZmM6aq1NVnpUdAZwv5IKDi1VukueAdkauu4nEuL7Vqbepj2zQLX+v2MF5ijtEO
	1Wf+SWX25UezsoX0y97z8NFQogXRchl+R/EqrkTH9CghWnMGOPpQyIuxMZc1vo2wndW+323w6Zr6h
	rx2k3p3g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xPE8T-0000000BPMq-1SJh;
	Fri, 06 Nov 2026 07:13:17 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xPE8S-0000000BPLa-0NOR;
	Fri, 06 Nov 2026 07:13:16 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id AA96F43D60;
	Fri,  6 Nov 2026 07:13:15 +0000 (UTC)
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1793949195;
	b=MkQZ68AHze0Xfm1F/RbPek8pf33GX7SQVdWuViwlISyA4gxUsM4wM1xpiLwntkE5hhvw
	 4NxubdzmfDu+KbL/JvdBDfuEBVy26tXKYG1G6v1aXMiDVoYraiyCkBD6MhEgcRVArUHCp
	 +c4ruE0jFoKVRImEfzKyHT40UTzCQED6JASS6EXrjRXEU2cOOgOZ/xvDvRPwAWd+42gkw
	 TQP7luBqmiEWRu5o9G+9pbJxKcPCeRJ2SY/dRXZXqgBENnUzF17PbGRGdcx8mH8Z7WF2q
	 EA0gf2+cgw4O1/jUWtGHLVRhocQjm6r6RIdeb/pQXG+FfiptTOCLUQGpoCZGg2rBfCA==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1793949195;
	h=DKIM-Signature:Received:From:Date:Subject:MIME-Version:Content-Type:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=z/ZZ/v2ozrIFzFDjrSLFseMeWg/94kHqZgMwNJDg2q4=;
	b=Xopdpj4VYGxioNFZqfIcj4ok1F7jTuq/ckUeJWJTHKoW4Tn3oDrpgKGu/1DhJGsqcjER
	 U+POpKH2zLG9aGY4z9uQxnjDAmezV3VYdAmlQIXyb5+3iCHn5XoDZMVEgkedlaYvkn9Tj
	 kqc0on2FytD8EAbY4+kokhFtoNaZaoKFI6qY1gtcKPDo2UiWoSmrC4RkYN2nBETDLWBhf
	 Gn63rXYtTpLVoGLVnJbvxRZO1hN98NnVy/4iuYnIxOy4/STZvMhJZMVOTzj10hEUZuvSh
	 7D0WWANQOSNyoN/jhtcJd2K4BWvihli1BidI/vMTIE/JfYGPEdIXpOgqjpS/kCLq9JQ==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 841861F008A3;
	Fri,  6 Nov 2026 07:13:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793949195;
	bh=z/ZZ/v2ozrIFzFDjrSLFseMeWg/94kHqZgMwNJDg2q4=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To;
	b=Tj4eP/rSdBUkUPuoM1W9YYwEfrRZJBBBzlJodJHuEK+LZQjWEVWjIRqvKTYIYRgET
	 AKBM9GHVyKGn9q8ryheAE+VpvMrzNfOCIqpWfdhOnCkPGSZkHQl+rh4rKw4JJAIZWP
	 ++rs853Vs2jpGu5x46/Ad5SLORAaA8XR+GnDaTCKoHfEaxtCadmHYdCu6siryECF0w
	 oAo/F5LMYnpfJm+gaDSSfIxruCETRuIzs/QgIRux9k/eb+QtpF9gD696as/SuZravG
	 VKRHRrq9+BHgejKyO/uaXock2tYqpG32hWATGvRNZQH+wh26q5QudokPGYhBZJaO7Z
	 /b/LjQ9KOgv1Q==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id 12C9545C3F;
	Fri,  6 Nov 2026 07:13:14 +0000 (UTC)
From: Junyi Zhao via B4 Relay <devnull+junyi.zhao.amlogic.com@kernel.org>
Date: Fri, 06 Nov 2026 15:13:09 +0800
Subject: [PATCH v3 2/2] dt-bindings: i3c: silvaco,i3c-master: Add Amlogic
 A9 support
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Message-Id: <20261106-a9_i3c-v3-2-804b69b9095b@amlogic.com>
References: <20261106-a9_i3c-v3-0-804b69b9095b@amlogic.com>
In-Reply-To: <20261106-a9_i3c-v3-0-804b69b9095b@amlogic.com>
To: Alexandre Belloni <alexandre.belloni@bootlin.com>, 
 Frank Li <Frank.Li@nxp.com>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>, 
 Miquel Raynal <miquel.raynal@bootlin.com>, Kees Cook <kees@kernel.org>, 
 "Gustavo A. R. Silva" <gustavoars@kernel.org>
Cc: linux-i3c@lists.infradead.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-amlogic@lists.infradead.org, imx@lists.linux.dev, 
 linux-hardening@vger.kernel.org, xianwei.zhao@amlogic.com, 
 Kelvin.Zhang@amlogic.com, Junyi Zhao <junyi.zhao@amlogic.com>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1793949192; l=3008;
 i=junyi.zhao@amlogic.com; s=20260924; h=from:subject:message-id;
 bh=EbBk034GgwE/lc2KD1CPaTtRovIqCoOmYzsKMI0uw94=;
 b=PL+f2g6aiQBoYwgwUjM03HWozXwwqI0y/oLp6OneE8FG5gPq4DZyr64D1ghA4gICEt8xHaQ1y
 9pNv4KLHqkuDz3THgyulcyimgZl9v3xIkMzMNoMEjC8oF7YiQIRy8Ft
X-Developer-Key: i=junyi.zhao@amlogic.com; a=ed25519;
 pk=hiL5PjGIksGFiWvEx9J3MhQqU/ro6vNbj72NIw4bbvA=
X-Endpoint-Received: by B4 Relay for junyi.zhao@amlogic.com/20260924 with
 auth_id=1054
X-Original-From: Junyi Zhao <junyi.zhao@amlogic.com>
Content-Transfer-Encoding: 7bit
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Reply-To: junyi.zhao@amlogic.com
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
X-Spam-Status: No, score=-18.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

From: Junyi Zhao <junyi.zhao@amlogic.com>

Amlogic A9 SoCs integrate the Silvaco I3C master IP in two domains:
the EE-domain instance (amlogic,a9-i3c) takes "pclk" and "fast_clk"
like the NXP integration, while the AO-domain instance
(amlogic,a9-ao-i3c) lives in the Always-On domain and generates its
bus clock from a divider inside the controller's own register space,
so there is no external fast clock and only "pclk" is exposed.

The two instances differ from the vanilla Silvaco/NXP integrations in
clock topology and required init, so the driver matches them by
dedicated compatibles instead of the "silvaco,i3c-master-v1"
fallback: a fallback would bind the generic driver data, which
neither programs the fast clock rate nor handles the AO internal
divider, and the variant would then fail to work.

Add both compatibles to the schema without the fallback, following
nuvoton,npcm845-i3c, and use per-compatible if/then conditionals to
enforce the clock counts: two clocks for the EE-domain instance and
one clock for the AO-domain instance.

Signed-off-by: Junyi Zhao <junyi.zhao@amlogic.com>
---
 .../bindings/i3c/silvaco,i3c-master.yaml           | 26 ++++++++++++++++++++--
 1 file changed, 24 insertions(+), 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/i3c/silvaco,i3c-master.yaml b/Documentation/devicetree/bindings/i3c/silvaco,i3c-master.yaml
index 853092f75..d892d42be 100644
--- a/Documentation/devicetree/bindings/i3c/silvaco,i3c-master.yaml
+++ b/Documentation/devicetree/bindings/i3c/silvaco,i3c-master.yaml
@@ -13,6 +13,8 @@ properties:
   compatible:
     oneOf:
       - enum:
+          - amlogic,a9-i3c
+          - amlogic,a9-ao-i3c
           - nuvoton,npcm845-i3c
           - silvaco,i3c-master-v1
       - items:
@@ -28,14 +30,14 @@ properties:
     maxItems: 1
 
   clocks:
-    minItems: 2
+    minItems: 1
     items:
       - description: system clock
       - description: bus clock
       - description: other (slower) events clock
 
   clock-names:
-    minItems: 2
+    minItems: 1
     items:
       - const: pclk
       - const: fast_clk
@@ -70,15 +72,35 @@ allOf:
         compatible:
           contains:
             enum:
+              - amlogic,a9-i3c
               - nxp,imx94-i3c
               - nxp,imx95-i3c
     then:
       properties:
         clocks:
+          minItems: 2
           maxItems: 2
         clock-names:
+          minItems: 2
           maxItems: 2
 
+  - if:
+      properties:
+        compatible:
+          contains:
+            enum:
+              - amlogic,a9-ao-i3c
+    then:
+      properties:
+        clocks:
+          maxItems: 1
+          description:
+            The "ao" variant is the controller instance in the Always-On (AO)
+            domain, which has no separate bus clock and derives the
+            bus clock from an internal divider.
+        clock-names:
+          maxItems: 1
+
 unevaluatedProperties: false
 
 examples:

-- 
2.42.0



