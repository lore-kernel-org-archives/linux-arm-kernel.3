Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 38DCEC282EC
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 18 Mar 2025 00:53:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:References:Content-Type:
	Content-Transfer-Encoding:MIME-Version:In-Reply-To:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=a9L5JGu5AfFQ6aPgYsstFvn9YaDwi7HGI4aG4hH2jsE=; b=i0Rk6ft19t2Ad7X6qpjhb0iuPe
	uOkgxcVXWRvhhOC1KtGPatjAyNlQaz1LJZ/9kZ8MfmZSM1Ror4PkkzVJfE6hQzGspkeS7Atrvkp4g
	OhLCxbKmEtXmSdos+dV5A+pmujysJwB/M8S0JVG70aT4WTKMT+ae3WFrLMzInM0qDu9w3jZHsc3qu
	2J8IY2pQ59um/NGGpbFtqOp0AEs7NWWmyoL04gCPziWs9ztBX76YNH30kzB3NQNx0ajD59rk6tWpk
	2obFVhLjQbzgDGDWUo5FPQcaP4HfCl6YjaEaWU3pDOdT7XhYKVCTkZsoI64PHa/XIfGPLCMwiIFnF
	UGq1sYEg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tuLD9-00000004I8n-0SC6;
	Tue, 18 Mar 2025 00:53:39 +0000
Received: from [203.254.224.33] (helo=mailout3.samsung.com)
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tuLBP-00000004I2r-2O81
	for linux-arm-kernel@lists.infradead.org;
	Tue, 18 Mar 2025 00:51:55 +0000
Received: from epcas2p3.samsung.com (unknown [182.195.41.55])
	by mailout3.samsung.com (KnoxPortal) with ESMTP id 20250318005145epoutp03d0d62e2319b052ea682d0c22aeb9a44e~tv20AVkLv1182911829epoutp03N
	for <linux-arm-kernel@lists.infradead.org>; Tue, 18 Mar 2025 00:51:45 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout3.samsung.com 20250318005145epoutp03d0d62e2319b052ea682d0c22aeb9a44e~tv20AVkLv1182911829epoutp03N
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1742259105;
	bh=a9L5JGu5AfFQ6aPgYsstFvn9YaDwi7HGI4aG4hH2jsE=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=u/AxrjdDSvamZzRboVWCAjjDN46nYdWv9pPMPSM63PwhOueQSpeJNbi5no5S3R3mD
	 39onEwsvvJf3YD0+XcnNwUAe5KTV2DOTiTvIsMX0XVLD/jtnWw7aj+PKp1ug6w1LVp
	 13HFWNiI/t9jLJ2PKhnuqdZO0+rO36goOp3ivKNI=
Received: from epsnrtp1.localdomain (unknown [182.195.42.162]) by
	epcas2p2.samsung.com (KnoxPortal) with ESMTP id
	20250318005145epcas2p2949b185b2a99530e01e4c48c1889e245~tv2zqCCCV1858518585epcas2p2B;
	Tue, 18 Mar 2025 00:51:45 +0000 (GMT)
Received: from epsmges2p3.samsung.com (unknown [182.195.36.91]) by
	epsnrtp1.localdomain (Postfix) with ESMTP id 4ZGtZm4skKz4x9Q8; Tue, 18 Mar
	2025 00:51:44 +0000 (GMT)
Received: from epcas2p1.samsung.com ( [182.195.41.53]) by
	epsmges2p3.samsung.com (Symantec Messaging Gateway) with SMTP id
	D8.5F.22105.0A3C8D76; Tue, 18 Mar 2025 09:51:44 +0900 (KST)
Received: from epsmtrp2.samsung.com (unknown [182.195.40.14]) by
	epcas2p4.samsung.com (KnoxPortal) with ESMTPA id
	20250318005143epcas2p40ebb1954bed8890aaf8d0a641f710423~tv2yVNdgX0833108331epcas2p47;
	Tue, 18 Mar 2025 00:51:43 +0000 (GMT)
