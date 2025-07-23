Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 681B3C83F25
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 23 Jul 2025 07:17:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=9zsnQoYlGAtPfOsdm2IE5TQWxuSL8YKpwWHSnuH75p8=; b=SGi9loPr8f7Oc0BK3HBVO7OWUZ
	pqCl0+D/UmVGwC49Xo8/BnyfzAkjVlQHOYnG+udoLBvEgYcDtM+/ZYbj+rxwkg1r42wsAyLANAyfy
	JDrBLeKwL4pt0OZRZyGszD7Gf1Vh59nNSxqUyhljWpzMDFt+S1q7mOgbw0xbV7LjX2GA3a8LVKRVd
	KlWV3MJpvJn7Cybs401G+iE9JHc6PaE1wNQ+211D1Em+WInhaa6NVw7n3xKeHH1x9rfnt+WX4qQrZ
	LZgsqFK+Fy/bMORhZh3fepyBmuiAK8dTCVB6uy0JxpELfW2ZWbKF8NmD7CRq0jrt9CEnbu4cTPv9Z
	psUG/0mg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ueTj7-00000004DPb-2udr;
	Wed, 23 Jul 2025 07:17:21 +0000
Received: from mail-ej1-x633.google.com ([2a00:1450:4864:20::633])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ueTgd-00000004DCH-3f6C
	for linux-arm-kernel@lists.infradead.org;
	Wed, 23 Jul 2025 07:14:48 +0000
Received: by mail-ej1-x633.google.com with SMTP id a640c23a62f3a-ae3be3eabd8so143513166b.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 23 Jul 2025 00:14:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google; t=1753254886; x=1753859686; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=9zsnQoYlGAtPfOsdm2IE5TQWxuSL8YKpwWHSnuH75p8=;
        b=L7MgBoHbfsxVIps0tbRj9ncPcjkBAMpyAlFmUx5YMOOGqUpJJnHCVb3H66EzDSKrmd
         6fAronifhSWpS1TC4+gvdRcdP7h2ZUlmiK/ekaYTEUrl9wBHuCjXco7I7JwSyrRF3/lv
         roxIALZBX7Hpuf6ZfE97C2gKxhQ+8av4NO0NA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753254886; x=1753859686;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=9zsnQoYlGAtPfOsdm2IE5TQWxuSL8YKpwWHSnuH75p8=;
        b=TF28Mrch86NE8/QTepyM9g0nWsiUjmPru80h3DSh31GXr07j5eRbC6UGjbvIlTCL2g
         /TiFZyrvf22pIGpqi1SmGvV4wMfTGGraCvS3kOUYeqWzOiVG2ZMCyx36I2/8PgpM72/w
         b8ZeDC+b9g2UtMc5VcA/QGX6/E6Wx0ppBmdvyt6qLAvMMHcpUvUu94QRS+H65l13Y9rC
         BdsPph/GLEENJQfM5dQeXSeJiwUlU9nRra9diiuaBYE6LM0Vt5+O+BsR5quLr5dzPgPa
         L5vEw3OEhvK1rrrVSv9hwisT4mTOgqJxUUn0TmsWFCml6piowNBI6KAAwqqYoADV5XQm
         oogA==
X-Forwarded-Encrypted: i=1; AJvYcCVZKhiNz4r/WjXvP9BoV8Na6tBNLjYR8a2k9HZDwV7/l4A3IGSn2evgUvTKZmi3zf3wdziPp94e+pW72DMUF12Q@lists.infradead.org
X-Gm-Message-State: AOJu0YxKn5z7+4hzJS5A99BepT3Tc3vXm5t6LQ/vNYpgkS72jWHd7frA
	w6DRp6eirx3DN9HuDXXaJRe0i/NQTOtn9rML6YHopUHBDBHAQbdoOaThwwyn80y8Quo=
