Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4110CC43602
	for <linux-arm-kernel@archiver.kernel.org>; Sat,  4 Jul 2026 17:15:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=k6kKI5J8Ttv5I5yUn+NLV5sWRapXSwcPAxycZh/dkxc=; b=DnoL7vntDuNsciO/YUvqv1UfZp
	kgun+zHyFpEDmIAgIw7p8R5vl4KlfH+NPBr3Jx81pq5pmus6yiQFy0X+6wA/gxNCcc3vwrENomlSm
	Sa/n63pq1OogvWQkJbsWJj9HDb5BP5O1rKmm/nHqRAkiMfDAYQCi1sYaCve6oQaerO9o3vRDSy80F
	O9e85DLlKlERmgUOq7uLo75g3PdnEbyoGjRIoNF3NhIDao6oQwdqIadRvxbwwlh7o1PxnyGr7vGHL
	xZZf3mjL9A2pczff9sYLaHj5IGQF2V92869yFHjOoy0bE/W3LostgYDgBsfdJ07GFtLlEOSg0Ivtt
	WzK+W2jQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wg3xF-00000008bGk-16YE;
	Sat, 04 Jul 2026 17:15:01 +0000
Received: from mail-pf1-x42c.google.com ([2607:f8b0:4864:20::42c])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wg3xC-00000008bFn-2lvM
	for linux-arm-kernel@lists.infradead.org;
	Sat, 04 Jul 2026 17:14:59 +0000
Received: by mail-pf1-x42c.google.com with SMTP id d2e1a72fcca58-845f2909cd4so1070906b3a.1
        for <linux-arm-kernel@lists.infradead.org>; Sat, 04 Jul 2026 10:14:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783185298; x=1783790098; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=k6kKI5J8Ttv5I5yUn+NLV5sWRapXSwcPAxycZh/dkxc=;
        b=skyZkZ2wlAbIow+bTJC+K5xlZQ7U5JvzOtrHjzxs4pc666nEw9PNfld61+HAhXWkIc
         gJjle/cwnKGcMcopawYUYfaE7qOFN6aZXpgS0JJeI2RVRPzofq9EtjcxoR7WYLVgtPQg
         uQJplNcHimO2XNQvItXMbCyHK7HyKAMpKM376pmes0nB27d+GKLIrjWFsm0aQIMVNJ1q
         TLX0Kde2l9qy7YFg3RSyBwD8VNKPS/QAndkdfbmC7cDS2deHDN47m2oLpKvFJFbvtMsn
         7+KS0f6hd4csP3gtnyZEGiRz8GdWqaNIOcM3Nnj4Fw3WzxxuK/VW3fdDRKTnaT+Ryx2F
         1Bag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783185298; x=1783790098;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=k6kKI5J8Ttv5I5yUn+NLV5sWRapXSwcPAxycZh/dkxc=;
        b=IsHlB1cmBn4CcBR8rr/XZdRU7hCuvbCHGEj/zV3DroSzrv4a7PzBZNwvszI+9DRlQd
         60pD6KYBqP+6uyCu41uJsd4SflCGcUbE/N8wxn8+7+jlFBj1dnr/Ap1c6igBU2qyCl4N
         VkWhMeji4Xf94ygpwkIRJl7xUMZBDl7wfjdI+iNIeaeVK8S75dQoXAc8alpJOkyQ5eza
         7sfb5qJZTBws2jYn1XeZmgGVy7Gb0nJ/Jq8npe7brgA1CsuF+azlAp4si/MeIZW0c35H
         zBcGvz2LfOkHmu0rahBY1f+FujJyK60vBgoAdjOS+YWV44sO/HgW1fOU6BIHsOhLIaj5
         gVGw==
X-Forwarded-Encrypted: i=1; AFNElJ/28Nx24L77fLjIad0xL5j/rmP2pidYNS1vORgCRxh97B2Q7LPrGs341qJfpsRCLX8ZNszUhK6ji/qERygF2j3T@lists.infradead.org
X-Gm-Message-State: AOJu0Yyl50DY/i8o/XSU1UZpM/2k+CwJrHhwFcgO5eDoMtJSjjEgbRey
	8bY+jPVZPpYCpkG2zJVh/4Okt5hcBkfY4rnqM4Fk8ND3s0grrmA6Whmh
X-Gm-Gg: AfdE7clqBy/TaaWkMiv7eQYVHJM7TRywfQXS/lQmKE4Twi501r2aiudDeg9w497/6KO
	wojq+fyEFcNPBLGrqpUuSkA1y7WWNsVXEnlo58lNwbIVEHdwRvhxQ9Th7sUWylxfFwAcYtfUOgq
	XoPtHKv5dIt1ewFRQAAZjuuFzv7ohi2Ou0z5ICweQ3qLYd8DFiz8kb52YeH7V+cW+1DNEwhRHRu
	FvRl8rrKI+tNDCMvE6lNRdld+csL3OEhFoO+Q8MFgX5yc7udpIhY5Xr7k1TszVC7q+YWOog5rft
	vxT/ZbLsHD/r3is+UYq6Z2hQtQZNIQWeRyojIIbBJY2zkvpIYi0ILNvPQzkpg4RTQusEfC+hopo
	Y7fnKLj9o3iTwilaxS9zqh8vDNYM24CMT+gvBPcP6BnleRf1hiBRIqVujIUMgadetZNy7b/+STS
	kjHncW
