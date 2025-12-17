Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 633FAD6408F
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 17 Dec 2025 08:25:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=x3b+xMraFqoaM2Sw2nhC5gdOxqmlP8rsrzs6PW+Y/W8=; b=mihIziqhTdNGFft7+nyUDdjKTb
	hlHoFThDnGqzUkHeRpC5ZoGN9T9p/FfuwqkusQgFZev7r2f7QEIu1qFKxYV/4JSnIzobW3Ime7i8K
	3ZqagTJzdsNeE76v8Wmll3p1awGrYTd92lNz9EKmTEl5AiRLuObInI/96YFTs6tKth/ebAYFJBKWI
	51+uxNsnJCT/tbtRy0Nf34CPWPQA/n6T1662YD3QHGvUTyZvcPgECoGoLqGKJ146drTyQd5n44zyl
	r0r1DZ9Xv43W5npXSEfKVLdtdsC759EOJKl3FwFAEk0/ot1JVmP5nA/cS3ww+N5DOU+giIieuA4oz
	WGyYia5g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vVmqc-00000006LLU-1D2z;
	Wed, 17 Dec 2025 08:25:26 +0000
Received: from smtpout-02.galae.net ([185.246.84.56])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vVmqa-00000006LKf-0eHS
	for linux-arm-kernel@lists.infradead.org;
	Wed, 17 Dec 2025 08:25:25 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id C1E731A2275;
	Wed, 17 Dec 2025 08:25:22 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 9698E6072F;
	Wed, 17 Dec 2025 08:25:22 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id BEF33119502E7;
	Wed, 17 Dec 2025 09:25:16 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1765959918; h=from:subject:date:message-id:to:cc:mime-version:
	 content-transfer-encoding:in-reply-to:references;
	bh=x3b+xMraFqoaM2Sw2nhC5gdOxqmlP8rsrzs6PW+Y/W8=;
	b=h+gdosi9m1kVDsbEQmxRUF/LDE/F1BxtfsDtAw1/OhIJh3SNytZDMXwZhUuV4VrQpuQ8li
	V2PrC75hkRITRlQIcC/e+iP+tvtHvuW+keg/hwxf+qZKAgbr6cRfmb49D15Et07m3b74N2
	c5gfjDE5Z/VPi1L2bRhalQyzh0WcL0qQmBH7Dy3XftiTr+B+TUc0r9t73V2uJug/EMrPOS
	82Ej4aJtQ5qBjfse/gBxo5YHMla0qYrf5Hz1rBe++zH/XV38A/rug/JYn4kYPZW1dzAw9f
	BzD28FjX7Mn0LMRRXjwtUN5Znpw15I+xWgLcpaaOLYjt+KUXROrwJfB2Iq3qYQ==
From: Richard Genoud <richard.genoud@bootlin.com>
To: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Chen-Yu Tsai <wens@csie.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	Philipp Zabel <p.zabel@pengutronix.de>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
	linux-pwm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Richard Genoud <richard.genoud@bootlin.com>,
	Krzysztof Kozlowski <krzk@kernel.org>
Subject: [PATCH v2 1/4] dt-bindings: pwm: allwinner: add h616 pwm compatible
Date: Wed, 17 Dec 2025 09:25:01 +0100
Message-ID: <20251217082504.80226-2-richard.genoud@bootlin.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20251217082504.80226-1-richard.genoud@bootlin.com>
References: <20251217082504.80226-1-richard.genoud@bootlin.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251217_002524_540442_6ED3941B 
X-CRM114-Status: UNSURE (   9.80  )
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

Allwinner H616 PWM block is quite different from the A10 or H6, but at
the end, it uses the same clocks as the H6; so the sun4i pwm binding can
be used.
It has 6 channels than can generate PWM waveforms or clocks if bypass is
enabled.

Suggested-by: Krzysztof Kozlowski <krzk@kernel.org>
Signed-off-by: Richard Genoud <richard.genoud@bootlin.com>
---
 .../bindings/pwm/allwinner,sun4i-a10-pwm.yaml | 19 ++++++++++++++++++-
 1 file changed, 18 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/pwm/allwinner,sun4i-a10-pwm.yaml b/Documentation/devicetree/bindings/pwm/allwinner,sun4i-a10-pwm.yaml
index 1197858e431f..4f58110ec98f 100644
--- a/Documentation/devicetree/bindings/pwm/allwinner,sun4i-a10-pwm.yaml
+++ b/Documentation/devicetree/bindings/pwm/allwinner,sun4i-a10-pwm.yaml
@@ -14,6 +14,9 @@ properties:
   "#pwm-cells":
     const: 3
 
+  "#clock-cells":
+    const: 1
+
   compatible:
     oneOf:
       - const: allwinner,sun4i-a10-pwm
@@ -36,6 +39,7 @@ properties:
           - const: allwinner,sun50i-h5-pwm
           - const: allwinner,sun5i-a13-pwm
       - const: allwinner,sun50i-h6-pwm
+      - const: allwinner,sun50i-h616-pwm
 
   reg:
     maxItems: 1
@@ -62,7 +66,9 @@ allOf:
       properties:
         compatible:
           contains:
-            const: allwinner,sun50i-h6-pwm
+            enum:
+              - allwinner,sun50i-h6-pwm
+              - allwinner,sun50i-h616-pwm
 
     then:
       properties:
@@ -83,6 +89,17 @@ allOf:
         clocks:
           maxItems: 1
 
+  - if:
+      not:
+        properties:
+          compatible:
+            contains:
+              const: allwinner,sun50i-h616-pwm
+
+    then:
+      properties:
+        "#clock-cells": false
+
 required:
   - compatible
   - reg
-- 
2.47.3


