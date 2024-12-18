Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 80379E77187
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 18 Dec 2024 14:51:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=yrY2pupmY3cS5kWrlBb91JoKbiwZO8QDmeo+1uchgEg=; b=xc9HmiBGu2hDIIJHsHVYRnuJiY
	rFzs3QRhCJ4/8s6oKFRDVkyJFk3lAtdAZG/gkyRE0sEov0FWuYHCVkcrmmTIPZTYDbT8iM/bmRMiK
	8ap2CqzwhlDz+CKE1aHliFFWYhyMB1gJ/iLmDnm+W4zbhuQ3N/ZrMmNvqUpRVJoxsySuf+3HvVm2I
	oOL/i9Erf41mRqdjWWxBWSIfSoR48c+D3RcW+8GBqhusqndYK1KrNTmkMsnP94PlTd2Za4mu5O3dD
	wm4LQKqiRANSdaMsaVURljJO8OJSj81etGjY4d480+J8wo6NCpfSrEGMeQ+rJxTsMt1veTRlit7xD
	m+hpMGYA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tNvOF-0000000GunC-08d1;
	Wed, 18 Dec 2024 14:51:07 +0000
Received: from mail-wr1-x42a.google.com ([2a00:1450:4864:20::42a])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tNvM1-0000000GuC3-1ZLK
	for linux-arm-kernel@lists.infradead.org;
	Wed, 18 Dec 2024 14:48:50 +0000
Received: by mail-wr1-x42a.google.com with SMTP id ffacd0b85a97d-3862d16b4f5so634103f8f.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 18 Dec 2024 06:48:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=raspberrypi.com; s=google; t=1734533327; x=1735138127; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=yrY2pupmY3cS5kWrlBb91JoKbiwZO8QDmeo+1uchgEg=;
        b=NbFVnsFC/S0+jAYP+AawphTd/Z+EV7YLEU3QOBIP+2e6+pRGY2rQk37p3+I8jf8wLr
         TdfESOx2tKLZ5muu+kPuth6fUc3+RgClNhAEYGdaAZtftyLTAWIObSatIAiLpk4uxBSt
         CKnoptqp0lj6lj2dIKJaAqv9yPg298v9NzjCDROHFXFvs7Oh8P+4zbW+Q8i/raqILchO
         0VrzPGZ2Fkqze+8F5EdnYRqr8N/rnjkCvWzcB5mq+wFQiV7oE8jiXyMKed+f48EyxXRO
         5LWR4kSsPJC7W0w/8buRC59iSWigcf7jYdgkOoVM3xNOQ+xTuL6P0Hqg40PvySQCSWj6
         LG7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734533327; x=1735138127;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=yrY2pupmY3cS5kWrlBb91JoKbiwZO8QDmeo+1uchgEg=;
        b=euYGsWX2mqewaNopQiY8PBM9y+JhrVlcy+qVANzK3C7msJAIZvNYYQWpfZSSA72d4V
         3voqF2vmv/AGWIM8St8qio4RV/RbKzVfCfavcTQB8YphUO7X8gZD3qREBKL45VWLGuwA
         G4kDKy5lUOOau0z+uJ8uJTGUlaOKY4uzvoedaWUfaqPr83Ctz9T3yTzCrP8PAJ7iWG/U
         ReOt8khqcv9M9p/Sy37+B/d8g9ki+zFQdHQRHSsY4Rv691Fwb1tsvLzBRroBln44hxFW
         e/onHM1uGIqWV40+4q6T/I6lpC6UutP3szwVsmGsNJzv0Z21nGpR2NRFp55ChaVoHyfW
         MX2A==
X-Forwarded-Encrypted: i=1; AJvYcCVSXS5Pzx1G2ROYG3T7UXvET1isRcUOgHiLLA5hJCLVjCzUrkpVTSXLkL2AgXHlKHPMQiuDsPdEX3PK2H/32kYM@lists.infradead.org
X-Gm-Message-State: AOJu0Yzf+/6ZBQSEr8MT/PFx0Spv0Ck4Q4snuBa8Wx4/BeFpFi5zv6UP
	z09v02S66cNwlj09aGtOD80bGuCC9B/a5qLML7rYnffL/JGmEY2IUjz1YojSMNc=
X-Gm-Gg: ASbGncsV8gUzkyIU53VJdcNW1AERjzX/eOkFpvSlPLRPCZQY8ZGip+LrgTGT/5Q1+ch
	+12+w0BReGsoY1m3wMCymU1l4kY3PvtBdtpYg1i9+aU0MHgIku5RKS1qbFVH+AKawHc902Np0DK
	/K8EisthCYAVQU0Kx76OoEeNUFkfQAoEZuQ/Yly6N0c1iQZo88+Tk8Lf2LdN5Og3l69RRd25GaI
	2i/aTMnKfT0p/qEVpEmaMvXi6U4WieqitZTye+2on+D5Jwe
X-Google-Smtp-Source: AGHT+IGVb9AVJbgLZf6oo7CR/UM/0zP05m4m7cxzr4ZQnmR8ihuiTVlaXnWyw/vXXHA60mapsdImEQ==
X-Received: by 2002:a05:6000:1ac9:b0:385:f64e:f177 with SMTP id ffacd0b85a97d-388e4e1d4f2mr2756907f8f.11.1734533327591;
        Wed, 18 Dec 2024 06:48:47 -0800 (PST)
