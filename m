Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1264DC2D0CD
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 15 May 2025 08:15:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:References:Content-Type:
	Content-Transfer-Encoding:MIME-Version:In-Reply-To:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=l1sBe+or20ljTm54YnvzZcJO7su90SPJqDKMD7hCrSM=; b=TrSHeoPn8dzGGpY7d6dVypcrz1
	raf6LwauK+9/JyNiE1Wlgzz3TYHcNVwlZO1LRRh+dOQtNLjJeJ0KG8pwRnqjNoYxN3vIVeWN61R/O
	NpsSiNMZbX6yCCy0oXO4I27njrk7Tp4aw3jaYlknhmS1e5X9JRJkNn6M/kUw9D7Lgugm0RUB0LloC
	OKF/pOn6M8uIfvzvQoUidSAxAw3zDr8uZsFq4lfmpGw4HZ1apEWVTlqaaMFh2e0iyncW1hkTcCEdr
	hHrQFTNAVXnmMdpL3XbLxhNPCQULuYIDtkugwfyk84Pi9GQIXXggEOVKgg9mSZL8nP0e/f+dB3Pjy
	BnHZvdvw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uFTkA-0000000HTpC-2Slb;
	Thu, 15 May 2025 08:15:06 +0000
Received: from mailout3.samsung.com ([203.254.224.33])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uFTYj-0000000HROd-0Nrv
	for linux-arm-kernel@lists.infradead.org;
	Thu, 15 May 2025 08:03:21 +0000
Received: from epcas2p1.samsung.com (unknown [182.195.41.53])
	by mailout3.samsung.com (KnoxPortal) with ESMTP id 20250515080310epoutp03281c658dd02e410c35fded2ffae0aaaa~-pKDJ9p6M0697306973epoutp03J
	for <linux-arm-kernel@lists.infradead.org>; Thu, 15 May 2025 08:03:10 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout3.samsung.com 20250515080310epoutp03281c658dd02e410c35fded2ffae0aaaa~-pKDJ9p6M0697306973epoutp03J
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1747296190;
	bh=l1sBe+or20ljTm54YnvzZcJO7su90SPJqDKMD7hCrSM=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=A435HebZI9hgI2KIzDeOhoVPZUkdLw3RGxs74W0k/VDE4llq17RvuLmGGJFIGBUoI
	 1LzI0PtfO74VzPOStgIGl2GjaImazPNzP9hfYwWbjJgWBnOkC7Qf4dEzFZrBAp5/dG
	 7INgn/YaARYXTmhW+uPchPoX/hfz4yTU0PO8sXQw=
Received: from epsnrtp04.localdomain (unknown [182.195.42.156]) by
	epcas2p3.samsung.com (KnoxPortal) with ESMTPS id
	20250515080310epcas2p35f99437ebc36178361227b8bcf938ae0~-pKC4mdky2780027800epcas2p3W;
	Thu, 15 May 2025 08:03:10 +0000 (GMT)
Received: from epcas2p1.samsung.com (unknown [182.195.36.101]) by
	epsnrtp04.localdomain (Postfix) with ESMTP id 4ZyjPp1HwNz6B9mK; Thu, 15 May
	2025 08:03:10 +0000 (GMT)
Received: from epsmtrp2.samsung.com (unknown [182.195.40.14]) by
	epcas2p4.samsung.com (KnoxPortal) with ESMTPA id
	20250515080309epcas2p47d07f73de08c7c14b2a60a8d15423954~-pKByYSlY2279222792epcas2p4u;
	Thu, 15 May 2025 08:03:09 +0000 (GMT)
Received: from epsmgms1p1new.samsung.com (unknown [182.195.42.41]) by
	epsmtrp2.samsung.com (KnoxPortal) with ESMTP id
	20250515080309epsmtrp2082993217c24a68f158fb7dae594dd53~-pKBwKT-I0272802728epsmtrp23;
	Thu, 15 May 2025 08:03:09 +0000 (GMT)
X-AuditID: b6c32a29-566fe7000000223e-c6-68259fbdfec8
Received: from epsmtip2.samsung.com ( [182.195.34.31]) by
	epsmgms1p1new.samsung.com (Symantec Messaging Gateway) with SMTP id
	CB.1E.08766.DBF95286; Thu, 15 May 2025 17:03:09 +0900 (KST)
Received: from localhost.localdomain (unknown [10.229.9.126]) by
	epsmtip2.samsung.com (KnoxPortal) with ESMTPA id
	20250515080309epsmtip2b17d44959dfb46140b6393a8d4c5c14e~-pKBfaH241291312913epsmtip2z;
	Thu, 15 May 2025 08:03:09 +0000 (GMT)
From: Sangwook Shin <sw617.shin@samsung.com>
To: krzk@kernel.org, alim.akhtar@samsung.com, wim@linux-watchdog.org,
	linux@roeck-us.net
Cc: linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org,
	linux-watchdog@vger.kernel.org, linux-kernel@vger.kernel.org, Sangwook Shin
	<sw617.shin@samsung.com>
