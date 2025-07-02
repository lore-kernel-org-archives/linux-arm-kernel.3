Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8BB62C83F04
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  2 Jul 2025 13:51:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=KXo7RwJkGdY7uM9iH8W5HiYNzQJHvSV6wI6qYgD9ZKM=; b=GPANIdgS8X0oqX6H9dpZf1liHm
	DgV28idza+rSM9xWJtFDf7ymLr7axfjzmZyjgvUwrytup1n/1V5nJNzKmDnspzM3gDF3c1P5EUZDY
	/9823+d+1HrIpBt/J3RBtvEmVhnB9h2AkvYuvJdhUqEWTaLI9+t4MEqURwuG5C3rK7EBR6TtP0L3F
	9pRY0+3bzP0OFr4tNrhc3MziEoQ+SVsjGww45VZQDlSXedI/PZzXr4vI0Mj9MwqO0EAyEXXkQrx/z
	szfuWb2iJ9l/CcWkVylGx3NAkAQYQXI1fwWXj4jmzZ4Rw3ob1z0ddFoPTJ2W4cvCmpyy66rbXt88n
	cCjoHQrA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uWxsC-00000008X7k-1ESq;
	Wed, 02 Jul 2025 13:51:40 +0000
Received: from mail-ed1-x536.google.com ([2a00:1450:4864:20::536])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uWxP0-00000008QsS-2dZt
	for linux-arm-kernel@lists.infradead.org;
	Wed, 02 Jul 2025 13:21:32 +0000
Received: by mail-ed1-x536.google.com with SMTP id 4fb4d7f45d1cf-60c5b8ee2d9so14725269a12.2
        for <linux-arm-kernel@lists.infradead.org>; Wed, 02 Jul 2025 06:21:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1751462489; x=1752067289; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=KXo7RwJkGdY7uM9iH8W5HiYNzQJHvSV6wI6qYgD9ZKM=;
        b=bpDAUb4BmyRktHIJLtFi0nOe5bWmt4UEMORbdBRcU7jAmi2NewyRoSVB4eya+gbLYZ
         jF3FfeOIdS5wAOrnufL+EaM51U+4XK9tfsf8kELOxSyiNYH5f+Jkf4nBDHHXOJlSBSpW
         S16aTt++ls3xSg+S/Yn1IuPjcNpuLtasaCP1N82tGf+faFafabLqLkzcLObMguz77qT+
         tN6hGjy82vGTNOUgmElhIHbj5JFZ+uaEgd0pgaaTKyhbWaQ7GQWeTjefFX+pFWKNN91X
         cXFsz3xG5yMtGtNHyKO+l6Pnct8q6CFKCZiwNwPt2TbxhbeqWbH7nvUFNw2/zpX+IuvJ
         Nwdg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751462489; x=1752067289;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=KXo7RwJkGdY7uM9iH8W5HiYNzQJHvSV6wI6qYgD9ZKM=;
        b=qy9X95/aYK6DA+sWpYnXeYheEPJfv1AJIa301FmBAm8NA6c/+SkUIjTxOIlcIlGc3e
         VJ8vqHbGEOQKVHCw7Dz7jpbh3jUP4Uzlr2Jlcm6dcnZfWfAd65Xz06YiMjcb5bXp+8Ke
         ErFC8b/LsTA1Wft2oMgd+kg9lXORB8upNwkn2T2hPvfsHCTSfdbpF9oyQGbDjRnSvsn5
         pQzCzXIY6qjskoMfBE/AL97duAbnShCBUVrU8kCrmybU4SW2TduradVEfF1GqiCISCN0
         65wA64NgINsk4CDsBlVaaKvi9RSIhV/+EOs1dXbXeRHJdmFZLEPeq2llqWfE6m68Gqx4
         xZFQ==
X-Forwarded-Encrypted: i=1; AJvYcCUgV98O5SlTm/bkeIDSl1X1HOx27c5U4H5RYo4PedESrs8bkDd2zub2NWhbMTQSikewpEXo17wGsRmBQ3x0ikzP@lists.infradead.org
X-Gm-Message-State: AOJu0YyoimlLwqQkmdFWjh92Huq4uN2ACp6zDWXMhBKIw7dt9s/PVW+G
	f/cUPeJvJ789ZjGuXy/UolTZ3RHre6DmZHAiTdaKSpkrsnjIglxKbNNX
X-Gm-Gg: ASbGncuzPYK2sbo9a2n+61z1sJNlR6T/bnfxmxezbNNggfEKWtDiNyxg1LSYGzr0sDf
	DeFttyg2klj9ib+0PwUpP6CeWe898diSsF6b68p4vEBNmmcDdlgpCi75B1GM/NlOrLC3pUOGnPA
	5sTVA35cY7kY3/JFe56VUpC+iMyA8HdcktWx0U5fVwCJoZCZ2VNWnjduOsPu6z/QNf+JKe/fZXN
	PvXWeVupHvS3EM1pPflyBXCUTpt4pRVU+MsO1bScNpqDpeC0Mlh5Pm7BKmB/shiiRqTtWSCU05y
	L45EcKUAOWo1RBEAaTl6y9W3WKufhsOZrGn/nbqcapx1z3qFcjKS202Gza+lQ3rZP18bILI4ZaE
	=
X-Google-Smtp-Source: AGHT+IHTtF+lt1S4NFZQvii0Blm1rrAjgb5g9dP5Vwg0W84+je/og3eED034lCfhI7vq9B1qdE1n8w==
X-Received: by 2002:a17:907:9816:b0:adb:469d:2246 with SMTP id a640c23a62f3a-ae3c2b01b35mr292245266b.17.1751462488815;
        Wed, 02 Jul 2025 06:21:28 -0700 (PDT)
Received: from demon-pc.localdomain ([188.27.131.45])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ae35363b094sm1063800966b.22.2025.07.02.06.21.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Jul 2025 06:21:28 -0700 (PDT)
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
Subject: [PATCH v5 08/24] dt-bindings: media: i2c: max96712: use pattern properties for ports
Date: Wed,  2 Jul 2025 16:20:34 +0300
Message-ID: <20250702132104.1537926-9-demonsingur@gmail.com>
X-Mailer: git-send-email 2.50.0
In-Reply-To: <20250702132104.1537926-1-demonsingur@gmail.com>
References: <20250702132104.1537926-1-demonsingur@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250702_062130_665637_3CB7F3AB 
X-CRM114-Status: GOOD (  11.49  )
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
index efdece2b33b9..f712d7cfc35f 100644
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
2.50.0


