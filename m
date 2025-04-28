Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7362FC36005
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 28 Apr 2025 09:16:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:References:Content-Type:
	Content-Transfer-Encoding:MIME-Version:In-Reply-To:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=QoLHO3NZ8rCIAR98kSnIlqa+IDRuSTF1aJXvuCF0QoI=; b=hlGB2O8lQkZxl31kYdmkpKp0Df
	Dz8J5kDauwjyf2RKnI/AN8mSp9CPyKDbtXCSAVcM1rZtn4M87aE9ijt1x11+RnXl1NtzE/q9wHdbp
	gHJL6wut/qeisomsAxaG6u7mlZMCAUULrutClq/t3cw4ymt2mo0ZBZZXSGSIebUP0dFkKMb7doxyk
	3Ab+5S0AL6ofmfwdfq7+BwdR9HbDlZlOOSkT2ny12cdZJ3+bygrtWiHUp00RKuT+R7gMfyWdu2oVN
	zFJJQ4hDx2Vbacj+kjAU/iIK/+LhR0AgdYR0DLzBAMQnYj6ZwjwXnnTrNngRHBcFT53qpPjgWpjVT
	bnej20/A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u9Kau-00000005ZD3-3iKX;
	Mon, 28 Apr 2025 09:16:08 +0000
Received: from mailout1.samsung.com ([203.254.224.24])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u9K9I-00000005Vfa-39lQ
	for linux-arm-kernel@lists.infradead.org;
	Mon, 28 Apr 2025 08:47:41 +0000
Received: from epcas2p2.samsung.com (unknown [182.195.41.54])
	by mailout1.samsung.com (KnoxPortal) with ESMTP id 20250428084730epoutp01e93ae46ea8afc39976ee72f35f22dbe1~6by5C-uRO1617916179epoutp01Z
	for <linux-arm-kernel@lists.infradead.org>; Mon, 28 Apr 2025 08:47:30 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout1.samsung.com 20250428084730epoutp01e93ae46ea8afc39976ee72f35f22dbe1~6by5C-uRO1617916179epoutp01Z
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1745830050;
	bh=QoLHO3NZ8rCIAR98kSnIlqa+IDRuSTF1aJXvuCF0QoI=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=DJCyUBORRyMdGMvG69AU9hZxdEruCceJnKm7Iti4ydd8Myd9GcFPDAI7qekwG+Ws2
	 +mfoSiqJdcVFPG9JeigXakIENRg0oBhQRTrGYP69rTzwBwEbCmdf8RwNWp3qDEPWoJ
	 uEE/IyAnAZHZtwj4BVFtTeyp1uoBlXSccp7HZpV0=
Received: from epsnrtp03.localdomain (unknown [182.195.42.155]) by
	epcas2p3.samsung.com (KnoxPortal) with ESMTPS id
	20250428084729epcas2p35137e4bcf253f9e096fb3f5606f686e4~6by4jwZkH3025530255epcas2p3G;
	Mon, 28 Apr 2025 08:47:29 +0000 (GMT)
Received: from epcas2p4.samsung.com (unknown [182.195.36.100]) by
	epsnrtp03.localdomain (Postfix) with ESMTP id 4ZmHBn1Yllz3hhTF; Mon, 28 Apr
	2025 08:47:29 +0000 (GMT)
Received: from epsmtrp1.samsung.com (unknown [182.195.40.13]) by
	epcas2p3.samsung.com (KnoxPortal) with ESMTPA id
	20250428084728epcas2p34ffa0051a16c10ff1c358a98cc2c2fa4~6by3suCY13025530255epcas2p3D;
	Mon, 28 Apr 2025 08:47:28 +0000 (GMT)
Received: from epsmgmcp1.samsung.com (unknown [182.195.42.82]) by
	epsmtrp1.samsung.com (KnoxPortal) with ESMTP id
	20250428084728epsmtrp174d195cdaba526ea41263bb1f6542b04~6by3rh5KQ2986529865epsmtrp1Y;
	Mon, 28 Apr 2025 08:47:28 +0000 (GMT)
X-AuditID: b6c32a52-40bff70000004c16-cc-680f40a03307
Received: from epsmtip1.samsung.com ( [182.195.34.30]) by
	epsmgmcp1.samsung.com (Symantec Messaging Gateway) with SMTP id
	E2.CF.19478.0A04F086; Mon, 28 Apr 2025 17:47:28 +0900 (KST)
Received: from localhost.localdomain (unknown [10.229.9.60]) by
	epsmtip1.samsung.com (KnoxPortal) with ESMTPA id
	20250428084728epsmtip141d3738578162e2eca70d97b76378d1b~6by3bPxOp1942219422epsmtip1G;
	Mon, 28 Apr 2025 08:47:28 +0000 (GMT)
