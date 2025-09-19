Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 67420CAC59A
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 19 Sep 2025 07:58:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=PT6JvarRuFKmmTEv7wD5leEJ64JN5pVMHm6P1LFVOTI=; b=ZxXgdwtfciHqqGfZPRj+1v9sGa
	D/DJ/5g+x4aF2CDOLEEMrYZx/Vl04TFauIN8TfGmLuZhdxPMgfwOCBZvomQ1Sq7A8jqXbnZeY/hnL
	cym7N8R4zn5aH02NE5pDiQx/P4AqO/Ap8psJ3IxMVGni30B+JAxZvlcJuXgNp/XHkStDeKMj0c070
	8uL6qcST/I/eM8wQfyrk4yxb/9Mqh/ARIn1sI2M7iaUB4bacGt/bA0GUCD2nHWFc153anqDxF6C8v
	KYJ4ynLV8s8N4hN3KorVnMDXR34TvViYTtVxRUaA8sJYgxkkZWlK39Djrts5NBqiQ0VaggG/R6ip6
	j75baZ1w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uzW0m-00000002B9Q-22r1;
	Fri, 19 Sep 2025 07:58:32 +0000
Received: from mail-ej1-x632.google.com ([2a00:1450:4864:20::632])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uzW0j-00000002B8M-3C3u
	for linux-arm-kernel@lists.infradead.org;
	Fri, 19 Sep 2025 07:58:31 +0000
Received: by mail-ej1-x632.google.com with SMTP id a640c23a62f3a-b00a9989633so377080266b.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 19 Sep 2025 00:58:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google; t=1758268708; x=1758873508; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=PT6JvarRuFKmmTEv7wD5leEJ64JN5pVMHm6P1LFVOTI=;
        b=fj80qH16hJ7HwNu2hBocRvulwaxjn1aZT4/0Gb22eOUILLII4ZTkhFUrEXDHTKMaVG
         W83AEqhSpw/ZTc+2gmdPZf3MNBP1aipWKhPjxcb+ZIaOJvScSD3M5k/0PIv/ZFnZKBt6
         DHyRvtj9pLYu+Xv2NGc2kagGUe5uaR7kiC69I=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758268708; x=1758873508;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=PT6JvarRuFKmmTEv7wD5leEJ64JN5pVMHm6P1LFVOTI=;
        b=nnziTBr8dgggIkvtgiWjCrig/xPl4t19EbDHndUvF0XfsW9sjOgWFqz5Ut8+gabZ88
         glFNagFH1OBw+bS3XRbX/kw+9TeX5lWMqSrHeziw/fUm9kwkDVY6+/fM3mrXj9+rA69A
         m6AJ2Cq/bzGMW1APnKXSb0n2QCNaXu8fDgJ4Y0vZwGAUFZDSO73uREtwd/6nM53yYms8
         Gand/1hdgcxGOZ/+65fpmJzV1UeIjZWzs9KSmPpS1/DHNmbJWe0XenPQzvTYINXmU1V3
         kEIfQHrYNHOxVDJswT2Opgjc4jWQJ8ZQoX2ZRoaqVkqqBGE3HtGZubOQ/ZJyt+wj7VIC
         pu1A==
X-Forwarded-Encrypted: i=1; AJvYcCVrRAYQql6xb5XFB5gt6Q85gULBkJBYRfwgGaRIZCPg0bDPiGC1PgmPsrlbp4F9jUEoiYUKoXwcfHBGIB0cq0IU@lists.infradead.org
X-Gm-Message-State: AOJu0Yx8S7OCPY+ykKoNmy2nq5PX1p3GxKo30W82tjGHiXUOKpWgLOdN
	D/JkYzIjYSxO/AhHrh1PbUQwpN8DYmY8Gp4vXDXSqGg0fvhCuwdYVmJ84fgU9mhmP3c=
X-Gm-Gg: ASbGncth9GwYVnBs/xcmxcNn1hfm4RmhFvv5oMCS6kd4aZz3SbiTzRooPqff2YVQsLX
	iXdAoO9wjEXyvVP5Sv/qaLwSCH4+dVaTYVwXWIfJpMlrhkSRfQtY5r2hQbeP3GyZAGPb+yq3xjh
	yGABcmNhRMHoOgArp+sWXQxxLySRTfDpTOGzvTgeNhrHofbr8p25L5mrIifvjI2ksin9dqjqjvC
	wIEq2XVnf8x9DvI6yU1xTWX6bjLiOQSmuz2b4+XT2GbCZVJhImzaX7igxLnp1+8iiGzaaPVd21B
	NKlfI7/PulDim+ekSmTlBcFd+Kv26WR+sRKQ/k5sbLb4UKB1Gxy1ICv0EFdb0pbexP7B/rObxR1
	t4/gmnhOuoth/qjDxJinDqwSivSyj3kY4J8pG6yKmucKK1I3cIukfFARY+ifoMH47UGkrLs71Fh
	AwvViqH32uHXUVTLt1hcQcBhBbE4ErMJLo6wc4AIDjcDqXyVAOx8qY655wNBhpk5IG
X-Google-Smtp-Source: AGHT+IFVmMbGPcUOVB2f/NGML0r+wfIEIHxLP2WkZddjteThkPE2Q3SgJjeYXbW4lXGUcYeGwGiGUA==
X-Received: by 2002:a17:906:eecb:b0:b0c:fdb7:4df3 with SMTP id a640c23a62f3a-b1faa413cc1mr735074866b.11.1758268707834;
        Fri, 19 Sep 2025 00:58:27 -0700 (PDT)
