Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EF3C6D41176
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 15 Jan 2026 11:41:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=9HFCj5ztGvyCwGgMLXoFCMYjN9FIM/YL2Od2IwlkeWA=; b=p+ScqXZT3lIyzGfaQbzBSrzD34
	zXd1xdsfbmER/DpcMGLbhoLs0hJjtkOLQuDcxC9tLbl26NFcq0cH3aTmkem6wD+QVoJy0xfI1rxU4
	IF+Hm6/3Im97RIUm5xJ1dEKf+BFACrLKujalsOzb6M9YB5B5wWdDegapksACJ12QzEZ4qIEwEWGPI
	x70J1y7uieDd/y+jRwmHIniV91bcwh0G+ipJwU0aK1SJPtBN1RIyMWkdqpzN4QpZl+FPtfE2d7X6M
	1g8S0MtRlQ9N79eg+584Ybi63ftEI+27L9KVztA5UllZ8Tnb+qSi+zLMbtXu5+eDLyxfqWAXWi1Aq
	oxAbsNEQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vgLjF-0000000CFN8-1jpl;
	Thu, 15 Jan 2026 11:41:29 +0000
Received: from mail-dl1-x1235.google.com ([2607:f8b0:4864:20::1235])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vgLjD-0000000CFLi-01Ds
	for linux-arm-kernel@lists.infradead.org;
	Thu, 15 Jan 2026 11:41:28 +0000
Received: by mail-dl1-x1235.google.com with SMTP id a92af1059eb24-1233b172f02so964589c88.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 15 Jan 2026 03:41:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sartura.hr; s=sartura; t=1768477286; x=1769082086; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9HFCj5ztGvyCwGgMLXoFCMYjN9FIM/YL2Od2IwlkeWA=;
        b=GjXt2aqXRWfXsS9Zd4hxvkIB6PMIJtBTljlLiuqZDsfwH4/g5et5lr1+IMeHjNJUNA
         p0QtpTGPRoZu/5bdkifitFiL2L8reONqGVEfLbg3ykBOBRdxghHNgkwigMKpcpbhd6Vi
         1+eu6OzZ3jyJwDMy7hVm/aVpsPEVvR4aJqWpv17G4IcJen12Y31tfx7x6AomGKriMH9Y
         2Zm6ZkW1CuXi8Mmj17HMUr3vR7I65CYvtDOdukRjqNsVT/Y/6xP4XRPT+j1GIewM5E9x
         ra5Eduah96bKV6dQmSURNoJhmhO+Jcu5NaY0tqJuWxswM/hYNyuTOmUUAaYNyiFEa/VM
         /p/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768477286; x=1769082086;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=9HFCj5ztGvyCwGgMLXoFCMYjN9FIM/YL2Od2IwlkeWA=;
        b=F0DrEeyRS3EydLP+7CN+7kRVmhg71uWnyQYLjoFOhVL/7chrsQB6jrSB/EvnutOdKZ
         oAUo1M0btn/pWXZq99BxMpNi5iWTEXz9JTLZL0jRGhfb4k7w+BXevcOGNqx+PoMGhOpQ
         6TLdXWT+4TPVY5HnzRJRbnzxm0BBMtkn7lozqjvzmQemoT0tRQn9efXDQ4W5e3G+l4Gz
         qnRMyZVvfbCDNjuoWD5GAPmlQuaMHKykadkUtzhmtq57ZOrNUxABRH8kyQrhkWeFqGYZ
         gGptGZwiEqVPPJTebquYtvO26k7wkm0k2qTj+8gYr6TIQ83CQpaINS50+uYSR7ghtpJR
         M++g==
X-Forwarded-Encrypted: i=1; AJvYcCXmAxOCELfpZQHWpGPySUQOCoIUnDb0Y0ltB/R361dfF7ZlC9zipfzDeIkCvJB3tpDniPdJufgf2KOTfdklZ6nv@lists.infradead.org
X-Gm-Message-State: AOJu0Yz4rRi2/8UhYlcuPc3NLjboFrCDgSfDnsNYx72/hkcb/0yPJ/dD
	z3ozasd+jYeXz9OMvGyGCxsO32QdZBLpc5GD82jJI8zgTCpNoARo/0lqAqJx/YxxsLM=
