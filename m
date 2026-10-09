Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 43E96CA601E
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  9 Oct 2026 11:51:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:References:Content-Type:
	Content-Transfer-Encoding:MIME-Version:In-Reply-To:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=I4IF84AKQgoIUQqEy8aM/ont0mARoi71FwMJKl7TtHI=; b=sw5iF1vQJ+v+4Px/LNCtgTaenW
	yCyrJvBsj0n//AknhQYRXo55CEBkruWie3lLj9tD5aevtT9BVIKjEmGdUZjOxMb6ZaANXA76NjSLB
	M501lrc4hEq1lE0LivEGyrNn8Dq/N9Md5D3rzo19s/wx4fF2+LMQR0LCRScZthVAPogwTsPU3g1eG
	5HWMOVsoAYnAHs6pvskF8CFgsYTdR5m9kayPoUXqPyoL9VFI7WGMDxmll277XZtV+7bNQcEjpfTbY
	aeGLBlkYFFDYJV4cmnWuof+Tx1zmEX/3kuh++t7SbUQkBC2F43hCacWRo4z8pgDaqi+O9QnEyHpJJ
	o9T25c2Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xF911-00000006CRV-3zk4;
	Fri, 09 Oct 2026 11:43:55 +0000
Received: from mailout1.samsung.com ([203.254.224.24])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xF90v-00000006CN2-0r5h
	for linux-arm-kernel@lists.infradead.org;
	Fri, 09 Oct 2026 11:43:50 +0000
Received: from epcas5p4.samsung.com (unknown [182.195.41.42])
	by mailout1.samsung.com (KnoxPortal) with ESMTP id 20261009114343epoutp01e3c360d1c83e29d04b7d5569814c930e~c2cw9WKcC1386613866epoutp01Q
	for <linux-arm-kernel@lists.infradead.org>; Fri,  9 Oct 2026 11:43:43 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout1.samsung.com 20261009114343epoutp01e3c360d1c83e29d04b7d5569814c930e~c2cw9WKcC1386613866epoutp01Q
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1791546223;
	bh=I4IF84AKQgoIUQqEy8aM/ont0mARoi71FwMJKl7TtHI=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=nkvXfCRoACFBJ+fFawTOrQPPf8Lemml2GSc2xvcZ33wF0CYXWmf6JFSbAhHnu1Nzd
	 WWDnPJsWh2r7ZnorwsDDR40OFf1aooa4uGmgonRNA6xWLj/vFpXo04dEwMGoHveKRh
	 RFGCopTiEeDvDXdFgUKoTcjQ0iMlZEd4zLH578cE=
Received: from epsnrtp03.localdomain (unknown [182.195.42.155]) by
	epcas5p2.samsung.com (KnoxPortal) with ESMTPS id
	20261009114342epcas5p2ce26092595400dbfc934291446d56bc0~c2cwiaWb-2795927959epcas5p2x;
	Fri,  9 Oct 2026 11:43:42 +0000 (GMT)
Received: from epcas5p3.samsung.com (unknown [182.195.38.92]) by
	epsnrtp03.localdomain (Postfix) with ESMTP id 4j1Q3x3lc4z3hhT7; Fri,  9 Oct
	2026 11:43:41 +0000 (GMT)
Received: from epsmtip2.samsung.com (unknown [182.195.34.31]) by
	epcas5p4.samsung.com (KnoxPortal) with ESMTPA id
	20261009114339epcas5p46cb1f966de38c2156edb15955f0c7fc2~c2cuFGQsn2880428804epcas5p43;
	Fri,  9 Oct 2026 11:43:39 +0000 (GMT)
Received: from bose.samsungds.net (unknown [107.108.83.9]) by
	epsmtip2.samsung.com (KnoxPortal) with ESMTPA id
	20261009114337epsmtip254c9cac88316ba16df247f09957fa887~c2crvqve01160511605epsmtip2o;
	Fri,  9 Oct 2026 11:43:37 +0000 (GMT)
