Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E98D6CAC5A7
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 23 Sep 2025 12:57:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=eq3dfyrFYclljj1qT31cA5X22L5O+KUSooUYqpQO2X0=; b=AafgkmWydk7TXdDDosOjbJLBbu
	OvRDbN04IrdLhKxGRSEwaeTdcBRCq/p6shNZH68bXVGgI0iULLSnjfUm7F82WPqwqa+ZXMzWC3cDk
	tpln7tRbQiXxMxHu2Xs47UvSsza1lA2uOfKCCj8gqojhGT1hFRsb9W6UvtilL/6z0snw7T8paE6Ql
	2869Elf/SGsrzpDnCnfsGhKU7CRUgwF5NYU3VOKGiqQfReJapouVHhpikm22DFDMRoTdfPfsEAmab
	3bGwMEgxaGxLRVhr/PKJxAOJXHmn/SnyWulDke6zZWZ/5TksgNG83QGZkgPBRP549+aqvm1DY1H7g
	DM24SLYA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v12ae-0000000DNjL-19ve;
	Tue, 23 Sep 2025 12:57:52 +0000
Received: from mail-ej1-x631.google.com ([2a00:1450:4864:20::631])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v12ab-0000000DNi0-1xhk
	for linux-arm-kernel@lists.infradead.org;
	Tue, 23 Sep 2025 12:57:51 +0000
Received: by mail-ej1-x631.google.com with SMTP id a640c23a62f3a-b0b6bf0097aso1006507566b.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 23 Sep 2025 05:57:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google; t=1758632267; x=1759237067; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=eq3dfyrFYclljj1qT31cA5X22L5O+KUSooUYqpQO2X0=;
        b=ZsJ4W6KQ7hxtZP1+LQXmcDqj75d1Fleik9bAjRDZdxs8VKRsZWTfUUOSIpz51dBWfr
         OvxZPNIkaA1InalrQwNY82IE0Zo+mnC7l9/m2r/CtJ8Spl73G4TfQpbN8zoa5GNenQou
         vSD4m826EK1tzBSNcSH6r2adplZt7KMwzEfS0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758632267; x=1759237067;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=eq3dfyrFYclljj1qT31cA5X22L5O+KUSooUYqpQO2X0=;
        b=TliTst4pjIzxo8jD/qKWngaQXcaPQfQ9PbZJDJ54tBi0Vqrjz5zcJ6YIjTX0BTXAnB
         F2tXQyqbfX82C4qIq4wlEeWLQL2MlZstHYUyMgfOJvL69l6SSBTjDxstq/5vlWGRwxcv
         b2HhpTO19E6UYjNt/dTZaympziK/P3ERxGMFCJFPjDcwdFWy2x1JwSe7TjZu72R8bch9
         Fp4bf2fjoLmpvIdFIzB4XmlcC+leGXJtV43lJJv/Kg/1mGPoOCm8ao65JPxZ41y82auE
         kz/QRuS2PiDG+nrdEEUqGQRsu6Qu1Lvz/7QhCTfpnCxpCDCrchZelPKUIdGQYNwtbhLp
         8H+g==
X-Forwarded-Encrypted: i=1; AJvYcCV5SuauqBqsFQ+iT9FAAUV9AS5rqLdx4bKLS74RcDS/QflVNDeUqf/x8hvqaO8V3g0nQEkWazLhM8ClJ9n3TNi8@lists.infradead.org
X-Gm-Message-State: AOJu0YxGklcOAjCanvuYl7eQ7h66c9kHzDjlsuV+uUKih+8dSp9CGHS/
	oGVmFZYKEm7qbKxIuJP/qFM1fssxWQOR2N5xtseJXSkTCQNI1MRP3NnmWx/du5u10xc=