X-Received: by 2002:a05:6a00:4f92:b0:842:2ddb:e305 with SMTP id d2e1a72fcca58-847f6f69949mr3837076b3a.43.1783185297621;
        Sat, 04 Jul 2026 10:14:57 -0700 (PDT)
Received: from archlinux ([212.192.12.80])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-847f6d498adsm1379101b3a.32.2026.07.04.10.14.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 04 Jul 2026 10:14:56 -0700 (PDT)
From: Mikhail Kalashnikov <iuncuim@gmail.com>
To: Vasily Khoruzhick <anarsoul@gmail.com>,
	Yangtao Li <tiny.windzz@gmail.com>,
	"Rafael J . Wysocki" <rafael@kernel.org>,
	Daniel Lezcano <daniel.lezcano@kernel.org>,
	Zhang Rui <rui.zhang@intel.com>,
	Lukasz Luba <lukasz.luba@arm.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Chen-Yu Tsai <wens@kernel.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	Philipp Zabel <p.zabel@pengutronix.de>
Cc: linux-pm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH v5 1/5] dt-bindings: thermal: sun8i: Add A523 THS0/1 controllers
Date: Sun,  5 Jul 2026 01:14:07 +0800
Message-ID: <20260704171411.1413349-2-iuncuim@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260704171411.1413349-1-iuncuim@gmail.com>
References: <20260704171411.1413349-1-iuncuim@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260704_101458_705981_C4E28EC9 
X-CRM114-Status: GOOD (  11.40  )
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

Add dt-bindings description of the thermal sensors in the A523 processor.

The controllers require activation of the additional frequency of the
associated gpadc controller, so a mod clock property required.

The calibration data for both thermal controllers (THS0, THS1) is split
across two nvmem cells at different offsets, requiring the two cells
to be read and merged. To maintain backward compatibility, the name of
the old cell remains "calibration" and the new cell is named
"calibration-second-part".

Signed-off-by: Mikhail Kalashnikov <iuncuim@gmail.com>
Reviewed-by: Chen-Yu Tsai <wens@kernel.org>
---
 .../thermal/allwinner,sun8i-a83t-ths.yaml     | 54 +++++++++++++++++--
 1 file changed, 51 insertions(+), 3 deletions(-)

diff --git a/Documentation/devicetree/bindings/thermal/allwinner,sun8i-a83t-ths.yaml b/Documentation/devicetree/bindings/thermal/allwinner,sun8i-a83t-ths.yaml
index 3e61689f6..6f5b2f3b9 100644
--- a/Documentation/devicetree/bindings/thermal/allwinner,sun8i-a83t-ths.yaml
+++ b/Documentation/devicetree/bindings/thermal/allwinner,sun8i-a83t-ths.yaml
@@ -24,6 +24,8 @@ properties:
       - allwinner,sun50i-h5-ths
       - allwinner,sun50i-h6-ths
       - allwinner,sun50i-h616-ths
+      - allwinner,sun55i-a523-ths0
+      - allwinner,sun55i-a523-ths1
 
   clocks:
     minItems: 1
@@ -47,11 +49,16 @@ properties:
     maxItems: 1
 
   nvmem-cells:
-    maxItems: 1
-    description: Calibration data for thermal sensors
+    minItems: 1
+    items:
+      - description: Calibration data for thermal sensors
+      - description: Additional cell in case of separate calibration data
 
   nvmem-cell-names:
-    const: calibration
+    minItems: 1
+    items:
+      - const: calibration
+      - const: calibration-second-part
 
   allwinner,sram:
     maxItems: 1
@@ -107,6 +114,7 @@ allOf:
             enum:
               - allwinner,sun8i-h3-ths
               - allwinner,sun20i-d1-ths
+              - allwinner,sun55i-a523-ths0
 
     then:
       properties:
@@ -132,6 +140,29 @@ allOf:
         - clock-names
         - resets
 
+  - if:
+      properties:
+        compatible:
+          contains:
+            enum:
+              - allwinner,sun55i-a523-ths0
+              - allwinner,sun55i-a523-ths1
+    then:
+      properties:
+        clocks:
+          minItems: 2
+        nvmem-cells:
+          minItems: 2
+        nvmem-cell-names:
+          minItems: 2
+    else:
+      properties:
+        nvmem-cells:
+          maxItems: 1
+        nvmem-cell-names:
+          items:
+            - const: calibration
+
 required:
   - compatible
   - reg
@@ -176,4 +207,21 @@ examples:
         #thermal-sensor-cells = <1>;
     };
 
+  - |
+    #include <dt-bindings/interrupt-controller/arm-gic.h>
+    #include <dt-bindings/clock/sun55i-a523-ccu.h>
+    #include <dt-bindings/reset/sun55i-a523-ccu.h>
+
+    thermal-sensor@2009400 {
+      compatible = "allwinner,sun55i-a523-ths1";
+      reg = <0x02009400 0x400>;
+      interrupts = <GIC_SPI 62 IRQ_TYPE_LEVEL_HIGH>;
+      clocks = <&ccu CLK_BUS_THS>, <&ccu CLK_GPADC1>;
+      clock-names = "bus", "mod";
+      resets = <&ccu RST_BUS_THS>;
+      nvmem-cells = <&ths_calibration0>, <&ths_calibration1>;
+      nvmem-cell-names = "calibration",
+             "calibration-second-part";
+      #thermal-sensor-cells = <1>;
+    };
 ...
-- 
2.55.0