X-Gm-Gg: AY/fxX7613dxxPlyJxihDkEkqkThcBtk15sGhAJkkiJFARwmhnWUlV303Hm8dI18k7f
	VsPz/loYuFeLpcI+cx78fvM5m+srxkWio/9tBgWvGQVpFveyVy5YC0cn45ndNG9dIwqdXOqCiNF
	HF6QLgbFGBHZZBQfRHOK6IsY3slBqMwlrZK3jdHlx/Tp0+j1yIRDQRE21rULhGwXhHyFGHKbZE7
	lnRgakNFKRj2dUZFmfn3XJeZe8xoB5pypXDajtJlK8KPy0GRRipZ8N3HGFUGWbipIpg9BMu8UOc
	COtzHKwewbySdRHH+2ZnFh9bww3Qyjuwoeeldu9GUoJJcN0CiFJLQCLOWTCRizXn+RjNGa8gfE+
	5lTskQ6oDSMLgyhy7h0k2W++HB5dcJ+mLoAX9yihKV1FUCcIuc7KJo985BcEvvSp95mumEgSWcb
	GImyvne4LKs1LSYEQ9a04RPSKYRKPdm5mazMqAKSsrAbUi7nP/PQEOJzNW/REun3MHkt6PFlh5+
	cVrcZeL
X-Received: by 2002:a05:7022:1719:b0:123:35c4:f39c with SMTP id a92af1059eb24-12336a67900mr5434114c88.26.1768477286121;
        Thu, 15 Jan 2026 03:41:26 -0800 (PST)
Received: from fedora (dh207-14-52.xnet.hr. [88.207.14.52])
        by smtp.googlemail.com with ESMTPSA id a92af1059eb24-123370a051esm4875347c88.15.2026.01.15.03.41.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 Jan 2026 03:41:25 -0800 (PST)
From: Robert Marko <robert.marko@sartura.hr>
To: robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	nicolas.ferre@microchip.com,
	alexandre.belloni@bootlin.com,
	claudiu.beznea@tuxon.dev,
	herbert@gondor.apana.org.au,
	davem@davemloft.net,
	lee@kernel.org,
	andrew+netdev@lunn.ch,
	edumazet@google.com,
	kuba@kernel.org,
	pabeni@redhat.com,
	Steen.Hegelund@microchip.com,
	daniel.machon@microchip.com,
	UNGLinuxDriver@microchip.com,
	linusw@kernel.org,
	olivia@selenic.com,
	richard.genoud@bootlin.com,
	radu_nicolae.pirea@upb.ro,
	gregkh@linuxfoundation.org,
	richardcochran@gmail.com,
	horatiu.vultur@microchip.com,
	Ryan.Wanner@microchip.com,
	tudor.ambarus@linaro.org,
	kavyasree.kotagiri@microchip.com,
	lars.povlsen@microchip.com,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-crypto@vger.kernel.org,
	netdev@vger.kernel.org,
	linux-gpio@vger.kernel.org,
	linux-spi@vger.kernel.org,
	linux-serial@vger.kernel.org
Cc: luka.perkov@sartura.hr,
	Robert Marko <robert.marko@sartura.hr>,
	Conor Dooley <conor.dooley@microchip.com>
Subject: [PATCH v5 06/11] dt-bindings: pinctrl: pinctrl-microchip-sgpio: add LAN969x
Date: Thu, 15 Jan 2026 12:37:31 +0100
Message-ID: <20260115114021.111324-7-robert.marko@sartura.hr>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260115114021.111324-1-robert.marko@sartura.hr>
References: <20260115114021.111324-1-robert.marko@sartura.hr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260115_034127_046547_CD4C96C6 
X-CRM114-Status: UNSURE (   8.93  )
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
Reviewed-by: Claudiu Beznea <claudiu.beznea@tuxon.dev>
---
Changes in v5:
* Pick Reviewed-by from Claudiu

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


