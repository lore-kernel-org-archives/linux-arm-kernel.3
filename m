Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5C1F1C369AB
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 18 Apr 2025 06:29:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:References:Content-Type:
	Content-Transfer-Encoding:MIME-Version:In-Reply-To:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=xgncfsXMxq1UbW2oBNT5fRdmhvcqQjNCYqaHqXrv94Y=; b=HGoC7JrVjImP3saiZH0iD/ZSCl
	vdm7Wz/FxxPRjQAS8icpGkLLN/7+YK8yWWUsFYfXWtMimk5XruiSJujk5mfpfwAPfI+z1JHHTcCfZ
	BucCrvS8h5A/i+IvO1W9muc5cSP/N1dokhNuGYkSLM2DjMnoageVppPBGVL+wbQ386x+06i6InBG8
	8krZZxMpjWQQVUVyAfZsyDSE/GR+NemYWUCQu4t7O+3j4lGRX5P+1ihJm9nzS3vkmjyD7Zac+xMZk
	ATX+Gi+pFXbmgnObaz6WaWVigqVr+uf9+Sl0jDX9p1uA7eIptKP2bVJGt/5s4AD6hGUQe5E6hU94Z
	3FmVveHQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u5fE3-0000000FGFV-3PI3;
	Fri, 18 Apr 2025 06:29:24 +0000
Received: from mailout4.samsung.com ([203.254.224.34])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u5f0W-0000000FEjW-1xiy
	for linux-arm-kernel@lists.infradead.org;
	Fri, 18 Apr 2025 06:15:26 +0000
Received: from epcas2p3.samsung.com (unknown [182.195.41.55])
	by mailout4.samsung.com (KnoxPortal) with ESMTP id 20250418061517epoutp04168a384c710dee6d06f23f9cd524a4de~3VRIuCrZq2022620226epoutp04q
	for <linux-arm-kernel@lists.infradead.org>; Fri, 18 Apr 2025 06:15:17 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout4.samsung.com 20250418061517epoutp04168a384c710dee6d06f23f9cd524a4de~3VRIuCrZq2022620226epoutp04q
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1744956917;
	bh=xgncfsXMxq1UbW2oBNT5fRdmhvcqQjNCYqaHqXrv94Y=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=nQXHJLa/Q9+/ipB5NbrO2lsBvR3uUIiytSo7b+As00s2DStwbGpbW+UXBHUew/4e2
	 BKB7wN3Qqaihqc/cdfaZbUM7ldNW3XpakAV4E6jEgMvfEKOuXhTb/FjW8an0JSbGix
	 l5AJI/ELOpA0ML9fdzphrOd/dFfby4BGcH3x7KDQ=
Received: from epsnrtp02.localdomain (unknown [182.195.42.154]) by
	epcas2p2.samsung.com (KnoxPortal) with ESMTPS id
	20250418061516epcas2p2e37511d73b5602fc29c3acbfb2d0c82f~3VRHxn0zE2967429674epcas2p2A;
	Fri, 18 Apr 2025 06:15:16 +0000 (GMT)
Received: from epcas2p2.samsung.com (unknown [182.195.36.92]) by
	epsnrtp02.localdomain (Postfix) with ESMTP id 4Zf4Hl5kVnz2SSKg; Fri, 18 Apr
	2025 06:15:15 +0000 (GMT)
Received: from epsmtrp2.samsung.com (unknown [182.195.40.14]) by
	epcas2p3.samsung.com (KnoxPortal) with ESMTPA id
	20250418061515epcas2p3d2dd703db7eb645f4866dcb01cc288fc~3VRG3Pxah1350013500epcas2p3x;
	Fri, 18 Apr 2025 06:15:15 +0000 (GMT)
Received: from epsmgms1p2new.samsung.com (unknown [182.195.42.42]) by
	epsmtrp2.samsung.com (KnoxPortal) with ESMTP id
	20250418061515epsmtrp279335f4aa93070e078ce3c0c6d34dcd2~3VRG2YUnS0714207142epsmtrp23;
	Fri, 18 Apr 2025 06:15:15 +0000 (GMT)
X-AuditID: b6c32a2a-d57fe70000002265-d1-6801edf289e9
Received: from epsmtip1.samsung.com ( [182.195.34.30]) by
	epsmgms1p2new.samsung.com (Symantec Messaging Gateway) with SMTP id
	B1.AE.08805.2FDE1086; Fri, 18 Apr 2025 15:15:15 +0900 (KST)
