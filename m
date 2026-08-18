Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 67365C5DF7E
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 18 Aug 2026 10:32:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=VXAR0pfuBaAQ9k+v1xXQaQosy7aMoQd3gplGbAsity0=; b=kapozswspySoVXI24qdkZCd0O0
	1A4bdOKKJvi+Oi3cQAxLziXMmOuHtf2w9VBMMbZzlAF6I6jC2Nnqu/3B8UC1s5s4EBwy405vb/w19
	hud9IKerWmk3rr5DltCaJ67/v4If70i4YQXuqL9Nf28ca9snnxGVoJv803XDMGQo/pTjWipyCh47N
	Wg30d2PAlYrtVxJWstD7EPHHCEpO5tfdZD6rGoO/dZ4i+44nelchaoMLWRjD+Sgb82qTR2KFkg7C2
	EZnarKuWOEPPdCrbfUPNCOen2569mld+GtT8VhFul/Np0iyr2GReGKVIG5FQ3bPmy10vZji/93LZF
	fIJD+GcQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wwH6k-00000007ijH-0hnS;
	Tue, 18 Aug 2026 10:31:50 +0000
Received: from mail-wm1-x330.google.com ([2a00:1450:4864:20::330])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wwH6f-00000007ifH-0tR6
	for linux-arm-kernel@lists.infradead.org;
	Tue, 18 Aug 2026 10:31:46 +0000
Received: by mail-wm1-x330.google.com with SMTP id 5b1f17b1804b1-4994c49f588so9413985e9.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 18 Aug 2026 03:31:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=9elements.com; s=google; t=1787049103; x=1787653903; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=VXAR0pfuBaAQ9k+v1xXQaQosy7aMoQd3gplGbAsity0=;
        b=FxE3wv7bzRzJNNgy4vVr3qnis+eBPftEIBclfEmHFeJDfeZZKPVpWOw7UhILD8FTrF
         ZtvwpJ7ezDBeso0x2CG27wrzdZmzmW1fuCUR5+m5D2Qi+WYltst7utHO5LroXLzpa4n4
         cHu0W5szceY2AlODIGN9hQkdITZ7B5twST6GjYlNbI7r5YEtjxQrsALc1DclsKlOb8wF
         96x11rwnFCDXyWtucmbYx3/lEP5pDkleTMCvfQ4XU0xBoWMfPynrH4PGI5PGr0xqICo8
         Q9YabgKiaaZiVPvNPcMxycAQJbg0hKzZg1Qn9JKTWorrZidBpWOmNJ5xY4AaKlk6krOb
         cfxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787049103; x=1787653903;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=VXAR0pfuBaAQ9k+v1xXQaQosy7aMoQd3gplGbAsity0=;
        b=Fd9goEsQ9zyV58SxKdPsnq9AptDxx7ZD7SE3ErjOhqzNXY49mYfXPYw8dvHr82lB6T
         /t/FGzXqlTUTyZSdMu0ueTUK+Q3EZthzuyDdnvpkH1olckd7/UFG/yLj7MeH3JWsx/1d
         R/e7chWiThfXyDIpflSE4c3Ix4vNpTkySHx99xdvHa927ENPkKfDs1rMHDS0xMP7yOR5
         dZVWhdm0t+BJXRubcqOKYrbIcUEyaRrqJ01DnTPwvBJfr1Y+HKVpJCysw8TOnsivsBEB
         P2ywy6jnpv339xThwfJqgkbBOIYNOGj+9v2y3tHJarVWCWweWqQxWLoD3X8Oy5n8ICxz
         8UIw==
X-Forwarded-Encrypted: i=1; AHgh+Rp8qEpck1UDMFfmQd2r3Hyhph1DJPYEptkCS7Bl6bMCfnq9l8BRRqfyAB8HbWdE5t4tfkRmi6fxzaAKKXgTJov5@lists.infradead.org
X-Gm-Message-State: AOJu0YxtEZtY/foHb8hV+eyRLP354rvOaPlbLT9dCGgr6nk74zsoY5zb
	8s2vJfmpwr7R56G2A6AN4PWuq+L5l9YfKOxYJCd+C84jMSjPyICCrbAL4e9T1X1LxPM=
X-Gm-Gg: AR+sD13M3YsVJUWzTWdP6biXviOVKsgX6hkTAuSerG62RNVmkMHAxqM93+X5xEZVn85
	OebKVNbS+Bnjn1xZ8z62tp39ACLyKUZrKQJNJGXwL7r3G5qN/G9xwfnqABEm15rewMwX/iiV0/1
	onytNYGew7YkRnfEzSiYd8PqAepAOYpwH7KxtuIfV5qdEDFydqEDAGj/G6uvE+wpYya36sU8dsT
	xoSrx7FX8whgNmILF+S4rFCfmeIfLmgiHtEYiEIiUmoZK6unWp9o81DdkAX7+S3a2coGYEL5Ivy
	yGrORjwD3vluxQ/eCG3KqNDdtIi4Aq2Oi6rgYRPxm7V1wNk7uaAT7hmU9iWgMnbiAf/Litax+it
	yDKVQZJUDPTgpqc4SjJsDxui6DkW9NjqebzynvRMZQWRGCIxZNr37xRBCKCXEN3KikqKLvgQwcO
	OzdWf7OLwHaFaDbTBEz69Vn0/p4+sMpBjE3GNu7Rq6cnT5WdqzXaIZymisZcsekkqAJmQJl2e//
	EcvxJ7pwsnsUEnHFBOmAfQvBXo4YXoymu8/m1GbEhv/LDsE37u/FPUupwgg
