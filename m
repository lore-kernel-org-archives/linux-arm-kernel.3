Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5EC9DE77188
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 18 Dec 2024 14:52:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=0HhuvChnZxHEKbDR0wzjSlhppXuk6dBcqGjZkLEJAX4=; b=xm76p1yNcvzoCDRwir1/cPezL/
	db22PKZR4+RETyd3gUHYaZzf2N+7VmIicnfJTQ74sU5DL2MM0YhSSiQcNspI8VtX280e9vWWYLjeF
	SzLvp5E2LXMooudoP8OPJAnU1XOiEEuCXeNX4FyOaXjUoYS9LQgKmoNtjdfjBNOTyvV6hlg+zJhHZ
	pIzFWQ9lOWDNdlqzInSWSvHwg7sQhI/PdsBeedMQIhj2QBgnK07KhTZSl4pyrBUb1Xn/0JipOGq9b
	uat2p5Ne9CZ9gQWaOi5aaPFYWCYwrv93d+9CsUeTkERItW+cwOQ5W88CfMnTa/6d53cWiWPeJU804
	A7QhPVFw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tNvPJ-0000000Gv1R-32Pe;
	Wed, 18 Dec 2024 14:52:13 +0000
Received: from mail-wm1-x331.google.com ([2a00:1450:4864:20::331])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tNvM0-0000000GuBT-0iTM
	for linux-arm-kernel@lists.infradead.org;
	Wed, 18 Dec 2024 14:48:50 +0000
Received: by mail-wm1-x331.google.com with SMTP id 5b1f17b1804b1-4361b6f9faeso5783285e9.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 18 Dec 2024 06:48:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=raspberrypi.com; s=google; t=1734533326; x=1735138126; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=0HhuvChnZxHEKbDR0wzjSlhppXuk6dBcqGjZkLEJAX4=;
        b=r8M72SQXKngwh6RFkatxjDFA/H4WTl3FUtK7QBSop4yNxwoyNdJPOGUZGUdBT19u0z
         VwZCKp+Q45xhg3NmeUR5Emv37MSUuysJkfX8B+8avumzj9n4qs6Ti3u1SjOVAwWaPsc5
         7mGHo1haAiceckiawlAvqwJEWPMN0aD7KF45h93CqdB3Ti7HFz0RQIDsT6Q7NHrv41Ko
         6rGJLaGfzWek/M96PgcjbXjpzRtN88LvscX6uf7W8Bl6ch1KKU70FWEwwuGdRSzaIsI5
         ySQwS40uiciX4xhEKlp7nrQWHUHXq6AWbNuGdSGpKZKYP7QO3rpX5UVxleQ677dl2vKw
         Y82Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734533326; x=1735138126;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=0HhuvChnZxHEKbDR0wzjSlhppXuk6dBcqGjZkLEJAX4=;
        b=bgO3TaU4Ccc5sCT+FoWPEloRQ0dxIZ9CoyY35ygtOwxx6qmJn72aXVup37fU6ce4nv
         mWkMzI456dgVI0p4INFdWBLUOfb4Ij0WbRcHwuZyvM55/iSm1NLuTbxuvTk/Mcugp/Ib
         dO5pKghaACeYseilK7djqQglg/Mf0XpilYdWrjfbJCun5rfYp3CZVTBOambZPF0g+wiG
         Fz0Y53359YmSq2jlQQEj4dyz4Vu0RKEh8s8XOXL9rs3RW9UEJCVdubjEI0TgVwi1MWMC
         3coYhTVGYYloAZ97MA2gaFxM4DYCoqM6o2GS379HBz7xRcBd9BsmlsZk04ih8ma+BcyE
         rUgw==
X-Forwarded-Encrypted: i=1; AJvYcCXGq5YFBc9fhuQ4oaCJixApnTsltCbqO1afrTzJdLWEBKPtYeoIgABeVrHkJ9BPLi7uutmBXaiAZAx2EBgQVOdx@lists.infradead.org
X-Gm-Message-State: AOJu0YwZx7I2TfrcmRjDfxx3l2mdbVeMEd3h1AaxltfjRGMG0MhCFy4Z
	lonU6OcVifWhYeCgyOYLnUJ6NAOmRTJ9sFwr+K6TGIniXEb/HO3yRhUPJMxfPao=
X-Gm-Gg: ASbGnctoXc0RKVGP919PkET8Oga0JyB42+A3CHASkzhjAB3Z0NCdHC9n3zX+WmYGH22
	p+YlR+U9za2UFnbxU2sMX7/xOIm45DuucjvgG0n+xmQMKPduTj6V/d7EgyVk7U43wB0oA/UUZhY
	d9xlyX0O59WpL686sEHokcVAPFYgo0jD8AFG3/hg/2JKg6RFtB6RTO6UKFPqGKzkcs0ixHLrlIv
	GWg1haaWGaZXe/DdOGzhAu3eOC2cLZR0N9LiYbJB/pKBrN4
X-Google-Smtp-Source: AGHT+IHW10MOxS28loaYz58hcigl3Ail1h5qTPK70DcVM/fvNy/4Wh1EKi45+y5z3iUCnn9N7rshPw==
X-Received: by 2002:a05:600c:35cb:b0:434:fa73:a906 with SMTP id 5b1f17b1804b1-436553052fbmr27423205e9.4.1734533326478;
        Wed, 18 Dec 2024 06:48:46 -0800 (PST)
Received: from [127.0.1.1] ([2a00:1098:3142:e::8])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-388c80613a9sm14165163f8f.101.2024.12.18.06.48.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Dec 2024 06:48:46 -0800 (PST)
From: Dave Stevenson <dave.stevenson@raspberrypi.com>
Date: Wed, 18 Dec 2024 14:48:32 +0000
Subject: [PATCH v4 1/3] dt-bindings: display: bcm2711-hdmi: Add interrupt
 details for BCM2712
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241218-dt-bcm2712-fixes-v4-1-54cc88b6c229@raspberrypi.com>
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
X-CRM114-CacheID: sfid-20241218_064848_232890_190A849F 
X-CRM114-Status: GOOD (  11.58  )
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
 .../bindings/display/brcm,bcm2711-hdmi.yaml        | 81 ++++++++++++++++++----
 1 file changed, 67 insertions(+), 14 deletions(-)

diff --git a/Documentation/devicetree/bindings/display/brcm,bcm2711-hdmi.yaml b/Documentation/devicetree/bindings/display/brcm,bcm2711-hdmi.yaml
index 6d11f5955b51..83c058728ef1 100644
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
@@ -112,6 +102,66 @@ required:
 
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
@@ -136,6 +186,9 @@ examples:
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


