Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 37BBCC61DB2
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 13 Jun 2025 08:24:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:References:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:List-Owner;
	bh=4rxJOsSbzAi1rSx7tMZfzuZ5keXxRr4NSOqYZdfrDVM=; b=v5m1Xq201VXmQSbhOb3WWs8olo
	LqdrJ0X6Hd2LbtxzZ6xrDTaEmIkETlSOrMhd9PaWRmHEbtUZw3J3euUmQsYFGtX6xW2aGI5NCiq8j
	n9bej2s1LPucGuoJwvQ2mw05snBOf2Jao7dyV4LK4wrg7UEJvPEzJeZLeZUuON+CMplpZ1JuO6JtL
	zLYNjtyMRoT8sJ+6kfar8HX+ZiNHlolKryztdiUb+94bWF2Iku3OfxHfLUQuyPQEBMsT/4fa0Ap92
	Y73GL48KdWp1MaKfDUDafzY6YXBETQFN0/4ZwwfMlktsmSYvyQ+Z7QRqa5iJhI2V4shNMBrIffBz8
	dMD+WMiQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uPziC-0000000FkQk-2npX;
	Fri, 13 Jun 2025 08:24:33 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uPyY4-0000000FZEr-3oWq
	for linux-arm-kernel@bombadil.infradead.org;
	Fri, 13 Jun 2025 07:10:01 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=References:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-Id:Date:Subject:Cc:To:From:
	Sender:Reply-To:Content-ID:Content-Description:In-Reply-To;
	bh=4rxJOsSbzAi1rSx7tMZfzuZ5keXxRr4NSOqYZdfrDVM=; b=O2ArGfwZcbi2vWjNMs/H1BbglW
	TDhA30oT2kRAVTtSRHYlboneYooloJkrN6MuaCKDgp8r5dEHTEp+L1X7f+OZgIYwH17NuBA1wu2cE
	2ykyQv4tN0o0sJ67EkSb7C50Y0nnqp8Vp19p58p7BinclwDAlCEpA7+21dYz64bL9Hr9CJ52lFSpq
	J5CrhmKUi5kj80KDLBFYsyizHOaHbK2oEb8pUEpzJiYWMM9R9d80imRW/Ifuq4rvRn8mQKlL5S+Kn
	lx1mEaBMS3Y6U6F8MA/krXWoP2dGl9w5R5+9M6uhVg4CzwZ68r39W/aCGUFM/nYHoYC0AXiBlq2Eu
	cYxWLe6g==;
Received: from mailout3.samsung.com ([203.254.224.33])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uPyXz-00000002svL-3MKC
	for linux-arm-kernel@lists.infradead.org;
	Fri, 13 Jun 2025 07:10:00 +0000
Received: from epcas5p2.samsung.com (unknown [182.195.41.40])
	by mailout3.samsung.com (KnoxPortal) with ESMTP id 20250613070945epoutp03cd5ca9dc9930a7a7a2ca41ae9acc651c~IiIrPfhsS2274422744epoutp03f
	for <linux-arm-kernel@lists.infradead.org>; Fri, 13 Jun 2025 07:09:45 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout3.samsung.com 20250613070945epoutp03cd5ca9dc9930a7a7a2ca41ae9acc651c~IiIrPfhsS2274422744epoutp03f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1749798585;
	bh=4rxJOsSbzAi1rSx7tMZfzuZ5keXxRr4NSOqYZdfrDVM=;
	h=From:To:Cc:Subject:Date:References:From;
	b=jyTD43520uGklfDpW55D2tlDHzRZA+aQFXHVto3oYxgJBDppzeEH28bnU7Rz/u3Zc
	 ChPe3w+iqO6K770s22AiGMEUl2iuLfSENZilkyxm3pCTPuZ2l3Szw98THP+CdpC7MJ
	 J6U1Ty9beKRRTVVSidDTxP6EgbbmGGgjSTolp/AI=
Received: from epsnrtp02.localdomain (unknown [182.195.42.154]) by
	epcas5p4.samsung.com (KnoxPortal) with ESMTPS id
	20250613070944epcas5p4fb9a3a1ac8efd5fe761a87bdd3bdb9a7~IiIqrYOum3162531625epcas5p4I;
	Fri, 13 Jun 2025 07:09:44 +0000 (GMT)
Received: from epcas5p1.samsung.com (unknown [182.195.38.177]) by
	epsnrtp02.localdomain (Postfix) with ESMTP id 4bJVrk3S8Sz2SSL3; Fri, 13 Jun
	2025 07:09:42 +0000 (GMT)
Received: from epsmtip1.samsung.com (unknown [182.195.34.30]) by
	epcas5p1.samsung.com (KnoxPortal) with ESMTPA id
	20250613055037epcas5p1ce00fda1b535dbeb9a98458d1f0a28ee~IhDlgAhv32498524985epcas5p1P;
	Fri, 13 Jun 2025 05:50:37 +0000 (GMT)
Received: from bose.samsungds.net (unknown [107.108.83.9]) by
	epsmtip1.samsung.com (KnoxPortal) with ESMTPA id
	20250613055034epsmtip10250c53b0f9deb8cb30d93844ecf5c91~IhDixE4HP0217702177epsmtip1f;
	Fri, 13 Jun 2025 05:50:34 +0000 (GMT)
