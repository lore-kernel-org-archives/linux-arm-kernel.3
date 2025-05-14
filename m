Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3FF67C2D0CD
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 15 May 2025 07:10:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:References:Content-Type:
	Content-Transfer-Encoding:MIME-Version:In-Reply-To:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=cMsc0q9qkQWpITce3vvlurAUL6Xs0c1NrKMPNQ5La5k=; b=HLfeI8WHXGx+Ao/otk+hrchVGN
	rehy4lfYjOI+zltyWrrNTXxcpjhNVxds8KKuvQzTZA+KVDNCWv+wtNxdSHtszZ2poNKFEYcaUE24H
	LeFszfgrL5okFHHONoj4All0dHiuf37pZc36FTMjvffZlO+88nM8SO3v/sMKQdZbkPW1M+fOaVtQC
	boCy6VVu0eU0iczuPpbJ1HG49MNb0lFDW3kAsWfOsCWhwHzh2BZ39d/sRU41o7qtOY3/fz1jqMYxF
	gkYupxMTAIsfmEyY7aE0/5YJJySEeWoXkthqZkYrtTAcO2i/TND+B+8j5CWCcT3q6Wa/mpQHO0ks1
	mUsPa5zg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uFSjA-0000000HEFH-0feV;
	Thu, 15 May 2025 07:10:00 +0000
Received: from mailout4.samsung.com ([203.254.224.34])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uFSYa-0000000HDC0-2Fkl
	for linux-arm-kernel@lists.infradead.org;
	Thu, 15 May 2025 06:59:06 +0000
Received: from epcas5p1.samsung.com (unknown [182.195.41.39])
	by mailout4.samsung.com (KnoxPortal) with ESMTP id 20250515065857epoutp04e122dc96e0a986a2c22b21c0f07ef650~-oR_baY9E1610616106epoutp04g
	for <linux-arm-kernel@lists.infradead.org>; Thu, 15 May 2025 06:58:57 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout4.samsung.com 20250515065857epoutp04e122dc96e0a986a2c22b21c0f07ef650~-oR_baY9E1610616106epoutp04g
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1747292337;
	bh=cMsc0q9qkQWpITce3vvlurAUL6Xs0c1NrKMPNQ5La5k=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=Vp2Yu1m48I7pyrN14VgWJjeE6Gs26W30qZeVDg4O7MNuP66ciEH42do/SZfpOypsV
	 7D/K+ABXwZaf/Oc0J7izGqowXFTrTagkA4gbNlTwrq2YpCOQZTLxEoLhGi5Vwb5jUG
	 5bkowx8EzqAer5sypF88/QP6/m9zUJR70WkoMHXQ=
Received: from epsnrtp04.localdomain (unknown [182.195.42.156]) by
	epcas5p1.samsung.com (KnoxPortal) with ESMTPS id
	20250515065856epcas5p19610493c51cff1a20695c0d51ca24a3c~-oR92FcFA0303903039epcas5p1K;
	Thu, 15 May 2025 06:58:56 +0000 (GMT)
Received: from epcas5p3.samsung.com (unknown [182.195.38.180]) by
	epsnrtp04.localdomain (Postfix) with ESMTP id 4Zygzf2MMYz6B9m8; Thu, 15 May
	2025 06:58:54 +0000 (GMT)
Received: from epsmtrp2.samsung.com (unknown [182.195.40.14]) by
	epcas5p3.samsung.com (KnoxPortal) with ESMTPA id
	20250514133844epcas5p3bd8053eba9fb3b64fb0d5989b791d950~-aFvjhL8R1375113751epcas5p36;
	Wed, 14 May 2025 13:38:44 +0000 (GMT)
Received: from epsmgmcp1.samsung.com (unknown [182.195.42.82]) by
	epsmtrp2.samsung.com (KnoxPortal) with ESMTP id
	20250514133844epsmtrp2d1df0f1aedf090fbc10bb17b0461d477~-aFvibPa10193601936epsmtrp2s;
	Wed, 14 May 2025 13:38:44 +0000 (GMT)
X-AuditID: b6c32a52-40bff70000004c16-f2-68249ce4f552
Received: from epsmtip2.samsung.com ( [182.195.34.31]) by
	epsmgmcp1.samsung.com (Symantec Messaging Gateway) with SMTP id
	A7.C5.19478.4EC94286; Wed, 14 May 2025 22:38:44 +0900 (KST)
Received: from bose.samsungds.net (unknown [107.108.83.9]) by
	epsmtip2.samsung.com (KnoxPortal) with ESMTPA id
	20250514133841epsmtip2583a2a53d24db393c34c094aaee80af8~-aFspFKux2461524615epsmtip2H;
	Wed, 14 May 2025 13:38:41 +0000 (GMT)
From: Pritam Manohar Sutar <pritam.sutar@samsung.com>
To: vkoul@kernel.org, kishon@kernel.org, robh@kernel.org,
	krzk+dt@kernel.org, conor+dt@kernel.org, alim.akhtar@samsung.com,
	andre.draszik@linaro.org, peter.griffin@linaro.org, kauschluss@disroot.org,
	m.szyprowski@samsung.com, s.nawrocki@samsung.com
Cc: linux-phy@lists.infradead.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org, rosa.pila@samsung.com,
	dev.tailor@samsung.com, faraz.ata@samsung.com, muhammed.ali@samsung.com,
	selvarasu.g@samsung.com, Pritam Manohar Sutar <pritam.sutar@samsung.com>
