Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E24C4C4451C
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 21 Jul 2026 06:55:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=HbHZBlGJIBZH9w4CnNEDqTFXqQ2V4R1HGaboHmDjj7s=; b=YufVxOAGvPzQd/aQOxfXYwpu9K
	SI3/VYE2twSPhhFn3k5cu3KBlX7mu6q3MAEWSmOpLSeEI7nvOMKV7hgifHX8B8Lq/fgbMpwSn6X6Z
	OtDnE6dXD1Gp9jQ8LBHwZ9gLA4wlET5N6370+V4hEjEXLqBq7fNyVqN84K4LzSZlAA8CceCS59P1W
	BlyDPOC0W0W/1y40RHE16+ROYigzhYgPha85BVwFdyqkQFpayr9nmTTXZ2p4UlGjAFb+BYMBEEcoe
	/kCPQkGv0sKi/ph4O4Q2Zwoc0slzX/F5G2ma4qoFZ7RCnPVSJXy7BJ2GD+HAmjtLhVUFg3jxIJG3d
	2PzERLwg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wm4OJ-00000008b4S-36aG;
	Tue, 21 Jul 2026 06:55:47 +0000
Received: from mail-pl1-x633.google.com ([2607:f8b0:4864:20::633])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wm4O0-00000008ah7-2S7s
	for linux-arm-kernel@lists.infradead.org;
	Tue, 21 Jul 2026 06:55:35 +0000
Received: by mail-pl1-x633.google.com with SMTP id d9443c01a7336-2cf6d65d8a7so22152795ad.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 20 Jul 2026 23:55:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1784616928; x=1785221728; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=HbHZBlGJIBZH9w4CnNEDqTFXqQ2V4R1HGaboHmDjj7s=;
        b=ALGUKbOHpcqQmpb5jy3Uvp+O+G3i4kzMeB95IJDLFwKyqOg1sLhQ+AH4rPzDXnIFpQ
         SF/lQ0PAc22N6lUOyfmUR1pHDscQKocuxBO/YNxfc/06S2hFUcHyXHI0GyDMmlBij7B7
         cBlXmcffBhtlCF88UOKT0nR4PeQZruuX/0eiQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784616928; x=1785221728;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=HbHZBlGJIBZH9w4CnNEDqTFXqQ2V4R1HGaboHmDjj7s=;
        b=QP8nMPLO3ukrGew7FTVhLPkoVOagC6BGgg1F2LFibNLJN4UtF4lyJE5Qrb8W1as+9v
         HpANilWi4Z/WKRpmq9YwgGup3L8qNDSReihPE7pAa/3dI8p4qRAB638vis31vhdtr/E8
         fil00AIQ+Z+MI8A4Q1P6hVAaNAo/QbsHUB01P9UWaiP1XFsW1ehCoB4C03iBTlBbF3tb
         89Izi2MgMZHahdoSxmaOlEqg36XO086ZenNArGIESywTB++crz7yYuKeMWQe7XI9K1WJ
         GSTfa25o7Ru2m1njCasDefqNIV201P2okf5uBLxYAis/mqEwzMD3G6wa3Qq529tk9oTh
         FXSA==
X-Forwarded-Encrypted: i=1; AHgh+Rqizw2BkpzxY+0bT9+vY+otvFRpC+Pvn4IQASJYxBxoBqnUmRwglian+ibBUIZPMQVWw6hjxQETc9eRvjStUTBI@lists.infradead.org
X-Gm-Message-State: AOJu0YwzSCPgzCmmzSntDjG8n/rmQIWcieCcry+lQ7mwV+3hA9n/30Pd
	+jIZ7gSzjEyAuViCVV6JxUdI2SuOfJAcuuVHRKwL7OQCd9LkE35djkRSNuaUY7NeDA==
X-Gm-Gg: AR+sD10kvA4RLN9WjEGTLbbD9jA74hM3YvOYXiN4F5ps5dh6IyMN7uvlkRUsLsbnRAK
	E5zRnsI/Jt6cjVvkEG0Mcy9KaQDWxodkw5QnPpkJv17ag2/1yn6F33pJbEER9Tx3+qijfceRDgR
	XsObHO0fSYPHRx/YKmpvGi3+/Py9rktj2u0/sbaSR/u8q7g5euyGJFmAk2KnsVosLS/vJcjqAAL
	FCqriwzuk5eBhUcrNAtgecXVa6wRAXkHK9styonHrZvfZ+v8RJI7WMoouQPtZUE8SaCanKVr8th
	jw0x9d2JEBoId3N8J6E4Z4ZWM+qQMn63U9ng+8nFOV14tjlKshCJQ93tTkcFFhXwWI/YES8l/O6
	PXIUe+/a04kKuYv5OJBB0F91/WYdog7UdSDezInlGf4ipTNJ6RPcQNXFMCHZLXm0nOuAAlP4NRU
	/ojMAhmUBOLAx9rRQkYWAYROP2+q8Bijgi8jzC39PjSqWYQ6cVoswtRAdFkvE=