Received: from localhost.localdomain (unknown [10.229.9.60]) by
	epsmtip1.samsung.com (KnoxPortal) with ESMTPA id
	20250418061514epsmtip1965d5c7ecebd25a400c904c7d312abec~3VRGkVuK60438204382epsmtip1O;
	Fri, 18 Apr 2025 06:15:14 +0000 (GMT)
From: Shin Son <shin.son@samsung.com>
To: Krzysztof Kozlowski <krzk@kernel.org>, Sylwester Nawrocki
	<s.nawrocki@samsung.com>, Chanwoo Choi <cw00.choi@samsung.com>, Alim Akhtar
	<alim.akhtar@samsung.com>, Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>, Conor Dooley
	<conor+dt@kernel.org>, Sunyeal Hong <sunyeal.hong@samsung.com>
Cc: Shin Son <shin.son@samsung.com>, linux-samsung-soc@vger.kernel.org,
	linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: [PATCH 1/3] dt-bindings: clock: exynosautov920: add cpucl0 clock
 definitions
Date: Fri, 18 Apr 2025 15:14:58 +0900
Message-ID: <20250418061500.1629200-2-shin.son@samsung.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250418061500.1629200-1-shin.son@samsung.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFnrFLMWRmVeSWpSXmKPExsWy7bCSnO7nt4wZBhvXslg8mLeNzWLN3nNM
	Fte/PGe1mH/kHKvF+fMb2C02Pb7GavGx5x6rxeVdc9gsZpzfx2Rx8ZSrxf89O9gtDr9pZ7X4
	d20ji8Xk42tZLZqWrWdy4Pd4f6OV3WPTqk42j81L6j36tqxi9Pi8SS6ANYrLJiU1J7MstUjf
	LoEr4/uNNcwFH8Qr9iyfy9TAeF2oi5GDQ0LARGLjdoEuRi4OIYHdjBKndy1n7WLkBIpLSBye
	MYERwhaWuN9yhBWi6D2jxMXl39hBmtkEVCU2/ZYHiYsIvGWSWP7/ABNIA7PAaUaJnWdkQGxh
	gVCJLdumsYPYLED1N/Y3sYDYvALWEl83nWKGOEJeor9DAiTMKWAjsXTfLDaQsBBQycIXdRDV
	ghInZz5hgZguL9G8dTbzBEaBWUhSs5CkFjAyrWKUTC0ozk3PLTYsMMpLLdcrTswtLs1L10vO
	z93ECI4OLa0djHtWfdA7xMjEwXiIUYKDWUmE95z5v3Qh3pTEyqrUovz4otKc1OJDjNIcLEri
	vN9e96YICaQnlqRmp6YWpBbBZJk4OKUamIxn8rhEHSr9ZPovQp9PPdH1ANfr4qm7T29QWncz
	6Oatyqq6JXGmLJfXP/o8o+DPQu5tuoUKk313pM5y3OsbLM/mYfVkf/yf3RHGkf9/sX3JKolO
	+bbdUzI3+cuN63LMJjL/Jb3WfsryrudpZ3I40v2IR2tq79KgBYna6xW63qwW3jJl5vdXOSem
	Oee+ctnvvappV9OmvUdWt1xsXiKW8Hcyl+HHaD+j+7xthZePdb77817guPwKSX0rq93Cdcfv
	v3mtYBl/kk/r6+pXd/bsyivI7Os49vLS5fNi/FFq190N2SMMkiJkd0y4+enTkpmXnuhNaXt/
	o85p3oX30cdrw+oXbnp+/f0pizfxEzY9bmxWYinOSDTUYi4qTgQAgyanv/0CAAA=
X-CMS-MailID: 20250418061515epcas2p3d2dd703db7eb645f4866dcb01cc288fc
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-Sendblock-Type: AUTO_CONFIDENTIAL
CMS-TYPE: 102P
cpgsPolicy: CPGSC10-234,Y
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20250418061515epcas2p3d2dd703db7eb645f4866dcb01cc288fc
References: <20250418061500.1629200-1-shin.son@samsung.com>
	<CGME20250418061515epcas2p3d2dd703db7eb645f4866dcb01cc288fc@epcas2p3.samsung.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250417_231525_235732_84F3A3DC 
