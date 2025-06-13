Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5613DC61DB2
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 13 Jun 2025 07:28:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:References:Content-Type:
	Content-Transfer-Encoding:MIME-Version:In-Reply-To:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=jIzgwrmtIZVgUQM7G/vlslTlX66wNwtzyffxYrtcguU=; b=LbESVy0hQvJG53VyZEj8dg+YDP
	gZAjHTmka0icczAy6XkmtjKFGXzpbIAvB9XIB+88Rr7riUodJBbzK458Hde/PIDlNj6d07lEKuhdA
	owdYkvxzZxt7ZHUFXm6YqBxgEjScCH9ioB/69HgZ9ujMtbC+QF9vlaFfhRgutKc/zK3ojpJbne37p
	NID994k8UYl/RBUtog605lYjgK6ajiL8X8y/X6dC+PnDAJP7LkqnLMUmFY7ne0woRsGnnzMVEa7ci
	WWsiME/k7SV/8TL600mfgkF52ovJHfafCo/PuUOmz2vXIk9Rhphc5jxUpznhy75iwI+hXoD5YyXFv
	kZHNDyaQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uPypx-0000000FaqY-0GFV;
	Fri, 13 Jun 2025 07:28:29 +0000
Received: from mailout1.samsung.com ([203.254.224.24])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uPyYY-0000000FZLq-3tXU
	for linux-arm-kernel@lists.infradead.org;
	Fri, 13 Jun 2025 07:10:32 +0000
Received: from epcas5p1.samsung.com (unknown [182.195.41.39])
	by mailout1.samsung.com (KnoxPortal) with ESMTP id 20250613071029epoutp01f55ee7ab704af41525b5af1efdd971d4~IiJUgTBLu3009530095epoutp019
	for <linux-arm-kernel@lists.infradead.org>; Fri, 13 Jun 2025 07:10:29 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout1.samsung.com 20250613071029epoutp01f55ee7ab704af41525b5af1efdd971d4~IiJUgTBLu3009530095epoutp019
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1749798629;
	bh=jIzgwrmtIZVgUQM7G/vlslTlX66wNwtzyffxYrtcguU=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=qu9WvxSBfx0NFlz/AEMMNUyNSCTRYALfrwQ5IWTIGNOKWUBck5/iShmkx3Umys38k
	 HpmBeeXMJFtDY4lMb/fI5Ixo1EGieuuC1QcTJH/oQD+/V+iGfz8D23iXDW/Y4SW+PP
	 T1dWuRfOLzhYPNb15NZSJvnUj7uxwpBzpc7hShrM=
Received: from epsnrtp01.localdomain (unknown [182.195.42.153]) by
	epcas5p4.samsung.com (KnoxPortal) with ESMTPS id
	20250613071025epcas5p4d69d7c0229ffbe35da7923ff45e3226a~IiJRXlt1z2402624026epcas5p4O;
	Fri, 13 Jun 2025 07:10:25 +0000 (GMT)
Received: from epcas5p2.samsung.com (unknown [182.195.38.181]) by
	epsnrtp01.localdomain (Postfix) with ESMTP id 4bJVsW6yZyz6B9m5; Fri, 13 Jun
	2025 07:10:23 +0000 (GMT)
Received: from epsmtip1.samsung.com (unknown [182.195.34.30]) by
	epcas5p2.samsung.com (KnoxPortal) with ESMTPA id
	20250613055059epcas5p28b26f4ccb0f58e1bfb172e92f9903a08~IhD6fR3Kq1469914699epcas5p2N;
	Fri, 13 Jun 2025 05:50:59 +0000 (GMT)
Received: from bose.samsungds.net (unknown [107.108.83.9]) by
	epsmtip1.samsung.com (KnoxPortal) with ESMTPA id
	20250613055056epsmtip1719e57bbf20b6d5bd9cead39b3a2f125~IhD3x2vw70398103981epsmtip1j;
	Fri, 13 Jun 2025 05:50:56 +0000 (GMT)
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
Subject: [PATCH v3 7/9] dt-bindings: phy: samsung,usb3-drd-phy: add
 ExynosAutov920 combo SS phy
Date: Fri, 13 Jun 2025 11:26:11 +0530
Message-Id: <20250613055613.866909-8-pritam.sutar@samsung.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250613055613.866909-1-pritam.sutar@samsung.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CMS-MailID: 20250613055059epcas5p28b26f4ccb0f58e1bfb172e92f9903a08
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-Sendblock-Type: REQ_APPROVE
CMS-TYPE: 105P
cpgsPolicy: CPGSC10-542,Y
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20250613055059epcas5p28b26f4ccb0f58e1bfb172e92f9903a08
References: <20250613055613.866909-1-pritam.sutar@samsung.com>
	<CGME20250613055059epcas5p28b26f4ccb0f58e1bfb172e92f9903a08@epcas5p2.samsung.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250613_001031_286096_3C8D400F 
X-CRM114-Status: GOOD (  14.26  )
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

Add a dedicated compatible string for USB combo phy found in this SoC.
The devicetree node requires two clocks, named "phy" and "ref".

This phy supports USB3.1 SSP+(10Gbps) protocol and is backwards
compatible to the USB3.0 SS(5Gbps). 'Add-on USB2.0' phy is required
to support USB2.0 HS(480Mbps), FS(12Mbps) and LS(1.5Mbps) data rates.
These two phys are combined to form a combo phy.

Add schema only for 'USB3.1 SSP+' SS phy in this commit.

Signed-off-by: Pritam Manohar Sutar <pritam.sutar@samsung.com>
---
 Documentation/devicetree/bindings/phy/samsung,usb3-drd-phy.yaml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/phy/samsung,usb3-drd-phy.yaml b/Documentation/devicetree/bindings/phy/samsung,usb3-drd-phy.yaml
index 26660799e3ca..5dd68c21c133 100644
--- a/Documentation/devicetree/bindings/phy/samsung,usb3-drd-phy.yaml
+++ b/Documentation/devicetree/bindings/phy/samsung,usb3-drd-phy.yaml
@@ -35,6 +35,7 @@ properties:
       - samsung,exynos850-usbdrd-phy
       - samsung,exynosautov920-usbdrd-hsphy
       - samsung,exynosautov920-usbdrd-phy
+      - samsung,exynosautov920-usb31drd-ssphy
 
   clocks:
     minItems: 1
@@ -221,6 +222,7 @@ allOf:
               - samsung,exynos850-usbdrd-phy
               - samsung,exynosautov920-usbdrd-hsphy
               - samsung,exynosautov920-usbdrd-phy
+              - samsung,exynosautov920-usb31drd-ssphy
     then:
       properties:
         clocks:
-- 
2.34.1


