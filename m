Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1E1BBC369D5
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 28 Apr 2025 12:07:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:References:Content-Type:
	Content-Transfer-Encoding:MIME-Version:In-Reply-To:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=WOSaJk+LyfIfK/WarqDX8SmvpoEF/Z0mkKWP3bqumMw=; b=VyKWw+zxojJ2h1L7YcR9Ngrt2f
	W9F9NmyZRCeRQrV8q85HMKc8fwgd9J3hBOdxvzfU1EfI3vmw6TUXdnMuCHNE2P+93q0jqTyZHxL2o
	d4vDOo4y6qNOFmy5fdULli63kxd1Lak2rvn267egUov5UuSUaKSymKntlw3PHAld85XA2ivM9YVCD
	U83ObDHH9A0V9su6n98Gd5OuyOD7BH49QxRIJ+oLXdTsu/fe0l8N/XMWZH9130P6BoZ3S+ApkCCPn
	UMwXHsLLIYmzVKex9nFsC5y+FNW22pJAqDW1EFkR9MIIfF8rM/m6tY3IQRGwRck9WNsFLTdor63I6
	bBraAJsw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u9NH3-000000066hh-21CP;
	Mon, 28 Apr 2025 12:07:50 +0000
Received: from mailout1.samsung.com ([203.254.224.24])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u9Mm8-00000005yiO-3e4A
	for linux-arm-kernel@lists.infradead.org;
	Mon, 28 Apr 2025 11:35:54 +0000
Received: from epcas2p2.samsung.com (unknown [182.195.41.54])
	by mailout1.samsung.com (KnoxPortal) with ESMTP id 20250428113549epoutp0124f2d19995f6e56749cf3e0def4749e7~6eF2hxAA41407114071epoutp01K
	for <linux-arm-kernel@lists.infradead.org>; Mon, 28 Apr 2025 11:35:49 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout1.samsung.com 20250428113549epoutp0124f2d19995f6e56749cf3e0def4749e7~6eF2hxAA41407114071epoutp01K
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1745840149;
	bh=WOSaJk+LyfIfK/WarqDX8SmvpoEF/Z0mkKWP3bqumMw=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=UskXo8ll991jWMx5Km1Anht0Facz2bhr8bOu1yHxlsAduh59Fw1CqUux7uqYgzDsc
	 5DM/vXhzJNp6DMh19uPTDel18qn7eJfhIfhujwnxPDYHhqdG5BGD64RXNsn1mx3UDQ
	 ky+rEMZXmIhuLL2V+Mwm4OC2xiDD+kQm042RZg/8=
Received: from epsnrtp03.localdomain (unknown [182.195.42.155]) by
	epcas2p4.samsung.com (KnoxPortal) with ESMTPS id
	20250428113548epcas2p450ad7d04e1b9327c22930874d1c8d2f0~6eF2DOtFI1115111151epcas2p4u;
	Mon, 28 Apr 2025 11:35:48 +0000 (GMT)
Received: from epcas2p2.samsung.com (unknown [182.195.36.69]) by
	epsnrtp03.localdomain (Postfix) with ESMTP id 4ZmLx01jLGz3hhT8; Mon, 28 Apr
	2025 11:35:48 +0000 (GMT)
Received: from epsmtrp2.samsung.com (unknown [182.195.40.14]) by
	epcas2p4.samsung.com (KnoxPortal) with ESMTPA id
	20250428113547epcas2p43ca3c8db840a4235365f61151b043fb3~6eF1IU5Hf1722817228epcas2p4G;
	Mon, 28 Apr 2025 11:35:47 +0000 (GMT)
Received: from epsmgms1p1new.samsung.com (unknown [182.195.42.41]) by
	epsmtrp2.samsung.com (KnoxPortal) with ESMTP id
	20250428113547epsmtrp2503eb2c944376df9ca94915b20cc0f89~6eF1GisHo1223712237epsmtrp2c;
	Mon, 28 Apr 2025 11:35:47 +0000 (GMT)
X-AuditID: b6c32a29-566fe7000000223e-c7-680f6813a178
Received: from epsmtip1.samsung.com ( [182.195.34.30]) by
	epsmgms1p1new.samsung.com (Symantec Messaging Gateway) with SMTP id
	52.F1.08766.3186F086; Mon, 28 Apr 2025 20:35:47 +0900 (KST)
Received: from localhost.localdomain (unknown [10.229.9.60]) by
	epsmtip1.samsung.com (KnoxPortal) with ESMTPA id
	20250428113547epsmtip19926f82ffb5b3521533d66fbd4879c55~6eF06pstP2476824768epsmtip1b;
	Mon, 28 Apr 2025 11:35:47 +0000 (GMT)