X-CRM114-Status: GOOD (  14.07  )
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

Add cpucl0 clock definitions.

Signed-off-by: Shin Son <shin.son@samsung.com>
---
 .../clock/samsung,exynosautov920-clock.yaml   | 25 +++++++++++++++++++
 .../clock/samsung,exynosautov920.h            | 19 ++++++++++++++
 2 files changed, 44 insertions(+)

diff --git a/Documentation/devicetree/bindings/clock/samsung,exynosautov920-clock.yaml b/Documentation/devicetree/bindings/clock/samsung,exynosautov920-clock.yaml
index 3330b2727474..d12b17c177df 100644
--- a/Documentation/devicetree/bindings/clock/samsung,exynosautov920-clock.yaml
+++ b/Documentation/devicetree/bindings/clock/samsung,exynosautov920-clock.yaml
@@ -8,6 +8,7 @@ title: Samsung ExynosAuto v920 SoC clock controller
 
 maintainers:
   - Sunyeal Hong <sunyeal.hong@samsung.com>
+  - Shin Son <shin.son@samsung.com>
   - Chanwoo Choi <cw00.choi@samsung.com>
   - Krzysztof Kozlowski <krzk@kernel.org>
   - Sylwester Nawrocki <s.nawrocki@samsung.com>
@@ -32,6 +33,7 @@ properties:
   compatible:
     enum:
       - samsung,exynosautov920-cmu-top
+      - samsung,exynosautov920-cmu-cpucl0
       - samsung,exynosautov920-cmu-peric0
       - samsung,exynosautov920-cmu-peric1
       - samsung,exynosautov920-cmu-misc
@@ -69,6 +71,29 @@ allOf:
           items:
             - const: oscclk
 
+  - if:
+      properties:
+        compatible:
+          contains:
+            enum:
+              - samsung,exynosautov920-cmu-cpucl0
+
+    then:
+      properties:
+        clocks:
+          items:
+            - description: External reference clock (38.4 MHz)
+            - description: CMU_CPUCL0 SWITCH clock (from CMU_TOP)
+            - description: CMU_CPUCL0 CLUSTER clock (from CMU_TOP)
+            - description: CMU_CPUCL0 DBG clock (from CMU_TOP)
+
+        clock-names:
+          items:
+            - const: oscclk
+            - const: switch
+            - const: cluster
+            - const: dbg
+
   - if:
       properties:
         compatible:
diff --git a/include/dt-bindings/clock/samsung,exynosautov920.h b/include/dt-bindings/clock/samsung,exynosautov920.h
index 0c681f2ba3d0..c57a1d749700 100644
--- a/include/dt-bindings/clock/samsung,exynosautov920.h
+++ b/include/dt-bindings/clock/samsung,exynosautov920.h
@@ -162,6 +162,25 @@
 #define DOUT_CLKCMU_TAA_NOC		146
 #define DOUT_TCXO_DIV2			147
 
+/* CMU_CPUCL0 */
+#define CLK_FOUT_CPUCL0_PLL		1
+
+#define CLK_MOUT_PLL_CPUCL0		2
+#define CLK_MOUT_CPUCL0_CLUSTER_USER	3
+#define CLK_MOUT_CPUCL0_DBG_USER	4
+#define CLK_MOUT_CPUCL0_SWITCH_USER	5
+#define CLK_MOUT_CPUCL0_CLUSTER		6
+#define CLK_MOUT_CPUCL0_CORE		7
+
+#define CLK_DOUT_CLUSTER0_ACLK		8
+#define CLK_DOUT_CLUSTER0_ATCLK		9
+#define CLK_DOUT_CLUSTER0_MPCLK		10
+#define CLK_DOUT_CLUSTER0_PCLK		11
+#define CLK_DOUT_CLUSTER0_PERIPHCLK	12
+#define CLK_DOUT_CPUCL0_DBG_NOC		13
+#define CLK_DOUT_CPUCL0_DBG_PCLKDBG	14
+#define CLK_DOUT_CPUCL0_NOCP		15
+
 /* CMU_PERIC0 */
 #define CLK_MOUT_PERIC0_IP_USER		1
 #define CLK_MOUT_PERIC0_NOC_USER	2
-- 
2.49.0


