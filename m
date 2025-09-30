Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A5703CAC5B0
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 30 Sep 2025 00:52:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:References:Content-Type:
	Content-Transfer-Encoding:MIME-Version:In-Reply-To:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=A44684+TxPgrnQxxhQZxw9mhm/+rF3+SYnhEcaZDAiQ=; b=K8Vc9rZ8CW0nFFeKh2XXtU+L9X
	71TnF+NdTAIfShivA54Yr6rPtOAQbdLb6rWaswaZH1s/P02USfbmrJH0eZSNRXqyibhu3Lcje5F6Z
	x9NV8oANRvkfD4oTH/tg0AoeIsdaKwlkaJMim8dmMKD6QryQFruAtekZukLinAw/JoIa4kLAmb7hZ
	5Qd6JCIByCiGulUrt6IVygXraG/nQT3mSLY2nb79y965bckwKPFstWh5E7ltcMKYW5pfMtICUeLw3
	3ioUBSPaJTCk0Z+xlcP/KmQi5qwyqu8fUy/34yC/Eg/Ae4BGvZbit++RpI+uwIxbRGgFZjrENk33c
	9f6fj27Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v3Ob9-00000003jHR-2mDI;
	Tue, 30 Sep 2025 00:52:07 +0000
Received: from mailout4.samsung.com ([203.254.224.34])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v3Oay-00000003jD2-2pKp
	for linux-arm-kernel@lists.infradead.org;
	Tue, 30 Sep 2025 00:52:02 +0000
Received: from epcas2p3.samsung.com (unknown [182.195.41.55])
	by mailout4.samsung.com (KnoxPortal) with ESMTP id 20250930005149epoutp048ef2e0dbd74be2c7cd60ebba1c6c46d6~p6S0mcGPL2319023190epoutp040
	for <linux-arm-kernel@lists.infradead.org>; Tue, 30 Sep 2025 00:51:49 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout4.samsung.com 20250930005149epoutp048ef2e0dbd74be2c7cd60ebba1c6c46d6~p6S0mcGPL2319023190epoutp040
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1759193509;
	bh=A44684+TxPgrnQxxhQZxw9mhm/+rF3+SYnhEcaZDAiQ=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=igEq/rQWKTnWl0SahOd6r+OzH4H5khd0HNJ2WwVH7O4zurlVitR81YLMCNOCSRAuW
	 5+AwnTOBzrH85zy8MpGIBUBQXrPf/nEqta8uTm5p85L2NDjNPZyo4BrJNMpGqU+0CA
	 f/FyDwHgm5N7vlmqLl26roCCWHYad+QMZatsyibc=
Received: from epsnrtp04.localdomain (unknown [182.195.42.156]) by
	epcas2p2.samsung.com (KnoxPortal) with ESMTPS id
	20250930005149epcas2p203668647ea6aa4266cd567311959cba4~p6S0DLuZn3138431384epcas2p20;
	Tue, 30 Sep 2025 00:51:49 +0000 (GMT)
Received: from epcas2p1.samsung.com (unknown [182.195.38.211]) by
	epsnrtp04.localdomain (Postfix) with ESMTP id 4cbKJN475mz6B9m7; Tue, 30 Sep
	2025 00:51:48 +0000 (GMT)
Received: from epsmtip2.samsung.com (unknown [182.195.34.31]) by
	epcas2p2.samsung.com (KnoxPortal) with ESMTPA id
	20250930005147epcas2p2622ff5fdbffc045bbd625e3e60db8118~p6SzFJaBm2507125071epcas2p2x;
	Tue, 30 Sep 2025 00:51:47 +0000 (GMT)
Received: from asswp60 (unknown [10.229.9.60]) by epsmtip2.samsung.com
	(KnoxPortal) with ESMTPA id
	20250930005147epsmtip2a53c7b688f6c7b65b97d42bd673be799~p6Sy67eg21112411124epsmtip2K;
	Tue, 30 Sep 2025 00:51:47 +0000 (GMT)
From: Shin Son <shin.son@samsung.com>
To: Bartlomiej Zolnierkiewicz <bzolnier@gmail.com>, Krzysztof Kozlowski
	<krzk@kernel.org>, "Rafael J . Wysocki" <rafael@kernel.org>, Daniel Lezcano
	<daniel.lezcano@linaro.org>, Zhang Rui <rui.zhang@intel.com>, Lukasz Luba
	<lukasz.luba@arm.com>, Rob Herring <robh@kernel.org>, Conor Dooley
	<conor+dt@kernel.org>, Alim Akhtar <alim.akhtar@samsung.com>, Henrik Grimler
	<henrik@grimler.se>
Cc: Shin Son <shin.son@samsung.com>, linux-pm@vger.kernel.org,
	linux-samsung-soc@vger.kernel.org, devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: [PATCH v6 1/3] dt-bindings: thermal: samsung: Adjust
 '#thermal-sensor-cells' to 1
Date: Tue, 30 Sep 2025 09:51:37 +0900
Message-ID: <20250930005139.1424963-2-shin.son@samsung.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20250930005139.1424963-1-shin.son@samsung.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CMS-MailID: 20250930005147epcas2p2622ff5fdbffc045bbd625e3e60db8118
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-Sendblock-Type: AUTO_CONFIDENTIAL
CMS-TYPE: 102P
cpgsPolicy: CPGSC10-234,Y
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20250930005147epcas2p2622ff5fdbffc045bbd625e3e60db8118
References: <20250930005139.1424963-1-shin.son@samsung.com>
	<CGME20250930005147epcas2p2622ff5fdbffc045bbd625e3e60db8118@epcas2p2.samsung.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250929_175158_931974_0020C250 
X-CRM114-Status: GOOD (  15.25  )
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

Signed-off-by: Shin Son <shin.son@samsung.com>
---
 .../thermal/samsung,exynos-thermal.yaml       | 32 ++++++++++++++++++-
 1 file changed, 31 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/thermal/samsung,exynos-thermal.yaml b/Documentation/devicetree/bindings/thermal/samsung,exynos-thermal.yaml
index 29a08b0729ee..f9b399a7b82f 100644
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
@@ -139,6 +151,24 @@ allOf:
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
+          minItems: 1
+          maxItems: 1
+        reg:
+          minItems: 1
+          maxItems: 1
+        '#thermal-sensor-cells':
+          const: 1
 
 additionalProperties: false
 
-- 
2.50.1


