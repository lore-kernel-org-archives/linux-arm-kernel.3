Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9FC2CC021BC
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 26 Feb 2025 07:28:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:References:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:List-Owner;
	bh=qbsRW+rPGG7sOyzmINLAUZ6n+49WHNhTA0JmCyA9gd0=; b=XajKBhRQD46uV2xbrHPv7Nv97r
	ZP/DzoKpHyRET3yVdeEOjhNDXzsnteu4IZWqWdPV/RtCjhC4zViK+WPa+I090TM+TIkgjAHH8CNTW
	MOxQdmfEC/2BHM96cPGKQh7Muzksfw8hF1oeRpSWBhbx4f53Q5ZEfxVU50ck6OxKF5kTzyh+GUxHu
	EuRj2TbuGv9VPrax21pTjopEeIPNz3mo3GwzphVesSpMevNptMmns2vx2cKexZDDkX46Cp9zP6xGP
	9FE/Yi2pHkuHzF815OV9iEkiW44dogLv6rmozFNCXjiZPE1hnMdnz8gqKWOpuavXNcOd2jYCdaIiK
	gcq5YDCg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tnBqa-00000002gtU-18nO;
	Wed, 26 Feb 2025 07:28:48 +0000
Received: from mailout2.samsung.com ([203.254.224.25])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tnBnb-00000002gSd-2kvp
	for linux-arm-kernel@lists.infradead.org;
	Wed, 26 Feb 2025 07:25:45 +0000
Received: from epcas2p3.samsung.com (unknown [182.195.41.55])
	by mailout2.samsung.com (KnoxPortal) with ESMTP id 20250226072537epoutp02c39aaddffae95844026c92afe744e5a0~nsU_8aHTn1389613896epoutp02k
	for <linux-arm-kernel@lists.infradead.org>; Wed, 26 Feb 2025 07:25:37 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout2.samsung.com 20250226072537epoutp02c39aaddffae95844026c92afe744e5a0~nsU_8aHTn1389613896epoutp02k
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1740554737;
	bh=qbsRW+rPGG7sOyzmINLAUZ6n+49WHNhTA0JmCyA9gd0=;
	h=From:To:Cc:Subject:Date:References:From;
	b=U/3BJIwQ+2m+T2HIVBrcrunOt9lphQVsGs2nOz766KfjqZCFxfWG918HbuwIadqd1
	 1GhgbFLer4MCuHvV3/P7p3OP1VE/yMPLDdhfDyV8PM+6oI184AW49LCMEHuzn12z1C
	 C1ABwpz11qSlcSxmVyWP9v8cA19lSbX7vHUIuEVg=
Received: from epsnrtp1.localdomain (unknown [182.195.42.162]) by
	epcas2p2.samsung.com (KnoxPortal) with ESMTP id
	20250226072536epcas2p2669e3682cad6e97d545cc6f2542a446d~nsU_jZinE1172911729epcas2p2y;
	Wed, 26 Feb 2025 07:25:36 +0000 (GMT)
Received: from epsmges2p3.samsung.com (unknown [182.195.36.88]) by
	epsnrtp1.localdomain (Postfix) with ESMTP id 4Z2mGR6hkbz4x9Pp; Wed, 26 Feb
	2025 07:25:35 +0000 (GMT)
Received: from epcas2p3.samsung.com ( [182.195.41.55]) by
	epsmges2p3.samsung.com (Symantec Messaging Gateway) with SMTP id
	20.75.22105.FE1CEB76; Wed, 26 Feb 2025 16:25:35 +0900 (KST)
Received: from epsmtrp2.samsung.com (unknown [182.195.40.14]) by
	epcas2p4.samsung.com (KnoxPortal) with ESMTPA id
	20250226072535epcas2p46d41cb5cdd7ece18c898657c3c66a219~nsU9VGKON1585315853epcas2p4N;
	Wed, 26 Feb 2025 07:25:35 +0000 (GMT)
