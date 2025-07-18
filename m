Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5D3CCC83F1A
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 18 Jul 2025 15:43:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=VY2xY+2Dp3KHgbNVnY+ylp9yfgQzMwwh8U848dtuhZE=; b=Mqsdn+Me9WmFjzDZqpinqC7bzP
	hgRyxOHoMPQ+Y4fK3LxhVcwr8XZnKosEH4OBwAJKrBTdQ89YtiM3Zqhjhwedr6lnN7rLubBtlWOVS
	2PFWJklsuADk9002Msu/uHv4hd6xkoor7klgURM/wGVTnEKiuzIa7EhyqMrljhB1pZD6ws8CFc5g9
	ZpYAinobtFw7rTuFqKPqowOCqfPI8Q8r/UE76j0L5G6wNoqpC1Sj1n2QtnHk0hcQ74WatKRZymJb9
	nGu51oCingmzJ6fHOMhE5TTvF2rtQ7/X4KkGnf1gu2M0mAAUsgwUvnt0evP+0wlMZmiE/ZHIlx2OP
	SvGQ7wbw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ucnFQ-0000000CzLf-0JsT;
	Fri, 18 Jul 2025 15:43:44 +0000
Received: from mail-wr1-x42e.google.com ([2a00:1450:4864:20::42e])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ucmxf-0000000CvnS-0BNX
	for linux-arm-kernel@lists.infradead.org;
	Fri, 18 Jul 2025 15:25:24 +0000
Received: by mail-wr1-x42e.google.com with SMTP id ffacd0b85a97d-3a6cd1a6fecso1946035f8f.3
        for <linux-arm-kernel@lists.infradead.org>; Fri, 18 Jul 2025 08:25:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1752852321; x=1753457121; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=VY2xY+2Dp3KHgbNVnY+ylp9yfgQzMwwh8U848dtuhZE=;
        b=Mml+Jxjc+66Fwj3a8kTypsV3mCHD34cDPFrtRikXOXNtVJRvxMB0PpLmF4oj33ARHX
         EbVjMRr0y9Nxqj1dWZJHZSNzgsVvgUA/0GJngUAnqSjnlshz2V/7R3uhi8Oym76yXfJB
         +7MLjh72kACKbphvuiUDla7a0rNJkh9eqZ1s09SM8g5kroOgr3usRG6IClX+SziMZkfS
         U3OHIyslIqHJL/Z6SOJnZhOdh9ZFa/JzQiwB4E+6xYUeJOYccCvewH+St526sChF+teu
         a15xw8IauAvrt+BUNY5GAGbXGBa1riQeSXTbHWm0Nb3GpNvypSeHfB7ySnmVYm6O4VMM
         MYpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752852321; x=1753457121;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=VY2xY+2Dp3KHgbNVnY+ylp9yfgQzMwwh8U848dtuhZE=;
        b=Hjw8DFRKJ5AOWkRUUweiF/Dbr/q4CvTKoDzEGXHXy9FldibdW0sBpQldzJo679ypNa
         gjCZ7mG2XvKHyMEkXLXHK1L3Tva+tB+T57MXBk81QifiLhCdsd5VM07UXfZpIM+fkPw+
         xYGOiIaOuiJU3Jk5qG1bFQfBXX5OLPwZz4ZVMxz9JunNeyksHZ1zGKhVoe3psvCxkYtx
         h4M/UwKZ0+ym0l2T2UvyRQKTOl1n9KRrfprUdiZxVDWmMEJsNLG5UD1aJXYu/v8M8I6m
         0+rXsm3vgl9a+vruvPAMFwSTZS48LuAO4g0YmGBbcNrUQtqmjRlE6gvK4hDLSP9Dil16
         S4zA==
X-Forwarded-Encrypted: i=1; AJvYcCXufQQxTw1zJ64jgFQ03OJmRlqgzac6y9jGU8aIgo4J4sjnHGqCJMMhItDE6KijN5aog01cHjH4Yij3vlIn9mQE@lists.infradead.org
X-Gm-Message-State: AOJu0YytDBtcIxVv4VLyYjChIXqC3ShSoGEEnlzQwXmtlnJj3CnDyI58
	08m7yM94SIKnFYuwpc+cCnltzhzSTkpDNepfgRfoFQArDq7nvT8vKrgl
X-Gm-Gg: ASbGncsJQafCMUKeeruVS/4vG/zyAa3BtHABRhuP84sK7i5EAnATtKj4cEgIlJbLjXT
	YzNCJehXyQ8SbHnVCwLbepo/aIgk3r9szJSQkWUB5T4wU+cJu5DGo85w6yLclqMKItUVjGHkiee
	XZIwZ38vk+i4XgOR/zMLNCWUecSUJaA/AKPfqIxoNncv7F4+I56KL2h2yIDd8xZf1fwDMo9gL8a
	KdnNwbW/I4GO4cZIGxu98K6sAsWC+0AIBv27fIP8+Gq4mEDZWJgLUE7pzXCfFvnw1kHli1z0kJh
	0E1Ylv8AmQyGb8zuWPxL6lrZtNdqPkyKch+m2fPNQ9YIdNEiKVEelYmBYmCoPLa9I4kXFucegmR
	RZW7TUWa7NnpSCAt8t2N1pEWxyCL1tHGkFDE=
