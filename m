Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 981F7CA5FD4
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  1 Oct 2026 16:56:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:
	References:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:
	Subject:Date:From:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=cXHhwNQFJBdwB0YaZdtRbiU2a8J3H7er1d5nzMV3hgk=; b=JL/9/3Hj4AD7WRiArnmnHk/TXq
	PLvbPUGiJ1r9aoQwkF3es9+BTWHCUYaVqbyWoMgMg/ubMl1ljbOzgCltlTJuuhVYvaxoFltkmRawj
	8E/K1J1osrUMxX4f1e40ls2zw9iFI9UaoHUtAD3gNOJDOu+TwONdunFlNK+MKE+TD4SWAhQXp0bcU
	uIiYph5a/3NtoNbBJuZ09kSNIZrsQOckbgXbvso0uY0XXj23VPAlXBXqQYpJX2t7jS+Jm93Zjfp1R
	zNCON8QbO7xZA5L5Nw71tmKhipxKKONSIuwu0SlQMxSlEkNULR5PgElMCatU+sFtV1DmL4DEfw7I7
	oCXILWRQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xCK5A-00000009mry-1w6F;
	Thu, 01 Oct 2026 16:56:32 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xCK57-00000009moR-1jzu;
	Thu, 01 Oct 2026 16:56:29 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id B51AC60A52;
	Thu,  1 Oct 2026 16:56:28 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 617DDC4AF12;
	Thu,  1 Oct 2026 16:56:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1790873788;
	bh=9wSbdKsSPZMztqWcv2eAGWGwTSf1fvmTTyMWoLMeghw=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=J7N5ewHqP34SogezsdYJCVEAx9f45U2xwrAo9NAh1onfXEULgJjUX5GBXD04E11ZB
	 seBVu+fz/fOdSyKoFXN/LCWG5gRYQBwdT00KVs80CZ/tZzPVyqEjMUB24wuVoOKXdJ
	 zdTgXCK2C+b9wwlHRusujXOIvBIc0XqRB6iQFj8/pcuQzPLx0ICnoTmDxm/0Jrdw0C
	 ftjUgFPU4N/M8t3vgZJub4261249KjNyLudg+Am5WC1uKVqDz0nXg4jVR9ueC4zqFq
	 2svR8nBSMcXhRDT8jjEAQG9zXeZUBSLOxVJ+Zye1NTBlVOvgy/zHib8Pc3wLilh4/p
	 GrTE9R7Bbk3+g==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3FA03CA5FCF;
	Thu,  1 Oct 2026 16:56:28 +0000 (UTC)
From: Ronald Claveau via B4 Relay <devnull+linux-kernel-dev.aliel.fr@kernel.org>
Date: Thu, 01 Oct 2026 18:55:34 +0200
Subject: [PATCH v4 1/3] dt-bindings: pwm: amlogic: Add bus clock for S4
 like
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261001-add-t7-sys-pwm-clk-v4-1-8ed2b1e0cdfe@aliel.fr>
References: <20261001-add-t7-sys-pwm-clk-v4-0-8ed2b1e0cdfe@aliel.fr>
In-Reply-To: <20261001-add-t7-sys-pwm-clk-v4-0-8ed2b1e0cdfe@aliel.fr>
To: =?utf-8?q?Uwe_Kleine-K=C3=B6nig?= <ukleinek@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Heiner Kallweit <hkallweit1@gmail.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Cc: linux-pwm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-amlogic@lists.infradead.org, 
 Ronald Claveau <linux-kernel-dev@aliel.fr>, 
 Conor Dooley <conor.dooley@microchip.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=1948;
 i=linux-kernel-dev@aliel.fr; h=from:subject:message-id;
 bh=DajmJPOZU5T3SXCz0k6CFapeDP4KwjcTSjnqHfrN4Go=;
 b=owGbwMvMwCWm1SvKXP3cUInxtFoSQ9a+CRuS50VNubVQaV/S0nmPQ48emvfa5HK8UtD/tZknJ
 357vs8huKOUhUGMi0FWTJGlf67liXeXj575ukc9BWYOKxPIEAYuTgGYiDwfI8PCX4eY90VMeeA+
 +8DTCYv88v5FTmnY/uj3g6KZzwvDv7PpMTJc+7nr2vpanoZ0qcebeza1mPEkBMbZGEV+rt8rqP0
 +4QUzAA==
X-Developer-Key: i=linux-kernel-dev@aliel.fr; a=openpgp;
 fpr=DFD863F61375BF917F0012173953305EF1D0EC3E
X-Endpoint-Received: by B4 Relay for linux-kernel-dev@aliel.fr/default with
 auth_id=744
X-Original-From: Ronald Claveau <linux-kernel-dev@aliel.fr>
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
Reply-To: linux-kernel-dev@aliel.fr
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

From: Ronald Claveau <linux-kernel-dev@aliel.fr>

The T7, A1, C3, and S4 PWM controllers have a bus system clock in
addition to the two input clocks of channels A and B.

The channel clocks are acquired by index in the pwm driver,
where the bus clock is fetched by name, with optional get
which is silent when not provided.

Require clock-names and minimum 3 items for S4, and devices
which fallback to S4, where the PWM devices do not work
without all 3 clocks.

Acked-by: Conor Dooley <conor.dooley@microchip.com>
Signed-off-by: Ronald Claveau <linux-kernel-dev@aliel.fr>
---
 Documentation/devicetree/bindings/pwm/pwm-amlogic.yaml | 13 ++++++++++---
 1 file changed, 10 insertions(+), 3 deletions(-)

diff --git a/Documentation/devicetree/bindings/pwm/pwm-amlogic.yaml b/Documentation/devicetree/bindings/pwm/pwm-amlogic.yaml
index c337d85da40f1..6d01adcfe897f 100644
--- a/Documentation/devicetree/bindings/pwm/pwm-amlogic.yaml
+++ b/Documentation/devicetree/bindings/pwm/pwm-amlogic.yaml
@@ -62,7 +62,7 @@ properties:
 
   clock-names:
     minItems: 1
-    maxItems: 2
+    maxItems: 3
 
   power-domains:
     maxItems: 1
@@ -143,9 +143,15 @@ allOf:
           items:
             - description: input clock of PWM channel A
             - description: input clock of PWM channel B
-        clock-names: false
+            - description: Bus clock, gates register access to the PWM controller
+        clock-names:
+          items:
+            - const: channel-a
+            - const: channel-b
+            - const: bus
       required:
         - clocks
+        - clock-names
 
   - if:
       properties:
@@ -179,6 +185,7 @@ examples:
     pwm@1000 {
       compatible = "amlogic,meson-s4-pwm";
       reg = <0x1000 0x10>;
-      clocks = <&pwm_src_a>, <&pwm_src_b>;
+      clocks = <&pwm_src_a>, <&pwm_src_b>, <&pwm_src_bus>;
+      clock-names = "channel-a", "channel-b", "bus";
       #pwm-cells = <3>;
     };

-- 
2.49.0



