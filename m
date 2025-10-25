Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 97AB4CCF9E3
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 25 Oct 2025 04:32:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=CuZHP6YFsCwwA4TkyjhYi+XmEZKmSYURob9jZc/v+s0=; b=G+z2E55BMkzV/nqbG/ww9kWR3E
	1ApeUShBQkBEtdk3CMeeytr1YwN4Bd5pGhotpMqx3lTrqhx1Ni6UbakEIcRtsxNfbB+J1IqnAW1rM
	rhOIuzWDQeZSnUy4I/rQVg+WTqDm76dpmTR6bZoSVBN3Fe79YlideOIsxZkEuK4+jslTsh20dzVkw
	0CUVxLoUWaIIcMfLXde0ZsUyyDL7K8OQhRS0daSArRtcwIlDTeWb06Kifkp6KQ2EpBmLJxpXFq76c
	j1fkUS7k4AwLZe2vFOuZ58dqxiYsr0RBVI4ZcmXAE0On/un+yA0niDUzyYsQdcH7nWPDF0mQeGMLm
	T/gnkqjA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vCVwt-0000000AwSQ-1zqb;
	Sat, 25 Oct 2025 04:32:15 +0000
Received: from mail-lj1-x22c.google.com ([2a00:1450:4864:20::22c])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vCVwr-0000000AwQz-0ZUB
	for linux-arm-kernel@lists.infradead.org;
	Sat, 25 Oct 2025 04:32:14 +0000
Received: by mail-lj1-x22c.google.com with SMTP id 38308e7fff4ca-3737d0920e6so44916821fa.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 24 Oct 2025 21:32:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1761366731; x=1761971531; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=CuZHP6YFsCwwA4TkyjhYi+XmEZKmSYURob9jZc/v+s0=;
        b=gJBdJLAiTPWeG/1DD7EuhlYSnw3qMuGzWNkEuiZThNagiVpgqzKsacMa9ebr0hAI43
         G/ngshtUT9OcGkmC0qt/tdWDq8XidWx8zb8sBxYxrNzyMT/4NYU6kWeBFLoh60aiKrwK
         EqfldXb6crbnhNHBxUBIkKMEB8ANtt7hUkuGrs1tsEektX7zCErW4m7ko5cBCLQe4KkQ
         NbcNkTQXwKLLxaE6k2SmZxnFg9RvmN2VN2s3sHplK/G+iZXX2il1c6RH453Fb13xXVbS
         /T59Yp443oktjIEcoyHB6hYPNY0vN2A3Hmhp0MVLccT2FoMMz0k2l6PnLTe+Eivid5Lo
         LXNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761366731; x=1761971531;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=CuZHP6YFsCwwA4TkyjhYi+XmEZKmSYURob9jZc/v+s0=;
        b=OzaLGwTTZaRrqVtEIZlLn4ZGl5hY/YJJgqE/cvIb/7AOwpTnWaRXzBZ6dEnpRpkTCg
         1OgAqquq/zyd3f958VsMyQCf/VzYQgdJAQTIKFCONrrYa7DwFOr2oDRh/WiN3M521aLR
         XymemCKOhgbhyIT3bgBjuc9OUYmArJlEVzFp3A7MTPfaRyadgreIcQTQpLeX27DB/FNM
         LAcT4vYCgLvnc93LNvWMZYzsYZ2lmglUee0/chE98mYJHawlZbinwONNqxRqgf5bxAli
         cddJ0qzANWkk/HaewfH1Hn/nNfZctGFSEo7JmBiEq84a2FYbIr+QJvaHCboGYGV80cfc
         voog==
X-Forwarded-Encrypted: i=1; AJvYcCUHXUNshHc2RyYwpiXq8/gdhC891OUBVtL1M+IWV2he4p61ZBoPhPkc2eAJc+Y7J10Zh2yOGNogdK6pFb7RB2Xf@lists.infradead.org
X-Gm-Message-State: AOJu0Yz7KeQldJP4OSESsrnBWttvG8m516gvBZbAUBKbAjISIs1Ba67E
	UGjQ6CQItjUERLB2TBI8VIkyPPyYHk2EMhZZCVqTLdzS4raLsUsYQkXm
X-Gm-Gg: ASbGncuCilPo48EdP67TC7749/wcDqEWWBEvVzv1hhVJko9ZHYzKFMmfPDKVHb8QFra
	pVX0aTSFO5JhD3GO4SlB2qnorCV8TAOZX7vOy75VlJxIpSSPhbeCJSpLCoiNT1wHdcnlnzAxy21
	MUxXzHn8dIAWErIQ9Yj8TTxJl7eAQ0deL0pjXQVrn4HmytdZIxTZWruRvM664+vAM3C5UuaGfpC
	FiWr1lHaea36LVExSGrRgmUaDpqCSctgGMjkZ1wk+y5jqWFx9Y8Fn//QrJB3wxMendg5UChRLkL
	g4AFohRsW0AAi1xiGjyJiid87U8FXb92jhln1Uh+Mc/XKUQuUqr66kWVyJaZBU482Cb8xEIKVCw
	xlmfWXB+CRNz8K6O7teCs+Yl1sNJW6YYElWQFxOTygAbCQBp0r3Zr3KF9sVo/6dtEBlSOjImxJx
	C9
