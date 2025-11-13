Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 307ACCCFA18
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 13 Nov 2025 06:40:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:References:Content-Type:
	Content-Transfer-Encoding:MIME-Version:In-Reply-To:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=lLbacaR5clbNto/ko7Nx4/YFPvA6DfmhL0b6nWQNI0I=; b=ZQ69FhDKIoBWS0maN/aS39uwAF
	AMx5UV0zfr1PLW1trRAqLcSJsGkqhwfXrk7ZCmhTx7UhNbaiOsjSgQzf3SaH5X1Ptr1uCfrZ+KGzZ
	s7tUrmpcyaXCjmvnX5RHR/VZCEPrHq6EVgUrcC+1BMc5mUQuPjID1/SgLmR1r78ugOnvobJuL7oZc
	2kJC/sjy7+NkhmPC8QdhrZDUN36s2ajnVLwTlNdr3cNRnGO/VtQT6OnsvY3+62/6BV7tEF+kGECtA
	FNBSu7i4l4hHZ6gJNiM7kkEcHc1ER8c1xwy0v20pReG24Srdj5dYMMvmvMH6uNvt/YCvV/UJc+Wfk
	GzA6rAFw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vJR0m-00000009xfI-0Zta;
	Thu, 13 Nov 2025 06:40:52 +0000
Received: from mailout1.samsung.com ([203.254.224.24])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vJR0i-00000009xdx-0NQy
	for linux-arm-kernel@lists.infradead.org;
	Thu, 13 Nov 2025 06:40:50 +0000
Received: from epcas2p1.samsung.com (unknown [182.195.41.53])
	by mailout1.samsung.com (KnoxPortal) with ESMTP id 20251113064041epoutp01e67dedda0e7023164617affd4aae8d37~3fb-KClEr1386513865epoutp01b
	for <linux-arm-kernel@lists.infradead.org>; Thu, 13 Nov 2025 06:40:41 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout1.samsung.com 20251113064041epoutp01e67dedda0e7023164617affd4aae8d37~3fb-KClEr1386513865epoutp01b
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1763016041;
	bh=lLbacaR5clbNto/ko7Nx4/YFPvA6DfmhL0b6nWQNI0I=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=IQqPXiJ3/oxaL4v6sB3KvXD1L6ioNLQHixtSuj3bCsFZ3SYkCdkWSlV7Hhuq/vHMx
	 nMjx47Ub1eGOddZDnBb4MUsXp6eNkHoqXsVPyA47s3OuNVFZ42pItSN4CwbUzKLnFq
	 873fLHJkcX0CKxwaIV71lcGCjA8O0RhCaRpDXnlM=
Received: from epsnrtp04.localdomain (unknown [182.195.42.156]) by
	epcas2p4.samsung.com (KnoxPortal) with ESMTPS id
	20251113064041epcas2p4f9f150d07cc3310bd8ef664c34f596ea~3fb_pyfWI0213302133epcas2p4i;
	Thu, 13 Nov 2025 06:40:41 +0000 (GMT)
Received: from epcas2p2.samsung.com (unknown [182.195.38.211]) by
	epsnrtp04.localdomain (Postfix) with ESMTP id 4d6Vyc5dn7z6B9mB; Thu, 13 Nov
	2025 06:40:40 +0000 (GMT)
Received: from epsmtip2.samsung.com (unknown [182.195.34.31]) by
	epcas2p2.samsung.com (KnoxPortal) with ESMTPA id
	20251113064040epcas2p2df8da3f9c5a2c41c6aedc37d37b366de~3fb9gbpRX1513415134epcas2p2q;
	Thu, 13 Nov 2025 06:40:40 +0000 (GMT)
Received: from asswp60 (unknown [10.229.9.60]) by epsmtip2.samsung.com
	(KnoxPortal) with ESMTPA id
	20251113064039epsmtip2d3d1a6afb1b99aa8c0726f1ee01e8ca0~3fb9U2F5c0205702057epsmtip2T;
	Thu, 13 Nov 2025 06:40:39 +0000 (GMT)
From: Shin Son <shin.son@samsung.com>
To: Bartlomiej Zolnierkiewicz <bzolnier@gmail.com>, Krzysztof Kozlowski
	<krzk@kernel.org>, "Rafael J . Wysocki" <rafael@kernel.org>, Daniel Lezcano
	<daniel.lezcano@linaro.org>, Zhang Rui <rui.zhang@intel.com>, Lukasz Luba
	<lukasz.luba@arm.com>, Rob Herring <robh@kernel.org>, Conor Dooley
	<conor+dt@kernel.org>, Alim Akhtar <alim.akhtar@samsung.com>
