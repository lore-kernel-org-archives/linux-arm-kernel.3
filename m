Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F23E7ECD997
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  5 Feb 2026 21:20:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ZSOvELGA2EuKRZ+dcy6xv6vUM0tTuySjHGPM8Fdt7Cg=; b=QNcECReZoV7ubS0QIZXsi/X8MP
	LZVtbEuTFYAS1baNUjMfqXPLzGqRUxS2XcPGm7H0J9W7qHvMVQ+bG5wt6HQF/Nk9ML0NH7tYtfLPC
	Hl5GUwZjAQsGBTHkujtBGq9OMLKnqbfrNFJaYGcm+gfYLzP7eylqVFSB6zxXU2M3TPL9gfTSwhHeT
	gprhqq8pGN3VKCQVYjbuDbWKg51kdGWPWOA0myUogXsryjR/pSB/SlRqiktYW6IjFji/Zk05jaa6E
	cQZoWzJ1v1qiKZpNhlVD0c2UyEOLRPDrzMsHhNzDvPrfCCqrWvf1ctVVrc+4UvQHVpjAoXTo8IpnK
	vDZHEgxg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vo6la-0000000AV4m-0pUV;
	Thu, 05 Feb 2026 21:19:58 +0000
Received: from gloria.sntech.de ([185.11.138.130])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vo6lV-0000000AV2D-0xAQ;
	Thu, 05 Feb 2026 21:19:55 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de;
	s=gloria202408; h=Content-Transfer-Encoding:MIME-Version:References:
	In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type;
	bh=ZSOvELGA2EuKRZ+dcy6xv6vUM0tTuySjHGPM8Fdt7Cg=; b=FXspVDJkdinxtd5OLNoypx0bDB
	/4j7Rr9t5C9Jp+248IwBpFD9XNEYx3ouJptrP92ycZ8be+CE7V80aG7P5rX3GqgWFvrxXdBlkT8UG
	LPG3GgwXZUYX3Nm9cTrn+o1k04+8+rQcTKldsLp9FfXBOw5PIhslcdugNcDt607R6Oss4lX5uSXKE
	yiGsYqTIEaXvcHq48A7UjletnmO9gwl26T5UAJ4+VpGrjOAUI8e/ZF36vMYiVnERMzkssxmQ9/n4L
	9LgpbPk5Z8Rz7e1ZyFraMpQ76/1RbcvOQBCOjKMafvauAnrF8EGyTD0uEBMR5rmnfTcZ7iIAij5Ap
	H56z7jCw==;
Received: from i53875afe.versanet.de ([83.135.90.254] helo=localhost.localdomain)
	by gloria.sntech.de with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <heiko@sntech.de>)
	id 1vo6lN-007GGK-Mb; Thu, 05 Feb 2026 22:19:46 +0100
From: Heiko Stuebner <heiko@sntech.de>
To: srini@kernel.org
Cc: robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	heiko@sntech.de,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	kever.yang@rock-chips.com,
	finley.xiao@rock-chips.com,
	w@1wt.eu,
	jonas@kwiboo.se
Subject: [PATCH v4 1/6] dt-bindings: nvmem: rockchip,otp: Add support for RK3562 and RK3568
Date: Thu,  5 Feb 2026 22:18:56 +0100
Message-ID: <20260205211901.490181-2-heiko@sntech.de>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <20260205211901.490181-1-heiko@sntech.de>
References: <20260205211901.490181-1-heiko@sntech.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260205_131953_276437_8521772B 
X-CRM114-Status: GOOD (  10.99  )
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

From: Kever Yang <kever.yang@rock-chips.com>

Add compatible entry for the otp controller in RK3562 and RK3568, add
schema for different clock names for new entry.

Signed-off-by: Kever Yang <kever.yang@rock-chips.com>
Reviewed-by: Rob Herring (Arm) <robh@kernel.org>
Signed-off-by: Heiko Stuebner <heiko@sntech.de>
---
 .../bindings/nvmem/rockchip,otp.yaml          | 58 +++++++++++++++----
 1 file changed, 48 insertions(+), 10 deletions(-)

diff --git a/Documentation/devicetree/bindings/nvmem/rockchip,otp.yaml b/Documentation/devicetree/bindings/nvmem/rockchip,otp.yaml
index dc89020b0950..e90136f7dcfb 100644
--- a/Documentation/devicetree/bindings/nvmem/rockchip,otp.yaml
+++ b/Documentation/devicetree/bindings/nvmem/rockchip,otp.yaml
@@ -14,6 +14,8 @@ properties:
     enum:
       - rockchip,px30-otp
       - rockchip,rk3308-otp
+      - rockchip,rk3562-otp
+      - rockchip,rk3568-otp
       - rockchip,rk3576-otp
       - rockchip,rk3588-otp
 
@@ -26,19 +28,15 @@ properties:
 
   clock-names:
     minItems: 3
-    items:
-      - const: otp
-      - const: apb_pclk
-      - const: phy
-      - const: arb
+    maxItems: 4
 
   resets:
     minItems: 1
-    maxItems: 3
+    maxItems: 4
 
   reset-names:
     minItems: 1
-    maxItems: 3
+    maxItems: 4
 
 required:
   - compatible
@@ -64,13 +62,44 @@ allOf:
         clocks:
           maxItems: 3
         clock-names:
-          maxItems: 3
+          items:
+            - const: otp
+            - const: apb_pclk
+            - const: phy
         resets:
           maxItems: 1
         reset-names:
           items:
             - const: phy
 
+  - if:
+      properties:
+        compatible:
+          contains:
+            enum:
+              - rockchip,rk3562-otp
+              - rockchip,rk3568-otp
+    then:
+      properties:
+        clocks:
+          minItems: 4
+          maxItems: 4
+        clock-names:
+          items:
+            - const: otp
+            - const: apb_pclk
+            - const: phy
+            - const: sbpi
+        resets:
+          minItems: 4
+          maxItems: 4
+        reset-names:
+          items:
+            - const: otp
+            - const: apb
+            - const: phy
+            - const: sbpi
+
   - if:
       properties:
         compatible:
@@ -82,7 +111,10 @@ allOf:
         clocks:
           maxItems: 3
         clock-names:
-          maxItems: 3
+          items:
+            - const: otp
+            - const: apb_pclk
+            - const: phy
         resets:
           minItems: 2
           maxItems: 2
@@ -101,10 +133,16 @@ allOf:
       properties:
         clocks:
           minItems: 4
+          maxItems: 4
         clock-names:
-          minItems: 4
+          items:
+            - const: otp
+            - const: apb_pclk
+            - const: phy
+            - const: arb
         resets:
           minItems: 3
+          maxItems: 3
         reset-names:
           items:
             - const: otp
-- 
2.47.2


