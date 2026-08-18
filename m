Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3E805C5DF82
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 18 Aug 2026 18:34:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=h9jXpBBpw654DWT0EXGMe8PHXyENgl8j9ZoBhXENTas=; b=3WEn/GAWedgfELslDZGg20ID0C
	IH+PAmp/2aOqzd/JUQQu8j+UnKndKOQ8yyYToJoon/++BWmEj3pOww0k1F0QNsU97wB+j4CdfeaQk
	IPVweNLQOKlOiePhwghD/gKSuTeKmxh2TdY6jJep1tvMo0RqAGDKQkvMax+Mrb4WG0tUFgQyVMCm7
	T2E2rGT/y5URPa1pmgje3a3Ymlpm3e0j5/zRldYDLgqFFxyXjHT3OPADrR839VhZ30Vd5/KAn+Q8L
	tYuEsqW7N7TOioOPKuAxOLviv0yOxBeN4vWezjD60zrDLe691WzTbPHDvzvjr/NtpLVJinonbPL47
	E67pGGlg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wwOdC-00000008W76-2YOP;
	Tue, 18 Aug 2026 18:33:50 +0000
Received: from chaosmail.tech ([77.81.229.115])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wwOd5-00000008W3h-1QXN
	for linux-arm-kernel@lists.infradead.org;
	Tue, 18 Aug 2026 18:33:45 +0000
Received: by chaosmail.tech (Postfix) id AF84D1C87E8;
	Tue, 18 Aug 2026 18:33:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chaosmail.tech;
	s=mail; t=1787078017;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=h9jXpBBpw654DWT0EXGMe8PHXyENgl8j9ZoBhXENTas=;
	b=IIuTWpLKqT6+BAl6H5w+AuBIZO0VsRt1ajlV1r6mVbF69Vd3iFMIGBjKWQmygkJwjY6WDA
	xaE/yRb94mlixFxf59QmBSni1UpV7+exDruX9twPPn/xRKXw8UZ/10K57rjdcoKt0K9wqq
	2Z5L0jqAjCp79Jk99av8lqZj5Pgmu5w=
From: Sasha Finkelstein <k@chaosmail.tech>
Date: Tue, 18 Aug 2026 20:32:40 +0200
Subject: [PATCH v7 1/6] dt-bindings: spmi: apple,spmi: Add t603x and t8122
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260818-t603x-spmi-v7-1-dafebe6e7739@chaosmail.tech>
References: <20260818-t603x-spmi-v7-0-dafebe6e7739@chaosmail.tech>
In-Reply-To: <20260818-t603x-spmi-v7-0-dafebe6e7739@chaosmail.tech>
To: Sven Peter <sven@kernel.org>, Janne Grunau <j@jannau.net>, 
 Neal Gompa <neal@gompa.dev>, Stephen Boyd <sboyd@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: asahi@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, 
 Sasha Finkelstein <k@chaosmail.tech>
X-Developer-Signature: v=1; a=ed25519-sha256; t=1787078015; l=1733;
 i=k@chaosmail.tech; s=20241124; h=from:subject:message-id;
 bh=RawiKeaiQp0wVGU3iNXoclIB7Qsht14En8z5xGCZB6E=;
 b=soWJfG2qi7oTedu0c9ZXqdftjr+xco8nDOfoi6AEOlVklhqYazuoIyf4csjirwcc0yrveillB
 USMBLUvTZ90AmklyZVDQtiQ/om67/zSNTgD5HZtc4rziJ1+u0GXQnPl
X-Developer-Key: i=k@chaosmail.tech; a=ed25519;
 pk=aSkp1PdZ+eF4jpMO6oLvz/YfT5XkBUneWwyhQrOgmsU=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260818_113343_848270_CC393E98 
X-CRM114-Status: UNSURE (   9.35  )
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

Add t603x and t8122 compatibles, interrupt support, and support for
SPMI controllers that are not always-on.

Reviewed-by: Janne Grunau <j@jannau.net>
Signed-off-by: Sasha Finkelstein <k@chaosmail.tech>
---
 Documentation/devicetree/bindings/spmi/apple,spmi.yaml | 37 ++++++++++++++++++++++++++++++++++---
 1 file changed, 34 insertions(+), 3 deletions(-)

diff --git a/Documentation/devicetree/bindings/spmi/apple,spmi.yaml b/Documentation/devicetree/bindings/spmi/apple,spmi.yaml
index 3e5b14bc8c31..1d14025b44c5 100644
--- a/Documentation/devicetree/bindings/spmi/apple,spmi.yaml
+++ b/Documentation/devicetree/bindings/spmi/apple,spmi.yaml
@@ -20,8 +20,11 @@ properties:
       - items:
           - enum:
               - apple,t6020-spmi
+              - apple,t6030-spmi
+              - apple,t6031-spmi
               - apple,t8012-spmi
               - apple,t8015-spmi
+              - apple,t8122-spmi
           - const: apple,t8103-spmi
       - items:
           - enum:
@@ -34,9 +37,37 @@ properties:
   reg:
     maxItems: 1
 
-required:
-  - compatible
-  - reg
+  interrupts:
+    maxItems: 1
+    description: Optional, operates in polled mode if not present
+
+  interrupt-controller: true
+
+  "#interrupt-cells":
+    const: 2
+
+  power-domains:
+    maxItems: 1
+
+if:
+  properties:
+    compatible:
+      contains:
+        enum:
+          - apple,t8122-spmi
+          - apple,t6030-spmi
+          - apple,t6031-spmi
+then:
+  required:
+    - compatible
+    - reg
+    - interrupt-controller
+    - "#interrupt-cells"
+    - interrupts
+else:
+  required:
+    - compatible
+    - reg
 
 unevaluatedProperties: false
 

-- 
2.55.0