X-Gm-Gg: ASbGnctz4LKGdW2ZbPOF76SboxgjaoWOk//h0/KaltF+vsntvD88qpbAjfFus37cRyU
	shbQB7OzOVhXQpjudJUFWXQH1OIi26UaWZ0FMGaugSGmXiW+mHEsCeDi+FbMzEQces4rZsT+e6f
	/qAQRGgkEi9uI3YrqEPZAlkWgCutLnOWcSQEmUkqGy89PIjZ84GK0OH7vl/8tvR4pndwQ5QeFO9
	eVp6YiLkCzdFaFXe89lp+TE1Sx0SNPQlFqFxVcZf8Ob6h+pYNHWBCbYQBnjX23lGFx7H+5O21yD
	+rQwWF94pMr8JyCuPEaJkvU1375lcXN+ozFAljqqfOrmsHqvoEsnhjmFiFWIe8fKYkjczLrqaG8
	7yrZpGMdhrKToHBLMZIejTQH5cGFtskctP6trYBvM0Yd5CW+s2/+wr2RMxEVMdwP7oKAe+rgYZF
	2ve0D4KW4IytcNmqAqZ8WeHpHGlRV0RPJ21dQxcKGKtwQRXOkVqPQ89nnyWPKBTAZy
X-Google-Smtp-Source: AGHT+IHXPN5Tuqtpbz2c82B4GJgt/27zMO5flrScxbOfd0W5i6tJDzdfZGk1pNa38lNrnnbEsvlhKQ==
X-Received: by 2002:a17:907:c2a:b0:aec:6701:b4ef with SMTP id a640c23a62f3a-af15484cc84mr638526466b.16.1753254885856;
        Wed, 23 Jul 2025 00:14:45 -0700 (PDT)
Received: from dario-ThinkPad-T14s-Gen-2i.homenet.telecomitalia.it (host-87-15-176-33.retail.telecomitalia.it. [87.15.176.33])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-aec6c7d524asm999334466b.45.2025.07.23.00.14.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Jul 2025 00:14:45 -0700 (PDT)
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
To: linux-kernel@vger.kernel.org
Cc: linux-amarula@amarulasolutions.com,
	Dario Binacchi <dario.binacchi@amarulasolutions.com>,
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
	Conor Dooley <conor+dt@kernel.org>,
	Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	Florian Fainelli <florian.fainelli@broadcom.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Rob Herring <robh@kernel.org>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-input@vger.kernel.org,
	linux-rpi-kernel@lists.infradead.org
Subject: [PATCH] dt-bindings: touchscreen: drop any reference to touchscreen.txt
Date: Wed, 23 Jul 2025 09:14:20 +0200
Message-ID: <20250723071442.3456665-1-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250723_001447_925544_A1047CCC 
X-CRM114-Status: GOOD (  13.55  )
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

