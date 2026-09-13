Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0CA70C88E65
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 13 Sep 2026 14:56:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=z/z4QNBtUdI4E15ZNXPZtkbjaHvGmUhKoMr+O5uGaIE=; b=SX8niGnpXNVcMqcr5xCBMBvRcY
	LojO27v0Sx4cdAB00Ica5+byEiC924nTdhWGs4SIdvzhGH+7oag4phx/hvfzkY19oIt10vy7FpQdh
	zAumEE/1OK/HJB33dq99h3GGv4tkgRiAAUoeS5qNdRz8DINBgUCcr9k0pa+zTAOzUthFm9Gw1JPsL
	PQoo0OOS7wYK6yjb/gcdXmn8w0eGEp/JEYzdh/1UUBjcGS93cZWLfSfldyb18swi0/YkC3hcATbxL
	+MrhuNiJXmee66+Lx4KjISftIBXlNS5wACVij75nses2L/rAIsTrrn5UVHa/Eu5C9IRS1RWQwKAXu
	cPNd1AGQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x5lcp-00000001jmG-2HPd;
	Sun, 13 Sep 2026 14:56:11 +0000
Received: from mail-pf1-x42d.google.com ([2607:f8b0:4864:20::42d])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x5lcn-00000001jlX-1kiL
	for linux-arm-kernel@lists.infradead.org;
	Sun, 13 Sep 2026 14:56:10 +0000
Received: by mail-pf1-x42d.google.com with SMTP id d2e1a72fcca58-86a25369f16so1869670b3a.3
        for <linux-arm-kernel@lists.infradead.org>; Sun, 13 Sep 2026 07:56:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789311368; x=1789916168; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=z/z4QNBtUdI4E15ZNXPZtkbjaHvGmUhKoMr+O5uGaIE=;
        b=naBna1aZixZxJUjidLAWWz5tUkcoWYXJOyuKh5VS6q89haPcdeovOHVPsUo3rIfQ5c
         2xrdET75ag3EkuDTB3V2KRWbYKRsoDQz584j7iSbqRlo9B0sDVeWeiXDvJiYWmWX0SbJ
         k4NKaWy5kgf4Da3qoQ4pyo/30VTQ4RBNXEuZ81th1QOCtkIx2WDzPrFJzI7hVtLJcGlJ
         2FmvlYp5subPqW2yNPBofMJ1tgsjv349pb/k0LGq8iMIMx+8hn2KVU1NaiO0KszjxMLm
         t+HKTmQMuL66tXwQS25SR+rFeLNsfjpMdKl5YwJu/fJlumRFy/mxGq/k+4y2WA+2laE9
         7yVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789311368; x=1789916168;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=z/z4QNBtUdI4E15ZNXPZtkbjaHvGmUhKoMr+O5uGaIE=;
        b=IFBWlF5Vzb4O1VLiXiZ+/ZfsTPL4Sos2yYxqM21M3dpH9610Vl9z0lsouApHhCXX27
         Y3HcOkJP/tEvgNgausCkpnN5lARVj0cKS3riYaPvpEaazQ/yBzAQQPNiqEHOBAv4q7nS
         0W4YHtzsFown5f5EF57+jCTT9/avYh3SaW2QRGSgmOPJVHLvrOey282vRXuQtCk+rQcU
         IpGS3RCllcLNuEw5RgNxM/Y3bTrm2l5oMf/qnWikBK29R+iA6pSqnrEP1CDE/UEhV3VZ
         3GcSbeRH23woabuYASw0h8zK+M5kp2rvasrfU4jRwr9KP5RwIMz93lwQkcQEyHHIilfd
         IuHQ==
X-Forwarded-Encrypted: i=1; AKwUvByOAM40LutNzRCSdffUwVlINKHxO+9MMwN03fk4i+nxkz0ZA2ILKgvlhbOV/mJcwuDd9Ydzj2m6Rgce7q8efEPr@lists.infradead.org
X-Gm-Message-State: AFuF++nRGbm1nfVv6zX/5ywW2JLQy2boOGDhA2JQjknTrfCdh+XAZpHy
	CIyvDJKhmralzJeDCSnLSoPWkg3jkYqKsjrbELRcZL+8Uev7S3w+pFu3