Received: from epsmgms1p1new.samsung.com (unknown [182.195.42.41]) by
	epsmtrp2.samsung.com (KnoxPortal) with ESMTP id
	20250318005143epsmtrp2a0619270116f5df2fab464d93f2c13aa~tv2yUVvlv0272102721epsmtrp2d;
	Tue, 18 Mar 2025 00:51:43 +0000 (GMT)
X-AuditID: b6c32a47-f91c170000005659-17-67d8c3a092a5
Received: from epsmtip2.samsung.com ( [182.195.34.31]) by
	epsmgms1p1new.samsung.com (Symantec Messaging Gateway) with SMTP id
	BF.BC.18729.F93C8D76; Tue, 18 Mar 2025 09:51:43 +0900 (KST)
Received: from localhost.localdomain (unknown [10.229.9.126]) by
	epsmtip2.samsung.com (KnoxPortal) with ESMTPA id
	20250318005143epsmtip29e684ab53bd42196e63f4deb4d6484e4~tv2yHS7i-0595105951epsmtip2K;
	Tue, 18 Mar 2025 00:51:43 +0000 (GMT)
From: Sangwook Shin <sw617.shin@samsung.com>
To: krzk@kernel.org, alim.akhtar@samsung.com, wim@linux-watchdog.org,
	linux@roeck-us.net
Cc: linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org,
	linux-watchdog@vger.kernel.org, linux-kernel@vger.kernel.org, Kyunghwan Seo
	<khwan.seo@samsung.com>, Sangwook Shin <sw617.shin@samsung.com>
Subject: [PATCH v2] watchdog: s3c2410_wdt: Fix PMU register bits for
 ExynosAutoV920 SoC