With commit 1d6204e2f51f ("dt-bindings: touchscreen: Add touchscreen
schema") touchscreen.txt is no longer needed. Remove the file and
replace every reference to it with the corresponding YAML schema.

Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>

---

 .../devicetree/bindings/input/touchscreen/bu21013.txt  |  2 +-
 .../devicetree/bindings/input/touchscreen/eeti.txt     |  2 +-
 .../input/touchscreen/raspberrypi,firmware-ts.txt      | 10 +++++-----
 .../bindings/input/touchscreen/touchscreen.txt         |  1 -
 .../devicetree/bindings/input/touchscreen/zet6223.txt  | 10 +++++-----
 5 files changed, 12 insertions(+), 13 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/input/touchscreen/touchscreen.txt

diff --git a/Documentation/devicetree/bindings/input/touchscreen/bu21013.txt b/Documentation/devicetree/bindings/input/touchscreen/bu21013.txt
index da4c9d8b99b1..9f1a6d03c4da 100644
--- a/Documentation/devicetree/bindings/input/touchscreen/bu21013.txt
+++ b/Documentation/devicetree/bindings/input/touchscreen/bu21013.txt
@@ -17,7 +17,7 @@ Optional properties:
  - touchscreen-swapped-x-y : General touchscreen binding, see [1].
 
 [1] All general touchscreen properties are described in
-    Documentation/devicetree/bindings/input/touchscreen/touchscreen.txt.
+    Documentation/devicetree/bindings/input/touchscreen/touchscreen.yaml.
 
 Deprecated properties:
  - rohm,touch-max-x        : Maximum outward permitted limit in the X axis
diff --git a/Documentation/devicetree/bindings/input/touchscreen/eeti.txt b/Documentation/devicetree/bindings/input/touchscreen/eeti.txt
index 32b3712c916e..1230b0fd153f 100644
--- a/Documentation/devicetree/bindings/input/touchscreen/eeti.txt
+++ b/Documentation/devicetree/bindings/input/touchscreen/eeti.txt
@@ -10,7 +10,7 @@ Optional properties:
 		latched. This is necessary for platforms that lack
 		support for level-triggered IRQs.
 
-The following optional properties described in touchscreen.txt are
+The following optional properties described in touchscreen.yaml are
 also supported:
 
 - touchscreen-inverted-x
diff --git a/Documentation/devicetree/bindings/input/touchscreen/raspberrypi,firmware-ts.txt b/Documentation/devicetree/bindings/input/touchscreen/raspberrypi,firmware-ts.txt
index 2a1af240ccc3..c554c89b4e55 100644
--- a/Documentation/devicetree/bindings/input/touchscreen/raspberrypi,firmware-ts.txt
+++ b/Documentation/devicetree/bindings/input/touchscreen/raspberrypi,firmware-ts.txt
@@ -6,11 +6,11 @@ Required properties:
 
 Optional properties:
  - firmware: Reference to RPi's firmware device node
- - touchscreen-size-x: See touchscreen.txt
- - touchscreen-size-y: See touchscreen.txt
- - touchscreen-inverted-x: See touchscreen.txt
- - touchscreen-inverted-y: See touchscreen.txt
- - touchscreen-swapped-x-y: See touchscreen.txt
+ - touchscreen-size-x: See touchscreen.yaml
+ - touchscreen-size-y: See touchscreen.yaml
+ - touchscreen-inverted-x: See touchscreen.yaml
+ - touchscreen-inverted-y: See touchscreen.yaml
+ - touchscreen-swapped-x-y: See touchscreen.yaml
 
 Example:
 
diff --git a/Documentation/devicetree/bindings/input/touchscreen/touchscreen.txt b/Documentation/devicetree/bindings/input/touchscreen/touchscreen.txt
deleted file mode 100644
index e1adb902d503..000000000000
--- a/Documentation/devicetree/bindings/input/touchscreen/touchscreen.txt
+++ /dev/null
@@ -1 +0,0 @@
-See touchscreen.yaml
diff --git a/Documentation/devicetree/bindings/input/touchscreen/zet6223.txt b/Documentation/devicetree/bindings/input/touchscreen/zet6223.txt
index 27d55a506f18..384eeb4a333e 100644
--- a/Documentation/devicetree/bindings/input/touchscreen/zet6223.txt
+++ b/Documentation/devicetree/bindings/input/touchscreen/zet6223.txt
@@ -10,11 +10,11 @@ Optional properties:
 - vio-supply		  : Specification for VIO supply (1.8V or 3.3V,
 			    depending on system interface needs).
 - vcc-supply		  : Specification for 3.3V VCC supply.
-- touchscreen-size-x	  : See touchscreen.txt
-- touchscreen-size-y	  : See touchscreen.txt
-- touchscreen-inverted-x  : See touchscreen.txt
-- touchscreen-inverted-y  : See touchscreen.txt
-- touchscreen-swapped-x-y : See touchscreen.txt
+- touchscreen-size-x	  : See touchscreen.yaml
+- touchscreen-size-y	  : See touchscreen.yaml
+- touchscreen-inverted-x  : See touchscreen.yaml
+- touchscreen-inverted-y  : See touchscreen.yaml
+- touchscreen-swapped-x-y : See touchscreen.yaml
 
 Example:
 
-- 
2.43.0

base-commit: 89be9a83ccf1f88522317ce02f854f30d6115c41
branch: drop-touchscreen.txt

