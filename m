Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 02AF0C83F22
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 16 Jul 2025 19:54:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ci6LfyLxOCYVonthXhYdb5sBHYYBJLKis6nF0XYSqcM=; b=eg2R6TwgmjqGUS+Eh6snXv7zDA
	TgFsjaOGoGiG6hG7UzIY4DFUZKDJG5dqu2VFMn4pUQeG1NqU7mj+0KG+JGcX3m03c+01q1HoUdIMQ
	5Q0ZgUYw68TlfvQ3B6jKZoKgrxJLOFHdQuhF2nbu6CQC/igjXBPtWWFF6wZOawOkshrMt6bqnrmaO
	x5rsqUYLfdCn+hiI1s5yEcobx28QS3iy3TBCTN/fdrAs8MEOrrdB1zA3yIpapaEKAa3ODeSwzNvyo
	+LAXmeaWrPUnYNgRzwDU/5Y8GAPGLuR0S0o1m6yHNWLxytB2L71PFbVd+i1R0S836P0igIFSipnS/
	Z8re9RsQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uc8Cg-00000008YKZ-29Kj;
	Wed, 16 Jul 2025 19:54:10 +0000
Received: from mail-ej1-x62d.google.com ([2a00:1450:4864:20::62d])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uc7qv-00000008UpA-1DFB
	for linux-arm-kernel@lists.infradead.org;
	Wed, 16 Jul 2025 19:31:42 +0000
Received: by mail-ej1-x62d.google.com with SMTP id a640c23a62f3a-ae6fa02d8feso33923766b.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 16 Jul 2025 12:31:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1752694300; x=1753299100; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ci6LfyLxOCYVonthXhYdb5sBHYYBJLKis6nF0XYSqcM=;
        b=LMXZuua+3veUnVA4puXXd2G/XidIajDA+hyQRS+EnpsTX6jy55wZqzbslqIDDfjShq
         1wTE6rTQdffu/wniFPFpfNhoa6SYJB4Y5CuT5NnT+TR1WYXNSgKbocZ3lL3JqYqOK2fi
         r4OFuBtk52jVTtGVlPSD/vAEV3jmeoTXUYxVDJSnpSb2EOXHAqnSNdfLmdx9SSPlilv/
         uNmt2RV0SNZ0rl2+Vs8bQgrmB09QSJ/vSJAYHtYZvOkvYdPl2ZR09Nd9iudsqq3LibIL
         Q3kWUc+Nw81EPabTyiHvGGwBQo1H0G25Cy/LurL6f1OHQbSF82y5O75gS+8airp+iQ1a
         lpMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752694300; x=1753299100;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ci6LfyLxOCYVonthXhYdb5sBHYYBJLKis6nF0XYSqcM=;
        b=FA27OTTNGlnk6/yS5rd+61Jz7hOwN7eRUFU6DvNJpN7ESF+GFeQDsmhgcdfaMTaaq4
         PDqkgQq5UnhFKcocDZNaKSxwDESmYHO7NSJ4ZUrFDFwC0W5KQ7CzR/IeFQrJEYvH67Y/
         9J4BiuY9sQmZ+uyI4xOweo3UYKPyLU08BKAVpeKzU2iz2RogQw07pBFGKBkMqUx2L/an
         k3z2sBrc3NOUE6doo6Jnw/ayzEO/bKvFnmQI0IDompGYvEN8E4zRdO/bLk4joFcf9ndj
         S4czJEutHvYWtxVJ9aH6Y01MWQwAgKShPcE7ROicCEtJclv/yVs/9RLHXO5rEMHvks/2
         r6iA==
X-Forwarded-Encrypted: i=1; AJvYcCWxj7LdtUXlXvBfSEg1a5vufpJb8KC2kUlqtZwy2ILnoRwz7+2uPBHUTpNRH2NpcygWb8qIC6UVy5nTKb4d0VDa@lists.infradead.org
X-Gm-Message-State: AOJu0YyM+qG0VAxDgjrQ/C5oatlj9D0iPNUmeKBJas9P2ySj1GgPbpGh
	KzWrPkjbZ53KSYl5uf6F1MnhaIuyjwC2AJxWPn/u3YVQt3PCmnZrlLEJ
X-Gm-Gg: ASbGnctV/ZXbdkmcd9g/ACEVxJNlSPMMbUHKXKcY5vtAZVI9lOnQBE9kamaaREKI5f7
	+M4Xe2x5XI5aso+hTWVr+0MEvLCrUIA+2sIwlMqJEyNZBsMS3WyatyfMYQe/1biHrqEVpV2i5uU
	ivmSbmdnIVMR1AerFZyxSNk6jrvrBU5mjs2iXHqdOKsuQC6NHgnJvOAVyO8HDRAPjbwDkZa/uGl
	6rurGQyCYcHud81saFp5ZiCBqex67gQux3bOwiJdmr+srCIs+cAjRzN85weQXpaTyxGiwj3Ya2d
	hVuYH4NDN2whHkA8KWOasz9XBDJxOJy8uJpIxO6aZ+JDkElON67KWQTyHBhlXaZM3iQRG3kyMUj
	Dciu9t5FPV8sIu4aNk/hkyRTZzE0w50MJxW4=
X-Google-Smtp-Source: AGHT+IFgMJSbKiCJ+YHesw4GIPDKMG7m17QkiSCWYoejm7XnFhQC3e5fKlub+SaUuQ0HvhKw3qtqrw==
X-Received: by 2002:a17:907:c082:b0:ae6:e0b1:9633 with SMTP id a640c23a62f3a-ae9ce0d2fbdmr368414766b.33.1752694299726;
        Wed, 16 Jul 2025 12:31:39 -0700 (PDT)
Received: from demon-pc.localdomain ([188.27.131.45])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ae6e82df54csm1226534666b.155.2025.07.16.12.31.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Jul 2025 12:31:39 -0700 (PDT)
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
Subject: [PATCH v6 08/24] dt-bindings: media: i2c: max96712: use pattern properties for ports
Date: Wed, 16 Jul 2025 22:30:53 +0300
Message-ID: <20250716193111.942217-9-demonsingur@gmail.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20250716193111.942217-1-demonsingur@gmail.com>
References: <20250716193111.942217-1-demonsingur@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250716_123141_326831_7569CB81 
X-CRM114-Status: GOOD (  10.76  )
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


