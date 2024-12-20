Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AB4C3E7718C
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 20 Dec 2024 17:54:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=dRQf5pCtS98olBDfm75Y/wTQJYSNQxlX5eEUv/v7GTM=; b=VT3Dla2BFDLhQAd3HelAEU6Zty
	R8zYwTLWc5tCyPn+SAOevz9qpaAcFFYAuEdfeTCsjh59f2n4a2ZY38x9U5i/UWFlwyxjSFcH2urx0
	BoCjdybVFMsD+8OPlpJiApVJHS21+Q6L0JUlP84TvYMiLQDaD9MSqxJo8/6cOw5r5D1osJ+DkCtS8
	G24LWEMLYJOKxld269B0rpe7M2bAZB9iovHSncYKWGKfKX9iLNCiMR1aHtAJ/WaaNtNPxmVk8tuXR
	X4v+OVkTaHKqK6JsssyHoK9MmfmgXCZgvfkhjtSpNrAHEI9XXCc1yEeDzpGF63vvYYZV6BKhjVtdD
	yiLRI5MQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tOhCK-00000005hrA-2baa;
	Fri, 20 Dec 2024 17:54:00 +0000
Received: from mail-wm1-x335.google.com ([2a00:1450:4864:20::335])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tOfkx-00000005Rpx-3CEQ
	for linux-arm-kernel@lists.infradead.org;
	Fri, 20 Dec 2024 16:21:41 +0000
Received: by mail-wm1-x335.google.com with SMTP id 5b1f17b1804b1-4361d5dcf5bso22687075e9.3
        for <linux-arm-kernel@lists.infradead.org>; Fri, 20 Dec 2024 08:21:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=raspberrypi.com; s=google; t=1734711698; x=1735316498; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=dRQf5pCtS98olBDfm75Y/wTQJYSNQxlX5eEUv/v7GTM=;
        b=Ef5qP4s+2o3hcTgIuk2fXuGwZgpOzvyOzQxZJqJKoaANGL+PB8jyRCTVrI4B6qtEiG
         Gpd8RJs+wvoPKyIUqf9FX8mdwN/LJ3SB0ysEUxaBUPWBIYlXz7KykiHY1MGakx5bz6Xh
         OuJZtXTRtfs1/Xw1tNgBKIPhe3RiFqcm1nyglWAsf9qfDuniITeRgxRCxCrnCWt1EGYj
         E42Oqf1ae18LwHJpP6MdVx+pzvDLK6qDtKswosZ0G7UY3SRvFOErQZLb436dU1U+tnYQ
         SPd6HxvNlkIPhhfOMMKNj9lwjCQ8QQ5TYBMFL2QZw7ppKAeikNAW//oYvqfgzCsPqSmW
         z78w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734711698; x=1735316498;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=dRQf5pCtS98olBDfm75Y/wTQJYSNQxlX5eEUv/v7GTM=;
        b=C+aNWaJnM5B+lRCmsf9qlZfGl53qikUAphIIvGuk/nEbbxbnwtkgaCQAorI5/bTG8F
         oZYK5MaH0gre7RP1/AUudPlZbGb6of7aDuFQG2tcygeO5a1qoPBV86se++ZhajMTczF3
         3FyF27yhxuld0fC0IH0x+5VWomswKamAuDbrhTgbRGMgHwS7f2AEFdqFNsFvzS+o+7yK
         a1r93npwL/TaDKxPVpF/LtZAdZjYtYPYA1CWDeZGp1ePmnc1+c/X+qx3rjXG/KLEsHI0
         VRQakSESLb1U6q3nAAAGgq0QyJsnxURkAJxwCHQck7WIW67Kk7KYaT9ShWSyKf2L/QXl
         eSHQ==
X-Forwarded-Encrypted: i=1; AJvYcCWXGtMD36iwaMy8OziEmcKGJymjW+mHAJWWg+N1ZSAgvDxMxumtqJJSNZMY/seIGafQNz1jVdTTK36chEsFUI8H@lists.infradead.org
X-Gm-Message-State: AOJu0YwZ7h9lAD9atJzvLh+1joFhsOuTplyICRlG7JCan95QAZywakUi
	dWR4PLU4TXLjf1Tbr+PjAgfYV2Lyj9o98jPtpi+CBhJdtkZSYOheQP49BAAo+Y4=
X-Gm-Gg: ASbGncvwXDrCdRESkq8BWtDiLvilgu4p716SUEveaQQ6ps3SXxLs68vyACEWRYkbmQO
	xREbYs+3MU8JijoafDKUL6UBuXCPK+3ZWDsY85QtBFBqWOsSnqj+Ru4yiFSnQgJU4kEMIFuciDP
	fGUrXh2obsG9/T4RBiyWqrGY4vCYsiKoEFq83C9JnxoLY/tzJwBGXWtFkpI/P2jSWMUuv54SxY5
	8ChLQNXhM496IZGXsctt5mZ7KY50n+Q2+wK0Ez62S9Y5Mxd
