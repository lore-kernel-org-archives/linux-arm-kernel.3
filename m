Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2FFBACFC28F
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 21 Nov 2025 15:43:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=vd05fhfs2qIh00fsYfg5TZpdIMO9uBjqduJxogccVqo=; b=AVMiur5QwDraMv86DRqzRxu59q
	3N/zPpRbAXi/X1ZOFuQrCtoEwosrsMHk33Ezt8/GbHXLmYHVIaszNLh1Zut9kacujp3evTh4R6ne9
	9jhAk8mZfN+keoqdb1zgYUO1JuySWk7lco8JnVYUnNoVHRuHbWJ+jkh+kqzN6wuQTOz/gLEIDf3hq
	Ier29dl5Yt+lTRQvy8yxT1ei+qH4WFN7UpQMLfGex290PDlnx6RryZsQwqGz3Px9Bdfn8RM0OxUTT
	9BWd4mT1eD46oNbhGCWAyx9tzfPyBLlZj9awiCggMqWizy+J8TyPVnNo3qLK0b7g5DxYdCBDK826e
	NBJu53sQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vMTHj-00000008dE3-38av;
	Fri, 21 Nov 2025 15:42:55 +0000
Received: from smtpout-02.galae.net ([185.246.84.56])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vMTHb-00000008d9i-1pNk;
	Fri, 21 Nov 2025 15:42:50 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 3208B1A1C96;
	Fri, 21 Nov 2025 15:42:45 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 0707960719;
	Fri, 21 Nov 2025 15:42:45 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 038AD103721D4;
	Fri, 21 Nov 2025 16:42:42 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1763739764; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=vd05fhfs2qIh00fsYfg5TZpdIMO9uBjqduJxogccVqo=;
	b=gvolDSzwc4oz9CtQ9n9Ne+bvhUP9cWcSiXZQMTWfdlpF8D92vHrXO8g5UmdoKhbHoLiOzZ
	MUeEtzXz5+v7rMX9/zpl37C6JnoqmXL7LF2aBc6aux7vr3aabgLSqFT++fCEQiuqhwJSYF
	4L5sxyPcn0IGQVmP2C7SMNaPSD9VHmWlqbQWi2hp+E+hWKhNBpIgV3wRRUN0ECCC9BlE/D
	iOSNmc+iPYm16ZHpSVIWWV02HOSS7JgKeTOjwCzR35nqXf5/RcvcBJHTtOBFJc42cgEME1
	9UZWLLu+VKi6eK/hecmr5+rFspaYoaZDpKorHR+e5eCDjk5kyQXgRc7D3F6G8g==
From: Gregory CLEMENT <gregory.clement@bootlin.com>
Date: Fri, 21 Nov 2025 16:42:36 +0100
Subject: [PATCH v2 2/3] dt-bindings: mtd: physmap: Allow using
 memory-region to access memory resources
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251121-mtd-memregion-v2-2-c5535fdcebe4@bootlin.com>
References: <20251121-mtd-memregion-v2-0-c5535fdcebe4@bootlin.com>
In-Reply-To: <20251121-mtd-memregion-v2-0-c5535fdcebe4@bootlin.com>
To: Rob Herring <robh@kernel.org>, Linus Walleij <linus.walleij@linaro.org>, 
 Miquel Raynal <miquel.raynal@bootlin.com>, 
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 Vladimir Kondratiev <vladimir.kondratiev@mobileye.com>, 
 =?utf-8?q?Beno=C3=AEt_Monin?= <benoit.monin@bootlin.com>, 
 =?utf-8?q?Th=C3=A9o_Lebrun?= <theo.lebrun@bootlin.com>, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-mtd@lists.infradead.org, 
 Gregory CLEMENT <gregory.clement@bootlin.com>
X-Mailer: b4 0.14.3
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251121_074248_427290_D2998460 
X-CRM114-Status: UNSURE (   9.83  )
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

Enable access to memory resources not only via I/O address using reg,
but also through a portion of main memory using memory-region. To
achieve this, new compatible strings have been introduced: mtd-mem and
mtd-memro.

Signed-off-by: Gregory CLEMENT <gregory.clement@bootlin.com>
---
 .../devicetree/bindings/mtd/mtd-physmap.yaml       | 59 +++++++++++++++-------
 1 file changed, 40 insertions(+), 19 deletions(-)

diff --git a/Documentation/devicetree/bindings/mtd/mtd-physmap.yaml b/Documentation/devicetree/bindings/mtd/mtd-physmap.yaml
index 1b375dee83b0c..323e89aacaacd 100644
--- a/Documentation/devicetree/bindings/mtd/mtd-physmap.yaml
+++ b/Documentation/devicetree/bindings/mtd/mtd-physmap.yaml
@@ -13,10 +13,6 @@ description: |
   Flash chips (Memory Technology Devices) are often used for solid state
   file systems on embedded devices.
 
-allOf:
-  - $ref: mtd.yaml#
-  - $ref: /schemas/memory-controllers/mc-peripheral-props.yaml#
-
 properties:
   compatible:
     oneOf:
@@ -61,6 +57,8 @@ properties:
           - jedec-flash
           - mtd-ram
           - mtd-rom
+          - mtd-mem
+          - mtd-memro
 
   reg:
     description: |
@@ -116,6 +114,10 @@ properties:
     minItems: 1
     maxItems: 8
 
+  memory-region:
+    items:
+      - description: Memory regions to map into mtd
+
   '#address-cells':
     const: 1
 
@@ -129,21 +131,25 @@ properties:
 
 required:
   - compatible
-  - reg
-
-if:
-  properties:
-    compatible:
-      contains:
-        const: cortina,gemini-flash
-then:
-  properties:
-    syscon:
-      $ref: /schemas/types.yaml#/definitions/phandle
-      description:
-        Phandle to the syscon controller
-  required:
-    - syscon
+
+allOf:
+  - $ref: mtd.yaml#
+  - if:
+      properties:
+        compatible:
+          contains:
+            enum:
+              - mtd-mem
+              - mtd-memro
+    then:
+      required:
+        - memory-region
+      properties:
+        addr-gpios: false
+    else:
+      $ref: /schemas/memory-controllers/mc-peripheral-props.yaml#
+      required:
+        - reg
 
 unevaluatedProperties: false
 
@@ -223,4 +229,19 @@ examples:
             reg = <0 0x04000000>;
         };
     };
+
+  - |
+    /* An example using mtd-mem */
+    mem_logs: mem_logs@10000800 {
+        reg = <0x1 0x0000800 0x0 0x000f800>;
+        no-map;
+    };
+
+    memlog {
+        compatible = "mtd-mem";
+        memory-region = <&mem_log>;
+        bank-width = <4>;
+        device-width = <1>;
+    };
+
 ...

-- 
2.51.0