Received: from epsmgms1p2new.samsung.com (unknown [182.195.42.42]) by
	epsmtrp2.samsung.com (KnoxPortal) with ESMTP id
	20250226072535epsmtrp2cae8b068735d2728e3d8fac672b2d743~nsU9TwQsh2895528955epsmtrp2L;
	Wed, 26 Feb 2025 07:25:35 +0000 (GMT)
X-AuditID: b6c32a47-f91c170000005659-ac-67bec1ef5bfe
Received: from epsmtip2.samsung.com ( [182.195.34.31]) by
	epsmgms1p2new.samsung.com (Symantec Messaging Gateway) with SMTP id
	A4.89.18949.FE1CEB76; Wed, 26 Feb 2025 16:25:35 +0900 (KST)
Received: from localhost.localdomain (unknown [10.229.9.126]) by
	epsmtip2.samsung.com (KnoxPortal) with ESMTPA id
	20250226072535epsmtip29c454e0beda8b5dc9cf893abaa8f1a2c~nsU9Im_nx2560225602epsmtip26;
	Wed, 26 Feb 2025 07:25:35 +0000 (GMT)
From: Sangwook Shin <sw617.shin@samsung.com>
To: krzk@kernel.org, alim.akhtar@samsung.com, wim@linux-watchdog.org,
	linux@roeck-us.net
Cc: linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org,
	linux-watchdog@vger.kernel.org, linux-kernel@vger.kernel.org, Kyunghwan Seo
	<khwan.seo@samsung.com>, Sangwook Shin <sw617.shin@samsung.com>
Subject: [PATCH V1 RESEND] watchdog: s3c2410_wdt: Fix PMU register bits for
 ExynosAutoV920 SoC
