Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 98ECBC02198
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 13 Feb 2025 00:45:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:References:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:List-Owner;
	bh=qbsRW+rPGG7sOyzmINLAUZ6n+49WHNhTA0JmCyA9gd0=; b=33LD2kbjss/2cK/HBffmFbt4vK
	jznB8/xmWp5QKm4p5fLiSwhxoYWF5nXx7bpY1EQ7/srH2Zi1dyGdtPfQGiitAQwrlNupp4OMq9az5
	mCLV/KV8LsVEyfbH4YQMybIjaLDjwUXbuI/vikiPDT+eOEUk/ZC8U5RCNX/ynbQO8aYt/LWcxXS3F
	sum8t43AHTOFSWE66M3Yv/xnCIS2rTkZGmh+JfeWeb2MQpP9Nf80aSYoIPLU1wcK6HgVPPJL6/urm
	o8C4K24mlfxy/8JlbB3plup1UJ5GkAeu8ylMptUwmyb2NT/eVjkix/sJf8jqSK9evfIWkCsbYYJg7
	cJIEqNvA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tiNML-00000009Jli-19Sk;
	Thu, 13 Feb 2025 00:45:41 +0000
Received: from mailout1.samsung.com ([203.254.224.24])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tiNKs-00000009JaL-3nqj
	for linux-arm-kernel@lists.infradead.org;
	Thu, 13 Feb 2025 00:44:13 +0000
Received: from epcas2p2.samsung.com (unknown [182.195.41.54])
	by mailout1.samsung.com (KnoxPortal) with ESMTP id 20250213004404epoutp01f98ed46a045a31175b28900e118663de~jndrLGRnx3236032360epoutp01U
	for <linux-arm-kernel@lists.infradead.org>; Thu, 13 Feb 2025 00:44:04 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout1.samsung.com 20250213004404epoutp01f98ed46a045a31175b28900e118663de~jndrLGRnx3236032360epoutp01U
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1739407444;
	bh=qbsRW+rPGG7sOyzmINLAUZ6n+49WHNhTA0JmCyA9gd0=;
	h=From:To:Cc:Subject:Date:References:From;
	b=Nj/kPgnAIPEHbsCUiBDAMy8HhDpJMmRmob26t5NUgGsZ1R+eMr5VDM9nQnK1FXsvN
	 BgG0+L3ghibl632WzsF/sht6GMMcAgX/9d2KmZM8LvKupD/sL/BHvl7KhYAYX0fPoA
	 naPLF2fgRDySUlAIbTYYypEufYNoJooVjJu0QpQ8=
Received: from epsnrtp4.localdomain (unknown [182.195.42.165]) by
	epcas2p1.samsung.com (KnoxPortal) with ESMTP id
	20250213004403epcas2p1fd64379ec227f4747d2b7869ff563cb5~jndqx7TXN3215432154epcas2p1o;
	Thu, 13 Feb 2025 00:44:03 +0000 (GMT)
Received: from epsmges2p4.samsung.com (unknown [182.195.36.98]) by
	epsnrtp4.localdomain (Postfix) with ESMTP id 4Ytbz70dnhz4x9Pq; Thu, 13 Feb
	2025 00:44:03 +0000 (GMT)
Received: from epcas2p3.samsung.com ( [182.195.41.55]) by
	epsmges2p4.samsung.com (Symantec Messaging Gateway) with SMTP id
	F3.45.22094.2504DA76; Thu, 13 Feb 2025 09:44:02 +0900 (KST)
Received: from epsmtrp1.samsung.com (unknown [182.195.40.13]) by
	epcas2p3.samsung.com (KnoxPortal) with ESMTPA id
	20250213004402epcas2p34923dcba3635ceed9b712a24f354d6f0~jndpwXQh31412714127epcas2p3n;
	Thu, 13 Feb 2025 00:44:02 +0000 (GMT)
Received: from epsmgms1p1new.samsung.com (unknown [182.195.42.41]) by
	epsmtrp1.samsung.com (KnoxPortal) with ESMTP id
	20250213004402epsmtrp135a32c55cf064ad1d4c0242b0595a572~jndpvmMWf1131811318epsmtrp11;
	Thu, 13 Feb 2025 00:44:02 +0000 (GMT)
X-AuditID: b6c32a48-e72eb7000000564e-c3-67ad4052a3ba
Received: from epsmtip1.samsung.com ( [182.195.34.30]) by
	epsmgms1p1new.samsung.com (Symantec Messaging Gateway) with SMTP id
	F4.80.18729.2504DA76; Thu, 13 Feb 2025 09:44:02 +0900 (KST)
Received: from localhost.localdomain (unknown [10.229.9.126]) by
	epsmtip1.samsung.com (KnoxPortal) with ESMTPA id
	20250213004402epsmtip127a07f22bedc87064fa6ed47580ccf53~jndphlQjr2674526745epsmtip1Z;
	Thu, 13 Feb 2025 00:44:02 +0000 (GMT)
From: Sangwook Shin <sw617.shin@samsung.com>
To: krzk@kernel.org, alim.akhtar@samsung.com, wim@linux-watchdog.org,
	linux@roeck-us.net