Date: Tue, 18 Mar 2025 09:44:12 +0900
Message-Id: <20250318004411.695786-1-sw617.shin@samsung.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <9c94a771-b3e6-4ba4-9b7f-dcd93b53f924@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFprLJsWRmVeSWpSXmKPExsWy7bCmqe6CwzfSDSaflbd4MG8bm8X89kuM
	FufPb2C32PT4GqvF5V1z2CxmnN/HZHFj3T52iycLzzBZzFh8ks3i8ct/zA5cHptWdbJ5rFyz
	htVj85J6j53fG9g9+rasYvT4vEkugC0q2yYjNTEltUghNS85PyUzL91WyTs43jne1MzAUNfQ
	0sJcSSEvMTfVVsnFJ0DXLTMH6DIlhbLEnFKgUEBicbGSvp1NUX5pSapCRn5xia1SakFKToF5
	gV5xYm5xaV66Xl5qiZWhgYGRKVBhQnbGxHUeBdeFKt5v6WJvYHzC38XIwSEhYCIx4TZPFyMX
	h5DADkaJqwuvsEA4nxglbuzdywjhfGOUuLDvK5DDCdax+NcadojEXkaJY3NfMsO1vPkzmwWk
	ik1AR2L6v9tgtohAlMTBHcvAOpgF7jBK7Pv/ghkkISwQKbFi0lRWEJtFQFXiQsd+sAZeARuJ
	lq2rmSHWyUvMvPSdHeRYTgE7iXtHPCFKBCVOznwCVs4MVNK8dTbYERICnRwSp1ftZ4PodZH4
	vvAHK4QtLPHq+BZ2CFtK4vO7vWyQAMiXOPVEGKK3gVHiXfN7qF57iUVnfoLtZRbQlFi/Sx+i
	XFniyC2otXwSHYf/skOEeSU62oQgGlUkOn5uZoVZdPTMA6ilHhLHZn5ngwTVREaJR1vPME5g
	VJiF5JtZSL6ZhbB4ASPzKkax1ILi3PTUYqMCY3j8JufnbmIEp1Mt9x2MM95+0DvEyMTBeIhR
	goNZSYTX/cn1dCHelMTKqtSi/Pii0pzU4kOMpsCgnsgsJZqcD0zoeSXxhiaWBiZmZobmRqYG
	5krivNU7WtKFBNITS1KzU1MLUotg+pg4OKUamDiWXvLp67t1vd2Dwfpdd3MBV2DFpa1e/BIr
	VnWarlk6m/PyvP+ecjMmMDesPCd3WNjKaclitjMLuOubF57UmKXkPp35HvcpkWSmj8fX69Va
	ivWIfVN+JtW49P6WK8955Q83TGpl/vZesXqavJTUYq8I33JWZ6ELi6Ycq3v+cEFJYq0Qp/iW
	vt9TnNQO5yTdfTpr4XumzZeaL0wNin5cI5oU9VaD+fhqd0+nRy01ayN8P5pLznbhFJIy++dW
	k2uYvbP07OctccL77gcyFCSbK0xUSpkXqrXvbPL9bCGjLzdUWpckT771ae3+1j3slmd/ciUY
	7/qx7cRvYw2baGlLk0mW85fXMy0RsJVzdf/wXImlOCPRUIu5qDgRAMSwkuowBAAA
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFrrOLMWRmVeSWpSXmKPExsWy7bCSvO78wzfSDR4eNLJ4MG8bm8X89kuM
	FufPb2C32PT4GqvF5V1z2CxmnN/HZHFj3T52iycLzzBZzFh8ks3i8ct/zA5cHptWdbJ5rFyz
	htVj85J6j53fG9g9+rasYvT4vEkugC2KyyYlNSezLLVI3y6BK2PiOo+C60IV77d0sTcwPuHv
	YuTkkBAwkVj8aw17FyMXh5DAbkaJ2Zses3UxcgAlpCTePbOEqBGWuN9yhBXEFhL4wCjxpkES
	xGYT0JGY/u82C4gtIhAncax9MzPIHGaBR4wSZ29MYgZJCAuES5yZeJQJxGYRUJW40LEfrIFX
	wEaiZetqZogF8hIzL31nB9nLKWAnce+IJ8QuW4lHu3rYIcoFJU7OfALWygxU3rx1NvMERoFZ
	SFKzkKQWMDKtYpRMLSjOTc8tNiwwzEst1ytOzC0uzUvXS87P3cQIDnstzR2M21d90DvEyMTB
	eIhRgoNZSYTX/cn1dCHelMTKqtSi/Pii0pzU4kOM0hwsSuK84i96U4QE0hNLUrNTUwtSi2Cy
	TBycUg1MdlvjxTgqFF46LTg9Izps57WX18z/PHGfOZdzqfH0C5ESco9mbZkZwv3jZ4Z4aJvR
	5H9bTwrIzTMKWHTcuHyD0MYMHrfN4sEpaR6ieuKvGsUbHJ3CWtnj7/Z+ElkaaJn8Y8u9632X
	Xr/3jjzlt+GS6CLr3z2NR43s13JevaPdukXTZ3/EjxMi754YRRdMbbGfwDGR46ODU/HTk1Wt
	29RPd8wN+7Wz8q/9Pt8EdvGtvO/FTX+96/E4wKTPeDNe4UjXHFXfzb+33d7NefzSwgMfzz1+
	J5H/0TkyJzJsdg97b9PS9xUhJhXzRBItbQwPb2+UvKO6ZlKaytmt99epKyroXVCddCZfyblN
	StBlW9NnJZbijERDLeai4kQAzfm+kOoCAAA=
X-CMS-MailID: 20250318005143epcas2p40ebb1954bed8890aaf8d0a641f710423
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-Sendblock-Type: AUTO_CONFIDENTIAL
CMS-TYPE: 102P
DLP-Filter: Pass
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20250318005143epcas2p40ebb1954bed8890aaf8d0a641f710423
References: <9c94a771-b3e6-4ba4-9b7f-dcd93b53f924@kernel.org>
	<CGME20250318005143epcas2p40ebb1954bed8890aaf8d0a641f710423@epcas2p4.samsung.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250317_175152_279832_307D823F 
X-CRM114-Status: GOOD (  14.80  )
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
Reviewed-by: Guenter Roeck <linux@roeck-us.net>
Reviewed-by: Alim Akhtar <alim.akhtar@samsung.com>
Signed-off-by: Sangwook Shin <sw617.shin@samsung.com>
---
v1 -> v2: Restore previous email history and tags.

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


