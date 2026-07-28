Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5590AC531F9
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 28 Jul 2026 11:53:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:References:Content-Type:
	Content-Transfer-Encoding:MIME-Version:In-Reply-To:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=v2dK5jQ9nZyRzm0uOowhHLf/If6TSLYH9bGp5IlVVcg=; b=tD2KevAvu/qyONL0fKgihqsahn
	YtzxhELsb5A6qS5fkIq9rtRrEaLUUgFhDFgeUQh7vW9YU357mgsDsc3o7Grs9h2x8xeqTP+U/Vq/B
	fQ6ZcbwrAeLLFrVsXRe97iAdZZwUmSjgwnJS/zvmqKm/V8e15O7mTtRLHz1jwfmS6OX6htf+qhjeV
	SQjcKnRgPwDY3kutC9Lt3j67QtkX2Z25g62EPhrb3DFBZYxuHKSxsZIQjaP4f2XNQh3uDMb9y08uq
	Zg7cG1c8JmFaHwIib3+TbG/SDgSAYTLP/KuClyrHaDJff947PtPg4cANw8LyzPHEeSYjiRC+LLE7X
	/88SxXSg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wogN7-000000058RP-3MRA;
	Tue, 28 Jul 2026 11:53:21 +0000
Received: from mailout1.samsung.com ([203.254.224.24])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wogN2-000000058Mz-1mpZ
	for linux-arm-kernel@lists.infradead.org;
	Tue, 28 Jul 2026 11:53:17 +0000
Received: from epcas5p1.samsung.com (unknown [182.195.41.39])
	by mailout1.samsung.com (KnoxPortal) with ESMTP id 20260728115313epoutp0130cf4ee467607fc7aa91935bc8fc0219~GcfOnWFeS1114311143epoutp01A
	for <linux-arm-kernel@lists.infradead.org>; Tue, 28 Jul 2026 11:53:13 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout1.samsung.com 20260728115313epoutp0130cf4ee467607fc7aa91935bc8fc0219~GcfOnWFeS1114311143epoutp01A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1785239593;
	bh=v2dK5jQ9nZyRzm0uOowhHLf/If6TSLYH9bGp5IlVVcg=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=qB9q4thY05sm2xsPQ9S8QPH407RpY36/h3en6w8NdPOgN9d0RQOis4AQdZEJo3Q5t
	 LsUsYq32JGLwBDoliAB6NiWT6u5uhcFBdKjpiz4eKNIKA5EH3TVwnkoXIW3dm3N9R7
	 eWj557YVn9iRbkRVT97uMGiQ5ZslhdI2Rrtj3+0Q=
Received: from epsnrtp04.localdomain (unknown [182.195.42.156]) by
	epcas5p3.samsung.com (KnoxPortal) with ESMTPS id
	20260728115312epcas5p30b99a9c21f1015716476b7f7c58f3065~GcfNnDAuY3026330263epcas5p3B;
	Tue, 28 Jul 2026 11:53:12 +0000 (GMT)
Received: from epcas5p3.samsung.com (unknown [182.195.38.88]) by
	epsnrtp04.localdomain (Postfix) with ESMTP id 4h8Ykb3gdTz6B9mH; Tue, 28 Jul
	2026 11:53:11 +0000 (GMT)
Received: from epsmtip1.samsung.com (unknown [182.195.34.30]) by
	epcas5p1.samsung.com (KnoxPortal) with ESMTPA id
	20260728115311epcas5p17024be4c0b89d7186f6e9bfc811733dc~GcfMPvQcL1219612196epcas5p1N;
	Tue, 28 Jul 2026 11:53:11 +0000 (GMT)
Received: from bose.samsungds.net (unknown [107.108.83.9]) by
	epsmtip1.samsung.com (KnoxPortal) with ESMTPA id
	20260728115308epsmtip154f19aec94e6031389cbe0873fd465f8~GcfJu9dVi2641026410epsmtip1L;
	Tue, 28 Jul 2026 11:53:08 +0000 (GMT)
From: "raghav.s" <raghav.s@samsung.com>
To: krzk@kernel.org, s.nawrocki@samsung.com, cw00.choi@samsung.com,
	peter.griffin@linaro.org, alim.akhtar@samsung.com, mturquette@baylibre.com,
	sboyd@kernel.org, bmasney@redhat.com, robh@kernel.org, conor+dt@kernel.org