From: Shin Son <shin.son@samsung.com>
To: Krzysztof Kozlowski <krzk@kernel.org>, Sylwester Nawrocki
	<s.nawrocki@samsung.com>, Chanwoo Choi <cw00.choi@samsung.com>, Alim Akhtar
	<alim.akhtar@samsung.com>, Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>, Conor Dooley
	<conor+dt@kernel.org>, Sunyeal Hong <sunyeal.hong@samsung.com>
Cc: Shin Son <shin.son@samsung.com>, linux-samsung-soc@vger.kernel.org,
	linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: [PATCH v2 1/4] dt-bindings: clock: exynosautov920: add cpucl1/2
 clock definitions
Date: Mon, 28 Apr 2025 20:35:14 +0900
Message-ID: <20250428113517.426987-2-shin.son@samsung.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250428113517.426987-1-shin.son@samsung.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFnrFLMWRmVeSWpSXmKPExsWy7bCSnK5wBn+GQc9peYsH87axWazZe47J
	4vqX56wW84+cY7U4f34Du8Wmx9dYLT723GO1uLxrDpvFjPP7mCwunnK1+L9nB7vF4TftrBb/
	rm1ksZh8fC2rRdOy9UwO/B7vb7Sye2xa1cnmsXlJvUffllWMHp83yQWwRnHZpKTmZJalFunb
	JXBlbL33l6XgrGzF4uU/2BoYD4l1MXJySAiYSHzrf8rcxcjFISSwm1Fibt9EZoiEhMThGRMY
	IWxhifstR1ghit4zSjxY/o29i5GDg01AVWLTb3mQuIjAWyaJ5f8PMIE0MAucZpTYeUYGxBYW
	iJJobt/ADFLPAlR/uC8exOQVsJK4P1UIxJQQkJfo75AAKeYUsJb4dHEd2AVCQBUTHp9hA7F5
	BQQlTs58wgIxXF6ieets5gmMArOQpGYhSS1gZFrFKJlaUJybnltsWGCYl1quV5yYW1yal66X
	nJ+7iREcHVqaOxi3r/qgd4iRiYPxEKMEB7OSCG+VAX+GEG9KYmVValF+fFFpTmrxIUZpDhYl
	cV7xF70pQgLpiSWp2ampBalFMFkmDk6pBqaIJXK7Atw5n79iU7tVYVV88alyGkdAxnv731Pa
	zvIxeH/zdxddvnOq2O8LXxZpvs5/K+rgrjd/f8QO5um99118vwgLyejInfDQbmh9lzD1ku/E
	P6WxFRbzlfO454mzFzq48MWZ5x5aznzI177//VTLT6InGPLsdD/92i5iUWXSlFbyLr3kUis3
	75uIS59E9ogtKk/X4A7LXMmSPr3tcVoCX6NE7T6HY19Kn914fn71ig/bGsLj3DeX3D974HeZ
	gf9TnwvP8riCvp//wq59w2i2UR3ftbB9chOS1ENV+1ZI+Jsev7rKO68jXXb/hqLLLx7+W/wq
	tfPVR4+SW5FFwlIl8iGbvi8t8yvvjxOfocRSnJFoqMVcVJwIAMEGOWT9AgAA
X-CMS-MailID: 20250428113547epcas2p43ca3c8db840a4235365f61151b043fb3
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-Sendblock-Type: AUTO_CONFIDENTIAL
CMS-TYPE: 102P
cpgsPolicy: CPGSC10-234,Y
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20250428113547epcas2p43ca3c8db840a4235365f61151b043fb3
References: <20250428113517.426987-1-shin.son@samsung.com>
	<CGME20250428113547epcas2p43ca3c8db840a4235365f61151b043fb3@epcas2p4.samsung.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250428_043553_217682_29A8E05A 
X-CRM114-Status: GOOD (  17.10  )
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

Add cpucl1 and cpucl2 clock definitions.

CPUCL1/2 refer to CPU Cluster 1 and CPU Cluster 2,
which provide clock support for the CPUs on Exynosauto V920 SoC.

Signed-off-by: Shin Son <shin.son@samsung.com>
---
 .../clock/samsung,exynosautov920-clock.yaml   | 44 +++++++++++++++++++
 .../clock/samsung,exynosautov920.h            | 32 ++++++++++++++
 2 files changed, 76 insertions(+)