Received: from dario-ThinkPad-T14s-Gen-2i.homenet.telecomitalia.it (host-82-56-38-125.retail.telecomitalia.it. [82.56.38.125])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b1fc890cc98sm384693466b.49.2025.09.19.00.58.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 19 Sep 2025 00:58:27 -0700 (PDT)
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
To: linux-kernel@vger.kernel.org
Cc: linux-amarula@amarulasolutions.com,
	Dario Binacchi <dario.binacchi@amarulasolutions.com>,
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
	Conor Dooley <conor+dt@kernel.org>,
	Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	Eric Anholt <eric@anholt.net>,
	Florian Fainelli <florian.fainelli@broadcom.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Ray Jui <rjui@broadcom.com>,
	Rob Herring <robh@kernel.org>,
	Scott Branden <sbranden@broadcom.com>,
	Stefan Wahren <wahrenst@gmx.net>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-input@vger.kernel.org,
	linux-rpi-kernel@lists.infradead.org
Subject: [PATCH v5 2/3] dt-bindings: arm: bcm: raspberrypi,bcm2835-firmware: Add touchscreen child node
Date: Fri, 19 Sep 2025 09:58:10 +0200
Message-ID: <20250919075823.2557865-2-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250919075823.2557865-1-dario.binacchi@amarulasolutions.com>
References: <20250919075823.2557865-1-dario.binacchi@amarulasolutions.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250919_005829_839356_693C69B3 
X-CRM114-Status: GOOD (  15.53  )
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

Convert Raspberry Pi firmware 7" touchscreen controller device tree
binding to json-schema.

Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>

---

Changes in v5:
- Move bindings into raspberrypi,bcm2835-firmware.yaml
- Remove raspberrypi,firmware-ts.yaml
- Update the commit message

Changes in v3:
- Drop firmware-rpi node and use only touchscreen node to fix warnings
  you can see in
  https://patchwork.ozlabs.org/project/devicetree-bindings/patch/20250913092707.1005616-3-dario.binacchi@amarulasolutions.com/

Changes in v2:
- Added in v2

 .../arm/bcm/raspberrypi,bcm2835-firmware.yaml | 27 +++++++++++++++++++
 .../touchscreen/raspberrypi,firmware-ts.txt   | 26 ------------------
 2 files changed, 27 insertions(+), 26 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/input/touchscreen/raspberrypi,firmware-ts.txt

diff --git a/Documentation/devicetree/bindings/arm/bcm/raspberrypi,bcm2835-firmware.yaml b/Documentation/devicetree/bindings/arm/bcm/raspberrypi,bcm2835-firmware.yaml
index 1f84407a73e4..044544c17e8e 100644
--- a/Documentation/devicetree/bindings/arm/bcm/raspberrypi,bcm2835-firmware.yaml
+++ b/Documentation/devicetree/bindings/arm/bcm/raspberrypi,bcm2835-firmware.yaml
@@ -103,6 +103,27 @@ properties:
       - compatible
       - "#pwm-cells"
 
+  touchscreen:
+    type: object
+    additionalProperties: false
+
+    properties:
+      compatible:
+        const: raspberrypi,firmware-ts
+
+      firmware:
+        deprecated: true
+        description: Phandle to RPi's firmware device node.
+
+      touchscreen-size-x: true
+      touchscreen-size-y: true
+      touchscreen-inverted-x: true
+      touchscreen-inverted-y: true
+      touchscreen-swapped-x-y: true
+
+    required:
+      - compatible
+
 required:
   - compatible
   - mboxes
@@ -135,5 +156,11 @@ examples:
             compatible = "raspberrypi,firmware-poe-pwm";
             #pwm-cells = <2>;
         };
+
+        ts: touchscreen {
+            compatible = "raspberrypi,firmware-ts";
+            touchscreen-size-x = <800>;
+            touchscreen-size-y = <480>;
+        };
     };
 ...
diff --git a/Documentation/devicetree/bindings/input/touchscreen/raspberrypi,firmware-ts.txt b/Documentation/devicetree/bindings/input/touchscreen/raspberrypi,firmware-ts.txt
deleted file mode 100644
index 2a1af240ccc3..000000000000
--- a/Documentation/devicetree/bindings/input/touchscreen/raspberrypi,firmware-ts.txt
+++ /dev/null
@@ -1,26 +0,0 @@
-Raspberry Pi firmware based 7" touchscreen
-=====================================
-
-Required properties:
- - compatible: "raspberrypi,firmware-ts"
-
-Optional properties:
- - firmware: Reference to RPi's firmware device node
- - touchscreen-size-x: See touchscreen.txt
- - touchscreen-size-y: See touchscreen.txt
- - touchscreen-inverted-x: See touchscreen.txt
- - touchscreen-inverted-y: See touchscreen.txt
- - touchscreen-swapped-x-y: See touchscreen.txt
-
-Example:
-
-firmware: firmware-rpi {
-	compatible = "raspberrypi,bcm2835-firmware";
-	mboxes = <&mailbox>;
-
-	ts: touchscreen {
-		compatible = "raspberrypi,firmware-ts";
-		touchscreen-size-x = <800>;
-		touchscreen-size-y = <480>;
-	};
-};
-- 
2.43.0

base-commit: 8b789f2b7602a818e7c7488c74414fae21392b63
branch: drop-touchscreen.txt

