Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DE149C83F17
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 18 Jul 2025 15:41:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=OYu3gq0SvKezou7DSttLXa9MnM9KSDxmSDvAl9UefcY=; b=UXpxuVruU5vpoUej2rc0PLtZLE
	wXZjOmzEdmmxLkL1OUCU1u/RDXxXYIrCm5ujyErFzz5mSEBYZTpkVcVXIK5exkj8khxDB+3Je9ZfI
	vfupikqjoG6jgbpq+IDhgnpzewwm9beRuNRKpGpPTiLJiMexe3gg7aruQe4aNLPukfpb0xkeJgky/
	BNS4Sp6Ze6D6qS2WuOA8KWywwiXwbvAto4apycyVW2IBYblZFhoYo0+/yGFpkrL2057JQ9ErpDeKY
	fWO8rfu1kYv3slPgYwrKWcoM4Oi3pRQiotYvk3IcdBAvsT5Xhe6khR5pgHSkJ2MCsRMk6akdpNPpC
	0IedOBJA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ucnCz-0000000Cyuy-13r1;
	Fri, 18 Jul 2025 15:41:13 +0000
Received: from mail-wr1-x42c.google.com ([2a00:1450:4864:20::42c])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ucmxc-0000000Cvmd-3M34
	for linux-arm-kernel@lists.infradead.org;
	Fri, 18 Jul 2025 15:25:21 +0000
Received: by mail-wr1-x42c.google.com with SMTP id ffacd0b85a97d-3a6e2d85705so1123785f8f.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 18 Jul 2025 08:25:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1752852319; x=1753457119; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=OYu3gq0SvKezou7DSttLXa9MnM9KSDxmSDvAl9UefcY=;
        b=GCC9yYgmEWPjOTMg3RliF2fk76d0hMf0fwhJYI97wxh76SjMAPz6oJc4SujAJ8EBRp
         jTvIHYm4B/9rLWHbUjuLCLwMcZDq0ZZacYKQp0JZURxtY7iXameRWfy5a+H4jzAeEWc8
         uwiKdkmtaZgicEgXpHmwv+qF5SMC730sL+zE5CtsUj7wZhlufE75LJlaiihr81NSaYhs
         JxTs85XgU15qHfQsC1eZLv7uowYKvT6CHTmPiiNMQLqpaiTwri5Em4+eabupI/KYafX/
         BFb8z6H2ncDWnzMyyv2Vhc1wtMYG4kP1+CHR4hpZvzfR8N2/zRewJtBnw7QF1REI93kX
         PD0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752852319; x=1753457119;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=OYu3gq0SvKezou7DSttLXa9MnM9KSDxmSDvAl9UefcY=;
        b=UYFb/WFhU0uwcr56uIgS39eip3K8zyJArgCc5+EknuFmFMeEl1RdVO5Pdde3h7iOyU
         ldkPdvHuu92jnBeKJ9GFrDrx7pxE6fNsb3RRbVNw4etL1AubE2Wu8dLuc97cNnKbbrX6
         HvfjXqoG2Ti4bTWSsz1sNQsKpgzM/lZZXEJvuotbpKcQn2UIBnMx61tFEjjYFxmyuFr0
         OXlb/7i13PtH5MJS72nLAV9vXHnf6XV+B8Fm1onBppn7qkRdAITjeRbjXSDJNFdvRVde
         VdXVbDHibDBhigPxSt15wn67PPnwRr90jGGTCZgUP7qV7c+Rx7ymm+MT5k6rFczvI2KM
         1i5A==
X-Forwarded-Encrypted: i=1; AJvYcCVDYdc2HZpJAeVtTToBfb3+57poOzGS8qnRLdwnsbNnSjpWLQZ4sQ2gj95xOUUqErX7HgQ5r5HUYPwxY1mJsdWB@lists.infradead.org
X-Gm-Message-State: AOJu0YxJyoRzSI+KTvxMBmC5NgIsQZAY+yxelXWB92kotgcm0r4M9LKd
	FhYEzhzec3/6AOautQ8B+x/eZa71soQW9+lyf2TNmGYb5DkRpScG/GdN
