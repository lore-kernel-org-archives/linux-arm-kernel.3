Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BA161C87FD2
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  8 Aug 2025 14:20:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:References:Content-Type:
	Content-Transfer-Encoding:MIME-Version:In-Reply-To:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=N5Do/Zm0purz49bPXXww2B2dKStSKo6VERcXNpISwh8=; b=bAgoLq06NhNnOkAIku+UFieORR
	c/VOGAuIGUjPtlujLA+fFTLTWi2sDnSkQMOcYfbRQi+gWG7Yohqbtt8GrA01fxkqVnwqvDvrhWJWg
	sOs1dX5A8cBMC7MS+BfV1gHGVTsbUzM0chFiRpr3e4xVAIaWDvIdyZvgGevC51CSvWhpMNGByvT2z
	rJ327iFtrqbCebRoR7G3NmdFkG/a5ec5ojAgFBlLsyShksyA82SNAugHrvzr+nmhM1M2zNxeBYPAs
	yf0+n3vgF92+5IcniYZCXNLGpffi5OybJ8mtQZBVeCXPOCPYkmX5nAKuNfu1HM2b+qJBPZe901CM1
	lXvsxNMQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ukNxR-000000030sK-0Bk4;
	Fri, 08 Aug 2025 14:20:33 +0000
Received: from mailout2.samsung.com ([203.254.224.25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ukNso-000000030Jh-0Rmz
	for linux-arm-kernel@lists.infradead.org;
	Fri, 08 Aug 2025 14:15:48 +0000
Received: from epcas5p3.samsung.com (unknown [182.195.41.41])
	by mailout2.samsung.com (KnoxPortal) with ESMTP id 20250808141542epoutp028e2be90ac44edc4e81a0c596f347445a~Z0EkVuWLM0968209682epoutp02x
	for <linux-arm-kernel@lists.infradead.org>; Fri,  8 Aug 2025 14:15:42 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout2.samsung.com 20250808141542epoutp028e2be90ac44edc4e81a0c596f347445a~Z0EkVuWLM0968209682epoutp02x
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1754662542;
	bh=N5Do/Zm0purz49bPXXww2B2dKStSKo6VERcXNpISwh8=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=r+RdHuCh4Du6L6Of30SUKboyM/ys8Fz9v9qyqOQBqJR0uI8db+eWdZOqYjW5hwryf
	 7jelggVxjqHwnGlHuUjv0MdN8n2Em48xAs4qHKe/eefNKiAdoVE8ppyRSbz6NhwchP
	 PhOxR4MvS7cLoR0XXgqzLca4ZxH1RjWTpFjXnnAI=
Received: from epsnrtp03.localdomain (unknown [182.195.42.155]) by
	epcas5p1.samsung.com (KnoxPortal) with ESMTPS id
	20250808141541epcas5p16bdc32bfcf909bbcec3badbd9deafcfb~Z0EjUcd3x0745607456epcas5p1M;
	Fri,  8 Aug 2025 14:15:41 +0000 (GMT)
Received: from epcas5p2.samsung.com (unknown [182.195.38.91]) by
	epsnrtp03.localdomain (Postfix) with ESMTP id 4bz5fN11d5z3hhT3; Fri,  8 Aug
	2025 14:15:40 +0000 (GMT)
Received: from epsmtip2.samsung.com (unknown [182.195.34.31]) by
	epcas5p2.samsung.com (KnoxPortal) with ESMTPA id
	20250808141241epcas5p268673ad83b4cadce6362c9184195ccad~Z0B8QJhk12375723757epcas5p2u;
	Fri,  8 Aug 2025 14:12:41 +0000 (GMT)
Received: from bose.samsungds.net (unknown [107.108.83.9]) by
	epsmtip2.samsung.com (KnoxPortal) with ESMTPA id
	20250808141239epsmtip2986bc0dd1556f165d6325d5feb382449~Z0B57XW1x1615716157epsmtip2N;
	Fri,  8 Aug 2025 14:12:39 +0000 (GMT)
From: Raghav Sharma <raghav.s@samsung.com>
To: krzk@kernel.org, s.nawrocki@samsung.com, cw00.choi@samsung.com,
	mturquette@baylibre.com, sboyd@kernel.org, robh@kernel.org,
	conor+dt@kernel.org, sunyeal.hong@samsung.com, shin.son@samsung.com,
	alim.akhtar@samsung.com
Cc: linux-samsung-soc@vger.kernel.org, linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, dev.tailor@samsung.com,
	chandan.vn@samsung.com, karthik.sun@samsung.com, raghav.s@samsung.com
Subject: [PATCH v1 1/3] dt-bindings: clock: exynosautov920: add m2m clock
 definitions
Date: Fri,  8 Aug 2025 19:51:44 +0530
Message-Id: <20250808142146.3181062-2-raghav.s@samsung.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250808142146.3181062-1-raghav.s@samsung.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CMS-MailID: 20250808141241epcas5p268673ad83b4cadce6362c9184195ccad
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-Sendblock-Type: REQ_APPROVE
CMS-TYPE: 105P
cpgsPolicy: CPGSC10-543,Y
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20250808141241epcas5p268673ad83b4cadce6362c9184195ccad
References: <20250808142146.3181062-1-raghav.s@samsung.com>
	<CGME20250808141241epcas5p268673ad83b4cadce6362c9184195ccad@epcas5p2.samsung.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250808_071546_471347_9CD44585 
X-CRM114-Status: GOOD (  11.73  )
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


