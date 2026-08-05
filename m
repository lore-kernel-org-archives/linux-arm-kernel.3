Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 647C2C55ABF
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  5 Aug 2026 12:20:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=bz6C6stmStVMzEFUIQDnKapYsxwqb3V9iw0SJh4YNFs=; b=0MdNdezuEvvw7KdV5N4v2er5+D
	dmWOgRPTV8TWcJNqDtFV1bPyRjYNEEjZB5z8OfaqsUaHN4YfisihZIrAUHI49SBV5GiGSoEgSQiWw
	X6VGSJSnX74WfZ15MuTSTY5DuA4EVyyFrdwp+3iS91GaprQxtyAukW+5KEIuG66y3Pfxwy5j/SBmN
	weT2M4Sjc4g9nKN6kc2ABnJxIqBC3Xcosf0N3qVUDx3vrOy1znxn0rt5pwIA8cGRtda7NkWSZ0tPK
	sJJzp+GiV/i7k65/o3UTw6U2bKKTX8DhxHE4TsDjlDnPSAGHYOl5uSDhIGQRN8EY1KDg6D0IaFrfS
	WZIKYptg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wrabr-00000003t6C-45Yf;
	Wed, 05 Aug 2026 12:20:35 +0000
Received: from mail-wm1-x329.google.com ([2a00:1450:4864:20::329])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wrabp-00000003t4f-3h08
	for linux-arm-kernel@lists.infradead.org;
	Wed, 05 Aug 2026 12:20:35 +0000
Received: by mail-wm1-x329.google.com with SMTP id 5b1f17b1804b1-498028b3d5eso8730415e9.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 05 Aug 2026 05:20:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=9elements.com; s=google; t=1785932432; x=1786537232; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=bz6C6stmStVMzEFUIQDnKapYsxwqb3V9iw0SJh4YNFs=;
        b=B3XlNaJ6cWBk8flatvvwIaPbMniPR2+DC0eZtWERny43bZb/3KOOTr25Zvk3PE3Ui2
         BwEyQfTGfxOBBC5YZRmmeja9TCQujP1VzLaIzFualEXwIXk13+iBv//ICr447JH1VpoB
         w740wEZpzYSy1PtD8WylFiqJSDbFGUzW9siTmCjfFu88TxvCYZdfa3QRlkf5ua1HTG91
         JBSSpthl8IWWmDqaToPL6j5MlzweGimLvvhCZwR7W4F3oUxaesfvBUs/ei2e+FoDa1IB
         4O543bbyjcasqZPt1qSiur4EgeiSpqhxbx0Tpr/575Rg5uvt6+3yN2PFhK9ljGHtG0NE
         TWbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785932432; x=1786537232;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=bz6C6stmStVMzEFUIQDnKapYsxwqb3V9iw0SJh4YNFs=;
        b=X9fRY5QQqV7lpyjS0KpPvm4ybEN+mQbb8FjtILhn/BvldyeeccvVu8XBrs6xyW/yin
         FhLpy35szX3PGLvqjwoyZphPfsa4uPs/KVYMyi+A1YRVrIxk6nhrdF7fd7OfjMX8dlzo
         76kq+1zS+Ms/GBADO6/ii2Ca+eTNdfp2U9vLXp/HF9Zt02yJRS2D6RZk3geiSxs5pdYH
         +VtZf4kxGM8/bQphVaxQa2EaqE0SdvJsCo6lT1oWjoO9CZnEZbr9ohgh7Z7/NtsA5uHj
         lYSy40YS1p4/4+23ZMyZmdAjfp1CzIErmyiazphCRLs1jVJMfAVo/1z4zavwdXFfRq8C
         pOgg==