Cc: linux-samsung-soc@vger.kernel.org, linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, hajun.sung@samsung.com, raghav.s@samsung.com,
	is.gandhi@samsung.com, ts.amit@samsung.com, pokala.reddy@samsung.com
Subject: [PATCH 08/13] dt-bindings: clock: exynos8855: add hsi clock
 definitions
Date: Tue, 28 Jul 2026 17:41:06 +0530
Message-Id: <20260728121111.2077860-9-raghav.s@samsung.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260728121111.2077860-1-raghav.s@samsung.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CMS-MailID: 20260728115311epcas5p17024be4c0b89d7186f6e9bfc811733dc
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
CMS-TYPE: 105P
cpgsPolicy: CPGSC10-543,Y
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20260728115311epcas5p17024be4c0b89d7186f6e9bfc811733dc
References: <20260728121111.2077860-1-raghav.s@samsung.com>
	<CGME20260728115311epcas5p17024be4c0b89d7186f6e9bfc811733dc@epcas5p1.samsung.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260728_045316_784633_3C3E3C62 
X-CRM114-Status: GOOD (  14.69  )
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

Add device tree clock binding definitions for CMU_HSI

Signed-off-by: raghav.s <raghav.s@samsung.com>
---
 .../clock/samsung,exynos8855-clock.yaml       | 21 +++++++++++++++++++
 .../dt-bindings/clock/samsung,exynos8855.h    | 10 +++++++++
 2 files changed, 31 insertions(+)

diff --git a/Documentation/devicetree/bindings/clock/samsung,exynos8855-clock.yaml b/Documentation/devicetree/bindings/clock/samsung,exynos8855-clock.yaml
index 62277c67fec1..e97b65f8be5f 100644
--- a/Documentation/devicetree/bindings/clock/samsung,exynos8855-clock.yaml
+++ b/Documentation/devicetree/bindings/clock/samsung,exynos8855-clock.yaml
@@ -28,6 +28,7 @@ description: |
 properties:
   compatible:
     enum:
+      - samsung,exynos8855-cmu-hsi
       - samsung,exynos8855-cmu-peric
       - samsung,exynos8855-cmu-peris
       - samsung,exynos8855-cmu-top
@@ -47,6 +48,26 @@ properties:
     maxItems: 1
 
 allOf:
+  - if:
+      properties:
+        compatible:
+          contains:
+            const: samsung,exynos8855-cmu-hsi
+
+    then:
+      properties:
+        clocks:
+          items:
+            - description: External reference clock (76.8 MHz)
+            - description: CMU_HSI NOC clock (from CMU_TOP)
+            - description: CMU_HSI UFS_EMBD clock (from CMU_TOP)
+
+        clock-names:
+          items:
+            - const: oscclk
+            - const: bus
+            - const: ufs_embd
+
   - if:
       properties:
         compatible:
diff --git a/include/dt-bindings/clock/samsung,exynos8855.h b/include/dt-bindings/clock/samsung,exynos8855.h
index 9efaf3e330b4..44484a9d67f5 100644
--- a/include/dt-bindings/clock/samsung,exynos8855.h
+++ b/include/dt-bindings/clock/samsung,exynos8855.h
@@ -55,6 +55,10 @@
 #define CLKCMU_DOUT_PERIS_GIC              43
 #define CLKCMU_DOUT_PERIS_NOC              44
 #define FOUT_MMC_PLL_CLKOUT_DIV2           45
+#define CLKCMU_MOUT_HSI_NOC                46
+#define CLKCMU_MOUT_HSI_UFS_EMBD           47
+#define CLKCMU_DOUT_HSI_NOC                48
+#define CLKCMU_DOUT_HSI_UFS_EMBD           49
 
 /* CMU_PERIC */
 #define CLK_MOUT_PERIC_IP_USER             1
@@ -95,4 +99,10 @@
 #define CLK_GOUT_WDT0_PERIS_IPCLKPORT_PCLK   8
 #define CLK_GOUT_WDT1_PERIS_IPCLKPORT_PCLK   9
 
+/* CMU_HSI */
+#define CLK_MOUT_HSI_NOC_USER              1
+#define CLK_MOUT_HSI_UFS_EMBD_USER         2
+#define CLK_GOUT_CMU_HSI_IPCLKPORT_PCLK    3
+#define CLK_GOUT_SYSREG_HSI_IPCLKPORT_PCLK 4
+
 #endif /* _DT_BINDINGS_CLOCK_EXYNOS8855_H */
-- 
2.34.1


