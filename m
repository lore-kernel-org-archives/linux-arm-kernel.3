Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ED6C6CAC59A
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 18 Sep 2025 15:36:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=TEyYKH4qkqBCP6LUsqOTNG7YVoVZeon8od5MlA8LTKM=; b=VkoJ/dLScibKCv4R34WaERM9Lz
	ZzVXz4aZXgEWMkr3KnTGSAGZTCmqwFagTHkprg5FKCHuYxEBetSOCHpH7vraRVKcC4yC0rnOfVxQS
	g9kIx/qPL92+ZxLa1lTjqCtgWaV7t2JWJKFwA19Cvfy24bUASsU2dPzY5Xg9hCquXUkvxjIZ+y8XY
	AB7ERZq7dlXtPQcUBlmE9cFo93wmg5nuiYAdiCB48w5eoQZGKh7w1QB21ImZKCu0HdpR+zC/mtdiR
	EUYc0D6D7+j9/EBXqVuwFvHKIeZLcBjJc2luEFVye/i5hahpVcvKyUezia4spGHhzTbmvbRi4plZW
	xJ+d/fuw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uzGgb-00000000RAG-2v1L;
	Thu, 18 Sep 2025 15:36:41 +0000
Received: from mail-ej1-x62f.google.com ([2a00:1450:4864:20::62f])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uzGgZ-00000000R7Y-0iTX
	for linux-arm-kernel@lists.infradead.org;
	Thu, 18 Sep 2025 15:36:40 +0000
Received: by mail-ej1-x62f.google.com with SMTP id a640c23a62f3a-b0411b83aafso174975266b.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 18 Sep 2025 08:36:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google; t=1758209797; x=1758814597; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=TEyYKH4qkqBCP6LUsqOTNG7YVoVZeon8od5MlA8LTKM=;
        b=JlnpPqBQ1mb23mD2XGtYh66wk3t+WFCfhGx7i0KLJ5uwECBcC1b63semIxOqA0pljV
         6YuT3a7eZRoRh6MlZ/i+4FMr3HC8nY9b7BQRNCc7Rn6l4fRQGhAUiejcjAKz1yxPVPP+
         eVpEx7HaC4ZvOqQLpzKfi4gwFa6cSlD9zQ8mM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758209797; x=1758814597;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=TEyYKH4qkqBCP6LUsqOTNG7YVoVZeon8od5MlA8LTKM=;
        b=E+tgfr9sH0H02boHjbJXPUP8cJPcCOrwmGbQsbb/qEjnPgfPrBd+GXo3IlomJxgOXv
         SE3N/OpAmKqRpCB0fDC8zJtzgMT2cv3DR4aGUmM5aiEnJUkJCbUZyOxrUuQeIMLQMkOH
         /xxrOHZYiuLmIfzSni/BDXN9IOL0fhLL2rZ+kWq9JcJ0Hl1i4l1/7Ea85Dsexz+MG1px
         +W5hK1JlUVX5x+2XjSgr7hMfcdiJkI/AIw54A9fluaHdx5Ts76YLCYPigKchFg5PT9t+
         6uTfdrbJ2rBPzrFcszD8qnCdsygCOptjEBLWOxq8zMjPebKDfYEmIv+Gy07K6BaHRrkF
         CKow==
X-Forwarded-Encrypted: i=1; AJvYcCWcxXAGmd42Z9tJQ3d1+aguyZfGOR0d1r71Jw9da9WH4XExx2iP2HutB8837A95AoLJ3aTRFK1cuXVA2I9H427z@lists.infradead.org
X-Gm-Message-State: AOJu0YwdHnuzClLdDA9WjfJmVWNUvPyAnkOUX1n//aerOOki1pdx2wKO
	g0uT9VFbs5dt0rlNbSKw44bdhZoHOWRco7K5viZV5aQP68kpXVdDGn3ybwbz4ZRVGJY=
