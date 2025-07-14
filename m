Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B166DC83F1B
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 14 Jul 2025 06:11:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:References:Content-Type:
	Content-Transfer-Encoding:MIME-Version:In-Reply-To:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=h/2fQI/zf7/x61gr9rM3UlriUS2jlgszH0VwYLpTmgw=; b=qP/6liyzPlr6Q57A77ku38Vs4a
	mGWzsV73ubD7msIHluRz+qmwJtFHNw/TjIkTUlRkX3TB/hztJHnZhldyvuTdcEF913O5z94NGPiey
	i9Qq0dVL8F0vABdQU1QH9AQByT0c8AHp179Vra6NZiojJKjUqldxWg7WOzZaqX8lwN5og490ijlPN
	k5mJj7gWdagdmyLbiy+mcSzcwj8NIenyKKBr7q6mn6Oe3S/8jYIjQId/AjP1NYchHNQQJTaw1AXBL
	6Rw3wel4PIg8WyWB3EuaHEcBG7ycnw7fRv9DpxjHm5QVMrKipPP0MtdVoCaY/9olVJ4+2A0qX9RcO
	xo7gx+Tw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ubCPQ-00000001IVB-2hWU;
	Mon, 14 Jul 2025 06:11:28 +0000
Received: from mailout4.samsung.com ([203.254.224.34])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ubCDQ-00000001GKw-1fec
	for linux-arm-kernel@lists.infradead.org;
	Mon, 14 Jul 2025 05:59:07 +0000
Received: from epcas2p4.samsung.com (unknown [182.195.41.56])
	by mailout4.samsung.com (KnoxPortal) with ESMTP id 20250714055901epoutp04dd32d7b53caae0a8a1cc978f7d932f5b~SCKxScoM21599615996epoutp04g
	for <linux-arm-kernel@lists.infradead.org>; Mon, 14 Jul 2025 05:59:01 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout4.samsung.com 20250714055901epoutp04dd32d7b53caae0a8a1cc978f7d932f5b~SCKxScoM21599615996epoutp04g
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1752472741;
	bh=h/2fQI/zf7/x61gr9rM3UlriUS2jlgszH0VwYLpTmgw=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=qb3l8xD/rVVZ/eSF6O54Q+n07gfiRibmjbY/5S8x206zHST858k97u6y6vEDKXmdG
	 0du8iobqOgAznivEq1AymF3fbdCIJRxJZKD2hs9ErwYaWblQnoAC+r26OcuGRZSuPG
	 RVG3PcY6NbXouxf41jvVxwiZpjUZzFs5DjLeEIBs=
Received: from epsnrtp04.localdomain (unknown [182.195.42.156]) by
	epcas2p2.samsung.com (KnoxPortal) with ESMTPS id
	20250714055900epcas2p268638335cb5c29aec01140f927fd2e45~SCKw-0Xa51842718427epcas2p2H;
	Mon, 14 Jul 2025 05:59:00 +0000 (GMT)
Received: from epcas2p1.samsung.com (unknown [182.195.36.101]) by
	epsnrtp04.localdomain (Postfix) with ESMTP id 4bgWpr1hy7z6B9mG; Mon, 14 Jul
	2025 05:59:00 +0000 (GMT)
Received: from epsmtip1.samsung.com (unknown [182.195.34.30]) by
	epcas2p2.samsung.com (KnoxPortal) with ESMTPA id
	20250714055859epcas2p256ce350e05d8812ca2900823a1e4913d~SCKv5Z-HM1914519145epcas2p29;
	Mon, 14 Jul 2025 05:58:59 +0000 (GMT)
Received: from localhost.localdomain (unknown [10.229.9.126]) by
	epsmtip1.samsung.com (KnoxPortal) with ESMTPA id
	20250714055859epsmtip168e49a98a3b9a9ba36108b133133ac95~SCKvzaigo0355503555epsmtip1Z;
	Mon, 14 Jul 2025 05:58:59 +0000 (GMT)
From: Sangwook Shin <sw617.shin@samsung.com>
To: krzk@kernel.org, alim.akhtar@samsung.com, wim@linux-watchdog.org,
	linux@roeck-us.net
Cc: linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org,
	linux-watchdog@vger.kernel.org, linux-kernel@vger.kernel.org, Sangwook Shin
	<sw617.shin@samsung.com>
Subject: [PATCH v3 RESEND 4/5] watchdog: s3c2410_wdt: exynosautov920: Enable
 QUIRK_HAS_32BIT_MAXCNT
Date: Mon, 14 Jul 2025 14:54:39 +0900
Message-Id: <20250714055440.3138135-5-sw617.shin@samsung.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20250714055440.3138135-1-sw617.shin@samsung.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CMS-MailID: 20250714055859epcas2p256ce350e05d8812ca2900823a1e4913d
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-Sendblock-Type: AUTO_CONFIDENTIAL
CMS-TYPE: 102P
cpgsPolicy: CPGSC10-234,N
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20250714055859epcas2p256ce350e05d8812ca2900823a1e4913d
References: <20250714055440.3138135-1-sw617.shin@samsung.com>
	<CGME20250714055859epcas2p256ce350e05d8812ca2900823a1e4913d@epcas2p2.samsung.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250713_225904_594143_54141E96 
X-CRM114-Status: GOOD (  13.59  )
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

Enable QUIRK_HAS_32BIT_MAXCNT to ExynosAutov920 SoC which has 32-bit WTCNT.

Signed-off-by: Sangwook Shin <sw617.shin@samsung.com>
---
 drivers/watchdog/s3c2410_wdt.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/watchdog/s3c2410_wdt.c b/drivers/watchdog/s3c2410_wdt.c
index 090b78717cd2..184b1ad46ca6 100644
--- a/drivers/watchdog/s3c2410_wdt.c
+++ b/drivers/watchdog/s3c2410_wdt.c
@@ -356,7 +356,7 @@ static const struct s3c2410_wdt_variant drv_data_exynosautov920_cl0 = {
 	.cnt_en_bit = 8,
 	.quirks = QUIRK_HAS_WTCLRINT_REG | QUIRK_HAS_PMU_MASK_RESET |
 		  QUIRK_HAS_PMU_RST_STAT | QUIRK_HAS_PMU_CNT_EN |
-		  QUIRK_HAS_DBGACK_BIT,
+		  QUIRK_HAS_DBGACK_BIT | QUIRK_HAS_32BIT_MAXCNT,
 };
 
 static const struct s3c2410_wdt_variant drv_data_exynosautov920_cl1 = {
@@ -369,7 +369,7 @@ static const struct s3c2410_wdt_variant drv_data_exynosautov920_cl1 = {
 	.cnt_en_bit = 8,
 	.quirks = QUIRK_HAS_WTCLRINT_REG | QUIRK_HAS_PMU_MASK_RESET |
 		  QUIRK_HAS_PMU_RST_STAT | QUIRK_HAS_PMU_CNT_EN |
-		  QUIRK_HAS_DBGACK_BIT,
+		  QUIRK_HAS_DBGACK_BIT | QUIRK_HAS_32BIT_MAXCNT,
 };
 
 static const struct of_device_id s3c2410_wdt_match[] = {
-- 
2.25.1