Received: from [127.0.1.1] ([2a00:1098:3142:e::8])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-388c80613a9sm14165163f8f.101.2024.12.18.06.48.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Dec 2024 06:48:46 -0800 (PST)
From: Dave Stevenson <dave.stevenson@raspberrypi.com>
Date: Wed, 18 Dec 2024 14:48:33 +0000
Subject: [PATCH v4 2/3] dt-bindings: display: Fix BCM2835 HVS bindings for
 BCM2712
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241218-dt-bcm2712-fixes-v4-2-54cc88b6c229@raspberrypi.com>
References: <20241218-dt-bcm2712-fixes-v4-0-54cc88b6c229@raspberrypi.com>
In-Reply-To: <20241218-dt-bcm2712-fixes-v4-0-54cc88b6c229@raspberrypi.com>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Florian Fainelli <florian.fainelli@broadcom.com>, 
 Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, 
 Eric Anholt <eric@anholt.net>, 
 =?utf-8?q?Ma=C3=ADra_Canal?= <mcanal@igalia.com>, 
 Raspberry Pi Kernel Maintenance <kernel-list@raspberrypi.com>, 
 Ray Jui <rjui@broadcom.com>, Scott Branden <sbranden@broadcom.com>, 
 Doug Berger <opendmb@gmail.com>, Linus Walleij <linus.walleij@linaro.org>, 
 Bartosz Golaszewski <brgl@bgdev.pl>, Thomas Gleixner <tglx@linutronix.de>, 
 Stefan Wahren <wahrenst@gmx.net>
Cc: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, 
 linux-rpi-kernel@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org, Florian Fainelli <f.fainelli@gmail.com>, 
 linux-gpio@vger.kernel.org, Dave Stevenson <dave.stevenson@raspberrypi.com>
X-Mailer: b4 0.14.1
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241218_064849_449113_81A3CCF0 
X-CRM114-Status: GOOD (  11.38  )
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

Commit 6cfcbe548a3a ("dt-bindings: display: Add BCM2712 HVS bindings")
added the compatible string for BCM2712, but missed out that
the number of interrupts and clocks changed too, and both need to be
named.

Update to validate clock, interrupts, and their names for the variants.

Fixes: 6cfcbe548a3a ("dt-bindings: display: Add BCM2712 HVS bindings")
Signed-off-by: Dave Stevenson <dave.stevenson@raspberrypi.com>
---
 .../bindings/display/brcm,bcm2835-hvs.yaml         | 84 ++++++++++++++++++----
 1 file changed, 70 insertions(+), 14 deletions(-)

diff --git a/Documentation/devicetree/bindings/display/brcm,bcm2835-hvs.yaml b/Documentation/devicetree/bindings/display/brcm,bcm2835-hvs.yaml
index f91c9dce2a44..fd25ee5ce301 100644
--- a/Documentation/devicetree/bindings/display/brcm,bcm2835-hvs.yaml
+++ b/Documentation/devicetree/bindings/display/brcm,bcm2835-hvs.yaml
@@ -20,11 +20,20 @@ properties:
     maxItems: 1
 
   interrupts:
-    maxItems: 1
+    minItems: 1
+    maxItems: 3
+
+  interrupt-names:
+    minItems: 1
+    maxItems: 3
 
   clocks:
-    maxItems: 1
-    description: Core Clock
+    minItems: 1
+    maxItems: 2
+
+  clock-names:
+    minItems: 1
+    maxItems: 2
 
 required:
   - compatible
@@ -33,17 +42,64 @@ required:
 
 additionalProperties: false
 
-if:
-  properties:
-    compatible:
-      contains:
-        enum:
-          - brcm,bcm2711-hvs
-          - brcm,bcm2712-hvs
-
-then:
-  required:
-    - clocks
+allOf:
+  - if:
+      properties:
+        compatible:
+          contains:
+            const: brcm,bcm2711-hvs
+
+    then:
+      properties:
+        clocks:
+          items:
+            - description: Core Clock
+        interrupts:
+          maxItems: 1
+
+      required:
+        - clocks
+
+  - if:
+      properties:
+        compatible:
+          contains:
+            const: brcm,bcm2712-hvs
+
+    then:
+      properties:
+        clocks:
+          minItems: 2
+          maxItems: 2
+        clock-names:
+          items:
+            - const: core
+            - const: disp
+        interrupts:
+          items:
+            - description: Channel 0 End of frame
+            - description: Channel 1 End of frame
+            - description: Channel 2 End of frame
+        interrupt-names:
+          items:
+            - const: ch0-eof
+            - const: ch1-eof
+            - const: ch2-eof
+      required:
+        - clocks
+        - clock-names
+        - interrupt-names
+
+  - if:
+      properties:
+        compatible:
+          contains:
+            const: brcm,bcm2835-hvs
+
+    then:
+      properties:
+        interrupts:
+          maxItems: 1
 
 examples:
   - |

-- 
2.34.1


