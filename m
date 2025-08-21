Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9B3F0CA0FE1
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 21 Aug 2025 09:39:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:References:Content-Type:
	Content-Transfer-Encoding:MIME-Version:In-Reply-To:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/UZny0nmt2vMBkU2e/gpL3R9Mx0QIOy020xV8xd0zVI=; b=fY7AT8wlFsv3AuAPWmFIMZRtJf
	ZD8kA1GtelBwfAFLsKjT82y9oPeLs95vbGkMqD7D4tgfVUNitqKq/6byV2OyODuiyhnlczN5XzTfA
	1Zu1PxkyAeHIhhOBOCfYNCBLGyes2umvxsFTYOf/0AriKuJ0JbgjHXLbzk4ph6iTMLeN5iw55fqOn
	aq1It9yallhEFbQ6fy2BZ4P3MQC1vTJbWV6bauinijo3xzkwPcJibCg2nYQRSDRqRUhj4cTJeXs/c
	+koGD0HlV6HYnAP+KNOFLXQaY11EPTfW9I/UU0KgLwXx9JGu15kVzo94rTruuTTlpnwDeTOLyHUMd
	LoedHSsA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1up1ls-0000000GQJo-2v3W;
	Thu, 21 Aug 2025 09:39:49 +0000
Received: from mailout2.samsung.com ([203.254.224.25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uoziZ-0000000G6SL-2UtA
	for linux-arm-kernel@lists.infradead.org;
	Thu, 21 Aug 2025 07:28:20 +0000
Received: from epcas5p2.samsung.com (unknown [182.195.41.40])
	by mailout2.samsung.com (KnoxPortal) with ESMTP id 20250821072807epoutp02faca17fe80d4fa280a11919265e0f6ac~dt5aYVPTn0131201312epoutp024
	for <linux-arm-kernel@lists.infradead.org>; Thu, 21 Aug 2025 07:28:07 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout2.samsung.com 20250821072807epoutp02faca17fe80d4fa280a11919265e0f6ac~dt5aYVPTn0131201312epoutp024
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1755761287;
	bh=/UZny0nmt2vMBkU2e/gpL3R9Mx0QIOy020xV8xd0zVI=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=llwLGrfwDTxzOdI6xv87THuL6s+Ai4wIhJVXMcxuIgyvn0EebpKYTatCaiU9DadyG
	 xoya5nNwPpLx9kOAlNItiWWJv+/SueYuQM2nqNKZ9thxf1YSDVEl+a2GLOvXUTqv8U
	 EnQENjv7UVs8G1qWynk1Q/5Hx9cctospbohtiyk4=
Received: from epsnrtp02.localdomain (unknown [182.195.42.154]) by
	epcas5p1.samsung.com (KnoxPortal) with ESMTPS id
	20250821072806epcas5p1d013b385ea49b1be2cf7989d44b02877~dt5ZhYmnr0117501175epcas5p18;
	Thu, 21 Aug 2025 07:28:06 +0000 (GMT)
Received: from epcas5p4.samsung.com (unknown [182.195.38.93]) by
	epsnrtp02.localdomain (Postfix) with ESMTP id 4c6w051R5Sz2SSKf; Thu, 21 Aug
	2025 07:28:05 +0000 (GMT)
Received: from epsmtip1.samsung.com (unknown [182.195.34.30]) by
	epcas5p2.samsung.com (KnoxPortal) with ESMTPA id
	20250821072804epcas5p20256917f2a714f4946139174f8fc20f5~dt5X2Ebhl0550705507epcas5p29;
	Thu, 21 Aug 2025 07:28:04 +0000 (GMT)
Received: from bose.samsungds.net (unknown [107.108.83.9]) by
	epsmtip1.samsung.com (KnoxPortal) with ESMTPA id
	20250821072801epsmtip13370fcd9bc3653a3c56cfcf69abae89a~dt5UxkUol0593105931epsmtip1E;
	Thu, 21 Aug 2025 07:28:01 +0000 (GMT)
From: Pritam Manohar Sutar <pritam.sutar@samsung.com>
To: vkoul@kernel.org, kishon@kernel.org, robh@kernel.org,
	krzk+dt@kernel.org, conor+dt@kernel.org, alim.akhtar@samsung.com,
	andre.draszik@linaro.org, peter.griffin@linaro.org, kauschluss@disroot.org,
	ivo.ivanov.ivanov1@gmail.com, igor.belwon@mentallysanemainliners.org,
	johan@kernel.org, m.szyprowski@samsung.com, s.nawrocki@samsung.com,
	pritam.sutar@samsung.com
Cc: linux-phy@lists.infradead.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org, rosa.pila@samsung.com,
	dev.tailor@samsung.com, faraz.ata@samsung.com, muhammed.ali@samsung.com,
	selvarasu.g@samsung.com
Subject: [PATCH v6 1/6] dt-bindings: phy: samsung,usb3-drd-phy: add
 ExynosAutov920 HS phy compatible
Date: Thu, 21 Aug 2025 13:06:58 +0530
Message-Id: <20250821073703.2498302-2-pritam.sutar@samsung.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250821073703.2498302-1-pritam.sutar@samsung.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CMS-MailID: 20250821072804epcas5p20256917f2a714f4946139174f8fc20f5
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
CMS-TYPE: 105P
cpgsPolicy: CPGSC10-542,Y
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20250821072804epcas5p20256917f2a714f4946139174f8fc20f5
References: <20250821073703.2498302-1-pritam.sutar@samsung.com>
	<CGME20250821072804epcas5p20256917f2a714f4946139174f8fc20f5@epcas5p2.samsung.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250821_002816_941203_7CBF47F2 
X-CRM114-Status: GOOD (  10.56  )
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

This SoC has USB2.0 phy and supports only UTMI+ interface. This phy
requires two clocks, named as "phy" and "ref". The required supplies for
this phy are vdd075_usb20(0.75v), vdd18_usb20(1.8v), vdd33_usb20(3.3v).

Add a dedicated compatible string for USB HS phy found in this SoC.

Signed-off-by: Pritam Manohar Sutar <pritam.sutar@samsung.com>
---
 .../bindings/phy/samsung,usb3-drd-phy.yaml    | 24 +++++++++++++++++++
 1 file changed, 24 insertions(+)

diff --git a/Documentation/devicetree/bindings/phy/samsung,usb3-drd-phy.yaml b/Documentation/devicetree/bindings/phy/samsung,usb3-drd-phy.yaml
index e906403208c0..e238fd0c9f6c 100644
--- a/Documentation/devicetree/bindings/phy/samsung,usb3-drd-phy.yaml
+++ b/Documentation/devicetree/bindings/phy/samsung,usb3-drd-phy.yaml
@@ -34,6 +34,7 @@ properties:
       - samsung,exynos7870-usbdrd-phy
       - samsung,exynos850-usbdrd-phy
       - samsung,exynos990-usbdrd-phy
+      - samsung,exynosautov920-usbdrd-phy
 
   clocks:
     minItems: 1
@@ -110,6 +111,12 @@ properties:
   vddh-usbdp-supply:
     description: VDDh power supply for the USB DP phy.
 
+  dvdd075-usb20-supply:
+    description: 0.75V power supply for the USB 2.0 phy.
+
+  vdd18-usb20-supply:
+    description: 1.8V power supply for the USB 2.0 phy.
+
 required:
   - compatible
   - clocks
@@ -219,6 +226,7 @@ allOf:
               - samsung,exynos7870-usbdrd-phy
               - samsung,exynos850-usbdrd-phy
               - samsung,exynos990-usbdrd-phy
+              - samsung,exynosautov920-usbdrd-phy
     then:
       properties:
         clocks:
@@ -235,6 +243,22 @@ allOf:
 
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
+        - dvdd075-usb20-supply
+        - vdd18-usb20-supply
+        - vdd33-usb20-supply
+
+    else:
+      properties:
+        dvdd075-usb20-supply: false
+        vdd18-usb20-supply: false
 
 unevaluatedProperties: false
 
-- 
2.34.1