Subject: [PATCH 1/2] dt-bindings: phy: samsung,usb3-drd-phy: add dt-schema
 for ExynosAutov920
Date: Wed, 14 May 2025 19:18:12 +0530
Message-Id: <20250514134813.380807-2-pritam.sutar@samsung.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250514134813.380807-1-pritam.sutar@samsung.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFprMIsWRmVeSWpSXmKPExsWy7bCSvO6TOSoZBouaOC0ezNvGZrHl1WYW
	izV7zzFZ3NuxjN1i/pFzrBbXbixkt/jz7zybxdHW/8wWL2fdY7PY9Pgaq8XlXXPYLCas+sZi
	MeP8PiaLtUfuslucf9HFarFhxj8Wi2f3VrBZ/N+zg93iy88HzBaH37SzWhxZ/pHJYuedE8wO
	Yh4n121m8ti0qpPN4861PWwem5fUe/RtWcXo8XmTXABbFJdNSmpOZllqkb5dAlfG6/8b2QvO
	c1e0PmtkaWBcw9HFyMkhIWAi0Tv3JGsXIxeHkMB2Rom9ex+xQiRkJB5N2whlC0us/PecHaLo
	LaPE0R89TF2MHBxsAqYSE/ckgMRFBHqYJJ5e/cEG4jALPGKSOLDlC1i3sECsxNmFX9hAbBYB
	VYnN1xsYQWxeATuJ78cfsUBskJfYf/AsM4jNKWAv0f3oHxOILQRU8+joE3aIekGJkzOfgNUz
	A9U3b53NPIFRYBaS1CwkqQWMTKsYRVMLinPTc5MLDPWKE3OLS/PS9ZLzczcxguNNK2gH47L1
	f/UOMTJxMB5ilOBgVhLhvZ6lnCHEm5JYWZValB9fVJqTWnyIUZqDRUmcVzmnM0VIID2xJDU7
	NbUgtQgmy8TBKdXANFtgxRe/BYxb/hS6C6duazqywKiNs7wpN5WX//zcGoG7OTvMFyzetW5P
	64xpvUe033PyqbUwHt/Su98vbkbMQg3t2T3fl/Tmy/Bn2vLffVDNkJWea5DQuGXu/9Ps2iZb
	y35clb+0QW2v53+rBQt9+f7encvdn1/8baaQ5AsNd5d7uaFPby7WX/vnTQlPlzKbBdeia7tZ
	uxtM9DJEVs//dvanxEWP5NY3D/9WHb/WcKxu94EFC75KKL/cO/VmFROzm8yqekY7nZaav7Us
	KkFvmUpmJy+Q3jFhY6K6wNx/q0xv37nS0K/kWXbCWi523gXJw2fTu2beD54/m81D2PjgNy9p
	r7DZLGEzpSZO6Pt/VYmlOCPRUIu5qDgRAOlxciAmAwAA
X-CMS-MailID: 20250514133844epcas5p3bd8053eba9fb3b64fb0d5989b791d950
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-Sendblock-Type: REQ_APPROVE
CMS-TYPE: 105P
cpgsPolicy: CPGSC10-542,Y
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20250514133844epcas5p3bd8053eba9fb3b64fb0d5989b791d950
References: <20250514134813.380807-1-pritam.sutar@samsung.com>
	<CGME20250514133844epcas5p3bd8053eba9fb3b64fb0d5989b791d950@epcas5p3.samsung.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250514_235904_892948_2CB1B83D 
X-CRM114-Status: GOOD (  13.42  )
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

Add a dedicated compatible for USB phy found in this SoC

Signed-off-by: Pritam Manohar Sutar <pritam.sutar@samsung.com>
---
 .../bindings/phy/samsung,usb3-drd-phy.yaml    | 27 +++++++++++++++++++
 1 file changed, 27 insertions(+)

diff --git a/Documentation/devicetree/bindings/phy/samsung,usb3-drd-phy.yaml b/Documentation/devicetree/bindings/phy/samsung,usb3-drd-phy.yaml
index fdddddc7d611..c50f4218ded9 100644
--- a/Documentation/devicetree/bindings/phy/samsung,usb3-drd-phy.yaml
+++ b/Documentation/devicetree/bindings/phy/samsung,usb3-drd-phy.yaml
@@ -32,6 +32,7 @@ properties:
       - samsung,exynos7-usbdrd-phy
       - samsung,exynos7870-usbdrd-phy
       - samsung,exynos850-usbdrd-phy
+      - samsung,exynosautov920-usb31drd-phy
 
   clocks:
     minItems: 2
@@ -204,6 +205,32 @@ allOf:
         reg-names:
           maxItems: 1
 
+  - if:
+      properties:
+        compatible:
+          contains:
+            const: samsung,exynosautov920-usb31drd-phy
+    then:
+      $ref: /schemas/usb/usb-switch.yaml#
+
+      properties:
+        clocks:
+          items:
+            - description: ext_xtal clock
+            - description: reference clock
+
+        clock-names:
+          items:
+            - const: ext_xtal
+            - const: ref
+
+        reg:
+          minItems: 1
+          maxItems: 1
+
+        reg-names:
+          minItems: 1
+
 unevaluatedProperties: false
 
 examples:
-- 
2.34.1