X-Google-Smtp-Source: AGHT+IFxW+RopysqEF8jPbYWDmorW73wBvGIWAYULKR3uETdewbravBIGqJ2B2OrN6Kmdympczu2lQ==
X-Received: by 2002:a05:6000:1fab:b0:385:e30a:394e with SMTP id ffacd0b85a97d-38a221e2066mr4017975f8f.3.1734711697793;
        Fri, 20 Dec 2024 08:21:37 -0800 (PST)
Received: from [127.0.1.1] ([2a00:1098:3142:e::8])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-43656b013e1sm82824045e9.12.2024.12.20.08.21.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Dec 2024 08:21:37 -0800 (PST)
From: Dave Stevenson <dave.stevenson@raspberrypi.com>
Date: Fri, 20 Dec 2024 16:21:15 +0000
Subject: [PATCH 4/7] media: dt-bindings: media: Add binding for the
 Raspberry Pi HEVC decoder
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241220-media-rpi-hevc-dec-v1-4-0ebcc04ed42e@raspberrypi.com>
References: <20241220-media-rpi-hevc-dec-v1-0-0ebcc04ed42e@raspberrypi.com>
In-Reply-To: <20241220-media-rpi-hevc-dec-v1-0-0ebcc04ed42e@raspberrypi.com>
To: Sakari Ailus <sakari.ailus@linux.intel.com>, 
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Florian Fainelli <florian.fainelli@broadcom.com>, 
 Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, 
 John Cox <john.cox@raspberrypi.com>, Dom Cobley <dom@raspberrypi.com>, 
 review list <kernel-list@raspberrypi.com>, 
 Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>
Cc: John Cox <jc@kynesim.co.uk>, linux-media@vger.kernel.org, 
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-rpi-kernel@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
 Dave Stevenson <dave.stevenson@raspberrypi.com>
X-Mailer: b4 0.14.1
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241220_082139_815920_992591A5 
X-CRM114-Status: GOOD (  12.80  )
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

Adds a binding for the HEVC decoder found on the BCM2711 / Raspberry Pi 4,
and BCM2712 / Raspberry Pi 5.

Signed-off-by: Dave Stevenson <dave.stevenson@raspberrypi.com>
---
 .../bindings/media/raspberrypi,hevc-dec.yaml       | 72 ++++++++++++++++++++++
 1 file changed, 72 insertions(+)

diff --git a/Documentation/devicetree/bindings/media/raspberrypi,hevc-dec.yaml b/Documentation/devicetree/bindings/media/raspberrypi,hevc-dec.yaml
new file mode 100644
index 000000000000..d9e804300297
--- /dev/null
+++ b/Documentation/devicetree/bindings/media/raspberrypi,hevc-dec.yaml
@@ -0,0 +1,72 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/media/raspberrypi,hevc-dec.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Raspberry Pi HEVC Decoder
+
+maintainers:
+  - John Cox <john.cox@raspberrypi.com>
+  - Dom Cobley <dom@raspberrypi.com>
+  - Dave Stevenson <dave.stevenson@raspberrypi.com>
+  - Raspberry Pi internal review list <kernel-list@raspberrypi.com>
+
+description: |-
+  The Raspberry Pi HEVC decoder is a hardware video decode accelerator block
+  found in the BCM2711 and BCM2712 processors used on Raspberry Pi 4 and 5
+  boards respectively.
+
+properties:
+  compatible:
+    enum:
+      - raspberrypi,hevc-dec
+
+  reg:
+    items:
+      - description: The HEVC main register region
+      - description: The Interrupt control register region
+
+  reg-names:
+    items:
+      - const: intc
+      - const: hevc
+
+  interrupts:
+    maxItems: 1
+
+  clocks:
+    items:
+      - description: The HEVC block clock
+
+  clock-names:
+    items:
+      - const: hevc
+
+required:
+  - compatible
+  - reg
+  - reg-names
+  - interrupts
+  - clocks
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/interrupt-controller/arm-gic.h>
+
+    video-codec@7eb10000 {
+        compatible = "raspberrypi,hevc-dec";
+        reg = <0x7eb10000 0x1000>,	/* INTC */
+              <0x7eb00000 0x10000>; /* HEVC */
+        reg-names = "intc",
+                    "hevc";
+
+        interrupts = <GIC_SPI 98 IRQ_TYPE_LEVEL_HIGH>;
+
+        clocks = <&clk 0>;
+        clock-names = "hevc";
+    };
+
+...

-- 
2.34.1


