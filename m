Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 44CFEF9D0F4
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 14 Apr 2026 19:54:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=aIpZ1KwOXCQcdsq/gACxs/fuFamyUr0HrBoVABImBLU=; b=wkNKvZ2operZwGy6UUoXYF3UIM
	yYXXS5DN3SR8S8Sjov4UDbLZdFuoC3z7h/sUjEfHLXrUPYDb3jsBM1/IIZZHRKm1GkmnSQWrHKsR+
	qVki7wTdsDYGqS0IK57i+vqh/hg2xW7lVDhvSL5WyvdA3yXiez0fEQhUsFpHnVKDsQWYV7mJGHPNz
	VE5lGPjU+bteVUA8hJb41CQQIoPzNyRyKyzl9xZyDsB2MHOBSFzl5C1qKyYFDBmZO+iYU/w3jAyal
	OaNj/ucfYNMcPv2De87+8yGijpRKDm3k3xIWeBhCBpwHDLPDBXFlMr/bmL/Snfv04gxcjt7Kb+Ny+
	BWON430g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wCjpy-00000000AAc-3EDe;
	Tue, 14 Apr 2026 19:54:18 +0000
Received: from mail-wr1-x42c.google.com ([2a00:1450:4864:20::42c])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wCjpv-00000000A90-0uzu
	for linux-arm-kernel@lists.infradead.org;
	Tue, 14 Apr 2026 19:54:16 +0000
Received: by mail-wr1-x42c.google.com with SMTP id ffacd0b85a97d-43d7650202fso2073576f8f.2
        for <linux-arm-kernel@lists.infradead.org>; Tue, 14 Apr 2026 12:54:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776196453; x=1776801253; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=aIpZ1KwOXCQcdsq/gACxs/fuFamyUr0HrBoVABImBLU=;
        b=qAVr/TFQPZ0cLzcXMOTvBrkCSATu6rsR8OsbPQedzno+c8yz3UNmQxcIJth+5D2mBP
         e2uruSV9QQeOewRsfP2t/j+N9ukmYiTpNciwgJeC0pUbWSNCP7rVmqK4b4BslkTcDTSv
         rVpR2blBNL7M8y1ExwoMiCvadIxZ+MdALQbDlx7AKbrHWkooXW4Lb8S6SWAOQ2FSYpTm
         shFKUirEGtJtAi29LefZyrQcyzRwiOWv7RxgkhoF/YOW7SOBzySTAkaKFgPnJz951WXk
         K9Luo3rKnviRiQcJLc5OAZ/semNdfnTiJ5e+la1y8fMgxaNFBPasiowjPp5E3NSafeoK
         uOxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776196453; x=1776801253;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=aIpZ1KwOXCQcdsq/gACxs/fuFamyUr0HrBoVABImBLU=;
        b=lrZDzUCafz5PRgyoqoOnHJJKUZk1OjriXMg0w5XghVBnX1x72Wph1srkYE2/uYPPRs
         hrjXLbgudO4ju7C6C9ZgmTUenbPei56QcKzBxbQRyQcNi1DhTJbEJ0NcyLt1puGKzJeN
         meFqLNREe0GKbUCDjThgQa6InzokBVGOR60vwUt+rOYmAR5jdNayXZyt0ZIZh/ufb1Ap
         ylqHZ+7/mrwxugOi3IamPMTL9qw1ppaMsJLpvSOOvHGzLW4vqXOKtZkzjtdK3OK0uiUL
         kIw7Lf5n6w2QfRNJxD46wKoPOjmAIuwqzynwBVePEmptOoUDanlsx34/EZbTbLqvnrDQ
         q/wg==
X-Forwarded-Encrypted: i=1; AFNElJ8K7Td8oXyO7oEX5ArfLjbBt0ldcE++pHdy5lApTOX2cgEe6Aw3aHT0Cqc7mMIoxD5hmM5mvFIgJn6TzWgLVWHD@lists.infradead.org
X-Gm-Message-State: AOJu0YwrV3R/kC1sy3fzXQvKKjvIuTw/boBac6z0kH4WauYGrpHLww5a
	5hOwqyHrFOguzG7G+AIM58XiDOAiAcUOI5KYcdgBnCZbW6jzdFtB0iiv
X-Gm-Gg: AeBDies4OQbAXwWH2lBV2aGkqskjnXFwugeCiqXCqRaSflprup1MfeLDeK2SViKYRJo
	H6UlcMqYef5M5yVBm27WYWbDywXKEuhCKZe2N1P+TtnalprB468z2JbRmlz01Py6TsdPvD6Klnx
	15w/EJDSbwCFziPvzZ5JqMCU6Y2mflcTD70fejzQfWn8t7uGGKKe9CfC2dIN2sdApouFdiIrs9t
	tVvrG7W5DXXi4WV2OcF3DztvPmPpuUp06alBklu0R6ddgap+htShULMvBYgRdtwCnY4B3kn6sdt
	FSXApC+e3RFhQEwMYzI/Lq5ccADTaA3PwXoBy3wSK5K3OmHxhjzl1o12w3/fHEAcs+f4WRyod8k
	o/3kfSOf7OGEReX25ZdNMydnyEUXy3AjKmAk0sXkeqOX0Tyscoc4Dxc6Veo8Yetdv6IvaH07eFd
	9RaamWKl9LATG5RF2s8TT7Bq9NA8jvtZhQZf+cfnMsAVi4mHB1195Ks4HhziXiIq+8Laxbd0xyk
	GJhwt92uOdKQJ7IBwjLzi8=
