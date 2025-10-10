Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 89112CCA476
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 10 Oct 2025 07:01:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:References:Content-Type:
	Content-Transfer-Encoding:MIME-Version:In-Reply-To:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=chMB2IJ82Cq497kVbgxtv/f0phmS3PCgshMplIBs7dw=; b=X8aD9TsKa9U0PwqBhij2WJpR6O
	7szIP5qVcYDkVLf4HM1leKWb/zjdF3330tY1qJo268zdtQ/r9eoBLHauf4TCN5kHEUVFRwkNvpiUL
	SNvXu9IPVMmJkvdM2JNOMEgGCEbOP6sklTUYX1r56qoghht5qP+drEE51hSbn5XtiqNzfFez9ajaf
	ch64NgsP+opqulNvmOGZ8kpF4zReiRwfJVQkwmBZ65UaJPbIO+Ix95abEEhahjx9eWYPgH30rnAQG
	qadRERhqRm8Mn0tu/UgTZvwVrZ1fftqIPbRqMsLnhnZsypFfFkkQijb18DingYn25bcZFObkIapxX
	PkisWbMQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v777Y-00000007nzr-0jdZ;
	Fri, 10 Oct 2025 07:00:56 +0000
Received: from mailout4.samsung.com ([203.254.224.34])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v777Q-00000007nww-3Qzd
	for linux-arm-kernel@lists.infradead.org;
	Fri, 10 Oct 2025 07:00:54 +0000
Received: from epcas5p2.samsung.com (unknown [182.195.41.40])
	by mailout4.samsung.com (KnoxPortal) with ESMTP id 20251010070045epoutp0480bc53e6e0ac4908620003549b663743~tDxzN9IkZ3105831058epoutp04W
	for <linux-arm-kernel@lists.infradead.org>; Fri, 10 Oct 2025 07:00:45 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout4.samsung.com 20251010070045epoutp0480bc53e6e0ac4908620003549b663743~tDxzN9IkZ3105831058epoutp04W
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1760079645;
	bh=chMB2IJ82Cq497kVbgxtv/f0phmS3PCgshMplIBs7dw=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=F1QugMWKj2k02Br6weRj6e1uav6qoCugsAibxB9xALWqMUnCIsioRR46VkBPMl9/c
	 qk0yABlMX92WD8XXstNRNCzeatkTnTWyPMTL4euG6E9hAJ15nadeToZleI35dRHjVU
	 EaoKfh+gLIRHr8b6WHwmTcWZTB2B2dNT6kRT9j+g=
Received: from epsnrtp01.localdomain (unknown [182.195.42.153]) by
	epcas5p2.samsung.com (KnoxPortal) with ESMTPS id
	20251010070045epcas5p29af926ad04ef2d96327c1e69dcdbc9ce~tDxynMld02285922859epcas5p24;
	Fri, 10 Oct 2025 07:00:45 +0000 (GMT)
Received: from epcas5p1.samsung.com (unknown [182.195.38.95]) by
	epsnrtp01.localdomain (Postfix) with ESMTP id 4cjd1R71Kmz6B9m6; Fri, 10 Oct
	2025 07:00:43 +0000 (GMT)
Received: from epsmtip2.samsung.com (unknown [182.195.34.31]) by
	epcas5p3.samsung.com (KnoxPortal) with ESMTPA id
	20251010070043epcas5p3b55be4611210178151e15470f7d8e092~tDxxDTgwk0258502585epcas5p3Y;
	Fri, 10 Oct 2025 07:00:43 +0000 (GMT)
Received: from bose.samsungds.net (unknown [107.108.83.9]) by
	epsmtip2.samsung.com (KnoxPortal) with ESMTPA id
	20251010070038epsmtip2cb9ee8d044ab378b3e2b8d710fad2cac~tDxsEsW250636306363epsmtip26;
	Fri, 10 Oct 2025 07:00:37 +0000 (GMT)
From: Pritam Manohar Sutar <pritam.sutar@samsung.com>
To: vkoul@kernel.org, kishon@kernel.org, robh@kernel.org,
	krzk+dt@kernel.org, conor+dt@kernel.org, alim.akhtar@samsung.com,
	andre.draszik@linaro.org, peter.griffin@linaro.org, kauschluss@disroot.org,
	johan@kernel.org, ivo.ivanov.ivanov1@gmail.com, m.szyprowski@samsung.com,
	s.nawrocki@samsung.com, pritam.sutar@samsung.com
