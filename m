Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F0695FF885A
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  4 May 2026 05:03:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=U+hY6I1QbsBJjzyv0BxYALLJHQ4yccrLD8dnNfVypx8=; b=dHv6h4+hSs7mFOv49N+x2sANf5
	Qhr7uoSD0y5E2+OQSHT8DNVbEtSh/QkS/FXT9UG44GhaIGgT5yajAYf4KS6ac1Q4fcELglekaNFzi
	rzpldMo2HqsUerOURfM3uPp+QC5IRVrIkTo8XdhF8gsY4og2bB8mNT0YVCb/5pTwZez36v+T14GW9
	L5heMAktTo34K0XIvK8XCFJZr/LdSrrupL4zM5lqyf0VXabmhO09Nqd5AtaHNVggsQrUJoikYqdsu
	UjXhMOlzTNuuQZQgyLXaTEZRW7ci/H/wk+g8tvhbYptZSIkIFLprQqP6YPzwZX2I5TF20XBdfq3VQ
	vMxSgD1A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wJlSr-0000000CNJN-04ik;
	Mon, 04 May 2026 05:03:29 +0000
Received: from mail-pj1-x1032.google.com ([2607:f8b0:4864:20::1032])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wJlSo-0000000CNIl-3hNr
	for linux-arm-kernel@lists.infradead.org;
	Mon, 04 May 2026 05:03:28 +0000
Received: by mail-pj1-x1032.google.com with SMTP id 98e67ed59e1d1-36536771300so383430a91.1
        for <linux-arm-kernel@lists.infradead.org>; Sun, 03 May 2026 22:03:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777871006; x=1778475806; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=U+hY6I1QbsBJjzyv0BxYALLJHQ4yccrLD8dnNfVypx8=;
        b=ZlLybI8dKtRjMO8ZKDPvBo/vc+ZTfx+iFN16JHLCbT0LY0HgfR/xq987Qaan2Jz5ab
         zl/h6z4GLGRNDal3Xyi1BhD2x76t7AbQC+TMxY9k2OaBUVtbAKGlw7hS1DprgnrnyF3e
         CH77sEQTRFTqk6EJ/mp93iwEEtiB/gt5M89QNCj60KhE8oaFpO6rpJK5XGxQJtU0DjJc
         IqivJ1jGAfnuG7Vy1/cNbvw4Mmw3Taumqni+Keh/osYH/687qhn8/rN/0PF4lZ+pctSF
         SDNdnMLh3v3De3iNHT02Ut6i0fYzmpsEvY77EsGVFGQkSMsQh4pR9njRy1SIMuNyiF4U
         lw4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777871006; x=1778475806;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=U+hY6I1QbsBJjzyv0BxYALLJHQ4yccrLD8dnNfVypx8=;
        b=avlqVlFd1v156nRSQsd5q/FDnm2CZ9JWK9FSVlhaBcatbeJCoDN6MfuVuN7xQCwzyb
         N9unDvZmZb99NN4pdVeffzbtixb+nV0+5byRgaxzhHEth1JhUh+M8C7ihWBVX1F44Dwz
         dx22MEFzkoiCJbuv5NvbYf9jAf3EpnkB1jB+uT50SXYqdUWk2Nix7Rys9aVTJ5NWZUh6
         YTETDiSqHNnAKvBu+Pvm0KdzBaOkNoZNJvQx8Ha+NvVKjoQ30N1UHUq8Ap44NtJaJ7dE
         Hk5yXLu82Z5NTm8lcujvczvLMLFmux3Bs45Q3oZ+5NR7O0g/m4dtuIJ4EoVqs2SSqONC
         ByAg==
X-Forwarded-Encrypted: i=1; AFNElJ8i1Q6TJSm2Bd7NtZZi1HtI4H2kTgR2pQQeWDizrqs1XUZbJqjZzR2GjklcYd8cV4t++WFSWK9Alh/jd4imAQnP@lists.infradead.org
X-Gm-Message-State: AOJu0YyQRt0+5VR3sHhRcCBaBcBXip9Vpc270tZBhUbLOmZzaIbabmXT
	6n3v+JsNGCctAi2VtENq8zspLr7OYmwd6AyYkXu0N+kSqrn4CMOmboqm
X-Gm-Gg: AeBDieu1DgoBQUJambhrkj8vSCWXhl6aOG2aJxTMqRNcH+Ox/wM/a1jGx32qbkpWiOT
	4d5u4fbyj0KRv1wZt49Q3gSpADFGuctFk82K/bwxLb5gIQ+seUo31EQi4a/lM6Q/c5ObyyCH77x
	QuEjT9hpqAehWxOuDcroaxhZU3cbIG1IDSGKVfZ6Xk7wRx8zyxx3KCC3zk8knCDb219ki1JeQr8
	QKVa0AOFMKvTKXSpZhCmX4IuPNI1FIbq0NQFrxAob2my9FZ7UQkO5CFSis56j57WtoiP3KbKmuL
	4nphLLU6Uj0lQY9M+kxZnkC1Q3pcRdFH4lSXyM+q7jGuDbNOt2gY4PCeRY/Da/N8GEzEcdsVoKi
	xb5GQ5dqNd8GeSCD7Wr9dcxW66vkQZsOEum2bw+V554wReZ5cwCUjcBfTGYqadAzV50gUSBL+yn
	mNTA==
X-Received: by 2002:a17:90b:4f82:b0:35d:93c7:e386 with SMTP id 98e67ed59e1d1-364c44b65e7mr14781931a91.4.1777871005911;
        Sun, 03 May 2026 22:03:25 -0700 (PDT)
Received: from archlinux ([2605:e440:15::152])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-365437b50b0sm2662908a91.0.2026.05.03.22.03.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 03 May 2026 22:03:25 -0700 (PDT)
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
Subject: [PATCH v4 1/5] dt-bindings: thermal: sun8i: Add A523 THS0/1 controllers
Date: Mon,  4 May 2026 13:02:41 +0800
Message-ID: <20260504050245.646078-2-iuncuim@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260504050245.646078-1-iuncuim@gmail.com>
References: <20260504050245.646078-1-iuncuim@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260503_220326_958661_49DF25EB 
X-CRM114-Status: GOOD (  12.58  )
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

The calibration data is split into two cells that are in different areas
of nvmem. Both controllers require access to both memory cell, so a new
property nvmem-cells has been added. To maintain backward compatibility,
the name of the old cell remains the same and the new nvmem-cell-names is
called calibration-second-part

Signed-off-by: Mikhail Kalashnikov <iuncuim@gmail.com>
---
 .../thermal/allwinner,sun8i-a83t-ths.yaml     | 54 +++++++++++++++++--
 1 file changed, 51 insertions(+), 3 deletions(-)

diff --git a/Documentation/devicetree/bindings/thermal/allwinner,sun8i-a83t-ths.yaml b/Documentation/devicetree/bindings/thermal/allwinner,sun8i-a83t-ths.yaml
index 3e61689f6..6020413c3 100644
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
2.54.0


