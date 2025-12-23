Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 32186E6F086
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 23 Dec 2025 20:21:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=fD3TOo20gfVbUTTrRVEjhVDMuAvx6I5y/UndE2JGgIM=; b=ybH7F2QHTrSGxHA0kN8M63rTnf
	YXl+7cAVkzcYp8SrzROx4ME1pLT/777a9gpzfkUaLK4DtCkledQ5/cvX/XOC1u/AbdLC1q1OHDaxC
	5tTfSUSn8yxl5dvU84SZiD/F2x4tKSeFx+R8KJkovzPdDFJBSjTv574cYR1a5oY6o7looayf7prGc
	EHQPYmaNJ0KdTPezH9AInM0x7u49+hCrlBR7G5GJZFspkGTelCPEJzksimmNhHlwt6ekMGwEMs4Ex
	cbt0S3EedyTO+JX1/pILMPJ78Z3pCwJJkcnHYquQZskjdutTiasHg197G5S28cNyBQmOSxurZC7Z9
	K70EGZRQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vY8sv-0000000G3XR-47uL;
	Tue, 23 Dec 2025 20:21:33 +0000
Received: from mail-pf1-x42e.google.com ([2607:f8b0:4864:20::42e])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vY8sp-0000000G3TB-1dVy
	for linux-arm-kernel@lists.infradead.org;
	Tue, 23 Dec 2025 20:21:32 +0000
Received: by mail-pf1-x42e.google.com with SMTP id d2e1a72fcca58-7aae5f2633dso5383278b3a.3
        for <linux-arm-kernel@lists.infradead.org>; Tue, 23 Dec 2025 12:21:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sartura.hr; s=sartura; t=1766521286; x=1767126086; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fD3TOo20gfVbUTTrRVEjhVDMuAvx6I5y/UndE2JGgIM=;
        b=FrBln4dUDK8NCfOjXYsT0VOgG78FK5Ridgjsy6KbAgN64UfFtmOmuVpaD78xbp/JF3
         Pq30420gGPFHJJr9fIwcWTs9ZPNQrNDhc/VXn3xBUwJiiheUafqjThscmvrPD4p9cjnD
         GjE33dQhU+QhiQBZ4xkN2epbKpzqgCmpzVlY/IzU5avaIWyHDB++GSKP0Z9hZ9MNbfhq
         Zn/R2SYSjadFxq+ItmHRop5pfyoVkUITV64HPw7tizd4CqASUC+79YFF+UvZQykpCK++
         1BabJkMfMNgqA3FHpg1ObkOeyFU6UTEZkFqXfxHh4Be5wsqGnc639uR6crAbjLdhraeM
         qyKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766521286; x=1767126086;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=fD3TOo20gfVbUTTrRVEjhVDMuAvx6I5y/UndE2JGgIM=;
        b=B8EyuADxONqmW4I7L0HYRmLOFRvAUrXse7M77SASeQDaG2emWky9sYJ97AHgom6ank
         FL4e2YWiRA7MpkUABZ7WuEqKCejbZJh8Cn9Y8VPsoEdbKAEed44LAL0vjg84ut6EMt72
         6ZURCqTAOXrByjaRRZhdMadmZ0L3dbSTrqD5jlMhpE2VhanIKHLAEdvB2c/bgoNMdheR
         S/L+TTl1LWfGlF/86CFQojlU6VdGFa2g3N+IvDcnEyx7S9RH+fc9GKyIzT5COJpxiuGy
         kBIIg+JkHgO20KmegxIDfKDDk67s/ELOoBx1DpAtZgin4Ea2lgEvtVJus2h0ehEQ6q1l
         HCyw==
X-Forwarded-Encrypted: i=1; AJvYcCURyJiZa8JUPlhHEE0/3bpQXs/G/KuAJ16q4paVFmreXwmDPlfzKhXzVRUtO+s5JFAjzlTRmLEsdgLyHWecKART@lists.infradead.org
X-Gm-Message-State: AOJu0YwC2KNOJByJbo5RUnW2lWrdxOOxhx76EpefYh7K5NM7jSYh2xUp
	gxgEGBzgRXt9gVT44rBbIhu4e5+xY1L+sdAz7+FxKE96v6eoM1ed8akez8Sa9SouwEQ=
X-Gm-Gg: AY/fxX4wpYqlwmaPil560mCHgqA0zqWGQdy1ZVdArWz9l1YT99oQTj3CoK4njei0GQt
	uDrBZEtfS5KoWrxYcqvwk/MnzMU+7ldFSpnAGeemmCYP6+D1sFtrBYS9IleacB7H6i19BYkO8g2
	+M1daSNp0oltWk500UMibW7gpWd0+ezP+ZdmAyMdRiENDHbZRdMo+ndz8DcvzNcgyh7+ffpp7y0
	Tdx3lG5KFwA71y8kpFlHAM3B7BOGX5C2uxcV0ksm5OyneAm+jFKzHjxuNYeAUM5gJ5G62jb58Ao
	49hiV1LxbywC5pv2oaFgTWwMWV9bowQjsbBTOALV53rRtJsUXNvTT3dwuV1q9JXW/YJe5ePORwX
	spO/olpD8ED56/jiU4Qp52xOR0/Qk+xyGVSvYgt3F06tK/ewDn+Ql5p/bqPjZeZzO4+3PsO53+5
	zevG493k4m+rsDmqThrS5vmeyzoVLGGJuV1TRO96hhFtJWbjPDfiY+w5iiEYYDCOpYe6LGeI5Zb
	/v8P17e7MZb1r+wGTA=
