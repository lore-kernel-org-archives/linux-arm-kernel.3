Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E7921C87FCB
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  5 Aug 2025 18:04:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:References:Content-Type:
	Content-Transfer-Encoding:MIME-Version:In-Reply-To:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=butMxkt3CmNqo8ZKkw5fJLl7FH5PZlVxY7GC0RKm6xw=; b=uIqZt2z76LTS13ZLjr52ieEJAF
	En6xQIwuo8zSvWuHZ2He5OioB0PphoOdwSdbesF6C8Xdt4WY8PXe0TfUDyvPNQ9YKAdj2YfgvXVsp
	KXIPPrKwjhXcv5BGdHE8sju6X8rnGVq57Jc4xf8quadUXtg8y6oO5LPM0PVRi1W4+2BJ1t33V2ISe
	74eB+xCujiVCu7NF2m0YWyLEUoBWcw2//JzVHJpASsrBW4ahT69xLmSpUBDynUGfCbu2gZ9QQqYDB
	C/SJPiCTSn1oEELaIniwAsaKQgYHSVuRYI6GJ6YOVS56OPWaQ3ndXFVBy5dI4l03ZcYdUqwYM5LND
	dDSs99Fw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ujM1l-0000000DVQ4-3KXL;
	Tue, 05 Aug 2025 18:04:45 +0000
Received: from mailout1.samsung.com ([203.254.224.24])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ujLNA-0000000DQ7m-3QGC
	for linux-arm-kernel@lists.infradead.org;
	Tue, 05 Aug 2025 17:22:50 +0000
Received: from epcas5p4.samsung.com (unknown [182.195.41.42])
	by mailout1.samsung.com (KnoxPortal) with ESMTP id 20250805172247epoutp01b4c658f72e17fd6a2c54ebffb42947ae~Y7sDosjzb2140921409epoutp01o
	for <linux-arm-kernel@lists.infradead.org>; Tue,  5 Aug 2025 17:22:47 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout1.samsung.com 20250805172247epoutp01b4c658f72e17fd6a2c54ebffb42947ae~Y7sDosjzb2140921409epoutp01o
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1754414567;
	bh=butMxkt3CmNqo8ZKkw5fJLl7FH5PZlVxY7GC0RKm6xw=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=DVYrcYqPjBomcfUqG/eUKK42h91dI+7pDZZJzbr8QEJTuzp3WJ0OQO5gRArOF57Bz
	 SRNoZOG6vrrM0Am31w8hWKJcRWKXln/xNDTCKZlkpSvcmLo0+PEUpZmhCk2EImZAeI
	 WseZ1lVCLkbOze65f42g7618SovqTJIU/O68DDQM=
Received: from epsnrtp04.localdomain (unknown [182.195.42.156]) by
	epcas5p1.samsung.com (KnoxPortal) with ESMTPS id
	20250805172246epcas5p16c95b3e82936251b80118d788a48a3b4~Y7sCnLayd3014130141epcas5p1T;
	Tue,  5 Aug 2025 17:22:46 +0000 (GMT)
Received: from epcas5p1.samsung.com (unknown [182.195.38.93]) by
	epsnrtp04.localdomain (Postfix) with ESMTP id 4bxKxd0xrYz6B9m5; Tue,  5 Aug
	2025 17:22:45 +0000 (GMT)
Received: from epsmtip1.samsung.com (unknown [182.195.34.30]) by
	epcas5p3.samsung.com (KnoxPortal) with ESMTPA id
	20250805114320epcas5p3968288f8d01944d3d730b3094a7befe4~Y3DrVW8uf1521715217epcas5p3C;
	Tue,  5 Aug 2025 11:43:20 +0000 (GMT)
Received: from bose.samsungds.net (unknown [107.108.83.9]) by
	epsmtip1.samsung.com (KnoxPortal) with ESMTPA id
	20250805114316epsmtip1786da2ef65e10ab19b965d79fc527bc4~Y3DoafOPg1492214922epsmtip1L;
	Tue,  5 Aug 2025 11:43:16 +0000 (GMT)
