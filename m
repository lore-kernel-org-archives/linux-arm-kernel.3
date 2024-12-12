Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3366BE7717F
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 12 Dec 2024 19:28:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Sw6ds3OYrX9qZTskII5utnH0CDhwWN9CZmERg/3tjRI=; b=lxAN50AsTZQR9Z4mQnNcJ5C9bq
	zD/NumTzlFMB/tiLgit2P2WWiAfF+xcHO/ik0BTpaPSnNaZ6fSE4eWnW8m467uRp/AfUlbtOp7yzO
	n9EpjO8vMQj8P64axOHeCpQR9pLL91DDmplvdylBHkm/rLHJfuGgu+V5AUOTgrxDZ5I8qonaKJ9di
	TUZVoy7y/ucNRgcOCl/FRUZifCiPVoF7Qt9DEuZepyKC6Lre7NWoZ6lfCbqC7evd0BuoqkZ0TFbld
	bBN0UUw+OfVJxr8Of9OEeYUPCwuGvwYEH7igfVeNDJ4GVlwe9JNTdPQJiivU7FFe6zyJPDyzbShTI
	z/E6giSQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tLorD-00000001dpg-2j62;
	Thu, 12 Dec 2024 19:28:19 +0000
Received: from mail-wm1-x333.google.com ([2a00:1450:4864:20::333])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tLo3H-00000001Rw4-1OeT
	for linux-arm-kernel@lists.infradead.org;
	Thu, 12 Dec 2024 18:36:44 +0000
Received: by mail-wm1-x333.google.com with SMTP id 5b1f17b1804b1-436281c8a38so4174305e9.3
        for <linux-arm-kernel@lists.infradead.org>; Thu, 12 Dec 2024 10:36:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=raspberrypi.com; s=google; t=1734028601; x=1734633401; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Sw6ds3OYrX9qZTskII5utnH0CDhwWN9CZmERg/3tjRI=;
        b=YpqQjnUi5DqDEkUDIxJa8lk25a2FUj047JdUD0Y7JzbQOoRD/9qSmFPekTVLhSlbd2
         xVbYsyH7CIvMqleQ5Mca0J7x73mcW2U5/RvJVoZv3jh4gKjunsx106Rd9bIuqXyI00ln
         E9EJaO7yIpMxz8+0Bvgss7ky4wGaruA8D4IQuJf2y8jqLKn/JiWHgaAI0TYKQOfh7h0E
         n6mOWtJm53OoLw2jWNLMEKmFzuoh4nkaXRKCuFj7LlsywBC18m4I5pTCRTMCiD24UxNu
         IsMCrKVuMo6WTAeiZMgRRhoh8t8CIpRqMWaaKDUXI2Ii6/ElsckjJXmxsM4BLxzQfopO
         mqKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734028601; x=1734633401;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Sw6ds3OYrX9qZTskII5utnH0CDhwWN9CZmERg/3tjRI=;
        b=vFzxw1TfkRttF/PlRf6ia9IhWSvLk5ID1b3+m++vS+wfLAg1HGHj8mtazQVvTpQ+IS
         towk5p5LN8iewqb+yJRKZ7gBIcKqk6K3if8s30hhm6p9PFThHpRlTsPVa24ztx7+wzst
         KXPxDj/YddHV2bfVzN+VjywVlw8FbwozEzySjCGgrNyECVmkHl5t4gJX2pJRlADnD0IK
         XOSxTSPqyuMSLKWTW16oa97AXB4opaojyG42XOj6epOPlZiuin38Zlet2BTGgJsb8I9K
         MpqlG0Ga68g0STFDWOynTAI+pGrWuUDppUtPGsPebDezvrvHw1CRntIy2r9bRg5VuwNz
         EtgQ==
X-Forwarded-Encrypted: i=1; AJvYcCUUAuuyefitZGWSDMp3BlkpGxp7gqyCncBMDw1zkllsOwWbs6o/Mupx9or0KXrZ2zhv/+FX6DaGBldo34+1zKfW@lists.infradead.org
X-Gm-Message-State: AOJu0Yx5kb0hTDFTSdlVe2RvyglJ6eqoUCpX/bknOabJEzDr6yEtuMF2
	x8nd0HphWardhBpYVwyqGBoQK9nhIqawcDKgQ51XDy9xxfGQrAggCHcSuDcelg0=