Cc: linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org,
	linux-watchdog@vger.kernel.org, linux-kernel@vger.kernel.org, Kyunghwan Seo
	<khwan.seo@samsung.com>, Sangwook Shin <sw617.shin@samsung.com>
Subject: [PATCH] watchdog: s3c2410_wdt: Fix PMU register bits for
 ExynosAutoV920 SoC
Date: Thu, 13 Feb 2025 09:41:04 +0900
Message-Id: <20250213004104.3881711-1-sw617.shin@samsung.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFprAJsWRmVeSWpSXmKPExsWy7bCmuW6Qw9p0g/PrbSwezNvGZjG//RKj
	xfnzG9gtNj2+xmpxedccNosZ5/cxWdxYt4/d4snCM0wWMxafZLN4/PIfswOXx6ZVnWweK9es
	YfXYvKTeY+f3BnaPvi2rGD0+b5ILYIvKtslITUxJLVJIzUvOT8nMS7dV8g6Od443NTMw1DW0
	tDBXUshLzE21VXLxCdB1y8wBukxJoSwxpxQoFJBYXKykb2dTlF9akqqQkV9cYquUWpCSU2Be
	oFecmFtcmpeul5daYmVoYGBkClSYkJ1xf0sXW8EewYqHDQYNjPf5uhg5OSQETCTO/7vH2sXI
	xSEksINRYsrES4wQzidGiWt7W6Ey3xglZh75wAjT8mr7JTBbSGAvo8SEf95wHQuvTWMHSbAJ
	6EhM/3ebBcQWEYiSOLhjGTtIEbPAHUaJff9fMIMkhAXCJB5+WMMGYrMIqErMeX8WbCqvgK3E
	ouMH2SG2yUvMvPSdHSIuKHFy5hOwocxA8eats5lBhkoIfGSXmPR/KQtEg4tE74ErUKcKS7w6
	vgVqkJTEy/42IJsDyM6XOPVEGKK3gVHiXfN7Nogae4lFZ36C1TALaEqs36UPUa4sceQW1Fo+
	iY7Df6Gm8Ep0tAlBNKpIdPzczAqz6OiZB1BLPST6p+5hBSkXEoiVWLcqeAKj/Cwkv8xC8sss
	hLULGJlXMYqlFhTnpqcWGxWYwKM0OT93EyM4aWp57GCc/faD3iFGJg7GQ4wSHMxKIrwS09ak
	C/GmJFZWpRblxxeV5qQWH2I0BYbuRGYp0eR8YNrOK4k3NLE0MDEzMzQ3MjUwVxLnrd7Rki4k
	kJ5YkpqdmlqQWgTTx8TBKdXAFKIjenFiw/QT+upal1qvvFbcvCqCacfl5esc7FnniHvVb6o5
	7xPnJ2ao9fDBRl+PgulxE59kfD7OZXr1nneZh/E7t0ULzosZ6ZuIFQuJsARu2rwtkYXpaMDx
	a/6W2s7ix24UNS165f5KaU2iVVqPPEfkrv3X48vaLSxjvkjO7jPyFL9cPEXhl3mZzyXd3fce
	LenNUjjNGbQza9fS28yLhXKzFib5sd6+HeJ34uXvV4JzWc5tnnzbK2X1ajU2KdstrTuPzo+0
	NJCY53P7sJb0bwGtPu3sC5Xv7+3tOpBevfr4O/HkE5++Lzr2a1lW1vQ9CdOmW8ssjjyXKy/5
	1D2ysevvoY711W6Wx7M9WZRfK7EUZyQaajEXFScCANojCCgjBAAA
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFjrILMWRmVeSWpSXmKPExsWy7bCSnG6Qw9p0g72zZS0ezNvGZjG//RKj
	xfnzG9gtNj2+xmpxedccNosZ5/cxWdxYt4/d4snCM0wWMxafZLN4/PIfswOXx6ZVnWweK9es
	YfXYvKTeY+f3BnaPvi2rGD0+b5ILYIvisklJzcksSy3St0vgyri/pYutYI9gxcMGgwbG+3xd
	jJwcEgImEq+2X2LsYuTiEBLYzSix9FsDcxcjB1BCSuLdM0uIGmGJ+y1HWCFqPjBK3F21mA0k
	wSagIzH9320WEFtEIE7iWPtmZpAiZoFHjBJnb0xiBkkIC4RIrD56jgnEZhFQlZjz/iwjiM0r
	YCux6PhBdogN8hIzL31nh4gLSpyc+QRsKDNQvHnrbOYJjHyzkKRmIUktYGRaxSiZWlCcm55b
	bFhgmJdarlecmFtcmpeul5yfu4kRHMpamjsYt6/6oHeIkYmD8RCjBAezkgivxLQ16UK8KYmV
	ValF+fFFpTmpxYcYpTlYlMR5xV/0pggJpCeWpGanphakFsFkmTg4pRqY9n4WTj3mO7tuj8HB
	z2o1nxlT178PKXlnvO6Lx6x5z5Z8q9Z9/VGidIHSERmWKXrCncoGU5652LEfbvt8uH6ViZe/
	+84pD678r22Wmhiz8bNPnapbQKOo6L3MKXzXlJdYl5eIHqne9uHwgWu6m3Sf/jtQKic1Pd86
	b/mirez/9r/cPP2BlFDHupc5Wyw0Hpx6wl/66SbvMq1Ztx7skNGZucF4elOoUG3Os3W12377
	81oEX3JNcfi8xqaiOoFx2ZmJG0y2OvF9S6lIX2+3Re0Fy+LuZ/O25Nk13Llz9iuzssq6M93h
	Mc3LNrw88ezYeVfzkq37bLysFA/1/6hq5K+Tfv9TsrWu9IViUYNjaS3fTSWW4oxEQy3mouJE
	AJaJ723UAgAA
