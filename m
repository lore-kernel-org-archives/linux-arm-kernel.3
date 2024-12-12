Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DE4F9E7717F
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 12 Dec 2024 17:21:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=y6HwzRhtwuck+pMBjZMoVZ4D2FniLRRRufqq2y2rOjs=; b=ekgaWJBu++iki71a/i0U2jOId3
	s0DD2vN8bClDbl88sjdHeLovZG+I8KnMUsrZJCwrFGrxl3p2jMuDYe0PXDAMuZBDO0j9mQgcdpkTk
	dARB4091fUI3w5WnZmrSGYIlCVG2wGryQZRGV+gyXsFGcENtNSRlLizHr3teSYhi6VmOepZmpx3TF
	ZK05YE+TXoyjV7+LB2btyDjQdsyhoJ7jMZzceREafWfJXwAOr8dUBGN/pT3j+tweDzn8GycqUxVjm
	wHwun15Aqw+B1jLfdA8WI5k9K2f6N3AqHepbzDaUM6ByifUR99PviCZXNRELQDVAO3cal1YqqHoYT
	+SiqvMxg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tLmsb-00000001A6C-0M6L;
	Thu, 12 Dec 2024 17:21:37 +0000
Received: from mail-wm1-x32d.google.com ([2a00:1450:4864:20::32d])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tLlu5-00000000wQ9-39Es
	for linux-arm-kernel@lists.infradead.org;
	Thu, 12 Dec 2024 16:19:06 +0000
Received: by mail-wm1-x32d.google.com with SMTP id 5b1f17b1804b1-434a736518eso10287705e9.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 12 Dec 2024 08:19:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=raspberrypi.com; s=google; t=1734020344; x=1734625144; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=y6HwzRhtwuck+pMBjZMoVZ4D2FniLRRRufqq2y2rOjs=;
        b=HXO1ajaqGr765+qQ46SlO14vFgsu8rf3k4zw61oGJw4w1/EXqzGcBkaq/Jin+dBWON
         tYY9q3FvEDmrC3TUJ+EXbynI6kvQ15k264EqE/RMDOOA8dU+udSNCV4bYNsGSaZyneVH
         7i9EZO3J6G5HSmuhfzrh9LabE3wh9dC65sBWxOIveF9ADlpDsBN8VZy3inKSHdtXbdUq
         B4Kx1tO5LLpA1oSOqj2NWq84m1qVEDcQUbIwDiUtuCBj0H8lA+T0LTK3krKrcfghp3u9
         ii0Ig+wzM2OIhl61dxHGyLe0UzWFr5YpES89zOqUcccJ1BtTEqwTPu+5K5p/GTUcIAK9
         sjnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734020344; x=1734625144;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=y6HwzRhtwuck+pMBjZMoVZ4D2FniLRRRufqq2y2rOjs=;
        b=QsX80EMGrD1sII6F4LTkZn0y1ypOh30quj3kZlnLSPL8vFgX+Kn5+Q+S3uf6D6BcoI
         h9Suq/AKYeTWSBHEdjBDFGycAJFlmTK3MA7u+k0Vtcz2QULnm7Y3JEzv/9hLc4PBalUL
         POM9OSHLl9sd5QYFB1ggTBzseJgrMdYWEsTmv8RcOTaq+syO6XUAaC7M0EEEynnX3ZFw
         RpKH4Xkctj6omKA68p9eJnQ7+XK6X0rzHo41rKuzv+zSY/kZf4TPpGSzUa5bbUuwBAdA
         s/iQhJOmunAMqFWc/lN+jRrsBWOZQHuR5IumDtLVj3Qv0dzgMpWFvNhSuWC1z0sE5Spx
         Tgkg==
X-Forwarded-Encrypted: i=1; AJvYcCWlXXmdWK3XjKKR61lhvGu10TxQx/HA/pUQRr/kV+srQSibraz+rFpFTRzAJv7QPMFYNQubP1YcvJlHvbgpq5h+@lists.infradead.org
X-Gm-Message-State: AOJu0YxTrgTKNIM4YXicSgnc/F6IWFdA4MquH9wLYxqrPcdjSR4e5zSJ
	2lnYvrbrGAvvQ8F1iPi9Ne8/baJqdtmqMT6pVvp/NcprogphbkINzepyWmTlB4g=
X-Gm-Gg: ASbGnctzXpCAO55MCVjC8y+Lm2kI/x7KeOJ11Jy7uScd8vT4/Fi+lmFQ9vLQz9ClfAI
	O7oETd9Uu8/g9FMT6nKYWl/XYbV+g1ST2KnxTM2C33O3Ph9ecJTQIikwKHeK8zX6Ws5v7Ffg+LU
	h1j2tQrNUNTQcyGpWqe1QpY/AjRcdZ0TrcgEyLUR4/wgq1wdkO/qyAbxrqi8H6qCxw3iqUPaizD
	9iSGzAaYYy0orvDiS8Q+alTL+3RIeFZEvVi8quigS1g0YHD
X-Google-Smtp-Source: AGHT+IECJruZQ6LwRw858w1Yxs8MMZZ8ljYIT9r3bgD0QLs1iDMGolWGCI6cX4+UuSx7QkTjWRFBnA==
X-Received: by 2002:a05:600c:524b:b0:434:a781:f5d9 with SMTP id 5b1f17b1804b1-4361c3aaefamr71124875e9.11.1734020344259;
        Thu, 12 Dec 2024 08:19:04 -0800 (PST)
Received: from [127.0.1.1] ([2a00:1098:3142:e::8])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-4361e322328sm44336105e9.0.2024.12.12.08.19.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Dec 2024 08:19:03 -0800 (PST)
From: Dave Stevenson <dave.stevenson@raspberrypi.com>
Date: Thu, 12 Dec 2024 16:18:51 +0000
Subject: [PATCH v2 1/7] dt-bindings: display: bcm2711-hdmi: Add interrupt
 details for BCM2712
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241212-dt-bcm2712-fixes-v2-1-35986e04d0f4@raspberrypi.com>
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
X-CRM114-CacheID: sfid-20241212_081905_794446_E072428E 
X-CRM114-Status: GOOD (  11.53  )
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
index 6d11f5955b51..a7ca3a336187 100644
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
+        - description: CEC TX interrupt
+        - description: CEC RX interrupt
+        - description: CEC stuck at low interrupt
+        - description: Wake-up interrupt
+        - description: Hotplug connected interrupt
+        - description: Hotplug removed interrupt
+
+      - items:
+        - description: CEC TX interrupt
+        - description: CEC RX interrupt
+        - description: CEC stuck at low interrupt
+        - description: Hotplug connected interrupt
+        - description: Hotplug removed interrupt
 
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
+        - const: cec-tx
+        - const: cec-rx
+        - const: cec-low
+        - const: wakeup
+        - const: hpd-connected
+        - const: hpd-removed
+
+      - items:
+        - const: cec-tx
+        - const: cec-rx
+        - const: cec-low
+        - const: hpd-connected
+        - const: hpd-removed
 
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


