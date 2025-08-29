Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 96E58CA0FF0
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 29 Aug 2025 16:56:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:References:Content-Type:
	Content-Transfer-Encoding:MIME-Version:In-Reply-To:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=HpTKhZ7/rpVPsXoILVVhOB2b+exwcmHjfNj1mWTFV1Q=; b=kzy2i4jVXzwtDUw0R4vYRyAAOO
	YXDbYyhmX1CZPxOIz7KCgGZsl2mmQ2eU3KMD+m2ENF656cVWpZYsdRhaFo9aWAZsykMW6t9Yxdjcq
	pLykINJUpdXtlZk4KQI985xChpGv/FFecwtmLu5kaKcaj4E2Q+/Wvv6Ot3WBk7UATHmMnIyEJdvsT
	3hczbA+SiX2bU1r42QlfCKAGPfn2lBxRaK7aFzgk4e6YPcWIMPjlhRAfZsk0dmdXo6UqtstpFRuXJ
	6rxzz67Y8ekSuKRT8Jax2uys0UNxZkZPy/TFC+57YAM7wIKA22PPhj7ULo2qh3gZzWevHse9HHKFz
	DHh/r/qg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1us2OI-00000006T2P-3dTl;
	Fri, 29 Aug 2025 16:55:55 +0000
Received: from mailout1.samsung.com ([203.254.224.24])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1urzbL-00000005wHL-213X
	for linux-arm-kernel@lists.infradead.org;
	Fri, 29 Aug 2025 13:57:13 +0000
Received: from epcas5p1.samsung.com (unknown [182.195.41.39])
	by mailout1.samsung.com (KnoxPortal) with ESMTP id 20250829135705epoutp014d28598fd344c8c27033efd3424b66bc~gQXTxlDgN0111801118epoutp01k
	for <linux-arm-kernel@lists.infradead.org>; Fri, 29 Aug 2025 13:57:05 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout1.samsung.com 20250829135705epoutp014d28598fd344c8c27033efd3424b66bc~gQXTxlDgN0111801118epoutp01k
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1756475825;
	bh=HpTKhZ7/rpVPsXoILVVhOB2b+exwcmHjfNj1mWTFV1Q=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=X4LcKWs6160yTCH+IYNGHzCISj8YZjCdYL3IlxX7tEQxAoAIrU8ox2c07l7MPHoaA
	 p4viO16j1kadBl9BVXq5Dx8ReXckKzwa9lPTFJrxI4Kz58tPx1ixVRyZ5Mizxw/Yr4
	 D/4cEztMCuJb1yBVdBTcGnwQjdh1Zi8T4OtNuxP0=
Received: from epsnrtp04.localdomain (unknown [182.195.42.156]) by
	epcas5p2.samsung.com (KnoxPortal) with ESMTPS id
	20250829135704epcas5p261ee4e9409c6b563e52c485a959b9a9e~gQXTXg0Uw1958719587epcas5p2W;
	Fri, 29 Aug 2025 13:57:04 +0000 (GMT)
Received: from epcas5p1.samsung.com (unknown [182.195.38.88]) by
	epsnrtp04.localdomain (Postfix) with ESMTP id 4cD0FC5dN2z6B9m5; Fri, 29 Aug
	2025 13:57:03 +0000 (GMT)
Received: from epsmtip2.samsung.com (unknown [182.195.34.31]) by
	epcas5p1.samsung.com (KnoxPortal) with ESMTPA id
	20250829135703epcas5p14bbcc16e8d3622950a28e0ce40ff2dcd~gQXR4BPzZ1167611676epcas5p1z;
	Fri, 29 Aug 2025 13:57:03 +0000 (GMT)
Received: from cheetah.samsungds.net (unknown [107.109.115.53]) by
	epsmtip2.samsung.com (KnoxPortal) with ESMTPA id
	20250829135701epsmtip2ba771a62bb7f0c34182fac990cda423d~gQXQRzt9-1416014160epsmtip22;
	Fri, 29 Aug 2025 13:57:01 +0000 (GMT)
From: Varada Pavani <v.pavani@samsung.com>
To: krzk@kernel.org, s.nawrocki@samsung.com, cw00.choi@samsung.com,
	alim.akhtar@samsung.com, mturquette@baylibre.com, sboyd@kernel.org,
	linux-samsung-soc@vger.kernel.org, linux-clk@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Cc: aswani.reddy@samsung.com, gost.dev@samsung.com, Varada Pavani
	<v.pavani@samsung.com>
Subject: [PATCH 1/2] dt-bindings: watchdog: Modify tesla fsd bindings
Date: Fri, 29 Aug 2025 19:26:42 +0530
Message-ID: <20250829135643.105406-2-v.pavani@samsung.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250829135643.105406-1-v.pavani@samsung.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CMS-MailID: 20250829135703epcas5p14bbcc16e8d3622950a28e0ce40ff2dcd
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
CMS-TYPE: 105P
cpgsPolicy: CPGSC10-541,Y
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20250829135703epcas5p14bbcc16e8d3622950a28e0ce40ff2dcd
References: <20250829135643.105406-1-v.pavani@samsung.com>
	<CGME20250829135703epcas5p14bbcc16e8d3622950a28e0ce40ff2dcd@epcas5p1.samsung.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250829_065711_868749_075DDED5 
X-CRM114-Status: GOOD (  14.09  )
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

FSD SoC WDT is using Samsung legacy WDT driver with
"samsung,exynos7-wdt" compatibility. Now change the compatibility due to
few driver changes (PMU bit changes for each WDT instance and Clocks)
for WDT found in FSD SoC.

Signed-off-by: Varada Pavani <v.pavani@samsung.com>
---
 .../devicetree/bindings/watchdog/samsung-wdt.yaml        | 9 ++++-----
 1 file changed, 4 insertions(+), 5 deletions(-)

diff --git a/Documentation/devicetree/bindings/watchdog/samsung-wdt.yaml b/Documentation/devicetree/bindings/watchdog/samsung-wdt.yaml
index d175ae968336..db2009654fe4 100644
--- a/Documentation/devicetree/bindings/watchdog/samsung-wdt.yaml
+++ b/Documentation/devicetree/bindings/watchdog/samsung-wdt.yaml
@@ -27,10 +27,7 @@ properties:
           - samsung,exynos850-wdt                 # for Exynos850
           - samsung,exynosautov9-wdt              # for Exynosautov9
           - samsung,exynosautov920-wdt            # for Exynosautov920
-      - items:
-          - enum:
-              - tesla,fsd-wdt
-          - const: samsung,exynos7-wdt
+          - tesla,fsd-wdt
 
   reg:
     maxItems: 1
@@ -79,6 +76,7 @@ allOf:
               - samsung,exynos850-wdt
               - samsung,exynosautov9-wdt
               - samsung,exynosautov920-wdt
+              - tesla,fsd-wdt
     then:
       required:
         - samsung,syscon-phandle
@@ -91,6 +89,7 @@ allOf:
               - samsung,exynos850-wdt
               - samsung,exynosautov9-wdt
               - samsung,exynosautov920-wdt
+              - tesla,fsd-wdt
     then:
       properties:
         clocks:
@@ -102,7 +101,7 @@ allOf:
             - const: watchdog
             - const: watchdog_src
         samsung,cluster-index:
-          enum: [0, 1]
+          enum: [0, 1, 2]
       required:
         - samsung,cluster-index
     else:
-- 
2.49.0


