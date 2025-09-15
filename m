Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BDE83CAC58E
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 15 Sep 2025 04:07:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:References:Content-Type:
	Content-Transfer-Encoding:MIME-Version:In-Reply-To:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=2lZzaMhkerEF9X8trQsLpjUpa3JpSWLt4zEQJ0GLguw=; b=0xR7VwMn+rJdOAfE0Z32C0waMN
	aKOB/8ng5WuxqFDh25M/vzLMYbNXFOkuqMdkt1alao4ufRoLY+yWPpFsnloL0ctURM7twlHHm/In0
	5Vbe3FiWdsb+9qifA9BSv3oKKPh3kCV2nwpEabIqLOKwgMpxnJGfsUosafuhzrq4KTsBfNDyW7dW9
	8ftJeaRWK6pgCcrU+mNbgX/kojZ/kS2QKAWJRAds3bscxckNKu1V39cb7Ad53kHcXsaSPmqNYneF3
	F2YlwvXqUE5S54jEtV8060N3/iQLe/8XlLjA5YoDKP5Ei53IkHVLnNgyjiZzlLIvSergmY2o/kFlN
	/jhGis3g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uy0VN-00000002jIF-0Gwh;
	Mon, 15 Sep 2025 04:07:53 +0000
Received: from mailout2.samsung.com ([203.254.224.25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uy0VJ-00000002jGN-3sc5
	for linux-arm-kernel@lists.infradead.org;
	Mon, 15 Sep 2025 04:07:51 +0000
Received: from epcas2p4.samsung.com (unknown [182.195.41.56])
	by mailout2.samsung.com (KnoxPortal) with ESMTP id 20250915040744epoutp02cfd8a8801ee4a58ff7c7223c9fd786de~lWSmExWqK2143921439epoutp02F
	for <linux-arm-kernel@lists.infradead.org>; Mon, 15 Sep 2025 04:07:44 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout2.samsung.com 20250915040744epoutp02cfd8a8801ee4a58ff7c7223c9fd786de~lWSmExWqK2143921439epoutp02F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1757909264;
	bh=2lZzaMhkerEF9X8trQsLpjUpa3JpSWLt4zEQJ0GLguw=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=U7LIIgpuGUhCXSZnPDcOsUAc9ZRqaGGj77Fhp8+/CFpc/QGaitY4fo47RvgyN8Pbe
	 CLTQm2fRC3f8J3hzZBRkKG6sN5S0KiQEZ3ehE3cJ25FgwjGgOfhu4QeydFHAobqR8p
	 mXbRk3995l2jhu3SQSFbnP/52XjTmO0OaxqHgCrk=
Received: from epsnrtp04.localdomain (unknown [182.195.42.156]) by
	epcas2p1.samsung.com (KnoxPortal) with ESMTPS id
	20250915040743epcas2p12771b571ce7f5fc30b1a2d5c21cf092f~lWSlknehV2098120981epcas2p19;
	Mon, 15 Sep 2025 04:07:43 +0000 (GMT)
Received: from epcas2p2.samsung.com (unknown [182.195.36.101]) by
	epsnrtp04.localdomain (Postfix) with ESMTP id 4cQBMM1dXrz6B9m6; Mon, 15 Sep
	2025 04:07:43 +0000 (GMT)
Received: from epsmtip1.samsung.com (unknown [182.195.34.30]) by
	epcas2p4.samsung.com (KnoxPortal) with ESMTPA id
	20250915040742epcas2p4ddc37eb56eb9d96313a5c3fac8befe5d~lWSkYbScR0669406694epcas2p47;
	Mon, 15 Sep 2025 04:07:42 +0000 (GMT)
Received: from asswp60 (unknown [10.229.9.60]) by epsmtip1.samsung.com
	(KnoxPortal) with ESMTPA id
	20250915040742epsmtip1c26994646df08c79e3a53cfd16ff13e9~lWSkRItFT3249532495epsmtip1e;
	Mon, 15 Sep 2025 04:07:42 +0000 (GMT)
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
Subject: [PATCH v3 1/3] dt-bindings: thermal: samsung: Add a
 hw-sensor-indices property
Date: Mon, 15 Sep 2025 13:07:13 +0900
Message-ID: <20250915040715.486733-2-shin.son@samsung.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20250915040715.486733-1-shin.son@samsung.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CMS-MailID: 20250915040742epcas2p4ddc37eb56eb9d96313a5c3fac8befe5d
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-Sendblock-Type: AUTO_CONFIDENTIAL
CMS-TYPE: 102P
cpgsPolicy: CPGSC10-234,Y
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20250915040742epcas2p4ddc37eb56eb9d96313a5c3fac8befe5d
References: <20250915040715.486733-1-shin.son@samsung.com>
	<CGME20250915040742epcas2p4ddc37eb56eb9d96313a5c3fac8befe5d@epcas2p4.samsung.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250914_210750_292030_7BB66A36 
X-CRM114-Status: GOOD (  16.66  )
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

The exynosautov920 TMU requires per-sensor interrupt enablement
for its critical trip points.

- **samsung,hw-sensor-indices**: List of sensor indices physically
                                 monitored by this TMU block.
				 Indicies not listed exist in the SoC
				 register map but are not part of
				 this TMU instance

Additionally, add myself to the bindings' maintainers list, as I plan
to actively work on the exynosautov920 TMU support and handle further
updates in this area.
I also restrict 'samsung,hw-sensor-indices' to the V920 variant. To
ensure properties introduced in 'if/then' blocks are recognized, I
replace 'addtionalProperties: false' with 'unevaluatedProperties: false'.

Signed-off-by: Shin Son <shin.son@samsung.com>
---
 .../thermal/samsung,exynos-thermal.yaml       | 40 ++++++++++++++++++-
 1 file changed, 38 insertions(+), 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/thermal/samsung,exynos-thermal.yaml b/Documentation/devicetree/bindings/thermal/samsung,exynos-thermal.yaml
index 29a08b0729ee..448c68986b10 100644
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
@@ -62,7 +64,7 @@ properties:
     minItems: 1
 
   '#thermal-sensor-cells':
-    const: 0
+    enum: [0, 1]
 
   vtmu-supply:
     description: The regulator node supplying voltage to TMU.
@@ -97,6 +99,8 @@ allOf:
         reg:
           minItems: 2
           maxItems: 2
+        '#thermal-sensor-cells':
+          const: 0
   - if:
       properties:
         compatible:
@@ -119,6 +123,8 @@ allOf:
         reg:
           minItems: 1
           maxItems: 1
+        '#thermal-sensor-cells':
+          const: 0
 
   - if:
       properties:
@@ -139,8 +145,38 @@ allOf:
         reg:
           minItems: 1
           maxItems: 1
+        '#thermal-sensor-cells':
+          const: 0
 
-additionalProperties: false
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
+        samsung,hw-sensor-indices:
+          description:
+            List of thermal sensor indices physically monitored by this TMU instance.
+            Indices not listed correspond to registers that exist in the SoC
+            but are not connected to this TMU hardware block.
+          $ref: /schemas/types.yaml#/definitions/uint32-array
+          minItems: 1
+          maxItems: 16
+          uniqueItems: true
+          items:
+            minimum: 0
+            maximum: 15
+
+unevaluatedProperties: false
 
 examples:
   - |
-- 
2.50.1