X-Gm-Gg: ASbGnctTKczpVg2E5RC+tZZr5bDbn6Y3QJeaSEh25eUHut+yAFCZpB77gtJh2reLuvO
	/SrVmku1Iaa06iO9CQN8OfABgh/126JH7IeS1+p+IOldGHlxNmL44p6OIThNHw2fRNUG8VYgt/6
	HvEuqqFhjtxX0qj8iGzbLDC/vSQgHh5C4bmDi81mLlpcvYinVrmuMmk4d+5tyjihcItzKBAT23G
	2Qg3Njx8ZaslkkHGd2Be1hHLhci6effdnVs7v7npzNnwruZKOrLhF3HXWsLZS8RaATjJMyU1npH
	DiT4B7arQJDkOixnufTgnqdiGkobNldcZ5yUzEXpdPNxZA8yLguKeip4QS+iVXFtyo6k5LIr2Gb
	b4ngi/XP9jJGo3BFjN8riXdpkCG9BIO9e/7GBbA9fO1AUgUMOhDef9cr7ZLIe7QW2i+huQadosK
	Kpwc+nKH8CdQzlTml3u+SAhOobl57mk/bS+qeX1qDiFqBhxlAtY3HbnpigxgKvUaVOLSB+Hr4yO
	zKury5epOo=
X-Google-Smtp-Source: AGHT+IGYaHFbg/1QCb5L+gBEaKgygAIv/jFGntbk+uDxzoL55Zp1d+zUktfDGz/HaUwuss8VFlD8jg==
X-Received: by 2002:a17:907:2da5:b0:b0c:fdb7:4ddc with SMTP id a640c23a62f3a-b1bb0c43f6dmr683814966b.19.1758209796976;
        Thu, 18 Sep 2025 08:36:36 -0700 (PDT)
Received: from dario-ThinkPad-T14s-Gen-2i.homenet.telecomitalia.it (host-82-56-38-125.retail.telecomitalia.it. [82.56.38.125])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b1fd272026csm212430766b.102.2025.09.18.08.36.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 18 Sep 2025 08:36:36 -0700 (PDT)
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
Subject: [PATCH v4 3/5] dt-bindings: touchscreen: convert raspberrypi,firmware-ts bindings to json schema
Date: Thu, 18 Sep 2025 17:36:08 +0200
Message-ID: <20250918153630.2535208-3-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250918153630.2535208-1-dario.binacchi@amarulasolutions.com>
References: <20250918153630.2535208-1-dario.binacchi@amarulasolutions.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250918_083639_461782_A007904E 
X-CRM114-Status: GOOD (  15.64  )
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

(no changes since v3)

Changes in v3:
- Drop firmware-rpi node and use only touchscreen node to fix warnings
  you can see in
  https://patchwork.ozlabs.org/project/devicetree-bindings/patch/20250913092707.1005616-3-dario.binacchi@amarulasolutions.com/

Changes in v2:
- Added in v2

 .../touchscreen/raspberrypi,firmware-ts.txt   | 26 ------------
 .../touchscreen/raspberrypi,firmware-ts.yaml  | 40 +++++++++++++++++++
 2 files changed, 40 insertions(+), 26 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/input/touchscreen/raspberrypi,firmware-ts.txt
 create mode 100644 Documentation/devicetree/bindings/input/touchscreen/raspberrypi,firmware-ts.yaml

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
diff --git a/Documentation/devicetree/bindings/input/touchscreen/raspberrypi,firmware-ts.yaml b/Documentation/devicetree/bindings/input/touchscreen/raspberrypi,firmware-ts.yaml
new file mode 100644
index 000000000000..697c508326b3
--- /dev/null
+++ b/Documentation/devicetree/bindings/input/touchscreen/raspberrypi,firmware-ts.yaml
@@ -0,0 +1,40 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/input/touchscreen/raspberrypi,firmware-ts.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Raspberry Pi firmware based 7" touchscreen
+
+maintainers:
+  - Dario Binacchi <dario.binacchi@amarulasolutions.com>
+
+allOf:
+  - $ref: touchscreen.yaml#
+
+properties:
+  compatible:
+    enum:
+      - raspberrypi,firmware-ts
+
+  firmware:
+    description: Phandle to RPi's firmware device node.
+
+  touchscreen-size-x: true
+  touchscreen-size-y: true
+  touchscreen-inverted-x: true
+  touchscreen-inverted-y: true
+  touchscreen-swapped-x-y: true
+
+additionalProperties: false
+
+required:
+  - compatible
+
+examples:
+  - |
+    touchscreen {
+        compatible = "raspberrypi,firmware-ts";
+        touchscreen-size-x = <800>;
+        touchscreen-size-y = <480>;
+    };
-- 
2.43.0

base-commit: 8b789f2b7602a818e7c7488c74414fae21392b63
branch: drop-touchscreen.txt

