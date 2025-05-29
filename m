Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 56E98C5AD49
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 29 May 2025 15:12:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:References:Content-Type:
	Content-Transfer-Encoding:MIME-Version:In-Reply-To:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=dEQVnSXNcADAPNr8Vpuf31N+TYCmlqjl+Z9v+bKhkww=; b=FGOozgCfaqDpa33H1l/OMnyMJa
	ldGWBNXL/eKOs3z1zGHTr5EsFX2KqZBiDD6ZSIYN+xLa/5gDqkJQcxYYUvICsbQnCt4nJaD/6DlXi
	GBLgLGTS5pHtywA5Q7Q8foxsHzmsh3YPHveNw9FC8cn3r+YBVII6K1hXLEAQQ7oKg0Wknd677QfYx
	9TFhD02m+1+1LcqwqW/3X5QAFOJ/c3BAFswbLvgYK7MuYo0OPRLHmFnqAiBAssjBtJKQcXhKDZB/h
	Q99xneeePQiq7K0nZw0v5So+WcY0j4JaE9LyGxBK21bFIMvQP2/8fVrjtUMo85Te4mk5GWcKR2tkx
	6vSNDGMw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uKevG-0000000G2Ur-42oK;
	Thu, 29 May 2025 15:11:58 +0000
Received: from mailout2.samsung.com ([203.254.224.25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uKdpy-0000000Fvxp-1Wml
	for linux-arm-kernel@lists.infradead.org;
	Thu, 29 May 2025 14:02:27 +0000
Received: from epcas5p2.samsung.com (unknown [182.195.41.40])
	by mailout2.samsung.com (KnoxPortal) with ESMTP id 20250529140218epoutp026ddbeaab8e291cc9fb91f9f21636e6eb~EBFnGnUD71921519215epoutp023
	for <linux-arm-kernel@lists.infradead.org>; Thu, 29 May 2025 14:02:18 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout2.samsung.com 20250529140218epoutp026ddbeaab8e291cc9fb91f9f21636e6eb~EBFnGnUD71921519215epoutp023
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1748527338;
	bh=dEQVnSXNcADAPNr8Vpuf31N+TYCmlqjl+Z9v+bKhkww=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=o7DULGKgRrp26rt3lue+SXg5q7OF8TBJjHeN6MwNdl36QYWSzN5iqaG9L824DDK5R
	 lABHqEqVdq+/urBDAg42ZsNDGVRc1lBd+U2LNNHC9QSkWA1URK8Jnwt4qQLuM+fTDa
	 XeJHNQ+UxUcVK9alWjb2/a5w0DPpoTDCZwQbllVI=
Received: from epsnrtp03.localdomain (unknown [182.195.42.155]) by
	epcas5p1.samsung.com (KnoxPortal) with ESMTPS id
	20250529140218epcas5p11f374155f57fd3838844c34da90fcd27~EBFmSUuqJ0930209302epcas5p1F;
	Thu, 29 May 2025 14:02:18 +0000 (GMT)
Received: from epcas5p4.samsung.com (unknown [182.195.38.179]) by
	epsnrtp03.localdomain (Postfix) with ESMTP id 4b7Sjh1QvTz3hhT9; Thu, 29 May
	2025 14:02:16 +0000 (GMT)
Received: from epsmtrp2.samsung.com (unknown [182.195.40.14]) by
	epcas5p4.samsung.com (KnoxPortal) with ESMTPA id
	20250529111711epcas5p48afd16e6f771a18e3b287b07edd83c22~D_1cg0zhQ0050500505epcas5p4D;
	Thu, 29 May 2025 11:17:11 +0000 (GMT)
Received: from epsmgms1p1new.samsung.com (unknown [182.195.42.41]) by
	epsmtrp2.samsung.com (KnoxPortal) with ESMTP id
	20250529111711epsmtrp22cda4d46bd3bef49a5d102273189f718~D_1ceoxwZ2239822398epsmtrp2n;
	Thu, 29 May 2025 11:17:11 +0000 (GMT)
X-AuditID: b6c32a29-566fe7000000223e-86-68384237b5bb
Received: from epsmtip1.samsung.com ( [182.195.34.30]) by
	epsmgms1p1new.samsung.com (Symantec Messaging Gateway) with SMTP id
	21.3F.08766.73248386; Thu, 29 May 2025 20:17:11 +0900 (KST)
Received: from bose.samsungds.net (unknown [107.108.83.9]) by
	epsmtip1.samsung.com (KnoxPortal) with ESMTPA id
	20250529111708epsmtip18ee66a6c22c4e25c250128c22cb04975~D_1ZtzbuI2102821028epsmtip1E;
	Thu, 29 May 2025 11:17:08 +0000 (GMT)
From: Raghav Sharma <raghav.s@samsung.com>
To: krzk@kernel.org, s.nawrocki@samsung.com, cw00.choi@samsung.com,
	alim.akhtar@samsung.com, mturquette@baylibre.com, sboyd@kernel.org,
	robh@kernel.org, conor+dt@kernel.org, richardcochran@gmail.com,
	sunyeal.hong@samsung.com, shin.son@samsung.com
Cc: linux-samsung-soc@vger.kernel.org, linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, netdev@vger.kernel.org,
	chandan.vn@samsung.com, karthik.sun@samsung.com, dev.tailor@samsung.com,
	Raghav Sharma <raghav.s@samsung.com>
Subject: [PATCH v3 2/4] dt-bindings: clock: exynosautov920: add hsi2 clock
 definitions
Date: Thu, 29 May 2025 16:56:38 +0530
Message-Id: <20250529112640.1646740-3-raghav.s@samsung.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250529112640.1646740-1-raghav.s@samsung.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFuplkeLIzCtJLcpLzFFi42LZdlhJTtfcySLDYM5JQ4sH87axWUz4EmGx
	Zu85JovrX56zWtzbsYzdYv6Rc6wWjTPeMFmcP7+B3WLT42usFh977rFaXN41h81ixvl9TBYX
	T7laHFsgZvF95R1GiyNnXjBb/N+zg93i8Jt2Vot/1zayWEw+vpbVomnZeiYHUY/3N1rZPXbO
	usvusWlVJ5vH5iX1Hn1bVjF6fN4kF8AWxWWTkpqTWZZapG+XwJXx9BhrwXyxihnznzE1MF4S
	6GLk5JAQMJGYNuEVYxcjF4eQwG5Gib6Ob4wQCQmJff9/Q9nCEiv/PWeHKHrLKNH/bA4TSIJN
	QEviyvZ3bCAJEYEuJolz/16xgDjMAjuZJNoebwNq4eAQFgiT6G93B2lgEVCVWPXsHQtImFfA
	WuLErkqIBfIS+w+eZQaxOQVsJO7efM4CYgsBlXzcfgYszisgKHFy5hOwODNQffPW2cwTGAVm
	IUnNQpJawMi0ilEytaA4Nz232LDAMC+1XK84Mbe4NC9dLzk/dxMjOMa0NHcwbl/1Qe8QIxMH
	4yFGCQ5mJRHeJnuzDCHelMTKqtSi/Pii0pzU4kOM0hwsSuK84i96U4QE0hNLUrNTUwtSi2Cy
	TBycUg1MMttc034xZZh/mfZ6y9I5Uy6FyLBulFa+E3nu2WPO57If/s7PWHnvpXWEe/XdUPOs
	Gy+7jhj055mqJp0+UbbUJCaDi+Pavgf/z0s99m69v++5/CJJqbMeF6YZ1ksX9p4IKJiS8uB+
	0+RtqTVC9YrTLKqbig0Kz2anf/I1lY9Y0u2bdnTPNHXZyWy6W6Y3mXJwf3VIv7dka1Jq3qsY
	21c3Na0Y1pVZTK6unpr+9YVHRqDCztdf38smHTTUYPi7/aIq38r0f29uKqU72CeHs+1qZrvV
	1fHj32aJXTUVPYG1PuHWwnYJn88/79IoPbCi7nbju6I2vmfn5Cdnxl0xYvPIfdVYq2fHmZe7
	KvvphW4lluKMREMt5qLiRAAkiQpIIAMAAA==
X-CMS-MailID: 20250529111711epcas5p48afd16e6f771a18e3b287b07edd83c22
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-Sendblock-Type: REQ_APPROVE
CMS-TYPE: 105P
cpgsPolicy: CPGSC10-543,Y
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20250529111711epcas5p48afd16e6f771a18e3b287b07edd83c22
References: <20250529112640.1646740-1-raghav.s@samsung.com>
	<CGME20250529111711epcas5p48afd16e6f771a18e3b287b07edd83c22@epcas5p4.samsung.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250529_070226_719121_3AC4A603 
X-CRM114-Status: GOOD (  14.48  )
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
index 77117b887e19..72f59db73f76 100644
--- a/Documentation/devicetree/bindings/clock/samsung,exynosautov920-clock.yaml
+++ b/Documentation/devicetree/bindings/clock/samsung,exynosautov920-clock.yaml
@@ -37,6 +37,7 @@ properties:
       - samsung,exynosautov920-cmu-cpucl2
       - samsung,exynosautov920-cmu-hsi0
       - samsung,exynosautov920-cmu-hsi1
+      - samsung,exynosautov920-cmu-hsi2
       - samsung,exynosautov920-cmu-misc
       - samsung,exynosautov920-cmu-peric0
       - samsung,exynosautov920-cmu-peric1
@@ -44,11 +45,11 @@ properties:
 
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