X-Google-Smtp-Source: AGHT+IGKTAqrl4PGe4SFW7qu0192lJdQVYEzpdtaZXHZbcUYB4ioIiqnmVp7I/qce4lXwOMNJA61Eg==
X-Received: by 2002:a05:6a20:e293:b0:341:d5f3:f1ac with SMTP id adf61e73a8af0-376a9de5b1fmr15092285637.41.1766521286558;
        Tue, 23 Dec 2025 12:21:26 -0800 (PST)
Received: from fedora (dh207-15-53.xnet.hr. [88.207.15.53])
        by smtp.googlemail.com with ESMTPSA id 41be03b00d2f7-c1e7cbfa619sm12567549a12.36.2025.12.23.12.21.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 23 Dec 2025 12:21:26 -0800 (PST)
From: Robert Marko <robert.marko@sartura.hr>
To: robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	nicolas.ferre@microchip.com,
	alexandre.belloni@bootlin.com,
	claudiu.beznea@tuxon.dev,
	herbert@gondor.apana.org.au,
	davem@davemloft.net,
	vkoul@kernel.org,
	andi.shyti@kernel.org,
	lee@kernel.org,
	andrew+netdev@lunn.ch,
	edumazet@google.com,
	kuba@kernel.org,
	pabeni@redhat.com,
	linusw@kernel.org,
	Steen.Hegelund@microchip.com,
	daniel.machon@microchip.com,
	UNGLinuxDriver@microchip.com,
	olivia@selenic.com,
	radu_nicolae.pirea@upb.ro,
	richard.genoud@bootlin.com,
	gregkh@linuxfoundation.org,
	jirislaby@kernel.org,
	broonie@kernel.org,
	mturquette@baylibre.com,
	sboyd@kernel.org,
	lars.povlsen@microchip.com,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-crypto@vger.kernel.org,
	dmaengine@vger.kernel.org,
	linux-i2c@vger.kernel.org,
	netdev@vger.kernel.org,
	linux-gpio@vger.kernel.org,
	linux-spi@vger.kernel.org,
	linux-serial@vger.kernel.org,
	linux-usb@vger.kernel.org,
	linux-clk@vger.kernel.org
Cc: luka.perkov@sartura.hr,
	Robert Marko <robert.marko@sartura.hr>,
	Conor Dooley <conor.dooley@microchip.com>
Subject: [PATCH v3 12/15] dt-bindings: pinctrl: pinctrl-microchip-sgpio: add LAN969x
Date: Tue, 23 Dec 2025 21:16:23 +0100
Message-ID: <20251223201921.1332786-13-robert.marko@sartura.hr>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20251223201921.1332786-1-robert.marko@sartura.hr>
References: <20251223201921.1332786-1-robert.marko@sartura.hr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251223_122127_440193_ACEF75AB 
X-CRM114-Status: UNSURE (   8.91  )
X-CRM114-Notice: Please train this message.
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

Document LAN969x compatibles for SGPIO.

Signed-off-by: Robert Marko <robert.marko@sartura.hr>
Acked-by: Conor Dooley <conor.dooley@microchip.com>
---
Changes in v3:
* Pick Acked-by from Conor

 .../pinctrl/microchip,sparx5-sgpio.yaml       | 20 ++++++++++++++-----
 1 file changed, 15 insertions(+), 5 deletions(-)

diff --git a/Documentation/devicetree/bindings/pinctrl/microchip,sparx5-sgpio.yaml b/Documentation/devicetree/bindings/pinctrl/microchip,sparx5-sgpio.yaml
index fa47732d7cef..9fbbafcdc063 100644
--- a/Documentation/devicetree/bindings/pinctrl/microchip,sparx5-sgpio.yaml
+++ b/Documentation/devicetree/bindings/pinctrl/microchip,sparx5-sgpio.yaml
@@ -21,10 +21,15 @@ properties:
     pattern: '^gpio@[0-9a-f]+$'
 
   compatible:
-    enum:
-      - microchip,sparx5-sgpio
-      - mscc,ocelot-sgpio
-      - mscc,luton-sgpio
+    oneOf:
+      - enum:
+          - microchip,sparx5-sgpio
+          - mscc,ocelot-sgpio
+          - mscc,luton-sgpio
+      - items:
+          - enum:
+              - microchip,lan9691-sgpio
+          - const: microchip,sparx5-sgpio
 
   '#address-cells':
     const: 1
@@ -80,7 +85,12 @@ patternProperties:
     type: object
     properties:
       compatible:
-        const: microchip,sparx5-sgpio-bank
+        oneOf:
+          - items:
+              - enum:
+                  - microchip,lan9691-sgpio-bank
+              - const: microchip,sparx5-sgpio-bank
+          - const: microchip,sparx5-sgpio-bank
 
       reg:
         description: |
-- 
2.52.0


