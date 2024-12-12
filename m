Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D808FE7717F
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 12 Dec 2024 17:22:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ZmY4nSeOHfUAeSRoOGUYAdGnJvM3BDuelhiAae/7ZWg=; b=ylN0/65w8sl1EQGn7UwcNlRiXe
	hviq6z7KnGv5FkNw6xevw0kKF+yQJnSenmc3N78RRx06wyqrhTHsj1xVo6gQYaumR+y7JKIxPs4S2
	HsRy19juPfG1kiff959fgPfAchOQ2S3ot6Ynj6J0isoA/KwecgLhGONk2nW49fB9Z57kOnXQ7Ndi0
	2NQzdmUXP9BNKqgKACBxqPxMC/iQFN+hEu3GFeQ7TczOkVCa0mY95pj/QURh/iFkjcrjZTYTR9c6X
	zxe2OjqG2TFPfinDN3fh+4YpG9y241gR3cluh1QXLX/W7iUdxvmeBu/1Xw/A815d99TLfE861IvE8
	6g7W1PxA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tLmtd-00000001AJt-3ER3;
	Thu, 12 Dec 2024 17:22:41 +0000
Received: from mail-wm1-x32e.google.com ([2a00:1450:4864:20::32e])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tLlu7-00000000wQu-2QBU
	for linux-arm-kernel@lists.infradead.org;
	Thu, 12 Dec 2024 16:19:08 +0000
Received: by mail-wm1-x32e.google.com with SMTP id 5b1f17b1804b1-434ab114753so5827755e9.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 12 Dec 2024 08:19:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=raspberrypi.com; s=google; t=1734020345; x=1734625145; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ZmY4nSeOHfUAeSRoOGUYAdGnJvM3BDuelhiAae/7ZWg=;
        b=XcgYeZxwdUfsBqtz1RsdEGXLML5fBgvJPlx3eoMHnLYDVcm1/1WW3ch0iHGqFx2j3Y
         2V3NTucb1cbQASooPRX/XI9pemdRECoSs5YvzdsD9/ZNwDlykInbbxH3CO8aqaWyw9s0
         ThQAIhVq+vtyUrYqTVDN8+ns3QfPmgEugPejdYylEPx1FIO0OpmRmbbg6OzyY7iTcN4q
         Dg+X+tj3oO8pEYa++7H7q5MeAactMC+/rguCmOrpTl65tXHTspqPMYWn/W8yRSnEsDRL
         As+sFbjpGqFjjIDYLDWPqMm93VbJuKJaSvVRNXicks+jzB+NxSYpunCG+6OZjCJjy0RZ
         ZHiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734020345; x=1734625145;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ZmY4nSeOHfUAeSRoOGUYAdGnJvM3BDuelhiAae/7ZWg=;
        b=l7JFNVCtMPJywOscHFd+aWBpiaSp/TjuExoBQ+H4dfCmvSEnDq+LrEkACRRMFhBGAH
         uNvrpYMqsKKx5ezYjhzIZbY60HmMrEHZQgDeBWorMWuvIHGEIAmQucys/fIShUUQl9s/
         iwTyVoC5MqnzXXFvoifu1+ubrP1P6I8NSpfejdmkCmJrYoXUeGT/ENejHHhojAmDS+88
         liYTfU5xydFFUZme+dVEDvN7ipGrCT9PTTp3scn6CN561Bp3NPOtSH+SrG3YCrHNFpLl
         +kNSu0BC7WOemFqgkwmiUvERuYE60N28i35uH0jaa2OovQLjPm+//J+osVjAZeUCvi+M
         JFlQ==
X-Forwarded-Encrypted: i=1; AJvYcCVt3DmXkn1ifbFQRbAP7T6YdcfL+L8zVsTSJ7uz6OK9Lpo7wwy3uww1ri2RWdyY4bbNBuS1GLHfieUfFVXNgaCi@lists.infradead.org
X-Gm-Message-State: AOJu0YxRnPd95zrk+x06lbleOL4lxp9kvQ94jrdY+ppBacPz7d+Df7Ke
	cNocRskudUPFEGAk3nbN640dub86Voz9Ql4IZtU9icO6sBvPejlCICZYjsJInk4=
X-Gm-Gg: ASbGncupwYCRAVQUtO0VCOlQCimiliXLGJnY8wwG9JXWLlGf0fIcAJUd3Y1sKXoL3Qr
	tS3vvVy0gPf8Xq9pXK5ZwhvTv7JUXtrtUbwV7izD5MtAemb2IUN/PHRx/mzZj6LkOpNAwwuq7JN
	2+b6l5nqZuEjysj3TbfhJQdmJWWIRD8k+S6CPcDg30202uYBpldtdKaeW5LjYikD+NsO9K8WzBy
	MXK0SOIxFMK1O9+vVnxGQhLLAjZXCwToDKywNEsRl0fZjdO
X-Google-Smtp-Source: AGHT+IGaFVqNcAbsh2wXwykvgIG8wIvYr5xOyoWGcWi8bclbVOgLkhFW5BR0LdTPsNVGk8Tlgv5MLQ==
X-Received: by 2002:a05:600c:b86:b0:434:f2f4:4c07 with SMTP id 5b1f17b1804b1-4361c373f5fmr66829415e9.15.1734020345541;
        Thu, 12 Dec 2024 08:19:05 -0800 (PST)
Received: from [127.0.1.1] ([2a00:1098:3142:e::8])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-4361e322328sm44336105e9.0.2024.12.12.08.19.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Dec 2024 08:19:04 -0800 (PST)
From: Dave Stevenson <dave.stevenson@raspberrypi.com>
Date: Thu, 12 Dec 2024 16:18:52 +0000
Subject: [PATCH v2 2/7] dt-bindings: display: Fix BCM2835 HVS bindings for
 BCM2712
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241212-dt-bcm2712-fixes-v2-2-35986e04d0f4@raspberrypi.com>
References: <20241212-dt-bcm2712-fixes-v2-0-35986e04d0f4@raspberrypi.com>
In-Reply-To: <20241212-dt-bcm2712-fixes-v2-0-35986e04d0f4@raspberrypi.com>
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
X-CRM114-CacheID: sfid-20241212_081907_607689_0FD10C12 
X-CRM114-Status: GOOD (  11.15  )
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


