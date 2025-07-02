Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B9657C83F04
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  2 Jul 2025 13:56:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Uf9YgoYEo+P3FEMg9oTzk0PbyhLHnx2rt3ig4G7w39M=; b=Z+eYmOU/Wf6pLLZyHRYvqJZ3Md
	JVzDcReWQcWNVBo3QTBTW5xhZANAQUzZTVKFQIIu3IxH3ePZU79x3IgC954TqrgGwnymc/Z+jMUkv
	EJcHdTXry94otQ8NgmVGd2BBvxuHPb3T0qzGOSuAw7qXNfkNw2oUB6lqIsCAaQLJQ4YyY16oujCu6
	XpHrBCoX4G993qNKYRCyUu15Wz66suq0p52XRTLFuay8w9kZgQNnqpcYZmw99fzr+EGmP3u7E/vE4
	1kTn+L1PwSoDlTclWXybCcB0YHHLBtNNczl+cyj8SrCAQgeYaQvZ9yiyeTcuLMSdso+mMojO5XDo7
	lvw0MV+w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uWxwp-00000008YH8-0HW5;
	Wed, 02 Jul 2025 13:56:27 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uWxP6-00000008QvZ-3A2t
	for linux-arm-kernel@bombadil.infradead.org;
	Wed, 02 Jul 2025 13:21:36 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=Uf9YgoYEo+P3FEMg9oTzk0PbyhLHnx2rt3ig4G7w39M=; b=AJviVRnlkfhmR/ilTpJCnAqQKT
	bNRMtyhJRxeVk5ig6NHADniPP05Btfx2gUrgvbBwcryhN4GFrj3wadDC0kGHmnEZnQ9GPGc/yyiSZ
	R27Qy5eC6bpW/5sRoA2yj6xzR80TN4dh+L04y60M3FwCgpw9NhkpDkGG2F1dERxuXO82NLpcwbPeK
	18B2BqpE5WIzhv3bLZJj2lbWqssFoBfs5nM8eSq+M2fnn4AOdpWLP/e0UTEdgPBIT1Jxja69mATg2
	drFmQq9DjlMwPcBrRn5hr+Zn/JaLOOcZ4fn70DVNmQGfOG60dUdr4PlKdeZJx6Q+8aWatqOg+X5hC
	yjYRraQg==;
Received: from mail-ej1-x62f.google.com ([2a00:1450:4864:20::62f])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uWxP3-00000007PFw-2gEf
	for linux-arm-kernel@lists.infradead.org;
	Wed, 02 Jul 2025 13:21:35 +0000
Received: by mail-ej1-x62f.google.com with SMTP id a640c23a62f3a-ade5b8aab41so897571466b.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 02 Jul 2025 06:21:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1751462491; x=1752067291; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Uf9YgoYEo+P3FEMg9oTzk0PbyhLHnx2rt3ig4G7w39M=;
        b=bARuQvjlrfSqOrn6Wmy4RWVamZYr9FdZ41GVm5FC9qE7vRTwdNTDE4TRfXVQOpIs7Q
         e/YHjgrYzT3c8ZTpxTVup9hs9reHwdUVEj1yDZQJkiUb7y0egO76mNCu8RCtoQ29YKpg
         4ALBDB34QkHYUq/RghPYOHb6soKG8zPzwjZ3c84cjMrgI3le0z6utna9WGFFMg0H55ne
         6Umzs+LbxTaHfpUkbOlxGEbq+ZC0ksBdirJ//vp8PJz3gy8fZRQZPdWg+HUbYyS08TAA
         fa57kWVBhX9Px563x3rSKxKqyTjmwdfPK7g1gxOY/89PW4HZqkgtNKFeXDVOFO1mN9Re
         Xirg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751462491; x=1752067291;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Uf9YgoYEo+P3FEMg9oTzk0PbyhLHnx2rt3ig4G7w39M=;
        b=WHKKTe4S6HQ3l8e1Ovbkbe1AqEVc+r4deJkJ8pn7/1T2kd+MJaYKlJ2+Udcx1/J0XV
         Xya5bmk5qktlvpQ3EeRYDFwLQKQNcWlZV1AWiU67XjI/y/BtJRg4T3GaofGB2NJST9mx
         vMJATylS12u6gIDZE0e5hXPJ/kUosjHca1LCr4xYstuEWsehoMg95+RAoYDpWpmj5kQe
         CN/gsikGD7CRQZTCrWbjUQeoMUuJBAFVMRpv7mPrUcPhrZFc6k+GqgwcZKrrAW5lv47P
         +k3/tJFXT92pY2KlaaVUJc0KCAJGV117thrp/b/yAuEP5aOKGV6LyyatrlkV1QCenzv2
         gX1Q==
X-Forwarded-Encrypted: i=1; AJvYcCUfuHrDt/zHx9xzc3zh8IgjHcR/HHHhPpfvaCFZbzxYvH3e2jdI/k6XOmfNiUFNE7JwuDih5Jw/bmlnwFEakXeK@lists.infradead.org
X-Gm-Message-State: AOJu0Yz4Q4SsotBYGYMuIJoOL+RfewYvM4VETezHOtN0AgTuHU2P6H/c
	U8G0DFrsqA50LGZf2H3OZTaDxH6RDyvoaZwNIct/5reqx2AYpBCpasbj
X-Gm-Gg: ASbGncshfzihlbVZUwlUtHhLO6/GWYRbuOwGb5HsN2hhVNcM0mgXphpH44rafnVrsu2
	SKv1l5LCOfR/4hiRs+lr2ZsuPNSV9+bWybq+kKkM5PdxB7zOcAV6gvTR1UVjvQScmGwyeUyAkQX
	p6rwQJH0PVS9ZU/f5zCaZ2bxUfePw+rnZJQI05rvl4Mv3q07V1I9OHiEu0y0GUJXclqzUStd4d1
	2Ius5ddLwwz1pamqxHvYXv+zK9SjK46oKTrXbUYzotmiHwkOC/o2vIGxKCAa5/CYRbL5KAUi5pf
	o85nE/sgPDKXhzVhBUTmrUkHZs+0tq/KvSfVuVhc6sSgsstusOeUAalDYvmJ+rY/EMjcrPfMJac
	=
X-Google-Smtp-Source: AGHT+IEVB4ll9itBxDfBnk9pldAGA6HiQ0uN0SNjS5Ea5oldB9uz1gq8sAy7mWtaLvGL1PJ7vmEutA==
X-Received: by 2002:a17:907:2dac:b0:ade:4339:9367 with SMTP id a640c23a62f3a-ae3c2aeee6emr283944866b.26.1751462491004;
        Wed, 02 Jul 2025 06:21:31 -0700 (PDT)
Received: from demon-pc.localdomain ([188.27.131.45])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ae35363b094sm1063800966b.22.2025.07.02.06.21.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Jul 2025 06:21:30 -0700 (PDT)
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
Subject: [PATCH v5 09/24] dt-bindings: media: i2c: max96712: add support for I2C ATR
Date: Wed,  2 Jul 2025 16:20:35 +0300
Message-ID: <20250702132104.1537926-10-demonsingur@gmail.com>
X-Mailer: git-send-email 2.50.0
In-Reply-To: <20250702132104.1537926-1-demonsingur@gmail.com>
References: <20250702132104.1537926-1-demonsingur@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250702_142133_791137_F896F350 
X-CRM114-Status: GOOD (  12.19  )
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
2.50.0


