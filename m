Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 88F71C83038
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  2 Jul 2025 04:18:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:References:Content-Type:
	Content-Transfer-Encoding:MIME-Version:In-Reply-To:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=dzSOjmVG/qviZa0J9qW06zNK9D7hAaYltgUrXMSHzgY=; b=kRqKoPhXPqRKgYLQso239/kJd8
	O7tAlGbDI+oMxCduzCE/z88AxjCjcnMDl21m7Zw9tOdY/qipxdFHdv4Ws4oKg+VYjUYD2zXxPDGWJ
	aXAfnDCdy+yLdceAuRX1PmHrB6/rUk7YRcr7Ng+BntTN7AnevG82TP253IYnTpWepKnR3bw0JS356
	8yBT5WM6SVMZPdOTMDTwuqR7SbsTKe6gsggtrb3Tl6MTvO138Q4UhOarm1JUaYjFrYzpPvBhCOXZG
	ToLVV6FlPFwZbWNr7lLRoSlxpY+Lgk39Xpnr7a+uxQ1L7xBLQwr9kQN5eFA+gt3hijNGZam+6iaCr
	5ow5GW1w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uWov4-00000007AwD-0tjz;
	Wed, 02 Jul 2025 04:18:02 +0000
Received: from mailout2.samsung.com ([203.254.224.25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uWosh-00000007ApH-414Y
	for linux-arm-kernel@lists.infradead.org;
	Wed, 02 Jul 2025 04:15:38 +0000
Received: from epcas5p1.samsung.com (unknown [182.195.41.39])
	by mailout2.samsung.com (KnoxPortal) with ESMTP id 20250702041529epoutp025019ebff97042f4171acb711790fe5ce~OVA84tN-30825308253epoutp02E
	for <linux-arm-kernel@lists.infradead.org>; Wed,  2 Jul 2025 04:15:29 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout2.samsung.com 20250702041529epoutp025019ebff97042f4171acb711790fe5ce~OVA84tN-30825308253epoutp02E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1751429729;
	bh=dzSOjmVG/qviZa0J9qW06zNK9D7hAaYltgUrXMSHzgY=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=CW7cJ8lNmOX7W7eKnWmaDaGdf2TsVi/E6M2NaEVnqX9+IRFo4FxbZgrFpGxBJkwSa
	 t6ZkbEkZXeEMoLxaje1BNULjPREApZ8ZZytIFgTpxPVeXloy+e9mUCPsfDSGDrN0AY
	 zttuqgdEnSSLevfWP3W5B02sed8ozo+YBTyecyxU=
Received: from epsnrtp01.localdomain (unknown [182.195.42.153]) by
	epcas5p1.samsung.com (KnoxPortal) with ESMTPS id
	20250702041528epcas5p11f7b012fab5de2fb22c70089c32308d9~OVA7rT1ZB2996129961epcas5p13;
	Wed,  2 Jul 2025 04:15:28 +0000 (GMT)
Received: from epcas5p4.samsung.com (unknown [182.195.38.175]) by
	epsnrtp01.localdomain (Postfix) with ESMTP id 4bX64t0JyTz6B9mM; Wed,  2 Jul
	2025 04:15:26 +0000 (GMT)
Received: from epsmtip1.samsung.com (unknown [182.195.34.30]) by
	epcas5p2.samsung.com (KnoxPortal) with ESMTPA id
	20250701120002epcas5p2c4d728d599a819057bcc40b724881276~OHtRg2gIH0511605116epcas5p2i;
	Tue,  1 Jul 2025 12:00:02 +0000 (GMT)
Received: from bose.samsungds.net (unknown [107.108.83.9]) by
	epsmtip1.samsung.com (KnoxPortal) with ESMTPA id
	20250701115959epsmtip1bb515e6078065cef456ed1ede6dc339f~OHtOlyyB_1373213732epsmtip14;
	Tue,  1 Jul 2025 11:59:59 +0000 (GMT)
From: Pritam Manohar Sutar <pritam.sutar@samsung.com>
To: vkoul@kernel.org, kishon@kernel.org, robh@kernel.org,
	krzk+dt@kernel.org, conor+dt@kernel.org, alim.akhtar@samsung.com,
	andre.draszik@linaro.org, peter.griffin@linaro.org,
	neil.armstrong@linaro.org, kauschluss@disroot.org,
	ivo.ivanov.ivanov1@gmail.com, m.szyprowski@samsung.com,
	s.nawrocki@samsung.com, pritam.sutar@samsung.com
Cc: linux-phy@lists.infradead.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org, rosa.pila@samsung.com,
	dev.tailor@samsung.com, faraz.ata@samsung.com, muhammed.ali@samsung.com,
	selvarasu.g@samsung.com
Subject: [PATCH v4 3/6] dt-bindings: phy: samsung,usb3-drd-phy: add
 ExynosAutov920 combo HS phy
Date: Tue,  1 Jul 2025 17:37:03 +0530
Message-Id: <20250701120706.2219355-4-pritam.sutar@samsung.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250701120706.2219355-1-pritam.sutar@samsung.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CMS-MailID: 20250701120002epcas5p2c4d728d599a819057bcc40b724881276
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-Sendblock-Type: REQ_APPROVE
CMS-TYPE: 105P
cpgsPolicy: CPGSC10-542,Y
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20250701120002epcas5p2c4d728d599a819057bcc40b724881276
References: <20250701120706.2219355-1-pritam.sutar@samsung.com>
	<CGME20250701120002epcas5p2c4d728d599a819057bcc40b724881276@epcas5p2.samsung.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250701_211536_617197_3DC624DF 
X-CRM114-Status: GOOD (  12.57  )
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
compatible to the USB3.0 SS(5Gbps). 'Add-on USB2.0' phy is added
to support USB2.0 HS(480Mbps), FS(12Mbps) and LS(1.5Mbps) data rates.
These two phys are combined to form a combo phy.

Add a dedicated compatible string for USB combo HS phy found in this
SoC. The SoC requires two clocks, named "phy" and "ref" and various
power supplies (regulators) for the internal circuitry to work.
The required voltages are:
* avdd075_usb - 0.75v
* avdd18_usb20 - 1.8v
* avdd33_usb20 - 3.3v

Add schema only for 'Add-on USB2.0' HS phy in this combo phy.

Signed-off-by: Pritam Manohar Sutar <pritam.sutar@samsung.com>
---
 Documentation/devicetree/bindings/phy/samsung,usb3-drd-phy.yaml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/phy/samsung,usb3-drd-phy.yaml b/Documentation/devicetree/bindings/phy/samsung,usb3-drd-phy.yaml
index 2e29ff749bba..b024339b5acc 100644
--- a/Documentation/devicetree/bindings/phy/samsung,usb3-drd-phy.yaml
+++ b/Documentation/devicetree/bindings/phy/samsung,usb3-drd-phy.yaml
@@ -34,6 +34,7 @@ properties:
       - samsung,exynos7870-usbdrd-phy
       - samsung,exynos850-usbdrd-phy
       - samsung,exynos990-usbdrd-phy
+      - samsung,exynosautov920-usbdrd-combo-hsphy
       - samsung,exynosautov920-usbdrd-phy
 
   clocks:
@@ -250,6 +251,7 @@ allOf:
         compatible:
           contains:
             enum:
+              - samsung,exynosautov920-usbdrd-combo-hsphy
               - samsung,exynosautov920-usbdrd-phy
     then:
       properties:
-- 
2.34.1


