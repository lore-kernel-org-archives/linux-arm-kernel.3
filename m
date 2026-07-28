Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 78405C54F4C
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 28 Jul 2026 11:53:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:References:Content-Type:
	Content-Transfer-Encoding:MIME-Version:In-Reply-To:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=VDfTALnNGJ4dV9TcMw3rH2Xy3f5JFfUvxg5LHO/nAqM=; b=dBzsNgqs9YBzlFvrP2OsGQ3Tve
	rypH5pqP37OYFAS1lPT1giigMbQJJpEbIhHBOf2FNOPUujVrRn/UgY2596w9V/qiGKcXfGH8DmidU
	Da7JX1fRSW6Nng5rHh0RQwKnJZxMGVKAi2+oyzYB5Wfx8von2Ba/lGS30yCUUBSfR+5sH/9HRcwi9
	h3GMbw6o+cdMgGxZov6jSPF3B61e8PllzEkUEgG1s0H7RtBiipIsQ2XnlknQttE9ekcett+qjwLtP
	z69BYgfblUjyUS5UIi0unzvC/jmIiIH+z9OQYWnTiWGLjylCBEYfKIUmS/78TyIzv16j/R9/93fFk
	x0x40NVA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wogN7-000000058Pw-1HIz;
	Tue, 28 Jul 2026 11:53:21 +0000