X-Gm-Gg: ASbGncvTK9SlHQ8ytu88ZezudlYFXSJ2+YGNq9BnC75OiJKFW0j3AwBX0zTJ5phWnfJ
	OlibfnLoILF14uX+27rgyQs4vpar+5eMHzbMoPTguFmod6HZ60OrRWEys5DB3qm3Ps2ASgGrZFp
	MNXfUX5w24cf80v6IptnyI8VgIWGSJzYecNeyr1K5lZOpr4QrjLmiEJ1V7KSRlAR5FdJmDFC9Ig
	CT5CYOmheVtapPZpH3BAkAQVmHTkHy1VTdgn93Rq1I3lR4o
X-Google-Smtp-Source: AGHT+IGgVpkk1QUs/pq3VjaphhAJz/7+ivfj+5RpPlXI4jycscQ8dQXMYYBv4ChFADcllhzmrrBmNA==
X-Received: by 2002:a05:600c:3b13:b0:434:effb:9f8a with SMTP id 5b1f17b1804b1-4362284264bmr44025395e9.15.1734028601307;
        Thu, 12 Dec 2024 10:36:41 -0800 (PST)
Received: from [127.0.1.1] ([2a00:1098:3142:e::8])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-436257178e3sm24651995e9.41.2024.12.12.10.36.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Dec 2024 10:36:40 -0800 (PST)
From: Dave Stevenson <dave.stevenson@raspberrypi.com>
Date: Thu, 12 Dec 2024 18:36:28 +0000
Subject: [PATCH v3 1/7] dt-bindings: display: bcm2711-hdmi: Add interrupt
 details for BCM2712
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241212-dt-bcm2712-fixes-v3-1-44a7f3390331@raspberrypi.com>
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
X-CRM114-CacheID: sfid-20241212_103643_363753_31B90926 
X-CRM114-Status: GOOD (  11.42  )
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
number of interrupts changed.

Update the schema to include the interrupt requirements.

Fixes: 62948c62abca ("dt-bindings: display: Add BCM2712 HDMI bindings")
Signed-off-by: Dave Stevenson <dave.stevenson@raspberrypi.com>
---
 .../bindings/display/brcm,bcm2711-hdmi.yaml        | 107 ++++++++++++++++++---
 1 file changed, 93 insertions(+), 14 deletions(-)

diff --git a/Documentation/devicetree/bindings/display/brcm,bcm2711-hdmi.yaml b/Documentation/devicetree/bindings/display/brcm,bcm2711-hdmi.yaml
index 6d11f5955b51..dd7dea60183b 100644
--- a/Documentation/devicetree/bindings/display/brcm,bcm2711-hdmi.yaml
+++ b/Documentation/devicetree/bindings/display/brcm,bcm2711-hdmi.yaml
@@ -56,22 +56,38 @@ properties:
       - const: cec
 
   interrupts:
-    items:
-      - description: CEC TX interrupt
-      - description: CEC RX interrupt
-      - description: CEC stuck at low interrupt
-      - description: Wake-up interrupt
-      - description: Hotplug connected interrupt
-      - description: Hotplug removed interrupt
+    oneOf:
+      - items:
+          - description: CEC TX interrupt
+          - description: CEC RX interrupt
+          - description: CEC stuck at low interrupt
+          - description: Wake-up interrupt
+          - description: Hotplug connected interrupt
+          - description: Hotplug removed interrupt
+
+      - items:
+          - description: CEC TX interrupt
+          - description: CEC RX interrupt
+          - description: CEC stuck at low interrupt
+          - description: Hotplug connected interrupt
+          - description: Hotplug removed interrupt
 
   interrupt-names:
-    items:
-      - const: cec-tx
-      - const: cec-rx
-      - const: cec-low
-      - const: wakeup
-      - const: hpd-connected
-      - const: hpd-removed
+    oneOf:
+      - items:
+          - const: cec-tx
+          - const: cec-rx
+          - const: cec-low
+          - const: wakeup
+          - const: hpd-connected
+          - const: hpd-removed
+
+      - items:
+          - const: cec-tx
+          - const: cec-rx
+          - const: cec-low
+          - const: hpd-connected
+          - const: hpd-removed
 
   ddc:
     $ref: /schemas/types.yaml#/definitions/phandle
@@ -112,6 +128,66 @@ required:
 
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
+
+      required:
+        - interrupts
+        - interrupt-names
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
@@ -136,6 +212,9 @@ examples:
                     "hd";
         clocks = <&firmware_clocks 13>, <&firmware_clocks 14>, <&dvp 1>, <&clk_27MHz>;
         clock-names = "hdmi", "bvb", "audio", "cec";
+        interrupts = <0>, <1>, <2>, <3>, <4>, <5>;
+        interrupt-names = "cec-tx", "cec-rx", "cec-low", "wakeup",
+                "hpd-connected", "hpd-removed";
         resets = <&dvp 0>;
         ddc = <&ddc0>;
     };

-- 
2.34.1