Cc: linux-phy@lists.infradead.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org, rosa.pila@samsung.com,
	dev.tailor@samsung.com, faraz.ata@samsung.com, muhammed.ali@samsung.com,
	selvarasu.g@samsung.com, Krzysztof Kozlowski
	<krzysztof.kozlowski@linaro.org>
Subject: [PATCH v9 1/6] dt-bindings: phy: samsung,usb3-drd-phy: add
 ExynosAutov920 HS phy compatible
Date: Fri, 10 Oct 2025 12:39:07 +0530
Message-Id: <20251010070912.3758334-2-pritam.sutar@samsung.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20251010070912.3758334-1-pritam.sutar@samsung.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CMS-MailID: 20251010070043epcas5p3b55be4611210178151e15470f7d8e092
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
CMS-TYPE: 105P
cpgsPolicy: CPGSC10-542,Y
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20251010070043epcas5p3b55be4611210178151e15470f7d8e092
References: <20251010070912.3758334-1-pritam.sutar@samsung.com>
	<CGME20251010070043epcas5p3b55be4611210178151e15470f7d8e092@epcas5p3.samsung.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251010_000051_119673_683C0D2A 
X-CRM114-Status: GOOD (  12.44  )
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

Document support for the USB20 phy found on the ExynosAutov920 SoC. The
USB20 phy is functionally identical to that on the Exynos850 SoC, so no
driver changes are needed to support this phy. However, add a dedicated
compatible string for USB20 phy found in this SoC.

This phy needs 0.75v, 0.18v and 3.3v supplies for its internal
functionally. Power Supply's names are as per phy's User Data-Book.
These names, (dvdd, vdd18 and vdd33), are considered  for 0.75v, 1.8v
and 3.3v respectively.

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Reviewed-by: Alim Akhtar <alim.akhtar@samsung.com>
Signed-off-by: Pritam Manohar Sutar <pritam.sutar@samsung.com>
---
 .../bindings/phy/samsung,usb3-drd-phy.yaml    | 29 +++++++++++++++++++
 1 file changed, 29 insertions(+)

diff --git a/Documentation/devicetree/bindings/phy/samsung,usb3-drd-phy.yaml b/Documentation/devicetree/bindings/phy/samsung,usb3-drd-phy.yaml
index e906403208c0..8d8114eb5660 100644
--- a/Documentation/devicetree/bindings/phy/samsung,usb3-drd-phy.yaml
+++ b/Documentation/devicetree/bindings/phy/samsung,usb3-drd-phy.yaml
@@ -34,6 +34,7 @@ properties:
       - samsung,exynos7870-usbdrd-phy
       - samsung,exynos850-usbdrd-phy
       - samsung,exynos990-usbdrd-phy
+      - samsung,exynosautov920-usbdrd-phy
 
   clocks:
     minItems: 1
@@ -110,6 +111,15 @@ properties:
   vddh-usbdp-supply:
     description: VDDh power supply for the USB DP phy.
 
+  dvdd-supply:
+    description: 0.75V power supply for the USB phy.
+
+  vdd18-supply:
+    description: 1.8V power supply for the USB phy.
+
+  vdd33-supply:
+    description: 3.3V power supply for the USB phy.
+
 required:
   - compatible
   - clocks
@@ -219,6 +229,7 @@ allOf:
               - samsung,exynos7870-usbdrd-phy
               - samsung,exynos850-usbdrd-phy
               - samsung,exynos990-usbdrd-phy
+              - samsung,exynosautov920-usbdrd-phy
     then:
       properties:
         clocks:
@@ -236,6 +247,24 @@ allOf:
         reg-names:
           maxItems: 1
 
+  - if:
+      properties:
+        compatible:
+          contains:
+            enum:
+              - samsung,exynosautov920-usbdrd-phy
+    then:
+      required:
+        - dvdd-supply
+        - vdd18-supply
+        - vdd33-supply
+
+    else:
+      properties:
+        dvdd-supply: false
+        vdd18-supply: false
+        vdd33-supply: false
+
 unevaluatedProperties: false
 
 examples:
-- 
2.34.1