Date: Wed, 26 Feb 2025 16:21:51 +0900
Message-Id: <20250226072151.2123990-1-sw617.shin@samsung.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFupnk+LIzCtJLcpLzFFi42LZdljTXPf9wX3pBu8/mFo8mLeNzWJ++yVG
	i/PnN7BbbHp8jdXi8q45bBYzzu9jsrixbh+7xZOFZ5gsZiw+yWbx+OU/Zgcuj02rOtk8Vq5Z
	w+qxeUm9x87vDewefVtWMXp83iQXwBaVbZORmpiSWqSQmpecn5KZl26r5B0c7xxvamZgqGto
	aWGupJCXmJtqq+TiE6DrlpkDdJmSQlliTilQKCCxuFhJ386mKL+0JFUhI7+4xFYptSAlp8C8
	QK84Mbe4NC9dLy+1xMrQwMDIFKgwITvj/pYutoI9ghUPGwwaGO/zdTFycEgImEg8W+HTxcjF
	ISSwg1Hi+MbnjBDOJ0aJhq6NbBDON0aJr9NfMXcxcoJ13G78wQKR2Mso8eUyTBVQy8bzsxhB
	qtgEdCSm/7vNAmKLCERJHNyxjB2kiFngDqPEvv8vwEYJCyRILJ0+gQnkEBYBVYnzF0VAwrwC
	thJ7lk9lgdgmLzHz0nd2iLigxMmZT8DizEDx5q2zmUFmSgi8ZZeY1/SGEaLBRWLO4WdQtrDE
	q+Nb2CFsKYnP7/ayQTydL3HqiTBEbwOjxLvm92wQNfYSi878ZAepYRbQlFi/Sx+iXFniyC2o
	tXwSHYf/skOEeSU62oQgGlUkOn5uZoVZdPTMA6gSD4ltu3RAwkICsRIL+6YyT2CUn4Xkl1lI
	fpmFsHYBI/MqRrHUguLc9NRiowJjeIwm5+duYgSnTC33HYwz3n7QO8TIxMF4iFGCg1lJhJcz
	c0+6EG9KYmVValF+fFFpTmrxIUZTYOBOZJYSTc4HJu28knhDE0sDEzMzQ3MjUwNzJXHe6h0t
	6UIC6YklqdmpqQWpRTB9TBycUg1MDcc/HDj/0t2nb8Fet4txHX8EX3IeK26udvnv17aN9eDH
	YrfFE10lbebt8GOv9548LZ45+SCP7/Pzf49r341ZcafQWWP39Rmpb+t2u0yTX82wUUL7pMmV
	jLm8Wy7vPhTqK7VwbZhrcMGifV4zPtvEPryYvkPKiz9pX0lZhRfjgXsVF9YkcE63VFls+F3c
	+OhaK7ErInP1nEVMbNZbOLodNvp/VWNZplrM4aN7GeOZYp+6hHJs4N201YHN8VDcnhMSpw/q
	75r4pPvTpXefguUz3fYsPfVmd41O71/27EOsherHDz3RW8jgnidXk2IxwfXlwgmLNxqvFF6/
	afqcOZOXcX37d6ZpRu6tHKfq/VL85kosxRmJhlrMRcWJAKVLhBkiBAAA
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFtrPLMWRmVeSWpSXmKPExsWy7bCSvO77g/vSDS728Fg8mLeNzWJ++yVG
	i/PnN7BbbHp8jdXi8q45bBYzzu9jsrixbh+7xZOFZ5gsZiw+yWbx+OU/Zgcuj02rOtk8Vq5Z
	w+qxeUm9x87vDewefVtWMXp83iQXwBbFZZOSmpNZllqkb5fAlXF/SxdbwR7BiocNBg2M9/m6
	GDk5JARMJG43/mABsYUEdjNKfJpv3MXIARSXknj3zBKiRFjifssR1i5GLqCSD4wSR9f9YARJ
	sAnoSEz/dxusV0QgTuJY+2ZmkCJmgUeMEmdvTGIGSQgDJdoerGYEGcoioCpx/qIISJhXwFZi
	z/KpLBAL5CVmXvrODhEXlDg58wlYnBko3rx1NvMERr5ZSFKzkKQWMDKtYpRMLSjOTc8tNiww
	ykst1ytOzC0uzUvXS87P3cQIDmMtrR2Me1Z90DvEyMTBeIhRgoNZSYSXM3NPuhBvSmJlVWpR
	fnxRaU5q8SFGaQ4WJXHeb697U4QE0hNLUrNTUwtSi2CyTBycUg1MnpuOdUjP/D2FhVNyS+dz
	2Wa39/8tdn8sv/180c6vS6ZMnSu9VPNb8srEMwvKn4dqaffVCjb9qbgu9snmTcHuk8wrDq34
	lbR+/XTljfJrfKJVJj98tKdxHmNsYsTLpWacM3jcPn/nX/llntxDl0MbvXKPpk5o22esk/cj
	u/jXlXCnZrf4k5732vgtlk5Q3ur4fPWrTNVo6U8ePx1/xShsClmTGPJIL8dAo4Dj22/btt3a
	dgsk+Jm5zNiWSpyzcarJcOf0vRngpOfaP7G0vyA1ZkXekidXJ8zzjsi/v81A4TuD9rXy7eoy
	l1cd9b776DBHunxdzycV+/Nlmv8P8hUcvWZYWZDv96Pq3IWt/yYlKbEUZyQaajEXFScCABcQ
	jCrSAgAA
X-CMS-MailID: 20250226072535epcas2p46d41cb5cdd7ece18c898657c3c66a219
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-Sendblock-Type: AUTO_CONFIDENTIAL
CMS-TYPE: 102P
DLP-Filter: Pass
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20250226072535epcas2p46d41cb5cdd7ece18c898657c3c66a219
References: <CGME20250226072535epcas2p46d41cb5cdd7ece18c898657c3c66a219@epcas2p4.samsung.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250225_232544_327422_640ECF9F 
X-CRM114-Status: GOOD (  14.94  )
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


