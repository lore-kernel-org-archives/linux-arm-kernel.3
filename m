Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C8168CDB46F
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 23 Jun 2026 14:29:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=srD079C+hrmcly29x/1Ya3b2fC/C4R7QLaFAjvjgVg8=; b=V1vBZdp5bf6T2WMt1dzGyz5FAF
	ZwEwqfEOjD3gVSTMYrwcK6Kg567GYlW//XdCSgN0TEDTjNIBtQj86t/3BEsYWAf0jv6mpsUdbgQ0e
	c2AdWds3OJIBaabQnLylwJHudtewhsLygS8yXFyxVoAGTKmDIWPOGm9gA55/dK9d4K+yjitOUV5xq
	XwhA2/v5oc+EvL+Rr9Ovo4RWjXulwT/99S5+G/Tw5i4qFNvVpGxfbdsPEIoDyIQCmFdJaJUsQlgph
	aOGJZBybRakr9ganhDfryUDhgH45IXS78QiCH3lwOwg5SiE4dTD6gOZUPW1i5fu9XhdEiXDRxsCBs
	Dvwbec8g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wc28K-00000006RRY-03kX;
	Tue, 23 Jun 2026 14:29:48 +0000
Received: from mail-wm1-x336.google.com ([2a00:1450:4864:20::336])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wc28G-00000006RQL-0MLZ
	for linux-arm-kernel@lists.infradead.org;
	Tue, 23 Jun 2026 14:29:45 +0000
Received: by mail-wm1-x336.google.com with SMTP id 5b1f17b1804b1-490b4a8e28bso39167285e9.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 23 Jun 2026 07:29:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=9elements.com; s=google; t=1782224982; x=1782829782; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=srD079C+hrmcly29x/1Ya3b2fC/C4R7QLaFAjvjgVg8=;
        b=K+yyXjJtMpPY2DGLRcd0JULD+p0Bc1rm+SMbPpIf2W2o0TvaLZDWBUcB0UB9d5k/wJ
         RrvPNzID/mq2P4VOaTn0zp86qTuWRO+4/oa/eOcRW7cHz6upIETOOLW1seyRqySy/rHr
         aoKq1tVYiyBd2DWwWyPjn8DUWU6XK4RIW9vrYUSVlTlIkyCGrGKVgywBcM5UKXN0H/fi
         LzpO77W7u1Kr71yGlQz+dJploLVsEn3/vQGSxC0966SHLRc7w7nPwx20rF/AfHikZssB
         2pMhzLYpla07zMK5dyjOsBlFFKeOV0zOD/zuWvQpZ20oPyKzSwOIBDYEad35imOuqlRH
         kaLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782224982; x=1782829782;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=srD079C+hrmcly29x/1Ya3b2fC/C4R7QLaFAjvjgVg8=;
        b=IRxs8/wMpsI0F0K76YYKCUEqj3GXMx8YwCEZpL8Mj57ET6ZcJu0NCew+uGUYmxR3/1
         5w6ta98yCGuYx9kspPP4pab4IXrwtEuBZik9ny7y3NBI3ohsCYnK5SQbFL8sO44RcOM/
         yNqQ/4SFVS1K25xcwHa1Ukc+dP4jtWQakeMLhMQfCCyfk8ACySamazMRtJn4TAxPwJZp
         yAZE1NE3T71dBEj9uoMaZMjdRgUib8iTuJrxm2pmTUQFE2I6WMRmd1uiDkpvazNO4e9K
         Mjs6AP0dXHYacSeeEjSa00NeR2pHhfZ3nfVe/VZQDb1ItUepzCLSjGRQh/toEhE3TNjV
         Dk0w==
X-Forwarded-Encrypted: i=1; AFNElJ8reR94D2tn+ioTk0ETRlA+FTZCY+/TG0lGvVvuG/Cql6Yu7K+9bOBoPhTcaLcQHd6JcNVo6KZrv6sg0tGg6pwZ@lists.infradead.org
X-Gm-Message-State: AOJu0Yz8Cg7IPYZRMBHfFYIgllLRH8ggFS5KD+QbsqNPQ1QEl7b9klLm
	xt3erKy2XrENEKwsxrhmkk+py+dibqoUOhqbhiyhgX9V6TeGeg1ImQ9bKby4/k7yNlk=
