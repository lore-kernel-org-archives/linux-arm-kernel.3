Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E4D4EC7115A
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 18 Jun 2025 10:17:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=twt3VukJmsfIxQG6dHkPe+c3TLZqJ4r3UnWmT1EUVdc=; b=PpxkTHeUumXF9WNGlN2WLhZ/7N
	Oe9JwvJWMVaZ+eIzwcGltOrKS/CXUYFhMtjpGYFc75x0OHdNq199SLd2EfOUvKOyTruBJrW5Tm6LP
	m9PjDJacfm242PckcjidEvKfJ6eSLttgp4zHQC3Acdi/0ozADp/B1yk2lsO2PrV6UMcY+Bf/XZSQg
	W3tusIhPYAu5+gbb0A55FyXfHgRIaSbaMS+P63AHcGXb1nDdkM82rGuXfsO1TnA5BRndZI4qhgQvg
	1guBGQS7pU9kvmxhbj/G2O8SSWB2w+XW1PoMPmVMaOr3wl5xzFTxhd/4UfiKpnBmrk+NHYth+8nAd
	F3iSlmgA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uRprT-00000009k8d-3Cqq;
	Wed, 18 Jun 2025 10:17:43 +0000
Received: from mail-ed1-x52d.google.com ([2a00:1450:4864:20::52d])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uRpZx-00000009gLY-3VsY
	for linux-arm-kernel@lists.infradead.org;
	Wed, 18 Jun 2025 09:59:38 +0000
Received: by mail-ed1-x52d.google.com with SMTP id 4fb4d7f45d1cf-60497d07279so13693262a12.3
        for <linux-arm-kernel@lists.infradead.org>; Wed, 18 Jun 2025 02:59:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1750240776; x=1750845576; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=twt3VukJmsfIxQG6dHkPe+c3TLZqJ4r3UnWmT1EUVdc=;
        b=WORE9VpsQufWTbV1gdoyc3Rq3qkiPuKVK7wVJV/NHxOrNjrqDWmM1JPYa45MWD8nkK
         +LIv13elrkHqO+xEVkHYQ9W3O5YBudfDHA7WdZ9dOpzzbUro1D0a99wNctnIllnMCnCT
         6kHAWEjUTAKdkwGo10xL9p8YjpUwD09Pmw25Up6FLtDbucVDQvsuHXlfT7nwMw5NWYhk
         YzUuiGVOI+zy5KzIhpL8MlpaCs8dC5ljFukrrw8PsVWmu3rphpxR4RnjPLiG4WJjAGmV
         NiwTDUnE5CoMosHhnGWmTPhwIpZ0DFYPoJ9lMsDqz1fXRk55qv9hLJK00RHD7lZqF0FZ
         nZDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750240776; x=1750845576;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=twt3VukJmsfIxQG6dHkPe+c3TLZqJ4r3UnWmT1EUVdc=;
        b=cZxG5nq/5v9Zv+iRIj7O6xVo5i04rJwrDrcVEeCfUqTTdpFZBrCpbd1KrCSXX1Bo2j
         xgg1C5Fa6NkZU5qLi4j+MTFLeCUmK466HR8ADea2CoF6QYJPRIApBPW/InMcY4cHfSvf
         W0QaPmCJ0mbzugquOiQI8gpl2uvSRSq5rvSCxWRq9GoFEsgpE+ZnYu96ihsDPi0b8m94
         KLb9IClwj2bgBTaWSbp8IL3adrBDtbWK8JNEbCFKg0sKj+8g1gcIdAF88EGm4+fPgk2d
         g+AoTFOAOYlGTqEaDZD2vg/jPwjk330bB9suEpe6m7BvFEClPQNiJBPR0UMGPmHZacNT
         Qv/g==
X-Forwarded-Encrypted: i=1; AJvYcCWDKBSmh9LdTtxnjOpv5F415oZhjh9fWkE5uI4X5bGpchYeN/LoW6vN8OWx/sw/fSLTMUSzC5TzWRl1ZvR/sNtp@lists.infradead.org
X-Gm-Message-State: AOJu0YyL6CygR2eVkuyaw0qbgVgfCTwGgBQAK7hOi7ImXJn6ycaHrWFi
	JVi40wiIyxd4zzScs9Cw+5Yf6t4bsE8Umc33KJOtOfmPKtnUCU8Om8dr
