Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DBE16C7115A
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 18 Jun 2025 10:26:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=a3TtowPmSjozBFuMkK36IdX9AC61m1Rtc9Gf3gIV9GI=; b=SttwO/9QVz36hl6q1kzOUuxgt1
	geXtPghDu/XauV18Ajh0GlWOeLasJ/74T0+dLt6HAhYGUWp7w2OrMfkxZvPfbPlogPqpSEllnzaAG
	vqfWmZvZRzZvLgYvADVKCu9C12hzQrw3KpOCzO2PkGAImPIfxFVhN1dx6360fUHXctTtbRnvUc32P
	wnOtKfd/LgylWaqOe5u/E9YpnG4hR151fgsxAeuWdECDYvCm/bGETyhQnAOmF0aOudCVhQnw7RPEq
	+lQIaDq6YBDLkpBGJQ5UVFfhL3PWXnzXEUHfJi17zXkN6MQ8p3z7R4UZ+xqScl/mmwF6UyKEvph4h
	0izUzvVQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uRq0E-00000009mVE-3bhi;
	Wed, 18 Jun 2025 10:26:46 +0000
Received: from mail-ed1-x52d.google.com ([2a00:1450:4864:20::52d])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uRpa4-00000009gT3-1OdF
	for linux-arm-kernel@lists.infradead.org;
	Wed, 18 Jun 2025 09:59:45 +0000
Received: by mail-ed1-x52d.google.com with SMTP id 4fb4d7f45d1cf-60497d07279so13693459a12.3
        for <linux-arm-kernel@lists.infradead.org>; Wed, 18 Jun 2025 02:59:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1750240783; x=1750845583; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=a3TtowPmSjozBFuMkK36IdX9AC61m1Rtc9Gf3gIV9GI=;
        b=jLOiOTqRf2CekoMTXdTN7n0e68HOhbvWmmnF0CNJpCQCHt16M3tfdqUiyz1/wbS8dh
         yaCCzIjcD30X1n4AnQ7xuHlIZIBKIvFzdHJh7qdFoimaCiloJ5HRZEo6BUhCAUswVOJ7
         Di+ec7oi8OaJUUch/7qI4GrBvCmcFtKe3x9Lc7kctmvh2QvgkxU5pWFXkl3Hw3o5vMCm
         cls/cVlNP5Woy/03DHJjEiQ1ky+n0dISsFEw7xg9BbY+FfBDvzDdwN8WDdWo0LdQalT4
         7zZ08Y4FW3Ak3i1aqFQDJ/kGg2YYgqF8ykHD3AqeI6kuMF7v3sp9dVhbxhwOmh36pUSm
         reBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750240783; x=1750845583;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=a3TtowPmSjozBFuMkK36IdX9AC61m1Rtc9Gf3gIV9GI=;
        b=dXxN0MYVVZ3fKtjwqLmdVtO3UWIY2AmztzxrkTqg6L9y8whWmqpSv+ddkz7i63U8dh
         FgNDrfFHeGn1FpogVFKxaV3Iy+aya7FCVwE+4KEGfpMM/76UaltbHtLbsh2UtAl2gXiM
         m3TmkjjqFtkHYZroqBWnRYWh2UPxig1+thdBfqhzbubTjinELF6sPYJiCQyaA9TYkUdN
         hk8QCP2nB7izjxpXRRKO5mEzss5Cc3roJ8OuceT+g3pFbyy3QTYGWQQyUdtrvdRI/Tsg
         EqJyaAweU/TSRPRGLjaqGMplxG83fP8I/p8cs4AVGXO+tUWd9lvByFuE1c8O1xYKO9td
         8LRg==
X-Forwarded-Encrypted: i=1; AJvYcCV/bXE6YukBrWmI75rwe77E2tsWRQO9A9otd2vdZ0iybwIecp/JG+Sw4ze2tpNdyTegDSCAlib8vPE8jMVg51LW@lists.infradead.org
X-Gm-Message-State: AOJu0YySWzdh8HLPGWvtIDvsmkqg56so59Qk24hQWimK/T7inU4+FfY4
	0fZBd3dQuTdi4z8yNP2L8Mv7hTEHQLzqvsRuHwj+JU6JhwOrtvS4RphX
X-Gm-Gg: ASbGncso8LZHLb30mIemeaEpqA3kUu2eUqxwqi/oGdJBxMTYth8CIsg8RBn1JBE+mGV
	gSi+0IxGrX1+dd4h+aj3D7cUiTyJmieuQiHBgFzOH16/CX6FEg2AY/zA/9nftAk7WfKDxMp9QLY
	5c5bC6J/X+bM36U+w4fdzk6O327aMJHJdf8Rn9JoXf5p/kCy24V7sB3zXqJSxl0/6yhtNUtDVmy
	qlgJ1ZwESm1gxCJRd7gNTINmLN3xdx09WvT6DBiVGDK//6SPR17XGtoFCZ0FO+EeBw7e96sC1sP
	LG0NhiX0GcrvBjUDj1L3P+80t7vlBcAeUhJbD0ZzQ/bK8/5ZxdlyL4zEv1lqlCmWYbLF1pkfk2E
	=
