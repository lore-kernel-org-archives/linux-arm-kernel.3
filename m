Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A7A3EC71157
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 18 Jun 2025 10:29:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=76TSauQPafZc1MT0mTUL25sTdCTwST3vHLDDnjzxqa8=; b=pMYi4E7yXzKiDHbTgUfGFM46am
	ll9+YU2Zdx+A5QbY4YbWI5RlaGY1l7NCmKvo9dcW1H7mfnnf0aBu/sT/hb1LZ/9XJo5KTDqc9MoRe
	UQIyDGZDDI+tp5ymFwRXYnvonFBgEj+/Llkc+4WkiN4BNpFNriGu+9PD+Tgr3Zb2RXaTEDaKGJxsx
	SpkdYbHl9lOeIjlGhjNjFCpMXZYc8OP4X3vgMDWS3dJFFeBbVrvpGN5RXTRJ4QTpNVaRtiV+AmlFm
	OqxgT9nx+5+T/rnHz2Xlf++L6JGdStYt3GkUqE3q6SQx8PdfxjrnVllnJBLw5wGHYUrtHCZMnKAvx
	96lxjF6g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uRq2Q-00000009mwX-3ZoF;
	Wed, 18 Jun 2025 10:29:02 +0000
Received: from mail-ed1-x533.google.com ([2a00:1450:4864:20::533])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uRpa6-00000009gUy-0cau
	for linux-arm-kernel@lists.infradead.org;
	Wed, 18 Jun 2025 09:59:47 +0000
Received: by mail-ed1-x533.google.com with SMTP id 4fb4d7f45d1cf-60179d8e65fso12218013a12.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 18 Jun 2025 02:59:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1750240785; x=1750845585; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=76TSauQPafZc1MT0mTUL25sTdCTwST3vHLDDnjzxqa8=;
        b=FwJ8xBSrvpYV58XsEvG3h5XybCsqB28K21y+5S1mVI5VZOXi4ngSC8zD+4rAXEqw/C
         RkEpSsWtbLQ2uVbaTW23cF1dZwLZHkXHDE3xlvqMM5hyw3ACmapvGe9h3GDmEjB99+Nn
         JLqsuPGKFz4x/UXYkD7Kv3ArHpQSYH9KcKyMHQsFvwymQg0hF7YYOmquotu8ArJa2V0A
         K8IqpIO4JNuzIAw3NsnN0IsZm2hQEBZKLYVrJ7dNRUANIICPzNMYRGH1HcJDcvH9FHhr
         2HqCRx9LakMiYecK9wZ+nz9J5unU1vYAbc2x8fIxmMsRNGcuq9L7GBewo+BJ575Zchbq
         osqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750240785; x=1750845585;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=76TSauQPafZc1MT0mTUL25sTdCTwST3vHLDDnjzxqa8=;
        b=TWOAmF6HdRF6AHO7I4YExqTLAUjset7RF4E0VBbVmGGw3gppX0VUKI1aGUtCVppRi7
         JVa0pDJl9JxZJju+Z0W7ByEB/DrasJNRsqwxW7DRmlAlPVHDX7lk+CqD4JmMCj6hURhG
         NKnJTJz4SNuIU5YYonHD3NZP///B5VU0cLnB5poPd/F43OBhap1YZQWR2obrzbO2OnsC
         QTXSqLVvIbndrwFZJ69uyS+nUK2O5OeK+hwTF/Gw+2mwXsQNabkawDwCIwBpdlR5PWuk
         wMVgbE3qOofmqrbMOln6PWwArAG0kmuhTgkoOZ6R3GsBkmFX7LINo6D78iGeRx6d/5a7
         0Mhg==
X-Forwarded-Encrypted: i=1; AJvYcCUNoDDoP2oBEgC6dBrc6Bhzqb0CCvXOWxv5CVj2bDc3FN/l4nHd1K+AkNTZi0kEzizaIGAZJj8i6k3sqChXo/xY@lists.infradead.org
X-Gm-Message-State: AOJu0YyYgr68ojtJ38PaVRwlnQW+HAF6dnkh8hJvuGhLRv/J5xcW1H1t
	9mj4KMi5yBLOvTKNKZYGua2zT2rVST2PN+ARuyhTpcrl4vadY/yQZSmf