X-Gm-Gg: ASbGncuhh51LetL+lGHN7N3RDaWMxy87eCrn5ELmKXcX79vukNSGW0zT0H/nio6VBz7
	PI1PdMlKuMrLlyxODgXIu6Uyky08VrDD7UZBHRER7MmkzLIri8FhbNeG8q6CtSs+iCjgPzQmMes
	btkdgtu/RngA2MScBYX9+7JWiUCcO4qeegvIHv8V1iqaBqYH5N1TkzFEupI3zOJGwDtwIR54zo9
	nXezLJXFQkY96UE9jqfNzH0uBR5XlszDJIPiT3rSWp6bwRCj580iRH848imTLkdPWr6gLE00N5j
	I5XX3Db9ihgnBmDOtrQQAsc36t6XUlnMpU4xLGce6EliiogPnyYhj6e2gX22KFRkwrfYkoQjEDu
	Kf9TaVWP0DZIn2CEar5zoYtGagsE0Y6ANRIMcoSg++WpGUg==
X-Google-Smtp-Source: AGHT+IEnZaN4T1aWyiMymnwtrHibVFWNCN2EyngNMlWV8/LXD9E/fE3pkx0haNIPm6wkD38CJG7rJw==
X-Received: by 2002:a05:6000:2c06:b0:3a4:ee40:6c85 with SMTP id ffacd0b85a97d-3b60ddc61d8mr8989086f8f.54.1752852319055;
        Fri, 18 Jul 2025 08:25:19 -0700 (PDT)
Received: from demon-pc.localdomain ([86.121.79.159])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3b61ca4893fsm2195780f8f.52.2025.07.18.08.25.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 18 Jul 2025 08:25:18 -0700 (PDT)
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
	Cosmin Tanislav <demonsingur@gmail.com>
Subject: [PATCH v7 03/24] dt-bindings: media: i2c: max96717: add support for I2C ATR
Date: Fri, 18 Jul 2025 18:24:39 +0300
Message-ID: <20250718152500.2656391-4-demonsingur@gmail.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20250718152500.2656391-1-demonsingur@gmail.com>
References: <20250718152500.2656391-1-demonsingur@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250718_082520_835916_8E13B09D 
X-CRM114-Status: GOOD (  11.31  )
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

MAX96717 is capable of address translation for the connected I2C slaves.

Add support for I2C ATR while keeping I2C gate for compatibility to
support this usecase.

Signed-off-by: Cosmin Tanislav <demonsingur@gmail.com>
Acked-by: Rob Herring (Arm) <robh@kernel.org>
---
 .../bindings/media/i2c/maxim,max96717.yaml    | 39 +++++++++++++++++++
 1 file changed, 39 insertions(+)

diff --git a/Documentation/devicetree/bindings/media/i2c/maxim,max96717.yaml b/Documentation/devicetree/bindings/media/i2c/maxim,max96717.yaml
index 15ab37702a927..167c3dd50683c 100644
--- a/Documentation/devicetree/bindings/media/i2c/maxim,max96717.yaml
+++ b/Documentation/devicetree/bindings/media/i2c/maxim,max96717.yaml
@@ -92,6 +92,30 @@ properties:
       incoming GMSL2 link. Therefore, it supports an i2c-gate
       subnode to configure a sensor.
 
+  i2c-alias-pool:
+    maxItems: 2
+
+  i2c-atr:
+    type: object
+    additionalProperties: false
+
+    properties:
+      '#address-cells':
+        const: 1
+
+      '#size-cells':
+        const: 0
+
+    patternProperties:
+      '^i2c@[01]$':
+        $ref: /schemas/i2c/i2c-controller.yaml#
+        unevaluatedProperties: false
+        properties:
+          reg:
+            items:
+              minimum: 0
+              maximum: 1
+
 required:
   - compatible
   - reg
@@ -99,6 +123,21 @@ required:
 
 additionalProperties: false
 
+allOf:
+  - $ref: /schemas/i2c/i2c-atr.yaml#
+
+  - anyOf:
+      - oneOf:
+          - required: [i2c-atr]
+          - required: [i2c-gate]
+
+      - not:
+          required: [i2c-atr, i2c-gate]
+
+dependentRequired:
+  i2c-atr: [i2c-alias-pool]
+  i2c-alias-pool: [i2c-atr]
+
 examples:
   - |
     #include <dt-bindings/gpio/gpio.h>
-- 
2.50.1


