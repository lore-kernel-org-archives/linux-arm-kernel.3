Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8CAD7C71135
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 13 Jun 2025 07:12:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:References:Content-Type:
	Content-Transfer-Encoding:MIME-Version:In-Reply-To:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/BRy9T3GJRyRf9B/1o6vliSFsXzSoe+6lNyeT9l/lCs=; b=B+VL3s6uQtm4BXURgVmo2qfc8F
	U67fAZwvN6hznhp5nPXOkJ2JLRhQ3+gu65MfPIro6M8jua5ZgNSqqBj9/DuEYq84kkFuiCtAt5st3
	8wO6UABW33ouZdvHaDmwgJHUtQuVxsiHjRDDmmGfpTbnF8mzr3ZclupVwwySJGO9edQQcBGbxdVvL
	aykJCMY+89GztkTjqNK14Tyro0mNjrGUt1VKqPGjQ8P1Ho+M2dAju+nICTvRk4tXgcOZvchWmPpFp
	PezHAQ0lrBK8v2Th6QLqOPz3eDF8oY8/2lk2yCx8/Rc2lDSp0cabJLZHO9l1QNZQWLLePVKXughDa
	WZ1YGUTg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uPyaL-0000000FZde-3P9X;
	Fri, 13 Jun 2025 07:12:21 +0000
Received: from mailout2.samsung.com ([203.254.224.25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uPyY2-0000000FZDy-18ds
	for linux-arm-kernel@lists.infradead.org;
	Fri, 13 Jun 2025 07:09:59 +0000
Received: from epcas5p1.samsung.com (unknown [182.195.41.39])
	by mailout2.samsung.com (KnoxPortal) with ESMTP id 20250613070952epoutp0284daa2d9c74977727cb4e209367d1a62~IiIyR800v0586205862epoutp02E
	for <linux-arm-kernel@lists.infradead.org>; Fri, 13 Jun 2025 07:09:52 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout2.samsung.com 20250613070952epoutp0284daa2d9c74977727cb4e209367d1a62~IiIyR800v0586205862epoutp02E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1749798592;
	bh=/BRy9T3GJRyRf9B/1o6vliSFsXzSoe+6lNyeT9l/lCs=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=dVhGyv7E4bH4IcN/CvjW3XdsuoMJEplVpr43Z1rP/59ZIsI/O/UJhu+bTKVhTPglf
	 pzHyjQ5FyMOQKFM/p63MsEj0Xx9Lj7Y2cifpxxAP6J96ePq3VKU4UzQwPYhTBPy5w3
	 ZbI3hheVjlEohR+YmbcVibTum7s8rhgAi1P2GxeQ=
Received: from epsnrtp03.localdomain (unknown [182.195.42.155]) by
	epcas5p1.samsung.com (KnoxPortal) with ESMTPS id
	20250613070951epcas5p1fdc2bff451059aec05b30db2383871db~IiIxZ79nR0357803578epcas5p1e;
	Fri, 13 Jun 2025 07:09:51 +0000 (GMT)
Received: from epcas5p3.samsung.com (unknown [182.195.38.178]) by
	epsnrtp03.localdomain (Postfix) with ESMTP id 4bJVrs4Gtzz3hhTC; Fri, 13 Jun
	2025 07:09:49 +0000 (GMT)
Received: from epsmtip1.samsung.com (unknown [182.195.34.30]) by
	epcas5p3.samsung.com (KnoxPortal) with ESMTPA id
	20250613055040epcas5p35219ddeddd9fe5f4632ca837db91847a~IhDouBZAM2143021430epcas5p3H;
	Fri, 13 Jun 2025 05:50:40 +0000 (GMT)
Received: from bose.samsungds.net (unknown [107.108.83.9]) by
	epsmtip1.samsung.com (KnoxPortal) with ESMTPA id
	20250613055037epsmtip108ea6972ed6eff7d92b617765eca97a2~IhDlulA8s0439404394epsmtip1N;
	Fri, 13 Jun 2025 05:50:37 +0000 (GMT)
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
Subject: [PATCH v3 1/9] dt-bindings: phy: samsung,usb3-drd-phy: add
 ExynosAutov920 HS phy compatible
Date: Fri, 13 Jun 2025 11:26:05 +0530
Message-Id: <20250613055613.866909-2-pritam.sutar@samsung.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250613055613.866909-1-pritam.sutar@samsung.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CMS-MailID: 20250613055040epcas5p35219ddeddd9fe5f4632ca837db91847a
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-Sendblock-Type: REQ_APPROVE
CMS-TYPE: 105P
cpgsPolicy: CPGSC10-542,Y
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20250613055040epcas5p35219ddeddd9fe5f4632ca837db91847a
References: <20250613055613.866909-1-pritam.sutar@samsung.com>
	<CGME20250613055040epcas5p35219ddeddd9fe5f4632ca837db91847a@epcas5p3.samsung.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250613_000958_618042_F2914BD1 
X-CRM114-Status: GOOD (  10.34  )
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

Add a dedicated compatible string for USB HS phy found in this SoC.
The devicetree node requires two clocks, named "phy" and "ref"
(same as clocks required by Exynos850).

Signed-off-by: Pritam Manohar Sutar <pritam.sutar@samsung.com>
---
 Documentation/devicetree/bindings/phy/samsung,usb3-drd-phy.yaml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/phy/samsung,usb3-drd-phy.yaml b/Documentation/devicetree/bindings/phy/samsung,usb3-drd-phy.yaml
index cc60d2f6f70e..71db17d93c6a 100644
--- a/Documentation/devicetree/bindings/phy/samsung,usb3-drd-phy.yaml
+++ b/Documentation/devicetree/bindings/phy/samsung,usb3-drd-phy.yaml
@@ -33,6 +33,7 @@ properties:
       - samsung,exynos7-usbdrd-phy
       - samsung,exynos7870-usbdrd-phy
       - samsung,exynos850-usbdrd-phy
+      - samsung,exynosautov920-usbdrd-phy
 
   clocks:
     minItems: 1
@@ -217,6 +218,7 @@ allOf:
               - samsung,exynos5420-usbdrd-phy
               - samsung,exynos7870-usbdrd-phy
               - samsung,exynos850-usbdrd-phy
+              - samsung,exynosautov920-usbdrd-phy
     then:
       properties:
         clocks:
-- 
2.34.1


