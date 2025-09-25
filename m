Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6C6AFCAC5A5
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 25 Sep 2025 02:29:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:References:Content-Type:
	Content-Transfer-Encoding:MIME-Version:In-Reply-To:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=A44684+TxPgrnQxxhQZxw9mhm/+rF3+SYnhEcaZDAiQ=; b=IMMpcE8edi+mqOZczYTa6elRtw
	pFAu8DTkuqrMelNHS2FKd/GfTaslDp+LOxDRhPjgUJd2Q6NuTe90IhRd4bBm4lhbYOuBLeS7Mf6Kd
	4+bjhpXX2pHP3P6vwnPyMTVzK0/zGmajWnW7c9UAautRi5tw7UpI7p49g6LHyvWkFT5Ec/ZKp67YW
	ocZQ3yKdTLrJf6RwezKeLs5tv/WOBrGZfYHqUffIa576p7VsdROsOkDonRovuO0GWFfX7EsN/Grdg
	4Gqnq22owJTkXD4CJrKGu2dzkbN1bfeN67D7XQxFQDNssigbM4u9ZqcVdkIIxfUbFcIERmihfV3gS
	TyF0+csg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v1bj7-00000005IjK-2f9r;
	Thu, 25 Sep 2025 02:28:57 +0000
Received: from mailout3.samsung.com ([203.254.224.33])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v1bj3-00000005IhH-3WdK
	for linux-arm-kernel@lists.infradead.org;
	Thu, 25 Sep 2025 02:28:56 +0000
Received: from epcas2p3.samsung.com (unknown [182.195.41.55])
	by mailout3.samsung.com (KnoxPortal) with ESMTP id 20250925022847epoutp03a3ca9e6a7199a3708f30088e265bc8d1~oZZD5bjIF1659816598epoutp03q
	for <linux-arm-kernel@lists.infradead.org>; Thu, 25 Sep 2025 02:28:47 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout3.samsung.com 20250925022847epoutp03a3ca9e6a7199a3708f30088e265bc8d1~oZZD5bjIF1659816598epoutp03q
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1758767327;
	bh=A44684+TxPgrnQxxhQZxw9mhm/+rF3+SYnhEcaZDAiQ=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=QrP/QhvB9sUkvC5rmQY8EuL8cUpFAbKO5LiRK/aUH4Dq/YpkZHCK2ymIUixv8yj09
	 /Exel3pe+/ADziByS1GIPhFRUD3zxe50YolNjOzf0M46vflaJTRONGAo2JMsqn5sCT
	 XDb9jCVdXXCrkK4Vv1P5EFDiG5SU9iNLk13DkLks=
Received: from epsnrtp01.localdomain (unknown [182.195.42.153]) by
	epcas2p4.samsung.com (KnoxPortal) with ESMTPS id
	20250925022847epcas2p4d8bb3ff1309bc0a1dd9c08a9b8ed8e29~oZZDaC2T70383003830epcas2p4x;
	Thu, 25 Sep 2025 02:28:47 +0000 (GMT)
Received: from epcas2p4.samsung.com (unknown [182.195.36.100]) by
	epsnrtp01.localdomain (Postfix) with ESMTP id 4cXHhZ4K0tz6B9mF; Thu, 25 Sep
	2025 02:28:46 +0000 (GMT)
Received: from epsmtip1.samsung.com (unknown [182.195.34.30]) by
	epcas2p4.samsung.com (KnoxPortal) with ESMTPA id
	20250925022845epcas2p4e5f0c0d095c1c8e2246646aa2d0ec985~oZZCAYflJ3098730987epcas2p4V;
	Thu, 25 Sep 2025 02:28:45 +0000 (GMT)
Received: from asswp60 (unknown [10.229.9.60]) by epsmtip1.samsung.com
	(KnoxPortal) with ESMTPA id
	20250925022845epsmtip19f89c0689bd83de5e47b7459bba66901~oZZB4Lgdk2361923619epsmtip1i;
	Thu, 25 Sep 2025 02:28:45 +0000 (GMT)
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
Subject: [PATCH v5 1/3] dt-bindings: thermal: samsung: Adjust
 '#thermal-sensor-cells' to 1
Date: Thu, 25 Sep 2025 11:28:38 +0900
Message-ID: <20250925022841.2813150-2-shin.son@samsung.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20250925022841.2813150-1-shin.son@samsung.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CMS-MailID: 20250925022845epcas2p4e5f0c0d095c1c8e2246646aa2d0ec985
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-Sendblock-Type: AUTO_CONFIDENTIAL
CMS-TYPE: 102P
cpgsPolicy: CPGSC10-234,Y
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20250925022845epcas2p4e5f0c0d095c1c8e2246646aa2d0ec985
References: <20250925022841.2813150-1-shin.son@samsung.com>
	<CGME20250925022845epcas2p4e5f0c0d095c1c8e2246646aa2d0ec985@epcas2p4.samsung.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250924_192854_499994_963024E4 
X-CRM114-Status: GOOD (  15.07  )
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


