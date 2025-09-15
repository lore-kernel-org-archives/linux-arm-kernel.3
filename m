Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 468D1CAC599
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 15 Sep 2025 09:45:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:References:Content-Type:
	Content-Transfer-Encoding:MIME-Version:In-Reply-To:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=N5Do/Zm0purz49bPXXww2B2dKStSKo6VERcXNpISwh8=; b=0/I32nifZaUWeT2P3i5mpSpwTW
	ATUJRog0TJMokIBF21YMCAXttr46W5nr3F2Q+HC+boMexxeaToWLz1JXW96nFLcp4w6pW6Q49MApu
	vQDz14i7gLC9eopUt7F9wOthkNmndk1c8s+JuiQIPUKliUiVXQuOUbXmIfSheUZMTMz6fxF0posvh
	31M9i9jLtMSgX7ZpFKmh5IFanRqP6o53AWfOHZcgFCC2MzfRKGgqGwzD78iISKisTabx9nqFrm2Pe
	lclLcNtINwXMf86fGGF6VUEGhZCbiGCUNtKJeIiBfYjuZ2jiM25HBe62XbN9NDK4E1zsN+qFXH0ol
	o/Rxd2gw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uy5lz-00000003VnJ-0D41;
	Mon, 15 Sep 2025 09:45:23 +0000
Received: from mailout1.samsung.com ([203.254.224.24])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uy5lt-00000003Vld-32aL
	for linux-arm-kernel@lists.infradead.org;
	Mon, 15 Sep 2025 09:45:21 +0000
Received: from epcas5p1.samsung.com (unknown [182.195.41.39])
	by mailout1.samsung.com (KnoxPortal) with ESMTP id 20250915094515epoutp0167d73f233cfad28a32cb5e38f7e6447d~la5SCkFT-2474924749epoutp01W
	for <linux-arm-kernel@lists.infradead.org>; Mon, 15 Sep 2025 09:45:15 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout1.samsung.com 20250915094515epoutp0167d73f233cfad28a32cb5e38f7e6447d~la5SCkFT-2474924749epoutp01W
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1757929515;
	bh=N5Do/Zm0purz49bPXXww2B2dKStSKo6VERcXNpISwh8=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=I8jFRrE6UuVsIQ3C5JZVDsCfA3lQuc72OwOwYQhE23MDZOaK7wGmkkuSstO7VxVD3
	 l6tsuclZS2zFOOyzf2rBAsYCr1gxbKkt4leFdyeA82HQgKV3dL+Nsfjky4rtL5zWgg
	 cXlGEq2b67JA/4NTpIV6e9mJNyZFRw3etiUnxh1w=
Received: from epsnrtp04.localdomain (unknown [182.195.42.156]) by
	epcas5p4.samsung.com (KnoxPortal) with ESMTPS id
	20250915094514epcas5p492b01ee79be39beb3d8804a98e5ab9ad~la5ReLkNb3002530025epcas5p40;
	Mon, 15 Sep 2025 09:45:14 +0000 (GMT)
Received: from epcas5p2.samsung.com (unknown [182.195.38.88]) by
	epsnrtp04.localdomain (Postfix) with ESMTP id 4cQKrn3R3Pz6B9m8; Mon, 15 Sep
	2025 09:45:13 +0000 (GMT)
Received: from epsmtip2.samsung.com (unknown [182.195.34.31]) by
	epcas5p2.samsung.com (KnoxPortal) with ESMTPA id
	20250915094512epcas5p223e2eb264967508527f478eb2200be83~la5PT6xta1637416374epcas5p2X;
	Mon, 15 Sep 2025 09:45:12 +0000 (GMT)
Received: from bose.samsungds.net (unknown [107.108.83.9]) by
	epsmtip2.samsung.com (KnoxPortal) with ESMTPA id
	20250915094509epsmtip21747b6b29145802fb856806a716fc453~la5M-BCOd0834508345epsmtip2P;
	Mon, 15 Sep 2025 09:45:09 +0000 (GMT)
