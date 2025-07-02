Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 42693C77B7C
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  2 Jul 2025 13:39:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=BHtKm+EEXzzIlG111wnSsu8XSk7GbNuuARrUp7XVuKU=; b=Y4kYA0DGgVmPesRqSQZXfNsXQK
	x1udoBLezqLp3xa+L1jrjKVVHX0sTCoynjaUNTshjhtDm0YEW7T/fGFZ05kyr6OGKRlUuvEjGtzas
	8ekjtCee/nPAPoxFxMgkq+F0t61oA668ey61lED47S/1Yrxf7fBkEK9qOeIJWjGUlEAJVsbYOk728
	yfc9HGW9FmzcJnWBbuRBJmtZZh46x9U3pD0LBBqqW2VIm4MgodSvMg8ctRf84rlEBmkBH5NWPvUD1
	mkLfitTisLfbsJkiewfs58pgg2xbMx5IuhqXSn4/OWQJ+eEsrVNnjsKAjJxr19j0e3j1rV/7pLncQ
	kySoOYdA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uWxgb-00000008Ufa-48DL;
	Wed, 02 Jul 2025 13:39:41 +0000
Received: from mail-ed1-f51.google.com ([209.85.208.51])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uWxOp-00000008Qo2-2qch
	for linux-arm-kernel@lists.infradead.org;
	Wed, 02 Jul 2025 13:21:20 +0000
Received: by mail-ed1-f51.google.com with SMTP id 4fb4d7f45d1cf-60cc11b34f6so5823720a12.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 02 Jul 2025 06:21:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1751462478; x=1752067278; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=BHtKm+EEXzzIlG111wnSsu8XSk7GbNuuARrUp7XVuKU=;
        b=FVxNv5RAicl2D3e9WTArK4LWXZR5RSYs0bt+pnWk6b4IuQudVXZvkLj8HuIbaBlIDm
         tCYGtMZygCLofxLVofbzyaT4b0RlVKa1bougi6TAUbj6HPQ9/pQZvjuh1myxMqRV7hny
         jgCheuqsMFbi+JP4f425I8Ri2lJRFo9GDfdIVm6XVwnVs6MXerNx8gfdxvA6rnAkNuMm
         Wew+khczEJfB5zFtITGPT6oIQqSsn2fdeur8pDkl/onJe+4TG1/goeoORW7M93DzKNTN
         Hi8djMJ90UqWp2+NYy2obuTbMDwDyMSMS8HeRCJDmwGaTDXa2FzyPMEATQHFN1kCcjd9
         83hQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751462478; x=1752067278;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=BHtKm+EEXzzIlG111wnSsu8XSk7GbNuuARrUp7XVuKU=;
        b=jMB/U+y4ejVkFc63xVW2LlcTlUhWGNHZykD/39TXYkfU4mWybO+2ohZg18L+lXKysf
         ZNnGe7g69vO1D7DWapTqrb1K3MiSea4kFj8qmuMC2E+hhUtm1GZKUhGviFWNkG4pgpu6
         HIfdp+tTJ91QLXQoslLCJMNvT1bbJVwDqwB3vopm5XViCupcWzSkcDUnnKqdYcsgVK00
         k/rpo8a6ZhZhvbPZl2fUd7q2MR14mjAR+F0KuHnDLJlx+FrLP47Cd9hLqBJNfJiuiru4
         /DmoOmKEP0lvW+BTfvIHpBXlMyZZgaNzwFmspVphOTJL122NZqmFe+/uAWaS7c5bb7yw
         F9Mg==
X-Forwarded-Encrypted: i=1; AJvYcCVYkrrJ/NdimwX1t8/dm2k6Ekcz5ACJNM4xF58MtQMncOF4llTXSWdQjmDYs5Hd6zM1RC8Phs3IBGoVN5oK5zam@lists.infradead.org
X-Gm-Message-State: AOJu0YyX8NfkD40+J2u16EaxEUmUZuettZBENtKETFMdQGXDCoOuYh6C
	oPLdfiJcyJOhQFxV54ThlAzIpuo3vkrkhGNlmi8lC6rlkr6Ke2nvPK+c+q8uJQ==
X-Gm-Gg: ASbGncs29fu/eilxVk0X0oqm75hmo2N6Js0XpeBUcKd3R4miok6OggbECEx0X0xDdkB
	GBQU44WxnKVx8Vk573gL3N17wK/yjxk4LYwi9P48gzL4x1kqWn6RSxhI073ClQOjTGsmPQ4ynAa
	wSrVwVSpepJaghBWEtg9CmWVO8szjC0YA54KMpu3QYzw78RRdA9YSJLRyZFr09TDBKISYh9Glqr
	LaUWbxa30D97dy+2rxclVYV1rpZoGQWR95oxDpUJuEC3UuIwrOzj8hEVeq6yu76xqB97Cp1tb2V
	Vxu4FKCUCJVkDhEwmXNqPZIixVmI4TJ8oMPZHXQDM6XhIdEj0OW/o8vaUeDjVdpqQu2dyc6YkV0
	=
X-Google-Smtp-Source: AGHT+IHvM+9PE3ELXwT9U1cnGnuZOCOmHJOManbPYkfa4Wv8dKS7DjN6hAjnrIVhNUqXBWZgB9WpNw==
X-Received: by 2002:a17:906:c141:b0:ae0:da61:71fc with SMTP id a640c23a62f3a-ae3c388298dmr285682166b.10.1751462477402;
        Wed, 02 Jul 2025 06:21:17 -0700 (PDT)
Received: from demon-pc.localdomain ([188.27.131.45])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ae35363b094sm1063800966b.22.2025.07.02.06.21.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Jul 2025 06:21:17 -0700 (PDT)
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
Subject: [PATCH v5 03/24] dt-bindings: media: i2c: max96717: add support for I2C ATR
Date: Wed,  2 Jul 2025 16:20:29 +0300
Message-ID: <20250702132104.1537926-4-demonsingur@gmail.com>
X-Mailer: git-send-email 2.50.0
In-Reply-To: <20250702132104.1537926-1-demonsingur@gmail.com>
References: <20250702132104.1537926-1-demonsingur@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250702_062119_723788_F35779E9 
X-CRM114-Status: GOOD (  11.80  )
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
index 15ab37702a92..167c3dd50683 100644
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
2.50.0


