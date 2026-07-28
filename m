Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 97206C53219
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 28 Jul 2026 11:53:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:References:Content-Type:
	Content-Transfer-Encoding:MIME-Version:In-Reply-To:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=HZs3ukufqqFSRwq8NkLbNU6bN6AtOQPA8IiFxHSFDhY=; b=RX8jhSBKmMEDGg9Q2MYd5qsOdz
	yXKyLmXjWxf6D0UtQ5Ns/w6sH46B3D5FZlBdajdeDr79lxijqeEcF6mENRSIjzns/LkiP4c5QH6N7
	dJ9qBxNx5qq8rHjvGa8a5JjKk38zImwwV7NadXnWXHHTx/8UHy45iHzptRmIPZdmJazNdSXF67mvn
	V8LENd4Dqb/QMNKqwQGGYWW5qdbavmxgt7zEoX2d2mms+Yq9Bz752yXYxxHZPXpkho2lLVDHDh2qs
	pAcZon3iazqLSHajknCb9LQKwCzunCWufTuZuhhL8QBDm1sbWAWM52dQsZx4Yz78sbmGruCbBkXc2
	zUBqezNw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wogMn-000000058GM-09vl;
	Tue, 28 Jul 2026 11:53:01 +0000
Received: from mailout3.samsung.com ([203.254.224.33])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wogMf-000000058EG-3gNu
	for linux-arm-kernel@lists.infradead.org;
	Tue, 28 Jul 2026 11:52:55 +0000
Received: from epcas5p2.samsung.com (unknown [182.195.41.40])
	by mailout3.samsung.com (KnoxPortal) with ESMTP id 20260728115250epoutp0316e31bede9bc6ee3a7485c423c5da9ca~Gce5gsszG2105521055epoutp03z
	for <linux-arm-kernel@lists.infradead.org>; Tue, 28 Jul 2026 11:52:50 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout3.samsung.com 20260728115250epoutp0316e31bede9bc6ee3a7485c423c5da9ca~Gce5gsszG2105521055epoutp03z
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1785239570;
	bh=HZs3ukufqqFSRwq8NkLbNU6bN6AtOQPA8IiFxHSFDhY=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=g1Hpsktg2RL5IYSxQFJCXWEd++2nkULgGn2bhbRbGB65J3a7XKw4k8aVkb9d3fWci
	 4Km+Em6g59AYsjLV/qjh+lJslXhTtkHcSBi4a5RuvQMsc+cXRnTqPfXvWsdPyDDgDG
	 Dzkbp3//iZ25SkClYA3UA0DzzH3VghbjvXh+IfH0=
Received: from epsnrtp04.localdomain (unknown [182.195.42.156]) by
	epcas5p3.samsung.com (KnoxPortal) with ESMTPS id
	20260728115250epcas5p30da198701d3d47475289fea34ea93a3b~Gce5H5JKK0922609226epcas5p3W;
	Tue, 28 Jul 2026 11:52:50 +0000 (GMT)
Received: from epcas5p1.samsung.com (unknown [182.195.38.86]) by
	epsnrtp04.localdomain (Postfix) with ESMTP id 4h8Yk949pfz6B9m7; Tue, 28 Jul
	2026 11:52:49 +0000 (GMT)
Received: from epsmtip1.samsung.com (unknown [182.195.34.30]) by
	epcas5p2.samsung.com (KnoxPortal) with ESMTPA id
	20260728115248epcas5p2862d181151a8635b63d4dd8d174fd7a3~Gce3Umunz0256002560epcas5p2H;
	Tue, 28 Jul 2026 11:52:48 +0000 (GMT)
Received: from bose.samsungds.net (unknown [107.108.83.9]) by
	epsmtip1.samsung.com (KnoxPortal) with ESMTPA id
	20260728115245epsmtip18cd4393d989ff651772bed5b4e519c8c~Gce0zZgrY2649126491epsmtip1d;
	Tue, 28 Jul 2026 11:52:45 +0000 (GMT)
From: "raghav.s" <raghav.s@samsung.com>
To: krzk@kernel.org, s.nawrocki@samsung.com, cw00.choi@samsung.com,
	peter.griffin@linaro.org, alim.akhtar@samsung.com, mturquette@baylibre.com,
	sboyd@kernel.org, bmasney@redhat.com, robh@kernel.org, conor+dt@kernel.org
Cc: linux-samsung-soc@vger.kernel.org, linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, hajun.sung@samsung.com, raghav.s@samsung.com,
	is.gandhi@samsung.com, ts.amit@samsung.com, pokala.reddy@samsung.com
Subject: [PATCH 02/13] dt-bindings: clock: exynos8855: add top & peric clock
 definitions
