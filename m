Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E986CE9B263
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 24 Feb 2026 13:15:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=1EF5DZh0w95AiZ3fg7AA2Xw4QIn2ePCxy3IrusVoZ7g=; b=Jbi9OxPcSfrLGrGfoGWfoBuOhF
	0Z9MP1EoU+zbTStoiwLUoPWubUneoScb66/eyTcN590JlR97ZoTWqVti1BeeYnUlDyz/GJcKfiNQi
	rVdSNJxsvLT8XFcF1OMYql75nRG6o20Is5MSpjnU+vcCMWJDv4hSv4pZiydxmBvXDJsq/48X/4gi2
	Bo9OcOLUyktyzSBHvuan1UjKoII5ZlQJFJEGu1zcx4dERrkVTibia8X2a2OH914gJBeyi5ijQvlpr
	L3jBwZpzMdh1THIL5vgeoO6hnEKTfVWwiyRzq4KkH1T2Po/X7+q6+m3Wyt3t3v5yL+wvbdTUC2IHv
	iLqxM3HA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vusGD-000000026tc-0MxZ;
	Tue, 24 Feb 2026 13:15:33 +0000
Received: from mail-pf1-x435.google.com ([2607:f8b0:4864:20::435])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vusGB-000000026sO-25ob
	for linux-arm-kernel@lists.infradead.org;
	Tue, 24 Feb 2026 13:15:32 +0000
Received: by mail-pf1-x435.google.com with SMTP id d2e1a72fcca58-82491fbf02cso3057447b3a.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 24 Feb 2026 05:15:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1771938930; x=1772543730; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=1EF5DZh0w95AiZ3fg7AA2Xw4QIn2ePCxy3IrusVoZ7g=;
        b=RuAelK6++4nDCGsMGRVzuAMPheFOzY8nut+zSNvcjqINMnvZ1o5V9KXbdo5kMVuvCm
         hBNO4Rh0HgDkHzB4g17Y/5GnV2Xgzrtmd558yvviFcRh40xoC1Jy/NA5dHRQxAopikCE
         zY/nbjpniW4vLUxBdqE7vF1OQZVpOnWbKrRJSeRgiZFWqW9+PR4lJa9QXQTmOBeU+O7m
         EfrU73rJ34kuDPjmYA7tm/2YjXGEOsvNN07qPK5a8jaYiU74ipsOQYw+MBlCrFFtoyEu
         p+d5jS7XhS6BUY2KzDrDX4iShO8INysQJ4vuNlCL5PH3+MspTft29TZG3/d8SEn4OIbV
         22OA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771938930; x=1772543730;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=1EF5DZh0w95AiZ3fg7AA2Xw4QIn2ePCxy3IrusVoZ7g=;
        b=dy21ZmVLgrsDSrM5f/gTZix5byjzjOXxyNa+5B4k57qnfd4ZT4kDCAviTMqFJ9xPGW
         2Sl1vEOFdCXXLUkh+UyIdbo3N2EKTGfHQzn7XfnMRFj1LJIPWmOeIspkcFCgQPzNmtpW
         +1gfp8OOQueMZ4rC5B3hUjxupepV3Ak+wWdGIa/mpO98te8ka5dccjto90VSAnRJLZzl
         tzQdTUE++tAGSeY14rjmZ9SeUx4HaBVMzZpLb0fILLwtOtawiaQdKyntOczZwfMdt4GT
         kCkU2adYJzxJh7Z6HSRzv6pQZ0pVUCzeRgXAVV6J44dGkfhczLJzv6HW78btdzBbArkT
         BVWw==
X-Forwarded-Encrypted: i=1; AJvYcCUdQz0/b34/tgoIZvptHZettIXxVpl7m9g4BFa6G7e2x+5sUurKb2/lXQV8G2u9/R2dG8FXQzFs26+fw6mlYXil@lists.infradead.org
X-Gm-Message-State: AOJu0YxGSdyeUYeO+7lMip8aid79qRQ/u5jFI9n9CX1A5ZMMdvomSwtR
	Ic2a8tkG7KwJQQTjH8jrNFP7MKEHiDbcA5hd0/vU/iqrQVrZeiMOZcVS