Subject: [PATCH v3 4/5] watchdog: s3c2410_wdt: exynosautov920: Enable
 QUIRK_HAS_32BIT_MAXCNT
Date: Thu, 15 May 2025 16:53:49 +0900
Message-Id: <20250515075350.3368635-5-sw617.shin@samsung.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20250515075350.3368635-1-sw617.shin@samsung.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFrrCLMWRmVeSWpSXmKPExsWy7bCSvO7e+aoZBi1zhSwezNvGZnH+/AZ2
	i02Pr7FaXN41h81ixvl9TBY31u1jt3iy8AyTxYzFJ9ksHr/8x+zA6bFpVSebx8o1a1g9Ni+p
	99j5vYHdo2/LKkaPz5vkAtiiuGxSUnMyy1KL9O0SuDIm9W9mKjjEWdE79xJ7A2MLRxcjJ4eE
	gInEw6PfWLsYuTiEBHYzSsz9uom5i5EDKCEl8e6ZJUSNsMT9liNQNR8YJfbNPsQEkmAT0JGY
	/u82C4gtIhAncax9MzNIEbPATkaJlum/wQYJC8RI9DalgtSwCKhKLPk1jxHE5hWwldi1axcb
	xAJ5iZmXvrOD2JwCdhITL+4CqxECqjm85wkbRL2gxMmZT8B2MQPVN2+dzTyBUWAWktQsJKkF
	jEyrGCVTC4pz03OLDQsM81LL9YoTc4tL89L1kvNzNzGCA15Lcwfj9lUf9A4xMnEwHmKU4GBW
	EuG9nqWcIcSbklhZlVqUH19UmpNafIhRmoNFSZxX/EVvipBAemJJanZqakFqEUyWiYNTqoGp
	c/WlP6XuiVH7zshls7QuT9pSlSVaXjhl9teO0z9/vp9lfDpZQ4ddVt3INZ3pVWLEIaFXf1Rk
	ZuTlGF7ecK0gzOvylc+dlYt+mvY3L1D/zcgdnsf/2mRF9zxe/ZdbHkc47Tl0R/hFVUPDnU/b
	faWa0youN86eKcbe8va10NarSizC6f7zDujqb7Rfwqe6NDV7YdYcv79cv14t3NP981GGRPLN
	qNdhpvd5G04v2hNZ0RzMvSrjmcnWvZvN7Squibg6tBzUurl3w8TjzkJWAbx3IzkK/hwKfDLd
	/du99x6ZEpINGWWZrDJqrH7fDvzK1rAtaV3/NXMSyxQbb6fPPIFRB7PvJJs1TLz65xcrn7US
	S3FGoqEWc1FxIgCXHLHP5wIAAA==
X-CMS-MailID: 20250515080309epcas2p47d07f73de08c7c14b2a60a8d15423954
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-Sendblock-Type: AUTO_CONFIDENTIAL
CMS-TYPE: 102P
cpgsPolicy: CPGSC10-234,N
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20250515080309epcas2p47d07f73de08c7c14b2a60a8d15423954
References: <20250515075350.3368635-1-sw617.shin@samsung.com>
	<CGME20250515080309epcas2p47d07f73de08c7c14b2a60a8d15423954@epcas2p4.samsung.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250515_010317_442920_22E4E3C4 
X-CRM114-Status: GOOD (  14.92  )
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
index 1c7299deec5d..3c12a3ae50f8 100644
--- a/drivers/watchdog/s3c2410_wdt.c
+++ b/drivers/watchdog/s3c2410_wdt.c
@@ -326,7 +326,7 @@ static const struct s3c2410_wdt_variant drv_data_exynosautov920_cl0 = {
 	.cnt_en_bit = 8,
 	.quirks = QUIRK_HAS_WTCLRINT_REG | QUIRK_HAS_PMU_MASK_RESET |
 		  QUIRK_HAS_PMU_RST_STAT | QUIRK_HAS_PMU_CNT_EN |
-		  QUIRK_HAS_DBGACK_BIT,
+		  QUIRK_HAS_DBGACK_BIT | QUIRK_HAS_32BIT_MAXCNT,
 };
 
 static const struct s3c2410_wdt_variant drv_data_exynosautov920_cl1 = {
@@ -339,7 +339,7 @@ static const struct s3c2410_wdt_variant drv_data_exynosautov920_cl1 = {
 	.cnt_en_bit = 8,
 	.quirks = QUIRK_HAS_WTCLRINT_REG | QUIRK_HAS_PMU_MASK_RESET |
 		  QUIRK_HAS_PMU_RST_STAT | QUIRK_HAS_PMU_CNT_EN |
-		  QUIRK_HAS_DBGACK_BIT,
+		  QUIRK_HAS_DBGACK_BIT | QUIRK_HAS_32BIT_MAXCNT,
 };
 
 static const struct of_device_id s3c2410_wdt_match[] = {
-- 
2.40.1


