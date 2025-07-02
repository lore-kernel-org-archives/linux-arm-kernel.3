Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BE3FCC83F04
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  2 Jul 2025 13:42:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=1wwEKc5F7Hqp81pD5zW4YT9WxlrKCAXN/iB/acg9N9g=; b=EnSt5E0rSJfDejEnpC2YzgALs1
	fPZcdFRRoXCFvDcDC7n+OWpowyAH/39Cor/1tooIasJe4ZRwtf/Km+dg22gI2Y/3lhXJiex+x5aHR
	VC9TZ5Gbp76zIAwYMt6RnGWbuqPx37ny2l50DHbiBtTR5k5/c5fcruHWMMvD3QNGSG5OjKbKOBJpx
	iIMZpGHWS9QxUcpQQNLnRcRFsfu17uTpC23FehSwqjDH16jPh6TjqtQc6N8eOM8hX9/h0YHUC5Dxr
	VfWK3EECS8c1Fx+2X2ZzMSrwsr/6ha/FKZ30XsqntZox0+Ji5ErXbjzaAzN4tbJ+ltWut0gLtYDFV
	0J0ocG9Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uWxiw-00000008VAR-3SbC;
	Wed, 02 Jul 2025 13:42:06 +0000
Received: from mail-ej1-x62b.google.com ([2a00:1450:4864:20::62b])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uWxOr-00000008QoW-1TOe
	for linux-arm-kernel@lists.infradead.org;
	Wed, 02 Jul 2025 13:21:22 +0000
Received: by mail-ej1-x62b.google.com with SMTP id a640c23a62f3a-adfb562266cso1098403866b.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 02 Jul 2025 06:21:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1751462480; x=1752067280; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1wwEKc5F7Hqp81pD5zW4YT9WxlrKCAXN/iB/acg9N9g=;
        b=Yhd+cAkk0K0H9zjXc0NFLNH9BcKaB9dc81ifGhtIK+dJvKtgk9jg5y34nKKOcvfcpq
         0sF3DPcrmVFgIzRunrpP+B9NDCwFIaDB9tTwGZMiswJ7+BGsMt/kZqwpwfCO7zYvmbAh
         xH3w/wC4Vo2ZWZJPjUpRXw74/49jlyaMnED8/viCwwNWye2QbLGVu6iet9BtH9VfxCau
         nEs5JULXpfzRis1coApfOHD0SK0nicNOPKPKvfpaw0huZ+6pVE2tYmKJtiYZD3W7NUb3
         KR+0rObVJjcsnwh+qOQOUP7vaaAWpcm8zVUMVit2Wr3FjTLcoU4mUcYhfDvFWPBtq9I7
         Mjrw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751462480; x=1752067280;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=1wwEKc5F7Hqp81pD5zW4YT9WxlrKCAXN/iB/acg9N9g=;
        b=D5vte664l3UvIk+JYxgygwwpkn0DTiZophqJEZiQsyy9LDe3mu0Yb7QJEaGcOIOFeD
         OIo+ami8lbwMWg2PgakP63lpKEzchMpm+NAa//E0iim0AvFlJt3bFbK8dPp67w0k+LE4
         oYDbiiHm+Xz0ynWhyPx+BIgkwqrK93/ghdfBMDKmqaurH1dIkGhdiG611mpgwkvD5G/i
         iBxm1XeyjdjHz9aibR/yg2C035YWxHtM5/5cdBOiiByWR5g0FrCcS3isqAzWE+xucn/n
         Bl8FN+MZNctRZA0ZlTPgO2eoo50/ssq1XVpzdNjUYB0fItSdBsmM8iMUqH180VVbh3Bz
         riwg==
X-Forwarded-Encrypted: i=1; AJvYcCV+Rhmgcfz7/u5datTuSF30PJipKfR5Raxvnr35iFq07vKgKhDbbe+eg0zca31jbagUqIESZDmGE48idwrme2JW@lists.infradead.org
X-Gm-Message-State: AOJu0YwbB55YdiXd+4MCIwyN769CL1tVaqbgZ8wzasTk6WzOpZZiItKL
	aLfPvEGynoapbUaXdYZgegpIWMQDxlb2N0Z0k6BS2YINcfbqtMmBYa6h
X-Gm-Gg: ASbGncsMA3brlNw95hpTyVEj5OGk+CswN6HSjjSrsJT1wywheJ/XsKfZUXmOxdVxxgh
	L4huiUpVxDbbkLMfZmcUk/NfJn+av8YBskVtBmThQWhUTRR9R+8GBVtNAZ3FTFfgXqNBwaOsS9j
	uZwfPEifrjSEKVMShnDZkY2jLmotDLHTuXH2rbzv8+YKgI8g1sNT3yfOqrg1zD8S+fp7AMRba7t
	SdguYAuXzi3gLbY/lhKheLjc02ufuhMmBKMgPpEkfjmwjfX7VOlsXZY3FInAWvuLMQ4VgAfdHO5
	4UGzNOoIbLQj1ALvWx9TO5mWDj8UMQbzIAd2xGPnnAThUJCXcd68h8tra7qiVzHfjaSH7xgc7Jw
	=
X-Google-Smtp-Source: AGHT+IHvtWJAofgeCW5hFh4rua7c197JsMsYxoyHXe9CLnAs+7Hh4VVKnq6/7oDPTZuf7PtT37kJfg==
X-Received: by 2002:a17:907:3f1d:b0:ae3:b9c3:ddd7 with SMTP id a640c23a62f3a-ae3c2d5fcbemr280701266b.45.1751462479504;
        Wed, 02 Jul 2025 06:21:19 -0700 (PDT)
Received: from demon-pc.localdomain ([188.27.131.45])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ae35363b094sm1063800966b.22.2025.07.02.06.21.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Jul 2025 06:21:19 -0700 (PDT)
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
Subject: [PATCH v5 04/24] dt-bindings: media: i2c: max96717: add support for pinctrl/pinconf
Date: Wed,  2 Jul 2025 16:20:30 +0300
Message-ID: <20250702132104.1537926-5-demonsingur@gmail.com>
X-Mailer: git-send-email 2.50.0
In-Reply-To: <20250702132104.1537926-1-demonsingur@gmail.com>
References: <20250702132104.1537926-1-demonsingur@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250702_062121_406534_1BA3B6FD 
X-CRM114-Status: GOOD (  14.17  )
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
index 167c3dd50683..9afaa8a7a3f5 100644
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
2.50.0


