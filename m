Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AACFBCA0EFF
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 30 Aug 2025 10:33:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=xXv42D6IasHB/AaS0CVhCn6HxB1qNyKePPGDfeN311k=; b=RNg5xJGZ3RpCuiMly3LonKDK49
	hvncx9gRdMrTsOIN4WtqUx5aWpxVMos1t5fZWTTr/Y3pJwNF7TsMVqD4DIXTkYulqRa8XdrARLFb7
	Gfs+XapSBhp+z02IZswTJX6oLchjLlT19t6jOYyOTu8TDHorCcazJdMc0+b2P210q7G05dx1/7/Rq
	fs4UMlc4Ub9q+OrqYY8InJu30+Rb2nnrlYh1ATDM2YuUAEpBGCrou0dm9tETbme+m57EGNmhEm91Y
	ZSnIsov97uSpeUqG5S49RPNvZfXnS3+hGFwe+mCYdjRWF02/KoTSkrMHMUC6IZ54yWOCuOb1H2C95
	zI/u96Bg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1usItR-00000007kMx-1q8D;
	Sat, 30 Aug 2025 10:33:09 +0000
Received: from mail-wm1-x32c.google.com ([2a00:1450:4864:20::32c])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1usIfx-00000007jIt-190m
	for linux-arm-kernel@lists.infradead.org;
	Sat, 30 Aug 2025 10:19:14 +0000
Received: by mail-wm1-x32c.google.com with SMTP id 5b1f17b1804b1-45a1b0ce15fso3213235e9.3
        for <linux-arm-kernel@lists.infradead.org>; Sat, 30 Aug 2025 03:19:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1756549152; x=1757153952; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=xXv42D6IasHB/AaS0CVhCn6HxB1qNyKePPGDfeN311k=;
        b=J6s8MpdmEAQ/PiioAmHQrOZhJkJMydm7aHtzh2vmZwN7wCJf8+v29hVmfVEVUTNdOk
         HBb8UWNRUiwCmwabYuAGkCiAjgImEjMA+C8Rc9KIZa9sYTZwcQVoRqGoSGbn+kBrZW3G
         kYHPzpI6fYGv6tN1Un7PC4K6qhdhPztaE/Rijgpb372ldgrPtUN4VJhItqdl7dtEUmwv
         2PoNoOzsQQMMIIWw0RqLzl5/46tlxWAadmumLujkAigQhXzm3OgQ2N9wquBGFXcAcPAA
         9i4cxnPnspJP38+Rxv2VQvlWxHla0dFcfSDnBByNk5ptIspcf/y+p2G9dMWDiHZAdS1u
         fAMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756549152; x=1757153952;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=xXv42D6IasHB/AaS0CVhCn6HxB1qNyKePPGDfeN311k=;
        b=rEDS70sjd36LiKx4KzfrTzrpc6Ln9whdzQjbZKAi8QfZzqwV005J+tOsH6jmRK8SzY
         F/vttvVLqpJjySPY7wuqIAfE9iID0UGcNWjQCxKOo7ofBPlr6ioSr1OqZNPFjIV6P6i7
         kD+Ok//1w1TnvNnIETkI/XB+OcPjd6jI1Q/s1l1wC7cxpSHtQ2y+HS+RGC4cJ5bwt4dA
         TEB3vcZdnF7Gm2nqKKaa7dqUvlxjW9DGIb1JwLI1J20k8CAa/lg74nBJo/wc8STbjMDB
         bE5s45l/5cc4l0PJXyfyWhhoWerytSASI0ZKD6Xsm02XfPh9ggI5m9pv1e5otHx93apY
         mGog==
X-Forwarded-Encrypted: i=1; AJvYcCWIrGGNhvIsWGQG1fsLG9J+hFjCZ5SnlFCkCkC+fDJd0d7nsNxsvYNiUl06vCgo+P1oro98q4LXFG36CZukcVtj@lists.infradead.org
X-Gm-Message-State: AOJu0Yz46wsIZJT8VXwJi96w4ntYgxnd+ER/f7pAp+1RoyVzG+ZJHaYc
	RudRLd5tIHG4WjJf51SFOoeYgIE5V4HS4nna0rky3j1gqw1bIYrpbi99htZGUCLL7FU=