From: Raghav Sharma <raghav.s@samsung.com>
To: krzk@kernel.org, s.nawrocki@samsung.com, cw00.choi@samsung.com,
	peter.griffin@linaro.org, alim.akhtar@samsung.com, sboyd@kernel.org,
	bmasney+clk@redhat.com, jbrunet+clk@baylibre.com, robh@kernel.org,
	conor+dt@kernel.org, raghav.s@samsung.com
Cc: linux-samsung-soc@vger.kernel.org, linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, is.gandhi@samsung.com, ts.amit@samsung.com,
	pokala.reddy@samsung.com
Subject: [PATCH v2 03/14] dt-bindings: clock: exynos8855: add peris clock
 definitions
Date: Fri,  9 Oct 2026 17:31:26 +0530
Message-Id: <20261009120137.2801911-4-raghav.s@samsung.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261009120137.2801911-1-raghav.s@samsung.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CMS-MailID: 20261009114339epcas5p46cb1f966de38c2156edb15955f0c7fc2
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
CMS-TYPE: 105P
cpgsPolicy: CPGSC10-543,Y
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20261009114339epcas5p46cb1f966de38c2156edb15955f0c7fc2
References: <20261009120137.2801911-1-raghav.s@samsung.com>
	<CGME20261009114339epcas5p46cb1f966de38c2156edb15955f0c7fc2@epcas5p4.samsung.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261009_044349_572072_831FBAB7 
X-CRM114-Status: GOOD (  14.33  )
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

Add device tree clock binding definitions for CMU_PERIS

Signed-off-by: Raghav Sharma <raghav.s@samsung.com>
---
 .../clock/samsung,exynos8855-clock.yaml       | 21 +++++++++++++++++++
 .../dt-bindings/clock/samsung,exynos8855.h    | 11 ++++++++++
 2 files changed, 32 insertions(+)

diff --git a/Documentation/devicetree/bindings/clock/samsung,exynos8855-clock.yaml b/Documentation/devicetree/bindings/clock/samsung,exynos8855-clock.yaml
index 073c19debd0d..62277c67fec1 100644
--- a/Documentation/devicetree/bindings/clock/samsung,exynos8855-clock.yaml
+++ b/Documentation/devicetree/bindings/clock/samsung,exynos8855-clock.yaml
@@ -29,6 +29,7 @@ properties:
   compatible:
     enum:
       - samsung,exynos8855-cmu-peric
+      - samsung,exynos8855-cmu-peris
       - samsung,exynos8855-cmu-top
 
   clocks:
@@ -68,6 +69,26 @@ allOf:
             - const: mmc_card
             - const: ip
 
+  - if:
+      properties:
+        compatible:
+          contains:
+            const: samsung,exynos8855-cmu-peris
+
+    then:
+      properties:
+        clocks:
+          items:
+            - description: External reference clock (76.8 MHz)
+            - description: CMU_PERIS GIC clock (from CMU_TOP)
+            - description: CMU_PERIS NOC clock (from CMU_TOP)
+
+        clock-names:
+          items:
+            - const: oscclk
+            - const: gic
+            - const: bus
+
   - if:
       properties:
         compatible:
diff --git a/include/dt-bindings/clock/samsung,exynos8855.h b/include/dt-bindings/clock/samsung,exynos8855.h
index cd445bb45070..5d8b38a744b5 100644
--- a/include/dt-bindings/clock/samsung,exynos8855.h
+++ b/include/dt-bindings/clock/samsung,exynos8855.h
@@ -203,4 +203,15 @@
 #define CLK_GOUT_UART_DBG_PERIC            25
 #define CLK_GOUT_USI_PERIC                 26
 
+/* CMU_PERIS */
+#define CLK_MOUT_PERIS_NOC_USER            1
+#define CLK_MOUT_PERIS_GIC                 2
+#define CLK_MOUT_PERIS_GIC_USER            3
+#define CLK_DOUT_PERIS_NOCP                4
+#define CLK_DOUT_PERIS_OTP                 5
+#define CLK_GOUT_CMU_PERIS                 6
+#define CLK_GOUT_SYSREG_PERIS              7
+#define CLK_GOUT_WDT0_PERIS                8
+#define CLK_GOUT_WDT1_PERIS                9
+
 #endif /* _DT_BINDINGS_CLOCK_EXYNOS8855_H */
-- 
2.34.1