X-Gm-Gg: AZuq6aLwawVZXj6blNx/ZxZ3sRE6glWvh4JyO8A6XWwJOP250cuJ6eIxN1UhqNeOtdI
	gL64AyvXraybdIyDWCyfNXZ9JF6LYKLoh+HPxF8pem0q6b3x0+JS1wr/jnLBllgT/GSsJXsROZU
	mv72nRUMqCFOUqmopHV9xYluUoJOmsrq3ImR79WI+qgcC2eaCmIXsMtpYahga/M5S7bMBFzLQxs
	JWgjBfXKuBpdE/hcw7RPp5wzkL9uXMaZyyPa5iqaOlNF+OWH1N0ivrf1Aa2CkQBelbDKG7Q3+OD
	+EPjd0uTQJxy95WLhckHUwjKhfOSqpjhbs9qhZOtHU5LfW5zo52yEwjxiovSwF87zHHBhjFHM06
	Kxjx3RzZdFnetpTr4cpZQw/sI+R51UfpWE2sefEQBrhtwOTGXtyaqvKH1GVE7VnXvjX/pS/8lgN
	QqS41fjzE0RFefJhw7/zJLycWEjt3L//QM9133hQtuKA==
X-Received: by 2002:a05:6a20:431b:b0:395:151c:4eda with SMTP id adf61e73a8af0-39545f553acmr12721981637.45.1771938930467;
        Tue, 24 Feb 2026 05:15:30 -0800 (PST)
Received: from Black-Pearl.localdomain ([27.7.171.51])
        by smtp.googlemail.com with ESMTPSA id 41be03b00d2f7-c70b7253a70sm10794013a12.24.2026.02.24.05.15.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Feb 2026 05:15:30 -0800 (PST)
From: Charan Pedumuru <charan.pedumuru@gmail.com>
Date: Tue, 24 Feb 2026 13:12:58 +0000
Subject: [PATCH v2 1/4] dt-bindings: usb: generic-ohci: add AT91RM9200 OHCI
 binding support
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260224-atmel-usb-v2-1-6d6a615c9c47@gmail.com>
References: <20260224-atmel-usb-v2-0-6d6a615c9c47@gmail.com>
In-Reply-To: <20260224-atmel-usb-v2-0-6d6a615c9c47@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Claudiu Beznea <claudiu.beznea@tuxon.dev>, 
 Herve Codina <herve.codina@bootlin.com>, 
 Nicolas Ferre <nicolas.ferre@microchip.com>, 
 Alexandre Belloni <alexandre.belloni@bootlin.com>
Cc: linux-usb@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Charan Pedumuru <charan.pedumuru@gmail.com>
X-Mailer: b4 0.14.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260224_051531_545359_0B5F93F4 
X-CRM114-Status: GOOD (  11.98  )
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

Add binding support for the Atmel AT91RM9200 OHCI USB host controller
to the generic OHCI schema.

Signed-off-by: Charan Pedumuru <charan.pedumuru@gmail.com>
---
 .../devicetree/bindings/usb/generic-ohci.yaml      | 27 ++++++++++++++++++++++
 1 file changed, 27 insertions(+)

diff --git a/Documentation/devicetree/bindings/usb/generic-ohci.yaml b/Documentation/devicetree/bindings/usb/generic-ohci.yaml
index 961cbf85eeb5..ab8a49142386 100644
--- a/Documentation/devicetree/bindings/usb/generic-ohci.yaml
+++ b/Documentation/devicetree/bindings/usb/generic-ohci.yaml
@@ -55,6 +55,7 @@ properties:
           - ti,ohci-omap3
       - items:
           - enum:
+              - atmel,at91rm9200-ohci
               - cavium,octeon-6335-ohci
               - nintendo,hollywood-usb-ohci
               - nxp,ohci-nxp
@@ -137,6 +138,16 @@ properties:
       The associated ISP1301 device. Necessary for the UDC controller for
       connecting to the USB physical layer.
 
+  atmel,vbus-gpio:
+    description: GPIO used to control or sense the USB VBUS power.
+    minItems: 1
+    maxItems: 3
+
+  atmel,oc-gpio:
+    description: GPIO used to signal USB overcurrent condition.
+    minItems: 1
+    maxItems: 3
+
 required:
   - compatible
   - reg
@@ -144,6 +155,22 @@ required:
 
 allOf:
   - $ref: usb-hcd.yaml
+  - if:
+      properties:
+        compatible:
+          contains:
+            const: atmel,at91rm9200-ohci
+    then:
+      properties:
+        clock-names:
+          items:
+            - const: ohci_clk
+            - const: hclk
+            - const: uhpck
+
+      required:
+        - clocks
+        - clock-names
   - if:
       not:
         properties:

-- 
2.53.0