X-Gm-Gg: ASbGncvzbyF28H4t3R+TnA8NyX8Xpgyt7qIu0fsLMdZS8Xhebn7KQ04DXvG922DqXhG
	pctFQFUNc+W8PF+Adag7TcOQ80eK1ZkF7wyfj2Wn7pqZhKvb948Frr5evYR/IAv+XLbovx+vXUS
	930O2WP2Yp47S2lx0DQoO6nirAGyGHoHWQifbv593ZVb2LZpDtGHNwyjXr31dgofjSxQdE89dOr
	Rf39eV/Pb+/BFal0BKjkXoJp7l+86+iE+Ipby6wtvyBbgFrfwE32+LJlb3qYYjzZ6tKlYxB6tAQ
	VgbiQXz1dXN0wQNWu47aQUfSwI3GM99vNkYSNG61R3/55+lO1OPdnbHcFujcfW+JSEE3ivm87RV
	HiIQfOWjcSyq/p5Ml32aC2H4ehvHw/vbWx3C3q+8CABEjVKlqRw==
X-Google-Smtp-Source: AGHT+IFLBqkvSILcmyvRV7c8Yxt6Oeamg/J6CxZ30pz6zRS3XCq3IAwZdXSdCt7ZFipQzams4ailVQ==
X-Received: by 2002:a05:600c:3ba6:b0:439:88bb:d00b with SMTP id 5b1f17b1804b1-45b81f23df6mr19954015e9.5.1756549151588;
        Sat, 30 Aug 2025 03:19:11 -0700 (PDT)
Received: from [127.0.1.1] ([178.197.219.123])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3cf276c8eccsm6547492f8f.20.2025.08.30.03.19.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 30 Aug 2025 03:19:11 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Date: Sat, 30 Aug 2025 12:19:00 +0200
Subject: [PATCH 4/4] dt-bindings: watchdog: samsung-wdt: Split if:then: and
 constrain more
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250830-watchdog-s3c-cleanup-v1-4-837ae94a21b5@linaro.org>
References: <20250830-watchdog-s3c-cleanup-v1-0-837ae94a21b5@linaro.org>
In-Reply-To: <20250830-watchdog-s3c-cleanup-v1-0-837ae94a21b5@linaro.org>
To: Wim Van Sebroeck <wim@linux-watchdog.org>, 
 Guenter Roeck <linux@roeck-us.net>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Alim Akhtar <alim.akhtar@samsung.com>
Cc: Krzysztof Kozlowski <krzk@kernel.org>, linux-watchdog@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=3834;
 i=krzysztof.kozlowski@linaro.org; h=from:subject:message-id;
 bh=X4WEqjDsxEfbxQW5piC8N1hdhc/VRxO6TIqCp9uqtgU=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBostAW/yJv5XJd7fLze1+/dmluWrrNtXl9d1W6K
 Jo9u6soSDeJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCaLLQFgAKCRDBN2bmhouD
 1/LxD/wLNsNpbl5CvNPmAKy0p6N2E3ZHvQjlbWti4Bu+yHut5d2rMIMj9iGBSrXxgY9UE1876Lr
 ci6HXpPWV6XIG+OJfat4fqZghFLEkxUFuI95WgCe3rUmYy33aSu8h4S8+qN83lfcJJXLMZHKbNI
 dUs2vV/UIMfVeRmtfkbWRK4SVazimfKQ++VXW8LYAGiE1/XY8fcSdmal0PJheh64hxZe4OLMJQ3
 TBTpTA65Dyx+/xbQ/Lyi855tgaRyyWOfsXCwavGOCqkKFJ7kXPEuY0/sI85Q19jclnaTlnig60v
 gz3CI0H0+BO5ErKSiGh3xBiY1BY0YLZ5laPwUZs3puPoDRP+ENANFa3DTMiaHnEN6P4uEIDsvDg
 o2+xStp/Nic+nSNM9fQ2Cpp4sJpxQbDL8iS9hSO4vmTRrO39xwNK9guyH1g0WfVducgPT1VhNad
 SiyGvEeUXA6/9X5PSxW0AFuMLPVNEYGsskrpeUZNELfQUokKtVQOmgg5EHDVUfp4OIxExrNcR2g
 5WQqTyPc3WFEQfYbkiOI7cGPW/yqdRXmp4CbsPGiqO16xhZtq64e1qBbQmTVY1MWfwZQoBc9WuV
 OSZmIVWjdTqRYROZxNKLxjeFVT7xT0e1s1dFzt5TeAQvbcqdQ70S/JDjL+K/GEqGrMsxReLOJSE
 noQXO3qWK6Re3jg==