X-Google-Smtp-Source: AGHT+IFosEa8A5/jx/kIbHSrM7rulfvNRKcdtZAvt/wouq2stq+zX6XaLcWYGLbx0MAHp8UNK5rpaQ==
X-Received: by 2002:a05:6000:4911:b0:3b5:db54:c68e with SMTP id ffacd0b85a97d-3b60dd4aa3dmr11399941f8f.9.1752852321306;
        Fri, 18 Jul 2025 08:25:21 -0700 (PDT)
Received: from demon-pc.localdomain ([86.121.79.159])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3b61ca4893fsm2195780f8f.52.2025.07.18.08.25.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 18 Jul 2025 08:25:20 -0700 (PDT)
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
Subject: [PATCH v7 04/24] dt-bindings: media: i2c: max96717: add support for pinctrl/pinconf
Date: Fri, 18 Jul 2025 18:24:40 +0300
Message-ID: <20250718152500.2656391-5-demonsingur@gmail.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20250718152500.2656391-1-demonsingur@gmail.com>
References: <20250718152500.2656391-1-demonsingur@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250718_082523_074023_1597A8FA 
X-CRM114-Status: GOOD (  14.01  )
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

MAX96717 is capable of configuring various pin properties.

Add pinctrl/pinconf properties to support this usecase.

Signed-off-by: Cosmin Tanislav <demonsingur@gmail.com>
Reviewed-by: Rob Herring (Arm) <robh@kernel.org>
---
 .../bindings/media/i2c/maxim,max96717.yaml    | 105 ++++++++++++++++++
 1 file changed, 105 insertions(+)

diff --git a/Documentation/devicetree/bindings/media/i2c/maxim,max96717.yaml b/Documentation/devicetree/bindings/media/i2c/maxim,max96717.yaml
index 167c3dd50683c..9afaa8a7a3f52 100644
--- a/Documentation/devicetree/bindings/media/i2c/maxim,max96717.yaml
+++ b/Documentation/devicetree/bindings/media/i2c/maxim,max96717.yaml
@@ -121,6 +121,111 @@ required:
   - reg
   - ports
 
+patternProperties:
+  '-pins$':
+    type: object
+    additionalProperties: false
+
+    properties:
+      function:
+        enum: [gpio, rclkout]
+
+      pins: true
+      drive-open-drain: true
+      drive-push-pull: true
+      bias-disable: true
+      output-disable: true
+      output-enable: true
+      output-low: true
+      output-high: true
+      input-enable: true
+
+      slew-rate:
+        description: |
+          Slew rate.
+          Rise and fall times represent the time needed for a GPIO to go
+          from 20% to 80% of VDDIO.
+          0 - Fastest
+              rise:  1.0ns @ 1.8V,  0.6ns @ 3.3V,
+              fall:  0.8ns @ 1.8V,  0.5ns @ 3.3V
+          1 - Fast
+              rise:  2.1ns @ 1.8V,  1.1ns @ 3.3V,
+              fall:  2.0ns @ 1.8V,  1.1ns @ 3.3V
+          2 - Slow
+              rise:  4.0ns @ 1.8V, 2.3ns @3.3V,
+              fall: 10.0ns @ 1.8V, 5.0ns @3.3V
+          3 - Slowest
+              rise:  9.0ns @ 1.8V, 5.0ns @3.3V,
+              fall: 10.0ns @ 1.8V, 5.0ns @3.3V
+        maximum: 3
+
+      bias-pull-up:
+        oneOf:
+          - type: boolean
+            description: Enable regular 40kOhm pull-up
+          - enum: [ 40000, 1000000 ]
+            description: Enable either the 40kOhm or the 1MOhm pull-up
+
+      bias-pull-down:
+        oneOf:
+          - type: boolean
+            description: Enable regular 40kOhm pull-down
+          - enum: [ 40000, 1000000 ]
+            description: Enable either the 40kOhm or the 1MOhm pull-down
+
+      maxim,jitter-compensation:
+        type: boolean
+        description: |
+          Enables jitter compensation.
+          Jitter compensation is used to minimize the jitter of the
+          signals transmitted from the deserializer to the serializer
+          by adding a fixed delay to every transition on the serializer
+          side. This can be used for pulse generation where timing is
+          critical.
+
+      maxim,tx-id:
+        $ref: /schemas/types.yaml#/definitions/uint32
+        description:
+          Enable transmission of the pin state from the serializer to
+          the deserializer using the specified identifier.
+        maximum: 31
+
+      maxim,rx-id:
+        $ref: /schemas/types.yaml#/definitions/uint32
+        description:
+          Enable transmission of the pin state from the deserializer to
+          the serializer using the specified identifier.
+        maximum: 31
+
+    required:
+      - pins
+      - function
+
+    allOf:
+      - $ref: /schemas/pinctrl/pincfg-node.yaml#
+      - $ref: /schemas/pinctrl/pinmux-node.yaml#
+
+      - if:
+          properties:
+            function:
+              const: gpio
+        then:
+          properties:
+            pins:
+              items:
+                enum: [mfp0, mfp1, mfp2, mfp3, mfp4, mfp5, mfp6, mfp7,
+                       mfp8, mfp9, mfp10]
+
+      - if:
+          properties:
+            function:
+              const: rclkout
+        then:
+          properties:
+            pins:
+              items:
+                enum: [mfp2, mfp4]
+
 additionalProperties: false
 
 allOf:
-- 
2.50.1


