Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DD670CA0FE1
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 23 Aug 2025 06:34:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:References:Content-Type:
	Content-Transfer-Encoding:MIME-Version:In-Reply-To:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=8CcZrXnG1JviyezbOmZi9lSul/m6IUwEsJI7r8Fbjqo=; b=nSsFlybcpgmNeScLCoO0JQ8lz1
	JtO7kDsVo7s7d5tYFtIO22zGWxXqrY3U8o4oCzO6m+AUDWcRDjSduINPkUR95EKVMB9IFBnptdFnr
	qHATWqW/R5xskpPQpDLfGvpdoQUOiV2dZHzGMqxqoi831TnK/8L3RiZJ/rpOXt9Zz03Z4Np9nv0+Q
	GlybEfZflFFKS5vptgL7Ak1EB0uY61NThPsn45mIcp+prA3Eu3kf9+p4Hg7CWlJ0//gFR/PLpikGc
	e28zX97ZgTDBuKlrZcvHcXslrghlSy+tcQxv9tWr9jI+MVHCqplvzNNJhy6k8IS3JqhCx/sAdYt0Z
	J3bAq5TA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uphp6-000000043hS-3OrO;
	Sat, 23 Aug 2025 06:33:56 +0000
Received: from mailout3.samsung.com ([203.254.224.33])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1upO6H-0000000235C-0Fh1
	for linux-arm-kernel@lists.infradead.org;
	Fri, 22 Aug 2025 09:30:22 +0000
Received: from epcas5p2.samsung.com (unknown [182.195.41.40])
	by mailout3.samsung.com (KnoxPortal) with ESMTP id 20250822093018epoutp0340b5d6d00f523a8773990b895bc7ac76~eDNYStmb00910109101epoutp03a
	for <linux-arm-kernel@lists.infradead.org>; Fri, 22 Aug 2025 09:30:18 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout3.samsung.com 20250822093018epoutp0340b5d6d00f523a8773990b895bc7ac76~eDNYStmb00910109101epoutp03a
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1755855018;
	bh=8CcZrXnG1JviyezbOmZi9lSul/m6IUwEsJI7r8Fbjqo=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=lWTtUNqEAKye5P+UiIUlpKPzSfcC9YPDF6g2L9tZR3cmCr3jEPdKMYD406zzjPrFD
	 zS5rD5H4yx3HorlBRl1emTa9VfGVXFFxAfvNnbw5DykHRxEo0yiGIDy+OnDnyocoa+
	 v1+6HdTGLBnDt6yZBP3x6i9aTlDRs1UJBjmOf7fI=
Received: from epsnrtp01.localdomain (unknown [182.195.42.153]) by
	epcas5p4.samsung.com (KnoxPortal) with ESMTPS id
	20250822093017epcas5p481c9e85f6b7abec470fc25df42a4145b~eDNXuG0N71315013150epcas5p4i;
	Fri, 22 Aug 2025 09:30:17 +0000 (GMT)
Received: from epcas5p1.samsung.com (unknown [182.195.38.93]) by
	epsnrtp01.localdomain (Postfix) with ESMTP id 4c7Zfc4SZ6z6B9m5; Fri, 22 Aug
	2025 09:30:16 +0000 (GMT)
Received: from epsmtip2.samsung.com (unknown [182.195.34.31]) by
	epcas5p1.samsung.com (KnoxPortal) with ESMTPA id
	20250822093015epcas5p1f479af38c65a6decc900c37fe37537e5~eDNVxtHir1782717827epcas5p1j;
	Fri, 22 Aug 2025 09:30:15 +0000 (GMT)
Received: from bose.samsungds.net (unknown [107.108.83.9]) by
	epsmtip2.samsung.com (KnoxPortal) with ESMTPA id
	20250822093012epsmtip2f8b081184aa1a652519e157135745e89~eDNSv3KGE0192501925epsmtip2O;
	Fri, 22 Aug 2025 09:30:12 +0000 (GMT)
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
Subject: [PATCH v7 3/6] dt-bindings: phy: samsung,usb3-drd-phy: add
 ExynosAutov920 combo hsphy
Date: Fri, 22 Aug 2025 15:08:42 +0530
Message-Id: <20250822093845.1179395-4-pritam.sutar@samsung.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250822093845.1179395-1-pritam.sutar@samsung.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CMS-MailID: 20250822093015epcas5p1f479af38c65a6decc900c37fe37537e5
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
CMS-TYPE: 105P
cpgsPolicy: CPGSC10-542,Y
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20250822093015epcas5p1f479af38c65a6decc900c37fe37537e5
References: <20250822093845.1179395-1-pritam.sutar@samsung.com>
	<CGME20250822093015epcas5p1f479af38c65a6decc900c37fe37537e5@epcas5p1.samsung.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250822_023021_404513_900386CE 
X-CRM114-Status: UNSURE (   9.96  )
X-CRM114-Notice: Please train this message.
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

This phy only supports USB2.0 HS(480Mbps), FS(12Mbps) and
LS(1.5Mbps) data rates. It requires two clocks, named as "phy" and "ref".
The required supplies for this phy, named as vdd075_usb20(0.75v),
vdd18_usb20(1.8v), vdd33_usb20(3.3v).

Add schema for combo hsphy found on this SoC.

Signed-off-by: Pritam Manohar Sutar <pritam.sutar@samsung.com>
---
 .../devicetree/bindings/phy/samsung,usb3-drd-phy.yaml          | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/Documentation/devicetree/bindings/phy/samsung,usb3-drd-phy.yaml b/Documentation/devicetree/bindings/phy/samsung,usb3-drd-phy.yaml
index e238fd0c9f6c..f0cfca5736b8 100644
--- a/Documentation/devicetree/bindings/phy/samsung,usb3-drd-phy.yaml
+++ b/Documentation/devicetree/bindings/phy/samsung,usb3-drd-phy.yaml
@@ -34,6 +34,7 @@ properties:
       - samsung,exynos7870-usbdrd-phy
       - samsung,exynos850-usbdrd-phy
       - samsung,exynos990-usbdrd-phy
+      - samsung,exynosautov920-usbdrd-combo-hsphy
       - samsung,exynosautov920-usbdrd-phy
 
   clocks:
@@ -226,6 +227,7 @@ allOf:
               - samsung,exynos7870-usbdrd-phy
               - samsung,exynos850-usbdrd-phy
               - samsung,exynos990-usbdrd-phy
+              - samsung,exynosautov920-usbdrd-combo-hsphy
               - samsung,exynosautov920-usbdrd-phy
     then:
       properties:
@@ -248,6 +250,7 @@ allOf:
         compatible:
           contains:
             enum:
+              - samsung,exynosautov920-usbdrd-combo-hsphy
               - samsung,exynosautov920-usbdrd-phy
     then:
       required:
-- 
2.34.1


