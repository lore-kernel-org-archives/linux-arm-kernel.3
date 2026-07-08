Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 88EFCC43458
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  8 Jul 2026 15:38:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=IsD4MhplgL6wFfLDJdfUVLAz4oGDfnauFOzTWjsK6XA=; b=ryV4CrKyFnKxuyp+CYOgHxJ6Ei
	RCBJKRzWUJlTO/8eC260Rkh9L1nND09uduGqpUUG870vpEPzhNMlgC+uyPlRhxBDPoOtGH5y6oXqU
	6j54P4wR7csowbKm7VE2yOOexr5sE6ryKafL18bi1bjhDSJj2B7dmUqE2vw75jpAl86JAheNr9P2f
	1KQblP793bnT6d8s6Uwb3waArokKmIKVvXvIDKuCu34rkOdPujtNZP7On1Kpdzah6/QIYvGPe7fTg
	+LDw4NeQeyrg1atmCXncGLS4cpsKic7XvvWFxE3KXQ1TKtvs5qoxJyQov9siFp31pm3xCBT3cCbrV
	xKO2WzCw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1whUMA-0000000HUsQ-181U;
	Wed, 08 Jul 2026 15:38:38 +0000
Received: from mail-wm1-x32c.google.com ([2a00:1450:4864:20::32c])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1whUM7-0000000HUqJ-2ipV
	for linux-arm-kernel@lists.infradead.org;
	Wed, 08 Jul 2026 15:38:36 +0000
Received: by mail-wm1-x32c.google.com with SMTP id 5b1f17b1804b1-493bf73ec2aso4910035e9.2
        for <linux-arm-kernel@lists.infradead.org>; Wed, 08 Jul 2026 08:38:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=9elements.com; s=google; t=1783525114; x=1784129914; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=IsD4MhplgL6wFfLDJdfUVLAz4oGDfnauFOzTWjsK6XA=;
        b=ddrA4KnirGtwkprjauuyXC+GjOGfT5R6uvmeoqRBu8KfoxvTgru8/yRzjdwKmzfCqY
         I6xTksc0xqkHTElgNCbZfaJpGk/jOqEm/mHiayBJMUnib6TbnvNe+0/QA68r+1yMOLep
         5kw2Xv1tsInrmKVI2TVFoG2aEii+Grjv8P5LoyTmTFGrvaBvjLT0Z6O8uqVRe8FVkuCr
         ZcivvE1CrqBvo3viNRKJmYxkCjhKbiDf/7aJk9PfZzsvTUaLQ5Du3hYeQSnSGVmbvrd/
         h2XQvbCbTEsjoen+kl0kOUzoNTz5esHbxgEDCfy9J0WYxpOBWs5JW3dYt3HMpf46n/BD
         +wjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783525114; x=1784129914;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=IsD4MhplgL6wFfLDJdfUVLAz4oGDfnauFOzTWjsK6XA=;
        b=XqGmfLXkTG1W3lh5QY1AxUqZxteaSsMk1YxggYbzTSaCO2AD+BRbA/0mT9YDFOfE3T
         7KS2bQffg0s5boP1fajXncVkLKpARLLBirzxeATT3baT8Hmi0GbUeMqbByKFi8lVQcEB
         sPoLO+Y28f2PhXGqz85SAoAmUCLr5aSdS/3f1DSqLnknWkXlwrghymCXjxjhYaPSNjYs
         Mxx2QCnzXQ14o8+iS0eBiR8V+anKFwasp1CdK8C1DgxqHG7a8S4vLs+LcgcVd63BxVKy
         ODaAN218XfQFYr9YOQyfJc6R/wpVKxx2Y+zB4WWPePS6fBKuhYezrRfn7JMt1jSGBQMm
         mXXA==
X-Forwarded-Encrypted: i=1; AHgh+RosHxO8B9Pl4NPPjdygdd0Uq7szcFxmaYND0R47HDHl+Lmnc7vr41X8IxZkSA3Mq2L56oIN3U+kCFBVdIvebZFO@lists.infradead.org
X-Gm-Message-State: AOJu0Yw+pA0wtmzsbf2xnflbhKEWXyDHAuu1flyyTUVzhGOoXa25hJaI
	rT+MBFSOl36zqYEudyKxUg+o/aOtw3c/LlawSAC0ysuzvDfBKDb9vRJRgLp9JeFHDyY=