X-Gm-Gg: ASbGncv2kkfnWDuFbSxrnfuY8BZOPonrvtZZkpkeYd1GpSFNrCz8gn7fjfpVwhcYLhd
	IPWqdcU3zxEzN4DTqusIIf7nAd0UFPw76p/vbVGiUe4xDErJ+fg59oFVbpuXhrj4t1ACYpvK2Lz
	rctUm4IFmsWQX/jf49vcF51DEApDAL74q98fkErxdPyuwsh4cCzK6Q8K/e8L2LH/2L964FPR7zT
	Lwis7M/D2RHAHK16skt5s+W3A7Y5yL/UaHmQ4abBzN+EXpNqFWxA3QS+PLZ3kVGS9+XdXbUMbSR
	3Czkuqy9uPALPc0djlEISTyTFtyBwhroMErGuTr9PELSWc932aHJVUc+CSDPTyl0aubrWLkrJbI
	=
X-Google-Smtp-Source: AGHT+IFklX81xslJPt+iowLT+1k9njV2LQ7x0hO+cU7atbAXLMnFNCP53dDd5nC929uAPOjrypa8Yg==
X-Received: by 2002:a05:6402:2803:b0:608:1670:efe6 with SMTP id 4fb4d7f45d1cf-608d09c137emr16021790a12.22.1750240776014;
        Wed, 18 Jun 2025 02:59:36 -0700 (PDT)
Received: from demon-pc.localdomain ([188.27.131.45])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-608b4a93b03sm9384691a12.54.2025.06.18.02.59.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Jun 2025 02:59:35 -0700 (PDT)
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
Subject: [PATCH v4 04/19] dt-bindings: media: i2c: max96717: add support for pinctrl/pinconf
Date: Wed, 18 Jun 2025 12:58:40 +0300
Message-ID: <20250618095858.2145209-5-demonsingur@gmail.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250618095858.2145209-1-demonsingur@gmail.com>
References: <20250618095858.2145209-1-demonsingur@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250618_025937_877893_0295B001 
X-CRM114-Status: GOOD (  11.52  )
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
---
 .../bindings/media/i2c/maxim,max96717.yaml    | 110 ++++++++++++++++++
 1 file changed, 110 insertions(+)

diff --git a/Documentation/devicetree/bindings/media/i2c/maxim,max96717.yaml b/Documentation/devicetree/bindings/media/i2c/maxim,max96717.yaml
index 167c3dd50683..5998e2518be9 100644
--- a/Documentation/devicetree/bindings/media/i2c/maxim,max96717.yaml
+++ b/Documentation/devicetree/bindings/media/i2c/maxim,max96717.yaml
@@ -121,6 +121,116 @@ required:
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
+          0 - Fastest
+          1 - Fast
+          2 - Slow
+          3 - Slowest
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
+        description: Enables jitter compensation.
+
+      maxim,gmsl-tx:
+        type: boolean
+        description: Enable transmitting pin value to GMSL link.
+
+      maxim,gmsl-rx:
+        type: boolean
+        description: Enable receiving pin value from GMSL link.
+
+      maxim,gmsl-tx-id:
+        $ref: /schemas/types.yaml#/definitions/uint32
+        description:
+          Identifier used while transmitting value to GMSL link.
+          Default value matches the pin number.
+        minimum: 0
+        maximum: 31
+
+      maxim,gmsl-rx-id:
+        $ref: /schemas/types.yaml#/definitions/uint32
+        description:
+          Identifier used while receiving value from GMSL link.
+          Default value matches the pin number.
+        minimum: 0
+        maximum: 31
+
+      maxim,rclkout-clock:
+        $ref: /schemas/types.yaml#/definitions/uint32
+        description: |
+          Clock value.
+          0 - XTAL / 1 = 25MHz
+          1 - XTAL / 2 = 12.5MHz
+          2 - XTAL / 4 = 6.25MHz
+          3 - Reference PLL output
+        minimum: 0
+        maximum: 3
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
+                enum: [mfp0, mfp1, mfp2, mfp3, mfp4, mfp7, mfp8]
+
 additionalProperties: false
 
 allOf:
-- 
2.49.0


