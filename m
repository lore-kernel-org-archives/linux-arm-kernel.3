Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9CDCACA0EFA
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 21 Aug 2025 09:40:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:References:Content-Type:
	Content-Transfer-Encoding:MIME-Version:In-Reply-To:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Gq+PpG5cVj4mp8JBa0dZZvGn/EEDRm/JzW0Q8UqHc3o=; b=npVKV9V4YYkncD0oeBs7uDGwy4
	EhYNYnJMmIm8vO7FqLQaF8iNIVul9nykE+JR8PG91cwHVzIEMDzzn6BYdy1z887GFwg9HzPPq4qkA
	fIyRxEp7e6NNesm38GI+9viJFGpMGO+pQhGF+MygRyzedvQC3WyjIt97hjNs3Bs/4vfi1+yX2d+rY
	KKzieYqUhvz8UpJ9aHxdZUCJ9jvoPpfDekm2FRJlmVjSvP3VB3mgvtp6YJht2Xct2auIoCwCNyuuP
	nhyuW2Q22cxpvwr6wQK0U6VBQPOnnJTVwkJmgoT/BeO8MdQKZOhxk9ndIP82FKWqxd4ccoydFXdV6
	XL2mkRzw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1up1m0-0000000GQXR-1ae9;
	Thu, 21 Aug 2025 09:39:56 +0000
Received: from mailout1.samsung.com ([203.254.224.24])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uozig-0000000G6Vr-2G5x
	for linux-arm-kernel@lists.infradead.org;
	Thu, 21 Aug 2025 07:28:23 +0000
Received: from epcas5p1.samsung.com (unknown [182.195.41.39])
	by mailout1.samsung.com (KnoxPortal) with ESMTP id 20250821072820epoutp0133dda70c2f4559df43553286065bf2aa~dt5nKO5I-2223422234epoutp01l
	for <linux-arm-kernel@lists.infradead.org>; Thu, 21 Aug 2025 07:28:20 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout1.samsung.com 20250821072820epoutp0133dda70c2f4559df43553286065bf2aa~dt5nKO5I-2223422234epoutp01l
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1755761300;
	bh=Gq+PpG5cVj4mp8JBa0dZZvGn/EEDRm/JzW0Q8UqHc3o=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=payywIUiYNsb8CDaWwv6Z81KieBGZLvmP/0hU8ieQ2L8TAl8utAneIDmByWevHdsq
	 YzkIyyEYMimhxrSTf0tr/d4kimTNXUoeyk2n9NK0FAdLx0AqrgUTlR4RDOX0cDwnze
	 vlWEZc/mJbeo9GQNw91NIE5g7BBlGMmNScKeTk1s=
Received: from epsnrtp01.localdomain (unknown [182.195.42.153]) by
	epcas5p2.samsung.com (KnoxPortal) with ESMTPS id
	20250821072820epcas5p24ed0de20d41342b2f7f94aa6b8790470~dt5mk5G911748617486epcas5p2R;
	Thu, 21 Aug 2025 07:28:20 +0000 (GMT)
Received: from epcas5p3.samsung.com (unknown [182.195.38.94]) by
	epsnrtp01.localdomain (Postfix) with ESMTP id 4c6w0M1SmBz6B9mF; Thu, 21 Aug
	2025 07:28:19 +0000 (GMT)
Received: from epsmtip1.samsung.com (unknown [182.195.34.30]) by
	epcas5p1.samsung.com (KnoxPortal) with ESMTPA id
	20250821072818epcas5p1763afdfb7f0b4cf48a98d9c4e6eca055~dt5k5IxOg0472004720epcas5p1u;
	Thu, 21 Aug 2025 07:28:18 +0000 (GMT)
Received: from bose.samsungds.net (unknown [107.108.83.9]) by
	epsmtip1.samsung.com (KnoxPortal) with ESMTPA id
	20250821072815epsmtip14ad9e3879f13ec088a32dcaab8c76f77~dt5h4Cuyt0624006240epsmtip1k;
	Thu, 21 Aug 2025 07:28:15 +0000 (GMT)
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
Subject: [PATCH v6 5/6] dt-bindings: phy: samsung,usb3-drd-phy: add
 ExynosAutov920 combo ssphy
Date: Thu, 21 Aug 2025 13:07:02 +0530
Message-Id: <20250821073703.2498302-6-pritam.sutar@samsung.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250821073703.2498302-1-pritam.sutar@samsung.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CMS-MailID: 20250821072818epcas5p1763afdfb7f0b4cf48a98d9c4e6eca055
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
CMS-TYPE: 105P
cpgsPolicy: CPGSC10-542,Y
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20250821072818epcas5p1763afdfb7f0b4cf48a98d9c4e6eca055
References: <20250821073703.2498302-1-pritam.sutar@samsung.com>
	<CGME20250821072818epcas5p1763afdfb7f0b4cf48a98d9c4e6eca055@epcas5p1.samsung.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250821_002822_895896_C58E84FE 
X-CRM114-Status: GOOD (  13.67  )
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
 .../bindings/phy/samsung,usb3-drd-phy.yaml    | 23 +++++++++++++++++++
 1 file changed, 23 insertions(+)

diff --git a/Documentation/devicetree/bindings/phy/samsung,usb3-drd-phy.yaml b/Documentation/devicetree/bindings/phy/samsung,usb3-drd-phy.yaml
index f0cfca5736b8..96e5bbb2e42c 100644
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
@@ -262,6 +270,21 @@ allOf:
       properties:
         dvdd075-usb20-supply: false
         vdd18-usb20-supply: false
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
+    else:
+      properties:
+        dvdd075-usb30-supply: false
+        vdd18-usb30-supply: false
 
 unevaluatedProperties: false
 
-- 
2.34.1


