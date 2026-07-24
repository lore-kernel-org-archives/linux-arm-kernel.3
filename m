Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4D345C531FA
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 24 Jul 2026 08:45:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=HbHZBlGJIBZH9w4CnNEDqTFXqQ2V4R1HGaboHmDjj7s=; b=Uq1de9M8zoeINixEJoRV2Gob9Z
	6XZoJyTSMUd2pnAIpbWAzhDfDiyq2F2x5bnPYsGEHOgsd/U9M74K6mhOO9oHJxH2AfGk/L88ViV/Q
	v789jSRweKTu1793S0s8zRDiddVnIWfXS7VxGKrqbSPAs+5YEeiQ0c1pURarqc5p6w0PPtdiUE1YG
	9JA0oKxJNJFCNmD3r76bNMhsjxMjDUWwzYlsOBE/C+TZs73TFjiEwUigGwHedI9FQJm2t5LTPf4Ph
	S+ElL5KaDaDJBg+dCII297CS4F/4E2Mwuql95qFxHp7rAGVfAisJ1HHdQMw6FawZLAAg3gbh8Ie7q
	46pKESNQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wnBX6-0000000FrTc-0mcB;
	Fri, 24 Jul 2026 08:45:28 +0000
Received: from mail-pj1-x102e.google.com ([2607:f8b0:4864:20::102e])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wnBWf-0000000Fr5s-3dpU
	for linux-arm-kernel@lists.infradead.org;
	Fri, 24 Jul 2026 08:45:04 +0000
Received: by mail-pj1-x102e.google.com with SMTP id 98e67ed59e1d1-38e3efab7e0so137568a91.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 24 Jul 2026 01:45:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1784882701; x=1785487501; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=HbHZBlGJIBZH9w4CnNEDqTFXqQ2V4R1HGaboHmDjj7s=;
        b=KMlqViA7x/zTfYdguPGZ58D1pk65nvrTCfvutBRfst/AjEN4c8c6L6bC6aGIhJWZ53
         hzFzS1M1w/yOyjP0dGMnM1oQy6prJ3YbC0VYVCls/yPrcL86+dDIcx7tAYllMpWMvk+W
         3KVEyi/5TL3cDhFwniu1YBtTZmkfKHjSj1vM0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784882701; x=1785487501;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=HbHZBlGJIBZH9w4CnNEDqTFXqQ2V4R1HGaboHmDjj7s=;
        b=sQq3Q1HaUihA0ULo6qj0Mim3pQGu90qdF64zxR8cVLOEK2KDQQFhAkZmy4BttDSM0w
         K9pe+9+KV+SjKHIiA2bWYEFnsQZCvlaimj7t/7ldQbCDVOFho/Zr8VU0FQxQAxNkJU3J
         i1dZ1cV2xPHaAvQpTL05kgyvTtfFp2o76ItN8h+n7msD/9EgFLjqKm1Nu3dBJGmyXrBa
         z588Z/78MjILFoSEIL7NF6rt2rpSAYrdewSS/hLEMW9FjMgW4ewqHxs9/ea4nzK5Kd/i
         MZEH8BCzaj2fpyEMwzwxsi7rNVc41G3NAvu7LUo2TGvDHtoL3hMGJlPWB2A+76BkjpHK
         NoxQ==
X-Forwarded-Encrypted: i=1; AHgh+RqVaNrLxopP6X28h0GwHRAAt53CmhACS4Q2H/M1+T9NxCTmVjH6Y75a/WzFUXLVpa8EqF0th6UWKhR7noRMO8zD@lists.infradead.org
X-Gm-Message-State: AOJu0YzxqDDFuHpIcAeHV3cNmdbgzr499/hFAz0j8KUdRuUka4vbLWgA
	blWgd47nGyoM0xW/9h0tVAP+VDTwq/BWfSOWa1FEEn1e5eGx2eah0c3ClJcxRzqM0g==
X-Gm-Gg: AR+sD13Z+rm0jdLwgKlFq8PNszXqf2MFzDEbkCJtg9zBYmIZryvVR2IS5eTD0Ntlq0q
	dXUj66fFiFzp1k88hd9FakgkpWbRBXmaEci6S+fflzxOzft7gLQ8s4ex6KERH/W9dU79ny1TSzJ
	z9jTBsAecyJfi7E28Dy9erO7IwyjaV1kdwyfWOyYX4XjZXb4ckR8y7knTaLdPtp3Jlq/CF+aaq+
	UfU1bx3Cs+rbi6LUpcNCouNnWbOu6B80r268GhdOcCl9Q3F/tGuNAsBgRRp7dhl0BciO+yqIppL
	5fR2OwufU8L24ookRajwm0+iuZ4df5FJafdVvTXm65NsKlzzk1M5MdGgVvq/EFYYjun23Ahx5BI
	1vkTHH16uJwMGVEV3+wrEaz/Aqf59y1gypFJ39uA62Y3SGBPMxMTua5N5WAXm1FBDYixVZsgn6e
	xj0BgnluGkliV3Is8GgPlsTazzaBpgT7NHzlNQ8QPtBV8Bhk5+mQaoi+IPeKI=
X-Received: by 2002:a17:90b:4d08:b0:38d:eaed:4adb with SMTP id 98e67ed59e1d1-38ec85cb1b9mr5733586a91.20.1784882700981;
        Fri, 24 Jul 2026 01:45:00 -0700 (PDT)
Received: from wenstp920.tpe.corp.google.com ([2a00:79e0:201d:8:f131:86cc:5858:7325])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-38f089ac6d8sm434546a91.2.2026.07.24.01.44.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 24 Jul 2026 01:45:00 -0700 (PDT)
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
Cc: Wei Deng <wei.deng@oss.qualcomm.com>,
	Chen-Yu Tsai <wenst@chromium.org>,
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
Subject: [PATCH v7 11/16] dt-bindings: usb: mediatek,mtk-xhci: Switch to ports for USB connections
Date: Fri, 24 Jul 2026 16:43:20 +0800
Message-ID: <20260724084328.3943997-12-wenst@chromium.org>
X-Mailer: git-send-email 2.55.0.229.g6434b31f56-goog
In-Reply-To: <20260724084328.3943997-1-wenst@chromium.org>
References: <20260724084328.3943997-1-wenst@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260724_014501_960541_F0E12762 
X-CRM114-Status: GOOD (  12.83  )
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