X-Gm-Gg: AYBFou3m86YQh9M1L4JiQKUp3kf2Eo8NJd0DjHwumg/ylr65ZCam1X4EnhXVye+TCO3
	WJD0NPyBPPH+dTsCdRwdaPpJALzPunQRQ6+4h3+3O8KY1GyWAiWlHaAmsHfvIkEjmKNDAH2zvGo
	BTTA1dRR80XYP1rkRTDhOUPLWJzAsnD3a7MrlZsx2+gbbBP1rBPfjj19rNVjSf6SGVxC3XSrwRF
	Di6enToF9VOsymBi5pax3AKst37mTQd8Xw1tfmcIOgwsrvrFPDcXiLTlJq7Sw19NFAF8Qug54Sj
	kjdoTjfXdxom2DucAzZFLGvJkU/VNd0BGWDGcRvs0+T4zV1hS1Ih7aHJytAvzRyey/JM4s2rMxd
	XHJuIagm8HD3/193xN90qeN7RdPuB10sCDhjT/342UGXONqERXyjeuGUCYRIfJzkRynjOqH9TKb
	rD4tr6sU7DxfG+YkoYchUb4qVn6k1euJnfXlk0nvO2UHQNzBJA3ujU9++L40csby4B
X-Received: by 2002:a05:6a21:46c5:b0:3d1:60d3:99f8 with SMTP id adf61e73a8af0-3daed46ad42mr25849990637.5.1789311368455;
        Sun, 13 Sep 2026 07:56:08 -0700 (PDT)
Received: from archlinux ([207.90.239.231])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-33ba7a9bb56sm21467366eec.31.2026.09.13.07.55.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 13 Sep 2026 07:56:08 -0700 (PDT)
From: Mikhail Kalashnikov <iuncuim@gmail.com>
To: Vasily Khoruzhick <anarsoul@gmail.com>,
	Yangtao Li <tiny.windzz@gmail.com>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Daniel Lezcano <daniel.lezcano@kernel.org>,
	Zhang Rui <rui.zhang@intel.com>,
	Lukasz Luba <lukasz.luba@arm.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Chen-Yu Tsai <wens@kernel.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>
Cc: linux-pm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Philipp Zabel <p.zabel@pengutronix.de>,
	=?UTF-8?q?Juan=20Manuel=20L=C3=B3pez=20Carrillo?= <juanmanuellopezcarrillo@gmail.com>,
	Andre Przywara <andre.przywara@arm.com>
Subject: [PATCH v6 1/5] dt-bindings: thermal: sun8i: Add A523 THS0/1 controllers
Date: Sun, 13 Sep 2026 22:55:23 +0800
Message-ID: <20260913145527.18148-2-iuncuim@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260913145527.18148-1-iuncuim@gmail.com>
References: <20260913145527.18148-1-iuncuim@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260913_075609_465254_FF299E77 
X-CRM114-Status: GOOD (  10.96  )
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

Add dt-bindings description of the thermal sensors in the A523 processor.

The calibration data for both thermal controllers (THS0, THS1) is split
across two nvmem cells at different offsets, requiring the two cells
to be read and merged. To maintain backward compatibility, the name of
the old cell remains "calibration" and the new cell is named
"calibration-second-part".

Signed-off-by: Mikhail Kalashnikov <iuncuim@gmail.com>
---
 .../thermal/allwinner,sun8i-a83t-ths.yaml     | 34 +++++++++++++++++--
 1 file changed, 31 insertions(+), 3 deletions(-)

diff --git a/Documentation/devicetree/bindings/thermal/allwinner,sun8i-a83t-ths.yaml b/Documentation/devicetree/bindings/thermal/allwinner,sun8i-a83t-ths.yaml
index 3e61689f6..792081af5 100644
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
@@ -132,6 +140,26 @@ allOf:
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
+
 required:
   - compatible
   - reg
-- 
2.55.0