diff --git a/Documentation/devicetree/bindings/clock/samsung,exynosautov920-clock.yaml b/Documentation/devicetree/bindings/clock/samsung,exynosautov920-clock.yaml
index d12b17c177df..6961a68098f4 100644
--- a/Documentation/devicetree/bindings/clock/samsung,exynosautov920-clock.yaml
+++ b/Documentation/devicetree/bindings/clock/samsung,exynosautov920-clock.yaml
@@ -34,6 +34,8 @@ properties:
     enum:
       - samsung,exynosautov920-cmu-top
       - samsung,exynosautov920-cmu-cpucl0
+      - samsung,exynosautov920-cmu-cpucl1
+      - samsung,exynosautov920-cmu-cpucl2
       - samsung,exynosautov920-cmu-peric0
       - samsung,exynosautov920-cmu-peric1
       - samsung,exynosautov920-cmu-misc
@@ -94,6 +96,48 @@ allOf:
             - const: cluster
             - const: dbg
 
+  - if:
+      properties:
+        compatible:
+          contains:
+            enum:
+              - samsung,exynosautov920-cmu-cpucl1
+
+    then:
+      properties:
+        clocks:
+          items:
+            - description: External reference clock (38.4 MHz)
+            - description: CMU_CPUCL1 SWITCH clock (from CMU_TOP)
+            - description: CMU_CPUCL1 CLUSTER clock (from CMU_TOP)
+
+        clock-names:
+          items:
+            - const: oscclk
+            - const: switch
+            - const: cluster
+
+  - if:
+      properties:
+        compatible:
+          contains:
+            enum:
+              - samsung,exynosautov920-cmu-cpucl2
+
+    then:
+      properties:
+        clocks:
+          items:
+            - description: External reference clock (38.4 MHz)
+            - description: CMU_CPUCL2 SWITCH clock (from CMU_TOP)
+            - description: CMU_CPUCL2 CLUSTER clock (from CMU_TOP)
+
+        clock-names:
+          items:
+            - const: oscclk
+            - const: switch
+            - const: cluster
+
   - if:
       properties:
         compatible:
diff --git a/include/dt-bindings/clock/samsung,exynosautov920.h b/include/dt-bindings/clock/samsung,exynosautov920.h
index c57a1d749700..5e6896e9627f 100644
--- a/include/dt-bindings/clock/samsung,exynosautov920.h
+++ b/include/dt-bindings/clock/samsung,exynosautov920.h
@@ -181,6 +181,38 @@
 #define CLK_DOUT_CPUCL0_DBG_PCLKDBG	14
 #define CLK_DOUT_CPUCL0_NOCP		15
 
+/* CMU_CPUCL1 */
+#define CLK_FOUT_CPUCL1_PLL		1
+
+#define CLK_MOUT_PLL_CPUCL1		2
+#define CLK_MOUT_CPUCL1_CLUSTER_USER	3
+#define CLK_MOUT_CPUCL1_SWITCH_USER	4
+#define CLK_MOUT_CPUCL1_CLUSTER		5
+#define CLK_MOUT_CPUCL1_CORE		6
+
+#define CLK_DOUT_CLUSTER1_ACLK		7
+#define CLK_DOUT_CLUSTER1_ATCLK		8
+#define CLK_DOUT_CLUSTER1_MPCLK		9
+#define CLK_DOUT_CLUSTER1_PCLK		10
+#define CLK_DOUT_CLUSTER1_PERIPHCLK	11
+#define CLK_DOUT_CPUCL1_NOCP		12
+
+/* CMU_CPUCL2 */
+#define CLK_FOUT_CPUCL2_PLL		1
+
+#define CLK_MOUT_PLL_CPUCL2		2
+#define CLK_MOUT_CPUCL2_CLUSTER_USER	3
+#define CLK_MOUT_CPUCL2_SWITCH_USER	4
+#define CLK_MOUT_CPUCL2_CLUSTER		5
+#define CLK_MOUT_CPUCL2_CORE		6
+
+#define CLK_DOUT_CLUSTER2_ACLK		7
+#define CLK_DOUT_CLUSTER2_ATCLK		8
+#define CLK_DOUT_CLUSTER2_MPCLK		9
+#define CLK_DOUT_CLUSTER2_PCLK		10
+#define CLK_DOUT_CLUSTER2_PERIPHCLK	11
+#define CLK_DOUT_CPUCL2_NOCP		12
+
 /* CMU_PERIC0 */
 #define CLK_MOUT_PERIC0_IP_USER		1
 #define CLK_MOUT_PERIC0_NOC_USER	2
-- 
2.49.0


