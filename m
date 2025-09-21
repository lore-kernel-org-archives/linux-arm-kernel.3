Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 95744CAC59A
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 21 Sep 2025 17:34:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=zj9dH/IE/77bdbBlwkTPAdjFGDmZXl6gQJLki2rgrNA=; b=Y+IS1cO2OgS59q28EOgJQAdUi0
	S0Ies0ntTzXfWvg8nZ6D4TWP61MwrgGZj34DH9z/bPdfy566uOzWYKrAT7ZSDDKrIEYkFMF8tajRe
	RTxiwQa/+bijU/mdBc7F8zzmE0n4Aq1j4JNt+PFvPUKIQ2PfPlGucOvT25/kbJ4wI216SOMM2PuQc
	gLcDvlhQuNEMToL9v1Anm6A/lcVq8wBYj5ytoUrFvGzDWkxPSWNISqQjb6beoI1+4+WtfcnpVstF6
	p3QJKpqkP5tcJ/jJSs+pIfleB4ClPZ5OP2d3fMRiSzeozkoZaZiEsOsoZt/ZoxlE4oWMpeQ8P913d
	Cfdy0beQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v0Nwp-00000007wTa-1EC9;
	Sun, 21 Sep 2025 17:34:03 +0000
Received: from mail-ej1-x62a.google.com ([2a00:1450:4864:20::62a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v0Nwm-00000007wSC-1OB6
	for linux-arm-kernel@lists.infradead.org;
	Sun, 21 Sep 2025 17:34:02 +0000
Received: by mail-ej1-x62a.google.com with SMTP id a640c23a62f3a-afcb7a16441so529763266b.2
        for <linux-arm-kernel@lists.infradead.org>; Sun, 21 Sep 2025 10:33:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google; t=1758476038; x=1759080838; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zj9dH/IE/77bdbBlwkTPAdjFGDmZXl6gQJLki2rgrNA=;
        b=f3g8F9wOQyX8XIbCyS+8oS3qcLX4VBwrJpWHNo+efwjpdtO/e2rijvAouo4ANd25gY
         Nj+nThQcEwqpgSq69pEv5x7bWmhiGAZ9xYdV5Y1mctQGUBl+blvrNbKGe7VShHrOUWBN
         7Z0y5Di4+sfpM1iT5jcwEFKFESyF69oLZWkIw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758476038; x=1759080838;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=zj9dH/IE/77bdbBlwkTPAdjFGDmZXl6gQJLki2rgrNA=;
        b=kkKfC8KJ2j1jouTi7yhXh4VSN2lV+T/Zg+y4s/HGExU86lOZ0oWz/h6n/X7g92qBEx
         L73nh1NORI1gcw3IQuWqp17ud3xJpHuijIG0e+jzX67zFFfwCsRWpsBdaFNYts+GSEqv
         kl8L6cZGbpoLPC5FByS2usUpiR6h+HX4dEiAsLc27gYhwalcxig2X0doi46MkcgksHDv
         1YVCJdl/j2N97J1kqSpeoSpYqZ6Zz5+yK1PrCZH9WzKyLd7XXn/4+Hi5O27fVE528ICi
         BMRh9XA3CpnI20tRl9pxDHj8C1BFm/XF5OJQJItEvz3J6gwzEncZQehIBStM9X1I7opi
         rk1g==
X-Forwarded-Encrypted: i=1; AJvYcCW3bBrIfKuHyET/f5GHCeSuU/rwktmMSH7ZVMMOa8Qtup06kjlUc5sTDm8OTR4y0R169/KLVpSQ9Jx3N4rLPTQL@lists.infradead.org
X-Gm-Message-State: AOJu0YzoImq992pIium9BkNAmHj2tf9DYKlyEv4lxxb3HO7ELvvE5TaA
	xBAqESCXli5yr5/uQh3/m3JgzkzvLEuRqiOIOGyMB55pP2SZbhhnVLe7OFjyG7tVHbY=
X-Gm-Gg: ASbGncsknV6A9YM0GL9HTFv5wShTYHFR92TQOVVR5U1hgsHoz6jpMNuATou5Y3esuX7
	E7AZPBgm7ye34mylMmjowwdhfUX2PIx9kLxQK3r9wn7etNoyCgYB72xXDaZPqET4lKTCOqh8QT/
	zLjhWTxMD0TLcthEgekinipjcdzQmyohGIj7+jhIluGjAGJTmlnxKTSzst51IbSvEto8YYoqFBy
	ypa4/6TC9v4LPHGTZ+lnejzS2Xu21xsy4bzy29FmSr/r5hSGR9m/LJSJ/yTBxbWYwRndPE9I6s0
	f4QIdTwMkDh04TPpTUuTJRELBOisjeNYSedoFtsTuMs19S0rTqDBIQtcR5JbylXnBg051MGMR55
	o07G/t6TujG6BZV3wEMJutLQyIGMSXFdE5emt4xTjHS53Q3ZNx9NZwv4UDlRU7SoHdj+0JaAxar
	njyMCBRFKyLgBmItSUFYNrY/ve0TvgazzrrNWtFU3YMidWFlv7ZmPbVgY5FKDktQQS
X-Google-Smtp-Source: AGHT+IELR3aAJwhh1aLPtkTHY1OkF1rr/ic7Ckv+/xLZy9AvN4maY3EHd3KWHVVOccM88c8SJc/H9g==
X-Received: by 2002:a17:907:1c1a:b0:b07:c290:6ce7 with SMTP id a640c23a62f3a-b24edd549f9mr962373366b.7.1758476037865;
        Sun, 21 Sep 2025 10:33:57 -0700 (PDT)
Received: from dario-ThinkPad-T14s-Gen-2i.homenet.telecomitalia.it (host-82-56-38-125.retail.telecomitalia.it. [82.56.38.125])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b2928cd31a6sm324347266b.102.2025.09.21.10.33.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 21 Sep 2025 10:33:57 -0700 (PDT)
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
Subject: [PATCH v6 2/3] dt-bindings: arm: bcm: raspberrypi,bcm2835-firmware: Add touchscreen child node
Date: Sun, 21 Sep 2025 19:33:43 +0200
Message-ID: <20250921173353.2641438-2-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250921173353.2641438-1-dario.binacchi@amarulasolutions.com>
References: <20250921173353.2641438-1-dario.binacchi@amarulasolutions.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250921_103400_410255_D935DD46 
X-CRM114-Status: GOOD (  15.19  )
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

(no changes since v5)

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

base-commit: f975f08c2e899ae2484407d7bba6bb7f8b6d9d40
branch: drop-touchscreen.txt

