Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E1891C83F1B
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 16 Jul 2025 19:41:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=OYu3gq0SvKezou7DSttLXa9MnM9KSDxmSDvAl9UefcY=; b=W/Yp/foIytSN/5H0CXHBSZTIJF
	of/Y0YYud1qSven9OosBQpYLthNrXH526Naz0AfzM0Zkvx5DB+rscmpTl1PKK0ijEJ7uqTpHM37b8
	0eDlvJoD8DN5PQdxt+QGj5y5op7WHdWtnKNYVJKSstJ7sShjQ5N72NTg0rNu1RxySQz+0I3d6IPaj
	seADwUI2Rlkq9hmTvjLUIU8OnVaQOAsgFpoA7BOqqbR/mxja5VrkqTUvx6a2vFm6TCxHPZ2c7be0o
	KwGkWRtR11hB0GRXXCsbi8M7C357XMwDckW6jLLUSD+usvKNd0K5iaYT27xwTrPtIBO26/azofCKn
	Ryd8fyGA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uc80U-00000008WtX-1i71;
	Wed, 16 Jul 2025 19:41:34 +0000
Received: from mail-ej1-x62c.google.com ([2a00:1450:4864:20::62c])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uc7qi-00000008Uks-3HaY
	for linux-arm-kernel@lists.infradead.org;
	Wed, 16 Jul 2025 19:31:29 +0000
Received: by mail-ej1-x62c.google.com with SMTP id a640c23a62f3a-ae0b2ead33cso46211066b.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 16 Jul 2025 12:31:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1752694287; x=1753299087; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=OYu3gq0SvKezou7DSttLXa9MnM9KSDxmSDvAl9UefcY=;
        b=KD2jb8Dnwp4KmsxIn3xszWiL40dZ0UdV3cMNTfDCrAPEmkHttzpG0Eyp3PfHRmdF+L
         AT0VHOcZ1q+aTkI0aYp1Lw6r2n9VJMDcxUW24qP1df0d+fnUJkvpqGQt18lKlPWOajQv
         F9ax+2/16NN76BllZEkdEdLyzXwGe+LfLQ3srhafoJFBzlf5BEkyCrvfZv/jcPQsnUBO
         SWxUWlQIUcqW1KY8SXiwcZuKL9pzKrYO8YouUyMiig0alEacBT6UeAtOJAlPMwFhL0cJ
         fOdaDLmitZNgyUj/Aun9JhHUsygghkatAIWSZhRvJClIwzLnNeP25q0ZExV4m53E6lqP
         kQig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752694287; x=1753299087;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=OYu3gq0SvKezou7DSttLXa9MnM9KSDxmSDvAl9UefcY=;
        b=iWGZtdT134wyDF/LfE+TPuYSOl7K3IOGBNfkogusrl7PsPzrFjQ3eS5evmT9LCCA1o
         0R8BghNH5AIhIGm7wmeGQpW81X89C/gFyZL/NXsb4QeAbOmfTZ4K78mZfcZPO7jNhuS7
         lda4mHGTSdid9kRp/rdrqa+zFH1d2wP/E6vgcR7tpoONg2QqEXq9gQjzwJBUd3bxzIEd
         zH689iMrTrSGK2AHn/QAFRrdKnqzHH5RqG4F7EOXg1MTtP3JN9LDN7CQUna+GwbCDf6N
         qzQIIQBKbfri/2Vk3x+9QvkFoCqWfqFKxAsGJyVa3/B7jdwG352ypBAN0oHX3Lc1HrAn
         xV8w==
X-Forwarded-Encrypted: i=1; AJvYcCVFMwRbQptN7k8XqtFcmf/sCfyrUAD1uCLa6sQuvvF/4XMKK09PMYBJ3Rw0mopO9Ym8kNY7nLVyapLEFn1zY8F/@lists.infradead.org
X-Gm-Message-State: AOJu0Yyt8tgi0A2HOSFHshzuOj8GRcpuAjIQeoYzDinaajohFHsvGp70
	vsqdn0n5NcDpVCWthXJy/qwoa2NiY3sLw9C30W1p8BS0G+exHuJ5Vn9U
X-Gm-Gg: ASbGnctu1FYulQ+YAY1kGqUeS7B+tgU/0GKkws+O0BUEIVM5+yqazDOF7he3VL3Lj4g
	bYQ+AFvngkyT3a+Lqx7R3DEH78R0A45arDZ3C8nWFA8zrNnT9emcAnLmWFa4jRWjkBv6qHCyQ0H
	LHdu5w18zJU/WKAK9bgaorDtMlqhOj1sQuxvXUewaPL0JeH8ZbcHeN3sryorWUusafewyPDePN5
	bz6CIJsS3I+f5Y8tnEJpaqckRPMdD7O36qTsZ6bLJ5QCKdvLbXENLgQaDmqpRbBxVw0kaTISDCc
	+1bhiRfMVObfgl/AG36eZw28QJMr06A/bcGMR2AI6TV3V/ANiDyXDAmaLTTSDqoX48FbtpDT/zq
	FE77NCrrGO9B33IfEgNs5d6KuLa6ffx4JVRE=
X-Google-Smtp-Source: AGHT+IE9hyqk0Ays7b48/c7q9YcZueCG0jpD65kEecgbSDJd29bPwrXMO3zJac64DIeLCtVIxzqB+Q==
X-Received: by 2002:a17:907:7b83:b0:add:f68c:5200 with SMTP id a640c23a62f3a-aec4ddb5f4amr47879466b.6.1752694287162;
        Wed, 16 Jul 2025 12:31:27 -0700 (PDT)
Received: from demon-pc.localdomain ([188.27.131.45])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ae6e82df54csm1226534666b.155.2025.07.16.12.31.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Jul 2025 12:31:26 -0700 (PDT)
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
Subject: [PATCH v6 03/24] dt-bindings: media: i2c: max96717: add support for I2C ATR
Date: Wed, 16 Jul 2025 22:30:48 +0300
Message-ID: <20250716193111.942217-4-demonsingur@gmail.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20250716193111.942217-1-demonsingur@gmail.com>
References: <20250716193111.942217-1-demonsingur@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250716_123128_820278_A85AF4D4 
X-CRM114-Status: GOOD (  11.13  )
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


