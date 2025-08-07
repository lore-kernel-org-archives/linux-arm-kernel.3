Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3C7B6C87FCA
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  7 Aug 2025 11:19:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:References:Content-Type:
	Content-Transfer-Encoding:MIME-Version:In-Reply-To:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=68xVvjXbi6ynymUb0K2pHdKhGYhDNv+h3kRgipI5AtQ=; b=UCvCJxIXEzZxUs8HSRxCndRdf8
	tp76YzLhnJudG/R9pkZ4YYq/8zMsxOmOYSg+L2tf0EmP8nhVOvziO+uz18Bh6RelO5ZgZHHXZjcSP
	QtrzHQUr3iL7C1JyXqjvedoABh2TTqXB2Ps2kayXtgN2mFdWehhtHATmff3Pfkfi8HXemF83ZB2c9
	pNx8mc+PXVwMrM8fL/h4mwrhCJysddfxQYyU9Vn0nzVap7EObw7lWc2EYKRzwo3avokHHIrN4p+JJ
	3iLKgaVndQCWJYF9K1IkarStcdz56dckk/ebn+h6+pjOD7fnoeIgqQcIUvWp9shboqoNHcxWaeDMu
	dBkCVW7A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ujyeA-00000000LpG-2Kwm;
	Thu, 07 Aug 2025 11:18:58 +0000
Received: from mailout4.samsung.com ([203.254.224.34])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ujyFr-00000000IMo-2hhl
	for linux-arm-kernel@lists.infradead.org;
	Thu, 07 Aug 2025 10:53:53 +0000
Received: from epcas5p4.samsung.com (unknown [182.195.41.42])
	by mailout4.samsung.com (KnoxPortal) with ESMTP id 20250807105349epoutp046c018dc63586b3cec057d7924a95ee62~ZdrBsxtoJ0570805708epoutp04E
	for <linux-arm-kernel@lists.infradead.org>; Thu,  7 Aug 2025 10:53:49 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout4.samsung.com 20250807105349epoutp046c018dc63586b3cec057d7924a95ee62~ZdrBsxtoJ0570805708epoutp04E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1754564029;
	bh=68xVvjXbi6ynymUb0K2pHdKhGYhDNv+h3kRgipI5AtQ=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=XshrS32skeKcznLRlgfF713BvYRbidj0KlEfhs5Y8CFtBRQEfp1D/Ehxl5daV4YJ4
	 2k9oWP/8zvFBYRIiCbRdhzvBhdx1ucKBpHnbDusJWQG6SOw1jnztsoPwx9RklmlEbR
	 TNtRe/Qhm7DdMuzGo6bPlfmVR6UytBqMp0bquJt0=
Received: from epsnrtp03.localdomain (unknown [182.195.42.155]) by
	epcas5p3.samsung.com (KnoxPortal) with ESMTPS id
	20250807105348epcas5p3065541de7991a0705ff5e9059865079e~ZdrAxgdxa2228622286epcas5p3Z;
	Thu,  7 Aug 2025 10:53:48 +0000 (GMT)
Received: from epcas5p3.samsung.com (unknown [182.195.38.92]) by
	epsnrtp03.localdomain (Postfix) with ESMTP id 4byPCv6Z6Zz3hhT3; Thu,  7 Aug
	2025 10:53:47 +0000 (GMT)
Received: from epsmtip2.samsung.com (unknown [182.195.34.31]) by
	epcas5p4.samsung.com (KnoxPortal) with ESMTPA id
	20250807032527epcas5p488b0eed9dcb260cad4f864d9ec6e8477~ZXjjK2EY50583105831epcas5p4M;
	Thu,  7 Aug 2025 03:25:27 +0000 (GMT)
Received: from cheetah.samsungds.net (unknown [107.109.115.53]) by
	epsmtip2.samsung.com (KnoxPortal) with ESMTPA id
	20250807032525epsmtip212df53bafdf0fb26bd25845d81d27973~ZXjhND0eV1700017000epsmtip2j;
	Thu,  7 Aug 2025 03:25:25 +0000 (GMT)
