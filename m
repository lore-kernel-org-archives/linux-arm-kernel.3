Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 898FAC28B28
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 12 Mar 2025 10:59:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=p1sMzDBP5vuN2BAfvXEAvEWElSEvZrTJL7A1Fg+i1ek=; b=k+QZqXabPCNt/kBEM67Jgpjk/E
	+YKhbX7PrUSn8Re8ojvyXjz/85mX6hrzKRqozdb4oTb1ZP2AoGkeSlPi9zRKSls7cdnwZ0EMgxkjd
	KAQPAUsivulcRjIxHbwHjLCK9lPcldIHEQhD+sq/DdY+01lVgHIMbqCV0hVBS3XRGIw61bgTiH9cx
	6oTu/rpSiSXqA3j3vDFXukvsf2CHb+6OgHxQNBCDZLrxlZyQq5GIwlFRM3dzGkOjEsDXERV16dSsl
	Xhc9iCqk61ouZmfve5Cfk9AEJK7Dof8rGUB3HlWc09CG+hOYXkYOuwiMCYsO46aWwMff2mQN22CFM
	MeU5qhmw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tsJoL-00000008C5J-2Qkh;
	Wed, 12 Mar 2025 10:59:41 +0000
Received: from mail-pl1-x631.google.com ([2607:f8b0:4864:20::631])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tsJZ6-000000088ft-0qCU
	for linux-arm-kernel@lists.infradead.org;
	Wed, 12 Mar 2025 10:43:57 +0000
Received: by mail-pl1-x631.google.com with SMTP id d9443c01a7336-2239c066347so115901585ad.2
        for <linux-arm-kernel@lists.infradead.org>; Wed, 12 Mar 2025 03:43:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1741776235; x=1742381035; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=p1sMzDBP5vuN2BAfvXEAvEWElSEvZrTJL7A1Fg+i1ek=;
        b=bmaHnE0tBBXdBvSDMRlX/SlbHkBL6/Kg4AdOvEAA163c9v90AQsyqq/CNcvXhk17mx
         +OYRppPE5l/jTVcz8IrMeFMByHePYjBP4lM/KjWmo24g5nINDyxRqNL5Gt3YXjCFP8DJ
         leUwbFh0iwZTVtbyqhP1oe1sLu2p9ANsdlQJA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741776235; x=1742381035;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=p1sMzDBP5vuN2BAfvXEAvEWElSEvZrTJL7A1Fg+i1ek=;
        b=e8dSKKXKbbzxCUu6hC3iNsTscPznJPxhpT28V5/GHHhD7ReLbu4ggQ3W9Y3BOTLgv7
         GX4jSchHDkPTwcG4HG4ROaNbf7CCrJhbEgNFFWPU7icaiLJOXehMjhKg1JFz+8uOHiGK
         R1bdYwtMny1vmy2/HkGIVF0XgnY+dvEUoBZJceaAwnCcGNSYUxu4/II+pysXzeYqvxMO
         rNCxysCYiyNBxhT+WdcsC7+RtOzutKk14fTAdK4vousEs419HR/t6KoOWR4WgjYVTxsy
         YTIF7sc3mUZo2N6mI2pTlUU8TC0LjpxWUJKez+qx3y2JavIoE0NS9hXGIP6BymvqNlj1
         bjkA==
X-Forwarded-Encrypted: i=1; AJvYcCUnd8U297uFqvX8d9FhXJtL6ur2u2L73RDsUFqxjaPZTUEi3x6FIrQidUEnWjbq2KRvBOAijnII1XbzN5GBK0YM@lists.infradead.org
X-Gm-Message-State: AOJu0Ywdx3MZgFMjmsgDt5EsAwIO40SOiZpOVNyXxTU2fhm7QjGy2bTS
	2t3RmHxjQj+gwq0qoLSzskALKsvUa3kaCz5CTk0kmvLK0wyCYke0q4WP7CCXEQ==
X-Gm-Gg: ASbGncvB/v4vnie9AHEHVyqRZ8rTL3eGbdUTTL6z2ig3HtKIfkWntb5HMXFaGpUiuMu
	1M1h6eyGQOl8QxWPa0tz0dfwFeV/PA7q88Mo1zhut915a8707MU2nTt4xg1QffNm/GtrE9zr7IW
	Yzj3/qBH9omsbOh5WrNAcgdpc6v5eMOdYtCvX81Mu73X1dGP8xjDLsWmf/M2mjr5xzhuQrHxAJ4
	cUA2IVpFf6+R4U9eZ3b3SjiMSugI0Qxv2ifXOcEm+m7Pn7mpJJhWrbTg2Y4JAAtqUG9w++g4Wrj
	pZ6wlicNdirR16qf84ouIZ5V91xOv/pEsnIfvqhch9ZSjQJJMtzY7h7bi1ct1P/RkD/DXznTnw=
	=
