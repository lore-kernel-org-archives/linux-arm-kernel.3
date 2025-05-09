Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6157FC3ABBC
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  9 May 2025 15:06:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:References:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:List-Owner;
	bh=uJ5xv2x3X+CRQNWp7iVnE+JtSDZ7GFWFYjczehxiho4=; b=2rzGSKd5sUMl8K52N9fJdmXlZb
	Jr4hu5NJmidJ4cprGEH3isTm5fD/qEHY1iL1eNNA75Vy/cVWvcElal+Adcr9nIiRYKQUlOhL2wAjQ
	rg8chw4tKTaZZsV/jqervWMhqsJQWCnUrVVUI5EWP6BgD0OFySMAnd9Tup/FDhPXkdh10WkFUzdJI
	LcbibG70cbILBBqk2G8mVPJ9E8df5CC1oRAAaFSU90LMC/c7PIWNkKG9a4Kg5EhiriwsrDlnScR+E
	ipEHydxKDUSM/EuXWcuFl+yeOKVWAf+MvwDyQX47iyKOzH4Ba7d4ZA9EaYUxE1x5olRr38fYrxImx
	o/wHN60Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uDPIU-000000041dB-29Fl;
	Fri, 09 May 2025 15:05:58 +0000
Received: from mailout2.samsung.com ([203.254.224.25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uDNt2-00000003n4r-2s7n
	for linux-arm-kernel@lists.infradead.org;
	Fri, 09 May 2025 13:35:38 +0000
Received: from epcas5p2.samsung.com (unknown [182.195.41.40])
	by mailout2.samsung.com (KnoxPortal) with ESMTP id 20250509133532epoutp020eaf395efbe7aa1b1d255f647ccecafc~930iAdXvv2816528165epoutp02j
	for <linux-arm-kernel@lists.infradead.org>; Fri,  9 May 2025 13:35:32 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout2.samsung.com 20250509133532epoutp020eaf395efbe7aa1b1d255f647ccecafc~930iAdXvv2816528165epoutp02j
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1746797733;
	bh=uJ5xv2x3X+CRQNWp7iVnE+JtSDZ7GFWFYjczehxiho4=;
	h=From:To:Cc:Subject:Date:References:From;
	b=i+VTSVIWQo2OHtACmCTOYnEtFEs+AsI1FbspSS0Z7T87WOgKSxC9iL6z4WI36KPoJ
	 lMuel5I7Kp91C1DyusZYYghlGi5ImkOSAXjN99u/UUzUX90FRpdHQPHWh2vd+ExWjX
	 YpEswFkogWCUYH+Z9GpDft4ot7QGkueW+nYLreI8=
Received: from epsnrtp01.localdomain (unknown [182.195.42.153]) by
	epcas5p2.samsung.com (KnoxPortal) with ESMTPS id
	20250509133532epcas5p21941906580941e4d09b5537939fd6155~930hZsG6t1470614706epcas5p2b;
	Fri,  9 May 2025 13:35:32 +0000 (GMT)
Received: from epcas5p2.samsung.com (unknown [182.195.38.183]) by
	epsnrtp01.localdomain (Postfix) with ESMTP id 4Zv9423nBYz6B9m5; Fri,  9 May
	2025 13:35:30 +0000 (GMT)
Received: from epsmtrp1.samsung.com (unknown [182.195.40.13]) by
	epcas5p1.samsung.com (KnoxPortal) with ESMTPA id
	20250509131427epcas5p1fe29ea19cb7624dc828935d6ec47854b~93iH5KmMz0480904809epcas5p1q;
	Fri,  9 May 2025 13:14:27 +0000 (GMT)
Received: from epsmgmcp1.samsung.com (unknown [182.195.42.82]) by
	epsmtrp1.samsung.com (KnoxPortal) with ESMTP id
	20250509131427epsmtrp11595d142fc3783a9bfbb5144812b6041~93iH4U90x3116831168epsmtrp1S;
	Fri,  9 May 2025 13:14:27 +0000 (GMT)
X-AuditID: b6c32a52-40bff70000004c16-87-681dffb3509c
Received: from epsmtip1.samsung.com ( [182.195.34.30]) by
	epsmgmcp1.samsung.com (Symantec Messaging Gateway) with SMTP id
	E0.8D.19478.3BFFD186; Fri,  9 May 2025 22:14:27 +0900 (KST)
Received: from bose.samsungds.net (unknown [107.108.83.9]) by
	epsmtip1.samsung.com (KnoxPortal) with ESMTPA id
	20250509131425epsmtip1df3d977fb138a2f14c4f522f592f98f0~93iFuuKrU2903429034epsmtip1b;
	Fri,  9 May 2025 13:14:25 +0000 (GMT)
From: Raghav Sharma <raghav.s@samsung.com>
To: krzk@kernel.org, s.nawrocki@samsung.com, cw00.choi@samsung.com,
	alim.akhtar@samsung.com, mturquette@baylibre.com, sboyd@kernel.org,
	robh@kernel.org, conor+dt@kernel.org, sunyeal.hong@samsung.com,
	shin.son@samsung.com
Cc: linux-samsung-soc@vger.kernel.org, linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, Raghav Sharma <raghav.s@samsung.com>
Subject: [PATCH v1] dt-bindings: clock: exynosautov920: add hsi2 clock
 definitions
Date: Fri,  9 May 2025 18:54:14 +0530
Message-Id: <20250509132414.3752159-1-raghav.s@samsung.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFrrGLMWRmVeSWpSXmKPExsWy7bCSnO7m/7IZBncmmVo8mLeNzWLN3nNM
	Fte/PGe1mH/kHKvF+fMb2C02Pb7GavGx5x6rxeVdc9gsZpzfx2Rx8ZSrxfeVdxgt/u/ZwW5x
	+E07q8W/axtZLCYfX8tq0bRsPZODgMf7G63sHptWdbJ5bF5S79G3ZRWjx+dNcgGsUVw2Kak5
	mWWpRfp2CVwZvW/2shb8Eam4eeQbUwPjZf4uRk4OCQETiePzfrF3MXJxCAlsZ5TYf+8vI0RC
	QmLf/99QtrDEyn/PoYreMkr0b53OBJJgE9CSuLL9HRuILSLwjlFi0zoxkCJmgQuMEp9e/gTq
	5uAQFgiSmD8jC6SGRUBV4v/2yywgNq+AtcSxHe0sEAvkJfYfPMsMEReUODnzCVicGSjevHU2
	8wRGvllIUrOQpBYwMq1iFE0tKM5Nz00uMNQrTswtLs1L10vOz93ECA56raAdjMvW/9U7xMjE
	wXiIUYKDWUmE93mnTIYQb0piZVVqUX58UWlOavEhRmkOFiVxXuWczhQhgfTEktTs1NSC1CKY
	LBMHp1QDk+yeR6wrc6z2JWd49lw4XXc2Rnn6sR0M3CxLt1VN/eEt5PlsupX6rcfpa2wufn+6
	/UB4qrqY5qwP5VJdp2X93XbIHPd3+8gv/iK8nUVafpuLUqOFs4OA9mvdG6dOO5207UjgMupp
	+MDxKKpNZNns35wX7t3JX+j6M2v/v+7E9HtWu89/COwwvLBz3vMbDKvF18YdFDl4UWOmWMdu
	7Qt13/+uc+JjWl3wvNrs3k0b5ZeVn0TtN/P+v+h04tyJ36+sVv38Z2ArGxLq3/0ro+BWzrVf
	wR/zvuzUE1nCvHQul+0Tbaa36zOkfyxTuXg8LVa7IaEurqhiaePmmlXFu/afuT7vwwG/1SuZ
	TzOdPD3b/7ESS3FGoqEWc1FxIgDhAktx6QIAAA==
X-CMS-MailID: 20250509131427epcas5p1fe29ea19cb7624dc828935d6ec47854b
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-Sendblock-Type: REQ_APPROVE
CMS-TYPE: 105P
cpgsPolicy: CPGSC10-543,Y
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20250509131427epcas5p1fe29ea19cb7624dc828935d6ec47854b
References: <CGME20250509131427epcas5p1fe29ea19cb7624dc828935d6ec47854b@epcas5p1.samsung.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250509_063537_033935_B75A9295 
X-CRM114-Status: GOOD (  14.62  )
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

Add device tree clock binding definitions for CMU_HSI2

Signed-off-by: Raghav Sharma <raghav.s@samsung.com>
---
 .../clock/samsung,exynosautov920-clock.yaml   | 29 +++++++++++++++++--
 .../clock/samsung,exynosautov920.h            |  9 ++++++
 2 files changed, 36 insertions(+), 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/clock/samsung,exynosautov920-clock.yaml b/Documentation/devicetree/bindings/clock/samsung,exynosautov920-clock.yaml
index 6961a68098f4..3cbb1dc8d828 100644
--- a/Documentation/devicetree/bindings/clock/samsung,exynosautov920-clock.yaml
+++ b/Documentation/devicetree/bindings/clock/samsung,exynosautov920-clock.yaml
@@ -41,14 +41,15 @@ properties:
       - samsung,exynosautov920-cmu-misc
       - samsung,exynosautov920-cmu-hsi0
       - samsung,exynosautov920-cmu-hsi1
+      - samsung,exynosautov920-cmu-hsi2
 
   clocks:
     minItems: 1
-    maxItems: 4
+    maxItems: 5
 
   clock-names:
     minItems: 1
-    maxItems: 4
+    maxItems: 5
 
   "#clock-cells":
     const: 1
@@ -201,6 +202,30 @@ allOf:
             - const: usbdrd
             - const: mmc_card
 
+  - if:
+      properties:
+        compatible:
+          contains:
+            const: samsung,exynosautov920-cmu-hsi2
+
+    then:
+      properties:
+        clocks:
+          items:
+            - description: External reference clock (38.4 MHz)
+            - description: CMU_HSI2 NOC clock (from CMU_TOP)
+            - description: CMU_HSI2 NOC UFS clock (from CMU_TOP)
+            - description: CMU_HSI2 UFS EMBD clock (from CMU_TOP)
+            - description: CMU_HSI2 ETHERNET clock (from CMU_TOP)
+
+        clock-names:
+          items:
+            - const: oscclk
+            - const: noc
+            - const: ufs
+            - const: embd
+            - const: ethernet
+
 required:
   - compatible
   - "#clock-cells"
diff --git a/include/dt-bindings/clock/samsung,exynosautov920.h b/include/dt-bindings/clock/samsung,exynosautov920.h
index 5e6896e9627f..93e6233d1358 100644
--- a/include/dt-bindings/clock/samsung,exynosautov920.h
+++ b/include/dt-bindings/clock/samsung,exynosautov920.h
@@ -286,4 +286,13 @@
 #define CLK_MOUT_HSI1_USBDRD_USER	3
 #define CLK_MOUT_HSI1_USBDRD		4
 
+/* CMU_HSI2 */
+#define FOUT_PLL_ETH                    1
+#define CLK_MOUT_HSI2_NOC_UFS_USER      2
+#define CLK_MOUT_HSI2_UFS_EMBD_USER     3
+#define CLK_MOUT_HSI2_ETHERNET          4
+#define CLK_MOUT_HSI2_ETHERNET_USER     5
+#define CLK_DOUT_HSI2_ETHERNET          6
+#define CLK_DOUT_HSI2_ETHERNET_PTP      7
+
 #endif /* _DT_BINDINGS_CLOCK_EXYNOSAUTOV920_H */
-- 
2.34.1