Cc: Henrik Grimler <henrik@grimler.se>, Shin Son <shin.son@samsung.com>,
	linux-pm@vger.kernel.org, linux-samsung-soc@vger.kernel.org,
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, Krzysztof Kozlowski
	<krzysztof.kozlowski@linaro.org>
Subject: [PATCH v7 RESEND 1/3] dt-bindings: thermal: samsung: Adjust
 '#thermal-sensor-cells' to 1
Date: Thu, 13 Nov 2025 15:40:20 +0900
Message-ID: <20251113064022.2701578-2-shin.son@samsung.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20251113064022.2701578-1-shin.son@samsung.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CMS-MailID: 20251113064040epcas2p2df8da3f9c5a2c41c6aedc37d37b366de
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-Sendblock-Type: AUTO_CONFIDENTIAL
CMS-TYPE: 102P
cpgsPolicy: CPGSC10-234,Y
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20251113064040epcas2p2df8da3f9c5a2c41c6aedc37d37b366de
References: <20251113064022.2701578-1-shin.son@samsung.com>
	<CGME20251113064040epcas2p2df8da3f9c5a2c41c6aedc37d37b366de@epcas2p2.samsung.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251112_224048_545343_1482755D 
X-CRM114-Status: GOOD (  17.12  )
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

The ExynosAuto v920 SoC includes multiple TMU instances; each instance
monitors a subset of the SoC's up to 16 hardware thermal sensors.

Additionally, add myself to the bindings' maintainers list, as I plan
to actively work on the exynosautov920 TMU support and handle further
updates in this area.

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Signed-off-by: Shin Son <shin.son@samsung.com>
---
 .../thermal/samsung,exynos-thermal.yaml       | 33 ++++++++++++++++++-
 1 file changed, 32 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/thermal/samsung,exynos-thermal.yaml b/Documentation/devicetree/bindings/thermal/samsung,exynos-thermal.yaml
index 29a08b0729ee..6b01f508542c 100644
--- a/Documentation/devicetree/bindings/thermal/samsung,exynos-thermal.yaml
+++ b/Documentation/devicetree/bindings/thermal/samsung,exynos-thermal.yaml
@@ -8,6 +8,7 @@ title: Samsung Exynos SoC Thermal Management Unit (TMU)
 
 maintainers:
   - Krzysztof Kozlowski <krzk@kernel.org>
+  - Shin Son <shin.son@samsung.com>
 
 description: |
   For multi-instance tmu each instance should have an alias correctly numbered
@@ -27,6 +28,7 @@ properties:
       - samsung,exynos5420-tmu-ext-triminfo
       - samsung,exynos5433-tmu
       - samsung,exynos7-tmu
+      - samsung,exynosautov920-tmu
 
   clocks:
     minItems: 1
@@ -62,11 +64,17 @@ properties:
     minItems: 1
 
   '#thermal-sensor-cells':
-    const: 0
+    enum: [0, 1]
 
   vtmu-supply:
     description: The regulator node supplying voltage to TMU.
 
+  samsung,sensors:
+    description: Number of thermal sensors monitored by this TMU instance.
+    $ref: /schemas/types.yaml#/definitions/uint32
+    minimum: 0
+    maximum: 15
+
 required:
   - compatible
   - clocks
@@ -97,6 +105,8 @@ allOf:
         reg:
           minItems: 2
           maxItems: 2
+        '#thermal-sensor-cells':
+          const: 0
   - if:
       properties:
         compatible:
@@ -119,6 +129,8 @@ allOf:
         reg:
           minItems: 1
           maxItems: 1
+        '#thermal-sensor-cells':
+          const: 0
 
   - if:
       properties:
@@ -139,6 +151,25 @@ allOf:
         reg:
           minItems: 1
           maxItems: 1
+        '#thermal-sensor-cells':
+          const: 0
+
+  - if:
+      properties:
+        compatible:
+          contains:
+            const: samsung,exynosautov920-tmu
+    then:
+      properties:
+        clocks:
+          maxItems: 1
+        clock-names:
+          items:
+            - const: tmu_apbif
+        reg:
+          maxItems: 1
+        '#thermal-sensor-cells':
+          const: 1
 
 additionalProperties: false
 
-- 
2.50.1