Received: from mailout2.samsung.com ([203.254.224.25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wogMs-000000058I5-13tQ
	for linux-arm-kernel@lists.infradead.org;
	Tue, 28 Jul 2026 11:53:07 +0000
Received: from epcas5p4.samsung.com (unknown [182.195.41.42])
	by mailout2.samsung.com (KnoxPortal) with ESMTP id 20260728115302epoutp02bd7f1852bd3fa2bc20904d808650a539~GcfERv3hw2191521915epoutp02g
	for <linux-arm-kernel@lists.infradead.org>; Tue, 28 Jul 2026 11:53:02 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout2.samsung.com 20260728115302epoutp02bd7f1852bd3fa2bc20904d808650a539~GcfERv3hw2191521915epoutp02g
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1785239582;
	bh=VDfTALnNGJ4dV9TcMw3rH2Xy3f5JFfUvxg5LHO/nAqM=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=LYnUPTsU7dKE25E9cG1+MpOaF07OKs7t8jp7qp6NuXwAmPFWXtLb4ayyIoaP7KA41
	 25zVQxmh8x7l1epp2QY+dhxiEv8LYi40Q6A1zfZHnFJ3RqGV6yJQUiMznj2wYjxfoQ
	 q/U/mi5wXw41x+NEzYOMj43TeZpCK8+q4KYVfHQY=
Received: from epsnrtp02.localdomain (unknown [182.195.42.154]) by
	epcas5p4.samsung.com (KnoxPortal) with ESMTPS id
	20260728115301epcas5p41977e64305d5ac4652805e4bab099a15~GcfDvI8vV2959829598epcas5p4j;
	Tue, 28 Jul 2026 11:53:01 +0000 (GMT)
Received: from epcas5p4.samsung.com (unknown [182.195.38.89]) by
	epsnrtp02.localdomain (Postfix) with ESMTP id 4h8YkN6VgKz2SSKZ; Tue, 28 Jul
	2026 11:53:00 +0000 (GMT)
Received: from epsmtip1.samsung.com (unknown [182.195.34.30]) by
	epcas5p3.samsung.com (KnoxPortal) with ESMTPA id
	20260728115300epcas5p35dc4bce1b09a4d989170e67eb5d6a752~GcfCVrMZ81684116841epcas5p33;
	Tue, 28 Jul 2026 11:53:00 +0000 (GMT)
Received: from bose.samsungds.net (unknown [107.108.83.9]) by
	epsmtip1.samsung.com (KnoxPortal) with ESMTPA id
	20260728115256epsmtip1db0510f61386b1e01e1163b71fa49d22~Gce-BgHq72235622356epsmtip1b;
	Tue, 28 Jul 2026 11:52:56 +0000 (GMT)
From: "raghav.s" <raghav.s@samsung.com>
To: krzk@kernel.org, s.nawrocki@samsung.com, cw00.choi@samsung.com,
	peter.griffin@linaro.org, alim.akhtar@samsung.com, mturquette@baylibre.com,
	sboyd@kernel.org, bmasney@redhat.com, robh@kernel.org, conor+dt@kernel.org
Cc: linux-samsung-soc@vger.kernel.org, linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, hajun.sung@samsung.com, raghav.s@samsung.com,
	is.gandhi@samsung.com, ts.amit@samsung.com, pokala.reddy@samsung.com
Subject: [PATCH 05/13] dt-bindings: clock: exynos8855: add peris clock
 definitions
Date: Tue, 28 Jul 2026 17:41:03 +0530
Message-Id: <20260728121111.2077860-6-raghav.s@samsung.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260728121111.2077860-1-raghav.s@samsung.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CMS-MailID: 20260728115300epcas5p35dc4bce1b09a4d989170e67eb5d6a752
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
CMS-TYPE: 105P
cpgsPolicy: CPGSC10-543,Y
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20260728115300epcas5p35dc4bce1b09a4d989170e67eb5d6a752
References: <20260728121111.2077860-1-raghav.s@samsung.com>
	<CGME20260728115300epcas5p35dc4bce1b09a4d989170e67eb5d6a752@epcas5p3.samsung.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260728_045306_611031_31D8BC2E 
X-CRM114-Status: GOOD (  12.14  )
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

Signed-off-by: raghav.s <raghav.s@samsung.com>
---
 .../clock/samsung,exynos8855-clock.yaml       | 21 +++++++++++++++++++
 .../dt-bindings/clock/samsung,exynos8855.h    | 16 ++++++++++++++
 2 files changed, 37 insertions(+)

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
index 14369b749fb2..9efaf3e330b4 100644
--- a/include/dt-bindings/clock/samsung,exynos8855.h
+++ b/include/dt-bindings/clock/samsung,exynos8855.h
@@ -50,6 +50,11 @@
 #define DOUT_SHARED4_DIV4		   38
 #define FOUT_MMC_PLL_DIV1                  39
 #define FOUT_MMC_PLL_DIV2                  40
+#define CLKCMU_MOUT_PERIS_GIC              41
+#define CLKCMU_MOUT_PERIS_NOC              42
+#define CLKCMU_DOUT_PERIS_GIC              43
+#define CLKCMU_DOUT_PERIS_NOC              44
+#define FOUT_MMC_PLL_CLKOUT_DIV2           45
 
 /* CMU_PERIC */
 #define CLK_MOUT_PERIC_IP_USER             1
@@ -79,4 +84,15 @@
 #define CLK_GOUT_UART_DBG_PERIC_IPCLKPORT_PCLK 25
 #define CLK_GOUT_USI_PERIC_IPCLKPORT_PCLK  26
 
+/* CMU_PERIS */
+#define CLK_MOUT_PERIS_NOC_USER            1
+#define CLK_MOUT_PERIS_GIC                 2
+#define CLK_MOUT_PERIS_GIC_USER            3
+#define CLK_DOUT_PERIS_NOCP                4
+#define CLK_DOUT_PERIS_OTP                 5
+#define CLK_GOUT_CMU_PERIS_IPCLKPORT_PCLK  6
+#define CLK_GOUT_SYSREG_PERIS_IPCLKPORT_PCLK 7
+#define CLK_GOUT_WDT0_PERIS_IPCLKPORT_PCLK   8
+#define CLK_GOUT_WDT1_PERIS_IPCLKPORT_PCLK   9
+
 #endif /* _DT_BINDINGS_CLOCK_EXYNOS8855_H */
-- 
2.34.1