X-Received: by 2002:a17:902:ef49:b0:2cc:ee78:3236 with SMTP id d9443c01a7336-2cf34997125mr195766485ad.33.1784616927898;
        Mon, 20 Jul 2026 23:55:27 -0700 (PDT)
Received: from wenstp920.tpe.corp.google.com ([2a00:79e0:201d:8:3916:f048:32c3:931f])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2cf3448ee77sm69716005ad.4.2026.07.20.23.55.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Jul 2026 23:55:27 -0700 (PDT)
From: Chen-Yu Tsai <wenst@chromium.org>
To: Bartosz Golaszewski <brgl@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	Daniel Scally <djrscally@gmail.com>,
	Heikki Krogerus <heikki.krogerus@linux.intel.com>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Danilo Krummrich <dakr@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: Chen-Yu Tsai <wenst@chromium.org>,
	linux-acpi@vger.kernel.org,
	driver-core@lists.linux.dev,
	linux-pm@vger.kernel.org,
	linux-usb@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-mediatek@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Manivannan Sadhasivam <mani@kernel.org>,
	Alan Stern <stern@rowland.harvard.edu>,
	Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
	Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Subject: [PATCH v6 11/16] dt-bindings: usb: mediatek,mtk-xhci: Switch to ports for USB connections
Date: Tue, 21 Jul 2026 14:54:06 +0800
Message-ID: <20260721065413.2306137-12-wenst@chromium.org>
X-Mailer: git-send-email 2.55.0.229.g6434b31f56-goog
In-Reply-To: <20260721065413.2306137-1-wenst@chromium.org>
References: <20260721065413.2306137-1-wenst@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260720_235528_664869_7D650437 
X-CRM114-Status: GOOD (  13.73  )
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

This reverts commit 454a1e3cd36c113341d7b71e8e691c6e47ab4a8a.

MediaTek's XHCI implementation supports both USB 2.0 High Speed (HS)
and USB 3.x Super Speed (SS). The block can also be synthesized with
either HS-only capability or HS+SS capability. The SSUSB controller
handles the device or gadget mode. Saying that SSUSB handles the HS
portion is wrong.

For example, on the MT8195, the first two instances support both HS and
SS, while the latter two instances support only HS.

Switch to a "ports" sub-node for describing USB connections. Port 1 is
Super Speed if the controller is SS-capable, otherwise it is High Speed.
Port 2 is High Speed if SS-capable. This port mapping scheme directly
matches what the hardware returns in its capability registers.

Fixes: 454a1e3cd36c ("dt-bindings: usb: mediatek,mtk-xhci: Add port for SuperSpeed EP")
Cc: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Reviewed-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>
---
Changes since v1:
- Squashed DT binding revert and addition together
- Dropped reviewed-by from Bartosz
---
 .../bindings/usb/mediatek,mtk-xhci.yaml         | 17 +++++++++++++----
 1 file changed, 13 insertions(+), 4 deletions(-)

diff --git a/Documentation/devicetree/bindings/usb/mediatek,mtk-xhci.yaml b/Documentation/devicetree/bindings/usb/mediatek,mtk-xhci.yaml
index 231e6f35a986..d6c75bd20b78 100644
--- a/Documentation/devicetree/bindings/usb/mediatek,mtk-xhci.yaml
+++ b/Documentation/devicetree/bindings/usb/mediatek,mtk-xhci.yaml
@@ -107,10 +107,6 @@ properties:
       - description: USB3/SS(P) PHY
       - description: USB2/HS PHY
 
-  port:
-    $ref: /schemas/graph.yaml#/properties/port
-    description: Super Speed (SS) Output endpoint to a Type-C connector
-
   vusb33-supply:
     description: Regulator of USB AVDD3.3v
 
@@ -188,6 +184,19 @@ properties:
   "#size-cells":
     const: 0
 
+  ports:
+    $ref: /schemas/graph.yaml#/properties/ports
+
+    properties:
+      port@1:
+        $ref: /schemas/graph.yaml#/properties/port
+        description: Super Speed (SS) data bus if SS-capable;
+          otherwise High Speed (HS) data bus.
+
+      port@2:
+        $ref: /schemas/graph.yaml#/properties/port
+        description: High Speed (HS) data bus if controller is SS-capable.
+
 patternProperties:
   "@[0-9a-f]{1}$":
     type: object
-- 
2.55.0.229.g6434b31f56-goog