X-Google-Smtp-Source: AGHT+IHidqK20asSnkSoaYA0Ua+IEXaUMgtNo1d+OXf+4JbTCbl0aR8F8Cd5djjk9glXI6+3c84fFA==
X-Received: by 2002:a2e:a916:0:b0:376:4430:b545 with SMTP id 38308e7fff4ca-378e4648542mr13761041fa.49.1761366730866;
        Fri, 24 Oct 2025 21:32:10 -0700 (PDT)
Received: from junAIR ([176.106.241.81])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-378ee0ca7a0sm3409241fa.33.2025.10.24.21.31.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 24 Oct 2025 21:32:10 -0700 (PDT)
From: iuncuim <iuncuim@gmail.com>
To: Vasily Khoruzhick <anarsoul@gmail.com>,
	Yangtao Li <tiny.windzz@gmail.com>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Daniel Lezcano <daniel.lezcano@linaro.org>,
	Zhang Rui <rui.zhang@intel.com>,
	Lukasz Luba <lukasz.luba@arm.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Chen-Yu Tsai <wens@csie.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	Philipp Zabel <p.zabel@pengutronix.de>
Cc: Andre Przywara <andre.przywara@arm.com>,
	linux-pm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH v3 1/6] dt-bindings: thermal: sun8i: Add A523 THS0/1 controllers
Date: Sat, 25 Oct 2025 12:31:24 +0800
Message-ID: <20251025043129.160454-2-iuncuim@gmail.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251025043129.160454-1-iuncuim@gmail.com>
References: <20251025043129.160454-1-iuncuim@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251024_213213_205585_557D90E4 
X-CRM114-Status: GOOD (  13.15  )
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

From: Mikhail Kalashnikov <iuncuim@gmail.com>

Add a binding for D1/T113s thermal sensor controller. Add dt-bindings
description of the thermal sensors in the A523 processor.
The controllers require activation of the additional frequency of the
associated gpadc controller, so a new clock property has been added.

The calibration data is split into two cells that are in different areas
of nvmem. Both controllers require access to both memory cell, so a new
property nvmem-cells has been added. To maintain backward compatibility,
the name of the old cell remains the same and the new nvmem-cell-names is
called calibration-second-part

Signed-off-by: Mikhail Kalashnikov <iuncuim@gmail.com>
---
 .../thermal/allwinner,sun8i-a83t-ths.yaml     | 56 ++++++++++++++++++-
 1 file changed, 53 insertions(+), 3 deletions(-)

diff --git a/Documentation/devicetree/bindings/thermal/allwinner,sun8i-a83t-ths.yaml b/Documentation/devicetree/bindings/thermal/allwinner,sun8i-a83t-ths.yaml
index 3e61689f6..b2f750ef2 100644
--- a/Documentation/devicetree/bindings/thermal/allwinner,sun8i-a83t-ths.yaml
+++ b/Documentation/devicetree/bindings/thermal/allwinner,sun8i-a83t-ths.yaml
@@ -24,18 +24,23 @@ properties:
       - allwinner,sun50i-h5-ths
       - allwinner,sun50i-h6-ths
       - allwinner,sun50i-h616-ths
+      - allwinner,sun55i-a523-ths0
+      - allwinner,sun55i-a523-ths1
 
   clocks:
     minItems: 1
     items:
       - description: Bus Clock
       - description: Module Clock
+      - description: GPADC Clock
 
   clock-names:
     minItems: 1
+    maxItems: 2
     items:
       - const: bus
       - const: mod
+      - const: gpadc
 
   reg:
     maxItems: 1
@@ -47,11 +52,16 @@ properties:
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
@@ -107,6 +117,7 @@ allOf:
             enum:
               - allwinner,sun8i-h3-ths
               - allwinner,sun20i-d1-ths
+              - allwinner,sun55i-a523-ths0
 
     then:
       properties:
@@ -132,6 +143,32 @@ allOf:
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
+        clock-names:
+          enum: [ bus, gpadc ]
+        nvmem-cells:
+          minItems: 2
+        nvmem-cell-names:
+          minItems: 2
+    else:
+      properties:
+        nvmem-cells:
+          maxItems: 1
+        nvmem-cell-names:
+          maxItems: 1
+          items:
+            - const: calibration
+
 required:
   - compatible
   - reg
@@ -176,4 +213,17 @@ examples:
         #thermal-sensor-cells = <1>;
     };
 
+  - |
+    thermal-sensor@2009400 {
+      compatible = "allwinner,sun55i-a523-ths1";
+      reg = <0x02009400 0x400>;
+      interrupts = <GIC_SPI 62 IRQ_TYPE_LEVEL_HIGH>;
+      clocks = <&ccu CLK_BUS_THS>, <&ccu CLK_GPADC1>;
+      clock-names = "bus", "gpadc";
+      resets = <&ccu RST_BUS_THS>;
+      nvmem-cells = <&ths_calibration0>, <&ths_calibration1>;
+      nvmem-cell-names = "calibration",
+             "calibration-second-part";
+      #thermal-sensor-cells = <1>;
+    };
 ...
-- 
2.51.0