X-Gm-Gg: ASbGnct6Iucru/8yLMJlZYwOy31Yim7yDAqXlPO4VjXItiJ7vEjAIC172NvIqdEzdUM
	++C86QEjmXeDq/1rtcBXGpMmf9GPri/dcNBjvsaZgxPSbzJL8lOKiOuMVKOXwhH5ffmTdjmdK/h
	wrS6XT70PsB6I6XLR/5XVLa+g7JCxr5nyeG3TbpTknTMn1kc8+f0YMs0cYgunrP5ZvAgGVX7CPy
	RuGnwFMUs6gIesbQLXf43PcN1YY284IpD1ktbv1srvTCL8han4jSCRC5+K2vIkYJY31z/S/fiBl
	uEAWvTHef2MhcSJDyoPDXuojvb8DWZN5JvmFnqQFL9HzXP3TzTgSsVbCgmBdT0lQaCtIca+T6f1
	umXDkhGgwiKvzEzwXSmTmF3ymwQq4DZZGpax1JF6Srb+7HVZ/Ugq50tg80+SCZxjoU4cljToWdX
	3HVxyOMY5StT9ypd9BIegAYVTVUhswC+OMymnncCtv0c+vLrjnIsj5G0MQHwzqXjn6
X-Google-Smtp-Source: AGHT+IFGakYPF5iPMB1/+894VRlbLwCXmeQPzZ6Q8KuBpQCg4xITr20xSCf3DfifCufaTwJ53CPxGg==
X-Received: by 2002:a17:906:f58a:b0:b2a:dc08:5914 with SMTP id a640c23a62f3a-b302ad3922bmr241240166b.45.1758632267240;
        Tue, 23 Sep 2025 05:57:47 -0700 (PDT)
Received: from dario-ThinkPad-T14s-Gen-2i.homenet.telecomitalia.it (host-82-56-38-125.retail.telecomitalia.it. [82.56.38.125])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b2761cb532esm872331166b.67.2025.09.23.05.57.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 23 Sep 2025 05:57:46 -0700 (PDT)
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
To: linux-kernel@vger.kernel.org
Cc: linux-amarula@amarulasolutions.com,
	sebastian.reichel@collabora.com,
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
Subject: [PATCH v7 2/3] dt-bindings: arm: bcm: raspberrypi,bcm2835-firmware: Add touchscreen child node
Date: Tue, 23 Sep 2025 14:57:11 +0200
Message-ID: <20250923125741.2705551-2-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250923125741.2705551-1-dario.binacchi@amarulasolutions.com>
References: <20250923125741.2705551-1-dario.binacchi@amarulasolutions.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250923_055749_548620_0F29C12B 
X-CRM114-Status: GOOD (  15.69  )
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

Changes in v7:
- Add $ref: /schemas/input/touchscreen/touchscreen.yaml#

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

 .../arm/bcm/raspberrypi,bcm2835-firmware.yaml | 28 +++++++++++++++++++
 .../touchscreen/raspberrypi,firmware-ts.txt   | 26 -----------------
 2 files changed, 28 insertions(+), 26 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/input/touchscreen/raspberrypi,firmware-ts.txt

diff --git a/Documentation/devicetree/bindings/arm/bcm/raspberrypi,bcm2835-firmware.yaml b/Documentation/devicetree/bindings/arm/bcm/raspberrypi,bcm2835-firmware.yaml
index 1f84407a73e4..8349c0a854d9 100644
--- a/Documentation/devicetree/bindings/arm/bcm/raspberrypi,bcm2835-firmware.yaml
+++ b/Documentation/devicetree/bindings/arm/bcm/raspberrypi,bcm2835-firmware.yaml
@@ -103,6 +103,28 @@ properties:
       - compatible
       - "#pwm-cells"
 
+  touchscreen:
+    type: object
+    $ref: /schemas/input/touchscreen/touchscreen.yaml#
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
@@ -135,5 +157,11 @@ examples:
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

base-commit: cec1e6e5d1ab33403b809f79cd20d6aff124ccfe
branch: drop-touchscreen.txt