From: Pritam Manohar Sutar <pritam.sutar@samsung.com>
To: vkoul@kernel.org, kishon@kernel.org, robh@kernel.org,
	krzk+dt@kernel.org, conor+dt@kernel.org, alim.akhtar@samsung.com,
	andre.draszik@linaro.org, peter.griffin@linaro.org, kauschluss@disroot.org,
	ivo.ivanov.ivanov1@gmail.com, m.szyprowski@samsung.com,
	s.nawrocki@samsung.com, pritam.sutar@samsung.com
Cc: linux-phy@lists.infradead.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org, rosa.pila@samsung.com,
	dev.tailor@samsung.com, faraz.ata@samsung.com, muhammed.ali@samsung.com,
	selvarasu.g@samsung.com
Subject: [PATCH v3 0/9] initial usbdrd phy support for Exynosautov920 soc
Date: Fri, 13 Jun 2025 11:26:04 +0530
Message-Id: <20250613055613.866909-1-pritam.sutar@samsung.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CMS-MailID: 20250613055037epcas5p1ce00fda1b535dbeb9a98458d1f0a28ee
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-Sendblock-Type: REQ_APPROVE
CMS-TYPE: 105P
cpgsPolicy: CPGSC10-542,Y
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20250613055037epcas5p1ce00fda1b535dbeb9a98458d1f0a28ee
References: <CGME20250613055037epcas5p1ce00fda1b535dbeb9a98458d1f0a28ee@epcas5p1.samsung.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250613_080958_060605_0DA8E215 
X-CRM114-Status: GOOD (  12.14  )
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

This SoC has a single USB 3.1 DRD combo phy and three USB2.0 only
DRD phy controllers

  - Combo phy supports USB3.1 SSP+(10Gbps) protocol and is backwards
    compatible to the USB3.0 SS(5Gbps). 'Add-on USB2.0' phy is added
    to support USB2.0 HS(480Mbps), FS(12Mbps) and LS(1.5Mbps) data 
    rates. These two phys are combined to form a combo phy as mentioned
    below.
 
   USB30DRD_0 port

     +-----------------------------------------------------+
     |                                                     |
     |           (combo) USB PHY controller                |
     |     +-----------------------------------------+     |
     |     |               USB HSPHY                 |     |
     |     |  (samsung,exynosautov920-usbdrd-hsphy)  |     |
     |     +-----------------------------------------+     |
     |                                                     |
     |   +---------------------------------------------+   |
     |   |               USB SSPHY                     |   |
     |   |   (samsung,exynosautov920-usb31drd-ssphy)   |   |
     |   +---------------------------------------------+   |
     |                                                     |
     +-----------------------------------------------------+
     |                                                     |
     |                USBDRD30 Link                        |
     |                  Controller                         |
     |                                                     |
     +-----------------------------------------------------+

  - USB2.0 phy supports only UTMI+ interface. USB2.0DRD phy
    is very similar to the existing Exynos850 support in this driver.

    USB20DRD_0/1/2 ports

 
      +---------------------------------------------------+
      |                                                   |
      |                USB PHY controller                 |
      |    +-----------------------------------------+    |
      |    |              USB HSPHY                  |    |
      |    |  (samsung,exynosautov920-usbdrd-phy)    |    |
      |    +-----------------------------------------+    |
      |                                                   |
      +---------------------------------------------------+
      |                                                   |
      |             USBDRD20_* Link                       |
      |                Controller                         |
      |                                                   |
      +---------------------------------------------------+

This patchset only supports device mode and same is verified with
as NCM device with below configfs commands

changelog
----------
Changes in v2:
- Used standard GENMASK() and FIELD_GET() to get the major version
  from controller version register.
  link for v1: https://lore.kernel.org/linux-phy/20250514134813.380807-1-pritam.sutar@samsung.com/

Changes in v3:
- Updated dt-bindings for USB2.0 only.
- Added dt-bindings for combo phy.
- Added implementation for combo phy (SS and HS phy).
- Added added DTS nodes for all the phys.
  link for v2: https://lore.kernel.org/linux-phy/20250516102650.2144487-1-pritam.sutar@samsung.com/

Pritam Manohar Sutar (9):
  dt-bindings: phy: samsung,usb3-drd-phy: add ExynosAutov920 HS phy
    compatible
  phy: exyons5-usbdrd: support HS phy for ExynosAutov920
  arm64: dts: exynos: ExynosAutov920: add USB and USB-phy nodes
  dt-bindings: phy: samsung,usb3-drd-phy: add ExynosAutov920 combo HS
    phy
  phy: exyons5-usbdrd: support HS combo phy for ExynosAutov920
  arm64: dts: exynos: ExynosAutov920: add USB and USB HS combo phy nodes
  dt-bindings: phy: samsung,usb3-drd-phy: add ExynosAutov920 combo SS
    phy
  phy: exyons5-usbdrd: support SS combo phy for ExynosAutov920
  arm64: dts: exynos: ExynosAutov920: add USB and USB SS combo phy nodes

 .../bindings/phy/samsung,usb3-drd-phy.yaml    |   6 +
 .../boot/dts/exynos/exynosautov920-sadk.dts   |  53 ++
 .../arm64/boot/dts/exynos/exynosautov920.dtsi | 155 +++++
 drivers/phy/samsung/phy-exynos5-usbdrd.c      | 529 ++++++++++++++++++
 4 files changed, 743 insertions(+)

-- 
2.34.1


