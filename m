Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E84A6CCD18D
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 10 Oct 2025 08:41:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=SMfQgmaA+NDyDK7Ueg4chV0xd3SWz/9HItTT1xnJps0=; b=1OgV5ZH1kn1+NVM7fe17sAv0Ns
	xVYHdiy8vwOoo8oZ9rSqqJaAsmDtHaTeSAuoHCBb5l9oq1vMjIwePuym91TF1nZTh17DMaGzW5i/H
	wEa1ECmaj+o8zg6VNTIfyT8qWwh4Q1GZccELCnpkqP5aWmAD3RKsDU01g34gFkhieQ/Du6z3dkzSg
	hYQX7wh+wFfpqBtUpmECpWhUId6Gw7ELWm3JmanTKrYUgdw0l3HwahNWss71lRXhv2KseAJb8Fh3C
	pYx2ooW8dUyVVG8bD07awU3XU8gqUa9ZGaBdRpenXSBJAO+FMs+1hK1OALpStzm9R0tRD8/pJ09gV
	oofrbGwA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v78h2-000000081O2-2W9n;
	Fri, 10 Oct 2025 08:41:40 +0000
Received: from smtpout-02.galae.net ([185.246.84.56])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v78gx-000000081KZ-21b3;
	Fri, 10 Oct 2025 08:41:38 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id F26301A127C;
	Fri, 10 Oct 2025 08:41:33 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id C75BF60667;
	Fri, 10 Oct 2025 08:41:33 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 9A0E1102F21F6;
	Fri, 10 Oct 2025 10:41:29 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1760085692; h=from:subject:date:message-id:to:cc:mime-version:
	 content-transfer-encoding:in-reply-to:references;
	bh=SMfQgmaA+NDyDK7Ueg4chV0xd3SWz/9HItTT1xnJps0=;
	b=Eu+WCS4l5FJHzORvSabLRwRjqt5rE+kCTzrjWvEoazmBb6vd0C+muL/EvqJHX07680Mhiw
	YBT6JH0YZUN/K+/uW4jtWdDu/Q3t3AJQlnX1MmKWH86xYLL2zSBEGL6EWaK5Hp7QVTpZxA
	E/HY8ljBCG4YQn3oxdeR+OfH51zM0Ucgc2Ha3pgVeJdL32+d9pQqYjdSEmDu9yg/PWlpOB
	H9jTgX4q+NKq+/JWXKDgNYYuLUTyNhJSBeLnahyskGbsU1GsP+3ErGnVgLDA7QDOCGOjKz
	9Yns8KZFkbH1NkU74YPbPHiLU+Qf9id8zFMD8BIlpV7F6JLDxl3S1G4PA/IeKA==
From: Richard Genoud <richard.genoud@bootlin.com>
To: Miquel Raynal <miquel.raynal@bootlin.com>,
	Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Chen-Yu Tsai <wens@csie.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>
Cc: Wentao Liang <vulab@iscas.ac.cn>,
	=?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
	linux-mtd@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Richard Genoud <richard.genoud@bootlin.com>
Subject: [PATCH 02/15] dt-bindings: mtd: sunxi: Add new compatible
Date: Fri, 10 Oct 2025 10:40:29 +0200
Message-ID: <20251010084042.341224-3-richard.genoud@bootlin.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20251010084042.341224-1-richard.genoud@bootlin.com>
References: <20251010084042.341224-1-richard.genoud@bootlin.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251010_014135_649300_10073482 
X-CRM114-Status: UNSURE (   7.67  )
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

The H616 NAND controller is quite different from the A10 and A23 ones,
some registers offset changed, and some new one are introduced.
Also, the DMA handling is different (it uses chained descriptors)

So, introduce a new compatible to represent this version of the IP.

Signed-off-by: Richard Genoud <richard.genoud@bootlin.com>
---
 .../mtd/allwinner,sun4i-a10-nand.yaml         | 56 ++++++++++++++-----
 1 file changed, 43 insertions(+), 13 deletions(-)

diff --git a/Documentation/devicetree/bindings/mtd/allwinner,sun4i-a10-nand.yaml b/Documentation/devicetree/bindings/mtd/allwinner,sun4i-a10-nand.yaml
index 054b6b8bf9b9..cc63091fe936 100644
--- a/Documentation/devicetree/bindings/mtd/allwinner,sun4i-a10-nand.yaml
+++ b/Documentation/devicetree/bindings/mtd/allwinner,sun4i-a10-nand.yaml
@@ -6,34 +6,64 @@ $schema: http://devicetree.org/meta-schemas/core.yaml#
 
 title: Allwinner A10 NAND Controller
 
-allOf:
-  - $ref: nand-controller.yaml
-
 maintainers:
   - Chen-Yu Tsai <wens@csie.org>
   - Maxime Ripard <mripard@kernel.org>
 
+allOf:
+  - $ref: nand-controller.yaml
+
+  - if:
+      properties:
+        compatible:
+          contains:
+            enum:
+              - allwinner,sun4i-a10-nand
+              - allwinner,sun8i-a23-nand-controller
+    then:
+      properties:
+        clocks:
+          items:
+            - description: Bus Clock
+            - description: Module Clock
+        clock-names:
+          items:
+            - const: ahb
+            - const: mod
+
+  - if:
+      properties:
+        compatible:
+          contains:
+            enum:
+              - allwinner,sun50i-h616-nand-controller
+    then:
+      properties:
+        clocks:
+          items:
+            - description: Bus Clock
+            - description: Module Clock
+            - description: ECC Clock
+            - description: MBus Clock
+        clock-names:
+          items:
+            - const: ahb
+            - const: mod
+            - const: ecc
+            - const: mbus
+
 properties:
   compatible:
     enum:
       - allwinner,sun4i-a10-nand
       - allwinner,sun8i-a23-nand-controller
+      - allwinner,sun50i-h616-nand-controller
   reg:
     maxItems: 1
 
   interrupts:
     maxItems: 1
 
-  clocks:
-    items:
-      - description: Bus Clock
-      - description: Module Clock
-
-  clock-names:
-    items:
-      - const: ahb
-      - const: mod
-
   resets:
     maxItems: 1
 
-- 
2.47.3


