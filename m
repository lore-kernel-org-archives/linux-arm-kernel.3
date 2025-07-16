Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C3D31C83F22
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 16 Jul 2025 19:44:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=VY2xY+2Dp3KHgbNVnY+ylp9yfgQzMwwh8U848dtuhZE=; b=QE/SQw6BEfzCo9B5xK/oaGKy+X
	FKvHUSsWKekHfc5xzhMgj5lQ5eRJY26OxT2Bz0Xgm8AQFFXT81yqU/oJ3CQdf/zAghive1g6UYR6X
	5yk25HjdgemaAR89rD9vyqIl87EEIGqtHXWj7BYfjOkRC0aIIV3WyAUwn+ey0E1cQZlG45H5sr3jB
	DhItGUpF4Sr5PLqakXwXCu1K9999rE/jJqSOr+q+YD+wRY0l1fNAJsoPwQm8aiRaQubQsy20lasqj
	kxjGvQpBT98A6qzAu6s3bcarnYngIUK0wZd4MhmhR49sEgIn5X8xdI4ElKq6hOh4pSa48cCCUXcBE
	ztikNfXQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uc82v-00000008XIk-0iOM;
	Wed, 16 Jul 2025 19:44:05 +0000
Received: from mail-ej1-x62c.google.com ([2a00:1450:4864:20::62c])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uc7ql-00000008UmI-1DeD
	for linux-arm-kernel@lists.infradead.org;
	Wed, 16 Jul 2025 19:31:32 +0000
Received: by mail-ej1-x62c.google.com with SMTP id a640c23a62f3a-ae6f8d3bcd4so40725066b.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 16 Jul 2025 12:31:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1752694290; x=1753299090; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=VY2xY+2Dp3KHgbNVnY+ylp9yfgQzMwwh8U848dtuhZE=;
        b=GYQqWLmeiw28oiSaWdj/kb14dODR0zlDBljdiBsBPhzjeK1irgfGXjaC5tprnH5Cro
         Gc6eQTFy1H+NDTPtuMXX6c4iJyN6fMQZvnZsxCtrqMlBAnPgU9+FZ3YdSL3RutrBcSRO
         MPmtHl6HYnrI675o/1YitjOjd498ah81v/2NBrGM9s06vp+IGf0xZlX/nrxUqZR+/KC5
         6Qf1xSRHxc3dFiY7Z312KLke5rK3VoHoPzr5iZ6Zrvda48BarZHuNzDMvyotMt3Nxzq7
         NrGidDyDRJlxal5K9eh7tksLoPJ0LZLX3NIDi6DVYWymWN3gFwFM4h8ntDoo+5bBtBhb
         2UZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752694290; x=1753299090;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=VY2xY+2Dp3KHgbNVnY+ylp9yfgQzMwwh8U848dtuhZE=;
        b=bmObwUuQKOh1Hwlee8RzA2nQ+Pviyfg0B+ugTtfDsyKWAdZBaHkNvkfK3PJGuDbb9b
         NeUj8zJkY9IMxxW4HVeJrNQPIxMneQR893viiVfBs/Hre8jBS5gIb+XbBopP3eF+dYVH
         sG/QW4TdRKnBGSSvvhMKjV+Jq33Td1jp4ut7n8VfRgfbIcd7YkLAE1J/QBLx32zSdYK+
         sYE0x7nERBd9zMcAxrhE633t3YSfzaMFf4XgjejLH8ltySZ0PeYnmvBHGcBu2F60AZb5
         7Dwul0Om+uzUIPpKgk+w0ijY0CWyluYJ7K0++uREJ8nAegIJDV9llq5QWVEMt0yFzznb
         FOLw==
X-Forwarded-Encrypted: i=1; AJvYcCVXcOsZXKdriw2SeOTMUnziOOJKzGwav7Q3YbVfAVNMB+zPiWN65T4fBIdIre4HTza43N9yNywKsy2D23Py5tBU@lists.infradead.org
X-Gm-Message-State: AOJu0Yx2nAXh6AiPYOW3G7w9Iz8bS8fNuU9iHZfEeznb1jxeKQGXB5dE
	pVNh0JPVXcuSXiikgPsv1ezzskFoBfesJ68Kdl3kPNqabR/LbgWHhlInSZKvjA==
X-Gm-Gg: ASbGncu2Zz7zqcPZJR5m31v3whXf08dqlDs+Hm2183ZqYCS1B2U0Ebh7BhpA7YCQ6ey
	evHSu0PMZfY69UJpQHivMaH4LIxgUl57d0sgLnynUBXEvba/OVHDKP9Pvuwy11vhdY5/TmIJKEc
	TpHffpMwY+2mn3iUTCNnv6huIDzLQETk3pvELOYIUduUtL4NSybsZkQt0q5Cyn8E4qv6MpXdlrb
	lMSzGhoDb4g5Th3q+pn0lQdWdbQ0evELTdq7Xj61+lJ8AbwEMKpdHbCEREFhf/W1F9Ac9YKwWRV
	pHc0YKUcD6iLuOwA2it4kBTd+1sGIZFNlX3nIwg/VhRxzJtngPdmZDaJ1uxDCEwvZO/iQKsRzee
	BU6MIoOg6VSD4B9nxbTac/YiKIeQMOXU8oQE=
X-Google-Smtp-Source: AGHT+IFbzmjXPORehx4gBLWL6nDKMc2K1Ww4NbN3ka9kvo8IrUO2+Ra0huOSILfblCFzf0Qzb5YuyQ==
X-Received: by 2002:a17:906:3b05:b0:ae2:a7aa:7efe with SMTP id a640c23a62f3a-ae9c9bbc69cmr330143766b.58.1752694289556;
        Wed, 16 Jul 2025 12:31:29 -0700 (PDT)
Received: from demon-pc.localdomain ([188.27.131.45])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ae6e82df54csm1226534666b.155.2025.07.16.12.31.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Jul 2025 12:31:29 -0700 (PDT)
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
Subject: [PATCH v6 04/24] dt-bindings: media: i2c: max96717: add support for pinctrl/pinconf
Date: Wed, 16 Jul 2025 22:30:49 +0300
Message-ID: <20250716193111.942217-5-demonsingur@gmail.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20250716193111.942217-1-demonsingur@gmail.com>
References: <20250716193111.942217-1-demonsingur@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250716_123131_337412_E093785C 
X-CRM114-Status: GOOD (  13.72  )
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