X-Google-Smtp-Source: AGHT+IHVXoxHlRkSlosQqT/eYj9vz6fvVJZ92k/ncUOz6qh5Nk9iYgHkhQ9d0PdxTZIJWqbKDgo8qA==
X-Received: by 2002:a17:90b:2d83:b0:2ee:e518:c1d8 with SMTP id 98e67ed59e1d1-2ff7cf22df2mr28755341a91.30.1741776235345;
        Wed, 12 Mar 2025 03:43:55 -0700 (PDT)
Received: from wenstp920.tpe.corp.google.com ([2401:fa00:1:10:b5ed:b71c:fb14:a696])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3011926599csm1405675a91.35.2025.03.12.03.43.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 12 Mar 2025 03:43:54 -0700 (PDT)
From: Chen-Yu Tsai <wenst@chromium.org>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Benson Leung <bleung@chromium.org>,
	Tzung-Bi Shih <tzungbi@kernel.org>,
	Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc: Chen-Yu Tsai <wenst@chromium.org>,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	chrome-platform@lists.linux.dev,
	linux-input@vger.kernel.org,
	Douglas Anderson <dianders@chromium.org>
Subject: [PATCH 1/8] dt-bindings: HID: i2c-hid: elan: Introduce Elan eKTH8D18
Date: Wed, 12 Mar 2025 18:43:35 +0800
Message-ID: <20250312104344.3084425-2-wenst@chromium.org>
X-Mailer: git-send-email 2.49.0.rc0.332.g42c0ae87b1-goog
In-Reply-To: <20250312104344.3084425-1-wenst@chromium.org>
References: <20250312104344.3084425-1-wenst@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250312_034356_234248_3301AFA2 
X-CRM114-Status: GOOD (  11.77  )
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

The Elan eKTH8D18 touchscreen controller is an I2C HID device with a
longer boot-up time. Power sequence timing wise it is compatible with
the eKTH6A12NAY, with a power-on delay of at least 5ms, 20ms
out-of-reset for I2C ack response, and 150ms out-of-reset for I2C HID
enumeration. Enumeration and subsequent operation follows the I2C HID
standard. The eKTH6A12NAY requires longer times for both parts.

Add a compatible string for it with the ekth6a12nay one as a fallback.

Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>
---
 .../bindings/input/elan,ekth6915.yaml         | 29 ++++++++++++++++---
 1 file changed, 25 insertions(+), 4 deletions(-)

diff --git a/Documentation/devicetree/bindings/input/elan,ekth6915.yaml b/Documentation/devicetree/bindings/input/elan,ekth6915.yaml
index cb3e1801b0d3..81c391952ccc 100644
--- a/Documentation/devicetree/bindings/input/elan,ekth6915.yaml
+++ b/Documentation/devicetree/bindings/input/elan,ekth6915.yaml
@@ -4,14 +4,14 @@
 $id: http://devicetree.org/schemas/input/elan,ekth6915.yaml#
 $schema: http://devicetree.org/meta-schemas/core.yaml#
 
-title: Elan eKTH6915 touchscreen controller
+title: Elan I2C-HID touchscreen controllers
 
 maintainers:
   - Douglas Anderson <dianders@chromium.org>
 
 description:
-  Supports the Elan eKTH6915 touchscreen controller.
-  This touchscreen controller uses the i2c-hid protocol with a reset GPIO.
+  Supports the Elan eKTH6915 and other I2C-HID touchscreen controllers.
+  These touchscreen controller use the i2c-hid protocol with a reset GPIO.
 
 allOf:
   - $ref: /schemas/input/touchscreen/touchscreen.yaml#
@@ -23,12 +23,18 @@ properties:
           - enum:
               - elan,ekth5015m
           - const: elan,ekth6915
+      - items:
+          - enum:
+              - elan,ekth8d18
+          - const: elan,ekth6a12nay
       - enum:
           - elan,ekth6915
           - elan,ekth6a12nay
 
   reg:
-    const: 0x10
+    enum:
+      - 0x10
+      - 0x16
 
   interrupts:
     maxItems: 1
@@ -58,6 +64,21 @@ required:
   - interrupts
   - vcc33-supply
 
+if:
+  properties:
+    compatible:
+      contains:
+        enum:
+          - elan,ekth8d18
+then:
+  properties:
+    reg:
+      const: 0x16
+else:
+  properties:
+    reg:
+      const: 0x10
+
 additionalProperties: false
 
 examples:
-- 
2.49.0.rc0.332.g42c0ae87b1-goog