X-Received: by 2002:a05:6000:1786:b0:43d:7722:ec05 with SMTP id ffacd0b85a97d-43d7722f1bdmr15810868f8f.8.1776196453250;
        Tue, 14 Apr 2026 12:54:13 -0700 (PDT)
Received: from [127.0.1.1] (93-143-58-160.adsl.net.t-com.hr. [93.143.58.160])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43d7400708dsm25595266f8f.25.2026.04.14.12.54.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Apr 2026 12:54:12 -0700 (PDT)
From: =?utf-8?q?Duje_Mihanovi=C4=87?= <dujemihanovic32@gmail.com>
Date: Tue, 14 Apr 2026 21:51:50 +0200
Subject: [PATCH 1/4] dt-bindings: clock: marvell,pxa1908: Add #reset-cells
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260414-pxa1908-clk-reset-v1-1-94bae5f3a8cf@dujemihanovic.xyz>
References: <20260414-pxa1908-clk-reset-v1-0-94bae5f3a8cf@dujemihanovic.xyz>
In-Reply-To: <20260414-pxa1908-clk-reset-v1-0-94bae5f3a8cf@dujemihanovic.xyz>
To: Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: Karel Balej <balejk@matfyz.cz>, linux-arm-kernel@lists.infradead.org, 
 linux-clk@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, phone-devel@vger.kernel.org, 
 ~postmarketos/upstreaming@lists.sr.ht, 
 =?utf-8?q?Duje_Mihanovi=C4=87?= <duje@dujemihanovic.xyz>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1567;
 i=duje@dujemihanovic.xyz; s=20260328; h=from:subject:message-id;
 bh=BP5R8FC0EJnxLApQpaXSZEWsmn62r66uFEV2C/KCEqY=;
 b=owGbwMvMwCW2z0j3+uHIyKOMp9WSGDLvzU5kk19Q6f9Oed3e5NN7fN78Vj66ocpzyxLjw5f5N
 13f4P1NoaOUhUGMi0FWTJGFeancJb7U8IkORbZJMHNYmUCGMHBxCsBE7FwY/js+uC+51Ywjbtls
 0RLNJ/tPm77RCL7zUDHs9ROV61LtRosYGdYUulnavbrP/MfxxR7m9bllPQqe8ltdp0RI6blrta6
 exQUA
X-Developer-Key: i=duje@dujemihanovic.xyz; a=openpgp;
 fpr=9BD463017690089DAA8DC266275F544B3B1B4792
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260414_125415_284999_261C8C6E 
X-CRM114-Status: UNSURE (   8.35  )
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

From: Duje Mihanović <duje@dujemihanovic.xyz>

The APBC and APBCP controllers have reset lines exposed. Give them
a #reset-cells so that they may be used as reset controllers.

Signed-off-by: Duje Mihanović <duje@dujemihanovic.xyz>
---
 .../devicetree/bindings/clock/marvell,pxa1908.yaml | 34 +++++++++++++++-------
 1 file changed, 24 insertions(+), 10 deletions(-)

diff --git a/Documentation/devicetree/bindings/clock/marvell,pxa1908.yaml b/Documentation/devicetree/bindings/clock/marvell,pxa1908.yaml
index 6f3a8578fe2a..0db5504013d5 100644
--- a/Documentation/devicetree/bindings/clock/marvell,pxa1908.yaml
+++ b/Documentation/devicetree/bindings/clock/marvell,pxa1908.yaml
@@ -37,6 +37,9 @@ properties:
   '#power-domain-cells':
     const: 1
 
+  '#reset-cells':
+    const: 1
+
 required:
   - compatible
   - reg
@@ -44,16 +47,27 @@ required:
 
 additionalProperties: false
 
-if:
-  not:
-    properties:
-      compatible:
-        contains:
-          const: marvell,pxa1908-apmu
-
-then:
-  properties:
-    '#power-domain-cells': false
+allOf:
+  - if:
+      not:
+        properties:
+          compatible:
+            contains:
+              const: marvell,pxa1908-apmu
+    then:
+      properties:
+        '#power-domain-cells': false
+  - if:
+      not:
+        properties:
+          compatible:
+            contains:
+              enum:
+                - marvell,pxa1908-apbc
+                - marvell,pxa1908-apbcp
+    then:
+      properties:
+        '#reset-cells': false
 
 examples:
   # APMU block:

-- 
2.53.0