X-Gm-Gg: AfdE7cnBLI1RAEuFlzn3ilTonJZevn1+TiV6eSqRDrvVrWvmGZm8loPhV3RQRfNE2nf
	3Kzh5pad4RlC4vzfVAoPiKfxn5gPdfjjR3V4dd8fF5j2JK0zk/dIMgcNhOXE3EcEtf/MFqlv6W/
	4oGNWAwmr4Z+NF+QLoPm64/UKcf7B+1t7USyuBrDhWprFKe+oiuzqUfqdfPNO07CEidS22c9FeJ
	FsJ3nduqRli73l8ibeduqadlYDPALiy99doeO1ANiPJQuKzqnp4b3uguLZIQ97QMtL24YaIq511
	KTE1wb3ENUYvfHDYb7CJerg0rbPKNy7hf/k8dxrUYbwmqb4wBoY9ru2+1Uch2pMHYXNnW1Sy/nn
	o5njloD47aGDOW1tOaru4/64SBNrmBDNPmyIzAxh7/S3+nEpxqaQazdNez+Da9/c8LrLjEb7TDA
	LJoq4slMNQYo0mqXkEuxgVcoPzv0ap3UJ1vQdeVaclvIxtP2dWmw7PqVVsTBgpU9tnjDDEGgNSm
	OXnahlfAUoM5f/lmiERXo5v6o/S
X-Received: by 2002:a05:600c:1395:b0:493:a435:d870 with SMTP id 5b1f17b1804b1-493e68ce31cmr32926785e9.27.1783525113666;
        Wed, 08 Jul 2026 08:38:33 -0700 (PDT)
Received: from gregwork.sec.9e.network ([188.111.3.154])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47a9e4d8410sm44254136f8f.15.2026.07.08.08.38.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Jul 2026 08:38:33 -0700 (PDT)
From: =?UTF-8?q?Gr=C3=A9goire=20Layet?= <gregoire.layet@9elements.com>
To: joel@jms.id.au,
	andrew@codeconstruct.com.au,
	lkundrak@v3.sk,
	devicetree@vger.kernel.org,
	gregkh@linuxfoundation.org,
	jirislaby@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org
Cc: andrew@lunn.ch,
	jacky_chou@aspeedtech.com,
	yh_chung@aspeedtech.com,
	ninad@linux.ibm.com,
	anirudhsriniv@gmail.com,
	linux-serial@vger.kernel.org,
	linux-aspeed@lists.ozlabs.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	=?UTF-8?q?Gr=C3=A9goire=20Layet?= <gregoire.layet@9elements.com>
Subject: [PATCH v4 2/7] dt-bindings: serial: 8250: aspeed: add aspeed,vuart-over-pci bool prop
Date: Wed,  8 Jul 2026 15:35:54 +0000
Message-ID: <501428d6a6cb1548bf357c25313dbc319724ead2.1783524645.git.gregoire.layet@9elements.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <cover.1783524645.git.gregoire.layet@9elements.com>
References: <cover.1783524645.git.gregoire.layet@9elements.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260708_083835_707094_B2218B24 
X-CRM114-Status: GOOD (  13.23  )
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

The ASPEED AST2600 has 2 Virtual UARTs accessible over PCI.
The ASPEED AST2600 can be used as a PCI device.
2 Virtual UART can be exposed to the host via this PCI device.
These are 8250-compatible register sets and can be used to have UART
communication between the PCI BMC and the host.

This boolean can be set to specify if a VUART is used over PCI. A VUART
over PCI needs a syscon phandle. The syscon gives a regmap to the SCU,
which is used to set the enable bits of the PCI device.
On the aspeed's chips, the clocks phandle already points at the SCU node.
But deriving the regmap from the clock provider would misuse the clocks
binding. An explicit syscon phandle states the dependency directly.

Signed-off-by: Grégoire Layet <gregoire.layet@9elements.com>
---
 .../devicetree/bindings/serial/8250.yaml      | 22 +++++++++++++++++++
 1 file changed, 22 insertions(+)

diff --git a/Documentation/devicetree/bindings/serial/8250.yaml b/Documentation/devicetree/bindings/serial/8250.yaml
index 8f22121381fc..2ea8981bba80 100644
--- a/Documentation/devicetree/bindings/serial/8250.yaml
+++ b/Documentation/devicetree/bindings/serial/8250.yaml
@@ -27,6 +27,16 @@ allOf:
             enum:
               - aspeed,ast2500-vuart
               - aspeed,ast2600-vuart
+  - if:
+      required:
+        - aspeed,vuart-over-pci
+    then:
+      required:
+        - syscon
+      properties:
+        compatible:
+          contains:
+            const: aspeed,ast2600-vuart
   - if:
       properties:
         compatible:
@@ -223,6 +233,12 @@ properties:
           - const: uartclk
           - const: reg
 
+  syscon:
+    $ref: /schemas/types.yaml#/definitions/phandle
+    description:
+      Phandle to the SCU syscon, used to enable the VUART over the BMC PCI
+      device. Only applicable to aspeed,ast2600-vuart.
+
   dmas:
     minItems: 1
     maxItems: 4
@@ -316,6 +332,12 @@ properties:
       polarity (IRQ_TYPE_LEVEL_LOW or IRQ_TYPE_LEVEL_HIGH). Only
       applicable to aspeed,ast2500-vuart and aspeed,ast2600-vuart.
 
+  aspeed,vuart-over-pci:
+    type: boolean
+    description:
+      Enable the VUART over the BMC PCI device. Only applicable to
+      aspeed,ast2600-vuart.
+
 required:
   - reg
   - interrupts
-- 
2.54.0