X-Forwarded-Encrypted: i=1; AHgh+RrtO+tSuDiNhQbAlRiI74k9ta+1vGjBWG1gxL84e8/tlK13zOaz6rKvwpFIsAMy0s0ldOt6ktnLX8T4+RCDR2z+@lists.infradead.org
X-Gm-Message-State: AOJu0YxoayGJNUR0FvbRpp1SNflQ8rJQZS6a/tXrR0BIhd532r1WtsfV
	XTM6zVlIxBbbp4GZAcRKAJjsnYDSTm3tHPVncpcAZd+soK7s3qqUyzqctNEvfjbaEAo=
X-Gm-Gg: AR+sD11cBvcC+BELlt9Y2o5k7K2pmZ858B6UNTilAxebufczTq5WjENwxlktu/YxQUo
	dtLiiVULstG9kD+O2LXDmL7/EyJ3bHza+HjfOl7+zUqpi4av3W+qQRPzTN4/BnQRHs0sRNHmbYJ
	xasiw0HYdMTZRMN4/Gpq3CCUfsYRBtF7Cyn98jslnft6zuQZVtkALQ/blQfOeS1CBLPgzKEZj1i
	BrpyRD/IRl05vsqdeScc1XaK4GAPjxSCU3dm83HyIisqnS29jFoXtqDZqiZK4vWiUDD3Xp7JH7H
	toIZ2A9wZfBVOq2tGTCvf7kSuIsAecuwsOyNLPwVOPrVOCSBX2Ux3rUGlC5+uu/uUF1KKzacuEu
	Dq1lVodx83Wfj60fTSbSgQzt0SpUTYi9aBkprg89qHKcd/9DN1SaDCpbKYBJdNJNBDQuQBopkYI
	OgQlRh3WwqHRQ767N0Tj8UHEjK+UXpEHH4Dd4DkwkObMh8AmEphWr4bDN0LRESB6RULMCOuifc7
	bvtfLsUnZYE0SoKKbPRzDDN2gN2YkclWa+bk144y9byf6G2lFAIR9elfV9U6LtbTXizhv+x2ZvN
X-Received: by 2002:a05:600c:198f:b0:492:4e09:9fc1 with SMTP id 5b1f17b1804b1-4994e7cc5a4mr72969715e9.15.1785932431891;
        Wed, 05 Aug 2026 05:20:31 -0700 (PDT)
Received: from gregwork.sec.9e.network ([188.111.3.154])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49949f68f95sm196663515e9.0.2026.08.05.05.20.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 05 Aug 2026 05:20:31 -0700 (PDT)
From: =?UTF-8?q?Gr=C3=A9goire=20Layet?= <gregoire.layet@9elements.com>
To: joel@jms.id.au,
	andrew@codeconstruct.com.au,
	lkundrak@v3.sk,
	devicetree@vger.kernel.org,
	gregkh@linuxfoundation.org,
	jirislaby@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	lee@kernel.org
Cc: andrew@lunn.ch,
	jacky_chou@aspeedtech.com,
	yh_chung@aspeedtech.com,
	ninad@linux.ibm.com,
	anirudhsriniv@gmail.com,
	tan.siewert@9elements.com,
	linux-serial@vger.kernel.org,
	mfd@lists.linux.dev,
	linux-aspeed@lists.ozlabs.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	=?UTF-8?q?Gr=C3=A9goire=20Layet?= <gregoire.layet@9elements.com>
Subject: [PATCH v5 1/6] dt-bindings: serial: 8250: aspeed: add ast2600 and aspeed,vuart-over-pci
Date: Wed,  5 Aug 2026 14:19:48 +0200
Message-ID: <52d5bce1cf8ec3ff0b27e7313655cf7ffa2236b5.1785932211.git.gregoire.layet@9elements.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <cover.1785932211.git.gregoire.layet@9elements.com>
References: <cover.1785932211.git.gregoire.layet@9elements.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260805_052033_950236_0E35902B 
X-CRM114-Status: GOOD (  14.50  )
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
 .../devicetree/bindings/serial/8250.yaml      | 42 ++++++++++++++++++-
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


