Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C9783C7EE30
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  1 Jul 2025 14:51:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:References:Content-Type:
	Content-Transfer-Encoding:MIME-Version:In-Reply-To:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=RSiRk+FOT4DNKqboAFamlYzH4Uom4Urrgp6xmTmHgRM=; b=eYUNCh80olpTThznHCb18enVne
	PaCgOU/4sT/WnB/7pENn39VbSfhzAnDyfieToMWCYqsBy66Bgft8SEBG9Q3B+zEN2yMXNY40+Ti4S
	mnCNpbJNjNrJMsnzz9rqixGiVaCA+b/ugYZv8ntXGsDmY8Cfx7ksbB0mwn/PYgY4sYYp3dNjuDZdS
	8fnRuFGLVAJbf+7s13VnbmEe0DT/F+VACvYDfl0jP1q/GZdfjk1hgHoY/pizbtuzbJRoklTp4cSJA
	btgetsn2vf38VvImJl7RmsYcYHhMSyYGs969spQO3aPWgAekkRXeF1fYDe+X58jd0gn+xTMr/ZkTU
	ZGhywceg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uWcKY-00000005mAj-46fb;
	Tue, 01 Jul 2025 14:51:30 +0000
Received: from mailout3.samsung.com ([203.254.224.33])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uWaif-00000005SPJ-2miG
	for linux-arm-kernel@lists.infradead.org;
	Tue, 01 Jul 2025 13:08:19 +0000
Received: from epcas5p2.samsung.com (unknown [182.195.41.40])
	by mailout3.samsung.com (KnoxPortal) with ESMTP id 20250701130816epoutp03d3183834cd5cda75877deaff573bafbf~OIo13WmPJ1261912619epoutp03V
	for <linux-arm-kernel@lists.infradead.org>; Tue,  1 Jul 2025 13:08:16 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout3.samsung.com 20250701130816epoutp03d3183834cd5cda75877deaff573bafbf~OIo13WmPJ1261912619epoutp03V
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1751375296;
	bh=RSiRk+FOT4DNKqboAFamlYzH4Uom4Urrgp6xmTmHgRM=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=mA2tEYM+jXhlIO9Hc0oizFlLK21VASQmoBBzkUAjKz97MZXEFK4rpqphQR8t8zrzi
	 1VjGcpIFbyA2PybuW7awaRmQBB7fHdvoT4T8EJLqqMcz4Kks7NkLk/zptObhu+ABhb
	 dAvR1wEWVtS/XW1e9GXYKmoYl1xVn2BRCqX0Fpxc=
Received: from epsnrtp03.localdomain (unknown [182.195.42.155]) by
	epcas5p2.samsung.com (KnoxPortal) with ESMTPS id
	20250701130815epcas5p2a6c34c804d9dc216064f6315c128ff85~OIo03E2Xk2226922269epcas5p2X;
	Tue,  1 Jul 2025 13:08:15 +0000 (GMT)
Received: from epcas5p4.samsung.com (unknown [182.195.38.178]) by
	epsnrtp03.localdomain (Postfix) with ESMTP id 4bWjy50DQ9z3hhT4; Tue,  1 Jul
	2025 13:08:13 +0000 (GMT)
Received: from epsmtip1.samsung.com (unknown [182.195.34.30]) by
	epcas5p4.samsung.com (KnoxPortal) with ESMTPA id
	20250701120009epcas5p46bc2870446c499f9c0008c1d396650bb~OHtXw9dpn2412624126epcas5p4R;
	Tue,  1 Jul 2025 12:00:09 +0000 (GMT)
Received: from bose.samsungds.net (unknown [107.108.83.9]) by
	epsmtip1.samsung.com (KnoxPortal) with ESMTPA id
	20250701120006epsmtip18b4477dd17fd0b164ffd5e6b5429271b~OHtU0vI6c1563115631epsmtip1i;
	Tue,  1 Jul 2025 12:00:06 +0000 (GMT)
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
Subject: [PATCH v4 5/6] dt-bindings: phy: samsung,usb3-drd-phy: add
 ExynosAutov920 combo SS phy
Date: Tue,  1 Jul 2025 17:37:05 +0530
Message-Id: <20250701120706.2219355-6-pritam.sutar@samsung.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250701120706.2219355-1-pritam.sutar@samsung.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CMS-MailID: 20250701120009epcas5p46bc2870446c499f9c0008c1d396650bb
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-Sendblock-Type: REQ_APPROVE
CMS-TYPE: 105P
cpgsPolicy: CPGSC10-542,Y
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20250701120009epcas5p46bc2870446c499f9c0008c1d396650bb
References: <20250701120706.2219355-1-pritam.sutar@samsung.com>
	<CGME20250701120009epcas5p46bc2870446c499f9c0008c1d396650bb@epcas5p4.samsung.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250701_060818_015515_7C14EB8A 
X-CRM114-Status: GOOD (  12.02  )
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
compatible to the USB3.0 SS(5Gbps). 'Add-on USB2.0' phy is required
to support USB2.0 HS(480Mbps), FS(12Mbps) and LS(1.5Mbps) data rates.
These two phys are combined to form a combo phy.

Add a dedicated compatible string for USB combo SS phy found in this
SoC. The SoC requires two clocks, named "phy" and "ref" and various
power supplies (regulators) for the internal circuitry to work.
The required voltages are:
* avdd075_usb - 0.75v
* avdd18_usb20 - 1.8v
* avdd33_usb20 - 3.3v

Add schema only for 'USB3.1 SSP+' SS phy in this commit.

Signed-off-by: Pritam Manohar Sutar <pritam.sutar@samsung.com>
---
 Documentation/devicetree/bindings/phy/samsung,usb3-drd-phy.yaml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/phy/samsung,usb3-drd-phy.yaml b/Documentation/devicetree/bindings/phy/samsung,usb3-drd-phy.yaml
index b024339b5acc..b43b2ecbc132 100644
--- a/Documentation/devicetree/bindings/phy/samsung,usb3-drd-phy.yaml
+++ b/Documentation/devicetree/bindings/phy/samsung,usb3-drd-phy.yaml
@@ -34,6 +34,7 @@ properties:
       - samsung,exynos7870-usbdrd-phy
       - samsung,exynos850-usbdrd-phy
       - samsung,exynos990-usbdrd-phy
+      - samsung,exynosautov920-usb31drd-combo-ssphy
       - samsung,exynosautov920-usbdrd-combo-hsphy
       - samsung,exynosautov920-usbdrd-phy
 
@@ -251,6 +252,7 @@ allOf:
         compatible:
           contains:
             enum:
+              - samsung,exynosautov920-usb31drd-combo-ssphy
               - samsung,exynosautov920-usbdrd-combo-hsphy
               - samsung,exynosautov920-usbdrd-phy
     then:
-- 
2.34.1


