Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8C7FDE77180
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 12 Dec 2024 19:29:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ZmY4nSeOHfUAeSRoOGUYAdGnJvM3BDuelhiAae/7ZWg=; b=XAmXpThBTrRkm9gg74LQg7/rMP
	JhlR0LSiAG2b0A8Du8k+qTUljbiCM5Ecg6+OGDMcFupxoiXWCs6SPEHQ5ccBo8T7TFHD+C3BeieRQ
	/fvn187xZTok3IXdD02+F+W4NDwakZEdaDAyOYSWmnJAP1xEWpm6upIIeyHxLcR5PCsDlRk+4Bpv1
	hfpn7FUDtWh4vfjiWcblEdxNoANFXiYiT6IUNfZo8ZXA0fmeBgdC6c9OWmIc8hzrZDkpWMOC/SuA2
	N2QPIfriX0K2rk8WVnswS4Yoy/pCMhGFJNDWM6zBxm3U1koGYHuItjWRUtvbgY76Z1P4Shym1ZDy9
	xZjheFnQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tLosG-00000001dzY-156e;
	Thu, 12 Dec 2024 19:29:24 +0000
Received: from mail-wr1-x42c.google.com ([2a00:1450:4864:20::42c])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tLo3I-00000001Rx5-3tU8
	for linux-arm-kernel@lists.infradead.org;
	Thu, 12 Dec 2024 18:36:46 +0000
Received: by mail-wr1-x42c.google.com with SMTP id ffacd0b85a97d-385f07cd1a4so588344f8f.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 12 Dec 2024 10:36:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=raspberrypi.com; s=google; t=1734028603; x=1734633403; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ZmY4nSeOHfUAeSRoOGUYAdGnJvM3BDuelhiAae/7ZWg=;
        b=ovOGu4pzdhUTQMfp+yagSbo+1gya690DnIW6xHe5g+zdJW1uBYY3r2Kkzo5g6jUO4v
         Idrjg1rFDl6b4edimksCgMoTeYMgWA/aneQIZbzqV5cuUix7R9fjzGb6GD7gzaKrbH4T
         3/DUYzGTgAQ0eg7YVt9vXZjiRJqBhfRGKbW+18Efp/NLyeUNow3qxKrKD3Sj6ok4DKbs
         mTwUvwSsHHjJtSE99PYD3b2d4LKWPalRdTe7kOmvV9jOeuG0xoAbmMNor7ucCWV8dIoQ
         TYqH3gLYmO8mh28ffx7e8YhhWIzuGeI90DoyKhDxZro4R9HbuIN7vnCN9rEqYU2JXQgC
         /2sw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734028603; x=1734633403;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ZmY4nSeOHfUAeSRoOGUYAdGnJvM3BDuelhiAae/7ZWg=;
        b=epG8fXGsjrIIk8sLbe8HJuKC3lmBHyovxWi0ssOaQGoDlG7ofM242t9KkLtCvO/rUe
         Yio0DYMolePTjwQtxrpNszvdUx6ojUFD18EmNGdkNbxr0AASyAbucie//cAwYIC3Py1s
         wKOGb439qE0HXgG0w0GtYA+9xmdMF0cpQuUNeAC4j/2OiUazZuQgv4TEfH9EuB+QHuyZ
         tPVwvwwGiksa3mYp/TrS2w6HKyrxqlnUJT6zTAwdfcDqCjuAdjSsv/LB1YC5JDFOUqKf
         BGZMQmd49fyuUVJ42difN6IjsbhL3cHusTxSb/lSnKY5YxirYjxGsIqjCxu84iDFLs92
         b0aA==
X-Forwarded-Encrypted: i=1; AJvYcCW6Bf+B3cpo1zSGUdXjkrZDf/5PLY+9TiXtlqCzOVlGFIGgRviPm6oK8Hhh4wX+FlWdluT8t9+oG4R8fru4FlkC@lists.infradead.org
X-Gm-Message-State: AOJu0YzxkAyI15aIAyykYIKHXJiafvJHg3KZDJTuDcYZFy36qA1q9ed9
	nfExpLtRIDvx18uC5x/RDpXbd19WlwMNCnesXARhPMvKkcve+uep15UhKaaKtDn08JHVrsHC1oH
	pkTY=
X-Gm-Gg: ASbGncu5v0TOLseWzMCObt3dlmYrofC2ydeb1VRKuGkYg2B8BII93e62KP6PDFd1HmQ
	FBM7hgjvfd90wSmBphpJl/8Y/niMvpUcylhTutMATbF3vzVaU2+9a4VWgPf2KENz2ppBN0CtaOS
	wBsPMBIoUkkapdcwu85NaXIxE3EmnxjFBzx1vv1950qVSWfUT7+TMsqhDE0yId7uLrzD98dHwX2
	B/xaep1xRgWX5sRJRd7fDysdxxv3fdyP306ArSxsln4rpve
X-Google-Smtp-Source: AGHT+IFU9uMnmpDGMa3W5FkV+Zbg8mGPNRBLqmRp7s6rNpHHpbC4TqWxpZPj4otDLO2FaOF1TjZ6vQ==
X-Received: by 2002:a05:6000:70e:b0:386:3864:5cf2 with SMTP id ffacd0b85a97d-38787691302mr4172021f8f.19.1734028602901;
        Thu, 12 Dec 2024 10:36:42 -0800 (PST)
Received: from [127.0.1.1] ([2a00:1098:3142:e::8])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-436257178e3sm24651995e9.41.2024.12.12.10.36.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Dec 2024 10:36:41 -0800 (PST)
From: Dave Stevenson <dave.stevenson@raspberrypi.com>
Date: Thu, 12 Dec 2024 18:36:29 +0000
Subject: [PATCH v3 2/7] dt-bindings: display: Fix BCM2835 HVS bindings for
 BCM2712
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241212-dt-bcm2712-fixes-v3-2-44a7f3390331@raspberrypi.com>
References: <20241212-dt-bcm2712-fixes-v3-0-44a7f3390331@raspberrypi.com>
In-Reply-To: <20241212-dt-bcm2712-fixes-v3-0-44a7f3390331@raspberrypi.com>
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
X-CRM114-CacheID: sfid-20241212_103644_962485_16E0A6D5 
X-CRM114-Status: GOOD (  11.14  )
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

Update to validate clock and interrupts for the variants.

Fixes: 6cfcbe548a3a ("dt-bindings: display: Add BCM2712 HVS bindings")
Signed-off-by: Dave Stevenson <dave.stevenson@raspberrypi.com>
---
 .../bindings/display/brcm,bcm2835-hvs.yaml         | 83 ++++++++++++++++++----
 1 file changed, 69 insertions(+), 14 deletions(-)

diff --git a/Documentation/devicetree/bindings/display/brcm,bcm2835-hvs.yaml b/Documentation/devicetree/bindings/display/brcm,bcm2835-hvs.yaml
index f91c9dce2a44..36bf8eec88a6 100644
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
@@ -33,17 +42,63 @@ required:
 
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


