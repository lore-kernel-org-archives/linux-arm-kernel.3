Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 622C9E9B260
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 24 Feb 2026 13:15:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=KKCYhHbR6vSjsD8wHgb8LL/2bafBoxxkBbchRF8aJrw=; b=w9DB5KXuVIA565EsKWcSOUfq4b
	9X01ZMPpH9q6ysEfsPQbuPQMyeeJV+3uylMJuw1dl5/0/c2BtZ/6n9O6j3iC1j2TJm1KZY9/SjWGh
	A/3GmpmZRqZPCnYFClV9sY6W9Iq0cqGOWzMC+TacjXf5K6RZL0qQV5LBH6ESCv0FF2IBSHdwsJVKC
	P0h2yTJNYglZhdk2NbktbGIr7ktBfd+cvWt/QQd67j4Kd3ioT0uiOUGhR/gzdhhaKY84R/CULqRv8
	xjVeqHFCsRGAswzEX8yZElPcrxX6mz8jmI+VqqoUdtlptKNoUdcqY3QteP3t5KzZRftxLOsg90NXw
	bnCtgHeQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vusGI-000000026vV-1aZU;
	Tue, 24 Feb 2026 13:15:38 +0000
Received: from mail-pf1-x42c.google.com ([2607:f8b0:4864:20::42c])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vusGG-000000026ue-0hbB
	for linux-arm-kernel@lists.infradead.org;
	Tue, 24 Feb 2026 13:15:37 +0000
Received: by mail-pf1-x42c.google.com with SMTP id d2e1a72fcca58-82361bcbd8fso2875798b3a.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 24 Feb 2026 05:15:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1771938935; x=1772543735; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=KKCYhHbR6vSjsD8wHgb8LL/2bafBoxxkBbchRF8aJrw=;
        b=GX5zAn5lFYstpebbrDtrCV2mHyOKwqKQLG5pyxVu6Jd1XLvpo30No3AfxXdEmgNUGu
         5HMcQSsWZtpIS8UVYAg4DArQASzMFSYnds6wdcRV8+vzcDX/szjeGHTIuOVY4h/0WNVQ
         fjBrtNGc9RW+OVkM/ODehr1BZUGiAX+KmX9fUMPNeWoZfKTZAt3gGVDLK/BxwYzu/tZ9
         uSZK0HXjHD3nxfSwgKlqFhWmQ4JkPZ10IE5Wu/mew7f3YzyobZD/74QzipqQgL46JJ1M
         GTJlMgPGRV3wzvljBFpJsOy1h5sUPZK6c3f3kz2FoXcPGmEDyY3WFPbcPl5SgqGN6YlV
         Llmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771938935; x=1772543735;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=KKCYhHbR6vSjsD8wHgb8LL/2bafBoxxkBbchRF8aJrw=;
        b=HcJFMtXPK7MB9WOsX6g29PBHGDbcHwV4BF9RH+S3t7/9MbQClaJXtaw0p23tNQjhfq
         +0Wy/ha6TT/etQGnDi77NnmMQE0uGx8bVpWXu5fuTyhJf/ioLKHTSe55URPz4O9Qwqz9
         VF483ztsns3WJJDlwiloWGy87vYgNA0ONtCLMAJRNXXxP5YO1SOkcBrpHgVlmJVIMDM5
         jhIL0uxyJC+ExgkkNULLDm8ycE1MhUM9yXXOi+4xiYBDBNu40cdYxn38OrWDtSzI4wVr
         4rrY0km3Yy4J0a5y00cNrVO9cDj+f9iIw9vJ4XuzLbQhu04a9FN2SB9gzeBqAgYWBfky
         S1KQ==
X-Forwarded-Encrypted: i=1; AJvYcCX4qKR9KL+MN8cNOt5KQQ6uxneJiLc4cgyYcmQT96BAoGhb8kxOg0FZ/VGdki3a3VLw2QBtL1vw8JGyIrQGlgxp@lists.infradead.org
X-Gm-Message-State: AOJu0Yx7qkqdyolgmxmh4WcUJjkyNQZ3LQCEOiQqWmdn7qb9OTYEuQEN
	LG9Zug/Zra4vI3rdpqRu19y7qfiK5CZKUapKmeUeIxePsIME08SuG5IX
