Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 26969C44500
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  3 Jul 2026 15:22:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=BqvC2yx/KXHlGubZCqvTabKhIPS58HfTsaKa+4VD4mE=; b=svQws4e8sfzYydctB1mboGc/ze
	X1X9UrIt/JWoLLQM/dx5RKpRn2NyUcU2wfe1XgYzmuAyvnCv8m/NgBQfI/Xqcg3/kjW95LUoKSj6L
	uCb5Quy478X9RQIco0vs9JUdID6dx0OuWuvjgsVBIjPBkbTQ1wGWCHso+dTdVkkjTfYn/JfECxylu
	0tctEMpYcgTH7ZquKNUa9KK09rYKSP4g3IC85DR1r+CUrgkSad8lR4oyxLJdywk1EPe9bGbZo68/t
	EsvSwatZ/60cMPY1A4KysKEoBDYuXaRLb5iCzKat9wbNHJPB/0ZYBK0ULJg87ngFhbwFdO75wqIaw
	j+JNWrKw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wffix-00000007O7U-23JP;
	Fri, 03 Jul 2026 15:22:39 +0000
Received: from smtpout-04.galae.net ([185.171.202.116])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wffit-00000007O6F-3JbC
	for linux-arm-kernel@lists.infradead.org;
	Fri, 03 Jul 2026 15:22:37 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id 24320C49F5A;
	Fri,  3 Jul 2026 15:22:45 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 4B8F660300;
	Fri,  3 Jul 2026 15:22:33 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id D706F104C95A7;
	Fri,  3 Jul 2026 17:22:28 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1783092151; h=from:subject:date:message-id:to:cc:mime-version:
	 content-transfer-encoding:in-reply-to:references;
	bh=BqvC2yx/KXHlGubZCqvTabKhIPS58HfTsaKa+4VD4mE=;
	b=oSODphXomibp+TUxLrQmAeYTh5i0K4SdRCS4zyjWbPO4z3ORH6U51nlhJKotPiBw8d6qsO
	EHvkAD7s6jvi4MMZ1ImZ583gEy4uY7OnXFJlE4tY62mVgVVD6oe980Tyu/RTNjplgIAwPy
	7GZNDsq7Ux//A7NGf8W5Y9aJOJGNYkNCub1C2flqpkusr5cClK+s11LDJlYbfBxSTArjZb
	4Xbf+iFSsJkKy1eEY3oIR71sa/YWJkxuS2rA73eJO6dFS1c3lTcNJ0C3Ii4lrbwei7KFez
	tWHGmFnrPNaqHgIZJAXzU1OxEDMhZ4TnIkvhrvs61fAS8ifkc9QdCyofEdf75w==
From: Richard Genoud <richard.genoud@bootlin.com>
To: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <ukleinek@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Chen-Yu Tsai <wens@kernel.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Brian Masney <bmasney@redhat.com>
Cc: Paul Kocialkowski <paulk@sys-base.io>,
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
	John Stultz <jstultz@google.com>,
	Joao Schim <joao@schimsalabim.eu>,
	bigunclemax@gmail.com,
	linux-pwm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	linux-clk@vger.kernel.org,
	Richard Genoud <richard.genoud@bootlin.com>,
	Conor Dooley <conor.dooley@microchip.com>
Subject: [PATCH v7 1/4] dt-bindings: pwm: allwinner: add h616 pwm compatible
Date: Fri,  3 Jul 2026 17:22:12 +0200
Message-ID: <20260703152215.192859-2-richard.genoud@bootlin.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260703152215.192859-1-richard.genoud@bootlin.com>
References: <20260703152215.192859-1-richard.genoud@bootlin.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260703_082235_997060_CF30332B 
X-CRM114-Status: UNSURE (   9.50  )
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
It has 6 channels than can generate PWM waveforms.
If the bypass is enabled (one bypass per channel) the output is no more
a PWM waveform, but a clock that can (and is) used as input for other
devices, like the AC300 PHY.

Acked-by: Conor Dooley <conor.dooley@microchip.com>
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