X-Developer-Key: i=krzysztof.kozlowski@linaro.org; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250830_031913_319724_C5D046BD 
X-CRM114-Status: GOOD (  11.07  )
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

Binding defined two if:then: blocks covering different conditions but
not fully constraining the properties per each variant:
1. "if:" to require samsung,syscon-phandle,
2. "if:" with "else:" to narrow number of clocks and require or disallow
   samsung,cluster-index.

This still did not cover following cases:
1. Disallow samsung,syscon-phandle when not applicable,
2. Narrow samsung,cluster-index to [0, 1], for SoCs with only two
   clusters.

Solving this in current format would lead to spaghetti code, so re-write
entire "if:then:" approach into mutually exclusive cases so each SoC
appears only in one "if:" block.  This allows to forbid
samsung,syscon-phandle for S3C6410, and narrow samsung,cluster-index
to [0, 1].

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 .../devicetree/bindings/watchdog/samsung-wdt.yaml  | 70 ++++++++++++++++------
 1 file changed, 52 insertions(+), 18 deletions(-)

diff --git a/Documentation/devicetree/bindings/watchdog/samsung-wdt.yaml b/Documentation/devicetree/bindings/watchdog/samsung-wdt.yaml
index 51e597ba7db2615da41f5d3b6dc4e70f6bb72bb6..41aee1655b0c22a6dce212a63fa4849089253f09 100644
--- a/Documentation/devicetree/bindings/watchdog/samsung-wdt.yaml
+++ b/Documentation/devicetree/bindings/watchdog/samsung-wdt.yaml
@@ -74,24 +74,7 @@ allOf:
           contains:
             enum:
               - google,gs101-wdt
-              - samsung,exynos5250-wdt
-              - samsung,exynos5420-wdt
-              - samsung,exynos7-wdt
               - samsung,exynos850-wdt
-              - samsung,exynos990-wdt
-              - samsung,exynosautov9-wdt
-              - samsung,exynosautov920-wdt
-    then:
-      required:
-        - samsung,syscon-phandle
-  - if:
-      properties:
-        compatible:
-          contains:
-            enum:
-              - google,gs101-wdt
-              - samsung,exynos850-wdt
-              - samsung,exynos990-wdt
               - samsung,exynosautov9-wdt
               - samsung,exynosautov920-wdt
     then:
@@ -104,9 +87,41 @@ allOf:
           items:
             - const: watchdog
             - const: watchdog_src
+        samsung,cluster-index:
+          enum: [0, 1]
       required:
         - samsung,cluster-index
-    else:
+        - samsung,syscon-phandle
+
+  - if:
+      properties:
+        compatible:
+          contains:
+            enum:
+              - samsung,exynos990-wdt
+    then:
+      properties:
+        clocks:
+          items:
+            - description: Bus clock, used for register interface
+            - description: Source clock (driving watchdog counter)
+        clock-names:
+          items:
+            - const: watchdog
+            - const: watchdog_src
+      required:
+        - samsung,cluster-index
+        - samsung,syscon-phandle
+
+  - if:
+      properties:
+        compatible:
+          contains:
+            enum:
+              - samsung,exynos5250-wdt
+              - samsung,exynos5420-wdt
+              - samsung,exynos7-wdt
+    then:
       properties:
         clocks:
           items:
@@ -115,6 +130,25 @@ allOf:
           items:
             - const: watchdog
         samsung,cluster-index: false
+      required:
+        - samsung,syscon-phandle
+
+  - if:
+      properties:
+        compatible:
+          contains:
+            enum:
+              - samsung,s3c6410-wdt
+    then:
+      properties:
+        clocks:
+          items:
+            - description: Bus clock, which is also a source clock
+        clock-names:
+          items:
+            - const: watchdog
+        samsung,cluster-index: false
+        samsung,syscon-phandle: false
 
 unevaluatedProperties: false
 

-- 
2.48.1