X-CMS-MailID: 20250213004402epcas2p34923dcba3635ceed9b712a24f354d6f0
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-Sendblock-Type: AUTO_CONFIDENTIAL
CMS-TYPE: 102P
DLP-Filter: Pass
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20250213004402epcas2p34923dcba3635ceed9b712a24f354d6f0
References: <CGME20250213004402epcas2p34923dcba3635ceed9b712a24f354d6f0@epcas2p3.samsung.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250212_164412_334956_4515A4A1 
X-CRM114-Status: GOOD (  17.25  )
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

From: Kyunghwan Seo <khwan.seo@samsung.com>

Fix the PMU register bits for the ExynosAutoV920 SoC.
This SoC has different bit information compared to its previous
version, ExynosAutoV9, and we have made the necessary adjustments.

rst_stat_bit:
    - ExynosAutoV920 cl0 : 0
    - ExynosAutoV920 cl1 : 1

cnt_en_bit:
    - ExynosAutoV920 cl0 : 8
    - ExynosAutoV920 cl1 : 8

Signed-off-by: Kyunghwan Seo <khwan.seo@samsung.com>
Signed-off-by: Sangwook Shin <sw617.shin@samsung.com>
---
 drivers/watchdog/s3c2410_wdt.c | 10 ++++++----
 1 file changed, 6 insertions(+), 4 deletions(-)

diff --git a/drivers/watchdog/s3c2410_wdt.c b/drivers/watchdog/s3c2410_wdt.c
index 30450e99e5e9..bdd81d8074b2 100644
--- a/drivers/watchdog/s3c2410_wdt.c
+++ b/drivers/watchdog/s3c2410_wdt.c
@@ -72,6 +72,8 @@
 #define EXYNOS850_CLUSTER1_WDTRESET_BIT		23
 #define EXYNOSAUTOV9_CLUSTER0_WDTRESET_BIT	25
 #define EXYNOSAUTOV9_CLUSTER1_WDTRESET_BIT	24
+#define EXYNOSAUTOV920_CLUSTER0_WDTRESET_BIT	0
+#define EXYNOSAUTOV920_CLUSTER1_WDTRESET_BIT	1
 
 #define GS_CLUSTER0_NONCPU_OUT			0x1220
 #define GS_CLUSTER1_NONCPU_OUT			0x1420
@@ -312,9 +314,9 @@ static const struct s3c2410_wdt_variant drv_data_exynosautov920_cl0 = {
 	.mask_bit = 2,
 	.mask_reset_inv = true,
 	.rst_stat_reg = EXYNOS5_RST_STAT_REG_OFFSET,
-	.rst_stat_bit = EXYNOSAUTOV9_CLUSTER0_WDTRESET_BIT,
+	.rst_stat_bit = EXYNOSAUTOV920_CLUSTER0_WDTRESET_BIT,
 	.cnt_en_reg = EXYNOSAUTOV920_CLUSTER0_NONCPU_OUT,
-	.cnt_en_bit = 7,
+	.cnt_en_bit = 8,
 	.quirks = QUIRK_HAS_WTCLRINT_REG | QUIRK_HAS_PMU_MASK_RESET |
 		  QUIRK_HAS_PMU_RST_STAT | QUIRK_HAS_PMU_CNT_EN |
 		  QUIRK_HAS_DBGACK_BIT,
@@ -325,9 +327,9 @@ static const struct s3c2410_wdt_variant drv_data_exynosautov920_cl1 = {
 	.mask_bit = 2,
 	.mask_reset_inv = true,
 	.rst_stat_reg = EXYNOS5_RST_STAT_REG_OFFSET,
-	.rst_stat_bit = EXYNOSAUTOV9_CLUSTER1_WDTRESET_BIT,
+	.rst_stat_bit = EXYNOSAUTOV920_CLUSTER1_WDTRESET_BIT,
 	.cnt_en_reg = EXYNOSAUTOV920_CLUSTER1_NONCPU_OUT,
-	.cnt_en_bit = 7,
+	.cnt_en_bit = 8,
 	.quirks = QUIRK_HAS_WTCLRINT_REG | QUIRK_HAS_PMU_MASK_RESET |
 		  QUIRK_HAS_PMU_RST_STAT | QUIRK_HAS_PMU_CNT_EN |
 		  QUIRK_HAS_DBGACK_BIT,
-- 
2.40.1


