Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3CDC2C3ABCC
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 14 May 2025 14:35:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:References:Content-Type:
	Content-Transfer-Encoding:MIME-Version:In-Reply-To:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=uJ5xv2x3X+CRQNWp7iVnE+JtSDZ7GFWFYjczehxiho4=; b=O0eOyVAwsYyJ2UtHsbUdluxYm4
	PDoB/fx+4f8Q9HI0ZcNAdDxzo7ISFSYASrzeVj9SnqcdjD91lpyuKg/xK8FFuI2Zbu6TllqlXr8xl
	1G/cIFUPSNo4eFurv5EeBaUT9tON7pBwbxSmYzCSSFBKsEQIPP35i10QPbXuMwTu4Kz12Q2/qnNkq
	f2Ni/tCa7aQ7bXf3ahPT3Xh+0dqGZ+SRmtssvkrsrnYSqP7ZbY6Mj0Fx6zq51atmJFFPSEpDUaCHS
	9KUk9MJxQgxVI3kJ16OWI9qOTMTMfT+49/hz7DPtzvGwWg0iemA7Txutu96i7YNFKW3C0TLgomXhH
	abYu01Ww==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uFDCK-0000000FQZu-0Rwh;
	Wed, 14 May 2025 14:35:04 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uFCXV-0000000FGkJ-0QmZ
	for linux-arm-kernel@bombadil.infradead.org;
	Wed, 14 May 2025 13:52:53 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=References:Content-Type:
	Content-Transfer-Encoding:MIME-Version:In-Reply-To:Message-Id:Date:Subject:Cc
	:To:From:Sender:Reply-To:Content-ID:Content-Description;
	bh=uJ5xv2x3X+CRQNWp7iVnE+JtSDZ7GFWFYjczehxiho4=; b=YWORkbkf0xLs1SZ7urpJVz2EWd
	TCZuD9Ncabn/UvjKF3gaY3p+vtBRHJFZyxfuZMeEQlBew+U6UaIV0Rkg1zoWd7HkT/By+4/Kdn7/x
	5GiAqIN/82ca3JSr5s0XRGWkmiMfqaalWLX7UeubqhZWTODW6/bq2PN9aKsQc1ib/Gzuct14053oS
	tU5vO4mO0mPLKLwOkiBxbS3C/Yvic+UxL3EnhLf+plE+aZbJQXUs8LqYLL9XHpYjfm8oYRQRj2DIb
	4l8R3D0THPf3sIfwp3ofbGVpEqEVTq8Mub9svxtgU3u0UiCtgQBEia+QZaTF4yEYzb1Bxll3Qbgi3
	yOX6o2dg==;
Received: from mailout2.samsung.com ([203.254.224.25])
	by desiato.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1uFCXR-0000000HCEz-3M3d
	for linux-arm-kernel@lists.infradead.org;
	Wed, 14 May 2025 13:52:52 +0000
Received: from epcas5p3.samsung.com (unknown [182.195.41.41])
	by mailout2.samsung.com (KnoxPortal) with ESMTP id 20250514135236epoutp025125753f59fdb05cbd396a249c6cc777~-aR2667BF0732207322epoutp02O
	for <linux-arm-kernel@lists.infradead.org>; Wed, 14 May 2025 13:52:36 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout2.samsung.com 20250514135236epoutp025125753f59fdb05cbd396a249c6cc777~-aR2667BF0732207322epoutp02O
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1747230756;
	bh=uJ5xv2x3X+CRQNWp7iVnE+JtSDZ7GFWFYjczehxiho4=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=VTplLPJ4icTRM9XyptCN0lLZkoIcoQtoJ4fyMU9X+ePwJSZ4KEoWSXXz77gqORGBU
	 HiAIJvOkYkHB0qr068JWXp+emqhwZ6vd8S9MfkVsHirvKBDDtvHglPHuOxLXXKhf3P
	 J/3vGmt4Whvi2xjWmA0n7kmcJumk9X1dCNgFc6eE=
Received: from epsnrtp04.localdomain (unknown [182.195.42.156]) by
	epcas5p3.samsung.com (KnoxPortal) with ESMTPS id
	20250514135236epcas5p3ad11adde7c8e2399382f6371b6aefe08~-aR2YIjrB0225002250epcas5p3q;
	Wed, 14 May 2025 13:52:36 +0000 (GMT)
Received: from epcas5p3.samsung.com (unknown [182.195.38.179]) by
	epsnrtp04.localdomain (Postfix) with ESMTP id 4ZyFCQ217lz6B9m5; Wed, 14 May
	2025 13:52:34 +0000 (GMT)
Received: from epsmtrp2.samsung.com (unknown [182.195.40.14]) by
	epcas5p2.samsung.com (KnoxPortal) with ESMTPA id
	20250514095236epcas5p2c7a6c9380182da503bbe058edd69b84a~-XATy4dh02782827828epcas5p2D;
	Wed, 14 May 2025 09:52:36 +0000 (GMT)