From: Raghav Sharma <raghav.s@samsung.com>
To: krzk@kernel.org, s.nawrocki@samsung.com, cw00.choi@samsung.com,
	alim.akhtar@samsung.com, mturquette@baylibre.com, sboyd@kernel.org,
	robh@kernel.org, conor+dt@kernel.org, sunyeal.hong@samsung.com,
	shin.son@samsung.com
Cc: linux-samsung-soc@vger.kernel.org, linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, chandan.vn@samsung.com,
	dev.tailor@samsung.com, karthik.sun@samsung.com, Raghav Sharma
	<raghav.s@samsung.com>
Subject: [PATCH v2 1/3] dt-bindings: clock: exynosautov920: add m2m clock
 definitions
Date: Mon, 15 Sep 2025 15:23:59 +0530
Message-Id: <20250915095401.3699849-2-raghav.s@samsung.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250915095401.3699849-1-raghav.s@samsung.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CMS-MailID: 20250915094512epcas5p223e2eb264967508527f478eb2200be83
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
CMS-TYPE: 105P
cpgsPolicy: CPGSC10-543,Y
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20250915094512epcas5p223e2eb264967508527f478eb2200be83
References: <20250915095401.3699849-1-raghav.s@samsung.com>
	<CGME20250915094512epcas5p223e2eb264967508527f478eb2200be83@epcas5p2.samsung.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250915_024519_215918_9F677164 
X-CRM114-Status: GOOD (  15.11  )
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

Add device tree clock binding definitions for CMU_M2M

Signed-off-by: Raghav Sharma <raghav.s@samsung.com>
---
 .../clock/samsung,exynosautov920-clock.yaml   | 21 +++++++++++++++++++
 .../clock/samsung,exynosautov920.h            |  5 +++++
 2 files changed, 26 insertions(+)

diff --git a/Documentation/devicetree/bindings/clock/samsung,exynosautov920-clock.yaml b/Documentation/devicetree/bindings/clock/samsung,exynosautov920-clock.yaml
index 72f59db73f76..b2dfe6ed353a 100644
--- a/Documentation/devicetree/bindings/clock/samsung,exynosautov920-clock.yaml
+++ b/Documentation/devicetree/bindings/clock/samsung,exynosautov920-clock.yaml
@@ -38,6 +38,7 @@ properties:
       - samsung,exynosautov920-cmu-hsi0
       - samsung,exynosautov920-cmu-hsi1
       - samsung,exynosautov920-cmu-hsi2
+      - samsung,exynosautov920-cmu-m2m
       - samsung,exynosautov920-cmu-misc
       - samsung,exynosautov920-cmu-peric0
       - samsung,exynosautov920-cmu-peric1
@@ -226,6 +227,26 @@ allOf:
             - const: embd
             - const: ethernet
 
+  - if:
+      properties:
+        compatible:
+          contains:
+            const: samsung,exynosautov920-cmu-m2m
+
+    then:
+      properties:
+        clocks:
+          items:
+            - description: External reference clock (38.4 MHz)
+            - description: CMU_M2M NOC clock (from CMU_TOP)
+            - description: CMU_M2M JPEG clock (from CMU_TOP)
+
+        clock-names:
+          items:
+            - const: oscclk
+            - const: noc
+            - const: jpeg
+
 required:
   - compatible
   - "#clock-cells"
diff --git a/include/dt-bindings/clock/samsung,exynosautov920.h b/include/dt-bindings/clock/samsung,exynosautov920.h
index 93e6233d1358..0342a988565a 100644
--- a/include/dt-bindings/clock/samsung,exynosautov920.h
+++ b/include/dt-bindings/clock/samsung,exynosautov920.h
@@ -295,4 +295,9 @@
 #define CLK_DOUT_HSI2_ETHERNET          6
 #define CLK_DOUT_HSI2_ETHERNET_PTP      7
 
+/* CMU_M2M */
+#define CLK_MOUT_M2M_JPEG_USER          1
+#define CLK_MOUT_M2M_NOC_USER           2
+#define CLK_DOUT_M2M_NOCP               3
+
 #endif /* _DT_BINDINGS_CLOCK_EXYNOSAUTOV920_H */
-- 
2.34.1


