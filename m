Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6B1D6C83F17
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 18 Jul 2025 15:56:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/9ZjlAULE2F6JwrtpvzjiapTBh1bKC7bsQfwLuPPxcE=; b=DRFAXR2wY+f27iF+cyVnNgzm7S
	w5H3PjQ7G/6R33jGRKPMrEitIemkJj0Lt0+5GeC/hACnH+vTEW4K3UKVDuuWD6Y4wfR9P8SrVblOS
	IhYYRMD5rlT/gnVaoLe+dVsSpojKrHjwMqG7XVV/cULbbxuMovTImMyngCxBlzOidDpkNw68A/gjE
	i+p1sCq4SOPjyNP2xTLnRaMMZXNz6x5X5juUHgGHo/G6NlB+zOavu6ycgclJ5k7MnHhJn60HxFIER
	2URtkxOSGkJYRM0oFjV/AaPUtoehx4XrItKKQOwBnBvPcupHvq3Mz9xK22j3bFRboo1TwE4L7yGZc
	U/4IMPZw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ucnRZ-0000000D17C-48hk;
	Fri, 18 Jul 2025 15:56:17 +0000
Received: from mail-wr1-x431.google.com ([2a00:1450:4864:20::431])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ucmxq-0000000Cvsr-1vKY
	for linux-arm-kernel@lists.infradead.org;
	Fri, 18 Jul 2025 15:25:35 +0000
Received: by mail-wr1-x431.google.com with SMTP id ffacd0b85a97d-3a51481a598so1159963f8f.3
        for <linux-arm-kernel@lists.infradead.org>; Fri, 18 Jul 2025 08:25:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1752852333; x=1753457133; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/9ZjlAULE2F6JwrtpvzjiapTBh1bKC7bsQfwLuPPxcE=;
        b=h/PoSThMbmydmhvxe3WL8gjntjDdJXqaUrcjlyoHxfE3EiTXnTZwpzuGsRBjuWYnLD
         xc9JL0XHno78NhfLGCbwuZCy4UFVn/icRYrmaZm7gSGP4jEQ1smOCXuVe3fdxSh0P9Pe
         f+G82ha7IpdexqC0LSjFxORInU+Ci/VCD18oF4tWlCfFhuUwqOtlMcrnsuu6eK0tnGGa
         qS71CrSyVPANHbl3gEYzHGb6eckvqMJPfUO7mSBTdAKSqP2AF1rsp8oyQBErcnsrifw0
         xhM0XCBWYZ+D9L73fMCocaXSDWXkgLJWhYuS6LdarwS9LojDBpjhJ2y8/9TsrYS/utD0
         In9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752852333; x=1753457133;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/9ZjlAULE2F6JwrtpvzjiapTBh1bKC7bsQfwLuPPxcE=;
        b=WpwvBK6H/i0+PUwoKPsvYqxf1rJARUAjZcx1lq6V3efJg5HMzHJkcVesX0E7cB/MgQ
         K3oy4KJpoavh5xNgxTVfJPl5zCP7S1xYn4RKwGcs9P4A73WHw+TP/KjVVSKn0Lumr5Vj
         mfctqNn2mgZRwvTYdfwjT0sYKhmfjfdHZ2YEOJa0EQPM1MJ6vFcdPKibDlarVvz8rilN
         VQ/WtE/SbnmMzZxYxvBnmKTjyWmN96jIx0dj4QnUtejdQe7nftp+l7VkMYmj2XKYATKV
         mRQw/Z5pb+Hykz5ZQ4PCZc8G/NlcBKsCQofLJvKkodPG0eqzjlJ3otOSD9VMh9AtIXRj
         WTdw==
X-Forwarded-Encrypted: i=1; AJvYcCUkssC0A/SET8HZgvt3GodHI67UyM6gTCJlkkbO1XdaX8VxSS5dFbjdBic3aqKPIusFogxMdO0MS8VAvGtioHt+@lists.infradead.org
X-Gm-Message-State: AOJu0YywYxiBUL8YQomibN1rfWJLPcMVCAWgOATqEyl24XOElaEjfyVl
	RThnsx4MXWYBUS/sdqIbiOrh9mRtIcrE9YpLCe3c59jJs4QjjXvMOJ6lsZljmA==
X-Gm-Gg: ASbGncvLtMpn7M9OIxM3Kz9Ja1NFgmyrJQm83PZm7F4JpBA4XD/JaI+G8f5VtDOinvk
	hQ6JOYqnztR3t/B4Jvd4S19tO8MdmP4yE1Fdz20VGwSK1ES97NjoFk6GJSSq5XqAXHH1svBU4Uw
	hwaIksUCAgjP9YB6xHTAAcHCVXCjcBs3O5uFielfXjznuqA8sLgFA2YME7gHvh9HtikT7y3LcFj
	zF4+L1GXXg45JMic/jLWgXymtGiIzMgrBqvAYgE27tRvaX0YsTqw1/85BZCi1tXfBZ3cYXPpZQs
	ahvgO1PXo5FxHiyL9Qbd5j403cdM1ZBUX/FBKKcKE3fq+iT+p/4FaE7jOlBY2h90hWqKr/eSFeM
	7m9dkqW0v1Y0QxM61XBNlhNX0e+qmPK6W2NI=
X-Google-Smtp-Source: AGHT+IFzz7pc5wk5uj/Vf6ChAPu/I9C+4m2I7UOzrY/KOAIRiI890eR3XGmgZ+/8iVZZm+uqUyK+nA==
X-Received: by 2002:adf:b650:0:b0:3b6:136d:55de with SMTP id ffacd0b85a97d-3b6136d55efmr5039614f8f.7.1752852332639;
        Fri, 18 Jul 2025 08:25:32 -0700 (PDT)
Received: from demon-pc.localdomain ([86.121.79.159])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3b61ca4893fsm2195780f8f.52.2025.07.18.08.25.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 18 Jul 2025 08:25:32 -0700 (PDT)
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
Subject: [PATCH v7 09/24] dt-bindings: media: i2c: max96712: add support for I2C ATR
Date: Fri, 18 Jul 2025 18:24:45 +0300
Message-ID: <20250718152500.2656391-10-demonsingur@gmail.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20250718152500.2656391-1-demonsingur@gmail.com>
References: <20250718152500.2656391-1-demonsingur@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250718_082534_492621_FE9560C3 
X-CRM114-Status: GOOD (  11.74  )
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