Received: from epsmgmc1p1new.samsung.com (unknown [182.195.42.40]) by
	epsmtrp2.samsung.com (KnoxPortal) with ESMTP id
	20250514095236epsmtrp249e7c263a2b6d642fcce3cf32bf6f15f~-XATx8FRg3153131531epsmtrp23;
	Wed, 14 May 2025 09:52:36 +0000 (GMT)
X-AuditID: b6c32a28-46cef70000001e8a-48-682467e4e373
Received: from epsmtip2.samsung.com ( [182.195.34.31]) by
	epsmgmc1p1new.samsung.com (Symantec Messaging Gateway) with SMTP id
	12.B4.07818.4E764286; Wed, 14 May 2025 18:52:36 +0900 (KST)
Received: from bose.samsungds.net (unknown [107.108.83.9]) by
	epsmtip2.samsung.com (KnoxPortal) with ESMTPA id
	20250514095233epsmtip2ac7a0923a2e425fc4ddbfcf5b2508af1~-XAQ-_SON1705717057epsmtip2P;
	Wed, 14 May 2025 09:52:33 +0000 (GMT)
From: Raghav Sharma <raghav.s@samsung.com>
To: krzk@kernel.org, s.nawrocki@samsung.com, cw00.choi@samsung.com,
	alim.akhtar@samsung.com, mturquette@baylibre.com, sboyd@kernel.org,
	robh@kernel.org, conor+dt@kernel.org, richardcochran@gmail.com,
	sunyeal.hong@samsung.com, shin.son@samsung.com
Cc: linux-samsung-soc@vger.kernel.org, linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, netdev@vger.kernel.org,
	dev.tailor@samsung.com, chandan.vn@samsung.com, karthik.sun@samsung.com,
	Raghav Sharma <raghav.s@samsung.com>
Subject: [PATCH v2 1/3] dt-bindings: clock: exynosautov920: add hsi2 clock
 definitions
Date: Wed, 14 May 2025 15:32:12 +0530
Message-Id: <20250514100214.2479552-2-raghav.s@samsung.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250514100214.2479552-1-raghav.s@samsung.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFuplkeLIzCtJLcpLzFFi42LZdlhJXvdJukqGwbPFahYP5m1js5jwJcJi
	zd5zTBbXvzxntbi3Yxm7xfwj51gtGme8YbI4f34Du8Wmx9dYLT723GO1uLxrDpvFjPP7mCwu
	nnK1OLZAzOL7yjuMFkfOvGC2+L9nB7vF4TftrBb/rm1ksZh8fC2rRdOy9UwOoh7vb7Sye+yc
	dZfdY9OqTjaPzUvqPfq2rGL0+LxJLoAtissmJTUnsyy1SN8ugSuj981e1oI/IhU3j3xjamC8
	zN/FyMkhIWAicffjA7YuRi4OIYHdjBKbpj5igkhISOz7/5sRwhaWWPnvOTuILSTwllFi/rtC
	EJtNQEviyvZ3YM0iAl1MEuf+vWIBSTAL7GSSWLleAsQWFgiTuD3rK1Ccg4NFQFXizEI3kDCv
	gLXEq30fmCHmy0vsP3gWzOYUsJH4+uIyM8Qua4mWV3OYIOoFJU7OfAI1Xl6ieets5gmMArOQ
	pGYhSS1gZFrFKJlaUJybnptsWGCYl1quV5yYW1yal66XnJ+7iREcY1oaOxjffWvSP8TIxMF4
	iFGCg1lJhPd6lnKGEG9KYmVValF+fFFpTmrxIUZpDhYlcd6VhhHpQgLpiSWp2ampBalFMFkm
	Dk6pBqbKJbcCCpR823fUTWKbzVIoN1MuU8V1A9d588urg5r21y/7KFizZMPR6QnXTqReureM
	6W2EWu6Hj2ujDxptUXWYfW3VopUzHgmbMKnIyf0qVCrY+3j5ZJOYgKTiC1O2CZy8wu94iK09
	0Uzn+LKL/3pP28hKx/37sUP9j4N+w9nECuXdM2/IGxlO0jl3S37KyhbT2e0ZayPmfL+ufPra
	qnWxUqxhuU/fZHw07zDLCI+awH26weZrytNv18qitbl19E4KFqr/2vLjo+fJ01NlfoVOyvkY
	Lh307R4nt2/lpNPPxTc9YlVJKLG8vqKzRoMzMbv55tbrQnsydioc0DhUYdOoxSJ4rJF/ft6C
	APmtFzuVWIozEg21mIuKEwGC6JfDIAMAAA==
X-CMS-MailID: 20250514095236epcas5p2c7a6c9380182da503bbe058edd69b84a
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-Sendblock-Type: REQ_APPROVE
CMS-TYPE: 105P
cpgsPolicy: CPGSC10-543,Y
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20250514095236epcas5p2c7a6c9380182da503bbe058edd69b84a
References: <20250514100214.2479552-1-raghav.s@samsung.com>
	<CGME20250514095236epcas5p2c7a6c9380182da503bbe058edd69b84a@epcas5p2.samsung.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250514_145250_549371_A2B75FCD 
X-CRM114-Status: GOOD (  15.13  )
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


