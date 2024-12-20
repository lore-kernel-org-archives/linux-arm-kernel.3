Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5C83EE77188
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 20 Dec 2024 18:15:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=9Sl5vZ6DuvY58dxwG3krkGImhGuVFYQY4MkC0DJ9Dic=; b=nn/+Pj95eHdVP5mbW6+ctRsPPf
	ppxenrPKXFduamrbQ6lYgMtN+pyYH5VGkh6PMhsyQOzvtUX6lL9o/e85pySZKEpPkdm5IurQWDAoe
	LpVLc3hxt1kOSermEXwa+/CpKinYqi82lkYvlnyAPx+6MfBgEO/0iy/IOGKtVn2V5ksst1u8XmFwM
	GYv17Ug6iCm0oFa4TI1BeLIxMTLObgObpPrBiVTiCVBgLA/lUADjp2zx2QNCB0hNnNDzEAoTKTe0T
	LI382jQ7ONE3keZhfV0uBTCnEFwipc+p3U9ARTiearNTBldfo0XFX21KYckyt72KIz2hpUaCJso/Y
	eLYF4uAg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tOhWg-00000005m1A-00K9;
	Fri, 20 Dec 2024 18:15:02 +0000
Received: from mail-wm1-x334.google.com ([2a00:1450:4864:20::334])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tOhTC-00000005lKh-2zw5
	for linux-arm-kernel@lists.infradead.org;
	Fri, 20 Dec 2024 18:11:27 +0000
Received: by mail-wm1-x334.google.com with SMTP id 5b1f17b1804b1-4361815b96cso15469455e9.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 20 Dec 2024 10:11:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=raspberrypi.com; s=google; t=1734718285; x=1735323085; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=9Sl5vZ6DuvY58dxwG3krkGImhGuVFYQY4MkC0DJ9Dic=;
        b=UVE9JlitkspCl14b0VzY35o5EDa94xnjwU7AtS9HVDawoXATTq5091x4kSWHyQtDEU
         wo3QEw13YwSEN7sPqX6Ht2gbvAmfGyAMYWrwx7VJ0k24snzJnjbiv1IytQCJ+zgSZyEh
         pjJxHyY9cJ6/FtrJCfUDkxNyOks0r0U6CsnZW0Ea1w+UjW5Dvd7gSeX/qGygKltB6nsW
         M6GivQedi0l2rEmH6ws43zEi7xEmt65ex6WtNI9eLYDCtYHCkKXFiNS6vQ5hCmBnzUha
         gHVW1XjpGt2A9hkX7aDgLGw3itJzLM7BAPkyt+a+CcwyPvHdqz/oeQ3u/UVW5SVNLAk0
         8hKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734718285; x=1735323085;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=9Sl5vZ6DuvY58dxwG3krkGImhGuVFYQY4MkC0DJ9Dic=;
        b=pRfITkeC5QQsMN6Y8cbRDzGu17IoIABRLD13avn0sQkrmSuIHID3GukgibGB6J1hWJ
         ly0aj06979OFBa+/3tD+qvTztTIN1VXcGdA8C+U9A9l6UCrGQJQvbXGw3eNeRRfLz53Z
         r8CX9Kf9f6OfjJXXO8uilGYRuMsoHTBKwn1Obs2n3FDGAusR8jJg8gypCAlu0v1h5H1U
         6HaWhbCFQDpPclxYHPK/Jy1lVM0z8n31xaAHm9zG/ybFMie8HIUE097zRLkMNPUPKcPS
         qyREG4VYrxyfayCxvaA2lWy1Y8dwZmT0K2m5hWWfnumahaF7HJ72aQlcVWfNqo6qKI1i
         g1pQ==
X-Forwarded-Encrypted: i=1; AJvYcCXGEjeAvCyGJX4nBD/op+lNWqcCFQ9hIQ1qxhyge+lqNgYhnbRgUR7G0wrzHW1PGiK826VFKoLSPGZ3WdpA/Iig@lists.infradead.org
X-Gm-Message-State: AOJu0Yyq87dVgYr6Foo9UooKzV9qnJT9l+/bpC8VhLbcIQlgIyqSTt5C
	5UxcqAGw3Wsma+zyyE0xwoPKo8qvmC1A6X7SQ50OgYj9/xPBgWIoaXUvIIzrZlU=
X-Gm-Gg: ASbGncvEiTNaz2BhBGojFyskmameGSVJ5Vu30koDv+DXfSXCoxrPchLpEdt4BWYlBJC
	62gEyX+3PkRWOXgmGc4Hx4WEu+D97+eGMQSjrzg6t6W2N2R6Mh5cuWL9QKbC1KS5ZhBisnNF5lu
	ZIgHz4pI44zfagtFWMqXpeU4SjMzYFhfbuwX/5VTy8YpZAcs3bCS8TFD24GQh+maps97y8+a77a
	EUXAG50QwoWRgJg9AkPO4dsabM5l23/hF17VX4y+duVVm+l
X-Google-Smtp-Source: AGHT+IEvTWbavoXhQ6+vfbkOhG8cbDKYZMOKpzg5ZpuFE1J+Gc33Tj3rIi7Es/smHvmbL2/NSCBTrA==
X-Received: by 2002:a05:600c:1912:b0:434:a968:89a3 with SMTP id 5b1f17b1804b1-436686436f9mr40093445e9.9.1734718284772;
        Fri, 20 Dec 2024 10:11:24 -0800 (PST)
Received: from [127.0.1.1] ([2a00:1098:3142:e::8])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-4366127c488sm51460075e9.27.2024.12.20.10.11.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Dec 2024 10:11:24 -0800 (PST)
From: Dave Stevenson <dave.stevenson@raspberrypi.com>
Date: Fri, 20 Dec 2024 18:11:12 +0000
Subject: [PATCH v5 2/3] dt-bindings: display: Fix brcm,bcm2835-hvs bindings
 for BCM2712
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241220-dt-bcm2712-fixes-v5-2-cbbf13d2e97a@raspberrypi.com>
References: <20241220-dt-bcm2712-fixes-v5-0-cbbf13d2e97a@raspberrypi.com>
In-Reply-To: <20241220-dt-bcm2712-fixes-v5-0-cbbf13d2e97a@raspberrypi.com>
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
X-CRM114-CacheID: sfid-20241220_101126_775930_6C18C711 
X-CRM114-Status: GOOD (  10.97  )
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
the number of interrupts and clocks changed too.

The driver commit adding support for BCM2712 [1] also requires that
both interrupts and clocks are named, so the relevant -names
properties are also added to "required" for BCM2712.

Update to validate clock, interrupts, and their names for the BCM2712
variant. (There should be no change in the binding requirements for
the other variants).

[1] Commit 7687a12153d3 ("drm/vc4: hvs: Add support for BCM2712 HVS")

Fixes: 6cfcbe548a3a ("dt-bindings: display: Add BCM2712 HVS bindings")
Signed-off-by: Dave Stevenson <dave.stevenson@raspberrypi.com>
---
 .../bindings/display/brcm,bcm2835-hvs.yaml         | 88 ++++++++++++++++++----
 1 file changed, 74 insertions(+), 14 deletions(-)

diff --git a/Documentation/devicetree/bindings/display/brcm,bcm2835-hvs.yaml b/Documentation/devicetree/bindings/display/brcm,bcm2835-hvs.yaml
index f91c9dce2a44..9aca38a58a16 100644
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
@@ -33,17 +42,68 @@ required:
 
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
+        clock-names: false
+        interrupt-names: false
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
+        clock-names: false
+        interrupt-names: false
 
 examples:
   - |

-- 
2.34.1