X-Received: by 2002:a05:600c:8b77:b0:493:f783:c46a with SMTP id 5b1f17b1804b1-499a206a553mr70558395e9.6.1787049103159;
        Tue, 18 Aug 2026 03:31:43 -0700 (PDT)
Received: from [127.0.0.2] ([188.111.3.154])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-499960988c6sm246025575e9.0.2026.08.18.03.31.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 18 Aug 2026 03:31:42 -0700 (PDT)
From: =?utf-8?q?Gr=C3=A9goire_Layet?= <gregoire.layet@9elements.com>
Date: Tue, 18 Aug 2026 10:29:14 +0000
Subject: [PATCH v6 1/6] dt-bindings: serial: 8250: aspeed: add ast2600 and
 aspeed,vuart-over-pci
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260818-aspeed-driver-v6-v6-1-fd7cc0b338ea@9elements.com>
References: <20260818-aspeed-driver-v6-v6-0-fd7cc0b338ea@9elements.com>
In-Reply-To: <20260818-aspeed-driver-v6-v6-0-fd7cc0b338ea@9elements.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Jiri Slaby <jirislaby@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Lubomir Rintel <lkundrak@v3.sk>, 
 devicetree@vger.kernel.org, Joel Stanley <joel@jms.id.au>, 
 Andrew Jeffery <andrew@codeconstruct.com.au>, Lee Jones <lee@kernel.org>, 
 =?utf-8?q?Gr=C3=A9goire_Layet?= <git@gregoirelayet.com>, 
 Tan Siewert <tan.siewert@9elements.com>
Cc: linux-kernel@vger.kernel.org, linux-serial@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-aspeed@lists.ozlabs.org, 
 mfd@lists.linux.dev, andrew@lunn.ch, jacky_chou@aspeedtech.com, 
 yh_chung@aspeedtech.com, ninad@linux.ibm.com, anirudhsriniv@gmail.com, 
 =?utf-8?q?Gr=C3=A9goire_Layet?= <gregoire.layet@9elements.com>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260818_033145_286608_0EF06BB8 
X-CRM114-Status: GOOD (  14.15  )
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

The ASPEED AST2600 can be used as a PCI device.
The ASPEED AST2600 has 2 Virtual UARTs accessible over PCI.
2 Virtual UART can be exposed to the host via this PCI device.
These are 8250-compatible register sets and can be used to have UART
communication between the PCI BMC and the host.

This boolean can be set to specify if a VUART is used over PCI. A VUART
over PCI needs access to the SCU syscon to set the enable bits of the
PCI device.
On the aspeed's chips, the clocks phandle already points at the SCU node.
But deriving the regmap from the clock provider would misuse the clocks
binding. An explicit scu-syscon phandle states the dependency directly.

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Signed-off-by: Grégoire Layet <gregoire.layet@9elements.com>
---
 Documentation/devicetree/bindings/serial/8250.yaml | 42 ++++++++++++++++++++--
 1 file changed, 40 insertions(+), 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/serial/8250.yaml b/Documentation/devicetree/bindings/serial/8250.yaml
index bb7b9c87a807..8dd4b7af0c0d 100644
--- a/Documentation/devicetree/bindings/serial/8250.yaml
+++ b/Documentation/devicetree/bindings/serial/8250.yaml
@@ -18,12 +18,34 @@ allOf:
             - aspeed,lpc-io-reg
         - required:
             - aspeed,lpc-interrupts
+    then:
+      properties:
+        compatible:
+          contains:
+            enum:
+              - aspeed,ast2500-vuart
+              - aspeed,ast2600-vuart
+  - if:
+      anyOf:
         - required:
             - aspeed,sirq-polarity-sense
     then:
       properties:
         compatible:
           const: aspeed,ast2500-vuart
+  - if:
+      required:
+        - aspeed,vuart-over-pci
+    then:
+      required:
+        - aspeed,scu-syscon
+      properties:
+        compatible:
+          contains:
+            const: aspeed,ast2600-vuart
+    else:
+      properties:
+        aspeed,scu-syscon: false
   - if:
       properties:
         compatible:
@@ -106,6 +128,9 @@ properties:
       - const: ns16850
       - const: aspeed,ast2400-vuart
       - const: aspeed,ast2500-vuart
+      - items:
+          - const: aspeed,ast2600-vuart
+          - const: aspeed,ast2500-vuart
       - const: intel,xscale-uart
       - const: mrvl,pxa-uart
       - const: nuvoton,wpcm450-uart
@@ -297,7 +322,8 @@ properties:
     $ref: /schemas/types.yaml#/definitions/uint32-array
     maxItems: 1
     description: |
-      The VUART LPC address.  Only applicable to aspeed,ast2500-vuart.
+      The VUART LPC address.  Only applicable to aspeed,ast2500-vuart and
+      aspeed,ast2600-vuart.
 
   aspeed,lpc-interrupts:
     $ref: /schemas/types.yaml#/definitions/uint32-array
@@ -306,7 +332,19 @@ properties:
     description: |
       A 2-cell property describing the VUART SIRQ number and SIRQ
       polarity (IRQ_TYPE_LEVEL_LOW or IRQ_TYPE_LEVEL_HIGH).  Only
-      applicable to aspeed,ast2500-vuart.
+      applicable to aspeed,ast2500-vuart and aspeed,ast2600-vuart.
+
+  aspeed,vuart-over-pci:
+    type: boolean
+    description:
+      Enable the VUART over the BMC PCI device. Only applicable to
+      aspeed,ast2600-vuart.
+
+  aspeed,scu-syscon:
+    $ref: /schemas/types.yaml#/definitions/phandle
+    description:
+      Phandle to the SCU syscon, used to enable the VUART over the BMC PCI
+      device. Only applicable to aspeed,ast2600-vuart.
 
 required:
   - reg

-- 
2.54.0