X-Gm-Gg: ASbGncvu8zGiv9Crgh9p/rUzJDdbaZCUgiWQ4MPZOzgaWnsDRwQqhbfvNW4Fb7diAL5
	eWaT5+5HkeRDbxE76JvvDYP4CHKj7oELP+UVts+3xTArPe5qM0NvrLgnk3iqmOkj7hColXF8t8u
	Oi8YWeMpBNeBLy/CfQfUulmzGJuYqvZA3B4EQPHctuAl2IJeahgXEh8GhbWFHR0GVD80gWNdikj
	+CFXUJKIMfkiM4CoTiWfv27layV8qvV9xd0c6m0hYiV3BPuPFA15ynoLxd0oy555HByWvXY98se
	afzXyb4J1HgTnk2K6AZqvXherIVEESbKJ5+b6Cj4Qn5Q9PbhEaw4p5DxpdA/al8lpWOvPXA5gu8
	=
X-Google-Smtp-Source: AGHT+IGcJ/3EJ96nlb0xfxLZsuz0PFAwjNNvmaF1G6tPL9/xfE5cjh445Nq7XLGFdsd0S8fSuFLJzw==
X-Received: by 2002:a05:6402:4402:b0:609:d685:e831 with SMTP id 4fb4d7f45d1cf-609d685eecemr570244a12.12.1750240784498;
        Wed, 18 Jun 2025 02:59:44 -0700 (PDT)
Received: from demon-pc.localdomain ([188.27.131.45])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-608b4a93b03sm9384691a12.54.2025.06.18.02.59.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Jun 2025 02:59:44 -0700 (PDT)
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
Subject: [PATCH v4 09/19] dt-bindings: media: i2c: max96712: add support for I2C ATR
Date: Wed, 18 Jun 2025 12:58:45 +0300
Message-ID: <20250618095858.2145209-10-demonsingur@gmail.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250618095858.2145209-1-demonsingur@gmail.com>
References: <20250618095858.2145209-1-demonsingur@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250618_025946_203039_C844ED54 
X-CRM114-Status: GOOD (  11.16  )
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

MAX96712 and MAX96724 have more than one GMSL2 link, and each link is
capable of connecting to a separate serializer. If these serializers
have the same CFG pins configuration, they will also have the same I2C
address, causing conflicts unless the deserializer changes the address
of the connected serializers.

The MAX96712 and MAX96724 support changing the I2C address of the
connected serializers.

Document this capability.

Signed-off-by: Cosmin Tanislav <demonsingur@gmail.com>
Acked-by: Rob Herring (Arm) <robh@kernel.org>
---
 .../bindings/media/i2c/maxim,max96712.yaml    | 31 +++++++++++++++++++
 1 file changed, 31 insertions(+)

diff --git a/Documentation/devicetree/bindings/media/i2c/maxim,max96712.yaml b/Documentation/devicetree/bindings/media/i2c/maxim,max96712.yaml
index f712d7cfc35f..758c0223977d 100644
--- a/Documentation/devicetree/bindings/media/i2c/maxim,max96712.yaml
+++ b/Documentation/devicetree/bindings/media/i2c/maxim,max96712.yaml
@@ -37,6 +37,30 @@ properties:
 
   enable-gpios: true
 
+  i2c-alias-pool:
+    maxItems: 4
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
+      '^i2c@[0-3]$':
+        $ref: /schemas/i2c/i2c-controller.yaml#
+        unevaluatedProperties: false
+        properties:
+          reg:
+            items:
+              minimum: 0
+              maximum: 3
+
   ports:
     $ref: /schemas/graph.yaml#/properties/ports
 
@@ -79,6 +103,13 @@ required:
 
 additionalProperties: false
 
+allOf:
+  - $ref: /schemas/i2c/i2c-atr.yaml#
+
+dependentRequired:
+  i2c-atr: [i2c-alias-pool]
+  i2c-alias-pool: [i2c-atr]
+
 examples:
   - |
     #include <dt-bindings/gpio/gpio.h>
-- 
2.49.0


