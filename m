Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CDBEBCDB479
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 24 Jun 2026 19:27:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Z99Q29vxpTumNbDlSLV/5spk9aNhNsdFqpygOCzOZY4=; b=BdfwTbQ1nyVY74Zx8dfuzswVQs
	MGd5v/82lx5qhUspJfLj/OeEGlCz3ZJlSKxKu+avNbmoK0QLXR2c+DpE0+XDkAY9IHq2X0nACm6EK
	bHWBLwVGqeCdLO5JqpwfWHhb+C4xEnCIordQingKLooXQBz4ze8PGtRv2QJTm9Oa00NXtbkfygFxZ
	TPYvHdQXOwVfDvKoP1ayL+KOYYOwUOgYC4EWRdtTofJs6V4NzP5L1JlZ/3OJKEPjJK99VB+4udNYu
	UGCoaHtfKhAo6xT+ax2JmycyWs7RLvcf20y1mCwV4wi7WZnFn+WbP+s5sVQ4RaTdofk4NUk0Zj/Fn
	mWSQW8mg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wcTGF-00000008GtU-2Nzk;
	Wed, 24 Jun 2026 19:27:47 +0000
Received: from smtp.forwardemail.net ([149.28.215.223])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wcTGC-00000008Grg-45cG
	for linux-arm-kernel@lists.infradead.org;
	Wed, 24 Jun 2026 19:27:46 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kwiboo.se;
 h=Content-Transfer-Encoding: MIME-Version: References: In-Reply-To:
 Message-ID: Date: Subject: Cc: To: From; q=dns/txt; s=fe-e1b5cab7be;
 t=1782329264; bh=Z99Q29vxpTumNbDlSLV/5spk9aNhNsdFqpygOCzOZY4=;
 b=kEkwLmkpTJsBrGru/kPUc6yApDo4X+NHpm4g6lly9EJQ4hU5+6DjOLYdDPGy9FTt3Lev0UURC
 WIm7QBnrMQrOv0L8Wz+nHFS25ySpTjNsAPmdjCscs5bRtJLRsBLngyh5hl+Gj9X60wiTtywlfgk
 sd8J3k0iuW1uxw10yzmE5VEhPu83gII3J4i7fUcEej0F9Tv4ub7Ute0Q74W2B7Pen3B5mPMrDf0
 25pRGzqDtjEHFTh/u4oyj8m4GEW47PU4Ef4XVoXaQJ59kM6YzYS6LielAKRFkOAPpgcolFNy6TY
 jDNGERo8QnxtlEK48dj8r6u3/Jer1N7hGZ3b/ZMMvuYA==
X-Forward-Email-ID: 6a3c2fa5138f49c481104abd
X-Forward-Email-Sender: rfc822; jonas@kwiboo.se, smtp.forwardemail.net,
 149.28.215.223
X-Forward-Email-Version: 2.8.32
X-Forward-Email-Website: https://forwardemail.net
X-Complaints-To: abuse@forwardemail.net
X-Report-Abuse: abuse@forwardemail.net
X-Report-Abuse-To: abuse@forwardemail.net
From: Jonas Karlman <jonas@kwiboo.se>
To: Heiko Stuebner <heiko@sntech.de>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Diederik de Haas <diederik@cknow-tech.com>,
	devicetree@vger.kernel.org,
	linux-rockchip@lists.infradead.org,
	linux-usb@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Jonas Karlman <jonas@kwiboo.se>
Subject: [PATCH v2 1/2] dt-bindings: usb: Add Rockchip RK3568 compatible for EHCI and OHCI
Date: Wed, 24 Jun 2026 19:27:24 +0000
Message-ID: <20260624192726.781864-2-jonas@kwiboo.se>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260624192726.781864-1-jonas@kwiboo.se>
References: <20260624192726.781864-1-jonas@kwiboo.se>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260624_122745_014064_52412F56 
X-CRM114-Status: GOOD (  10.57  )
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

The Rockchip RK3568 EHCI/OHCI controller depends on clk_usbphy1_480m
being enabled, or the system may freeze when registers are accessed.

Add Rockchip RK3568 EHCI and OHCI compatibles with a similar four-clock
constraint as RK3588, also extend the EHCI constraint to include RK3588
to match similar requirements of RK3588.

Signed-off-by: Jonas Karlman <jonas@kwiboo.se>
---
Existing DTs for RK3568 use the plain generic-ehci/ohci compatible,
next patch make use of these new compatibles and adds the missing
clk_usbphy1_480m clock references.

Existing DTs for RK3588 have contained the required four clocks since
the initial addition of the EHCI/OHCI nodes.

Changes in v2:
- Include rockchip,rk3588-ehci in the EHCI constraint
- Make clocks prop required for EHCI and OHCI
---
 .../devicetree/bindings/usb/generic-ehci.yaml      | 14 ++++++++++++++
 .../devicetree/bindings/usb/generic-ohci.yaml      |  7 ++++++-
 2 files changed, 20 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/usb/generic-ehci.yaml b/Documentation/devicetree/bindings/usb/generic-ehci.yaml
index 55a5aa7d7a54..a39f01e740b1 100644
--- a/Documentation/devicetree/bindings/usb/generic-ehci.yaml
+++ b/Documentation/devicetree/bindings/usb/generic-ehci.yaml
@@ -52,6 +52,7 @@ properties:
               - ibm,476gtr-ehci
               - nxp,lpc1850-ehci
               - qca,ar7100-ehci
+              - rockchip,rk3568-ehci
               - rockchip,rk3588-ehci
               - snps,hsdk-v1.0-ehci
               - socionext,uniphier-ehci
@@ -186,6 +187,19 @@ allOf:
       required:
         - clocks
         - clock-names
+  - if:
+      properties:
+        compatible:
+          contains:
+            enum:
+              - rockchip,rk3568-ehci
+              - rockchip,rk3588-ehci
+    then:
+      properties:
+        clocks:
+          minItems: 4
+      required:
+        - clocks
 
 unevaluatedProperties: false
 
diff --git a/Documentation/devicetree/bindings/usb/generic-ohci.yaml b/Documentation/devicetree/bindings/usb/generic-ohci.yaml
index d42f448fa204..19449a6b3033 100644
--- a/Documentation/devicetree/bindings/usb/generic-ohci.yaml
+++ b/Documentation/devicetree/bindings/usb/generic-ohci.yaml
@@ -47,6 +47,7 @@ properties:
               - hpe,gxp-ohci
               - ibm,476gtr-ohci
               - ingenic,jz4740-ohci
+              - rockchip,rk3568-ohci
               - rockchip,rk3588-ohci
               - snps,hsdk-v1.0-ohci
           - const: generic-ohci
@@ -198,11 +199,15 @@ allOf:
       properties:
         compatible:
           contains:
-            const: rockchip,rk3588-ohci
+            enum:
+              - rockchip,rk3568-ohci
+              - rockchip,rk3588-ohci
     then:
       properties:
         clocks:
           minItems: 4
+      required:
+        - clocks
     else:
       properties:
         clocks:
-- 
2.54.0