X-Google-Smtp-Source: AGHT+IFo2mAi+jKg9HfLCZ/YVHV7ZAmm6wYfItt+pqPS6cQT+aJd6Xb6iGd5GAERxrnxVqQQtRUrdg==
X-Received: by 2002:a05:6402:42d4:b0:608:6754:ec67 with SMTP id 4fb4d7f45d1cf-608d0a0495dmr15074876a12.30.1750240782842;
        Wed, 18 Jun 2025 02:59:42 -0700 (PDT)
Received: from demon-pc.localdomain ([188.27.131.45])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-608b4a93b03sm9384691a12.54.2025.06.18.02.59.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Jun 2025 02:59:42 -0700 (PDT)
From: Cosmin Tanislav <demonsingur@gmail.com>
To: Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Rob Herring <robh@kernel.org>,
	=?UTF-8?q?Niklas=20S=C3=B6derlund?= <niklas.soderlund@ragnatech.se>,
	Julien Massot <julien.massot@collabora.com>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Linus Walleij <linus.walleij@linaro.org>
Cc: linux-media@vger.kernel.org (open list:MAXIM GMSL2 SERIALIZERS AND DESERIALIZERS),
	devicetree@vger.kernel.org (open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS),
	linux-kernel@vger.kernel.org (open list),
	linux-arm-kernel@lists.infradead.org (moderated list:ARM64 PORT (AARCH64 ARCHITECTURE)),
	linux-staging@lists.linux.dev (open list:STAGING SUBSYSTEM),
	linux-gpio@vger.kernel.org (open list:GPIO SUBSYSTEM:Keyword:(devm_)?gpio_(request|free|direction|get|set)),
	Cosmin Tanislav <cosmin.tanislav@analog.com>,
	Cosmin Tanislav <demonsingur@gmail.com>
Subject: [PATCH v4 08/19] dt-bindings: media: i2c: max96712: use pattern properties for ports
Date: Wed, 18 Jun 2025 12:58:44 +0300
Message-ID: <20250618095858.2145209-9-demonsingur@gmail.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250618095858.2145209-1-demonsingur@gmail.com>
References: <20250618095858.2145209-1-demonsingur@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250618_025944_407955_517E5208 
X-CRM114-Status: GOOD (  10.16  )
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

The MAX96712 and MAX96724 support up to 4 separate PHYs, depending on
the selected PHY configuration. Use patternProperties to document this.

The input ports are all the same, use patternProperties for them.

Signed-off-by: Cosmin Tanislav <demonsingur@gmail.com>
Acked-by: Rob Herring (Arm) <robh@kernel.org>
---
 .../bindings/media/i2c/maxim,max96712.yaml    | 29 +++++++------------
 1 file changed, 10 insertions(+), 19 deletions(-)

diff --git a/Documentation/devicetree/bindings/media/i2c/maxim,max96712.yaml b/Documentation/devicetree/bindings/media/i2c/maxim,max96712.yaml
index efdece2b33b9..f712d7cfc35f 100644
--- a/Documentation/devicetree/bindings/media/i2c/maxim,max96712.yaml
+++ b/Documentation/devicetree/bindings/media/i2c/maxim,max96712.yaml
@@ -40,27 +40,15 @@ properties:
   ports:
     $ref: /schemas/graph.yaml#/properties/ports
 
-    properties:
-      port@0:
+    patternProperties:
+      '^port@[0-3]$':
         $ref: /schemas/graph.yaml#/properties/port
-        description: GMSL Input 0
+        description: GMSL Input ports 0-3
 
-      port@1:
-        $ref: /schemas/graph.yaml#/properties/port
-        description: GMSL Input 1
-
-      port@2:
-        $ref: /schemas/graph.yaml#/properties/port
-        description: GMSL Input 2
-
-      port@3:
-        $ref: /schemas/graph.yaml#/properties/port
-        description: GMSL Input 3
-
-      port@4:
+      '^port@[4-7]$':
         $ref: /schemas/graph.yaml#/$defs/port-base
         unevaluatedProperties: false
-        description: CSI-2 Output
+        description: CSI-2 Output port 0-3
 
         properties:
           endpoint:
@@ -78,8 +66,11 @@ properties:
               - data-lanes
               - bus-type
 
-    required:
-      - port@4
+    anyOf:
+      - required: [port@4]
+      - required: [port@5]
+      - required: [port@6]
+      - required: [port@7]
 
 required:
   - compatible
-- 
2.49.0