X-Gm-Gg: AZuq6aL8yvqj+JsY+w+Z9DpVTlF5P2KUrhYUhbyAP6rzxBkqr19iTk3AJJv81ngdB21
	/r2wVjo1lRVcAizpLYMDK7RH1tUku0B6P8+Bi2QLyASmfJPpMEFRdQFrmo07QwoHEKIq4OOdltg
	Lou5L8Vg2CiXj3RfXkpwTHXVTHNkVjMFRSUv03wzlhASiTpulCGPAmzq6rYcWn8jIeFb8+J8WhK
	vEvVJnMbtjupXLqpmqbNv1sIKKOngn7yd4wHyM10gzv0bRI1aeBYKqVnm2GXA7kEtYOPY83wDZN
	xcUbHLC58GdlGDIZxmRqTrTt7D7y9stGWnOeK3ffHfFQ22bWsXgnulwMMOoylknJiPSq0WR9dmC
	S/K7mZN3BLZu2kJDe/mNSBNzueS7o8LezPc3PvOXh9eU4hifWHnNwGp+ADFrylx8fFG0sO2DY7n
	B+Mrz8DOZtFiBqV0sL0SG7Ng4yBtWWI18cJ8vjW4dgbg==
X-Received: by 2002:a05:6a21:9984:b0:38d:ed39:35a0 with SMTP id adf61e73a8af0-39545f8e14fmr11302252637.61.1771938935081;
        Tue, 24 Feb 2026 05:15:35 -0800 (PST)
Received: from Black-Pearl.localdomain ([27.7.171.51])
        by smtp.googlemail.com with ESMTPSA id 41be03b00d2f7-c70b7253a70sm10794013a12.24.2026.02.24.05.15.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Feb 2026 05:15:34 -0800 (PST)
From: Charan Pedumuru <charan.pedumuru@gmail.com>
Date: Tue, 24 Feb 2026 13:12:59 +0000
Subject: [PATCH v2 2/4] dt-bindings: usb: generic-ehci: fix schema
 structure and add at91sam9g45 constraints
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260224-atmel-usb-v2-2-6d6a615c9c47@gmail.com>
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
X-CRM114-CacheID: sfid-20260224_051536_218583_272C522B 
X-CRM114-Status: GOOD (  10.12  )
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

Add clock and phy constraints for atmel,at91sam9g45-ehci and reorganize
the allOf section to fix dtbs_check warnings.

Signed-off-by: Charan Pedumuru <charan.pedumuru@gmail.com>
---
 .../devicetree/bindings/usb/generic-ehci.yaml      | 46 ++++++++++++++++------
 1 file changed, 33 insertions(+), 13 deletions(-)

diff --git a/Documentation/devicetree/bindings/usb/generic-ehci.yaml b/Documentation/devicetree/bindings/usb/generic-ehci.yaml
index 601f097c09a6..55a5aa7d7a54 100644
--- a/Documentation/devicetree/bindings/usb/generic-ehci.yaml
+++ b/Documentation/devicetree/bindings/usb/generic-ehci.yaml
@@ -9,19 +9,6 @@ title: USB EHCI Controller
 maintainers:
   - Greg Kroah-Hartman <gregkh@linuxfoundation.org>
 
-allOf:
-  - $ref: usb-hcd.yaml
-  - if:
-      properties:
-        compatible:
-          not:
-            contains:
-              const: ibm,usb-ehci-440epx
-    then:
-      properties:
-        reg:
-          maxItems: 1
-
 properties:
   compatible:
     oneOf:
@@ -167,6 +154,39 @@ required:
   - reg
   - interrupts
 
+allOf:
+  - $ref: usb-hcd.yaml
+  - if:
+      properties:
+        compatible:
+          not:
+            contains:
+              const: ibm,usb-ehci-440epx
+    then:
+      properties:
+        reg:
+          maxItems: 1
+  - if:
+      properties:
+        compatible:
+          contains:
+            const: atmel,at91sam9g45-ehci
+    then:
+      properties:
+        clock-names:
+          items:
+            - const: usb_clk
+            - const: ehci_clk
+
+        phy_type:
+          enum:
+            - utmi
+            - hsic
+
+      required:
+        - clocks
+        - clock-names
+
 unevaluatedProperties: false
 
 examples:

-- 
2.53.0


