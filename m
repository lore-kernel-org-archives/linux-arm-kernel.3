Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9B68AE6FE29
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 23 Dec 2025 20:21:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Pe7/bfwW61qpTH+JIS3AKR1VkqKbIoFXot2V67cYu6g=; b=JusiJkkaf08dlggyEG9N47PL4j
	x5tFuJHCdvLfP8x6As6W01STl1QEHyFxvqTTaU8bf6uVRSVUlD9hcxYIyxyL6GB/VNL524JQvmO69
	oSLLLylxYIe3pdiHzVoeGz6mgujELZlRhl8S8oiY+mBsO2biWpPR4quMq3l8wi/VpJY2WpLpFu8Sp
	3/cXmuy/6QxA0/Qtn/QnQFKZeHjgmFf0zbccwndx3aNVZm+blPm5DgOT7WpU/5Y3skYlGiqt6nBXe
	EVti0TP+eO36hGPGCxa2yxHIzpQMMjLHBbTWsqVXRbMDPiKxb8O4Bqd4OdUgLGjIMlORSYfv3SSED
	n1TGB2XQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vY8sr-0000000G3UY-2V1J;
	Tue, 23 Dec 2025 20:21:29 +0000
Received: from mail-pj1-x102a.google.com ([2607:f8b0:4864:20::102a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vY8sg-0000000G3Mq-2exs
	for linux-arm-kernel@lists.infradead.org;
	Tue, 23 Dec 2025 20:21:28 +0000
Received: by mail-pj1-x102a.google.com with SMTP id 98e67ed59e1d1-34c27d14559so4259849a91.2
        for <linux-arm-kernel@lists.infradead.org>; Tue, 23 Dec 2025 12:21:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sartura.hr; s=sartura; t=1766521278; x=1767126078; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Pe7/bfwW61qpTH+JIS3AKR1VkqKbIoFXot2V67cYu6g=;
        b=tgdTilWuIbHpp3RpHR0Baknb5u0NpjMuIPTdun7O0fMvKwYsvuQY0hBt5aw4jJeCQM
         C5gwdKKknVAxN0pPkWzjTvE4cRKT+2bxE7FwMDiryIQo3HtfyQxFnlqo5cVMGhbswihL
         w25Jw5g7ewkpalY0P0vvPFjpatOr22iHTZzrHPDtJJitWlnYNI3Jc3q/CvRtk2NT0yPT
         Fhk5sWMDK22VUHb9ZBYaoL0easRa2Ylffsn8xv/N1ehbisAh4oYslBMOOKC0oEpaarlH
         KafXyqOxFnfVGl79WXvwhpsgAApMU8TFjCyHxOLd2KKB07BvOqcSZPB4xRszCLRy9rpY
         47BA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766521278; x=1767126078;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Pe7/bfwW61qpTH+JIS3AKR1VkqKbIoFXot2V67cYu6g=;
        b=ZQZfBp8qfDKukLwZ+9GFr8OZWuY3bvuiMuI0B4nN9IaORBkFoZOCaxHipwVz4JUpCj
         c0DpPqwtYOAffIz2Ogtfhp/txpChJWjopfEdk+jlBKvC2uyhCjQdFzjyZ3b4w7JjT1rd
         g0mpUjnAwjvZG2T7d7dPjInSIzUL2BncxKxBvuQ8kWDK2gSoarwKD1cBLAE+c26cI+if
         gIB0gDT2UXYGsoJfeo9rTM26HDRbQ2850vSfplrMCtMtMB4lBjScsue2uR7uoMhRVoHq
         cN2b6x1XHc0sCCAv7DZcIE26eOExXQTQDMpbuyYRQ5ZONnLST6hyXuMGqlmWuodITbHo
         dj6g==
X-Forwarded-Encrypted: i=1; AJvYcCWTSdb/Tas9dSAGWwaWVpJeC62cDcewNbij2Qa8516CxfhUGQPzKALKhoG9kwuZ5P/csvbbIsZueqNAaijJn8NE@lists.infradead.org
X-Gm-Message-State: AOJu0YziaDUOKd76oWZaF2WprwaKU9J9vuPGvu5ThJ7KtlAwwAgzVPBy
	whH1JxnqIli9j+hVpciZnKOvsIihcGwoGGWxOCtFHTFbUrjMI9s8edNJfc2ZMxKzWSQ=
X-Gm-Gg: AY/fxX6TsvRVXAlvnuRp97idERkS177tpNX3XapqMwGghk1nVLop+jbjPATa2KChZp8
	FWwjoZcR+LXhDSHU7cs6A9MCg6UugY0FA0IMMLKnYldXkHlEC3bQmNTcrxfG22MVOOadmxemIwD
	uRUqTy7Gr28xivHZUmkIeL272OWsIKkcpMzN0Ex7A94oTLn2Y8mQYd9le12czpk3BvadYgDCIHS
	y4aUg1IO9Lfs4SaCLBl/QyhHWGkYvFgyNRCVI4BOIi+m5uH35129Mywpn5DV+T1h1NDjRLoRlgu
	bvrDv2XEL1XkJsf3C7x4xlgOQFiN8l9C9FzDEjkyMf6c0xTJcZorQLmhIbpSV4BPqNpmCdpGbNG
	uX9ofJIbmalPJ4hfWbVeC+10+SRHiVH+8KylooSfv4y0c2PPnQ5rTephyXx7Nyc41m8B8YH/H19
	dJhaFs1zDJyJDe0GDTF/UlZzF170uvZ15L84SHfI/ztSR7AywKJd1VLXyTuEo3C2jFDjtZM508f
	maNN+88
X-Google-Smtp-Source: AGHT+IHeRAtPKwVz6qoPOdL+Osxtu3PLTheDOvUOr8YysaVV8Js4PDKym39wxYhmLqVHZ9ksN45wJw==
X-Received: by 2002:a17:90b:3c4e:b0:340:c60b:f362 with SMTP id 98e67ed59e1d1-34e921131a2mr14020700a91.6.1766521277662;
        Tue, 23 Dec 2025 12:21:17 -0800 (PST)
Received: from fedora (dh207-15-53.xnet.hr. [88.207.15.53])
        by smtp.googlemail.com with ESMTPSA id 41be03b00d2f7-c1e7cbfa619sm12567549a12.36.2025.12.23.12.21.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 23 Dec 2025 12:21:17 -0800 (PST)
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
Subject: [PATCH v3 11/15] dt-bindings: net: mscc-miim: add microchip,lan9691-miim
Date: Tue, 23 Dec 2025 21:16:22 +0100
Message-ID: <20251223201921.1332786-12-robert.marko@sartura.hr>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20251223201921.1332786-1-robert.marko@sartura.hr>
References: <20251223201921.1332786-1-robert.marko@sartura.hr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251223_122118_727322_97BACA50 
X-CRM114-Status: UNSURE (   8.69  )
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

Document Microchip LAN969x MIIM compatible.

Signed-off-by: Robert Marko <robert.marko@sartura.hr>
Acked-by: Conor Dooley <conor.dooley@microchip.com>
---
Changes in v3:
* Pick Acked-by from Conor

 Documentation/devicetree/bindings/net/mscc,miim.yaml | 11 ++++++++---
 1 file changed, 8 insertions(+), 3 deletions(-)

diff --git a/Documentation/devicetree/bindings/net/mscc,miim.yaml b/Documentation/devicetree/bindings/net/mscc,miim.yaml
index 792f26b06b06..2207b33aee76 100644
--- a/Documentation/devicetree/bindings/net/mscc,miim.yaml
+++ b/Documentation/devicetree/bindings/net/mscc,miim.yaml
@@ -14,9 +14,14 @@ allOf:
 
 properties:
   compatible:
-    enum:
-      - mscc,ocelot-miim
-      - microchip,lan966x-miim
+    oneOf:
+      - enum:
+          - mscc,ocelot-miim
+          - microchip,lan966x-miim
+      - items:
+          - enum:
+              - microchip,lan9691-miim
+          - const: mscc,ocelot-miim
 
   "#address-cells":
     const: 1
-- 
2.52.0


