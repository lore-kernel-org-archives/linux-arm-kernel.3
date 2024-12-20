Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EC28BE77188
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 20 Dec 2024 18:13:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=VKnwwPFe/+dE7hLJc1Yz3pFEYPu928FDpcSUb/vByrQ=; b=B91ZWJ0VLR8x6uTScd9A5ts1Hn
	kYt/umwkQFayzOtRSSyXVNvmvdxk4fcaa7FULtiggZ6wGRWL5gBQnDrwedefTAMDK0c4jTaUQf2et
	RjAMqcl+565uYq6NCToHnr5vmJyn1vu3pbqkTFmdQCGhmfyMFZgJjxJJTyN+prC1rmac4eGC8OwsI
	jXhEeE0q/4yth18wEvHDhN9wU7Btwztsv0eOj/qalFij+s4UMlkiWZmtsJqlQBFzHmJBmSFDdk4fz
	hX77TK0Y6R9WCjpeeyQTDUpD0XREfi4BEOEvZdu2Efis5NjhQS2OmHKEUjWEEZLCg2kyMmx/VsTqW
	9n5PG0lQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tOhVR-00000005lm8-2icf;
	Fri, 20 Dec 2024 18:13:45 +0000
Received: from mail-wm1-x329.google.com ([2a00:1450:4864:20::329])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tOhTB-00000005lKV-1eJq
	for linux-arm-kernel@lists.infradead.org;
	Fri, 20 Dec 2024 18:11:26 +0000
Received: by mail-wm1-x329.google.com with SMTP id 5b1f17b1804b1-43624b2d453so23890685e9.2
        for <linux-arm-kernel@lists.infradead.org>; Fri, 20 Dec 2024 10:11:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=raspberrypi.com; s=google; t=1734718284; x=1735323084; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=VKnwwPFe/+dE7hLJc1Yz3pFEYPu928FDpcSUb/vByrQ=;
        b=Ldw+BWIzFoxopAVTlOm51IoC39H+1FiAPJwZgEw0gyddUiGQdnmD6mmET8nt/D7PYb
         MMUpT9zOzYiqWcz1zSgee71/saalWgG60BW8kU4i9W6tkFAyVSTf5noEw+syTrGDO2l2
         9uSpbefHWt1sMf+hbpCd/KS/6GQw/6M0v46yMHITXY8Lo1jxjWqX58m9Bidk818BJI1z
         Swxl2ueggD14Q/ZSrCjEBB9wTuv8Zqr3tli+2IV/KvNOQBX5v+RRBdRnAeW4faNxEP6b
         nu8CxPt+sCb+ZVlqnvzfnbyMiRcdy6h7KeXVPJywXDLqWt+ExDvbBjlgeHnpgg7sh3+r
         YqsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734718284; x=1735323084;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=VKnwwPFe/+dE7hLJc1Yz3pFEYPu928FDpcSUb/vByrQ=;
        b=vcjbJsEvcz9XJX1UPoQe7Lysaf8pyUHZntijKi08pOACh5w7UmtZluCmPaoKI1pH3a
         pneT16Bg8GA3UiK2L/rlzq5SKi/glKxsSbQ0OU4Zqu8UZXi+lyCYzgBZNcdtEJxFGI7a
         FKP5wsAoU32n5dp0i+3WxnWCole2wDC9qPsvm9py3KfBJ+POmtB1MiZlXiMU/fiynKG5
         CnoWO+QwuQt3dCNYMbRJ4rdYH67fImgo8DzJ0U4w3rTPCPC3bu2UoGQYplZ/8NqpdlqR
         NaUfV9PYkysMzoxd/AG7kNKxQMtev2nefGr772cuAm0FksqShFBAZg2RPl+dlWw5vF7a
         dYrg==
X-Forwarded-Encrypted: i=1; AJvYcCWj1omLIf+2ouiQxL8HnpFTIDeCjbANDOTZPM6QPz31HSwRZw3uv0qrc6sdAYL9jiGmE9enxTnqxurlE8+ah6A8@lists.infradead.org
X-Gm-Message-State: AOJu0YzK0wsJMPc9CWI1BFGdZzhR35Inv+Lo/p5tifhhluoQ7DcTdVCp
	kx0sRzkr12vR9qVWYQ8FIy4RFrIGUwFtxFrJ+blu1zYDxqolGcdq12aNS+xYPL8=
X-Gm-Gg: ASbGncu6DpXDHKtlUehh/lqKAcYaARHRMrRwvJRPbFi6n6ZtMOOwrYChd31GfVODEia
	QBPWUmrYWn+lwxbiZ44BazWx0PcEFsqU9ATuPhcbMpygNpz1HbB8rzDOLTgw2IbBCgnBxwAXOTH
	ETkKLFEdM0wvcAJB36NijqPnUFSeZW/yGh49iTa4QpEWPMOKzG5kaqDDeBXVir3dXD7oNXhXLb5
	jx23sw0wCQEeWGQiE1GmpGiU9ubuKBI0p6Ki4+tZ3VLeb7E