X-Gm-Gg: AfdE7cm13Egnra6nZNeXF5rs/iLqFhR/ncHg6kj4vBWUQh7t0NIlkAU4YgpTrg+h9d0
	juupkivm8Qz31uxr+CmLNwNrsENhrXKTtRaGTkxfHuBodcsN9y6kNKI9ikvexKF8dQiKQAvW4Pc
	JhGr6kMJmq3z6tf/jBTk9SXospLUvEK74vXOcM/TqG3wTsXKVDmfx09FS6zWTGnk9WJvChaoFaQ
	Y6eck03Lm93BAI0GKcSiWZmLJ352rOfUnxntE5BWVz28Ksv61i9QUlbTy1QEef5pRhdk1eqnXL/
	sNONFguKIjF3UJgYpl7sE1YaaEWrHTlfMuuk5xbOxqf4GFODIND2ZvovTpTjuupP2mE+FZQ4V4U
	yyTkG0ftiXzUbhL6tcbrGnKkh9vPMMKIK9hz6aob8oHHTPTjYqOmgQy9OcrvXoAikHqG1PM/vK+
	/Z+wWkOQymYDLWKt1hp7SADC78otfTx3nxeORUlgCTkxd6++3OX+BwSUAWj/xTP8JmeyvnYEYLJ
	8SfCnvQnvxG8CrGNqyMzW44Y4db
X-Received: by 2002:a05:600d:10b:b0:492:3237:ddf with SMTP id 5b1f17b1804b1-49240e9544dmr224625985e9.28.1782224982083;
        Tue, 23 Jun 2026 07:29:42 -0700 (PDT)
Received: from gregwork.sec.9e.network ([188.111.3.154])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49240efc160sm362507805e9.2.2026.06.23.07.29.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 23 Jun 2026 07:29:41 -0700 (PDT)
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
Subject: [PATCH v3 2/7] dt-bindings: serial: 8250: aspeed: add aspeed,vuart-over-pci bool prop
Date: Tue, 23 Jun 2026 14:25:40 +0000
Message-ID: <73b2bd81ce70814612e6d3cb689c3296de742aaf.1782224059.git.gregoire.layet@9elements.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <cover.1782224059.git.gregoire.layet@9elements.com>
References: <cover.1782224059.git.gregoire.layet@9elements.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260623_072944_143347_ACC2AD13 
X-CRM114-Status: UNSURE (   9.27  )
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

The ASPEED AST2600 has 2 VUART accessible over PCI.
This boolean can be set to specify if the VUART is used over PCI.

Signed-off-by: Grégoire Layet <gregoire.layet@9elements.com>
---
 .../devicetree/bindings/serial/8250.yaml          | 15 +++++++++++++++
 1 file changed, 15 insertions(+)

diff --git a/Documentation/devicetree/bindings/serial/8250.yaml b/Documentation/devicetree/bindings/serial/8250.yaml
index 3cbd0f532e15..b03797f4674d 100644
--- a/Documentation/devicetree/bindings/serial/8250.yaml
+++ b/Documentation/devicetree/bindings/serial/8250.yaml
@@ -26,6 +26,14 @@ allOf:
           anyOf:
             - const: aspeed,ast2500-vuart
             - const: aspeed,ast2600-vuart
+  - if:
+      anyOf:
+        - required:
+            - aspeed,vuart-over-pci
+    then:
+      properties:
+        compatible:
+          const: aspeed,ast2600-vuart
   - if:
       properties:
         compatible:
@@ -312,6 +320,13 @@ properties:
       polarity (IRQ_TYPE_LEVEL_LOW or IRQ_TYPE_LEVEL_HIGH). Only
       applicable to aspeed,ast2500-vuart and aspeed,ast2600-vuart.
 
+  aspeed,vuart-over-pci:
+    type: boolean
+    default: false
+    description: |
+      Enable the VUART over the BMC PCI device. Only applicable to
+      aspeed,ast2600-vuart.
+
 required:
   - reg
   - interrupts
-- 
2.54.0