From: Shin Son <shin.son@samsung.com>
To: Krzysztof Kozlowski <krzk@kernel.org>, Sylwester Nawrocki
	<s.nawrocki@samsung.com>, Chanwoo Choi <cw00.choi@samsung.com>, Alim Akhtar
	<alim.akhtar@samsung.com>, Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>, Conor Dooley
	<conor+dt@kernel.org>, Sunyeal Hong <sunyeal.hong@samsung.com>
Cc: Shin Son <shin.son@samsung.com>, linux-samsung-soc@vger.kernel.org,
	linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: [PATCH 1/3] dt-bindings: clock: exynosautov920: add cpucl1/2 clock
 definitions
Date: Mon, 28 Apr 2025 17:47:19 +0900
Message-ID: <20250428084721.3832664-2-shin.son@samsung.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250428084721.3832664-1-shin.son@samsung.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFnrOLMWRmVeSWpSXmKPExsWy7bCSnO4CB/4Mg/uTpC0ezNvGZrFm7zkm
	i+tfnrNazD9yjtXi/PkN7BabHl9jtfjYc4/V4vKuOWwWM87vY7K4eMrV4v+eHewWh9+0s1r8
	u7aRxWLy8bWsFk3L1jM58Hu8v9HK7rFpVSebx+Yl9R59W1YxenzeJBfAGsVlk5Kak1mWWqRv
	l8CV8e7RG/aC87IVjZe2sjYwHhLrYuTkkBAwkej+sJi5i5GLQ0hgO6NEY8djJoiEhMThGRMY
	IWxhifstR1ghit4zStyb3sfexcjBwSagKrHptzxIXETgLZPE8v8HwJqZBU4zSuw8IwNiCwuE
	S3y+f4MZxGYBqb+4jwXE5hWwlmibdoUNZI6EgLxEf4cESJhTwEbi/MVOsLAQUElfDzdEtaDE
	yZlPWCCmy0s0b53NPIFRYBaS1CwkqQWMTKsYRVMLinPTc5MLDPWKE3OLS/PS9ZLzczcxguNC
	K2gH47L1f/UOMTJxMB5ilOBgVhLhrTLgzxDiTUmsrEotyo8vKs1JLT7EKM3BoiTOq5zTmSIk
	kJ5YkpqdmlqQWgSTZeLglGpgCosTW+DWcrw1YPqBMzXrSmRy+f6lx9yXm7xUZ3PnR2eD20ob
	7k7+9uDF2wWSn1RnqbvtTzVqYtnsUvrtZNWsvU917Ex9LM7f+XtGwXnhrxue4VvesavvKnkp
	3vBe9bfc4nvLLlz4WHqt/C7DXL+jAk991L/HLsxVuiDv43NjTdlGnym+m18t15HRUZrfk67T
	9f+/VOOpTPmiq+fEX5puenKw97pwQ6beWcWSw3vrXs2NPFHHW9i34tGvKX7hV34fzMiwFK1i
	t/h6vOSksWPWHhWh4uvPln6ZxrpRRm9v28btr2S6+PPz7BeE5fy/FHVnn8uD4g/OH7av+tC3
	dt+DbRyXNi+LWfosVPrPxSTdCa+VWIozEg21mIuKEwHlZRX5+gIAAA==
X-CMS-MailID: 20250428084728epcas2p34ffa0051a16c10ff1c358a98cc2c2fa4
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-Sendblock-Type: AUTO_CONFIDENTIAL
CMS-TYPE: 102P
cpgsPolicy: CPGSC10-234,Y
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20250428084728epcas2p34ffa0051a16c10ff1c358a98cc2c2fa4
References: <20250428084721.3832664-1-shin.son@samsung.com>
	<CGME20250428084728epcas2p34ffa0051a16c10ff1c358a98cc2c2fa4@epcas2p3.samsung.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250428_014739_042166_B8551D46 
X-CRM114-Status: GOOD (  17.09  )
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
 .../clock/samsung,exynosautov920-clock.yaml   | 45 +++++++++++++++++++
 .../clock/samsung,exynosautov920.h            | 32 +++++++++++++
 2 files changed, 77 insertions(+)

diff --git a/Documentation/devicetree/bindings/clock/samsung,exynosautov920-clock.yaml b/Documentation/devicetree/bindings/clock/samsung,exynosautov920-clock.yaml
index d12b17c177df..dbeae0cb0cb9 100644
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
@@ -94,6 +96,49 @@ allOf:
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