X-Google-Smtp-Source: AGHT+IEuWHn26jFE8mEN526e1pripavNV4jfCGcWV22FyYVXEe2zax7RoEXGtmhyz0wWSN2QoW0ULg==
X-Received: by 2002:a05:600c:1388:b0:434:f131:1e71 with SMTP id 5b1f17b1804b1-4366854c07emr38472865e9.8.1734718283903;
        Fri, 20 Dec 2024 10:11:23 -0800 (PST)
Received: from [127.0.1.1] ([2a00:1098:3142:e::8])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-4366127c488sm51460075e9.27.2024.12.20.10.11.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Dec 2024 10:11:22 -0800 (PST)
From: Dave Stevenson <dave.stevenson@raspberrypi.com>
Date: Fri, 20 Dec 2024 18:11:11 +0000
Subject: [PATCH v5 1/3] dt-bindings: display: bcm2711-hdmi: Add interrupt
 details for BCM2712
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241220-dt-bcm2712-fixes-v5-1-cbbf13d2e97a@raspberrypi.com>
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
X-CRM114-CacheID: sfid-20241220_101125_446245_5145464E 
X-CRM114-Status: GOOD (  11.86  )
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

Commit 62948c62abca ("dt-bindings: display: Add BCM2712 HDMI bindings")
added the compatible strings for BCM2712, but missed out that the
number of interrupts changed, and for BCM2712 the driver changes[1]
required that the interrupts are named.

Update the schema to correct the interrupt requirements for BCM2712.
(Requirements for BCM2711 should be unchanged).

[1] Commit 0b1dbe82e051 ("drm/vc4: hdmi: Add support for BCM2712 HDMI
controllers")

Fixes: 62948c62abca ("dt-bindings: display: Add BCM2712 HDMI bindings")
Signed-off-by: Dave Stevenson <dave.stevenson@raspberrypi.com>
---
 .../bindings/display/brcm,bcm2711-hdmi.yaml        | 76 ++++++++++++++++++----
 1 file changed, 62 insertions(+), 14 deletions(-)

diff --git a/Documentation/devicetree/bindings/display/brcm,bcm2711-hdmi.yaml b/Documentation/devicetree/bindings/display/brcm,bcm2711-hdmi.yaml
index 6d11f5955b51..c1cefd547391 100644
--- a/Documentation/devicetree/bindings/display/brcm,bcm2711-hdmi.yaml
+++ b/Documentation/devicetree/bindings/display/brcm,bcm2711-hdmi.yaml
@@ -56,22 +56,12 @@ properties:
       - const: cec
 
   interrupts:
-    items:
-      - description: CEC TX interrupt
-      - description: CEC RX interrupt
-      - description: CEC stuck at low interrupt
-      - description: Wake-up interrupt
-      - description: Hotplug connected interrupt
-      - description: Hotplug removed interrupt
+    minItems: 5
+    maxItems: 6
 
   interrupt-names:
-    items:
-      - const: cec-tx
-      - const: cec-rx
-      - const: cec-low
-      - const: wakeup
-      - const: hpd-connected
-      - const: hpd-removed
+    minItems: 5
+    maxItems: 6
 
   ddc:
     $ref: /schemas/types.yaml#/definitions/phandle
@@ -112,6 +102,61 @@ required:
 
 additionalProperties: false
 
+allOf:
+  - if:
+      properties:
+        compatible:
+          contains:
+            enum:
+              - brcm,bcm2711-hdmi0
+              - brcm,bcm2711-hdmi1
+    then:
+      properties:
+        interrupts:
+          items:
+            - description: CEC TX interrupt
+            - description: CEC RX interrupt
+            - description: CEC stuck at low interrupt
+            - description: Wake-up interrupt
+            - description: Hotplug connected interrupt
+            - description: Hotplug removed interrupt
+        interrupt-names:
+          items:
+            - const: cec-tx
+            - const: cec-rx
+            - const: cec-low
+            - const: wakeup
+            - const: hpd-connected
+            - const: hpd-removed
+
+  - if:
+      properties:
+        compatible:
+          contains:
+            enum:
+              - brcm,bcm2712-hdmi0
+              - brcm,bcm2712-hdmi1
+    then:
+      properties:
+        interrupts:
+          items:
+            - description: CEC TX interrupt
+            - description: CEC RX interrupt
+            - description: CEC stuck at low interrupt
+            - description: Hotplug connected interrupt
+            - description: Hotplug removed interrupt
+        interrupts-names:
+          items:
+            - const: cec-tx
+            - const: cec-rx
+            - const: cec-low
+            - const: hpd-connected
+            - const: hpd-removed
+
+      required:
+        - interrupts
+        - interrupt-names
+
 examples:
   - |
     hdmi0: hdmi@7ef00700 {
@@ -136,6 +181,9 @@ examples:
                     "hd";
         clocks = <&firmware_clocks 13>, <&firmware_clocks 14>, <&dvp 1>, <&clk_27MHz>;
         clock-names = "hdmi", "bvb", "audio", "cec";
+        interrupts = <0>, <1>, <2>, <3>, <4>, <5>;
+        interrupt-names = "cec-tx", "cec-rx", "cec-low", "wakeup",
+                          "hpd-connected", "hpd-removed";
         resets = <&dvp 0>;
         ddc = <&ddc0>;
     };

-- 
2.34.1