From: Pritam Manohar Sutar <pritam.sutar@samsung.com>
To: vkoul@kernel.org, kishon@kernel.org, robh@kernel.org,
	krzk+dt@kernel.org, conor+dt@kernel.org, alim.akhtar@samsung.com,
	andre.draszik@linaro.org, peter.griffin@linaro.org, kauschluss@disroot.org,
	ivo.ivanov.ivanov1@gmail.com, igor.belwon@mentallysanemainliners.org,
	m.szyprowski@samsung.com, s.nawrocki@samsung.com, pritam.sutar@samsung.com
Cc: linux-phy@lists.infradead.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org, rosa.pila@samsung.com,
	dev.tailor@samsung.com, faraz.ata@samsung.com, muhammed.ali@samsung.com,
	selvarasu.g@samsung.com
Subject: [PATCH v5 5/6] dt-bindings: phy: samsung,usb3-drd-phy: add
 ExynosAutov920 combo ssphy
Date: Tue,  5 Aug 2025 17:22:15 +0530
Message-Id: <20250805115216.3798121-6-pritam.sutar@samsung.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250805115216.3798121-1-pritam.sutar@samsung.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CMS-MailID: 20250805114320epcas5p3968288f8d01944d3d730b3094a7befe4
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-Sendblock-Type: REQ_APPROVE
CMS-TYPE: 105P
cpgsPolicy: CPGSC10-542,Y
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20250805114320epcas5p3968288f8d01944d3d730b3094a7befe4
References: <20250805115216.3798121-1-pritam.sutar@samsung.com>
	<CGME20250805114320epcas5p3968288f8d01944d3d730b3094a7befe4@epcas5p3.samsung.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250805_102249_166312_A0A67DF2 
X-CRM114-Status: GOOD (  13.84  )
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

This phy supports USB3.1 SSP+(10Gbps) protocol and is backwards
compatible to the USB3.0 SS(5Gbps). It requires two clocks, named
"phy" and "ref". The required supplies for USB3.1 are named as
vdd075_usb30(0.75v), vdd18_usb30(1.8v).

Add schemas for combo ssphy found on this SoC.

Signed-off-by: Pritam Manohar Sutar <pritam.sutar@samsung.com>
---
 .../bindings/phy/samsung,usb3-drd-phy.yaml    | 19 +++++++++++++++++++
 1 file changed, 19 insertions(+)

diff --git a/Documentation/devicetree/bindings/phy/samsung,usb3-drd-phy.yaml b/Documentation/devicetree/bindings/phy/samsung,usb3-drd-phy.yaml
index 4a84b5405cd2..7a71cff10fb5 100644
--- a/Documentation/devicetree/bindings/phy/samsung,usb3-drd-phy.yaml
+++ b/Documentation/devicetree/bindings/phy/samsung,usb3-drd-phy.yaml
@@ -34,6 +34,7 @@ properties:
       - samsung,exynos7870-usbdrd-phy
       - samsung,exynos850-usbdrd-phy
       - samsung,exynos990-usbdrd-phy
+      - samsung,exynosautov920-usb31drd-combo-ssphy
       - samsung,exynosautov920-usbdrd-combo-hsphy
       - samsung,exynosautov920-usbdrd-phy
 
@@ -118,6 +119,12 @@ properties:
   vdd18-usb20-supply:
     description: 1.8V power supply for the USB 2.0 phy.
 
+  dvdd075-usb30-supply:
+    description: 0.75V power supply for the USB 3.0 phy.
+
+  vdd18-usb30-supply:
+    description: 1.8V power supply for the USB 3.0 phy.
+
 required:
   - compatible
   - clocks
@@ -227,6 +234,7 @@ allOf:
               - samsung,exynos7870-usbdrd-phy
               - samsung,exynos850-usbdrd-phy
               - samsung,exynos990-usbdrd-phy
+              - samsung,exynosautov920-usb31drd-combo-ssphy
               - samsung,exynosautov920-usbdrd-combo-hsphy
               - samsung,exynosautov920-usbdrd-phy
     then:
@@ -258,6 +266,17 @@ allOf:
         - vdd18-usb20-supply
         - vdd33-usb20-supply
 
+  - if:
+      properties:
+        compatible:
+          contains:
+            enum:
+              - samsung,exynosautov920-usb31drd-combo-ssphy
+    then:
+      required:
+        - dvdd075-usb30-supply
+        - vdd18-usb30-supply
+
 unevaluatedProperties: false
 
 examples:
-- 
2.34.1


