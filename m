Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D914DC83F1B
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 16 Jul 2025 19:56:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/9ZjlAULE2F6JwrtpvzjiapTBh1bKC7bsQfwLuPPxcE=; b=p1lbsjn3noGM9ey0/pawXTlyC9
	njhMZef9wYG734y3KjX/g60fNxLSqfsleyDVl5ls8ez8iTWrMo024URObxeuMXR/MFKdJ6DgF8eKI
	iY9GWcuZl9VaeOxsi2oF8Bh7reqT0z/LA9CLwWz1ss2FfwhKUirTlABroxAfSpjv7wrfYmWQMF8BE
	1k7OSZxn+aWC+S1zHDPduEFhT28ahumjPql8t/ea9tAH+UA6G4dBseHP3Sh1XiGjwhovqz+ZVezvd
	HIX8fCZSjxXaoxXSTtFzWP7lbBdxc3bKr82nxMTmBFxfNQquW97erOXAp6DNLviJxqONlob/Xa0bn
	/GivRXpw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uc8F7-00000008YSn-1OHA;
	Wed, 16 Jul 2025 19:56:41 +0000
Received: from mail-ed1-x52b.google.com ([2a00:1450:4864:20::52b])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uc7qx-00000008Upb-1igW
	for linux-arm-kernel@lists.infradead.org;
	Wed, 16 Jul 2025 19:31:44 +0000
Received: by mail-ed1-x52b.google.com with SMTP id 4fb4d7f45d1cf-60c5b7cae8bso287845a12.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 16 Jul 2025 12:31:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1752694302; x=1753299102; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/9ZjlAULE2F6JwrtpvzjiapTBh1bKC7bsQfwLuPPxcE=;
        b=Z0FBhrX4Q7pO5TlA0xTc/qsDRybvMA4hrM41FNFdWOYrjr27ehBa58nk3LZRhCS4bn
         rB1uRRo9SVrbOEfHvRHMYm6TbVpT8+35sSBFW6+KsxOJB5EODGK/ATCSaR9O6bAG85D9
         lksau1Z1p4/273yarVgUieOc1XwnNfIaGLh8P55REOX2ntKj+/bIm1YPxl4ecEPEwYRw
         pVzM82ZNFfMC4X/HEBMt6lU2F01/C0QjC3c14ei9zSv8sphXSJoHbpQ0WqmXUXg2cGY7
         Lx5npsOpeLQffcDLTXUpvpPTI77T+Dmi+vTM9seVnfMnLghpghESbFpGW4KP6Jyft43s
         83MA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752694302; x=1753299102;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/9ZjlAULE2F6JwrtpvzjiapTBh1bKC7bsQfwLuPPxcE=;
        b=JhvZ/ReU3Q6eNaT0uzkTZlf8PzC2CB1U2Gr6ptuxyHsHyV/i2R/BXyByG6UwCuOOlb
         ObqjmM8tBzac9bUk6iBXRimEIIeAOGrCToJxfou8ByBv7tCfLtQUgIWT45tw+6Bd1m6/
         5TSufTryB9TxTa3pwvfswNDO24R38P6PO3QTLcE23HBlqcmaq06G6zrpgOV8kG/hZkZ7
         57B6xgwdXSPIeFCO91mFxiL4IIuRHHIVH9EuwYB9cRacFUd2dcSlJYkSxjJxg+Vt3vjb
         VRhOguozjxpb+IDLLCScP6bBbz8Rsdjr8brijJxe+FCyQWJWAn4Gib+7X1uhmlxmJF1z
         sLfQ==
X-Forwarded-Encrypted: i=1; AJvYcCV63O46HuhBdWriMJEy2GCTbvVEjh6XbZBb5np1DDJ5JZc/lpSVWoAIuwOn9HvbV3wCitynBg6CYsonCP1Tjx0e@lists.infradead.org
X-Gm-Message-State: AOJu0Yy/hJE4P+yviLyDFDfwBW4oj6GnTvjBrGcX3L9uWiLHDY8y5pyk
	mJSwRzraWtQB8KOABjm719UF2go+TO9zZD2vH8ojd6ZljXYTyvo9E8Zo
X-Gm-Gg: ASbGncvjzn90Xt9P1fF5AvXnqG2HJuMNvxKiO01VQuM/E0Mk82lSOkydN42o7QUomzB
	EoFkRqgfDIFO0Ri1/G7Fm3lzJIqlBYaffDlJIQldxhY8GGXY9JBGSIt+So+P3ZJUwmL4wUmBbdQ
	8o84NhJJAfhs2Ngyd4Zi0JSAmn7Wgrv88oftJSJPvRH/072ZqBth1GWD3ULun2sCdKStmy1QKQf
	EpeuePlhKMEBg1rDpgTYiJTTfBP5kpfyBimezs14rocOCUpnhrIZ7VPV6I93nBKXO941HV4l5uz
	B/aQQ+TtswG+u5SkGCNS+QlELpM8az8TOvxE0P261g4sB3CDSashUijw8rdx++6cFxrmgrxRRP+
	hY1liWZNhrBVkM9lqMQNYaFUtXzI9ccDm6DY=
X-Google-Smtp-Source: AGHT+IGWB8JnqcECTM+zd1hdAZU/6u/ztEZSqRZvwwB+hZoniDZyCdEYMcR5tsg96ZGbyZYcc5gqSg==
X-Received: by 2002:a17:907:f1e9:b0:ae0:635c:a400 with SMTP id a640c23a62f3a-ae9ce196c5fmr363790166b.51.1752694301709;
        Wed, 16 Jul 2025 12:31:41 -0700 (PDT)
Received: from demon-pc.localdomain ([188.27.131.45])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ae6e82df54csm1226534666b.155.2025.07.16.12.31.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Jul 2025 12:31:41 -0700 (PDT)
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
Subject: [PATCH v6 09/24] dt-bindings: media: i2c: max96712: add support for I2C ATR
Date: Wed, 16 Jul 2025 22:30:54 +0300
Message-ID: <20250716193111.942217-10-demonsingur@gmail.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20250716193111.942217-1-demonsingur@gmail.com>
References: <20250716193111.942217-1-demonsingur@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250716_123143_460521_D0B7FED4 
X-CRM114-Status: GOOD (  11.51  )
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
index f712d7cfc35f5..758c0223977d4 100644
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
2.50.1


