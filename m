Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B37D6FC9EDE
	for <linux-arm-kernel@archiver.kernel.org>; Sat,  7 Mar 2026 09:16:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=bW3VZiLdDmix0hxhYvm5DhZwcyWfk2K5eWWffGvWYiM=; b=wtOeOvTjEitfcQz8YwHvUIgzgK
	Otf+Dh6NODyQnN5Jnd8fIx86buc39w1TBxlNO9TH8b+RUVL0mHzn/TvSVdtIAI4afQh/ZXclVAR+8
	yHomxpCO39oN/6kttE1DGZjta7kmZBIzBRKdQX/EbCQ24KYCs6thYUevv3SdIMvapzA8g3Vw29DpF
	Oy6AJMrSmGbpZfATYXKCuoME2rVqQsDtzQXyVaj/pf880v7k/HK7WQL5g/9+2oMBRyqQas3oUy79O
	t77yTPCVCM2yjqSdW7TfTYEzeyQzZd3MLnfplHYlIOZr7UrHOxBuwugQhjdYNnIiWd5CVZw5g1tPz
	XUpskOvw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vynm5-000000052Hd-2d0O;
	Sat, 07 Mar 2026 09:16:41 +0000
Received: from mail-pl1-x635.google.com ([2607:f8b0:4864:20::635])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vynlz-000000052Fi-3NnE
	for linux-arm-kernel@lists.infradead.org;
	Sat, 07 Mar 2026 09:16:40 +0000
Received: by mail-pl1-x635.google.com with SMTP id d9443c01a7336-2a9296b3926so76082345ad.1
        for <linux-arm-kernel@lists.infradead.org>; Sat, 07 Mar 2026 01:16:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772874995; x=1773479795; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=bW3VZiLdDmix0hxhYvm5DhZwcyWfk2K5eWWffGvWYiM=;
        b=RVUwH8xzIO0j1eAjh9jSeNeeRkxmRUqpStlb1dWX9olc6eGcFs4yxm5NdxlBwZGPW4
         +1RyqPbSQWaIP1tyStipGUDRZwZ9VNss4tNceGpSZdkv4oH+U0SoPimdtiQQfpMJhdQj
         QAFeDBlfWjn3e7LMLWJSnJwPZPQTGezoyLC78VAFiFOQXIjEeEs4Anv4CWahC5WnJJ/i
         ujWU3ye+6EjBaKp7AcO3oJGs8k+3a/VzbefdXbYmjInVhzWLWjwnDB99udPp2YeqE8JT
         REXFOTBnsSJ09ataaUc0r2pGyy+qdnM/nExgpenJlbicauBuihD6ldBxWgpX/CLA+Rsq
         i2Fg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772874995; x=1773479795;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=bW3VZiLdDmix0hxhYvm5DhZwcyWfk2K5eWWffGvWYiM=;
        b=sanR9+n/HSBxOYgw/w5/Yn2dcPJxY6GSeVSrB1hA3fkBEEoqYT0wZ9m/imgCzP7C7m
         vudbYFwZNnVOU5V3J8oq4Ei7PeiorBA1NXqdTu4zFlNY3agPNcE2bTAfx/LsEyBuWEaE
         EnkeMvhLY5Dkh6DIf0CcF2kBz4KLzKUdZ/YjAHSc1HSOLubkXNC63rpgSrnq7hHftBCf
         QmamSgOoWigXzdnCKvITmVnislpMuTMHKfC+lZRHilMm+ZjcMQOmvq61WIlSUTgsoXpd
         +pAjYceLT7Wze0seFuURAsNBg4eiFX92rGU6pTFKGY3K12x7CN4FP+RmRgCW6Y9P+6Du
         ptKg==
X-Forwarded-Encrypted: i=1; AJvYcCWG1IE1Pp9FWJ6tSVIDZPnCB8RBDaMO3L1Hx6cU7kpIkz50KbkXSVCc9vniEr7/U6j4R3kVFNf15hGIUcf4Ea76@lists.infradead.org
X-Gm-Message-State: AOJu0YyKCM+fG6Zw41vzMlbewXKGwXJ4TcZDZn/7N/aVYSPMN5mLIgkk
	ERftInRhbI94L23LIbkyVfciEh1ldKdH3zKNy8/aB4VfBwtd+0VYcNmX
X-Gm-Gg: ATEYQzz634Rck/buNFOx1+uMXa1b6pJpbP8cFd90jhHw5Z8LB6oUu+4iwGXb6z2ga92
	PgkfLxqwLoDOiPPiPQJMUzjYacs1S2V41pgTuMzssxwgw7Q0EPdGyXUI+1Qxz4ddgRc6voVsFLE
	5RHbb0JTaPAtpCdyp+ANrDZW3CWKp0Hd1oXH5EJc0oSHZJy0nvSS/IlcGKIsQhVEuBbjzCPFsWK
	IY8Qxnjx7zD3UQoVPF5nIgP2H5oQwoXNkPcmfFOlZzMDYu2oeX/Wh2YQBhf/9f8rMi2v/LFJNKW
	U7poh4k6lr1y4Bf6PSy5X2jmAbB1JR4y45J2eJ6m+yxczjih4KjqYd/MQyO+DEvNhHNWNG6Ei4b
	01LOx0Aj7RtQl7cNr7CehrneIQ3y5wh6/Kx/sfqzvpB5TSuRYM87iv0s5X+5DEaNzDEcPORSHdF
	4LumwQeWGMssfczLdXqSffNxG4CSlQf4c8Anfx8ADcdKuGZWZWLDhUOA==
X-Received: by 2002:a17:903:120f:b0:2ae:670e:309f with SMTP id d9443c01a7336-2ae824f4d5fmr50056685ad.34.1772874994942;
        Sat, 07 Mar 2026 01:16:34 -0800 (PST)
Received: from Black-Pearl.localdomain ([27.7.215.222])
        by smtp.googlemail.com with ESMTPSA id d9443c01a7336-2ae83f74e4fsm45569385ad.58.2026.03.07.01.16.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 07 Mar 2026 01:16:34 -0800 (PST)
From: Charan Pedumuru <charan.pedumuru@gmail.com>
Date: Sat, 07 Mar 2026 09:16:19 +0000
Subject: [PATCH v3 2/5] dt-bindings: usb: generic-ohci: add AT91RM9200 OHCI
 binding support
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260307-atmel-usb-v3-2-3dc48fe772be@gmail.com>
References: <20260307-atmel-usb-v3-0-3dc48fe772be@gmail.com>
In-Reply-To: <20260307-atmel-usb-v3-0-3dc48fe772be@gmail.com>
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
X-CRM114-CacheID: sfid-20260307_011635_854990_7B607E17 
X-CRM114-Status: GOOD (  11.28  )
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
 .../devicetree/bindings/usb/generic-ohci.yaml      | 33 ++++++++++++++++++++++
 1 file changed, 33 insertions(+)

diff --git a/Documentation/devicetree/bindings/usb/generic-ohci.yaml b/Documentation/devicetree/bindings/usb/generic-ohci.yaml
index 961cbf85eeb5..a8a94b9c1fee 100644
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
@@ -144,6 +155,28 @@ required:
 
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
+
+    else:
+      properties:
+        atmel,vbus-gpio: false
+        atmel,oc-gpio: false
+
   - if:
       not:
         properties:

-- 
2.53.0