Date: Tue, 28 Jul 2026 17:41:00 +0530
Message-Id: <20260728121111.2077860-3-raghav.s@samsung.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260728121111.2077860-1-raghav.s@samsung.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CMS-MailID: 20260728115248epcas5p2862d181151a8635b63d4dd8d174fd7a3
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
CMS-TYPE: 105P
cpgsPolicy: CPGSC10-543,Y
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20260728115248epcas5p2862d181151a8635b63d4dd8d174fd7a3
References: <20260728121111.2077860-1-raghav.s@samsung.com>
	<CGME20260728115248epcas5p2862d181151a8635b63d4dd8d174fd7a3@epcas5p2.samsung.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260728_045254_265949_47AA3A2A 
X-CRM114-Status: GOOD (  17.63  )
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

Add device tree clock binding definitions for CMU_TOP & CMU_PERIC

Signed-off-by: raghav.s <raghav.s@samsung.com>
---
 .../clock/samsung,exynos8855-clock.yaml       | 115 ++++++++++++++++++
 .../dt-bindings/clock/samsung,exynos8855.h    |  82 +++++++++++++
 2 files changed, 197 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/clock/samsung,exynos8855-clock.yaml
 create mode 100644 include/dt-bindings/clock/samsung,exynos8855.h

diff --git a/Documentation/devicetree/bindings/clock/samsung,exynos8855-clock.yaml b/Documentation/devicetree/bindings/clock/samsung,exynos8855-clock.yaml
new file mode 100644
index 000000000000..073c19debd0d
--- /dev/null
+++ b/Documentation/devicetree/bindings/clock/samsung,exynos8855-clock.yaml
@@ -0,0 +1,115 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/clock/samsung,exynos8855-clock.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Samsung Exynos 8855 SoC clock controller
+
+maintainers:
+  - Raghav Sharma <raghav.s@samsung.com>
+
+description: |
+  Exynos 8855 clock controller is comprised of several CMU units, generating
+  clocks for different domains. Those CMU units are modeled as separate device
+  tree nodes, and might depend on each other. Root clocks in that clock tree are
+  two external clocks:: OSCCLK/XTCXO (76.8 MHz) and RTCCLK/XrtcXTI (32768 Hz).
+  The external OSCCLK must be defined as fixed-rate clock in dts.
+
+  CMU_TOP is a top-level CMU, where all base clocks are prepared using PLLs and
+  dividers; all other clocks of function blocks (other CMUs) are usually
+  derived from CMU_TOP.
+
+  Each clock is assigned an identifier and client nodes can use this identifier
+  to specify the clock which they consume. All clocks available for usage
+  in clock consumer nodes are defined as preprocessor macros in
+  'include/dt-bindings/clock/samsung,exynos8855.h' header.
+
+properties:
+  compatible:
+    enum:
+      - samsung,exynos8855-cmu-peric
+      - samsung,exynos8855-cmu-top
+
+  clocks:
+    minItems: 1
+    maxItems: 4
+
+  clock-names:
+    minItems: 1
+    maxItems: 4
+
+  "#clock-cells":
+    const: 1
+
+  reg:
+    maxItems: 1
+
+allOf:
+  - if:
+      properties:
+        compatible:
+          contains:
+            const: samsung,exynos8855-cmu-peric
+
+    then:
+      properties:
+        clocks:
+          items:
+            - description: External reference clock (76.8 MHz)
+            - description: CMU_PERIC NOC clock (from CMU_TOP)
+            - description: CMU_PERIC MMC_CARD clock (from CMU_TOP)
+            - description: CMU_PERIC IP clock (from CMU_TOP)
+
+        clock-names:
+          items:
+            - const: oscclk
+            - const: bus
+            - const: mmc_card
+            - const: ip
+
+  - if:
+      properties:
+        compatible:
+          contains:
+            const: samsung,exynos8855-cmu-top
+
+    then:
+      properties:
+        clocks:
+          items:
+            - description: External reference clock (76.8 MHz)
+
+        clock-names:
+          items:
+            - const: oscclk
+
+required:
+  - compatible
+  - "#clock-cells"
+  - clocks
+  - clock-names
+  - reg
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/clock/samsung,exynos8855.h>
+
+    cmu_peric0: clock-controller@15400000 {
+        compatible = "samsung,exynos8855-cmu-peric";
+        reg = <0x15400000 0x8000>;
+        #clock-cells = <1>;
+
+        clocks = <&xtcxo>,
+                 <&cmu_top CLKCMU_DOUT_PERIC_NOC>,
+                 <&cmu_top CLKCMU_DOUT_PERIC_MMC_CARD>,
+                 <&cmu_top CLKCMU_DOUT_PERIC_IP>;
+        clock-names = "oscclk",
+                      "bus",
+                      "mmc_card",
+                      "ip";
+    };
+
+...
diff --git a/include/dt-bindings/clock/samsung,exynos8855.h b/include/dt-bindings/clock/samsung,exynos8855.h
new file mode 100644
index 000000000000..14369b749fb2
--- /dev/null
+++ b/include/dt-bindings/clock/samsung,exynos8855.h
@@ -0,0 +1,82 @@
+/* SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause) */
+/*
+ * Copyright (c) 2026 Samsung Electronics Co., Ltd.
+ * Author: Raghav Sharma <raghav.s@samsung.com>
+ *
+ * Device Tree binding constants for Exynos 8855 clock controller.
+ */
+
+#ifndef _DT_BINDINGS_CLOCK_EXYNOS8855_H
+#define _DT_BINDINGS_CLOCK_EXYNOS8855_H
+
+/* CMU_TOP  */
+#define FOUT_SHARED0_PLL		   1
+#define FOUT_SHARED1_PLL		   2
+#define FOUT_SHARED2_PLL		   3
+#define FOUT_SHARED3_PLL		   4
+#define FOUT_SHARED4_PLL		   5
+#define FOUT_MMC_PLL			   6
+#define MOUT_SHARED0_PLL		   7
+#define MOUT_SHARED1_PLL		   8
+#define MOUT_SHARED2_PLL		   9
+#define MOUT_SHARED3_PLL		   10
+#define MOUT_SHARED4_PLL		   11
+#define MOUT_MMC_PLL			   12
+#define CLKCMU_MOUT_PERIC_NOC              13
+#define CLKCMU_MOUT_PERIC_MMC_CARD         14
+#define CLKCMU_MOUT_PERIC_IP               15
+#define CLKCMU_DOUT_PERIC_NOC              16
+#define CLKCMU_DOUT_PERIC_MMC_CARD         17
+#define CLKCMU_DOUT_PERIC_IP               18
+#define DOUT_SHARED0_DIV1		   19
+#define DOUT_SHARED0_DIV2		   20
+#define DOUT_SHARED0_DIV3		   21
+#define DOUT_SHARED0_DIV4		   22
+#define DOUT_SHARED1_DIV1		   23
+#define DOUT_SHARED1_DIV2		   24
+#define DOUT_SHARED1_DIV3		   25
+#define DOUT_SHARED1_DIV4		   26
+#define DOUT_SHARED2_DIV1		   27
+#define DOUT_SHARED2_DIV2		   28
+#define DOUT_SHARED2_DIV3		   29
+#define DOUT_SHARED2_DIV4		   30
+#define DOUT_SHARED3_DIV1		   31
+#define DOUT_SHARED3_DIV2		   32
+#define DOUT_SHARED3_DIV3		   33
+#define DOUT_SHARED3_DIV4		   34
+#define DOUT_SHARED4_DIV1		   35
+#define DOUT_SHARED4_DIV2		   36
+#define DOUT_SHARED4_DIV3		   37
+#define DOUT_SHARED4_DIV4		   38
+#define FOUT_MMC_PLL_DIV1                  39
+#define FOUT_MMC_PLL_DIV2                  40
+
+/* CMU_PERIC */
+#define CLK_MOUT_PERIC_IP_USER             1
+#define CLK_MOUT_PERIC_MMC_CARD_USER       2
+#define CLK_MOUT_PERIC_NOC_USER            3
+#define CLK_MOUT_PERIC_I2C                 4
+#define CLK_MOUT_PERIC_UART_DBG            5
+#define CLK_MOUT_PERIC_USI00               6
+#define CLK_MOUT_PERIC_USI01               7
+#define CLK_MOUT_PERIC_USI02               8
+#define CLK_MOUT_PERIC_USI03               9
+#define CLK_MOUT_PERIC_USI04               10
+#define CLK_MOUT_PERIC_USI09_USI_OIS       11
+#define CLK_MOUT_PERIC_USI10_USI_OIS       12
+#define CLK_DOUT_PERIC_NOCP                13
+#define CLK_DOUT_PERIC_UART_DBG            14
+#define CLK_DOUT_PERIC_USI00_USI           15
+#define CLK_DOUT_PERIC_USI01_USI           16
+#define CLK_DOUT_PERIC_USI02_USI           17
+#define CLK_DOUT_PERIC_USI03_USI           18
+#define CLK_DOUT_PERIC_USI04_USI           19
+#define CLK_DOUT_PERIC_USI09_USI_OIS       20
+#define CLK_DOUT_PERIC_USI10_USI_OIS       21
+#define CLK_DOUT_PERIC_USI_I2C             22
+#define CLK_GOUT_CMU_PERIC_IPCLKPORT_PCLK  23
+#define CLK_GOUT_SYSREG_PERIC_IPCLKPORT_PCLK 24
+#define CLK_GOUT_UART_DBG_PERIC_IPCLKPORT_PCLK 25
+#define CLK_GOUT_USI_PERIC_IPCLKPORT_PCLK  26
+
+#endif /* _DT_BINDINGS_CLOCK_EXYNOS8855_H */
-- 
2.34.1