From: Aakarsh Jain <aakarsh.jain@samsung.com>
To: linux-arm-kernel@lists.infradead.org, linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org, m.szyprowski@samsung.com,
	andrzej.hajda@intel.com, mchehab@kernel.org, hverkuil-cisco@xs4all.nl,
	alim.akhtar@samsung.com, robh@kernel.org, conor+dt@kernel.org,
	devicetree@vger.kernel.org, krzysztof.kozlowski+dt@linaro.org
Cc: linux-samsung-soc@vger.kernel.org, aswani.reddy@samsung.com,
	anindya.sg@samsung.com, Aakarsh Jain <aakarsh.jain@samsung.com>
Subject: [PATCH 10/10] dt-bindings: media: s5p-mfc: Add SoC-specific
 compatible for 'samsung,mfc-v5'
Date: Thu,  7 Aug 2025 08:54:49 +0530
Message-ID: <20250807032449.92770-11-aakarsh.jain@samsung.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250807032449.92770-1-aakarsh.jain@samsung.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CMS-MailID: 20250807032527epcas5p488b0eed9dcb260cad4f864d9ec6e8477
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-Sendblock-Type: REQ_APPROVE
CMS-TYPE: 105P
cpgsPolicy: CPGSC10-541,Y
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20250807032527epcas5p488b0eed9dcb260cad4f864d9ec6e8477
References: <20250807032449.92770-1-aakarsh.jain@samsung.com>
	<CGME20250807032527epcas5p488b0eed9dcb260cad4f864d9ec6e8477@epcas5p4.samsung.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250807_035351_999053_C8FEA99E 
X-CRM114-Status: GOOD (  11.30  )
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

'samsung,mfc-v5' compatible string was getting used for both S5pv210
and Exynos4 SoC. Based on SoC-specific, modify existing 'samsung,mfc-v5'
compatible to 'samsung,exynos4-mfc'. Add new compatible for s5pv210.

Signed-off-by: Aakarsh Jain <aakarsh.jain@samsung.com>
---
 .../devicetree/bindings/media/samsung,s5p-mfc.yaml     | 10 ++++++----
 1 file changed, 6 insertions(+), 4 deletions(-)

diff --git a/Documentation/devicetree/bindings/media/samsung,s5p-mfc.yaml b/Documentation/devicetree/bindings/media/samsung,s5p-mfc.yaml
index 6a711c8103ac..922b1de66736 100644
--- a/Documentation/devicetree/bindings/media/samsung,s5p-mfc.yaml
+++ b/Documentation/devicetree/bindings/media/samsung,s5p-mfc.yaml
@@ -18,10 +18,11 @@ properties:
   compatible:
     oneOf:
       - enum:
-          - samsung,exynos5433-mfc        # Exynos5433
-          - samsung,mfc-v5                # Exynos4
+          - samsung,s5pv210-mfc           # S5pv210
+          - samsung,exynos4-mfc           # Exynos4
           - samsung,exynos5250-mfc        # Exynos5
           - samsung,exynos5420-mfc        # Exynos5420
+          - samsung,exynos5433-mfc        # Exynos5433
           - samsung,exynos5800-mfc        # Exynos5800
           - samsung,exynos7880-mfc        # Exynos7880
           - tesla,fsd-mfc                 # Tesla FSD
@@ -114,7 +115,8 @@ allOf:
         compatible:
           contains:
             enum:
-              - samsung,mfc-v5
+              - samsung,s5pv210-mfc
+              - samsung,exynos4-mfc
     then:
       properties:
         clocks:
@@ -184,7 +186,7 @@ examples:
     #include <dt-bindings/interrupt-controller/irq.h>
 
     codec@13400000 {
-        compatible = "samsung,mfc-v5";
+        compatible = "samsung,exynos4-mfc";
         reg = <0x13400000 0x10000>;
         interrupts = <GIC_SPI 94 IRQ_TYPE_LEVEL_HIGH>;
         power-domains = <&pd_mfc>;
-- 
2.49.0


