Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 288FEC83F17
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 18 Jul 2025 15:53:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ci6LfyLxOCYVonthXhYdb5sBHYYBJLKis6nF0XYSqcM=; b=T+cgsA8sERdnGaukiZFPyH1dpI
	zjWtYGacQsLv3JDVP2RsJd7DRNH07tZPJgKUueEPUW0qEfgd5MxkP9P+MwkqqQK1Zwd+ECOkVT2wz
	GwRwRGthJ8H0Vrxad6AiUrffDnrU7FJ4W8stLF76rtRM/Nha1uozQVaDhwyD86gnYIROd9y5JqZoX
	Gf74hk08QxIjJy1Eq0grA573P2eXnXZgH1uV72ca+C4wtgso1FXw3IHYGKgwGBUtJmQM8FS8bIuHH
	gErK+LbSXsKA8I2Ho6I3U1e2lQoNcyj5NcJ4lJBsokU0CXSwDTSuUYDBvJGJR10xeabBofrUY1Xua
	GG7bGuTg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ucnP8-0000000D0j1-0wdZ;
	Fri, 18 Jul 2025 15:53:46 +0000
Received: from mail-wm1-x32c.google.com ([2a00:1450:4864:20::32c])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ucmxn-0000000Cvr7-2qTL
	for linux-arm-kernel@lists.infradead.org;
	Fri, 18 Jul 2025 15:25:32 +0000
Received: by mail-wm1-x32c.google.com with SMTP id 5b1f17b1804b1-4560add6cd2so18096045e9.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 18 Jul 2025 08:25:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1752852330; x=1753457130; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ci6LfyLxOCYVonthXhYdb5sBHYYBJLKis6nF0XYSqcM=;
        b=f6x7534nx6X1/us7eeaxfrbqE8YvVUSMO3BFZk4iZxsaxJfEtll9S7dmMsTgYYZon9
         f7vmF2Mlhd15HFYj95o6WyUlR9tDpj3RKMhYyoOkLBmUXtpMLIvBTRIFBVdtUslwG4ej
         kKeNuZufiQf51XeEypUTLMGm69O6YZ8eIztlGH/MYB0DLgXQXP9//CsMuy/IFAKIQ5Ov
         UWNlZn798Uc9LoTt3truGiJjZisruaSFRM1IP39YSIZK2dOdHJZYIff/nxD6AEQ+ybIi
         VZMmIf2GZtA7M23skJfJ7YLgHYUuamTjfdy98D5bUt+WXxp3UHjvdEdafhogt/nDn+kq
         6SSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752852330; x=1753457130;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ci6LfyLxOCYVonthXhYdb5sBHYYBJLKis6nF0XYSqcM=;
        b=pWKm7bRKbE1Yx+HnISZU5l+ZVp8PG+QR6a9fFlmrVQn+xk61SSCBB6oSrX+6FwJ6+N
         yGrsHLR5mQ1qYpSQYpKgvJ7XOjvq0SPMj8/W4Q5LEmbNpABqFBXJ1vCH2MeaFxWsnixu
         N7PBGF/iU/bVuNr4rAvn4yt16Yz8VXPXKriDW0ozXXxFZHE6NVJ9uLSRjnZiYbsDHEM5
         0d8e9dcySNfNyyNZ03SjOEqHMgsGsONHpDoeYmrMhDGecynUBjtHh9SlFSJT/b/uTpGN
         BO4t4wE86t+/1N91dl/i1yH+N+STNrLZ9anxdUfamhMYwEgyM7RFhgmuTFL/tTzzaMyO
         l6tw==
X-Forwarded-Encrypted: i=1; AJvYcCUxViy/ujk8wFUdl8ZhVcfIlXYVlCCt+7S2INdw/w2snlS6e0tcuN8+dgcp+splZHObr3NFzPkzUSncvfL8VTMC@lists.infradead.org
X-Gm-Message-State: AOJu0YxOxca8LgV9/uc+Kpe+FefAkw07Oa/4eZAdx7jcMsmU0Madf4Yh
	t3qC2L3L73UOFGgNzTj1QTwSjwfOxC/FeStTbt+6x6KlzeRl6U9qzZTw
X-Gm-Gg: ASbGncsQZpAVHtfBw4brDvO74JIk0U5gZ+d0l4oYPfR05YTdUbdVnRiUW4TzHHPvvOS
	X1u+rU3wbpfil/j7oUm/hZ/ZbMnrbSD0BoQFZxCez75DbZgobx1Ck2+nbgb2y6Jn/eOk93UAea4
	WbO58SpudpqGFjPMXRxJRhwpq7+EnGrvWMsCgQU9WgwnzG1pwdxQN6DDxbMoUCAGjmXpAxc0mT3
	HfS6uN1koNdLBeH5gDR5lFL7V6r1FSvyDdG/QO3uIrfM64wA/pCUBzswuiJ5kfQUDnyxEIqfmQF
	LbIdXcRYEqedC+PB9m1qWtco8QXXCIQbXhDkoyKLzNdri6tQXT0gjgG9Pm7H+tBbDNDw8d6tVTz
	RB61zi7hkHzp2gHwGwDuGfH5/KKUp9j1cVMM=
X-Google-Smtp-Source: AGHT+IG1vbzbLCgOR5YDotqpNaL70yH20v5dT4HsVfcivIBx8URgZtxb/nuiF60kyvSNGOQRCG9opQ==
X-Received: by 2002:a05:600c:3f12:b0:456:1ab0:d566 with SMTP id 5b1f17b1804b1-456348cbdb0mr81643995e9.16.1752852330035;
        Fri, 18 Jul 2025 08:25:30 -0700 (PDT)
Received: from demon-pc.localdomain ([86.121.79.159])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3b61ca4893fsm2195780f8f.52.2025.07.18.08.25.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 18 Jul 2025 08:25:29 -0700 (PDT)
From: Cosmin Tanislav <demonsingur@gmail.com>
To: Cosmin Tanislav <cosmin.tanislav@analog.com>,
	Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Rob Herring <robh@kernel.org>,
	=?UTF-8?q?Niklas=20S=C3=B6derlund?= <niklas.soderlund@ragnatech.se>,
	Julien Massot <julien.massot@collabora.com>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Linus Walleij <linus.walleij@linaro.org>
Cc: linux-media@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-staging@lists.linux.dev,
	linux-gpio@vger.kernel.org,
	Cosmin Tanislav <demonsingur@gmail.com>,
	=?UTF-8?q?Niklas=20S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>
Subject: [PATCH v7 08/24] dt-bindings: media: i2c: max96712: use pattern properties for ports
Date: Fri, 18 Jul 2025 18:24:44 +0300
Message-ID: <20250718152500.2656391-9-demonsingur@gmail.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20250718152500.2656391-1-demonsingur@gmail.com>
References: <20250718152500.2656391-1-demonsingur@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250718_082531_711247_91838B48 
X-CRM114-Status: GOOD (  10.94  )
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
Reviewed-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>
---
 .../bindings/media/i2c/maxim,max96712.yaml    | 29 +++++++------------
 1 file changed, 10 insertions(+), 19 deletions(-)

diff --git a/Documentation/devicetree/bindings/media/i2c/maxim,max96712.yaml b/Documentation/devicetree/bindings/media/i2c/maxim,max96712.yaml
index efdece2b33b96..f712d7cfc35f5 100644
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
2.50.1


