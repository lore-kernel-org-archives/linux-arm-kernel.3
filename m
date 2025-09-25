Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9A94BCAC5A7
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 25 Sep 2025 15:32:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=5s1NkUGStweVlYWGlUVqWZR3tOWBeOpZjnhIgCBEaNw=; b=jSaEWfQ6xhWW+v5iwHxaWFO6v0
	XbEjCR0+pSZ06/gBgvK0NoFa7MKqqeSpkWMnih6hdMpOJCX1Rzmnk29re5fcIHXMBgNomqEpFFcFG
	0QYwiaeyzRUa14/IlvVE9kpaT+cxniUUfAri329JzIu90YDsRoiMe1wQTb8v4zp7hNs8+HNWZdy8U
	n3WAWomsbPLDGbleUIrWQAnZfpjwqm8GEsEO9TLmuv3sMrTHs9vrKz/GkUeY2cpRHxTZoHo8RpfyL
	Lz0NdD24VfPZ+oA/RrSH8ZcTrqk4xGH02D0oaJtr2QS21atL9Rg+O76xYnnEwE4zw8mYNtYI8gK5o
	uh768XbA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v1nwr-0000000Aecn-3Jfh;
	Thu, 25 Sep 2025 15:31:57 +0000
Received: from mail-ej1-x634.google.com ([2a00:1450:4864:20::634])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v1nwo-0000000AeZ3-2Pog
	for linux-arm-kernel@lists.infradead.org;
	Thu, 25 Sep 2025 15:31:56 +0000
Received: by mail-ej1-x634.google.com with SMTP id a640c23a62f3a-b29ebf9478bso154585966b.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 25 Sep 2025 08:31:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google; t=1758814310; x=1759419110; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5s1NkUGStweVlYWGlUVqWZR3tOWBeOpZjnhIgCBEaNw=;
        b=KXsYlXUy39FyLTGSA32uc0lWR8KBBEtftOpGPP0CLmmPv102juycn4BGYRJeCEIIjw
         7NP+dE1eMvXsiBUkeFJzv3Zq6oa7f+Jf6J/saXFfFwgA5uj31vJSwI90vA21kgojS7+e
         m1DU0Gyw6qc6Xcf9TBTOse8YSD38pWt8Ynqk8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758814310; x=1759419110;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=5s1NkUGStweVlYWGlUVqWZR3tOWBeOpZjnhIgCBEaNw=;
        b=KkC2HP5MXKTYPQ8U5E2qhY2fDrU66UqitaC9y06vqxnDHQxaZCnsHYuwGZeWIKqfqI
         BeMy7GJ34ECwmk94wcBMYQfe3TA35AeFZhnaz5D/awpYQRJ54+O35d3a/Mwuv3U6s+u4
         y4tF5kaW9gLxSqrUKfMgEv2gKoFXmdFxUpx0MZ9DhegpfJRjHSft3wPiySZXi/XzGJBw
         tpXqBJ4JK+X8VLJrwKY5RsOHeTsgjm92oNZOh3p3pcZWoxkyGaxvz1PSioOv8Q38+shj
         m/HNcDWmMmG//DYKV0aVcsXOhXb+OUemdjSLaYF3pgGTLjne9ofeWq3NUTrIcasBBAiO
         kMUw==
X-Forwarded-Encrypted: i=1; AJvYcCURP/e0zQl8r+v/HOeYdXeDllOx8Qv/wCmYENGYJmj/VmgVZcTBzMuPuODCbidbeC+3n2RB9iB1QobhMpAybjXj@lists.infradead.org
X-Gm-Message-State: AOJu0YzEijbHHuV+hE5alWwgmD6q473smAAg96qd1yKJNQYbi7AcgUpd
	dOPMMKLyfG9qpXTsZ2YozftkwD5UEj4HoxntGFrvTmCTyDpk9349Z/cw0TMtY/NLBHY=
X-Gm-Gg: ASbGncvsCQHfr3kKYnyEle+KfcuqB76TGBIRKXzrMJuY3yaXgoJQsjR1bxr+C1wv3x8
	5HvZCtfsGz5eevIdH0XH8n7tUWrMpYKEC1R+ZloSLwrBZqmSdfdUIFMHLnNPl9YzaVYlWMU28GJ
	mi6bhVYIsavHWHnlQcJ3Yn8svDAD//hXZdDukpo/RuyF8x3+W4ZE6fbPIhg1ceEIB8vnpMTza0g
	q8HL4B926wYNVLhFypQFxA88wmosQAfIq0tUiijwqlX6hYkicYRwMSX5wDr03kmYoCLBVqCzwEX
	1NZEbVqS5FwjjnVh1SlP/UzYUaMbfF3eovmgzMs3ocRzkdCTPOyw6nYCdn7DGDOg8aWcx3WBUfO
	Fu4zlC9UnBP74YtNfPrlSmtkzz/4yJKWbfLbU2GGamg6xJbNYLueK9H+D9FZwAMYsd5CI71UCLR
	oRQqbMAP+KofVcIHiCLuYASqkH/25be1oCko12Tq7XKoXjIDjBOogA8R8WSq5jqO4nsdf1f/+gZ
	bDyfb0pBlQ=
X-Google-Smtp-Source: AGHT+IF7BuPuSGwyBCz2UCqO+HRTTylRFxaIlwU3C5Efe36PDl6FBJSX2Hnycv4Zf1+SFTY6NIs+yw==
X-Received: by 2002:a17:907:d94:b0:b04:2d6c:551 with SMTP id a640c23a62f3a-b34bb9e9ffemr417345866b.42.1758814310288;
        Thu, 25 Sep 2025 08:31:50 -0700 (PDT)
Received: from dario-ThinkPad-T14s-Gen-2i.homenet.telecomitalia.it (host-82-56-38-125.retail.telecomitalia.it. [82.56.38.125])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b36f410e129sm43924766b.89.2025.09.25.08.31.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 25 Sep 2025 08:31:49 -0700 (PDT)
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
To: linux-kernel@vger.kernel.org
Cc: sebastian.reichel@collabora.com,
	linux-amarula@amarulasolutions.com,
	Dario Binacchi <dario.binacchi@amarulasolutions.com>,
	Rob Herring <robh@kernel.org>,
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
	Conor Dooley <conor+dt@kernel.org>,
	Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	Eric Anholt <eric@anholt.net>,
	Florian Fainelli <florian.fainelli@broadcom.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Ray Jui <rjui@broadcom.com>,
	Scott Branden <sbranden@broadcom.com>,
	Stefan Wahren <wahrenst@gmx.net>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-input@vger.kernel.org,
	linux-rpi-kernel@lists.infradead.org
Subject: [linux-next PATCH v8 2/3] dt-bindings: arm: bcm: raspberrypi,bcm2835-firmware: Add touchscreen child node
Date: Thu, 25 Sep 2025 17:31:34 +0200
Message-ID: <20250925153144.4082786-2-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250925153144.4082786-1-dario.binacchi@amarulasolutions.com>
References: <20250925153144.4082786-1-dario.binacchi@amarulasolutions.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250925_083154_799372_1EA6707E 
X-CRM114-Status: GOOD (  15.59  )
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
Reviewed-by: Rob Herring (Arm) <robh@kernel.org>

---

Changes in v8:
- Add Reviewed-by tag of Rob Herring

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

base-commit: b5a4da2c459f79a2c87c867398f1c0c315779781
branch: drop-touchscreen

